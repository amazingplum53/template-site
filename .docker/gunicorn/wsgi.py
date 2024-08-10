from os import environ

def app(environ, start_response):

    data = f"Hello, World!\n {environ["SECRET_KEY"]}"

    start_response("200 OK", [
        ("Content-Type", "text/plain"),
        ("Content-Length", str(len(data)))
    ])
    
    return iter([data])
