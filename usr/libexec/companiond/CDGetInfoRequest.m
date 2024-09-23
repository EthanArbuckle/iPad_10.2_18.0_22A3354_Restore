@implementation CDGetInfoRequest

- (CDGetInfoRequest)initWithRapportDictionary:(id)a3
{
  id v4;
  CDGetInfoRequest *v5;
  CFTypeID TypeID;
  NSData *v7;
  NSData *storeAccountToken;
  CFTypeID v9;
  NSData *v10;
  NSData *appleAccountToken;
  CFTypeID v12;
  NSString *v13;
  NSString *nonce;
  uint64_t NSNumber;
  void *v16;
  CFTypeID v17;
  NSString *v18;
  NSString *deviceModel;
  CFTypeID v20;
  NSString *v21;
  NSString *deviceName;
  CFTypeID v23;
  NSString *v24;
  NSString *deviceBuildVersion;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CDGetInfoRequest;
  v5 = -[CDGetInfoRequest init](&v27, "init");
  if (v5)
  {
    TypeID = CFDataGetTypeID();
    v7 = (NSData *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, CFSTR("storeAccountToken"), TypeID, 0), "copy");
    storeAccountToken = v5->_storeAccountToken;
    v5->_storeAccountToken = v7;

    v9 = CFDataGetTypeID();
    v10 = (NSData *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, CFSTR("appleAccountToken"), v9, 0), "copy");
    appleAccountToken = v5->_appleAccountToken;
    v5->_appleAccountToken = v10;

    v12 = CFStringGetTypeID();
    v13 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, CFSTR("nonce"), v12, 0), "copy");
    nonce = v5->_nonce;
    v5->_nonce = v13;

    NSNumber = NSDictionaryGetNSNumber(v4, CFSTR("deviceFlags"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    v5->_deviceFlags = (unint64_t)objc_msgSend(v16, "unsignedIntegerValue");

    v17 = CFStringGetTypeID();
    v18 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, CFSTR("deviceModel"), v17, 0), "copy");
    deviceModel = v5->_deviceModel;
    v5->_deviceModel = v18;

    v20 = CFStringGetTypeID();
    v21 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, CFSTR("deviceName"), v20, 0), "copy");
    deviceName = v5->_deviceName;
    v5->_deviceName = v21;

    v23 = CFStringGetTypeID();
    v24 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, CFSTR("deviceBuildVersion"), v23, 0), "copy");
    deviceBuildVersion = v5->_deviceBuildVersion;
    v5->_deviceBuildVersion = v24;

  }
  return v5;
}

- (id)makeRapportDictionary
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_storeAccountToken, CFSTR("storeAccountToken"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_appleAccountToken, CFSTR("appleAccountToken"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_nonce, CFSTR("nonce"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_deviceFlags));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("deviceFlags"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceModel, CFSTR("deviceModel"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceName, CFSTR("deviceName"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceBuildVersion, CFSTR("deviceBuildVersion"));
  v5 = objc_msgSend(v3, "copy");

  return v5;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_storeAccountToken, CFSTR("storeAccountToken"), 1);
  v5 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_appleAccountToken, CFSTR("appleAccountToken"), 1);
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_nonce, CFSTR("nonce"), 1);
  v6 = CUPrintFlags64(self->_deviceFlags, &unk_100024780);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("deviceFlags"));

  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_deviceModel, CFSTR("deviceModel"), 1);
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_deviceName, CFSTR("deviceName"), 1);
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_deviceBuildVersion, CFSTR("deviceBuildVersion"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return (NSString *)v8;
}

- (NSData)storeAccountToken
{
  return self->_storeAccountToken;
}

- (void)setStoreAccountToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)appleAccountToken
{
  return self->_appleAccountToken;
}

- (void)setAppleAccountToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)deviceBuildVersion
{
  return self->_deviceBuildVersion;
}

- (void)setDeviceBuildVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceBuildVersion, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_appleAccountToken, 0);
  objc_storeStrong((id *)&self->_storeAccountToken, 0);
}

@end
