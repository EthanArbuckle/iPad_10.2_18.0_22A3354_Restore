@implementation TVCarouselView

uint64_t __69___TVCarouselView_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(*(id *)(a1 + 32), "collectionToDatasourceIndexMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "minusSet:", v8);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "containsObject:", v9);

  return v10;
}

uint64_t __74___TVCarouselView_collectionView_didEndDisplayingCell_forItemAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(a1 + 32), "collectionToDatasourceIndexMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "minusSet:", v8);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "containsObject:", v9);

  return v10;
}

void __68___TVCarouselView__setContentOffsetForCollectionViewIndex_animated___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentOffset");
  v4 = v3;

  objc_msgSend(*(id *)(a1 + 32), "_contentOffsetXForCollectionViewIndex:", *(_QWORD *)(a1 + 40));
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "_collectionView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentOffset:animated:", *(unsigned __int8 *)(a1 + 48), v6, v4);

}

void __94___TVCarouselView__updateCarouselWithDataSource_indicesToRemove_indicesToAdd_indicesToReload___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __94___TVCarouselView__updateCarouselWithDataSource_indicesToRemove_indicesToAdd_indicesToReload___block_invoke_2;
  v4[3] = &unk_24FD409F8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v2, "performBatchUpdates:completion:", v4, 0);

}

void __94___TVCarouselView__updateCarouselWithDataSource_indicesToRemove_indicesToAdd_indicesToReload___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 488), *(id *)(*(_QWORD *)(a1 + 32) + 576));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 576), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteItemsAtIndexPaths:", *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "_collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertItemsAtIndexPaths:", *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 32), "_collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadItemsAtIndexPaths:", *(_QWORD *)(a1 + 64));

}

uint64_t __64___TVCarouselView__updateContentOffsetForFocusedIndex_animated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_contentOffsetXForCollectionViewIndex:", *(_QWORD *)(a1 + 40));
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "_collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentOffset");
  objc_msgSend(v4, "setContentOffset:animated:", 0, v3);

  return objc_msgSend(*(id *)(a1 + 32), "_updateContentForNewCenterIndex:", *(_QWORD *)(a1 + 48));
}

void __64___TVCarouselView__updateContentOffsetForFocusedIndex_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", *(_QWORD *)(a1 + 40), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 448);
  *(_QWORD *)(v3 + 448) = v2;

}

void __40___TVCarouselView__startAutoScrollTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  char v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentMode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF7F78]);

    WeakRetained = v5;
    if ((v4 & 1) == 0)
    {
      objc_msgSend(v5, "_updateContentOffsetForFocusedIndex:animated:", objc_msgSend(v5, "_centerCollectionViewCellIndex") + 1, 1);
      WeakRetained = v5;
    }
  }

}

void __39___TVCarouselView__stopAutoScrollTimer__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

@end
