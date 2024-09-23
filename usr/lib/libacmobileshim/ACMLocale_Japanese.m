@implementation ACMLocale_Japanese

- (ACMLocale_Japanese)init
{
  ACMLocale_Japanese *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_Japanese;
  v2 = -[ACMLocale_Japanese init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("パスワードフィールドが空です"), CFSTR("キャンセル"), CFSTR("サインイン"), CFSTR("送信"), CFSTR("OK"), CFSTR("無効な呼び出しメソッドです。AppleConnect サインインダイアログは非表示にできません。"), CFSTR("無効なパラメータです。入力パラメータの設定が正しくない箇所があります。"), CFSTR("Apple ID パスワード"), CFSTR("接続がオフラインのようです。インターネットに接続してからもう一度試してください。"), CFSTR("入力された Apple ID またはパスワードが正しくありません。"), CFSTR("2ステップ確認が必要ですが、ユーザ入力が許可されていません。"), CFSTR("信頼できるデバイス"), CFSTR("信頼できるデバイスを管理するには、Mac または Windows PC から %@ にアクセスしてください。"), CFSTR("有効なサービスチケットを作成できませんでした"), CFSTR("2ステップ確認の応答が無効です。"), CFSTR("電話番号へSMSを送信"), CFSTR("以下で選択したデバイスに一時コードが送信されます。一時コードを使って本人確認を行ってください。"),
           CFSTR("メモリが不足しています。"),
           CFSTR("john.appleseed"),
           CFSTR("%@へコードを送信"),
           CFSTR("期待しないメソッド呼び出し"),
           CFSTR("コード確認の失敗回数が多すぎます。他のデバイスに新しいコードを送信するか、しばらくしてからもう一度お試しください。"),
           CFSTR("無効なデータトークンです。確認用のデータトークンが無効です。"),
           CFSTR("アプリケーションによって認証がキャンセルされました"),
           CFSTR("パスコードの長さが正しくありません"),
           CFSTR("確認コード"),
           CFSTR("このアカウントは、セキュリティ上の理由により無効にされています。 %@ でパスワードをリセットできます。"),
           CFSTR("どのデバイスでもメッセージを受信できませんか？"),
           CFSTR("新しいコードを送信"),
           CFSTR("問題が発生しました。しばらくしてからもう一度お試しください。"),
           CFSTR("必須"),
           CFSTR("この方は見つかりません。"),
           CFSTR("確認コードを入力"),
           CFSTR("デバイスが見つかりません。"),
           CFSTR("Apple ID"),
           CFSTR("この Apple ID では2ステップ確認が有効になっています。"),
           CFSTR("トークンを確認できません。"),
           CFSTR("パスワード"),
           CFSTR("セキュリティ保護のためにパスワードの変更をおすすめします。%@ から簡単に変更できます。"),
           CFSTR("このデバイスの現在時刻が正しく設定されていないようです。「設定」＞「一般」＞「日付と時刻」で時刻を修正してから、もう一度試してください。"),
           CFSTR("有効な SSO トークンを作成できませんでした"),
           CFSTR("入力された確認コードは有効ではありません。"),
           CFSTR("続ける"),
           CFSTR("本人確認"),
           CFSTR("システムによって認証がキャンセルされました"),
           CFSTR("%@でコードを生成"),
           CFSTR("デバイスリストが空です。"),
           CFSTR("無効なセッションです。"),
           CFSTR("不正なサーバ応答です"),
           CFSTR("電話番号確認のために送信したコードの数が多すぎます。しばらくしてからもう一度お試しください。"),
           CFSTR("末尾が %@ の電話番号"),
           CFSTR("入力されたアカウント名またはパスワードが正しくありません。"),
           CFSTR("Apple ID フィールドが未入力です"),
           CFSTR("iForgot…"),
           CFSTR("本人確認に対する誤った入力が多すぎます。 セキュリティ上の理由により、以後8時間は復旧キーを使用しない限りアカウントを変更できなくなります。"),
           CFSTR("デバイス情報がありません。"),
           CFSTR(" ID またはパスワードをお忘れですか？"),
           CFSTR("この Apple ID は、セキュリティ上の理由により無効にされています。%@ でパスワードをリセットできます。"),
           CFSTR("Touch ID によって %@ として認証されました"),
           CFSTR("ユーザによって認証がキャンセルされました"),
           CFSTR("末尾が%@の番号"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_Japanese;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
