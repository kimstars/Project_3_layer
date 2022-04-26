
--drop database QLThuVien
create database QuanLyThuVien
go
use QuanLyThuVien
go

-----
--drop table DOCGIA
create table DOCGIA
(
	MaDocGia nchar(10),
	TenDangNhap nchar(30),
	HoTen nchar(30),
	GioiTinh nchar(5),
	NamSinh datetime,
	DiaChi nchar(100),
	PRIMARY KEY (MaDocGia),
)
--drop table SACH
create table SACH
(
	MaSach nchar(10),
	TenSach nchar(50),
	TacGia nchar(30),
	TheLoai nchar(30),
	NhaXuatBan nchar(50),
	GiaSach int,
	SoLuong int,
	TinhTrang nchar(10),
	PRIMARY KEY (MaSach),
)
--drop table PHIEUMUON
create table PHIEUMUON
(
	MaPhieu nchar(10),
	MaDocGia nchar(10),
	MaSach nchar(10),
	NgayMuon datetime,
	NgayPhaiTra datetime,
	PRIMARY KEY (MaPhieu),
)
alter table PHIEUMUON add TinhTrang int
--drop table PHIEUTRA
create table PHIEUTRA
(
	MaPhieu nchar(10),
	MaDocGia nchar(10),
	MaSach nchar(10),
	NgayTra datetime,
	PRIMARY KEY (MaPhieu),
)

create table ACCOUNT
(
	MaDocGia nchar(10) PRIMARY KEY,
	TenDangNhap nchar(30),
	MatKhau nchar(30),
	Quyen int,
)


alter table PHIEUMUON add
	constraint FK_PHIEUMUON_DOCGIA foreign key (MaDocGia) references DOCGIA (MaDocGia),
	constraint FK_PHIEUMUON_SACH foreign key (MaSach) references SACH (MaSach)

alter table PHIEUTRA add
	constraint FK_PHIEUTRA_DOCGIA foreign key (MaDocGia) references DOCGIA (MaDocGia),
	constraint FK_PHIEUTRA_SACH foreign key (MaSach) references SACH (MaSach)

ALTER TABLE dbo.DOCGIA ADD
	CONSTRAINT FK_DOCGIA_ACCOUNT FOREIGN KEY (MaDocGia) REFERENCES dbo.ACCOUNT(MaDocGia)

