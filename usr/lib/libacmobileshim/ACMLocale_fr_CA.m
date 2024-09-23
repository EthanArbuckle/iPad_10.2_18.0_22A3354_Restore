@implementation ACMLocale_fr_CA

- (ACMLocale_fr_CA)init
{
  ACMLocale_fr_CA *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_fr_CA;
  v2 = -[ACMLocale_fr_CA init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Le champ Mot de passe est vide"), CFSTR("Annuler"), CFSTR("Connexion"), CFSTR("Envoyer"), CFSTR("OK"), CFSTR("Appel de la méthode incorrect. La boîte de dialogue AppleConnect SignIn ne peut être masquée."), CFSTR("Paramètres incorrects. Certains paramètres d’entrée sont incorrects."), CFSTR("Mot de passe de l’identifiant Apple"), CFSTR("Votre statut est hors-ligne. Veuillez vous connecter à l’Internet et essayer de nouveau."), CFSTR("Votre identifiant Apple ou votre mot de passe n’a pas été saisi correctement."), CFSTR("Validation en deux étapes requise, mais l’interaction avec l’utilisateur est interdite."), CFSTR("APPAREILS DE CONFIANCE"), CFSTR("Pour gérer vos appareils de confiance, consultez %@ sur un Mac ou un PC."), CFSTR("La création du ticket d’assistance a échoué"), CFSTR("Le champ de réponse de la validation en deux étapes est vide."), CFSTR("Envoyer une messagerie texte vers un numéro de téléphone"), CFSTR("L’appareil que vous sélectionnez ci-dessous recevra un code temporaire, que vous pouvez utiliser pour valider votre identité."),
           CFSTR("Mémoire insuffisante"),
           CFSTR("Marc Lavoie"),
           CFSTR("Envoyer le code à %@"),
           CFSTR("Méthode d’appel inattendue"),
           CFSTR("Vous avez effectué trop de tentatives infructueuses afin de vérifier votre compte. Veuillez envoyer un nouveau code à un appareil différent ou essayer de nouveau plus tard."),
           CFSTR("Jeton de données invalide. Le jeton de données de vérification est invalide."),
           CFSTR("L’identification a été annulée par l’application"),
           CFSTR("Longueur du code de sécurité non valide"),
           CFSTR("Code de validation"),
           CFSTR("Cet identifiant Apple a été désactivé pour des raisons de sécurité. Vous pouvez réinitialiser votre mot de passe à %@."),
           CFSTR("Vous ne pouvez pas recevoir de messages sur vos appareils?"),
           CFSTR("Envoyer un nouveau code"),
           CFSTR("Désolé! Une erreur est survenue. Nous vous remercions de votre patience. Veuillez réessayer plus tard."),
           CFSTR("Obligatoire"),
           CFSTR("Cette personne est introuvable."),
           CFSTR("Entrer le code de validation"),
           CFSTR("L’appareil est introuvable."),
           CFSTR("Identifiant Apple"),
           CFSTR("La validation en deux étapes est activée pour cet identifiant Apple."),
           CFSTR("Le jeton ne peut être vérifié."),
           CFSTR("Mot de passe"),
           CFSTR("Afin de protéger votre sécurité, il est temps de réinitialiser votre mot de passe. C’est facile, il suffit de vous rendre à %@."),
           CFSTR("L’heure actuelle sur cet appareil semble incorrecte. Vous pouvez la changer en allant dans Réglages > Général > Date et heure, puis essayer de nouveau."),
           CFSTR("La création d’un jeton d’authentification par signature unique a échoué"),
           CFSTR("Le code de validation que vous avez entré est incorrect."),
           CFSTR("Continuer"),
           CFSTR("Valider l’identité"),
           CFSTR("L’identification a été annulée par le système"),
           CFSTR("Générer le code avec %@"),
           CFSTR("La liste d’appareils est vide."),
           CFSTR("Session invalide."),
           CFSTR("La réponse du serveur n’est pas correctement formée"),
           CFSTR("Vous avez envoyé trop de codes pour valider votre numéro de téléphone. Veuillez essayer de nouveau plus tard."),
           CFSTR("numéro de téléphone se terminant par %@"),
           CFSTR("Le nom du compte ou le mot de passe est incorrect."),
           CFSTR("Le champ Identifiant Apple est vide"),
           CFSTR("iForgot…"),
           CFSTR("Désolés, vous avez effectué trop de tentatives infructueuses afin de vérifier votre identité. Pour des raisons de sécurité, vous ne pourrez pas effectuer de changements à votre compte pendant huit heures sans votre clé de récupération."),
           CFSTR("Aucune donnée n’est accessible concernant l’appareil."),
           CFSTR("Vous avez oublié votre identifiant ou votre mot de passe?"),
           CFSTR("Cet identifiant Apple a été désactivé pour des raisons de sécurité. Vous pouvez réinitialiser votre mot de passe  à %@."),
           CFSTR("S’identifier en tant que %@ à l’aide du Touch ID"),
           CFSTR("L’identification a été annulée par l’utilisateur"),
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
  v3.super_class = (Class)ACMLocale_fr_CA;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
