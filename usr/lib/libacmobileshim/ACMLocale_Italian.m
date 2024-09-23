@implementation ACMLocale_Italian

- (ACMLocale_Italian)init
{
  ACMLocale_Italian *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_Italian;
  v2 = -[ACMLocale_Italian init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Il campo della password è vuoto"), CFSTR("Annulla"), CFSTR("Accedi"), CFSTR("Invia"), CFSTR("OK"), CFSTR("Richiamo del metodo non corretto. Impossibile nascondere la finestra di dialogo AppleConnect SignIn."), CFSTR("Parametri non validi. Alcuni dei parametri di input non sono impostati correttamente."), CFSTR("Password dell'ID Apple"), CFSTR("Il tuo stato è offline. Connettiti a internet e riprova."), CFSTR("ID Apple o password non inseriti correttamente."), CFSTR("È richiesta la verifica in due passaggi, ma l'interazione dell'utente non è consentita."), CFSTR("DISPOSITIVI REGISTRATI"), CFSTR("Per gestire i tuoi dispositivi registrati visita %@ da un Mac o da un PC."), CFSTR("Impossibile creare un ticket di assistenza valido"), CFSTR("La risposta della verifica in due passaggi è vuota."), CFSTR("SMS al numero di telefono"), CFSTR("Sul dispositivo che hai scelto ti verrà inviato un codice temporaneo per la verifica dell'identità."),
           CFSTR("Memoria esaurita"),
           CFSTR("mario.rossi"),
           CFSTR("Invia codice a %@"),
           CFSTR("Chiamata metodo non attesa"),
           CFSTR("Hai eseguito troppi tentativi falliti di verificare il codice. Invia un nuovo codice a un dispositivo diverso o riprova più tardi."),
           CFSTR("Token dati non valido. Il token dati per la verifica non è valido."),
           CFSTR("L'autenticazione è stata annullata dall'applicazione"),
           CFSTR("Lunghezza codice non valida"),
           CFSTR("Codice di verifica"),
           CFSTR("Questo nome account è stato disattivato per motivi di sicurezza. Puoi reimpostare la password su %@."),
           CFSTR("Non riesci a ricevere messaggi su nessuno dei tuoi dispositivi?"),
           CFSTR("Invia un nuovo codice"),
           CFSTR("Spiacenti, si è verificato un errore. Grazie per la pazienza, riprova più tardi."),
           CFSTR("Obbligatorio"),
           CFSTR("Impossibile trovare questa persona."),
           CFSTR("Inserisci codice di verifica"),
           CFSTR("Il dispositivo non è stato trovato."),
           CFSTR("ID Apple"),
           CFSTR("La verifica in due passaggi è attiva per questo ID Apple. "),
           CFSTR("Impossibile verificare il token."),
           CFSTR("Password"),
           CFSTR("Per proteggere la tua sicurezza, ti consigliamo di reimpostare la tua password. È semplice, basta accedere a %@."),
           CFSTR("L'orario attualmente visualizzato sul dispositivo non sembra essere corretto. Puoi correggerlo accedendo a Impostazioni > Generale > Data e ora e quindi riprovare."),
           CFSTR("Impossibile creare un token SSO valido"),
           CFSTR("Il codice di verifica inserito non è valido."),
           CFSTR("Continua"),
           CFSTR("Verifica identità"),
           CFSTR("L'autenticazione è stata annullata dal sistema"),
           CFSTR("Genera codice con %@"),
           CFSTR("L'elenco dispositivi è vuoto."),
           CFSTR("Sessione non valida."),
           CFSTR("La risposta del server non è corretta"),
           CFSTR("Hai inviato troppi codici per verificare il tuo numero di telefono. Riprova più tardi."),
           CFSTR("il numero di telefono termina con %@"),
           CFSTR("Il tuo ID Apple o la password non sono stati inseriti correttamente."),
           CFSTR("Il campo ID Apple è vuoto"),
           CFSTR("iForgot…"),
           CFSTR("Hai eseguito troppi tentativi falliti di verificare la tua identità. Per motivi di sicurezza, non potrai apportare modifiche al tuo account per le prossime otto ore senza la chiave di recupero."),
           CFSTR("Informazioni sul dispositivo non disponibili."),
           CFSTR("Hai dimenticato l'ID o la password?"),
           CFSTR("Questo ID Apple è stato disattivato per motivi di sicurezza. Puoi reimpostare la password su %@."),
           CFSTR("Esegui autenticazione come %@ con Touch ID"),
           CFSTR("L'autenticazione è stata annullata dall'utente"),
           CFSTR("Numero che termina con %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_Italian;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
