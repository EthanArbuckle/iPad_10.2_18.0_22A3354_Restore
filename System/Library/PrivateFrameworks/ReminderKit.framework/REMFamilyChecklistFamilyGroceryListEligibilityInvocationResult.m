@implementation REMFamilyChecklistFamilyGroceryListEligibilityInvocationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMFamilyChecklistFamilyGroceryListEligibilityInvocationResult)initWithFamilyGroceryListEligibility:(id)a3
{
  id v5;
  REMFamilyChecklistFamilyGroceryListEligibilityInvocationResult *v6;
  REMFamilyChecklistFamilyGroceryListEligibilityInvocationResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMFamilyChecklistFamilyGroceryListEligibilityInvocationResult;
  v6 = -[REMStoreInvocationValueStorage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_familyGroceryListEligibility, a3);

  return v7;
}

- (REMFamilyChecklistFamilyGroceryListEligibilityInvocationResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  REMFamilyChecklistFamilyGroceryListEligibilityInvocationResult *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("familyGroceryListEligibility"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[REMFamilyChecklistFamilyGroceryListEligibilityInvocationResult initWithFamilyGroceryListEligibility:](self, "initWithFamilyGroceryListEligibility:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMFamilyChecklistFamilyGroceryListEligibilityInvocationResult familyGroceryListEligibility](self, "familyGroceryListEligibility");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("familyGroceryListEligibility"));

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
    -[REMFamilyChecklistFamilyGroceryListEligibilityInvocationResult familyGroceryListEligibility](self, "familyGroceryListEligibility");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "familyGroceryListEligibility");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v5 == (void *)v6)
    {
      v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      -[REMFamilyChecklistFamilyGroceryListEligibilityInvocationResult familyGroceryListEligibility](self, "familyGroceryListEligibility");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "familyGroceryListEligibility");
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
  void *v2;
  unint64_t v3;

  -[REMFamilyChecklistFamilyGroceryListEligibilityInvocationResult familyGroceryListEligibility](self, "familyGroceryListEligibility");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (REMFamilyChecklistFamilyGroceryListEligibility)familyGroceryListEligibility
{
  return self->_familyGroceryListEligibility;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyGroceryListEligibility, 0);
}

@end
