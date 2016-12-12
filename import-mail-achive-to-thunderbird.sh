cd ./archives
gunzip *.gz
for i in $(ls *.txt); do cat $i >> erlang-questions-archives; done
# cp erlang-questions-archives ~/.thunderbird/*.default/Mail/Local\ Folders
cp erlang-questions-archives ~/Library/Thunderbird/Profiles/cacug0f3.default/Mail/Local\ Folders/
cd ../