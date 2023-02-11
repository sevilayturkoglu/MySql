/*======================== HAVING CLAUSE =======================
    HAVING, AGGREGATE FUNCTION'lar ile birlikte kullanilan 
FILTRELEME komutudur.
    Aggregate fonksiyonlar ile ilgili bir kosul koymak 
icin GROUP BY'dan sonra HAVING cumlecigi kullanilir.    
===============================================================*/
-- Yeni create ettigimiz bir field uzerinden filtreleme yaptigimiz icin
-- WHERE cumlecigini kullanamayiz, WHERE cumlecigi sadece tablomuzda var olan
-- field'lar icin bir filtreleme yapar.
use sys;

-- 1 Sirketlere gore isci sayisi 1 den buyuk olani getir
select sirket ,count(isim)isci_sayisi
from isciler
group by sirket
having isci_sayisi>1;

-- 2 Toplam geliri 8000 den fazla olan isimleri gosteren sorgu yaziniz
select isim,sum(maas)top_gelir
from isciler
group by isim
having top_gelir>8000;

-- 3 Her sirketin min maaslari 4000 den buyukse goster
select sirket,min(maas)comert_patron
from isciler
group by sirket
having comert_patron>4000;

-- 4) Eger bir sehirde alinan MAX maas 5000'den dusukse sehir ismini 
-- ve MAX maasi veren sorgu yaziniz

select sehir ,max(maas)max_maas
from isciler
group by sehir
having max(maas)<5000;

select sehir ,max(maas)max_maas
from isciler
group by sehir
having max_maas<5000;

select sehir,isim,max(maas)max_maas
from isciler
group by sehir,isim
having max_maas>5000;


/*============================ LIMIT ===========================
>Tablodaki verilerin belli bir kismini listelemek icin LIMIT
 komutunu kullaniriz.
>LIMIT komutundan sonra kullandigimiz sayi kadar kaydi bize getirir.
>Eger belirli bir aralikta calismak istiyorsak bu durumda 
iki sayi gireriz, ancak bu sayilardan ilki baslangic noktamizi 
ifade ederken ikincisi kac kayit getirecegimizi belirtir. Baslangic 
noktasi dahil edilmez!
===============================================================*/
-- 1 Isciler tablosundan ilk 5 kaydi getir
select * 
from isciler 
limit 5;

-- 2 isim sirali listede ilk 3 kaydi listele

select *
from isciler
order by isim
limit 3;


select *
from isciler
order by maas desc
limit 3;

-- 3 Maas sirali tablodan 4.kayittan 6. kayda kadar olan kayitlarin isim ve sehir bilgisini getir

-- ilk 3 baslangic noktasi ikinci 3 kac kayit getirecegi
select isim,sehir
from isciler
order by maas 
limit 3,3;

-- 4) Maasi en yuksek 3 kisinin bilgilerini listeleyen sorguyu yaziniz.
select *
from isciler
order by maas desc
limit 3;

-- 5) Maasi en dusuk 3 kisinin sadece isimlerini listeleyen sorguyu yaziniz.

select isim
from isciler
order by maas
limit 3;

-- 5) Maasi en dusuk 3 kisinin sadece isimlerini,isim sirali listeleyen sorguyu yaziniz.
select isim
from isciler
order by maas
limit 3;

select isim,sehir
from isciler
order by maas,isim,sehir
limit 3;

-- 8) Maas'i 4000'den buyuk olan 3 kisinin sehrini getiriniz.

select sehir
from isciler
where maas>4000
limit 3;

-- 9) Maas'i 4000'den buyuk olan 3 kisinin sehrini listeleyiniz.

select sehir
from isciler
where maas>4000
order by maas 
limit 3;

/*============================ DISTINCT ===========================
    DISTINCT cumlecigi bir Sorgu ifadesinde benzer olan kayitlari
    filtrelemek icin kullanilir. Dolayisiyla secilen sutun veya 
    sutunlar icin benzersiz veri iceren satirlar olusturmaya yarar.
    
    Syntax :
    --------
    SELECT DISTINCT field_name1, field_name2,...
    FROM table_name
    
===============================================================*/

-- sirketimin faaliyet gosterdigi sehirleri listeleyin

select distinct sehir
from isciler;

select sehir 
from isciler
group by sehir;

select * from manav;


select distinct urun_adi
from manav;

-- 3 satilan farkli meyve turlerinden null olmayanlari  listeleyin
select distinct urun_adi
from manav
where urun_adi is not null;

-- 4 satilan farkli meyve turlerinden null olmayanlari isim sirali listeleyin
select distinct urun_adi
from manav
where urun_adi is not null
order by urun_adi;


-- 5 Manavda kac cesit meyve satilmaktadir
select  count(distinct urun_adi)
from manav
where urun_adi is not null;

-- 6 satilan meyve ve satin alan kisi isimlerinden farkli olan ikilileri listeleyen query yaz

select distinct isim,urun_adi
from manav;


































