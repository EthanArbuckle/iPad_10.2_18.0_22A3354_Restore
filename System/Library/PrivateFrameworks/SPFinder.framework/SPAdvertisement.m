@implementation SPAdvertisement

- (SPAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 rssi:(int64_t)a5 scanDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  SPAdvertisement *v14;
  uint64_t v16;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  LOBYTE(v16) = 0;
  v14 = -[SPAdvertisement initWithAddress:advertisementData:status:reserved:rssi:scanDate:isPosh:](self, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:isPosh:", v12, v11, 0, v13, a5, v10, v16);

  return v14;
}

- (SPAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 status:(unsigned __int8)a5 reserved:(id)a6 rssi:(int64_t)a7 scanDate:(id)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[SPAdvertisement initWithAddress:advertisementData:status:reserved:rssi:scanDate:isPosh:](self, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:isPosh:", a3, a4, a5, a6, a7, a8, v9);
}

- (SPAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 status:(unsigned __int8)a5 reserved:(id)a6 rssi:(int64_t)a7 scanDate:(id)a8 isPosh:(BOOL)a9
{
  uint64_t v12;
  id v15;
  id v16;
  id v17;
  id v18;
  SPAdvertisement *v19;
  SPAdvertisement *v20;
  objc_super v22;

  v12 = a5;
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a8;
  v22.receiver = self;
  v22.super_class = (Class)SPAdvertisement;
  v19 = -[SPAdvertisement init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    -[SPAdvertisement setAddress:](v19, "setAddress:", v15);
    -[SPAdvertisement setAdvertisementData:](v20, "setAdvertisementData:", v16);
    -[SPAdvertisement setStatus:](v20, "setStatus:", v12);
    -[SPAdvertisement setReserved:](v20, "setReserved:", v17);
    -[SPAdvertisement setRssi:](v20, "setRssi:", a7);
    -[SPAdvertisement setScanDate:](v20, "setScanDate:", v18);
    -[SPAdvertisement setIsPosh:](v20, "setIsPosh:", a9);
  }

  return v20;
}

- (SPAdvertisement)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("address"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPAdvertisement setAddress:](self, "setAddress:", v5);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("advertisementData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPAdvertisement setAdvertisementData:](self, "setAdvertisementData:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPAdvertisement setStatus:](self, "setStatus:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reserved"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPAdvertisement setReserved:](self, "setReserved:", v8);

  -[SPAdvertisement setRssi:](self, "setRssi:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rssi")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scanDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPAdvertisement setScanDate:](self, "setScanDate:", v9);

  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPosh"));
  -[SPAdvertisement setIsPosh:](self, "setIsPosh:", v10);
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  SPAdvertisement *v4;
  SPAdvertisement *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  _BOOL4 v19;
  void *v21;

  v4 = (SPAdvertisement *)a3;
  if (v4 == self)
  {
    LOBYTE(v19) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SPAdvertisement scanDate](self, "scanDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPAdvertisement scanDate](v5, "scanDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToDate:", v7))
      {
        -[SPAdvertisement advertisementData](self, "advertisementData");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPAdvertisement advertisementData](v5, "advertisementData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToData:", v9)
          && (v10 = -[SPAdvertisement status](self, "status"), v10 == -[SPAdvertisement status](v5, "status")))
        {
          -[SPAdvertisement reserved](self, "reserved");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[SPAdvertisement reserved](v5, "reserved");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqualToData:", v12)
            && (v13 = -[SPAdvertisement rssi](self, "rssi"), v13 == -[SPAdvertisement rssi](v5, "rssi")))
          {
            -[SPAdvertisement address](self, "address");
            v14 = objc_claimAutoreleasedReturnValue();
            -[SPAdvertisement address](v5, "address");
            v15 = objc_claimAutoreleasedReturnValue();
            v21 = (void *)v14;
            v16 = (void *)v14;
            v17 = (void *)v15;
            if (objc_msgSend(v16, "isEqualToData:", v15))
            {
              v18 = -[SPAdvertisement isPosh](self, "isPosh");
              v19 = v18 ^ -[SPAdvertisement isPosh](v5, "isPosh") ^ 1;
            }
            else
            {
              LOBYTE(v19) = 0;
            }

          }
          else
          {
            LOBYTE(v19) = 0;
          }

        }
        else
        {
          LOBYTE(v19) = 0;
        }

      }
      else
      {
        LOBYTE(v19) = 0;
      }

    }
    else
    {
      LOBYTE(v19) = 0;
    }
  }

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  _BOOL8 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;

  v3 = -[SPAdvertisement rssi](self, "rssi");
  v4 = -[SPAdvertisement isPosh](self, "isPosh");
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = -v3;
  v6 = v4;
  -[SPAdvertisement scanDate](self, "scanDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[SPAdvertisement advertisementData](self, "advertisementData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  v11 = -[SPAdvertisement status](self, "status");
  -[SPAdvertisement reserved](self, "reserved");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash");
  -[SPAdvertisement address](self, "address");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v5 ^ v6 ^ v8 ^ v10 ^ v11 ^ v13 ^ objc_msgSend(v14, "hash");

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SPAdvertisement address](self, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("address"));

  -[SPAdvertisement advertisementData](self, "advertisementData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("advertisementData"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[SPAdvertisement status](self, "status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("status"));

  -[SPAdvertisement reserved](self, "reserved");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("reserved"));

  objc_msgSend(v9, "encodeInteger:forKey:", -[SPAdvertisement rssi](self, "rssi"), CFSTR("rssi"));
  -[SPAdvertisement scanDate](self, "scanDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("scanDate"));

  objc_msgSend(v9, "encodeBool:forKey:", -[SPAdvertisement isPosh](self, "isPosh"), CFSTR("isPosh"));
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SPAdvertisement address](self, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fm_hexString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPAdvertisement advertisementData](self, "advertisementData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fm_hexString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPAdvertisement scanDate](self, "scanDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SPAdvertisement %@%@ %@ posh: %i"), v5, v7, v8, -[SPAdvertisement isPosh](self, "isPosh"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSData)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)advertisementData
{
  return self->_advertisementData;
}

- (void)setAdvertisementData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)status
{
  return self->_status;
}

- (void)setStatus:(unsigned __int8)a3
{
  self->_status = a3;
}

- (NSData)reserved
{
  return self->_reserved;
}

- (void)setReserved:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (NSDate)scanDate
{
  return self->_scanDate;
}

- (void)setScanDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isPosh
{
  return self->_isPosh;
}

- (void)setIsPosh:(BOOL)a3
{
  self->_isPosh = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanDate, 0);
  objc_storeStrong((id *)&self->_reserved, 0);
  objc_storeStrong((id *)&self->_advertisementData, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
