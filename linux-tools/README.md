## Alternate Bare Metal Linux Dev setup

# Requirements:
- Ubuntu or Debian based machine 
- At least 8 gigabytes of RAM, even better 10GB
- Super user rights on the machine

# Steps to install it:
1. Clone this repository
2. In a terminal, navigate to "airlines/linux-tools/"
3. Run "install.sh" and follow the instructions

The script will install all required dependencies and will configure the database. 

!Important!
The script is not intended for any production use and will:
- Open up the mysql database for outside connections
- Use the default password and user, with DB root access taken from ['application.conf'](https://github.com/MRaxay/airline/blob/AutoStartScript/airline-data/src/main/resources/application.conf) and ['Constants.scala'](https://github.com/myflyclub/airline/blob/master/airline-data/src/main/scala/com/patson/data/Constants.scala)
- NOT configure any reverse proxy!
- NOT configure any Google development key!

I've added this for myself to easily deploy it for testing when necessary.

# Startup script

The script "startServerAndWeb.sh" will start both frontend and backend and can be used i.e. to start the game as a service.
I have not yet prepared any premade service file.