use strict;
use warnings;
use Tk::FBox;
use Tk;
use Tk::FileSelect;

use File::Copy;
my $types = [ ['Perl files', '.pl'],
              ['All Files',   '*'],];
			  

my $mw = Tk::MainWindow->new;

$mw->geometry('500x200');

my $main_frame= $mw->Frame() -> pack(-side => 'top', -fill => 'x');

my $topframe= $main_frame->Frame(-background=>'black')->pack(-side=>'top', -fill=>'x');

#$mw->Frame(-background => 'red')->pack(-ipadx => 50, -side => "left", -fill => "y");


my $leftframe= $mw->Frame(-background => 'white')->pack(-ipadx => 50, -side => "left", -fill => "y");		#The first argument, ipadx, increases the frame's width by 100 (50 x 2).





my $menu= $topframe->Button(-text=>'start', -justify=>'left', -command=> \&first_sub)->pack(-side=>'left');


my $srch = $topframe->Button(-text=>'Search', -justify=>'left',-command => \&copy_entry)->pack(-side=>'left');

my $copy_entry = $topframe->Entry()->pack(-side=>'left');


my $choos_dir= $topframe->Button(-text=>'Search from', -justify=>'left', -command=> \&searchfrom)->pack(-side=> 'left');

my $cpy_frm= $topframe->Button(-text=>'Copy from', -justify=>'left', -command=> \&copyfrom)->pack(-side=> 'left');

my $pst_to= $topframe->Button(-text=>'Paste to', -justify=>'left', -command=> \&pasteto)->pack(-side=>'left');

my $ext= $topframe->Button(-text=>'EXIT', -justify=>'right', -command=>[$mw => 'destroy'])->pack(-side=>'right');

my $direc;
my $file;

sub searchfrom{
	
	$direc= $mw->chooseDirectory(-initialdir=>'C:', -title=> 'Search from');
}

sub copyfrom {
	
	my $cdir= $mw->chooseDirectory(-initialdir=>'C:', -title=> 'Copy from');
	my $FSref = $mw->FileSelect(-directory => $cdir);
	$file = $FSref->Show;
	
}

sub pasteto {
	
	
	my $pdir= $mw->chooseDirectory(-initialdir=>'C:', -title=> 'Paste to');
	
	copy($file, $pdir);
}
	




sub first_sub {
	
	
    my $dir = $mw->chooseDirectory(-initialdir => '~',
                                   -title => 'Choose a folder');
			
	my $fdr= $mw->chooseDirectory(-initialdir => $dir ,-title => 'Choose 2nd folder');
    
	my $FSref = $mw->FileSelect(-directory => $fdr);
	my $file = $FSref->Show;

	#my $dir = $mw->chooseDirectory(-initialdir => '~',
                                   #-title => 'Choose a folder');
			
	#my $fdr= $mw->chooseDirectory(-initialdir => $dir ,-title => 'Choose 2nd folder');
    
	#my $FSref = $mw->FileSelect(-directory => $fdr);
	#my $file = $FSref->Show;
	
	


	
	my $filepath = $mw->getOpenFile(-initialdir => $fdr,-filetypes => $types, -defaultextension => '.txt');
	
	print "You choose to open $filepath \n";




	#if (!defined $dir) {
		
        #print "No directory selected";
    #} else {
		
        #print "Selected $dir";
	#}
}



sub copy_entry{
	
	
	
	my $item= $copy_entry->get();
	my $f= $item;
	opendir(my $DIR, "$direc");
	my @files = grep(/$f */,readdir($DIR));
	closedir($DIR);
	
	foreach my $file (@files) {
		
		 
		 
		
		
		print "$file\n";
	}
	my $dir= 'C:\users\*';

 

	my @arr= glob($dir);

	my $length = @arr;


	my $var = "\\*";

# my $x= $arr[11].$var;
# print "$x \n\n";


	foreach my $arr (@arr) {
		#print "$arr\n";
   
		no warnings;
		opendir(my $DIR, "$arr") ;
		my @files = grep(/$f */,readdir($DIR));
		closedir($DIR);
   
		foreach my $file (@files) {
			
	   
	   
			print "$file\n";
		}
	
	}

	my @arr2;

	
	my @tempf;
	my $x=0;
	
	foreach my $ar (@arr){
		
	    
		no warnings;
		@arr2= glob($ar.$var);
		
		
		# foreach my $cv(@arr2){
		
			# print "$cv\n";
		# }
	
	
		foreach my $ar2 (@arr2) {
			
		
			opendir(my $DIR, "$ar2");
			my @files=grep(/$f*/, readdir($DIR));
			closedir($DIR);
		
			foreach my $file (@files){
				
			
				print "$file\n";
			}
		}
	
	}
	
	# @arr = @arr2;
	# $length= @arr;
	
	

	my @arr3;
	
	#print "@arr2";
	
	my @temp;
	my @temp2;
	my $j=0;	
	#@arr3= glob($ar.$var);
	foreach my $ar (@arr2){
		no warnings;
		@arr3= glob($ar.$var);
		
		$temp[$j]= "@arr3";
		$j++;
		#print "@arr3";
		foreach my $ar2 (@arr3){
			
			opendir(my $DIR, "$ar2");
			my @files =grep(/$f*/, readdir($DIR));
			closedir($DIR);
			
			foreach my $file (@files){
				
				print "$file\n";
			}
		}
	}
	
			
#print "@temp";
	
	

	my @arr4;
	
	$j=0;
	foreach my $ar (@temp){
		no warnings;
		@arr4= glob($ar.$var);
		$temp2[$j]= "@arr4";
		$j++;
		foreach my $ar2 (@arr4){
			
			opendir(my $DIR, "$ar2");
			my @files =grep(/$f*/, readdir($DIR));
			closedir($DIR);
			
			foreach my $file (@files){
				
				print "$file\n";
			}
		}
	}
	print "@arr4";
	my @arr5;
	
	my @temp3;
	$j=0;
	
	foreach my $ar (@temp2){
		
		no warnings;
		@arr5= glob($ar.$var);
		$temp3[$j]="@arr5";
		$j++;
		foreach my $ar2 (@arr5){
			
			opendir(my $DIR, "$ar2");
			my @files =grep(/$f*/, readdir($DIR));
			closedir($DIR);
			
			foreach my $file (@files){
				
				print "$file\n";
			}
		}
	}
}







MainLoop();
