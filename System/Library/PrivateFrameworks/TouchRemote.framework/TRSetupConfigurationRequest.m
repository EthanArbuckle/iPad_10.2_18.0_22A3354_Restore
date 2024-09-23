@implementation TRSetupConfigurationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *deviceName;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TRSetupConfigurationRequest;
  -[TRMessage encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  deviceName = self->_deviceName;
  if (deviceName)
    objc_msgSend(v4, "encodeObject:forKey:", deviceName, CFSTR("TRSetupConfigurationMessages_dN"));

}

- (TRSetupConfigurationRequest)initWithCoder:(id)a3
{
  id v4;
  TRSetupConfigurationRequest *v5;
  uint64_t v6;
  NSString *deviceName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRSetupConfigurationRequest;
  v5 = -[TRMessage initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TRSetupConfigurationMessages_dN"));
    v6 = objc_claimAutoreleasedReturnValue();
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v6;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("deviceName:[-%@-]"), self->_deviceName);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)TRSetupConfigurationRequest;
  -[TRMessage description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@"), v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
