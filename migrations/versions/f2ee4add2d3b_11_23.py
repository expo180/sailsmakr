"""11:23

Revision ID: f2ee4add2d3b
Revises: c948abd3afa3
Create Date: 2024-10-21 11:23:37.924854

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'f2ee4add2d3b'
down_revision = 'c948abd3afa3'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('users', schema=None) as batch_op:
        batch_op.add_column(sa.Column('field_of_study', sa.String(length=128), nullable=True))
        batch_op.add_column(sa.Column('tools', sa.Text(), nullable=True))

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('users', schema=None) as batch_op:
        batch_op.drop_column('tools')
        batch_op.drop_column('field_of_study')

    # ### end Alembic commands ###
