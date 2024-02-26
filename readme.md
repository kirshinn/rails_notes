# Rails Notes

## Install and Generate
rails new notes --api -d=sqlite3
rails generate model Note title:string content:text
rails generate model Tag name:string
rails generate migration CreateJoinTableNoteTag note tag
rails db:migrate
rails generate controller Notes

## Set credentials
VISUAL="mate --wait" bin/rails credentials:edit

## Docker build and Run container with arguments
docker build --no-cache -t rails_notes:latest .
docker run -p 3000:3000 -e RAILS_MASTER_KEY=$(cat config/master.key) --name=rails_notes -d rails_notes

