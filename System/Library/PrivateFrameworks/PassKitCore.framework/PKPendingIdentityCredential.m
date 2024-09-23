@implementation PKPendingIdentityCredential

- (PKPendingIdentityCredential)init
{

  return 0;
}

- (id)initForDatabase
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPendingIdentityCredential;
  return -[PKPendingIdentityCredential init](&v3, sel_init);
}

- (PKPendingIdentityCredential)initWithIdentityCredential:(id)a3
{
  id v4;
  void *v5;
  PKPendingIdentityCredential *v6;
  uint64_t v7;
  PKIdentityProvisioningAttestations *attestations;
  uint64_t v9;
  NSString *credentialIdentifier;
  uint64_t v11;
  NSString *passTypeIdentifier;
  uint64_t v13;
  NSString *passSerialNumber;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "shareableMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKPendingIdentityCredential initWithShareableMetadata:](self, "initWithShareableMetadata:", v5);
  if (v6)
  {
    objc_msgSend(v4, "attestations");
    v7 = objc_claimAutoreleasedReturnValue();
    attestations = v6->_attestations;
    v6->_attestations = (PKIdentityProvisioningAttestations *)v7;

    objc_msgSend(v4, "isoCredentialIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    credentialIdentifier = v6->_credentialIdentifier;
    v6->_credentialIdentifier = (NSString *)v9;

    objc_msgSend(v4, "passTypeIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    passTypeIdentifier = v6->_passTypeIdentifier;
    v6->_passTypeIdentifier = (NSString *)v11;

    objc_msgSend(v4, "passSerialNumber");
    v13 = objc_claimAutoreleasedReturnValue();
    passSerialNumber = v6->_passSerialNumber;
    v6->_passSerialNumber = (NSString *)v13;

    objc_msgSend(v4, "state");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPendingProvisioning setProvisioningState:](v6, "setProvisioningState:", v15);

  }
  return v6;
}

- (PKPendingIdentityCredential)initWithShareableMetadata:(id)a3
{
  id v4;
  void *v5;
  PKPendingIdentityCredential *v6;
  PKPendingIdentityCredential *v7;
  uint64_t v8;
  NSString *cardConfigurationIdentifier;
  uint64_t v10;
  NSString *provisioningCredentialIdentifier;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "sharingInstanceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)PKPendingIdentityCredential;
  v6 = -[PKPendingProvisioning initWithUniqueIdentifier:status:](&v13, sel_initWithUniqueIdentifier_status_, v5, 1);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sharingInstanceIdentifier, v5);
    objc_msgSend(v4, "cardConfigurationIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    cardConfigurationIdentifier = v7->_cardConfigurationIdentifier;
    v7->_cardConfigurationIdentifier = (NSString *)v8;

    objc_msgSend(v4, "credentialIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    provisioningCredentialIdentifier = v7->_provisioningCredentialIdentifier;
    v7->_provisioningCredentialIdentifier = (NSString *)v10;

  }
  return v7;
}

- (id)type
{
  return CFSTR("IdentityCredential");
}

- (id)credential
{
  PKShareablePassMetadata *v3;
  PKPaymentIdentityCredential *v4;
  void *v5;
  void *v6;

  v3 = -[PKShareablePassMetadata initWithProvisioningCredentialIdentifier:cardConfigurationIdentifier:sharingInstanceIdentifier:]([PKShareablePassMetadata alloc], "initWithProvisioningCredentialIdentifier:cardConfigurationIdentifier:sharingInstanceIdentifier:", self->_provisioningCredentialIdentifier, self->_cardConfigurationIdentifier, self->_sharingInstanceIdentifier);
  v4 = -[PKPaymentIdentityCredential initWithShareablePassMetadata:isoCredentialIdentifier:]([PKPaymentIdentityCredential alloc], "initWithShareablePassMetadata:isoCredentialIdentifier:", v3, self->_credentialIdentifier);
  -[PKPaymentIdentityCredential setAttestations:](v4, "setAttestations:", self->_attestations);
  -[PKPaymentIdentityCredential setPassTypeIdentifier:](v4, "setPassTypeIdentifier:", self->_passTypeIdentifier);
  -[PKPaymentIdentityCredential setPassSerialNumber:](v4, "setPassSerialNumber:", self->_passSerialNumber);
  -[PKPaymentIdentityCredential setAccountKeyIdentifier:](v4, "setAccountKeyIdentifier:", self->_accountKeyIdentifier);
  -[PKPendingProvisioning provisioningState](self, "provisioningState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PKPendingProvisioning provisioningState](self, "provisioningState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentCredential setState:](v4, "setState:", v6);

  }
  return v4;
}

