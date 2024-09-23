@implementation SFAutoFillPasskey

- (SFAutoFillPasskey)initWithCoreAutoFillPasskey:(id)a3
{
  id v5;
  SFAutoFillPasskey *v6;
  SFAutoFillPasskey *v7;
  SFAutoFillPasskey *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFAutoFillPasskey;
  v6 = -[SFAutoFillPasskey init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_corePasskey, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)username
{
  return (NSString *)-[WBSAutoFillPasskey username](self->_corePasskey, "username");
}

- (NSString)customTitle
{
  return (NSString *)-[WBSAutoFillPasskey customTitle](self->_corePasskey, "customTitle");
}

- (NSString)relyingPartyIdentifier
{
  return (NSString *)-[WBSAutoFillPasskey relyingPartyIdentifier](self->_corePasskey, "relyingPartyIdentifier");
}

- (SFAutoFillPasskeyIdentifier)identifier
{
  SFAutoFillPasskeyIdentifier *v3;
  void *v4;
  SFAutoFillPasskeyIdentifier *v5;

  v3 = [SFAutoFillPasskeyIdentifier alloc];
  -[WBSAutoFillPasskey identifier](self->_corePasskey, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SFAutoFillPasskeyIdentifier initWithCoreIdentifier:](v3, "initWithCoreIdentifier:", v4);

  return v5;
}

- (NSData)userHandle
{
  void *v2;
  void *v3;
  void *v4;

  -[WBSAutoFillPasskey identifier](self->_corePasskey, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "credentialID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAutoFillPasskey)initWithCoder:(id)a3
{
  id v4;
  SFAutoFillPasskey *v5;
  uint64_t v6;
  WBSAutoFillPasskey *corePasskey;
  SFAutoFillPasskey *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFAutoFillPasskey;
  v5 = -[SFAutoFillPasskey init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("corePasskey"));
    v6 = objc_claimAutoreleasedReturnValue();
    corePasskey = v5->_corePasskey;
    v5->_corePasskey = (WBSAutoFillPasskey *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_corePasskey, CFSTR("corePasskey"));
}

- (WBSAutoFillPasskey)corePasskey
{
  return self->_corePasskey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_corePasskey, 0);
}

@end
