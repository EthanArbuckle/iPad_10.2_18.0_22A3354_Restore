@implementation WBSCyclerModifyTabOperation

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
  v11[2] = __68__WBSCyclerModifyTabOperation_executeWithContext_completionHandler___block_invoke;
  v11[3] = &unk_1E4B38880;
  v9 = v6;
  v12 = v9;
  objc_msgSend(v9, "randomDescendantOfList:enforcingTitlePrefixValidity:passingTest:", v8, 1, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    && +[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:](WBSCyclerRandomnessUtilities, "randomIntegerWithUpperBound:", 2))
  {
    -[WBSCyclerModifyTabOperation _modifyRandomTabInTabGroup:withContext:completionHandler:](self, "_modifyRandomTabInTabGroup:withContext:completionHandler:", v10, v9, v7);
  }
  else
  {
    -[WBSCyclerModifyTabOperation _modifyRandomTabGroupWithContext:completionHandler:](self, "_modifyRandomTabGroupWithContext:completionHandler:", v9, v7);
  }

}

BOOL __68__WBSCyclerModifyTabOperation_executeWithContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  _BOOL8 v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "topLevelItem");
  v4 = objc_claimAutoreleasedReturnValue();
  if ((id)v4 == v3)
  {
    v8 = 0;
    v7 = v3;
  }
  else
  {
    v5 = (void *)v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "randomTabDescendant");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;
  }

LABEL_7:
  return v8;
}

- (void)_modifyRandomTabInTabGroup:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v8 = (void (**)(id, void *))a5;
  objc_msgSend(a3, "randomTabDescendant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (+[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:](WBSCyclerRandomnessUtilities, "randomIntegerWithUpperBound:", 2))
    {
      -[WBSCyclerModifyTabOperation _updateTitleOfTab:withContext:completionHandler:](self, "_updateTitleOfTab:withContext:completionHandler:", v9, v11, v8);
    }
    else
    {
      -[WBSCyclerModifyTabOperation _updateURLOfTab:withContext:completionHandler:](self, "_updateURLOfTab:withContext:completionHandler:", v9, v11, v8);
    }
  }
  else
  {
    objc_msgSend(v11, "topLevelItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v10);

  }
}

- (void)_updateTitleOfTab:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "randomItemTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    objc_msgSend(v7, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v13;
    v29 = 2114;
    v30 = v14;
    v31 = 2114;
    v32 = v10;
    _os_log_impl(&dword_1A3D90000, v12, OS_LOG_TYPE_INFO, "Changing title of tab (identifier: %{public}@) from %{public}@ to %{public}@", buf, 0x20u);

  }
  objc_msgSend(v9, "topLevelItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "testTarget");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "uniqueIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __79__WBSCyclerModifyTabOperation__updateTitleOfTab_withContext_completionHandler___block_invoke;
  v22[3] = &unk_1E4B38708;
  v23 = v15;
  v24 = v7;
  v25 = v10;
  v26 = v8;
  v18 = v10;
  v19 = v7;
  v20 = v15;
  v21 = v8;
  objc_msgSend(v16, "setTitle:forBookmarkWithIdentifier:reply:", v18, v17, v22);

}

void __79__WBSCyclerModifyTabOperation__updateTitleOfTab_withContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  id v5;

  if ((a2 & 1) != 0)
  {
    v5 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "descendantWithUniqueIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setTitle:", *(_QWORD *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (void)_updateURLOfTab:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = a4;
  +[WBSCyclerRandomnessUtilities randomURL](WBSCyclerRandomnessUtilities, "randomURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    objc_msgSend(v7, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v13;
    v29 = 2114;
    v30 = v14;
    v31 = 2114;
    v32 = v10;
    _os_log_impl(&dword_1A3D90000, v12, OS_LOG_TYPE_INFO, "Changing URL of tab (identifier: %{public}@) from %{public}@ to %{public}@", buf, 0x20u);

  }
  objc_msgSend(v9, "topLevelItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "testTarget");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "uniqueIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __77__WBSCyclerModifyTabOperation__updateURLOfTab_withContext_completionHandler___block_invoke;
  v22[3] = &unk_1E4B38708;
  v23 = v15;
  v24 = v7;
  v25 = v10;
  v26 = v8;
  v18 = v10;
  v19 = v7;
  v20 = v15;
  v21 = v8;
  objc_msgSend(v16, "setURL:forBookmarkWithIdentifier:reply:", v18, v17, v22);

}

void __77__WBSCyclerModifyTabOperation__updateURLOfTab_withContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  id v5;

  if ((a2 & 1) != 0)
  {
    v5 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "descendantWithUniqueIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setURL:", *(_QWORD *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (void)_modifyRandomTabGroupWithContext:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "tabGroupsParent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "randomTabGroupDescendant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v5, "randomItemTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = v10;
      objc_msgSend(v8, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v12;
      v27 = 2114;
      v28 = v13;
      v29 = 2114;
      v30 = v9;
      _os_log_impl(&dword_1A3D90000, v11, OS_LOG_TYPE_INFO, "Changing title of tab group (identifier: %{public}@) from %{public}@ to %{public}@", buf, 0x20u);

    }
    objc_msgSend(v5, "topLevelItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "testTarget");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __82__WBSCyclerModifyTabOperation__modifyRandomTabGroupWithContext_completionHandler___block_invoke;
    v20[3] = &unk_1E4B38708;
    v24 = v6;
    v21 = v14;
    v22 = v8;
    v23 = v9;
    v17 = v9;
    v18 = v14;
    objc_msgSend(v15, "setTitle:forBookmarkWithIdentifier:reply:", v17, v16, v20);

  }
  else
  {
    objc_msgSend(v5, "topLevelItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v19);

  }
}

void __82__WBSCyclerModifyTabOperation__modifyRandomTabGroupWithContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  id v5;

  if ((a2 & 1) != 0)
  {
    v5 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "descendantWithUniqueIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setTitle:", *(_QWORD *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

@end
