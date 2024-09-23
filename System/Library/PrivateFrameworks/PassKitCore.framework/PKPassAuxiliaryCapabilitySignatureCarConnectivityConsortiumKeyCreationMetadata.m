@implementation PKPassAuxiliaryCapabilitySignatureCarConnectivityConsortiumKeyCreationMetadata

- (PKPassAuxiliaryCapabilitySignatureCarConnectivityConsortiumKeyCreationMetadata)initWithDictionary:(id)a3
{
  id v4;
  PKPassAuxiliaryCapabilitySignatureCarConnectivityConsortiumKeyCreationMetadata *v5;
  PKSubcredentialEncryptedContainer *v6;
  PKSubcredentialEncryptedContainer *container;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassAuxiliaryCapabilitySignatureCarConnectivityConsortiumKeyCreationMetadata;
  v5 = -[PKPassAuxiliaryCapabilityKeyCreationMetadata initWithDictionary:](&v9, sel_initWithDictionary_, v4);
  if (v5)
  {
    v6 = -[PKSubcredentialEncryptedContainer initWithDictionary:]([PKSubcredentialEncryptedContainer alloc], "initWithDictionary:", v4);
    container = v5->_container;
    v5->_container = v6;

    if (!v5->_container)
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

  v4 = -[PKPassAuxiliaryCapabilityKeyCreationMetadata _init]([PKPassAuxiliaryCapabilitySignatureCarConnectivityConsortiumKeyCreationMetadata alloc], "_init");
  -[PKPassAuxiliaryCapabilityKeyCreationMetadata _copyInto:](self, "_copyInto:", v4);
  v5 = -[PKSubcredentialEncryptedContainer copy](self->_container, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassAuxiliaryCapabilitySignatureCarConnectivityConsortiumKeyCreationMetadata)initWithCoder:(id)a3
{
  id v4;
  PKPassAuxiliaryCapabilitySignatureCarConnectivityConsortiumKeyCreationMetadata *v5;
  uint64_t v6;
  PKSubcredentialEncryptedContainer *container;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassAuxiliaryCapabilitySignatureCarConnectivityConsortiumKeyCreationMetadata;
  v5 = -[PKPassAuxiliaryCapabilityKeyCreationMetadata initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("container"));
    v6 = objc_claimAutoreleasedReturnValue();
    container = v5->_container;
    v5->_container = (PKSubcredentialEncryptedContainer *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassAuxiliaryCapabilitySignatureCarConnectivityConsortiumKeyCreationMetadata;
  v4 = a3;
  -[PKPassAuxiliaryCapabilityKeyCreationMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_container, CFSTR("container"), v5.receiver, v5.super_class);

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

  objc_msgSend(v6, "appendFormat:", CFSTR("; container: '%@'"), self->_container);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (PKSubcredentialEncryptedContainer)container
{
  return self->_container;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
}

@end
