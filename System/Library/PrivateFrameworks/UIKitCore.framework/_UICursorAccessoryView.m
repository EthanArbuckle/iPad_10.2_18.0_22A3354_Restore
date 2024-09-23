@implementation _UICursorAccessoryView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  double v14;
  double v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t j;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v41 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allValues](self->_itemViewsByIdentifier, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    -[UIView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    if (v8 == 6)
    {
      v37 = 0uLL;
      v38 = 0uLL;
      v35 = 0uLL;
      v36 = 0uLL;
      v9 = v6;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v10)
      {
        v11 = 0;
        v12 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v36 != v12)
              objc_enumerationMutation(v9);
            v11 += objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "collapsed");
          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v10);
        v10 = v11;
      }

      v14 = (double)(unint64_t)(objc_msgSend(v9, "count") - v10) * 72.0 + 8.0;
      v15 = 56.0;
    }
    else
    {
      v33 = 0uLL;
      v34 = 0uLL;
      v31 = 0uLL;
      v32 = 0uLL;
      v16 = v6;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v32;
        v20 = 0.0;
        v14 = 0.0;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v32 != v19)
              objc_enumerationMutation(v16);
            v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
            if ((objc_msgSend(v22, "collapsed", (_QWORD)v31) & 1) == 0)
            {
              objc_msgSend(v22, "sizeThatFits:", width, height);
              v24 = v23;
              v26 = v14 + v25;
              objc_msgSend(v22, "horizontalPadding");
              v14 = v26 + v27 + v27;
              if (v24 >= v20)
                v20 = v24;
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v18);
      }
      else
      {
        v20 = 0.0;
        v14 = 0.0;
      }

      objc_msgSend((id)objc_opt_class(), "defaultItemSize");
      if (v28 >= v20)
        v15 = v28;
      else
        v15 = v20;
    }
  }
  else
  {
    v14 = *MEMORY[0x1E0C9D820];
    v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v29 = v14;
  v30 = v15;
  result.height = v30;
  result.width = v29;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)_UICursorAccessoryView;
  -[UIVisualEffectView layoutSubviews](&v3, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[UIVisualEffectView _setCornerRadius:](self, "_setCornerRadius:", CGRectGetHeight(v4) * 0.5);
  -[_UICursorAccessoryView _layoutDisplayedAccessoryItemViews](self, "_layoutDisplayedAccessoryItemViews");
  -[_UICursorAccessoryView _layoutHighlightView](self, "_layoutHighlightView");
}

