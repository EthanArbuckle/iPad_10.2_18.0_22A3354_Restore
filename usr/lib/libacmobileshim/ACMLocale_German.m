@implementation ACMLocale_German

- (ACMLocale_German)init
{
  ACMLocale_German *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_German;
  v2 = -[ACMLocale_German init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Passwortfeld ist leer"), CFSTR("Abbrechen"), CFSTR("Anmelden"), CFSTR("Senden"), CFSTR("OK"), CFSTR("Methode wurde unsachgemäß aufgerufen. AppleConnect-Anmeldedialog kann nicht ausgeblendet werden."), CFSTR("Ungültige Parameter. Einige der Eingabeparameter sind falsch eingestellt."), CFSTR("Passwort für die Apple-ID"), CFSTR("Sie scheinen offline zu sein. Verbinden Sie sich mit dem Internet und versuchen Sie es erneut."), CFSTR("Ihre Apple-ID oder Ihr Passwort wurde falsch eingegeben."), CFSTR("Zweistufige Bestätigung erforderlich. Es ist jedoch keine Benutzerinteraktion zulässig."), CFSTR("VERTRAUENSWÜRDIGE GERÄTE"), CFSTR("Gehen Sie von einem Mac oder PC aus zu %@, um Ihre vertrauenswürdigen Geräte zu verwalten."), CFSTR("Erstellen eines gültigen Service-Tickets ist fehlgeschlagen"), CFSTR("Antwort auf zweistufige Bestätigung ist leer."), CFSTR("SMS an Telefonnummer"), CFSTR("An das von Ihnen unten ausgewählte Gerät wird ein temporärer Code gesendet, den Sie verwenden können, um Ihre Identität zu bestätigen."),
           CFSTR("Nicht genügend Arbeitsspeicher"),
           CFSTR("max.mustermann"),
           CFSTR("Code an %@ senden"),
           CFSTR("Unerwarteter Methodenaufruf"),
           CFSTR("Die Bestätigung des Codes ist zu oft fehlgeschlagen. Senden Sie einen neuen Code an ein anderes Gerät oder versuchen Sie es später erneut."),
           CFSTR("Ungültiger Daten-Token. Der Daten-Token zum Bestätigen ist ungültig."),
           CFSTR("Authentifizierung wurde vom Programm abgebrochen"),
           CFSTR("Ungültige Codelänge"),
           CFSTR("Bestätigungscode"),
           CFSTR("Dieses Konto wurde aus Sicherheitsgründen deaktiviert. Sie können Ihr Passwort unter %@ zurücksetzen."),
           CFSTR("Sie können auf keinem Ihrer Geräte Nachrichten empfangen?"),
           CFSTR("Einen neuen Code senden"),
           CFSTR("Es ist ein Fehler aufgetreten, versuchen Sie es später erneut."),
           CFSTR("Erforderlich"),
           CFSTR("Diese Person konnte nicht gefunden werden."),
           CFSTR("Bestätigungscode eingeben."),
           CFSTR("Das Gerät wurde nicht gefunden."),
           CFSTR("Apple-ID"),
           CFSTR("Für diese Apple‑ID ist die zweistufige Bestätigung aktiviert."),
           CFSTR("Token kann nicht bestätigt werden."),
           CFSTR("Passwort"),
           CFSTR("Sie sollten Ihr Passwort zurücksetzen, um Ihre Sicherheit zu schützen. Gehen Sie dazu einfach zu %@."),
           CFSTR("Die aktuelle Zeit scheint auf diesem Gerät falsch zu sein. Gehen Sie „Einstellungen“ > „Allgemein“ > „Datum & Uhrzeit“, um dies zu korrigieren, und versuchen Sie es erneut."),
           CFSTR("Erstellen eines gültigen SSO-Token ist fehlgeschlagen"),
           CFSTR("Der eingegebene Bestätigungscode ist ungültig."),
           CFSTR("Weiter"),
           CFSTR("Identität bestätigen"),
           CFSTR("Authentifizierung wurde vom System abgebrochen"),
           CFSTR("Code mit %@ erstellen"),
           CFSTR("Die Geräteliste ist leer."),
           CFSTR("Ungültige Sitzung."),
           CFSTR("Antwort vom Server ist fehlerhaft"),
           CFSTR("Sie haben zum Bestätigen Ihrer Telefonnummer zu viele Codes gesendet. Versuchen Sie es später erneut."),
           CFSTR("Telefonnummer, die auf „%@“ endet"),
           CFSTR("Ihr Accountname oder Ihr Passwort wurde falsch eingegeben."),
           CFSTR("Apple-ID-Feld ist leer"),
           CFSTR("iForgot …"),
           CFSTR("Sie haben zu oft ohne Erfolg versucht, Ihre Identität zu bestätigen. Aus Sicherheitsgründen können Sie ohne Ihren Wiederherstellungsschlüssel innerhalb der nächsten acht Stunden keine Änderungen an Ihrem Account vornehmen."),
           CFSTR("Keine Geräteinformationen verfügbar."),
           CFSTR("ID oder Passwort vergessen?"),
           CFSTR("Diese Apple-ID wurde aus Sicherheitsgründen deaktiviert. Sie können Ihr Passwort unter %@ zurücksetzen."),
           CFSTR("Als %@ mit Touch ID authentifizieren"),
           CFSTR("Authentifizierung wurde vom Benutzer abgebrochen"),
           CFSTR("Nummer mit den Endziffern %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_German;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
