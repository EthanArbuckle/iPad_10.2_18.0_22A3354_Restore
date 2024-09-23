@implementation TUIAssistantButtonBarGroupView

- (TUIAssistantButtonBarGroupView)initWithBarButtonItemGroup:(id)a3 visualProvider:(id)a4 buttonProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  TUIAssistantButtonBarGroupView *v12;
  NSMutableArray *v13;
  NSMutableArray *visibleButtons;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)TUIAssistantButtonBarGroupView;
  v12 = -[TUIAssistantButtonBarGroupView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v12)
  {
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    visibleButtons = v12->_visibleButtons;
    v12->_visibleButtons = v13;

    objc_storeStrong((id *)&v12->_barButtonItemGroup, a3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIBarButtonItemGroup _setOwner:](v12->_barButtonItemGroup, "_setOwner:", v12);
    objc_storeWeak((id *)&v12->_buttonProvider, v11);
    objc_storeStrong((id *)&v12->_visualProvider, a4);
  }

  return v12;
}

- (BOOL)_canBeCollapsed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[TUIAssistantButtonBarGroupView barButtonItemGroup](self, "barButtonItemGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "representativeItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TUIAssistantButtonBarGroupView barButtonItemGroup](self, "barButtonItemGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "barButtonItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (unint64_t)objc_msgSend(v6, "count") > 1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setBarButtonItemGroup:(id)a3
{
  UIBarButtonItemGroup *v5;
  UIBarButtonItemGroup *v6;

  v5 = (UIBarButtonItemGroup *)a3;
  if (self->_barButtonItemGroup != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_barButtonItemGroup, a3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIBarButtonItemGroup _setOwner:](v6, "_setOwner:", self);
    -[TUIAssistantButtonBarGroupView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (BOOL)isCollapsed
{
  void *v3;
  char v4;

  if (self->_collapsed)
    return 1;
  -[TUIAssistantButtonBarGroupView barButtonItemGroup](self, "barButtonItemGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_shouldAlwaysCollapse");

  return v4;
}

- (void)setCollapsed:(BOOL)a3
{
  if (self->_collapsed != a3)
  {
    self->_collapsed = a3;
    -[TUIAssistantButtonBarGroupView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setItemSpacing:(double)a3
{
  if (self->_itemSpacing != a3)
  {
    self->_itemSpacing = a3;
    -[TUIAssistantButtonBarGroupView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_visibleItemsAllowingCollapse:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  char v7;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[2];

  v3 = a3;
  v23[1] = *MEMORY[0x1E0C80C00];
  if (-[TUIAssistantButtonBarGroupView isCollapsed](self, "isCollapsed")
    && -[TUIAssistantButtonBarGroupView _canBeCollapsed](self, "_canBeCollapsed")
    && v3)
  {
    -[TUIAssistantButtonBarGroupView barButtonItemGroup](self, "barButtonItemGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "representativeItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_hidden");

    if ((v7 & 1) != 0)
      return MEMORY[0x1E0C9AA60];
    -[TUIAssistantButtonBarGroupView barButtonItemGroup](self, "barButtonItemGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "representativeItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[TUIAssistantButtonBarGroupView barButtonItemGroup](self, "barButtonItemGroup", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "barButtonItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((objc_msgSend(v16, "_hidden") & 1) == 0)
            objc_msgSend(v9, "addObject:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }
  }

  return v9;
}

- (id)_visibleItems
{
  return -[TUIAssistantButtonBarGroupView _visibleItemsAllowingCollapse:](self, "_visibleItemsAllowingCollapse:", 1);
}

- (BOOL)containsFlexibleItems
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  id WeakRetained;
  double v10;
  double v11;
  BOOL v12;
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
  -[TUIAssistantButtonBarGroupView _visibleItems](self, "_visibleItems", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        WeakRetained = objc_loadWeakRetained((id *)&self->_buttonProvider);
        objc_msgSend(WeakRetained, "preferredSizeForButtonBarItem:", v8);
        v11 = v10;

        if (v11 <= 0.0)
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (CGSize)_preferredSizeForItems:(id)a3 fittingWidth:(double)a4
{
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t i;
  uint64_t v20;
  id WeakRetained;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  CGSize result;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  v8 = *MEMORY[0x1E0DC55F0];
  v9 = *MEMORY[0x1E0DC55F0];
  if (v7)
  {
    v10 = v7;
    -[TUIAssistantButtonBarGroupView itemSpacing](self, "itemSpacing");
    v12 = v11;
    v13 = v10 - 1;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v14 = v6;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v30;
      v18 = 0.0;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v30 != v17)
            objc_enumerationMutation(v14);
          v20 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          WeakRetained = objc_loadWeakRetained((id *)&self->_buttonProvider);
          objc_msgSend(WeakRetained, "preferredSizeForButtonBarItem:", v20, (_QWORD)v29);
          v23 = v22;

          if (v23 <= 0.0)
            v24 = 15.0;
          else
            v24 = v23;
          v18 = v18 + v24;
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v16);
    }
    else
    {
      v18 = 0.0;
    }

    v25 = (double)v13;
    v9 = v18 + v12 * (double)v13;
    if (v9 > a4)
    {
      v26 = fmax((a4 - v18) / v25, 0.0);
      -[TUIAssistantButtonBarGroupView setItemSpacing:](self, "setItemSpacing:", v26);
      v9 = v18 + v26 * v25;
    }
  }

  v27 = v9;
  v28 = v8;
  result.height = v28;
  result.width = v27;
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[TUIAssistantButtonBarGroupView barButtonItemGroup](self, "barButtonItemGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_shouldAlwaysCollapse");

  -[TUIAssistantButtonBarGroupView _visibleItemsAllowingCollapse:](self, "_visibleItemsAllowingCollapse:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIAssistantButtonBarGroupView _preferredSizeForItems:fittingWidth:](self, "_preferredSizeForItems:fittingWidth:", v5, 3.40282347e38);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.width;
  -[TUIAssistantButtonBarGroupView _visibleItems](self, "_visibleItems", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIAssistantButtonBarGroupView _preferredSizeForItems:fittingWidth:](self, "_preferredSizeForItems:fittingWidth:", v5, width);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_ensureVisibleButtonsForVisibleItems
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  TUIButtonBarItemView *v10;
  unint64_t v11;
  id v12;

  -[TUIAssistantButtonBarGroupView _visibleItems](self, "_visibleItems");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    v3 = -[NSMutableArray count](self->_visibleButtons, "count");
    if (v3 <= objc_msgSend(v12, "count"))
      break;
    -[NSMutableArray lastObject](self->_visibleButtons, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");
    -[NSMutableArray removeObject:](self->_visibleButtons, "removeObject:", v4);

  }
  v5 = -[NSMutableArray count](self->_visibleButtons, "count");
  if (v5 < objc_msgSend(v12, "count"))
  {
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      v10 = -[TUIButtonBarItemView initWithFrame:]([TUIButtonBarItemView alloc], "initWithFrame:", v6, v7, v8, v9);
      -[NSMutableArray addObject:](self->_visibleButtons, "addObject:", v10);
      -[TUIAssistantButtonBarGroupView addSubview:](self, "addSubview:", v10);

      v11 = -[NSMutableArray count](self->_visibleButtons, "count");
    }
    while (v11 < objc_msgSend(v12, "count"));
  }

}

- (NSArray)visibleButtons
{
  -[TUIAssistantButtonBarGroupView _ensureVisibleButtonsForVisibleItems](self, "_ensureVisibleButtonsForVisibleItems");
  return (NSArray *)self->_visibleButtons;
}

- (id)_buttonBarItemViewForBarButtonItem:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
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
  v5 = self->_visibleButtons;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "associatedItem", (_QWORD)v12);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  _QWORD v30[12];
  _QWORD v31[4];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)TUIAssistantButtonBarGroupView;
  -[TUIAssistantButtonBarGroupView layoutSubviews](&v36, sel_layoutSubviews);
  -[TUIAssistantButtonBarGroupView _ensureVisibleButtonsForVisibleItems](self, "_ensureVisibleButtonsForVisibleItems");
  -[TUIAssistantButtonBarGroupView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TUIAssistantButtonBarGroupView _visibleItems](self, "_visibleItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIAssistantButtonBarGroupView sizeThatFits:](self, "sizeThatFits:", v8, v10);
  if (v12 <= v8)
    v13 = 1.0;
  else
    v13 = v8 / v12;
  v14 = 0.0;
  if (-[TUIAssistantButtonBarGroupView containsFlexibleItems](self, "containsFlexibleItems"))
  {
    -[TUIAssistantButtonBarGroupView itemSpacing](self, "itemSpacing");
    v16 = v8 - v15 * (double)(unint64_t)(objc_msgSend(v11, "count") - 1);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[TUIAssistantButtonBarGroupView _visibleItems](self, "_visibleItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v33 != v21)
            objc_enumerationMutation(v17);
          v23 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          -[TUIAssistantButtonBarGroupView buttonProvider](self, "buttonProvider");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "preferredSizeForButtonBarItem:", v23);
          v26 = v25;

          v27 = v16 - v26 * v13;
          if (v26 > 0.0)
            v16 = v16 - v26 * v13;
          else
            ++v20;
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v37, 16, v27);
      }
      while (v19);
      v28 = (double)v20;
    }
    else
    {
      v28 = 0.0;
    }

    v14 = fmax(v16 / v28, 15.0);
  }
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  v29 = -[TUIAssistantButtonBarGroupView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __48__TUIAssistantButtonBarGroupView_layoutSubviews__block_invoke;
  v30[3] = &unk_1E24FB3E8;
  *(double *)&v30[6] = v13;
  *(double *)&v30[7] = v14;
  v30[4] = self;
  v30[5] = v31;
  v30[8] = v4;
  v30[9] = v6;
  *(double *)&v30[10] = v8;
  *(double *)&v30[11] = v10;
  objc_msgSend(v11, "enumerateObjectsWithOptions:usingBlock:", 2 * (v29 == 1), v30);
  _Block_object_dispose(v31, 8);

}

- (void)_groupDidUpdateItems:(id)a3 removedItems:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[TUIAssistantButtonBarGroupView buttonProvider](self, "buttonProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredSizeDidChangeForGroup:", v5);

}

- (void)_groupDidUpdateRepresentative:(id)a3 fromRepresentative:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[TUIAssistantButtonBarGroupView buttonProvider](self, "buttonProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredSizeDidChangeForGroup:", v5);

}

- (void)_groupDidUpdateVisibility:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUIAssistantButtonBarGroupView buttonProvider](self, "buttonProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredSizeDidChangeForGroup:", v4);

}

- (void)_updateViewForBarButtonItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[TUIAssistantButtonBarGroupView _buttonBarItemViewForBarButtonItem:](self, "_buttonBarItemViewForBarButtonItem:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TUIAssistantButtonBarGroupView buttonProvider](self, "buttonProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIAssistantButtonBarGroupView barButtonItemGroup](self, "barButtonItemGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configureButtonBarItemView:forItem:group:", v4, v7, v6);

  }
}

