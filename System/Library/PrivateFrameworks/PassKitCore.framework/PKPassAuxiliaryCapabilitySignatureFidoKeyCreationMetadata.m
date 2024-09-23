@implementation PKPassAuxiliaryCapabilitySignatureFidoKeyCreationMetadata

- (PKPassAuxiliaryCapabilitySignatureFidoKeyCreationMetadata)initWithDictionary:(id)a3
{
  id v4;
  PKPassAuxiliaryCapabilitySignatureFidoKeyCreationMetadata *v5;
  PKFidoProfile *v6;
  void *v7;
  uint64_t v8;
  PKFidoProfile *fidoProfile;
  void *v10;
  uint64_t v11;
  NSData *fidoChallenge;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPassAuxiliaryCapabilitySignatureFidoKeyCreationMetadata;
  v5 = -[PKPassAuxiliaryCapabilityKeyCreationMetadata initWithDictionary:](&v14, sel_initWithDictionary_, v4);
  if (v5)
  {
    v6 = [PKFidoProfile alloc];
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("fidoProfile"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKFidoProfile initWithDictionary:](v6, "initWithDictionary:", v7);
    fidoProfile = v5->_fidoProfile;
    v5->_fidoProfile = (PKFidoProfile *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("fidoChallenge"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v10, 0);
      fidoChallenge = v5->_fidoChallenge;
      v5->_fidoChallenge = (NSData *)v11;

    }
    if (!v5->_fidoProfile || !v5->_fidoChallenge)
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

  v4 = -[PKPassAuxiliaryCapabilityKeyCreationMetadata _init]([PKPassAuxiliaryCapabilitySignatureFidoKeyCreationMetadata alloc], "_init");
  -[PKPassAuxiliaryCapabilityKeyCreationMetadata _copyInto:](self, "_copyInto:", v4);
  v5 = -[NSData copy](self->_fidoChallenge, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassAuxiliaryCapabilitySignatureFidoKeyCreationMetadata)initWithCoder:(id)a3
{
  id v4;
  PKPassAuxiliaryCapabilitySignatureFidoKeyCreationMetadata *v5;
  uint64_t v6;
  PKFidoProfile *fidoProfile;
  uint64_t v8;
  NSData *fidoChallenge;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassAuxiliaryCapabilitySignatureFidoKeyCreationMetadata;
  v5 = -[PKPassAuxiliaryCapabilityKeyCreationMetadata initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fidoProfile"));
    v6 = objc_claimAutoreleasedReturnValue();
    fidoProfile = v5->_fidoProfile;
    v5->_fidoProfile = (PKFidoProfile *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fidoChallenge"));
    v8 = objc_claimAutoreleasedReturnValue();
    fidoChallenge = v5->_fidoChallenge;
    v5->_fidoChallenge = (NSData *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassAuxiliaryCapabilitySignatureFidoKeyCreationMetadata;
  v4 = a3;
  -[PKPassAuxiliaryCapabilityKeyCreationMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_fidoProfile, CFSTR("fidoProfile"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_fidoChallenge, CFSTR("fidoChallenge"));

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

  objc_msgSend(v6, "appendFormat:", CFSTR("; fidoProfile: '%@'"), self->_fidoProfile);
  -[NSData hexEncoding](self->_fidoChallenge, "hexEncoding");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("; fidoChallenge: '%@'"), v7);

  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PKFidoProfile)fidoProfile
{
  return self->_fidoProfile;
}

- (NSData)fidoChallenge
{
  return self->_fidoChallenge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fidoChallenge, 0);
  objc_storeStrong((id *)&self->_fidoProfile, 0);
}

@end
