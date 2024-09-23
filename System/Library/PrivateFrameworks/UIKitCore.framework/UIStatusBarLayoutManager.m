@implementation UIStatusBarLayoutManager

- (UIStatusBarLayoutManager)initWithRegion:(int)a3 foregroundView:(id)a4 usesVerticalLayout:(BOOL)a5
{
  id v8;
  UIStatusBarLayoutManager *v9;
  UIStatusBarLayoutManager *v10;
  objc_super v12;

  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIStatusBarLayoutManager;
  v9 = -[UIStatusBarLayoutManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_region = a3;
    objc_storeWeak((id *)&v9->_foregroundView, v8);
    v10->_usesVerticalLayout = a5;
  }

  return v10;
}

- (void)dealloc
{
  uint64_t i;
  void *v4;
  objc_super v5;

  for (i = 16; i != 432; i += 8)
  {
    objc_msgSend(*(id *)((char *)&self->super.isa + i), "setLayoutManager:", 0);
    objc_msgSend(*(id *)((char *)&self->super.isa + i), "removeFromSuperview");
    v4 = *(Class *)((char *)&self->super.isa + i);
    *(Class *)((char *)&self->super.isa + i) = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)UIStatusBarLayoutManager;
  -[UIStatusBarLayoutManager dealloc](&v5, sel_dealloc);
}

- (double)_dimensionForSize:(CGSize)a3
{
  double height;
  double width;

  height = a3.height;
  width = a3.width;
  if (-[UIStatusBarLayoutManager usesVerticalLayout](self, "usesVerticalLayout"))
    return height;
  else
    return width;
}

- (void)_setOrigin:(double)a3 forPoint:(CGPoint *)a4
{
  _BOOL4 v6;
  uint64_t v7;

  v6 = -[UIStatusBarLayoutManager usesVerticalLayout](self, "usesVerticalLayout");
  v7 = 8;
  if (!v6)
    v7 = 0;
  *(double *)((char *)&a4->x + v7) = a3;
}

- (void)_addOriginDelta:(double)a3 toPoint:(CGPoint *)a4
{
  _BOOL4 v6;
  uint64_t v7;

  v6 = -[UIStatusBarLayoutManager usesVerticalLayout](self, "usesVerticalLayout");
  v7 = 8;
  if (!v6)
    v7 = 0;
  *(double *)((char *)&a4->x + v7) = *(double *)((char *)&a4->x + v7) + a3;
}

- (BOOL)prepareEnabledItems:(BOOL *)a3 withData:(id)a4 actions:(int)a5
{
  uint64_t v5;
  uint64_t v9;
  BOOL v10;
  BOOL v11;
  char v12;
  __int16 v14;

  v5 = *(_QWORD *)&a5;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  do
  {
    v14 = 0;
    -[UIStatusBarLayoutManager _prepareEnabledItemType:withEnabledItems:withData:actions:itemAppearing:itemDisappearing:](self, "_prepareEnabledItemType:withEnabledItems:withData:actions:itemAppearing:itemDisappearing:", v9, a3, a4, v5, (char *)&v14 + 1, &v14);
    v12 = HIBYTE(v14) | v11;
    v11 = v12 != 0;
    v10 = (v14 | v10) != 0;
    v9 = (v9 + 1);
  }
  while ((_DWORD)v9 != 52);
  if (v12)
  {
    -[UIStatusBarLayoutManager _positionNewItemViewsWithEnabledItems:](self, "_positionNewItemViewsWithEnabledItems:", a3);
    return 1;
  }
  return v10;
}

