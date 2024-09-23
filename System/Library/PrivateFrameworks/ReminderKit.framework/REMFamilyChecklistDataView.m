@implementation REMFamilyChecklistDataView

- (REMFamilyChecklistDataView)initWithStore:(id)a3
{
  id v5;
  REMFamilyChecklistDataView *v6;
  REMFamilyChecklistDataView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMFamilyChecklistDataView;
  v6 = -[REMFamilyChecklistDataView init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

- (id)fetchSharedGroceryListsWithCommonSharees:(id)a3 error:(id *)a4
{
  id v6;
  REMFamilyChecklistDataViewInvocation_fetchSharedGroceryLists *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = -[REMFamilyChecklistDataViewInvocation_fetchSharedGroceryLists initWithCommonSharees:]([REMFamilyChecklistDataViewInvocation_fetchSharedGroceryLists alloc], "initWithCommonSharees:", v6);

  -[REMFamilyChecklistDataView store](self, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resultFromPerformingInvocation:error:", v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  REMDynamicCast(v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sharedGroceryListsWithCommonSharees");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)fetchFamilyGroceryListEligibilityForFamilyChecklistWithLocale:(id)a3 error:(id *)a4
{
  id v6;
  REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility *v7;
  void *v8;
  REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = [REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility alloc];
  objc_msgSend(v6, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility initWithLocaleIdentifier:](v7, "initWithLocaleIdentifier:", v8);
  -[REMFamilyChecklistDataView store](self, "store");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resultFromPerformingInvocation:error:", v9, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_opt_class();
  REMDynamicCast(v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "familyGroceryListEligibility");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (REMStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