- (BOOL)representsCredential:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *passTypeIdentifier;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  void *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  void *v16;
  NSString *passSerialNumber;
  NSString *v18;
  NSString *v19;

  v4 = a3;
  if (objc_msgSend(v4, "isIdentityCredential"))
  {
    objc_msgSend(v4, "identityCredential");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "passTypeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    passTypeIdentifier = self->_passTypeIdentifier;
    v8 = v6;
    v9 = passTypeIdentifier;
    if (v8 == v9)
    {

LABEL_16:
      objc_msgSend(v5, "passSerialNumber");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
      passSerialNumber = self->_passSerialNumber;
      v10 = v16;
      v18 = passSerialNumber;
      if (v10 == v18)
      {
        LOBYTE(v11) = 1;
        v19 = v10;
      }
      else
      {
        v19 = v18;
        LOBYTE(v11) = 0;
        if (v10 && v18)
          LOBYTE(v11) = -[NSString isEqualToString:](v10, "isEqualToString:", v18);
      }
      v15 = v8;

      v8 = v10;
      goto LABEL_25;
    }
    v10 = v9;
    LOBYTE(v11) = 0;
    if (v8 && v9)
    {
      v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

      if (!v11)
        goto LABEL_26;
      goto LABEL_16;
    }
LABEL_14:
    v15 = v8;
LABEL_25:

    v8 = v15;
LABEL_26:

    goto LABEL_27;
  }
  if (objc_msgSend(v4, "isRemoteCredential"))
  {
    objc_msgSend(v4, "remoteCredential");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "passTypeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->_passTypeIdentifier;
    v8 = v12;
    v14 = v13;
    if (v8 == v14)
    {

    }
    else
    {
      v10 = v14;
      LOBYTE(v11) = 0;
      if (!v8 || !v14)
        goto LABEL_14;
      v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v14);

      if (!v11)
        goto LABEL_26;
    }
    objc_msgSend(v5, "serialNumber");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  LOBYTE(v11) = 0;
LABEL_27:

  return v11;
}

- (BOOL)representsPass:(id)a3
{
  id v4;
  void *v5;
  NSString *passTypeIdentifier;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  BOOL v11;
  void *v12;
  NSString *passSerialNumber;
  NSString *v14;
  NSString *v15;
  BOOL v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSString *credentialIdentifier;
  NSString *v28;
  NSString *v29;
  NSString *v30;
  BOOL v31;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "isIdentityPass"))
  {
    v11 = 0;
    goto LABEL_39;
  }
  objc_msgSend(v4, "passTypeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  passTypeIdentifier = self->_passTypeIdentifier;
  v7 = v5;
  v8 = passTypeIdentifier;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {
      v17 = v7;
      goto LABEL_18;
    }
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_19;
  }
  objc_msgSend(v4, "serialNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  passSerialNumber = self->_passSerialNumber;
  v9 = v12;
  v14 = passSerialNumber;
  if (v9 == v14)
  {

    goto LABEL_16;
  }
  v15 = v14;
  if (v9 && v14)
  {
    v16 = -[NSString isEqualToString:](v9, "isEqualToString:", v14);

    if (!v16)
      goto LABEL_20;
LABEL_16:
    v11 = 1;
    goto LABEL_39;
  }

  v17 = v9;
LABEL_18:

LABEL_19:
LABEL_20:
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v33 = v4;
  objc_msgSend(v4, "devicePaymentApplications");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v35 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (objc_msgSend(v23, "paymentType") == 1005)
        {
          objc_msgSend(v23, "subcredentials");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "anyObject");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            credentialIdentifier = self->_credentialIdentifier;
            v28 = v26;
            v29 = credentialIdentifier;
            if (v28 == v29)
            {

LABEL_37:
              v11 = 1;
              goto LABEL_38;
            }
            v30 = v29;
            if (v29)
            {
              v31 = -[NSString isEqualToString:](v28, "isEqualToString:", v29);

              if (v31)
                goto LABEL_37;
            }
            else
            {

            }
          }

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v20)
        continue;
      break;
    }
  }

  v11 = 0;
LABEL_38:
  v4 = v33;