- (void)setVisibilityOfAllItems:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[UIStatusBarLayoutManager _itemViews](self, "_itemViews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setVisible:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)setVisibilityOfItem:(id)a3 visible:(BOOL)a4
{
  -[UIStatusBarLayoutManager setVisibilityOfItemType:visible:](self, "setVisibilityOfItemType:visible:", objc_msgSend(a3, "type"), a4);
}

- (void)setVisibilityOfItemType:(int)a3 visible:(BOOL)a4
{
  UIStatusBarItemView *v4;

  v4 = self->_itemViews[a3];
  if (v4)
    -[UIStatusBarItemView setVisible:](v4, "setVisible:", a4);
}

- (BOOL)updateItemsWithData:(id)a3 actions:(int)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[UIStatusBarLayoutManager _itemViews](self, "_itemViews", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v9);
        v12 |= -[UIStatusBarLayoutManager _updateItemView:withData:actions:animated:](self, "_updateItemView:withData:actions:animated:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), v8, v6, v5);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12 & 1;
}

- (void)_prepareEnabledItemType:(int)a3 withEnabledItems:(BOOL *)a4 withData:(id)a5 actions:(int)a6 itemAppearing:(BOOL *)a7 itemDisappearing:(BOOL *)a8
{
  uint64_t v10;
  uint64_t v12;
  UIStatusBarItemView *v14;
  UIStatusBarItemView *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  id v19;
  id v20;

  v10 = *(_QWORD *)&a6;
  v12 = *(_QWORD *)&a3;
  v20 = a5;
  v14 = self->_itemViews[v12];
  v15 = v14;
  if (a4[v12])
  {
    if (v14)
    {
      -[UIStatusBarItemView setAllowsUpdates:](v14, "setAllowsUpdates:", 1);
    }
    else
    {
      -[UIStatusBarLayoutManager foregroundView](self, "foregroundView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIStatusBarItem itemWithType:idiom:](UIStatusBarItem, "itemWithType:idiom:", v12, objc_msgSend(v17, "idiom"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "appearsInRegion:", self->_region))
      {
        v19 = -[UIStatusBarLayoutManager _createViewForItem:withData:actions:](self, "_createViewForItem:withData:actions:", v18, v20, v10);
        if (a7)
          *a7 = 1;
      }

    }
  }
  else if (v14)
  {
    -[UIStatusBarItemView setAllowsUpdates:](v14, "setAllowsUpdates:", 0);
    v16 = -[UIStatusBarItemView isVisible](v15, "isVisible");
    if (a8)
    {
      if (v16)
        *a8 = 1;
    }
  }

}

- (void)_positionNewItemViewsWithEnabledItems:(BOOL *)a3
{
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t i;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  int v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[UIStatusBarLayoutManager _startPosition](self, "_startPosition");
  v6 = v5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[UIStatusBarLayoutManager _itemViewsSortedForLayout](self, "_itemViewsSortedForLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    v11 = 1;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "superview");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          objc_msgSend(v13, "setVisible:", 0);
          -[UIStatusBarLayoutManager _frameForItemView:startPosition:firstView:](self, "_frameForItemView:startPosition:firstView:", v13, v11 & 1, v6);
          objc_msgSend(v13, "setFrame:");
          WeakRetained = objc_loadWeakRetained((id *)&self->_foregroundView);
          objc_msgSend(WeakRetained, "addSubview:", v13);

        }
        objc_msgSend(v13, "item");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "type");

        if (a3[v17])
        {
          -[UIStatusBarLayoutManager _positionAfterPlacingItemView:startPosition:firstView:](self, "_positionAfterPlacingItemView:startPosition:firstView:", v13, v11 & 1, v6);
          v6 = v18;
          v11 = 0;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

}

- (BOOL)_processDelta:(double)a3 forView:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;

  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (a3 != 0.0)
  {
    objc_msgSend(v6, "frame");
    -[UIStatusBarLayoutManager _repositionedNewFrame:sizeDelta:](self, "_repositionedNewFrame:sizeDelta:");
    objc_msgSend(v7, "setFrame:");
    if ((objc_msgSend(v7, "isVisible") & 1) != 0)
      v8 = 1;
  }

  return v8;
}

- (BOOL)_updateItemView:(id)a3 withData:(id)a4 actions:(int)a5 animated:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v7;
  id v10;
  id v11;
  _BOOL8 v12;
  BOOL v13;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  v12 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  if (v6 && (objc_msgSend(v10, "animatesDataChange") & 1) == 0)
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
  objc_msgSend(v10, "setStatusBarData:actions:", v11, v7);
  v13 = -[UIStatusBarLayoutManager _processDelta:forView:](self, "_processDelta:forView:", v10);
  +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v12);

  return v13;
}

