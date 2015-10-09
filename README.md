# Amylase

Amylase is a Ruby on Rails application used to monitor and manage ETL jobs.

## Features

**Job Summary**

![alt text](doc/job_summary.png "Job Summary Page")

TODOC:
* Job Summary Description
* Job Specifications
* Data Sources
* Schedules
* Clients


## Setup

We currently have Amylase running within [AWS Elastic Beanstalk](http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/Welcome.html)
on a "64bit Amazon Linux 2014.03 v1.0.9 running Ruby 2.1 (Passenger Standalone)"
type instance with a Postgres RDS database.

There are a number of environment variables that must be set for the application
to run properly, detailed below

````
BUNDLE_DISABLE_SHARED_GEMS=1
BUNDLE_PATH=vendor
BUNDLE_WITHOUT=test:development
ENVCRYPT_KEY=# envcrypt decryption key (you will need to escape the '$' with '\$')
RACK_ENV=production
RAILS_SKIP_ASSET_COMPILATION=false
RAILS_SKIP_MIGRATIONS=false
SECRET_KEY_BASE=# Rails secret key
AWS_ACCESS_KEY_ID=# AWS access key for communicating with AWS S3
AWS_SECRET_KEY=# AWS secret key for communicating with AWS S3
````

#### Envcrypt

Some of the functionality of Amylase requires the use of passwords to access 3rd
party applications (such as `BIRST_PWD` and `AMYLASE_REDSHIFT_S3_PASSWORD`).  To
protect those passwords, we use a tool called
[envcrypt](https://github.com/gnilrets/envcrypt) so that we never have to store
the unencrypted password.  This requires generating a decryption key
(ENVCRYPT_KEY) and then encrypting the password using that key.  Encrypted
passwords are then safe to store in files or databases, as long as the
ENVCRYPT_KEY isn't also stored.  The only place the ENVCRYPT_KEY should be
stored is in an environment variable.

## Development

This application has been developed using Ruby 2.x,
[rbenv](https://github.com/sstephenson/rbenv), [Bundler](http://bundler.io/),
and [Pow](http://pow.cx/). We've spent a lot of effort developing a good set of
[RSpec](http://relishapp.com/rspec) tests.  So prior to deploying any code
changes, a test spec should be defined and the full suite tested via

    rspec spec

Some of the test suite performs live tests against AWS.  For those
tests to work, the development environment will need to be able to
connect to valid AWS accounts.  This could be done by setting the
environment variables similar to how they would set up in production
as described above.  However, it may be more convenient to copy the
relevant sections of the `config/settings.yml` file to a
`config/settings.local.yml` and set them. This file overrides will
override anything in `config/settings.yml`.  It should never be
committed to the source repository (and it is .gitignored by default).

Additionally, some of the live tests require that an object already exists
in S3 or Redshift.  These can be configured under the `test:` namespace in
`config/settings.local.yml`

## Roadmap

* User logins
* Scaling - separate the scheduler, web server, and workers
* [PaperTrail](https://github.com/airblade/paper_trail)
* Mechanism for configuring job dependencies (e.g., job B only runs if job A runs successfully)

## Other
######Why the name?

Amylase is an enzyme used in the brewing process that converts
long-chained starch molecules found in barley to simpler
fermentable sugars.  Amylase is also the name of this
Rails project, which is designed to take a mix of sequences of job tasks
and split them up into smaller work units.  Ok, so it's really just a
job scheduler, but it's a job scheduler with a cool name, right?
