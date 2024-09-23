@implementation TRDeviceSetupConnectAction

- (TRDeviceSetupConnectAction)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRDeviceSetupConnectAction;
  return (TRDeviceSetupConnectAction *)-[TRDeviceSetupAction _initWithActionType:parameters:](&v3, sel__initWithActionType_parameters_, CFSTR("connect"), 0);
}

- (TRDeviceSetupConnectAction)initWithDeviceName:(id)a3 networkSSID:(id)a4 networkPassword:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  TRDeviceSetupConnectAction *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("d"));
  if (v9)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("ns"));
  if (v10)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("np"));
  v15.receiver = self;
  v15.super_class = (Class)TRDeviceSetupConnectAction;
  v13 = -[TRDeviceSetupAction _initWithActionType:parameters:](&v15, sel__initWithActionType_parameters_, CFSTR("connect"), v12);

  return v13;
}

- (NSString)deviceName
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[TRDeviceSetupAction parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("d"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return (NSString *)v5;
}

- (NSString)networkSSID
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[TRDeviceSetupAction parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ns"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return (NSString *)v5;
}

- (NSString)networkPassword
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[TRDeviceSetupAction parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("np"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return (NSString *)v5;
}

@end
