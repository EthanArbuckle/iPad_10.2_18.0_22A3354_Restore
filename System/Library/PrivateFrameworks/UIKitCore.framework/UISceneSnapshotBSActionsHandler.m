@implementation UISceneSnapshotBSActionsHandler

uint64_t __98___UISceneSnapshotBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;

  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __98___UISceneSnapshotBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id obj;
  _QWORD v13[5];
  id v14;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD aBlock[4];
  id v21;
  id v22;
  id v23;
  char v24;
  id location;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  location = 0;
  if (*(_BYTE *)(a1 + 56))
  {
    +[UISnapshottingAssertionManager sharedInstance](UISnapshottingAssertionManager, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "acquireNewAssertion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeWeak(&location, v3);
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __98___UISceneSnapshotBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_3;
  aBlock[3] = &unk_1E16ED320;
  v21 = *(id *)(a1 + 32);
  v24 = *(_BYTE *)(a1 + 56);
  objc_copyWeak(&v23, &location);
  v22 = *(id *)(a1 + 40);
  v4 = _Block_copy(aBlock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = *(id *)(a1 + 48);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v9 = (void *)UIApp;
        v10 = *(_QWORD *)(a1 + 32);
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __98___UISceneSnapshotBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_6;
        v13[3] = &unk_1E16C0600;
        v15 = *(_BYTE *)(a1 + 57);
        v11 = v4;
        v13[4] = v8;
        v14 = v11;
        objc_msgSend(v9, "prepareSnapshotsWithAction:forScene:completion:", v8, v10, v13);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v5);
  }

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __98___UISceneSnapshotBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  char v9;

  v3 = a2;
  v4 = (void *)UIApp;
  v5 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __98___UISceneSnapshotBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_4;
  v6[3] = &unk_1E16C2F48;
  v9 = *(_BYTE *)(a1 + 56);
  objc_copyWeak(&v8, (id *)(a1 + 48));
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "_performSnapshotsWithAction:forScene:completion:", v3, v5, v6);

  objc_destroyWeak(&v8);
}

void __98___UISceneSnapshotBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  if (*(_BYTE *)(a1 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      +[UISnapshottingAssertionManager sharedInstance](UISnapshottingAssertionManager, "sharedInstance");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "relinquishAssertion:", WeakRetained);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "_isReadyForSuspension"))
    {
      +[UISnapshottingAssertionManager sharedInstance](UISnapshottingAssertionManager, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "executeIfNoActiveAssertions:", &__block_literal_global_3_28);

    }
  }
}

void __98___UISceneSnapshotBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_5()
{
  id v0;

  +[_UISceneLifecycleMultiplexer sharedInstance](_UISceneLifecycleMultiplexer, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "collectBackingStores");

}

void __98___UISceneSnapshotBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_6(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  if (*(_BYTE *)(a1 + 48))
  {
    v2 = (void *)UIApp;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __98___UISceneSnapshotBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_7;
    v4[3] = &unk_1E16B2F48;
    v3 = *(id *)(a1 + 40);
    v4[4] = *(_QWORD *)(a1 + 32);
    v5 = v3;
    objc_msgSend(v2, "_performBlockAfterCATransactionCommits:", v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __98___UISceneSnapshotBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
