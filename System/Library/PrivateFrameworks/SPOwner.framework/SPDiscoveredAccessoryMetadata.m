@implementation SPDiscoveredAccessoryMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = (void *)objc_opt_new();
  -[SPDiscoveredAccessoryMetadata productData](self, "productData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setProductData:", v6);

  -[SPDiscoveredAccessoryMetadata manufacturerName](self, "manufacturerName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setManufacturerName:", v8);

  -[SPDiscoveredAccessoryMetadata modelName](self, "modelName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setModelName:", v10);

  -[SPDiscoveredAccessoryMetadata firmwareVersion](self, "firmwareVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setFirmwareVersion:", v12);

  -[SPDiscoveredAccessoryMetadata protocolVersion](self, "protocolVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setProtocolVersion:", v14);

  objc_msgSend(v4, "setAccessoryCategory:", -[SPDiscoveredAccessoryMetadata accessoryCategory](self, "accessoryCategory"));
  objc_msgSend(v4, "setAccessoryCapabilities:", -[SPDiscoveredAccessoryMetadata accessoryCapabilities](self, "accessoryCapabilities"));
  objc_msgSend(v4, "setBatteryType:", -[SPDiscoveredAccessoryMetadata batteryType](self, "batteryType"));
  objc_msgSend(v4, "setBatteryState:", -[SPDiscoveredAccessoryMetadata batteryState](self, "batteryState"));
  objc_msgSend(v4, "setCapabilities:", -[SPDiscoveredAccessoryMetadata capabilities](self, "capabilities"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *productData;
  id v5;
  id v6;

  productData = self->_productData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", productData, CFSTR("productData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_manufacturerName, CFSTR("manufacturerName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelName, CFSTR("modelName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firmwareVersion, CFSTR("firmwareVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_protocolVersion, CFSTR("protocolVersion"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_accessoryCategory, CFSTR("accessoryCategory"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_accessoryCapabilities, CFSTR("accessoryCapabilities"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_batteryType, CFSTR("batteryType"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_batteryState, CFSTR("batteryState"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_capabilities);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("capabilities"));

}

- (SPDiscoveredAccessoryMetadata)initWithCoder:(id)a3
{
  id v4;
  NSData *v5;
  NSData *productData;
  NSString *v7;
  NSString *manufacturerName;
  NSString *v9;
  NSString *modelName;
  NSString *v11;
  NSString *firmwareVersion;
  NSString *v13;
  NSString *protocolVersion;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productData"));
  v5 = (NSData *)objc_claimAutoreleasedReturnValue();
  productData = self->_productData;
  self->_productData = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manufacturerName"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  manufacturerName = self->_manufacturerName;
  self->_manufacturerName = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelName"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  modelName = self->_modelName;
  self->_modelName = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firmwareVersion"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  firmwareVersion = self->_firmwareVersion;
  self->_firmwareVersion = v11;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protocolVersion"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  protocolVersion = self->_protocolVersion;
  self->_protocolVersion = v13;

  self->_accessoryCategory = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("accessoryCategory"));
  self->_accessoryCapabilities = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("accessoryCapabilities"));
  self->_batteryType = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("batteryType"));
  self->_batteryState = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("batteryState"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("capabilities"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  self->_capabilities = objc_msgSend(v15, "unsignedIntegerValue");
  return self;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SPDiscoveredAccessoryMetadata manufacturerName](self, "manufacturerName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPDiscoveredAccessoryMetadata modelName](self, "modelName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPDiscoveredAccessoryMetadata firmwareVersion](self, "firmwareVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p manufacturer: %@ model: %@ fwVersion: %@ capabilities: %u>"), v4, self, v5, v6, v7, -[SPDiscoveredAccessoryMetadata accessoryCapabilities](self, "accessoryCapabilities"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSData)productData
{
  return self->_productData;
}

- (void)setProductData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setManufacturerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)accessoryCategory
{
  return self->_accessoryCategory;
}

- (void)setAccessoryCategory:(unint64_t)a3
{
  self->_accessoryCategory = a3;
}

- (unsigned)accessoryCapabilities
{
  return self->_accessoryCapabilities;
}

- (void)setAccessoryCapabilities:(unsigned int)a3
{
  self->_accessoryCapabilities = a3;
}

- (unsigned)batteryType
{
  return self->_batteryType;
}

- (void)setBatteryType:(unsigned __int8)a3
{
  self->_batteryType = a3;
}

- (unsigned)batteryState
{
  return self->_batteryState;
}

- (void)setBatteryState:(unsigned __int8)a3
{
  self->_batteryState = a3;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(unint64_t)a3
{
  self->_capabilities = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocolVersion, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_productData, 0);
}

@end
