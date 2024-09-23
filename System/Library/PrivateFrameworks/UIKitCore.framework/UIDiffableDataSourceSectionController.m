@implementation UIDiffableDataSourceSectionController

uint64_t __162___UIDiffableDataSourceSectionController__applySnapshot_toSection_animatingDifferences_viewPropertyAnimator_animationsProvider_isOnDiffableApplyQueue_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePreparedCellsForExpansionStateWithSnapshot:", *(_QWORD *)(a1 + 40));
}

uint64_t __162___UIDiffableDataSourceSectionController__applySnapshot_toSection_animatingDifferences_viewPropertyAnimator_animationsProvider_isOnDiffableApplyQueue_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __163___UIDiffableDataSourceSectionController___applySnapshot_toSection_animatingDifferences_viewPropertyAnimator_animationsProvider_isOnDiffableApplyQueue_completion___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  id WeakRetained;
  uint64_t v5;
  id v6;

  v2 = *(unsigned __int8 *)(a1 + 72);
  v3 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  v5 = *(_QWORD *)(a1 + 48);
  v6 = WeakRetained;
  if (v2)
  {
    if (v3)
      objc_msgSend(WeakRetained, "_onApplyQueue_applyDifferencesFromSnapshot:viewPropertyAnimator:customAnimationsProvider:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
    else
      objc_msgSend(WeakRetained, "_onApplyQueue_applyDifferencesFromSnapshot:animatingDifferences:completion:", v5, *(unsigned __int8 *)(a1 + 73), *(_QWORD *)(a1 + 64));
  }
  else if (v3)
  {
    objc_msgSend(WeakRetained, "_applyDifferencesFromSnapshot:viewPropertyAnimator:customAnimationsProvider:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  }
  else
  {
    objc_msgSend(WeakRetained, "applyDifferencesFromSnapshot:animatingDifferences:completion:", v5, *(unsigned __int8 *)(a1 + 73), *(_QWORD *)(a1 + 64));
  }

}

uint64_t __76___UIDiffableDataSourceSectionController__configureCell_forItem_inSnapshot___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;
  uint64_t v7;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  v7 = objc_msgSend(WeakRetained, "_performDisclosureAction:forItem:", a2, v5);

  return v7;
}

void __77___UIDiffableDataSourceSectionController__configureForItemRenderersIfNeeded___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "configureCell:forItem:", v5, v8);

}

@end
