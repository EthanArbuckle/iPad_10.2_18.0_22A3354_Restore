@implementation ACMLocale_hr

- (ACMLocale_hr)init
{
  ACMLocale_hr *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_hr;
  v2 = -[ACMLocale_hr init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Polje lozinke je prazno."), CFSTR("Odustani"), CFSTR("Prijavite se"), CFSTR("Pošalji"), CFSTR("U redu"), CFSTR("Nepravilno pozivanje metode. Nije moguće sakriti dijalog za AppleConnect SignIn."), CFSTR("Nevažeći parametri. Neki ulazni parametri nisu pravilno postavljeni."), CFSTR("Lozinka za Apple ID"), CFSTR("Izgleda da niste na mreži. Povežite se s internetom i pokušajte poslije ponovno."), CFSTR("Netočno je unesen Apple ID ili lozinka."), CFSTR("Potrebna je provjera valjanosti u dva koraka, ali interakcija korisnika nije dopuštena."), CFSTR("POUZDANI UREĐAJI"), CFSTR("Da biste upravljali svojim pouzdanim uređajima, posjetite %@ korištenjem Mac ili PC računala."), CFSTR("Izrada valjane uslužne karte nije uspjela"), CFSTR("Odgovor na provjeru valjanosti u dva koraka je prazan."), CFSTR("SMS na telefonski broj"), CFSTR("Na uređaj koji odaberete u nastavku bit će poslan privremeni kod pomoću kojeg možete potvrditi svoj identitet."),
           CFSTR("Nema memorije"),
           CFSTR("ivan.novak"),
           CFSTR("Pošalji kôd na %@"),
           CFSTR("Neočekivani poziv metode"),
           CFSTR("Previše ste puta neuspješno pokušali provjeriti valjanost koda. Pošalji novi kod na drugi uređaj pa pokušajte poslije ponovno."),
           CFSTR("Nevažeći podatkovni token. Podatkovni token za provjeru nije valjan."),
           CFSTR("Aplikacija je prekinula provjeru autentičnosti"),
           CFSTR("Dužina lozinke nije valjana"),
           CFSTR("Kod za provjeru valjanosti"),
           CFSTR("Ovaj Apple ID onemogućen je iz sigurnosnih razloga. Svoju lozinku možete poništiti na adresi %@."),
           CFSTR("Nemate mogućnost primanja poruka ni na jedan uređaj?"),
           CFSTR("Pošaljite novi kod"),
           CFSTR("Dogodila se pogreška. Hvala vam na strpljenju, pokušajte poslije ponovno."),
           CFSTR("Potrebno"),
           CFSTR("Nije moguće pronaći ovu osobu."),
           CFSTR("Unesite kod za provjeru valjanosti"),
           CFSTR("Uređaj nije pronađen."),
           CFSTR("Apple ID"),
           CFSTR("Provjera valjanosti u dva koraka omogućena je za ovaj Apple ID."),
           CFSTR("Nije moguće provjeriti token."),
           CFSTR("Lozinka"),
           CFSTR("Kako bi zaštitili svoju sigurnost, vrijeme je da poništite svoju lozinku. To je jednostavno, samo odite na adresu %@."),
           CFSTR("Trenutno vrijeme na ovom uređaju izgleda nepravilnim. Možete ispraviti ako odete na Postavke > Opće > Datum i vrijeme, a zatim pokušajte poslije ponovno."),
           CFSTR("Izrada valjanog SSO tokena nije uspjela"),
           CFSTR("Uneseni kod za provjeru valjanosti je nevažeći."),
           CFSTR("Nastavi"),
           CFSTR("Provjeri valjanost identiteta"),
           CFSTR("Sustav je prekinuo provjeru autentičnosti"),
           CFSTR("Generiraj novi kôd s %@"),
           CFSTR("Lista uređaja je prazna."),
           CFSTR("Nevažeća sesija."),
           CFSTR("Nepravilno oblikovan odgovor poslužitelja"),
           CFSTR("Poslali ste previše kodova za provjeru valjanosti telefonskog broja. Pokušajte ponovno kasnije."),
           CFSTR("telefonski broj koji završava sa %@"),
           CFSTR("Vaš naziv računa ili lozinka nisu pravilno uneseni."),
           CFSTR("Polje za Apple ID je prazno"),
           CFSTR("iForgot…"),
           CFSTR("Nažalost, previše ste puta neuspješno pokušali potvrditi valjanost svojeg identiteta. Iz sigurnosnih razloga, sljedećih osam sati nećete moći vršiti promjene na svojem računu bez ključa za oporavak."),
           CFSTR("Nema dostupnih podataka o uređaju."),
           CFSTR("Zaboravili ste svoj ID ili lozinku?"),
           CFSTR("Ovaj Apple ID onemogućen je iz sigurnosnih razloga. Svoju lozinku možete poništiti na adresi %@."),
           CFSTR("Provjeri autentičnost kao %@ pomoću Touch ID-a"),
           CFSTR("Korisnik je prekinuo provjeru autentičnosti"),
           CFSTR("Broj koji završava sa %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_hr;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
