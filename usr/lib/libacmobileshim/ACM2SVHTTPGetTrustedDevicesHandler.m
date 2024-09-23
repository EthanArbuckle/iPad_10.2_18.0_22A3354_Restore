@implementation ACM2SVHTTPGetTrustedDevicesHandler

- (ACM2SVHTTPGetTrustedDevicesHandler)initWithContext:(id)a3
{
  ACM2SVHTTPGetTrustedDevicesHandler *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACM2SVHTTPGetTrustedDevicesHandler;
  v4 = -[ACMHTTPAuthenticationHandler initWithContext:](&v6, sel_initWithContext_);
  if (v4)
    -[ACFHTTPTransportProtocol setRequestURLTemplate:](-[ACCHTTPHandler transport](v4, "transport"), "setRequestURLTemplate:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components"), "preferences"), "environmentPreferencesWithRealm:", objc_msgSend((id)objc_msgSend(a3, "principal"), "realm")), "getTrustedDevicesURLString"));
  return v4;
}

- (id)convertErrorToACMError:(id)a3
{
  void *v5;
  id result;
  uint64_t v7;
  id v8;
  uint64_t v9;
  objc_super *v10;
  ACM2SVHTTPGetTrustedDevicesHandler *v11;
  objc_super v12;

  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    ACFLog(6, (uint64_t)"-[ACM2SVHTTPGetTrustedDevicesHandler convertErrorToACMError:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACM2SVHTTPGetTrustedDevicesHandler.m", 33, 0, "Convert error %@ to user-friedly error.", a3);
  v5 = (void *)objc_msgSend(a3, "domain");
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ACCAppleConnectErrorDomain")) & 1) != 0)
    return a3;
  v7 = objc_msgSend(a3, "localizedFailureReason");
  v8 = (id)objc_msgSend(a3, "localizedDescription");
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("HTTPServerErrorDomain")))
  {
    v11 = self;
    v10 = (objc_super *)&v11;
    goto LABEL_12;
  }
  v9 = objc_msgSend(a3, "code");
  if (v9 != -20100 && v9 != -20600)
  {
    v12.receiver = self;
    v10 = &v12;
LABEL_12:
    v10->super_class = (Class)ACM2SVHTTPGetTrustedDevicesHandler;
    result = -[objc_super convertErrorToACMError:](v10, sel_convertErrorToACMError_, a3);
    if (result)
      return result;
    goto LABEL_13;
  }
  v8 = +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Oops, an error occurred. Thanks for your patience, please try again later."));
LABEL_13:
  result = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ACCAppleConnectErrorDomain"), -200200, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a3, *MEMORY[0x24BDD1398], v8, *MEMORY[0x24BDD0FC8], v7, *MEMORY[0x24BDD0FD8], 0, v11));
  if (!result)
    return a3;
  return result;
}

@end
