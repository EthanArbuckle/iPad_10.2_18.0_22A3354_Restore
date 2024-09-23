@implementation UICollectionView(IC)

- (void)ic_deselectAllItemsAnimated:()IC
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  objc_msgSend(a1, "indexPathsForSelectedItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(a1, "deselectItemAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), a3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (uint64_t)ic_deselectAllItems
{
  return objc_msgSend(a1, "ic_deselectAllItemsAnimated:", 0);
}

- (id)ic_cellAtLocation:()IC
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "indexPathForItemAtPoint:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cellForItemAtIndexPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ic_firstItemIndexPath
{
  uint64_t v2;
  void *v3;

  if (objc_msgSend(a1, "numberOfSections") < 1)
  {
LABEL_5:
    v3 = 0;
  }
  else
  {
    v2 = 0;
    while (objc_msgSend(a1, "numberOfItemsInSection:", v2) < 1)
    {
      if (++v2 >= objc_msgSend(a1, "numberOfSections"))
        goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (double)ic_firstSelectedItemFrame
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "indexPathsForSelectedItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "ic_frameForItemAtIndexPath:", v3);
    v5 = v4;
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D628];
  }

  return v5;
}

- (id)ic_middleVisibleIndexPath
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a1, "ic_visibleRectConsideringInsets:", 1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1, "collectionViewLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutAttributesForElementsInRect:", v3, v5, v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v11, "count") >> 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "indexPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (double)ic_frameForItemAtIndexPath:()IC
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a1, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutAttributesForItemAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "frame");
    v8 = v7;
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D628];
  }

  return v8;
}

- (uint64_t)ic_selectFirstItemIfNoneSelected
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  uint64_t v7;

  objc_msgSend(a1, "indexPathsForSelectedItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  objc_msgSend(a1, "ic_firstItemIndexPath");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
    v6 = 1;
  else
    v6 = v4 == 0;
  v7 = !v6;
  if (!v6)
    objc_msgSend(a1, "selectItemAtIndexPath:animated:scrollPosition:", v4, 0, 0);

  return v7;
}

- (void)ic_selectCellAtIndexPath:()IC animated:
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  uint64_t v27;
  CGFloat rect2;
  void *rect2_8;
  CGRect v30;
  CGRect v31;

  if (a3)
  {
    v6 = a3;
    objc_msgSend(a1, "indexPathsForSelectedItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    rect2_8 = (void *)objc_claimAutoreleasedReturnValue();

    if (rect2_8)
      objc_msgSend(a1, "deselectItemAtIndexPath:animated:", rect2_8, 0);
    objc_msgSend(a1, "layoutAttributesForItemAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    rect2 = v9;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(a1, "adjustedContentInset");
    v17 = v16;
    objc_msgSend(a1, "adjustedContentInset");
    v19 = v18;
    objc_msgSend(a1, "bounds");
    v21 = v20;
    objc_msgSend(a1, "bounds");
    v23 = v17 + v22;
    objc_msgSend(a1, "bounds");
    v25 = v24;
    objc_msgSend(a1, "bounds");
    v30.size.height = v26 - v17 - v19;
    v30.origin.x = v21;
    v30.origin.y = v23;
    v30.size.width = v25;
    v31.origin.x = rect2;
    v31.origin.y = v11;
    v31.size.width = v13;
    v31.size.height = v15;
    if (CGRectContainsRect(v30, v31))
      v27 = 0;
    else
      v27 = 2;
    objc_msgSend(a1, "selectItemAtIndexPath:animated:scrollPosition:", v6, a4, v27);

  }
}

- (uint64_t)ic_reloadDataWithCompletion:()IC
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1E0CD28B0];
  v5 = a3;
  objc_msgSend(v4, "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v5);

  objc_msgSend(a1, "reloadData");
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (id)indexPathsForFocusedItems
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    objc_msgSend(v2, "focusedItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(a1, "indexPathForCell:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      if (v5)
      {
        v9[0] = v5;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)ic_selectionContainsFocusedItem
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(a1, "indexPathsForFocusedItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__UICollectionView_IC__ic_selectionContainsFocusedItem__block_invoke;
  v8[3] = &unk_1E5C20500;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "ic_containsObjectPassingTest:", v8);

  return v6;
}

@end
