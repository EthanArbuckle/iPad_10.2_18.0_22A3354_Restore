@implementation SPPairingState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPPairingState)initWithStatus:(int64_t)a3 beaconIdentifier:(id)a4 macAddress:(id)a5 pairingEpoch:(id)a6 partId:(unsigned __int8)a7 pairingType:(int64_t)a8
{
  uint64_t v9;
  id v14;
  id v15;
  id v16;
  SPPairingState *v17;
  SPPairingState *v18;
  objc_super v20;

  v9 = a7;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SPPairingState;
  v17 = -[SPPairingState init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    -[SPPairingState setStatus:](v17, "setStatus:", a3);
    -[SPPairingState setBeaconIdentifier:](v18, "setBeaconIdentifier:", v14);
    -[SPPairingState setMacAddress:](v18, "setMacAddress:", v15);
    -[SPPairingState setPairingEpoch:](v18, "setPairingEpoch:", v16);
    -[SPPairingState setPartId:](v18, "setPartId:", v9);
    -[SPPairingState setPairingType:](v18, "setPairingType:", a8);
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPPairingState *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  SPPairingState *v9;

  v4 = [SPPairingState alloc];
  v5 = -[SPPairingState status](self, "status");
  -[SPPairingState beaconIdentifier](self, "beaconIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPPairingState macAddress](self, "macAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPPairingState pairingEpoch](self, "pairingEpoch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SPPairingState initWithStatus:beaconIdentifier:macAddress:pairingEpoch:partId:pairingType:](v4, "initWithStatus:beaconIdentifier:macAddress:pairingEpoch:partId:pairingType:", v5, v6, v7, v8, -[SPPairingState partId](self, "partId"), -[SPPairingState pairingType](self, "pairingType"));

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t status;
  void *v5;
  id v6;

  status = self->_status;
  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", status, CFSTR("status"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_beaconIdentifier, CFSTR("beaconIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_macAddress, CFSTR("macAddress"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_pairingEpoch, CFSTR("pairingEpoch"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_partId);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("partId"));

  objc_msgSend(v6, "encodeInteger:forKey:", self->_pairingType, CFSTR("pairingType"));
}

- (SPPairingState)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *beaconIdentifier;
  NSData *v7;
  NSData *macAddress;
  NSNumber *v9;
  NSNumber *pairingEpoch;
  void *v11;
  int64_t v12;

  v4 = a3;
  self->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("beaconIdentifier"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  beaconIdentifier = self->_beaconIdentifier;
  self->_beaconIdentifier = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("macAddress"));
  v7 = (NSData *)objc_claimAutoreleasedReturnValue();
  macAddress = self->_macAddress;
  self->_macAddress = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairingEpoch"));
  v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  pairingEpoch = self->_pairingEpoch;
  self->_pairingEpoch = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("partId"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self->_partId = objc_msgSend(v11, "unsignedIntegerValue");

  v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pairingType"));
  self->_pairingType = v12;
  return self;
}

- (id)description
{
  unint64_t status;
  __CFString *v3;
  unint64_t v4;
  __CFString *v5;

  status = self->_status;
  if (status > 2)
    v3 = 0;
  else
    v3 = off_1E5E16AA0[status];
  v4 = self->_pairingType + 1;
  if (v4 > 2)
    v5 = 0;
  else
    v5 = off_1E5E16AB8[v4];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p state: %@ beaconId: %@ macAddress: %@ pairingEpoch: %@ partId: %ld pairingType: %@>"), objc_opt_class(), self, v3, self->_beaconIdentifier, self->_macAddress, self->_pairingEpoch, self->_partId, v5);
}

- (NSUUID)beaconIdentifier
{
  return self->_beaconIdentifier;
}

- (void)setBeaconIdentifier:(id)a3
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

- (NSNumber)pairingEpoch
{
  return self->_pairingEpoch;
}

- (void)setPairingEpoch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unsigned)partId
{
  return self->_partId;
}

- (void)setPartId:(unsigned __int8)a3
{
  self->_partId = a3;
}

- (int64_t)pairingType
{
  return self->_pairingType;
}

- (void)setPairingType:(int64_t)a3
{
  self->_pairingType = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingEpoch, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_beaconIdentifier, 0);
}

@end
