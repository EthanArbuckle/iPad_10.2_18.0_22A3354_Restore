@implementation PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata

- (PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata)initWithDictionary:(id)a3
{
  id v4;
  PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata *v5;
  uint64_t v6;
  NSString *subcredentialIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata;
  v5 = -[PKPassAuxiliaryCapabilityKeyCreationMetadata initWithDictionary:](&v9, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("subcredentialIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    subcredentialIdentifier = v5->_subcredentialIdentifier;
    v5->_subcredentialIdentifier = (NSString *)v6;

    if (!v5->_subcredentialIdentifier)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata)initWithSubcredentialIdentifier:(id)a3
{
  id v5;
  id *v6;
  PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata;
  v6 = -[PKPassAuxiliaryCapabilityKeyCreationMetadata _init](&v9, sel__init);
  v7 = (PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata *)v6;
  if (v6)
    objc_storeStrong(v6 + 1, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = -[PKPassAuxiliaryCapabilityKeyCreationMetadata _init]([PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata alloc], "_init");
  -[PKPassAuxiliaryCapabilityKeyCreationMetadata _copyInto:](self, "_copyInto:", v4);
  v5 = -[NSString copy](self->_subcredentialIdentifier, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSString copy](self->_existingAccountKeyIdentifier, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata)initWithCoder:(id)a3
{
  id v4;
  PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata *v5;
  uint64_t v6;
  NSString *subcredentialIdentifier;
  uint64_t v8;
  NSString *existingAccountKeyIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata;
  v5 = -[PKPassAuxiliaryCapabilityKeyCreationMetadata initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subcredentialIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    subcredentialIdentifier = v5->_subcredentialIdentifier;
    v5->_subcredentialIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("existingAccountKeyIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    existingAccountKeyIdentifier = v5->_existingAccountKeyIdentifier;
    v5->_existingAccountKeyIdentifier = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata;
  v4 = a3;
  -[PKPassAuxiliaryCapabilityKeyCreationMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_subcredentialIdentifier, CFSTR("subcredentialIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_existingAccountKeyIdentifier, CFSTR("existingAccountKeyIdentifier"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("; subcredentialIdentifier: '%@'"), self->_subcredentialIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("; existingAccountKeyIdentifier: '%@'"), self->_existingAccountKeyIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)subcredentialIdentifier
{
  return self->_subcredentialIdentifier;
}

- (NSString)existingAccountKeyIdentifier
{
  return self->_existingAccountKeyIdentifier;
}

- (void)setExistingAccountKeyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_existingAccountKeyIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingAccountKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_subcredentialIdentifier, 0);
}

@end
