

Museum Tracker

A small web app that shows museums and can add, delete, edit and list both Museums and the artwork that 
is in them.


GitHub Link: https://github.com/dbalbo/museum.git

Startup Weekend is a small app that allows a user to view teams attending. It also allows a Coordinator to add teams, and view all members of that team. It also allows the adding of team members. Made for an assesment at Epicodus. Installation

Museumuses Ruby 2.1.3 You will need to install the bundle gem. In your terminal, navigate to the project directory and run this command:

$ bundle install

To run the page, enter this command in your terminal

$ ruby app.rb

In your web browser, enter this url: http://localhost:4567

A work in progress

Authoed by :Debbie Balbo Lisence

MIT Lisence (c) 2015 Debbie Balbo

**NOTE TO INSTRUCTOR: upon viewing this--it appears as if I went about doing things in the wrong way--i.e. doing more than one thing--I can assure you that I did not--if you would like an explanation about the "wonkiness" of everything I can, but I'm sure this is getting old to you as well, so take it as face value, and it can continue to be misunderstood. 
I will contimue to do this to completion over the weekend*****


database schema is as follows:




museum_tracker=# \dt
            List of relations
 Schema |   Name   | Type  |    Owner    
--------+----------+-------+-------------
 public | artworks | table | debbiebalbo
 public | museums  | table | debbiebalbo
(2 rows)

museum_tracker=# \d artworks
                                 Table "public.artworks"
   Column    |       Type        |                       Modifiers                       
-------------+-------------------+-------------------------------------------------------
 description | character varying | 
 id          | integer           | not null default nextval('artworks_id_seq'::regclass)
 museum_id   | integer           | 
Indexes:
    "artworks_pkey" PRIMARY KEY, btree (id)

                                 Table "public.artworks"
   Column    |       Type        |                       Modifiers                       
-------------+-------------------+-------------------------------------------------------
 description | character varying | 
 id          | integer           | not null default nextval('artworks_id_seq'::regclass)
 museum_id   | integer           | 
Indexes:
    "artworks_pkey" PRIMARY KEY, btree (id)

museum_tracker=# CREATE DATABASE museum_tracker_test WITH TEMPLATE museum_tracker;
CREATE DATABASE
