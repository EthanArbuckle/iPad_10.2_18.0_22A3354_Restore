@implementation PKNFCPayload

- (PKNFCPayload)initWithNFCDictionary:(id)a3
{
  id v4;
  PKNFCPayload *v5;
  uint64_t v6;
  NSString *message;
  void *v8;
  const __CFData *v9;
  CFDataRef v10;
  NSData *encryptionPublicKeyData;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKNFCPayload;
  v5 = -[PKNFCPayload init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("message"));
    v6 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("encryptionPublicKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (const __CFData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 0);
      v10 = PKCreatePublicKeyFromDER(v9);
      encryptionPublicKeyData = v5->_encryptionPublicKeyData;
      v5->_encryptionPublicKeyData = (NSData *)v10;

    }
    v5->_payloadState = 0;
    v5->_requiresAuthentication = objc_msgSend(v4, "PKBoolForKey:", CFSTR("requiresAuthentication"));

  }
  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_message);
  objc_msgSend(v3, "safelyAddObject:", self->_encryptionPublicKeyData);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_requiresAuthentication - v4 + 32 * v4;
  v6 = self->_payloadState - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKNFCPayload *v4;
  PKNFCPayload *v5;
  BOOL v6;

  v4 = (PKNFCPayload *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKNFCPayload isEqualToPKNFCPayload:](self, "isEqualToPKNFCPayload:", v5);

  return v6;
}

- (BOOL)isEqualToPKNFCPayload:(id)a3
{
  _QWORD *v4;
  NSString *message;
  NSString *v6;
  BOOL v7;
  NSData *encryptionPublicKeyData;
  NSData *v9;
  BOOL v10;

  v4 = a3;
  message = self->_message;
  v6 = (NSString *)v4[2];
  if (message)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (message != v6)
      goto LABEL_16;
  }
  else if ((-[NSString isEqual:](message, "isEqual:") & 1) == 0)
  {
    goto LABEL_16;
  }
  encryptionPublicKeyData = self->_encryptionPublicKeyData;
  v9 = (NSData *)v4[3];
  if (!encryptionPublicKeyData || !v9)
  {
    if (encryptionPublicKeyData == v9)
      goto LABEL_14;
LABEL_16:
    v10 = 0;
    goto LABEL_17;
  }
  if ((-[NSData isEqual:](encryptionPublicKeyData, "isEqual:") & 1) == 0)
    goto LABEL_16;
LABEL_14:
  if (self->_requiresAuthentication != *((unsigned __int8 *)v4 + 8))
    goto LABEL_16;
  v10 = self->_payloadState == v4[4];
LABEL_17:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = -[NSString copyWithZone:](self->_message, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_encryptionPublicKeyData, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  *((_BYTE *)v5 + 8) = self->_requiresAuthentication;
  v5[4] = self->_payloadState;
  return v5;
}

- (PKNFCPayload)initWithCoder:(id)a3
{
  id v4;
  PKNFCPayload *v5;
  uint64_t v6;
  NSString *message;
  uint64_t v8;
  NSData *encryptionPublicKeyData;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKNFCPayload;
  v5 = -[PKNFCPayload init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
    v6 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptionPublicKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    encryptionPublicKeyData = v5->_encryptionPublicKeyData;
    v5->_encryptionPublicKeyData = (NSData *)v8;

    v5->_requiresAuthentication = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresAuthentication"));
    v5->_payloadState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("payloadState"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *message;
  id v5;
  id v6;

  message = self->_message;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", message, CFSTR("message"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_encryptionPublicKeyData, CFSTR("encryptionPublicKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requiresAuthentication, CFSTR("requiresAuthentication"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_payloadState);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("payloadState"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = CFSTR("YES");
  if (!self->_requiresAuthentication)
    v5 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; Message: %@; Encryption Public Key: %@; Requires Authentication: %@; Payload State: %lu;>"),
               v4,
               self,
               self->_message,
               self->_encryptionPublicKeyData,
               v5,
               self->_payloadState);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)encryptionPublicKeyData
{
  return self->_encryptionPublicKeyData;
}

- (void)setEncryptionPublicKeyData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)requiresAuthentication
{
  return self->_requiresAuthentication;
}

- (void)setRequiresAuthentication:(BOOL)a3
{
  self->_requiresAuthentication = a3;
}

- (unint64_t)payloadState
{
  return self->_payloadState;
}

- (void)setPayloadState:(unint64_t)a3
{
  self->_payloadState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionPublicKeyData, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
