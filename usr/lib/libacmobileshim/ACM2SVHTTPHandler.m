@implementation ACM2SVHTTPHandler

- (BOOL)shouldValidateTGTs
{
  return 0;
}

- (id)convertErrorToACMError:(id)a3
{
  void *v5;
  id result;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  objc_super *v11;
  uint64_t v12;
  const __CFString *v13;
  int v14;
  objc_super v15;
  ACM2SVHTTPHandler *v16;

  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    ACFLog(6, (uint64_t)"-[ACM2SVHTTPHandler convertErrorToACMError:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACM2SVHTTPHandler.m", 27, 0, "Convert error %@ to user-friedly error.", a3);
  v5 = (void *)objc_msgSend(a3, "domain");
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ACCAppleConnectErrorDomain")) & 1) != 0)
    return a3;
  v7 = objc_msgSend(a3, "localizedFailureReason");
  v8 = (id)objc_msgSend(a3, "localizedDescription");
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("HTTPServerErrorDomain")))
  {
    v9 = objc_msgSend(a3, "code");
    if (v9 <= -21653)
    {
      if (v9 <= -21664)
      {
        if (v9 == -21673)
        {
          v8 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("You failed to verify the code too many times. Please send a new code to a different device or try again later."));
          v10 = -200260;
          goto LABEL_33;
        }
        if (v9 == -21669)
        {
          v8 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("The verification code you entered is not valid."));
          v10 = -200250;
          goto LABEL_33;
        }
        goto LABEL_35;
      }
      if (v9 == -21663)
      {
        v8 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Sorry, but you have made too many unsuccessful attempts to verify your identity. For security reasons, you will not be able to make changes to your account for the next eight hours without your Recovery Key."));
        v14 = 100;
        goto LABEL_32;
      }
      if (v9 != -21654)
      {
LABEL_35:
        v16 = self;
        v11 = (objc_super *)&v16;
        goto LABEL_14;
      }
    }
    else
    {
      if (v9 > -20624)
      {
        if (v9 != -20623)
        {
          if (v9 == -20600)
          {
            v8 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Cannot find this person."));
            v10 = -200270;
            goto LABEL_33;
          }
          if (v9 == -20100)
          {
            v8 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Invalid Session."));
            v10 = -200220;
            goto LABEL_33;
          }
          goto LABEL_35;
        }
        v13 = CFSTR("Device is not found.");
        goto LABEL_28;
      }
      if (v9 != -21652)
      {
        if (v9 == -21651)
        {
          v10 = -200310;
          v8 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Two-step verification has been disabled for the Apple ID account %@."));
          v12 = objc_msgSend((id)-[ACCAuthContextProtocol principal](-[ACCHTTPHandler context](self, "context"), "principal"), "userName");
          if (v12)
            v8 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v8, v12);
          goto LABEL_33;
        }
        goto LABEL_35;
      }
    }
    v13 = CFSTR("No Device information available.");
LABEL_28:
    v8 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", v13);
    v14 = 80;
LABEL_32:
    v10 = *(_QWORD *)&v14 | 0xFFFFFFFFFFFCF18ALL;
    goto LABEL_33;
  }
  v15.receiver = self;
  v11 = &v15;
LABEL_14:
  v11->super_class = (Class)ACM2SVHTTPHandler;
  result = -[objc_super convertErrorToACMError:](v11, sel_convertErrorToACMError_, a3);
  if (result)
    return result;
  v10 = -200200;
LABEL_33:
  result = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), v10, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a3, *MEMORY[0x24BDD1398], v8, *MEMORY[0x24BDD0FC8], v7, *MEMORY[0x24BDD0FD8], 0, v15.receiver));
  if (!result)
    return a3;
  return result;
}

@end
