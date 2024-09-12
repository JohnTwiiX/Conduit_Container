# Conduit_Container

A Docker Compose definition that contains two containerized services, a django backend and an angular frontend for the conduit application - a medium.com clone created to showcase API-Specification definitions and how to develop a more complex system in different Technology-Stacks.

## Requirements

- Docker

- Docker Compose

## Quickstart

1. clone this repository

   ```bash
   git clone git@github.com:JohnTwiiX/Conduit_Container.git
   ```

1. navigate to repo

   ```bash
   cd Conduit_Container
   ```

1. Configure the environment variables

   1. Copy the content of the example env file that is inside the conduit_container folder into a .env file:

      ```bash
      cp .env.example .env
      ```

   1. The new .env file should contain all the environment variables necessary to run all the django app in all the environments. However, the only needed variables for the development environment to run are the following:

      ```bash
      DJANGO_SUPERUSER_USERNAME
      DJANGO_SUPERUSER_PASSWORD
      DJANGO_SUPERUSER_EMAIL
      API_URL
      ```

1. init and refresh submodules

   ```bash
   git submodule update --init --recursive
   ```

1. OPTIONAL submodule with a other branch

   ```bash
   cd <submodule-directory>
   git checkout <branch-name>
   git pull origin <branch-name>
   ```

1. start the containers

   ```bash
   docker compose up -d
   // -d - will run the containers in the background
   ```

### Notes

- **If new Feature**: `git switch <branch>`
- the conduit-frontend is on port 8084
- the conduit-backend is on port 8085
- update FE and BE Repo with:

  ```bash
  cd conduit-frontend
  # or
  cd conduit-backend

  git pull
  ```
