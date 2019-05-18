
# for loop to execute stanfordNER

#!/usr/bin/perl -w
# /Users/lifenghan/Desktop/_stanford-ner-2018-10-16/corpora/10kaa

opendir (DIR, "/Users/lifenghan/Desktop/_stanford-ner-2018-10-16/corpora/10kaa") || die "can not open output file!"; ##corpora to be tagged by NE-recognizer
@filename=readdir(DIR);
closedir (DIR);


## go through all the files in the route
foreach $file (@filename)
	{
		if(!(-d "/Users/lifenghan/Desktop/_stanford-ner-2018-10-16/corpora/10kaa/$file"))  ## put each files here - e.g. splited small files
			{
				open (TEST,"<:encoding(utf8)","/Users/lifenghan/Desktop/_stanford-ner-2018-10-16/corpora/10kaa/$file") || die "can not open file: $!";  

#				open (RESULT,">/Users/lifenghan/Desktop/_stanford-ner-2018-10-16/tag/tag_$file.txt") || die "$!"; ## put the address of evaluation results documents here
			
				system("java -mx600m -cp stanford-ner.jar:lib/* edu.stanford.nlp.ie.crf.CRFClassifier -loadClassifier classifiers/english.all.3class.distsim.crf.ser.gz -textFile /Users/lifenghan/Desktop/_stanford-ner-2018-10-16/corpora/10kaa/$file > /Users/lifenghan/Desktop/_stanford-ner-2018-10-16/tag/10kaa10_tag/tag_$file.txt")

#system("java com.something.Some")
				
			
			
			
			}
	}
	
	
