@implementation ACMLocale_cs

- (ACMLocale_cs)init
{
  ACMLocale_cs *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_cs;
  v2 = -[ACMLocale_cs init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Pole Heslo je prázdné."), CFSTR("Zrušit"), CFSTR("Přihlásit se"), CFSTR("Odeslat"), CFSTR("OK"), CFSTR("Neplatné volání metody. Přihlašovací okno AppleConnect nelze skrýt."), CFSTR("Neplatné parametry. Některé vstupní parametry nejsou správně nastaveny."), CFSTR("Heslo k účtu Apple ID"), CFSTR("Zdá se, že jste offline. Připojte se k internetu a zkuste to znovu."), CFSTR("Nezadali jste správně své Apple ID nebo heslo."), CFSTR("Je požadováno dvoufázové ověření, ale není povolena interakce uživatele."), CFSTR("DŮVĚRYHODNÁ ZAŘÍZENÍ"), CFSTR("Důvěryhodná zařízení můžete spravovat na stránce %@ z počítače Mac nebo PC."), CFSTR("Nepodařilo se vytvořit platný lístek pro službu."), CFSTR("Nebyla zadána odpověď na dvoufázové ověření."), CFSTR("SMS na telefonní číslo"), CFSTR("Do níže vybraného zařízení bude odeslán dočasný kód, který můžete použít k ověření své identity."),
           CFSTR("Nedostatek paměti"),
           CFSTR("jan.novak"),
           CFSTR("Odeslat kód do: %@"),
           CFSTR("Neočekávané volání metody"),
           CFSTR("Bylo provedeno příliš mnoho neúspěšných pokusů o ověření kódu. Odešlete prosím kód na jiné zařízení nebo to zkuste znovu později."),
           CFSTR("Neplatný datový token. Datový token k ověření není platný."),
           CFSTR("Ověření bylo zrušeno aplikací."),
           CFSTR("Neplatná délka přístupového kódu"),
           CFSTR("Ověřovací kód"),
           CFSTR("Toto Apple ID bylo z bezpečnostních důvodů deaktivováno. Heslo můžete obnovit na adrese %@."),
           CFSTR("Nemůžete přijímat zprávy na žádné z vašich zařízení?"),
           CFSTR("Odeslat nový kód"),
           CFSTR("Vyskytla se chyba. Děkujeme za vaši trpělivost. Zkuste to znovu později."),
           CFSTR("Povinné"),
           CFSTR("Tuto osobu nelze nalézt."),
           CFSTR("Zadat ověřovací kód"),
           CFSTR("Zařízení nebylo nalezeno."),
           CFSTR("Apple ID"),
           CFSTR("Pro toto Apple ID je aktivováno dvoufázové ověření."),
           CFSTR("Nelze ověřit token."),
           CFSTR("Heslo"),
           CFSTR("Z důvodu ochrany zabezpečení je nyní vhodné změnit heslo. Postup je snadný – stačí přejít na adresu %@."),
           CFSTR("Aktuální čas na tomto zařízení pravděpodobně není správný. Opravu můžete provést v nabídce Nastavení > Obecné > Datum a čas. Poté to zkuste znovu."),
           CFSTR("Nepodařilo se vytvořit platný SSO token."),
           CFSTR("Zadaný ověřovací kód není platný."),
           CFSTR("Pokračovat"),
           CFSTR("Ověřit identitu"),
           CFSTR("Ověření bylo zrušeno systémem."),
           CFSTR("Generovat kód s %@"),
           CFSTR("Seznam zařízení je prázdný."),
           CFSTR("Neplatná relace."),
           CFSTR("Odpověď ze serveru je poškozená."),
           CFSTR("Odeslali jste příliš mnoho kódů pro ověření telefonního čísla. Zkuste to znovu později."),
           CFSTR("telefonní číslo končící na %@"),
           CFSTR("Zadali jste nesprávný název účtu nebo heslo."),
           CFSTR("Pole Apple ID je prázdné."),
           CFSTR("iForgot…"),
           CFSTR("Litujeme, ale provedli jste příliš mnoho neúspěšných pokusů o ověření své identity. Bez Klíče pro obnovení nebudete z bezpečnostních důvodů moci po následujících osm hodin provádět změny ve svém účtu."),
           CFSTR("Nejsou k dispozici žádné informace o zařízení."),
           CFSTR("Zapomněli jste své ID nebo heslo?"),
           CFSTR("Toto Apple ID bylo z bezpečnostních důvodů deaktivováno. Heslo můžete obnovit na adrese %@."),
           CFSTR("Ověřit totožnost uživatele %@ pomocí Touch ID"),
           CFSTR("Ověření bylo zrušeno uživatelem."),
           CFSTR("Číslo končící na %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_cs;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
