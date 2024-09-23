@implementation UICollectionViewLayoutSwipeActionsModule

void __105___UICollectionViewLayoutSwipeActionsModule_swipeActionController_swipeOccurrence_didChangeStateFrom_to___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  _UIPerformImmediateCollectionViewLayoutAndVisibleCellsUpdate(*(void **)(a1 + 40));
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "indexPath");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  _UIUpdateMaskViewFrameForSwipedCellAtIndexPath(v2, v3);

}

uint64_t __105___UICollectionViewLayoutSwipeActionsModule_swipeActionController_swipeOccurrence_didChangeStateFrom_to___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "unlockActionViewForAnimation:", *(_QWORD *)(result + 40));
  return result;
}

void __105___UICollectionViewLayoutSwipeActionsModule_swipeActionController_swipeOccurrence_didChangeStateFrom_to___block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(a1 + 40), "indexPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _UIInvalidateSwipeActionsLayoutForDecorationViewAtIndexPath(WeakRetained, v2);

}

uint64_t __105___UICollectionViewLayoutSwipeActionsModule__invalidateSwipeActionsLayoutRefreshingActiveConfigurations___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[5];
  char v4;

  v1 = *(_QWORD *)(result + 32);
  if ((*(_BYTE *)(v1 + 8) & 1) != 0)
  {
    v2 = result;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __105___UICollectionViewLayoutSwipeActionsModule__invalidateSwipeActionsLayoutRefreshingActiveConfigurations___block_invoke_2;
    v3[3] = &unk_1E16B1B78;
    v4 = *(_BYTE *)(result + 40);
    v3[4] = v1;
    result = +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);
    *(_BYTE *)(*(_QWORD *)(v2 + 32) + 8) &= ~1u;
  }
  return result;
}

uint64_t __105___UICollectionViewLayoutSwipeActionsModule__invalidateSwipeActionsLayoutRefreshingActiveConfigurations___block_invoke_2(uint64_t a1)
{
  int v1;
  void *v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v1)
    return objc_msgSend(v2, "reconfigureActiveSwipeOccurrences");
  else
    return objc_msgSend(v2, "updateLayout");
}

uint64_t __76___UICollectionViewLayoutSwipeActionsModule_updateWithDataSourceTranslator___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finalIndexPathForInitialIndexPath:", a2);
}

uint64_t __105___UICollectionViewLayoutSwipeActionsModule_propertyAnimatorForCollectionViewUpdates_withCustomAnimator___block_invoke(uint64_t a1)
{
  __asm { FMOV            V2.2D, #0.5 }
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", vaddq_f64(*(float64x2_t *)(a1 + 40), vmulq_f64(*(float64x2_t *)(a1 + 56), _Q2)));
  return objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

uint64_t __105___UICollectionViewLayoutSwipeActionsModule_propertyAnimatorForCollectionViewUpdates_withCustomAnimator___block_invoke_40(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "resetAnimated:completion:", 0, 0);
  return result;
}

@end
