@implementation ACMLocale_sv

- (ACMLocale_sv)init
{
  ACMLocale_sv *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_sv;
  v2 = -[ACMLocale_sv init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Lösenordsfältet är tomt"), CFSTR("Avbryt"), CFSTR("Logga in"), CFSTR("Skicka"), CFSTR("OK"), CFSTR("Ogiltig användning av metoden. AppleConnect SignIn-dialogen kan inte döljas."), CFSTR("Ogiltiga parametrar. Vissa indataparametrar har ställts in felaktigt."), CFSTR("Lösenord för Apple-ID"), CFSTR("Du verkar vara offline. Anslut till Internet och försök igen."), CFSTR("Du har skrivit in fel Apple-ID eller lösenord."), CFSTR("Tvåstegsverifiering krävs, men användaråtgärder är inte tillåtna."), CFSTR("TILLFÖRLITLIGA ENHETER"), CFSTR("Om du vill hantera dina tillförlitliga enheter kan du besöka %@ från en Mac eller PC."), CFSTR("Kunde inte skapa en giltig serviceanmälan"), CFSTR("Svaret för tvåstegsverifiering är tomt."), CFSTR("Skicka sms till telefonnummer"), CFSTR("En tillfällig kod kommer att skickas till enheten som du väljer nedan. Du kan använda koden till att verifiera din identitet."),
           CFSTR("Minnet räcker inte till"),
           CFSTR("lars.svensson"),
           CFSTR("Skicka kod till %@"),
           CFSTR("Oväntat metodanrop"),
           CFSTR("Du har misslyckats med att verifiera koden för många gånger. Skicka en ny kod till en annan enhet eller försök igen senare."),
           CFSTR("Ogiltigt datatoken. Detta datatoken för verifiering är inte giltigt."),
           CFSTR("Programmet avbröt autentiseringen"),
           CFSTR("Ogiltig längd på lösenkod"),
           CFSTR("Verifieringskod"),
           CFSTR("Detta konto har avaktiverats av säkerhetsskäl. Du kan nollställa ditt lösenord på %@."),
           CFSTR("Går det inte att ta emot meddelanden på någon av dina enheter?"),
           CFSTR("Skicka en ny kod"),
           CFSTR("Ett fel har uppstått. Försök igen senare. Tack för ditt tålamod."),
           CFSTR("Krävs"),
           CFSTR("Kunde inte hitta personen."),
           CFSTR("Ange verifieringskod"),
           CFSTR("Enheten hittades inte."),
           CFSTR("Apple-ID"),
           CFSTR("Tvåstegsverifiering är aktiverat för detta Apple-ID."),
           CFSTR("Kunde inte verifiera token."),
           CFSTR("Lösenord"),
           CFSTR("Av säkerhetsskäl bör du nollställa ditt lösenord. Det är enkelt, gå bara till %@."),
           CFSTR("Tiden verkar vara fel inställd på den här enheten. Du kan fixa det genom att gå till Inställningar > Allmänt > Datum och tid, och sedan försöka igen."),
           CFSTR("Kunde inte skapa ett giltigt SSO-token"),
           CFSTR("Verifieringskoden som du har angett är ogiltig."),
           CFSTR("Fortsätt"),
           CFSTR("Verifiera identitet"),
           CFSTR("Systemet avbröt autentiseringen"),
           CFSTR("Generera kod med %@"),
           CFSTR("Enhetslistan är tom."),
           CFSTR("Ogiltig session."),
           CFSTR("Svaret från servern innehåller fel"),
           CFSTR("Du har skickat för många koder för att verifiera ditt telefonnummer. Försök igen senare."),
           CFSTR("telefonnummer som slutar med %@"),
           CFSTR("Du har skrivit in fel kontonamn eller lösenord."),
           CFSTR("Fältet för Apple-ID är tomt"),
           CFSTR("iForgot…"),
           CFSTR("Du har tyvärr gjort för många misslyckade försök att verifiera din identitet. Av säkerhetsskäl kan du inte ändra något i ditt konto inom åtta timmar utan återställningsnyckeln."),
           CFSTR("Ingen enhetsinformation tillgänglig."),
           CFSTR("Har du glömt ditt ID eller lösenord?"),
           CFSTR("Detta Apple-ID har avaktiverats av säkerhetsskäl. Du kan nollställa ditt lösenord på %@."),
           CFSTR("Autentisera som %@ med Touch ID"),
           CFSTR("Användaren avbröt autentiseringen"),
           CFSTR("Nummer som slutar på %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_sv;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
