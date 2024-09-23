@implementation CuttlefishPCSServiceIdentifier

- (id)init:(id)a3 PCSPublicKey:(id)a4 zoneID:(id)a5
{
  id v9;
  id v10;
  id v11;
  CuttlefishPCSServiceIdentifier *v12;
  id *p_isa;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CuttlefishPCSServiceIdentifier;
  v12 = -[CuttlefishPCSServiceIdentifier init](&v15, "init");
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_PCSServiceID, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishPCSServiceIdentifier PCSPublicKey](self, "PCSPublicKey"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("pcsPublicKey"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishPCSServiceIdentifier PCSServiceID](self, "PCSServiceID"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("pcsServiceID"));

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CuttlefishPCSServiceIdentifier zoneID](self, "zoneID"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("zoneID"));

}

- (CuttlefishPCSServiceIdentifier)initWithCoder:(id)a3
{
  id v4;
  CuttlefishPCSServiceIdentifier *v5;
  id v6;
  uint64_t v7;
  NSString *zoneID;
  id v9;
  uint64_t v10;
  NSNumber *PCSServiceID;
  id v12;
  uint64_t v13;
  NSData *PCSPublicKey;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CuttlefishPCSServiceIdentifier;
  v5 = -[CuttlefishPCSServiceIdentifier init](&v16, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("zoneID"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    zoneID = v5->_zoneID;
    v5->_zoneID = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("pcsServiceID"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    PCSServiceID = v5->_PCSServiceID;
    v5->_PCSServiceID = (NSNumber *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("pcsPublicKey"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    PCSPublicKey = v5->_PCSPublicKey;
    v5->_PCSPublicKey = (NSData *)v13;

  }
  return v5;
}

- (NSNumber)PCSServiceID
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPCSServiceID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSData)PCSPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPCSPublicKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)zoneID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setZoneID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_PCSPublicKey, 0);
  objc_storeStrong((id *)&self->_PCSServiceID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
