# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby  & Rails version
ruby "3.0.1"
rails "~> 7.0.3"



1. After taking clone, go to the project directory
2. Run 'bundle install'
3. Set up your Database 
	a. find database.yml file, location - config/database.yml
	b. change your username, password of postgres
	c. Make sure Postgres is installed on your system
4. Go. to the terminal and run following command to set-up db.
	a. rails db:create
	b. rails db:migrate.

5. Now find 'application.rb' file in codebase and change the smtp setting with
   your username and password

6. Now start your rails server with following command.
	rails s -p 3001


