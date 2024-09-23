@implementation ACMLocale_French

- (ACMLocale_French)init
{
  ACMLocale_French *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_French;
  v2 = -[ACMLocale_French init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Le champ du mot de passe est vide"), CFSTR("Annuler"), CFSTR("Connexion"), CFSTR("Envoyer"), CFSTR("OK"), CFSTR("Appel incorrect de la méthode. Le dialogue de connexion AppleConnect ne peut pas être masqué."), CFSTR("Paramètres non valides. Certains paramètres de saisie sont incorrects."), CFSTR("mot de passe de l’identifiant Apple"), CFSTR("Vous semblez être hors ligne. Veuillez vous connecter à Internet et réessayer."), CFSTR("Votre identifiant Apple ou votre mot de passe n’a pas été saisi correctement."), CFSTR("La validation en deux étapes est nécessaire, mais l’interaction des utilisateurs n’est pas autorisée."), CFSTR("APPAREILS DE CONFIANCE"), CFSTR("Pour gérer vos appareils sécurisés, rendez-vous sur %@ à l’aide d’un Mac ou d’un PC."), CFSTR("Échec de la création d’un ticket de service valide"), CFSTR("La réponse à la validation en deux étapes est vide."), CFSTR("Envoyer un SMS vers un numéro de téléphone"), CFSTR("Un code temporaire qui vous servira à vérifier votre identité, sera envoyé à l’appareil que vous aurez sélectionné ci-dessous."),
           CFSTR("Mémoire insuffisante"),
           CFSTR("Jean Martin"),
           CFSTR("Envoyer le code à %@"),
           CFSTR("Invocation de la méthode inattendue"),
           CFSTR("Vous avez dépassé le nombre maximal de tentatives de validation du code. Envoyez un nouveau code à un appareil différent ou réessayez ultérieurement."),
           CFSTR("Jeton de données non valide. Le jeton de données de validation n’est pas valide."),
           CFSTR("Authentification annulée par l’application"),
           CFSTR("Longueur incorrecte du mot de passe"),
           CFSTR("Code de validation"),
           CFSTR("Ce compte a été désactivé pour des raisons de sécurité. Vous pouvez réinitialiser votre mot de passe sur %@."),
           CFSTR("Vous ne recevez aucun message sur vos appareils ?"),
           CFSTR("Envoyer un nouveau code"),
           CFSTR("Une erreur est survenue. Nous vous remercions de votre patience. Veuillez réessayer ultérieurement."),
           CFSTR("Obligatoire"),
           CFSTR("Personne introuvable."),
           CFSTR("Saisir le code de validation"),
           CFSTR("Appareil introuvable."),
           CFSTR("Identifiant Apple"),
           CFSTR("La validation en deux étapes est activée pour cet identifiant Apple."),
           CFSTR("Impossible de vérifier le jeton."),
           CFSTR("Mot de passe"),
           CFSTR("Il est temps de réinitialiser votre mot de passe afin de renforcer votre sécurité. C’est simple, il suffit d’aller à %@."),
           CFSTR("L’heure affichée par cet appareil semble être incorrecte. Pour la changer, rendez-vous dans Réglages > Général > Date et heure, puis réessayez."),
           CFSTR("Échec de la création d’un jeton d’identification SSO valide"),
           CFSTR("Le code de validation que vous avez saisi n’est pas valide."),
           CFSTR("Continuer"),
           CFSTR("Valider l’identité"),
           CFSTR("Authentification annulée par le système"),
           CFSTR("Générer le code avec %@"),
           CFSTR("La liste d’appareils est vide."),
           CFSTR("Session non valide."),
           CFSTR("La réponse du serveur est incorrecte"),
           CFSTR("Vous avez dépassé le nombre maximal de codes envoyés afin de vérifier votre numéro de téléphone. Veuillez réessayer ultérieurement."),
           CFSTR("numéro de téléphone se terminant par %@"),
           CFSTR("Votre nom de compte ou votre mot de passe est incorrect."),
           CFSTR("Le champ de l’identifiant Apple est vide"),
           CFSTR("iForgot…"),
           CFSTR("Nous sommes désolés, mais vous avez effectué trop de tentatives infructueuses afin de vérifier votre identité. Pour des raisons de sécurité, sauf si vous utilisez votre clé de secours, vous ne pourrez pas modifier votre compte au cours des huit prochaines heures."),
           CFSTR("Aucune information disponible sur l’appareil."),
           CFSTR("Vous avez oublié votre identifiant ou votre mot de passe ?"),
           CFSTR("Cet identifiant Apple a été désactivé pour des raisons de sécurité. Vous pouvez réinitialiser votre mot de passe sur %@."),
           CFSTR("S’authentifier en tant que %@ avec Touch ID"),
           CFSTR("Authentification annulée par l’utilisateur"),
           CFSTR("Numéro se terminant par %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_French;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
