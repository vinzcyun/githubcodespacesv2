<div align="left">
<a href="/README_EN.md">English</a> &nbsp;|&nbsp;
<a href="/README.md">Tiếng Việt</a>
</div>


# Tạo VPS bằng Github Codespace

## Giới thiệu

GitHub Codespaces là một dịch vụ của GitHub cho phép bạn phát triển trực tuyến trên môi trường phát triển được tạo tự động. Điều này giúp giảm tải công việc cài đặt môi trường phát triển trên máy cục bộ và mang lại trải nghiệm phát triển mạnh mẽ và linh hoạt.

## Cài đặt

1. Truy cập [GitHub Codespaces](https://github.com/features/codespaces) trên trình duyệt web của bạn.

2. Tạo một tài khoản để sử dụng

3. Tạo một repo mới từ trang [GitHub](https://github.com) chính thức

4. Nhập cấu hình máy ảo Docker để tạo Codespace.

5. Codespace sẽ được tạo trên repo bạn đang làm việc.

## Cài đặt thông qua Terminal

```
sudo su
wget -O install.sh https://raw.githubusercontent.com/vinzcyun/githubcodespacesv2/main/install.sh
chmod +x install.sh
./install.sh
```

## Cách khởi động lại VPS khi Codespaces dừng hoạt động

### Cách khởi động

Bạn có thể khởi động lại VPS bằng cách [Truy cập vào đây](https://github.com/codespaces) Chọn repo mà bạn đã tạo VPS và ấn vào Open in => Open in browser

### Đoạn lệnh để khởi động

Truy cập vào Terminal của Codespace và dán đoạn lệnh này vào


```
sudo su
wget -O restart.sh https://raw.githubusercontent.com/vinzcyun/githubcodespacesv2/main/restart.sh
chmod +x restart.sh
./restart.sh
```
Sau đó chờ khoảng 30s để hệ thống chạy

Sau khoảng thời gian đó bạn có thể truy cập vào VNC để dùng VPS

## Tính năng

Speedtest được tốc độ mạng của môi trường ảo

Giao diện đã trở nên dễ nhìn hơn

Tương thích với các file iso từ Linux, Ubuntu, CentOS đến Windows ( Windows 11 có thể bị lỗi do chính sách bảo mật của Microsoft về chip bảo mật TPM 2.0, bạn nên sử dụng các phiên bản Windows như ReviOS 11 hoặc Tiny 11 để đảm bảo trải nghiệm tốt nhất )

## Lưu ý nhỏ

Vì chính sách của GitHub nên Codespaces chỉ có thể hoạt động không quá 50h ( có thể gia hạn thêm bằng gói đăng ký của Github ).

Một số lỗi có thể phát sinh trong quá trình cài đặt như: file iso bị lỗi hoặc bị dính xác thực Captcha, AuthToken Ngrok có thể đã hết hạn, nhập cấu hình quá cao so với tiêu chuẩn.

Lạm dụng có thể khiến tài khoản bị gắn cờ dẫn đến khoá tài khoản.



