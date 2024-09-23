@implementation RMCertificateStatusItem

+ (id)certificateStatusItemWithPersistentRef:(id)a3 isIdentity:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  RMCertificateStatusItem *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[RMCertificateStatusItem initWithWithPersistentRef:isIdentity:]([RMCertificateStatusItem alloc], "initWithWithPersistentRef:isIdentity:", v5, v4);

  return v6;
}

- (RMCertificateStatusItem)initWithWithPersistentRef:(id)a3 isIdentity:(BOOL)a4
{
  id v7;
  RMCertificateStatusItem *v8;
  RMCertificateStatusItem *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RMCertificateStatusItem;
  v8 = -[RMCertificateStatusItem init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_persistentRef, a3);
    v9->_isIdentity = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMCertificateStatusItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  RMCertificateStatusItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("persistent-ref"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("is-identity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[RMCertificateStatusItem initWithWithPersistentRef:isIdentity:](self, "initWithWithPersistentRef:isIdentity:", v5, objc_msgSend(v6, "BOOLValue"));
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[RMCertificateStatusItem persistentRef](self, "persistentRef");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("persistent-ref"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[RMCertificateStatusItem isIdentity](self, "isIdentity"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("is-identity"));

}

- (BOOL)isEqual:(id)a3
{
  RMCertificateStatusItem *v4;
  BOOL v5;

  v4 = (RMCertificateStatusItem *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[RMCertificateStatusItem isEqualToCertificateStatus:](self, "isEqualToCertificateStatus:", v4);
  }

  return v5;
}

- (BOOL)isEqualToCertificateStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  int v8;

  v4 = a3;
  -[RMCertificateStatusItem persistentRef](self, "persistentRef");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentRef");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToData:", v6))
  {
    v7 = -[RMCertificateStatusItem isIdentity](self, "isIdentity");
    v8 = v7 ^ objc_msgSend(v4, "isIdentity") ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (NSData)persistentRef
{
  return self->_persistentRef;
}

- (BOOL)isIdentity
{
  return self->_isIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentRef, 0);
}

@end
