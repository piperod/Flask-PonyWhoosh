SHELL := /bin/bash

.PHONY: clean
clean:
	@rm -f example.sqlite
	@rm -Rf dist/
	@rm -Rf build/
	@rm -Rf indexes/
	@rm -Rf __pycache__/
	@rm -Rf ponywhoosh_indexes/
	@rm -Rf flask_ponywhoosh.egg-info
	@find . -name "*.pyc" -type f -delete

.PHONY : install-py2
install-py2:
	make clean
	python2.7 setup.py install

.PHONY : test-py2
test-py2:
	make install-py2
	python2.7 -m unittest test

.PHONY : install-py3
install-py3:
	make clean
	python3 setup.py install

.PHONY : test-py3
test-py3:
	make install-py3
	python3 -m unittest test

.PHONY : docs
docs:
	pip install sphinx
	cd docs && make html

.PHONY : TODO
TODO :
	find . -type d \( -path './.git' -o -path './dist' \) -prune -o -print \
	| xargs grep -I 'TODO' \
	| sort