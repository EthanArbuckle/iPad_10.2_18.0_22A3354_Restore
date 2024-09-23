@implementation UICollectionViewDragDestinationController

void __95___UICollectionViewDragDestinationController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 24));
  else
    WeakRetained = 0;
  v3 = WeakRetained;
  -[_UICollectionViewDragAndDropController dragDestinationController:didCompleteDropAnimationForDragItem:](WeakRetained);

}

uint64_t __81___UICollectionViewDragDestinationController__commitCurrentInteractiveReordering__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finalIndexPathForInitialIndexPath:", a2);
}

void __123___UICollectionViewDragDestinationController__computeNextItemAttributesStartingFromItemAttributes_withCurrentDragLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a2;
  v7 = v5;
  if (!v5 || (v6 = v5, (*((_WORD *)v5 + 144) & 1) == 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
    v6 = v7;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isEqual:", v6))
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);

}

uint64_t __123___UICollectionViewDragDestinationController__computeNextItemAttributesStartingFromItemAttributes_withCurrentDragLocation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;

  v5 = a3;
  objc_msgSend(a2, "center");
  v8 = sqrt((v6 - *(double *)(a1 + 32)) * (v6 - *(double *)(a1 + 32))+ (v7 - *(double *)(a1 + 40)) * (v7 - *(double *)(a1 + 40)));
  objc_msgSend(v5, "center");
  v10 = v9;
  v12 = v11;

  v13 = sqrt((v10 - *(double *)(a1 + 32)) * (v10 - *(double *)(a1 + 32))+ (v12 - *(double *)(a1 + 40)) * (v12 - *(double *)(a1 + 40)));
  if (v8 >= v13)
    v14 = 0;
  else
    v14 = -1;
  if (v8 > v13)
    return 1;
  else
    return v14;
}

@end
