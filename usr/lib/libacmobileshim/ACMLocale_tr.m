@implementation ACMLocale_tr

- (ACMLocale_tr)init
{
  ACMLocale_tr *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_tr;
  v2 = -[ACMLocale_tr init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Parola alanı boş"), CFSTR("İptal"), CFSTR("Giriş yap"), CFSTR("Gönder"), CFSTR("Tamam"), CFSTR("Yanlış yöntem talebi. AppleConnect SignIn iletişim kutusu gizlenemiyor."), CFSTR("Geçersiz Parametreler. Bazı giriş parametreleri yanlış ayarlanmış."), CFSTR("Apple Kimliği parolası"), CFSTR("Çevrimdışı görünüyorsunuz. Lütfen internete bağlanın ve tekrar deneyin."), CFSTR("Apple Kimliğiniz veya parolanız doğru girilmedi."), CFSTR("İki aşamalı doğrulama gerekiyor, ancak kullanıcı etkileşimine izin verilmiyor."), CFSTR("GÜVENİLİR AYGITLAR"), CFSTR("Güvenilir aygıtlarınızı yönetmek için Mac veya bilgisayardan %@ sayfasını ziyaret edin."), CFSTR("Geçerli hizmet talep formu oluşturulamadı"), CFSTR("İki aşamalı doğrulama yanıt alanı boş."), CFSTR("Telefon Numarasına SMS Gönder"), CFSTR("Aşağıda seçtiğiniz aygıta kimliğinizi doğrulamak için kullanabileceğiniz geçici bir kod gönderilecek."),
           CFSTR("Yetersiz Hafıza"),
           CFSTR("ad.soyad"),
           CFSTR("Şuraya kod gönder: %@"),
           CFSTR("Beklenmedik yöntem çağırma"),
           CFSTR("Kodu doğrulamada birçok kez başarısız oldunuz. Lütfen başka bir aygıta yeni bir kod gönderin veya daha sonra tekrar deneyin."),
           CFSTR("Geçersiz Veri Belirteci. Doğrulanacak Veri Belirteci geçerli değil."),
           CFSTR("Kimlik doğrulama uygulama tarafından iptal edildi"),
           CFSTR("Geçersiz parola uzunluğu"),
           CFSTR("Doğrulama Kodu"),
           CFSTR("Bu hesap adı güvenlik nedenlerinden dolayı devre dışı bırakıldı. Parolanızı %@ adresinde sıfırlayabilirsiniz."),
           CFSTR("Aygıtlarınızda mesaj alamıyor musunuz?"),
           CFSTR("Yeni bir kod gönder"),
           CFSTR("Bir hata oluştu. Lütfen daha sonra tekrar deneyin."),
           CFSTR("Gerekli"),
           CFSTR("Bu kişi bulunamıyor."),
           CFSTR("Doğrulama kodunu girin"),
           CFSTR("Aygıt bulunamadı."),
           CFSTR("Apple Kimliği"),
           CFSTR("Bu Apple Kimliği için iki aşamalı doğrulama etkin."),
           CFSTR("Belirteç doğrulanamıyor."),
           CFSTR("Parola"),
           CFSTR("Güvenliğinizi korumak için parolanızı sıfırlamanın zamanı geldi. Tek yapmanız gereken %@ adresini ziyaret etmek."),
           CFSTR("Bu aygıttaki geçerli saat yanlış görünüyor. Ayarlar > Genel > Tarih ve Saat'e giderek düzeltebilir ve tekrar deneyebilirsiniz."),
           CFSTR("Geçerli SSO belirteci oluşturulamadı"),
           CFSTR("Girdiğiniz doğrulama kodu geçerli değil."),
           CFSTR("Devam"),
           CFSTR("Kimliğinizi Doğrulayın"),
           CFSTR("Kimlik doğrulama sistem tarafından iptal edildi"),
           CFSTR("%@ ile kod oluştur"),
           CFSTR("Aygıt listesi boş."),
           CFSTR("Geçersiz Oturum"),
           CFSTR("Hatalı sunucu yanıtı"),
           CFSTR("Telefon numaranızı doğrulamak için çok fazla kod gönderdiniz. Lütfen daha sonra tekrar deneyin."),
           CFSTR("sonu %@ ile biten telefon numarası"),
           CFSTR("Hesap adınız veya parolanız yanlış girilmiş."),
           CFSTR("Apple Kimliği alanı boş"),
           CFSTR("iForgot…"),
           CFSTR("Üzgünüz, ancak kimliğinizi doğrulamak için çok fazla başarısız girişimde bulundunuz. Güvenlik nedeniyle Kurtarma Anahtarı'nız olmadan önümüzdeki sekiz saat boyunca hesabınızda değişiklik yapamayacaksınız."),
           CFSTR("Herhangi bir Aygıt bilgisi yok."),
           CFSTR("Kimliğinizi veya Parolanızı mı unuttunuz?"),
           CFSTR("Bu Apple Kimliği güvenlik nedenlerinden dolayı devre dışı bırakıldı. Parolanızı %@ adresinde sıfırlayabilirsiniz."),
           CFSTR("Touch ID ile %@ olarak kimliği doğrulayın"),
           CFSTR("Kimlik doğrulama kullanıcı tarafından iptal edildi"),
           CFSTR("Sonu %@ ile biten numara"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_tr;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
