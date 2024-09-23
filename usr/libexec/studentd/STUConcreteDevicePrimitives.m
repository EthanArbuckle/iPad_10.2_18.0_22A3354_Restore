@implementation STUConcreteDevicePrimitives

- (STUDeviceIdentifierProvider)deviceIdentifierProvider
{
  STUDeviceIdentifierProvider *deviceIdentifierProvider;
  STUDeviceIdentifierProvider *v4;
  STUDeviceIdentifierProvider *v5;

  deviceIdentifierProvider = self->_deviceIdentifierProvider;
  if (!deviceIdentifierProvider)
  {
    v4 = objc_opt_new(STUDeviceIdentifierProvider);
    v5 = self->_deviceIdentifierProvider;
    self->_deviceIdentifierProvider = v4;

    deviceIdentifierProvider = self->_deviceIdentifierProvider;
  }
  return deviceIdentifierProvider;
}

- (NSArray)propertyProviders
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUConcreteDevicePrimitives.m"), 49, CFSTR("propertyProviders must be overridden."));

  return (NSArray *)&__NSArray0__struct;
}

- (id)crossPlatformPropertyProviders
{
  STULowBatteryPropertyProvider *v3;
  STULoginStatePropertyProvider *v4;
  STUNamePropertyProvider *v5;
  STUStaticPropertyProvider *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  STUStaticPropertyProvider *v10;
  STUSupervisedPropertyProvider *v11;
  STULocalePropertyProvider *v12;
  STUBatteryLevelPropertyProvider *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[9];

  v3 = objc_opt_new(STULowBatteryPropertyProvider);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteDevicePrimitives deviceIdentifierProvider](self, "deviceIdentifierProvider"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "deviceIdentifierProvider"));
  v20[0] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteDevicePrimitives deviceIdentifierProvider](self, "deviceIdentifierProvider"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "serialNumberProvider"));
  v20[1] = v16;
  v4 = objc_opt_new(STULoginStatePropertyProvider);
  v20[2] = v4;
  v5 = objc_opt_new(STUNamePropertyProvider);
  v20[3] = v5;
  v6 = [STUStaticPropertyProvider alloc];
  v7 = CRKDeviceTrustedExchangeIdentifierKey;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
  v10 = -[STUStaticPropertyProvider initWithKey:value:](v6, "initWithKey:value:", v7, v9);
  v20[4] = v10;
  v11 = objc_opt_new(STUSupervisedPropertyProvider);
  v20[5] = v11;
  v12 = objc_opt_new(STULocalePropertyProvider);
  v20[6] = v12;
  v20[7] = v3;
  v13 = -[STUBatteryLevelPropertyProvider initWithLowBatteryPropertyProvider:]([STUBatteryLevelPropertyProvider alloc], "initWithLowBatteryPropertyProvider:", v3);
  v20[8] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 9));

  return v14;
}

- (BOOL)isApplicationOpen:(id)a3 device:(id)a4
{
  return objc_msgSend(a4, "isApplicationOpen:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifierProvider, 0);
}

@end
