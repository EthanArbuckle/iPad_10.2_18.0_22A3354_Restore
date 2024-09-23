@implementation PKBarcodeEventConfigurationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *configurationData;
  id v5;

  configurationData = self->_configurationData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", configurationData, CFSTR("configurationData"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_configurationDataType, CFSTR("configurationDataType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceAccountIdentifier, CFSTR("deviceAccountIdentifier"));

}

- (PKBarcodeEventConfigurationRequest)initWithCoder:(id)a3
{
  id v4;
  PKBarcodeEventConfigurationRequest *v5;
  uint64_t v6;
  NSData *configurationData;
  uint64_t v8;
  NSString *deviceAccountIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKBarcodeEventConfigurationRequest;
  v5 = -[PKBarcodeEventConfigurationRequest init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configurationData"));
    v6 = objc_claimAutoreleasedReturnValue();
    configurationData = v5->_configurationData;
    v5->_configurationData = (NSData *)v6;

    v5->_configurationDataType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("configurationDataType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceAccountIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    deviceAccountIdentifier = v5->_deviceAccountIdentifier;
    v5->_deviceAccountIdentifier = (NSString *)v8;

  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t configurationDataType;
  __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  configurationDataType = self->_configurationDataType;
  if (configurationDataType > 2)
    v6 = 0;
  else
    v6 = off_1E2AC93B0[configurationDataType];
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; deviceAccountIdentifier: %@, configurationDataType: %@, configurationData: %tu bytes>"),
               v4,
               self,
               self->_deviceAccountIdentifier,
               v6,
               -[NSData length](self->_configurationData, "length"));
}

- (NSString)deviceAccountIdentifier
{
  return self->_deviceAccountIdentifier;
}

- (void)setDeviceAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)configurationData
{
  return self->_configurationData;
}

- (void)setConfigurationData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PKBarcodeEventConfigurationDataType)configurationDataType
{
  return self->_configurationDataType;
}

- (void)setConfigurationDataType:(int64_t)a3
{
  self->_configurationDataType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationData, 0);
  objc_storeStrong((id *)&self->_deviceAccountIdentifier, 0);
}

@end
