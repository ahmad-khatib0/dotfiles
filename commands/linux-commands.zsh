alias d= "date"
# -u/--universal
alias n= "ncal"# or : cal => calander 
# -M | -j | -h | -3 | ncal -3hMJ | -A2 | -B5
# A2 B | => B=before A=after 
alias sort= "sort"
# -r/--reverse filename|filename --reverse --unique/-ru 
alias type="type clear"#/mkdir/ls :clear is /usr/bin/clear
# /type cd => cd is a shell builtin /  type lara => lara is an alias for cd /mnt/c/laragon/www
alias which= "which kgs" # => kgs: aliased to kubectl get services
alias help="help cd" #to see info about builtin commands that doesn't have manual  
alias whoami= "whoami"
alias who="who"
alias root-dir="xdg-open /"
alias lsh="ls -alh"# -l sort=time|size
alias file="file"# 
alias rm="rmdir"# r | i | f 
alias mv="mv source destintion"#mv folder file folder file.... =>move them step backward
alias cp="cp source destination"# -r
alias history= "history | less"#|just: !number => retrive the command  
alias history-size="echo $HISTORYFILESIZE"
alias history-session-size="echo $HISTOYSIZE"
alias cat= "cat" #cat ~/.bash_history
alias tac="tac filename"#print the file recursivly 
alias less="less filename"# is better than cat for the long content files 
alias rev="rev filename" #reverse the chracters in the lines 
alias head="head filename" #print the first 10 lines of beggining of a file 
alias head="tail filename" #print the last 10 lines of end of a file 
#-n number (for head or tail ) => how many lines | -c number => how many bytes | -f => its for tail 
# and its usful to listen to events that occuring in your computer like: tail -f syslog 
alias wc="wc filename"#-l | -w | -m | -c 
alias sort="sort filename " # -r | -n | -u | kNumber => column number 
 
# sort -k5n list.txt > sorted_list.txt => redirect some part of file to new file 
#  date >> filename.txt => >> means append 
# cat < file.txt => it's the opsite of: cat > random.txt : in this case cat the file.txt to the input   
# cat < dog.txt >> cat.txt  => take what inside dog , and append it to cat.txt file  
#  ls dlkfksdl 2> error.log => redirect error to another file  || ls dlkfksdl 2>> error.log => append
#  cat calder-of-2021 cat.txt dog.txt > all.txt 2>> error.log  => multiple files 
# ls -4l > output.txt 2>&1 => redirect the error to the same output file 
# ls -l3 &> output.txt , => shorter: redirect the error to the same output file ,,, >> to append

#Piping 
#  ls /usr/bin -l | less  => pipe the output to less/    ls /usr/bin -1a | wc -l  => 1144 
#  ls /usr/bin -1a | wc -l   > count.txt  =>  this is copaining piping with redirecting 
# cat msg.txt | tr s S  => by this tr piping , replase all s lowercase to uppercase  | 
#  cat msg.txt | tr a-z A-Z => cappilaze them all  |   cat msg.txt | tr -d s    
# cat msg.txt | tr -d [:alpha:] | tr -d : | tr -d  [:blank:] > just_numbers.txt 
#   cat -n data.txt | head -15 | tail -10
#  ls /usr/bin -lh | sort -k5hr | head -10 > big-files.txt 

# cat count.txt countries.txt data.txt |tee colection.txt | wc  
# =>  220  295  2401   in termenal , and all the three files content to colection.txt 
# this tee pipline will not stuck in the middle , but it will detirmine the cat function and will 
# count the words using wc  , so for example if you did it in normal way like so:
# cat count.txt countries.txt data.txt | wc -w  > colection.txt  => 
#  220  295  2401  in termenal and in  colection.txt , so we didn't get what we want 
#  head -n 151 all-pokemon.txt | tr -d 0-9 | sort > orgininal-151.txt

