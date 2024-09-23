@implementation UIFloatingTabBarPinnedItemsView

uint64_t __54___UIFloatingTabBarPinnedItemsView_setItems_animated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(a2, "contentTab");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentTab");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  v10 = v8;
  v11 = v10;
  if (v9 == v10)
  {
    v12 = 1;
  }
  else
  {
    v12 = 0;
    if (v9 && v10)
      v12 = objc_msgSend(v9, "isEqual:", v10);
  }

  return v12;
}

BOOL __63___UIFloatingTabBarPinnedItemsView_itemIndexForItemAtLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CGFloat MinX;
  double v5;
  _BOOL8 v6;
  CGRect v8;
  CGRect v9;

  v3 = a2;
  objc_msgSend(v3, "frame");
  MinX = CGRectGetMinX(v8);
  v5 = *(double *)(a1 + 32);
  if (MinX <= v5)
  {
    objc_msgSend(v3, "frame");
    v6 = v5 <= CGRectGetMaxX(v9);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __63___UIFloatingTabBarPinnedItemsView_itemIndexForItemAtLocation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "_itemViewForItem:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return v4;
}

void __76___UIFloatingTabBarPinnedItemsView__reloadItemViewsWithDifference_animated___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a1[4], "removals");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = a1[5];
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v6), "object");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_itemViewForItem:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1[6], "addObject:", v9);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  objc_msgSend(a1[5], "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76___UIFloatingTabBarPinnedItemsView__reloadItemViewsWithDifference_animated___block_invoke_2;
  v11[3] = &unk_1E16B6EF0;
  v11[4] = a1[5];
  v12 = a1[7];
  v13 = a1[8];
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

}

void __76___UIFloatingTabBarPinnedItemsView__reloadItemViewsWithDifference_animated___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UIFloatingTabBarItemView *v11;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "_itemViewForItem:", v6);
  v11 = (_UIFloatingTabBarItemView *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = -[_UIFloatingTabBarItemView initWithFrame:]([_UIFloatingTabBarItemView alloc], "initWithFrame:", 0.0, 0.0, 32.0, 32.0);
    -[_UIFloatingTabBarItemView setPreferredDisplayMode:](v11, "setPreferredDisplayMode:", 2);
    -[_UIFloatingTabBarItemView setSuppressEditing:](v11, "setSuppressEditing:", 1);
    -[UIView setAlpha:](v11, "setAlpha:", 0.0);
    objc_msgSend(*(id *)(a1 + 32), "addSubview:", v11);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
  }
  objc_msgSend(v6, "contentTab");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBarItemView setItem:](v11, "setItem:", v7);

  -[_UIFloatingTabBarItemView setEditing:](v11, "setEditing:", objc_msgSend(*(id *)(a1 + 32), "isEditing"));
  -[_UIFloatingTabBarItemView setHasSelectionHighlight:](v11, "setHasSelectionHighlight:", objc_msgSend(*(id *)(a1 + 32), "highlightedIndex") == a3);
  -[UIView layoutIfNeeded](v11, "layoutIfNeeded");
  v8 = *(void **)(a1 + 48);
  objc_msgSend(v6, "contentTab");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v11, v10);

}

void __76___UIFloatingTabBarPinnedItemsView__reloadItemViewsWithDifference_animated___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v6++), "setAlpha:", 0.0);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v4);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *(id *)(a1 + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setAlpha:", 1.0, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v9);
  }

}

void __76___UIFloatingTabBarPinnedItemsView__reloadItemViewsWithDifference_animated___block_invoke_4(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "removeFromSuperview", (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

BOOL __52___UIFloatingTabBarPinnedItemsView_itemIndexForTab___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "contentTab");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

@end
