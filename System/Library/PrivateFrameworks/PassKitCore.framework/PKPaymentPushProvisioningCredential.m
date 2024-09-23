@implementation PKPaymentPushProvisioningCredential

- (PKPaymentPushProvisioningCredential)initWithDict:(id)a3
{
  id v4;
  PKPaymentPushProvisioningCredential *v5;
  __CFString *v6;
  __CFString *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  NSString *sharingInstanceIdentifier;
  uint64_t v12;
  NSString *provisioningCredentialIdentifierHash;
  uint64_t v14;
  NSString *credentialAuthorityIdentifier;
  void *v16;
  void *v17;
  uint64_t v18;
  int64_t *p_source;
  PKPaymentPushProvisioningCredential *v20;
  uint64_t v21;
  NSString *accountIdentifier;
  void *v23;
  __CFString *v25;
  __CFString *v26;
  int v27;
  objc_super v28;

  v4 = a3;
  if (v4)
  {
    v28.receiver = self;
    v28.super_class = (Class)PKPaymentPushProvisioningCredential;
    v5 = -[PKPaymentPushProvisioningCredential init](&v28, sel_init);
    if (!v5)
    {
LABEL_15:
      self = v5;
      v20 = self;
      goto LABEL_16;
    }
    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v6 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 == CFSTR("sharedCredential"))
      goto LABEL_6;
    if (!v6)
      goto LABEL_8;
    v8 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("sharedCredential"));

    if ((v8 & 1) != 0)
    {
LABEL_6:
      v9 = 1;
    }
    else
    {
      v25 = v7;
      if (v25 != CFSTR("appleFeature"))
      {
        v26 = v25;
        v27 = -[__CFString isEqualToString:](v25, "isEqualToString:", CFSTR("appleFeature"));

        if (!v27)
        {
LABEL_8:
          v5->_securityOptions = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("securityOptions"));
          objc_msgSend(v4, "PKStringForKey:", CFSTR("sharingInstanceIdentifier"));
          v10 = objc_claimAutoreleasedReturnValue();
          sharingInstanceIdentifier = v5->_sharingInstanceIdentifier;
          v5->_sharingInstanceIdentifier = (NSString *)v10;

          objc_msgSend(v4, "PKStringForKey:", CFSTR("provisioningCredentialIdentifierHash"));
          v12 = objc_claimAutoreleasedReturnValue();
          provisioningCredentialIdentifierHash = v5->_provisioningCredentialIdentifierHash;
          v5->_provisioningCredentialIdentifierHash = (NSString *)v12;

          objc_msgSend(v4, "PKStringForKey:", CFSTR("credentialAuthorityIdentifier"));
          v14 = objc_claimAutoreleasedReturnValue();
          credentialAuthorityIdentifier = v5->_credentialAuthorityIdentifier;
          v5->_credentialAuthorityIdentifier = (NSString *)v14;

          objc_msgSend(v4, "PKNumberForKey:", CFSTR("source"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            v18 = objc_msgSend(v16, "integerValue");
            v5->_source = v18;
            p_source = &v5->_source;
            if ((unint64_t)(v18 - 1) < 0xB)
              goto LABEL_14;
          }
          else
          {
            p_source = &v5->_source;
          }
          *p_source = 1;
LABEL_14:
          objc_msgSend(v4, "PKStringForKey:", CFSTR("accountIdentifier"));
          v21 = objc_claimAutoreleasedReturnValue();
          accountIdentifier = v5->_accountIdentifier;
          v5->_accountIdentifier = (NSString *)v21;

          objc_msgSend(v4, "PKStringForKey:", CFSTR("featureIdentifier"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v5->_feature = PKFeatureIdentifierFromString(v23);

          goto LABEL_15;
        }
      }
      v9 = 2;
    }
    v5->_type = v9;
    goto LABEL_8;
  }
  v20 = 0;
LABEL_16:

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *sharingInstanceIdentifier;
  id v5;

  sharingInstanceIdentifier = self->_sharingInstanceIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sharingInstanceIdentifier, CFSTR("sharingInstanceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_provisioningCredentialIdentifierHash, CFSTR("provisioningCredentialIdentifierHash"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_source, CFSTR("source"));

}

- (PKPaymentPushProvisioningCredential)initWithCoder:(id)a3
{
  id v4;
  PKPaymentPushProvisioningCredential *v5;
  uint64_t v6;
  NSString *sharingInstanceIdentifier;
  uint64_t v8;
  NSString *provisioningCredentialIdentifierHash;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentPushProvisioningCredential;
  v5 = -[PKPaymentPushProvisioningCredential init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingInstanceIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    sharingInstanceIdentifier = v5->_sharingInstanceIdentifier;
    v5->_sharingInstanceIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provisioningCredentialIdentifierHash"));
    v8 = objc_claimAutoreleasedReturnValue();
    provisioningCredentialIdentifierHash = v5->_provisioningCredentialIdentifierHash;
    v5->_provisioningCredentialIdentifierHash = (NSString *)v8;

    v5->_source = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source"));
  }

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)securityOptions
{
  return self->_securityOptions;
}

- (void)setSecurityOptions:(unint64_t)a3
{
  self->_securityOptions = a3;
}

- (NSString)sharingInstanceIdentifier
{
  return self->_sharingInstanceIdentifier;
}

- (void)setSharingInstanceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, a3);
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (NSString)provisioningCredentialIdentifierHash
{
  return self->_provisioningCredentialIdentifierHash;
}

- (NSString)credentialAuthorityIdentifier
{
  return self->_credentialAuthorityIdentifier;
}

- (void)setCredentialAuthorityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_credentialAuthorityIdentifier, a3);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (unint64_t)feature
{
  return self->_feature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialAuthorityIdentifier, 0);
  objc_storeStrong((id *)&self->_provisioningCredentialIdentifierHash, 0);
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, 0);
}

@end
