import java.util.Scanner
import kotlin.concurrent.thread
import java.io.File

fun runCommand(command: String) {
    val process = Runtime.getRuntime().exec(command)
    process.waitFor()
}

fun main() {
    println(" ")
    Thread.sleep(4000)
    println("Đang tải lệnh")
    Thread.sleep(2000)
    println("Đang update hệ thống")
    Thread.sleep(1000)
    runCommand("clear")
    runCommand("sudo apt update")
    println("Đang tải Speedtest cho Linux")
    runCommand("sudo apt-get install speedtest-cli")
    println("Thành công!")
    runCommand("clear")
    println("Đang tải Bios TianoCore")
    Thread.sleep(1000)
    runCommand("wget -O bios64.bin \"https://github.com/BlankOn/ovmf-blobs/raw/master/bios64.bin\"")
    runCommand("clear")
    println("Nhập liên kết tải file ISO: ")
    val isoLink = readLine()
    isoLink?.let { runCommand("wget -O link.iso \"$it\"") }
    runCommand("clear")
    println("Đang tải Ngrok cho Linux")
    Thread.sleep(1000)
    runCommand("wget -O ngrok.tgz \"https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz\"")
    runCommand("clear")
    println("Giải nén và cài đặt")
    runCommand("tar -xf ngrok.tgz")
    runCommand("rm -rf ngrok.tgz")
    runCommand("clear")
    println("Nhập token Ngrok: ")
    val ngrokToken = readLine()
    ngrokToken?.let { runCommand("./ngrok authtoken \"$it\"") }
    runCommand("clear")
    println("Vui lòng chọn khu vực")
    println("us - Hoa Kỳ (Ohio)")
    println("eu - Châu Âu (Frankfurt)")
    println("ap - Đông Nam Á (Singapore)")
    println("au - Úc (Sydney)")
    println("sa - Nam Mỹ (Sao Paulo)")
    println("jp - Nhật Bản (Tokyo)")
    println("in - Ấn Độ (Mumbai)")
    println("Nhập khu vực: ")
    val region = readLine()
    region?.let { runCommand("./ngrok tcp --region $it 5900 &>/dev/null &") }
    runCommand("clear")
    runCommand("sudo apt update")
    runCommand("sudo apt install qemu-kvm -y")
    runCommand("sudo apt install speedtest-cli")
    runCommand("clear")
    println("Nhập dung lượng ổ đĩa: ")
    val diskSize = readLine()
    diskSize?.let { runCommand("qemu-img create -f raw win.img \"$it\"") }
    Thread.sleep(1000)
    println("Đã tạo ổ đĩa")
    println("Đang gán lệnh")
    Thread.sleep(1000)
    runCommand("clear")
    println("Đã tạo VPS thành công!")
    println("Địa chỉ IP của bạn là: ")
    runCommand("curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url\":\"tcp:..([^\\\"]*).*/\\1/p'")
    println(" ")
    println(" ")
    println("Đang kiểm tra kết nối mạng")
    runCommand("speedtest-cli")
    println(" ")
    println("VPS sẽ hoạt động được 50h")
    println("________________________________________")
    println("|        Lệnh được viết bởi VinZ.      |")
    println("|______________________________________|")
    println("Hoạt động trên VPS: ")
    runCommand("sudo qemu-system-x86_64 -m 12G -cpu host -boot order=c -drive file=link.iso,media=cdrom -drive file=win.img,format=raw -device usb-ehci,id=usb,bus=pci.0,addr=0x4 -device usb-tablet -vnc :0 -smp cores=4 -device rtl8139,netdev=n0 -netdev user,id=n0 -vga qxl -accel kvm -bios bios64.bin")
    runCommand("clear")
    println("-------------- Lỗi ----------------")
    println("Ôi không!")
    println("VPS đã dừng hoạt động ")
    println("Xin lỗi vì điều này ")
    println("-----------------------------------")
    println("Lệnh được viết bởi VinZ")
    println("github.com/vinzcyun")
    println(" ")
    println(" ")
    runCommand("clear")

    while (true) {
        println("Đang cố gắng kết nối lại")
        Thread.sleep(1000)
        println("Đang xử lý...")
        Thread.sleep(1000)
        println("Đã kết nối")
        println("Địa chỉ IP truy cập của bạn sẽ vẫn như cũ")
        runCommand("sudo qemu-system-x86_64 -m 12G -cpu host -boot order=c -drive file=link.iso,media=cdrom -drive file=win.img,format=raw -device usb-ehci,id=usb,bus=pci.0,addr=0x4 -device usb-tablet -vnc :0 -smp cores=4 -device rtl8139,netdev=n0 -netdev user,id=n0 -vga qxl -accel kvm -bios bios64.bin")
        runCommand("clear && sleep 1")
        println("Lỗi không mong muốn")
        Thread.sleep(2000)
    }
}