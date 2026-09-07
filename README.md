# Kadıköy Kentsel Çevre Analizi

Bu proje, İstanbul Kadıköy ilçesine ait Sentinel-2 uydu görüntülerinin uzaktan algılama ve CBS (Coğrafi Bilgi Sistemleri) yöntemleri kullanılarak analiz edilmesini amaçlamaktadır.

Çalışma kapsamında Sentinel-2 uydu verilerinden **NDVI, NDBI, NDWI ve SAVI** spektral indeksleri üretilmiş ve bu indeksler Kadıköy mahalle sınırları ile ilişkilendirilerek mahallelerin kentsel ve çevresel özellikleri karşılaştırılmıştır.

Üretilen indeksler sayesinde mahallelerin;

* bitki örtüsü yoğunluğu,
* yapılaşma ve betonlaşma özellikleri,
* su ve nem göstergeleri,
* bitki ve toprak özellikleri

üzerinden değerlendirilmesi sağlanmıştır.

Projenin önemli bir bölümünü, üretilen raster verilerin mahalle bazında sorgulanabilir hale getirilmesi oluşturmaktadır. Böylece farklı mahalleler indeks değerleri üzerinden karşılaştırılarak hangi bölgelerde bitki örtüsünün daha yoğun, hangi bölgelerde yapılaşmanın daha belirgin olduğu incelenebilmektedir.

## Kullanılan Veriler

Projede temel olarak aşağıdaki veri kaynakları kullanılmıştır:

* **Sentinel-2 uydu görüntüleri**
* Kadıköy ilçe sınırı
* Kadıköy mahalle sınırları
* Spektral bant verileri

Sentinel-2 verileri kullanılarak gerekli bant kombinasyonları hazırlanmış ve indeks hesaplamaları gerçekleştirilmiştir.

## Kullanılan Spektral İndeksler

### NDVI — Normalized Difference Vegetation Index

Bitki örtüsünün yoğunluğunu ve dağılımını incelemek amacıyla kullanılmıştır.

**NDVI:**

```text
(NIR - Red) / (NIR + Red)
```

Yüksek NDVI değerleri genel olarak daha yoğun bitki örtüsünü, düşük değerler ise daha az bitkili veya yapılaşmış yüzeyleri göstermektedir.

### NDBI — Normalized Difference Built-up Index

Yapılaşmış ve kentsel yüzeylerin belirlenmesinde kullanılmıştır.

**NDBI:**

```text
(SWIR - NIR) / (SWIR + NIR)
```

NDBI değerleri kullanılarak kentsel yapılaşmanın mahalleler arasındaki farklılıkları incelenmiştir.

### NDWI — Normalized Difference Water Index

Su ve nem içeriğinin belirlenmesi amacıyla kullanılmıştır.

**NDWI:**

```text
(Green - NIR) / (Green + NIR)
```

Bu indeks özellikle su yüzeylerinin ve nemli alanların belirlenmesinde kullanılmıştır.

### SAVI — Soil Adjusted Vegetation Index

Bitki örtüsünün düşük yoğunlukta olduğu alanlarda toprak etkisini azaltarak bitki durumunun daha sağlıklı değerlendirilmesi amacıyla kullanılmıştır.

**SAVI:**

```text
((NIR - Red) / (NIR + Red + L)) × (1 + L)
```

Burada `L`, toprak parlaklığının etkisini azaltmak amacıyla kullanılan düzeltme katsayısıdır.

## Analiz İş Akışı

```text
Sentinel-2 Uydu Görüntüsü
          ↓
   Bantların Hazırlanması
          ↓
    Raster Ön İşleme
          ↓
 ┌────────┼────────┬────────┐
 ↓        ↓        ↓        ↓
NDVI     NDBI     NDWI     SAVI
 └────────┼────────┴────────┘
          ↓
   Mahalle Sınırlarıyla
       İlişkilendirme
          ↓
 Mahalle Bazlı İstatistikler
          ↓
    İnteraktif Sorgulama
          ↓
Kentsel ve Çevresel Karşılaştırma
```

## Kullanılan Teknolojiler

* **PostgreSQL**
* **PostGIS**
* **QGIS**
* **Sentinel-2**
* **SQL**
* Raster veri işleme
* CBS tabanlı mekânsal analiz
* Uzaktan algılama indeksleri

## Projenin Çıktıları

Çalışma sonucunda mahalle bazında indeks değerlerinin incelenmesini sağlayan analiz tabloları ve sorgulama yapıları oluşturulmuştur.

Bu yapı kullanılarak örneğin;

* En yüksek NDVI değerine sahip mahalleler,
* Yapılaşma göstergesi yüksek mahalleler,
* Su/nem göstergeleri yüksek bölgeler,
* Yeşil alan göstergesi açısından öne çıkan mahalleler

karşılaştırılabilmektedir.

## Veri Gizliliği

Projede kullanılan bazı kurum/çalışma verileri veri gizliliği nedeniyle GitHub üzerinde paylaşılmamıştır.

Özellikle **mahalle sınırları ve yapı katmanları** gizlilik kısıtları nedeniyle bu repository içerisinde yer almamaktadır. Bu nedenle GitHub üzerinde yalnızca paylaşılmasına izin verilen kodlar, yöntemler ve örnek/üretilmiş analiz içerikleri bulunmaktadır.

Repository içerisinde paylaşılmayan veriler kullanılarak gerçekleştirilen analizlerin yöntemsel akışı ve kullanılan teknikler README ve SQL dosyaları üzerinden açıklanmaktadır.

## Amaç

Bu proje ile uydu görüntülerinden elde edilen spektral indekslerin CBS ortamında işlenmesi, mekânsal verilerle ilişkilendirilmesi ve mahalle ölçeğinde anlamlı kentsel ve çevresel göstergelere dönüştürülmesi amaçlanmıştır.

Çalışma; **uzaktan algılama, raster veri analizi, PostGIS ve mekânsal sorgulama** konularındaki uygulamalı deneyimi göstermektedir.
