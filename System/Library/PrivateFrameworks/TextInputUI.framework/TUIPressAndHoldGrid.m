@implementation TUIPressAndHoldGrid

- (TUIPressAndHoldGrid)initWithFrame:(CGRect)a3 accentVariants:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  TUIPressAndHoldGrid *v11;
  TUIPressAndHoldGrid *v12;
  id v13;
  id v14;
  uint64_t v15;
  UICollectionView *collectionView;
  void *v17;
  UICollectionView *v18;
  uint64_t v19;
  void *v20;
  objc_super v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v22.receiver = self;
  v22.super_class = (Class)TUIPressAndHoldGrid;
  v11 = -[TUIPressAndHoldGrid initWithFrame:](&v22, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_accentVariants, a4);
    v13 = objc_alloc_init(MEMORY[0x1E0DC3610]);
    objc_msgSend(v13, "setMinimumInteritemSpacing:", 0.0);
    objc_msgSend(v13, "setSectionInset:", 5.0, 5.0, 5.0, 5.0);
    v14 = objc_alloc(MEMORY[0x1E0DC35B8]);
    -[TUIPressAndHoldGrid bounds](v12, "bounds");
    v15 = objc_msgSend(v14, "initWithFrame:collectionViewLayout:", v13);
    collectionView = v12->_collectionView;
    v12->_collectionView = (UICollectionView *)v15;

    -[UICollectionView setDelegate:](v12->_collectionView, "setDelegate:", v12);
    -[UICollectionView setDataSource:](v12->_collectionView, "setDataSource:", v12);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v12->_collectionView, "setBackgroundColor:", v17);

    v18 = v12->_collectionView;
    v19 = objc_opt_class();
    +[TUIPressAndHoldViewCell reuseIdentifier](TUIPressAndHoldViewCell, "reuseIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v18, "registerClass:forCellWithReuseIdentifier:", v19, v20);

    -[UICollectionView setContentInset:](v12->_collectionView, "setContentInset:", 0.0, 0.0, 0.0, 0.0);
    -[TUIPressAndHoldGrid addSubview:](v12, "addSubview:", v12->_collectionView);

  }
  return v12;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TUIPressAndHoldGrid;
  -[TUIPressAndHoldGrid layoutSubviews](&v12, sel_layoutSubviews);
  -[TUIPressAndHoldGrid bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TUIPressAndHoldGrid collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (id)accentAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[TUIPressAndHoldGrid indexPathIsValid:](self, "indexPathIsValid:", v4))
  {
    -[TUIPressAndHoldGrid accentVariants](self, "accentVariants");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSIndexPath)firstIndexPath
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[TUIPressAndHoldGrid accentVariants](self, "accentVariants");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSIndexPath *)v4;
}

- (NSIndexPath)lastIndexPath
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[TUIPressAndHoldGrid accentVariants](self, "accentVariants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB36B0];
    -[TUIPressAndHoldGrid accentVariants](self, "accentVariants");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPathForRow:inSection:", objc_msgSend(v6, "count") - 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (NSIndexPath *)v7;
}

- (void)setSelectedIndexPath:(id)a3
{
  -[TUIPressAndHoldGrid setSelectedIndexPath:animated:scrollPosition:](self, "setSelectedIndexPath:animated:scrollPosition:", a3, 0, 0);
}

