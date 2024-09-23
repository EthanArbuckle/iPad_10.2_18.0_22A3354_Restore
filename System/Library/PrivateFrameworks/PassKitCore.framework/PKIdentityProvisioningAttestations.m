@implementation PKIdentityProvisioningAttestations

- (PKIdentityProvisioningAttestations)initWithAuthorizationKeyAttestation:(id)a3 deviceEncryptionKeyAttestation:(id)a4 deviceEncryptionKeyAuthorization:(id)a5 transactionKeyCASDAttestation:(id)a6 transactionKeyCASDSignature:(id)a7 transactionKeyCASDAuthorization:(id)a8
{
  id v15;
  id v16;
  id v17;
  PKIdentityProvisioningAttestations *v18;
  PKIdentityProvisioningAttestations *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PKIdentityProvisioningAttestations;
  v18 = -[PKIdentityProvisioningAttestations init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_authorizationKeyAttestation, a3);
    objc_storeStrong((id *)&v19->_deviceEncryptionKeyAttestation, a4);
    objc_storeStrong((id *)&v19->_deviceEncryptionKeyAuthorization, a5);
    objc_storeStrong((id *)&v19->_transactionKeyCASDAttestation, a6);
    objc_storeStrong((id *)&v19->_transactionKeyCASDSignature, a7);
    objc_storeStrong((id *)&v19->_transactionKeyCASDAuthorization, a8);
  }

  return v19;
}

