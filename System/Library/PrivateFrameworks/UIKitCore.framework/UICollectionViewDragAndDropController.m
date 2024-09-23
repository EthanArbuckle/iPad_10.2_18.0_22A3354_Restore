@implementation UICollectionViewDragAndDropController

void __81___UICollectionViewDragAndDropController_beginReorderingForItemAtIndexPath_cell___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v3[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_updateRowsAtIndexPaths:updateAction:", v2, 0);

}

uint64_t __65___UICollectionViewDragAndDropController_cancelReorderingForced___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

void __65___UICollectionViewDragAndDropController_cancelReorderingForced___block_invoke_3(uint64_t a1)
{
  -[_UICollectionViewDragDestinationController resumeDrops](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
}

uint64_t __55___UICollectionViewDragAndDropController_endReordering__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

uint64_t __83___UICollectionViewDragAndDropController__cleanupAfterOutstandingSessionCompletion__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_setDragAppearance:", 0);
}

void __79___UICollectionViewDragAndDropController_rebaseCellAppearanceStatesForUpdates___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  v9 = a4;
  v10 = a5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[_UICollectionViewSubviewCollection setView:ofKind:inCategory:atIndexPath:](*(_QWORD *)(a1 + 32), (uint64_t)v10, (uint64_t)v9, a2, (uint64_t)v12);

}

void __71___UICollectionViewDragAndDropController__rollbackCurrentDropInsertion__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v3[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_updateRowsAtIndexPaths:updateAction:", v2, 1);

}

uint64_t __59___UICollectionViewDragAndDropController_rebaseForUpdates___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finalIndexPathForInitialIndexPath:", a2);
}

uint64_t __121___UICollectionViewDragAndDropController_dragSourceController_willBeginAnimatingCancelForItemsAtIndexPaths_withAnimator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCellAppearancesForItemsAtIndexPaths:", *(_QWORD *)(a1 + 40));
}

uint64_t __121___UICollectionViewDragAndDropController_dragSourceController_willBeginAnimatingCancelForItemsAtIndexPaths_withAnimator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCellAppearancesForItemsAtIndexPaths:", *(_QWORD *)(a1 + 40));
}

uint64_t __121___UICollectionViewDragAndDropController_dragSourceController_willBeginAnimatingCancelForItemsAtIndexPaths_withAnimator___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_cellAppearanceStateForIndexPath:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6), (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
          objc_msgSend(v7, "setDragState:", 7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_updateCellAppearancesForItemsAtIndexPaths:", *(_QWORD *)(a1 + 32));
}

void __124___UICollectionViewDragAndDropController_insertPlaceholderForItemAtIndexPath_forDragItem_reuseIdentifier_cellUpdateHandler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v3[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_updateRowsAtIndexPaths:updateAction:", v2, 0);

}

void __71___UICollectionViewDragAndDropController_placeholderContextDidDismiss___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v3[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_updateRowsAtIndexPaths:updateAction:", v2, 1);

}

void __101___UICollectionViewDragAndDropController_placeholderContext_didCommitInsertionWithDataSourceUpdates___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __101___UICollectionViewDragAndDropController_placeholderContext_didCommitInsertionWithDataSourceUpdates___block_invoke_2;
  v3[3] = &unk_1E16BE398;
  v4 = v2;
  v5 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "performBatchUpdates:completion:", v3, 0);

}

void __101___UICollectionViewDragAndDropController_placeholderContext_didCommitInsertionWithDataSourceUpdates___block_invoke_2(uint64_t a1)
{
  UICollectionViewUpdateItem *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_isConnectedToDiffableDataSource"))
  {
    v2 = -[UICollectionViewUpdateItem initWithAction:forIndexPath:]([UICollectionViewUpdateItem alloc], "initWithAction:forIndexPath:", 0, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setExpectedDiffableUpdateItem:", v2);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "setExpectedDiffableUpdateItem:", 0);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  v3 = *(void **)(a1 + 32);
  v5[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updateWithUpdates:updateAction:", v4, 0);

}

@end
