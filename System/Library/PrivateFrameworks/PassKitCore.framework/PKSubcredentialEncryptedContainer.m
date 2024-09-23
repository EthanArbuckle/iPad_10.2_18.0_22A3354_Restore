@implementation PKSubcredentialEncryptedContainer

- (PKSubcredentialEncryptedContainer)initWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PKSubcredentialEncryptedContainer *v11;

  v4 = a3;
  objc_msgSend(v4, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ephemeralPublicKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hexEncoding");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "publicKeyHash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hexEncoding");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encryptedRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[PKSubcredentialEncryptedContainer initWithEncryptionScheme:ephemeralPublicKey:publicKeyHash:data:](self, "initWithEncryptionScheme:ephemeralPublicKey:publicKeyHash:data:", v5, v7, v9, v10);
  return v11;
}

- (PKSubcredentialEncryptedContainer)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKSubcredentialEncryptedContainer *v10;

  v4 = a3;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("ephemeralPublicKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("publicKeyHash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("data"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 1);
  else
    v9 = 0;
  v10 = -[PKSubcredentialEncryptedContainer initWithEncryptionScheme:ephemeralPublicKey:publicKeyHash:data:](self, "initWithEncryptionScheme:ephemeralPublicKey:publicKeyHash:data:", v5, v6, v7, v9);

  return v10;
}

- (PKSubcredentialEncryptedContainer)initWithEncryptionScheme:(id)a3 ephemeralPublicKey:(id)a4 publicKeyHash:(id)a5 data:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKSubcredentialEncryptedContainer *v15;
  PKSubcredentialEncryptedContainer *v16;
  NSString **p_ephemeralPublicKey;
  NSString **p_publicKeyHash;
  NSData **p_data;
  NSString *encryptionScheme;
  PKSubcredentialEncryptedContainer *v21;
  NSObject *v22;
  NSString *v23;
  NSString *v24;
  NSData *v25;
  int v27;
  NSString *v28;
  __int16 v29;
  NSString *v30;
  __int16 v31;
  NSString *v32;
  __int16 v33;
  NSData *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = -[PKSubcredentialEncryptedContainer init](self, "init");
  v16 = v15;
  if (!v15)
    goto LABEL_6;
  objc_storeStrong((id *)&v15->_encryptionScheme, a3);
  p_ephemeralPublicKey = &v16->_ephemeralPublicKey;
  objc_storeStrong((id *)&v16->_ephemeralPublicKey, a4);
  p_publicKeyHash = &v16->_publicKeyHash;
  objc_storeStrong((id *)&v16->_publicKeyHash, a5);
  p_data = &v16->_data;
  objc_storeStrong((id *)&v16->_data, a6);
  encryptionScheme = v16->_encryptionScheme;
  if (!encryptionScheme)
    goto LABEL_7;
  if (*p_ephemeralPublicKey && *p_publicKeyHash && *p_data)
  {
LABEL_6:
    v21 = v16;
  }
  else
  {
LABEL_7:
    PKLogFacilityTypeGetObject(0x16uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *p_ephemeralPublicKey;
      v24 = *p_publicKeyHash;
      v25 = *p_data;
      v27 = 138413058;
      v28 = encryptionScheme;
      v29 = 2112;
      v30 = v23;
      v31 = 2112;
      v32 = v24;
      v33 = 2112;
      v34 = v25;
      _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "Received invalid encrypted request: version %@, ephemeral public key: %@, public key hash: %@, data: %@", (uint8_t *)&v27, 0x2Au);
    }

    v21 = 0;
  }

  return v21;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; encryptionScheme: %@; ephemeralPublicKey: %@; publicKeyHash: %@; data: %@ >"),
               objc_opt_class(),
               self,
               self->_encryptionScheme,
               self->_ephemeralPublicKey,
               self->_publicKeyHash,
               self->_data);
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKSubcredentialEncryptedContainer *v5;
  uint64_t v6;
  NSString *encryptionScheme;
  uint64_t v8;
  NSString *ephemeralPublicKey;
  uint64_t v10;
  NSString *publicKeyHash;
  uint64_t v12;
  NSData *data;

  v5 = objc_alloc_init(PKSubcredentialEncryptedContainer);
  v6 = -[NSString copyWithZone:](self->_encryptionScheme, "copyWithZone:", a3);
  encryptionScheme = v5->_encryptionScheme;
  v5->_encryptionScheme = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_ephemeralPublicKey, "copyWithZone:", a3);
  ephemeralPublicKey = v5->_ephemeralPublicKey;
  v5->_ephemeralPublicKey = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_publicKeyHash, "copyWithZone:", a3);
  publicKeyHash = v5->_publicKeyHash;
  v5->_publicKeyHash = (NSString *)v10;

  v12 = -[NSData copyWithZone:](self->_data, "copyWithZone:", a3);
  data = v5->_data;
  v5->_data = (NSData *)v12;

  return v5;
}

