@implementation ACMLocale_id

- (ACMLocale_id)init
{
  ACMLocale_id *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_id;
  v2 = -[ACMLocale_id init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Password field is empty"), CFSTR("Cancel"), CFSTR("Sign In"), CFSTR("Send"), CFSTR("OK"), CFSTR("Improper call of the method. AppleConnect SignIn dialog cannot be hidden."), CFSTR("Invalid Parameters. Some of input parameters are set incorrectly."), CFSTR("Apple ID password"), CFSTR("You appear to be offline. Please connect to the Internet and try again."), CFSTR("Your Apple ID or password was entered incorrectly."), CFSTR("Two-step verification required, but user interaction is not allowed."), CFSTR("TRUSTED DEVICES"), CFSTR("To manage your trusted devices visit %@ from a Mac or PC."), CFSTR("Failed to create valid service ticket"), CFSTR("Two-step verification response is empty."), CFSTR("SMS to Phone Number"), CFSTR("The device you select below will be sent a temporary code that you can use to verify your identity."),
           CFSTR("Out of Memory"),
           CFSTR("john.appleseed"),
           CFSTR("Send code to %@"),
           CFSTR("Unexpected method invocation"),
           CFSTR("You failed to verify the code too many times. Please send a new code to a different device or try again later."),
           CFSTR("Invalid Data Token. Data Token for verify is not valid."),
           CFSTR("Authentication was canceled by application"),
           CFSTR("Invalid passcode length"),
           CFSTR("Verification Code"),
           CFSTR("This account name has been disabled for security reasons. You can reset your password at %@."),
           CFSTR("Unable to receive messages at any of your devices?"),
           CFSTR("Send a new code"),
           CFSTR("Oops, an error occurred. Thanks for your patience, please try again later."),
           CFSTR("Required"),
           CFSTR("Cannot find this person."),
           CFSTR("Enter verification code"),
           CFSTR("Device is not found."),
           CFSTR("Apple ID"),
           CFSTR("Two-step verification is enabled for this Apple ID."),
           CFSTR("Can not verify token."),
           CFSTR("Password"),
           CFSTR("To protect your security, it’s time to reset your password. It’s easy, just go to %@."),
           CFSTR("The current time on this device seems to be incorrect. You can fix it by going to Settings > General > Date & Time, then try again."),
           CFSTR("Failed to create valid SSO token"),
           CFSTR("The verification code you entered is not valid."),
           CFSTR("Continue"),
           CFSTR("Verify Identity"),
           CFSTR("Authentication was canceled by system"),
           CFSTR("Generate code with %@"),
           CFSTR("Device list is empty."),
           CFSTR("Invalid Session."),
           CFSTR("Response from server is malformed"),
           CFSTR("You have sent too many codes to verify your phone number. Please try again later."),
           CFSTR("phone ending in %@"),
           CFSTR("Your account name or password was entered incorrectly."),
           CFSTR("Apple ID field is empty"),
           CFSTR("iForgot…"),
           CFSTR("Sorry, but you have made too many unsuccessful attempts to verify your identity. For security reasons, you will not be able to make changes to your account for the next eight hours without your Recovery Key."),
           CFSTR("No Device information available."),
           CFSTR("Forgot your ID or Password?"),
           CFSTR("This Apple ID has been disabled for security reasons. You can reset your password at %@."),
           CFSTR("Authenticate as %@ with Touch ID"),
           CFSTR("Authentication was canceled by user"),
           CFSTR("Number ending in %@"));
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Kolom kata sandi kosong"), CFSTR("Batalkan"), CFSTR("Masuk"), CFSTR("Kirim"), CFSTR("OKE"), CFSTR("Metode dipanggil dengan cara yang tidak tepat. Dialog AppleConnect SignIn tidak dapat disembunyikan."), CFSTR("Parameter Tidak Valid. Beberapa parameter input diatur dengan cara yang salah."), CFSTR("Kata sandi ID Apple"), CFSTR("Tampaknya Anda sedang offline. Silakan sambung ke Internet dan coba lagi."), CFSTR("ID Apple atau kata sandi Anda Salah."), CFSTR("Diperlukan verifikasi dua langkah, tetapi interaksi pengguna tidak diizinkan."), CFSTR("PERANGKAT TEPERCAYA"), CFSTR("Untuk mengelola perangkat tepercaya Anda, kunjungi %@ melalui Mac atau PC."), CFSTR("Gagal membuat tiket layanan yang valid"), CFSTR("Respons verifikasi dua langkah kosong."), CFSTR("SMS ke Nomor Telepon"), CFSTR("Perangkat yang Anda pilih di bawah akan dikirimi kode sementara yang dapat Anda gunakan untuk memverifikasi identitas Anda."),
           CFSTR("Memori Habis"),
           CFSTR("johan.ramli"),
           CFSTR("Kirimkan kode ke %@"),
           CFSTR("Pemanggilan metode tidak benar"),
           CFSTR("Anda telah terlalu banyak gagal untuk memverifikasi kode. Harap kirimkan kode baru ke perangkat yang berbeda atau coba lagi nanti."),
           CFSTR("Token Data Tidak Valid. Token Data untuk verifikasi tidak valid."),
           CFSTR("Autentikasi dibatalkan oleh aplikasi"),
           CFSTR("Panjang kode sandi tidak valid"),
           CFSTR("Kode Verifikasi"),
           CFSTR("ID Apple ini telah dinonaktifkan karena alasan keamanan. Anda dapat mengatur ulang kata sandi Anda di %@."),
           CFSTR("Tidak dapat menerima pesan pada semua perangkat Anda?"),
           CFSTR("Kirim kode baru"),
           CFSTR("Ups, telah terjadi kesalahan. Terima kasih atas kesabaran Anda. Harap coba lagi nanti."),
           CFSTR("Diperlukan"),
           CFSTR("Tidak dapat menemukan orang ini."),
           CFSTR("Masukkan kode verifikasi"),
           CFSTR("Perangkat tidak ditemukan."),
           CFSTR("ID Apple"),
           CFSTR("Verifikasi dua langkah telah diaktifkan untuk ID Apple ini."),
           CFSTR("Tidak dapat memverifikasi token."),
           CFSTR("Kata Sandi"),
           CFSTR("Untuk melindungi keamanan akun Anda, sekarang adalah waktunya untuk mengatur ulang kata sandi Anda. Mudah, cukup masuk ke %@."),
           CFSTR("Waktu saat ini pada perangkat tampaknya salah. Anda dapat memperbaikinya dengan masuk ke Pengaturan > Umum > Tanggal & Waktu, lalu coba lagi."),
           CFSTR("Gagal membuat token SSO yang valid"),
           CFSTR("Kode verifikasi yang Anda masukkan tidak valid."),
           CFSTR("Lanjutkan"),
           CFSTR("Verifikasi Identitas"),
           CFSTR("Autentikasi dibatalkan oleh sistem"),
           CFSTR("Hasilkan kode dengan %@"),
           CFSTR("Daftar perangkat kosong."),
           CFSTR("Sesi Tidak Valid."),
           CFSTR("Respons dari server buruk"),
           CFSTR("Anda telah mengirimkan terlalu banyak kode untuk memverifikasi nomor telepon Anda. Harap coba lagi nanti."),
           CFSTR("telepon yang berakhiran dengan %@"),
           CFSTR("Nama akun atau kata sandi yang Anda masukkan salah."),
           CFSTR("Kolom ID Apple kosong"),
           CFSTR("iForgot…"),
           CFSTR("Maaf, Anda telah membuat terlalu banyak upaya gagal untuk memverifikasi identitas Anda. Untuk tujuan pengamanan, Anda tidak akan dapat membuat perubahan pada akun selama delapan jam ke depan tanpa Kunci Pemulihan Anda."),
           CFSTR("Informasi Perangkat tidak tersedia."),
           CFSTR("Lupa ID atau Kata Sandi Anda?"),
           CFSTR("ID Apple ini telah dinonaktifkan karena alasan keamanan. Anda dapat mengatur ulang kata sandi Anda di %@."),
           CFSTR("Autentikasikan sebagai %@ Dengan Touch ID"),
           CFSTR("Autentikasi dibatalkan oleh pengguna"),
           CFSTR("Nomor yang berakhir dengan %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_id;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
