@implementation STUDeviceVersionProvider

- (STUDeviceVersionProvider)init
{
  STUDeviceVersionProvider *v2;
  STUDeviceVersionProvider *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUDeviceVersionProvider;
  v2 = -[STUDeviceVersionProvider init](&v5, "init");
  v3 = v2;
  if (v2)
    -[STUDeviceVersionProvider buildProviders](v2, "buildProviders");
  return v3;
}

- (void)buildProviders
{
  STUStaticPropertyProvider *v3;
  uint64_t v4;
  void *v5;
  STUDevicePropertyProviding *v6;
  STUDevicePropertyProviding *buildVersionProvider;
  STUStaticPropertyProvider *v8;
  uint64_t v9;
  void *v10;
  STUDevicePropertyProviding *v11;
  STUDevicePropertyProviding *systemVersionProvider;
  id v13;

  v13 = (id)objc_claimAutoreleasedReturnValue(+[CRKSystemInfo sharedSystemInfo](CRKSystemInfo, "sharedSystemInfo"));
  v3 = [STUStaticPropertyProvider alloc];
  v4 = CRKDeviceBuildVersionKey;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "buildVersion"));
  v6 = -[STUStaticPropertyProvider initWithKey:value:](v3, "initWithKey:value:", v4, v5);
  buildVersionProvider = self->_buildVersionProvider;
  self->_buildVersionProvider = v6;

  v8 = [STUStaticPropertyProvider alloc];
  v9 = CRKDeviceSystemVersionKey;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "systemVersion"));
  v11 = -[STUStaticPropertyProvider initWithKey:value:](v8, "initWithKey:value:", v9, v10);
  systemVersionProvider = self->_systemVersionProvider;
  self->_systemVersionProvider = v11;

}

- (STUDevicePropertyProviding)buildVersionProvider
{
  return self->_buildVersionProvider;
}

- (STUDevicePropertyProviding)systemVersionProvider
{
  return self->_systemVersionProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemVersionProvider, 0);
  objc_storeStrong((id *)&self->_buildVersionProvider, 0);
}

@end
