@implementation ACMAuthContext

- (void)dealloc
{
  objc_super v3;

  -[ACMAuthContext setUserPreferences:](self, "setUserPreferences:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMAuthContext;
  -[ACCAuthContext dealloc](&v3, sel_dealloc);
}

- (BOOL)isDevicePwnd
{
  return 0;
}

- (id)parametersDictionary
{
  NSMutableDictionary *v3;
  void *v4;
  const __CFString *v5;
  id v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ACMAuthContext;
  v3 = -[ACCAuthContext parametersDictionary](&v9, sel_parametersDictionary);
  if (v3)
  {
    v4 = (void *)objc_msgSend(+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components"), "systemInfo");
    -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", objc_msgSend(v4, "IPAddress"), CFSTR("f"));
    -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", objc_msgSend(v4, "MACAddress"), CFSTR("g"));
    -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", objc_msgSend(v4, "uniqueDeviceIdentifier"), CFSTR("h"));
    if (-[ACMAuthContext isDevicePwnd](self, "isDevicePwnd"))
      v5 = CFSTR("true");
    else
      v5 = CFSTR("false");
    -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v5, CFSTR("i"));
    -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", objc_msgSend(v4, "deviceModel"), CFSTR("j"));
    -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", objc_msgSend(v4, "systemVersion"), CFSTR("k"));
    -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", CFSTR("2.9.2"), CFSTR("l"));
    v6 = objc_alloc_init(MEMORY[0x24BDC27F8]);
    v7 = objc_msgSend((id)objc_msgSend(v6, "subscriberCellularProvider"), "carrierName");

    if (v7)
      -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v7, CFSTR("ca"));
  }
  return v3;
}

- (NSString)userPreferences
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setUserPreferences:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

@end
