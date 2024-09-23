@implementation ACMLocale_uk

- (ACMLocale_uk)init
{
  ACMLocale_uk *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_uk;
  v2 = -[ACMLocale_uk init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Поле пароля порожнє"), CFSTR("Скасувати"), CFSTR("Увійдіть"), CFSTR("Надіслати"), CFSTR("ОК"), CFSTR("Неправильний виклик методу. Неможливо приховати вікно входу до AppleConnect."), CFSTR("Недійсні параметри. Деякі вхідні параметри встановлено неправильно."), CFSTR("Пароль Apple ID"), CFSTR("Ви офлайн. Під’єднайтеся до Інтернету та повторіть спробу."), CFSTR("Ваш Apple ID або пароль було введено неправильно."), CFSTR("Потрібне двоетапне підтвердження без взаємодії з користувачем."), CFSTR("ДОВІРЕНІ ПРИСТРОЇ"), CFSTR("Для управління довіреними пристроями відвідайте %@ з Mac або ПК."), CFSTR("Не вдалося створити дійсну сервісну заявку"), CFSTR("Відповідь двоетапного підтвердження порожня."), CFSTR("Надіслати SMS на номер телефону"), CFSTR("На пристрій обраний нижче буде надіслано тимчасовий код, потрібний для підтвердження особистості."),
           CFSTR("Недостатньо пам’яті"),
           CFSTR("stepan.yabluchko"),
           CFSTR("Надіслати код на %@"),
           CFSTR("Неочікуваний виклик методу"),
           CFSTR("Забагато спроб підтвердити код. Надішліть новий код на інший пристрій або повторіть спробу пізніше."),
           CFSTR("Недійсний токен даних. Токен даних для перевірки недійсний."),
           CFSTR("Автентифікацію скасовано програмою"),
           CFSTR("Неприпустима довжина паролю"),
           CFSTR("Код перевірки"),
           CFSTR("Обліковий запис заблоковано з міркувань безпеки. Ви можете скинути пароль на %@."),
           CFSTR("Не маєте доступу до пристроїв?"),
           CFSTR("Надіслати новий код"),
           CFSTR("Сталася помилка. Будь ласка, повторіть спробу пізніше."),
           CFSTR("Обов'язково"),
           CFSTR("Не вдалося знайти користувача."),
           CFSTR("Введіть код перевірки"),
           CFSTR("Пристрій не знайдено."),
           CFSTR("Apple ID"),
           CFSTR("Для Apple ID увімкнено двоетапне підтвердження. "),
           CFSTR("Не вдалося перевірити токен."),
           CFSTR("Пароль"),
           CFSTR("З міркувань безпеки слід скинути пароль. Це дуже легко: просто перейдіть на %@."),
           CFSTR("Схоже, поточний час на цьому пристрої неправильний. Щоб виправити це, перейдіть у Параметри > Загальні > Дата і час і повторіть спробу."),
           CFSTR("Не вдалося створити дійсний SSO-токен"),
           CFSTR("Вказано невірний код перевірки."),
           CFSTR("Продовжити"),
           CFSTR("Підтвердити особистість"),
           CFSTR("Автентифікацію скасовано системою"),
           CFSTR("Створити код за допомогою %@"),
           CFSTR("Список пристроїв порожній."),
           CFSTR("Недійсний сеанс."),
           CFSTR("Відповідь сервера деформована"),
           CFSTR("Ви надіслали забагато кодів, щоб підтвердити номер телефону. Будь ласка, повторіть спробу пізніше."),
           CFSTR("номер телефону, що закінчується на %@"),
           CFSTR("Невірний логін або пароль."),
           CFSTR("Поле Apple ID порожнє"),
           CFSTR("iForgot…"),
           CFSTR("Вибачте, забагато невдалих спроб підтвердити особистість. Ви не зможете вносити зміни до облікового запису протягом наступних восьми годин без використання ключа відновлення, з міркувань безпеки."),
           CFSTR("Інформація про пристрій відсутня."),
           CFSTR("Забули ID або пароль?"),
           CFSTR("Apple ID заблоковано з міркувань безпеки. Ви можете скинути пароль на %@."),
           CFSTR("Увійдіть як %@ за допомогою Touch ID"),
           CFSTR("Автентифікацію скасовано користувачем"),
           CFSTR("Номер, що закінчується на %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_uk;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
