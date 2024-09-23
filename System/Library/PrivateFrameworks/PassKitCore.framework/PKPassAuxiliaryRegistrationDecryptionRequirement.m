@implementation PKPassAuxiliaryRegistrationDecryptionRequirement

- (PKPassAuxiliaryRegistrationDecryptionRequirement)initWithDictionary:(id)a3
{
  id v4;
  PKPassAuxiliaryRegistrationDecryptionRequirement *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *groupIdentifier;
  __CFString *v11;
  __CFString *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPassAuxiliaryRegistrationDecryptionRequirement;
  v5 = -[PKPassAuxiliaryRegistrationRequirement initWithDictionary:](&v18, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = PKDeviceDecryptionTypeFromString(v6);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("usage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_usage = PKDeviceDecryptionUsageFromString(v7);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("version"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_decryptionSchemeVersion = PKDecryptionSchemeVersionFromString(v8);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("groupingIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v9;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("source"));
    v11 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    if (v11 == CFSTR("applePayTrust")
      || (v12 = v11) != 0
      && (v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("applePayTrust")),
          v12,
          v12,
          v13))
    {
      v5->_type = 4;
    }
    else if (v5->_type == 3)
    {
      -[PKPassAuxiliaryRegistrationRequirement identifier](v5, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        -[PKPassAuxiliaryRegistrationRequirement setIdentifier:](v5, "setIdentifier:", CFSTR("deviceDecryption"));
    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("metadata"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      +[PKPassAuxiliaryCapabilityKeyCreationMetadata createMetadataFromDictionary:forDecryptionCapabilityType:](PKPassAuxiliaryCapabilityKeyCreationMetadata, "createMetadataFromDictionary:forDecryptionCapabilityType:", v15, v5->_type);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        -[PKPassAuxiliaryRegistrationRequirement setKeyCreationMetadata:](v5, "setKeyCreationMetadata:", v16);

    }
  }

  return v5;
}

- (id)_mutableDictionaryRepresentation
{
  void *v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  unint64_t decryptionSchemeVersion;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKPassAuxiliaryRegistrationDecryptionRequirement;
  -[PKPassAuxiliaryRegistrationRequirement _mutableDictionaryRepresentation](&v13, sel__mutableDictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = self->_type - 1;
  if (v5 > 4)
    v6 = 0;
  else
    v6 = off_1E2AC5498[v5];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("type"));
  if (self->_usage == 1)
    v7 = CFSTR("isoContainer");
  else
    v7 = 0;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("usage"));
  decryptionSchemeVersion = self->_decryptionSchemeVersion;
  v9 = CFSTR("EC_v3");
  if (decryptionSchemeVersion != 1)
    v9 = 0;
  if (decryptionSchemeVersion == 2)
    v10 = CFSTR("hpke");
  else
    v10 = v9;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("version"));
  v11 = (void *)-[NSString copy](self->_groupIdentifier, "copy");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("groupingIdentifier"));

  return v4;
}

- (unint64_t)role
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassAuxiliaryRegistrationDecryptionRequirement)initWithCoder:(id)a3
{
  id v4;
  PKPassAuxiliaryRegistrationDecryptionRequirement *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *groupIdentifier;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPassAuxiliaryRegistrationDecryptionRequirement;
  v5 = -[PKPassAuxiliaryRegistrationRequirement initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("usage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_usage = objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("decryptionSchemeVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_decryptionSchemeVersion = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPassAuxiliaryRegistrationDecryptionRequirement;
  v4 = a3;
  -[PKPassAuxiliaryRegistrationRequirement encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_type, v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_usage);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("usage"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_decryptionSchemeVersion);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("decryptionSchemeVersion"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_groupIdentifier, CFSTR("groupIdentifier"));
}

- (void)_decorateDescription:(id)a3
{
  id v4;
  unint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  unint64_t decryptionSchemeVersion;
  const __CFString *v9;
  const __CFString *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassAuxiliaryRegistrationDecryptionRequirement;
  -[PKPassAuxiliaryRegistrationRequirement _decorateDescription:](&v11, sel__decorateDescription_, v4);
  v5 = self->_type - 1;
  if (v5 > 4)
    v6 = 0;
  else
    v6 = off_1E2AC5498[v5];
  objc_msgSend(v4, "appendFormat:", CFSTR("type: '%@'; "), v6);
  if (self->_usage == 1)
    v7 = CFSTR("isoContainer");
  else
    v7 = 0;
  objc_msgSend(v4, "appendFormat:", CFSTR("usage: '%@'; "), v7);
  decryptionSchemeVersion = self->_decryptionSchemeVersion;
  if (decryptionSchemeVersion)
  {
    v9 = CFSTR("EC_v3");
    if (decryptionSchemeVersion != 1)
      v9 = 0;
    if (decryptionSchemeVersion == 2)
      v10 = CFSTR("hpke");
    else
      v10 = v9;
    objc_msgSend(v4, "appendFormat:", CFSTR("decryptionSchemeVersion: '%@'; "), v10);
  }
  objc_msgSend(v4, "appendFormat:", CFSTR("groupIdentifier: '%@'; "), self->_groupIdentifier);
  objc_msgSend(v4, "appendFormat:", CFSTR("backoff: '%lu'; "),
    -[PKPassAuxiliaryRegistrationRequirement registrationBackoffCounter](self, "registrationBackoffCounter"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;
  v6 = self->_usage - v5 + 32 * v5;
  v7 = self->_decryptionSchemeVersion - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PKPassAuxiliaryRegistrationDecryptionRequirement *v4;
  PKPassAuxiliaryRegistrationDecryptionRequirement *v5;
  BOOL v6;

  v4 = (PKPassAuxiliaryRegistrationDecryptionRequirement *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPassAuxiliaryRegistrationDecryptionRequirement isEqualToPassAuxiliaryRegistrationDecryptionRequirement:](self, "isEqualToPassAuxiliaryRegistrationDecryptionRequirement:", v5);

  return v6;
}

- (BOOL)isEqualToPassAuxiliaryRegistrationDecryptionRequirement:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && self->_type == v4[7]
    && self->_usage == v4[8]
    && self->_decryptionSchemeVersion == v4[9]
    && self->_groupIdentifier
    && v4[10] != 0;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPassAuxiliaryRegistrationDecryptionRequirement *v4;
  uint64_t v5;
  NSString *groupIdentifier;

  v4 = objc_alloc_init(PKPassAuxiliaryRegistrationDecryptionRequirement);
  -[PKPassAuxiliaryRegistrationRequirement _copyInto:](self, "_copyInto:", v4);
  v4->_type = self->_type;
  v4->_usage = self->_usage;
  v4->_decryptionSchemeVersion = self->_decryptionSchemeVersion;
  v5 = -[NSString copy](self->_groupIdentifier, "copy");
  groupIdentifier = v4->_groupIdentifier;
  v4->_groupIdentifier = (NSString *)v5;

  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)usage
{
  return self->_usage;
}

- (unint64_t)decryptionSchemeVersion
{
  return self->_decryptionSchemeVersion;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

@end
