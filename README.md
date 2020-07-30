# addr-jp-api

[![CalVer](https://img.shields.io/badge/calver-YYYY.0M.0D-22bfda.svg)](https://calver.org/)
[![GitHub](https://img.shields.io/github/license/shihanng/addr-jp-api)](https://github.com/shihanng/addr-jp-api/blob/main/LICENSE)
[![Convert then Deploy](https://github.com/shihanng/addr-jp-api/workflows/Convert%20then%20Deploy/badge.svg)](https://github.com/shihanng/addr-jp-api/actions?query=workflow%3A%22Convert+then+Deploy%22)

Datasette of addresses in Japan in both Japanese and English: <https://addr-jp-api.herokuapp.com/>

## Dependencies

```console
poetry install
```

[Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) is also necessary for deployment.

## Data Source

Original sources are made available by [Japan Post](https://www.post.japanpost.jp/).

- [Japanese](https://www.post.japanpost.jp/zipcode/dl/kogaki-zip.html):

```console
cd raw_csv
curl -O https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip
unzip ken_all.zip
iconv -t UTF-8 -f cp932 KEN_ALL.CSV > ADDR_JP.csv
sed -i 1i"jis_x0401,postcode_old,postcode,prefecture_kana,municipal_kana,town_kana,prefecture,municipal,town,has_multi_postcode,koaza,has_chome,shared_postcode,updated,updated_reason" ADDR_JP.csv
```

- [Roman](https://www.post.japanpost.jp/zipcode/dl/roman-zip.html):

```console
cd raw_csv
curl -O https://www.post.japanpost.jp/zipcode/dl/roman/ken_all_rome.zip
unzip ken_all_rome.zip
iconv -t UTF-8 -f cp932 KEN_ALL_ROME.CSV > ADDR_EN.csv
sed -i 1i"postcode,prefecture,municipal,town,prefecture_en,municipal_en,town_en" ADDR_EN.csv
```

Convert CSV files to SQLite database:

```console
make convert
```

## Local instance

```console
poetry run datasette serve raw_csv/addr.db
```

## Deployment

Set Heroku app name with `APP_NAME`,

```console
export APP_NAME=
make deploy
```
