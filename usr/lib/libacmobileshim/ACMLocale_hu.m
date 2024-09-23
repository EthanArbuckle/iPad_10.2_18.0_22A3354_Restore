@implementation ACMLocale_hu

- (ACMLocale_hu)init
{
  ACMLocale_hu *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_hu;
  v2 = -[ACMLocale_hu init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("A jelszómező üres"), CFSTR("Mégsem"), CFSTR("Bejelentkezés"), CFSTR("Küldés"), CFSTR("OK"), CFSTR("Érvénytelen metódushívás. Az AppleConnect Bejelentkezés párbeszédablak nem rejthető el."), CFSTR("Érvénytelen paraméterek. Egyes bemeneti paraméterek hibásan lettek megadva."), CFSTR("Apple ID jelszó"), CFSTR("Úgy tűnik, Ön offline állapotban van. Kapcsolódjon az internethez, és próbálja újra."), CFSTR("Az Apple ID vagy jelszó hibásan lett megadva."), CFSTR("Kétlépcsős ellenőrzés szükséges, de felhasználói közreműködés nem engedélyezett."), CFSTR("MEGBÍZHATÓ KÉSZÜLÉKEK"), CFSTR("A megbízható készülékek kezeléséhez egy Mac vagy PC számítógépről látogasson el a következő címre: %@."), CFSTR("Érvényes szolgáltatásjegy létrehozása sikertelen"), CFSTR("A kétlépcsős ellenőrzésre adott válasz üres."), CFSTR("SMS telefonszámra"), CFSTR("Az alább kiválasztott készülékre küldjük el a személyazonossága ellenőrzésére szolgáló ideiglenes kód."),
           CFSTR("Kevés a memória"),
           CFSTR("kovacs.janos"),
           CFSTR("Kód küldése a következőre: %@"),
           CFSTR("Nem várt metódushívás"),
           CFSTR("Túl sokszor próbálta meg ellenőrizni a kódot. Küldjön egy új kódot egy másik készülékre, vagy próbálja újra később."),
           CFSTR("Érvénytelen adattoken. Az adattoken az ellenőrzéshez érvénytelen."),
           CFSTR("A hitelesítést az alkalmazás megszakította"),
           CFSTR("Érvénytelen a jelkód hossza"),
           CFSTR("Ellenőrző kód"),
           CFSTR("Ez a fiók biztonsági okokból le lett tiltva. A jelszót visszaállíthatja a(z) %@ webhelyen."),
           CFSTR("Nem tud üzeneteket fogadni egyik készülékén sem?"),
           CFSTR("Új kód küldése"),
           CFSTR("Hiba történt. Köszönjük türelmét, kérjük, próbálja újra később."),
           CFSTR("Kötelező"),
           CFSTR("Ez a személy nem található."),
           CFSTR("Ellenőrző kód megadása"),
           CFSTR("A készülék nem található."),
           CFSTR("Apple ID"),
           CFSTR("Ehhez az Apple ID-hoz be van kapcsolva a kétlépcsős ellenőrzés."),
           CFSTR("A token nem ellenőrizhető."),
           CFSTR("Jelszó"),
           CFSTR("Adatai védelme érdekében ideje megváltoztatnia jelszavát. Ezt egyszerűen megteheti a(z) %@ webhelyen."),
           CFSTR("Az eszközön megjelenő pontos idő hibásnak tűnik. Kijavíthatja a Beállítások > Általános > Dátum és idő menüpont alatt, majd próbálja újra."),
           CFSTR("Érvényes SSO-token létrehozása sikertelen"),
           CFSTR("A megadott ellenőrző kód érvénytelen."),
           CFSTR("Folytatás"),
           CFSTR("Azonosítás"),
           CFSTR("A hitelesítést a rendszer megszakította"),
           CFSTR("Generáljon kódot a következővel: %@"),
           CFSTR("A készüléklista üres."),
           CFSTR("Érvénytelen munkamenet."),
           CFSTR("A kiszolgáló válasza helytelenül formázott"),
           CFSTR("Túl sok kódot küldött a telefonszáma hitelesítéséhez. Próbálja újra később."),
           CFSTR("a következőre végződő szám: %@"),
           CFSTR("A fióknév vagy a jelszó hibásan lett megadva."),
           CFSTR("Az Apple ID mező üres"),
           CFSTR("iForgot…"),
           CFSTR("Sajnáljuk, de túl sok sikertelen kísérletet tett személyazonossága igazolására. Biztonsági okokból a következő nyolc órában a visszaállítási kulcsa nélkül nem tud majd módosításokat végrehajtani a fiókjában."),
           CFSTR("Nincs elérhető készülékinformáció."),
           CFSTR("Elfelejtette az azonosítóját vagy jelszavát?"),
           CFSTR("Ez az Apple ID biztonsági okokból le lett tiltva. A jelszót visszaállíthatja a(z) %@ webhelyen."),
           CFSTR("Hitelesítés mint %@ Touch ID használatával"),
           CFSTR("A hitelesítést a felhasználó megszakította"),
           CFSTR("A következőre végződő szám: %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_hu;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
