@implementation SPDiscoveredAccessory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  SPDiscoveredAccessory *v4;
  SPDiscoveredAccessory *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (SPDiscoveredAccessory *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SPDiscoveredAccessory identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPDiscoveredAccessory identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SPDiscoveredAccessory identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
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
  -[SPDiscoveredAccessory identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setIdentifier:", v6);

  -[SPDiscoveredAccessory macAddress](self, "macAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setMacAddress:", v8);

  -[SPDiscoveredAccessory discoveredMetadata](self, "discoveredMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setDiscoveredMetadata:", v10);

  -[SPDiscoveredAccessory productInformation](self, "productInformation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setProductInformation:", v12);

  objc_msgSend(v4, "setIsBatteryTooLow:", -[SPDiscoveredAccessory isBatteryTooLow](self, "isBatteryTooLow"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_macAddress, CFSTR("macAddress"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_discoveredMetadata, CFSTR("discoveredMetadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productInformation, CFSTR("productInformation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isBatteryTooLow, CFSTR("isBatteryTooLow"));

}

- (SPDiscoveredAccessory)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *identifier;
  NSData *v7;
  NSData *macAddress;
  SPDiscoveredAccessoryMetadata *v9;
  SPDiscoveredAccessoryMetadata *discoveredMetadata;
  SPDiscoveredAccessoryProductInformation *v11;
  SPDiscoveredAccessoryProductInformation *productInformation;
  char v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("macAddress"));
  v7 = (NSData *)objc_claimAutoreleasedReturnValue();
  macAddress = self->_macAddress;
  self->_macAddress = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("discoveredMetadata"));
  v9 = (SPDiscoveredAccessoryMetadata *)objc_claimAutoreleasedReturnValue();
  discoveredMetadata = self->_discoveredMetadata;
  self->_discoveredMetadata = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productInformation"));
  v11 = (SPDiscoveredAccessoryProductInformation *)objc_claimAutoreleasedReturnValue();
  productInformation = self->_productInformation;
  self->_productInformation = v11;

  v13 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isBatteryTooLow"));
  self->_isBatteryTooLow = v13;
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
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SPDiscoveredAccessory identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPDiscoveredAccessory macAddress](self, "macAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fm_hexString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPDiscoveredAccessory discoveredMetadata](self, "discoveredMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPDiscoveredAccessory productInformation](self, "productInformation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@ [%@] %@ %@>"), v4, self, v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SPDiscoveredAccessoryMetadata)discoveredMetadata
{
  return self->_discoveredMetadata;
}

- (void)setDiscoveredMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (SPDiscoveredAccessoryProductInformation)productInformation
{
  return self->_productInformation;
}

- (void)setProductInformation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isBatteryTooLow
{
  return self->_isBatteryTooLow;
}

- (void)setIsBatteryTooLow:(BOOL)a3
{
  self->_isBatteryTooLow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productInformation, 0);
  objc_storeStrong((id *)&self->_discoveredMetadata, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
