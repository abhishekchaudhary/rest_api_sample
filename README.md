# rest_api_sample
The application provides rest services for users and can consume users api service as consumers.

##To start application
* Provide pg connection details in database.yml
* bundle install
* rake db:create
* rake db:migrate
* To run server  bundle exec unicorn -p 3000 --config-file config/unicorn.rb (unicorn is used to run multiple workers for api and client requests)
