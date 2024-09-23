@implementation ACMLocale_el

- (ACMLocale_el)init
{
  ACMLocale_el *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_el;
  v2 = -[ACMLocale_el init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Το πεδίο συνθηματικού είναι κενό"), CFSTR("Ακύρωση"), CFSTR("Σύνδεση"), CFSTR("Αποστολή"), CFSTR("ΟΚ"), CFSTR("Λανθασμένη κλήση της μεθόδου. Δεν είναι δυνατή η απόκρυψη του παραθύρου διαλόγου σύνδεσης AppleConnect."), CFSTR("Μη έγκυρες παράμετροι. Μερικές παράμετροι εισαγωγής έχουν ρυθμιστεί λανθασμένα."), CFSTR("Συνθηματικό Apple ID"), CFSTR("Φαίνεται ότι είστε εκτός σύνδεσης. Συνδεθείτε στο Internet και δοκιμάστε ξανά."), CFSTR("Εσφαλμένη εισαγωγή Apple ID ή συνθηματικού."), CFSTR("Απαιτείται επαλήθευση δύο βημάτων, αλλά η αλληλεπίδραση χρήστη δεν επιτρέπεται."), CFSTR("ΑΞΙΟΠΙΣΤΕΣ ΣΥΣΚΕΥΕΣ"), CFSTR("Για διαχείριση των αξιόπιστων συσκευών σας, επισκεφτείτε τη διεύθυνση %@ από Mac ή PC."), CFSTR("Απέτυχε η δημιουργία έγκυρου εισιτηρίου υπηρεσίας"), CFSTR("Η απόκριση της επαλήθευσης δύο βημάτων είναι κενή."), CFSTR("SMS σε τηλεφωνικό αριθμό"), CFSTR("Στη συσκευή που θα επιλέξετε παρακάτω θα αποσταλεί ένας προσωρινός κωδικός, τον οποίον μπορείτε να χρησιμοποιήσετε για να επαληθεύσετε την ταυτότητά σας."),
           CFSTR("Εξαντλήθηκε η μνήμη"),
           CFSTR("maria.milosporou"),
           CFSTR("Αποστολή κωδικού σε %@"),
           CFSTR("Απρόσμενη επίκληση μεθόδου"),
           CFSTR("Δεν καταφέρατε να επαληθεύσετε τον κωδικό πάρα πολλές φορές. Αποστείλτε ένα νέο κωδικό σε διαφορετική συσκευή ή δοκιμάστε ξανά αργότερα."),
           CFSTR("Μη έγκυρο διαπιστευτήριο δεδομένων. Το διαπιστευτήριο δεδομένων για επαλήθευση δεν είναι έγκυρο."),
           CFSTR("Ο έλεγχος ταυτότητας ακυρώθηκε από την εφαρμογή"),
           CFSTR("Μη έγκυρο μήκος συνθηματικού"),
           CFSTR("Κωδικός επαλήθευσης"),
           CFSTR("Αυτό το Apple ID έχει απενεργοποιηθεί για λόγους ασφαλείας. Μπορείτε να επαναφέρετε το συνθηματικό σας στο %@."),
           CFSTR("Είναι αδύνατη η λήψη μηνυμάτων σε οποιαδήποτε από τις συσκευές σας;"),
           CFSTR("Αποστολή νέου κωδικού"),
           CFSTR("Παρουσιάστηκε σφάλμα. Ευχαριστούμε για την υπομονή σας, δοκιμάστε ξανά αργότερα."),
           CFSTR("Υποχρεωτικό"),
           CFSTR("Αυτό το άτομο δεν βρέθηκε."),
           CFSTR("Εισαγωγή κωδικού επαλήθευσης"),
           CFSTR("Η συσκευή δεν βρέθηκε."),
           CFSTR("Apple ID"),
           CFSTR("Η επαλήθευση δύο βημάτων είναι ενεργοποιημένη για αυτό το Apple ID."),
           CFSTR("Δεν είναι δυνατή η επαλήθευση του διαπιστευτηρίου."),
           CFSTR("Συνθηματικό"),
           CFSTR("Για την προστασία της ασφάλειάς σας, έφτασε η στιγμή να επαναφέρετε το συνθηματικό σας. Είναι εύκολο, απλώς μεταβείτε στο %@."),
           CFSTR("Η τρέχουσα ώρα σε αυτήν τη συσκευή φαίνεται να είναι λανθασμένη. Μπορείτε να την επιδιορθώσετε αν μεταβείτε στις Ρυθμίσεις > Γενικά > Ημερομηνία και ώρα, και μετά δοκιμάσετε ξανά."),
           CFSTR("Απέτυχε η δημιουργία έγκυρου διαπιστευτηρίου SSO"),
           CFSTR("Ο κωδικός επαλήθευσης που εισαγάγατε δεν είναι έγκυρος."),
           CFSTR("Συνέχεια"),
           CFSTR("Επαλήθευση ταυτότητας"),
           CFSTR("Ο έλεγχος ταυτότητας ακυρώθηκε από το σύστημα"),
           CFSTR("Δημιουργία κωδικού με %@"),
           CFSTR("Η λίστα συσκευών είναι κενή."),
           CFSTR("Μη έγκυρη συνεδρία."),
           CFSTR("Η απάντηση από τον διακομιστή έχει λανθασμένη μορφή"),
           CFSTR("Αποστείλατε πάρα πολλούς κωδικούς για την επαλήθευση του αριθμού τηλεφώνου σας. Δοκιμάστε ξανά αργότερα."),
           CFSTR("τηλέφωνο που λήγει σε %@"),
           CFSTR("Το όνομα λογαριασμού ή το συνθηματικό σας εισήχθη λανθασμένα."),
           CFSTR("Το πεδίο Apple ID είναι κενό"),
           CFSTR("iForgot…"),
           CFSTR("Λυπούμαστε, αλλά πραγματοποιήσατε πάρα πολλές αποτυχημένες απόπειρες επαλήθευσης της ταυτότητάς σας. Για λόγους ασφάλειας, δεν θα μπορείτε να πραγματοποιήσετε αλλαγές στον λογαριασμό σας για τις επόμενες οκτώ ώρες χωρίς το κλειδί ανάκτησής σας."),
           CFSTR("Δεν διατίθενται πληροφορίες συσκευής."),
           CFSTR("Ξεχάσατε το ID ή το συνθηματικό σας;"),
           CFSTR("Αυτό το Apple ID έχει απενεργοποιηθεί για λόγους ασφαλείας. Μπορείτε να επαναφέρετε το συνθηματικό σας στο %@."),
           CFSTR("Έλεγχος ταυτότητας ως %@ με Touch ID"),
           CFSTR("Ο έλεγχος ταυτότητας ακυρώθηκε από τον χρήστη"),
           CFSTR("Αριθμός που λήγει σε %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_el;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
