# conversation_history_app
The conversation_history app allows users to leave a comment, and change the status of the project. This repo host the app. 

## Built With

- ruby "3.3.1"
- Rails "~> 7.0.6"
- Devise for user authentication
- rspec-rails


### Project features

- A user can signup and login
- A logged in user can create projects and add comments to each project
- A logged in user can update the status of a project
- A logged in user can show lists of projects.

### Questions to Clarify

- Should comments be tied to users, or are they anonymous?
- What are the possible statuses a project can have?

### Expected answers

- Comments should be associated with users.
- Possible statuses could be: 'active', 'pending', 'completed'.

## APP endpoint 

[conversation-history-app]()

## Getting Started

To get a local copy up and running follow these simple example steps.

### Setup   

The project repository can be found in [GitHub link](https://github.com/enaburekhan/conversation_history.git) or just clone the project using this command.


Open terminal on your workspace with
cd /home/workspace/conversation-history-app

### Installation

Install gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Usage   

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    bundle exec rspec
```

> If the test suite passes, you'll be ready to run the app in a local server:

# Deployment
To deploy to heroku first login in heroku

### heroku login
Create a new project in heroku

### heroku create
You can verify that the remote was added to your project by running:

 - git config --list | grep heroku 
 - git push heroku main 

### Migrate your database

heroku run rails db:migrate
heroku run rails db:seed

### Tools used on this project
- Visual Studio Code

## Author

👤 **Eric Enaburekhan**

- Github: [@enaburekhan](https://github.com/enaburekhan)
- Twitter: [@enaburekhaneric](https://twitter.com/enaburekhaneric)
- Linkedin: [@ericenaburekhan](https://www.linkedin.com/in/eric-enaburekhan-801a28100/)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Many thanks to Homey and the open source community for the free tools.




