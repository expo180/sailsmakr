"""15:49

Revision ID: 5b256c98a8ad
Revises: f2ee4add2d3b
Create Date: 2024-10-21 15:49:42.530959

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '5b256c98a8ad'
down_revision = 'f2ee4add2d3b'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('users', schema=None) as batch_op:
        batch_op.add_column(sa.Column('email_username', sa.String(), nullable=True))
        batch_op.add_column(sa.Column('email_password', sa.String(), nullable=True))
        batch_op.add_column(sa.Column('email_provider', sa.String(), nullable=True))
        batch_op.drop_column('tools')
        batch_op.drop_column('field_of_study')

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('users', schema=None) as batch_op:
        batch_op.add_column(sa.Column('field_of_study', sa.VARCHAR(length=128), nullable=True))
        batch_op.add_column(sa.Column('tools', sa.TEXT(), nullable=True))
        batch_op.drop_column('email_provider')
        batch_op.drop_column('email_password')
        batch_op.drop_column('email_username')

    # ### end Alembic commands ###
