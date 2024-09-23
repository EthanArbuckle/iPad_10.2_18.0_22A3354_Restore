@implementation CDSharingGetAuthInfoResponse

- (CDSharingGetAuthInfoResponse)initWithRapportDictionary:(id)a3
{
  id v4;
  CDSharingGetAuthInfoResponse *v5;
  uint64_t v6;
  NSData *requestData;
  CFTypeID TypeID;
  NSString *v9;
  NSString *deviceClass;
  CFTypeID v11;
  NSString *v12;
  NSString *deviceName;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CDSharingGetAuthInfoResponse;
  v5 = -[CDSharingGetAuthInfoResponse init](&v15, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sharingData")));
    requestData = v5->_requestData;
    v5->_requestData = (NSData *)v6;

    TypeID = CFStringGetTypeID();
    v9 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, CFSTR("deviceClass"), TypeID, 0), "copy");
    deviceClass = v5->_deviceClass;
    v5->_deviceClass = v9;

    v11 = CFStringGetTypeID();
    v12 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, CFSTR("deviceName"), v11, 0), "copy");
    deviceName = v5->_deviceName;
    v5->_deviceName = v12;

  }
  return v5;
}

- (id)makeRapportDictionary
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_requestData, CFSTR("sharingData"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceClass, CFSTR("deviceClass"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceName, CFSTR("deviceName"));
  v4 = objc_msgSend(v3, "copy");

  return v4;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_requestData, CFSTR("requestData"), 1);
  v5 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_deviceClass, CFSTR("deviceClass"), 1);
  v6 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_deviceName, CFSTR("deviceName"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return (NSString *)v7;
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

- (NSData)requestData
{
  return self->_requestData;
}

- (void)setRequestData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestData, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
}

@end
