@implementation WiFiUsageApplicationSession

- (void)applicationStateDidChange:(id)a3 withAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  -[WiFiUsageSession activeApplications](self, "activeApplications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v6 || objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.springboard")))
  {
    if (-[WiFiUsageSession isSessionActive](self, "isSessionActive"))
    {
      NSLog(CFSTR("%s: application session ended"), "-[WiFiUsageApplicationSession applicationStateDidChange:withAttributes:]");
      -[WiFiUsageSession sessionDidEnd](self, "sessionDidEnd");
    }
    goto LABEL_7;
  }
  if (v9)
  {
    -[WiFiUsageSession activeApplications](self, "activeApplications");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: application session resumed:%@"), "-[WiFiUsageApplicationSession applicationStateDidChange:withAttributes:]", v10);

LABEL_7:
    v11.receiver = self;
    v11.super_class = (Class)WiFiUsageApplicationSession;
    -[WiFiUsageSession applicationStateDidChange:withAttributes:](&v11, sel_applicationStateDidChange_withAttributes_, v6, v7);
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "rangeOfString:options:", CFSTR("spotlight"), 1) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v6, "rangeOfString:options:", CFSTR(".extension"), 1) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v6, "rangeOfString:options:", CFSTR(".widget"), 1) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v6, "rangeOfString:options:", CFSTR("preferences"), 1) == 0x7FFFFFFFFFFFFFFFLL
    && +[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:](WiFiUsagePrivacyFilter, "canPerformActionWithSampleRate:", 3))
  {
    NSLog(CFSTR("%s: application session started:%@"), "-[WiFiUsageApplicationSession applicationStateDidChange:withAttributes:]", v6);
    -[WiFiUsageSession sessionDidStart](self, "sessionDidStart");
    goto LABEL_7;
  }
LABEL_8:

}

- (WiFiUsageApplicationSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WiFiUsageApplicationSession;
  return -[WiFiUsageSession initWithSessionType:andInterfaceName:andCapabilities:](&v5, sel_initWithSessionType_andInterfaceName_andCapabilities_, 5, a3, a4);
}

- (id)metricName
{
  return CFSTR("com.apple.wifi.applicationsession");
}

@end
