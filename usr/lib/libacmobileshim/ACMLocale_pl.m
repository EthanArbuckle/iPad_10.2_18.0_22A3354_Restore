@implementation ACMLocale_pl

- (ACMLocale_pl)init
{
  ACMLocale_pl *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_pl;
  v2 = -[ACMLocale_pl init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Pole hasła jest puste."), CFSTR("Anuluj"), CFSTR("Zaloguj się"), CFSTR("Wyślij"), CFSTR("OK"), CFSTR("Nieprawidłowe wywołanie metody. Nie można ukryć okna dialogowego logowania AppleConnect."), CFSTR("Błędne parametry. Niektóre parametry wejściowe ustawiono nieprawidłowo."), CFSTR("Hasło Apple ID"), CFSTR("Prawdopodobnie jesteś w trybie offline. Połącz się z Internetem i spróbuj ponownie."), CFSTR("Wprowadzono nieprawidłowy Apple ID lub błędne hasło."), CFSTR("Wymagana jest dwustopniowa weryfikacja, ale interakcje z użytkownikiem nie są dozwolone."), CFSTR("ZAUFANE URZĄDZENIA"), CFSTR("Aby zarządzać zaufanymi urządzeniami, odwiedź stronę %@ na komputerze Mac lub PC."), CFSTR("Nie udało się utworzyć prawidłowego biletu na usługę."), CFSTR("Pole odpowiedzi dotyczącej dwustopniowej weryfikacji jest puste."), CFSTR("Wyślij wiadomość SMS na numer telefonu"), CFSTR("Na wybrane przez Ciebie urządzenie zostanie wysłany tymczasowy kod, którego możesz użyć, aby potwierdzić swoją tożsamość."),
           CFSTR("Brak pamięci"),
           CFSTR("jan.kowalski"),
           CFSTR("Wyślij kod na %@"),
           CFSTR("Nieoczekiwane wywołanie metody"),
           CFSTR("Podjęto zbyt wiele nieudanych prób weryfikacji kodu. Wyślij nowy kod na inne urządzenie lub spróbuj ponownie później."),
           CFSTR("Błędny token danych. Token danych do weryfikacji jest nieprawidłowy."),
           CFSTR("Uwierzytelnienie zostało anulowane przez aplikację."),
           CFSTR("Nieprawidłowa długość kodu"),
           CFSTR("Kod weryfikacyjny"),
           CFSTR("To konto zostało wyłączone ze względów bezpieczeństwa. Możesz wyzerować hasło na stronie %@."),
           CFSTR("Nie otrzymujesz wiadomości na żadne ze swoich urządzeń?"),
           CFSTR("Wyślij nowy kod"),
           CFSTR("A survenit o eroare. Vă mulțumim pentru răbdare și vă rugăm să încercați mai târziu."),
           CFSTR("Wymagane"),
           CFSTR("Nie można znaleźć tej osoby."),
           CFSTR("Wprowadź kod weryfikacyjny"),
           CFSTR("Nie znaleziono urządzenia."),
           CFSTR("Apple ID"),
           CFSTR("Dla tego Apple ID włączono dwustopniową weryfikację."),
           CFSTR("Nie można zweryfikować tokenu."),
           CFSTR("Hasło"),
           CFSTR("Aby chronić bezpieczeństwo, pora wyzerować hasło. To proste,  wystarczy odwiedzić stronę %@."),
           CFSTR("Aktualna godzina na tym urządzeniu prawdopodobnie jest nieprawidłowa. Możesz ją poprawić, przechodząc do Ustawienia > Ogólne > Data i czas, a następnie spróbować ponownie."),
           CFSTR("Nie udało się utworzyć prawidłowego tokenu SSO."),
           CFSTR("Podany kod weryfikacyjny jest nieprawidłowy."),
           CFSTR("Kontynuuj"),
           CFSTR("Potwierdź tożsamość"),
           CFSTR("Uwierzytelnienie zostało anulowane przez system."),
           CFSTR("Wygeneruj kod przy użyciu %@"),
           CFSTR("Lista urządzeń jest pusta."),
           CFSTR("Sesja nieprawidłowa."),
           CFSTR("Odpowiedź z serwera jest zniekształcona."),
           CFSTR("Wysłano zbyt wiele kodów służących do weryfikacji numeru telefonu. Spróbuj ponownie później."),
           CFSTR("numer telefonu kończący się na %@"),
           CFSTR("Nieprawidłowo wpisano nazwę konta lub hasło."),
           CFSTR("Pole Apple ID jest puste."),
           CFSTR("iForgot…"),
           CFSTR("Niestety, podjęto zbyt wiele nieudanych prób potwierdzenia tożsamości. Ze względów bezpieczeństwa bez klucza odzyskiwania nie będzie można dokonywać zmian na koncie przez następne osiem godzin."),
           CFSTR("Brak dostępnych informacji o urządzeniu."),
           CFSTR("Nie pamiętasz ID lub hasła?"),
           CFSTR("Ten Apple ID został wyłączony ze względów bezpieczeństwa. Możesz wyzerować hasło na stronie %@."),
           CFSTR("Uwierzytelnij jako %@ przy użyciu Touch ID."),
           CFSTR("Uwierzytelnienie zostało anulowane przez użytkownika."),
           CFSTR("Numer zakończony na %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_pl;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
