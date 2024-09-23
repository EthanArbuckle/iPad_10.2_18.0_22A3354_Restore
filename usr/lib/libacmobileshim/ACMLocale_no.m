@implementation ACMLocale_no

- (ACMLocale_no)init
{
  ACMLocale_no *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_no;
  v2 = -[ACMLocale_no init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Passordfeltet er tomt"), CFSTR("Avbryt"), CFSTR("Logg på"), CFSTR("Send"), CFSTR("OK"), CFSTR("Ugyldig bruk av metoden. AppleConnect-påloggingsdialogen kan ikke skjules."), CFSTR("Ugyldige parametre. Enkelte av inndataparametrene er satt opp feil."), CFSTR("Passord til Apple-ID"), CFSTR("Det ser ut til at du er offline. Koble til Internett og prøv på nytt."), CFSTR("Apple-ID-en eller passordet ble ikke skrevet riktig."), CFSTR("Totrinns-verifisering kreves, men brukerhandlinger er ikke tillatt."), CFSTR("PÅLITELIGE ENHETER"), CFSTR("For å administrere de pålitelige enhetene går du til %@ på en Mac eller PC."), CFSTR("Kunne ikke opprette en gyldig serviceforespørsel"), CFSTR("Svar på totrinns-verifisering mangler."), CFSTR("SMS til telefonnummer"), CFSTR("Enheten du velger vil bli sendt en midlertidig kode du kan bruke til å verifisere identiteten din."),
           CFSTR("Ikke mer minne"),
           CFSTR("ola.nordmann"),
           CFSTR("Send kode til %@"),
           CFSTR("Uventet metodekall"),
           CFSTR("Du mislyktes for mange ganger med å verifisere koden. Send en ny kode til en annen enhet eller prøv igjen senere."),
           CFSTR("Ugyldig datatoken. Datatokenet for verifiseringen er ugyldig."),
           CFSTR("Bekreftelsen ble avbrutt av appen"),
           CFSTR("Ugyldig kodelengde"),
           CFSTR("Verifiseringskode"),
           CFSTR("Apple-ID-en er deaktivert av sikkerhetsgrunner. Du kan endre passordet ditt på %@."),
           CFSTR("Mottar du ikke meldinger på noen av enhetene dine?"),
           CFSTR("Send en ny kode"),
           CFSTR("En feil har oppstått. Takk for at du viser forståelse. Prøv igjen senere."),
           CFSTR("Påkrevd"),
           CFSTR("Kan ikke finne personen."),
           CFSTR("Skriv inn verifiseringskode"),
           CFSTR("Enheten ble ikke funnet."),
           CFSTR("Apple-ID"),
           CFSTR("Totrinns-verifisering er aktivert for denne Apple-ID-en."),
           CFSTR("Kan ikke verifisere tokenet."),
           CFSTR("Passord"),
           CFSTR("Av sikkerhetsgrunner er det på tide å endre passordet ditt. Dette kan du enkelt gjøre på %@."),
           CFSTR("Klokkeslettet på enheten ser ut til å være feil. Du kan fikse det ved å gå til Innstillinger > Generelt > Dato og tid. Prøv så på nytt."),
           CFSTR("Kunne ikke opprette et gyldig SSO-token"),
           CFSTR("Verifiseringskoden du oppga er ikke gyldig."),
           CFSTR("Fortsett"),
           CFSTR("Verifiser identitet"),
           CFSTR("Bekreftelsen ble avbrutt av systemet"),
           CFSTR("Generer kode med %@"),
           CFSTR("Enhetslisten er tom."),
           CFSTR("Ugyldig økt."),
           CFSTR("Svaret fra serveren inneholder feil"),
           CFSTR("Du har sendt for mange koder for å verifisere telefonnummeret ditt. Prøv igjen senere."),
           CFSTR("telefonnummer som slutter på %@"),
           CFSTR("Kontonavnet eller passordet du oppga var feil."),
           CFSTR("Feltet for Apple-ID er tomt"),
           CFSTR("iForgot …"),
           CFSTR("Du har dessverre hatt for mange mislykkede forsøk på å verifisere identiteten din. Av sikkerhetsgrunner kommer du ikke til å kunne gjøre endringer i kontoen de neste åtte timene uten gjenopprettingsnøkkelen din."),
           CFSTR("Ingen informasjon om enheten er tilgjengelig."),
           CFSTR("Har du glemt ID-en eller passordet?"),
           CFSTR("Apple-ID-en er deaktivert av sikkerhetsgrunner. Du kan endre passordet ditt på %@."),
           CFSTR("Bekreft som %@ med Touch-ID"),
           CFSTR("Bekreftelsen ble avbrutt av brukeren"),
           CFSTR("Nummeret som slutter på %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_no;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
