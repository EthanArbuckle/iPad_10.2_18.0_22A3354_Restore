@implementation SearchUIMultiResultCollectionViewCell

- (id)visibleResults
{
  void *v2;
  void *v3;

  -[SearchUIMultiResultCollectionViewCell multiCollectionView](self, "multiCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateExpanded:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  id v8;

  v4 = a4;
  v5 = a3;
  -[SearchUIMultiResultCollectionViewCell multiCollectionView](self, "multiCollectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsExpanded:animated:", v5, v4);

  -[SearchUIMultiResultCollectionViewCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[SearchUIMultiResultCollectionViewCell multiCollectionView](self, "multiCollectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidateIntrinsicContentSize");

}

- (CGSize)sizeCollectionViewWithSize:(CGSize)a3
{
  CGFloat width;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  -[SearchUIMultiResultCollectionViewCell multiCollectionView](self, "multiCollectionView", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v4, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateLayout");

  objc_msgSend(v4, "layoutBelowIfNeeded");
  objc_msgSend(v4, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionViewContentSize");
  v8 = v7;

  v9 = width;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (SearchUIMultiResultCollectionView)multiCollectionView
{
  return (SearchUIMultiResultCollectionView *)objc_getProperty(self, a2, 1016, 1);
}

- (void)removeManualFocus
{
  id v2;

  -[SearchUIMultiResultCollectionViewCell multiCollectionView](self, "multiCollectionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHighlightFirstCell:", 0);

}

- (BOOL)isExpandable
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[SearchUICollectionViewCell rowModel](self, "rowModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  LOBYTE(v4) = v4 > +[SearchUIAppIconUtilities numberOfAppIconsPerRow](SearchUIAppIconUtilities, "numberOfAppIconsPerRow");

  return v4;
}

- (SearchUIMultiResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  SearchUIMultiResultCollectionViewCell *v3;
  SearchUIMultiResultCollectionViewCell *v4;
  void *v5;
  SearchUIMultiResultCollectionView *v6;
  SearchUIMultiResultCollectionView *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SearchUIMultiResultCollectionViewCell;
  v3 = -[SearchUICollectionViewCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SearchUIMultiResultCollectionViewCell setClipsToBounds:](v3, "setClipsToBounds:", 1);
    v5 = (void *)objc_opt_new();
    +[SearchUIAppIconUtilities appIconItemSize](SearchUIAppIconUtilities, "appIconItemSize");
    objc_msgSend(v5, "setItemSize:");
    objc_msgSend(v5, "setMinimumInteritemSpacing:", 22.0);
    +[SearchUIAppIconUtilities distanceToTopOfAppIconsForMultiResultCell](SearchUIAppIconUtilities, "distanceToTopOfAppIconsForMultiResultCell");
    objc_msgSend(v5, "setMinimumLineSpacing:");
    v6 = [SearchUIMultiResultCollectionView alloc];
    v7 = -[SearchUIMultiResultCollectionView initWithFrame:collectionViewLayout:](v6, "initWithFrame:collectionViewLayout:", v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[SearchUIMultiResultCollectionViewCell setMultiCollectionView:](v4, "setMultiCollectionView:", v7);

    -[SearchUIMultiResultCollectionViewCell contentView](v4, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIMultiResultCollectionViewCell multiCollectionView](v4, "multiCollectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

  }
  return v4;
}

- (void)setMultiCollectionView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1016);
}

- (BOOL)needsInternalFocus
{
  return 1;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SearchUIMultiResultCollectionViewCell;
  v4 = a3;
  -[SearchUICollectionViewCell updateWithRowModel:](&v22, sel_updateWithRowModel_, v4);
  -[SearchUIMultiResultCollectionViewCell multiCollectionView](self, "multiCollectionView", v22.receiver, v22.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithRowModel:", v4);

  objc_msgSend(v4, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") == 1
    && (objc_msgSend(v6, "firstObject"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "auxiliaryTopText"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "length"),
        v8,
        v7,
        v9))
  {
    -[SearchUIMultiResultCollectionViewCell folderLabelView](self, "folderLabelView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = (void *)objc_opt_new();
      -[SearchUIMultiResultCollectionViewCell setFolderLabelView:](self, "setFolderLabelView:", v11);

      -[SearchUIMultiResultCollectionViewCell contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIMultiResultCollectionViewCell folderLabelView](self, "folderLabelView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", v13);

    }
    v14 = (void *)MEMORY[0x1E0DBD9D8];
    objc_msgSend(v6, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "auxiliaryTopText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textWithString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIMultiResultCollectionViewCell folderLabelView](self, "folderLabelView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTopText:", v17);

    -[SearchUIMultiResultCollectionViewCell folderLabelView](self, "folderLabelView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = 0;
  }
  else
  {
    -[SearchUIMultiResultCollectionViewCell folderLabelView](self, "folderLabelView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = 1;
  }
  objc_msgSend(v19, "setHidden:", v21);

}

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUIMultiResultCollectionViewCell;
  v4 = a3;
  -[SearchUICollectionViewCell setDelegate:](&v6, sel_setDelegate_, v4);
  -[SearchUIMultiResultCollectionViewCell multiCollectionView](self, "multiCollectionView", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFeedbackDelegate:", v4);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double Width;
  double v22;
  double MinX;
  double MaxX;
  double v25;
  double Height;
  void *v27;
  CGFloat v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  objc_super v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v37.receiver = self;
  v37.super_class = (Class)SearchUIMultiResultCollectionViewCell;
  -[SearchUICollectionViewCell layoutSubviews](&v37, sel_layoutSubviews);
  -[SearchUIMultiResultCollectionViewCell bounds](self, "bounds");
  -[SearchUIMultiResultCollectionViewCell sizeCollectionViewWithSize:](self, "sizeCollectionViewWithSize:", v3, v4);
  -[SearchUIMultiResultCollectionViewCell folderLabelView](self, "folderLabelView");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[SearchUIMultiResultCollectionViewCell folderLabelView](self, "folderLabelView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isHidden");

    if ((v8 & 1) == 0)
    {
      v9 = objc_msgSend(MEMORY[0x1E0DBD9B0], "isLTR");
      -[SearchUIMultiResultCollectionViewCell multiCollectionView](self, "multiCollectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "visibleCells");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;

      if ((v9 & 1) != 0)
      {
        -[SearchUIMultiResultCollectionViewCell bounds](self, "bounds");
        Width = CGRectGetWidth(v38);
        v39.origin.x = v14;
        v39.origin.y = v16;
        v39.size.width = v18;
        v39.size.height = v20;
        v22 = Width - CGRectGetMaxX(v39);
        v40.origin.x = v14;
        v40.origin.y = v16;
        v40.size.width = v18;
        v40.size.height = v20;
        MinX = CGRectGetMinX(v40);
      }
      else
      {
        v41.origin.x = v14;
        v41.origin.y = v16;
        v41.size.width = v18;
        v41.size.height = v20;
        v22 = CGRectGetMinX(v41);
        -[SearchUIMultiResultCollectionViewCell bounds](self, "bounds");
        MaxX = CGRectGetMaxX(v42);
        v43.origin.x = v14;
        v43.origin.y = v16;
        v43.size.width = v18;
        v43.size.height = v20;
        MinX = MaxX - CGRectGetMaxX(v43);
      }
      v25 = v22 - MinX;
      -[SearchUIMultiResultCollectionViewCell bounds](self, "bounds");
      Height = CGRectGetHeight(v44);
      v27 = (void *)MEMORY[0x1E0DBD9B0];
      -[SearchUIMultiResultCollectionViewCell bounds](self, "bounds");
      v28 = (CGRectGetHeight(v45) - Height) * 0.5;
      -[SearchUIMultiResultCollectionViewCell contentView](self, "contentView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "deviceScaledRoundedValue:forView:", v29, v28);
      v31 = v30;

      v32 = (void *)MEMORY[0x1E0DBD9B0];
      if (v9)
      {
        -[SearchUIMultiResultCollectionViewCell bounds](self, "bounds");
        MinX = CGRectGetWidth(v46) - v25 - MinX;
      }
      -[SearchUIMultiResultCollectionViewCell contentView](self, "contentView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "deviceScaledRoundedValue:forView:", v33, MinX);
      v35 = v34;

      -[SearchUIMultiResultCollectionViewCell folderLabelView](self, "folderLabelView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setFrame:", v35, v31, v25, Height);

    }
  }
}

- (TLKAuxilliaryTextView)folderLabelView
{
  return (TLKAuxilliaryTextView *)objc_getProperty(self, a2, 1024, 1);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SearchUIMultiResultCollectionViewCell;
  -[SearchUICollectionViewCell hitTest:withEvent:](&v14, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isDescendantOfView:", self)
    && (-[SearchUICollectionViewCell rowModel](self, "rowModel"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "results"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6,
        v8 == 1))
  {
    -[SearchUIMultiResultCollectionViewCell multiCollectionView](self, "multiCollectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "visibleCells");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appIconView");
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = v5;
  }

  return v12;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v9;

  v3 = a3;
  -[SearchUICollectionViewCell rowModel](self, "rowModel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") != 1)
    goto LABEL_4;
  -[SearchUIMultiResultCollectionViewCell multiCollectionView](self, "multiCollectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "highlightFirstCell"))
  {

LABEL_4:
    return;
  }
  objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v9.receiver = self;
    v9.super_class = (Class)SearchUIMultiResultCollectionViewCell;
    -[SearchUICollectionViewCell setSelected:](&v9, sel_setSelected_, v3);
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SearchUIMultiResultCollectionViewCell;
  -[SearchUICollectionViewCell didUpdateFocusInContext:withAnimationCoordinator:](&v12, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  -[SearchUICollectionViewCell rowModel](self, "rowModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "results");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 == 1)
  {
    objc_msgSend(v6, "nextFocusedView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIMultiResultCollectionViewCell viewForForcedFocus](self, "viewForForcedFocus");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == v11)
      -[SearchUIMultiResultCollectionViewCell setupManualFocus](self, "setupManualFocus");
    else
      -[SearchUIMultiResultCollectionViewCell removeManualFocus](self, "removeManualFocus");
  }

}

- (BOOL)setupManualFocus
{
  void *v2;

  -[SearchUIMultiResultCollectionViewCell multiCollectionView](self, "multiCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHighlightFirstCell:", 1);

  return 1;
}

- (void)returnKeyPressed
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[SearchUIMultiResultCollectionViewCell multiCollectionView](self, "multiCollectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForItemAtIndexPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appIconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "launchIcon");

}

- (id)viewForForcedFocus
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SearchUIMultiResultCollectionViewCell multiCollectionView](self, "multiCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cellForItemAtIndexPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appIconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setFolderLabelView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderLabelView, 0);
  objc_storeStrong((id *)&self->_multiCollectionView, 0);
}

@end
