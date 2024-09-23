@implementation ACMLocale_zh_Hant

- (ACMLocale_zh_Hant)init
{
  ACMLocale_zh_Hant *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_zh_Hant;
  v2 = -[ACMLocale_zh_Hant init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("密碼欄位空白"), CFSTR("取消"), CFSTR("登入"), CFSTR("傳送"), CFSTR("好"), CFSTR("不當的呼叫方式。AppleConnect 的登入對話框無法隱藏。"), CFSTR("無效的參數。部分輸入參數的設定不正確。"), CFSTR("Apple ID 密碼"), CFSTR("您似乎已經離線。請連線至 Internet，然後再試一次。"), CFSTR("您輸入的 Apple ID 或密碼不正確。"), CFSTR("須啟用雙步驟驗證，但不允許使用者互動。"), CFSTR("受信任的裝置"), CFSTR("若要管理受信任的裝置，請使用 Mac 或 PC 造訪 %@。"), CFSTR("無法建立有效的服務工作單"), CFSTR("雙步驟驗證的回應為空白。"), CFSTR("傳送簡訊至電話號碼"), CFSTR("臨時驗證碼會傳送到您在下方選取的裝置，以驗證您的身分。"),
           CFSTR("記憶體不足"),
           CFSTR("john.appleseed"),
           CFSTR("傳送代碼至「%@」"),
           CFSTR("無法預期的方法啟動"),
           CFSTR("驗證碼驗證失敗次數過多。請傳送新驗證碼至其他裝置，或稍後再試一次。"),
           CFSTR("無效的資料代號。用於驗證的資料代號無效。"),
           CFSTR("應用程式已取消認證"),
           CFSTR("密碼長度無效"),
           CFSTR("驗證碼"),
           CFSTR("基於安全考量，此帳號已停用。您可在 %@ 重置密碼。"),
           CFSTR("任何裝置皆無法接收訊息？"),
           CFSTR("傳送新驗證碼"),
           CFSTR("抱歉，發生錯誤。感謝您耐心等候，請稍後再試。"),
           CFSTR("必填"),
           CFSTR("找不到此人。"),
           CFSTR("請輸入驗證碼"),
           CFSTR("找不到裝置。"),
           CFSTR("Apple ID"),
           CFSTR("此 Apple ID 已啟用雙步驟驗證。"),
           CFSTR("無法驗證代號。"),
           CFSTR("密碼"),
           CFSTR("為了保護您的安全，建議您立即重置密碼。只要前往 %@，即可輕鬆重置密碼。"),
           CFSTR("裝置上顯示的目前時間似乎不正確。您可前往「設定」>「一般」>「日期與時間」修正時間，然後再試一次。"),
           CFSTR("無法建立有效的 SSO 代號"),
           CFSTR("您輸入的驗證碼無效。"),
           CFSTR("繼續"),
           CFSTR("驗證身分"),
           CFSTR("系統已取消認證"),
           CFSTR("以「%@」產生代碼"),
           CFSTR("裝置列表是空的。"),
           CFSTR("無效的階段作業。"),
           CFSTR("伺服器的回應形式錯誤"),
           CFSTR("您已傳送過多驗證碼來驗證您的電話號碼。請稍後再試。"),
           CFSTR("電話號碼尾數為 %@"),
           CFSTR("您輸入的帳號名稱或密碼不正確。"),
           CFSTR("Apple ID 的欄位空白"),
           CFSTR("iForgot…"),
           CFSTR("抱歉，您嘗試驗證身分的失敗次數過多。基於安全考量，在未來八小時內，如果您沒有復原密鑰，將無法對帳號做任何更改。"),
           CFSTR("無法提供裝置資訊。"),
           CFSTR("忘記 ID 或密碼？"),
           CFSTR("基於安全考量，此 Apple ID 已停用。您可在 %@ 重置密碼。"),
           CFSTR("以 Touch ID 認證為 %@"),
           CFSTR("使用者已取消認證"),
           CFSTR("號碼尾數為 %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_zh_Hant;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
