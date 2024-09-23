@implementation ACMLocale_pt

- (ACMLocale_pt)init
{
  ACMLocale_pt *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_pt;
  v2 = -[ACMLocale_pt init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("O campo palavra-passe está vazio"), CFSTR("Cancelar"), CFSTR("Iniciar sessão"), CFSTR("Enviar"), CFSTR("OK"), CFSTR("Chamada incorreta do método. Diálogo AppleConnect SignIn não pode ser ocultado."), CFSTR("Parâmetros inválidos. Alguns dos parâmetros de entrada não estão definidos corretamente."), CFSTR("Palavra-passe do ID Apple"), CFSTR("Parece estar offline. Estabeleça ligação à Internet e tente novamente."), CFSTR("A palavra-passe ou o ID Apple foram introduzidos incorretamente."), CFSTR("A confirmação em dois passos é necessária, mas a intervenção do utilizador não é permitida."), CFSTR("DISPOSITIVOS FIDEDIGNOS"), CFSTR("Para gerir os seus dispositivos fidedignos, visite %@ a partir de um Mac ou PC."), CFSTR("Falha ao criar um ticket de serviço válido"), CFSTR("A resposta da Confirmação em dois passos está vazia."), CFSTR("SMS para número de telefone"), CFSTR("Será enviado, para o dispositivo que selecionar, um código temporário que pode utilizar para confirmar a sua identidade."),
           CFSTR("Sem memória"),
           CFSTR("joão.silva"),
           CFSTR("Enviar código para %@"),
           CFSTR("Invocação de método inesperada"),
           CFSTR("Falhou a confirmação do código demasiadas vezes. Envie um código novo para outro dispositivo ou tente mais tarde."),
           CFSTR("Token de dados inválido. O token de dados para confirmação não é válido."),
           CFSTR("A autenticação foi cancelada pela aplicação"),
           CFSTR("Comprimento do código inválido"),
           CFSTR("Código de confirmação"),
           CFSTR("Por motivos de segurança, esta conta foi desativada. Pode repor a palavra-passe em %@."),
           CFSTR("Não consegue receber mensagens em qualquer dos seus dispositivos?"),
           CFSTR("Enviar um código novo"),
           CFSTR("Ups, ocorreu um erro. Obrigado por aguardar, tente novamente mais tarde."),
           CFSTR("Obrigatória"),
           CFSTR("Não é possível encontrar esta pessoa."),
           CFSTR("Introduzir código de confirmação"),
           CFSTR("Dispositivo não encontrado."),
           CFSTR("ID Apple"),
           CFSTR("A confirmação em dois passos está ativada para este ID Apple. "),
           CFSTR("Não é possível confirmar o token."),
           CFSTR("Palavra-passe"),
           CFSTR("Reponha a palavra-passe para proteger a sua segurança. Basta aceder a %@."),
           CFSTR("A hora atual neste dispositivo parece estar incorreta. Pode corrigi-la em Definições > Geral > Data e hora e, em seguida, tente novamente."),
           CFSTR("Falha ao criar um token SSO válido"),
           CFSTR("O código de confirmação que introduziu não é válido."),
           CFSTR("Continuar"),
           CFSTR("Verificar identidade"),
           CFSTR("A autenticação foi cancelada pelo sistema"),
           CFSTR("Gerar código com %@"),
           CFSTR("A lista de dispositivos está vazia."),
           CFSTR("Sessão inválida."),
           CFSTR("A resposta do servidor está mal conformada"),
           CFSTR("Enviou demasiados códigos para confirmar o seu número de telefone. Tente mais tarde."),
           CFSTR("telefone terminado em %@"),
           CFSTR("O nome da conta ou a palavra-passe foram introduzidos incorretamente."),
           CFSTR("O campo ID Apple está vazio"),
           CFSTR("iForgot…"),
           CFSTR("Efetuou demasiadas tentativas incorretas na confirmação da sua identidade. Por motivos de segurança, não poderá efetuar alterações à sua conta nas próximas oito horas sem a Chave de recuperação."),
           CFSTR("Nenhuma informação de dispositivo disponível."),
           CFSTR("Esqueceu-se do seu ID ou palavra-passe?"),
           CFSTR("Por motivos de segurança, este ID Apple foi desativado. Pode repor a palavra-passe em %@."),
           CFSTR("Autenticar como %@ com o Touch ID"),
           CFSTR("A autenticação foi cancelada pelo utilizador"),
           CFSTR("Número terminado em %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_pt;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
