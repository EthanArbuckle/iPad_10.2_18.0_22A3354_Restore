@implementation WBSCyclerCreateTabGroupRelatedItemOperation

- (void)executeWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(v9, "tabGroupsParent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "randomDescendantOfList:enforcingTitlePrefixValidity:passingTest:", v7, 1, &__block_literal_global_36);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && !+[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:](WBSCyclerRandomnessUtilities, "randomIntegerWithUpperBound:", 2))
  {
    if (+[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:](WBSCyclerRandomnessUtilities, "randomIntegerWithUpperBound:", 5))
    {
      -[WBSCyclerCreateTabGroupRelatedItemOperation _createRandomTabGroupFavoriteWithContext:completionHandler:](self, "_createRandomTabGroupFavoriteWithContext:completionHandler:", v9, v6);
    }
    else
    {
      -[WBSCyclerCreateTabGroupRelatedItemOperation _createRandomTabWithContext:completionHandler:](self, "_createRandomTabWithContext:completionHandler:", v9, v6);
    }
  }
  else
  {
    -[WBSCyclerCreateTabGroupRelatedItemOperation _createRandomTabGroupWithContext:completionHandler:](self, "_createRandomTabGroupWithContext:completionHandler:", v9, v6);
  }

}

uint64_t __84__WBSCyclerCreateTabGroupRelatedItemOperation_executeWithContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_createRandomTabWithContext:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
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
  id v25;
  unint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
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
    +[WBSCyclerRandomnessUtilities randomURL](WBSCyclerRandomnessUtilities, "randomURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:](WBSCyclerRandomnessUtilities, "randomIntegerWithUpperBound:", objc_msgSend(v8, "numberOfTabs") + 1);
    v12 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = v12;
      objc_msgSend(v8, "title");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v28 = v9;
      v29 = 2114;
      v30 = v10;
      v31 = 2114;
      v32 = v14;
      v33 = 2048;
      v34 = v11;
      _os_log_impl(&dword_1A3D90000, v13, OS_LOG_TYPE_INFO, "Creating tab with title %{public}@ and URL %{public}@ in tab group with title %{public}@ at index %lu", buf, 0x2Au);

    }
    objc_msgSend(v5, "testTarget");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __93__WBSCyclerCreateTabGroupRelatedItemOperation__createRandomTabWithContext_completionHandler___block_invoke;
    v20[3] = &unk_1E4B387E8;
    v25 = v6;
    v21 = v5;
    v22 = v8;
    v23 = v10;
    v24 = v9;
    v26 = v11;
    v17 = v9;
    v18 = v10;
    objc_msgSend(v15, "createBookmarkWithTitle:url:inListWithIdentifier:atIndex:reply:", v17, v18, v16, v11, v20);

  }
  else
  {
    objc_msgSend(v5, "topLevelItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v19);

  }
}

void __93__WBSCyclerCreateTabGroupRelatedItemOperation__createRandomTabWithContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  WBSCyclerBookmarkLeafRepresentation *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  WBSCyclerBookmarkLeafRepresentation *v11;
  uint64_t v12;
  id v13;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "topLevelItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v3, "copy");

    objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "descendantWithUniqueIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = [WBSCyclerBookmarkLeafRepresentation alloc];
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WBSCyclerBookmarkLeafRepresentation initWithURL:title:uniqueIdentifier:](v6, "initWithURL:title:uniqueIdentifier:", v7, v8, v10);

    objc_msgSend(v5, "insertChild:atIndex:", v11, *(_QWORD *)(a1 + 72) + 1);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "topLevelItem");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v12 + 16))(v12);
  }

}

- (void)_createRandomTabGroupWithContext:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "randomItemTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tabGroupsParent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:](WBSCyclerRandomnessUtilities, "randomIntegerWithUpperBound:", objc_msgSend(v8, "numberOfChildren") + 1);
  v10 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    objc_msgSend(v8, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v26 = v12;
    v27 = 2114;
    v28 = v7;
    v29 = 2048;
    v30 = v9;
    _os_log_impl(&dword_1A3D90000, v11, OS_LOG_TYPE_INFO, "Creating tab group in profile %{public}@ with title %{public}@ at index %lu", buf, 0x20u);

  }
  objc_msgSend(v5, "testTarget");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __98__WBSCyclerCreateTabGroupRelatedItemOperation__createRandomTabGroupWithContext_completionHandler___block_invoke;
  v19[3] = &unk_1E4B387C0;
  v20 = v5;
  v21 = v7;
  v22 = v8;
  v23 = v6;
  v24 = v9;
  v15 = v8;
  v16 = v7;
  v17 = v5;
  v18 = v6;
  objc_msgSend(v13, "createBookmarkListWithTitle:inListWithIdentifier:atIndex:reply:", v16, v14, v9, v19);

}

