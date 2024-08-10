from os import environ as environment

def app(environ, start_response):

    data = f"Hello, World!\n {environment["SECRET_KEY"]}"

    start_response("200 OK", [
        ("Content-Type", "text/plain"),
        ("Content-Length", str(len(data)))
    ])
    
    return iter([data])
