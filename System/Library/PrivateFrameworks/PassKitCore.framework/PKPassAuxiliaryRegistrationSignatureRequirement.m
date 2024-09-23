@implementation PKPassAuxiliaryRegistrationSignatureRequirement

- (PKPassAuxiliaryRegistrationSignatureRequirement)initWithDictionary:(id)a3
{
  id v4;
  PKPassAuxiliaryRegistrationSignatureRequirement *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPassAuxiliaryRegistrationSignatureRequirement;
  v5 = -[PKPassAuxiliaryRegistrationRequirement initWithDictionary:](&v15, sel_initWithDictionary_, v4);
  if (!v5)
    goto LABEL_14;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_type = PKDeviceSignatureTypeFromString(v6);

  objc_msgSend(v4, "PKStringForKey:", CFSTR("version"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_signatureSchemeVersion = PKSignatureSchemeVersionFromString(v7);

  objc_msgSend(v4, "PKStringForKey:", CFSTR("source"));
  v8 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  if (v8 == CFSTR("applePayTrust")
    || (v9 = v8) != 0
    && (v10 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("applePayTrust")),
        v9,
        v9,
        v10))
  {
    v5->_type = 4;
    goto LABEL_7;
  }
  if (v5->_type == 4)
  {
LABEL_7:
    -[PKPassAuxiliaryRegistrationRequirement identifier](v5, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      -[PKPassAuxiliaryRegistrationRequirement setIdentifier:](v5, "setIdentifier:", CFSTR("deviceSignature"));
  }
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("metadata"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    +[PKPassAuxiliaryCapabilityKeyCreationMetadata createMetadataFromDictionary:forSignatureCapabilityType:](PKPassAuxiliaryCapabilityKeyCreationMetadata, "createMetadataFromDictionary:forSignatureCapabilityType:", v12, v5->_type);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      -[PKPassAuxiliaryRegistrationRequirement setKeyCreationMetadata:](v5, "setKeyCreationMetadata:", v13);

  }
LABEL_14:

  return v5;
}

- (PKPassAuxiliaryRegistrationSignatureRequirement)initWithType:(unint64_t)a3
{
  id v5;
  void *v6;
  PKPassAuxiliaryRegistrationSignatureRequirement *v7;
  objc_super v9;

  v5 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PKPassAuxiliaryRegistrationSignatureRequirement;
  v7 = -[PKPassAuxiliaryRegistrationRequirement _initWithIdentifier:numberOfKeys:canLocallyInvalidateRegistrationState:canLocallyValidateRegistrationState:](&v9, sel__initWithIdentifier_numberOfKeys_canLocallyInvalidateRegistrationState_canLocallyValidateRegistrationState_, v6, 0, 0, 0);

  if (v7)
    v7->_type = a3;
  return v7;
}

- (id)_mutableDictionaryRepresentation
{
  void *v3;
  void *v4;
  const __CFString *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPassAuxiliaryRegistrationSignatureRequirement;
  -[PKPassAuxiliaryRegistrationRequirement _mutableDictionaryRepresentation](&v7, sel__mutableDictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKDeviceSignatureTypeToString(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("type"));

  if (self->_signatureSchemeVersion == 1)
    v5 = CFSTR("ECDSA");
  else
    v5 = 0;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("version"));
  return v3;
}

- (unint64_t)role
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassAuxiliaryRegistrationSignatureRequirement)initWithCoder:(id)a3
{
  id v4;
  PKPassAuxiliaryRegistrationSignatureRequirement *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassAuxiliaryRegistrationSignatureRequirement;
  v5 = -[PKPassAuxiliaryRegistrationRequirement initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signatureSchemeVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_signatureSchemeVersion = objc_msgSend(v7, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPassAuxiliaryRegistrationSignatureRequirement;
  v4 = a3;
  -[PKPassAuxiliaryRegistrationRequirement encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_type, v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_signatureSchemeVersion);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("signatureSchemeVersion"));

}

- (void)_decorateDescription:(id)a3
{
  id v4;
  void *v5;
  unint64_t signatureSchemeVersion;
  const __CFString *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPassAuxiliaryRegistrationSignatureRequirement;
  -[PKPassAuxiliaryRegistrationRequirement _decorateDescription:](&v8, sel__decorateDescription_, v4);
  PKDeviceSignatureTypeToString(self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("type: '%@'; "), v5);

  signatureSchemeVersion = self->_signatureSchemeVersion;
  if (signatureSchemeVersion)
  {
    if (signatureSchemeVersion == 1)
      v7 = CFSTR("ECDSA");
    else
      v7 = 0;
    objc_msgSend(v4, "appendFormat:", CFSTR("signatureSchemeVersion: '%@'; "), v7);
  }
  objc_msgSend(v4, "appendFormat:", CFSTR("backoff: '%lu'; "),
    -[PKPassAuxiliaryRegistrationRequirement registrationBackoffCounter](self, "registrationBackoffCounter"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;
  v6 = self->_signatureSchemeVersion - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKPassAuxiliaryRegistrationSignatureRequirement *v4;
  PKPassAuxiliaryRegistrationSignatureRequirement *v5;
  BOOL v6;

  v4 = (PKPassAuxiliaryRegistrationSignatureRequirement *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPassAuxiliaryRegistrationSignatureRequirement isEqualToPassAuxiliaryRegistrationSignatureRequirement:](self, "isEqualToPassAuxiliaryRegistrationSignatureRequirement:", v5);

  return v6;
}

- (BOOL)isEqualToPassAuxiliaryRegistrationSignatureRequirement:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  v5 = v4 && self->_type == v4[7] && self->_signatureSchemeVersion == v4[8];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPassAuxiliaryRegistrationSignatureRequirement *v4;

  v4 = objc_alloc_init(PKPassAuxiliaryRegistrationSignatureRequirement);
  -[PKPassAuxiliaryRegistrationRequirement _copyInto:](self, "_copyInto:", v4);
  v4->_type = self->_type;
  v4->_signatureSchemeVersion = self->_signatureSchemeVersion;
  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)signatureSchemeVersion
{
  return self->_signatureSchemeVersion;
}

@end
