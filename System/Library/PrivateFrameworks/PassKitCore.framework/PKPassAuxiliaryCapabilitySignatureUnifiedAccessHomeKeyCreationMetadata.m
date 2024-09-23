@implementation PKPassAuxiliaryCapabilitySignatureUnifiedAccessHomeKeyCreationMetadata

- (PKPassAuxiliaryCapabilitySignatureUnifiedAccessHomeKeyCreationMetadata)initWithReaderIdentifier:(id)a3 readerPublicKey:(id)a4
{
  id v7;
  id v8;
  id *v9;
  PKPassAuxiliaryCapabilitySignatureUnifiedAccessHomeKeyCreationMetadata *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPassAuxiliaryCapabilitySignatureUnifiedAccessHomeKeyCreationMetadata;
  v9 = -[PKPassAuxiliaryCapabilityKeyCreationMetadata _init](&v12, sel__init);
  v10 = (PKPassAuxiliaryCapabilitySignatureUnifiedAccessHomeKeyCreationMetadata *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, a3);
    objc_storeStrong((id *)&v10->_readerPublicKey, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = -[PKPassAuxiliaryCapabilityKeyCreationMetadata _init]([PKPassAuxiliaryCapabilitySignatureUnifiedAccessHomeKeyCreationMetadata alloc], "_init");
  -[PKPassAuxiliaryCapabilityKeyCreationMetadata _copyInto:](self, "_copyInto:", v4);
  v5 = -[NSData copy](self->_readerIdentifier, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSData copy](self->_readerPublicKey, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassAuxiliaryCapabilitySignatureUnifiedAccessHomeKeyCreationMetadata)initWithCoder:(id)a3
{
  id v4;
  PKPassAuxiliaryCapabilitySignatureUnifiedAccessHomeKeyCreationMetadata *v5;
  uint64_t v6;
  NSData *readerIdentifier;
  uint64_t v8;
  NSData *readerPublicKey;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassAuxiliaryCapabilitySignatureUnifiedAccessHomeKeyCreationMetadata;
  v5 = -[PKPassAuxiliaryCapabilityKeyCreationMetadata initWithCoder:](&v11, sel_initWithCoder_, v4);
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

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassAuxiliaryCapabilitySignatureUnifiedAccessHomeKeyCreationMetadata;
  v4 = a3;
  -[PKPassAuxiliaryCapabilityKeyCreationMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_readerIdentifier, CFSTR("readerIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_readerPublicKey, CFSTR("readerPublicKey"));

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerPublicKey, 0);
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
}

@end
