@implementation CDGetNotifInfoResponse

- (CDGetNotifInfoResponse)initWithRapportDictionary:(id)a3
{
  id v4;
  CDGetNotifInfoResponse *v5;
  CFTypeID TypeID;
  NSString *v7;
  NSString *deviceClass;
  CFTypeID v9;
  NSString *v10;
  NSString *deviceName;
  CFTypeID v12;
  NSString *v13;
  NSString *appName;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CDGetNotifInfoResponse;
  v5 = -[CDGetNotifInfoResponse init](&v16, "init");
  if (v5)
  {
    TypeID = CFStringGetTypeID();
    v7 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, CFSTR("deviceClass"), TypeID, 0), "copy");
    deviceClass = v5->_deviceClass;
    v5->_deviceClass = v7;

    v9 = CFStringGetTypeID();
    v10 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, CFSTR("deviceName"), v9, 0), "copy");
    deviceName = v5->_deviceName;
    v5->_deviceName = v10;

    v12 = CFStringGetTypeID();
    v13 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, CFSTR("appName"), v12, 0), "copy");
    appName = v5->_appName;
    v5->_appName = v13;

  }
  return v5;
}

- (id)makeRapportDictionary
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceClass, CFSTR("deviceClass"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceName, CFSTR("deviceName"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_appName, CFSTR("appName"));
  v4 = objc_msgSend(v3, "copy");

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_deviceClass, CFSTR("deviceClass"), 1);
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_deviceName, CFSTR("deviceName"), 1);
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_appName, CFSTR("appName"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return (NSString *)v4;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
}

@end
