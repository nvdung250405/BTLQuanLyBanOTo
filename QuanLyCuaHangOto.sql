-- =================================================================================
-- SCRIPT KHỞI TẠO CƠ SỞ DỮ LIỆU: BÀI TẬP LỚN QUẢN LÝ BÁN Ô TÔ (QuanLyCuaHangOto)
-- Nền tảng: Microsoft SQL Server 2012 / 2014 / 2016 / 2019 / 2022
-- =================================================================================

USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'QuanLyCuaHangOto')
BEGIN
    CREATE DATABASE QuanLyCuaHangOto;
END
GO

USE QuanLyCuaHangOto;
GO

-- =================================================================================
-- 1. BẢNG DANH MỤC THUỘC TÍNH PHỤ & CHỨC VỤ
-- =================================================================================

-- 1.1. Bảng Chức Vụ / Công Việc
IF OBJECT_ID('dbo.CongViec', 'U') IS NULL
BEGIN
    CREATE TABLE CongViec (
        MaCV NVARCHAR(50) NOT NULL PRIMARY KEY,
        TenCV NVARCHAR(100) NOT NULL,
        LuongThang DECIMAL(18, 2) DEFAULT 0,
        TrangThai INT DEFAULT 1
    );
END
GO

-- 1.2. Bảng Hãng Sản Xuất
IF OBJECT_ID('dbo.HangSX', 'U') IS NULL
BEGIN
    CREATE TABLE HangSX (
        MaHangSX NVARCHAR(50) NOT NULL PRIMARY KEY,
        TenHangSX NVARCHAR(100) NOT NULL,
        TrangThai INT DEFAULT 1
    );
END
GO

-- 1.3. Bảng Loại Xe
IF OBJECT_ID('dbo.TheLoai', 'U') IS NULL
BEGIN
    CREATE TABLE TheLoai (
        MaLoai NVARCHAR(50) NOT NULL PRIMARY KEY,
        TenLoai NVARCHAR(100) NOT NULL,
        TrangThai INT DEFAULT 1
    );
END
GO

-- 1.4. Bảng Màu Sắc
IF OBJECT_ID('dbo.MauSac', 'U') IS NULL
BEGIN
    CREATE TABLE MauSac (
        MaMau NVARCHAR(50) NOT NULL PRIMARY KEY,
        TenMau NVARCHAR(100) NOT NULL,
        TrangThai INT DEFAULT 1
    );
END
GO

-- 1.5. Bảng Nước Sản Xuất
IF OBJECT_ID('dbo.NuocSX', 'U') IS NULL
BEGIN
    CREATE TABLE NuocSX (
        MaNuocSX NVARCHAR(50) NOT NULL PRIMARY KEY,
        TenNuocSX NVARCHAR(100) NOT NULL,
        TrangThai INT DEFAULT 1
    );
END
GO

-- 1.6. Bảng Đời Xe
IF OBJECT_ID('dbo.DoiXe', 'U') IS NULL
BEGIN
    CREATE TABLE DoiXe (
        MaDoi NVARCHAR(50) NOT NULL PRIMARY KEY,
        TenDoi NVARCHAR(100) NOT NULL,
        TrangThai INT DEFAULT 1
    );
END
GO

-- 1.7. Bảng Số Chỗ Ngồi
IF OBJECT_ID('dbo.SoChoNgoi', 'U') IS NULL
BEGIN
    CREATE TABLE SoChoNgoi (
        MaSoCho NVARCHAR(50) NOT NULL PRIMARY KEY,
        TenSoCho NVARCHAR(100) NOT NULL,
        TrangThai INT DEFAULT 1
    );
END
GO

-- 1.8. Bảng Tình Trạng Xe
IF OBJECT_ID('dbo.TinhTrang', 'U') IS NULL
BEGIN
    CREATE TABLE TinhTrang (
        MaTinhTrang NVARCHAR(50) NOT NULL PRIMARY KEY,
        TenTinhTrang NVARCHAR(100) NOT NULL,
        TrangThai INT DEFAULT 1
    );
END
GO

