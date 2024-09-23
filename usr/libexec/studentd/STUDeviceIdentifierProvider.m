@implementation STUDeviceIdentifierProvider

- (STUDeviceIdentifierProvider)init
{
  STUDeviceIdentifierProvider *v2;
  STUDeviceIdentifierProvider *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUDeviceIdentifierProvider;
  v2 = -[STUDeviceIdentifierProvider init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[STUDeviceIdentifierProvider fetchSerialNumber](v2, "fetchSerialNumber");
    -[STUDeviceIdentifierProvider buildProviders](v3, "buildProviders");
  }
  return v3;
}

- (void)fetchSerialNumber
{
  NSString *v3;
  NSString *mSerialNumber;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[CRKMobileGestalt sharedGestalt](CRKMobileGestalt, "sharedGestalt"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serialNumber"));
  mSerialNumber = self->mSerialNumber;
  self->mSerialNumber = v3;

}

- (void)buildProviders
{
  STUStaticPropertyProvider *v3;
  const __CFString *mSerialNumber;
  STUDevicePropertyProviding *v5;
  STUDevicePropertyProviding *serialNumberProvider;
  STUStaticPropertyProvider *v7;
  STUDevicePropertyProviding *v8;
  STUDevicePropertyProviding *deviceIdentifierProvider;
  NSString *v10;

  v3 = [STUStaticPropertyProvider alloc];
  if (self->mSerialNumber)
    mSerialNumber = (const __CFString *)self->mSerialNumber;
  else
    mSerialNumber = CFSTR("Unknown");
  v5 = -[STUStaticPropertyProvider initWithKey:value:](v3, "initWithKey:value:", CRKDeviceSerialNumberKey, mSerialNumber);
  serialNumberProvider = self->_serialNumberProvider;
  self->_serialNumberProvider = v5;

  v10 = self->mSerialNumber;
  v7 = [STUStaticPropertyProvider alloc];
  v8 = -[STUStaticPropertyProvider initWithKey:value:](v7, "initWithKey:value:", CRKDeviceIdentifierKey, v10);
  deviceIdentifierProvider = self->_deviceIdentifierProvider;
  self->_deviceIdentifierProvider = v8;

}

- (id)makeDeviceIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringForKey:", CFSTR("DeviceIdentifier")));
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("DeviceIdentifier"));
  }

  return v3;
}

- (STUDevicePropertyProviding)serialNumberProvider
{
  return self->_serialNumberProvider;
}

- (STUDevicePropertyProviding)deviceIdentifierProvider
{
  return self->_deviceIdentifierProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifierProvider, 0);
  objc_storeStrong((id *)&self->_serialNumberProvider, 0);
  objc_storeStrong((id *)&self->mSerialNumber, 0);
}

@end
