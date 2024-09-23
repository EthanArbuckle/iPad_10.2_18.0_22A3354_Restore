@implementation UIDiffableDataSource

void __152____UIDiffableDataSource__commitNewDataSource_withViewUpdates_viewPropertyAnimator_customAnimationsProvider_animated_commitAlongsideHandler_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = objc_alloc((Class)off_1E167C2F0);
  objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "initWithStateAdvancingGenerationID:", v3);

  objc_msgSend(*(id *)(a1 + 40), "_commitStateAtomically:", v5);
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

uint64_t __49____UIDiffableDataSource__commitStateAtomically___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_storeState:", *(_QWORD *)(a1 + 40));
}

uint64_t __49____UIDiffableDataSource__commitStateAtomically___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __98____UIDiffableDataSource__applyDifferencesFromSnapshot_toSection_animatingDifferences_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  char v8;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __98____UIDiffableDataSource__applyDifferencesFromSnapshot_toSection_animatingDifferences_completion___block_invoke_2;
  v3[3] = &unk_1E16BAD90;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v8 = *(_BYTE *)(a1 + 72);
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v2, "_performApplyWithoutRebasingSectionSnapshots:", v3);

}

void __53____UIDiffableDataSource__snapshotWithHandlerAtomic___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __34____UIDiffableDataSource_snapshot__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(objc_alloc((Class)off_1E167D310), "initWithState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));
}

uint64_t __56____UIDiffableDataSource_reloadFromSnapshot_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onApplyQueue_reloadFromSnapshot:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __36____UIDiffableDataSource_initialize__block_invoke()
{
  objc_opt_class();
  return _CVCDiffableDataSourceInitializeWithUpdateItemClass();
}

uint64_t __47____UIDiffableDataSource__performOnApplyQueue___block_invoke(uint64_t a1)
{
  uint64_t result;
  unint64_t *v3;
  unint64_t v4;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 232);
  do
    v4 = __ldxr(v3);
  while (__stxr(v4 - 1, v3));
  return result;
}

uint64_t __55____UIDiffableDataSource_applyDifferencesFromSnapshot___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onApplyQueue_applyDifferencesFromSnapshot:viewPropertyAnimator:customAnimationsProvider:animated:completion:", *(_QWORD *)(a1 + 40), 0, 0, 1, 0);
}

uint64_t __66____UIDiffableDataSource_applyDifferencesFromSnapshot_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onApplyQueue_applyDifferencesFromSnapshot:viewPropertyAnimator:customAnimationsProvider:animated:completion:", *(_QWORD *)(a1 + 40), 0, 0, 1, *(_QWORD *)(a1 + 48));
}

uint64_t __45____UIDiffableDataSource_reloadFromSnapshot___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onApplyQueue_reloadFromSnapshot:completion:", *(_QWORD *)(a1 + 40), 0);
}

void __70____UIDiffableDataSource__onApplyQueue_reloadFromSnapshot_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void (**v6)(void);
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_computeCurrentTransactionForFinalSnapshot:withDataSourceDiffer:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 32), "_notifyWillApplyForCurrentTransactionIfNeeded");
  objc_msgSend(*(id *)(a1 + 40), "state");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_msgSend(objc_alloc((Class)off_1E167C2F0), "initWithStateAdvancingGenerationID:", v9);
  objc_msgSend(v2, "_storeState:", v3);

  objc_msgSend(*(id *)(a1 + 32), "_commitRebasedSectionSnapshotsFromCurrentTransactionIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_notifyDidApplyForCurrentTransactionIfNeeded");
  v4 = objc_msgSend(*(id *)(a1 + 32), "isSuppressingViewUpdates");
  if ((v4 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "viewUpdater");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_reloadData");

  }
  objc_msgSend(*(id *)(a1 + 32), "_resetCurrentTransaction");
  v6 = *(void (***)(void))(a1 + 48);
  if (v6)
  {
    if (v4)
    {
      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 256);
      v8 = _Block_copy(v6);
      objc_msgSend(v7, "addObject:", v8);

    }
    else
    {
      v6[2]();
    }
  }

}

