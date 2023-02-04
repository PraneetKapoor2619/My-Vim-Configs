move: $(wildcard *)
	cp vimrc gvimrc
	rsync -av --progress . ~/.vim --exclude .git/


