@implementation PKEncryptedDataObject

- (id)asWebServiceDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t version;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSData base64EncodedStringWithOptions:](self->_publicKeyHash, "base64EncodedStringWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("publicKeyHash"));

  -[NSData base64EncodedStringWithOptions:](self->_ephemeralPublicKey, "base64EncodedStringWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("ephemeralPublicKey"));

  -[NSData base64EncodedStringWithOptions:](self->_data, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("data"));

  version = self->_version;
  v8 = CFSTR("Unknown");
  if (version)
    v8 = 0;
  if (version == 1)
    v9 = CFSTR("EC_v3");
  else
    v9 = v8;
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("version"));
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (PKEncryptedDataObject)initWithWebServiceDictionary:(id)a3
{
  id v4;
  void *v5;
  NSData *v6;
  NSData *publicKeyHash;
  void *v8;
  NSData *v9;
  NSData *ephemeralPublicKey;
  void *v11;
  NSData *v12;
  NSData *data;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  unint64_t v17;
  objc_super v19;

  v4 = a3;
  if (v4)
  {
    v19.receiver = self;
    v19.super_class = (Class)PKEncryptedDataObject;
    self = -[PKEncryptedDataObject init](&v19, sel_init);
    if (self)
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("publicKeyHash"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v5, 0);
        publicKeyHash = self->_publicKeyHash;
        self->_publicKeyHash = v6;

      }
      objc_msgSend(v4, "PKStringForKey:", CFSTR("ephemeralPublicKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 0);
        ephemeralPublicKey = self->_ephemeralPublicKey;
        self->_ephemeralPublicKey = v9;

      }
      objc_msgSend(v4, "PKStringForKey:", CFSTR("data"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v11, 0);
        data = self->_data;
        self->_data = v12;

      }
      objc_msgSend(v4, "PKStringForKey:", CFSTR("version"));
      v14 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v17 = 1;
      if (v14 != CFSTR("EC_v3"))
      {
        if (!v14
          || (v16 = -[__CFString caseInsensitiveCompare:](v14, "caseInsensitiveCompare:", CFSTR("EC_v3")),
              v15,
              v16))
        {
          v17 = 0;
        }
      }

      self->_version = v17;
    }
  }

  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKEncryptedDataObject)initWithCoder:(id)a3
{
  id v4;
  PKEncryptedDataObject *v5;
  uint64_t v6;
  NSData *publicKeyHash;
  uint64_t v8;
  NSData *ephemeralPublicKey;
  uint64_t v10;
  NSData *data;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKEncryptedDataObject;
  v5 = -[PKEncryptedDataObject init](&v14, sel_init);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v10 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_version = objc_msgSend(v12, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *publicKeyHash;
  id v5;
  id v6;

  publicKeyHash = self->_publicKeyHash;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", publicKeyHash, CFSTR("publicKeyHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ephemeralPublicKey, CFSTR("ephemeralPublicKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_data, CFSTR("data"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_version);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("version"));

}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (NSData)ephemeralPublicKey
{
  return self->_ephemeralPublicKey;
}

- (void)setEphemeralPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)publicKeyHash
{
  return self->_publicKeyHash;
}

- (void)setPublicKeyHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);
}

@end
