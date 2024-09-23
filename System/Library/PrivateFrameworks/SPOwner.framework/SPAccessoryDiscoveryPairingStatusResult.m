@implementation SPAccessoryDiscoveryPairingStatusResult

- (SPAccessoryDiscoveryPairingStatusResult)initWithPairingStatus:(int64_t)a3 lostModeInfo:(id)a4
{
  id v7;
  SPAccessoryDiscoveryPairingStatusResult *v8;
  SPAccessoryDiscoveryPairingStatusResult *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SPAccessoryDiscoveryPairingStatusResult;
  v8 = -[SPAccessoryDiscoveryPairingStatusResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_pairingStatus = a3;
    objc_storeStrong((id *)&v8->_lostModeInfo, a4);
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPAccessoryDiscoveryPairingStatusResult *v4;
  int64_t v5;
  void *v6;
  SPAccessoryDiscoveryPairingStatusResult *v7;

  v4 = [SPAccessoryDiscoveryPairingStatusResult alloc];
  v5 = -[SPAccessoryDiscoveryPairingStatusResult pairingStatus](self, "pairingStatus");
  -[SPAccessoryDiscoveryPairingStatusResult lostModeInfo](self, "lostModeInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SPAccessoryDiscoveryPairingStatusResult initWithPairingStatus:lostModeInfo:](v4, "initWithPairingStatus:lostModeInfo:", v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t pairingStatus;
  id v5;

  pairingStatus = self->_pairingStatus;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", pairingStatus, CFSTR("pairingStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lostModeInfo, CFSTR("lostModeInfo"));

}

- (SPAccessoryDiscoveryPairingStatusResult)initWithCoder:(id)a3
{
  id v4;
  SPLostModeInfo *v5;
  SPLostModeInfo *lostModeInfo;

  v4 = a3;
  self->_pairingStatus = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("pairingStatus"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lostModeInfo"));
  v5 = (SPLostModeInfo *)objc_claimAutoreleasedReturnValue();

  lostModeInfo = self->_lostModeInfo;
  self->_lostModeInfo = v5;

  return self;
}

- (int64_t)pairingStatus
{
  return self->_pairingStatus;
}

- (SPLostModeInfo)lostModeInfo
{
  return self->_lostModeInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lostModeInfo, 0);
}

@end
