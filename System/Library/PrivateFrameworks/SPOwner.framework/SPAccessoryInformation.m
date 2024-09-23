@implementation SPAccessoryInformation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPAccessoryInformation)initWithProductData:(id)a3 manufacturerName:(id)a4 modelName:(id)a5 firmwareVersion:(id)a6 protocolVersion:(id)a7 accessoryCategory:(unint64_t)a8 accessoryCapabilities:(unsigned int)a9 batteryType:(unsigned __int8)a10 batteryState:(unsigned __int8)a11
{
  id v18;
  id v19;
  id v20;
  SPAccessoryInformation *v21;
  SPAccessoryInformation *v22;
  id v24;
  id v25;
  objc_super v26;

  v18 = a3;
  v19 = a4;
  v25 = a5;
  v24 = a6;
  v20 = a7;
  v26.receiver = self;
  v26.super_class = (Class)SPAccessoryInformation;
  v21 = -[SPAccessoryInformation init](&v26, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_productData, a3);
    objc_storeStrong((id *)&v22->_manufacturerName, a4);
    objc_storeStrong((id *)&v22->_modelName, a5);
    objc_storeStrong((id *)&v22->_firmwareVersion, a6);
    objc_storeStrong((id *)&v22->_protocolVersion, a7);
    v22->_accessoryCategory = a8;
    v22->_accessoryCapabilities = a9;
    v22->_batteryType = a10;
    v22->_batteryState = a11;
  }

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPAccessoryInformation *v4;
  uint64_t v6;

  v4 = [SPAccessoryInformation alloc];
  WORD2(v6) = *(_WORD *)&self->_batteryType;
  LODWORD(v6) = self->_accessoryCapabilities;
  return -[SPAccessoryInformation initWithProductData:manufacturerName:modelName:firmwareVersion:protocolVersion:accessoryCategory:accessoryCapabilities:batteryType:batteryState:](v4, "initWithProductData:manufacturerName:modelName:firmwareVersion:protocolVersion:accessoryCategory:accessoryCapabilities:batteryType:batteryState:", self->_productData, self->_manufacturerName, self->_modelName, self->_firmwareVersion, self->_protocolVersion, self->_accessoryCategory, v6);
}

- (void)encodeWithCoder:(id)a3
{
  NSData *productData;
  id v5;

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

}

- (SPAccessoryInformation)initWithCoder:(id)a3
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
  unsigned __int8 v15;

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
  v15 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("batteryState"));

  self->_batteryState = v15;
  return self;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocolVersion, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_productData, 0);
}

@end
