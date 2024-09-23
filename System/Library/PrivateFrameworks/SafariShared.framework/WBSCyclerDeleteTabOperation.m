@implementation WBSCyclerDeleteTabOperation

- (void)executeWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "topLevelItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__WBSCyclerDeleteTabOperation_executeWithContext_completionHandler___block_invoke;
  v11[3] = &unk_1E4B38880;
  v9 = v6;
  v12 = v9;
  objc_msgSend(v9, "randomDescendantOfList:enforcingTitlePrefixValidity:passingTest:", v8, 1, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    && +[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:](WBSCyclerRandomnessUtilities, "randomIntegerWithUpperBound:", 2))
  {
    -[WBSCyclerDeleteTabOperation _deleteRandomTabFromTabGroup:withContext:completionHandler:](self, "_deleteRandomTabFromTabGroup:withContext:completionHandler:", v10, v9, v7);
  }
  else
  {
    -[WBSCyclerDeleteTabOperation _deleteRandomTabGroupWithContext:completionHandler:](self, "_deleteRandomTabGroupWithContext:completionHandler:", v9, v7);
  }

}

BOOL __68__WBSCyclerDeleteTabOperation_executeWithContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  char isKindOfClass;
  _BOOL8 v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "topLevelItem");
  v4 = objc_claimAutoreleasedReturnValue();
  if ((id)v4 == v3)
  {

    goto LABEL_5;
  }
  v5 = (void *)v4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v7 = objc_msgSend(v3, "numberOfTabs") != 0;
LABEL_6:

  return v7;
}

- (void)_deleteRandomTabFromTabGroup:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "randomTabDescendant");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = v12;
      objc_msgSend(v11, "title");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "url");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uniqueIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v14;
      v22 = 2114;
      v23 = v15;
      v24 = 2112;
      v25 = v16;
      _os_log_impl(&dword_1A3D90000, v13, OS_LOG_TYPE_INFO, "Deleting tab with title %{public}@ and URL %{public}@ (%@)", (uint8_t *)&v20, 0x20u);

    }
    objc_msgSend(v11, "uniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniqueIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSCyclerDeleteTabOperation _deleteItemWithIdentifier:fromParentWithIdentifier:isTab:inContext:completionHandler:](self, "_deleteItemWithIdentifier:fromParentWithIdentifier:isTab:inContext:completionHandler:", v17, v18, 1, v9, v10);

  }
  else
  {
    objc_msgSend(v9, "topLevelItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v19);

  }
}

- (void)_deleteRandomTabGroupWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "tabGroupsParent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "randomTabGroupDescendant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = v10;
      objc_msgSend(v9, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_1A3D90000, v11, OS_LOG_TYPE_INFO, "Deleting tab group with title %{public}@ (%@)", (uint8_t *)&v17, 0x16u);

    }
    objc_msgSend(v9, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSCyclerDeleteTabOperation _deleteItemWithIdentifier:fromParentWithIdentifier:isTab:inContext:completionHandler:](self, "_deleteItemWithIdentifier:fromParentWithIdentifier:isTab:inContext:completionHandler:", v14, v15, 0, v6, v7);

  }
  else
  {
    objc_msgSend(v6, "topLevelItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v16);

  }
}

- (void)_deleteItemWithIdentifier:(id)a3 fromParentWithIdentifier:(id)a4 isTab:(BOOL)a5 inContext:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  BOOL v25;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  objc_msgSend(v13, "testTarget");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __116__WBSCyclerDeleteTabOperation__deleteItemWithIdentifier_fromParentWithIdentifier_isTab_inContext_completionHandler___block_invoke;
  v20[3] = &unk_1E4B29F70;
  v21 = v13;
  v22 = v11;
  v23 = v12;
  v24 = v14;
  v25 = a5;
  v16 = v12;
  v17 = v11;
  v18 = v13;
  v19 = v14;
  objc_msgSend(v15, "deleteBookmarkWithIdentifier:reply:", v17, v20);

}

void __116__WBSCyclerDeleteTabOperation__deleteItemWithIdentifier_fromParentWithIdentifier_isTab_inContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  WBSCyclerBookmarkLeafRepresentation *v7;
  void *v8;
  void *v9;
  WBSCyclerBookmarkLeafRepresentation *v10;
  uint64_t v11;
  id v12;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "topLevelItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v3, "copy");

    objc_msgSend(v12, "descendantWithUniqueIdentifier:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deleteDescendant:", v4);
    objc_msgSend(v12, "descendantWithUniqueIdentifier:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (*(_BYTE *)(a1 + 64) && objc_msgSend(v5, "numberOfChildren") == 1)
    {
      v7 = [WBSCyclerBookmarkLeafRepresentation alloc];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[WBSCyclerBookmarkLeafRepresentation initWithURL:title:uniqueIdentifier:](v7, "initWithURL:title:uniqueIdentifier:", 0, CFSTR("Start Page"), v9);

      objc_msgSend(v6, "insertChild:atIndex:", v10, 1);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "topLevelItem");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v12);
  }

}

@end
