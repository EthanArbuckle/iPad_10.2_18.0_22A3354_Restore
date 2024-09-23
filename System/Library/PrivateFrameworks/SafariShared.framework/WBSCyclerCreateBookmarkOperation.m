@implementation WBSCyclerCreateBookmarkOperation

- (void)executeWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  if (+[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:](WBSCyclerRandomnessUtilities, "randomIntegerWithUpperBound:", 2))
  {
    -[WBSCyclerCreateBookmarkOperation _createRandomLeafWithContext:completionHandler:](self, "_createRandomLeafWithContext:completionHandler:", v7, v6);
  }
  else
  {
    -[WBSCyclerCreateBookmarkOperation _createRandomListWithContext:completionHandler:](self, "_createRandomListWithContext:completionHandler:", v7, v6);
  }

}

- (id)_randomListWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "topLevelItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "randomDescendantOfList:enforcingTitlePrefixValidity:passingTest:", v4, 1, &__block_literal_global_35);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __59__WBSCyclerCreateBookmarkOperation__randomListWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_createRandomListWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[WBSCyclerCreateBookmarkOperation _randomListWithContext:](self, "_randomListWithContext:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "randomItemTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:](WBSCyclerRandomnessUtilities, "randomIntegerWithUpperBound:", objc_msgSend(v8, "numberOfChildren") + 1);
  v12 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    v25 = v10;
    v26 = 2114;
    v27 = v9;
    v28 = 1024;
    v29 = v11;
    _os_log_impl(&dword_1A3D90000, v12, OS_LOG_TYPE_INFO, "Creating bookmark list with title %{public}@ in list with identifier %{public}@ at index %d", buf, 0x1Cu);
  }
  objc_msgSend(v6, "testTarget");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __83__WBSCyclerCreateBookmarkOperation__createRandomListWithContext_completionHandler___block_invoke;
  v18[3] = &unk_1E4B387C0;
  v19 = v6;
  v20 = v9;
  v21 = v10;
  v22 = v7;
  v23 = v11;
  v14 = v10;
  v15 = v9;
  v16 = v6;
  v17 = v7;
  objc_msgSend(v13, "createBookmarkListWithTitle:inListWithIdentifier:atIndex:reply:", v14, v15, v11, v18);

}

void __83__WBSCyclerCreateBookmarkOperation__createRandomListWithContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  WBSCyclerItemListRepresentation *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  WBSCyclerItemListRepresentation *v9;
  uint64_t v10;
  id v11;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "topLevelItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v3, "copy");

    objc_msgSend(v11, "descendantWithUniqueIdentifier:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [WBSCyclerItemListRepresentation alloc];
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WBSCyclerItemListRepresentation initWithTitle:uniqueIdentifier:](v5, "initWithTitle:uniqueIdentifier:", v6, v8);

    objc_msgSend(v4, "insertChild:atIndex:", v9, *(_QWORD *)(a1 + 64));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "topLevelItem");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v10 + 16))(v10);
  }

}

- (void)_createRandomLeafWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  unint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[WBSCyclerCreateBookmarkOperation _randomListWithContext:](self, "_randomListWithContext:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "randomItemTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSCyclerRandomnessUtilities randomURL](WBSCyclerRandomnessUtilities, "randomURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:](WBSCyclerRandomnessUtilities, "randomIntegerWithUpperBound:", objc_msgSend(v8, "numberOfChildren") + 1);
  v13 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544130;
    v28 = v10;
    v29 = 2114;
    v30 = v11;
    v31 = 2114;
    v32 = v9;
    v33 = 1024;
    v34 = v12;
    _os_log_impl(&dword_1A3D90000, v13, OS_LOG_TYPE_INFO, "Creating bookmark leaf with title %{public}@ and URL %{public}@ in list with identifier %{public}@ at index %d", buf, 0x26u);
  }
  objc_msgSend(v6, "testTarget");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __83__WBSCyclerCreateBookmarkOperation__createRandomLeafWithContext_completionHandler___block_invoke;
  v20[3] = &unk_1E4B387E8;
  v21 = v6;
  v22 = v9;
  v23 = v11;
  v24 = v10;
  v25 = v7;
  v26 = v12;
  v15 = v10;
  v16 = v11;
  v17 = v9;
  v18 = v6;
  v19 = v7;
  objc_msgSend(v14, "createBookmarkWithTitle:url:inListWithIdentifier:atIndex:reply:", v15, v16, v17, v12, v20);

}

void __83__WBSCyclerCreateBookmarkOperation__createRandomLeafWithContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  WBSCyclerBookmarkLeafRepresentation *v5;
  uint64_t v6;
  uint64_t v7;
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
    v5 = [WBSCyclerBookmarkLeafRepresentation alloc];
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[WBSCyclerBookmarkLeafRepresentation initWithURL:title:uniqueIdentifier:](v5, "initWithURL:title:uniqueIdentifier:", v6, v7, v9);

    objc_msgSend(v4, "insertChild:atIndex:", v10, *(_QWORD *)(a1 + 72));
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "topLevelItem");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v11 + 16))(v11);
  }

}

@end
