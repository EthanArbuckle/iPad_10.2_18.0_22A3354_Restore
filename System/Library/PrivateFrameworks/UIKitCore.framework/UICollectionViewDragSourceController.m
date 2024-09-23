@implementation UICollectionViewDragSourceController

void __82___UICollectionViewDragSourceController_dragInteraction_itemsForBeginningSession___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "indexPathsForSelectedItems");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __93___UICollectionViewDragSourceController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 3);
    -[_UICollectionViewDragAndDropController dragSourceController:willBeginLiftForItemsAtIndexPaths:](v3, (uint64_t)v4, *(void **)(a1 + 32));

    WeakRetained = v4;
  }

}

void __93___UICollectionViewDragSourceController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id v5;
  id v6;
  id v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (a2 == 1)
    {
      v8 = WeakRetained;
      v6 = objc_loadWeakRetained(WeakRetained + 3);
      -[_UICollectionViewDragAndDropController dragSourceController:didCancelLiftForItemsAtIndexPaths:](v6, (uint64_t)v8, *(void **)(a1 + 32));

      v7 = v8[4];
      v8[4] = 0;

      v5 = v8[5];
      v8[5] = 0;
      goto LABEL_6;
    }
    if (!a2)
    {
      v8 = WeakRetained;
      v5 = objc_loadWeakRetained(WeakRetained + 3);
      -[_UICollectionViewDragAndDropController dragSourceController:didCompleteLiftForItemsAtIndexPaths:](v5, (uint64_t)v8, *(void **)(a1 + 32));
LABEL_6:

      WeakRetained = v8;
    }
  }

}

void __92___UICollectionViewDragSourceController_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 24));
  else
    WeakRetained = 0;
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_decrementSessionRefCount");

}

void __95___UICollectionViewDragSourceController__addDragItemsToExistingSession_forDataSourceIndexPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  id v8;
  id v9;
  id v10;
  _UICollectionViewSourcePrivateLocalObject *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  -[_UICollectionViewDragSourceController dragState](*(_QWORD **)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  if (!v5)
  {
    WeakRetained = 0;
    if (!v3)
      goto LABEL_4;
    goto LABEL_3;
  }
  WeakRetained = objc_loadWeakRetained((id *)(v5 + 8));
  if (v4)
  {
LABEL_3:
    v8 = WeakRetained;
    v9 = v14;
    v10 = v6;
    v11 = -[_UICollectionViewSourcePrivateLocalObject initWithIndexPath:collectionView:]([_UICollectionViewSourcePrivateLocalObject alloc], "initWithIndexPath:collectionView:", v10, v8);

    objc_msgSend(v9, "_setPrivateLocalContext:", v11);
    objc_msgSend(v4, "dragItemsWithRebasableIndexPaths");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "compact");

    objc_msgSend(v4, "dragItemsWithRebasableIndexPaths");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addPointer:", v9);

  }
LABEL_4:

}

@end
