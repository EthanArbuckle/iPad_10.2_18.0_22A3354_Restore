@implementation UIDiffableDataSourceViewUpdater

uint64_t __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performBatchUpdates:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "_expectedDiffableUpdateItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (*(_BYTE *)(a1 + 112))
    {
      v3 = *(_QWORD *)(a1 + 56);
      v4 = *(void **)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 80);
      if (v3)
        objc_msgSend(v4, "_performBatchUpdates:viewPropertyAnimator:customAnimationsProvider:", v5, v3, *(_QWORD *)(a1 + 88));
      else
        objc_msgSend(v4, "performBatchUpdates:completion:", v5, *(_QWORD *)(a1 + 96));
      goto LABEL_19;
    }
    if (*(_BYTE *)(a1 + 113))
    {
LABEL_10:
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 2;
      objc_msgSend(*(id *)(a1 + 32), "reloadData");
      (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
      goto LABEL_19;
    }
    objc_msgSend(*(id *)(a1 + 32), "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else
    {
      if (_UIInternalPreferencesRevisionOnce != -1)
        dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
      v7 = _UIInternalPreferencesRevisionVar;
      if (_UIInternalPreferencesRevisionVar < 1)
        goto LABEL_17;
      v8 = _UIInternalPreference_DiffableDataSourceSnapshotApplyBehaviorOutsideWindow;
      if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_DiffableDataSourceSnapshotApplyBehaviorOutsideWindow)
        goto LABEL_17;
      while (v7 >= v8)
      {
        _UIInternalPreferenceSync(v7, &_UIInternalPreference_DiffableDataSourceSnapshotApplyBehaviorOutsideWindow, (uint64_t)CFSTR("DiffableDataSourceSnapshotApplyBehaviorOutsideWindow"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
        v8 = _UIInternalPreference_DiffableDataSourceSnapshotApplyBehaviorOutsideWindow;
        if (v7 == _UIInternalPreference_DiffableDataSourceSnapshotApplyBehaviorOutsideWindow)
          goto LABEL_17;
      }
      if (qword_1ECD75EF0 == -1)
        goto LABEL_10;
      if (qword_1ECD75EF0 != 1)
      {
LABEL_17:
        if ((dyld_program_sdk_at_least() & 1) == 0)
          goto LABEL_10;
      }
    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_4;
    v10[3] = &unk_1E16BC240;
    v11 = *(id *)(a1 + 32);
    v12 = *(id *)(a1 + 80);
    v13 = *(id *)(a1 + 96);
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10);

    goto LABEL_19;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  if ((objc_msgSend(*(id *)(a1 + 40), "_doesExpectedUpdate:matchActualUpdates:allowingEmptyUpdates:", v9, *(_QWORD *)(a1 + 48), 1) & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 2;
    objc_msgSend(*(id *)(a1 + 32), "reloadData");
  }
  v2 = *(void **)(a1 + 72);
  if (v2)
    dispatch_async(MEMORY[0x1E0C80D38], v2);
LABEL_19:

}

uint64_t __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_performViewUpdates:", *(_QWORD *)(a1 + 40));
}

uint64_t __47___UIDiffableDataSourceViewUpdater__reloadData__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadData");
}

uint64_t __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_expectedDiffableUpdateItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    if ((objc_msgSend(*(id *)(a1 + 40), "_doesExpectedUpdate:matchActualUpdates:allowingEmptyUpdates:", v4, *(_QWORD *)(a1 + 48), 0) & 1) == 0)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 2;
      objc_msgSend(*(id *)(a1 + 32), "reloadData");
    }
    v2 = *(void **)(a1 + 64);
    if (v2)
      dispatch_async(MEMORY[0x1E0C80D38], v2);
  }
  else if (*(_BYTE *)(a1 + 96))
  {
    objc_msgSend(*(id *)(a1 + 32), "performBatchUpdates:completion:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  }
  else if (*(_BYTE *)(a1 + 97)
         || (objc_msgSend(*(id *)(a1 + 32), "window"),
             v3 = (void *)objc_claimAutoreleasedReturnValue(),
             v3,
             !v3))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 2;
    objc_msgSend(*(id *)(a1 + 32), "reloadData");
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_8;
    v5[3] = &unk_1E16BC240;
    v6 = *(id *)(a1 + 32);
    v7 = *(id *)(a1 + 72);
    v8 = *(id *)(a1 + 80);
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v5);

  }
}

uint64_t __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_performViewUpdates:", *(_QWORD *)(a1 + 40));
}

uint64_t __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performBatchUpdates:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

BOOL __96___UIDiffableDataSourceViewUpdater__doesExpectedUpdate_matchActualUpdates_allowingEmptyUpdates___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateAction") == 1;
}

BOOL __96___UIDiffableDataSourceViewUpdater__doesExpectedUpdate_matchActualUpdates_allowingEmptyUpdates___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateAction") == 0;
}

uint64_t __51___UIDiffableDataSourceViewUpdater__deleteAllItems__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadData");
}

uint64_t __51___UIDiffableDataSourceViewUpdater__deleteAllItems__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadData");
}

uint64_t __47___UIDiffableDataSourceViewUpdater__reloadData__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadData");
}

@end
