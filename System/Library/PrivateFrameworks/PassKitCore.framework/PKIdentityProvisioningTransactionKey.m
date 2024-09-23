@implementation PKIdentityProvisioningTransactionKey

- (PKIdentityProvisioningTransactionKey)initWithCASDAttestation:(id)a3 authorization:(id)a4
{
  id v7;
  id v8;
  PKIdentityProvisioningTransactionKey *v9;
  PKIdentityProvisioningTransactionKey *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKIdentityProvisioningTransactionKey;
  v9 = -[PKIdentityProvisioningTransactionKey init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_casdAttestation, a3);
    objc_storeStrong((id *)&v10->_authorization, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *casdAttestation;
  id v5;

  casdAttestation = self->_casdAttestation;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", casdAttestation, CFSTR("transactionKeyAttestation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authorization, CFSTR("transactionKeyAuthorization"));

}

- (PKIdentityProvisioningTransactionKey)initWithCoder:(id)a3
{
  id v4;
  PKIdentityProvisioningTransactionKey *v5;
  uint64_t v6;
  NSData *casdAttestation;
  uint64_t v8;
  NSData *authorization;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKIdentityProvisioningTransactionKey;
  v5 = -[PKIdentityProvisioningTransactionKey init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionKeyAttestation"));
    v6 = objc_claimAutoreleasedReturnValue();
    casdAttestation = v5->_casdAttestation;
    v5->_casdAttestation = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionKeyAuthorization"));
    v8 = objc_claimAutoreleasedReturnValue();
    authorization = v5->_authorization;
    v5->_authorization = (NSData *)v8;

  }
  return v5;
}

- (NSData)casdAttestation
{
  return self->_casdAttestation;
}

- (NSData)authorization
{
  return self->_authorization;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_casdAttestation, 0);
}

@end
