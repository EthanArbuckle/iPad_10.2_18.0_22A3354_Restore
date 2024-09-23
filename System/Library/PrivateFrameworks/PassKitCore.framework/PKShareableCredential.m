@implementation PKShareableCredential

- (PKShareableCredential)initWithProtoCredential:(id)a3
{
  id v4;
  PKShareableCredential *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PKEncryptedPushProvisioningTarget *encryptedPushProvisioningTarget;
  uint64_t v10;
  NSString *cardConfigurationIdentifier;
  uint64_t v12;
  NSString *credentialIdentifier;
  uint64_t v14;
  NSString *credentialIdentifierHash;
  uint64_t v16;
  NSString *ownerDisplayName;
  uint64_t v18;
  NSString *sharingInstanceIdentifier;
  uint64_t v20;
  NSString *nonce;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKShareableCredential;
  v5 = -[PKShareableCredential init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "encryptedPushProvisioningTarget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pk_decodeHexadecimal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    encryptedPushProvisioningTarget = v5->_encryptedPushProvisioningTarget;
    v5->_encryptedPushProvisioningTarget = (PKEncryptedPushProvisioningTarget *)v8;

    v5->_status = (int)objc_msgSend(v4, "status");
    objc_msgSend(v4, "cardConfigurationIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    cardConfigurationIdentifier = v5->_cardConfigurationIdentifier;
    v5->_cardConfigurationIdentifier = (NSString *)v10;

    objc_msgSend(v4, "credentialIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    credentialIdentifier = v5->_credentialIdentifier;
    v5->_credentialIdentifier = (NSString *)v12;

    objc_msgSend(v4, "credentialIdentifierHash");
    v14 = objc_claimAutoreleasedReturnValue();
    credentialIdentifierHash = v5->_credentialIdentifierHash;
    v5->_credentialIdentifierHash = (NSString *)v14;

    objc_msgSend(v4, "ownerDisplayName");
    v16 = objc_claimAutoreleasedReturnValue();
    ownerDisplayName = v5->_ownerDisplayName;
    v5->_ownerDisplayName = (NSString *)v16;

    objc_msgSend(v4, "sharingInstanceIdentifier");
    v18 = objc_claimAutoreleasedReturnValue();
    sharingInstanceIdentifier = v5->_sharingInstanceIdentifier;
    v5->_sharingInstanceIdentifier = (NSString *)v18;

    objc_msgSend(v4, "nonce");
    v20 = objc_claimAutoreleasedReturnValue();
    nonce = v5->_nonce;
    v5->_nonce = (NSString *)v20;

  }
  return v5;
}

- (id)protoCredential
{
  PKProtobufShareableCredential *v3;
  PKEncryptedPushProvisioningTarget *encryptedPushProvisioningTarget;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(PKProtobufShareableCredential);
  encryptedPushProvisioningTarget = self->_encryptedPushProvisioningTarget;
  if (encryptedPushProvisioningTarget)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", encryptedPushProvisioningTarget, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hexEncoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufShareableCredential setEncryptedPushProvisioningTarget:](v3, "setEncryptedPushProvisioningTarget:", v6);

  }
  -[PKProtobufShareableCredential setStatus:](v3, "setStatus:", LODWORD(self->_status));
  -[PKProtobufShareableCredential setCardConfigurationIdentifier:](v3, "setCardConfigurationIdentifier:", self->_cardConfigurationIdentifier);
  -[PKProtobufShareableCredential setCredentialIdentifier:](v3, "setCredentialIdentifier:", self->_credentialIdentifier);
  -[PKProtobufShareableCredential setCredentialIdentifierHash:](v3, "setCredentialIdentifierHash:", self->_credentialIdentifierHash);
  -[PKProtobufShareableCredential setOwnerDisplayName:](v3, "setOwnerDisplayName:", self->_ownerDisplayName);
  -[PKProtobufShareableCredential setSharingInstanceIdentifier:](v3, "setSharingInstanceIdentifier:", self->_sharingInstanceIdentifier);
  -[PKProtobufShareableCredential setNonce:](v3, "setNonce:", self->_nonce);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKShareableCredential)initWithCoder:(id)a3
{
  id v4;
  PKShareableCredential *v5;
  uint64_t v6;
  PKEncryptedPushProvisioningTarget *encryptedPushProvisioningTarget;
  uint64_t v8;
  NSString *cardConfigurationIdentifier;
  uint64_t v10;
  NSString *credentialIdentifier;
  uint64_t v12;
  NSString *credentialIdentifierHash;
  uint64_t v14;
  NSString *ownerDisplayName;
  uint64_t v16;
  NSString *sharingInstanceIdentifier;
  uint64_t v18;
  NSString *nonce;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKShareableCredential;
  v5 = -[PKShareableCredential init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptedPushProvisioningTargetKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    encryptedPushProvisioningTarget = v5->_encryptedPushProvisioningTarget;
    v5->_encryptedPushProvisioningTarget = (PKEncryptedPushProvisioningTarget *)v6;

    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("statusKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cardConfigurationIdentifierKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    cardConfigurationIdentifier = v5->_cardConfigurationIdentifier;
    v5->_cardConfigurationIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifierKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    credentialIdentifier = v5->_credentialIdentifier;
    v5->_credentialIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifierHashKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    credentialIdentifierHash = v5->_credentialIdentifierHash;
    v5->_credentialIdentifierHash = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownerDisplayNameKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    ownerDisplayName = v5->_ownerDisplayName;
    v5->_ownerDisplayName = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingInstanceIdentifierKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    sharingInstanceIdentifier = v5->_sharingInstanceIdentifier;
    v5->_sharingInstanceIdentifier = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nonceKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    nonce = v5->_nonce;
    v5->_nonce = (NSString *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t status;
  id v5;

  status = self->_status;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", status, CFSTR("statusKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_encryptedPushProvisioningTarget, CFSTR("encryptedPushProvisioningTargetKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cardConfigurationIdentifier, CFSTR("cardConfigurationIdentifierKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialIdentifier, CFSTR("identifierKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialIdentifierHash, CFSTR("identifierHashKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ownerDisplayName, CFSTR("ownerDisplayNameKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharingInstanceIdentifier, CFSTR("sharingInstanceIdentifierKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nonce, CFSTR("nonceKey"));

}

- (BOOL)isEqual:(id)a3
{
  PKShareableCredential *v4;
  PKShareableCredential *v5;
  BOOL v6;

  v4 = (PKShareableCredential *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKShareableCredential isEqualToShareableCredential:](self, "isEqualToShareableCredential:", v5);

  return v6;
}

- (BOOL)isEqualToShareableCredential:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  void *v11;
  NSString *v12;
  PKEncryptedPushProvisioningTarget *encryptedPushProvisioningTarget;
  PKEncryptedPushProvisioningTarget *v14;
  void *v15;
  NSString *v16;
  NSString *cardConfigurationIdentifier;
  void *v18;
  NSString *v19;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)v4[4];
    v7 = self->_credentialIdentifier;
    v8 = v6;
    if (v7 == v8)
    {

    }
    else
    {
      v9 = v8;
      LOBYTE(v10) = 0;
      if (!v7 || !v8)
        goto LABEL_30;
      v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

      if (!v10)
        goto LABEL_31;
    }
    v11 = (void *)v5[5];
    v7 = self->_credentialIdentifierHash;
    v12 = v11;
    if (v7 == v12)
    {

    }
    else
    {
      v9 = v12;
      LOBYTE(v10) = 0;
      if (!v7 || !v12)
        goto LABEL_30;
      v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v12);

      if (!v10)
        goto LABEL_31;
    }
    encryptedPushProvisioningTarget = self->_encryptedPushProvisioningTarget;
    v14 = (PKEncryptedPushProvisioningTarget *)v5[1];
    if (encryptedPushProvisioningTarget && v14)
    {
      if (-[PKEncryptedPushProvisioningTarget isEqual:](encryptedPushProvisioningTarget, "isEqual:"))
      {
LABEL_17:
        v15 = (void *)v5[6];
        v7 = self->_sharingInstanceIdentifier;
        v16 = v15;
        if (v7 == v16)
        {

LABEL_25:
          cardConfigurationIdentifier = self->_cardConfigurationIdentifier;
          v18 = (void *)v5[7];
          v7 = cardConfigurationIdentifier;
          v19 = v18;
          if (v7 == v19)
          {
            LOBYTE(v10) = 1;
            v9 = v7;
          }
          else
          {
            v9 = v19;
            LOBYTE(v10) = 0;
            if (v7 && v19)
              LOBYTE(v10) = -[NSString isEqualToString:](v7, "isEqualToString:", v19);
          }
          goto LABEL_30;
        }
        v9 = v16;
        LOBYTE(v10) = 0;
        if (v7 && v16)
        {
          v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v16);

          if (!v10)
            goto LABEL_31;
          goto LABEL_25;
        }
LABEL_30:

        goto LABEL_31;
      }
    }
    else if (encryptedPushProvisioningTarget == v14)
    {
      goto LABEL_17;
    }
  }
  LOBYTE(v10) = 0;
LABEL_31:

  return v10;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_credentialIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_credentialIdentifierHash);
  objc_msgSend(v3, "safelyAddObject:", self->_encryptedPushProvisioningTarget);
  objc_msgSend(v3, "safelyAddObject:", self->_sharingInstanceIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_cardConfigurationIdentifier);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKPushProvisioningSharingStatusToString(self->_status);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("status: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("credential identifier hash: '%@'; "), self->_credentialIdentifierHash);
  objc_msgSend(v3, "appendFormat:", CFSTR("sharing instance identifier: '%@'; "), self->_sharingInstanceIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("display name: '%@'; "), self->_ownerDisplayName);
  objc_msgSend(v3, "appendFormat:", CFSTR("encrypted target: '%@'; "), self->_encryptedPushProvisioningTarget);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[PKEncryptedPushProvisioningTarget copyWithZone:](self->_encryptedPushProvisioningTarget, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v5[2] = self->_status;
  v8 = -[NSString copyWithZone:](self->_credentialIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSString copyWithZone:](self->_credentialIdentifierHash, "copyWithZone:", a3);
  v11 = (void *)v5[5];
  v5[5] = v10;

  v12 = -[NSString copyWithZone:](self->_sharingInstanceIdentifier, "copyWithZone:", a3);
  v13 = (void *)v5[6];
  v5[6] = v12;

  v14 = -[NSString copyWithZone:](self->_cardConfigurationIdentifier, "copyWithZone:", a3);
  v15 = (void *)v5[7];
  v5[7] = v14;

  v16 = -[NSString copyWithZone:](self->_ownerDisplayName, "copyWithZone:", a3);
  v17 = (void *)v5[3];
  v5[3] = v16;

  v18 = -[NSString copyWithZone:](self->_nonce, "copyWithZone:", a3);
  v19 = (void *)v5[8];
  v5[8] = v18;

  return v5;
}

- (PKEncryptedPushProvisioningTarget)encryptedPushProvisioningTarget
{
  return self->_encryptedPushProvisioningTarget;
}

- (void)setEncryptedPushProvisioningTarget:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (NSString)ownerDisplayName
{
  return self->_ownerDisplayName;
}

- (void)setOwnerDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_ownerDisplayName, a3);
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_credentialIdentifier, a3);
}

- (NSString)credentialIdentifierHash
{
  return self->_credentialIdentifierHash;
}

- (void)setCredentialIdentifierHash:(id)a3
{
  objc_storeStrong((id *)&self->_credentialIdentifierHash, a3);
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

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_storeStrong((id *)&self->_nonce, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_cardConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialIdentifierHash, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
  objc_storeStrong((id *)&self->_ownerDisplayName, 0);
  objc_storeStrong((id *)&self->_encryptedPushProvisioningTarget, 0);
}

@end
