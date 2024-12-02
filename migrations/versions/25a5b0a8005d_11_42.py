"""11:42

Revision ID: 25a5b0a8005d
Revises: 6c4f0c9a7f96
Create Date: 2024-10-19 11:42:51.091236

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '25a5b0a8005d'
down_revision = '6c4f0c9a7f96'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('users', schema=None) as batch_op:
        batch_op.add_column(sa.Column('registration_number', sa.String(), nullable=True))

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('users', schema=None) as batch_op:
        batch_op.drop_column('registration_number')

    # ### end Alembic commands ###
