.PHONY: test
test: test-heroku-20

test-heroku-20:
	@echo "Running tests in docker (heroku-20)..."
	@docker run -v $(shell pwd):/buildpack:ro --rm -it -e "STACK=heroku-20" heroku/heroku:20 bash -c 'cp -r /buildpack /buildpack_test; cd /buildpack_test/; tests/run;'
	@echo ""

shell:
	@echo "Opening heroku-20 shell..."
	@docker run -v $(shell pwd):/buildpack:ro --rm -it heroku/heroku:20 bash -c 'cp -r /buildpack /buildpack_test; cd /buildpack_test/; bash'
	@echo ""