- (void)_layoutHighlightView
{
  double x;
  double y;
  double width;
  double height;
  CGFloat v7;
  void *v8;
  CGRect v9;
  CGRect v10;

  -[_UICursorAccessoryView _unionRectActiveItems](self, "_unionRectActiveItems");
  x = v9.origin.x;
  y = v9.origin.y;
  width = v9.size.width;
  height = v9.size.height;
  if (CGRectIsNull(v9) || !-[NSArray count](self->_accessoryIdentifiers, "count"))
  {
    -[UIView setHidden:](self->_activeHighlightBackgroundView, "setHidden:", 1);
  }
  else
  {
    v10.origin.x = x;
    v10.origin.y = y;
    v10.size.width = width;
    v10.size.height = height;
    v7 = CGRectGetHeight(v10) * 0.5;
    -[UIView setHidden:](self->_activeHighlightBackgroundView, "setHidden:", 0);
    -[UIView layer](self->_activeHighlightBackgroundView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", v7);

    -[UIView setFrame:](self->_activeHighlightBackgroundView, "setFrame:", x, y, width, height);
  }
}

- (double)activeAccessoryXOffset
{
  void *v3;
  int v4;
  double x;
  double width;
  BOOL IsNull;
  double result;
  double v9;
  double v10;
  CGRect v11;

  -[UIView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "needsLayout");

  if (v4)
    -[_UICursorAccessoryView _layoutDisplayedAccessoryItemViews](self, "_layoutDisplayedAccessoryItemViews");
  -[_UICursorAccessoryView _unionRectActiveItems](self, "_unionRectActiveItems");
  x = v11.origin.x;
  width = v11.size.width;
  IsNull = CGRectIsNull(v11);
  result = 0.0;
  if (!IsNull)
  {
    -[UIView bounds](self, "bounds", 0.0);
    return v10 + v9 * 0.5 - (x + width * 0.5);
  }
  return result;
}

- (CGRect)_unionRectActiveItems
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSMutableOrderedSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double height;
  double width;
  double y;
  double x;
  uint64_t i;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  _BOOL4 IsNull;
  double v26;
  double v27;
  double v28;
  double v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect result;
  CGRect v42;
  CGRect v43;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = self->_displayedIdentifiers;
  v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    height = v5;
    width = v6;
    y = v3;
    x = v4;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v7);
        -[NSMutableDictionary objectForKey:](self->_itemViewsByIdentifier, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i), (_QWORD)v30);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "isActive"))
        {
          if ((objc_msgSend(v16, "collapsed") & 1) == 0)
          {
            objc_msgSend(v16, "frame");
            v42.origin.x = v17;
            v42.origin.y = v18;
            v42.size.width = v19;
            v42.size.height = v20;
            v36.origin.x = x;
            v36.origin.y = y;
            v36.size.width = width;
            v36.size.height = height;
            v37 = CGRectUnion(v36, v42);
            x = v37.origin.x;
            y = v37.origin.y;
            width = v37.size.width;
            height = v37.size.height;
          }
          objc_msgSend(v16, "frame");
          v43.origin.x = v21;
          v43.origin.y = v22;
          v43.size.width = v23;
          v43.size.height = v24;
          v38.origin.x = v4;
          v38.origin.y = v3;
          v38.size.width = v6;
          v38.size.height = v5;
          v39 = CGRectUnion(v38, v43);
          v4 = v39.origin.x;
          v3 = v39.origin.y;
          v6 = v39.size.width;
          v5 = v39.size.height;
        }

      }
      v9 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v9);
  }
  else
  {
    height = v5;
    width = v6;
    y = v3;
    x = v4;
  }

  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  IsNull = CGRectIsNull(v40);
  if (IsNull)
    v26 = v4;
  else
    v26 = x;
  if (IsNull)
    v27 = v3;
  else
    v27 = y;
  if (IsNull)
    v28 = v6;
  else
    v28 = width;
  if (IsNull)
    v29 = v5;
  else
    v29 = height;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)_layoutDisplayedAccessoryItemViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  NSMutableOrderedSet *displayedIdentifiers;
  _QWORD v16[10];
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 6)
    v19[3] = 0x4010000000000000;
  -[UIView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIView traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "layoutDirection") == 1;

  displayedIdentifiers = self->_displayedIdentifiers;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __60___UICursorAccessoryView__layoutDisplayedAccessoryItemViews__block_invoke;
  v16[3] = &unk_1E16E0A30;
  v17 = v14;
  v16[6] = v6;
  v16[7] = v8;
  v16[8] = v10;
  v16[9] = v12;
  v16[4] = self;
  v16[5] = &v18;
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](displayedIdentifiers, "enumerateObjectsUsingBlock:", v16);
  _Block_object_dispose(&v18, 8);
}

- (void)setTintColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UICursorAccessoryView;
  v4 = a3;
  -[UIView setTintColor:](&v5, sel_setTintColor_, v4);
  -[UIView setBackgroundColor:](self->_activeHighlightBackgroundView, "setBackgroundColor:", v4, v5.receiver, v5.super_class);

}

