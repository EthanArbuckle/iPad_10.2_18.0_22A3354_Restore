@implementation PKPassAuxiliaryRegistrationRequirement

- (PKPassAuxiliaryRegistrationRequirement)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKNumberForKey:", CFSTR("numberOfKeys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKNumberForKey:", CFSTR("canLocallyInvalidRegistrationState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKNumberForKey:", CFSTR("canLocallyValidateRegistrationState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v9 = -[PKPassAuxiliaryRegistrationRequirement _initWithIdentifier:numberOfKeys:canLocallyInvalidateRegistrationState:canLocallyValidateRegistrationState:](self, "_initWithIdentifier:numberOfKeys:canLocallyInvalidateRegistrationState:canLocallyValidateRegistrationState:", v5, v6, v7, v8);
    if (v9)
    {
      objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("supportedVersions"));
      v10 = objc_claimAutoreleasedReturnValue();
      self = (PKPassAuxiliaryRegistrationRequirement *)*((_QWORD *)v9 + 4);
      *((_QWORD *)v9 + 4) = v10;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return (PKPassAuxiliaryRegistrationRequirement *)v9;
}

- (id)_initWithIdentifier:(id)a3 numberOfKeys:(id)a4 canLocallyInvalidateRegistrationState:(id)a5 canLocallyValidateRegistrationState:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKPassAuxiliaryRegistrationRequirement *v15;
  PKPassAuxiliaryRegistrationRequirement *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PKPassAuxiliaryRegistrationRequirement;
  v15 = -[PKPassAuxiliaryRegistrationRequirement init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    if (v12)
      v17 = v12;
    else
      v17 = &unk_1E2C3EA70;
    v16->_numberOfKeys = objc_msgSend(v17, "integerValue");
    if (v13)
      v18 = v13;
    else
      v18 = (void *)MEMORY[0x1E0C9AAB0];
    v16->_canLocallyInvalidateRegistrationState = objc_msgSend(v18, "BOOLValue");
    if (v14)
      v19 = v14;
    else
      v19 = (void *)MEMORY[0x1E0C9AAA0];
    v16->_canLocallyValidateRegistrationState = objc_msgSend(v19, "BOOLValue");
  }

  return v16;
}

- (id)dictionaryRepresentation
{
  void *v2;
  void *v3;

  -[PKPassAuxiliaryRegistrationRequirement _mutableDictionaryRepresentation](self, "_mutableDictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)_mutableDictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfKeys);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("numberOfKeys"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canLocallyInvalidateRegistrationState);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("canLocallyInvalidRegistrationState"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canLocallyValidateRegistrationState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("canLocallyValidateRegistrationState"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_supportedVersions, CFSTR("supportedVersions"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassAuxiliaryRegistrationRequirement)initWithCoder:(id)a3
{
  id v4;
  PKPassAuxiliaryRegistrationRequirement *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *supportedVersions;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  PKPassAuxiliaryCapabilityKeyCreationMetadata *keyCreationMetadata;
  id v25;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKPassAuxiliaryRegistrationRequirement;
  v5 = -[PKPassAuxiliaryRegistrationRequirement init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_registrationBackoffCounter = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("registrationBackoffCounter"));
    v5->_numberOfKeys = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numberOfKeys"));
    v5->_canLocallyInvalidateRegistrationState = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canLocallyInvalidateRegistrationState"));
    v5->_canLocallyValidateRegistrationState = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canLocallyValidateRegistrationState"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("supportedVersions"));
    v11 = objc_claimAutoreleasedReturnValue();
    supportedVersions = v5->_supportedVersions;
    v5->_supportedVersions = (NSArray *)v11;

    v25 = objc_alloc(MEMORY[0x1E0C99E60]);
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = (void *)objc_msgSend(v25, "initWithObjects:", v13, v14, v15, v16, v17, v18, v19, v20, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("keyCreationMetadata"));
    v22 = objc_claimAutoreleasedReturnValue();
    keyCreationMetadata = v5->_keyCreationMetadata;
    v5->_keyCreationMetadata = (PKPassAuxiliaryCapabilityKeyCreationMetadata *)v22;

  }
  return v5;
}

- (unint64_t)role
{
  return 2;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_registrationBackoffCounter, CFSTR("registrationBackoffCounter"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numberOfKeys, CFSTR("numberOfKeys"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canLocallyInvalidateRegistrationState, CFSTR("canLocallyInvalidateRegistrationState"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canLocallyValidateRegistrationState, CFSTR("canLocallyValidateRegistrationState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedVersions, CFSTR("supportedVersions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyCreationMetadata, CFSTR("keyCreationMetadata"));

}

- (void)_decorateDescription:(id)a3
{
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PKPassAuxiliaryRegistrationRequirement role](self, "role"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("role: '%@'; "), v4);

  objc_msgSend(v7, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v7, "appendFormat:", CFSTR("backoff: '%lu'; "), self->_registrationBackoffCounter);
  objc_msgSend(v7, "appendFormat:", CFSTR("numberOfKeys: '%ld'; "), self->_numberOfKeys);
  if (self->_canLocallyInvalidateRegistrationState)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("canLocallyInvalidate: '%@'; "), v5);
  if (self->_canLocallyValidateRegistrationState)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("canLocallyValidate: '%@'; "), v6);
  objc_msgSend(v7, "appendFormat:", CFSTR("supportedVersions: '%@'; "), self->_supportedVersions);
  if (self->_keyCreationMetadata)
    objc_msgSend(v7, "appendFormat:", CFSTR("metadata: '%@'; "), self->_keyCreationMetadata);

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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPassAuxiliaryRegistrationRequirement _decorateDescription:](self, "_decorateDescription:", v6);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_supportedVersions);
  v4 = PKCombinedHash(17, v3);
  v5 = -[PKPassAuxiliaryRegistrationRequirement role](self, "role");
  v6 = self->_registrationBackoffCounter - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
  v7 = self->_numberOfKeys - v6 + 32 * v6;
  v8 = self->_canLocallyInvalidateRegistrationState - v7 + 32 * v7;
  v9 = self->_canLocallyValidateRegistrationState - v8 + 32 * v8;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  PKPassAuxiliaryRegistrationRequirement *v4;
  PKPassAuxiliaryRegistrationRequirement *v5;
  BOOL v6;

  v4 = (PKPassAuxiliaryRegistrationRequirement *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPassAuxiliaryRegistrationRequirement isEqualToPassAuxiliaryRegistrationRequirement:](self, "isEqualToPassAuxiliaryRegistrationRequirement:", v5);

  return v6;
}

