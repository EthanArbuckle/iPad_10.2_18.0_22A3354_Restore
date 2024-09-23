@implementation PKPassAuxiliaryRegistrationRequirements

- (PKPassAuxiliaryRegistrationRequirements)initWithDictionary:(id)a3
{
  id v4;
  PKPassAuxiliaryRegistrationRequirements *v5;
  uint64_t v6;
  NSArray *deviceSignatureRequirements;
  void *v8;
  uint64_t v9;
  NSArray *deviceDecryptionRequirements;
  objc_super v12;

  v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)PKPassAuxiliaryRegistrationRequirements;
    v5 = -[PKPassAuxiliaryRegistrationRequirements init](&v12, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("deviceSignatures"));
      self = (PKPassAuxiliaryRegistrationRequirements *)objc_claimAutoreleasedReturnValue();
      -[PKPassAuxiliaryRegistrationRequirements pk_arrayBySafelyApplyingBlock:](self, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_33);
      v6 = objc_claimAutoreleasedReturnValue();
      deviceSignatureRequirements = v5->_deviceSignatureRequirements;
      v5->_deviceSignatureRequirements = (NSArray *)v6;

      objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("deviceDecryptions"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_247);
      v9 = objc_claimAutoreleasedReturnValue();
      deviceDecryptionRequirements = v5->_deviceDecryptionRequirements;
      v5->_deviceDecryptionRequirements = (NSArray *)v9;

    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceDecryptionRequirements, 0);
  objc_storeStrong((id *)&self->_deviceSignatureRequirements, 0);
}

PKPassAuxiliaryRegistrationSignatureRequirement *__62__PKPassAuxiliaryRegistrationRequirements_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKPassAuxiliaryRegistrationSignatureRequirement *v3;

  v2 = a2;
  v3 = -[PKPassAuxiliaryRegistrationSignatureRequirement initWithDictionary:]([PKPassAuxiliaryRegistrationSignatureRequirement alloc], "initWithDictionary:", v2);

  return v3;
}

PKPassAuxiliaryRegistrationDecryptionRequirement *__62__PKPassAuxiliaryRegistrationRequirements_initWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  PKPassAuxiliaryRegistrationDecryptionRequirement *v3;

  v2 = a2;
  v3 = -[PKPassAuxiliaryRegistrationDecryptionRequirement initWithDictionary:]([PKPassAuxiliaryRegistrationDecryptionRequirement alloc], "initWithDictionary:", v2);

  return v3;
}

- (NSArray)allRequirements
{
  id v3;
  void *v4;
  void *v5;
  NSArray *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = v3;
  if (self->_deviceSignatureRequirements)
    objc_msgSend(v3, "addObjectsFromArray:");
  if (self->_deviceDecryptionRequirements)
    objc_msgSend(v4, "addObjectsFromArray:");
  if (objc_msgSend(v4, "count"))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassAuxiliaryRegistrationRequirements)initWithCoder:(id)a3
{
  id v4;
  PKPassAuxiliaryRegistrationRequirements *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *deviceSignatureRequirements;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *deviceDecryptionRequirements;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPassAuxiliaryRegistrationRequirements;
  v5 = -[PKPassAuxiliaryRegistrationRequirements init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("deviceSignatureRequirements"));
    v9 = objc_claimAutoreleasedReturnValue();
    deviceSignatureRequirements = v5->_deviceSignatureRequirements;
    v5->_deviceSignatureRequirements = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("deviceDecryptionRequirements"));
    v14 = objc_claimAutoreleasedReturnValue();
    deviceDecryptionRequirements = v5->_deviceDecryptionRequirements;
    v5->_deviceDecryptionRequirements = (NSArray *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *deviceSignatureRequirements;
  id v5;

  deviceSignatureRequirements = self->_deviceSignatureRequirements;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", deviceSignatureRequirements, CFSTR("deviceSignatureRequirements"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceDecryptionRequirements, CFSTR("deviceDecryptionRequirements"));

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

  objc_msgSend(v6, "appendFormat:", CFSTR("deviceSignatureRequirements: '%@'; "), self->_deviceSignatureRequirements);
  objc_msgSend(v6, "appendFormat:", CFSTR("deviceDecryptionRequirements: '%@'; "), self->_deviceDecryptionRequirements);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_deviceSignatureRequirements)
    objc_msgSend(v3, "addObject:");
  if (self->_deviceDecryptionRequirements)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash(17, v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPassAuxiliaryRegistrationRequirements *v4;
  PKPassAuxiliaryRegistrationRequirements *v5;
  BOOL v6;

  v4 = (PKPassAuxiliaryRegistrationRequirements *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPassAuxiliaryRegistrationRequirements isEqualToPassAuxiliaryRegistrationRequirements:](self, "isEqualToPassAuxiliaryRegistrationRequirements:", v5);

  return v6;
}

- (BOOL)isEqualToPassAuxiliaryRegistrationRequirements:(id)a3
{
  _QWORD *v4;
  NSArray *deviceSignatureRequirements;
  NSArray *v6;
  BOOL v7;
  char v8;
  NSArray *deviceDecryptionRequirements;
  NSArray *v11;

  v4 = a3;
  if (!v4)
    goto LABEL_8;
  deviceSignatureRequirements = self->_deviceSignatureRequirements;
  v6 = (NSArray *)v4[1];
  if (deviceSignatureRequirements)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if ((-[NSArray isEqual:](deviceSignatureRequirements, "isEqual:") & 1) != 0)
      goto LABEL_11;
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  if (deviceSignatureRequirements != v6)
    goto LABEL_8;
LABEL_11:
  deviceDecryptionRequirements = self->_deviceDecryptionRequirements;
  v11 = (NSArray *)v4[2];
  if (deviceDecryptionRequirements && v11)
    v8 = -[NSArray isEqual:](deviceDecryptionRequirements, "isEqual:");
  else
    v8 = deviceDecryptionRequirements == v11;
LABEL_9:

  return v8;
}

- (NSArray)deviceSignatureRequirements
{
  return self->_deviceSignatureRequirements;
}

- (NSArray)deviceDecryptionRequirements
{
  return self->_deviceDecryptionRequirements;
}

@end
