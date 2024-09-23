@implementation SFAutoFillPasskeyIdentifier

- (SFAutoFillPasskeyIdentifier)initWithCoreIdentifier:(id)a3
{
  id v5;
  SFAutoFillPasskeyIdentifier *v6;
  SFAutoFillPasskeyIdentifier *v7;
  SFAutoFillPasskeyIdentifier *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFAutoFillPasskeyIdentifier;
  v6 = -[SFAutoFillPasskeyIdentifier init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coreIdentifier, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)credentialID
{
  return (NSString *)-[WBSPublicKeyCredentialIdentifier credentialID](self->_coreIdentifier, "credentialID");
}

- (NSString)groupID
{
  return (NSString *)-[WBSPublicKeyCredentialIdentifier groupID](self->_coreIdentifier, "groupID");
}

- (BOOL)isEqual:(id)a3
{
  SFAutoFillPasskeyIdentifier *v4;
  WBSPublicKeyCredentialIdentifier *coreIdentifier;
  void *v6;
  char v7;

  v4 = (SFAutoFillPasskeyIdentifier *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      coreIdentifier = self->_coreIdentifier;
      -[SFAutoFillPasskeyIdentifier coreIdentifier](v4, "coreIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[WBSPublicKeyCredentialIdentifier isEqual:](coreIdentifier, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return -[WBSPublicKeyCredentialIdentifier hash](self->_coreIdentifier, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAutoFillPasskeyIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  SFAutoFillPasskeyIdentifier *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coreIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SFAutoFillPasskeyIdentifier initWithCoreIdentifier:](self, "initWithCoreIdentifier:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_coreIdentifier, CFSTR("coreIdentifier"));
}

- (WBSPublicKeyCredentialIdentifier)coreIdentifier
{
  return self->_coreIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreIdentifier, 0);
}

@end
