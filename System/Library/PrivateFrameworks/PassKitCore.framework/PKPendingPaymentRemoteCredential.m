@implementation PKPendingPaymentRemoteCredential

- (PKPendingPaymentRemoteCredential)init
{

  return 0;
}

- (id)initForDatabase
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPendingPaymentRemoteCredential;
  return -[PKPendingPaymentRemoteCredential init](&v3, sel_init);
}

- (PKPendingPaymentRemoteCredential)initWithRemoteCredential:(id)a3
{
  id v4;
  void *v5;
  PKPendingPaymentRemoteCredential *v6;
  uint64_t v7;
  NSString *passTypeIdentifier;
  uint64_t v9;
  NSString *passSerialNumber;
  uint64_t v11;
  NSString *sanitizedPrimaryAccountNumber;
  uint64_t v13;
  NSString *cardIdentifier;
  uint64_t v15;
  NSString *ownershipToken;
  uint64_t v17;
  NSURL *passURL;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *transferableFromDeviceSerialNumber;
  uint64_t v23;
  NSString *transferableFromDeviceIdentifier;
  void *v25;
  objc_super v27;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)PKPendingPaymentRemoteCredential;
  v6 = -[PKPendingProvisioning initWithUniqueIdentifier:status:](&v27, sel_initWithUniqueIdentifier_status_, v5, 1);

  if (v6)
  {
    objc_msgSend(v4, "passTypeIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    passTypeIdentifier = v6->_passTypeIdentifier;
    v6->_passTypeIdentifier = (NSString *)v7;

    objc_msgSend(v4, "serialNumber");
    v9 = objc_claimAutoreleasedReturnValue();
    passSerialNumber = v6->_passSerialNumber;
    v6->_passSerialNumber = (NSString *)v9;

    v6->_credentialType = objc_msgSend(v4, "credentialType");
    v6->_cardType = objc_msgSend(v4, "cardType");
    objc_msgSend(v4, "sanitizedPrimaryAccountNumber");
    v11 = objc_claimAutoreleasedReturnValue();
    sanitizedPrimaryAccountNumber = v6->_sanitizedPrimaryAccountNumber;
    v6->_sanitizedPrimaryAccountNumber = (NSString *)v11;

    objc_msgSend(v4, "identifier");
    v13 = objc_claimAutoreleasedReturnValue();
    cardIdentifier = v6->_cardIdentifier;
    v6->_cardIdentifier = (NSString *)v13;

    objc_msgSend(v4, "ownershipTokenIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    ownershipToken = v6->_ownershipToken;
    v6->_ownershipToken = (NSString *)v15;

    objc_msgSend(v4, "passURL");
    v17 = objc_claimAutoreleasedReturnValue();
    passURL = v6->_passURL;
    v6->_passURL = (NSURL *)v17;

    v6->_supportsSuperEasyProvisioning = objc_msgSend(v4, "supportsSuperEasyProvisioning");
    v6->_couldSupportSuperEasyProvisioning = objc_msgSend(v4, "couldSupportSuperEasyProvisioning");
    objc_msgSend(v4, "transferableFromDevices");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v20, "serialNumber");
      v21 = objc_claimAutoreleasedReturnValue();
      transferableFromDeviceSerialNumber = v6->_transferableFromDeviceSerialNumber;
      v6->_transferableFromDeviceSerialNumber = (NSString *)v21;

      objc_msgSend(v20, "identifier");
      v23 = objc_claimAutoreleasedReturnValue();
      transferableFromDeviceIdentifier = v6->_transferableFromDeviceIdentifier;
      v6->_transferableFromDeviceIdentifier = (NSString *)v23;

    }
    objc_msgSend(v4, "state");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPendingProvisioning setProvisioningState:](v6, "setProvisioningState:", v25);

  }
  return v6;
}

- (id)type
{
  return CFSTR("PaymentRemoteCredential");
}

