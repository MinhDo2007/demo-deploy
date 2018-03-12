# set path to application
app_dir = File.expand_path("../..", __FILE__)
shared_dir = '/home/deploy/demo-deploy/shared'
working_directory '/home/deploy/demo-deploy/current'

# Set unicorn options
worker_processes 2
preload_app true
timeout 3000

# Set up socket location
listen "#{shared_dir}/tmp/sockets/unicorn.sock", :backlog => 64

# Logging
stderr_path "#{shared_dir}/log/unicorn.stderr.log"
stdout_path "#{shared_dir}/log/unicorn.stdout.log"

# Set master PID location
pid "#{shared_dir}/tmp/pids/unicorn.pid"