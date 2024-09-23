@implementation WBSUserDefinedContentBlockerManager

uint64_t __104__WBSUserDefinedContentBlockerManager_ScribbleUtilities__deleteAllContentBlockersWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __124__WBSUserDefinedContentBlockerManager_ScribbleUtilities__getAllPaintingAvoidanceSelectorsThatApplyToHost_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  int v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  void (**v14)(_QWORD, _QWORD);
  id v15;
  _QWORD v16[4];
  id v17;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v5 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __124__WBSUserDefinedContentBlockerManager_ScribbleUtilities__getAllPaintingAvoidanceSelectorsThatApplyToHost_completionHandler___block_invoke_2;
  v16[3] = &unk_1E5444BE8;
  v6 = v4;
  v17 = v6;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D45E4](v16);
  objc_msgSend(v3, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, void *))v7)[2](v7, v8);
  v9 = objc_msgSend(*(id *)(a1 + 32), "didLoadGlobalContentBlockerActions");
  v10 = *(void **)(a1 + 32);
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "cachedGlobalContentBlockerActions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v11);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __124__WBSUserDefinedContentBlockerManager_ScribbleUtilities__getAllPaintingAvoidanceSelectorsThatApplyToHost_completionHandler___block_invoke_3;
    v12[3] = &unk_1E5444C10;
    v14 = v7;
    v15 = *(id *)(a1 + 40);
    v13 = v6;
    objc_msgSend(v10, "getGlobalContentBlockerWithCompletionHandler:", v12);

  }
}

void __124__WBSUserDefinedContentBlockerManager_ScribbleUtilities__getAllPaintingAvoidanceSelectorsThatApplyToHost_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "allSelectorsIncludingShadowHosts");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count"))
          objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

uint64_t __124__WBSUserDefinedContentBlockerManager_ScribbleUtilities__getAllPaintingAvoidanceSelectorsThatApplyToHost_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

@end