- (id)credential
{
  PKPaymentRemoteCredential *v3;
  PKPaymentRemoteCredential *v4;
  PKExternalDestinationDevice *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = [PKPaymentRemoteCredential alloc];
  v4 = -[PKPaymentRemoteCredential initWithDictionary:](v3, "initWithDictionary:", MEMORY[0x1E0C9AA70]);
  -[PKPaymentRemoteCredential setPassTypeIdentifier:](v4, "setPassTypeIdentifier:", self->_passTypeIdentifier);
  -[PKPaymentRemoteCredential setSerialNumber:](v4, "setSerialNumber:", self->_passSerialNumber);
  -[PKPaymentCredential setCredentialType:](v4, "setCredentialType:", self->_credentialType);
  -[PKPaymentCredential setCardType:](v4, "setCardType:", self->_cardType);
  -[PKPaymentCredential setSanitizedPrimaryAccountNumber:](v4, "setSanitizedPrimaryAccountNumber:", self->_sanitizedPrimaryAccountNumber);
  -[PKPaymentRemoteCredential setIdentifier:](v4, "setIdentifier:", self->_cardIdentifier);
  -[PKPaymentRemoteCredential setOwnershipTokenIdentifier:](v4, "setOwnershipTokenIdentifier:", self->_ownershipToken);
  -[PKPaymentRemoteCredential setPassURL:](v4, "setPassURL:", self->_passURL);
  -[PKPaymentRemoteCredential setStatus:](v4, "setStatus:", 1);
  -[PKPaymentRemoteCredential setSupportsSuperEasyProvisioning:](v4, "setSupportsSuperEasyProvisioning:", self->_supportsSuperEasyProvisioning);
  -[PKPaymentRemoteCredential setCouldSupportSuperEasyProvisioning:](v4, "setCouldSupportSuperEasyProvisioning:", self->_couldSupportSuperEasyProvisioning);
  if (self->_transferableFromDeviceIdentifier && self->_transferableFromDeviceSerialNumber)
  {
    v5 = -[PKExternalDestinationDevice initWithIdentifier:serialNumber:]([PKExternalDestinationDevice alloc], "initWithIdentifier:serialNumber:", self->_transferableFromDeviceIdentifier, self->_transferableFromDeviceSerialNumber);
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRemoteCredential setTransferableFromDevices:](v4, "setTransferableFromDevices:", v6);

    -[PKPaymentRemoteCredential setStatus:](v4, "setStatus:", 5);
  }
  -[PKPendingProvisioning provisioningState](self, "provisioningState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PKPendingProvisioning provisioningState](self, "provisioningState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentCredential setState:](v4, "setState:", v8);

  }
  return v4;
}

