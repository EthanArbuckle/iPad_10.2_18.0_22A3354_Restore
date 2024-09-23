@implementation ACMLocale_da

- (ACMLocale_da)init
{
  ACMLocale_da *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_da;
  v2 = -[ACMLocale_da init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Feltet Adgangskode er tomt"), CFSTR("Annuller"), CFSTR("Log ind"), CFSTR("Send"), CFSTR("OK"), CFSTR("Ugyldig metode. Log ind-dialogen for AppleConnect kan ikke skjules."), CFSTR("Ugyldige parametre. Nogle af inputparametrene er ikke indstillet korrekt."), CFSTR("Adgangskode til Apple-id"), CFSTR("Du lader til at være offline. Opret forbindelse til internettet og prøv igen."), CFSTR("Du har skrevet et forkert Apple-id eller adgangskode."), CFSTR("Totrinsbekræftelse kræves, men brugerhandling er ikke tilladt."), CFSTR("PÅLIDELIGE ENHEDER"), CFSTR("Gå til %@ på en Mac eller pc for at administrere dine pålidelige enheder."), CFSTR("Kunne ikke oprette en gyldig serviceanmodning"), CFSTR("Svaret til totrinsbekræftelse mangler."), CFSTR("Sms til telefonnummer"), CFSTR("Der sendes en midlertidig kode til den valgte enhed nedenfor. Du kan bruge koden til at bekræfte din identitet."),
           CFSTR("Ikke mere hukommelse"),
           CFSTR("jens.nielsen"),
           CFSTR("Send kode til %@"),
           CFSTR("Uventet aktivering af metode"),
           CFSTR("Der har været for mange mislykkede forsøg på at bekræfte koden. Send en ny kode til en anden enhed eller prøv igen senere."),
           CFSTR("Ugyldigt datatoken. Datatokenet til bekræftelse er ikke gyldigt."),
           CFSTR("Godkendelsen blev annulleret af appen"),
           CFSTR("Ugyldig længde på adgangskode"),
           CFSTR("Bekræftelseskode"),
           CFSTR("Dette Apple-id er blevet slået fra af hensyn til din sikkerhed. Du kan nulstille din adgangskode på %@"),
           CFSTR("Kan du ikke modtage meddelelser på nogen af dine enheder?"),
           CFSTR("Send en ny kode"),
           CFSTR("Der opstod en fejl. Undskyld ulejligheden. Prøv venligst igen senere."),
           CFSTR("Påkrævet"),
           CFSTR("Kan ikke finde denne person."),
           CFSTR("Angiv bekræftelseskoden"),
           CFSTR("Kan ikke finde enheden."),
           CFSTR("Apple-id"),
           CFSTR("Totrinsbekræftelse er aktiveret for dette Apple‑id. "),
           CFSTR("Kan ikke bekræfte tokenet."),
           CFSTR("Adgangskode"),
           CFSTR("Nulstille din adgangskode for at beskytte din sikkerhed. Det er nemt – bare gå til %@"),
           CFSTR("Nuværende tid på denne enhed er tilsyneladende forkert. Du kan rette det ved at gå til Indstillinger > Generelt > Dato & tid. Prøv derefter igen."),
           CFSTR("Kunne ikke oprette et gyldigt SSO-token"),
           CFSTR("Den angivne bekræftelseskode er ikke gyldig."),
           CFSTR("Fortsæt"),
           CFSTR("Bekræft identitet"),
           CFSTR("Godkendelsen blev annulleret af systemet"),
           CFSTR("Generer kode med %@"),
           CFSTR("Listen med enheder er tom."),
           CFSTR("Ugyldig session."),
           CFSTR("Svaret fra serveren er forkert"),
           CFSTR("Du har sendt for mange koder til bekræftelse af dit telefonnummer. Prøv igen senere."),
           CFSTR("telefonnummer, som slutter med %@"),
           CFSTR("Du har angivet et forkert kontonavn eller en forkert adgangskode."),
           CFSTR("Feltet Apple-id er tomt"),
           CFSTR("iForgot…"),
           CFSTR("Du har desværre haft for mange mislykkede forsøg på at bekræfte din identitet. Af hensyn til din sikkerhed kan du ikke foretage ændringer på din konto i de næste otte timer uden din gendannelsesnøgle."),
           CFSTR("Ingen tilgængelige oplysninger om enheden."),
           CFSTR("Har du glemt dit id eller din adgangskode?"),
           CFSTR("Dette Apple-id er blevet slået fra af hensyn til din sikkerhed. Du kan nulstille din adgangskode på %@"),
           CFSTR("Godkend som %@ med Touch-id"),
           CFSTR("Godkendelsen blev annulleret af brugeren"),
           CFSTR("Nummer, der slutter med %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_da;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
