# this perl code is to extract the tagged named entities out from the stanfordNER tagger

# read each line of the file, if there is x1/ne ... xm/ne j/0, then print the NE x1_x2_xm plus restarting new line.
#this will not print a lot of empty line.

# if x1/ner...xm/ner_y/0
#	expert x1...xm \n;

####if there is NE tag then print this word plus a space, otherwise if there is 0 tag renew a line
#this will print lot of empty line.

# if xi/ne
#	print xi " "
# elsif xi/0
#   print "\n"

###
# another idea is replace all xxx/0 as \n and replace xxx/ne as xxx.
# then remove all the empty lines.



#!/usr/bin/perl -w

# /Users/lifenghan/Desktop/_stanford-ner-2018-10-16/tag_test

# /Users/lifenghan/Desktop/_stanford-ner-2018-10-16/NE_tag

$replace = '/Users/lifenghan/Desktop/_stanford-ner-2018-10-16';


				open (TEST,"<:encoding(utf8)","$replace/tag_test/tag_corpus.tc.en10kaa.txt") || die "can not open file: $!";  
				open (RESULT,">:encoding(utf8)","$replace/NE_tag/NE_tag_corpus.tc.en10kaa.txt") || die "$!"; ## store the result

				$str="";
				while($str=<TEST>)
					{
#						if($stirng=~ m/w+\/LOCATION$/)
		#				if($stirng=~ m/w+\/LOCATION/)
		#					{
								$str=~ s/\/LOCATION//g;
		#						print RESULT $string, " ";
		#					}
		#				if($stirng=~ m/w+\/ORGANIZATION$/)
		#					{
								$str=~ s/\/ORGANIZATION//g;
		#						print RESULT $string, " ";
		#					}
		#				if($stirng=~ m/w+\/PERSON$/)
		#					{
								$str=~ s/\/PERSON//g;
		#						print RESULT $string, " ";
		#					}
		#				elsif($stirng=~ m/w+\/0/)
		#					{
		#						print RESULT "\n";
		#					}
		#				else
		#					{
		#					}
#								$str=~ s/\w+\/O//;  # this makes problem for /Organization
#								$str=~ s/\w+\/O\s//g;  # this makes problem for @/O non-word issue
								$str=~ s/\w+\/O\s/\t/g;  # this makes problem for @/O non-word issue

#								$str=~ s/^\s\/O\s/\t/g;
								$str=~ s/[^\s]*\/O\s/\t/g;  # any character except for space, match 0 or more times, then followed by '/O' and followed by space; replace it with tab.
								
								
#								$str=~ s/^\s\/O\s/\n/g;
#								/[^\s\\]/


#merge all the multi-tab into one \tab to reduce redumdancy

#								$str=~ s/[\t]*/\t/g;  # 
								$str=~ s/[\t]+/\t/g;  # 


								print RESULT $str;
		
					
					}
					
				close TEST;
				close RESULT;
	
#				open (RESULT,">:encoding(utf8)","$replace/NE_tag/NE_tag_corpus.tc.en10kaa.txt") || die "$!"; ## put the address of evaluation results documents here
#					while(<RESULT>)
#						{
#							$_ =~ s/(^|\n)[\n\s]*/$1/g;

#							if($_=~ /^\s*$/){}

#						}
				
#				close RESULT;
							
	
