# config valid only for current version of Capistrano
lock '3.4.1'

set :application, 'demo-deploy'
set :user, 'deploy'
set :repo_url, 'git@github.com:MinhDo2007/demo-deploy.git'
set :branch, :master
set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application)}"

set :pty, true
set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, fetch(:linked_dirs, [])
  .push("log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads")
# set :deploy_via, :remote_cache
set :keep_releases, 5

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
