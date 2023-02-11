use sys;
-- ====================== UNION ======================
/*
    Iki farkli sorgulamanin sonucunu birlestiren islemdir.
    Iki veya daha fazla Sorgu ifadesinin sonuc kumelerini 
    birlestirerek tek bir sonuc kumesi olusturur.
    2.sorgunun sonuna ORDER BY komutunu kullanirsaniz 
    tum tabloyu istediginiz siralamaya gore siralar.
   
    NOT: Secilen Field SAYISI ve DATA TYPEâ€™i ayni olmalidir.
    
    Syntax:
    ----------
    SELECT sutun_adi,sutun_adi2, .. FROM tablo_adi1
    UNION
    SELECT sutun_adi1, sutun_adi2, .. FROM tablo_adi2;
    
    NOT: UNION operatoru SADECE benzersiz degerleri alir. 
    Benzer verileri almak iÃ§in UNION ALL kullanilir.
======================================================*/
CREATE TABLE personel(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500,'Honda');
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
INSERT INTO personel VALUES(345678902, 'Mehmet Ozturk', 'Izmir', 3500,'Honda');

-- 1) Honda ve Tofas'ta calisan benzersiz isimdeki personelleri listeleyin
select isim
from personel
where sirket='Honda'
union
select isim
from personel
where sirket='Tofas';

-- 2) Honda, Ford ve Tofas'ta calisan benzersiz isimdeki personelleri listeleyin

select isim
from personel
where sirket='Honda'
union
select isim
from personel
where sirket='Tofas'
union
select isim
from personel
where sirket='Ford';

-- 3)Honda Tofas ve Ford da bulunan tum personelleri listeleyiniz
select isim
from personel
where sirket='Honda'
union all
select isim
from personel
where sirket='Tofas'
union all
select isim
from personel
where sirket='Ford';

-- 4) Maasi 4000'den fazla olan isci isimlerini ve 5000'den fazla
-- maas alinan sehirleri gosteren sorguyu yaziniz

select isim
from personel
where maas>4000
union
select sehir
from personel
where maas>5000;

select isim,maas
from personel
where maas>4000
union
select sehir,maas
from personel
where maas>5000;

-- 5) Mehmet Ozturk ismindeki personellerin aldigi maaslari ve Istanbul'daki
-- personelin maaslarini bir tabloda gosteren sorgu yaziniz

select maas
from personel
where isim='Mehmet Ozturk'
union
select maas
from personel
where sehir='Istanbul';

select isim as isci_sehir,maas
from personel
where isim='Mehmet Ozturk'
union
select sehir, maas
from personel
where sehir='Istanbul';

-- 6) Mehmet Ozturk ismindeki personellerin aldigi maaslari ve Istanbul'daki
-- personelin maaslarini en yuksekten dusuge dogru siralayarak bir
-- tabloda gosteren sorguyu yaziniz.

select maas,isim as isim_sehir
from personel
where isim='Mehmet Ozturk'
union
select maas,sehir
from personel
where sehir='Istanbul'
order by maas desc;

-- 7) Sehirlerde odenen ucreti 3000'den fazla olan sehirleri ve personelden
-- ucreti 5000'den az olanlarin isimlerini bir tabloda gosteren sorguyu yaziniz

select sehir,maas 
from personel
where maas>3000
union
select isim,maas
from personel
where maas<5000;

-- 8) 5000'den az maas alanlarin, arti Honda calisani olmayanlarin bilgilerini
-- listeleyen bir sorgu yaziniz.

select *
from personel
where maas<5000
union
select *
from personel
where not sirket='Honda';

select isim, maas as maas_sirket
from personel
where maas<5000
union
select isim, sirket
from personel
where sirket!='Honda';

-- 9) Ismi Mehmet Ozturk olanlari ve ek olarak Istanbul'da calismayanlarin isimlerini ve
-- sehirlerini listeleyen sorguyu yaziniz.
select isim,sehir
from personel
where isim='Mehmet Ozturk'
union
select isim,sehir
from personel
where sehir <> 'Istanbul';
















