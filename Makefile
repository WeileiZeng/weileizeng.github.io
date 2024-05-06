#docs is the default subfolder for github pages
all:publish-and-push
publish:
	echo "sync developed website into the target folder docs/"
	rsync -r web/output/ docs
push:
	echo "push the update to git hub"
	git add docs/
	git commit -m "update new version of the website"
	git push

publish-and-push:publish push

clean:
	rm -r docs/*
