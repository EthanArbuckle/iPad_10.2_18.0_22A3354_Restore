@implementation ACMLocale_zh_Hans

- (ACMLocale_zh_Hans)init
{
  ACMLocale_zh_Hans *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACMLocale_zh_Hans;
  v2 = -[ACMLocale_zh_Hans init](&v6, sel_init);
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
    v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("密码字段为空白。"), CFSTR("取消"), CFSTR("登录"), CFSTR("发送"), CFSTR("好"), CFSTR("呼叫方式错误。无法隐藏 AppleConnect 登录对话框。"), CFSTR("参数无效。部分输入参数未正确设置。"), CFSTR("Apple ID 密码"), CFSTR("您似乎已离线。请连接到互联网并再试一次。"), CFSTR("您输入的 Apple ID 或密码不正确。"), CFSTR("需要进行两步验证，但不允许用户进行交互操作。"), CFSTR("受信任设备"), CFSTR("若要管理您的受信任设备，请通过 Mac 或 PC 访问 %@。"), CFSTR("无法创建有效的服务票证。"), CFSTR("两步验证响应为空。"), CFSTR("发送短信至电话号码"), CFSTR("您在下方所选的设备将收到一个临时验证码，以验证您的身份。"),
           CFSTR("内存不足"),
           CFSTR("john.appleseed"),
           CFSTR("发送代码至%@"),
           CFSTR("意外的方法调用"),
           CFSTR("验证码验证失败次数过多。请发送一个新验证码到其他设备，或稍后重试。"),
           CFSTR("数据令牌无效。用于验证的数据令牌无效。"),
           CFSTR("应用程序已取消认证。"),
           CFSTR("密码长度不正确"),
           CFSTR("验证码"),
           CFSTR("出于安全原因，此帐户已停用。您可以在 %@ 重设您的密码。"),
           CFSTR("无法在任何设备接收信息？"),
           CFSTR("发送新验证码"),
           CFSTR("很抱歉，发生了错误。感谢您的耐心，请稍后再试。"),
           CFSTR("必填"),
           CFSTR("无法找到此人。"),
           CFSTR("输入验证码"),
           CFSTR("没有找到设备。"),
           CFSTR("Apple ID"),
           CFSTR("此 Apple ID 已启用两步验证。"),
           CFSTR("无法验证令牌。"),
           CFSTR("密码"),
           CFSTR("为保障您的安全，请重设您的密码。只需前往 %@ 即可轻松重设。"),
           CFSTR("此设备上的当前时间似乎错误。您可以前往“设置”>“通用”>“日期与时间”进行修复，然后重试。"),
           CFSTR("无法创建有效的 SSO 令牌。"),
           CFSTR("您输入的验证码无效。"),
           CFSTR("继续"),
           CFSTR("验证身份"),
           CFSTR("系统已取消认证。"),
           CFSTR("以%@生成的代码"),
           CFSTR("设备列表为空。"),
           CFSTR("会话无效。"),
           CFSTR("服务器的响应格式错误。"),
           CFSTR("您已发送过多验证码来验证您的电话号码。请稍后再试。"),
           CFSTR("手机尾号 %@"),
           CFSTR("您输入的帐户名称或密码不正确。"),
           CFSTR("Apple ID 字段为空白。"),
           CFSTR("iForgot…"),
           CFSTR("很抱歉，您尝试验证身份的失败次数过多。为了帐户安全，在未来八小时内，如果不使用恢复密钥，您将无法更改帐户。"),
           CFSTR("无法提供设备信息。"),
           CFSTR("忘记了 ID 或密码？"),
           CFSTR("出于安全原因，此 Apple ID 已停用。您可以在 %@ 重设您的密码。"),
           CFSTR("使用 Touch ID 认证 %@"),
           CFSTR("用户已取消认证。"),
           CFSTR("电话号码尾号 %@"));
    -[ACMBaseLocale setLocaleStrings:](v2, "setLocaleStrings:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v4, v3));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMBaseLocale setLocaleStrings:](self, "setLocaleStrings:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMLocale_zh_Hans;
  -[ACMBaseLocale dealloc](&v3, sel_dealloc);
}

@end
