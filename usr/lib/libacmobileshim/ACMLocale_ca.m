@implementation ACMLocale_ca

- (ACMLocale_ca)init
{
  ACMLocale_ca *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_ca;
  v2 = -[ACMLocale_ca init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("El camp de la contrasenya està buit"), CFSTR("Cancel·lar"), CFSTR("Iniciar sessió"), CFSTR("Enviar"), CFSTR("Acceptar"), CFSTR("Error de trucada al mètode. El diàleg d’inici de sessió de l’AppleConnect no es pot ocultar."), CFSTR("Paràmetres no vàlids. Alguns paràmetres d’entrada no s’han establert correctament."), CFSTR("Contrasenya de l’ID d’Apple"), CFSTR("Sembla que no tens connexió. Connecta’t a Internet i torna-ho a provar."), CFSTR("L’ID d’Apple o la contrasenya que has escrit són incorrectes."), CFSTR("La verificació en dos passos és obligatòria, però no es permet la interacció de l’usuari."), CFSTR("DISPOSITIUS DE CONFIANÇA"), CFSTR("Per a gestionar els dispositius de confiança, vés a %@ des d’un Mac o un PC."), CFSTR("No s’ha pogut crear un tiquet de servei vàlid"), CFSTR("La resposta de la verificació en dos passos està en blanc."), CFSTR("Enviar un SMS al número de telèfon"), CFSTR("Rebràs un codi temporal al dispositiu que seleccionis a continuació que podràs fer servir per a verificar la teva identitat."),
           CFSTR("Sense memòria"),
           CFSTR("joan.pomes"),
           CFSTR("Enviar codi a %@"),
           CFSTR("Invocació de mètode inesperada"),
           CFSTR("Has superat el límit d’intents de verificació del codi. Envia un codi nou a un dispositiu diferent o torna-ho a provar més tard."),
           CFSTR("L’identificador de les dades no és vàlid. L’identificador de les dades per verificar no és vàlid."),
           CFSTR("L’aplicació ha cancel·lat l’autenticació"),
           CFSTR("Longitud del codi no vàlida"),
           CFSTR("Codi de verificació"),
           CFSTR("Aquest compte s’ha desactivat per motius de seguretat. Pots restablir la contrasenya a %@."),
           CFSTR("No pots rebre missatges en cap dels teus dispositius?"),
           CFSTR("Enviar un codi nou"),
           CFSTR("S’ha produït un error. Torna-ho a provar més tard."),
           CFSTR("Obligatori"),
           CFSTR("No es troba aquesta persona."),
           CFSTR("Escriu el codi de verificació"),
           CFSTR("No es troba el dispositiu."),
           CFSTR("ID d’Apple"),
           CFSTR("Aquest ID d’Apple té activada la verificació en dos passos."),
           CFSTR("No es pot verificar l’identificador."),
           CFSTR("Contrasenya"),
           CFSTR("Restableix la contrasenya per protegir la teva seguretat. És senzill: només cal que vagis a %@."),
           CFSTR("Sembla que l’hora actual del dispositiu és incorrecta. Pots modificar-la a Configuració > General > Data i hora, i tornar-ho a provar."),
           CFSTR("No s’ha pogut crear un identificador d’SSO vàlid"),
           CFSTR("El codi de verificació que has escrit no és vàlid."),
           CFSTR("Continuar"),
           CFSTR("Verificar la identitat"),
           CFSTR("El sistema ha cancel·lat l’autenticació"),
           CFSTR("Generar el codi amb %@"),
           CFSTR("La llista de dispositius és buida."),
           CFSTR("Sessió no vàlida."),
           CFSTR("La resposta del servidor no està ben formada"),
           CFSTR("Has enviat massa codis per verificar el teu número de telèfon. Torna-ho a provar més endavant."),
           CFSTR("telèfon que acaba en %@"),
           CFSTR("El nom del compte o la contrasenya que has escrit són incorrectes."),
           CFSTR("El camp de l’ID d’Apple està buit"),
           CFSTR("iForgot…"),
           CFSTR("Has intentat verificar la teva identitat sense èxit massa vegades. Per motius de seguretat, no podràs fer canvis al teu compte durant les següents vuit hores sense la clau de recuperació."),
           CFSTR("No hi ha informació disponible del dispositiu."),
           CFSTR("Has oblidat l’ID o la contrasenya?"),
           CFSTR("Aquest ID d’Apple s’ha desactivat per motius de seguretat. Pots restablir la contrasenya a %@."),
           CFSTR("Autenticar com a %@ amb el Touch ID"),
           CFSTR("L’usuari ha cancel·lat l’autenticació"),
           CFSTR("Número que acaba en %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_ca;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
