docker-run:
	docker run --rm -it -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material

push-wip-force:
	git add '*' && git commit -m $(shell date +%F-%R) && git push -f origin wip
