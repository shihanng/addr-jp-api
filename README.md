### Data Source
- [Japanese](https://www.post.japanpost.jp/zipcode/dl/kogaki-zip.html):
```console
curl -O https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip
unzip ken_all.zip
iconv -t UTF-8 -f cp932 KEN_ALL.CSV > KEN_ALL_UTF8.csv
sed -i 1i"jis_x0401,postcode_old,postcode,prefecture_kana,municipal_kana,town_kana,prefecture,municipal,town,has_multi_postcode,has_chome,shared_postcode,updated,updated_reason" KEN_ALL_UTF8.csv
```

- [Roman](https://www.post.japanpost.jp/zipcode/dl/roman-zip.html):

```console
curl -O https://www.post.japanpost.jp/zipcode/dl/roman/ken_all_rome.zip
unzip ken_all_rome.zip
iconv -t UTF-8 -f cp932 KEN_ALL_ROME.CSV > KEN_ALL_ROME_UTF8.csv
sed -i 1i"postcode,prefecture,municipal,town,prefecture_en,municipal_en,town_en" KEN_ALL_ROME_UTF8.csv
```
