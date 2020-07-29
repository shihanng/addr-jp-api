# addr-jp-api

[![CalVer](https://img.shields.io/badge/calver-YYYY.0M.0D-22bfda.svg)](https://calver.org/)

### Data Source

- [Japanese](https://www.post.japanpost.jp/zipcode/dl/kogaki-zip.html):

```console
cd raw_csv
curl -O https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip
unzip ken_all.zip
iconv -t UTF-8 -f cp932 KEN_ALL.CSV > ADDR_JP.csv
sed -i 1i"jis_x0401,postcode_old,postcode,prefecture_kana,municipal_kana,town_kana,prefecture,municipal,town,has_multi_postcode,koaza,has_chome,shared_postcode,updated,updated_reason" ADDR_JP.csv
csvs-to-sqlite -s , ADDR_JP.csv addr.db
```

- [Roman](https://www.post.japanpost.jp/zipcode/dl/roman-zip.html):

```console
cd raw_csv
curl -O https://www.post.japanpost.jp/zipcode/dl/roman/ken_all_rome.zip
unzip ken_all_rome.zip
iconv -t UTF-8 -f cp932 KEN_ALL_ROME.CSV > ADDR_EN.csv
sed -i 1i"postcode,prefecture,municipal,town,prefecture_en,municipal_en,town_en" ADDR_EN.csv
csvs-to-sqlite -s , ADDR_EN.csv addr.db
```
