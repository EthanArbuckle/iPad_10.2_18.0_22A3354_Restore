@implementation PKSharingMesageProprietaryData

- (PKSharingMesageProprietaryData)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKSharingMesageProprietaryData;
  return -[PKSharingMesageProprietaryData init](&v3, sel_init);
}

- (PKSharingMesageProprietaryData)initWithDictionary:(id)a3
{
  id v4;
  PKSharingMesageProprietaryData *v5;
  void *v6;
  uint64_t v7;
  NSArray *displayableSharedEntitlements;
  void *v9;
  PKSharingMesageProprietaryData *v10;

  v4 = a3;
  if (v4)
  {
    v5 = -[PKSharingMesageProprietaryData init](self, "init");
    if (v5)
    {
      objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("displayableSharedEntitlements"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_14);
      v7 = objc_claimAutoreleasedReturnValue();
      displayableSharedEntitlements = v5->_displayableSharedEntitlements;
      v5->_displayableSharedEntitlements = (NSArray *)v7;

      objc_msgSend(v4, "PKStringForKey:", CFSTR("accessType"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_accessType = PKSecureElementAccessPassTypeFromString(v9);

    }
    self = v5;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

PKDisplayablePassEntitlement *__53__PKSharingMesageProprietaryData_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKDisplayablePassEntitlement *v3;

  v2 = a2;
  v3 = -[PKDisplayablePassEntitlement initWithDictionary:]([PKDisplayablePassEntitlement alloc], "initWithDictionary:", v2);

  return v3;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSArray pk_arrayByApplyingBlock:](self->_displayableSharedEntitlements, "pk_arrayByApplyingBlock:", &__block_literal_global_15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("displayableSharedEntitlements"));

  PKSecureElementAccessPassTypeToString(self->_accessType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accessType"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

uint64_t __58__PKSharingMesageProprietaryData_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("displayableSharedEntitlements: '%@'; "),
    self->_displayableSharedEntitlements);
  PKSecureElementAccessPassTypeToString(self->_accessType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("accessType: '%@'; "), v7);

  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)displayableSharedEntitlements
{
  return self->_displayableSharedEntitlements;
}

- (void)setDisplayableSharedEntitlements:(id)a3
{
  objc_storeStrong((id *)&self->_displayableSharedEntitlements, a3);
}

- (int64_t)accessType
{
  return self->_accessType;
}

- (void)setAccessType:(int64_t)a3
{
  self->_accessType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayableSharedEntitlements, 0);
}

@end