uint64_t __103____UIDiffableDataSource__applyDifferencesFromSnapshot_animatingDifferences_completion_isOnApplyQueue___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  if (dyld_program_sdk_at_least())
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(unsigned __int8 *)(a1 + 56);
    return objc_msgSend(v2, "_onApplyQueue_applyDifferencesFromSnapshot:viewPropertyAnimator:customAnimationsProvider:animated:completion:", v3, 0, 0, v4, *(_QWORD *)(a1 + 48));
  }
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 56))
  {
    v4 = 1;
    return objc_msgSend(v2, "_onApplyQueue_applyDifferencesFromSnapshot:viewPropertyAnimator:customAnimationsProvider:animated:completion:", v3, 0, 0, v4, *(_QWORD *)(a1 + 48));
  }
  return objc_msgSend(v2, "_onApplyQueue_reloadFromSnapshot:completion:", v3, *(_QWORD *)(a1 + 48));
}

uint64_t __81____UIDiffableDataSource__applyDifferencesFromSnapshot_customAnimationsProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onApplyQueue_applyDifferencesFromSnapshot:viewPropertyAnimator:customAnimationsProvider:animated:completion:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48), 1, 0);
}

uint64_t __102____UIDiffableDataSource__applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onApplyQueue_applyDifferencesFromSnapshot:viewPropertyAnimator:customAnimationsProvider:animated:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 1, 0);
}

uint64_t __98____UIDiffableDataSource__applyDifferencesFromSnapshot_toSection_animatingDifferences_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applySnapshot:toSection:animatingDifferences:viewPropertyAnimator:animationsProvider:isOnDiffableApplyQueue:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), 0, 0, 1, *(_QWORD *)(a1 + 56));
}

id __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  kdebug_trace();
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  objc_msgSend(*(id *)(a1 + 40), "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIDiffableDataSourceDiffer differWithBeforeDataSourceState:afterDataSourceState:]((uint64_t)_UIDiffableDataSourceDiffer, v2, v3);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = (void *)v4[1];
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "_computeCurrentTransactionForFinalSnapshot:withDataSourceDiffer:", *(_QWORD *)(a1 + 40), v4);
  kdebug_trace();
  if (*(_BYTE *)(a1 + 48))
    v7 = v6;
  else
    v7 = (void *)MEMORY[0x1E0C9AA60];
  v8 = v7;

  return v8;
}

void __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  char v27;
  _QWORD v28[5];

  v3 = a2;
  if (*(_BYTE *)(a1 + 72)
    && (v4 = (id *)(a1 + 32),
        objc_msgSend(*(id *)(a1 + 32), "_validReloadOrReconfigureViewUpdatesInSnapshot:", *(_QWORD *)(a1 + 40)),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "count");
    objc_msgSend(*v4, "_notifyWillApplyForCurrentTransactionIfNeeded");
    if (v7)
    {
      v8 = 0;
      v9 = 1;
      goto LABEL_7;
    }
  }
  else
  {
    v4 = (id *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 32), "_notifyWillApplyForCurrentTransactionIfNeeded");
    v6 = 0;
  }
  v9 = 0;
  v8 = *(const void **)(a1 + 56);
LABEL_7:
  v10 = _Block_copy(v8);
  v11 = *(void **)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 64);
  v15 = MEMORY[0x1E0C809B0];
  v16 = *(unsigned __int8 *)(a1 + 73);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke_3;
  v28[3] = &unk_1E16B1B28;
  v28[4] = v11;
  v17 = objc_msgSend(v11, "_commitNewDataSource:withViewUpdates:viewPropertyAnimator:customAnimationsProvider:animated:commitAlongsideHandler:completion:", v12, v3, v13, v14, v16, v28, v10);
  objc_msgSend(*(id *)(a1 + 32), "_notifyDidApplyForCurrentTransactionIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_resetCurrentTransaction");
  if (v9)
  {
    if (v17 == 2)
    {
      v18 = *(void **)(a1 + 56);
      if (v18)
        dispatch_async(MEMORY[0x1E0C80D38], v18);
    }
    else
    {
      v19 = (void *)objc_msgSend(objc_alloc((Class)off_1E1679A30), "initWithState:", *((_QWORD *)*v4 + 15));
      objc_msgSend(*v4, "_transactionForReloadUpdatesWithSnapshot:", v19);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)*((_QWORD *)*v4 + 7);
      *((_QWORD *)*v4 + 7) = v20;

      if (dyld_program_sdk_at_least())
      {
        v22 = *(id **)(a1 + 32);
        objc_msgSend(v22[15], "dataSourceSnapshot");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_performReloadOrReconfigureUpdateWithItems:dataSourceSnapshot:animated:completion:", v6, v23, *(unsigned __int8 *)(a1 + 73), *(_QWORD *)(a1 + 56));

      }
      else
      {
        v24[0] = v15;
        v24[1] = 3221225472;
        v24[2] = __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke_4;
        v24[3] = &unk_1E16B1CF0;
        v24[4] = *(_QWORD *)(a1 + 32);
        v25 = v6;
        v27 = *(_BYTE *)(a1 + 73);
        v26 = *(id *)(a1 + 56);
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v24);

      }
      objc_msgSend(*v4, "_resetCurrentTransaction");

    }
  }

}

