#docs is the default subfolder for github pages
all:publish
publish:
	echo "sync developed website into the target folder docs/"
	rsync -r web/output/ docs
	echo "push the update to git hub"
	git add docs/
	git commit -m "update new version of the website"
	git push
clean:
	rm -r docs/*
