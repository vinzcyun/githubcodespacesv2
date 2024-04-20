#include <iostream>
#include <cstdlib>
#include <unistd.h>

using namespace std;

void runCommand(const char* command) {
    system(command);
}

int main() {
    cout << " " << endl;
    sleep(4);
    cout << "Đang tải lệnh" << endl;
    sleep(2);
    cout << "Đang update hệ thống" << endl;
    sleep(1);
    system("clear");
    runCommand("sudo apt update");
    cout << "Đang tải Speedtest cho Linux" << endl;
    runCommand("sudo apt-get install speedtest-cli");
    cout << "Thành công!" << endl;
    system("clear");
    cout << "Đang tải Bios TianoCore" << endl;
    sleep(1);
    runCommand("wget -O bios64.bin \"https://github.com/BlankOn/ovmf-blobs/raw/master/bios64.bin\"");
    system("clear");
    string iso_link;
    cout << "Nhập liên kết tải file ISO: ";
    cin >> iso_link;
    runCommand(("wget -O link.iso \"" + iso_link + "\"").c_str());
    system("clear");
    cout << "Đang tải Ngrok cho Linux" << endl;
    sleep(1);
    runCommand("wget -O ngrok.tgz \"https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz\"");
    system("clear");
    cout << "Giải nén và cài đặt" << endl;
    runCommand("tar -xf ngrok.tgz");
    runCommand("rm -rf ngrok.tgz");
    system("clear");
    string ngrok_token;
    cout << "Nhập token Ngrok: ";
    cin >> ngrok_token;
    runCommand(("./ngrok authtoken \"" + ngrok_token + "\"").c_str());
    system("clear");
    cout << "Vui lòng chọn khu vực" << endl;
    cout << "us - Hoa Kỳ (Ohio)" << endl;
    cout << "eu - Châu Âu (Frankfurt)" << endl;
    cout << "ap - Đông Nam Á (Singapore)" << endl;
    cout << "au - Úc (Sydney)" << endl;
    cout << "sa - Nam Mỹ (Sao Paulo)" << endl;
    cout << "jp - Nhật Bản (Tokyo)" << endl;
    cout << "in - Ấn Độ (Mumbai)" << endl;
    string khuvuc;
    cout << "Nhập khu vực: ";
    cin >> khuvuc;
    runCommand(("./ngrok tcp --region " + khuvuc + " 5900 &>/dev/null &").c_str());
    system("clear");
    runCommand("sudo apt update");
    runCommand("sudo apt install qemu-kvm -y");
    runCommand("sudo apt install speedtest-cli");
    system("clear");
    string disk_size;
    cout << "Nhập dung lượng ổ đĩa: ";
    cin >> disk_size;
    runCommand(("qemu-img create -f raw win.img \"" + disk_size + "\"").c_str());
    sleep(1);
    cout << "Đã tạo ổ đĩa" << endl;
    cout << "Đang gán lệnh" << endl;
    sleep(1);
    system("clear");
    cout << "Đã tạo VPS thành công!" << endl;
    cout << "Địa chỉ IP của bạn là: " << endl;
    runCommand("curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url\":\"tcp:..([^\\\"]*).*/\\1/p'");
    cout << " " << endl;
    cout << " " << endl;
    cout << "Đang kiểm tra kết nối mạng" << endl;
    runCommand("speedtest-cli");
    cout << " " << endl;
    cout << "VPS sẽ hoạt động được 50h" << endl;
    cout << "________________________________________" << endl;
    cout << "|        Lệnh được viết bởi VinZ.      |" << endl;
    cout << "|______________________________________|" << endl;
    cout << "Hoạt động trên VPS: " << endl;
    runCommand("sudo qemu-system-x86_64 -m 12G -cpu host -boot order=c -drive file=link.iso,media=cdrom -drive file=win.img,format=raw -device usb-ehci,id=usb,bus=pci.0,addr=0x4 -device usb-tablet -vnc :0 -smp cores=4 -device rtl8139,netdev=n0 -netdev user,id=n0 -vga qxl -accel kvm -bios bios64.bin");
    system("clear");
    cout << "-------------- Lỗi ----------------" << endl;
    cout << "Ôi không!" << endl;
    cout << "VPS đã dừng hoạt động " << endl;
    cout << "Xin lỗi vì điều này " << endl;
    cout << "-----------------------------------" << endl;
    cout << "Lệnh được viết bởi VinZ" << endl;
    cout << "github.com/vinzcyun" << endl;
    cout << " " << endl;
    cout << " " << endl;
    system("clear");

    while (true) {
        cout << "Đang cố gắng kết nối lại" << endl;
        sleep(1);
        cout << "Đang xử lý..." << endl;
        sleep(1);
        cout << "Đã kết nối" << endl;
        cout << "Địa chỉ IP truy cập của bạn sẽ vẫn như cũ" << endl;
        runCommand("sudo qemu-system-x86_64 -m 12G -cpu host -boot order=c -drive file=link.iso,media=cdrom -drive file=win.img,format=raw -device usb-ehci,id=usb,bus=pci.0,addr=0x4 -device usb-tablet -vnc :0 -smp cores=4 -device rtl8139,netdev=n0 -netdev user,id=n0 -vga qxl -accel kvm -bios bios64.bin");
        system("clear && sleep 1");
        cout << "Lỗi không mong muốn" << endl;
        sleep(2);
    }

    return 0;
}