@implementation ACMLocale_ru

- (ACMLocale_ru)init
{
  ACMLocale_ru *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_ru;
  v2 = -[ACMLocale_ru init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Поле пароля не заполнено"), CFSTR("Отменить"), CFSTR("Войти"), CFSTR("Отправить"), CFSTR("ОК"), CFSTR("Неверный вызов метода. Окно входа в Apple Connect невозможно скрыть."), CFSTR("Неверные параметры. Некоторые из входных параметров заданы неверно."), CFSTR("Пароль для Apple ID"), CFSTR("Вы не в сети. Подключитесь к Интернету и повторите попытку."), CFSTR("Введен неверный Apple ID или пароль."), CFSTR("Требуется двухэтапная проверка без участия пользователя."), CFSTR("ПРОВЕРЕННЫЕ УСТРОЙСТВА"), CFSTR("Для управления проверенными устройствами зайдите на %@ с Mac или PC."), CFSTR("Не удалось создать действительную сервисную заявку"), CFSTR("Пустой отклик двухэтажной проверки."), CFSTR("SMS-сообщение на номер телефона"), CFSTR("Временный код для подтверждения личности будет выслан на устройство, выбранное из списка ниже."),
           CFSTR("Нет памяти"),
           CFSTR("john.appleseed"),
           CFSTR("Отправить код на %@"),
           CFSTR("Непредвиденный вызов метода"),
           CFSTR("Слишком много неудачных попыток подтвердить код. Отправьте новый код на другое устройство или повторите попытку позже."),
           CFSTR("Неверный токен с данными. Токен с данными на проверку недействителен."),
           CFSTR("Приложение отменило аутентификацию"),
           CFSTR("Неверная длина пароля"),
           CFSTR("Код проверки"),
           CFSTR("Этот Apple ID заблокирован в целях безопасности. Вы можете сбросить пароль на %@."),
           CFSTR("Не удается получить сообщения ни на одно устройство?"),
           CFSTR("Отправить новый код"),
           CFSTR("Произошла ошибка. Повторите попытку позже. Благодарим Вас за понимание."),
           CFSTR("Обязательно"),
           CFSTR("Не удается найти пользователя."),
           CFSTR("Введите код проверки"),
           CFSTR("Устройство не найдено."),
           CFSTR("Apple ID"),
           CFSTR("Для этого Apple ID активирована двухэтапная проверка."),
           CFSTR("Не удается подтвердить токен."),
           CFSTR("Пароль"),
           CFSTR("В целях безопасности необходимо сборосить пароль. Для этого просто перейдите на %@."),
           CFSTR("Текущее время на устройстве задано неверно. Измените время в меню «Настройки» > «Основные» > «Дата и время» и повторите попытку."),
           CFSTR("Не удалось создать действительный SSO-токен"),
           CFSTR("Введен неверный код проверки."),
           CFSTR("Продолжить"),
           CFSTR("Подтверждение личности"),
           CFSTR("Система отменила аутентификацию"),
           CFSTR("Генерировать код с помощью %@"),
           CFSTR("Список устройств пуст."),
           CFSTR("Неверная сессия."),
           CFSTR("Ответ сервера искажен"),
           CFSTR("Отправлено слишком много кодов для подтверждения номера телефона. Повторите попытку позже."),
           CFSTR("номер телефона, заканчивающийся на %@"),
           CFSTR("Неверное имя учетной записи или пароль."),
           CFSTR("Поле Apple ID не заполнено"),
           CFSTR("iForgot…"),
           CFSTR("К сожалению, Вы сделали слишком много неудачных попыток подтвердить свою личность. По соображениям безопасности Вы не сможете вносить изменения в учетную запись в течение следующих восьми часов без ключа восстановления."),
           CFSTR("Информация об устройстве недоступна."),
           CFSTR("Забыли Ваш ID или пароль?"),
           CFSTR("Этот Apple ID заблокирован в целях безопасности. Вы можете сбросить пароль на %@."),
           CFSTR("Пройдите аутентификацию как %@, используя Touch ID"),
           CFSTR("Пользователь отменил аутентификацию"),
           CFSTR("Номер, заканчивающийся на %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_ru;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
