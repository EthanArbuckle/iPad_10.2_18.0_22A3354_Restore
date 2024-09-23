@implementation ACMLocale_sk

- (ACMLocale_sk)init
{
  ACMLocale_sk *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_sk;
  v2 = -[ACMLocale_sk init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Pole Heslo je prázdne"), CFSTR("Zrušiť"), CFSTR("Prihláste sa"), CFSTR("Odoslať"), CFSTR("OK"), CFSTR("Neplatné volanie metódy. Dialógové okno prihlásenia AppleConnect nie je možné skryť."), CFSTR("Neplatné parametre. Niektoré vstupné parametre sú nastavené nesprávne."), CFSTR("Heslo Apple ID"), CFSTR("Vyzerá to, že ste offline. Pripojte sa k internetu a skúste to znova."), CFSTR("Vaše Apple ID alebo heslo bolo nesprávne zadané."), CFSTR("Vyžaduje sa dvojfázové overenie, ale nie je povolená interakcia používateľa."), CFSTR("DÔVERYHODNÉ ZARIADENIA"), CFSTR("Dôveryhodné zariadenia môžete spravovať na stránke %@ z počítača Mac alebo PC."), CFSTR("Vytvorenie platného lístka služby zlyhalo"), CFSTR("Odpoveď na dvojfázové overenie je prázdna."), CFSTR("Odoslať SMS na telefónne číslo"), CFSTR("Do nižšie vybraného zariadenia bude odoslaný dočasný kód, ktorý môžete použiť na overenie svojej identity."),
           CFSTR("Nedostatok pamäte"),
           CFSTR("janko.hrasko"),
           CFSTR("Odoslať kód na %@"),
           CFSTR("Neočakávané volanie metódy"),
           CFSTR("Príliš veľa neúspešných pokusov o overenie kódu. Pošlite nový kód na iné zariadenie alebo to skúste znovu neskôr."),
           CFSTR("Neplatný token údajov. Token údajov na overenie je neplatný."),
           CFSTR("Overenie bolo zrušené aplikáciou."),
           CFSTR("Nesprávna dĺžka hesla"),
           CFSTR("Overovací kód"),
           CFSTR("Toto Apple ID bolo z bezpečnostných dôvodov deaktivované. Svoje heslo môžete obnoviť na adrese %@."),
           CFSTR("Nemôžete prijímať správy na žiadne svoje zariadenia?"),
           CFSTR("Odoslať nový kód"),
           CFSTR("Vyskytla sa chyba. Ďakujeme za vašu trpezlivosť, skúste to znova neskôr."),
           CFSTR("Povinné"),
           CFSTR("Nie je možné nájsť túto osobu."),
           CFSTR("Zadajte overovací kód"),
           CFSTR("Zariadenie sa nenašlo."),
           CFSTR("Apple ID"),
           CFSTR("Pre tento účet Apple ID je aktivované dvojfázové overenie."),
           CFSTR("Nie je možné overiť token."),
           CFSTR("Heslo"),
           CFSTR("Z dôvodu ochrany bezpečnosti je čas obnoviť vaše heslo. Je to jednoduché - stačí prejsť na adresu %@."),
           CFSTR("Aktuálny čas tohto zariadenia vyzerá byť nesprávny. Môžete to napraviť v ponuke Nastavenia > Všeobecné > Dátum a čas. Potom to skúste znova."),
           CFSTR("Vytvorenie platného SSO tokenu zlyhalo"),
           CFSTR("Overovací kód, ktorý ste zadali, nie je platný."),
           CFSTR("Pokračovať"),
           CFSTR("Overiť identitu"),
           CFSTR("Overenie bolo zrušené systémom."),
           CFSTR("Kód vygenerujete pomocou %@"),
           CFSTR("Zoznam zariadení je prázdny."),
           CFSTR("Neplatná relácia."),
           CFSTR("Odpoveď servera je chybná"),
           CFSTR("Odoslali ste priveľa kódov na overenie svojho telefónneho čísla. Skúste to znova neskôr."),
           CFSTR("telefónne číslo končiace číslicami %@"),
           CFSTR("Bol zadaný nesprávny názov účtu alebo heslo."),
           CFSTR("Pole Apple ID je prázdne"),
           CFSTR("iForgot…"),
           CFSTR("Je nám to ľúto, ale už ste urobili priveľa neúspešných pokusov o overenie vašej identity. Z bezpečnostných dôvodov nebude možné najbližších 8 hodín urobiť zmeny na vašom účte bez Kľúča obnovy."),
           CFSTR("K dispozícii nie sú žiadne informácie o zariadení."),
           CFSTR("Zabudli ste svoje ID alebo heslo?"),
           CFSTR("Toto Apple ID bolo z bezpečnostných dôvodov deaktivované. Svoje heslo môžete obnoviť na adrese %@."),
           CFSTR("Overiť  totožnosť %@ pomocou Touch ID"),
           CFSTR("Overenie bolo zrušené používateľom."),
           CFSTR("Číslo končiace na %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_sk;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