- (BOOL)prepareDoubleHeightItemWithEnabledItems:(BOOL *)a3
{
  char v5;
  __int16 v7;

  v7 = 0;
  -[UIStatusBarLayoutManager _prepareEnabledItemType:withEnabledItems:withData:actions:itemAppearing:itemDisappearing:](self, "_prepareEnabledItemType:withEnabledItems:withData:actions:itemAppearing:itemDisappearing:", 23, a3, 0, 0, (char *)&v7 + 1, &v7);
  v5 = HIBYTE(v7);
  if (HIBYTE(v7))
  {
    -[UIStatusBarLayoutManager _positionNewItemViewsWithEnabledItems:](self, "_positionNewItemViewsWithEnabledItems:", a3);
    v5 = HIBYTE(v7) != 0;
  }
  if ((_BYTE)v7)
    return 1;
  else
    return v5;
}

- (BOOL)updateDoubleHeightItem
{
  return -[UIStatusBarLayoutManager _updateItemView:withData:actions:animated:](self, "_updateItemView:withData:actions:animated:", self->_itemViews[23], 0, 0, 0);
}

- (void)reflowWithVisibleItems:(id)a3 duration:(double)a4
{
  id v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[UIStatusBarLayoutManager _startPosition](self, "_startPosition");
  v7 = v6;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[UIStatusBarLayoutManager _itemViewsSortedForLayout](self, "_itemViewsSortedForLayout", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    v12 = 1;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v14, "item");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v5, "containsObject:", v15);

        if ((_DWORD)v16)
          -[UIStatusBarLayoutManager _frameForItemView:startPosition:firstView:](self, "_frameForItemView:startPosition:firstView:", v14, v12 & 1, v7);
        else
          objc_msgSend(v14, "frame");
        objc_msgSend(v14, "setVisible:frame:duration:", v16);
        if ((_DWORD)v16)
        {
          -[UIStatusBarLayoutManager _positionAfterPlacingItemView:startPosition:firstView:](self, "_positionAfterPlacingItemView:startPosition:firstView:", v14, v12 & 1, v7);
          v7 = v17;
          v12 = 0;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

}

- (void)removeDisabledItems:(BOOL *)a3
{
  uint64_t v4;
  UIStatusBarItemView **itemViews;
  UIStatusBarItemView *v6;
  UIStatusBarItemView *v7;
  BOOL v8;
  UIStatusBarItemView *v9;

  v4 = 0;
  itemViews = self->_itemViews;
  do
  {
    v6 = itemViews[v4];
    v7 = v6;
    v8 = a3[v4] || v6 == 0;
    if (!v8 && !-[UIStatusBarItemView isVisible](v6, "isVisible"))
    {
      -[UIView removeFromSuperview](v7, "removeFromSuperview");
      v9 = itemViews[v4];
      itemViews[v4] = 0;

    }
    ++v4;
  }
  while (v4 != 52);
}

- (void)positionInvisibleItems
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t i;
  void *v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[UIStatusBarLayoutManager _startPosition](self, "_startPosition");
  v4 = v3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UIStatusBarLayoutManager _itemViewsSortedForLayout](self, "_itemViewsSortedForLayout", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    v9 = 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isVisible") & 1) == 0)
        {
          -[UIStatusBarLayoutManager _frameForItemView:startPosition:firstView:](self, "_frameForItemView:startPosition:firstView:", v11, v9 & 1, v4);
          objc_msgSend(v11, "setFrame:");
        }
        -[UIStatusBarLayoutManager _positionAfterPlacingItemView:startPosition:firstView:](self, "_positionAfterPlacingItemView:startPosition:firstView:", v11, v9 & 1, v4);
        v4 = v12;
        v9 = 0;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v9 = 0;
    }
    while (v7);
  }

}

