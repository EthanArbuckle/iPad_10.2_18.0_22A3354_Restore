@implementation WBSCyclerModifyBookmarkOperation

- (void)executeWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void (**v15)(void);
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  WBSCyclerModifyBookmarkOperation *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "randomValidStrictDescendantOfTopLevelItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __73__WBSCyclerModifyBookmarkOperation_executeWithContext_completionHandler___block_invoke;
    v24[3] = &unk_1E4B38908;
    v24[4] = self;
    v10 = v8;
    v25 = v10;
    v11 = v6;
    v26 = v11;
    v12 = v7;
    v27 = v12;
    v13 = (void *)MEMORY[0x1A8599ED0](v24);
    objc_msgSend(v9, "addObject:", v13);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __73__WBSCyclerModifyBookmarkOperation_executeWithContext_completionHandler___block_invoke_2;
      v19 = &unk_1E4B38908;
      v20 = self;
      v21 = v10;
      v22 = v11;
      v23 = v12;
      v14 = (void *)MEMORY[0x1A8599ED0](&v16);
      objc_msgSend(v9, "addObject:", v14, v16, v17, v18, v19, v20);

    }
    +[WBSCyclerRandomnessUtilities randomElementOfArray:](WBSCyclerRandomnessUtilities, "randomElementOfArray:", v9);
    v15 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v15[2]();

  }
  else
  {
    objc_msgSend(v6, "topLevelItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v9);
  }

}

uint64_t __73__WBSCyclerModifyBookmarkOperation_executeWithContext_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_changeTitleOfBookmark:withContext:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __73__WBSCyclerModifyBookmarkOperation_executeWithContext_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_changeURLOfBookmark:withContext:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_changeTitleOfBookmark:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "randomItemTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    objc_msgSend(v7, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v27 = v11;
    v28 = 2114;
    v29 = v14;
    v30 = 2114;
    v31 = v10;
    _os_log_impl(&dword_1A3D90000, v13, OS_LOG_TYPE_INFO, "Changing title of bookmark (identifier: %{public}@) from %{public}@ to %{public}@", buf, 0x20u);

  }
  objc_msgSend(v9, "topLevelItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "testTarget");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __89__WBSCyclerModifyBookmarkOperation__changeTitleOfBookmark_withContext_completionHandler___block_invoke;
  v21[3] = &unk_1E4B38708;
  v22 = v15;
  v23 = v11;
  v24 = v10;
  v25 = v8;
  v17 = v10;
  v18 = v11;
  v19 = v15;
  v20 = v8;
  objc_msgSend(v16, "setTitle:forBookmarkWithIdentifier:reply:", v17, v18, v21);

}

void __89__WBSCyclerModifyBookmarkOperation__changeTitleOfBookmark_withContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  id v4;

  if ((a2 & 1) != 0)
  {
    v4 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(v4, "descendantWithUniqueIdentifier:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitle:", *(_QWORD *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (void)_changeURLOfBookmark:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = a4;
  +[WBSCyclerRandomnessUtilities randomURL](WBSCyclerRandomnessUtilities, "randomURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    objc_msgSend(v7, "url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v27 = v11;
    v28 = 2114;
    v29 = v14;
    v30 = 2114;
    v31 = v10;
    _os_log_impl(&dword_1A3D90000, v13, OS_LOG_TYPE_INFO, "Changing URL of bookmark (identifier: %{public}@) from %{public}@ to %{public}@", buf, 0x20u);

  }
  objc_msgSend(v9, "topLevelItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "testTarget");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __87__WBSCyclerModifyBookmarkOperation__changeURLOfBookmark_withContext_completionHandler___block_invoke;
  v21[3] = &unk_1E4B38708;
  v22 = v15;
  v23 = v11;
  v24 = v10;
  v25 = v8;
  v17 = v10;
  v18 = v11;
  v19 = v15;
  v20 = v8;
  objc_msgSend(v16, "setURL:forBookmarkWithIdentifier:reply:", v17, v18, v21);

}

void __87__WBSCyclerModifyBookmarkOperation__changeURLOfBookmark_withContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  id v4;

  if ((a2 & 1) != 0)
  {
    v4 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(v4, "descendantWithUniqueIdentifier:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setURL:", *(_QWORD *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

@end
