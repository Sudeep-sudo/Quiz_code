
#THIS CODE LOADS THE QUIZ

use strict;
use warnings;
use DBI;


#connecting to a database
my $user='';
my $password='';
#$\="\n";
my $dbh = DBI->connect ("dbi:SQLite:quiz.db",$user,$password) or die "Can't connect to database: $DBI::errstr\n"; 
  
#print "connected to the database\n"; 

#Deleting garbage entry in the table

my $del=$dbh->do('DELETE FROM quiz') or die "TABLE not found, connect to database properly, run mini1.pl";
 

#inserting quiz questions 

my $QUES = 'Which function is used by perl for reversing a string?';
my $a = 'rev',
my $b = 'reverse';
my $c = 'split';
my $d = 'substr';
my $ANS = 'b';
#QUES 1

$dbh->do('INSERT INTO quiz (QUES, a, b, c, d, ANS) VALUES (?, ?, ?, ?, ?, ?)',			
  undef,
  $QUES, $a, $b, $c, $d, $ANS);

#QUES 2

$dbh->do('INSERT INTO quiz (QUES, a, b, c, d, ANS) 
		  VALUES("Scalar stores",
				 "multple value", 
				 "single value", 
				 "double value", 
				 "float value", 
				 "b")') or die $DBI::errstr;
				 
#QUES 3

$dbh->do('INSERT INTO quiz (QUES, a, b, c, d, ANS)
		  VALUES("The perl DBI is",
				 "Database Inheritance",
				 "Database integrity",
				 "Database interface",
				 "Database isolation",
				 "c")') or die $DBI::errstr;
				 
#QUES 4

$dbh->do('INSERT INTO quiz (QUES, a, b, c, d, ANS)
		  VALUES("Which function is used by perl for displaying the length of a string?",
				 "string",
				 "len",
				 "split",
				 "lenght",
				 "d")') or die $DBI::errstr;
				
#QUES 5

$dbh->do('INSERT INTO quiz (QUES, a, b, c, d, ANS)
	      VALUES("Which of the following data types are preceded by a percent sign (%) in Perl?",
			     "scalar",
			     "array",
			     "hashes",
			     "all the above",
			     "c")') or die $DBI::errstr;
			   
print "Quiz created successfully\n";
















