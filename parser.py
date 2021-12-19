from pyresparser import ResumeParser
from http.server import ThreadingHTTPServer,BaseHTTPRequestHandler
import json
import urllib.parse

host = ('0.0.0.0',10001)

def resume_result_wrapper(resume):
    parser = ResumeParser(resume)
    return parser.get_extracted_data()

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        mpath,margs = urllib.parse.splitquery(self.path)
        if margs == None:
            self.send_response_only(400,"invalid argument")
        else:
            file_path = margs.split('=')[1]
            data = resume_result_wrapper(urllib.parse.unquote(file_path))
            self.send_response(200)
            self.send_header('Content-type','application/json')
            self.end_headers()
            self.wfile.write(json.dumps(data).encode())


if __name__ == '__main__':
   server = ThreadingHTTPServer(host,Handler)
   print("start server at :%s,%s" % host)
   server.serve_forever()