- (void)_itemCustomViewDidChange:(id)a3 fromView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  -[TUIAssistantButtonBarGroupView _buttonBarItemViewForBarButtonItem:](self, "_buttonBarItemViewForBarButtonItem:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCustomView:", v6);

  -[TUIAssistantButtonBarGroupView buttonProvider](self, "buttonProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredSizeDidChangeForButtonBarItem:", v5);

}

- (void)_itemStandardViewNeedsUpdate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUIAssistantButtonBarGroupView _updateViewForBarButtonItem:](self, "_updateViewForBarButtonItem:", v4);
  -[TUIAssistantButtonBarGroupView setNeedsLayout](self, "setNeedsLayout");
  -[TUIAssistantButtonBarGroupView buttonProvider](self, "buttonProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredSizeDidChangeForButtonBarItem:", v4);

}

- (void)_itemDidChangeWidth:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUIAssistantButtonBarGroupView setNeedsLayout](self, "setNeedsLayout");
  -[TUIAssistantButtonBarGroupView buttonProvider](self, "buttonProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredSizeDidChangeForButtonBarItem:", v4);

}

- (void)_itemDidChangeHiddenState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUIAssistantButtonBarGroupView setNeedsLayout](self, "setNeedsLayout");
  -[TUIAssistantButtonBarGroupView buttonProvider](self, "buttonProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredSizeDidChangeForButtonBarItem:", v4);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  objc_super v18;
  CGPoint v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[TUIAssistantButtonBarGroupView visibleButtons](self, "visibleButtons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 != 1)
    goto LABEL_4;
  -[TUIAssistantButtonBarGroupView visibleButtons](self, "visibleButtons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "barButtonView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[TUIAssistantButtonBarGroupView visibleButtons](self, "visibleButtons");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "barButtonView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_buttonBarHitRect");
    v19.x = x;
    v19.y = y;
    v16 = CGRectContainsPoint(v20, v19);

  }
  else
  {
LABEL_4:
    v18.receiver = self;
    v18.super_class = (Class)TUIAssistantButtonBarGroupView;
    v16 = -[TUIAssistantButtonBarGroupView pointInside:withEvent:](&v18, sel_pointInside_withEvent_, v7, x, y);
  }

  return v16;
}

