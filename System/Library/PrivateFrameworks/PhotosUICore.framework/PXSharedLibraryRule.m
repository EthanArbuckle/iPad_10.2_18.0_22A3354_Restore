@implementation PXSharedLibraryRule

- (PXSharedLibraryRule)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryRule.m"), 18, CFSTR("%s is not available as initializer"), "-[PXSharedLibraryRule init]");

  abort();
}

- (id)_initWithAutoSharePolicy:(int64_t)a3 startDate:(id)a4 personUUIDs:(id)a5 assetLocalIdentifiers:(id)a6
{
  id v11;
  id v12;
  id v13;
  PXSharedLibraryRule *v14;
  PXSharedLibraryRule *v15;
  uint64_t v16;
  NSDate *startDate;
  uint64_t v18;
  NSArray *personUUIDs;
  uint64_t v20;
  NSArray *assetLocalIdentifiers;
  void *v23;
  objc_super v24;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryRule.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personUUIDs"));

  }
  v24.receiver = self;
  v24.super_class = (Class)PXSharedLibraryRule;
  v14 = -[PXSharedLibraryRule init](&v24, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_autoSharePolicy = a3;
    v16 = objc_msgSend(v11, "copy");
    startDate = v15->_startDate;
    v15->_startDate = (NSDate *)v16;

    v18 = objc_msgSend(v12, "copy");
    personUUIDs = v15->_personUUIDs;
    v15->_personUUIDs = (NSArray *)v18;

    v20 = objc_msgSend(v13, "copy");
    assetLocalIdentifiers = v15->_assetLocalIdentifiers;
    v15->_assetLocalIdentifiers = (NSArray *)v20;

  }
  return v15;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSDate *startDate;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  PXSharedLibraryAutoSharePolicyDescription(self->_autoSharePolicy);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  startDate = self->_startDate;
  -[NSArray componentsJoinedByString:](self->_personUUIDs, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p, policy:%@, startDate:%@, personUUIDs:(%@)>"), v4, self, v5, startDate, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)autoSharePolicy
{
  return self->_autoSharePolicy;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSArray)personUUIDs
{
  return self->_personUUIDs;
}

- (NSArray)assetLocalIdentifiers
{
  return self->_assetLocalIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_personUUIDs, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

+ (id)manualRule
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v2, "_initWithAutoSharePolicy:startDate:personUUIDs:assetLocalIdentifiers:", 0, 0, MEMORY[0x1E0C9AA60], 0);
}

+ (id)manualRuleWithAssetLocalIdentifiers:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = (void *)objc_msgSend(v5, "_initWithAutoSharePolicy:startDate:personUUIDs:assetLocalIdentifiers:", 0, 0, MEMORY[0x1E0C9AA60], v4);

  return v6;
}

+ (id)everythingRule
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v2, "_initWithAutoSharePolicy:startDate:personUUIDs:assetLocalIdentifiers:", 1, 0, MEMORY[0x1E0C9AA60], 0);
}

+ (id)customizedRuleWithStartDate:(id)a3 personUUIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithAutoSharePolicy:startDate:personUUIDs:assetLocalIdentifiers:", 2, v7, v6, 0);

  return v8;
}

@end
