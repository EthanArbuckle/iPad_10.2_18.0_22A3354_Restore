@implementation SPPeripheralConnectionMaterial

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

  v4 = (void *)objc_opt_new();
  -[SPPeripheralConnectionMaterial irkData](self, "irkData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setIrkData:", v6);

  -[SPPeripheralConnectionMaterial btAddressData](self, "btAddressData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setBtAddressData:", v8);

  -[SPPeripheralConnectionMaterial btAddressWithTypeData](self, "btAddressWithTypeData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setBtAddressWithTypeData:", v10);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *irkData;
  uint64_t v5;
  id v6;

  irkData = self->_irkData;
  v5 = irkDataKey;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", irkData, v5);
  objc_msgSend(v6, "encodeObject:forKey:", self->_btAddressData, btAddressDataKey);
  objc_msgSend(v6, "encodeObject:forKey:", self->_btAddressWithTypeData, btAddressWithTypeDataKey);

}

- (SPPeripheralConnectionMaterial)initWithCoder:(id)a3
{
  id v4;
  NSData *v5;
  NSData *irkData;
  NSData *v7;
  NSData *btAddressData;
  NSData *v9;
  NSData *btAddressWithTypeData;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), irkDataKey);
  v5 = (NSData *)objc_claimAutoreleasedReturnValue();
  irkData = self->_irkData;
  self->_irkData = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), btAddressDataKey);
  v7 = (NSData *)objc_claimAutoreleasedReturnValue();
  btAddressData = self->_btAddressData;
  self->_btAddressData = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), btAddressWithTypeDataKey);
  v9 = (NSData *)objc_claimAutoreleasedReturnValue();

  btAddressWithTypeData = self->_btAddressWithTypeData;
  self->_btAddressWithTypeData = v9;

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
  -[SPPeripheralConnectionMaterial irkData](self, "irkData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPPeripheralConnectionMaterial btAddressData](self, "btAddressData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPPeripheralConnectionMaterial btAddressWithTypeData](self, "btAddressWithTypeData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p irkData: %@ btAddressData: %@ btAddressWithTypeData: %@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSData)irkData
{
  return self->_irkData;
}

- (void)setIrkData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)btAddressData
{
  return self->_btAddressData;
}

- (void)setBtAddressData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)btAddressWithTypeData
{
  return self->_btAddressWithTypeData;
}

- (void)setBtAddressWithTypeData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btAddressWithTypeData, 0);
  objc_storeStrong((id *)&self->_btAddressData, 0);
  objc_storeStrong((id *)&self->_irkData, 0);
}

@end
