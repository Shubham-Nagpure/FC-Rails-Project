#Git Repository:
	https://github.com/Shubham-Nagpure/FC-Rails-Project


rails new app_name —css tailwind
cd app_name
bundle install

If not installed : rails tailwindcss:install

rails g scaffold User name:string password:string mobile:string gender:integer email:string 
rails g scaffold Company name:string industry:string
rails g scaffold JobApplication status:integer applied_on:datetime job:references user:references 
rails db:migrate


To check database  rails console 
User.create(name: “Shubham”, password: “test”, mobile: “1234567890”, gender: 0, email: “shubh@gmail.com”)

 To Start the server 
rails server