- (UIBarButtonItemGroup)barButtonItemGroup
{
  return self->_barButtonItemGroup;
}

- (double)itemSpacing
{
  return self->_itemSpacing;
}

- (TUIButtonBarViewProvider)buttonProvider
{
  return (TUIButtonBarViewProvider *)objc_loadWeakRetained((id *)&self->_buttonProvider);
}

- (void)setButtonProvider:(id)a3
{
  objc_storeWeak((id *)&self->_buttonProvider, a3);
}

- (_UIButtonBarButtonVisualProvider)visualProvider
{
  return self->_visualProvider;
}

- (void)setVisualProvider:(id)a3
{
  objc_storeStrong((id *)&self->_visualProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualProvider, 0);
  objc_destroyWeak((id *)&self->_buttonProvider);
  objc_storeStrong((id *)&self->_barButtonItemGroup, 0);
  objc_storeStrong((id *)&self->_visibleButtons, 0);
}

void __48__TUIAssistantButtonBarGroupView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double Width;
  double v14;
  id v15;
  CGRect v16;

  v15 = a2;
  objc_msgSend(*(id *)(a1 + 32), "visibleButtons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "buttonProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "barButtonItemGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configureButtonBarItemView:forItem:group:", v6, v15, v8);

  objc_msgSend(v15, "customView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v15, "_setViewOwner:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(*(id *)(a1 + 32), "buttonProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredSizeForButtonBarItem:", v15);

  v11 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  UIRoundToViewScale();
  objc_msgSend(v6, "setFrame:", v11, 0.0, v12, *(double *)(a1 + 88));
  objc_msgSend(v6, "frame");
  Width = CGRectGetWidth(v16);
  objc_msgSend(*(id *)(a1 + 32), "itemSpacing");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = Width
                                                              + v14
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);

}

@end
