# Test Dev - Back-end (Ruby)

This repository is an application developed using the programming language Ruby (2.6.2) and its framework Rails (5.2.4).<br>
The application container (**web**) will run on port 3000. <br>
The Database container will run on port 5432. <br>
The Redis container will run on the port 6379. <br>

## Dependencies

### Docker

To run this project you must have [Docker](https://docs.docker.com/install/) installed.

## Building and Running app

To build and start the apps' containers, run in your terminal:
`$ docker-compose up [--build]`

The container will automatically start the app server and the database container.<br>
Add the option `--build` if you need to rebuild the container image. It is necessary if you make changes to the Dockerfile configuration. If it's the first time you're running the container, it builds automatically.<br>


### How to run the app

Once the container is running, you can access its console through:

`$ docker-compose run --rm web bash`

Now you can access the app through [http://localhost:3000](http://localhost:3000).


## Database
To open the container terminal, you can run the commands:

`$ docker-compose run --rm web bash`

To create the database, you can use the following command:
`$ rake db:create db:migrate`


## Tests
To open the container terminal, you can run the commands:

`$ docker-compose run --rm web bash`

To run the tests, you can use the following command:
`$ rpsec`

You can find the payload.json file to test the api into the storage folder.
Peace.