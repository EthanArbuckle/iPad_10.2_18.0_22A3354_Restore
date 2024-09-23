@implementation CDLearnMoreDidFinishRequest

- (CDLearnMoreDidFinishRequest)initWithRapportDictionary:(id)a3
{
  id v4;
  CDLearnMoreDidFinishRequest *v5;
  uint64_t NSNumber;
  void *v7;
  CFTypeID TypeID;
  NSString *v9;
  NSString *deviceModel;
  CFTypeID v11;
  NSString *v12;
  NSString *deviceName;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CDLearnMoreDidFinishRequest;
  v5 = -[CDLearnMoreDidFinishRequest init](&v15, "init");
  if (v5)
  {
    NSNumber = NSDictionaryGetNSNumber(v4, CFSTR("deviceFlags"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    v5->_deviceFlags = (unint64_t)objc_msgSend(v7, "unsignedIntegerValue");

    TypeID = CFStringGetTypeID();
    v9 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, CFSTR("deviceModel"), TypeID, 0), "copy");
    deviceModel = v5->_deviceModel;
    v5->_deviceModel = v9;

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
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_deviceFlags));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("deviceFlags"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceModel, CFSTR("deviceModel"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceName, CFSTR("deviceName"));
  v5 = objc_msgSend(v3, "copy");

  return v5;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = CUPrintFlags64(self->_deviceFlags, &unk_100024780);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("deviceFlags"));

  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_deviceModel, CFSTR("deviceModel"), 1);
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_deviceName, CFSTR("deviceName"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return (NSString *)v6;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
}

@end
