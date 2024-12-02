"""arrival_date && leaving_date columns added

Revision ID: 9393d97193fa
Revises: 508c5389754a
Create Date: 2024-11-28 10:43:53.332550

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '9393d97193fa'
down_revision = '508c5389754a'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('users', schema=None) as batch_op:
        batch_op.add_column(sa.Column('arrival_date', sa.DateTime(), nullable=True))
        batch_op.add_column(sa.Column('leaving_date', sa.DateTime(), nullable=True))

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('users', schema=None) as batch_op:
        batch_op.drop_column('leaving_date')
        batch_op.drop_column('arrival_date')

    # ### end Alembic commands ###