void __98__WBSCyclerCreateTabGroupRelatedItemOperation__createRandomTabGroupWithContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  WBSCyclerTabGroupRepresentation *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  WBSCyclerTopScopedBookmarkListRepresentation *v7;
  void *v8;
  void *v9;
  void *v10;
  WBSCyclerTopScopedBookmarkListRepresentation *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  WBSCyclerTabGroupRepresentation *v17;

  if ((a2 & 1) != 0)
  {
    v3 = [WBSCyclerTabGroupRepresentation alloc];
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[WBSCyclerItemListRepresentation initWithTitle:uniqueIdentifier:](v3, "initWithTitle:uniqueIdentifier:", v4, v6);

    v7 = [WBSCyclerTopScopedBookmarkListRepresentation alloc];
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[WBSCyclerItemRepresentation uniqueIdentifier](v17, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("TopScopedBookmarkList_%@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WBSCyclerItemListRepresentation initWithTitle:uniqueIdentifier:](v7, "initWithTitle:uniqueIdentifier:", &stru_1E4B40D18, v10);

    -[WBSCyclerItemListRepresentation insertChild:atIndex:](v17, "insertChild:atIndex:", v11, 0);
    objc_msgSend(*(id *)(a1 + 32), "topLevelItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");

    objc_msgSend(*(id *)(a1 + 48), "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "descendantWithUniqueIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "insertChild:atIndex:", v17, *(_QWORD *)(a1 + 64));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    v16 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "topLevelItem");
    v17 = (WBSCyclerTabGroupRepresentation *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v16 + 16))(v16);
  }

}

- (void)_createRandomTabGroupFavoriteWithContext:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  unint64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "tabGroupsParent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "randomTabGroupDescendant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "childAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v5, "randomItemTitle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[WBSCyclerRandomnessUtilities randomURL](WBSCyclerRandomnessUtilities, "randomURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = +[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:](WBSCyclerRandomnessUtilities, "randomIntegerWithUpperBound:", objc_msgSend(v10, "numberOfChildren") + 1);
      v14 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = v14;
        objc_msgSend(v9, "title");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v30 = v11;
        v31 = 2114;
        v32 = v12;
        v33 = 2114;
        v34 = v16;
        v35 = 2048;
        v36 = v13;
        _os_log_impl(&dword_1A3D90000, v15, OS_LOG_TYPE_INFO, "Creating Tab Group Favorite with title %{public}@ and URL %{public}@ in tab group with title %{public}@ at index %lu", buf, 0x2Au);

      }
      objc_msgSend(v5, "testTarget");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uniqueIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __106__WBSCyclerCreateTabGroupRelatedItemOperation__createRandomTabGroupFavoriteWithContext_completionHandler___block_invoke;
      v22[3] = &unk_1E4B387E8;
      v27 = v6;
      v23 = v5;
      v24 = v10;
      v25 = v12;
      v26 = v11;
      v28 = v13;
      v19 = v11;
      v20 = v12;
      objc_msgSend(v17, "createBookmarkWithTitle:url:inListWithIdentifier:atIndex:reply:", v19, v20, v18, v13, v22);

    }
    else
    {
      objc_msgSend(v5, "topLevelItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v6 + 2))(v6, v21);

    }
  }
  else
  {
    objc_msgSend(v5, "topLevelItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v10);
  }

}

void __106__WBSCyclerCreateTabGroupRelatedItemOperation__createRandomTabGroupFavoriteWithContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  WBSCyclerBookmarkLeafRepresentation *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  WBSCyclerBookmarkLeafRepresentation *v11;
  uint64_t v12;
  id v13;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "topLevelItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v3, "copy");

    objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "descendantWithUniqueIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = [WBSCyclerBookmarkLeafRepresentation alloc];
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WBSCyclerBookmarkLeafRepresentation initWithURL:title:uniqueIdentifier:](v6, "initWithURL:title:uniqueIdentifier:", v7, v8, v10);

    objc_msgSend(v5, "insertChild:atIndex:", v11, *(_QWORD *)(a1 + 72));
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "topLevelItem");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v12 + 16))(v12);
  }

}

@end
