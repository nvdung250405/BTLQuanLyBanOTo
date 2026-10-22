# 🚗 Hệ Thống Quản Lý Bán Ô Tô (BTLQuanLyBanOTo)

> **Bài Tập Lớn Môn Lập Trình Trực Quan / Phát Triển Ứng Dụng Desktop**  
> Phần mềm quản lý cửa hàng kinh doanh ô tô toàn diện được phát triển trên nền tảng **C# Windows Forms (WinForms MDI)** và **Microsoft SQL Server**.

---

## 📋 Mục Lục
- [Giới Thiệu](#-giới-thiệu)
- [Công Nghệ Sử Dụng](#-công-nghệ-sử-dụng)
- [Tính Năng Chính](#-tính-năng-chính)
- [Phân Quyền & Tài Khoản Mẫu](#-phân-quyền--tài-khoản-mẫu)
- [Cấu Trúc Thư Mục Dự Án](#-cấu-trúc-thư-mục-dự-án)
- [Hướng Dẫn Cài Đặt & Chạy Dự Án](#-hướng-dẫn-cài-đặt--chạy-dự-án)
  - [1. Khởi Tạo Cơ Sở Dữ Liệu](#1-khởi-tạo-cơ-sở-dữ-liệu-csdl)
  - [2. Cấu Hình Chuỗi Kết Nối](#2-cấu-hình-chuỗi-kết-nối-appconfig)
  - [3. Khởi Chạy Ứng Dụng (Visual Studio / VS Code / Terminal)](#3-khởi-chạy-ứng-dụng)
- [Liên Hệ & Đóng Góp](#-liên-hệ--đóng-góp)

---

## 🌟 Giới Thiệu

**BTLQuanLyBanOTo** là giải pháp phần mềm quản lý cửa hàng ô tô giúp tối ưu hóa quy trình nhập hàng, bán hàng, quản lý kho bãi, nhân sự và báo cáo doanh thu. Hệ thống cung cấp giao diện đa văn bản (**MDI - Multi Document Interface**) trực quan, dễ thao tác cùng cơ chế phân quyền bảo mật chặt chẽ theo chức vụ của nhân viên.

---

## 🛠 Công Nghệ Sử Dụng

- **Ngôn ngữ lập trình:** C# (.NET Framework 4.8, SDK-style tương thích cả .NET SDK hiện đại và Visual Studio)
- **Giao diện người dùng:** Windows Forms (WinForms MDI)
- **Cơ sở dữ liệu:** Microsoft SQL Server (2012 / 2016 / 2019 / 2022 hoặc Docker SQL Server)
- **Kiến trúc dữ liệu:** ADO.NET với lớp xử lý tập trung `DataProcesser`, tự động đồng bộ chuỗi kết nối qua `App.config` và sử dụng `SqlParameter` phòng chống SQL Injection
- **Xuất báo cáo:** `Microsoft.Office.Interop.Excel` (Xuất báo cáo doanh thu, tồn kho và in hóa đơn sang Excel)
- **Môi trường phát triển:** Visual Studio 2019 / 2022 (VS tím), Visual Studio Code, .NET CLI

---

## 🚀 Tính Năng Chính

### 1. 🔐 Hệ Thống & Phân Quyền
- **Đăng nhập / Đăng xuất:** Bảo mật truy cập hệ thống.
- **Đăng ký tài khoản:** Khởi tạo tài khoản nhân viên mới.
- **Phân quyền linh hoạt:** Tự động mở/khóa menu chức năng theo vai trò của người dùng.

### 2. 🗂 Quản Lý Danh Mục
- **Quản lý Sản phẩm (Xe Ô tô):** Cập nhật chi tiết xe (Mã xe, tên xe, hãng sản xuất, loại xe, số chỗ, màu sắc, tình trạng, giá nhập, giá bán, thời gian bảo hành, hình ảnh xe, số lượng...).
- **Quản lý Nhân viên:** Thông tin nhân viên, chức vụ, địa chỉ, số điện thoại, ngày sinh, trạng thái hoạt động.
- **Quản lý Khách hàng:** Lưu trữ thông tin khách hàng mua xe.
- **Quản lý Nhà cung cấp:** Quản lý đối tác cung cấp xe và thiết bị.
- **Danh mục thuộc tính kỹ thuật xe:**
  - Hãng sản xuất, Thể loại xe, Đời xe, Màu sắc, Nước sản xuất, Số chỗ ngồi, Tình trạng xe, Công việc/Chức vụ.

### 3. 💼 Quản Lý Nghiệp Vụ
- **Quản lý Nhập hàng (Hóa Đơn Nhập):** Lập hóa đơn nhập xe từ Nhà cung cấp, tự động tính tổng tiền, chiết khấu và tự động cộng tăng số lượng tồn kho theo giao dịch (Transaction).
- **Quản lý Bán hàng (Hóa Đơn Bán):** Lập hóa đơn bán xe cho Khách hàng, tính tiền thuế, chiết khấu, đặt cọc và tự động trừ số lượng xe trong kho.
- **Xuất / In Hóa Đơn Excel:** Định dạng bảng tính chuyên nghiệp, tự động căn chỉnh và lưu trữ.

### 4. 📊 Báo Cáo & Thống Kê
- **Báo cáo Doanh thu:** Thống kê doanh số bán hàng linh hoạt theo Ngày/Tháng/Năm, theo Nhân viên hoặc Khách hàng, hỗ trợ trực quan hóa bằng biểu đồ cột.
- **Báo cáo Tồn kho:** Thống kê lượng xe nhập và tồn bãi theo khoảng thời gian hoặc theo Nhà cung cấp, hỗ trợ xuất Excel và biểu đồ phân tích.

### 5. ❓ Trợ Giúp & Thông Tin
- **Hướng dẫn sử dụng:** Hướng dẫn các thao tác cơ bản trên phần mềm.
- **Thông tin phần mềm:** Giới thiệu nhóm tác giả và phiên bản dự án.

---

## 👥 Phân Quyền & Tài Khoản Mẫu

Cơ chế phân quyền được xác định tự động dựa trên **Mã Chức Vụ (`MaCV`)**. CSDL đã được nạp sẵn 5 tài khoản mẫu tương ứng 5 phân quyền:

> 🔑 **Mật khẩu mặc định cho tất cả các tài khoản là:** `123`

| Tên Đăng Nhập | Tên Nhân Viên | Mã Chức Vụ | Chức Vụ | Quyền Hạn Trong Ứng Dụng |
| :---: | :--- | :---: | :--- | :--- |
| **`NV01`** | Nguyễn Văn Dũng | **CV01** | Giám đốc / Admin | **Toàn quyền hệ thống:** Mở tất cả danh mục, nghiệp vụ nhập/bán, báo cáo thống kê và quản lý tài khoản. |
| **`NV02`** | Trần Thị Mai | **CV02** | Kế toán | Quyền xem và xuất **Báo cáo Doanh thu**, **Báo cáo Tồn kho** & biểu đồ. |
| **`NV03`** | Lê Hoàng Nam | **CV03** | Nhân viên Bán hàng | Quản lý **Khách hàng**, **Sản phẩm**, lập **Hóa đơn bán hàng** & xem báo cáo doanh thu. |
| **`NV04`** | Phạm Văn Khoa | **CV04** | Thủ kho | Quản lý **Nhà cung cấp**, **Sản phẩm**, lập **Hóa đơn nhập hàng** & xem báo cáo tồn kho. |
| **`NV05`** | Vũ Đức Thắng | **CV05** | Kỹ thuật viên | Cập nhật thông số kỹ thuật xe: **Hãng xe, Loại xe, Màu sắc, Đời xe, Số chỗ, Tình trạng**. |

---

## 📁 Cấu Trúc Thư Mục Dự Án

```text
BTLQuanLyBanOTo/
├── BTLQuanLyBanOTo.sln                 # File Solution chính của dự án
├── QuanLyCuaHangOto.sql                # Script CSDL đầy đủ bảng, khóa ngoại & dữ liệu mẫu
├── README.md                           # Tài liệu hướng dẫn sử dụng
└── BTLQuanLyBanOTo/
    ├── App.config                      # File cấu hình ứng dụng & Chuỗi kết nối CSDL duy nhất
    ├── BTLQuanLyBanOTo.csproj          # File cấu hình project (.NET Framework 4.8 SDK-style)
    ├── Program.cs                      # Điểm khởi chạy ứng dụng
    ├── Classes/                        # Các lớp xử lý dữ liệu và tiện ích
    │   ├── DataProcesser.cs            # Lớp kết nối, thực thi query & quản lý ConnectionString
    │   └── Function.cs                 # Tiện ích chung (Hộp thoại xác nhận, v.v.)
    ├── Images/                         # Tài nguyên hình ảnh, biểu tượng & ảnh xe mẫu
    │   ├── Icons/                      # Icon giao diện phần mềm
    │   ├── HinhNen/                    # Ảnh nền đăng nhập & form chính
    │   └── Oto/                        # Ảnh sản phẩm ô tô
    ├── HeThong/                        # Form chức năng hệ thống
    │   ├── frmDangNhap.cs              # Đăng nhập hệ thống
    │   ├── frmDangKy.cs                # Đăng ký tài khoản nhân viên
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
    │   ├── frmBanHang.cs               # Hóa đơn bán xe & xuất Excel
    │   └── frmNhapHang.cs              # Hóa đơn nhập xe & xuất Excel
    ├── BaoCaoThongKe/                  # Form báo cáo & biểu đồ
    │   ├── frmBaoCaoDoanhThu.cs        # Thống kê doanh thu & Chart
    │   └── frmBaoCaoTonKho.cs          # Thống kê tồn kho & Chart
    └── TroGiup/                        # Form trợ giúp & thông tin
        ├── frmHuongDan.cs
        └── frmThongTin.cs
```

---

## 💻 Hướng Dẫn Cài Đặt & Chạy Dự Án

### 1. Khởi Tạo Cơ Sở Dữ Liệu (CSDL)

Dự án đã có sẵn file script khởi tạo CSDL hoàn chỉnh: [QuanLyCuaHangOto.sql](file:///d:/WorkSpace/VSCode/c%23/BTLQuanLyBanOTo/QuanLyCuaHangOto.sql).

#### Cách thực hiện qua SQL Server Management Studio (SSMS):
1. Mở **SQL Server Management Studio (SSMS)** và kết nối vào SQL Server trên máy bạn.
2. Mở file [QuanLyCuaHangOto.sql](file:///d:/WorkSpace/VSCode/c%23/BTLQuanLyBanOTo/QuanLyCuaHangOto.sql) bằng SSMS (hoặc kéo thả file vào SSMS).
3. Nhấn phím **`F5`** (hoặc nút **Execute**).  
   *Script sẽ tự động tạo cơ sở dữ liệu `QuanLyCuaHangOto`, 16 bảng liên kết toàn vẹn và nạp sẵn toàn bộ dữ liệu mẫu để bạn chạy thử nghiệm ngay.*

*(Nếu sử dụng Docker SQL Server, bạn chỉ cần chạy lệnh `sqlcmd` để import file `QuanLyCuaHangOto.sql`).*

---

### 2. Cấu Hình Chuỗi Kết Nối (`App.config`)

Mở file [BTLQuanLyBanOTo/App.config](file:///d:/WorkSpace/VSCode/c%23/BTLQuanLyBanOTo/BTLQuanLyBanOTo/App.config) để kiểm tra:

```xml
<connectionStrings>
    <!-- Kết nối SQL Server cục bộ qua Windows Authentication (Mặc định) -->
    <add name="myConnectionString"
         connectionString="Data Source=.;Initial Catalog=QuanLyCuaHangOto;Integrated Security=True"
         providerName="System.Data.SqlClient" />
</connectionStrings>
```

> **Ghi chú:**
> - Giá trị `Data Source=.` đại diện cho SQL Server mặc định trên máy cục bộ. Nếu bạn dùng SQL Server có đặt tên instance riêng (ví dụ `.\SQLEXPRESS`), hãy đổi `Data Source=.\SQLEXPRESS`.
> - Nếu sử dụng tài khoản `sa` (ví dụ trên Docker), đổi sang:  
>   `Data Source=localhost,1433;Initial Catalog=QuanLyCuaHangOto;User Id=sa;Password=YourPassword;TrustServerCertificate=True;`
> - Toàn bộ mã nguồn đã được đồng bộ để tự động đọc chuỗi kết nối từ `App.config`, bạn **không cần phải sửa thêm bất kỳ file code C# nào**.

---

### 3. Khởi Chạy Ứng Dụng

Bạn có thể chạy dự án bằng một trong các cách sau:

#### Cách 1: Chạy bằng Visual Studio (VS tím - Khuyến nghị)
1. Mở file [BTLQuanLyBanOTo.sln](file:///d:/WorkSpace/VSCode/c%23/BTLQuanLyBanOTo/BTLQuanLyBanOTo.sln) bằng **Visual Studio 2019** hoặc **Visual Studio 2022**.
2. Nhấn phím **`F5`** (hoặc nút **Start** trên thanh công cụ) để biên dịch và chạy chương trình.

#### Cách 2: Chạy trực tiếp từ VS Code / Terminal
Mở Terminal tại thư mục gốc dự án và chạy:
```powershell
dotnet run --project BTLQuanLyBanOTo
```

#### Cách 3: Chạy trực tiếp file thực thi (.exe)
Sau khi build xong, file `.exe` nằm tại đường dẫn:
```text
BTLQuanLyBanOTo\bin\Debug\net48\BTLQuanLyBanOTo.exe
```
Bạn chỉ cần click đúp vào file để mở phần mềm.

---

## 📝 Liên Hệ & Đóng Góp

- **Dự án:** Bài Tập Lớn Quản Lý Bán Ô Tô
- **Tác giả:** nvdung250405
- **Repository:** [nvdung250405/BTLQuanLyBanOTo](https://github.com/nvdung250405/BTLQuanLyBanOTo)

---
*Chúc bạn có trải nghiệm tốt khi sử dụng và đánh giá dự án!* 🚀
