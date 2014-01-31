#!/usr/local/bin/fish  

# AJ Caldwell
# tomatrow@gmail.com
# codemark converts code files into one markdown document 

set VERT_SPACE \n\n
set CODE_SEP ```
set LINE_SEP ---

set FIRST_SEP $CODE_SEP$VERT_SPACE
set MID_SEP $VERT_SPACE$CODE_SEP$VERT_SPACE$LINE_SEP$VERT_SPACE$CODE_SEP$VERT_SPACE
set LAST_SEP $VERT_SPACE$CODE_SEP

function codemark
	# the first argument must be the main class, the rest can be whatever. 
	set MAIN $argv[1]

	echo $FIRST_SEP
	cat $MAIN

	for file in $argv
		# Skip the main file because that was the first one we printed
		if test $file != $MAIN
			echo $MID_SEP
			cat $file
		end
	end 
	echo $LAST_SEP
end

codemark $argv