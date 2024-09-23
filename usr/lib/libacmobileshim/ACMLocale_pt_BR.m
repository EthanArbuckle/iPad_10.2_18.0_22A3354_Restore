@implementation ACMLocale_pt_BR

- (ACMLocale_pt_BR)init
{
  ACMLocale_pt_BR *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_pt_BR;
  v2 = -[ACMLocale_pt_BR init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("O campo Senha está em branco"), CFSTR("Cancelar"), CFSTR("Iniciar sessão"), CFSTR("Enviar"), CFSTR("OK"), CFSTR("Chamada incorreta do método. Não é possível ocultar a caixa de diálogo para iniciar sessão do AppleConnect."), CFSTR("Parâmetros inválidos. Alguns parâmetros de entrada foram definidos incorretamente."), CFSTR("Senha do ID Apple"), CFSTR("Você parece estar offline. Conecte-se à Internet e tente novamente."), CFSTR("Sua senha ou ID Apple foram inseridos incorretamente."), CFSTR("A verificação em dois passos é necessária, mas a interação do usuário não é permitida."), CFSTR("DISPOSITIVOS DE CONFIANÇA"), CFSTR("Para gerenciar seus dispositivos confiáveis, visite %@ de um Mac ou PC."), CFSTR("Falha na criação de um tíquete de serviço válido"), CFSTR("A resposta da verificação em dois passos está vazia."), CFSTR("SMS para número de telefone"), CFSTR("Para verificar sua identidade, enviaremos um código temporário para o dispositivo selecionado a seguir."),
           CFSTR("Sem Memória"),
           CFSTR("joão.silva"),
           CFSTR("Enviar código para %@"),
           CFSTR("Invocação de método não esperada"),
           CFSTR("Você não conseguiu verificar o código por muitas vezes. Envie um novo código para um dispositivo diferente e tente novamente."),
           CFSTR("Token de Dados inválido. O Token de Dados para confirmação não é válido."),
           CFSTR("A autenticação foi cancelada pelo aplicativo"),
           CFSTR("Tamanho do código inválido"),
           CFSTR("Código de verificação"),
           CFSTR("Este ID Apple foi desativado por motivos de segurança. Você pode redefinir sua senha no site %@."),
           CFSTR("Não consegue receber mensagens em nenhum de seus dispositivos?"),
           CFSTR("Enviar um novo código"),
           CFSTR("Opa! Aconteceu em erro. Obrigado por sua paciência. Tente novamente mais tarde."),
           CFSTR("Obrigatória"),
           CFSTR("Não é possível encontrar essa pessoa."),
           CFSTR("Inserir código de verificação"),
           CFSTR("Dispositivo não encontrado."),
           CFSTR("ID Apple"),
           CFSTR("A verificação em dois passos está ativada para este ID Apple."),
           CFSTR("Não é possível confirmar o token."),
           CFSTR("Senha"),
           CFSTR("Para proteger sua segurança, chegou a hora de redefinir a senha. É fácil, basta acessar %@."),
           CFSTR("A hora atual deste dispositivo parece estar incorreta. Você pode corrigi-la acessando Ajustes > Geral > Data e Hora. Em seguida, tente novamente."),
           CFSTR("Falha na criação de um token SSO válido"),
           CFSTR("O código de verificação inserido não é válido."),
           CFSTR("Verificar identidade"),
           CFSTR("A autenticação foi cancelada pelo sistema"),
           CFSTR("Gerar código com %@"),
           CFSTR("A lista de dispositivos está vazia."),
           CFSTR("Sessão inválida."),
           CFSTR("A resposta do servidor está malformada"),
           CFSTR("Você enviou demasiados códigos para verificar seu número de telefone. Tente novamente mais tarde."),
           CFSTR("número de telefone com final %@"),
           CFSTR("Seu nome de conta ou senha foi inserida incorretamente."),
           CFSTR("O campo ID Apple está em branco"),
           CFSTR("iForgot…"),
           CFSTR("Lamentamos, mas você tentou verificar sua identidade muitas vezes sem sucesso. Por razões de segurança, você não poderá fazer alterações na sua conta pelas próximas oito horas sem sua chave de recuperação."),
           CFSTR("Nenhuma informação disponível sobre o dispositivo."),
           CFSTR("Esqueceu seu ID ou sua senha?"),
           CFSTR("Este ID Apple foi desativado por motivos de segurança. Você pode redefinir sua senha no site %@."),
           CFSTR("Autenticar-se como %@ com o Touch ID"),
           CFSTR("A autenticação foi cancelada pelo usuário"),
           CFSTR("Número com final %@"),
           CFSTR("A verificação em dois passos foi desativada na conta do ID Apple %@."));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_pt_BR;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