insert into ACCOUNT values ('01','nguyendinhdai', '123456', 1)
insert into ACCOUNT values ('02','nguyenngochung', '123456', 1)
insert into ACCOUNT values ('03','duongdinhtuan', '123456', 1)
insert into ACCOUNT values ('04','nguyentruongan', '123456', 1)
insert into ACCOUNT values ('05','buivanduong', '123456', 1)
insert into ACCOUNT values ('06','nguyenthithuyquynh', '123456', 1)
insert into ACCOUNT values ('07','nguyenvankien', '123456', 1)
insert into ACCOUNT values ('08','nguyenquockhanh', '123456', 1)
insert into ACCOUNT values ('09','huynhvanta', '123456', 1)
insert into ACCOUNT values ('10','leanhthang', '123456', 1)
insert into ACCOUNT values ('11','nguyendinhviet', '123456', 1)
insert into ACCOUNT values ('12','lethilinh', '123456', 1)
insert into ACCOUNT values ('13','daoanhtu', '123456', 1)
insert into ACCOUNT values ('14','dinhvietduc', '123456', 1)
insert into ACCOUNT values ('15','nguyenvanquyet', '123456', 1)
insert into ACCOUNT values ('16','nguyendinhha', '123456', 1)
insert into ACCOUNT values ('17','phamtronglinh', '123456', 1)
insert into ACCOUNT values ('18','nguyennga', '123456', 1)
insert into ACCOUNT values ('19','nguyenquocnhan', '123456', 1)
insert into ACCOUNT values ('20','nguyenquynh', '123456', 1)
insert into ACCOUNT values ('21','hovan', '123456', 1)
insert into ACCOUNT values ('22','nguyenthuy', '123456', 1)
insert into ACCOUNT values ('99','dai', '1', 0)
insert into ACCOUNT values ('100','admin', 'admin', 0)
----
insert into DOCGIA values ('01','nguyendinhdai',N'Nguyễn Đình Đại', N'Nam', 1999,N'236 Hoàng Quốc Việt')
insert into DOCGIA values ('02','duongdinhtuan', N'Dương Đình Tuấn',N'Nam', 1999, N'236 Hoàng Quốc Việt')
insert into DOCGIA values ('03','daoanhtu', N'Đào Anh Tú', N'Nam', 1999, N'236 Hoàng Quốc Việt')
insert into DOCGIA values ('04','nguyenngochung', N'Nguyễn Ngọc Hưng', N'Nam', 1999, N'236 Hoàng Quốc Việt')
insert into DOCGIA values ('05','nguyentruongan',N'Nguyễn Trường An', N'Nam',1999,N'236 Hoàng Quốc Việt')
insert into DOCGIA values ('06','nguyenthithuyquynh', N'Nguyễn Thị Thuý Quỳnh', N'Nữ',1999, N'236 Hoàng Quốc Việt')
insert into DOCGIA values ('07','lethiphuong', N'Lê Thị Phượng', N'Nữ', 1999, N'236 Hoàng Quốc Việt')
insert into DOCGIA values ('08','buivanduong', N'Bùi Văn Dương', N'Nam',1999,N'236 Hoàng Quốc Việt')
insert into DOCGIA values ('09','dauthilien', N'Đậu Thị Liên', N'Nữ', 1999, N'236 Hoàng Quốc Việt')
insert into DOCGIA values ('10','dinhvietduc', N'Đinh Viết Đức', N'Nam', 1999, N'236 Hoàng Quốc Việt')
insert into DOCGIA values ('11','nguyencongphuong', N'Nguyễn Công Phượng','Nam', 1999, N'236 Hoàng Quốc Việt')
insert into DOCGIA values ('12','huynhvanta', N'Huỳnh Văn Tá', 'Nam', 1999, N'236 Hoàng Quốc Việt')
insert into DOCGIA values ('13','phamtronglinh', N'Phạm Trọng Linh', 'Nam', 1999, N'236 Hoàng Quốc Việt')
insert into DOCGIA values ('14','leanhthang',N'Lê Anh Thắng', 'Nam', 1999, N'236 Hoàng Quốc Việt')
insert into DOCGIA values ('15','nguyenanhdung',N'Nguyễn Anh Dũng', 'Nam', 1999, N'236 Hoàng Quốc Việt')
insert into DOCGIA values ('16','nguyendinhha',N'Nguyễn Đình Hà', 'Nam', 1999, N'236 Hoàng Quốc Việt')
insert into DOCGIA values ('17','levantu',N'Lê Văn Tú', 'Nam', 1999, N'236 Hoàng Quốc Việt')
insert into DOCGIA values ('18','duongducanh',N'Dương Đức Anh', 'Nam', 1999, N'236 Hoàng Quốc Việt')
insert into DOCGIA values ('19','nguyenthuy',N'Nguyễn Thuỳ', 'Nữ', 1999, N'236 Hoàng Quốc Việt')
insert into DOCGIA values ('20','thaibatuyen',N'Thái Bá Tuyên', 'Nam', 1999, N'236 Hoàng Quốc Việt')
insert into DOCGIA values ('21','nguyennga',N'Nguyễn Nga', 'Nữ', 1999, N'236 Hoàng Quốc Việt')
insert into DOCGIA values ('22','nguyenquocnhan',N'Nguyễn Quốc Nhân', 'Nam', 1999, N'236 Hoàng Quốc Việt')
----
insert into SACH values ('01', N'Mạng máy tính', N'Lê Huy Trường', N'Mạng máy tính', 'HANU', 35000, 15, N'Còn')
insert into SACH values ('02', N'Cấu trúc dữ liệu và giải thuật', N'Đỗ Xuân Lôi', N'Lập trình', 'HANU', 45000, 10, N'Còn')
insert into SACH values ('03', N'Ngữ pháp Tiếng Anh', N'Đặng Đình Thiện', N'Ngoại ngữ', 'STU', 75000, 25, N'Còn')
insert into SACH values ('04', N'Tiếng Anh chuyên ngành Công nghệ thông tin', N'Thạc Bình Cường', N'Ngoại ngữ', 'STU', 70000, 0, N'Hết')
insert into SACH values ('05', N'Công nghệ phần mềm', N'Lê Đức Trung', N'Lập trình', 'HUST', 42000, 20, N'Còn')
insert into SACH values ('06', N'Những người khốn khổ', N'Victor Hugo', N'Văn học', 'VH', 70000, 10, N'Còn')
insert into SACH values ('07', N'Bố Già', N'Mario Puzo', N'Văn học', 'STU', 70000, 15, N'Còn')
insert into SACH values ('08', N'Chiến tranh và hòa bình', N'Lev Tolstoy', N'Văn học', 'STU', 70000, 13, N'Còn')
insert into SACH values ('09', N'Giết con chim nhại', N'Harper Lee', N'Văn học', 'STU', 170000, 0, N'Hết')
insert into SACH values ('10', N'Tuổi thơ dữ dội', N'Phùng Quán', N'Văn học', 'STU', 100000, 20, N'Còn')
insert into SACH values ('11', N'Truyện Kiều', N'Nguyễn Du', N'Văn học', 'STU', 70000, 10, N'Còn')
insert into SACH values ('12', N'Lều chõng', N'Ngô Tất Tố', N'Văn học', 'STU', 50000, 0, N'Hết')
insert into SACH values ('13', N'Sử Việt - 12 khúc tráng ca', N'Dũng Phan', N'Lịch sử', 'STU', 45000, 10, N'Còn')
insert into SACH values ('14', N'Lịch sử Việt Nam', N'Đào Duy Anh', N'Lịch sử', 'STU', 150000, 14, N'Còn')
insert into SACH values ('15', N'Lập trình hướng đối tượng', N'Phạm Anh Tuấn', N'Lập trình', 'STU', 85000, 0, N'Hết')
insert into SACH values ('16', N'Người của Đảng', N'Trọng Tấn', N'Chính trị', 'HANU', 40000, 25, N'Còn')
insert into SACH values ('17', N'Hành trình về phương Đông', N'Lập Diện', N'Phiêu lưu', 'STU', 100000, 20, N'Còn')
insert into SACH values ('18', N'Lý thuyết Hệ điều hành', N'Tô Duy Đô', N'Máy tính', 'STU', 75000, 35, N'Còn')
insert into SACH values ('19', N'Tiếng Anh giao tiếp', N'Dương Hường', N'Ngoại ngữ', 'STU', 70000, 0, N'Hết')
insert into SACH values ('20', N'Người cô đơn', N'Dương Đình Đình', N'Tâm lý', 'HUST', 100000, 30, N'Còn')
insert into SACH values ('21', N'Kẻ tình si', N'Su đô cay', N'Tâm lý', 'VH', 75000, 50, N'Còn')
insert into SACH values ('22', N'Tình trong biển đảo', N'Dương Nguyễn Tuyết', N'Tâm lý', 'STU', 75000, 25, N'Còn')
insert into SACH values ('23', N'Nam tước bóng đêm', N'Kudo Yusaku', N'Trinh thám', 'EDO', 125000, 0, N'Hết')
insert into SACH values ('24', N'Nghệ sĩ tử thần', N'Khada Jhin', N'Kinh dị', 'MAS', 75000, 25, N'Còn')
insert into SACH values ('25', N'Bóng ma kỵ sỹ', N'Hecarrim Masliss', N'Kinh dị', 'MAS', 175000, 10, N'Còn')
insert into SACH values ('26', N'Bậc thầy wusu', N'Master Yi', N'Võ thuật', 'STU', 75000, 0, N'Hết')
insert into SACH values ('27', N'Thầy tu mù', N'Lý Tiểu Sin', N'Võ thuật', 'VH', 65000, 50, N'Còn')
insert into SACH values ('28', N'Hoàng đế sa mạc', N'Azir Kadomasha', N'Hư cấu', 'STU', 135000, 45, N'Còn')
insert into SACH values ('29', N'Kẻ săn mồi cô đơn và kiêu hãnh', N'Rengar Khazix', N'Hư cấu', 'VH', 175000, 0, N'Hết')
insert into SACH values ('30', N'Nghệ thuật rolling', N'Dương Đình Tuấn', N'Khoa học', 'LOL', 117000, 0, N'Hết')
insert into SACH values ('31', N'Quỷ kiếm Darkin', N'Kisma Aatroxx', N'Kinh dị', 'LOL', 75000, 10, N'Còn')
insert into SACH values ('32', N'Ác long thượng giới', N'Aurelion Sol', N'Viễn tưởng', 'STU', 85000, 25, N'Còn')
insert into SACH values ('33', N'Nhà thông thái sa mạc', N'Bruno Nasus', N'Phiêu lưu', 'EDO', 225000, 0, N'Hết')
insert into SACH values ('34', N'Kẻ bất dung thứ', N'Kháo Daxua', N'Võ thuật', 'MAS', 15000, 25, N'Còn')
insert into SACH values ('35', N'Kẻ dẫn dắt linh hồn', N'Yorrick Nobal', N'Kinh dị', 'SHA', 75000, 10, N'Còn')
insert into SACH values ('36', N'Cai ngục siềng xích', N'Thresh Yosino', N'Kinh dị', 'STU', 375000, 0, N'Hết')
insert into SACH values ('37', N'Ác mộng vĩnh cửu', N'Noctune Sondang', N'Kinh dị', 'VH', 365000, 50, N'Còn')
insert into SACH values ('38', N'Quà của kẻ chết đuối', N'Pyke', N'Kinh dị', 'STU', 135000, 25, N'Còn')
insert into SACH values ('39', N'Định mệnh vẫy gọi', N'Kalistar Chama', N'Thám hiểm', 'VH', 175000, 0, N'Hết')
insert into SACH values ('40', N'Hầm ngục hàn băng', N'Senjuany', N'Phiêu lưu', 'LOL', 175000, 0, N'Hết')



