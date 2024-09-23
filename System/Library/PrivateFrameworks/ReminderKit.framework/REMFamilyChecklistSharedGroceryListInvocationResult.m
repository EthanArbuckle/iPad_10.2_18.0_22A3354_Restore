@implementation REMFamilyChecklistSharedGroceryListInvocationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMFamilyChecklistSharedGroceryListInvocationResult)initWithSharedGroceryLists:(id)a3
{
  id v5;
  REMFamilyChecklistSharedGroceryListInvocationResult *v6;
  REMFamilyChecklistSharedGroceryListInvocationResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMFamilyChecklistSharedGroceryListInvocationResult;
  v6 = -[REMStoreInvocationValueStorage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sharedGroceryListsWithCommonSharees, a3);

  return v7;
}

- (REMFamilyChecklistSharedGroceryListInvocationResult)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  REMFamilyChecklistSharedGroceryListInvocationResult *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("sharedGroceryListsWithCommonSharees"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    self = -[REMFamilyChecklistSharedGroceryListInvocationResult initWithSharedGroceryLists:](self, "initWithSharedGroceryLists:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMFamilyChecklistSharedGroceryListInvocationResult sharedGroceryListsWithCommonSharees](self, "sharedGroceryListsWithCommonSharees");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sharedGroceryListsWithCommonSharees"));

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
    -[REMFamilyChecklistSharedGroceryListInvocationResult sharedGroceryListsWithCommonSharees](self, "sharedGroceryListsWithCommonSharees");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sharedGroceryListsWithCommonSharees");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v5 == (void *)v6)
    {
      v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      -[REMFamilyChecklistSharedGroceryListInvocationResult sharedGroceryListsWithCommonSharees](self, "sharedGroceryListsWithCommonSharees");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sharedGroceryListsWithCommonSharees");
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

  -[REMFamilyChecklistSharedGroceryListInvocationResult sharedGroceryListsWithCommonSharees](self, "sharedGroceryListsWithCommonSharees");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSArray)sharedGroceryListsWithCommonSharees
{
  return self->_sharedGroceryListsWithCommonSharees;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedGroceryListsWithCommonSharees, 0);
}

@end
