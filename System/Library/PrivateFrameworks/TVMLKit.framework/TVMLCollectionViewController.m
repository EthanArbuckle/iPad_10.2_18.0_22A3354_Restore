@implementation TVMLCollectionViewController

void __54___TVMLCollectionViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[123], "evaluateForState:", 1);
    WeakRetained = v2;
  }

}

void __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = objc_msgSend(v9, "autoHighlightIndex");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v5, a3);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
    objc_msgSend(v9, "resetProperty:", 3);
  }

}

void __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a2;
  v6 = objc_msgSend(v5, "numberOfItems");
  objc_msgSend(v5, "indexTitles");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_3;
  v8[3] = &unk_24EB87C88;
  v9 = *(id *)(a1 + 32);
  v10 = v6;
  v11 = a3;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_4;
  if (objc_msgSend(v7, "integerValue") < *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", objc_msgSend(v7, "integerValue"), *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);
LABEL_4:

  }
}

uint64_t __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "indexPathsByIndexTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "indexPathsByIndexTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v9, "compare:", v11);
  return v12;
}

void __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_28(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v15 = v5;
  if (v6 && (v7 = objc_msgSend(v6, "indexOfObject:", v5), v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 48), "removeIndex:", v7);
    v9 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v11);

    if (v8 != a3)
    {
      v12 = *(void **)(a1 + 64);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v13, v14);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  }

}

void __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_2_31(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;

  v32 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", objc_msgSend(v7, "integerValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", objc_msgSend(v32, "integerValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "elementID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "elementID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "viewElement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "itemsChangeSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v31 = v11;
    objc_msgSend(v14, "removedIndexes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v15, "removedIndexes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "firstIndex");

      while (v18 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v19 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v18, objc_msgSend(v7, "integerValue"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v20);

        objc_msgSend(v15, "removedIndexes");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v21, "indexGreaterThanIndex:", v18);

      }
    }
    else
    {

    }
    objc_msgSend(v15, "updatedIndexesByNewIndex");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_3_32;
    v33[3] = &unk_24EB87D28;
    v34 = v32;
    v23 = v7;
    v24 = *(_QWORD *)(a1 + 56);
    v35 = v23;
    v36 = v24;
    v37 = v13;
    v25 = *(id *)(a1 + 64);
    v26 = *(_QWORD *)(a1 + 88);
    v38 = v25;
    v40 = v26;
    v27 = *(id *)(a1 + 72);
    v28 = *(_QWORD *)(a1 + 96);
    v39 = v27;
    v41 = v28;
    objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v33);

    objc_msgSend(v15, "removedIndexes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29 || (objc_msgSend(v15, "addedIndexes"), (v29 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

      v11 = v31;
    }
    else
    {
      objc_msgSend(v15, "movedIndexesByNewIndex");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v31;
      if (!v30)
        goto LABEL_13;
    }
    objc_msgSend(*(id *)(a1 + 80), "setObject:forKey:", v15, v23);
LABEL_13:

    goto LABEL_14;
  }
  if (objc_msgSend(v13, "updateType"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
LABEL_14:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24)
    || (objc_msgSend(*(id *)(a1 + 56), "updateSupplementaryViewsForSectionAtOldIndex:oldElement:withNewIndex:newElement:requiresReload:requiresRelayout:", objc_msgSend(v7, "integerValue"), v11, objc_msgSend(v32, "integerValue"), v13, *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24, *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24)))
  {
    *a4 = 1;
  }

}

void __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_3_32(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL v26;
  id v27;

  v7 = (void *)MEMORY[0x24BDD15D8];
  v8 = a3;
  v9 = a2;
  objc_msgSend(v7, "indexPathForItem:inSection:", objc_msgSend(v9, "integerValue"), objc_msgSend(*(id *)(a1 + 32), "integerValue"));
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD15D8];
  v11 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v10, "indexPathForItem:inSection:", v11, objc_msgSend(*(id *)(a1 + 40), "integerValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(a1 + 48);
  v14 = *(void **)(a1 + 56);
  v15 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v14, "prototypeForItemAtIndex:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "expectedCellSizeForElement:atIndexPath:", v16, v27);
  v18 = v17;
  v20 = v19;

  objc_msgSend(*(id *)(a1 + 64), "layoutAttributesForItemAtIndexPath:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  v23 = v22;
  v25 = v24;

  v26 = v18 == v23 && v20 == v25;
  if (v26
    || (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1, objc_msgSend(*(id *)(a1 + 56), "updateType") == 2))
  {
    objc_msgSend(*(id *)(a1 + 72), "addObject:", v27);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
    *a4 = 1;
  }

}

void __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_4_34(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "deleteSections:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "insertSections:", *(_QWORD *)(a1 + 48));
  v2 = MEMORY[0x24BDAC760];
  v3 = *(void **)(a1 + 56);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_5;
  v8[3] = &unk_24EB87D78;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v8);
  v4 = *(void **)(a1 + 64);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_7;
  v5[3] = &unk_24EB87E08;
  v6 = *(id *)(a1 + 32);
  v7 = &__block_literal_global_41;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

uint64_t __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = objc_msgSend(a2, "integerValue");
  v7 = objc_msgSend(v5, "integerValue");

  return objc_msgSend(v4, "moveSection:toSection:", v6, v7);
}

id __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "firstIndex");
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = v6; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v4, "indexGreaterThanIndex:", i))
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", i, a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v8);

    }
  }
  v9 = (void *)objc_msgSend(v5, "copy");

  return v9;
}

void __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;

  v17 = a3;
  v5 = objc_msgSend(a2, "integerValue");
  objc_msgSend(v17, "removedIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v17, "removedIndexes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, v5, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteItemsAtIndexPaths:", v10);

  }
  objc_msgSend(v17, "addedIndexes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = *(void **)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v17, "addedIndexes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v13 + 16))(v13, v5, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertItemsAtIndexPaths:", v15);

  }
  objc_msgSend(v17, "movedIndexesByNewIndex");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_8;
  v18[3] = &unk_24EB87DE0;
  v20 = v5;
  v19 = *(id *)(a1 + 32);
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v18);

}

void __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x24BDD15D8];
  v6 = a2;
  objc_msgSend(v5, "indexPathForItem:inSection:", objc_msgSend(a3, "integerValue"), *(_QWORD *)(a1 + 40));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD15D8];
  v8 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v7, "indexPathForItem:inSection:", v8, *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "moveItemAtIndexPath:toIndexPath:", v10, v9);

}

uint64_t __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_9(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_doUpdateViewLayoutAnimated:relayout:", 0, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  objc_msgSend(*(id *)(a1 + 32), "_updateHeaderView");
  result = objc_msgSend(*(id *)(a1 + 32), "_updateFooterView");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 970) = 0;
  return result;
}

void __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_10(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_11;
  v5[3] = &unk_24EB87E58;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "performBatchUpdates:completion:", v5, 0);

}

uint64_t __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_11(uint64_t a1)
{
  uint64_t result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __73___TVMLCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __73___TVMLCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
  v2[3] = &unk_24EB848C0;
  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

}

uint64_t __73___TVMLCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deselectItemAtIndexPath:animated:", *(_QWORD *)(a1 + 40), 1);
}

@end
