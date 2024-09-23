@implementation PKPendingShareableCredential

- (PKPendingShareableCredential)init
{

  return 0;
}

- (id)initForDatabase
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPendingShareableCredential;
  return -[PKPendingShareableCredential init](&v3, sel_init);
}

- (PKPendingShareableCredential)initWithShareableCredential:(id)a3
{
  id v4;
  void *v5;
  PKPendingShareableCredential *v6;
  uint64_t v7;
  NSString *sharingInstanceIdentifier;
  void *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "sharingInstanceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)PKPendingShareableCredential;
  v6 = -[PKPendingProvisioning initWithUniqueIdentifier:status:](&v11, sel_initWithUniqueIdentifier_status_, v5, 1);

  if (v6)
  {
    objc_msgSend(v4, "sharingInstanceIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    sharingInstanceIdentifier = v6->_sharingInstanceIdentifier;
    v6->_sharingInstanceIdentifier = (NSString *)v7;

    v6->_source = objc_msgSend(v4, "source");
    objc_msgSend(v4, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPendingProvisioning setProvisioningState:](v6, "setProvisioningState:", v9);

  }
  return v6;
}

- (PKPendingShareableCredential)initWithSharedCredential:(id)a3
{
  id v4;
  void *v5;
  PKPendingShareableCredential *v6;
  uint64_t v7;
  NSString *sharingInstanceIdentifier;
  uint64_t v9;
  NSString *provisioningCredentialHash;
  uint64_t v11;
  NSString *credentialAuthorityIdentifier;
  PKSecureElementProvisioningState *v13;
  objc_super v15;

  v4 = a3;
  objc_msgSend(v4, "sharingInstanceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)PKPendingShareableCredential;
  v6 = -[PKPendingProvisioning initWithUniqueIdentifier:status:](&v15, sel_initWithUniqueIdentifier_status_, v5, 1);

  if (v6)
  {
    objc_msgSend(v4, "sharingInstanceIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    sharingInstanceIdentifier = v6->_sharingInstanceIdentifier;
    v6->_sharingInstanceIdentifier = (NSString *)v7;

    objc_msgSend(v4, "provisioningCredentialIdentifierHash");
    v9 = objc_claimAutoreleasedReturnValue();
    provisioningCredentialHash = v6->_provisioningCredentialHash;
    v6->_provisioningCredentialHash = (NSString *)v9;

    v6->_source = objc_msgSend(v4, "source");
    objc_msgSend(v4, "credentialAuthorityIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    credentialAuthorityIdentifier = v6->_credentialAuthorityIdentifier;
    v6->_credentialAuthorityIdentifier = (NSString *)v11;

    v6->_securityOptions = objc_msgSend(v4, "securityOptions");
    v13 = objc_alloc_init(PKSecureElementProvisioningState);
    -[PKPendingProvisioning setProvisioningState:](v6, "setProvisioningState:", v13);

  }
  return v6;
}

- (id)type
{
  return CFSTR("PaymentShareableCredential");
}

- (id)credential
{
  PKPaymentShareableCredential *v3;
  void *v4;
  void *v5;

  v3 = -[PKPaymentShareableCredential initWithProvisioningSharingIdentifier:isBackgroundProvisioning:]([PKPaymentShareableCredential alloc], "initWithProvisioningSharingIdentifier:isBackgroundProvisioning:", self->_sharingInstanceIdentifier, 1);
  -[PKPaymentShareableCredential setSource:](v3, "setSource:", self->_source);
  -[PKPendingProvisioning provisioningState](self, "provisioningState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PKPendingProvisioning provisioningState](self, "provisioningState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentCredential setState:](v3, "setState:", v5);

  }
  return v3;
}

- (BOOL)representsPass:(id)a3
{
  void *v4;
  NSString *provisioningCredentialHash;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;

  objc_msgSend(a3, "provisioningCredentialHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  provisioningCredentialHash = self->_provisioningCredentialHash;
  v6 = v4;
  v7 = provisioningCredentialHash;
  v8 = v7;
  if (v6 == v7)
  {
    v9 = 1;
  }
  else
  {
    v9 = 0;
    if (v6 && v7)
      v9 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPendingShareableCredential)initWithCoder:(id)a3
{
  id v4;
  PKPendingShareableCredential *v5;
  uint64_t v6;
  NSString *sharingInstanceIdentifier;
  uint64_t v8;
  NSString *provisioningCredentialHash;
  uint64_t v10;
  NSString *credentialAuthorityIdentifier;
  void *v12;
  uint64_t v13;
  NSString *passSerialNumber;
  uint64_t v15;
  NSString *passTypeIdentifier;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPendingShareableCredential;
  v5 = -[PKPendingProvisioning initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingInstanceIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    sharingInstanceIdentifier = v5->_sharingInstanceIdentifier;
    v5->_sharingInstanceIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provisioningCredentialHash"));
    v8 = objc_claimAutoreleasedReturnValue();
    provisioningCredentialHash = v5->_provisioningCredentialHash;
    v5->_provisioningCredentialHash = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialAuthorityIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    credentialAuthorityIdentifier = v5->_credentialAuthorityIdentifier;
    v5->_credentialAuthorityIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("securityOptions"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_securityOptions = PKPushProvisioningSecurityOptionsFromString(v12);

    v5->_source = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passSerialNumber"));
    v13 = objc_claimAutoreleasedReturnValue();
    passSerialNumber = v5->_passSerialNumber;
    v5->_passSerialNumber = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passTypeIdentifier"));
    v15 = objc_claimAutoreleasedReturnValue();
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPendingShareableCredential;
  v4 = a3;
  -[PKPendingProvisioning encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sharingInstanceIdentifier, CFSTR("sharingInstanceIdentifier"), v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_provisioningCredentialHash, CFSTR("provisioningCredentialHash"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_credentialAuthorityIdentifier, CFSTR("credentialAuthorityIdentifier"));
  PKPushProvisioningSecurityOptionsToString(self->_securityOptions);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("securityOptions"));

  objc_msgSend(v4, "encodeInteger:forKey:", self->_source, CFSTR("source"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_passSerialNumber, CFSTR("passSerialNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_passTypeIdentifier, CFSTR("passTypeIdentifier"));

}

- (void)_copyIntoPendingProvision:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKPendingShareableCredential;
  v4 = a3;
  -[PKPendingProvisioning _copyIntoPendingProvision:](&v15, sel__copyIntoPendingProvision_, v4);
  v5 = -[NSString copy](self->_sharingInstanceIdentifier, "copy", v15.receiver, v15.super_class);
  v6 = (void *)v4[7];
  v4[7] = v5;

  v7 = -[NSString copy](self->_provisioningCredentialHash, "copy");
  v8 = (void *)v4[8];
  v4[8] = v7;

  v9 = -[NSString copy](self->_credentialAuthorityIdentifier, "copy");
  v10 = (void *)v4[10];
  v4[10] = v9;

  v4[11] = self->_securityOptions;
  v4[9] = self->_source;
  v11 = -[NSString copy](self->_passSerialNumber, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSString copy](self->_passTypeIdentifier, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

}

- (NSString)sharingInstanceIdentifier
{
  return self->_sharingInstanceIdentifier;
}

- (void)setSharingInstanceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, a3);
}

- (NSString)provisioningCredentialHash
{
  return self->_provisioningCredentialHash;
}

- (void)setProvisioningCredentialHash:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningCredentialHash, a3);
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (NSString)credentialAuthorityIdentifier
{
  return self->_credentialAuthorityIdentifier;
}

- (void)setCredentialAuthorityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_credentialAuthorityIdentifier, a3);
}

- (unint64_t)securityOptions
{
  return self->_securityOptions;
}

- (void)setSecurityOptions:(unint64_t)a3
{
  self->_securityOptions = a3;
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_passSerialNumber, a3);
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passTypeIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_credentialAuthorityIdentifier, 0);
  objc_storeStrong((id *)&self->_provisioningCredentialHash, 0);
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, 0);
}

@end
