@implementation ACMLocale_ar

- (ACMLocale_ar)init
{
  ACMLocale_ar *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_ar;
  v2 = -[ACMLocale_ar init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("حقل كلمة السر فارغ"), CFSTR("إلغاء"), CFSTR("تسجيل الدخول"), CFSTR("إرسال"), CFSTR("موافق"), CFSTR("عملية الإتصال بالوسيلة غير مناسبة. لا يمكن إخفاء مربع حوار تسجيل الدخول إلى AppleConnect."), CFSTR("معلمات غير صالحة. تم تعيين بعض معلمات الإدخال بشكل غير صحيح."), CFSTR("كلمة سر Apple ID"), CFSTR("يبدو أنك غير متصل. يُرجى الاتصال بالإنترنت والمحاولة مرة أخرى."), CFSTR("تم إدخال Apple ID أو كلمة السر بشكل غير صحيح."), CFSTR("إن عملية التحقق المكونة من خطوتين مطلوبة، ولكن تفاعل المستخدم غير مسموح به."), CFSTR("أجهزة موثوق بها"), CFSTR("لإدارة أجهزتك الموثوق بها يرجى زيارة %@ من جهاز Mac أو كمبيوتر شخصي."), CFSTR("فشل إنشاء تذكرة خدمة صالحة"), CFSTR("استجابة عملية التحقق المكونة من خطوتين فارغة."), CFSTR("رسالة SMS إلى رقم الهاتف"), CFSTR("سيتم إرسال رمز مؤقت إلى الجهاز الذي قمت بتحديده أدناه حتى يمكنك استخدامه لتأكيد هويتك."),
           CFSTR("نفدت الذاكرة"),
           CFSTR("سالم.سليم"),
           CFSTR("إرسال رمز إلى %@"),
           CFSTR("استدعاء أسلوب غير متوقع"),
           CFSTR("فشلت في التحقق من الرمز لعدد كبير جدًا من المرات. يرجى إرسال رمزًا جديدًا إلى جهاز مختلف أو إعادة المحاولة في وقت لاحق."),
           CFSTR("رمز بيانات غير صالح. رمز البيانات للتحقق غير صالح."),
           CFSTR("تم إلغاء المصادقة بواسطة التطبيق"),
           CFSTR("طول رمز الدخول غير صالح"),
           CFSTR("رمز التحقق"),
           CFSTR("تم تعطيل اسم الحساب هذا لأسباب أمنية. يُمكنك إعادة تعيين كلمة السر الخاصة بك على %@."),
           CFSTR("هل تعذر عليك استلام رسائل على أي من أجهزتك؟"),
           CFSTR("أرسل رمزًا جديدًا"),
           CFSTR("عذرًا، حدث خطأ. شُكرًا لصبرك. يرجى المحاولة مرة أخرى لاحقًا."),
           CFSTR("مطلوب"),
           CFSTR("تعذر العثور على هذا الشخص."),
           CFSTR("إدخال رمز التحقق"),
           CFSTR("لم يتم العثور على الجهاز."),
           CFSTR("Apple ID"),
           CFSTR("تم تمكين عملية التحقق المكونة من خطوتين للـ Apple ID هذا."),
           CFSTR("تعذر التحقق من الرمز."),
           CFSTR("كلمة السر"),
           CFSTR("لحماية أمانك، فقد حان الوقت لإعادة تعيين كلمة السر الخاصة بك. الأمر سهل، فقط انتقل إلى %@."),
           CFSTR("يبدو أن الوقت الحالي على هذا الجهاز غير صحيح. يمكنك إصلاح الأمر عن طريق الإعدادات > عام > التاريخ والوقت، ثم حاول مرة أخرى."),
           CFSTR("فشل إنشاء رمز SSO صالح"),
           CFSTR("رمز التحقق الذي أدخلته غير صالح."),
           CFSTR("متابعة"),
           CFSTR("التحقق من الهوية"),
           CFSTR("تم إلغاء المصادقة بواسطة النظام"),
           CFSTR("إنشاء رمز بواسطة %@"),
           CFSTR("قائمة الأجهزة فارغة."),
           CFSTR("جلسة غير صالحة."),
           CFSTR("استجابة الخادم مكونة بشكل غير صحيح"),
           CFSTR("لقد أرسلت عددًا كبيرًا جدًا من الرموز للتحقق من رقم الهاتف الخاص بك. يرجى إعادة المحاولة لاحقًا."),
           CFSTR("رقم الهاتف الذي ينتهي بـ %@"),
           CFSTR("تم إدخال اسم الحساب أو كلمة السر بشكل غير صحيح."),
           CFSTR("حقل الـ Apple ID فارغ"),
           CFSTR("iForgot…"),
           CFSTR("عذرًا، ولكنك قمت بالكثير من المحاولات الفاشلة للتحقق من هويتك. لأسباب أمنية، لن تكون قادرًا على إجراء تغييرات على حسابك للساعات الثماني المقبلة من دون مفتاح الاسترداد."),
           CFSTR("لا تتوفر معلومات عن الجهاز."),
           CFSTR("هل نسيت المعرف أو كلمة السر الخاصة بك؟"),
           CFSTR("تم تعطيل الـ Apple ID هذا لأسباب أمنية. يُمكنك إعادة تعيين كلمة السر الخاصة بك على %@."),
           CFSTR("المصادقة كـ %@ باستخدام Touch ID"),
           CFSTR("تم إلغاء المصادقة بواسطة المستخدم"),
           CFSTR("رقم ينتهي بـ %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_ar;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
