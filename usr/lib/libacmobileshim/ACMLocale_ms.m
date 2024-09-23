@implementation ACMLocale_ms

- (ACMLocale_ms)init
{
  ACMLocale_ms *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_ms;
  v2 = -[ACMLocale_ms init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Medan kata laluan kosong"), CFSTR("Batal"), CFSTR("Daftar masuk"), CFSTR("Hantar"), CFSTR("OK"), CFSTR("Panggilan tidak wajar untuk kaedah tersebut. Dialog AppleConnect SignIn tidak boleh disembunyikan."), CFSTR("Parameter Tidak Sah. Sesetengah parameter input disetkan dengan cara yang salah."), CFSTR("Kata laluan Apple ID"), CFSTR("Anda mungkin berada di luar talian. Sila sambung ke Internet dan cuba lagi."), CFSTR("Apple ID atau kata laluan anda adalah salah."), CFSTR("Memerlukan pengesahan dua langkah, namun interaksi pengguna tidak dibenarkan."), CFSTR("PERANTI YANG DIPERCAYAI"), CFSTR("Untuk mengurus peranti yang dipercayai, lawati %@ dari Mac atau PC."), CFSTR("Gagal mencipta tiket perkhidmatan yang sah"), CFSTR("Respons pengesahan dua langkah tidak diisi."), CFSTR("SMS ke Nombor Telefon"), CFSTR("Kod sementara akan dihantar ke peranti yang dipilih di bawah yang boleh digunakan untuk mengesahkan identiti anda."),
           CFSTR("Kehabisan Memori"),
           CFSTR("johan.johari"),
           CFSTR("Hantarkan kod ke %@"),
           CFSTR("Kaedah panggilan yang tidak dijangka"),
           CFSTR("Anda telah banyak kali gagal untuk mengesahkan kod. Sila hantar kod baru ke peranti yang berbeza atau cuba sebentar lagi."),
           CFSTR("Token Data Tidak Sah. Token Data untuk pengesahan tidak sah."),
           CFSTR("Pengesahan dibatalkan oleh aplikasi"),
           CFSTR("Panjang kod laluan tidak sah"),
           CFSTR("Kod Pengesahan"),
           CFSTR("Nama akaun ini telah dilumpuhkan atas sebab keselamatan. Kata laluan anda boleh direset di %@."),
           CFSTR("Tidak dapat menerima mesej di mana-mana peranti anda?"),
           CFSTR("Hantar kod baru"),
           CFSTR("Ralat telah berlaku. Terima kasih atas kesabaran anda, sila cuba sebentar lagi."),
           CFSTR("Diperlukan"),
           CFSTR("Tidak dapat mencari individu ini."),
           CFSTR("Masukkan kod pengesahan"),
           CFSTR("Peranti tidak dijumpai."),
           CFSTR("Apple ID"),
           CFSTR("Pengesahan dua langkah telah diaktifkan untuk Apple ID ini."),
           CFSTR("Tidak dapat mengesahkan token."),
           CFSTR("Kata Laluan"),
           CFSTR("Untuk melindungi keselamatan, kata laluan anda perlu direset. Caranya mudah, hanya pergi ke %@."),
           CFSTR("Waktu semasa pada peranti ini adalah salah. Anda boleh mengesetkannya dengan pergi ke Seting > Umum > Tarikh & Masa, kemudian cuba lagi."),
           CFSTR("Gagal mencipta token SSO yang sah"),
           CFSTR("Kod pengesahan yang anda masukkan tidak sah."),
           CFSTR("Teruskan"),
           CFSTR("Sahkan Identiti"),
           CFSTR("Pengesahan dibatalkan oleh sistem"),
           CFSTR("Janakan kod dengan %@"),
           CFSTR("Senarai peranti kosong."),
           CFSTR("Sesi Tidak Sah."),
           CFSTR("Respons dari pelayan adalah tidak lengkap"),
           CFSTR("Anda telah menghantar terlalu banyak kod untuk mengesahkan nombor telefon anda. Sila cuba sebentar lagi."),
           CFSTR("nombor telefon yang berakhir dengan %@"),
           CFSTR("Nama akaun atau kata laluan yang dimasukkan adalah salah."),
           CFSTR("Medan Apple ID kosong"),
           CFSTR("iForgot…"),
           CFSTR("Maaf, anda telah melakukan terlalu banyak cubaan gagal untuk mengesahkan identiti anda. Untuk tujuan keselamatan, anda tidak boleh melakukan perubahan ke akaun selama lapan jam tanpa Kunci Pemulihan."),
           CFSTR("Tiada maklumat Peranti tersedia."),
           CFSTR("Terlupa ID atau Kata Laluan anda?"),
           CFSTR("Apple ID ini telah dilumpuhkan atas sebab keselamatan. Kata laluan anda boleh direset di %@."),
           CFSTR("Sahkan sebagai %@ Dengan Touch ID"),
           CFSTR("Pengesahan dibatalkan oleh pengguna"),
           CFSTR("Nombor berakhir dengan %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_ms;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
