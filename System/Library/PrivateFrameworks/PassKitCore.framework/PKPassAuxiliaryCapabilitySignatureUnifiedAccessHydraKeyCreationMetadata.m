@implementation PKPassAuxiliaryCapabilitySignatureUnifiedAccessHydraKeyCreationMetadata

- (PKPassAuxiliaryCapabilitySignatureUnifiedAccessHydraKeyCreationMetadata)initWithDictionary:(id)a3
{
  id v4;
  PKPassAuxiliaryCapabilitySignatureUnifiedAccessHydraKeyCreationMetadata *v5;
  void *v6;
  uint64_t v7;
  NSData *readerIdentifier;
  uint64_t v9;
  NSDictionary *serverParameters;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPassAuxiliaryCapabilitySignatureUnifiedAccessHydraKeyCreationMetadata;
  v5 = -[PKPassAuxiliaryCapabilityKeyCreationMetadata initWithDictionary:](&v12, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("readerGroupIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pk_decodeHexadecimal");
    v7 = objc_claimAutoreleasedReturnValue();
    readerIdentifier = v5->_readerIdentifier;
    v5->_readerIdentifier = (NSData *)v7;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("serverParameters"));
    v9 = objc_claimAutoreleasedReturnValue();
    serverParameters = v5->_serverParameters;
    v5->_serverParameters = (NSDictionary *)v9;

    if (!v5->_readerIdentifier || !v5->_serverParameters)
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

  v4 = -[PKPassAuxiliaryCapabilityKeyCreationMetadata _init]([PKPassAuxiliaryCapabilitySignatureUnifiedAccessHydraKeyCreationMetadata alloc], "_init");
  -[PKPassAuxiliaryCapabilityKeyCreationMetadata _copyInto:](self, "_copyInto:", v4);
  v5 = -[NSData copy](self->_readerIdentifier, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSDictionary copy](self->_serverParameters, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassAuxiliaryCapabilitySignatureUnifiedAccessHydraKeyCreationMetadata)initWithCoder:(id)a3
{
  id v4;
  PKPassAuxiliaryCapabilitySignatureUnifiedAccessHydraKeyCreationMetadata *v5;
  uint64_t v6;
  NSData *readerIdentifier;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSDictionary *serverParameters;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPassAuxiliaryCapabilitySignatureUnifiedAccessHydraKeyCreationMetadata;
  v5 = -[PKPassAuxiliaryCapabilityKeyCreationMetadata initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("readerIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    readerIdentifier = v5->_readerIdentifier;
    v5->_readerIdentifier = (NSData *)v6;

    v8 = objc_alloc(MEMORY[0x1E0C99E60]);
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = (void *)objc_msgSend(v8, "initWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("serverParameters"));
    v13 = objc_claimAutoreleasedReturnValue();
    serverParameters = v5->_serverParameters;
    v5->_serverParameters = (NSDictionary *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassAuxiliaryCapabilitySignatureUnifiedAccessHydraKeyCreationMetadata;
  v4 = a3;
  -[PKPassAuxiliaryCapabilityKeyCreationMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_readerIdentifier, CFSTR("readerIdentifier"), v5.receiver, v5.super_class);
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

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSData hexEncoding](self->_readerIdentifier, "hexEncoding");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("; readerIdentifier: '%@'"), v7);

  objc_msgSend(v6, "appendFormat:", CFSTR("; serverParameters: '%@'"), self->_serverParameters);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSData)readerIdentifier
{
  return self->_readerIdentifier;
}

- (NSDictionary)serverParameters
{
  return self->_serverParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverParameters, 0);
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
}

@end
