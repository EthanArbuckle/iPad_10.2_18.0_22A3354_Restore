@implementation ACMLocale_ro

- (ACMLocale_ro)init
{
  ACMLocale_ro *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_ro;
  v2 = -[ACMLocale_ro init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Câmpul Parolă este necompletat"), CFSTR("Anulați"), CFSTR("Autentificaţi-vă"), CFSTR("Trimiteți"), CFSTR("OK"), CFSTR("Utilizare incorectă a metodei. Caseta de dialog pentru autentificare AppleConnect nu poate fi ascunsă."), CFSTR("Parametri nevalizi. Unii dintre parametrii de intrare sunt configurați incorect."), CFSTR("Parolă ID Apple"), CFSTR("Se pare că sunteți offline. Conectați-vă la Internet și încercați din nou."), CFSTR("ID-ul Apple sau parola a fost introdusă incorect."), CFSTR("Este necesară confirmarea în doi pași, dar nu este permisă interacțiunea cu utilizatorul."), CFSTR("DISPOZITIVE AUTORIZATE"), CFSTR("Pentru a vă gestiona dispozitivele autorizate, vizitați %@ pe un Mac sau PC."), CFSTR("Crearea unei cereri de asistență a eșuat"), CFSTR("Niciun răspuns pentru confirmarea în doi pași."), CFSTR("SMS la un număr de telefon"), CFSTR("Dispozitivul pe care îl selectați mai jos va primi un cod temporar pe care îl veți putea utiliza la confirmarea identității."),
           CFSTR("Memorie insuficientă"),
           CFSTR("ion.merisor"),
           CFSTR("Trimiteți codul la %@"),
           CFSTR("Metodă invocată neașteptată"),
           CFSTR("Nu ați reușit să confirmați codul de prea multe ori. Trimiteți un cod nou pe un alt dispozitiv sau încercați mai târziu."),
           CFSTR("Token de date nevalid. Tokenul de date pentru verificare nu este valid."),
           CFSTR("Autentificarea a fost anulată de aplicație"),
           CFSTR("Lungimea codului de acces este nevalidă."),
           CFSTR("Cod de confirmare"),
           CFSTR("Acest cont a fost dezactivat din motive de securitate. Vă puteți reseta parola la %@."),
           CFSTR("Nu puteți primi mesaje pe niciunul dintre dispozitivele dvs.?"),
           CFSTR("Trimiteți un nou cod"),
           CFSTR("Vyskytla sa chyba. Ďakujeme za vašu trpezlivosť, skúste to znova neskôr."),
           CFSTR("Obligatoriu"),
           CFSTR("Această persoană nu poate fi găsită."),
           CFSTR("Introduceți codul de verificare"),
           CFSTR("Dispozitivul nu poate fi găsit."),
           CFSTR("ID Apple"),
           CFSTR("Confirmarea în doi pași este activată pentru acest ID Apple."),
           CFSTR("Tokenul nu poate fi verificat."),
           CFSTR("Parolă"),
           CFSTR("Pentru a vă proteja securitatea, resetați-vă parola accesând %@."),
           CFSTR("Ora actuală de pe acest dispozitiv pare a fi incorectă. O puteți corecta, accesând Configurări > General > Data și ora, apoi încercați din nou."),
           CFSTR("Crearea unui token SSO valid a eșuat"),
           CFSTR("Codul de confirmare pe care l-ați introdus nu este valid."),
           CFSTR("Continuați"),
           CFSTR("Confirmați identitatea"),
           CFSTR("Autentificarea a fost anulată de sistem"),
           CFSTR("Generați codul cu %@"),
           CFSTR("Nu aveți nimic în lista de dispozitive."),
           CFSTR("Sesiune nevalidă."),
           CFSTR("Răspunsul primit de la server este formulat incorect"),
           CFSTR("Ați trimis prea multe coduri pentru a vă confirma numărul de telefon. Încercați mai târziu."),
           CFSTR("numărul de telefon ce se termină în %@"),
           CFSTR("Numele sau parola contului dvs. a fost introdusă incorect."),
           CFSTR("Câmpul ID Apple este necompletat"),
           CFSTR("iForgot…"),
           CFSTR("Ne pare rău, dar ați făcut prea multe încercări eșuate de a vă confirma identitatea. Din motive de securitate, nu veți putea face modificări în contul dvs. în următoarele opt ore fără Cheia de recuperare."),
           CFSTR("Informațiile dispozitivului nu sunt disponibile."),
           CFSTR("V-ați uitat ID-ul sau parola?"),
           CFSTR("Acest ID Apple a fost dezactivat din motive de securitate. Vă puteți reseta parola la %@."),
           CFSTR("Autentificați-vă ca %@ cu Touch ID"),
           CFSTR("Autentificarea a fost anulată de utilizator"),
           CFSTR("Număr ce se termină în %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_ro;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
