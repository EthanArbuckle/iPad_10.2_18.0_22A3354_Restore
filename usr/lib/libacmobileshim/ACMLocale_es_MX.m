@implementation ACMLocale_es_MX

- (ACMLocale_es_MX)init
{
  ACMLocale_es_MX *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_es_MX;
  v2 = -[ACMLocale_es_MX init](&v6, sel_init);
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
           CFSTR("Number ending in %@"),
           CFSTR("Two-step verification has been disabled for the Apple ID account %@."));
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("El campo de la contraseña está vacío"), CFSTR("Cancelar"), CFSTR("Iniciar sesión"), CFSTR("Enviar"), CFSTR("Aceptar"), CFSTR("Error de llamada al método. El diálogo de inicio de sesión de AppleConnect no se pudo ocultar."), CFSTR("Parámetros no válidos. Algunos parámetros de entrada están configurados incorrectamente."), CFSTR("Contraseña del Apple ID"), CFSTR("Parece que no tienes conexión. Conéctate a Internet e inténtalo de nuevo."), CFSTR("El ID de Apple o la contraseña ingresados son incorrectos."), CFSTR("Se requiere la verificación en dos pasos pero no se permite la interacción del usuario"), CFSTR("DISPOSITIVOS DE CONFIANZA"), CFSTR("Para gestionar tus dispositivos de confianza, ve a %@ desde una Mac o PC."), CFSTR("No se pudo crear un ticket de servicio válido"), CFSTR("La respuesta de la verificación en dos pasos está vacía."), CFSTR("Enviar un SMS al número de teléfono"), CFSTR("Se enviará un código de seguridad provisional al dispositivo que selecciones a continuación; utilízalo para verificar tu identidad."),
           CFSTR("Memoria agotada"),
           CFSTR("juan.lopezruiz"),
           CFSTR("Enviar código a %@"),
           CFSTR("Invocación de método inesperada"),
           CFSTR("Has sobrepasado el límite de intentos de verificación del código. Envía un nuevo código a otro dispositivo o inténtalo de nuevo más tarde."),
           CFSTR("Identificador de datos no válido. El identificador de datos para verificación no es válido."),
           CFSTR("La aplicación canceló la autenticación"),
           CFSTR("La longitud del código no es válida."),
           CFSTR("Código de verificación"),
           CFSTR("Esta cuenta se desactivó por motivos de seguridad. Puedes restablecer tu contraseña en %@."),
           CFSTR("¿No puedes recibir mensajes en ninguno de tus dispositivos?"),
           CFSTR("Enviar un código nuevo"),
           CFSTR("Se produjo un error. Vuelve a intentarlo más tarde. Gracias por tu paciencia. "),
           CFSTR("Obligatorio"),
           CFSTR("No se encuentra a esta persona."),
           CFSTR("Ingresar el código de verificación"),
           CFSTR("No se encuentra el dispositivo."),
           CFSTR("ID de Apple"),
           CFSTR("La verificación en dos pasos está activada para este ID de Apple. "),
           CFSTR("No se puede verificar el identificador."),
           CFSTR("Contraseña"),
           CFSTR("Restablece tu contraseña para proteger tu seguridad. El procedimiento es sencillo: ve a %@."),
           CFSTR("Parece que la hora actual en este dispositivo es incorrecta. Puedes modificarla en Configuración > General > Fecha & Hora, y vuelve a intentarlo."),
           CFSTR("No se pudo crear un identificador SSO válido"),
           CFSTR("El código de seguridad que has introducido no es válido."),
           CFSTR("Verificar la identidad"),
           CFSTR("El sistema canceló la autenticación"),
           CFSTR("Generar código con %@"),
           CFSTR("La lista de dispositivos está vacía."),
           CFSTR("Sesión no válida."),
           CFSTR("La respuesta del servidor no está bien formada"),
           CFSTR("Has enviado demasiados códigos para verificar tu número de teléfono. Vuelve a intentarlo más tarde."),
           CFSTR("teléfono que termina en %@"),
           CFSTR("El nombre de la cuenta o la contraseña que ingresaste son incorrectos."),
           CFSTR("El campo del ID de Apple está vacío"),
           CFSTR("iForgot…"),
           CFSTR("Has intentado verificar tu identidad demasiadas veces sin éxito. Por motivos de seguridad, no podrás hacer cambios en la cuenta en las próximas ocho horas a menos que uses la clave de recuperación."),
           CFSTR("No hay información disponible sobre el dispositivo."),
           CFSTR("¿Olvidaste tu ID o contraseña?"),
           CFSTR("Este Apple ID se desactivó por motivos de seguridad. Puedes restablecer tu contraseña en %@."),
           CFSTR("Autenticar como %@ con Touch ID"),
           CFSTR("El usuario canceló la autenticación"),
           CFSTR("El número que acaba en %@"),
           CFSTR("Se ha desactivado la verificación en dos pasos para la cuenta del Apple ID %@."));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_es_MX;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
