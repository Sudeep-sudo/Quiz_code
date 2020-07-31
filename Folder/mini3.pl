
#CODE TO GIVE QUIZ

use strict;
use warnings;
use DBI;


#connecting to a database
my $user='';
my $password='';
#$\="\n";
my $dbh = DBI->connect ("dbi:SQLite:quiz.db",$user,$password) or die "Can't connect to database: $DBI::errstr\n"; 


print "ENTER YOUR NAME\n";

my $usr_name= <STDIN>;
print "Quiz is starting for user $usr_name,ALL THE BEST each correct ans will give you 1 point\n\n";
print "press ENTER to continue\n";
<STDIN>;



#FETCHING OR READING the database( select , prepare and execute)

my $sql= 'SELECT * FROM quiz';

my $row= $dbh->selectrow_array("SELECT count(*) FROM quiz");  #counts the number of questions in the quiz


my $sth= $dbh->prepare($sql);
$sth->execute();
my (@qno, @q, @a, @b, @c, @d, @ans);		#arrays

my $i=0;
while (my @row=$sth->fetchrow_array()){
	
	$qno[$i]=$row[0];				#array of question number
	
	$q[$i]=$row[1];					#array of questions
	
	$a[$i]=$row[2];					#array of option a
	
	$b[$i]=$row[3];					#array of option b
	
	$c[$i]=$row[4];					#array of option c
	
	$d[$i]=$row[5];					#array of option d
	
	$ans[$i]=$row[6];				#array of option answers
	
	
	$i++;
}

print "data fetched sucessfully\n";



#QUIZ STARTED FOR USER 

my $marks=0;
my $j=0;
while($j<=($row-1)){
	print"\n";
	print "Q.$qno[$j] $q[$j]\n";

	print "a.$a[$j] \t b.$b[$j] \nc.$c[$j] \t d.$d[$j]\n";

	print "Enter your option\n";

	my $op=<STDIN>;
	
	chomp $op;					#to discard the last null character , it is necessary to discard to compare both strings
	chomp $ans[$j];
	if ($op eq $ans[$j]){
	
		print "1 point\n";
		$marks++;
	}
	else{
		print "wrong answer\n";

	}

	$j++;

}
#to give values from user we have to use ? as a placeholder 
$dbh->do('INSERT INTO users (Name, Score)
		 VALUES(?,									
				?)',
				undef,
				$usr_name, $marks) or die $DBI::errstr;


print "\nyou have scored $marks in this test and your record is sucessfully saved in the database\n";



print "\nIf you are a QUALCOMM employee the you can become admin and create tests for others also\n";

print "Are you a Qualcomm employee, y or n?\n";

my $emp= <STDIN>;
chomp $emp;
if ($emp eq 'y'){
	
	print "Enter the Ques you want to add \n";
	
	my $new_ques=<STDIN>;
	
	print "\nEnter the options a,b,c,d \n";
	
	my $new_a=<STDIN>;
	print "\n";
	chomp $new_a;
	my $new_b=<STDIN>;
	chomp $new_b;
	print "\n";
	my $new_c=<STDIN>;
	chomp $new_c;
	print"\n";
	my $new_d=<STDIN>;
	chomp $new_d;
	print "Enter the corect option a or b or c or d\n";
	
	my $new_ans=<STDIN>;
	chomp $new_ans;
	
	$dbh->do('INSERT INTO quiz (QUES, a, b, c, d, ANS) VALUES (?, ?, ?, ?, ?, ?)',
			 undef,
			 $new_ques, $new_a, $new_b, $new_c, $new_d, $new_ans) or die $DBI::errstr;
			 
}


			 
	
	
	






