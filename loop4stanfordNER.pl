# for loop to execute stanfordNER
# if your corpus is big e.g. 100k sentences plus, then it will show out of memorry when you run the tagger. so, split the 
# original file into small ones e.g. "Lifengs-MacBook-Air:corpora lifenghan$ split -l 10000 corpus.tc.en corpus.tc.en10k" and 
# store the splited files in one folder, but take the original large file out, then run this perl code to tag the small files.

#!/usr/bin/perl -w


opendir (DIR, "/Users/lifenghan/Desktop/_stanford-ner-2018-10-16/corpora") || die "can not open output file!"; ##corpora to be tagged by NE-recognizer
@filename=readdir(DIR);
closedir (DIR);


## go through all the files in the route
foreach $file (@filename)
	{
		if(!(-d "/Users/lifenghan/Desktop/_stanford-ner-2018-10-16/corpora/$file"))  ## put each files here - e.g. splited small files
			{
				open (TEST,"<:encoding(utf8)","/Users/lifenghan/Desktop/_stanford-ner-2018-10-16/corpora/$file") || die "can not open file: $!";  

#				open (RESULT,">/Users/lifenghan/Desktop/_stanford-ner-2018-10-16/tag/tag_$file.txt") || die "$!"; ## put the address of evaluation results documents here
			
				system("java -mx600m -cp stanford-ner.jar:lib/* edu.stanford.nlp.ie.crf.CRFClassifier -loadClassifier classifiers/english.all.3class.distsim.crf.ser.gz -textFile /Users/lifenghan/Desktop/_stanford-ner-2018-10-16/corpora/$file > /Users/lifenghan/Desktop/_stanford-ner-2018-10-16/tag/tag_$file.txt")

#system("java com.something.Some")
				
			
			
			
			}
	}
	
	
