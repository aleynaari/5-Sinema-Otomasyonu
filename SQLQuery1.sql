--******Kullanýcý*****
create proc KEkle
@KullaniciAd varchar(50),
@Sifre varchar(50),
@AdSoyad varchar(50),
@Gorev varchar(50),
@SubeNo int
as begin
insert into Kullanici (KullaniciAd,Sifre,AdSoyad,Gorev,SubeNo)
	values (@KullaniciAd,@Sifre,@AdSoyad,@Gorev,@SubeNo)
end

create proc Giris (
@kadi varchar(50),
@sifre varchar(50)
)
as begin 
select * from Kullanici where 
	KullaniciAd = @kadi and Sifre = @sifre
end

create proc KListele
as begin
select * from Kullanici
end

create proc KYenile 
@KullaniciNo int,
@KullaniciAd varchar(50),
@Sifre varchar(50),
@AdSoyad varchar(50),
@Gorev nchar(10),
@SubeNo int
as begin 
update Kullanici set
	KullaniciAd = @KullaniciAd, Sifre = @Sifre, AdSoyad = @AdSoyad, Gorev = @Gorev, SubeNo = @SubeNo where KullaniciNo = @KullaniciNo
end

create proc KSil
@KullaniciNo int
as begin
delete from Kullanici where KullaniciNo = @KullaniciNo
end

create proc KAra 
@KullaniciAd varchar(50)
as begin 
select * from Kullanici where KullaniciAd = @KullaniciAd
end


--******Film*****
create proc FListele
as begin 
select * from Film
end

create proc FEkle
@Ad varchar(50),
@Tur varchar(50),
@Sure int,
@Ucret money,
@Puan int,
@VizyonTarihi datetime
as begin 
insert into Film (Ad,Tur,Sure,Ucret,Puan,VizyonTarihi)
	values (@Ad,@Tur,@Sure,@Ucret,@Puan,@VizyonTarihi)
end

create proc FYenile 
@FilmNo int,
@Ad varchar(50),
@Tur varchar(50),
@Sure int,
@Ucret money,
@Puan int,
@VizyonTarihi datetime
as begin 
update Film set
	Ad = @Ad, Tur = @Tur, Sure = @Sure, Ucret = @Ucret, Puan = @Puan, VizyonTarihi = @VizyonTarihi where FilmNo = @FilmNo
end

create proc FSil
@FilmNo int
as begin
delete from Film where FilmNo = @FilmNo
end

create proc FAra 
@Ad varchar(50)
as begin 
select * from Film where Ad = @Ad
end

--******Salon*****
create proc SListele
as begin 
select * from Salon
end

alter proc SEkle
@SalonAd varchar(50),
@KoltukSayisi int
as begin 
insert into Salon(SalonAd,KoltukSayisi)
	values (@SalonAd,@KoltukSayisi)
end

alter proc SYenile 
@SalonNo int,
@SalonAd varchar(50),
@KoltukSayisi int
as begin 
update Salon set
	SalonAd = @SalonAd, KoltukSayisi = @KoltukSayisi
	where SalonNo = @SalonNo
end

create proc SSil
@SalonNo int
as begin
delete from Salon where SalonNo = @SalonNo
end

create proc SAra 
@SalonAd varchar(50)
as begin 
select * from Salon where SalonAd = @SalonAd
end

--******Sube*****
create proc SubeListele
as begin 
select * from Sube
end

create proc SubeEkle
@Ad varchar(50),
@SalonSayisi int,
@CalisanSayisi int
as begin 
insert into Sube(Ad,SalonSayisi,CalisanSayisi)
	values (@Ad,@SalonSayisi,@CalisanSayisi)
end

create proc SubeYenile 
@SubeNo int,
@Ad varchar(50),
@SalonSayisi int,
@CalisanSayisi int
as begin 
update Sube set
	Ad = @Ad, SalonSayisi = @SalonSayisi,  CalisanSayisi = @CalisanSayisi
	where SubeNo = @SubeNo
end

create proc SubeSil
@SubeNo int
as begin
delete from Sube where SubeNo = @SubeNo
end

create proc SubeAra 
@Ad varchar(50)
as begin 
select * from Sube where Ad = @Ad
end
