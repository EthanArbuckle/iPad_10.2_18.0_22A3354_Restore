@implementation PKPassAuxiliaryCapabilitySignatureAliroHydraKeyCreationMetadata

- (PKPassAuxiliaryCapabilitySignatureAliroHydraKeyCreationMetadata)initWithDictionary:(id)a3
{
  id v4;
  PKPassAuxiliaryCapabilitySignatureAliroHydraKeyCreationMetadata *v5;
  void *v6;
  uint64_t v7;
  NSData *readerIdentifier;
  void *v9;
  uint64_t v10;
  NSData *readerPublicKey;
  uint64_t v12;
  NSDictionary *serverParameters;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPassAuxiliaryCapabilitySignatureAliroHydraKeyCreationMetadata;
  v5 = -[PKPassAuxiliaryCapabilityKeyCreationMetadata initWithDictionary:](&v15, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("readerGroupIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pk_decodeHexadecimal");
    v7 = objc_claimAutoreleasedReturnValue();
    readerIdentifier = v5->_readerIdentifier;
    v5->_readerIdentifier = (NSData *)v7;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("readerGroupPublicKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v9, 0);
      readerPublicKey = v5->_readerPublicKey;
      v5->_readerPublicKey = (NSData *)v10;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("serverParameters"));
    v12 = objc_claimAutoreleasedReturnValue();
    serverParameters = v5->_serverParameters;
    v5->_serverParameters = (NSDictionary *)v12;

    if (!v5->_readerIdentifier || !v5->_readerPublicKey || !v5->_serverParameters)
    {

      v5 = 0;
    }

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = -[PKPassAuxiliaryCapabilityKeyCreationMetadata _init]([PKPassAuxiliaryCapabilitySignatureAliroHydraKeyCreationMetadata alloc], "_init");
  -[PKPassAuxiliaryCapabilityKeyCreationMetadata _copyInto:](self, "_copyInto:", v4);
  v5 = -[NSData copy](self->_readerIdentifier, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSData copy](self->_readerPublicKey, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[NSDictionary copy](self->_serverParameters, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassAuxiliaryCapabilitySignatureAliroHydraKeyCreationMetadata)initWithCoder:(id)a3
{
  id v4;
  PKPassAuxiliaryCapabilitySignatureAliroHydraKeyCreationMetadata *v5;
  uint64_t v6;
  NSData *readerIdentifier;
  uint64_t v8;
  NSData *readerPublicKey;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSDictionary *serverParameters;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPassAuxiliaryCapabilitySignatureAliroHydraKeyCreationMetadata;
  v5 = -[PKPassAuxiliaryCapabilityKeyCreationMetadata initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("readerIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    readerIdentifier = v5->_readerIdentifier;
    v5->_readerIdentifier = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("readerPublicKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    readerPublicKey = v5->_readerPublicKey;
    v5->_readerPublicKey = (NSData *)v8;

    v10 = objc_alloc(MEMORY[0x1E0C99E60]);
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = (void *)objc_msgSend(v10, "initWithObjects:", v11, v12, v13, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("serverParameters"));
    v15 = objc_claimAutoreleasedReturnValue();
    serverParameters = v5->_serverParameters;
    v5->_serverParameters = (NSDictionary *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassAuxiliaryCapabilitySignatureAliroHydraKeyCreationMetadata;
  v4 = a3;
  -[PKPassAuxiliaryCapabilityKeyCreationMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_readerIdentifier, CFSTR("readerIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_readerPublicKey, CFSTR("readerPublicKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_serverParameters, CFSTR("serverParameters"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData hexEncoding](self->_readerIdentifier, "hexEncoding");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("; readerIdentifier: '%@'"), v7);

  -[NSData hexEncoding](self->_readerPublicKey, "hexEncoding");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("; readerPublicKey: '%@'"), v8);

  objc_msgSend(v6, "appendFormat:", CFSTR("; serverParameters: '%@'"), self->_serverParameters);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSData)readerIdentifier
{
  return self->_readerIdentifier;
}

- (NSData)readerPublicKey
{
  return self->_readerPublicKey;
}

- (NSDictionary)serverParameters
{
  return self->_serverParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverParameters, 0);
  objc_storeStrong((id *)&self->_readerPublicKey, 0);
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
}

@end