- (NSData)rawEphemeralPublicKey
{
  return (NSData *)-[NSString pk_decodeHexadecimal](self->_ephemeralPublicKey, "pk_decodeHexadecimal");
}

- (id)dictionaryRepresentation
{
  NSString *encryptionScheme;
  NSString *ephemeralPublicKey;
  NSString *publicKeyHash;
  NSData *data;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  encryptionScheme = self->_encryptionScheme;
  if (!encryptionScheme)
    return 0;
  ephemeralPublicKey = self->_ephemeralPublicKey;
  if (!ephemeralPublicKey)
    return 0;
  publicKeyHash = self->_publicKeyHash;
  if (!publicKeyHash)
    return 0;
  data = self->_data;
  if (!data)
    return 0;
  v9[0] = CFSTR("version");
  v9[1] = CFSTR("ephemeralPublicKey");
  v10[0] = encryptionScheme;
  v10[1] = ephemeralPublicKey;
  v10[2] = publicKeyHash;
  v9[2] = CFSTR("publicKeyHash");
  v9[3] = CFSTR("data");
  -[NSData base64EncodedStringWithOptions:](data, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *encryptionScheme;
  id v5;

  encryptionScheme = self->_encryptionScheme;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", encryptionScheme, CFSTR("encryptionScheme"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ephemeralPublicKey, CFSTR("ephemeralPublicKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_publicKeyHash, CFSTR("publicKeyHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_data, CFSTR("data"));

}

- (PKSubcredentialEncryptedContainer)initWithCoder:(id)a3
{
  id v4;
  PKSubcredentialEncryptedContainer *v5;
  uint64_t v6;
  NSString *encryptionScheme;
  uint64_t v8;
  NSString *ephemeralPublicKey;
  uint64_t v10;
  NSString *publicKeyHash;
  uint64_t v12;
  NSData *data;
  NSString *v14;
  PKSubcredentialEncryptedContainer *v15;
  NSObject *v16;
  NSString *v17;
  NSString *v18;
  NSData *v19;
  int v21;
  NSString *v22;
  __int16 v23;
  NSString *v24;
  __int16 v25;
  NSString *v26;
  __int16 v27;
  NSData *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PKSubcredentialEncryptedContainer init](self, "init");
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptionScheme"));
  v6 = objc_claimAutoreleasedReturnValue();
  encryptionScheme = v5->_encryptionScheme;
  v5->_encryptionScheme = (NSString *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ephemeralPublicKey"));
  v8 = objc_claimAutoreleasedReturnValue();
  ephemeralPublicKey = v5->_ephemeralPublicKey;
  v5->_ephemeralPublicKey = (NSString *)v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKeyHash"));
  v10 = objc_claimAutoreleasedReturnValue();
  publicKeyHash = v5->_publicKeyHash;
  v5->_publicKeyHash = (NSString *)v10;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v12 = objc_claimAutoreleasedReturnValue();
  data = v5->_data;
  v5->_data = (NSData *)v12;

  v14 = v5->_encryptionScheme;
  if (!v14)
    goto LABEL_7;
  if (v5->_ephemeralPublicKey && v5->_publicKeyHash && v5->_data)
  {
LABEL_6:
    v15 = v5;
  }
  else
  {
LABEL_7:
    PKLogFacilityTypeGetObject(0x16uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v5->_ephemeralPublicKey;
      v18 = v5->_publicKeyHash;
      v19 = v5->_data;
      v21 = 138413058;
      v22 = v14;
      v23 = 2112;
      v24 = v17;
      v25 = 2112;
      v26 = v18;
      v27 = 2112;
      v28 = v19;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Decoded invalid data: encryptionScheme %@, ephemeral public key: %@, public key hash: %@, data: %@", (uint8_t *)&v21, 0x2Au);
    }

    v15 = 0;
  }

  return v15;
}

- (NSString)encryptionScheme
{
  return self->_encryptionScheme;
}

- (NSString)ephemeralPublicKey
{
  return self->_ephemeralPublicKey;
}

- (NSString)publicKeyHash
{
  return self->_publicKeyHash;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);
  objc_storeStrong((id *)&self->_encryptionScheme, 0);
}

@end
