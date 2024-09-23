@implementation _SFIdentity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFIdentity)initWithPublicKey:(id)a3
{
  return -[_SFIdentity initWithPublicKey:certificate:](self, "initWithPublicKey:certificate:", a3, 0);
}

- (_SFIdentity)initWithKeyPair:(id)a3
{
  return -[_SFIdentity initWithKeyPair:certificate:](self, "initWithKeyPair:certificate:", a3, 0);
}

- (_SFIdentity)initWithPublicKey:(id)a3 certificate:(id)a4
{
  id v7;
  id v8;
  _SFIdentity *v9;
  SFIdentity_Ivars *v10;
  id identityInternal;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_SFIdentity;
  v9 = -[_SFIdentity init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_alloc_init(SFIdentity_Ivars);
    identityInternal = v9->_identityInternal;
    v9->_identityInternal = v10;

    objc_storeStrong((id *)v9->_identityInternal + 1, a3);
    objc_storeStrong((id *)v9->_identityInternal + 3, a4);
  }

  return v9;
}

- (_SFIdentity)initWithKeyPair:(id)a3 certificate:(id)a4
{
  id v7;
  id v8;
  _SFIdentity *v9;
  SFIdentity_Ivars *v10;
  id identityInternal;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_SFIdentity;
  v9 = -[_SFIdentity init](&v16, sel_init);
  if (v9)
  {
    v10 = objc_alloc_init(SFIdentity_Ivars);
    identityInternal = v9->_identityInternal;
    v9->_identityInternal = v10;

    objc_msgSend(v7, "publicKey");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v9->_identityInternal;
    v14 = (void *)v13[1];
    v13[1] = v12;

    objc_storeStrong((id *)v9->_identityInternal + 3, a4);
    objc_storeStrong((id *)v9->_identityInternal + 2, a3);
  }

  return v9;
}

- (_SFIdentity)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFIdentity;
  return -[_SFIdentity init](&v4, sel_init, a3);
}

- (_SFPublicKey)publicKey
{
  return (_SFPublicKey *)*((id *)self->_identityInternal + 1);
}

- (_SFKeyPair)keyPair
{
  return (_SFKeyPair *)*((id *)self->_identityInternal + 2);
}

- (void)setKeyPair:(id)a3
{
  objc_storeStrong((id *)self->_identityInternal + 2, a3);
}

- (_SFCertificate)certificate
{
  return (_SFCertificate *)*((id *)self->_identityInternal + 3);
}

- (void)setCertificate:(id)a3
{
  objc_storeStrong((id *)self->_identityInternal + 3, a3);
}

- (SFIdentityAttributes)attributes
{
  return (SFIdentityAttributes *)*((id *)self->_identityInternal + 4);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_identityInternal, 0);
}

@end
