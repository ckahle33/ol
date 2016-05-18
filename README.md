## OL REST API
==============

Here are instructions for setting up the API locally. My development environment is Ubunutu 14.04 on Vagrant. I use [scotch-box](https://github.com/scotch-io/scotch-box) which is pre configured and great for Ruby development.

Instructions:

1. `cd` into your dev directory and `git clone git@github.com:ckahle33/ol.git`

2. `bundle install`

3. Create the databases with `mysql> CREATE DATABASE ol_development; CREATE DATABASE ol_test; CREATE DATABASE ol_production;`

4. `rake db:migrate`

5. Enter the Rails console and import the CSV data into MySQL with `irb(main)> Business.import() `

6. Wait a while.

7. start the server `puma`

8. Query the API with `"/api/v1/businesses"` or `"/api/v1/businesses?page_number=5"` or `"/api/v1/businesses/:id"`

9. set up the test DB with `rake db:migrate RAILS_ENV=test` run the suite with `rake test`

10. That's it!! ( I think). Any quetions please email me @ ckahle33@gmail.com for clarification. Thanks!
