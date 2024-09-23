@implementation ACMLocale_Dutch

- (ACMLocale_Dutch)init
{
  ACMLocale_Dutch *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_Dutch;
  v2 = -[ACMLocale_Dutch init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Wachtwoordveld is leeg"), CFSTR("Annuleer"), CFSTR("Log in"), CFSTR("Stuur"), CFSTR("OK"), CFSTR("Ongeldig beroep op de methode. AppleConnect SignIn dialoogvenster kan niet worden verborgen."), CFSTR("Ongeldige parameters. Bepaalde invoerparameters zijn onjuist ingesteld."), CFSTR("Apple ID-wachtwoord"), CFSTR("U lijkt offline te zijn. Maak verbinding met het internet en probeer het opnieuw."), CFSTR("Uw Apple ID of wachtwoord is onjuist ingevoerd."), CFSTR("Twee-staps-verificatie vereist, maar gebruikersinteractie is niet toegestaan."), CFSTR("BETROUWBARE APPARATEN"), CFSTR("Om uw betrouwbare apparaten te beheren, gaat u naar %@ vanaf een Mac of pc."), CFSTR("Aanmaken geldig serviceticket mislukt"), CFSTR("Twee-staps-verificatie antwoord is leeg."), CFSTR("Sms naar telefoonnummer"), CFSTR("Er wordt een tijdelijke code gestuurd naar het apparaat dat u hieronder kiest, waarmee u uw identiteit kunt verifiëren."),
           CFSTR("Geen geheugen meer"),
           CFSTR("john.appleseed"),
           CFSTR("Stuur code naar %@"),
           CFSTR("Onverwachte inroeping methode"),
           CFSTR("U bent er te vaak niet in geslaagd om de code te verifiëren. Stuur een nieuwe code naar een ander apparaat of probeer het later opnieuw."),
           CFSTR("Ongeldig data-teken. Data-teken voor verifiëren is niet geldig."),
           CFSTR("Identiteitscontrole werd door programma geannuleerd"),
           CFSTR("Ongeldige toegangscode-lengte"),
           CFSTR("Verificatiecode"),
           CFSTR("Deze Apple ID is om veiligheidsredenen buiten werking gesteld. U kunt uw wachtwoord opnieuw instellen op %@."),
           CFSTR("Niet in staat om berichten op uw apparaten te ontvangen?"),
           CFSTR("Stuur een nieuwe code"),
           CFSTR("Er is een fout opgetreden. Dank u voor uw geduld. Probeer het later opnieuw."),
           CFSTR("Vereist"),
           CFSTR("Kan deze persoon niet vinden."),
           CFSTR("Voer verificatiecode in"),
           CFSTR("Apparaat is niet gevonden."),
           CFSTR("Apple ID"),
           CFSTR("Tweestapsverificatie is ingeschakeld voor deze Apple ID."),
           CFSTR("Kan teken niet verifiëren."),
           CFSTR("Wachtwoord"),
           CFSTR("Om uw veiligheid te waarborgen, is het tijd om uw wachtwoord opnieuw in te stellen. U doet dit gewoon op %@."),
           CFSTR("De huidige tijd op dit apparaat lijkt onjuist te zijn. U kunt dit corrigeren via 'Instellingen > Algemeen > Datum en tijd', probeer daarna opnieuw."),
           CFSTR("Aanmaken geldig SSO-teken mislukt"),
           CFSTR("De verificatiecode die u hebt ingevoerd is ongeldig."),
           CFSTR("Ga verder"),
           CFSTR("Verifieer identiteit"),
           CFSTR("Identiteitscontrole werd door systeem geannuleerd"),
           CFSTR("Genereer code met %@"),
           CFSTR("Apparaatlijst is leeg."),
           CFSTR("Ongeldige sessie."),
           CFSTR("Antwoord van server is misvormd"),
           CFSTR("U hebt te veel codes verstuurd om uw telefoonnummer te verifiëren. Probeer het later opnieuw."),
           CFSTR("telefoonnummer eindigend op %@"),
           CFSTR("Uw accountnaam of wachtwoord is onjuist ingevoerd."),
           CFSTR("Apple ID-veld is leeg"),
           CFSTR("iForgot…"),
           CFSTR("U hebt helaas te vaak tevergeefs geprobeerd uw identiteit te verifiëren. Om veiligheidsredenen kunt u de komende acht uur geen wijzigingen aanbrengen aan uw account zonder uw herstelcode."),
           CFSTR("Geen informatie over apparaten beschikbaar."),
           CFSTR("ID of wachtwoord vergeten?"),
           CFSTR("Deze Apple ID is om veiligheidsredenen buiten werking gesteld. U kunt uw wachtwoord opnieuw instellen op %@."),
           CFSTR("Identiteitscontrole als %@ met Touch ID"),
           CFSTR("Identiteitscontrole werd door gebruiker geannuleerd"),
           CFSTR("Nummer dat eindigt op %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_Dutch;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