- (void)makeVisibleItemsPerformPendedActions
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[UIStatusBarLayoutManager _itemViews](self, "_itemViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "isVisible"))
          objc_msgSend(v7, "performPendedActions");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (double)sizeNeededForItem:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[UIStatusBarLayoutManager _viewForItem:](self, "_viewForItem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarLayoutManager _sizeNeededForItemView:](self, "_sizeNeededForItemView:", v4);
  v6 = v5;

  return v6;
}

- (double)sizeNeededForItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        -[UIStatusBarLayoutManager sizeNeededForItem:](self, "sizeNeededForItem:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v8 = v8 + v10;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (void)clearOverlapFromItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[UIStatusBarLayoutManager _viewForItem:](self, "_viewForItem:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setCurrentOverlap:", 0.0);
        objc_msgSend(v9, "resetContentOverlap");
        -[UIStatusBarLayoutManager _processDelta:forView:](self, "_processDelta:forView:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (double)distributeOverlap:(double)a3 amongItems:(id)a4
{
  id v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  double v16;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  double v24;
  double v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = 0.0;
  do
  {
    if (v7 >= a3)
      break;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (!v8)
      break;
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v6);
        -[UIStatusBarLayoutManager _viewForItem:](self, "_viewForItem:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "currentOverlap");
        v15 = v14;
        objc_msgSend(v13, "maximumOverlap");
        if (v16 > v15 && v7 < a3)
        {
          objc_msgSend(v13, "setCurrentOverlap:", v15 + 1.0);
          v7 = v7 + 1.0;
          v10 = 1;
        }

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v9);
  }
  while ((v10 & 1) != 0);
  if (v7 < a3)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v18 = v6;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v18);
          -[UIStatusBarLayoutManager _viewForItem:](self, "_viewForItem:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j), (_QWORD)v27);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addContentOverlap:", a3 - v7);
          v25 = v24;
          -[UIStatusBarLayoutManager _processDelta:forView:](self, "_processDelta:forView:", v23);
          v7 = v7 - v25;

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v20);
    }

  }
  return v7;
}

- (double)removeOverlap:(double)a3 fromItems:(id)a4
{
  id v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = 0.0;
  do
  {
    if (v7 >= a3)
      break;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (!v8)
      break;
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v6);
        -[UIStatusBarLayoutManager _viewForItem:](self, "_viewForItem:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "currentOverlap");
        if (v14 > 0.0 && v7 < a3)
        {
          objc_msgSend(v13, "setCurrentOverlap:", v14 + -1.0);
          v7 = v7 + 1.0;
          v10 = 1;
        }

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
  while ((v10 & 1) != 0);

  return v7;
}

- (CGRect)rectForItems:(id)a3
{
  void *v4;
  double v5;
  double v6;
  CGSize v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CGRect v33;
  _QWORD v34[5];
  _BYTE v35[128];
  uint64_t v36;
  CGRect v37;
  CGRect result;
  CGRect v39;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __41__UIStatusBarLayoutManager_rectForItems___block_invoke;
  v34[3] = &unk_1E16E2E70;
  v34[4] = self;
  objc_msgSend(v4, "sortUsingComparator:", v34);
  -[UIStatusBarLayoutManager _startPosition](self, "_startPosition");
  v6 = v5;
  v7 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v33.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  v33.size = v7;
  -[UIStatusBarLayoutManager _setOrigin:forPoint:](self, "_setOrigin:forPoint:", &v33, v5);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v30;
    v12 = 1;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v8);
        -[UIStatusBarLayoutManager _viewForItem:](self, "_viewForItem:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v13), (_QWORD)v29);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v12 & 1;
        -[UIStatusBarLayoutManager _frameForItemView:startPosition:firstView:](self, "_frameForItemView:startPosition:firstView:", v14, v15, v6);
        v39.origin.x = v16;
        v39.origin.y = v17;
        v39.size.width = v18;
        v39.size.height = v19;
        v33 = CGRectUnion(v33, v39);
        -[UIStatusBarLayoutManager _positionAfterPlacingItemView:startPosition:firstView:](self, "_positionAfterPlacingItemView:startPosition:firstView:", v14, v15, v6);
        v6 = v20;

        v12 = 0;
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      v12 = 0;
    }
    while (v10);
  }

  v37 = CGRectStandardize(v33);
  x = v37.origin.x;
  y = v37.origin.y;
  width = v37.size.width;
  height = v37.size.height;

  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

