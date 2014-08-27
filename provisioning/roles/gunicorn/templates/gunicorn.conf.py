import multiprocessing


bind = "127.0.0.1:9000"
max_requests = 1000
# worker_class = 'gevent'
workers = multiprocessing.cpu_count() * 2 + 1