- (void)setSelectedIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  _BOOL8 v6;
  NSIndexPath *v9;
  int v10;
  NSIndexPath *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSIndexPath *v17;
  _QWORD v18[5];

  v6 = a4;
  v9 = (NSIndexPath *)a3;
  v17 = v9;
  if (self->_selectedIndexPath != v9 || (v10 = -[NSIndexPath isEqual:](v9, "isEqual:", v9), v11 = v17, v10))
  {
    objc_storeStrong((id *)&self->_selectedIndexPath, a3);
    if (v17 && -[TUIPressAndHoldGrid indexPathIsValid:](self, "indexPathIsValid:", v17))
    {
      -[TUIPressAndHoldGrid collectionView](self, "collectionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "selectItemAtIndexPath:animated:scrollPosition:", v17, v6, a5);

      -[TUIPressAndHoldGrid collectionView](self, "collectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "layoutAttributesForItemAtIndexPath:", v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[TUIPressAndHoldGrid collectionView](self, "collectionView", v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "indexPathsForSelectedItems");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
LABEL_9:

        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __68__TUIPressAndHoldGrid_setSelectedIndexPath_animated_scrollPosition___block_invoke;
        v18[3] = &unk_1E24FC068;
        v18[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v18);
        v11 = v17;
        goto LABEL_10;
      }
      -[TUIPressAndHoldGrid collectionView](self, "collectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "deselectItemAtIndexPath:animated:", v14, 0);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (BOOL)indexPathIsValid:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v8;
  unint64_t v9;

  v4 = a3;
  v5 = v4;
  if (!v4 || objc_msgSend(v4, "section") || objc_msgSend(v5, "row") < 0)
  {
    v6 = 0;
  }
  else
  {
    -[TUIPressAndHoldGrid accentVariants](self, "accentVariants");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    v6 = v9 > objc_msgSend(v5, "row");

  }
  return v6;
}

- (NSString)selectedAccentVariant
{
  return (NSString *)-[TUIPressAndHoldGrid accentAtIndexPath:](self, "accentAtIndexPath:", self->_selectedIndexPath);
}

- (id)indexPathInForwardDirection:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;

  v3 = a3;
  -[TUIPressAndHoldGrid selectedIndexPath](self, "selectedIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[TUIPressAndHoldGrid indexPathIsValid:](self, "indexPathIsValid:", v5))
    goto LABEL_9;
  v6 = objc_msgSend(v5, "section");
  v7 = objc_msgSend(v5, "row");
  if (v3)
    v8 = v7 + 1;
  else
    v8 = v7 - 1;
  if ((v8 & 0x8000000000000000) != 0
    || (-[TUIPressAndHoldGrid accentVariants](self, "accentVariants"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "count"),
        v9,
        v8 >= v10))
  {
    -[TUIPressAndHoldGrid setSelectedIndexPath:](self, "setSelectedIndexPath:", 0);
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v8, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v11;
}

- (BOOL)hasAccentVariantInForwardDirection:(BOOL)a3
{
  void *v3;
  BOOL v4;

  -[TUIPressAndHoldGrid accentVariants](self, "accentVariants", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)showAccentVariantInForwardDirection:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  -[TUIPressAndHoldGrid indexPathInForwardDirection:](self, "indexPathInForwardDirection:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_2;
  -[TUIPressAndHoldGrid selectedIndexPath](self, "selectedIndexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v5 = 0;
    goto LABEL_5;
  }
  if (v3)
    -[TUIPressAndHoldGrid firstIndexPath](self, "firstIndexPath");
  else
    -[TUIPressAndHoldGrid lastIndexPath](self, "lastIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
LABEL_2:
    -[TUIPressAndHoldGrid setSelectedIndexPath:animated:scrollPosition:](self, "setSelectedIndexPath:animated:scrollPosition:", v5, 0, 0);
LABEL_5:
  -[TUIPressAndHoldGrid accentAtIndexPath:](self, "accentAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)accentVariantNumberForIndexPath:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUIPressAndHoldGrid visibleAttributes](self, "visibleAttributes");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      v10 = 0;
      v11 = v8 + v7;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "indexPath", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if ((v13 & 1) != 0)
        {
          v11 = v8 + v10;
          goto LABEL_12;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_12:

  return v11 + 1;
}

- (id)visibleAttributes
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  -[TUIPressAndHoldGrid collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[TUIPressAndHoldGrid collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "collectionViewLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutAttributesForElementsInRect:", v5, v7, v9, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_4666);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "filteredArrayUsingPredicate:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "sortedArrayUsingComparator:", &__block_literal_global_11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)indexPathForAccentVariantNumber:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3 - 1 > 8)
    return 0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[TUIPressAndHoldGrid collectionView](self, "collectionView", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleCells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "accentVariantNumber") == a3)
        {
          -[UICollectionView indexPathForCell:](self->_collectionView, "indexPathForCell:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (BOOL)handleNumberKey:(unint64_t)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  -[TUIPressAndHoldGrid indexPathForAccentVariantNumber:](self, "indexPathForAccentVariantNumber:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TUIPressAndHoldGrid indexPathIsValid:](self, "indexPathIsValid:", v4);
  if (v5)
  {
    -[TUIPressAndHoldGrid accentAtIndexPath:](self, "accentAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIPressAndHoldGrid setSelectedIndexPath:](self, "setSelectedIndexPath:", v4);
    -[TUIPressAndHoldGrid delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[TUIPressAndHoldGrid delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pressAndHoldGridDidAcceptAccentVariant:atIndexPath:", v6, v4);

    }
  }

  return v5;
}

- (BOOL)handleSelection
{
  _BOOL4 v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v3 = -[TUIPressAndHoldGrid indexPathIsValid:](self, "indexPathIsValid:", self->_selectedIndexPath);
  if (v3)
  {
    -[TUIPressAndHoldGrid delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[TUIPressAndHoldGrid delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIPressAndHoldGrid accentAtIndexPath:](self, "accentAtIndexPath:", self->_selectedIndexPath);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pressAndHoldGridDidAcceptAccentVariant:atIndexPath:", v7, self->_selectedIndexPath);

    }
  }
  return v3;
}

- (void)forceUpdateVisibleCells
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TUIPressAndHoldGrid collectionView](self, "collectionView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForVisibleItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        -[TUIPressAndHoldGrid collectionView](self, "collectionView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cellForItemAtIndexPath:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[TUIPressAndHoldGrid collectionView](self, "collectionView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIPressAndHoldGrid collectionView:willDisplayCell:forItemAtIndexPath:](self, "collectionView:willDisplayCell:forItemAtIndexPath:", v12, v11, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  v5 = 46.0;
  v6 = 30.0;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[TUIPressAndHoldGrid delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[TUIPressAndHoldGrid delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIPressAndHoldGrid accentAtIndexPath:](self, "accentAtIndexPath:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pressAndHoldGridDidAcceptAccentVariant:atIndexPath:", v8, v9);

  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v8;
    objc_msgSend(v13, "layoutAttributesForItemAtIndexPath:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIPressAndHoldGrid selectedIndexPath](self, "selectedIndexPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSelected:", objc_msgSend(v12, "isEqual:", v9));

    objc_msgSend(v10, "setAccentVariantNumber:", -[TUIPressAndHoldGrid accentVariantNumberForIndexPath:](self, "accentVariantNumberForIndexPath:", v9));
  }

}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 5.0;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[TUIPressAndHoldGrid accentVariants](self, "accentVariants", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v6 = a4;
  v7 = a3;
  -[TUIPressAndHoldGrid accentAtIndexPath:](self, "accentAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[TUIPressAndHoldViewCell reuseIdentifier](TUIPressAndHoldViewCell, "reuseIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAccentVariant:", v8);
  -[TUIPressAndHoldGrid selectedIndexPath](self, "selectedIndexPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "isEqual:", v11);

  objc_msgSend(v10, "setSelected:", v12);
  return v10;
}

- (NSArray)accentVariants
{
  return self->_accentVariants;
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (TUIPressAndHoldGridDelegate)delegate
{
  return (TUIPressAndHoldGridDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_accentVariants, 0);
}

uint64_t __40__TUIPressAndHoldGrid_visibleAttributes__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

BOOL __40__TUIPressAndHoldGrid_visibleAttributes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "representedElementCategory") == 0;
}

uint64_t __68__TUIPressAndHoldGrid_setSelectedIndexPath_animated_scrollPosition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "forceUpdateVisibleCells");
}

@end
