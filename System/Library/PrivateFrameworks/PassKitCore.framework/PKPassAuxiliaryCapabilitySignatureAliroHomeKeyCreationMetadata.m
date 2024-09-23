@implementation PKPassAuxiliaryCapabilitySignatureAliroHomeKeyCreationMetadata

- (PKPassAuxiliaryCapabilitySignatureAliroHomeKeyCreationMetadata)initWithReaderIdentifier:(id)a3 readerPublicKey:(id)a4 homeIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  id *v12;
  PKPassAuxiliaryCapabilitySignatureAliroHomeKeyCreationMetadata *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPassAuxiliaryCapabilitySignatureAliroHomeKeyCreationMetadata;
  v12 = -[PKPassAuxiliaryCapabilityKeyCreationMetadata _init](&v15, sel__init);
  v13 = (PKPassAuxiliaryCapabilitySignatureAliroHomeKeyCreationMetadata *)v12;
  if (v12)
  {
    objc_storeStrong(v12 + 1, a3);
    objc_storeStrong((id *)&v13->_readerPublicKey, a4);
    objc_storeStrong((id *)&v13->_homeIdentifier, a5);
  }

  return v13;
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

  v4 = -[PKPassAuxiliaryCapabilityKeyCreationMetadata _init]([PKPassAuxiliaryCapabilitySignatureAliroHomeKeyCreationMetadata alloc], "_init");
  -[PKPassAuxiliaryCapabilityKeyCreationMetadata _copyInto:](self, "_copyInto:", v4);
  v5 = -[NSData copy](self->_readerIdentifier, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSData copy](self->_readerPublicKey, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[NSUUID copy](self->_homeIdentifier, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassAuxiliaryCapabilitySignatureAliroHomeKeyCreationMetadata)initWithCoder:(id)a3
{
  id v4;
  PKPassAuxiliaryCapabilitySignatureAliroHomeKeyCreationMetadata *v5;
  uint64_t v6;
  NSData *readerIdentifier;
  uint64_t v8;
  NSData *readerPublicKey;
  uint64_t v10;
  NSUUID *homeIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPassAuxiliaryCapabilitySignatureAliroHomeKeyCreationMetadata;
  v5 = -[PKPassAuxiliaryCapabilityKeyCreationMetadata initWithCoder:](&v13, sel_initWithCoder_, v4);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    homeIdentifier = v5->_homeIdentifier;
    v5->_homeIdentifier = (NSUUID *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassAuxiliaryCapabilitySignatureAliroHomeKeyCreationMetadata;
  v4 = a3;
  -[PKPassAuxiliaryCapabilityKeyCreationMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_readerIdentifier, CFSTR("readerIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_readerPublicKey, CFSTR("readerPublicKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_homeIdentifier, CFSTR("homeIdentifier"));

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
  void *v10;

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

  -[NSUUID UUIDString](self->_homeIdentifier, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("; homeIdentifier: '%@'"), v9);

  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSData)readerIdentifier
{
  return self->_readerIdentifier;
}

- (NSData)readerPublicKey
{
  return self->_readerPublicKey;
}

- (NSUUID)homeIdentifier
{
  return self->_homeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_readerPublicKey, 0);
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
}

@end
