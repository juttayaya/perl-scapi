1. Install patch
sudo yum install patch

2. Install gcc
sudo yum install gcc

3. Install Perl
curl -L http://xrl.us/installperlnix | bash

4. Install Catalyst
cpanm Catalyst::Devel

5. Install git
sudo yum install git

6. Get Scapi source code
git clone https://github.com/juttayaya/perl-scapi.git

7. Start Scapi Catalyst Server
./perl-scapi/dev/scapi/script/scapi_server.pl -r

8. Install mysql client and libs
sudo yum install mysql
sudo yum install mariadb-devel
sudo yum install mariadb-libs

9. Install DBD::mysql
cpanm DBD::mysql

10. Execute SQL at dev/sql/setup.sql

11. Install Catalyst::Helper::Model::DBIC
cpanm Catalyst::Helper::Model::DBIC

12. Install Catalyst::Helper::Model::DBIC::Schema
cpanm Catalyst::Helper::Model::DBIC::Schema

13. Install DBIx::Class::Schema::Loader
cpanm DBIx::Class::Schema::Loader

14. Install MooseX::NonMoose~0.25
cpanm MooseX::NonMoose~0.25

15. Generate Catalyst Database Model
./script/scapi_create.pl model DB DBIC::Schema scapi::Schema create=static \
'dbi:mysql:database=scapi_db;host=scapi-db.<cluster-sid>.us-east-1.rds.amazonaws.com' \
'scapi_user' '<password>' '{ AutoCommit => 1 }'

16. Generate Catalyst Controller
./script/scapi_create.pl controller Projects