- (_UICursorAccessoryView)initWithDataSource:(id)a3
{
  id v4;
  void *v5;
  _UICursorAccessoryView *v6;
  uint64_t v7;
  NSArray *accessoryIdentifiers;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  UIView *v21;
  uint64_t v22;
  UIView *activeHighlightBackgroundView;
  void *v24;
  NSMutableOrderedSet *v25;
  NSMutableOrderedSet *displayedIdentifiers;
  NSMutableDictionary *v27;
  NSMutableDictionary *itemViewsByIdentifier;
  NSMutableArray *v29;
  NSMutableArray *dividerViews;
  UITapGestureRecognizer *v31;
  UITapGestureRecognizer *accessoryItemTapGestureRecognizer;
  objc_super v34;

  v4 = a3;
  +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34.receiver = self;
  v34.super_class = (Class)_UICursorAccessoryView;
  v6 = -[UIVisualEffectView initWithEffect:](&v34, sel_initWithEffect_, v5);

  if (v6)
  {
    objc_storeWeak((id *)&v6->_dataSource, v4);
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    accessoryIdentifiers = v6->_accessoryIdentifiers;
    v6->_accessoryIdentifiers = (NSArray *)v7;

    -[UIView layer](v6, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMasksToBounds:", 0);

    +[UIColor blackColor](UIColor, "blackColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = objc_msgSend(v10, "CGColor");
    -[UIView layer](v6, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShadowColor:", v11);

    -[UIView layer](v6, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShadowOffset:", 0.0, 3.0);

    -[UIView layer](v6, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = 1043878380;
    objc_msgSend(v14, "setShadowOpacity:", v15);

    -[UIView layer](v6, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setShadowRadius:", 9.0);

    -[UIView traitCollection](v6, "traitCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "userInterfaceIdiom");

    if (v18 == 6)
    {
      -[UIVisualEffectView contentView](v6, "contentView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sws_enablePlatter");

      -[UIView layer](v6, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setZPosition:", 4.0);
    }
    else
    {
      v21 = [UIView alloc];
      v22 = -[UIView initWithFrame:](v21, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      activeHighlightBackgroundView = v6->_activeHighlightBackgroundView;
      v6->_activeHighlightBackgroundView = (UIView *)v22;

      -[UIView tintColor](v6, "tintColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v6->_activeHighlightBackgroundView, "setBackgroundColor:", v24);

      -[UIView setUserInteractionEnabled:](v6->_activeHighlightBackgroundView, "setUserInteractionEnabled:", 0);
      -[UIVisualEffectView contentView](v6, "contentView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addSubview:", v6->_activeHighlightBackgroundView);
    }

    v25 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    displayedIdentifiers = v6->_displayedIdentifiers;
    v6->_displayedIdentifiers = v25;

    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    itemViewsByIdentifier = v6->_itemViewsByIdentifier;
    v6->_itemViewsByIdentifier = v27;

    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    dividerViews = v6->_dividerViews;
    v6->_dividerViews = v29;

    v31 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", v6, sel__didRecognizeAccessoryTapGestureRecognizer_);
    accessoryItemTapGestureRecognizer = v6->_accessoryItemTapGestureRecognizer;
    v6->_accessoryItemTapGestureRecognizer = v31;

    -[UIView addGestureRecognizer:](v6, "addGestureRecognizer:", v6->_accessoryItemTapGestureRecognizer);
  }

  return v6;
}

- (void)_ensureNumberOfReusableViews:(unint64_t)a3 inArray:(id)a4 ofClass:(Class)a5
{
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  if (objc_msgSend(v15, "count") < a3)
  {
    v8 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      v12 = (void *)objc_msgSend([a5 alloc], "initWithFrame:", v8, v9, v10, v11);
      objc_msgSend(v15, "addObject:", v12);
      -[UIVisualEffectView contentView](self, "contentView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSubview:", v12);

    }
    while (objc_msgSend(v15, "count") < a3);
  }
  while (objc_msgSend(v15, "count") > a3)
  {
    objc_msgSend(v15, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeFromSuperview");
    objc_msgSend(v15, "removeObject:", v14);

  }
}

- (void)_cleanupRemovedItemViews
{
  void *v3;
  NSMutableOrderedSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, a2, 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_displayedIdentifiers;
  v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (!-[NSArray containsObject:](self->_accessoryIdentifiers, "containsObject:", v9))
        {
          -[NSMutableDictionary objectForKey:](self->_itemViewsByIdentifier, "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "removeFromSuperview");

          -[NSMutableDictionary removeObjectForKey:](self->_itemViewsByIdentifier, "removeObjectForKey:", v9);
          objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[NSMutableOrderedSet removeObjectsInArray:](self->_displayedIdentifiers, "removeObjectsInArray:", v3);
}

- (void)_scheduleRemovedItemViewCleanup
{
  -[_UICursorAccessoryView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__cleanupRemovedItemViews, 0, 0.0);
}

- (void)_reloadAccessoryItemViews
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __51___UICursorAccessoryView__reloadAccessoryItemViews__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

- (void)setAccessoryIdentifiers:(id)a3
{
  -[_UICursorAccessoryView setAccessoryIdentifiers:animated:](self, "setAccessoryIdentifiers:animated:", a3, 0);
}

- (void)setAccessoryIdentifiers:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t j;
  void *v20;
  void *v21;
  _UICursorAccessoryItemView *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSMutableArray *dividerViews;
  NSMutableOrderedSet *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t m;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t n;
  void *v50;
  char v51;
  void *v52;
  id v53;
  void *v54;
  id obj;
  uint64_t v56;
  _BOOL4 v57;
  void *v58;
  void *v59;
  uint64_t v60;
  _UICursorAccessoryView *v61;
  _QWORD v62[5];
  _QWORD v63[5];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[5];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v57 = a4;
  v90 = *MEMORY[0x1E0C80C00];
  v53 = a3;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet array](self->_displayedIdentifiers, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v5;
  objc_msgSend(v5, "differenceFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v59 = v8;
  objc_msgSend(v8, "removals");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v82 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i), "object", v53);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
    }
    while (v11);
  }

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  objc_msgSend(v59, "insertions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
  v61 = self;
  v58 = v6;
  if (v60)
  {
    v56 = *(_QWORD *)v78;
    v15 = *MEMORY[0x1E0C9D648];
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      for (j = 0; j != v60; ++j)
      {
        if (*(_QWORD *)v78 != v56)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
        objc_msgSend(v20, "object", v53);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "containsObject:", v21))
          objc_msgSend(v6, "removeObject:", v21);
        -[NSMutableDictionary objectForKey:](self->_itemViewsByIdentifier, "objectForKey:", v21);
        v22 = (_UICursorAccessoryItemView *)objc_claimAutoreleasedReturnValue();
        if (!v22)
        {
          v22 = -[_UICursorAccessoryItemView initWithFrame:]([_UICursorAccessoryItemView alloc], "initWithFrame:", v15, v16, v17, v18);
          -[UIVisualEffectView contentView](self, "contentView");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addSubview:", v22);

          -[NSMutableDictionary setObject:forKey:](self->_itemViewsByIdentifier, "setObject:forKey:", v22, v21);
        }
        v24 = objc_msgSend(v20, "index");
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v76 = 0u;
        objc_msgSend(v59, "removals");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v74;
          do
          {
            for (k = 0; k != v27; ++k)
            {
              if (*(_QWORD *)v74 != v28)
                objc_enumerationMutation(v25);
              v30 = objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * k), "index");
              if (v30 < objc_msgSend(v20, "index"))
                ++v24;
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
          }
          while (v27);
        }

        self = v61;
        v31 = -[NSMutableOrderedSet count](v61->_displayedIdentifiers, "count");
        if (v31 >= v24)
          v32 = v24;
        else
          v32 = v31;
        -[NSMutableOrderedSet insertObject:atIndex:](v61->_displayedIdentifiers, "insertObject:atIndex:", v21, v32);
        if (v57)
          -[_UICursorAccessoryItemView setCollapsed:](v22, "setCollapsed:", 1);

        v6 = v58;
      }
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
    }
    while (v60);
  }

  objc_storeStrong((id *)&self->_accessoryIdentifiers, v53);
  v33 = -[NSMutableOrderedSet count](self->_displayedIdentifiers, "count");
  if (v33)
    v34 = v33 - 1;
  else
    v34 = 0;
  -[_UICursorAccessoryView _ensureNumberOfReusableViews:inArray:ofClass:](self, "_ensureNumberOfReusableViews:inArray:ofClass:", v34, self->_dividerViews, objc_opt_class());
  dividerViews = self->_dividerViews;
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __59___UICursorAccessoryView_setAccessoryIdentifiers_animated___block_invoke;
  v72[3] = &unk_1E16B24A0;
  v72[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](dividerViews, "enumerateObjectsUsingBlock:", v72);
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[UIView setNeedsLayout](self, "setNeedsLayout");
  if (v57)
  {
    -[_UICursorAccessoryView layoutSubviews](self, "layoutSubviews");
    -[_UICursorAccessoryView _reloadAccessoryItemViews](self, "_reloadAccessoryItemViews");
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v36 = self->_displayedIdentifiers;
    v37 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
    v38 = v54;
    if (v37)
    {
      v39 = v37;
      v40 = 0;
      v41 = *(_QWORD *)v69;
      do
      {
        for (m = 0; m != v39; ++m)
        {
          if (*(_QWORD *)v69 != v41)
            objc_enumerationMutation(v36);
          v43 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * m);
          -[NSMutableDictionary objectForKey:](v61->_itemViewsByIdentifier, "objectForKey:", v43, v53);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setCollapsed:", 0);

          if ((objc_msgSend(v43, "isEqualToString:", CFSTR("dic")) & 1) != 0
            || objc_msgSend(v43, "isEqualToString:", CFSTR("mod:2")))
          {
            v40 = 1;
          }
        }
        v39 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
      }
      while (v39);
    }
    else
    {
      v40 = 0;
    }

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v45 = v58;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v65;
      do
      {
        for (n = 0; n != v47; ++n)
        {
          if (*(_QWORD *)v65 != v48)
            objc_enumerationMutation(v45);
          -[NSMutableDictionary objectForKey:](v61->_itemViewsByIdentifier, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * n), v53);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setCollapsed:", 1);

        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
      }
      while (v47);
    }

    if (objc_msgSend(v54, "count") == 1)
      v51 = 0;
    else
      v51 = (objc_msgSend(v54, "count") != 2) | v40 ^ 1;
    v6 = v58;
    v61->_visionShouldColorSelection = v51 & 1;
    +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 0.9, 0.2, v53);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v62[4] = v61;
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __59___UICursorAccessoryView_setAccessoryIdentifiers_animated___block_invoke_2;
    v63[3] = &unk_1E16B1B28;
    v63[4] = v61;
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __59___UICursorAccessoryView_setAccessoryIdentifiers_animated___block_invoke_3;
    v62[3] = &unk_1E16B2588;
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v52, 0, v63, v62);

  }
  else
  {
    -[_UICursorAccessoryView _reloadAccessoryItemViews](self, "_reloadAccessoryItemViews");
    -[_UICursorAccessoryView _cleanupRemovedItemViews](self, "_cleanupRemovedItemViews");
    v38 = v54;
  }

}

