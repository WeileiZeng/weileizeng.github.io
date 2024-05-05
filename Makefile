#doc is the default subfolder for github pages
publish:
	rsync -r web/output/ doc
clean:
	rm -r doc/*
