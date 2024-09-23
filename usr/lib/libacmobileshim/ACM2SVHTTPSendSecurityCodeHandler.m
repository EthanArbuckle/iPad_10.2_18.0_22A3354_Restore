@implementation ACM2SVHTTPSendSecurityCodeHandler

- (ACM2SVHTTPSendSecurityCodeHandler)initWithContext:(id)a3
{
  ACM2SVHTTPSendSecurityCodeHandler *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACM2SVHTTPSendSecurityCodeHandler;
  v4 = -[ACMHTTPAuthenticationHandler initWithContext:](&v6, sel_initWithContext_);
  if (v4)
    -[ACFHTTPTransportProtocol setRequestURLTemplate:](-[ACCHTTPHandler transport](v4, "transport"), "setRequestURLTemplate:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components"), "preferences"), "environmentPreferencesWithRealm:", objc_msgSend((id)objc_msgSend(a3, "principal"), "realm")), "generateAndSendSecCodeURLString"));
  return v4;
}

- (id)convertErrorToACMError:(id)a3
{
  void *v5;
  id result;
  uint64_t v7;
  uint64_t v8;
  id v9;
  objc_super *v10;
  ACM2SVHTTPSendSecurityCodeHandler *v11;
  objc_super v12;

  if (ACFLog)
  {
    if ((ACFLogSettingsGetLevelMask() & 0x40) != 0)
      ACFLog(6, (uint64_t)"-[ACM2SVHTTPSendSecurityCodeHandler convertErrorToACMError:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACM2SVHTTPSendSecurityCodeHandler.m", 32, 0, "Convert error %@ to user-friedly error.", a3);
  }
  v5 = (void *)objc_msgSend(a3, "domain");
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ACCAppleConnectErrorDomain")) & 1) != 0)
    return a3;
  v7 = -200240;
  v8 = objc_msgSend(a3, "localizedFailureReason");
  v9 = (id)objc_msgSend(a3, "localizedDescription");
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("HTTPServerErrorDomain")))
  {
    if (objc_msgSend(a3, "code") == -21666)
    {
      v9 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("You have sent too many codes to verify your phone number. Please try again later."));
      goto LABEL_13;
    }
    v12.receiver = self;
    v10 = &v12;
  }
  else
  {
    v11 = self;
    v10 = (objc_super *)&v11;
  }
  v10->super_class = (Class)ACM2SVHTTPSendSecurityCodeHandler;
  result = -[objc_super convertErrorToACMError:](v10, sel_convertErrorToACMError_, a3);
  if (result)
    return result;
  v7 = -200200;
LABEL_13:
  result = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), v7, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a3, *MEMORY[0x24BDD1398], v9, *MEMORY[0x24BDD0FC8], v8, *MEMORY[0x24BDD0FD8], 0, v11));
  if (!result)
    return a3;
  return result;
}

@end
