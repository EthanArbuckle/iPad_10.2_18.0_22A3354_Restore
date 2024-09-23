@implementation SPStandaloneBeacon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPStandaloneBeacon)initWithIdentifier:(id)a3 macAddress:(id)a4 classicMacAddress:(id)a5 serialNumber:(id)a6 pairingDate:(id)a7 productData:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SPStandaloneBeacon *v20;
  uint64_t v21;
  NSUUID *identifier;
  uint64_t v23;
  NSData *macAddress;
  uint64_t v25;
  NSData *classicMacAddress;
  uint64_t v27;
  NSString *serialNumber;
  uint64_t v29;
  NSDate *pairingDate;
  uint64_t v31;
  NSData *productData;
  objc_super v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)SPStandaloneBeacon;
  v20 = -[SPStandaloneBeacon init](&v34, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    identifier = v20->_identifier;
    v20->_identifier = (NSUUID *)v21;

    v23 = objc_msgSend(v15, "copy");
    macAddress = v20->_macAddress;
    v20->_macAddress = (NSData *)v23;

    v25 = objc_msgSend(v16, "copy");
    classicMacAddress = v20->_classicMacAddress;
    v20->_classicMacAddress = (NSData *)v25;

    v27 = objc_msgSend(v17, "copy");
    serialNumber = v20->_serialNumber;
    v20->_serialNumber = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    pairingDate = v20->_pairingDate;
    v20->_pairingDate = (NSDate *)v29;

    v31 = objc_msgSend(v19, "copy");
    productData = v20->_productData;
    v20->_productData = (NSData *)v31;

  }
  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPStandaloneBeacon *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SPStandaloneBeacon *v11;

  v4 = [SPStandaloneBeacon alloc];
  -[SPStandaloneBeacon identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPStandaloneBeacon macAddress](self, "macAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPStandaloneBeacon classicMacAddress](self, "classicMacAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPStandaloneBeacon serialNumber](self, "serialNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPStandaloneBeacon pairingDate](self, "pairingDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPStandaloneBeacon productData](self, "productData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SPStandaloneBeacon initWithIdentifier:macAddress:classicMacAddress:serialNumber:pairingDate:productData:](v4, "initWithIdentifier:macAddress:classicMacAddress:serialNumber:pairingDate:productData:", v5, v6, v7, v8, v9, v10);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[SPStandaloneBeacon identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[SPStandaloneBeacon macAddress](self, "macAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("macAddress"));

  -[SPStandaloneBeacon classicMacAddress](self, "classicMacAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("classicMacAddress"));

  -[SPStandaloneBeacon serialNumber](self, "serialNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("serialNumber"));

  -[SPStandaloneBeacon pairingDate](self, "pairingDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("pairingDate"));

  -[SPStandaloneBeacon productData](self, "productData");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("productData"));

}

- (SPStandaloneBeacon)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *identifier;
  NSData *v7;
  NSData *macAddress;
  NSData *v9;
  NSData *classicMacAddress;
  NSString *v11;
  NSString *serialNumber;
  NSDate *v13;
  NSDate *pairingDate;
  NSData *v15;
  NSData *productData;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("macAddress"));
  v7 = (NSData *)objc_claimAutoreleasedReturnValue();
  macAddress = self->_macAddress;
  self->_macAddress = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("classicMacAddress"));
  v9 = (NSData *)objc_claimAutoreleasedReturnValue();
  classicMacAddress = self->_classicMacAddress;
  self->_classicMacAddress = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  serialNumber = self->_serialNumber;
  self->_serialNumber = v11;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairingDate"));
  v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
  pairingDate = self->_pairingDate;
  self->_pairingDate = v13;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productData"));
  v15 = (NSData *)objc_claimAutoreleasedReturnValue();

  productData = self->_productData;
  self->_productData = v15;

  return self;
}

- (BOOL)isEqual:(id)a3
{
  SPStandaloneBeacon *v4;
  SPStandaloneBeacon *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (SPStandaloneBeacon *)a3;
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
      -[SPStandaloneBeacon identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPStandaloneBeacon identifier](v5, "identifier");
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

  -[SPStandaloneBeacon identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SPStandaloneBeacon identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPStandaloneBeacon serialNumber](self, "serialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPStandaloneBeacon macAddress](self, "macAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fm_hexString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPStandaloneBeacon classicMacAddress](self, "classicMacAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fm_hexString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<id: %@ S/N: [%@] macAddress: [%@] classicMacAddress: %@>"), v4, v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)classicMacAddress
{
  return self->_classicMacAddress;
}

- (void)setClassicMacAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)pairingDate
{
  return self->_pairingDate;
}

- (void)setPairingDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSData)productData
{
  return self->_productData;
}

- (void)setProductData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productData, 0);
  objc_storeStrong((id *)&self->_pairingDate, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_classicMacAddress, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