- (BOOL)representsCredential:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *cardIdentifier;
  void *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  char v13;
  char v14;
  NSURL **p_passURL;
  NSURL *v16;
  NSURL *v17;
  NSURL *v18;

  v4 = a3;
  if (objc_msgSend(v4, "isRemoteCredential"))
  {
    objc_msgSend(v4, "remoteCredential");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 104;
    cardIdentifier = self->_cardIdentifier;
    if (!cardIdentifier)
    {
      p_passURL = &self->_passURL;
      if (!*p_passURL)
      {
        v14 = 0;
LABEL_24:

        goto LABEL_25;
      }
      goto LABEL_15;
    }
    objc_msgSend(v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_cardIdentifier;
    v7 = v9;
    v11 = v10;
    if ((NSString *)v7 == v11)
    {

    }
    else
    {
      v12 = v11;
      if (!v7 || !v11)
      {

LABEL_14:
        p_passURL = &self->_passURL;
        if (*p_passURL)
        {
LABEL_15:
          objc_msgSend(v6, "passURL");
          v16 = (NSURL *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          v18 = *p_passURL;
          if (v16 && v18)
            v14 = -[NSURL isEqual:](v16, "isEqual:");
          else
            v14 = v16 == v18;

          if (!cardIdentifier)
            goto LABEL_24;
          goto LABEL_23;
        }
        v14 = 0;
LABEL_23:

        goto LABEL_24;
      }
      v13 = objc_msgSend((id)v7, "isEqualToString:", v11);

      if ((v13 & 1) == 0)
        goto LABEL_14;
    }
    v14 = 1;
    goto LABEL_23;
  }
  v14 = 0;
LABEL_25:

  return v14;
}

- (BOOL)representsPass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  NSString *v12;
  NSString *v13;
  BOOL v14;
  char v15;

  v4 = a3;
  objc_msgSend(v4, "passTypeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serialNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSURL absoluteString](self->_passURL, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_passTypeIdentifier;
  v9 = v5;
  v10 = v9;
  if (v8 == v9)
  {

  }
  else
  {
    if (!v9 || !v8)
    {
      v13 = v9;
      goto LABEL_14;
    }
    v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

    if (!v11)
    {
LABEL_11:
      if (!v7)
        goto LABEL_17;
      goto LABEL_15;
    }
  }
  v8 = self->_passSerialNumber;
  v12 = v6;
  v13 = v12;
  if (v8 == v12)
  {

    goto LABEL_19;
  }
  if (v12 && v8)
  {
    v14 = -[NSString isEqualToString:](v8, "isEqualToString:", v12);

    if (!v14)
      goto LABEL_11;
LABEL_19:
    v15 = 1;
    goto LABEL_20;
  }
LABEL_14:

  if (!v7)
  {
LABEL_17:
    v15 = 0;
    goto LABEL_20;
  }
LABEL_15:
  if (!objc_msgSend(v7, "containsString:", v10))
    goto LABEL_17;
  v15 = objc_msgSend(v7, "containsString:", v6);
LABEL_20:

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPendingPaymentRemoteCredential)initWithCoder:(id)a3
{
  id v4;
  PKPendingPaymentRemoteCredential *v5;
  uint64_t v6;
  NSString *passTypeIdentifier;
  uint64_t v8;
  NSString *passSerialNumber;
  uint64_t v10;
  NSString *sanitizedPrimaryAccountNumber;
  uint64_t v12;
  NSString *cardIdentifier;
  uint64_t v14;
  NSString *ownershipToken;
  uint64_t v16;
  NSString *nonce;
  uint64_t v18;
  NSString *transferableFromDeviceSerialNumber;
  uint64_t v20;
  NSString *transferableFromDeviceIdentifier;
  uint64_t v22;
  NSURL *passURL;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKPendingPaymentRemoteCredential;
  v5 = -[PKPendingProvisioning initWithCoder:](&v25, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passTypeIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passSerialNumber"));
    v8 = objc_claimAutoreleasedReturnValue();
    passSerialNumber = v5->_passSerialNumber;
    v5->_passSerialNumber = (NSString *)v8;

    v5->_credentialType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("credentialType"));
    v5->_cardType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cardType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sanitizedPrimaryAccountNumber"));
    v10 = objc_claimAutoreleasedReturnValue();
    sanitizedPrimaryAccountNumber = v5->_sanitizedPrimaryAccountNumber;
    v5->_sanitizedPrimaryAccountNumber = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cardIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    cardIdentifier = v5->_cardIdentifier;
    v5->_cardIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownershipToken"));
    v14 = objc_claimAutoreleasedReturnValue();
    ownershipToken = v5->_ownershipToken;
    v5->_ownershipToken = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nonce"));
    v16 = objc_claimAutoreleasedReturnValue();
    nonce = v5->_nonce;
    v5->_nonce = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferableFromDeviceSerialNumber"));
    v18 = objc_claimAutoreleasedReturnValue();
    transferableFromDeviceSerialNumber = v5->_transferableFromDeviceSerialNumber;
    v5->_transferableFromDeviceSerialNumber = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferableFromDeviceIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    transferableFromDeviceIdentifier = v5->_transferableFromDeviceIdentifier;
    v5->_transferableFromDeviceIdentifier = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passURL"));
    v22 = objc_claimAutoreleasedReturnValue();
    passURL = v5->_passURL;
    v5->_passURL = (NSURL *)v22;

    v5->_supportsSuperEasyProvisioning = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsSuperEasyProvisioning"));
    v5->_couldSupportSuperEasyProvisioning = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("couldSupportSuperEasyProvisioning"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPendingPaymentRemoteCredential;
  v4 = a3;
  -[PKPendingProvisioning encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_passTypeIdentifier, CFSTR("passTypeIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_passSerialNumber, CFSTR("passSerialNumber"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_credentialType, CFSTR("credentialType"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_cardType, CFSTR("cardType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sanitizedPrimaryAccountNumber, CFSTR("sanitizedPrimaryAccountNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardIdentifier, CFSTR("cardIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_ownershipToken, CFSTR("ownershipToken"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_nonce, CFSTR("nonce"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transferableFromDeviceSerialNumber, CFSTR("transferableFromDeviceSerialNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transferableFromDeviceIdentifier, CFSTR("transferableFromDeviceIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_passURL, CFSTR("passURL"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsSuperEasyProvisioning, CFSTR("supportsSuperEasyProvisioning"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_couldSupportSuperEasyProvisioning, CFSTR("couldSupportSuperEasyProvisioning"));

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
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PKPendingPaymentRemoteCredential;
  v4 = a3;
  -[PKPendingProvisioning _copyIntoPendingProvision:](&v23, sel__copyIntoPendingProvision_, v4);
  v5 = -[NSString copy](self->_passTypeIdentifier, "copy", v23.receiver, v23.super_class);
  v6 = (void *)v4[8];
  v4[8] = v5;

  v7 = -[NSString copy](self->_passSerialNumber, "copy");
  v8 = (void *)v4[9];
  v4[9] = v7;

  v4[10] = self->_credentialType;
  v4[11] = self->_cardType;
  v9 = -[NSString copy](self->_sanitizedPrimaryAccountNumber, "copy");
  v10 = (void *)v4[12];
  v4[12] = v9;

  v11 = -[NSString copy](self->_cardIdentifier, "copy");
  v12 = (void *)v4[13];
  v4[13] = v11;

  v13 = -[NSString copy](self->_ownershipToken, "copy");
  v14 = (void *)v4[14];
  v4[14] = v13;

  v15 = -[NSString copy](self->_nonce, "copy");
  v16 = (void *)v4[15];
  v4[15] = v15;

  v17 = -[NSString copy](self->_transferableFromDeviceSerialNumber, "copy");
  v18 = (void *)v4[16];
  v4[16] = v17;

  v19 = -[NSString copy](self->_transferableFromDeviceIdentifier, "copy");
  v20 = (void *)v4[17];
  v4[17] = v19;

  v21 = -[NSURL copy](self->_passURL, "copy");
  v22 = (void *)v4[18];
  v4[18] = v21;

  *((_BYTE *)v4 + 56) = self->_supportsSuperEasyProvisioning;
  *((_BYTE *)v4 + 57) = self->_couldSupportSuperEasyProvisioning;

}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passTypeIdentifier, a3);
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_passSerialNumber, a3);
}

- (int64_t)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(int64_t)a3
{
  self->_credentialType = a3;
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (void)setCardType:(int64_t)a3
{
  self->_cardType = a3;
}

- (NSString)sanitizedPrimaryAccountNumber
{
  return self->_sanitizedPrimaryAccountNumber;
}

- (void)setSanitizedPrimaryAccountNumber:(id)a3
{
  objc_storeStrong((id *)&self->_sanitizedPrimaryAccountNumber, a3);
}

- (NSString)cardIdentifier
{
  return self->_cardIdentifier;
}

- (void)setCardIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cardIdentifier, a3);
}

- (NSString)ownershipToken
{
  return self->_ownershipToken;
}

- (void)setOwnershipToken:(id)a3
{
  objc_storeStrong((id *)&self->_ownershipToken, a3);
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_storeStrong((id *)&self->_nonce, a3);
}

- (NSString)transferableFromDeviceSerialNumber
{
  return self->_transferableFromDeviceSerialNumber;
}

- (void)setTransferableFromDeviceSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_transferableFromDeviceSerialNumber, a3);
}

- (NSString)transferableFromDeviceIdentifier
{
  return self->_transferableFromDeviceIdentifier;
}

- (void)setTransferableFromDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_transferableFromDeviceIdentifier, a3);
}

- (NSURL)passURL
{
  return self->_passURL;
}

- (void)setPassURL:(id)a3
{
  objc_storeStrong((id *)&self->_passURL, a3);
}

- (BOOL)supportsSuperEasyProvisioning
{
  return self->_supportsSuperEasyProvisioning;
}

- (void)setSupportsSuperEasyProvisioning:(BOOL)a3
{
  self->_supportsSuperEasyProvisioning = a3;
}

- (BOOL)couldSupportSuperEasyProvisioning
{
  return self->_couldSupportSuperEasyProvisioning;
}

- (void)setCouldSupportSuperEasyProvisioning:(BOOL)a3
{
  self->_couldSupportSuperEasyProvisioning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passURL, 0);
  objc_storeStrong((id *)&self->_transferableFromDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_transferableFromDeviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_ownershipToken, 0);
  objc_storeStrong((id *)&self->_cardIdentifier, 0);
  objc_storeStrong((id *)&self->_sanitizedPrimaryAccountNumber, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
}

@end
