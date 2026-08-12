# 🚗 Hệ Thống Quản Lý Bán Ô Tô (BTLQuanLyBanOTo)

> **Bài Tập Lớn Môn Lập Trình Trực Quan / Phát Triển Ứng Dụng Desktop**  
> Phần mềm quản lý cửa hàng kinh doanh ô tô toàn diện được phát triển trên nền tảng **C# Windows Forms (WinForms MDI)** và **Microsoft SQL Server**.

---

## 📋 Mục Lục
- [Giới Thiệu](#-giới-thiệu)
- [Công Nghệ Sử Dụng](#-công-nghệ-sử-dụng)
- [Tính Năng Chính](#-tính-năng-chính)
- [Phân Quyền Người Dùng](#-phân-quyền-người-dùng)
- [Cấu Trúc Thư Mục Dự Án](#-cấu-trúc-thư-mục-dự-án)
- [Hướng Dẫn Cài Đặt & Cấu Hình](#-hướng-dẫn-cài-đặt--cấu-hình)
- [Liên Hệ & Đóng Góp](#-liên-hệ--đóng-góp)

---

## 🌟 Giới Thiệu

**BTLQuanLyBanOTo** là giải pháp phần mềm quản lý cửa hàng ô tô giúp tối ưu hóa quy trình nhập hàng, bán hàng, quản lý kho bãi, nhân sự và báo cáo doanh thu. Hệ thống cung cấp giao diện đa văn bản (**MDI - Multi Document Interface**) trực quan, dễ thao tác cùng cơ chế phân quyền bảo mật chặt chẽ theo chức vụ của nhân viên.

---

## 🛠 Công Nghệ Sử Dụng

- **Ngôn ngữ lập trình:** C# (.NET Framework 4.8)
- **Giao diện người dùng:** Windows Forms (WinForms MDI)
- **Cơ sở dữ liệu:** Microsoft SQL Server
- **Kiến trúc dữ liệu:** ADO.NET (Sử dụng lớp xử lý dùng chung `DataProcesser` với `SqlParameter` phòng chống SQL Injection)
- **Công cụ phát triển:** Visual Studio 2019 / 2022

---

## 🚀 Tính Năng Chính

### 1. 🔐 Hệ Thống & Phân Quyền
- **Đăng nhập / Đăng xuất:** Bảo mật truy cập hệ thống.
- **Đăng ký tài khoản:** Khởi tạo tài khoản người dùng mới.
- **Phân quyền linh hoạt:** Tự động mở/khóa chức năng theo vai trò đăng nhập.

### 2. 🗂 Quản Lý Danh Mục
- **Quản lý Sản phẩm (Xe Ô tô):** Cập nhật chi tiết xe (Mã xe, tên xe, hãng sản xuất, loại xe, số chỗ, màu sắc, tình trạng, giá bán, số lượng...).
- **Quản lý Nhân viên:** Thông tin nhân viên, chức vụ, địa chỉ, số điện thoại, ngày sinh.
- **Quản lý Khách hàng:** Lưu trữ thông tin khách hàng mua xe.
- **Quản lý Nhà cung cấp:** Quản lý đối tác cung cấp xe và phụ tùng.
- **Danh mục thuộc tính dùng chung:**
  - Hãng sản xuất, Loại xe, Đời xe, Màu sắc, Nước sản xuất, Số chỗ ngồi, Tình trạng xe, Công việc/Chức vụ.

### 3. 💼 Quản Lý Nghiệp Vụ
- **Quản lý Nhập hàng (Hóa Đơn Nhập):** Lập hóa đơn nhập xe từ Nhà cung cấp, tự động tính tổng tiền và cập nhật số lượng tồn kho.
- **Quản lý Bán hàng (Hóa Đơn Bán):** Lập hóa đơn bán xe cho Khách hàng, tính toán tổng tiền, chiết khấu và tự động giảm số lượng trong kho.

### 4. 📊 Báo Cáo & Thống Kê
- **Báo cáo Doanh thu:** Thống kê doanh số bán hàng theo khoảng thời gian, theo nhân viên hoặc sản phẩm.
- **Báo cáo Tồn kho:** Theo dõi số lượng xe còn tồn trong kho để có kế hoạch nhập/bán phù hợp.

### 5. ❓ Trợ Giúp & Thông Tin
- **Hướng dẫn sử dụng:** Hướng dẫn chi tiết các thao tác trên phần mềm.
- **Thông tin phần mềm:** Giới thiệu phiên bản và tác giả thực hiện.

---

## 👥 Phân Quyền Người Dùng

Hệ thống phân quyền tự động dựa trên **Mã Chức Vụ (`MaCV`)**:

| Mã Chức Vụ | Tên Chức Vụ | Quyền Hạn Hạn Định |
| :--- | :--- | :--- |
| **CV01** | Giám đốc / Admin | **Toàn quyền hệ thống** (Tất cả danh mục, nghiệp vụ, báo cáo & hệ thống). |
| **CV02** | Kế toán | Quyền xem và xuất **Báo cáo Doanh thu** & **Báo cáo Tồn kho**. |
| **CV03** | Nhân viên Bán hàng | Quản lý **Khách hàng**, **Sản phẩm**, **Hóa đơn bán hàng** & **Báo cáo doanh thu**. |
| **CV04** | Thủ kho | Quản lý **Nhà cung cấp**, **Sản phẩm**, **Hóa đơn nhập hàng** & **Báo cáo tồn kho**. |
| **CV05** | NV Kỹ thuật | Cập nhật thông tin **Sản phẩm** và **Các danh mục thuộc tính kỹ thuật xe**. |

---

## 📁 Cấu Trúc Thư Mục Dự Án

```text
BTLQuanLyBanOTo/
├── BTLQuanLyBanOTo.sln                 # File Solution của Visual Studio
└── BTLQuanLyBanOTo/
    ├── App.config                      # File cấu hình ứng dụng & Chuỗi kết nối CSDL
    ├── Program.cs                      # Điểm khởi chạy ứng dụng
    ├── Classes/                        # Các lớp xử lý dữ liệu và tiện ích
    │   ├── DataProcesser.cs            # Lớp kết nối & thực thi query SQL Server
    │   └── Function.cs                 # Tiện ích chung (Hộp thoại xác nhận, v.v.)
    ├── HeThong/                        # Các form giao diện hệ thống
    │   ├── frmDangNhap.cs              # Form Đăng nhập
    │   ├── frmDangKy.cs                # Form Đăng ký
    │   └── frmMain.cs                  # Form chính (MDI Parent & Phân quyền)
    ├── DanhMuc/                        # Form quản lý danh mục chính
    │   ├── frmSanPham.cs               # Quản lý Ô tô
    │   ├── frmNhanVien.cs              # Quản lý Nhân viên
    │   ├── frmKhachHang.cs             # Quản lý Khách hàng
    │   ├── frmNhaCungCap.cs            # Quản lý Nhà cung cấp
    │   └── DanhMucChung/               # Danh mục thuộc tính phụ
    │       ├── frmHangSanXuat.cs
    │       ├── frmLoaiXe.cs
    │       ├── frmDoiXe.cs
    │       ├── frmMauSac.cs
    │       ├── frmNuocSanXuat.cs
    │       ├── frmSoChoNgoi.cs
    │       ├── frmTinhTrang.cs
    │       └── frmCongViec.cs
    ├── NghiepVu/                       # Form xử lý giao dịch
    │   ├── frmBanHang.cs               # Hóa đơn bán xe
    │   └── frmNhapHang.cs              # Hóa đơn nhập xe
    ├── BaoCaoThongKe/                  # Form báo cáo & thống kê
    │   ├── frmBaoCaoDoanhThu.cs        # Thống kê doanh thu
    │   └── frmBaoCaoTonKho.cs          # Thống kê tồn kho
    └── TroGiup/                        # Form trợ giúp & thông tin
        ├── frmHuongDan.cs
        └── frmThongTin.cs
```

---

## 💻 Hướng Dẫn Cài Đặt & Cấu Hình

### 1. Yêu Cầu Tiền Đề
- Hệ điều hành: Windows 10/11.
- **Visual Studio 2019** hoặc **Visual Studio 2022** (có cài đặt workload *.NET desktop development*).
- **.NET Framework 4.8**.
- **Microsoft SQL Server** (phiên bản 2012 trở lên) & **SQL Server Management Studio (SSMS)**.

### 2. Cấu Hình Cơ Sở Dữ Liệu (CSDL)
1. Mở **SQL Server Management Studio (SSMS)**.
2. Tạo cơ sở dữ liệu mới với tên `QuanLyCuaHangOto` (hoặc chạy file script SQL khởi tạo CSDL nếu có).
3. Mở file `App.config` trong dự án và sửa lại chuỗi kết nối `connectionString` tương ứng với Server SQL Server của bạn:

```xml
<connectionStrings>
    <add name="myConnectionString"
         connectionString="Data Source=YOUR_SERVER_NAME;Initial Catalog=QuanLyCuaHangOto;Integrated Security=True"
         providerName="System.Data.SqlClient" />
</connectionStrings>
```

4. Đồng thời, kiểm tra lại chuỗi kết nối mặc định trong file `Classes/DataProcesser.cs` nếu cần:
```csharp
private string connectionString = "Server=YOUR_SERVER_NAME;Database=QuanLyCuaHangOto;Integrated Security=True";
```

### 3. Biên Dịch & Chạy Ứng Dụng
1. Mở file `BTLQuanLyBanOTo.sln` bằng Visual Studio.
2. Nhấn `Ctrl + Shift + B` để Rebuild Solution.
3. Nhấn `F5` hoặc nút **Start** để chạy chương trình.

---

## 📝 Liên Hệ & Đóng Góp

- **Dự án:** Bài Tập Lớn Quản Lý Bán Ô Tô
- **Tác giả:** nvdung250405
- **Repository:** [nvdung250405/BTLQuanLyBanOTo](https://github.com/nvdung250405/BTLQuanLyBanOTo)

---
*Cảm ơn bạn đã xem dự án!* 🚀
