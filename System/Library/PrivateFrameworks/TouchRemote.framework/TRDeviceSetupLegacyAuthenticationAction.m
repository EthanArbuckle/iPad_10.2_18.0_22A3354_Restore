@implementation TRDeviceSetupLegacyAuthenticationAction

- (id)propertyListRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TRDeviceSetupLegacyAuthenticationAction;
  -[TRDeviceSetupAction propertyListRepresentation](&v11, sel_propertyListRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("auth"), CFSTR("a"));
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRDeviceSetupLegacyAuthenticationAction deviceGUID](self, "deviceGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("g"));

  -[TRDeviceSetupLegacyAuthenticationAction userAgent](self, "userAgent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("ua"));

  -[TRDeviceSetupLegacyAuthenticationAction deviceName](self, "deviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("d"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("p"));
  v9 = (void *)objc_msgSend(v4, "copy");

  return v9;
}

- (NSString)deviceGUID
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[TRDeviceSetupAction parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("g"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return (NSString *)v5;
}

- (NSString)userAgent
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[TRDeviceSetupAction parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ua"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return (NSString *)v5;
}

- (id)deviceName
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

  return v5;
}

- (void)setDeviceGUID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceGUID, a3);
}

- (void)setUserAgent:(id)a3
{
  objc_storeStrong((id *)&self->_userAgent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_deviceGUID, 0);
}

@end
