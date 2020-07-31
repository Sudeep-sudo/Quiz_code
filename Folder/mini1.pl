use strict;
use warnings;

use DBI;

my $user = '';
my $password = '';  


my $dbfile="quiz.db";   #creating a database file quiz

# connect to SQLite database 
my $dbh = DBI->connect ("DBI:SQLite:dbname=$dbfile",$user,$password) or die "Can't connect to database: $DBI::errstr\n"; 
  
#print "connected to the database\n"; 


#Creating a TABLE
my $sql = <<'END_SQL';
CREATE TABLE quiz ( 
	Qno  INTEGER PRIMARY KEY,
	QUES VARCHAR(100),
	a	 VARCHAR(100),	
	b    VARCHAR(100),
	c    VARCHAR(100),
	d    VARCHAR(100),
	ANS  VARCHAR(10)
)
END_SQL
 
$dbh->do($sql);




$dbh->do('CREATE TABLE users (
		 
		 Name  VARCHAR(100),
		 Score INTEGER
		 
		 )') or die $DBI::errstr;



print "Table created sucessfully in the database";

$dbh->disconnect();

