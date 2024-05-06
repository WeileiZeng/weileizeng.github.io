#docs is the default subfolder for github pages
all:publish
publish:
	rsync -r web/output/ docs
clean:
	rm -r doc/*
