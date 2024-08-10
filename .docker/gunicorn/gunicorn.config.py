
"""gunicorn WSGI server configuration."""
from multiprocessing import cpu_count
from os import environ
from subprocess import run
from json import loads

max_workers = cpu_count

bind = '0.0.0.0:' + environ.get('PORT', '8001')

max_requests = 1000

worker_class = 'gevent'

workers = max_workers()


def on_starting(server):

    if "SETTINGS" not in environ:

        try:
            output = run(["gcloud", "secrets", "versions", "access", "access", "1", "--secret=env_file"], capture_output=True).stdout   # gcloud secrets versions access 1 --secret=env_file 
            env_data = loads(output)

            for variable in env_data:

                environ[variable] = env_data[variable]

            print(f"Environment variables loaded. Using {environ["SETTINGS"]} settings")            
        
        except:

            environ["SECRET_KEY"] = 'abc'
            environ["SETTINGS"] = "local"

            print("Environment variables not found. Using local settings.")

    raise Exception(environ)

