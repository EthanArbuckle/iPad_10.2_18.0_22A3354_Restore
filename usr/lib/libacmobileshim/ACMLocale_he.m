@implementation ACMLocale_he

- (ACMLocale_he)init
{
  ACMLocale_he *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_he;
  v2 = -[ACMLocale_he init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("שדה הסיסמה ריק"), CFSTR("ביטול"), CFSTR("התחבר"), CFSTR("שליחה"), CFSTR("אישור"), CFSTR("קריאת שיטה שגויה. לא ניתן להסתיר את תיבת ההתחברות של AppleConnect."), CFSTR("פרמטרים לא חוקיים. כמה מפרמטרי הקלט הוגדרו בצורה שגויה."), CFSTR("סיסמת Apple ID"), CFSTR("נראה כי את/ה לא מחובר/ת לאינטרנט. התחבר/י לאינטרנט ונסה/י שוב."), CFSTR("ה-Apple ID או הסיסמה שהזנת שגויים."), CFSTR("יש צורך באימות בשני צעדים, אך אינטאראקציית המשתמש אסורה."), CFSTR("מכשירים מהימנים"), CFSTR("כדי לנהל את המכשירים המהימנים שלך, בקר/י ב-%@ מה-Mac או ה-PC."), CFSTR("יצירת כרטיס שירות תקף נכשלה"), CFSTR("התגובה לאימות בשני צעדים ריקה."), CFSTR("SMS למספר טלפון"), CFSTR("אל המכשיר שתבחר/י להלן יישלח קוד זמני, בו ניתן להשתמש על מנת לאמת את זהותך."),
           CFSTR("הזיכרון אזל"),
           CFSTR("israel.israeli"),
           CFSTR("שלח קוד אל %@"),
           CFSTR("שיטת קריאה בלתי צפויה"),
           CFSTR("לא הצלחת לאשר את הקוד יותר מדי פעמים. נא לשלוח קוד חדש למכשיר אחר או לנסות שוב מאוחר יותר."),
           CFSTR("אסימון נתונים לא תקף. אסימון הנתונים לאימות אינו תקף."),
           CFSTR("האימות בוטל על ידי יישום"),
           CFSTR("אורך קוד גישה אינו תקף"),
           CFSTR("קוד אימות"),
           CFSTR("חשבון זה הושבת מטעמי אבטחה. באפשרותך לאפס את סיסמתך בכתובת %@."),
           CFSTR("אין באפשרותך לקבל הודעות באף אחד מהמכשירים שלך?"),
           CFSTR("שליחת קוד חדש"),
           CFSTR("מצטערים, אירעה שגיאה. נסה/י שוב מאוחר יותר. תודה על סבלנותך. "),
           CFSTR("חובה"),
           CFSTR("לא ניתן למצוא אדם זה."),
           CFSTR("הזן/י קוד אימות"),
           CFSTR("מכשיר לא נמצא."),
           CFSTR("Apple ID"),
           CFSTR("אימות בשני צעדים הופעל עבור Apple ID זה."),
           CFSTR("לא ניתן לאמת את האסימון."),
           CFSTR("סיסמה"),
           CFSTR("מטעמי אבטחה, הגיע הזמן לאפס את סיסמתך. פשוט בקר/י בכתובת %@."),
           CFSTR("נראה כי השעה הנוכחית במכשיר זה לא מדויקת. כדי לתקן זאת, עבור/י אל ״הגדרות״ > ״כללי״ > ״תאריך ושעה״ ולאחר מכן נסה/י שוב."),
           CFSTR("יצירת אסימון SSO תקף נכשלה"),
           CFSTR("קוד האימות שהזנת אינו תקף."),
           CFSTR("המשך/י"),
           CFSTR("אמת/י את זהותך"),
           CFSTR("האימות בוטל על ידי מערכת"),
           CFSTR("צור סיסמה באמצעות %@"),
           CFSTR("רשימת המכשירים ריקה."),
           CFSTR("התקשרות לא תקפה."),
           CFSTR("תגובת השרת פגומה"),
           CFSTR("שלחת יותר מדי קודים לאימות מספר הטלפון שלך. נסה/י שוב מאוחר יותר."),
           CFSTR("מספר טלפון המסתיים ב-%@"),
           CFSTR("שם החשבון או הסיסמה שלך הוזנו באופן שגוי."),
           CFSTR("שדה ה-Apple ID ריק"),
           CFSTR("iForgot…"),
           CFSTR("מצטערים, אבל ביצעת יותר מדי ניסיונות סרק לאימות זהותך. משיקולי אבטחה, לא תוכל/י לבצע שינויים בחשבונך במשך שמונה השעות הבאות ללא מפתח השחזור שלך."),
           CFSTR("אין פרטי מכשיר זמינים."),
           CFSTR("שכחת את ה-ID או סיסמה שלך?"),
           CFSTR("\u200FApple ID זה הושבת מטעמי אבטחה. באפשרותך לאפס את סיסמתך בכתובת %@."),
           CFSTR("אמת/י שהינך %@ באמצעות Touch ID"),
           CFSTR("האימות בוטל על ידי משתמש"),
           CFSTR("מספר המסתיים ב-%@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_he;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
