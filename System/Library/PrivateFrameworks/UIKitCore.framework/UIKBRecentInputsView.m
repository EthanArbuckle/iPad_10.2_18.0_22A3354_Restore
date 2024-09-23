@implementation UIKBRecentInputsView

- (UIKBRecentInputsView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  UIKBRecentInputsView *v5;
  UIKBRecentInputsView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKBRecentInputsView;
  v5 = -[UIKBKeyView initWithFrame:keyplane:key:](&v8, sel_initWithFrame_keyplane_key_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    -[UIView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 1);
    -[UIKBRecentInputsView setupCollectionView](v6, "setupCollectionView");
  }
  return v6;
}

- (void)refreshSelectedRecent
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[UIKBKeyView key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedVariantIndex");

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[UIKBRecentInputsView collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPathsForSelectedItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          -[UIKBRecentInputsView collectionView](self, "collectionView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "deselectItemAtIndexPath:animated:", v12, 1);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

  }
  else
  {
    -[UIKBRecentInputsView recentInputStrings](self, "recentInputStrings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v4 >= v15)
    {
      -[UIKBRecentInputsView recentInputStrings](self, "recentInputStrings");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v16, "count") - 1;

    }
    -[UIKBRecentInputsView collectionView](self, "collectionView");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v4, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "selectItemAtIndexPath:animated:scrollPosition:", v17, 1, 16);

  }
}

- (id)selectedRecentInputString
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  -[UIKBKeyView key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedVariantIndex");

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    -[UIKBKeyView key](self, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "selectedVariantIndex");
    -[UIKBRecentInputsView recentInputStrings](self, "recentInputStrings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") - 1;

    if (v7 == v9)
    {
      v5 = CFSTR("⊗");
    }
    else
    {
      -[UIKBRecentInputsView recentInputStrings](self, "recentInputStrings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBKeyView key](self, "key");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v11, "selectedVariantIndex"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v5;
}

- (unint64_t)focusableVariantCount
{
  void *v2;
  unint64_t v3;

  -[UIKBRecentInputsView recentInputStrings](self, "recentInputStrings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)setVerticalLayout:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  self->_verticalLayout = a3;
  -[UIKBRecentInputsView flowLayout](self, "flowLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollDirection:", !v3);

}

- (void)setRecentInputs:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__UIKBRecentInputsView_setRecentInputs___block_invoke;
  v11[3] = &unk_1E16D3AD0;
  v10 = v6;
  v12 = v10;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  if (self->_verticalLayout)
  {
    UIKeyboardLocalizedString(CFSTR("UI-ClearRecentInputs"), 0, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v8);

  }
  else
  {
    objc_msgSend(v10, "addObject:", CFSTR("⊗"));
  }
  -[UIKBRecentInputsView setRecentInputStrings:](self, "setRecentInputStrings:", v10);
  -[UIKBRecentInputsView collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadData");

}

void __40__UIKBRecentInputsView_setRecentInputs___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "documentText");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)setupCollectionView
{
  UICollectionViewFlowLayout *v3;
  UICollectionView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  UICollectionView *v14;

  v3 = objc_alloc_init(UICollectionViewFlowLayout);
  -[UIKBRecentInputsView setFlowLayout:](self, "setFlowLayout:", v3);

  -[UIKBRecentInputsView setVerticalLayout:](self, "setVerticalLayout:", 0);
  v4 = [UICollectionView alloc];
  -[UIView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIKBRecentInputsView flowLayout](self, "flowLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[UICollectionView initWithFrame:collectionViewLayout:](v4, "initWithFrame:collectionViewLayout:", v13, v6, v8, v10, v12);

  -[UICollectionView setDataSource:](v14, "setDataSource:", self);
  -[UICollectionView setDelegate:](v14, "setDelegate:", self);
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v14, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("recentInputCell"));
  -[UIScrollView setShowsHorizontalScrollIndicator:](v14, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView setShowsVerticalScrollIndicator:](v14, "setShowsVerticalScrollIndicator:", 0);
  -[UIView setClipsToBounds:](v14, "setClipsToBounds:", 0);
  -[UIView addSubview:](self, "addSubview:", v14);
  -[UIKBRecentInputsView setCollectionView:](self, "setCollectionView:", v14);

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[UIKBRecentInputsView recentInputStrings](self, "recentInputStrings", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("recentInputCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRecentInputsView recentInputStrings](self, "recentInputStrings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setInputText:", v10);
  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  v6 = a5;
  -[UIKBRecentInputsView recentInputStrings](self, "recentInputStrings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView _inheritedRenderConfig](self, "_inheritedRenderConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRecentInputCell titleAttributesForRenderConfig:](UIKBRecentInputCell, "titleAttributesForRenderConfig:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeWithAttributes:", v11);
  v13 = v12;
  v15 = v14;

  if (self->_verticalLayout)
  {
    -[UIView bounds](self, "bounds");
    v17 = v16;
  }
  else
  {
    if (v13 + 40.0 <= 1400.0)
      v17 = v13 + 40.0;
    else
      v17 = 1400.0;
    *(double *)&v15 = 60.0;
  }

  v18 = v17;
  v19 = *(double *)&v15;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)scrollViewDidChangeContentSize:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "contentInset");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  objc_msgSend(v20, "contentSize");
  v10 = v9;
  objc_msgSend(v20, "frame");
  v11 = 0.0;
  v13 = v10 < v12;
  v14 = 0.0;
  v15 = 0.0;
  v16 = 0.0;
  if (v13)
  {
    objc_msgSend(v20, "frame", 0.0, 0.0, 0.0, 0.0);
    v18 = v17;
    objc_msgSend(v20, "contentSize");
    v14 = (v18 - v19) * 0.5;
    v11 = v4;
    v15 = v6;
    v16 = v8;
  }
  objc_msgSend(v20, "setContentInset:", v11, v14, v15, v16);

}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (NSArray)recentInputStrings
{
  return self->_recentInputStrings;
}

- (void)setRecentInputStrings:(id)a3
{
  objc_storeStrong((id *)&self->_recentInputStrings, a3);
}

- (UICollectionViewFlowLayout)flowLayout
{
  return self->_flowLayout;
}

- (void)setFlowLayout:(id)a3
{
  objc_storeStrong((id *)&self->_flowLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_recentInputStrings, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