-- =================================================================================
-- 2. BẢNG ĐỐI TƯỢNG CHÍNH (Nhân viên, Khách hàng, Nhà cung cấp, Sản phẩm)
-- =================================================================================

-- 2.1. Bảng Nhân Viên
IF OBJECT_ID('dbo.NhanVien', 'U') IS NULL
BEGIN
    CREATE TABLE NhanVien (
        MaNV NVARCHAR(50) NOT NULL PRIMARY KEY,
        TenNV NVARCHAR(100) NOT NULL,
        GioiTinh NVARCHAR(10) DEFAULT N'Nam',
        NgaySinh DATETIME NULL,
        DienThoai NVARCHAR(20) NULL,
        DiaChi NVARCHAR(255) NULL,
        MaCV NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES CongViec(MaCV),
        MatKhau NVARCHAR(100) NOT NULL,
        TrangThai INT DEFAULT 1
    );
END
GO

-- 2.2. Bảng Khách Hàng
IF OBJECT_ID('dbo.KhachHang', 'U') IS NULL
BEGIN
    CREATE TABLE KhachHang (
        MaKhach NVARCHAR(50) NOT NULL PRIMARY KEY,
        TenKhach NVARCHAR(100) NOT NULL,
        DiaChi NVARCHAR(255) NULL,
        DienThoai NVARCHAR(20) NULL,
        TrangThai INT DEFAULT 1
    );
END
GO

-- 2.3. Bảng Nhà Cung Cấp
IF OBJECT_ID('dbo.NhaCungCap', 'U') IS NULL
BEGIN
    CREATE TABLE NhaCungCap (
        MaNCC NVARCHAR(50) NOT NULL PRIMARY KEY,
        TenNCC NVARCHAR(100) NOT NULL,
        DiaChi NVARCHAR(255) NULL,
        DienThoai NVARCHAR(20) NULL,
        TrangThai INT DEFAULT 1
    );
END
GO

-- 2.4. Bảng Danh Mục Sản Phẩm (Ô tô)
IF OBJECT_ID('dbo.DanhMucHang', 'U') IS NULL
BEGIN
    CREATE TABLE DanhMucHang (
        MaHang NVARCHAR(50) NOT NULL PRIMARY KEY,
        TenHang NVARCHAR(150) NOT NULL,
        SoLuong INT DEFAULT 0,
        DonGiaNhap DECIMAL(18, 2) DEFAULT 0,
        DonGiaBan DECIMAL(18, 2) DEFAULT 0,
        ThoiGianBaoHanh NVARCHAR(50) NULL,
        Anh NVARCHAR(255) NULL,
        MaLoai NVARCHAR(50) FOREIGN KEY REFERENCES TheLoai(MaLoai),
        MaHangSX NVARCHAR(50) FOREIGN KEY REFERENCES HangSX(MaHangSX),
        MaMau NVARCHAR(50) FOREIGN KEY REFERENCES MauSac(MaMau),
        MaDoi NVARCHAR(50) FOREIGN KEY REFERENCES DoiXe(MaDoi),
        MaSoCho NVARCHAR(50) FOREIGN KEY REFERENCES SoChoNgoi(MaSoCho),
        MaNuocSX NVARCHAR(50) FOREIGN KEY REFERENCES NuocSX(MaNuocSX),
        MaTinhTrang NVARCHAR(50) FOREIGN KEY REFERENCES TinhTrang(MaTinhTrang),
        TrangThai INT DEFAULT 1
    );
END
GO

-- =================================================================================
-- 3. BẢNG NGHIỆP VỤ (Hóa đơn nhập, Hóa đơn bán / Đơn đặt hàng & Chi tiết)
-- =================================================================================

-- 3.1. Bảng Hóa Đơn Nhập
IF OBJECT_ID('dbo.HoaDonNhap', 'U') IS NULL
BEGIN
    CREATE TABLE HoaDonNhap (
        SoHDN NVARCHAR(50) NOT NULL PRIMARY KEY,
        MaNV NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES NhanVien(MaNV),
        MaNCC NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES NhaCungCap(MaNCC),
        NgayNhap DATETIME DEFAULT GETDATE(),
        TongTien DECIMAL(18, 2) DEFAULT 0,
        TrangThai INT DEFAULT 0
    );
