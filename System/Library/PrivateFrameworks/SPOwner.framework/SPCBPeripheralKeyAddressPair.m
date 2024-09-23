@implementation SPCBPeripheralKeyAddressPair

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPCBPeripheralKeyAddressPair)initWithLEMACAddress:(id)a3 longTermKey:(id)a4
{
  id v6;
  id v7;
  SPCBPeripheralKeyAddressPair *v8;
  uint64_t v9;
  NSData *leMACAddress;
  uint64_t v11;
  void *longTermKey;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SPCBPeripheralKeyAddressPair;
  v8 = -[SPCBPeripheralKeyAddressPair init](&v14, sel_init);
  if (v8)
  {
    if (objc_msgSend(v6, "length") == 7 && objc_msgSend(v7, "length") == 16)
    {
      v9 = objc_msgSend(v6, "copy");
      leMACAddress = v8->_leMACAddress;
      v8->_leMACAddress = (NSData *)v9;

      v11 = objc_msgSend(v7, "copy");
      longTermKey = v8->_longTermKey;
      v8->_longTermKey = (NSData *)v11;
    }
    else
    {
      longTermKey = v8;
      v8 = 0;
    }

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPCBPeripheralKeyAddressPair *v4;
  void *v5;
  void *v6;
  SPCBPeripheralKeyAddressPair *v7;

  v4 = [SPCBPeripheralKeyAddressPair alloc];
  -[SPCBPeripheralKeyAddressPair leMACAddress](self, "leMACAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCBPeripheralKeyAddressPair longTermKey](self, "longTermKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SPCBPeripheralKeyAddressPair initWithLEMACAddress:longTermKey:](v4, "initWithLEMACAddress:longTermKey:", v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SPCBPeripheralKeyAddressPair leMACAddress](self, "leMACAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("mac"));

  -[SPCBPeripheralKeyAddressPair longTermKey](self, "longTermKey");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("ltk"));

}

- (SPCBPeripheralKeyAddressPair)initWithCoder:(id)a3
{
  id v4;
  NSData *v5;
  NSData *leMACAddress;
  NSData *v7;
  NSData *longTermKey;
  SPCBPeripheralKeyAddressPair *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mac"));
  v5 = (NSData *)objc_claimAutoreleasedReturnValue();
  leMACAddress = self->_leMACAddress;
  self->_leMACAddress = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ltk"));
  v7 = (NSData *)objc_claimAutoreleasedReturnValue();

  longTermKey = self->_longTermKey;
  self->_longTermKey = v7;

  if (-[NSData length](self->_leMACAddress, "length") == 7 && -[NSData length](self->_longTermKey, "length") == 16)
    v9 = self;
  else
    v9 = 0;

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SPCBPeripheralKeyAddressPair leMACAddress](self, "leMACAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fm_hexString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCBPeripheralKeyAddressPair longTermKey](self, "longTermKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fm_hexString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[LEMAC: %@ LTK: %@]"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSData)leMACAddress
{
  return self->_leMACAddress;
}

- (NSData)longTermKey
{
  return self->_longTermKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longTermKey, 0);
  objc_storeStrong((id *)&self->_leMACAddress, 0);
}

@end
