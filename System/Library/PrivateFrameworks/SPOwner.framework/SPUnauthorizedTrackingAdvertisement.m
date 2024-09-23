@implementation SPUnauthorizedTrackingAdvertisement

- (SPUnauthorizedTrackingAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 rssi:(int64_t)a5 scanDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  SPUnauthorizedTrackingAdvertisement *v14;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  v14 = -[SPUnauthorizedTrackingAdvertisement initWithAddress:advertisementData:status:reserved:rssi:scanDate:](self, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:", v12, v11, 0, v13, a5, v10);

  return v14;
}

- (SPUnauthorizedTrackingAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 status:(unsigned __int8)a5 reserved:(id)a6 rssi:(int64_t)a7 scanDate:(id)a8
{
  uint64_t v9;
  id v13;
  id v14;
  id v15;
  void *v16;
  SPUnauthorizedTrackingAdvertisement *v17;
  uint64_t v19;

  v9 = a5;
  v13 = a8;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_opt_new();
  LOWORD(v19) = 0;
  v17 = -[SPUnauthorizedTrackingAdvertisement initWithAddress:advertisementData:status:reserved:rssi:scanDate:isPosh:networkID:](self, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:isPosh:networkID:", v15, v14, v9, v16, a7, v13, v19);

  return v17;
}

- (SPUnauthorizedTrackingAdvertisement)initWithAddress:(id)a3 advertisementData:(id)a4 status:(unsigned __int8)a5 reserved:(id)a6 rssi:(int64_t)a7 scanDate:(id)a8 isPosh:(BOOL)a9 networkID:(unsigned __int8)a10
{
  uint64_t v13;
  id v16;
  id v17;
  id v18;
  id v19;
  SPUnauthorizedTrackingAdvertisement *v20;
  SPUnauthorizedTrackingAdvertisement *v21;
  objc_super v23;

  v13 = a5;
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a8;
  v23.receiver = self;
  v23.super_class = (Class)SPUnauthorizedTrackingAdvertisement;
  v20 = -[SPUnauthorizedTrackingAdvertisement init](&v23, sel_init);
  v21 = v20;
  if (v20)
  {
    -[SPUnauthorizedTrackingAdvertisement set_address:](v20, "set_address:", v16);
    -[SPUnauthorizedTrackingAdvertisement setAdvertisementData:](v21, "setAdvertisementData:", v17);
    -[SPUnauthorizedTrackingAdvertisement setStatus:](v21, "setStatus:", v13);
    -[SPUnauthorizedTrackingAdvertisement setReserved:](v21, "setReserved:", v18);
    -[SPUnauthorizedTrackingAdvertisement setRssi:](v21, "setRssi:", a7);
    -[SPUnauthorizedTrackingAdvertisement setScanDate:](v21, "setScanDate:", v19);
    -[SPUnauthorizedTrackingAdvertisement setIsPosh:](v21, "setIsPosh:", a9);
    -[SPUnauthorizedTrackingAdvertisement setNetworkID:](v21, "setNetworkID:", a10);
  }

  return v21;
}

- (SPUnauthorizedTrackingAdvertisement)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("address"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUnauthorizedTrackingAdvertisement set_address:](self, "set_address:", v5);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("advertisementData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUnauthorizedTrackingAdvertisement setAdvertisementData:](self, "setAdvertisementData:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUnauthorizedTrackingAdvertisement setStatus:](self, "setStatus:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reserved"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUnauthorizedTrackingAdvertisement setReserved:](self, "setReserved:", v8);

  -[SPUnauthorizedTrackingAdvertisement setRssi:](self, "setRssi:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rssi")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scanDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUnauthorizedTrackingAdvertisement setScanDate:](self, "setScanDate:", v9);

  -[SPUnauthorizedTrackingAdvertisement setIsPosh:](self, "setIsPosh:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPosh")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("networkID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPUnauthorizedTrackingAdvertisement setNetworkID:](self, "setNetworkID:", objc_msgSend(v10, "unsignedIntegerValue"));
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  SPUnauthorizedTrackingAdvertisement *v4;
  SPUnauthorizedTrackingAdvertisement *v5;
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
  BOOL v18;
  int v19;
  _BOOL4 v21;
  void *v22;

  v4 = (SPUnauthorizedTrackingAdvertisement *)a3;
  if (v4 == self)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SPUnauthorizedTrackingAdvertisement scanDate](self, "scanDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUnauthorizedTrackingAdvertisement scanDate](v5, "scanDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToDate:", v7))
      {
        -[SPUnauthorizedTrackingAdvertisement advertisementData](self, "advertisementData");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPUnauthorizedTrackingAdvertisement advertisementData](v5, "advertisementData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToData:", v9)
          && (v10 = -[SPUnauthorizedTrackingAdvertisement status](self, "status"),
              v10 == -[SPUnauthorizedTrackingAdvertisement status](v5, "status")))
        {
          -[SPUnauthorizedTrackingAdvertisement reserved](self, "reserved");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[SPUnauthorizedTrackingAdvertisement reserved](v5, "reserved");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqualToData:", v12)
            && (v13 = -[SPUnauthorizedTrackingAdvertisement rssi](self, "rssi"),
                v13 == -[SPUnauthorizedTrackingAdvertisement rssi](v5, "rssi")))
          {
            -[SPUnauthorizedTrackingAdvertisement _address](self, "_address");
            v14 = objc_claimAutoreleasedReturnValue();
            -[SPUnauthorizedTrackingAdvertisement address](v5, "address");
            v15 = objc_claimAutoreleasedReturnValue();
            v22 = (void *)v14;
            v16 = (void *)v14;
            v17 = (void *)v15;
            if (objc_msgSend(v16, "isEqualToData:", v15)
              && (v21 = -[SPUnauthorizedTrackingAdvertisement isPosh](self, "isPosh"),
                  v21 == -[SPUnauthorizedTrackingAdvertisement isPosh](v5, "isPosh")))
            {
              v19 = -[SPUnauthorizedTrackingAdvertisement networkID](self, "networkID");
              v18 = v19 == -[SPUnauthorizedTrackingAdvertisement networkID](v5, "networkID");
            }
            else
            {
              v18 = 0;
            }

          }
          else
          {
            v18 = 0;
          }

        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v3 = -[SPUnauthorizedTrackingAdvertisement rssi](self, "rssi");
  v4 = -[SPUnauthorizedTrackingAdvertisement isPosh](self, "isPosh");
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = -v3;
  -[SPUnauthorizedTrackingAdvertisement scanDate](self, "scanDate", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[SPUnauthorizedTrackingAdvertisement advertisementData](self, "advertisementData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  v10 = -[SPUnauthorizedTrackingAdvertisement status](self, "status");
  -[SPUnauthorizedTrackingAdvertisement reserved](self, "reserved");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[SPUnauthorizedTrackingAdvertisement _address](self, "_address");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash");
  v15 = v18 ^ v17 ^ v7 ^ v9 ^ v10 ^ v12 ^ v14 ^ -[SPUnauthorizedTrackingAdvertisement networkID](self, "networkID");

  return v15;
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
  -[SPUnauthorizedTrackingAdvertisement _address](self, "_address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("address"));

  -[SPUnauthorizedTrackingAdvertisement advertisementData](self, "advertisementData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("advertisementData"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[SPUnauthorizedTrackingAdvertisement status](self, "status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("status"));

  -[SPUnauthorizedTrackingAdvertisement reserved](self, "reserved");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("reserved"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SPUnauthorizedTrackingAdvertisement rssi](self, "rssi"), CFSTR("rssi"));
  -[SPUnauthorizedTrackingAdvertisement scanDate](self, "scanDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("scanDate"));

  objc_msgSend(v4, "encodeBool:forKey:", -[SPUnauthorizedTrackingAdvertisement isPosh](self, "isPosh"), CFSTR("isPosh"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[SPUnauthorizedTrackingAdvertisement networkID](self, "networkID"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("networkID"));

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

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SPUnauthorizedTrackingAdvertisement _address](self, "_address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fm_hexString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUnauthorizedTrackingAdvertisement advertisementData](self, "advertisementData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fm_hexString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUnauthorizedTrackingAdvertisement scanDate](self, "scanDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SPUnauthorizedTrackingAdvertisement %@%@ %@ posh: %i"), v5, v7, v8, -[SPUnauthorizedTrackingAdvertisement isPosh](self, "isPosh"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSData)address
{
  void *v3;
  void *v4;
  void *v5;

  -[SPUnauthorizedTrackingAdvertisement _address](self, "_address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SPUnauthorizedTrackingAdvertisement _address](self, "_address");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SPUnauthorizedTrackingAdvertisement advertisementData](self, "advertisementData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subdataWithRange:", 0, 6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSData *)v4;
}

- (NSData)data
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SPUnauthorizedTrackingAdvertisement _address](self, "_address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99DF0];
    -[SPUnauthorizedTrackingAdvertisement _address](self, "_address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataWithData:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[SPUnauthorizedTrackingAdvertisement advertisementData](self, "advertisementData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendData:", v7);

  }
  else
  {
    -[SPUnauthorizedTrackingAdvertisement advertisementData](self, "advertisementData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSData *)v6;
}

- (NSData)advertisementData
{
  return self->_advertisementData;
}

- (void)setAdvertisementData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setData:(id)a3
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

- (unsigned)networkID
{
  return self->_networkID;
}

- (void)setNetworkID:(unsigned __int8)a3
{
  self->_networkID = a3;
}

- (NSData)_address
{
  return self->__address;
}

- (void)set_address:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__address, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_scanDate, 0);
  objc_storeStrong((id *)&self->_reserved, 0);
  objc_storeStrong((id *)&self->_advertisementData, 0);
}

@end