- (BOOL)isEqualToPassAuxiliaryRegistrationRequirement:(id)a3
{
  NSArray **v4;
  unint64_t v5;
  NSArray *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  NSArray *supportedVersions;
  NSArray *v12;
  char v13;

  v4 = (NSArray **)a3;
  if (!v4)
    goto LABEL_17;
  v5 = -[PKPassAuxiliaryRegistrationRequirement role](self, "role");
  if (v5 != objc_msgSend(v4, "role") || (NSArray *)self->_registrationBackoffCounter != v4[5])
    goto LABEL_17;
  v6 = v4[2];
  v7 = self->_identifier;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

LABEL_17:
      v13 = 0;
      goto LABEL_18;
    }
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_17;
  }
  if ((NSArray *)self->_numberOfKeys != v4[3]
    || self->_canLocallyInvalidateRegistrationState != *((unsigned __int8 *)v4 + 8)
    || self->_canLocallyValidateRegistrationState != *((unsigned __int8 *)v4 + 9))
  {
    goto LABEL_17;
  }
  supportedVersions = self->_supportedVersions;
  v12 = v4[4];
  if (supportedVersions && v12)
    v13 = -[NSArray isEqual:](supportedVersions, "isEqual:");
  else
    v13 = supportedVersions == v12;
LABEL_18:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPassAuxiliaryRegistrationRequirement *v4;

  v4 = objc_alloc_init(PKPassAuxiliaryRegistrationRequirement);
  -[PKPassAuxiliaryRegistrationRequirement _copyInto:](self, "_copyInto:", v4);
  return v4;
}

- (void)_copyInto:(id)a3
{
  NSString *identifier;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  identifier = self->_identifier;
  v5 = a3;
  v6 = -[NSString copy](identifier, "copy");
  v7 = (void *)v5[2];
  v5[2] = v6;

  v5[5] = self->_registrationBackoffCounter;
  v5[3] = self->_numberOfKeys;
  *((_BYTE *)v5 + 8) = self->_canLocallyInvalidateRegistrationState;
  *((_BYTE *)v5 + 9) = self->_canLocallyValidateRegistrationState;
  v8 = -[NSArray copy](self->_supportedVersions, "copy");
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[PKPassAuxiliaryCapabilityKeyCreationMetadata copy](self->_keyCreationMetadata, "copy");
  v11 = (id)v5[6];
  v5[6] = v10;

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int64_t)numberOfKeys
{
  return self->_numberOfKeys;
}

- (NSArray)supportedVersions
{
  return self->_supportedVersions;
}

- (BOOL)canLocallyInvalidateRegistrationState
{
  return self->_canLocallyInvalidateRegistrationState;
}

- (BOOL)canLocallyValidateRegistrationState
{
  return self->_canLocallyValidateRegistrationState;
}

- (int64_t)registrationBackoffCounter
{
  return self->_registrationBackoffCounter;
}

- (void)setRegistrationBackoffCounter:(int64_t)a3
{
  self->_registrationBackoffCounter = a3;
}

- (PKPassAuxiliaryCapabilityKeyCreationMetadata)keyCreationMetadata
{
  return self->_keyCreationMetadata;
}

- (void)setKeyCreationMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_keyCreationMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyCreationMetadata, 0);
  objc_storeStrong((id *)&self->_supportedVersions, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