END
GO

-- 3.2. Bảng Chi Tiết Hóa Đơn Nhập
IF OBJECT_ID('dbo.ChiTietHoaDonNhap', 'U') IS NULL
BEGIN
    CREATE TABLE ChiTietHoaDonNhap (
        SoHDN NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES HoaDonNhap(SoHDN) ON DELETE CASCADE,
        MaHang NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES DanhMucHang(MaHang),
        SoLuong INT DEFAULT 1,
        DonGia DECIMAL(18, 2) DEFAULT 0,
        GiamGia FLOAT DEFAULT 0,
        ThanhTien DECIMAL(18, 2) DEFAULT 0,
        PRIMARY KEY (SoHDN, MaHang)
    );
END
GO

-- 3.3. Bảng Đơn Đặt Hàng (Hóa đơn bán)
IF OBJECT_ID('dbo.DonDatHang', 'U') IS NULL
BEGIN
    CREATE TABLE DonDatHang (
        SoDDH NVARCHAR(50) NOT NULL PRIMARY KEY,
        MaNV NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES NhanVien(MaNV),
        MaKhach NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES KhachHang(MaKhach),
        NgayDat DATETIME DEFAULT GETDATE(),
        NgayGiao DATETIME DEFAULT GETDATE(),
        DatCoc DECIMAL(18, 2) DEFAULT 0,
        Thue FLOAT DEFAULT 0,
        TongTien DECIMAL(18, 2) DEFAULT 0,
        TrangThai INT DEFAULT 0
    );
END
GO

-- 3.4. Bảng Chi Tiết Đơn Đặt Hàng
IF OBJECT_ID('dbo.ChiTietDonDatHang', 'U') IS NULL
BEGIN
    CREATE TABLE ChiTietDonDatHang (
        SoDDH NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES DonDatHang(SoDDH) ON DELETE CASCADE,
        MaHang NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES DanhMucHang(MaHang),
        SoLuong INT DEFAULT 1,
        GiamGia FLOAT DEFAULT 0,
        ThanhTien DECIMAL(18, 2) DEFAULT 0,
        PRIMARY KEY (SoDDH, MaHang)
    );
END
GO

-- =================================================================================
-- 4. DỮ LIỆU KHỞI TẠO MẪU (DÙNG ĐỂ CHẠY TEST TẤT CẢ CÁC FORM & CHỨC NĂNG)
-- =================================================================================

-- 4.1. Chức Vụ (Phân quyền CV01 -> CV05)
IF NOT EXISTS (SELECT * FROM CongViec WHERE MaCV = 'CV01')
    INSERT INTO CongViec(MaCV, TenCV, LuongThang, TrangThai) VALUES
    ('CV01', N'Giám đốc / Admin', 50000000, 1),
    ('CV02', N'Kế toán', 20000000, 1),
    ('CV03', N'Nhân viên bán hàng', 15000000, 1),
    ('CV04', N'Thủ kho', 12000000, 1),
    ('CV05', N'Nhân viên kỹ thuật', 14000000, 1);
GO

-- 4.2. Nhân Viên Mẫu (Mật khẩu tất cả tài khoản là: 123)
IF NOT EXISTS (SELECT * FROM NhanVien WHERE MaNV = 'NV01')
    INSERT INTO NhanVien(MaNV, TenNV, GioiTinh, NgaySinh, DienThoai, DiaChi, MaCV, MatKhau, TrangThai) VALUES
    ('NV01', N'Nguyễn Văn Dũng', N'Nam', '2000-01-15', '0912345678', N'Hà Nội', 'CV01', '123', 1),
    ('NV02', N'Trần Thị Mai', N'Nữ', '1998-05-20', '0987654321', N'Hải Phòng', 'CV02', '123', 1),
    ('NV03', N'Lê Hoàng Nam', N'Nam', '1995-10-12', '0933112233', N'Đà Nẵng', 'CV03', '123', 1),
    ('NV04', N'Phạm Văn Khoa', N'Nam', '1997-08-08', '0944556677', N'Cần Thơ', 'CV04', '123', 1),
    ('NV05', N'Vũ Đức Thắng', N'Nam', '1999-03-25', '0966778899', N'TP. Hồ Chí Minh', 'CV05', '123', 1);
