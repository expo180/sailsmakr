const { app, BrowserWindow } = require('electron');
const path = require('path');
const exec = require('child_process').exec;
const http = require('http');

let mainWindow;
let splash;
let flaskProcess;

/**
 * Checks if the server at 127.0.0.1:5000 is running.
 */
function isServerRunning() {
    return new Promise((resolve) => {
        http.get('http://127.0.0.1:5000', (res) => {
            resolve(res.statusCode === 200);
        }).on('error', () => resolve(false));
    });
}

/**
 * Repeatedly checks server status every 500ms until it's running.
 */
async function waitForServer() {
    let serverReady = false;
    while (!serverReady) {
        serverReady = await isServerRunning();
        if (!serverReady) {
            await new Promise(resolve => setTimeout(resolve, 500));
        }
    }
}

/**
 * Creates a splash window with specified properties.
 */
function createSplashWindow() {
    splash = new BrowserWindow({
        width: 1200,
        height: 600,
        frame: false,
        transparent: true,
        center: true,
        alwaysOnTop: true,
        webPreferences: {
            devTools: false
        }
    });

    splash.loadFile(path.join(__dirname, './splash.html'));
    splash.on('closed', () => splash = null);
}

/**
 * Fetches authentication status from the server.
 */
async function checkAuthentication() {
    return new Promise((resolve, reject) => {
        http.get('http://127.0.0.1:5000/auth/status', (res) => {
            let data = '';

            res.on('data', chunk => {
                data += chunk;
            });

            res.on('end', () => {
                try {
                    const response = JSON.parse(data);
                    resolve(response);
                } catch (error) {
                    reject(error);
                }
            });
        }).on('error', (err) => reject(err));
    });
}

/**
 * Creates the main application window based on authentication status.
 */
async function createMainWindow() {
    try {
        const authStatus = await checkAuthentication();
        let loadURL = authStatus.authenticated
            ? `http://127.0.0.1:5000/user_home/${authStatus.company_id}`
            : 'http://127.0.0.1:5000/auth/login';

        mainWindow = new BrowserWindow({
            width: 800,
            height: 600,
            icon: path.join(__dirname, './logo-desktop-splash.svg'),
            webPreferences: {
                nodeIntegration: true,
            },
            autoHideMenuBar: true,
            show: false,
        });

        mainWindow.loadURL(loadURL);
        mainWindow.once('ready-to-show', () => {
            if (splash) splash.destroy();
            mainWindow.show();
        });

        mainWindow.on('closed', () => mainWindow = null);
    } catch (error) {
        console.error("Failed to determine authentication status:", error);
    }
}

/**
 * Launches the Flask server as an external process.
 * Only starts the server if it's not already running.
 */
async function startFlaskProcess() {
    const serverRunning = await isServerRunning();
    if (!serverRunning) {
        flaskProcess = exec(path.join(__dirname, 'dist', 'sails.exe'), (error) => {
            if (error) console.error(`Flask process error: ${error}`);
        });
        console.log("Starting Flask server...");
    } else {
        console.log("Flask server is already running.");
    }
}

app.on('ready', async () => {
    // Start Flask server only if it is not already running
    await startFlaskProcess();

    // Create splash window
    createSplashWindow();

    try {
        // Wait for server to be ready before opening the main window
        await waitForServer();
        await createMainWindow();
    } catch (err) {
        console.error("Error waiting for Flask server:", err);
    }
});

app.on('activate', () => {
    if (mainWindow === null) {
        createSplashWindow();
        createMainWindow();
    }
});

app.on('window-all-closed', () => {
    // Quit the app if all windows are closed (except on macOS)
    if (process.platform !== 'darwin') {
        app.quit();
    }

    // Kill Flask process when app quits
    if (flaskProcess) flaskProcess.kill();
});