uint64_t __41__UIStatusBarLayoutManager_rectForItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  v7 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v7 == 2)
  {
    v8 = objc_msgSend(v5, "compareCenterOrder:", v6);
  }
  else if (v7 == 1)
  {
    v8 = objc_msgSend(v5, "compareRightOrder:", v6);
  }
  else
  {
    if (v7)
    {
      v9 = 0;
      goto LABEL_9;
    }
    v8 = objc_msgSend(v5, "compareLeftOrder:", v6);
  }
  v9 = v8;
LABEL_9:

  return v9;
}

- (BOOL)itemIsVisible:(id)a3
{
  void *v3;
  char v4;

  -[UIStatusBarLayoutManager _viewForItem:](self, "_viewForItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isVisible");

  return v4;
}

- (void)itemView:(id)a3 sizeChangedBy:(double)a4
{
  id v5;
  int v6;
  id WeakRetained;

  v5 = a3;
  objc_msgSend(v5, "frame");
  -[UIStatusBarLayoutManager _repositionedNewFrame:sizeDelta:](self, "_repositionedNewFrame:sizeDelta:");
  objc_msgSend(v5, "setFrame:");
  v6 = objc_msgSend(v5, "isVisible");

  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_foregroundView);
    objc_msgSend(WeakRetained, "reflowItemViews:", 1);

  }
}

- (double)_sizeNeededForItemView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "frame");
    -[UIStatusBarLayoutManager _dimensionForSize:](self, "_dimensionForSize:", v5, v6);
    v8 = v7;
    objc_msgSend(v4, "standardPadding");
    v10 = v8 + v9;
    objc_msgSend(v4, "extraLeftPadding");
    v12 = v10 + v11;
    objc_msgSend(v4, "extraRightPadding");
    v14 = v12 + v13;
    objc_msgSend(v4, "currentOverlap");
    v16 = v14 - v15;
    objc_msgSend(v4, "shadowPadding");
    v18 = v17;

    v19 = v16 - (v18 + v18);
  }
  else
  {
    v19 = 0.0;
  }
  return ceil(v19);
}

- (id)_viewForItem:(id)a3
{
  return self->_itemViews[objc_msgSend(a3, "type")];
}

- (id)_createViewForItem:(id)a3 withData:(id)a4 actions:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  int v10;
  id WeakRetained;
  void *v12;
  id v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(v9, "type");
  WeakRetained = objc_loadWeakRetained((id *)&self->_foregroundView);
  objc_msgSend(WeakRetained, "foregroundStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[UIStatusBarItemView createViewForItem:withData:actions:foregroundStyle:](UIStatusBarItemView, "createViewForItem:withData:actions:foregroundStyle:", v9, v8, v5, v12);

  objc_msgSend(v13, "setLayoutManager:", self);
  objc_msgSend(v13, "setPersistentAnimationsEnabled:", self->_persistentAnimationsEnabled);
  objc_storeStrong((id *)&self->_itemViews[v10], v13);
  if (self->_region == 1)
  {
    v14 = !-[UIStatusBarLayoutManager usesVerticalLayout](self, "usesVerticalLayout");
    v15 = 8;
    v16 = 6;
  }
  else
  {
    v14 = !-[UIStatusBarLayoutManager usesVerticalLayout](self, "usesVerticalLayout");
    v15 = 7;
    v16 = 5;
  }
  if (v14)
    v17 = v15;
  else
    v17 = v16;
  objc_msgSend(v13, "setContentMode:", v17);
  return v13;
}

- (id)_itemViews
{
  void *v3;
  uint64_t i;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 16; i != 432; i += 8)
  {
    if (*(Class *)((char *)&self->super.isa + i))
      objc_msgSend(v3, "addObject:");
  }
  return v3;
}

