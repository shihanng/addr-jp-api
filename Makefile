.PHONY: help test lint mod-check

raw_dir := "raw_csv"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

convert:
	poetry run csvs-to-sqlite -s , --replace-tables $(raw_dir)/ADDR_EN.csv $(raw_dir)/ADDR_JP.csv $(raw_dir)/addr.db

deploy:
	poetry run datasette publish heroku -n $(APP_NAME) $(raw_dir)/addr.db
