@implementation PKPassProvisioningMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassProvisioningMetadata)initWithCoder:(id)a3
{
  id v4;
  PKPassProvisioningMetadata *v5;
  void *v6;
  uint64_t v7;
  NSString *localizedSourceDeviceDescription;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassProvisioningMetadata;
  v5 = -[PKPassProvisioningMetadata init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceDeviceType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sourceDeviceType = PKPassProvisioningMetadataSourceDeviceTypeFromString(v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedSourceDeviceDescription"));
    v7 = objc_claimAutoreleasedReturnValue();
    localizedSourceDeviceDescription = v5->_localizedSourceDeviceDescription;
    v5->_localizedSourceDeviceDescription = (NSString *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  const __CFString *v4;
  id v5;

  if (self->_sourceDeviceType == 1)
    v4 = CFSTR("transfer");
  else
    v4 = CFSTR("none");
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("sourceDeviceType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedSourceDeviceDescription, CFSTR("localizedSourceDeviceDescription"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPassProvisioningMetadata *v5;
  uint64_t v6;
  NSString *localizedSourceDeviceDescription;

  v5 = objc_alloc_init(PKPassProvisioningMetadata);
  v5->_sourceDeviceType = self->_sourceDeviceType;
  v6 = -[NSString copyWithZone:](self->_localizedSourceDeviceDescription, "copyWithZone:", a3);
  localizedSourceDeviceDescription = v5->_localizedSourceDeviceDescription;
  v5->_localizedSourceDeviceDescription = (NSString *)v6;

  return v5;
}

- (unint64_t)sourceDeviceType
{
  return self->_sourceDeviceType;
}

- (void)setSourceDeviceType:(unint64_t)a3
{
  self->_sourceDeviceType = a3;
}

- (NSString)localizedSourceDeviceDescription
{
  return self->_localizedSourceDeviceDescription;
}

- (void)setLocalizedSourceDeviceDescription:(id)a3
{
  objc_storeStrong((id *)&self->_localizedSourceDeviceDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedSourceDeviceDescription, 0);
}

@end
