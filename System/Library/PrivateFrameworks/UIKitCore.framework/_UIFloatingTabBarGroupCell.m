@implementation _UIFloatingTabBarGroupCell

+ (CGSize)layoutSizeForGroupItems:(id)a3 traitCollection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  v5 = a4;
  v6 = a3;
  _UIFloatingTabBarGetPlatformMetrics(objc_msgSend(v5, "userInterfaceIdiom"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scaledImageSizeForTraitCollection:", v5);
  v9 = v8;
  v11 = v10;

  v12 = v9 * (double)(unint64_t)objc_msgSend(v6, "count");
  objc_msgSend(v7, "groupItemSpacing");
  v14 = v13 + v9 * -0.5;
  v15 = objc_msgSend(v6, "count");

  objc_msgSend(v7, "imageMargins");
  v19 = v12 + v14 * (double)(unint64_t)(v15 - 1) - (-v17 - v18);
  v21 = v11 - (-v16 - v20);

  v22 = v19;
  v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

+ (CGRect)layoutFrameForItemAtIndex:(int64_t)a3 traitCollection:(id)a4
{
  id v5;
  void *v6;
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
  double v20;
  CGRect result;

  v5 = a4;
  _UIFloatingTabBarGetPlatformMetrics(objc_msgSend(v5, "userInterfaceIdiom"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scaledImageSizeForTraitCollection:", v5);
  v8 = v7;
  v10 = v9;

  objc_msgSend(v6, "groupItemSpacing");
  v12 = (v11 + v8 * 0.5) * (double)a3;
  objc_msgSend(v6, "imageMargins");
  v14 = v13;
  v16 = v15 + v12;

  v17 = v16;
  v18 = v14;
  v19 = v8;
  v20 = v10;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (_UIFloatingTabBarGroupCell)initWithFrame:(CGRect)a3
{
  _UIFloatingTabBarGroupCell *v3;
  void *v4;
  id v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)_UIFloatingTabBarGroupCell;
  v3 = -[UICollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v8[0] = 0x1E1A994B0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[UIView _registerForTraitTokenChanges:withTarget:action:](v3, "_registerForTraitTokenChanges:withTarget:action:", v4, v3, sel__updateColors);

  }
  return v3;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UIFloatingTabBarGroupCell;
  v4 = a3;
  -[UICollectionReusableView preferredLayoutAttributesFittingAttributes:](&v11, sel_preferredLayoutAttributesFittingAttributes_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size", v11.receiver, v11.super_class);
  v7 = v6;
  v9 = v8;

  -[_UIFloatingTabBarGroupCell sizeThatFits:](self, "sizeThatFits:", v7, v9);
  objc_msgSend(v5, "setSize:");
  return v5;
}

- (void)setListItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v11;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "children");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFloatingTabBarGroupCell.m"), 121, CFSTR("Cannot create a group cell for an item not representing a group"));

    }
  }
  -[_UIFloatingTabBarCell listItem](self, "listItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", v6);

  v11.receiver = self;
  v11.super_class = (Class)_UIFloatingTabBarGroupCell;
  -[_UIFloatingTabBarCell setListItem:](&v11, sel_setListItem_, v6);
  if ((v10 & 1) == 0)
    -[_UIFloatingTabBarGroupCell _reloadItemsView](self, "_reloadItemsView");

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  objc_super v6;

  v3 = a3;
  v5 = -[UICollectionViewCell isHighlighted](self, "isHighlighted");
  v6.receiver = self;
  v6.super_class = (Class)_UIFloatingTabBarGroupCell;
  -[UICollectionViewCell setHighlighted:](&v6, sel_setHighlighted_, v3);
  if (v5 != v3)
    -[_UIFloatingTabBarGroupCell _updateColors](self, "_updateColors");
}

- (BOOL)hasSelectionHighlight
{
  return self->_hasSelectionHighlight;
}

- (void)setHasSelectionHighlight:(BOOL)a3
{
  if (self->_hasSelectionHighlight != a3)
  {
    self->_hasSelectionHighlight = a3;
    -[_UIFloatingTabBarGroupCell _updateColors](self, "_updateColors");
  }
}

- (BOOL)isCustomizableItem
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v4 = (void *)objc_opt_class();
  -[_UIFloatingTabBarCell listItem](self, "listItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutSizeForGroupItems:traitCollection:", v6, v7);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  CGRectEdge v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CGRect slice;
  CGRect remainder;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)_UIFloatingTabBarGroupCell;
  -[_UIFloatingTabBarCell layoutSubviews](&v37, sel_layoutSubviews);
  v3 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFloatingTabBarGetPlatformMetrics(objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageMargins");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "scaledImageSizeForTraitCollection:", v4);
  v15 = v14;
  objc_msgSend(v5, "groupItemSpacing");
  v17 = v16;
  -[UIView bounds](self, "bounds");
  remainder.origin.x = v9 + v18;
  remainder.origin.y = v7 + v19;
  remainder.size.width = v20 - (v9 + v13);
  remainder.size.height = v21 - (v7 + v11);
  v22 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  slice.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  slice.size = v22;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[_UIFloatingTabBarGroupCell itemViews](self, "itemViews", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v32;
    v27 = v17 + v15 * 0.5;
    if (v3)
      v28 = CGRectMaxXEdge;
    else
      v28 = CGRectMinXEdge;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v32 != v26)
          objc_enumerationMutation(v23);
        v30 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v29);
        CGRectDivide(remainder, &slice, &remainder, v27, v28);
        slice.size.width = v15;
        objc_msgSend(v30, "setFrame:", slice.origin.x, slice.origin.y, v15, slice.size.height);
        ++v29;
      }
      while (v25 != v29);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    }
    while (v25);
  }

}

- (void)_reloadItemsView
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *itemViews;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t);
  void *v20;
  _UIFloatingTabBarGroupCell *v21;
  NSArray *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[_UIFloatingTabBarGroupCell itemViews](self, "itemViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v7++), "removeFromSuperview");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }

  v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[_UIFloatingTabBarCell listItem](self, "listItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "children");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v10, "count"));

  -[_UIFloatingTabBarCell listItem](self, "listItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "children");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __46___UIFloatingTabBarGroupCell__reloadItemsView__block_invoke;
  v20 = &unk_1E16D8FB0;
  v21 = self;
  v14 = v11;
  v22 = v14;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v17);

  itemViews = self->_itemViews;
  self->_itemViews = v14;
  v16 = v14;

  -[_UIFloatingTabBarGroupCell _updateColors](self, "_updateColors", v17, v18, v19, v20, v21);
}

- (void)_updateColors
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFloatingTabBarGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "contentPaletteProvider");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, objc_msgSend(v5, "userInterfaceStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "resolvedColorFromProvider:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setTintColor:](self, "setTintColor:", v7);

}

- (BOOL)isEditing
{
  return self->_editing;
}

- (NSArray)itemViews
{
  return self->_itemViews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemViews, 0);
}

@end
