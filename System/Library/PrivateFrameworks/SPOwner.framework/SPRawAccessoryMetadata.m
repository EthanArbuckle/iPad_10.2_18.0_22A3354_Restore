@implementation SPRawAccessoryMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPRawAccessoryMetadata *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = objc_alloc_init(SPRawAccessoryMetadata);
  -[SPRawAccessoryMetadata productData](self, "productData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[SPRawAccessoryMetadata setProductData:](v4, "setProductData:", v6);

  -[SPRawAccessoryMetadata manufacturerName](self, "manufacturerName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[SPRawAccessoryMetadata setManufacturerName:](v4, "setManufacturerName:", v8);

  -[SPRawAccessoryMetadata modelName](self, "modelName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[SPRawAccessoryMetadata setModelName:](v4, "setModelName:", v10);

  -[SPRawAccessoryMetadata reserved](self, "reserved");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  -[SPRawAccessoryMetadata setReserved:](v4, "setReserved:", v12);

  -[SPRawAccessoryMetadata accessoryCategory](self, "accessoryCategory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  -[SPRawAccessoryMetadata setAccessoryCategory:](v4, "setAccessoryCategory:", v14);

  -[SPRawAccessoryMetadata accessoryCapabilities](self, "accessoryCapabilities");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  -[SPRawAccessoryMetadata setAccessoryCapabilities:](v4, "setAccessoryCapabilities:", v16);

  -[SPRawAccessoryMetadata firmwareVersion](self, "firmwareVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  -[SPRawAccessoryMetadata setFirmwareVersion:](v4, "setFirmwareVersion:", v18);

  -[SPRawAccessoryMetadata findMyVersion](self, "findMyVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  -[SPRawAccessoryMetadata setFindMyVersion:](v4, "setFindMyVersion:", v20);

  -[SPRawAccessoryMetadata batteryType](self, "batteryType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  -[SPRawAccessoryMetadata setBatteryType:](v4, "setBatteryType:", v22);

  -[SPRawAccessoryMetadata batteryLevel](self, "batteryLevel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  -[SPRawAccessoryMetadata setBatteryLevel:](v4, "setBatteryLevel:", v24);

  return v4;
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_reserved, CFSTR("reserved"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessoryCategory, CFSTR("accessoryCategory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessoryCapabilities, CFSTR("accessoryCapabilities"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firmwareVersion, CFSTR("firmwareVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_findMyVersion, CFSTR("findMyVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_batteryType, CFSTR("batteryType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_batteryLevel, CFSTR("batteryLevel"));

}

- (SPRawAccessoryMetadata)initWithCoder:(id)a3
{
  id v4;
  NSData *v5;
  NSData *productData;
  NSData *v7;
  NSData *manufacturerName;
  NSData *v9;
  NSData *modelName;
  NSData *v11;
  NSData *reserved;
  NSData *v13;
  NSData *accessoryCategory;
  NSData *v15;
  NSData *accessoryCapabilities;
  NSData *v17;
  NSData *firmwareVersion;
  NSData *v19;
  NSData *findMyVersion;
  NSData *v21;
  NSData *batteryType;
  NSData *v23;
  NSData *batteryLevel;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productData"));
  v5 = (NSData *)objc_claimAutoreleasedReturnValue();
  productData = self->_productData;
  self->_productData = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manufacturerName"));
  v7 = (NSData *)objc_claimAutoreleasedReturnValue();
  manufacturerName = self->_manufacturerName;
  self->_manufacturerName = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelName"));
  v9 = (NSData *)objc_claimAutoreleasedReturnValue();
  modelName = self->_modelName;
  self->_modelName = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reserved"));
  v11 = (NSData *)objc_claimAutoreleasedReturnValue();
  reserved = self->_reserved;
  self->_reserved = v11;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryCategory"));
  v13 = (NSData *)objc_claimAutoreleasedReturnValue();
  accessoryCategory = self->_accessoryCategory;
  self->_accessoryCategory = v13;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryCapabilities"));
  v15 = (NSData *)objc_claimAutoreleasedReturnValue();
  accessoryCapabilities = self->_accessoryCapabilities;
  self->_accessoryCapabilities = v15;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firmwareVersion"));
  v17 = (NSData *)objc_claimAutoreleasedReturnValue();
  firmwareVersion = self->_firmwareVersion;
  self->_firmwareVersion = v17;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("findMyVersion"));
  v19 = (NSData *)objc_claimAutoreleasedReturnValue();
  findMyVersion = self->_findMyVersion;
  self->_findMyVersion = v19;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("batteryType"));
  v21 = (NSData *)objc_claimAutoreleasedReturnValue();
  batteryType = self->_batteryType;
  self->_batteryType = v21;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("batteryLevel"));
  v23 = (NSData *)objc_claimAutoreleasedReturnValue();

  batteryLevel = self->_batteryLevel;
  self->_batteryLevel = v23;

  return self;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
}

- (NSData)productData
{
  return self->_productData;
}

- (void)setProductData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setManufacturerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)reserved
{
  return self->_reserved;
}

- (void)setReserved:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)accessoryCategory
{
  return self->_accessoryCategory;
}

- (void)setAccessoryCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSData)accessoryCapabilities
{
  return self->_accessoryCapabilities;
}

- (void)setAccessoryCapabilities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)findMyVersion
{
  return self->_findMyVersion;
}

- (void)setFindMyVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSData)batteryType
{
  return self->_batteryType;
}

- (void)setBatteryType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryLevel, 0);
  objc_storeStrong((id *)&self->_batteryType, 0);
  objc_storeStrong((id *)&self->_findMyVersion, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_accessoryCapabilities, 0);
  objc_storeStrong((id *)&self->_accessoryCategory, 0);
  objc_storeStrong((id *)&self->_reserved, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_productData, 0);
}

@end
