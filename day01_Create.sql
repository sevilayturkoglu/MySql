-- yorum satiri
/*
yorum
paragrafi
ornegi
*/
use sys;
/*========================================
    TABLO OLUSTURMA 1 (CRUD - Create)
========================================*/
-- id, isim, not ortalamasi, adres ve son degistirme tarihi
-- fieldlari iceren bir ogrenciler table'i olusturunuz

create table ogrenciler(
id char(4),
isim varchar(25),
not_ortalamasi double,
adres varchar(100),
son_degistirme_tarihi date
);

drop table ogrenciler; -- tabloyu tamamen siler
select * from ogrenciler;
/*------------------------------------------------------------
Q1: "tedarikciler" isminde bir tablo olusturun.
   "tedarikci_id", "tedarikci_ismi", "tedarikci_adres" ve 
   "ulasim_tarihi" field'lari olsun.
-------------------------------------------------------------*/

create table tedarikciler(
tedarikci_id char(4),
tedarikci_ismi varchar(30),
tedarikci_adres varchar(100),
ulasim_tarihi date
);

/*========================================
    VAROLAN TABLODAN TABLO OLUSTURMA  
========================================
------------------Syntax------------------
CREATE TABLE table_name
AS
SELECT field1,field2
FROM other_table_name
========================================*/
-- ogrenciler1 tablosundan "isim" ve "not_ortalamasi" field'larini
-- alarak ogrenci_derece isimli yeni bir tablo olusturun.

create table ogrenci_derece
as
select isim,not_ortalamasi
from ogrenciler;

select * from ogrenci_derece;


/*--------------------------------------------------------
Q2: "tedarikciler" table'indan "tedarikci_ismi" ve
 "ulasim_tarihi" field'lari olan "tedarikciler_son" 
 isimli yeni bir table olusturun.
---------------------------------------------------------*/

create table tedarikciler_son
as 
select ulasim_tarihi,tedarikci_ismi
from tedarikciler;
select * from tedarikciler_son;


