- (id)_itemViewsSortedForLayout
{
  void *v3;
  _QWORD v5[5];

  -[UIStatusBarLayoutManager _itemViews](self, "_itemViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__UIStatusBarLayoutManager__itemViewsSortedForLayout__block_invoke;
  v5[3] = &unk_1E16E2E98;
  v5[4] = self;
  objc_msgSend(v3, "sortUsingComparator:", v5);
  return v3;
}

uint64_t __53__UIStatusBarLayoutManager__itemViewsSortedForLayout__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a3;
  objc_msgSend(a2, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v8 == 2)
  {
    v9 = objc_msgSend(v6, "compareCenterOrder:", v7);
  }
  else if (v8 == 1)
  {
    v9 = objc_msgSend(v6, "compareRightOrder:", v7);
  }
  else
  {
    if (v8)
    {
      v10 = 0;
      goto LABEL_9;
    }
    v9 = objc_msgSend(v6, "compareLeftOrder:", v7);
  }
  v10 = v9;
LABEL_9:

  return v10;
}

- (double)_startPosition
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  int region;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t i;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_foregroundView);
  objc_msgSend(WeakRetained, "bounds");
  -[UIStatusBarLayoutManager _dimensionForSize:](self, "_dimensionForSize:", v4, v5);
  v7 = v6;
  region = self->_region;
  if (region == 2)
  {
    v9 = v6 * 0.5;
    if (-[UIStatusBarLayoutManager usesVerticalLayout](self, "usesVerticalLayout"))
    {
      -[UIStatusBarLayoutManager assignedStartPosition](self, "assignedStartPosition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[UIStatusBarLayoutManager assignedStartPosition](self, "assignedStartPosition");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "floatValue");

      }
      -[UIStatusBarLayoutManager _itemViewsSortedForLayout](self, "_itemViewsSortedForLayout");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v28;
        v17 = 0.0;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v28 != v16)
              objc_enumerationMutation(v13);
            v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            if (objc_msgSend(v19, "isVisible"))
            {
              -[UIStatusBarLayoutManager _sizeNeededForItemView:](self, "_sizeNeededForItemView:", v19);
              v17 = v17 + v20;
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v15);
      }
      objc_msgSend(v13, "lastObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "standardPadding");
      objc_msgSend(v13, "lastObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "extraRightPadding");

      +[UIScreen _carScreen](UIScreen, "_carScreen");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      UIRoundToScreenScale(v24);
      v9 = v25;

    }
  }
  else if (region == 1)
  {
    objc_msgSend(WeakRetained, "rightEdgePadding");
    v9 = v7 - v21;
  }
  else
  {
    v9 = 0.0;
    if (!region)
    {
      objc_msgSend(WeakRetained, "leftEdgePadding");
      v9 = v10;
    }
  }

  return floor(v9);
}

