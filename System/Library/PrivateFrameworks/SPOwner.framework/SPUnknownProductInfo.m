@implementation SPUnknownProductInfo

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

  v4 = (void *)objc_opt_new();
  -[SPUnknownProductInfo modelName](self, "modelName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setModelName:", v6);

  -[SPUnknownProductInfo manufacturerName](self, "manufacturerName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setManufacturerName:", v8);

  -[SPUnknownProductInfo learnModeMetadata](self, "learnModeMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setLearnModeMetadata:", v10);

  -[SPUnknownProductInfo disableMetadata](self, "disableMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setDisableMetadata:", v12);

  objc_msgSend(v4, "setCapabilities:", -[SPUnknownProductInfo capabilities](self, "capabilities"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *modelName;
  id v5;
  id v6;

  modelName = self->_modelName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", modelName, CFSTR("modelName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_manufacturerName, CFSTR("manufacturerName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_learnModeMetadata, CFSTR("learnModeMetadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_disableMetadata, CFSTR("disableMetadata"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_capabilities);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("capabilities"));

}

- (SPUnknownProductInfo)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *modelName;
  NSString *v7;
  NSString *manufacturerName;
  SPUnknownProductMetadata *v9;
  SPUnknownProductMetadata *learnModeMetadata;
  SPUnknownProductMetadata *v11;
  SPUnknownProductMetadata *disableMetadata;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelName"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  modelName = self->_modelName;
  self->_modelName = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manufacturerName"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  manufacturerName = self->_manufacturerName;
  self->_manufacturerName = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("learnModeMetadata"));
  v9 = (SPUnknownProductMetadata *)objc_claimAutoreleasedReturnValue();
  learnModeMetadata = self->_learnModeMetadata;
  self->_learnModeMetadata = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("disableMetadata"));
  v11 = (SPUnknownProductMetadata *)objc_claimAutoreleasedReturnValue();
  disableMetadata = self->_disableMetadata;
  self->_disableMetadata = v11;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("capabilities"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  self->_capabilities = objc_msgSend(v13, "unsignedIntegerValue");
  return self;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SPUnknownProductInfo manufacturerName](self, "manufacturerName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUnknownProductInfo modelName](self, "modelName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p manufacturer: %@ model: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setManufacturerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SPUnknownProductMetadata)learnModeMetadata
{
  return self->_learnModeMetadata;
}

- (void)setLearnModeMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SPUnknownProductMetadata)disableMetadata
{
  return self->_disableMetadata;
}

- (void)setDisableMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
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
  objc_storeStrong((id *)&self->_disableMetadata, 0);
  objc_storeStrong((id *)&self->_learnModeMetadata, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
}

@end
