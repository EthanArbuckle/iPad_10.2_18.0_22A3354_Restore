@implementation ACMLocale_fi

- (ACMLocale_fi)init
{
  ACMLocale_fi *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_fi;
  v2 = -[ACMLocale_fi init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Salasanakenttä on tyhjä"), CFSTR("Kumoa"), CFSTR("Kirjaudu sisään"), CFSTR("Lähetä"), CFSTR("OK"), CFSTR("Virheellinen metodikutsu. AppleConnect-kirjautumisvalintaikkunan kätkeminen ei onnistu."), CFSTR("Epäkelpoja parametreja. Jotkut syöttöparametrit on asetettu väärin."), CFSTR("Apple ID -salasana"), CFSTR("Et näytä olevan verkkoyhteydessä. Yhdistä Internetiin ja yritä uudelleen."), CFSTR("Apple ID:si tai salasanasi syötettiin väärin."), CFSTR("Kaksivaiheinen vahvistus vaaditaan, mutta käyttäjän vuorovaikutusta ei sallita."), CFSTR("LUOTETUT LAITTEET"), CFSTR("Voit hallita luotettuja laitteitasi käymällä osoitteessa %@ Mac- tai Windows-tietokoneella."), CFSTR("Kelvollisen palvelulipun luominen ei onnistunut"), CFSTR("Kaksivaiheisen vahvistuksen vaste on tyhjä."), CFSTR("Tekstiviesti puhelinnumeroon"), CFSTR("Alla luetelluista laitteista valitsemaasi lähetetään tilapäinen koodi, jota voit käyttää henkilöllisyytesi vahvistamiseen."),
           CFSTR("Muisti ei riitä"),
           CFSTR("jussi.kuokka"),
           CFSTR("Lähetä koodi tähän kohteeseen: %@"),
           CFSTR("Odottamaton metodikutsu"),
           CFSTR("Koodin vahvistaminen epäonnistui liian monta kertaa. Lähetä uusi koodi eri laitteeseen tai yritä myöhemmin uudelleen."),
           CFSTR("Epäkelpo datatunnus. Vahvistuksen datatunnus ei kelpaa."),
           CFSTR("Ohjelma peruutti todennuksen"),
           CFSTR("Virheellinen pääsykoodin pituus"),
           CFSTR("Vahvistuskoodi"),
           CFSTR("Tämä tili on turvallisuussyistä poistettu käytöstä. Voit nollata salasanasi osoitteessa %@."),
           CFSTR("Etkö pysty vastaanottamaan viestejä mihinkään laitteeseesi?"),
           CFSTR("Lähetä uusi koodi"),
           CFSTR("Tapahtui virhe. Kiitos kärsivällisyydestäsi, yritä myöhemmin uudelleen."),
           CFSTR("Vaaditaan"),
           CFSTR("Tätä henkilöä ei löydetä."),
           CFSTR("Syötä vahvistuskoodi"),
           CFSTR("Laitetta ei löydy."),
           CFSTR("Apple ID"),
           CFSTR("Kaksivaiheinen vahvistus on otettu käyttöön tälle Apple ID:lle."),
           CFSTR("Tunnuksen vahvistaminen ei onnistu."),
           CFSTR("Salasana"),
           CFSTR("Tietoturvasi takaamiseksi on aika nollata salasanasi. Se käy helposti osoitteessa %@."),
           CFSTR("Tämän laitteen aika näyttää olevan virheellinen. Voit korjata sen avaamalla Asetukset > Yleiset > Päivä ja aika. Yritä sitten uudelleen."),
           CFSTR("Kelvollisen SSO-tunnuksen luominen ei onnistunut"),
           CFSTR("Syöttämäsi vahvistuskoodi ei kelpaa."),
           CFSTR("Jatka"),
           CFSTR("Vahvista henkilöllisyys"),
           CFSTR("Järjestelmä peruutti todennuksen"),
           CFSTR("Luo koodi laitteella %@"),
           CFSTR("Laiteluettelo on tyhjä."),
           CFSTR("Epäkelpo istunto."),
           CFSTR("Palvelimen vastaus on virheellisessä muodossa"),
           CFSTR("Olet lähettänyt liian monta koodia puhelinnumerosi vahvistamiseksi. Yritä myöhemmin uudelleen."),
           CFSTR("puhelinnumero, joka päättyy %@"),
           CFSTR("Tilisi nimi tai salasana syötettiin väärin."),
           CFSTR("Apple ID -kenttä on tyhjä"),
           CFSTR("iForgot…"),
           CFSTR("Pahoittelemme, mutta olet tehnyt liian monta epäonnistunutta yritystä henkilöllisyytesi vahvistamiseksi. Turvallisuussyistä et pysty tekemään muutoksia tiliisi seuraavaan kahdeksaan tuntiin ilman palautusavaintasi."),
           CFSTR("Laitetietoja ei ole saatavilla."),
           CFSTR("Oletko unohtanut ID:si tai salasanasi?"),
           CFSTR("Tämä Apple ID on turvallisuussyistä poistettu käytöstä. Voit nollata salasanasi osoitteessa %@."),
           CFSTR("Todenna %@ Touch ID:llä"),
           CFSTR("Käyttäjä peruutti todennuksen"),
           CFSTR("Numero, joka päättyy %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_fi;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
