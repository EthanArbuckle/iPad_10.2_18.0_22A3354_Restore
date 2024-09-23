@implementation CDSystemAuthenticationGetAuthInfoResponse

- (CDSystemAuthenticationGetAuthInfoResponse)initWithRapportDictionary:(id)a3
{
  id v4;
  CDSystemAuthenticationGetAuthInfoResponse *v5;
  CFTypeID TypeID;
  NSString *v7;
  NSString *deviceClass;
  CFTypeID v9;
  NSString *v10;
  NSString *deviceName;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CDSystemAuthenticationGetAuthInfoResponse;
  v5 = -[CDSystemAuthenticationGetAuthInfoResponse init](&v13, "init");
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
}

@end
