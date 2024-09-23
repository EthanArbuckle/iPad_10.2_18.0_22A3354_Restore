@implementation WBSCyclerModifyProfileOperation

- (void)executeWithContext:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, void *))a4;
  objc_msgSend(v9, "tabGroupsParent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (+[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:](WBSCyclerRandomnessUtilities, "randomIntegerWithUpperBound:", 2))
    {
      -[WBSCyclerModifyProfileOperation _updateTitleOfProfile:withContext:completionHandler:](self, "_updateTitleOfProfile:withContext:completionHandler:", v7, v9, v6);
    }
    else
    {
      -[WBSCyclerModifyProfileOperation _updateIconOfProfile:withContext:completionHandler:](self, "_updateIconOfProfile:withContext:completionHandler:", v7, v9, v6);
    }
  }
  else
  {
    objc_msgSend(v9, "topLevelItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8);

  }
}

- (void)_updateTitleOfProfile:(id)a3 withContext:(id)a4 completionHandler:(id)a5
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
    _os_log_impl(&dword_1A3D90000, v12, OS_LOG_TYPE_INFO, "Changing title of profile (identifier: %{public}@) from %{public}@ to %{public}@", buf, 0x20u);

  }
  objc_msgSend(v9, "topLevelItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "testTarget");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "uniqueIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __87__WBSCyclerModifyProfileOperation__updateTitleOfProfile_withContext_completionHandler___block_invoke;
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

void __87__WBSCyclerModifyProfileOperation__updateTitleOfProfile_withContext_completionHandler___block_invoke(uint64_t a1, char a2)
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

- (void)_updateIconOfProfile:(id)a3 withContext:(id)a4 completionHandler:(id)a5
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
  objc_msgSend(v9, "randomSymbolImageName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    objc_msgSend(v7, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "symbolImageName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v13;
    v29 = 2114;
    v30 = v14;
    v31 = 2114;
    v32 = v10;
    _os_log_impl(&dword_1A3D90000, v12, OS_LOG_TYPE_INFO, "Changing icon of profile (identifier: %{public}@) from %{public}@ to %{public}@", buf, 0x20u);

  }
  objc_msgSend(v9, "topLevelItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "testTarget");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "uniqueIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __86__WBSCyclerModifyProfileOperation__updateIconOfProfile_withContext_completionHandler___block_invoke;
  v22[3] = &unk_1E4B38708;
  v23 = v15;
  v24 = v7;
  v25 = v10;
  v26 = v8;
  v18 = v10;
  v19 = v7;
  v20 = v15;
  v21 = v8;
  objc_msgSend(v16, "setSymbolImageName:forBookmarkWithIdentifier:reply:", v18, v17, v22);

}

void __86__WBSCyclerModifyProfileOperation__updateIconOfProfile_withContext_completionHandler___block_invoke(uint64_t a1, char a2)
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

    objc_msgSend(v4, "setSymbolImageName:", *(_QWORD *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

@end
