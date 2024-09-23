@implementation _UIFloatingTabBarPinnedItemsView

- (_UIFloatingTabBarPinnedItemsView)initWithFrame:(CGRect)a3
{
  _UIFloatingTabBarPinnedItemsView *v3;
  _UIFloatingTabBarPinnedItemsView *v4;
  uint64_t v5;
  NSArray *items;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIFloatingTabBarPinnedItemsView;
  v3 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_selectionViewIndex = 0x7FFFFFFFFFFFFFFFLL;
    v3->_highlightedIndex = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    items = v4->_items;
    v4->_items = (NSArray *)v5;

  }
  return v4;
}

- (void)setEditing:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_editing != a3)
  {
    v3 = a3;
    self->_editing = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[_UIFloatingTabBarPinnedItemsView itemViews](self, "itemViews", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "setEditing:", v3);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)setItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  NSArray *v8;
  NSArray *v9;
  char v10;
  void *v11;
  NSArray *v12;

  v4 = a4;
  v7 = a3;
  v8 = self->_items;
  v9 = (NSArray *)v7;
  v12 = v9;
  if (v8 == v9)
  {

    v11 = v12;
  }
  else
  {
    if (v9 && v8)
    {
      v10 = -[NSArray isEqual:](v8, "isEqual:", v9);

      if ((v10 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_items, a3);
    -[NSArray differenceFromArray:withOptions:usingEquivalenceTest:](v12, "differenceFromArray:withOptions:usingEquivalenceTest:", v8, 0, &__block_literal_global_70);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBarPinnedItemsView _reloadItemViewsWithDifference:animated:](self, "_reloadItemViewsWithDifference:animated:", v11, v4);
  }

LABEL_10:
}

- (void)setSelectionViewIndex:(int64_t)a3
{
  int64_t selectionViewIndex;
  void *v6;
  id v7;

  selectionViewIndex = self->_selectionViewIndex;
  if (selectionViewIndex != a3)
  {
    if (selectionViewIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[_UIFloatingTabBarPinnedItemsView _itemViewForItemAtIndex:](self, "_itemViewForItemAtIndex:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setHasSelectionHighlight:", 0);

    }
    self->_selectionViewIndex = a3;
    if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[_UIFloatingTabBarPinnedItemsView _itemViewForItemAtIndex:](self, "_itemViewForItemAtIndex:", a3);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHasSelectionHighlight:", 1);

    }
  }
}

- (void)setHighlightedIndex:(int64_t)a3
{
  int64_t highlightedIndex;
  void *v6;
  id v7;

  highlightedIndex = self->_highlightedIndex;
  if (highlightedIndex != a3)
  {
    if (highlightedIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[_UIFloatingTabBarPinnedItemsView _itemViewForItemAtIndex:](self, "_itemViewForItemAtIndex:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setHighlighted:", 0);

    }
    self->_highlightedIndex = a3;
    if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[_UIFloatingTabBarPinnedItemsView _itemViewForItemAtIndex:](self, "_itemViewForItemAtIndex:", a3);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHighlighted:", 1);

    }
  }
}

