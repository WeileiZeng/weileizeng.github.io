#docs is the default subfolder for github pages
publish:
	rsync -r web/output/ docs
clean:
	rm -r doc/*