alias *="echo *.txt"#ls | cat ....
alias **="echo *ts*"# ls | cat .... any file has ts in it 
alias ?="ls app?.css"# | mv *.??? Styles/ => any js won't be include  
# any file has just one chracter after app , and sure has ext .css , note: app.css won't be include 
alias []="echo app.[123].css"#|[1-3] ... app4.css won't be included 
#[A-Z] will look on just files contaied of one letter only , while [A-Z]*   will match all uppercase folders
#note: we can to have multiple ranges: [A-H]*[pc]
# echo[^A-Z]* => excluding all uppercase folders | [^CcPcOc] => excluding folders began with thoes 

# touch {MON,th,wed,te,fri}_{AM,PM}
# mkdir day_num{1..365}.js => this is ranging 
# echo {1..100..5} => 3arg for how many step each loop 
#  mkdir -p {MON,TUE,WED,TH,FRI,SAT,SUN}/{Breakfast,Lunch,Dinner} => -p will create thoes 7folders and 
# each folder will contain thoes meals 
# mkdir {Mon, Tue{1..15}{AM,PM} ,Wed} => nested brace 

alias (())="echo $((12/2**(4+4)))"# + | - | ** | % 

echo "hello i'm here              $(date)"
# hello i'm here              Tue Jun 15 23:51:04 +03 2021
echo 'hello i am here              $(date)'
# hello i am here              $(date)
echo hello there $(whoami)   or   echo hello there `whoami`
# hello there ahmadkhatib

alias ls="ls -l"#lc => mtime | lc => ctime | lu => atime
alias touch="touch last_week -d "1 week ago""#

alias find="find -mmin -30"#or +30/30 |  -amin number | -mtime number | atime number  | ctime number 
# find ~ -not -name "*.txt*"     find ~ -mmin -60 -not -name "*.txt*"     ...or ! shorter wat to -not    
# find ~ -mmin -60 -not -name "*.txt*"     find ~ -type f -empty -exec ls -l '{}' ';'
# find -empty -ok rm  '{}' ';'  => this ok arg , to ask you for confermation 
# find -empty -exec ls '{}'  ';'   
# find -iname "*[13579]_open*" | wc -l
# find -newer yesterday.txt   => find file that modifed more reciently than yesterday.txt 
# find -empty |xargs ls -l   

alias grep ="chapter" great-getspay.txt -i
#  grep "ate" great-getspay.txt -w  => -w will match exctly ate , not atech for example
# grep -ri "Ahmad" => inside the current and the nested directories in all the files on word (Ahmad)
#  grep -ri "eggplant" /MealDay => look in this folder
#  grep -ri "eggpl[ae]nt" /MealDay => maybe it can be spelled with a or e , so look on both 

#  grep "myself" SongOfMyself.txt -ic => 47
#  grep "grass" SongOfMyself.txt -iB1 => B1 means line before this match | A1  => 1 line after 
# | C1  => same as A1 B1 |     
# grep "6" SongOfMyself.txt -wn => 131:6  (line 131)

# regex:   grep "p...." SongOfMyself.txt -w  => match words have four chracters after p 
# grep "^I" SongOfMyself.txt -wn  => ^ lines start with I 
# grep ")$" SongOfMyself.txt -c  => $ lines end with ) 
#  grep "2[1-6]" SongOfMyself.txt -C1  => [] range  , and line after and before each line 

# grep "birds?" -wE SongOfMyself.txt => ? means that s is an optional and E to enable extended regex
#  grep "[aeiou]{2}" SongOfMyself.txt -E  => {2} means 
# desplay just the words that has tow of thoes vouel chracters 

# ps -aux | grep "sound" -i => ps -aux is for the process that are  occering  on all the users 
# man grep | grep "count" -i -C1  => search inside the grep man 
#  find ~ -name "*.txt" ! -empty -type f -exec grep -nl "grass" '{}' ';'

alias chmod="chmod "
alias chown="chown "
alias groups="groups"
alias sudo="sudo -l "
alias addgroup="addgroup group_name"
alias add-user-to-group="adduser ahmad palsforever"
alias envernoment=" printenv | less "

alias largest-10-folders="du -ha /usr/bin/ | sort -h | tail -11 | head -10"# excluding bin dir itself
alias largest-5-folders=" ls /usr/bin -lh | sort -k5hr | head -5"
alias unzip="unzip filename destination"
alias pc10cpu= "ps auxf | sort -nr -k 3 | head -10"