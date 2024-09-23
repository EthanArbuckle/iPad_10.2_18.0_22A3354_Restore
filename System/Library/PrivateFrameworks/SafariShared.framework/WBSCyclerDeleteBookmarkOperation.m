@implementation WBSCyclerDeleteBookmarkOperation

- (void)executeWithContext:(id)a3 completionHandler:(id)a4
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
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "randomValidStrictDescendantOfTopLevelItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = v10;
      objc_msgSend(v8, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v12;
      v21 = 2114;
      v22 = v9;
      _os_log_impl(&dword_1A3D90000, v11, OS_LOG_TYPE_INFO, "Deleting bookmark (title: %{public}@, identifier: %{public}@)", buf, 0x16u);

    }
    objc_msgSend(v5, "testTarget");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __73__WBSCyclerDeleteBookmarkOperation_executeWithContext_completionHandler___block_invoke;
    v15[3] = &unk_1E4B38858;
    v18 = v6;
    v16 = v5;
    v17 = v9;
    v14 = v9;
    objc_msgSend(v13, "deleteBookmarkWithIdentifier:reply:", v14, v15);

  }
  else
  {
    objc_msgSend(v5, "topLevelItem");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v6 + 2))(v6, v14);
  }

}

void __73__WBSCyclerDeleteBookmarkOperation_executeWithContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "topLevelItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v3, "copy");

    objc_msgSend(v6, "descendantWithUniqueIdentifier:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteDescendant:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "topLevelItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }

}

@end
