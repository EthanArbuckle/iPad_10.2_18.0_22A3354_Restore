@implementation CDRestrictedAccesssDidFinishAuthRequest

- (CDRestrictedAccesssDidFinishAuthRequest)initWithRapportDictionary:(id)a3
{
  id v4;
  CDRestrictedAccesssDidFinishAuthRequest *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSError *error;
  uint64_t NSNumber;
  void *v12;
  CFTypeID TypeID;
  NSString *v14;
  NSString *deviceModel;
  CFTypeID v16;
  NSString *v17;
  NSString *deviceName;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CDRestrictedAccesssDidFinishAuthRequest;
  v5 = -[CDRestrictedAccesssDidFinishAuthRequest init](&v20, "init");
  if (v5)
  {
    v5->_approved = CFDictionaryGetInt64(v4, CFSTR("authResponse"), 0) != 0;
    v6 = objc_opt_self(NSError);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = sub_100019F54(v4, CFSTR("authError"), (uint64_t)v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    error = v5->_error;
    v5->_error = (NSError *)v9;

    NSNumber = NSDictionaryGetNSNumber(v4, CFSTR("deviceFlags"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    v5->_deviceFlags = (unint64_t)objc_msgSend(v12, "unsignedIntegerValue");

    TypeID = CFStringGetTypeID();
    v14 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, CFSTR("deviceModel"), TypeID, 0), "copy");
    deviceModel = v5->_deviceModel;
    v5->_deviceModel = v14;

    v16 = CFStringGetTypeID();
    v17 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, CFSTR("deviceName"), v16, 0), "copy");
    deviceName = v5->_deviceName;
    v5->_deviceName = v17;

  }
  return v5;
}

- (id)makeRapportDictionary
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_approved));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("authResponse"));

  v5 = sub_10001A22C((uint64_t)self->_error);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("authError"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_deviceFlags));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("deviceFlags"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceModel, CFSTR("deviceModel"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceName, CFSTR("deviceName"));
  v8 = objc_msgSend(v3, "copy");

  return v8;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = objc_msgSend(v3, "appendBool:withName:", self->_approved, CFSTR("approved"));
  v5 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_error, CFSTR("error"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return (NSString *)v6;
}

- (BOOL)isApproved
{
  return self->_approved;
}

- (void)setApproved:(BOOL)a3
{
  self->_approved = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)deviceFlags
{
  return self->_deviceFlags;
}

- (void)setDeviceFlags:(unint64_t)a3
{
  self->_deviceFlags = a3;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
