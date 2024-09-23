@implementation ACM2SVHTTPVerifySecurityCodeHandler

- (ACM2SVHTTPVerifySecurityCodeHandler)initWithContext:(id)a3
{
  ACM2SVHTTPVerifySecurityCodeHandler *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACM2SVHTTPVerifySecurityCodeHandler;
  v4 = -[ACMHTTPAuthenticationHandler initWithContext:](&v6, sel_initWithContext_);
  if (v4)
    -[ACFHTTPTransportProtocol setRequestURLTemplate:](-[ACCHTTPHandler transport](v4, "transport"), "setRequestURLTemplate:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components"), "preferences"), "environmentPreferencesWithRealm:", objc_msgSend((id)objc_msgSend(a3, "principal"), "realm")), "verifySecurityCodeURLString"));
  return v4;
}

- (id)convertErrorToACMError:(id)a3
{
  objc_super v6;

  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    ACFLog(6, (uint64_t)"-[ACM2SVHTTPVerifySecurityCodeHandler convertErrorToACMError:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACM2SVHTTPVerifySecurityCodeHandler.m", 30, 0, "Convert error %@ to user-friedly error.", a3);
  v6.receiver = self;
  v6.super_class = (Class)ACM2SVHTTPVerifySecurityCodeHandler;
  return -[ACM2SVHTTPHandler convertErrorToACMError:](&v6, sel_convertErrorToACMError_, a3);
}

@end
