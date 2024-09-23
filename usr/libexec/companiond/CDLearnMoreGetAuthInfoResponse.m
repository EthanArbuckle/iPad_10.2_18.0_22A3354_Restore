@implementation CDLearnMoreGetAuthInfoResponse

- (CDLearnMoreGetAuthInfoResponse)initWithRapportDictionary:(id)a3
{
  id v4;
  CDLearnMoreGetAuthInfoResponse *v5;
  CFTypeID TypeID;
  NSString *v7;
  NSString *deviceClass;
  CFTypeID v9;
  NSString *v10;
  NSString *deviceName;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSURL *URL;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CDLearnMoreGetAuthInfoResponse;
  v5 = -[CDLearnMoreGetAuthInfoResponse init](&v18, "init");
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

    v12 = objc_opt_self(NSURL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = sub_100019F54(v4, CFSTR("learnMoreURL"), (uint64_t)v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    URL = v5->_URL;
    v5->_URL = (NSURL *)v15;

  }
  return v5;
}

- (id)makeRapportDictionary
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceClass, CFSTR("deviceClass"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceName, CFSTR("deviceName"));
  v4 = sub_10001A22C((uint64_t)self->_URL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("learnMoreURL"));

  v6 = objc_msgSend(v3, "copy");
  return v6;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_deviceClass, CFSTR("deviceClass"), 1);
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_deviceName, CFSTR("deviceName"), 1);
  v4 = objc_msgSend(v3, "appendObject:withName:", self->_URL, CFSTR("URL"));
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

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
}

@end
