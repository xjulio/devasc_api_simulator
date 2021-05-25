from flask_restplus import fields
from server.instance import server

bookModel = server.api.model('Book', {
    'id': fields.Integer(description='Id'),
    'title': fields.String(required=True, min_length=1, max_length=200, description='Book title'),
    'author': fields.String(required=True, min_length=1, max_length=200, description='Author')
})
