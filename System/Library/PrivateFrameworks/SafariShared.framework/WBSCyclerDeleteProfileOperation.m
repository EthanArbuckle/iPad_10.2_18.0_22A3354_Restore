@implementation WBSCyclerDeleteProfileOperation

- (void)executeWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "tabGroupsParent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = v9;
      objc_msgSend(v8, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_1A3D90000, v10, OS_LOG_TYPE_INFO, "Deleting profile with title %{public}@ (%@)", (uint8_t *)&v15, 0x16u);

    }
    objc_msgSend(v8, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSCyclerDeleteProfileOperation _deleteItemWithIdentifier:inContext:completionHandler:](self, "_deleteItemWithIdentifier:inContext:completionHandler:", v13, v6, v7);

  }
  else
  {
    objc_msgSend(v6, "topLevelItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v14);

  }
}

- (void)_deleteItemWithIdentifier:(id)a3 inContext:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "testTarget");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__WBSCyclerDeleteProfileOperation__deleteItemWithIdentifier_inContext_completionHandler___block_invoke;
  v14[3] = &unk_1E4B38858;
  v16 = v7;
  v17 = v9;
  v15 = v8;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  objc_msgSend(v10, "deleteBookmarkWithIdentifier:reply:", v11, v14);

}

void __89__WBSCyclerDeleteProfileOperation__deleteItemWithIdentifier_inContext_completionHandler___block_invoke(uint64_t a1, char a2)
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
