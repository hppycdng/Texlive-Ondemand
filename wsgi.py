from gevent.pywsgi import WSGIServer
from app import app
import os

http_server = WSGIServer(('0.0.0.0', int(os.environ['PORT'])), app)
http_server.serve_forever()
