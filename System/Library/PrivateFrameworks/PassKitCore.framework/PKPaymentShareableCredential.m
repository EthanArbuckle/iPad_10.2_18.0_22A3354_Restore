@implementation PKPaymentShareableCredential

- (PKPaymentShareableCredential)initWithEncryptedProvisioningTarget:(id)a3 provisioningSharingIdentifier:(id)a4 passThumbnailImageData:(id)a5
{
  return -[PKPaymentShareableCredential initWithEncryptedProvisioningTarget:provisioningSharingIdentifier:passThumbnailImageData:isBackgroundProvisioning:](self, "initWithEncryptedProvisioningTarget:provisioningSharingIdentifier:passThumbnailImageData:isBackgroundProvisioning:", a3, a4, a5, 0);
}

- (PKPaymentShareableCredential)initWithProvisioningSharingIdentifier:(id)a3 isBackgroundProvisioning:(BOOL)a4
{
  return -[PKPaymentShareableCredential initWithEncryptedProvisioningTarget:provisioningSharingIdentifier:passThumbnailImageData:isBackgroundProvisioning:](self, "initWithEncryptedProvisioningTarget:provisioningSharingIdentifier:passThumbnailImageData:isBackgroundProvisioning:", 0, a3, 0, a4);
}

- (PKPaymentShareableCredential)initWithEncryptedProvisioningTarget:(id)a3 provisioningSharingIdentifier:(id)a4 passThumbnailImageData:(id)a5 isBackgroundProvisioning:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  PKPaymentShareableCredential *v14;
  PKPaymentShareableCredential *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentShareableCredential;
  v14 = -[PKPaymentCredential init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_sharingInstanceIdentifier, a4);
    objc_storeStrong((id *)&v15->_encryptedProvisioningTarget, a3);
    objc_storeStrong((id *)&v15->_passThumbnailImageData, a5);
    v15->_backgroundProvisioning = a6;
    -[PKPaymentCredential setCardType:](v15, "setCardType:", 3);
  }

  return v15;
}

- (PKPaymentShareableCredential)initWithCoder:(id)a3
{
  id v4;
  PKPaymentShareableCredential *v5;
  uint64_t v6;
  NSString *sharingInstanceIdentifier;
  uint64_t v8;
  PKEncryptedPushProvisioningTarget *encryptedProvisioningTarget;
  uint64_t v10;
  NSData *passThumbnailImageData;
  uint64_t v12;
  NSData *externalizedAuth;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentShareableCredential;
  v5 = -[PKPaymentCredential initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingInstanceIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    sharingInstanceIdentifier = v5->_sharingInstanceIdentifier;
    v5->_sharingInstanceIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptedProvisioningTarget"));
    v8 = objc_claimAutoreleasedReturnValue();
    encryptedProvisioningTarget = v5->_encryptedProvisioningTarget;
    v5->_encryptedProvisioningTarget = (PKEncryptedPushProvisioningTarget *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passThumbnailImageData"));
    v10 = objc_claimAutoreleasedReturnValue();
    passThumbnailImageData = v5->_passThumbnailImageData;
    v5->_passThumbnailImageData = (NSData *)v10;

    v5->_backgroundProvisioning = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("backgroundProvisioning"));
    v5->_source = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalizedAuth"));
    v12 = objc_claimAutoreleasedReturnValue();
    externalizedAuth = v5->_externalizedAuth;
    v5->_externalizedAuth = (NSData *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentShareableCredential;
  v4 = a3;
  -[PKPaymentCredential encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sharingInstanceIdentifier, CFSTR("sharingInstanceIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_encryptedProvisioningTarget, CFSTR("encryptedProvisioningTarget"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_passThumbnailImageData, CFSTR("passThumbnailImageData"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_backgroundProvisioning, CFSTR("backgroundProvisioning"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_source, CFSTR("source"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_externalizedAuth, CFSTR("externalizedAuth"));

}

- (id)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("encryptedProvisioningTarget: '%@'; "), self->_encryptedProvisioningTarget);
  objc_msgSend(v3, "appendFormat:", CFSTR("sharingInstanceIdentifier: '%@'; "), self->_sharingInstanceIdentifier);
  if (self->_backgroundProvisioning)
    v4 = CFSTR("Yes");
  else
    v4 = CFSTR("No");
  objc_msgSend(v3, "appendFormat:", CFSTR("backgroundProvisioning: '%@'; "), v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("source: '%lu'; "), self->_source);
  if (self->_externalizedAuth)
    v5 = CFSTR("Yes");
  else
    v5 = CFSTR("No");
  objc_msgSend(v3, "appendFormat:", CFSTR("hasExternalizedAuth: '%@'; "), v5);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_encryptedProvisioningTarget);
  objc_msgSend(v3, "safelyAddObject:", self->_sharingInstanceIdentifier);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_source - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentShareableCredential *v4;
  BOOL v5;

  v4 = (PKPaymentShareableCredential *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PKPaymentShareableCredential _isEqualToCredential:](self, "_isEqualToCredential:", v4);
  }

  return v5;
}

- (BOOL)_isEqualToCredential:(id)a3
{
  _QWORD *v4;
  PKEncryptedPushProvisioningTarget *encryptedProvisioningTarget;
  PKEncryptedPushProvisioningTarget *v6;
  BOOL v7;
  NSString *sharingInstanceIdentifier;
  NSString *v9;
  BOOL v10;
  BOOL v11;

  v4 = a3;
  if (!v4)
    goto LABEL_16;
  encryptedProvisioningTarget = self->_encryptedProvisioningTarget;
  v6 = (PKEncryptedPushProvisioningTarget *)v4[14];
  if (encryptedProvisioningTarget)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (encryptedProvisioningTarget != v6)
      goto LABEL_16;
  }
  else if (!-[PKEncryptedPushProvisioningTarget isEqual:](encryptedProvisioningTarget, "isEqual:"))
  {
    goto LABEL_16;
  }
  sharingInstanceIdentifier = self->_sharingInstanceIdentifier;
  v9 = (NSString *)v4[15];
  if (sharingInstanceIdentifier)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    if (sharingInstanceIdentifier == v9)
    {
LABEL_19:
      v11 = self->_source == v4[17];
      goto LABEL_17;
    }
  }
  else if ((-[NSString isEqual:](sharingInstanceIdentifier, "isEqual:") & 1) != 0)
  {
    goto LABEL_19;
  }
LABEL_16:
  v11 = 0;
LABEL_17:

  return v11;
}

- (BOOL)supportsSuperEasyProvisioning
{
  return 1;
}

- (PKEncryptedPushProvisioningTarget)encryptedProvisioningTarget
{
  return self->_encryptedProvisioningTarget;
}

- (NSString)sharingInstanceIdentifier
{
  return self->_sharingInstanceIdentifier;
}

- (NSData)passThumbnailImageData
{
  return self->_passThumbnailImageData;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (BOOL)isBackgroundProvisioning
{
  return self->_backgroundProvisioning;
}

- (NSData)externalizedAuth
{
  return self->_externalizedAuth;
}

- (void)setExternalizedAuth:(id)a3
{
  objc_storeStrong((id *)&self->_externalizedAuth, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalizedAuth, 0);
  objc_storeStrong((id *)&self->_passThumbnailImageData, 0);
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_encryptedProvisioningTarget, 0);
}

@end