- (CGRect)itemFrameForItemAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;
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
  CGRect result;

  -[_UIFloatingTabBarPinnedItemsView itemViewForItemAtIndex:](self, "itemViewForItemAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D628];
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (int64_t)itemIndexForItemAtLocation:(CGPoint)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  int64_t v8;
  _QWORD v10[5];
  id v11;
  _QWORD aBlock[4];
  CGPoint v13;

  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63___UIFloatingTabBarPinnedItemsView_itemIndexForItemAtLocation___block_invoke;
  aBlock[3] = &__block_descriptor_48_e16_B16__0__UIView_8l;
  v13 = a3;
  v5 = _Block_copy(aBlock);
  -[_UIFloatingTabBarPinnedItemsView items](self, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __63___UIFloatingTabBarPinnedItemsView_itemIndexForItemAtLocation___block_invoke_2;
  v10[3] = &unk_1E16B6EC8;
  v10[4] = self;
  v11 = v5;
  v7 = v5;
  v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", v10);

  return v8;
}

- (id)_itemViewForItemAtIndex:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3 < 0
    || (-[_UIFloatingTabBarPinnedItemsView items](self, "items"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6 <= a3))
  {
    v9 = 0;
  }
  else
  {
    -[_UIFloatingTabBarPinnedItemsView items](self, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIFloatingTabBarPinnedItemsView _itemViewForItem:](self, "_itemViewForItem:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[_UIFloatingTabBarPinnedItemsView itemViews](self, "itemViews", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "sizeThatFits:", width, height);
        v6 = v6 + v13;
        v5 = fmax(v5, v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v15 = v6;
  v16 = v5;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)layoutSubviews
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGSize v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CGRectEdge v19;
  uint64_t v20;
  void *v21;
  CGFloat v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CGRect slice;
  CGRect remainder;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)_UIFloatingTabBarPinnedItemsView;
  -[UIView layoutSubviews](&v29, sel_layoutSubviews);
  v3 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFloatingTabBarGetPlatformMetrics(objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundInsets");
  v7 = v6;
  v9 = v8;

  -[UIView bounds](self, "bounds");
  remainder.origin.x = v10 + 0.0;
  remainder.origin.y = v7 + v11;
  remainder.size.width = v12;
  remainder.size.height = v13 - (v7 + v9);
  v14 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  slice.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  slice.size = v14;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[_UIFloatingTabBarPinnedItemsView items](self, "items", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    if (v3)
      v19 = CGRectMaxXEdge;
    else
      v19 = CGRectMinXEdge;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        -[_UIFloatingTabBarPinnedItemsView _itemViewForItem:](self, "_itemViewForItem:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "sizeThatFits:", remainder.size.width, remainder.size.height);
        CGRectDivide(remainder, &slice, &remainder, v22, v19);
        objc_msgSend(v21, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);

        ++v20;
      }
      while (v17 != v20);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v17);
  }

}

- (void)reloadItemViewForTab:(id)a3
{
  id v3;

  -[_UIFloatingTabBarPinnedItemsView _itemViewForItemAtIndex:](self, "_itemViewForItemAtIndex:", -[_UIFloatingTabBarPinnedItemsView itemIndexForTab:](self, "itemIndexForTab:", a3));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadItemView");

}

- (void)_reloadItemViewsWithDifference:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void (**v23)(_QWORD);
  id v24;
  void (**v25)(void *, uint64_t);
  _QWORD v26[4];
  id v27;
  _QWORD aBlock[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _UIFloatingTabBarPinnedItemsView *v33;
  id v34;
  id v35;
  id v36;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "removals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "insertions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

  v13 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[_UIFloatingTabBarPinnedItemsView items](self, "items");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v14, "count"));

  v16 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __76___UIFloatingTabBarPinnedItemsView__reloadItemViewsWithDifference_animated___block_invoke;
  v31[3] = &unk_1E16B6F18;
  v17 = v6;
  v32 = v17;
  v33 = self;
  v18 = v9;
  v34 = v18;
  v19 = v12;
  v35 = v19;
  v20 = v15;
  v36 = v20;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v31);
  objc_storeStrong((id *)&self->_itemViews, v15);
  aBlock[0] = v16;
  aBlock[1] = 3221225472;
  aBlock[2] = __76___UIFloatingTabBarPinnedItemsView__reloadItemViewsWithDifference_animated___block_invoke_3;
  aBlock[3] = &unk_1E16B1B50;
  v21 = v18;
  v29 = v21;
  v22 = v19;
  v30 = v22;
  v23 = (void (**)(_QWORD))_Block_copy(aBlock);
  v26[0] = v16;
  v26[1] = 3221225472;
  v26[2] = __76___UIFloatingTabBarPinnedItemsView__reloadItemViewsWithDifference_animated___block_invoke_4;
  v26[3] = &unk_1E16B3FD8;
  v24 = v21;
  v27 = v24;
  v25 = (void (**)(void *, uint64_t))_Block_copy(v26);
  if (v4)
  {
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v23, v25, 0.2);
  }
  else
  {
    v23[2](v23);
    v25[2](v25, 1);
  }

}

- (int64_t)itemIndexForTab:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[_UIFloatingTabBarPinnedItemsView items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52___UIFloatingTabBarPinnedItemsView_itemIndexForTab___block_invoke;
  v9[3] = &unk_1E16B6F40;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);

  return v7;
}

- (id)tabForSelectionAtItemIndex:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[_UIFloatingTabBarPinnedItemsView items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
  {
    v9 = 0;
  }
  else
  {
    -[_UIFloatingTabBarPinnedItemsView items](self, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tabForSelection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)_itemViewForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[_UIFloatingTabBarPinnedItemsView itemViews](self, "itemViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentTab");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)selectionViewIndex
{
  return self->_selectionViewIndex;
}

- (int64_t)highlightedIndex
{
  return self->_highlightedIndex;
}

- (NSArray)items
{
  return self->_items;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (NSMutableDictionary)itemViews
{
  return self->_itemViews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemViews, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
