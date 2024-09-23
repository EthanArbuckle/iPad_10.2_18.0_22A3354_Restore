@implementation WBSCyclerMoveBookmarkOperation

- (void)executeWithContext:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  unint64_t v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "topLevelItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "randomValidStrictDescendantOfTopLevelItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v24 = v6;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __71__WBSCyclerMoveBookmarkOperation_executeWithContext_completionHandler___block_invoke;
    v31[3] = &unk_1E4B38880;
    v10 = v8;
    v32 = v10;
    objc_msgSend(v5, "randomDescendantOfList:enforcingTitlePrefixValidity:passingTest:", v7, 1, v31);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = +[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:](WBSCyclerRandomnessUtilities, "randomIntegerWithUpperBound:", objc_msgSend(v11, "numberOfChildren") + (objc_msgSend(v11, "containsChild:", v10) ^ 1));
    objc_msgSend(v10, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v23 = v7;
      v16 = v15;
      objc_msgSend(v10, "title");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "title");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uniqueIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v34 = v17;
      v35 = 2114;
      v36 = v13;
      v37 = 2114;
      v38 = v18;
      v39 = 2114;
      v40 = v19;
      v41 = 1024;
      v42 = v12;
      _os_log_impl(&dword_1A3D90000, v16, OS_LOG_TYPE_INFO, "Moving bookmark (title: %{public}@, identifier: %{public}@) into folder (title: %{public}@, identifier: %{public}@) at index %d", buf, 0x30u);

      v7 = v23;
    }
    objc_msgSend(v5, "testTarget");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __71__WBSCyclerMoveBookmarkOperation_executeWithContext_completionHandler___block_invoke_2;
    v25[3] = &unk_1E4B387C0;
    v6 = v24;
    v29 = v24;
    v26 = v7;
    v27 = v13;
    v28 = v14;
    v30 = v12;
    v21 = v14;
    v22 = v13;
    objc_msgSend(v20, "moveBookmarkWithIdentifier:intoListWithIdentifier:atIndex:reply:", v22, v21, v12, v25);

  }
  else
  {
    (*((void (**)(id, void *))v6 + 2))(v6, v7);
  }

}

uint64_t __71__WBSCyclerMoveBookmarkOperation_executeWithContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || *(id *)(a1 + 32) == v3)
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = objc_msgSend(*(id *)(a1 + 32), "containsDescendant:", v3) ^ 1;
    else
      v4 = 1;
  }

  return v4;
}

void __71__WBSCyclerMoveBookmarkOperation_executeWithContext_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  id v5;

  if ((a2 & 1) != 0)
  {
    v5 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(v5, "descendantWithUniqueIdentifier:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "descendantWithUniqueIdentifier:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deleteDescendant:", v3);
    objc_msgSend(v4, "insertChild:atIndex:", v3, *(_QWORD *)(a1 + 64));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

@end
