use sys;

/* ====================================== UPDATE ========================================
Tabloda varolan herhangi bir record'a ait verinin degistirilmesi icin kullanilir.
-----Syntax-----
UPDATE table_name
SET field1=''
WHERE condition;

UPDATE islemlerini yapabilmesi icin safe modunun kapali olmasi gerekir,yoksa ayarlardan sql editorun en altindan acin,kutucuk isaretli olmasin
 go to Edit -> Preferences -> SQL Editor, and uncheck "Safe Updates" check box
========================================================================================*/
/*--------------------------------------------------------------------------------------
1) Bir firmalar tablosu olusturun icinde id,
isim ve iletisim_isim field'lari olsun. 
Id ve isim'i beraber Primary Key yapin.
---------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------
2) Icine 3 kayit ekleyin :
(1, 'ACB', 'Ali Can'), 
(2, 'RDB', 'Veli Gul'), 
(3, 'KMN', 'Ayse Gulmez').
---------------------------------------------------------------------------------------*/

 create table firmalar
 (
 id int,
 isim varchar(20),
 iletisim_isim varchar (20),
 constraint firmalarin_pk primary key(id,isim)
 );
 insert into firmalar values
 (1, 'ACB', 'Ali Can'), 
(2, 'RDB', 'Veli Gul'), 
(3, 'KMN', 'Ayse Gulmez');

select * from firmalar ;

-- id si 3 olan firmanin ismini 'KRM' olarak guncellefirmalarkelimeler

update firmalar
set isim='KRM'
where id=3;

 select * from firmalar ;
 
 -- Iletisim ismi Veli Gul olan firmanin id'sini 4, ismini FDS olarak guncelleyiniz.
 
 -- ******** 1.YOL**************
 update firmalar
set id=4
where iletisim_isim='Veli Gul';

 update firmalar
set isim='FSD'
where iletisim_isim='Veli Gul';
 
 select * from firmalar ;
 
 -- *************2 YOL********************
 
update firmalar
set id=4,isim='FSD'
where iletisim_isim='Veli Gul';

 select * from firmalar ;
 
 -- Ismi ACB olan firmanin iletisim ismini 'Osman Can' olarak guncelleyiniz.
 update firmalar
set iletisim_isim='Osman Can'
where isim='ACB';
 
 update firmalar
set iletisim_isim='Ayse Can'
where iletisim_isim='Osman Can';
 
 select *
 from kelimeler
 where regexp_like (kelime,'^.[O][a-z]$','c');
 
 
 
 