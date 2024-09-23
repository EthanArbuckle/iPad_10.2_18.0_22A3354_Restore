@implementation PKPassIngestionProperties

- (void)setHasCustomizedSettings:(BOOL)a3
{
  if (((!self->_hasCustomizedSettings ^ a3) & 1) == 0)
  {
    self->_hasCustomizedSettings = a3;
    if (!a3)
      self->_settings = 0;
  }
}

- (void)setSettings:(unint64_t)a3
{
  if (self->_settings != a3)
  {
    self->_settings = a3;
    self->_hasCustomizedSettings = 1;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassIngestionProperties)initWithCoder:(id)a3
{
  id v4;
  PKPassIngestionProperties *v5;
  uint64_t v6;
  PKPassProvisioningMetadata *provisioningMetadata;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassIngestionProperties;
  v5 = -[PKPassIngestionProperties init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provisioningMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    provisioningMetadata = v5->_provisioningMetadata;
    v5->_provisioningMetadata = (PKPassProvisioningMetadata *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hasCustomizedSettings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasCustomizedSettings = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("settings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_settings = objc_msgSend(v9, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKPassProvisioningMetadata *provisioningMetadata;
  id v5;
  void *v6;
  id v7;

  provisioningMetadata = self->_provisioningMetadata;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", provisioningMetadata, CFSTR("provisioningMetadata"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasCustomizedSettings);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("hasCustomizedSettings"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_settings);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("settings"));

}

- (PKPassProvisioningMetadata)provisioningMetadata
{
  return self->_provisioningMetadata;
}

- (void)setProvisioningMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningMetadata, a3);
}

- (BOOL)hasCustomizedSettings
{
  return self->_hasCustomizedSettings;
}

- (unint64_t)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningMetadata, 0);
}

@end
