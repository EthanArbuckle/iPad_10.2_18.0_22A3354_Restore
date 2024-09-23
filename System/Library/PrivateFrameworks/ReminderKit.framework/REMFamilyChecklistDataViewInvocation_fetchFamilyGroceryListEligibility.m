@implementation REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility)initWithLocaleIdentifier:(id)a3
{
  id v5;
  REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility *v6;
  REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility;
  v6 = -[REMStoreInvocationValueStorage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_localeIdentifier, a3);

  return v7;
}

- (REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localeIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility initWithLocaleIdentifier:](self, "initWithLocaleIdentifier:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility localeIdentifier](self, "localeIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("localeIdentifier"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility localeIdentifier](self, "localeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localeIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v5 == (void *)v6)
    {
      v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      -[REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility localeIdentifier](self, "localeIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localeIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility;
  return -[REMStoreInvocationValueStorage hash](&v3, sel_hash);
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

@end