uint64_t __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_commitRebasedSectionSnapshotsFromCurrentTransactionIfNeeded");
}

void __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke_4(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  id v4;

  v2 = *(id **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2[15], "dataSourceSnapshot");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_performReloadOrReconfigureUpdateWithItems:dataSourceSnapshot:animated:completion:", v3, v4, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

void __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "pendingSnapshotUpdates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("_UIDiffableDataSourceImpl.m"), 918, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshot.pendingSnapshotUpdates.count == 1"));

  }
  objc_msgSend(v3, "pendingSnapshotUpdates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_commitUpdate:snapshot:animated:animator:customAnimationsProvider:completion:", v8, v3, *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __135____UIDiffableDataSource__onApplyQueue_applyDifferencesFromSnapshot_viewPropertyAnimator_customAnimationsProvider_animated_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __103____UIDiffableDataSource__commitUpdate_snapshot_animated_animator_customAnimationsProvider_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_commitStateAtomically:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_commitRebasedSectionSnapshotsFromCurrentTransactionIfNeeded");
}

id __76____UIDiffableDataSource__registerItemRenderers_rendererIdentifierProvider___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id *v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v7 = a4;
  v8 = (id *)(a1 + 32);
  v9 = a3;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v8);
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[__UIDiffableDataSource _registerItemRenderers:rendererIdentifierProvider:]_block_invoke");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("_UIDiffableDataSourceImpl.m"), 1170, CFSTR("Failed to generate a new cell."));

  }
  v14 = *((id *)WeakRetained + 3);
  if (objc_msgSend(v14, "count") == 1)
  {
    objc_msgSend(v14, "objectEnumerator");
    v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = (void (**)(_QWORD, _QWORD))_Block_copy(*((const void **)WeakRetained + 4));
    ((void (**)(_QWORD, id))v15)[2](v15, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[__UIDiffableDataSource _registerItemRenderers:rendererIdentifierProvider:]_block_invoke");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("_UIDiffableDataSourceImpl.m"), 1180, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rendererIdentifier"));

    }
    objc_msgSend(v14, "objectForKey:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[__UIDiffableDataSource _registerItemRenderers:rendererIdentifierProvider:]_block_invoke");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("_UIDiffableDataSourceImpl.m"), 1183, CFSTR("No registered item renderer found for identifier %@"), v7);

  }
  objc_msgSend(v18, "cellReuseIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v19, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[__UIDiffableDataSource _registerItemRenderers:rendererIdentifierProvider:]_block_invoke");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("_UIDiffableDataSourceImpl.m"), 1185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cell"));

  }
  objc_msgSend(v18, "handler");
  v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, void *))v21)[2](v21, v7, v20);

  return v20;
}

NSDiffableDataSourceSectionSnapshot *__68____UIDiffableDataSource__reorderingTransactionForReorderingUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSDiffableDataSourceSectionSnapshot *v6;
  void *v7;
  void *v9;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("_UIDiffableDataSourceImpl.m"), 1406, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifier"));

  }
  objc_msgSend(*(id *)(a1 + 32), "associatedSectionControllerForSectionIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4
    || (objc_msgSend(v4, "snapshotForSection:", v3),
        (v6 = (NSDiffableDataSourceSectionSnapshot *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "indexOfSectionIdentifier:", v3) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "itemIdentifiersInSectionWithIdentifier:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_alloc_init(NSDiffableDataSourceSectionSnapshot);
    -[NSDiffableDataSourceSectionSnapshot appendItems:](v6, "appendItems:", v7);

  }
  return v6;
}

@end