GO

-- 4.3. Hãng Sản Xuất
IF NOT EXISTS (SELECT * FROM HangSX WHERE MaHangSX = 'HSX01')
    INSERT INTO HangSX(MaHangSX, TenHangSX, TrangThai) VALUES
    ('HSX01', N'Toyota', 1),
    ('HSX02', N'Honda', 1),
    ('HSX03', N'Mercedes-Benz', 1),
    ('HSX04', N'Porsche', 1),
    ('HSX05', N'Hyundai', 1);
GO

-- 4.4. Thể Loại Xe
IF NOT EXISTS (SELECT * FROM TheLoai WHERE MaLoai = 'LX01')
    INSERT INTO TheLoai(MaLoai, TenLoai, TrangThai) VALUES
    ('LX01', N'Sedan', 1),
    ('LX02', N'SUV', 1),
    ('LX03', N'Crossover', 1),
    ('LX04', N'Hatchback', 1),
    ('LX05', N'Bán tải', 1);
GO

-- 4.5. Màu Sắc
IF NOT EXISTS (SELECT * FROM MauSac WHERE MaMau = 'MS01')
    INSERT INTO MauSac(MaMau, TenMau, TrangThai) VALUES
    ('MS01', N'Đen', 1),
    ('MS02', N'Trắng', 1),
    ('MS03', N'Đỏ', 1),
    ('MS04', N'Bạc', 1),
    ('MS05', N'Xanh dương', 1);
GO

-- 4.6. Nước Sản Xuất
IF NOT EXISTS (SELECT * FROM NuocSX WHERE MaNuocSX = 'NSX01')
    INSERT INTO NuocSX(MaNuocSX, TenNuocSX, TrangThai) VALUES
    ('NSX01', N'Nhật Bản', 1),
    ('NSX02', N'Đức', 1),
    ('NSX03', N'Hàn Quốc', 1),
    ('NSX04', N'Mỹ', 1),
    ('NSX05', N'Việt Nam', 1);
GO

-- 4.7. Đời Xe
IF NOT EXISTS (SELECT * FROM DoiXe WHERE MaDoi = 'DX01')
    INSERT INTO DoiXe(MaDoi, TenDoi, TrangThai) VALUES
    ('DX01', N'2022', 1),
    ('DX02', N'2023', 1),
    ('DX03', N'2024', 1),
    ('DX04', N'2025', 1);
GO

-- 4.8. Số Chỗ Ngồi
IF NOT EXISTS (SELECT * FROM SoChoNgoi WHERE MaSoCho = 'SCN01')
    INSERT INTO SoChoNgoi(MaSoCho, TenSoCho, TrangThai) VALUES
    ('SCN01', N'4 chỗ', 1),
    ('SCN02', N'5 chỗ', 1),
    ('SCN03', N'7 chỗ', 1),
    ('SCN04', N'8 chỗ', 1);
GO

-- 4.9. Tình Trạng
IF NOT EXISTS (SELECT * FROM TinhTrang WHERE MaTinhTrang = 'TT01')
    INSERT INTO TinhTrang(MaTinhTrang, TenTinhTrang, TrangThai) VALUES
    ('TT01', N'Mới 100%', 1),
    ('TT02', N'Xe lướt 99%', 1),
    ('TT03', N'Đã qua sử dụng', 1);
GO

-- 4.10. Khách Hàng
IF NOT EXISTS (SELECT * FROM KhachHang WHERE MaKhach = 'KH01')
    INSERT INTO KhachHang(MaKhach, TenKhach, DiaChi, DienThoai, TrangThai) VALUES
    ('KH01', N'Nguyễn Thị Thu Hà', N'Cầu Giấy, Hà Nội', '0988112233', 1),
    ('KH02', N'Trần Đình Trọng', N'Ngô Quyền, Hải Phòng', '0977223344', 1),
    ('KH03', N'Lê Minh Quân', N'Hải Châu, Đà Nẵng', '0966334455', 1);
GO