- (PKIdentityProvisioningAttestations)initWithAuthorizationKeyAttestation:(id)a3 deviceEncryptionKeyAttestation:(id)a4 deviceEncryptionKeyAuthorization:(id)a5 progenitorKeyCASDAttestation:(id)a6 transactionKeys:(id)a7 serverAttestedProvisioningData:(id)a8
{
  id v15;
  id v16;
  id v17;
  PKIdentityProvisioningAttestations *v18;
  PKIdentityProvisioningAttestations *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PKIdentityProvisioningAttestations;
  v18 = -[PKIdentityProvisioningAttestations init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_authorizationKeyAttestation, a3);
    objc_storeStrong((id *)&v19->_deviceEncryptionKeyAttestation, a4);
    objc_storeStrong((id *)&v19->_deviceEncryptionKeyAuthorization, a5);
    objc_storeStrong((id *)&v19->_progenitorKeyCASDAttestation, a6);
    objc_storeStrong((id *)&v19->_transactionKeys, a7);
    objc_storeStrong((id *)&v19->_serverAttestedProvisioningData, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *authorizationKeyAttestation;
  id v5;

  authorizationKeyAttestation = self->_authorizationKeyAttestation;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", authorizationKeyAttestation, CFSTR("authorizationKeyAttestation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceEncryptionKeyAttestation, CFSTR("deviceEncryptionKeyAttestation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceEncryptionKeyAuthorization, CFSTR("deviceEncryptionKeyAuthorization"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionKeyCASDAttestation, CFSTR("transactionKeyCASDAttestation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionKeyCASDSignature, CFSTR("transactionKeyCASDSignature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionKeyCASDAuthorization, CFSTR("transactionKeyCASDAuthorization"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_progenitorKeyCASDAttestation, CFSTR("progenitorKeyAttestation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionKeys, CFSTR("transactionKeyData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serverAttestedProvisioningData, CFSTR("serverAttestedProvisioningData"));

}

- (PKIdentityProvisioningAttestations)initWithCoder:(id)a3
{
  id v4;
  PKIdentityProvisioningAttestations *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *authorizationKeyAttestation;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *deviceEncryptionKeyAttestation;
  uint64_t v16;
  NSData *deviceEncryptionKeyAuthorization;
  uint64_t v18;
  NSData *transactionKeyCASDAttestation;
  uint64_t v20;
  NSData *transactionKeyCASDSignature;
  uint64_t v22;
  NSData *transactionKeyCASDAuthorization;
  uint64_t v24;
  NSData *progenitorKeyCASDAttestation;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *transactionKeys;
  uint64_t v31;
  NSData *serverAttestedProvisioningData;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKIdentityProvisioningAttestations;
  v5 = -[PKIdentityProvisioningAttestations init](&v34, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("authorizationKeyAttestation"));
    v9 = objc_claimAutoreleasedReturnValue();
    authorizationKeyAttestation = v5->_authorizationKeyAttestation;
    v5->_authorizationKeyAttestation = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("deviceEncryptionKeyAttestation"));
    v14 = objc_claimAutoreleasedReturnValue();
    deviceEncryptionKeyAttestation = v5->_deviceEncryptionKeyAttestation;
    v5->_deviceEncryptionKeyAttestation = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceEncryptionKeyAuthorization"));
    v16 = objc_claimAutoreleasedReturnValue();
    deviceEncryptionKeyAuthorization = v5->_deviceEncryptionKeyAuthorization;
    v5->_deviceEncryptionKeyAuthorization = (NSData *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionKeyCASDAttestation"));
    v18 = objc_claimAutoreleasedReturnValue();
    transactionKeyCASDAttestation = v5->_transactionKeyCASDAttestation;
    v5->_transactionKeyCASDAttestation = (NSData *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionKeyCASDSignature"));
    v20 = objc_claimAutoreleasedReturnValue();
    transactionKeyCASDSignature = v5->_transactionKeyCASDSignature;
    v5->_transactionKeyCASDSignature = (NSData *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionKeyCASDAuthorization"));
    v22 = objc_claimAutoreleasedReturnValue();
    transactionKeyCASDAuthorization = v5->_transactionKeyCASDAuthorization;
    v5->_transactionKeyCASDAuthorization = (NSData *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("progenitorKeyAttestation"));
    v24 = objc_claimAutoreleasedReturnValue();
    progenitorKeyCASDAttestation = v5->_progenitorKeyCASDAttestation;
    v5->_progenitorKeyCASDAttestation = (NSData *)v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("transactionKeyData"));
    v29 = objc_claimAutoreleasedReturnValue();
    transactionKeys = v5->_transactionKeys;
    v5->_transactionKeys = (NSArray *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverAttestedProvisioningData"));
    v31 = objc_claimAutoreleasedReturnValue();
    serverAttestedProvisioningData = v5->_serverAttestedProvisioningData;
    v5->_serverAttestedProvisioningData = (NSData *)v31;

  }
  return v5;
}

- (NSArray)authorizationKeyAttestation
{
  return self->_authorizationKeyAttestation;
}

- (NSArray)deviceEncryptionKeyAttestation
{
  return self->_deviceEncryptionKeyAttestation;
}

- (NSData)deviceEncryptionKeyAuthorization
{
  return self->_deviceEncryptionKeyAuthorization;
}

- (NSData)transactionKeyCASDAttestation
{
  return self->_transactionKeyCASDAttestation;
}

- (NSData)transactionKeyCASDSignature
{
  return self->_transactionKeyCASDSignature;
}

- (NSData)transactionKeyCASDAuthorization
{
  return self->_transactionKeyCASDAuthorization;
}

- (NSData)progenitorKeyCASDAttestation
{
  return self->_progenitorKeyCASDAttestation;
}

- (NSArray)transactionKeys
{
  return self->_transactionKeys;
}

- (NSData)serverAttestedProvisioningData
{
  return self->_serverAttestedProvisioningData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverAttestedProvisioningData, 0);
  objc_storeStrong((id *)&self->_transactionKeys, 0);
  objc_storeStrong((id *)&self->_progenitorKeyCASDAttestation, 0);
  objc_storeStrong((id *)&self->_transactionKeyCASDAuthorization, 0);
  objc_storeStrong((id *)&self->_transactionKeyCASDSignature, 0);
  objc_storeStrong((id *)&self->_transactionKeyCASDAttestation, 0);
  objc_storeStrong((id *)&self->_deviceEncryptionKeyAuthorization, 0);
  objc_storeStrong((id *)&self->_deviceEncryptionKeyAttestation, 0);
  objc_storeStrong((id *)&self->_authorizationKeyAttestation, 0);
}

@end
