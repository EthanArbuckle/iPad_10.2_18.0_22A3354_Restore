@implementation PKAuxiliaryCapabilityRequirementKeyMaterial

- (PKAuxiliaryCapabilityRequirementKeyMaterial)initWithKeyMaterialContents:(id)a3
{
  id v4;
  PKAuxiliaryCapabilityRequirementKeyMaterial *v5;
  PKAuxiliaryCapabilityRequirementKeyMaterial *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKAuxiliaryCapabilityRequirementKeyMaterial;
  v5 = -[PKAuxiliaryCapabilityRequirementKeyMaterial init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PKAuxiliaryCapabilityRequirementKeyMaterial setContents:](v5, "setContents:", v4);

  return v6;
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

  objc_msgSend(v6, "appendFormat:", CFSTR("version: '%@'; "), self->_version);
  objc_msgSend(v6, "appendFormat:", CFSTR("contents: '%@'; "), self->_contents);
  objc_msgSend(v6, "appendFormat:", CFSTR("rootAttestation: '%@'; "), self->_rootAttestation);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = v3;
  if (self->_contents)
    objc_msgSend(v3, "addObject:");
  if (self->_encryptedContents)
    objc_msgSend(v4, "addObject:");
  if (self->_rootAttestation)
    objc_msgSend(v4, "addObject:");
  if (self->_version)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash(17, v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKAuxiliaryCapabilityRequirementKeyMaterial *v4;
  PKAuxiliaryCapabilityRequirementKeyMaterial *v5;
  BOOL v6;

  v4 = (PKAuxiliaryCapabilityRequirementKeyMaterial *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAuxiliaryCapabilityRequirementKeyMaterial isEqualToAuxiliaryCapabilityRequirementKey:](self, "isEqualToAuxiliaryCapabilityRequirementKey:", v5);

  return v6;
}

- (BOOL)isEqualToAuxiliaryCapabilityRequirementKey:(id)a3
{
  _QWORD *v4;
  NSArray *rootAttestation;
  NSArray *v6;
  BOOL v7;
  NSString *version;
  NSString *v9;
  NSArray *contents;
  NSArray *v11;
  NSArray *encryptedContents;
  NSArray *v13;
  char v14;

  v4 = a3;
  if (!v4)
    goto LABEL_22;
  rootAttestation = self->_rootAttestation;
  v6 = (NSArray *)v4[3];
  if (rootAttestation)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (rootAttestation != v6)
      goto LABEL_22;
  }
  else if ((-[NSArray isEqual:](rootAttestation, "isEqual:") & 1) == 0)
  {
    goto LABEL_22;
  }
  version = self->_version;
  v9 = (NSString *)v4[4];
  if (version && v9)
  {
    if ((-[NSString isEqual:](version, "isEqual:") & 1) == 0)
      goto LABEL_22;
  }
  else if (version != v9)
  {
    goto LABEL_22;
  }
  contents = self->_contents;
  v11 = (NSArray *)v4[1];
  if (!contents || !v11)
  {
    if (contents == v11)
      goto LABEL_18;
LABEL_22:
    v14 = 0;
    goto LABEL_23;
  }
  if ((-[NSArray isEqual:](contents, "isEqual:") & 1) == 0)
    goto LABEL_22;
LABEL_18:
  encryptedContents = self->_encryptedContents;
  v13 = (NSArray *)v4[2];
  if (encryptedContents && v13)
    v14 = -[NSArray isEqual:](encryptedContents, "isEqual:");
  else
    v14 = encryptedContents == v13;
LABEL_23:

  return v14;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSArray pk_arrayByApplyingBlock:](self->_contents, "pk_arrayByApplyingBlock:", &__block_literal_global_151_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("contents"));

  -[NSArray pk_arrayBySafelyApplyingBlock:](self->_rootAttestation, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_152_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("rootAttestation"));

  -[NSArray pk_arrayByApplyingBlock:](self->_encryptedContents, "pk_arrayByApplyingBlock:", &__block_literal_global_154_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("encryptedContents"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_version, CFSTR("version"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

uint64_t __71__PKAuxiliaryCapabilityRequirementKeyMaterial_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

uint64_t __71__PKAuxiliaryCapabilityRequirementKeyMaterial_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "base64EncodedStringWithOptions:", 0);
}

uint64_t __71__PKAuxiliaryCapabilityRequirementKeyMaterial_dictionaryRepresentation__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *contents;
  id v5;

  contents = self->_contents;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contents, CFSTR("contents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_encryptedContents, CFSTR("encryptedContents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rootAttestation, CFSTR("rootAttestation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_version, CFSTR("version"));

}

- (PKAuxiliaryCapabilityRequirementKeyMaterial)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PKAuxiliaryCapabilityRequirementKeyMaterial *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *encryptedContents;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSArray *rootAttestation;
  uint64_t v20;
  NSString *version;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("contents"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PKAuxiliaryCapabilityRequirementKeyMaterial initWithKeyMaterialContents:](self, "initWithKeyMaterialContents:", v8);
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0C99E60]);
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithArray:", v11);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("encryptedContents"));
    v13 = objc_claimAutoreleasedReturnValue();
    encryptedContents = v9->_encryptedContents;
    v9->_encryptedContents = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("rootAttestation"));
    v18 = objc_claimAutoreleasedReturnValue();
    rootAttestation = v9->_rootAttestation;
    v9->_rootAttestation = (NSArray *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v20 = objc_claimAutoreleasedReturnValue();
    version = v9->_version;
    v9->_version = (NSString *)v20;

  }
  return v9;
}

- (NSArray)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
  objc_storeStrong((id *)&self->_contents, a3);
}

- (NSArray)encryptedContents
{
  return self->_encryptedContents;
}

- (void)setEncryptedContents:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedContents, a3);
}

- (NSArray)rootAttestation
{
  return self->_rootAttestation;
}

- (void)setRootAttestation:(id)a3
{
  objc_storeStrong((id *)&self->_rootAttestation, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_rootAttestation, 0);
  objc_storeStrong((id *)&self->_encryptedContents, 0);
  objc_storeStrong((id *)&self->_contents, 0);
}

@end
