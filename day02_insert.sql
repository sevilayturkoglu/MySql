use sys;
/*========================================
               VERI GIRISI
========================================*/
-- INSERT INTO + tablo adi + VALUES + (std_id CHAR(4),std_name VARCHAR(25),std_age int)
-- Degerleri girerken dikkat edilmesi gereken Tabloyu 
-- olustururken degerleri atadigimiz veri cinsinden olmasi
-- String ifadeleri tek tirnak icinde yaziyoruz.
-- Date data tipi de String gibi tek tirnak icine yazilir,
-- ayrica MySQL 'in default tarih formati YYYY-MM-DD seklindedir.
/*******************************************************
-> Bir field'a kaydedilecek verileri UNIQUE yapmak icin 
 table olustururken field isminin yanina UNIQUE yaziyoruz.
-> Bir field'a kaydedilecek verilerde null olmasin istiyorsak 
table olustururken field isminin yanina NOT NULL yaziyoruz.
*********************************************************/

-- Fen Lisesi ogrencilerinin okul no , isim , derece, adres ve
-- son degisiklik tarihi field'lari olan tablosunu hazirlayalim.
-- okul no field'i UNIQUE olmali, isim field'i da bos birakilmasin.

create table fen_lisesi(
okul_no int unique,
isim varchar(25)not null,
derece double,
adress varchar (50),
son_degisiklik_tarihi date
);

select * from fen_lisesi;

insert into fen_lisesi values(101,'Mehmet Dag',4.5,'Ankara','2023-01-20');
insert into fen_lisesi values(102,'Berrin Hanim',4.6,'Istanbul','2023-01-18');
insert into fen_lisesi values(103,'Mehmet Erden',3.9,'Izmir','2023-01-16');
insert into fen_lisesi values(104,'Sinan Bey',4.7,'Istanbul','2023-01-19');
insert into fen_lisesi values(105,'Esra Turker',4.9,'Ankara','2023-01-21');
INSERT INTO fen_lisesi VALUES (106, 'Gulhayat Guder', 4.3, 'Izmir','2023-01-18');
INSERT INTO fen_lisesi VALUES (107, 'Berivan Gencdal', 4.3, 'Istanbul','2023-01-18');
INSERT INTO fen_lisesi VALUES (108, 'Berivan Gencdal',  null, null, null);
INSERT INTO fen_lisesi VALUES (null, 'Berivan Gencdal',  null,  null, null);
INSERT INTO fen_lisesi VALUES (null, 'Berivan Gencdal', null,  null, null);
INSERT INTO fen_lisesi (isim,adress) values('Abdullah Ak','Izmir');
INSERT INTO fen_lisesi (okul_no,adress) values(109,'Izmir');-- bunu kabul etmez cunki isim bos birakilamaz 
INSERT INTO fen_lisesi (okul_no,isim,adress) values(109,'Yucel Bey','Izmir');
insert into fen_lisesi(isim,derece) values('Sevinc Karacan',4.9);
select * from fen_lisesi;
-- UNIQUE olarak belirledigimiz bir field'a istedigimiz kadar NULL deger kaydedebiliriz
-- ancak data tipi String ise hiclik ifadesini sadece 1 kere kaydeder,
-- diger kayitlarda duplicate hatasi verir.
-- stringın default degerı null oldugu ıcınmı hocam


/* ----------------------------------------------
Q1 : okul_no , isim , adres, derece fieldlari olan 
anadolu lisesi table olusturun. okul_no CHAR ve UNIQUE, 
isim NOT NULL olacak
------------------------------------------------- */

create table anadolu_lisesi(
okul_no char(4)unique,
isim varchar(25)not null,
adres varchar(10),
derece double
);
select * from anadolu_lisesi;
INSERT INTO anadolu_lisesi VALUES ('101','Ayse Nuriye','Istanbul',4.7);
INSERT INTO anadolu_lisesi VALUES ('102','Zafer Bey','Ankara',4.6);
INSERT INTO anadolu_lisesi VALUES ('103','Furkan Veli Inal','Istanbul',3.9);
INSERT INTO anadolu_lisesi VALUES ('104','Humeyra Uysal','Izmir',4.8);
INSERT INTO anadolu_lisesi VALUES ('105','Mehmet Harun','Istanbul',3.8);
INSERT INTO anadolu_lisesi VALUES ('106','Berivan Gencdal','Izmir',4.8);
INSERT INTO anadolu_lisesi VALUES ('107','Ilyas Bey','Istanbul',3.8);
INSERT INTO anadolu_lisesi VALUES ('108','Neo Bey','Istanbul',3.8);
insert into anadolu_lisesi (isim,adres) values('Kemal Herat','Ankara');