- (id)_displayedItemViewAtIndex:(int64_t)a3
{
  void *v5;
  NSMutableDictionary *itemViewsByIdentifier;
  void *v7;

  if (a3 < 0 || -[NSMutableOrderedSet count](self->_displayedIdentifiers, "count") - 1 < (unint64_t)a3)
  {
    v5 = 0;
  }
  else
  {
    itemViewsByIdentifier = self->_itemViewsByIdentifier;
    -[NSMutableOrderedSet objectAtIndex:](self->_displayedIdentifiers, "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](itemViewsByIdentifier, "objectForKey:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)_applyCornerMaskToSelf
{
  return 1;
}

- (void)_didRecognizeAccessoryTapGestureRecognizer:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  NSMutableOrderedSet *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSMutableDictionary *itemViewsByIdentifier;
  id v18;
  _QWORD v19[4];
  id v20;
  _UICursorAccessoryView *v21;
  id v22[3];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id location;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    objc_initWeak(&location, self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(v4, "locationInView:", self);
    v7 = v6;
    v9 = v8;
    -[UIView traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceIdiom") == 6;

    if (v11)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v12 = self->_displayedIdentifiers;
      v13 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v24;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v12);
            -[NSMutableDictionary objectForKey:](self->_itemViewsByIdentifier, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v15));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setSelected:", 0);

            ++v15;
          }
          while (v13 != v15);
          v13 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v13);
      }

    }
    itemViewsByIdentifier = self->_itemViewsByIdentifier;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __69___UICursorAccessoryView__didRecognizeAccessoryTapGestureRecognizer___block_invoke;
    v19[3] = &unk_1E16E0A58;
    objc_copyWeak(v22, &location);
    v22[1] = v7;
    v22[2] = v9;
    v18 = WeakRetained;
    v20 = v18;
    v21 = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](itemViewsByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v19);

    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }

}