-- 4.11. Nhà Cung Cấp
IF NOT EXISTS (SELECT * FROM NhaCungCap WHERE MaNCC = 'NCC01')
    INSERT INTO NhaCungCap(MaNCC, TenNCC, DiaChi, DienThoai, TrangThai) VALUES
    ('NCC01', N'Công ty Cổ phần Ô tô Á Châu', N'Long Biên, Hà Nội', '0243888999', 1),
    ('NCC02', N'Tập đoàn Phân phối Quốc tế Sài Gòn', N'Quận 1, TP.HCM', '0283777888', 1),
    ('NCC03', N'Nhà máy Sản xuất Ô tô Việt Nhật', N'Yên Phong, Bắc Ninh', '0222666777', 1);
GO

-- 4.12. Danh Mục Sản Phẩm (Ô tô)
IF NOT EXISTS (SELECT * FROM DanhMucHang WHERE MaHang = 'SP0001')
    INSERT INTO DanhMucHang(MaHang, TenHang, SoLuong, DonGiaNhap, DonGiaBan, ThoiGianBaoHanh, Anh, MaLoai, MaHangSX, MaMau, MaDoi, MaSoCho, MaNuocSX, MaTinhTrang, TrangThai) VALUES
    ('SP0001', N'Porsche 911 Carrera', 5, 6000000000, 7500000000, N'36 tháng', N'porsche.jpg', 'LX01', 'HSX04', 'MS01', 'DX03', 'SCN01', 'NSX02', 'TT01', 1),
    ('SP0002', N'Toyota Camry 2.5Q', 10, 1100000000, 1400000000, N'36 tháng', N'', 'LX01', 'HSX01', 'MS02', 'DX03', 'SCN02', 'NSX01', 'TT01', 1),
    ('SP0003', N'Mercedes-Benz GLC 300 4MATIC', 8, 2200000000, 2800000000, N'36 tháng', N'', 'LX02', 'HSX03', 'MS01', 'DX03', 'SCN02', 'NSX02', 'TT01', 1),
    ('SP0004', N'Honda CR-V L', 15, 900000000, 1150000000, N'36 tháng', N'', 'LX03', 'HSX02', 'MS03', 'DX02', 'SCN03', 'NSX01', 'TT01', 1),
    ('SP0005', N'Hyundai SantaFe Cao Cấp', 12, 1050000000, 1350000000, N'36 tháng', N'', 'LX02', 'HSX05', 'MS04', 'DX03', 'SCN03', 'NSX03', 'TT01', 1);
GO

-- 4.13. Hóa Đơn Nhập & Chi Tiết
IF NOT EXISTS (SELECT * FROM HoaDonNhap WHERE SoHDN = 'HDN0001')
BEGIN
    INSERT INTO HoaDonNhap(SoHDN, MaNV, MaNCC, NgayNhap, TongTien, TrangThai)
    VALUES ('HDN0001', 'NV04', 'NCC01', DATEADD(DAY, -10, GETDATE()), 30000000000, 0);

    INSERT INTO ChiTietHoaDonNhap(SoHDN, MaHang, SoLuong, DonGia, GiamGia, ThanhTien)
    VALUES ('HDN0001', 'SP0001', 5, 6000000000, 0, 30000000000);
END
GO

-- 4.14. Đơn Đặt Hàng & Chi Tiết
IF NOT EXISTS (SELECT * FROM DonDatHang WHERE SoDDH = 'DDH0001')
BEGIN
    INSERT INTO DonDatHang(SoDDH, MaNV, MaKhach, NgayDat, NgayGiao, DatCoc, Thue, TongTien, TrangThai)
    VALUES ('DDH0001', 'NV03', 'KH01', DATEADD(DAY, -3, GETDATE()), GETDATE(), 500000000, 10, 8250000000, 0);

    INSERT INTO ChiTietDonDatHang(SoDDH, MaHang, SoLuong, GiamGia, ThanhTien)
    VALUES ('DDH0001', 'SP0001', 1, 0, 7500000000);
END
GO

PRINT N'Khởi tạo Cơ sở dữ liệu QuanLyCuaHangOto hoàn tất thành công!';
GO
