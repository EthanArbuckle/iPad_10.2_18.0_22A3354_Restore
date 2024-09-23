@implementation CDStorePurchaseDidFinishAuthRequest

- (CDStorePurchaseDidFinishAuthRequest)initWithRapportDictionary:(id)a3
{
  id v4;
  CDStorePurchaseDidFinishAuthRequest *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  AMSDelegatePurchaseResult *purchaseResult;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSError *error;
  uint64_t NSNumber;
  void *v17;
  CFTypeID TypeID;
  NSString *v19;
  NSString *deviceModel;
  CFTypeID v21;
  NSString *v22;
  NSString *deviceName;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CDStorePurchaseDidFinishAuthRequest;
  v5 = -[CDStorePurchaseDidFinishAuthRequest init](&v25, "init");
  if (v5)
  {
    v6 = objc_opt_self(AMSDelegatePurchaseResult);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = sub_100019F54(v4, CFSTR("purchaseResult"), (uint64_t)v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    purchaseResult = v5->_purchaseResult;
    v5->_purchaseResult = (AMSDelegatePurchaseResult *)v9;

    v11 = objc_opt_self(NSError);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = sub_100019F54(v4, CFSTR("authError"), (uint64_t)v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    error = v5->_error;
    v5->_error = (NSError *)v14;

    NSNumber = NSDictionaryGetNSNumber(v4, CFSTR("deviceFlags"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    v5->_deviceFlags = (unint64_t)objc_msgSend(v17, "unsignedIntegerValue");

    TypeID = CFStringGetTypeID();
    v19 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, CFSTR("deviceModel"), TypeID, 0), "copy");
    deviceModel = v5->_deviceModel;
    v5->_deviceModel = v19;

    v21 = CFStringGetTypeID();
    v22 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, CFSTR("deviceName"), v21, 0), "copy");
    deviceName = v5->_deviceName;
    v5->_deviceName = v22;

  }
  return v5;
}

- (id)makeRapportDictionary
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = sub_10001A22C((uint64_t)self->_purchaseResult);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("purchaseResult"));

  v6 = sub_10001A22C((uint64_t)self->_error);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("authError"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_deviceFlags));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("deviceFlags"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceModel, CFSTR("deviceModel"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceName, CFSTR("deviceName"));
  v9 = objc_msgSend(v3, "copy");

  return v9;
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
  v4 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_purchaseResult, CFSTR("purchaseResult"), 1);
  v5 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_error, CFSTR("error"), 1);
  v6 = CUPrintFlags64(self->_deviceFlags, &unk_100024780);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("deviceFlags"));

  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_deviceModel, CFSTR("deviceModel"), 1);
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_deviceName, CFSTR("deviceName"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return (NSString *)v8;
}

- (AMSDelegatePurchaseResult)purchaseResult
{
  return self->_purchaseResult;
}

- (void)setPurchaseResult:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseResult, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
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
  objc_storeStrong((id *)&self->_purchaseResult, 0);
}

@end
