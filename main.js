const { app, BrowserWindow, ipcMain, dialog } = require('electron');
const { autoUpdater } = require('electron-updater');
const path = require('path');
const http = require('https');

let mainWindow;
let splash;

function isServerRunning() {
    return new Promise((resolve) => {
        http.get('https://sailsmakr-2stb.onrender.com', (res) => {
            resolve(res.statusCode === 200);
        }).on('error', () => resolve(false));
    });
}

async function waitForServer() {
    let serverReady = false;
    while (!serverReady) {
        serverReady = await isServerRunning();
        if (!serverReady) {
            await new Promise(resolve => setTimeout(resolve, 500));
        }
    }
}

function createSplashWindow() {
    splash = new BrowserWindow({
        width: 800,
        height: 600,
        transparent: true,
        center: true,
        autoHideMenuBar: true,
        webPreferences: {
            preload: path.join(__dirname, 'preload.js'),
            devTools: false
        }
    });

    splash.loadFile(path.join(__dirname, './splash.html'));
    splash.on('closed', () => splash = null);
}

ipcMain.on('close-splash', () => {
    if (splash) {
        splash.close();
    }
});

async function checkAuthentication() {
    return new Promise((resolve, reject) => {
        http.get('https://sailsmakr-2stb.onrender.com/auth/status', (res) => {
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

async function createMainWindow() {
    try {
        const authStatus = await checkAuthentication();
        let loadURL = authStatus.authenticated
            ? `https://sailsmakr-2stb.onrender.com/user_home/${authStatus.company_id}`
            : `https://sailsmakr-2stb.onrender.com/auth/login`;

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

function setupAutoUpdater() {
    autoUpdater.autoDownload = false;
    autoUpdater.autoInstallOnAppQuit = true;

    autoUpdater.on('update-available', () => {
        dialog.showMessageBox(mainWindow, {
            type: 'info',
            title: 'Update Available',
            message: 'A new version of Sailsmakr is available. Do you want to download and install it now?',
            buttons: ['Download and Install', 'Later'],
            defaultId: 0,
            cancelId: 1
        }).then((response) => {
            if (response.response === 0) {
                autoUpdater.downloadUpdate();
            } else {
                console.log('Update postponed by the user.');
            }
        });
    });

    autoUpdater.on('update-downloaded', () => {
        dialog.showMessageBox(mainWindow, {
            type: 'info',
            title: 'Update Ready',
            message: 'The update has been downloaded. Restart the application to apply the update.',
            buttons: ['Restart Now', 'Later'],
            defaultId: 0,
            cancelId: 1
        }).then((response) => {
            if (response.response === 0) {
                autoUpdater.quitAndInstall();
            } else {
                console.log('Restart postponed by the user.');
            }
        });
    });

    autoUpdater.on('error', (error) => {
        console.error('Error during update:', error);
        dialog.showErrorBox('Update Error', 'An error occurred while checking for updates. Please try again later.');
    });

    autoUpdater.checkForUpdates();
}

app.on('ready', async () => {
    createSplashWindow();
    setupAutoUpdater();

    try {
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
    if (process.platform !== 'darwin') {
        app.quit();
    }
});