LABEL_39:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPendingIdentityCredential)initWithCoder:(id)a3
{
  id v4;
  PKPendingIdentityCredential *v5;
  uint64_t v6;
  NSString *sharingInstanceIdentifier;
  uint64_t v8;
  NSString *cardConfigurationIdentifier;
  uint64_t v10;
  NSString *provisioningCredentialIdentifier;
  uint64_t v12;
  NSString *credentialIdentifier;
  uint64_t v14;
  NSString *passSerialNumber;
  uint64_t v16;
  NSString *passTypeIdentifier;
  uint64_t v18;
  NSString *accountKeyIdentifier;
  uint64_t v20;
  PKIdentityProvisioningAttestations *attestations;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKPendingIdentityCredential;
  v5 = -[PKPendingProvisioning initWithCoder:](&v23, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingInstanceIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    sharingInstanceIdentifier = v5->_sharingInstanceIdentifier;
    v5->_sharingInstanceIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cardConfigurationIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    cardConfigurationIdentifier = v5->_cardConfigurationIdentifier;
    v5->_cardConfigurationIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provisioningCredentialIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    provisioningCredentialIdentifier = v5->_provisioningCredentialIdentifier;
    v5->_provisioningCredentialIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    credentialIdentifier = v5->_credentialIdentifier;
    v5->_credentialIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passSerialNumber"));
    v14 = objc_claimAutoreleasedReturnValue();
    passSerialNumber = v5->_passSerialNumber;
    v5->_passSerialNumber = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passTypeIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountKeyIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    accountKeyIdentifier = v5->_accountKeyIdentifier;
    v5->_accountKeyIdentifier = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attestations"));
    v20 = objc_claimAutoreleasedReturnValue();
    attestations = v5->_attestations;
    v5->_attestations = (PKIdentityProvisioningAttestations *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPendingIdentityCredential;
  v4 = a3;
  -[PKPendingProvisioning encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sharingInstanceIdentifier, CFSTR("sharingInstanceIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_credentialIdentifier, CFSTR("credentialIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardConfigurationIdentifier, CFSTR("cardConfigurationIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_provisioningCredentialIdentifier, CFSTR("provisioningCredentialIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_passSerialNumber, CFSTR("passSerialNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_passTypeIdentifier, CFSTR("passTypeIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountKeyIdentifier, CFSTR("accountKeyIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_attestations, CFSTR("attestations"));

}

- (void)_copyIntoPendingProvision:(id)a3
{
  id v4;
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
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PKPendingIdentityCredential;
  v4 = a3;
  -[PKPendingProvisioning _copyIntoPendingProvision:](&v19, sel__copyIntoPendingProvision_, v4);
  v5 = -[NSString copy](self->_sharingInstanceIdentifier, "copy", v19.receiver, v19.super_class);
  v6 = (void *)*((_QWORD *)v4 + 7);
  *((_QWORD *)v4 + 7) = v5;

  v7 = -[NSString copy](self->_cardConfigurationIdentifier, "copy");
  v8 = (void *)*((_QWORD *)v4 + 8);
  *((_QWORD *)v4 + 8) = v7;

  v9 = -[NSString copy](self->_provisioningCredentialIdentifier, "copy");
  v10 = (void *)*((_QWORD *)v4 + 9);
  *((_QWORD *)v4 + 9) = v9;

  v11 = -[NSString copy](self->_credentialIdentifier, "copy");
  v12 = (void *)*((_QWORD *)v4 + 10);
  *((_QWORD *)v4 + 10) = v11;

  v13 = -[NSString copy](self->_passSerialNumber, "copy");
  v14 = (void *)*((_QWORD *)v4 + 11);
  *((_QWORD *)v4 + 11) = v13;

  v15 = -[NSString copy](self->_passTypeIdentifier, "copy");
  v16 = (void *)*((_QWORD *)v4 + 12);
  *((_QWORD *)v4 + 12) = v15;

  v17 = -[NSString copy](self->_accountKeyIdentifier, "copy");
  v18 = (void *)*((_QWORD *)v4 + 13);
  *((_QWORD *)v4 + 13) = v17;

  objc_storeStrong((id *)v4 + 14, self->_attestations);
}

- (NSString)sharingInstanceIdentifier
{
  return self->_sharingInstanceIdentifier;
}

- (void)setSharingInstanceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, a3);
}

- (NSString)cardConfigurationIdentifier
{
  return self->_cardConfigurationIdentifier;
}

- (void)setCardConfigurationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cardConfigurationIdentifier, a3);
}

- (NSString)provisioningCredentialIdentifier
{
  return self->_provisioningCredentialIdentifier;
}

- (void)setProvisioningCredentialIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningCredentialIdentifier, a3);
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_credentialIdentifier, a3);
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)accountKeyIdentifier
{
  return self->_accountKeyIdentifier;
}

- (void)setAccountKeyIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
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
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
  objc_storeStrong((id *)&self->_provisioningCredentialIdentifier, 0);
  objc_storeStrong((id *)&self->_cardConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, 0);
}

@end
