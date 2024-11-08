"""empty message

Revision ID: 097c62808839
Revises: 
Create Date: 2024-10-10 20:27:13.513573

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '097c62808839'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('genres',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('name', sa.String(length=256), nullable=False),
    sa.PrimaryKeyConstraint('id', name=op.f('pk_genres')),
    sa.UniqueConstraint('name', name=op.f('uq_genres_name'))
    )
    op.create_table('images',
    sa.Column('id', sa.String(length=256), nullable=False),
    sa.Column('file_name', sa.String(length=256), nullable=False),
    sa.Column('mime_type', sa.String(length=256), nullable=False),
    sa.Column('md5_hash', sa.String(length=256), nullable=False),
    sa.PrimaryKeyConstraint('id', name=op.f('pk_images')),
    sa.UniqueConstraint('md5_hash', name=op.f('uq_images_md5_hash'))
    )
    op.create_table('roles',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('name', sa.String(length=256), nullable=False),
    sa.Column('description', sa.Text(), nullable=False),
    sa.PrimaryKeyConstraint('id', name=op.f('pk_roles'))
    )
    op.create_table('books',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('name', sa.String(length=256), nullable=False),
    sa.Column('short_desc', sa.Text(), nullable=False),
    sa.Column('year_release', sa.Integer(), nullable=False),
    sa.Column('publisher', sa.String(length=256), nullable=False),
    sa.Column('author', sa.String(length=256), nullable=False),
    sa.Column('pages_volume', sa.Integer(), nullable=False),
    sa.Column('image_id', sa.String(length=256), nullable=False),
    sa.Column('rating_sum', sa.Integer(), nullable=False),
    sa.Column('rating_num', sa.Integer(), nullable=False),
    sa.ForeignKeyConstraint(['image_id'], ['images.id'], name=op.f('fk_books_image_id_images')),
    sa.PrimaryKeyConstraint('id', name=op.f('pk_books'))
    )
    op.create_table('users',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('login', sa.String(length=256), nullable=False),
    sa.Column('password_hash', sa.String(length=256), nullable=False),
    sa.Column('last_name', sa.String(length=256), nullable=False),
    sa.Column('first_name', sa.String(length=256), nullable=False),
    sa.Column('middle_name', sa.String(length=256), nullable=True),
    sa.Column('role_id', sa.Integer(), nullable=False),
    sa.ForeignKeyConstraint(['role_id'], ['roles.id'], name=op.f('fk_users_role_id_roles')),
    sa.PrimaryKeyConstraint('id', name=op.f('pk_users')),
    sa.UniqueConstraint('login', name=op.f('uq_users_login'))
    )
    op.create_table('all_book_visits',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('book_id', sa.Integer(), nullable=True),
    sa.Column('user_id', sa.Integer(), nullable=True),
    sa.Column('created_at', sa.DateTime(), nullable=True),
    sa.ForeignKeyConstraint(['book_id'], ['books.id'], name=op.f('fk_all_book_visits_book_id_books')),
    sa.ForeignKeyConstraint(['user_id'], ['users.id'], name=op.f('fk_all_book_visits_user_id_users')),
    sa.PrimaryKeyConstraint('id', name=op.f('pk_all_book_visits'))
    )
    op.create_table('books_genres',
    sa.Column('book_id', sa.Integer(), nullable=True),
    sa.Column('genre_id', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['book_id'], ['books.id'], name=op.f('fk_books_genres_book_id_books'), ondelete='CASCADE'),
    sa.ForeignKeyConstraint(['genre_id'], ['genres.id'], name=op.f('fk_books_genres_genre_id_genres'), ondelete='CASCADE')
    )
    op.create_table('last_book_visits',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('book_id', sa.Integer(), nullable=True),
    sa.Column('user_id', sa.Integer(), nullable=True),
    sa.Column('created_at', sa.DateTime(), nullable=True),
    sa.ForeignKeyConstraint(['book_id'], ['books.id'], name=op.f('fk_last_book_visits_book_id_books')),
    sa.ForeignKeyConstraint(['user_id'], ['users.id'], name=op.f('fk_last_book_visits_user_id_users')),
    sa.PrimaryKeyConstraint('id', name=op.f('pk_last_book_visits'))
    )
    op.create_table('reviews',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('rating', sa.Integer(), nullable=False),
    sa.Column('text', sa.Text(), nullable=False),
    sa.Column('created_at', sa.DateTime(), nullable=True),
    sa.Column('book_id', sa.Integer(), nullable=True),
    sa.Column('user_id', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['book_id'], ['books.id'], name=op.f('fk_reviews_book_id_books')),
    sa.ForeignKeyConstraint(['user_id'], ['users.id'], name=op.f('fk_reviews_user_id_users')),
    sa.PrimaryKeyConstraint('id', name=op.f('pk_reviews'))
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('reviews')
    op.drop_table('last_book_visits')
    op.drop_table('books_genres')
    op.drop_table('all_book_visits')
    op.drop_table('users')
    op.drop_table('books')
    op.drop_table('roles')
    op.drop_table('images')
    op.drop_table('genres')
    # ### end Alembic commands ###
