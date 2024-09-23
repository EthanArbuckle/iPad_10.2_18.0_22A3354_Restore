@implementation PKEncryptedPushProvisioningTarget

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData hexEncoding](self->_publicKeyHash, "hexEncoding");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("publicKeyHash: '%@'; "), v4);

  -[NSData base64EncodedStringWithOptions:](self->_ephemeralPublicKey, "base64EncodedStringWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("ephemeralPublicKey: '%@'; "), v5);

  -[NSData description](self->_data, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("data: '%@'; "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("source: '%ld'; "), self->_source);
  objc_msgSend(v3, "appendFormat:", CFSTR("status: '%ld'; "), self->_status);
  objc_msgSend(v3, "appendFormat:", CFSTR("targetDevice: '%ld'; "), self->_targetDevice);
  objc_msgSend(v3, "appendFormat:", CFSTR("verificationCode: '%@'; "), self->_verificationCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("secondarySource: '%@'; "), self->_secondarySource);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKEncryptedPushProvisioningTarget)initWithCoder:(id)a3
{
  id v4;
  PKEncryptedPushProvisioningTarget *v5;
  uint64_t v6;
  NSData *publicKeyHash;
  uint64_t v8;
  NSData *ephemeralPublicKey;
  uint64_t v10;
  NSData *data;
  uint64_t v12;
  NSString *verificationCode;
  uint64_t v14;
  NSString *secondarySource;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKEncryptedPushProvisioningTarget;
  v5 = -[PKEncryptedPushProvisioningTarget init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKeyHash"));
    v6 = objc_claimAutoreleasedReturnValue();
    publicKeyHash = v5->_publicKeyHash;
    v5->_publicKeyHash = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ephemeralPublicKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    ephemeralPublicKey = v5->_ephemeralPublicKey;
    v5->_ephemeralPublicKey = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptedProvisioningTarget"));
    v10 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v10;

    v5->_source = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source"));
    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    v5->_targetDevice = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("targetDevice"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("verificationCode"));
    v12 = objc_claimAutoreleasedReturnValue();
    verificationCode = v5->_verificationCode;
    v5->_verificationCode = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondarySource"));
    v14 = objc_claimAutoreleasedReturnValue();
    secondarySource = v5->_secondarySource;
    v5->_secondarySource = (NSString *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *publicKeyHash;
  id v5;

  publicKeyHash = self->_publicKeyHash;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", publicKeyHash, CFSTR("publicKeyHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ephemeralPublicKey, CFSTR("ephemeralPublicKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_data, CFSTR("encryptedProvisioningTarget"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_source, CFSTR("source"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_targetDevice, CFSTR("targetDevice"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_verificationCode, CFSTR("verificationCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondarySource, CFSTR("secondarySource"));

}

- (BOOL)isEqual:(id)a3
{
  PKEncryptedPushProvisioningTarget *v4;
  PKEncryptedPushProvisioningTarget *v5;
  BOOL v6;

  v4 = (PKEncryptedPushProvisioningTarget *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKEncryptedPushProvisioningTarget isEqualToEncryptedProvisioningTarget:](self, "isEqualToEncryptedProvisioningTarget:", v5);

  return v6;
}

- (BOOL)isEqualToEncryptedProvisioningTarget:(id)a3
{
  _QWORD *v4;
  NSData *ephemeralPublicKey;
  NSData *v6;
  BOOL v7;
  char v8;
  NSData *publicKeyHash;
  NSData *v10;
  NSData *data;
  NSData *v12;
  void *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  _BOOL4 v17;
  NSString *secondarySource;
  void *v20;
  NSString *v21;

  v4 = a3;
  if (!v4)
    goto LABEL_28;
  ephemeralPublicKey = self->_ephemeralPublicKey;
  v6 = (NSData *)v4[1];
  if (ephemeralPublicKey)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (ephemeralPublicKey != v6)
      goto LABEL_28;
  }
  else
  {
    v8 = -[NSData isEqual:](ephemeralPublicKey, "isEqual:");
    if ((v8 & 1) == 0)
      goto LABEL_28;
  }
  publicKeyHash = self->_publicKeyHash;
  v10 = (NSData *)v4[2];
  if (publicKeyHash && v10)
  {
    if ((-[NSData isEqual:](publicKeyHash, "isEqual:") & 1) == 0)
      goto LABEL_28;
  }
  else if (publicKeyHash != v10)
  {
    goto LABEL_28;
  }
  data = self->_data;
  v12 = (NSData *)v4[3];
  if (!data || !v12)
  {
    if (data == v12)
      goto LABEL_20;
LABEL_28:
    LOBYTE(v17) = 0;
    goto LABEL_29;
  }
  if ((-[NSData isEqual:](data, "isEqual:") & 1) == 0)
    goto LABEL_28;
LABEL_20:
  if (self->_status != v4[4] || self->_source != v4[5] || self->_targetDevice != v4[6])
    goto LABEL_28;
  v13 = (void *)v4[7];
  v14 = self->_verificationCode;
  v15 = v13;
  if (v14 == v15)
  {

    goto LABEL_31;
  }
  v16 = v15;
  LOBYTE(v17) = 0;
  if (!v14 || !v15)
  {
LABEL_36:

    goto LABEL_29;
  }
  v17 = -[NSString isEqualToString:](v14, "isEqualToString:", v15);

  if (v17)
  {
LABEL_31:
    secondarySource = self->_secondarySource;
    v20 = (void *)v4[8];
    v14 = secondarySource;
    v21 = v20;
    if (v14 == v21)
    {
      LOBYTE(v17) = 1;
      v16 = v14;
    }
    else
    {
      v16 = v21;
      LOBYTE(v17) = 0;
      if (v14 && v21)
        LOBYTE(v17) = -[NSString isEqualToString:](v14, "isEqualToString:", v21);
    }
    goto LABEL_36;
  }
LABEL_29:

  return v17;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_publicKeyHash);
  objc_msgSend(v3, "safelyAddObject:", self->_ephemeralPublicKey);
  objc_msgSend(v3, "safelyAddObject:", self->_data);
  objc_msgSend(v3, "safelyAddObject:", self->_verificationCode);
  objc_msgSend(v3, "safelyAddObject:", self->_secondarySource);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_source - v4 + 32 * v4;
  v6 = self->_targetDevice - v5 + 32 * v5;
  v7 = self->_status - v6 + 32 * v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_ephemeralPublicKey, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSData copyWithZone:](self->_publicKeyHash, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSData copyWithZone:](self->_data, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  *(_QWORD *)(v5 + 32) = self->_status;
  *(_QWORD *)(v5 + 40) = self->_source;
  *(_QWORD *)(v5 + 48) = self->_targetDevice;
  objc_storeStrong((id *)(v5 + 56), self->_verificationCode);
  objc_storeStrong((id *)(v5 + 64), self->_secondarySource);
  return (id)v5;
}

- (id)asWebServiceDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSData hexEncoding](self->_publicKeyHash, "hexEncoding");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("publicKeyHash"));

  -[NSData base64EncodedStringWithOptions:](self->_ephemeralPublicKey, "base64EncodedStringWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("ephemeralPublicKey"));

  objc_msgSend(v3, "setObject:forKey:", CFSTR("EV_ECC_v3"), CFSTR("encryptionVersion"));
  -[NSData base64EncodedStringWithOptions:](self->_data, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("encryptedProvisioningTarget"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_verificationCode, CFSTR("verificationCode"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_secondarySource, CFSTR("secondarySource"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (NSData)ephemeralPublicKey
{
  return self->_ephemeralPublicKey;
}

- (void)setEphemeralPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)publicKeyHash
{
  return self->_publicKeyHash;
}

- (void)setPublicKeyHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (unint64_t)targetDevice
{
  return self->_targetDevice;
}

- (void)setTargetDevice:(unint64_t)a3
{
  self->_targetDevice = a3;
}

- (NSString)verificationCode
{
  return self->_verificationCode;
}

- (void)setVerificationCode:(id)a3
{
  objc_storeStrong((id *)&self->_verificationCode, a3);
}

- (NSString)secondarySource
{
  return self->_secondarySource;
}

- (void)setSecondarySource:(id)a3
{
  objc_storeStrong((id *)&self->_secondarySource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondarySource, 0);
  objc_storeStrong((id *)&self->_verificationCode, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);
}

@end
