@implementation PKPaymentIdentityCredential

- (PKPaymentIdentityCredential)initWithShareablePassMetadata:(id)a3 isoCredentialIdentifier:(id)a4
{
  id v7;
  id v8;
  PKPaymentIdentityCredential *v9;
  PKPaymentIdentityCredential *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentIdentityCredential;
  v9 = -[PKPaymentCredential init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_shareableMetadata, a3);
    objc_storeStrong((id *)&v10->_isoCredentialIdentifier, a4);
    -[PKPaymentCredential setCardType:](v10, "setCardType:", 4);
  }

  return v10;
}

- (id)paymentApplications
{
  void *v2;
  PKProvisioningPaymentApplication *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  +[PKProvisioningSEStorageSnapshot appletTypePurpleTrustAirAccess](PKProvisioningSEStorageSnapshot, "appletTypePurpleTrustAirAccess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PKProvisioningPaymentApplication initWithAppletTypeIdentifier:paymentType:]([PKProvisioningPaymentApplication alloc], "initWithAppletTypeIdentifier:paymentType:", v2, 1002);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)hasExistingPassInformation
{
  return self->_passTypeIdentifier && self->_passSerialNumber != 0;
}

- (PKPaymentIdentityCredential)initWithCoder:(id)a3
{
  id v4;
  PKPaymentIdentityCredential *v5;
  uint64_t v6;
  PKShareablePassMetadata *shareableMetadata;
  uint64_t v8;
  NSString *isoCredentialIdentifier;
  uint64_t v10;
  NSString *passTypeIdentifier;
  uint64_t v12;
  NSString *passSerialNumber;
  uint64_t v14;
  NSString *accountKeyIdentifier;
  uint64_t v16;
  PKIdentityProvisioningAttestations *attestations;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentIdentityCredential;
  v5 = -[PKPaymentCredential initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shareableMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    shareableMetadata = v5->_shareableMetadata;
    v5->_shareableMetadata = (PKShareablePassMetadata *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isoCredentialIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    isoCredentialIdentifier = v5->_isoCredentialIdentifier;
    v5->_isoCredentialIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passTypeIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passSerialNumber"));
    v12 = objc_claimAutoreleasedReturnValue();
    passSerialNumber = v5->_passSerialNumber;
    v5->_passSerialNumber = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountKeyIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    accountKeyIdentifier = v5->_accountKeyIdentifier;
    v5->_accountKeyIdentifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attestations"));
    v16 = objc_claimAutoreleasedReturnValue();
    attestations = v5->_attestations;
    v5->_attestations = (PKIdentityProvisioningAttestations *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentIdentityCredential;
  v4 = a3;
  -[PKPaymentCredential encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_shareableMetadata, CFSTR("shareableMetadata"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_passTypeIdentifier, CFSTR("passTypeIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_isoCredentialIdentifier, CFSTR("isoCredentialIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_passSerialNumber, CFSTR("passSerialNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountKeyIdentifier, CFSTR("accountKeyIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_attestations, CFSTR("attestations"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)isoCredentialIdentifier
{
  return self->_isoCredentialIdentifier;
}

- (PKShareablePassMetadata)shareableMetadata
{
  return self->_shareableMetadata;
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)accountKeyIdentifier
{
  return self->_accountKeyIdentifier;
}

- (void)setAccountKeyIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (PKIdentityProvisioningAttestations)attestations
{
  return self->_attestations;
}

- (void)setAttestations:(id)a3
{
  objc_storeStrong((id *)&self->_attestations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attestations, 0);
  objc_storeStrong((id *)&self->_accountKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_shareableMetadata, 0);
  objc_storeStrong((id *)&self->_isoCredentialIdentifier, 0);
}

@end
