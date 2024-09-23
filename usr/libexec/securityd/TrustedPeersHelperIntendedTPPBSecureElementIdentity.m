@implementation TrustedPeersHelperIntendedTPPBSecureElementIdentity

- (TrustedPeersHelperIntendedTPPBSecureElementIdentity)initWithSecureElementIdentity:(id)a3
{
  id v5;
  TrustedPeersHelperIntendedTPPBSecureElementIdentity *v6;
  TrustedPeersHelperIntendedTPPBSecureElementIdentity *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TrustedPeersHelperIntendedTPPBSecureElementIdentity;
  v6 = -[TrustedPeersHelperIntendedTPPBSecureElementIdentity init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_secureElementIdentity, a3);

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperIntendedTPPBSecureElementIdentity secureElementIdentity](self, "secureElementIdentity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<TrustedPeersHelperIntendedTPPBSecureElementIdentity: %@>"), v2));

  return v3;
}

- (TrustedPeersHelperIntendedTPPBSecureElementIdentity)initWithCoder:(id)a3
{
  id v4;
  TrustedPeersHelperIntendedTPPBSecureElementIdentity *v5;
  id v6;
  uint64_t v7;
  TPPBSecureElementIdentity *secureElementIdentity;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TrustedPeersHelperIntendedTPPBSecureElementIdentity;
  v5 = -[TrustedPeersHelperIntendedTPPBSecureElementIdentity init](&v10, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(TPPBSecureElementIdentity), CFSTR("identity"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    secureElementIdentity = v5->_secureElementIdentity;
    v5->_secureElementIdentity = (TPPBSecureElementIdentity *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperIntendedTPPBSecureElementIdentity secureElementIdentity](self, "secureElementIdentity"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identity"));

}

- (TPPBSecureElementIdentity)secureElementIdentity
{
  return (TPPBSecureElementIdentity *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSecureElementIdentity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureElementIdentity, 0);
}

+ (id)intendedEmptyIdentity
{
  return -[TrustedPeersHelperIntendedTPPBSecureElementIdentity initWithSecureElementIdentity:]([TrustedPeersHelperIntendedTPPBSecureElementIdentity alloc], "initWithSecureElementIdentity:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
