
/*==================================SELECT-WHERE=============================================
Verileri SELECT komutu ile veritabanindan cekerken filtreleme yapmak icin : 
 
SELECT ile birlikte WHERE komutu kullanilabilir.
-----Syntax----- :
SELECT field1, field2 
FROM tablo_adi 
WHERE kosul;
-- SELECT -- hangi sutunlari(field) getirsin
-- FROM -- hangi tablodan(table) getirsin
-- WHERE -- hangi satirlari(record) getirsin
=========================================================================================*/
use sys;

CREATE TABLE meslek_lisesi (
okul_no CHAR(4) UNIQUE,
isim VARCHAR(50) NOT NULL,
derece DOUBLE,
adres VARCHAR(100),
son_degisiklik_tarihi DATE
);
SELECT * FROM meslek_lisesi;
INSERT INTO meslek_lisesi VALUES('1001','Fatih Oz', 89,'Ankara', '2022-11-23');      
INSERT INTO meslek_lisesi VALUES('1002','Fatih Yildiz', 94,'Istanbul', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1003','Bora Sverige', 78,'Izmir', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1004','Nevzat Celik', 69,'Ankara', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1005','Gursel Unal', 90,'Istanbul', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1006','Soner Karatasoglu ', 85,'Istanbul', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1007','Talha Kurt', 75,'Ankara', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1008','Yakup Lejon', 79,'Izmir', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1009','Ilhan Gurbetci', 80,'Izmir', '2022-11-23');

-- derecesi 90 dan buyuk olan kisilerin tum bilgilerini getiriniz
select *
from meslek_lisesi
where derece>90;

-- Q2 : Derecesi 80'den kucuk olan ogrencilerin isimlerini listeleyin.

select isim
from meslek_lisesi
where derece<80;

-- Q3 : Adresi Ankara olan ogrencilerin isim ve derece bilgilerini listeleyin.

select isim,derece
from meslek_lisesi
where adres='Ankara';

-- Q4 : okul_no'su 1005 olan ogrencinin isim ve adres bilgisini listeleyin.
select isim,adres
from meslek_lisesi
where okul_no='1005';

-- derecesi 70 80 arasi olan ogrencilerin sehirlerini ve okulnosunu aliniz
select adres,okul_no,derece
from meslek_lisesi
where derece>70 and derece<80;

-- *************************************************************************
CREATE TABLE ogretmen_lisesi(
id int,
isim VARCHAR(45),
adres VARCHAR(100),
sinav_notu DOUBLE
);
INSERT INTO ogretmen_lisesi VALUES (111, 'Emine Yucel', 'Ankara', 75);
INSERT INTO ogretmen_lisesi VALUES (112, 'Muhammet Talha Kurt', 'Istanbul', 85);
INSERT INTO ogretmen_lisesi VALUES (113, 'Ilhan Sahin', 'Ankara', 70);
INSERT INTO ogretmen_lisesi VALUES (114, 'Kadir Corumlu', 'Corum', 90);
INSERT INTO ogretmen_lisesi VALUES (115, 'Selman Kasabali', 'Ankara',70);
INSERT INTO ogretmen_lisesi VALUES (116, 'Murat Aycicek', 'Izmir', 85);
INSERT INTO ogretmen_lisesi VALUES (117, 'Tugba Ozsoy', 'Bolu', 85);
SELECT * FROM ogretmen_lisesi;
/*-------------------------------------------------------------------------
Q1: Sinav notu 80'den buyuk olan ogrencilerin tum bilgilerini listeleyin.
---------------------------------------------------------------------------*/
select *
from ogretmen_lisesi
where sinav_notu>80;

-- Q2:adresi Ankara olanlarin isim ve adresini getir
select isim,adres
from ogretmen_lisesi
where adres='Ankara';

-- Q3: id si 114 olan kisinin tum bilgilerini al
select *
from ogretmen_lisesi
where id=114;


/*================================== SELECT-BETWEEN =============================================
BETWEEN iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla 
yazabilme imkani verir, yazdigimiz iki sinirda araliga dahildir.
-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name 
BETWEEN deger1 AND deger2;

=========================================================================================*/
/*==========================AND (ve) Operatoru kullanimi==================================
=> And ile belirtilen sartlarin tamami gerceklesiyorsa o kayit listelenir,
Sartlardan bir tanesi bile tutmazsa listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50 AND sinav2 < 50
Bu ornekte hem sinav1 hem de sinav2 field'i 50'den kucuk olan kayitlar listelenecektir.

/*==========================OR (veya) Operatoru kullanimi==================================
=> Or ile belirtilen sartlardan en az biri gerceklesiyorsa o kayit listelenir,
sartlardan hicbiri gerceklesmiyorsa o kayit listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50 OR sinav2 < 50
Bu ornekte sinav1 veya sinav2 field'i 50'den kucuk olan kayitlar listelenecektir.
=========================================================================================*/

/*-------------------------------------------------------------------------
Q4: Sinav notu 70'ten buyuk 80'den kucuk olan ogrencilerin tum bilgilerini listeleyin.
---------------------------------------------------------------------------*/
use sys;

-- 1.yol------------
select *
from ogretmen_lisesi
where sinav_notu >=70 and sinav_notu<= 80;

-- 2.yol------------
select *
from ogretmen_lisesi
where sinav_notu 
between 70 and 80;

-- Listeden Muhammet Talha Kurt ile Murat arasinda bulunan kisileri seciniz
select *
from ogretmen_lisesi
where isim
between 'Muhammet Talha Kurt' and 'Murat';


-- NOT : String ifadeleri BETWEEN komutu ile kiyaslamak istedigimizde bize
-- sonucu ASCII degerlerine gore siralayarak gonderir.
/*-------------------------------------------------------------------------
Q6: Ankara ile Corum arasinda olan ogrencilerin isimlerini listeleyin.
---------------------------------------------------------------------------*/

select isim,adres
from ogretmen_lisesi
where adres
between 'Ankara' and 'Corum';

-- **************************************************************
CREATE TABLE personel(
id char(5),
isim varchar(50),
maas int
);
INSERT INTO personel values('10001','Ahmet Aslan',7000);
INSERT INTO personel values('10002','Mehmet Yilmaz',12000);
INSERT INTO personel values('10003','Meryem',7215);
INSERT INTO personel values('10004','Veli Han',5000);
INSERT INTO personel values('10005','Mustafa Ali',5500);
INSERT INTO personel values('10006','Ayse Can',5600);
INSERT INTO personel values('10010','Ayse',4700);
INSERT INTO personel values('10009','Ayse Cemile',4000);
INSERT INTO personel values('10008','Ayse Cano',4300);
INSERT INTO personel values('10007','Can Ayse',7700);
INSERT INTO personel values('10011','Yeliz Alina',12700);
SELECT * FROM personel;
/*-------------------------------------------------------------------------
Q7: id'si 10005 ile 10009 arasinda olan personelin bilgilerini listele
---------------------------------------------------------------------------*/

-- Q8:
select *
from personel
where id
between '10005' and '10009';

-- Q9:
select *
from personel
where isim
between 'Mehmet Yilmaz' and 'Veli';


select *
from personel
where isim
between 'Ahmet' and 'Ayse Cano';

/*-------------------------------------------------------------------------
Q10: Maasi 7000 ya da ismi Ayse olan personel id'lerini listeleyin
---------------------------------------------------------------------------*/

select id
from personel
where maas=7000 or isim='Ayse';

/*-------------------------------------------------------------------------
Q11: Id'si 10001, 10005 ya da 10008 olan personel isimlerini listeleyin
---------------------------------------------------------------------------*/
-- 1.yol
select isim
from personel
where id='10001' or id='10005' or id='10008';

-- 2.yol
select isim
from personel
where id 
in(10001,10005,10008);

/*================================== SELECT-IN ===========================================
IN birden fazla mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla yazabilme
imkani verir. IN icerisine yazacagimiz sartlar ayni field'a ait olmali.
-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name IN (deger1,deger2,...);
=========================================================================================*/

/*-------------------------------------------------------------------------
Q12: Id'si 10001, 10005 ya da 10008 olan personel isimlerini listeleyin
---------------------------------------------------------------------------*/
select isim
from personel
where id
in('10001','10005','10008');

/*-------------------------------------------------------------------------
Q13: Maasi sadece 7000 veya 12000 olan personelin bilgilerini listele
---------------------------------------------------------------------------*/

select isim
from personel
where maas
in('7000','12000');


select isim-- bak neden olmuyor cunki boyle bir sytax yok
from personel
where maas
between  7000 or 12000;

-- SELECT * FROM matematik WHERE sinav1 < 50 OR sinav2 < 50
/*================================== SELECT-LIKE =============================================
LIKE keyword sorgulama yaparken belirli patternleri kullanabilmemize olanak saglar.
-----Syntax-----
 SELECT field1,field2,...
 FROM table_name
 WHERE field LIKE pattern
 
 ----------------
 Pattern icin :
 % ---> 0 veya daha fazla karakteri belirtir
 _ ---> Tek bir karakteri temsil eder.
=========================================================================================*/
/*-------------------------------------------------------------------------
Q14: Ismi A ile baslayan personeli listeleyiniz
---------------------------------------------------------------------------*/

select *
from personel
where isim like 'a%';

/*-------------------------------------------------------------------------
Q15: Isminde Ayse olan personelin isimlerini listeleyiniz
---------------------------------------------------------------------------*/

select *
from personel
where isim like '%ayse%';


/*-------------------------------------------------------------------------
Q16: Ismi n harfi ile biten personeli listeleyiniz
---------------------------------------------------------------------------*/
select *
from personel
where isim like '%n';

/*-------------------------------------------------------------------------
Q17: Isminin 2. harfi e olan personeli listeleyiniz
---------------------------------------------------------------------------*/
select *
from personel
where isim like '_e%';

/*-------------------------------------------------------------------------
Q18: Isminin 2. harfi e olup diger harflerinde y olan personeli listeleyiniz
---------------------------------------------------------------------------*/

select *
from personel
where isim like '_e%' and isim like '%y%';


/*-------------------------------------------------------------------------
Q19: Isminde  e harfi olmayan personeli listeleyiniz
---------------------------------------------------------------------------*/

select *
from personel
where isim  not like '%e%';

/*-------------------------------------------------------------------------
Q20: Maasi 5 haneli olan personeli listeleyiniz
---------------------------------------------------------------------------*/

select *
from personel
where maas  like '_____';

/*-------------------------------------------------------------------------
Q21: 1. harfi a ve 7. harfi a olan personeli listeleyiniz
---------------------------------------------------------------------------*/
select *
from personel
where isim like 'a_____a%';





