@implementation WBSCyclerMoveTabGroupOperation

- (void)executeWithContext:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  unint64_t v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  unint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "tabGroupsParent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topLevelItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "randomProfileDescendant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v9)
  {
    objc_msgSend(v7, "randomTabGroupDescendant");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "numberOfChildren"))
      v11 = +[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:](WBSCyclerRandomnessUtilities, "randomIntegerWithUpperBound:", objc_msgSend(v9, "numberOfChildren"));
    else
      v11 = 0;
    v13 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = v13;
      objc_msgSend(v10, "title");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uniqueIdentifier");
      v22 = v11;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "title");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "title");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v31 = v15;
      v32 = 2114;
      v33 = v16;
      v34 = 2114;
      v35 = v17;
      v36 = 2114;
      v37 = v18;
      v38 = 2048;
      v39 = v22;
      _os_log_impl(&dword_1A3D90000, v14, OS_LOG_TYPE_INFO, "Moving Tab Group with title %{public}@ (identifier: %{public}@) from profile with title %{public}@ to profile with title %{public}@ at index %lu", buf, 0x34u);

      v11 = v22;
    }
    objc_msgSend(v5, "testTarget");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __71__WBSCyclerMoveTabGroupOperation_executeWithContext_completionHandler___block_invoke;
    v23[3] = &unk_1E4B387E8;
    v28 = v6;
    v24 = v5;
    v25 = v7;
    v26 = v9;
    v27 = v10;
    v29 = v11;
    v12 = v10;
    objc_msgSend(v19, "moveBookmarkWithIdentifier:intoListWithIdentifier:atIndex:reply:", v20, v21, v11, v23);

  }
  else
  {
    objc_msgSend(v5, "topLevelItem");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v6 + 2))(v6, v12);
  }

}

void __71__WBSCyclerMoveTabGroupOperation_executeWithContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "topLevelItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v3, "copy");

    objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "descendantWithUniqueIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "descendantWithUniqueIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "descendantWithUniqueIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "deleteChild:", v9);
    objc_msgSend(v7, "insertChild:atIndex:", v9, *(_QWORD *)(a1 + 72));
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "topLevelItem");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v10 + 16))(v10);
  }

}

@end