- (CGRect)_frameForItemView:(id)a3 startPosition:(double)a4 firstView:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  __int128 v16;
  double v17;
  double v18;
  int64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  int region;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v38;
  double v39;
  double v40;
  double v41;
  CGPoint v42;
  __int128 v43;
  CGRect v44;
  CGRect v45;
  CGRect result;

  v5 = a5;
  v8 = a3;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "frame");
    v11 = v10;
    v13 = v12;
    v42.x = v14;
    v42.y = v15;
    *(double *)&v43 = v10;
    *((double *)&v43 + 1) = v12;
  }
  else
  {
    v16 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v42 = (CGPoint)*MEMORY[0x1E0C9D648];
    v43 = v16;
    v13 = *((double *)&v16 + 1);
    v11 = *(double *)&v16;
  }
  -[UIStatusBarLayoutManager _dimensionForSize:](self, "_dimensionForSize:", v11, v13, v42);
  v18 = v17;
  v19 = +[UIStatusBar _deviceUserInterfaceLayoutDirection](UIStatusBar, "_deviceUserInterfaceLayoutDirection");
  if (v19 && !-[UIStatusBarLayoutManager usesVerticalLayout](self, "usesVerticalLayout"))
  {
    objc_msgSend(v9, "extraRightPadding");
    v21 = v23;
    objc_msgSend(v9, "extraLeftPadding");
  }
  else
  {
    objc_msgSend(v9, "extraLeftPadding");
    v21 = v20;
    objc_msgSend(v9, "extraRightPadding");
  }
  v24 = v22;
  region = self->_region;
  switch(region)
  {
    case 2:
      if (-[UIStatusBarLayoutManager usesVerticalLayout](self, "usesVerticalLayout"))
      {
        objc_msgSend(v9, "extraLeftPadding");
        v27 = v28 + a4;
        goto LABEL_18;
      }
      if (v5)
      {
        v29 = a4 - floor(v18 * 0.5) + 2.0;
LABEL_20:
        -[UIStatusBarLayoutManager _setOrigin:forPoint:](self, "_setOrigin:forPoint:", &v42, v29);
        v13 = *((double *)&v43 + 1);
        v11 = *(double *)&v43;
        break;
      }
      if (v19)
      {
        v27 = v24 + a4;
        goto LABEL_18;
      }
LABEL_19:
      objc_msgSend(v9, "currentRightOverlap");
      v32 = a4 - (v18 + v24) + v31;
      objc_msgSend(v9, "shadowPadding");
      v29 = v32 + v33;
      goto LABEL_20;
    case 1:
      goto LABEL_19;
    case 0:
      objc_msgSend(v9, "currentLeftOverlap");
      v27 = v21 + a4 - v26;
LABEL_18:
      objc_msgSend(v9, "shadowPadding");
      v29 = v27 - v30;
      goto LABEL_20;
  }
  v44.origin = v42;
  v44.size.width = v11;
  v44.size.height = v13;
  v45 = CGRectIntegral(v44);
  x = v45.origin.x;
  y = v45.origin.y;
  width = v45.size.width;
  height = v45.size.height;

  v38 = x;
  v39 = y;
  v40 = width;
  v41 = height;
  result.size.height = v41;
  result.size.width = v40;
  result.origin.y = v39;
  result.origin.x = v38;
  return result;
}

- (double)_positionAfterPlacingItemView:(id)a3 startPosition:(double)a4 firstView:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int64_t v15;
  int region;
  int64_t v17;
  double v18;
  double v20;
  double v21;

  v5 = a5;
  v8 = a3;
  v9 = v8;
  v10 = 0.0;
  v11 = 0.0;
  if (v8)
  {
    objc_msgSend(v8, "frame");
    -[UIStatusBarLayoutManager _dimensionForSize:](self, "_dimensionForSize:", v12, v13);
    v11 = v14 * 0.5;
  }
  v15 = +[UIStatusBar _deviceUserInterfaceLayoutDirection](UIStatusBar, "_deviceUserInterfaceLayoutDirection");
  region = self->_region;
  if (region != 2)
  {
    if (region != 1)
    {
      if (region)
        goto LABEL_12;
      goto LABEL_8;
    }
    -[UIStatusBarLayoutManager _sizeNeededForItemView:](self, "_sizeNeededForItemView:", v9);
LABEL_11:
    v10 = a4 - v18;
    goto LABEL_12;
  }
  v17 = v15;
  if (-[UIStatusBarLayoutManager usesVerticalLayout](self, "usesVerticalLayout"))
  {
LABEL_8:
    -[UIStatusBarLayoutManager _sizeNeededForItemView:](self, "_sizeNeededForItemView:", v9);
LABEL_9:
    v10 = v18 + a4;
    goto LABEL_12;
  }
  if (!v5)
  {
    -[UIStatusBarLayoutManager _sizeNeededForItemView:](self, "_sizeNeededForItemView:", v9);
    if (v17)
      goto LABEL_9;
    goto LABEL_11;
  }
  v20 = floor(v11);
  -[UIStatusBarLayoutManager _sizeNeededForItemView:](self, "_sizeNeededForItemView:", v9);
  if (v17)
    v10 = a4 - v20 + v21;
  else
    v10 = v20 + a4 - v21;
LABEL_12:

  return floor(v10);
}

