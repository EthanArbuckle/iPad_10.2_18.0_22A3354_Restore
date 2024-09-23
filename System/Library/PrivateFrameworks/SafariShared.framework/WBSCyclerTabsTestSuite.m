@implementation WBSCyclerTabsTestSuite

- (id)operations
{
  if (operations_onceToken_0 != -1)
    dispatch_once(&operations_onceToken_0, &__block_literal_global_40);
  return (id)operations_operations_0;
}

void __36__WBSCyclerTabsTestSuite_operations__block_invoke()
{
  WBSCyclerCreateTabGroupRelatedItemOperation *v0;
  WBSCyclerDeleteTabOperation *v1;
  WBSCyclerMoveTabOperation *v2;
  WBSCyclerModifyTabOperation *v3;
  WBSCyclerCreateProfileOperation *v4;
  WBSCyclerMoveTabGroupOperation *v5;
  WBSCyclerDeleteProfileOperation *v6;
  WBSCyclerModifyProfileOperation *v7;
  WBSCyclerSyncReloadOperation *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[10];

  v11[9] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(WBSCyclerCreateTabGroupRelatedItemOperation);
  v11[0] = v0;
  v1 = objc_alloc_init(WBSCyclerDeleteTabOperation);
  v11[1] = v1;
  v2 = objc_alloc_init(WBSCyclerMoveTabOperation);
  v11[2] = v2;
  v3 = objc_alloc_init(WBSCyclerModifyTabOperation);
  v11[3] = v3;
  v4 = objc_alloc_init(WBSCyclerCreateProfileOperation);
  v11[4] = v4;
  v5 = objc_alloc_init(WBSCyclerMoveTabGroupOperation);
  v11[5] = v5;
  v6 = objc_alloc_init(WBSCyclerDeleteProfileOperation);
  v11[6] = v6;
  v7 = objc_alloc_init(WBSCyclerModifyProfileOperation);
  v11[7] = v7;
  v8 = objc_alloc_init(WBSCyclerSyncReloadOperation);
  v11[8] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 9);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)operations_operations_0;
  operations_operations_0 = v9;

}

- (id)relativeProbabilitiesForOperationsWithTopLevelItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "numberOfChildren"))
  {
    v5 = &unk_1E4B879B8;
    if (objc_msgSend(v4, "containsChildPassingTest:", &__block_literal_global_11_0))
    {
      if ((unint64_t)objc_msgSend(v4, "numberOfChildren") < 2)
      {
        v6 = &unk_1E4B879E8;
      }
      else
      {
        v5 = &unk_1E4B879D0;
        v6 = &unk_1E4B879D0;
      }
    }
    else
    {
      v6 = &unk_1E4B879E8;
    }
    objc_msgSend(v4, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D89E20]);

    if (v9)
      v10 = &unk_1E4B879E8;
    else
      v10 = &unk_1E4B87A00;
    v13[0] = v5;
    v13[1] = &unk_1E4B87A18;
    v13[2] = v6;
    v13[3] = &unk_1E4B879D0;
    v13[4] = &unk_1E4B87A18;
    v13[5] = &unk_1E4B87A30;
    v13[6] = v10;
    v13[7] = &unk_1E4B87A18;
    v13[8] = &unk_1E4B87A00;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WBSCyclerTabsTestSuite _relativeProbabilitiesForOperationsWithNoTabGroups](self, "_relativeProbabilitiesForOperationsWithNoTabGroups");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v7;

  return v11;
}

BOOL __77__WBSCyclerTabsTestSuite_relativeProbabilitiesForOperationsWithTopLevelItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "numberOfTabs") != 0;
}

- (id)_relativeProbabilitiesForOperationsWithNoTabGroups
{
  if (_relativeProbabilitiesForOperationsWithNoTabGroups_onceToken != -1)
    dispatch_once(&_relativeProbabilitiesForOperationsWithNoTabGroups_onceToken, &__block_literal_global_18_0);
  return (id)_relativeProbabilitiesForOperationsWithNoTabGroups_relativeProbabilitiesForOperations;
}

void __76__WBSCyclerTabsTestSuite__relativeProbabilitiesForOperationsWithNoTabGroups__block_invoke()
{
  void *v0;

  v0 = (void *)_relativeProbabilitiesForOperationsWithNoTabGroups_relativeProbabilitiesForOperations;
  _relativeProbabilitiesForOperationsWithNoTabGroups_relativeProbabilitiesForOperations = (uint64_t)&unk_1E4B87658;

}

@end
