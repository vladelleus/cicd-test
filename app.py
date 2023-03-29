from http.server import HTTPServer, BaseHTTPRequestHandler
import socket
import subprocess
import requests

class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b'Hello world from hostname: ' + socket.gethostname().encode())

# Adding tests

def test_server_response():
    # Start the server in a separate process
    server_process = subprocess.Popen(['python', 'app.py'])

    # Make a request to the server
    response = requests.get('http://127.0.0.1:8000')

    # Stop the server process
    server_process.terminate()

    # Assert that the response is OK and contains the expected message
    assert response.status_code == 200
    assert 'Hello world' in response.text

if __name__ == '__main__':
    SERVER_PORT = 8000
    httpd = HTTPServer(('0.0.0.0', SERVER_PORT), SimpleHTTPRequestHandler)
    print('Listening on port %s ...' % SERVER_PORT)
    httpd.serve_forever()