---
insert into PHIEUMUON values ('01','01','01','1/5/2020', '1/6/2020',1)
insert into PHIEUMUON values ('02','02','01','8/5/2020', '8/6/2020',1)
insert into PHIEUMUON values ('03','02','02','10/5/2020', '10/6/2020',1)
insert into PHIEUMUON values ('04','08','07', '3/9/2020', '3/10/2020',1)
insert into PHIEUMUON values ('05','07','06', '12/9/2020', '12/10/2020',1)
insert into PHIEUMUON values ('06','09','03', '5/9/2020', '5/10/2020',1)
insert into PHIEUMUON values ('07','06','08', '6/9/2020', '6/10/2020',1)
insert into PHIEUMUON values ('08','05','09', '2/10/2020', '2/11/2020',1)
insert into PHIEUMUON values ('09','03','05', '10/10/2020', '10/11/2020',1)
insert into PHIEUMUON values ('10','04','04', '5/11/2020', '5/12/2020',0)
insert into PHIEUMUON values ('11','01','08', '6/11/2020', '6/12/2020',0)
insert into PHIEUMUON values ('12','04','03', '6/11/2020', '6/12/2020',0)
insert into PHIEUMUON values ('13','09','02', '7/11/2020', '7/12/2020',0)
insert into PHIEUMUON values ('14','07','04', '7/11/2020', '7/12/2020',0)
insert into PHIEUMUON values ('15','03','07', '7/11/2020', '7/12/2020',0)
insert into PHIEUMUON values ('16','10','08', '8/11/2020', '8/12/2020',0)

---
insert into PHIEUTRA values ('01','01','01','5/5/2020')
insert into PHIEUTRA values ('02','02','01','10/5/2020')
insert into PHIEUTRA values ('03','02','02','6/6/2020')
insert into PHIEUTRA values ('04','08','07', '9/9/2020')
insert into PHIEUTRA values ('05','07','06', '12/9/2020')
insert into PHIEUTRA values ('06','09','03', '2/10/2020')
insert into PHIEUTRA values ('07','06','08', '10/9/2020')
insert into PHIEUTRA values ('08','05','09', '1/11/2020')
insert into PHIEUTRA values ('09','03','05', '5/11/2020')

---
