@implementation SPScannedObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPScannedObject)initWithAdvertisementType:(int64_t)a3 poshNetwork:(unsigned __int8)a4 nearOwner:(BOOL)a5 vendorPayload:(id)a6 scanDate:(id)a7 address:(id)a8 advertisement:(id)a9 status:(unsigned __int8)a10 ek:(unsigned __int8)a11 hint:(id)a12 rssi:(int64_t)a13 indexInformation:(id)a14 acccessoryInformation:(id)a15
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  SPScannedObject *v24;
  SPScannedObject *v25;
  id obj;
  id v31;
  id v32;
  objc_super v33;

  v19 = a6;
  v20 = a7;
  obj = a8;
  v21 = a8;
  v32 = a9;
  v22 = a12;
  v23 = a14;
  v31 = a15;
  v33.receiver = self;
  v33.super_class = (Class)SPScannedObject;
  v24 = -[SPScannedObject init](&v33, sel_init);
  v25 = v24;
  if (v24)
  {
    v24->_advertisementType = a3;
    v24->_poshNetwork = a4;
    v24->_nearOwner = a5;
    objc_storeStrong((id *)&v24->_vendorPayload, a6);
    objc_storeStrong((id *)&v25->_scanDate, a7);
    objc_storeStrong((id *)&v25->_address, obj);
    objc_storeStrong((id *)&v25->_advertisement, a9);
    v25->_status = a10;
    v25->_ek = a11;
    objc_storeStrong((id *)&v25->_hint, a12);
    v25->_rssi = a13;
    objc_storeStrong((id *)&v25->_indexInformation, a14);
    objc_storeStrong((id *)&v25->_accessoryInformation, a15);
  }

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t poshNetwork;
  _BOOL8 nearOwner;
  int64_t advertisementType;
  NSData *vendorPayload;
  NSDate *scanDate;
  NSData *address;
  NSData *advertisement;
  __int16 v11;
  SPIndexInformation *indexInformation;
  void *v13;
  SPScannedObject *v14;
  uint64_t v16;
  __int128 v17;
  SPScannedObject *v18;

  v18 = [SPScannedObject alloc];
  poshNetwork = self->_poshNetwork;
  nearOwner = self->_nearOwner;
  advertisementType = self->_advertisementType;
  vendorPayload = self->_vendorPayload;
  scanDate = self->_scanDate;
  address = self->_address;
  advertisement = self->_advertisement;
  v11 = *(_WORD *)&self->_status;
  v17 = *(_OWORD *)&self->_hint;
  indexInformation = self->_indexInformation;
  -[SPScannedObject accessoryInformation](self, "accessoryInformation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v16) = v11;
  v14 = -[SPScannedObject initWithAdvertisementType:poshNetwork:nearOwner:vendorPayload:scanDate:address:advertisement:status:ek:hint:rssi:indexInformation:acccessoryInformation:](v18, "initWithAdvertisementType:poshNetwork:nearOwner:vendorPayload:scanDate:address:advertisement:status:ek:hint:rssi:indexInformation:acccessoryInformation:", advertisementType, poshNetwork, nearOwner, vendorPayload, scanDate, address, advertisement, v16, v17, indexInformation, v13);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t advertisementType_low;
  id v5;

  advertisementType_low = LODWORD(self->_advertisementType);
  v5 = a3;
  objc_msgSend(v5, "encodeInt:forKey:", advertisementType_low, CFSTR("advertisementType"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_poshNetwork, CFSTR("poshNetwork"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_nearOwner, CFSTR("nearOwner"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vendorPayload, CFSTR("vendorPayload"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scanDate, CFSTR("scanDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_address, CFSTR("address"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_advertisement, CFSTR("advertisement"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_ek, CFSTR("ek"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hint, CFSTR("hint"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_rssi, CFSTR("rssi"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_indexInformation, CFSTR("indexInformation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessoryInformation, CFSTR("accessoryInformation"));

}

- (SPScannedObject)initWithCoder:(id)a3
{
  id v4;
  NSData *v5;
  NSData *vendorPayload;
  NSDate *v7;
  NSDate *scanDate;
  NSData *v9;
  NSData *address;
  NSData *v11;
  NSData *advertisement;
  NSNumber *v13;
  NSNumber *hint;
  SPIndexInformation *v15;
  SPIndexInformation *indexInformation;
  SPAccessoryInformation *v17;
  SPAccessoryInformation *accessoryInformation;

  v4 = a3;
  self->_advertisementType = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("advertisementType"));
  self->_poshNetwork = objc_msgSend(v4, "decodeIntForKey:", CFSTR("poshNetwork"));
  self->_nearOwner = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("nearOwner"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vendorPayload"));
  v5 = (NSData *)objc_claimAutoreleasedReturnValue();
  vendorPayload = self->_vendorPayload;
  self->_vendorPayload = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scanDate"));
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  scanDate = self->_scanDate;
  self->_scanDate = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("address"));
  v9 = (NSData *)objc_claimAutoreleasedReturnValue();
  address = self->_address;
  self->_address = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("advertisement"));
  v11 = (NSData *)objc_claimAutoreleasedReturnValue();
  advertisement = self->_advertisement;
  self->_advertisement = v11;

  self->_status = objc_msgSend(v4, "decodeIntForKey:", CFSTR("status"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hint"));
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  hint = self->_hint;
  self->_hint = v13;

  self->_ek = objc_msgSend(v4, "decodeIntForKey:", CFSTR("ek"));
  self->_rssi = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rssi"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("indexInformation"));
  v15 = (SPIndexInformation *)objc_claimAutoreleasedReturnValue();
  indexInformation = self->_indexInformation;
  self->_indexInformation = v15;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryInformation"));
  v17 = (SPAccessoryInformation *)objc_claimAutoreleasedReturnValue();

  accessoryInformation = self->_accessoryInformation;
  self->_accessoryInformation = v17;

  return self;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SPScannedObject scanDate](self, "scanDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPScannedObject address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fm_hexString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPScannedObject advertisement](self, "advertisement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fm_hexString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SPScannedObject status](self, "status");
  v10 = -[SPScannedObject ek](self, "ek");
  -[SPScannedObject hint](self, "hint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<scanDate: %@, address: %@, adv: %@, status: %x, ek: %x hint: %@, rssi: %ld)>"), v4, v6, v8, v9, v10, v11, -[SPScannedObject rssi](self, "rssi"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSData)optional
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  char v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  objc_msgSend(v3, "appendBytes:length:", &self->_ek, 1);
  -[SPScannedObject hint](self, "hint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SPScannedObject hint](self, "hint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedCharValue");

    v8 = v6;
    objc_msgSend(v3, "appendBytes:length:", &v8, 1);
  }
  return (NSData *)v3;
}

- (int64_t)advertisementType
{
  return self->_advertisementType;
}

- (void)setAdvertisementType:(int64_t)a3
{
  self->_advertisementType = a3;
}

- (unsigned)poshNetwork
{
  return self->_poshNetwork;
}

- (void)setPoshNetwork:(unsigned __int8)a3
{
  self->_poshNetwork = a3;
}

- (BOOL)nearOwner
{
  return self->_nearOwner;
}

- (void)setNearOwner:(BOOL)a3
{
  self->_nearOwner = a3;
}

- (NSData)vendorPayload
{
  return self->_vendorPayload;
}

- (void)setVendorPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)scanDate
{
  return self->_scanDate;
}

- (void)setScanDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSData)advertisement
{
  return self->_advertisement;
}

- (void)setAdvertisement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unsigned)status
{
  return self->_status;
}

- (void)setStatus:(unsigned __int8)a3
{
  self->_status = a3;
}

- (NSNumber)hint
{
  return self->_hint;
}

- (unsigned)ek
{
  return self->_ek;
}

- (void)setEk:(unsigned __int8)a3
{
  self->_ek = a3;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (SPAccessoryInformation)accessoryInformation
{
  return self->_accessoryInformation;
}

- (SPIndexInformation)indexInformation
{
  return self->_indexInformation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexInformation, 0);
  objc_storeStrong((id *)&self->_accessoryInformation, 0);
  objc_storeStrong((id *)&self->_hint, 0);
  objc_storeStrong((id *)&self->_advertisement, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_scanDate, 0);
  objc_storeStrong((id *)&self->_vendorPayload, 0);
}

@end
