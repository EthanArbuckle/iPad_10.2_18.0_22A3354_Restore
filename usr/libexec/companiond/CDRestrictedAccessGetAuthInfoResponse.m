@implementation CDRestrictedAccessGetAuthInfoResponse

- (CDRestrictedAccessGetAuthInfoResponse)initWithRapportDictionary:(id)a3
{
  id v4;
  CDRestrictedAccessGetAuthInfoResponse *v5;
  CFTypeID TypeID;
  NSString *v7;
  NSString *deviceClass;
  CFTypeID v9;
  NSString *v10;
  NSString *deviceName;
  CFTypeID v12;
  NSString *v13;
  NSString *currentUserName;
  uint64_t NSNumber;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CDRestrictedAccessGetAuthInfoResponse;
  v5 = -[CDRestrictedAccessGetAuthInfoResponse init](&v18, "init");
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
    v13 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, CFSTR("currentUserName"), v12, 0), "copy");
    currentUserName = v5->_currentUserName;
    v5->_currentUserName = v13;

    NSNumber = NSDictionaryGetNSNumber(v4, CFSTR("restrictionType"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    v5->_restrictionType = (int64_t)objc_msgSend(v16, "integerValue");

  }
  return v5;
}

- (id)makeRapportDictionary
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceClass, CFSTR("deviceClass"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceName, CFSTR("deviceName"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_currentUserName, CFSTR("currentUserName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_restrictionType));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("restrictionType"));

  v5 = objc_msgSend(v3, "copy");
  return v5;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_deviceClass, CFSTR("deviceClass"), 1);
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_deviceName, CFSTR("deviceName"), 1);
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_currentUserName, CFSTR("currentUserName"), 1);
  v4 = objc_msgSend(v3, "appendInteger:withName:", self->_restrictionType, CFSTR("restrictionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return (NSString *)v5;
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

- (NSString)currentUserName
{
  return self->_currentUserName;
}

- (void)setCurrentUserName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)restrictionType
{
  return self->_restrictionType;
}

- (void)setRestrictionType:(int64_t)a3
{
  self->_restrictionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUserName, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
}

@end