- (CGRect)_repositionedNewFrame:(CGRect)a3 sizeDelta:(double)a4
{
  int region;
  CGRect v5;

  v5 = a3;
  region = self->_region;
  if (region == 1)
    goto LABEL_4;
  if (region == 2)
  {
    a4 = floor(a4 * 0.5);
LABEL_4:
    -[UIStatusBarLayoutManager _addOriginDelta:toPoint:](self, "_addOriginDelta:toPoint:", &v5, -a4);
    a3 = v5;
  }
  return CGRectIntegral(a3);
}

- (void)setPersistentAnimationsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_persistentAnimationsEnabled != a3)
  {
    v3 = a3;
    self->_persistentAnimationsEnabled = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[UIStatusBarLayoutManager _itemViews](self, "_itemViews", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setPersistentAnimationsEnabled:", v3);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (id)itemViewOfType:(int)a3
{
  return self->_itemViews[a3];
}

- (id)visibleItemViewAtPoint:(CGPoint)a3 inForegroundView:(id)a4
{
  double y;
  double x;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  double v12;
  double v13;
  id v14;
  double v15;
  uint64_t i;
  id v17;
  id v18;
  BOOL IsEmpty;
  double v20;
  double v21;
  double MinX;
  uint64_t v23;
  double v27;
  id v29;
  void *v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  -[UIStatusBarLayoutManager foregroundView](self, "foregroundView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 != v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIStatusBarLayoutManager.m"), 620, CFSTR("%s passed bogus foreground view %@"), sel_getName(a2), v8);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_foregroundView);
  objc_msgSend(WeakRetained, "foregroundStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "standardPadding");
  v13 = v12;

  v14 = 0;
  v15 = 1.79769313e308;
  for (i = 16; i != 432; i += 8)
  {
    v17 = *(id *)((char *)&self->super.isa + i);
    objc_msgSend(v17, "superview");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18 != v8)
      goto LABEL_12;
    if (!objc_msgSend(v17, "isVisible"))
    {
      v18 = v8;
LABEL_12:
      v27 = v15;
LABEL_13:

      v15 = v27;
      goto LABEL_14;
    }
    objc_msgSend(v17, "frame");
    IsEmpty = CGRectIsEmpty(v32);

    if (!IsEmpty)
    {
      objc_msgSend(v8, "convertPoint:toView:", v17, x, y);
      v21 = v20;
      if ((objc_msgSend(v17, "pointInside:withEvent:", 0) & 1) != 0)
        goto LABEL_24;
      objc_msgSend(v17, "bounds");
      MinX = CGRectGetMinX(v33);
      objc_msgSend(v17, "bounds");
      if (v21 <= MinX)
      {
        v27 = CGRectGetMinX(*(CGRect *)&v23) - v21;
      }
      else if (v21 >= CGRectGetMaxX(*(CGRect *)&v23))
      {
        objc_msgSend(v17, "bounds");
        v27 = v21 - CGRectGetMaxX(v34);
      }
      else
      {
        v27 = 1.79769313e308;
      }
      if (v27 < v13 && v27 < v15)
      {
        v29 = v17;
        v18 = v14;
        v14 = v29;
        goto LABEL_13;
      }
    }
LABEL_14:

  }
  v14 = v14;
  v17 = v14;
LABEL_24:

  return v17;
}

- (UIStatusBarForegroundView)foregroundView
{
  return (UIStatusBarForegroundView *)objc_loadWeakRetained((id *)&self->_foregroundView);
}

- (void)setForegroundView:(id)a3
{
  objc_storeWeak((id *)&self->_foregroundView, a3);
}

- (BOOL)persistentAnimationsEnabled
{
  return self->_persistentAnimationsEnabled;
}

- (BOOL)usesVerticalLayout
{
  return self->_usesVerticalLayout;
}

- (NSNumber)assignedStartPosition
{
  return self->_assignedStartPosition;
}

- (void)setAssignedStartPosition:(id)a3
{
  objc_storeStrong((id *)&self->_assignedStartPosition, a3);
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_assignedStartPosition, 0);
  objc_destroyWeak((id *)&self->_foregroundView);
  for (i = 424; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
}

@end
