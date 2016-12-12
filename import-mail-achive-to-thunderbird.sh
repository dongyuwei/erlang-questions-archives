# erlc archive_downloader
# erl -s archive_downloader download_all -run init stop -noshell

cd ./archives
gunzip -f *.gz
for i in $(ls *.txt); do cat $i >> erlang-questions-archives; done
# cp erlang-questions-archives ~/.thunderbird/*.default/Mail/Local\ Folders
cp erlang-questions-archives ~/Library/Thunderbird/Profiles/cacug0f3.default/Mail/Local\ Folders/
cd ../