+ (double)baseFontSize
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  if (qword_1ECD7B298 != -1)
    dispatch_once(&qword_1ECD7B298, &__block_literal_global_485);
  objc_msgSend((id)UIApp, "preferredContentSizeCategory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_7_9, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4 + 17.0;

  return v5;
}

+ (double)glyphWidth
{
  double v2;

  objc_msgSend(a1, "defaultItemSize");
  return v2 + -20.0;
}

+ (double)glyphHeight
{
  double v2;

  objc_msgSend(a1, "defaultItemSize");
  return v2 + -8.0;
}

+ (CGSize)defaultItemSize
{
  void *v2;
  void *v3;
  float v4;
  double v5;
  void *v6;
  float v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  if (qword_1ECD7B2B0 != -1)
    dispatch_once(&qword_1ECD7B2B0, &__block_literal_global_30_3);
  objc_msgSend((id)UIApp, "preferredContentSizeCategory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECD7B2A0, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4 + 37.0;

  objc_msgSend((id)qword_1ECD7B2A8, "objectForKeyedSubscript:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7 + 27.0;

  v9 = v5;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (CGSize)largeItemSize
{
  void *v2;
  void *v3;
  float v4;
  double v5;
  void *v6;
  float v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  if (qword_1ECD7B2C8 != -1)
    dispatch_once(&qword_1ECD7B2C8, &__block_literal_global_37_3);
  objc_msgSend((id)UIApp, "preferredContentSizeCategory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECD7B2B8, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = (float)(v4 + 49.0);

  objc_msgSend((id)qword_1ECD7B2C0, "objectForKeyedSubscript:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = (float)(v7 + 33.0);

  v9 = v5;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (double)grayscaleLuminance:(id)a3
{
  double v4;

  v4 = 0.0;
  objc_msgSend(a3, "getWhite:alpha:", &v4, 0);
  return v4;
}

- (_UICursorAccessoryItemDataSource)dataSource
{
  return (_UICursorAccessoryItemDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSArray)accessoryIdentifiers
{
  return self->_accessoryIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryIdentifiers, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_accessoryItemTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dividerViews, 0);
  objc_storeStrong((id *)&self->_itemViewsByIdentifier, 0);
  objc_storeStrong((id *)&self->_displayedIdentifiers, 0);
  objc_storeStrong((id *)&self->_activeHighlightBackgroundView, 0);
}

@end
