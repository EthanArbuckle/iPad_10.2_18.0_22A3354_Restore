@implementation TUICandidateGrid

- (void)commonInit
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[TUICandidateGrid setRowType:](self, "setRowType:", 0);
  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[TUICandidateGrid setSelectedRowHighlightView:](self, "setSelectedRowHighlightView:", v4);

  -[TUICandidateGrid selectedRowHighlightView](self, "selectedRowHighlightView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setZPosition:", -1.0);

  -[TUICandidateGrid selectedRowHighlightView](self, "selectedRowHighlightView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", 0);

  -[TUICandidateGrid collectionView](self, "collectionView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TUICandidateGrid selectedRowHighlightView](self, "selectedRowHighlightView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertSubview:atIndex:", v8, 0);

}

- (TUICandidateGrid)initWithFrame:(CGRect)a3
{
  TUICandidateGrid *v3;
  TUICandidateGrid *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUICandidateGrid;
  v3 = -[TUICandidateGrid initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TUICandidateGrid commonInit](v3, "commonInit");
  return v4;
}

- (TUICandidateGrid)initWithCoder:(id)a3
{
  TUICandidateGrid *v3;
  TUICandidateGrid *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUICandidateGrid;
  v3 = -[TUICandidateGrid initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[TUICandidateGrid commonInit](v3, "commonInit");
  return v4;
}

- (UICollectionView)collectionView
{
  UICollectionView *collectionView;
  TUICandidateCollectionView *v4;
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
  UICollectionView *v15;
  void *v16;
  UICollectionView *v17;
  uint64_t v18;
  void *v19;
  UICollectionView *v20;
  uint64_t v21;
  void *v22;
  UICollectionView *v23;
  uint64_t v24;
  void *v25;
  UICollectionView *v26;
  uint64_t v27;
  void *v28;
  UICollectionView *v29;
  uint64_t v30;
  void *v31;
  UICollectionView *v32;
  uint64_t v33;
  void *v34;
  UICollectionView *v35;
  uint64_t v36;
  void *v37;

  collectionView = self->_collectionView;
  if (!collectionView)
  {
    v4 = [TUICandidateCollectionView alloc];
    -[TUICandidateGrid bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[TUICandidateGrid collectionViewLayout](self, "collectionViewLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[TUICandidateCollectionView initWithFrame:collectionViewLayout:](v4, "initWithFrame:collectionViewLayout:", v13, v6, v8, v10, v12);
    v15 = self->_collectionView;
    self->_collectionView = v14;

    -[UICollectionView setShowsHorizontalScrollIndicator:](self->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
    -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
    -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
    -[UICollectionView setAllowsMultipleSelection:](self->_collectionView, "setAllowsMultipleSelection:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v16);

    -[UICollectionView setDelaysContentTouches:](self->_collectionView, "setDelaysContentTouches:", 0);
    -[UICollectionView _setAutomaticContentOffsetAdjustmentEnabled:](self->_collectionView, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
    v17 = self->_collectionView;
    v18 = objc_opt_class();
    +[TUICandidateCell reuseIdentifier](TUICandidateCell, "reuseIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v17, "registerClass:forCellWithReuseIdentifier:", v18, v19);

    v20 = self->_collectionView;
    v21 = objc_opt_class();
    +[TUIAutofillExtraCandidateCell reuseIdentifier](TUIAutofillExtraCandidateCell, "reuseIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v20, "registerClass:forCellWithReuseIdentifier:", v21, v22);

    v23 = self->_collectionView;
    v24 = objc_opt_class();
    +[TUISuggestionCandidateCell reuseIdentifier](TUISuggestionCandidateCell, "reuseIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v23, "registerClass:forCellWithReuseIdentifier:", v24, v25);

    v26 = self->_collectionView;
    v27 = objc_opt_class();
    +[TUIProactiveCandidateCell reuseIdentifier](TUIProactiveCandidateCell, "reuseIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v26, "registerClass:forCellWithReuseIdentifier:", v27, v28);

    v29 = self->_collectionView;
    v30 = objc_opt_class();
    +[TUICandidateLine reuseIdentifier](TUICandidateLine, "reuseIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v29, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v30, CFSTR("Line"), v31);

    v32 = self->_collectionView;
    v33 = objc_opt_class();
    +[TUICandidateSlottedSeparator reuseIdentifier](TUICandidateSlottedSeparator, "reuseIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v32, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v33, CFSTR("SlottedCellSeparator"), v34);

    v35 = self->_collectionView;
    v36 = objc_opt_class();
    +[TUICandidateGroupHeader reuseIdentifier](TUICandidateGroupHeader, "reuseIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v35, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v36, CFSTR("GroupHeader"), v37);

    -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](self->_collectionView, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("CustomHeader"), CFSTR("CustomHeader"));
    -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](self->_collectionView, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("DummyCandidate"), CFSTR("DummyCandidate"));
    -[TUICandidateGrid addSubview:](self, "addSubview:", self->_collectionView);
    collectionView = self->_collectionView;
  }
  return collectionView;
}

- (id)collectionViewLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v21;
  CGRect v23;

  if (-[TUICandidateGrid rowType](self, "rowType"))
    -[TUICandidateGrid multiRowLayout](self, "multiRowLayout");
  else
    -[TUICandidateGrid singleRowLayout](self, "singleRowLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCandidateNumberEnabled:", -[TUICandidateGrid candidateNumberEnabled](self, "candidateNumberEnabled"));
  -[TUICandidateGrid customHeader](self, "customHeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  objc_msgSend(v3, "setCustomHeaderHeight:", CGRectGetHeight(v23));

  -[TUICandidateGrid style](self, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TUICandidateGrid style](self, "style");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setShouldJustifyRow:", objc_msgSend(v6, "shouldJustifyRow"));

  }
  else
  {
    objc_msgSend(v3, "setShouldJustifyRow:", 0);
  }

  -[TUICandidateGrid style](self, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColumnsCount:", objc_msgSend(v7, "columnsCount"));

  -[TUICandidateGrid style](self, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLayoutOrientation:", objc_msgSend(v8, "layoutOrientation"));

  -[TUICandidateGrid style](self, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "gridPadding");
  objc_msgSend(v3, "setGridPadding:");

  -[TUICandidateGrid style](self, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "gridLinePadding");
  objc_msgSend(v3, "setGridLinePadding:");

  -[TUICandidateGrid style](self, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TUICandidateGrid style](self, "style");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "interRowSpacing");
    objc_msgSend(v3, "setInterRowSpacing:");

  }
  else
  {
    objc_msgSend(v3, "setInterRowSpacing:", 0.0);
  }

  -[TUICandidateGrid style](self, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TUICandidateGrid style](self, "style");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "slottedCandidatesIterItemSpacing");
    objc_msgSend(v3, "setSlottedCandidatesIterItemSpacing:");

  }
  else
  {
    objc_msgSend(v3, "setSlottedCandidatesIterItemSpacing:", 0.0);
  }

  -[TUICandidateGrid style](self, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TUICandidateGrid style](self, "style");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHideSlottedCellSeparators:", objc_msgSend(v16, "hideSlottedCellSeparators"));

  }
  else
  {
    objc_msgSend(v3, "setHideSlottedCellSeparators:", 0);
  }

  -[TUICandidateGrid style](self, "style");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "gridLineOffset");
  objc_msgSend(v3, "setGridLineOffset:");

  -[TUICandidateGrid style](self, "style");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "minimumInterItemSpacing");
  objc_msgSend(v3, "setMinimumInterItemSpacing:");

  -[TUICandidateGrid style](self, "style");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "singleSlottedCellMargin");
  objc_msgSend(v3, "setSingleSlottedCellMargin:");

  -[TUICandidateGrid style](self, "style");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowExtraLineBeforeFirstRow:", objc_msgSend(v20, "showExtraLineBeforeFirstRow"));

  -[TUICandidateGrid style](self, "style");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFillGridWithLines:", objc_msgSend(v21, "fillGridWithLines"));

  return v3;
}

- (TUICandidateLayout)singleRowLayout
{
  TUICandidateLayout *singleRowLayout;
  TUICandidateLayout *v4;
  TUICandidateLayout *v5;

  singleRowLayout = self->_singleRowLayout;
  if (!singleRowLayout)
  {
    v4 = objc_alloc_init(TUICandidateLayout);
    v5 = self->_singleRowLayout;
    self->_singleRowLayout = v4;

    -[TUICandidateLayout setRowType:](self->_singleRowLayout, "setRowType:", 0);
    singleRowLayout = self->_singleRowLayout;
  }
  return singleRowLayout;
}

- (TUICandidateLayout)multiRowLayout
{
  TUICandidateLayout *multiRowLayout;
  TUICandidateLayout *v4;
  TUICandidateLayout *v5;

  multiRowLayout = self->_multiRowLayout;
  if (!multiRowLayout)
  {
    v4 = objc_alloc_init(TUICandidateLayout);
    v5 = self->_multiRowLayout;
    self->_multiRowLayout = v4;

    -[TUICandidateLayout setRowType:](self->_multiRowLayout, "setRowType:", 1);
    multiRowLayout = self->_multiRowLayout;
  }
  return multiRowLayout;
}

- (void)setCandidateGroups:(id)a3
{
  char v5;
  void *v6;
  void *v7;
  void *v8;
  NSIndexPath *selectedIndexPath;
  id v10;

  v10 = a3;
  v5 = -[NSArray isEqual:](self->_candidateGroups, "isEqual:", v10);
  v6 = v10;
  if ((v5 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_candidateGroups, a3);
    -[TUICandidateGrid collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadData");

    -[TUICandidateGrid updateIndex](self, "updateIndex");
    if (self->_selectedIndexPath)
    {
      -[TUICandidateGrid collectionView](self, "collectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deselectItemAtIndexPath:animated:", self->_selectedIndexPath, 0);

      selectedIndexPath = self->_selectedIndexPath;
      self->_selectedIndexPath = 0;

      -[TUICandidateGrid didMoveHighlightFrame](self, "didMoveHighlightFrame");
    }
    self->_lastUserSelectedCursorX = 0.0;
    -[TUICandidateGrid updateSelectedRowHighlightView](self, "updateSelectedRowHighlightView");
    -[TUICandidateGrid addAppCandidatesRenderSignposts](self, "addAppCandidatesRenderSignposts");
    v6 = v10;
  }

}

- (void)scrollToFirstCandidate
{
  void *v3;
  double v4;
  double v5;
  id v6;

  -[TUICandidateGrid firstIndexPath](self, "firstIndexPath");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (-[TUICandidateGrid indexPathIsValid:](self, "indexPathIsValid:")
    && (-[TUICandidateGrid collectionView](self, "collectionView"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "contentOffset"),
        v5 = v4,
        v3,
        v5 >= 0.0))
  {
    -[TUICandidateGrid scrollToCandidateAtIndexPath:animated:](self, "scrollToCandidateAtIndexPath:animated:", v6, 0);
  }
  else
  {
    -[TUICandidateGrid scrollToTop](self, "scrollToTop");
  }

}

- (NSArray)visibleCandidates
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  void *v33;
  double MinX;
  void *v35;
  void *v36;
  CGFloat v37;
  void *v38;
  void *v39;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  -[TUICandidateGrid collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForVisibleItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_5070);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v43;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v43 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v10);
        -[TUICandidateGrid collectionView](self, "collectionView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "cellForItemAtIndexPath:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "window");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[TUICandidateGrid window](self, "window");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "frame");
          v17 = v16;
          v19 = v18;
          v21 = v20;
          v23 = v22;
          -[TUICandidateGrid collectionView](self, "collectionView");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "convertRect:fromView:", v24, v17, v19, v21, v23);
          v26 = v25;
          v28 = v27;
          v30 = v29;
          v32 = v31;

          -[TUICandidateGrid window](self, "window");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v48.origin.x = v26;
          v48.origin.y = v28;
          v48.size.width = v30;
          v48.size.height = v32;
          MinX = CGRectGetMinX(v48);
          v49.origin.x = v26;
          v49.origin.y = v28;
          v49.size.width = v30;
          v49.size.height = v32;
          objc_msgSend(v33, "hitTest:withEvent:", 0, MinX, CGRectGetMidY(v49));
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          -[TUICandidateGrid window](self, "window");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v50.origin.x = v26;
          v50.origin.y = v28;
          v50.size.width = v30;
          v50.size.height = v32;
          v37 = CGRectGetMaxX(v50) + -0.01;
          v51.origin.x = v26;
          v51.origin.y = v28;
          v51.size.width = v30;
          v51.size.height = v32;
          objc_msgSend(v36, "hitTest:withEvent:", 0, v37, CGRectGetMidY(v51));
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v35, "isDescendantOfView:", v13) & 1) != 0
            || objc_msgSend(v38, "isDescendantOfView:", v13))
          {
            -[TUICandidateGrid candidateAtIndexPath:](self, "candidateAtIndexPath:", v11);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if (v39)
              objc_msgSend(v41, "addObject:", v39);

          }
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v8);
  }

  return (NSArray *)v41;
}

- (void)setSuppressCollectionViewLayout:(BOOL)a3
{
  if (self->_suppressCollectionViewLayout != a3)
  {
    self->_suppressCollectionViewLayout = a3;
    if (!a3)
    {
      if (-[TUICandidateGrid collectionViewLayoutWasSkipped](self, "collectionViewLayoutWasSkipped"))
        -[TUICandidateGrid setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)layoutSubviews
{
  _BOOL8 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TUICandidateGrid;
  -[TUICandidateGrid layoutSubviews](&v13, sel_layoutSubviews);
  v3 = -[TUICandidateGrid suppressCollectionViewLayout](self, "suppressCollectionViewLayout");
  if (!v3)
  {
    -[TUICandidateGrid bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[TUICandidateGrid collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

    -[TUICandidateGrid updateContentInset](self, "updateContentInset");
    -[TUICandidateGrid updateSelectedRowHighlightView](self, "updateSelectedRowHighlightView");
    -[TUICandidateGrid updateCollectionViewFrameForArrowButton](self, "updateCollectionViewFrameForArrowButton");
  }
  -[TUICandidateGrid setCollectionViewLayoutWasSkipped:](self, "setCollectionViewLayoutWasSkipped:", v3);
  -[TUICandidateGrid updateGradientLayerToCollectionView](self, "updateGradientLayerToCollectionView");
}

- (void)updateIndex
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL4 v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;

  -[TUICandidateGrid collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_reloadSectionIndexTitles");

  -[TUICandidateGrid collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryViewAtEdge:", 1);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v5);

  objc_msgSend(v15, "_removeAllAnimations:", 0);
  -[TUICandidateGrid style](self, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "showsIndex"))
  {
    -[TUICandidateGrid collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateGrid _sectionIndexTitlesForCollectionView:](self, "_sectionIndexTitlesForCollectionView:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    v10 = v9 != 0;
    if (v9)
      v11 = 1.0;
    else
      v11 = 0.0;

  }
  else
  {
    v10 = 0;
    v11 = 0.0;
  }

  objc_msgSend(v15, "alpha");
  if (v11 != v12)
  {
    if (v10)
    {
      objc_msgSend(v15, "setHidden:", 0);
      objc_msgSend(v15, "setAlpha:", v11);
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0DC3F10];
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __31__TUICandidateGrid_updateIndex__block_invoke;
      v20 = &unk_1E24FC068;
      v21 = v15;
      objc_msgSend(v13, "performWithoutAnimation:", &v17);

    }
  }
  -[TUICandidateGrid collectionView](self, "collectionView", v15, v17, v18, v19, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShowsVerticalScrollIndicator:", 1);

}

- (void)setStyle:(id)a3
{
  id v4;

  v4 = a3;
  if (-[TUICandidateGrid animating](self, "animating"))
    -[TUICandidateGrid setStylePending:](self, "setStylePending:", v4);
  else
    -[TUICandidateGrid setStyle:reload:](self, "setStyle:reload:", v4, 1);

}

- (void)setStyle:(id)a3 reload:(BOOL)a4
{
  int v4;
  id v5;
  id v7;
  TUICandidateViewStyle **p_style;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  double v93;
  void *v94;
  uint64_t v95;
  void *v96;
  double v97;
  double v98;
  double v99;
  double v100;
  void *v101;
  double v102;
  double v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  void *v117;
  double v118;
  double v119;
  void *v120;
  double v121;
  double v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t i;
  void *v132;
  int v133;
  void *v134;
  void *v135;
  id v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  double v141;
  _BYTE v142[128];
  uint64_t v143;

  v4 = a4;
  v5 = a3;
  v143 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  p_style = &self->_style;
  if ((-[TUICandidateViewStyle isEqual:](self->_style, "isEqual:", v7) & 1) != 0)
    goto LABEL_44;
  -[TUICandidateViewStyle backgroundColor](*p_style, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == v10)
  {
LABEL_5:
    v136 = v5;
    -[TUICandidateViewStyle lineColor](*p_style, "lineColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lineColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14)
    {
      v17 = 0;
    }
    else
    {
      -[TUICandidateViewStyle lineColor](*p_style, "lineColor");
      v133 = v4;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lineColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqual:", v16) ^ 1;

      v4 = v133;
    }

    v12 = v134;
    v11 = v135;
    v18 = v17;
    v5 = v136;
    if (v9 == v10)
      goto LABEL_11;
    goto LABEL_10;
  }
  -[TUICandidateViewStyle backgroundColor](*p_style, "backgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqual:", v12))
  {
    v134 = v12;
    v135 = v11;
    goto LABEL_5;
  }
  v18 = 1;
LABEL_10:

LABEL_11:
  v19 = -[TUICandidateViewStyle hidesPartialCandidates](*p_style, "hidesPartialCandidates");
  v20 = objc_msgSend(v7, "hidesPartialCandidates");
  if (v4)
    v4 = v18 | v19 ^ v20;
  if (*p_style)
  {
    v21 = -[TUICandidateViewStyle showsIndex](*p_style, "showsIndex");
    v22 = v21 ^ objc_msgSend(v7, "showsIndex");
  }
  else
  {
    v22 = 1;
  }
  objc_storeStrong((id *)&self->_style, v5);
  objc_msgSend(v7, "gridBackgroundColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backgroundOpacity");
  if (v24 < 1.0)
  {
    v141 = 0.0;
    objc_msgSend(v23, "getRed:green:blue:alpha:", 0, 0, 0, &v141);
    v25 = v141;
    objc_msgSend(v7, "backgroundOpacity");
    objc_msgSend(v23, "colorWithAlphaComponent:", v25 * v26);
    v27 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v27;
  }
  -[TUICandidateGrid setBackgroundColor:](self, "setBackgroundColor:", v23);
  objc_msgSend(v7, "textColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateGrid collectionView](self, "collectionView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTintColor:", v28);

  objc_msgSend(v7, "cornerRadius");
  -[TUICandidateGrid _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
  v30 = objc_msgSend(v7, "gridMaskedCorners");
  -[TUICandidateGrid layer](self, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setMaskedCorners:", v30);

  objc_msgSend(v7, "highlightedRowBackgroundColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateGrid selectedRowHighlightView](self, "selectedRowHighlightView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setBackgroundColor:", v32);

  if ((objc_msgSend(v7, "scrollDisabled") & 1) != 0)
    v34 = 0;
  else
    v34 = objc_msgSend(v7, "dragGestureDisabled") ^ 1;
  -[TUICandidateGrid collectionView](self, "collectionView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setScrollEnabled:", v34);

  objc_msgSend(v7, "foregroundOpacity");
  v37 = v36;
  -[TUICandidateGrid collectionView](self, "collectionView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setAlpha:", v37);

  objc_msgSend(v7, "gridPadding");
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;
  -[TUICandidateGrid singleRowLayout](self, "singleRowLayout");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setGridPadding:", v40, v42, v44, v46);

  objc_msgSend(v7, "gridLinePadding");
  v49 = v48;
  v51 = v50;
  v53 = v52;
  v55 = v54;
  -[TUICandidateGrid singleRowLayout](self, "singleRowLayout");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setGridLinePadding:", v49, v51, v53, v55);

  objc_msgSend(v7, "gridLineOffset");
  v58 = v57;
  v60 = v59;
  -[TUICandidateGrid singleRowLayout](self, "singleRowLayout");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setGridLineOffset:", v58, v60);

  v62 = objc_msgSend(v7, "layoutOrientation");
  -[TUICandidateGrid singleRowLayout](self, "singleRowLayout");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setLayoutOrientation:", v62);

  v64 = objc_msgSend(v7, "showsIndex");
  -[TUICandidateGrid singleRowLayout](self, "singleRowLayout");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setShowsIndex:", v64);

  -[TUICandidateGrid style](self, "style");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v66, "showExtraLineBeforeFirstRow");
  -[TUICandidateGrid singleRowLayout](self, "singleRowLayout");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setShowExtraLineBeforeFirstRow:", v67);

  v69 = objc_msgSend(v7, "fillGridWithLines");
  -[TUICandidateGrid singleRowLayout](self, "singleRowLayout");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setFillGridWithLines:", v69);

  objc_msgSend(v7, "gridPadding");
  v72 = v71;
  v74 = v73;
  v76 = v75;
  v78 = v77;
  -[TUICandidateGrid multiRowLayout](self, "multiRowLayout");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setGridPadding:", v72, v74, v76, v78);

  objc_msgSend(v7, "gridLinePadding");
  v81 = v80;
  v83 = v82;
  v85 = v84;
  v87 = v86;
  -[TUICandidateGrid multiRowLayout](self, "multiRowLayout");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setGridLinePadding:", v81, v83, v85, v87);

  v89 = 0.0;
  v90 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "interRowSpacing");
    v90 = v91;
  }
  -[TUICandidateGrid multiRowLayout](self, "multiRowLayout");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setInterRowSpacing:", v90);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "slottedCandidatesIterItemSpacing");
    v89 = v93;
  }
  -[TUICandidateGrid multiRowLayout](self, "multiRowLayout");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setSlottedCandidatesIterItemSpacing:", v89);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v95 = objc_msgSend(v7, "hideSlottedCellSeparators");
  else
    v95 = 0;
  -[TUICandidateGrid multiRowLayout](self, "multiRowLayout");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "setHideSlottedCellSeparators:", v95);

  objc_msgSend(v7, "gridLineOffset");
  v98 = v97;
  v100 = v99;
  -[TUICandidateGrid multiRowLayout](self, "multiRowLayout");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setGridLineOffset:", v98, v100);

  objc_msgSend(v7, "minimumInterItemSpacing");
  v103 = v102;
  -[TUICandidateGrid multiRowLayout](self, "multiRowLayout");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "setMinimumInterItemSpacing:", v103);

  v105 = objc_msgSend(v7, "layoutOrientation");
  -[TUICandidateGrid multiRowLayout](self, "multiRowLayout");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setLayoutOrientation:", v105);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v107 = objc_msgSend(v7, "shouldJustifyRow");
  else
    v107 = 0;
  -[TUICandidateGrid multiRowLayout](self, "multiRowLayout");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setShouldJustifyRow:", v107);

  v109 = objc_msgSend(v7, "columnsCount");
  -[TUICandidateGrid multiRowLayout](self, "multiRowLayout");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "setColumnsCount:", v109);

  v111 = objc_msgSend(v7, "showsIndex");
  -[TUICandidateGrid multiRowLayout](self, "multiRowLayout");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setShowsIndex:", v111);

  -[TUICandidateGrid style](self, "style");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = objc_msgSend(v113, "showExtraLineBeforeFirstRow");
  -[TUICandidateGrid multiRowLayout](self, "multiRowLayout");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "setShowExtraLineBeforeFirstRow:", v114);

  v116 = objc_msgSend(v7, "fillGridWithLines");
  -[TUICandidateGrid multiRowLayout](self, "multiRowLayout");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "setFillGridWithLines:", v116);

  objc_msgSend(v7, "singleSlottedCellMargin");
  v119 = v118;
  -[TUICandidateGrid singleRowLayout](self, "singleRowLayout");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "setSingleSlottedCellMargin:", v119);

  objc_msgSend(v7, "minimumInterItemSpacing");
  v122 = v121;
  -[TUICandidateGrid singleRowLayout](self, "singleRowLayout");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "setMinimumInterItemSpacing:", v122);

  -[TUICandidateGrid style](self, "style");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateGrid setClipsToBounds:](self, "setClipsToBounds:", objc_msgSend(v124, "doNotClipToBounds") ^ 1);

  -[TUICandidateGrid updateBounce](self, "updateBounce");
  if (v4)
  {
    -[TUICandidateGrid collectionView](self, "collectionView");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "reloadData");
  }
  else
  {
    v139 = 0u;
    v140 = 0u;
    v137 = 0u;
    v138 = 0u;
    -[TUICandidateGrid collectionView](self, "collectionView");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "visibleCells");
    v127 = (void *)objc_claimAutoreleasedReturnValue();

    v128 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v137, v142, 16);
    if (v128)
    {
      v129 = v128;
      v130 = *(_QWORD *)v138;
      do
      {
        for (i = 0; i != v129; ++i)
        {
          if (*(_QWORD *)v138 != v130)
            objc_enumerationMutation(v127);
          objc_msgSend(*(id *)(*((_QWORD *)&v137 + 1) + 8 * i), "setStyle:", v7);
        }
        v129 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v137, v142, 16);
      }
      while (v129);
    }

    -[TUICandidateGrid collectionView](self, "collectionView");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "collectionViewLayout");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "invalidateLayout");

  }
  if (v22)
    -[TUICandidateGrid updateIndex](self, "updateIndex");

LABEL_44:
}

- (void)setRowType:(int64_t)a3
{
  -[TUICandidateGrid setRowType:animated:](self, "setRowType:animated:", a3, 0);
}

- (void)setRowType:(int64_t)a3 animated:(BOOL)a4
{
  -[TUICandidateGrid setRowType:options:animated:completion:](self, "setRowType:options:animated:completion:", a3, 0, a4, 0);
}

- (void)setRowType:(int64_t)a3 options:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  objc_class *v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  if (a5)
  {
    v9 = (objc_class *)MEMORY[0x1E0DC3F38];
    v10 = a6;
    v13 = (id)objc_msgSend([v9 alloc], "initWithDuration:curve:animations:", (a4 >> 16) & 7, &__block_literal_global_35, 0.25);
    -[TUICandidateGrid style](self, "style");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateGrid setRowType:options:style:animated:animator:completion:](self, "setRowType:options:style:animated:animator:completion:", a3, a4, v11, 1, v13, v10);

    objc_msgSend(v13, "startAnimation");
  }
  else
  {
    v12 = a6;
    -[TUICandidateGrid style](self, "style");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[TUICandidateGrid setRowType:options:style:animated:animator:completion:](self, "setRowType:options:style:animated:animator:completion:", a3, a4);

  }
}

- (void)setRowType:(int64_t)a3 options:(unint64_t)a4 style:(id)a5 animated:(BOOL)a6 animator:(id)a7 completion:(id)a8
{
  _BOOL4 v10;
  id v13;
  id v14;
  id v15;
  void *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  TUICandidateLayout *v29;
  void *v30;
  double MinX;
  void *v32;
  double v33;
  uint64_t v34;
  char v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  _QWORD v53[5];
  id v54;
  id v55;
  _QWORD v56[4];
  TUICandidateLayout *v57;
  id v58;
  _QWORD v59[5];
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id location[2];
  CGRect v66;

  v10 = a6;
  v13 = a5;
  v14 = a7;
  v15 = a8;
  if (self->_rowType == a3)
  {
    -[TUICandidateGrid setStyle:](self, "setStyle:", v13);
  }
  else
  {
    self->_rowType = a3;
    -[TUICandidateGrid style](self, "style");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      -[TUICandidateGrid setStyle:](self, "setStyle:", v13);
    objc_initWeak(location, self->_collectionView);
    -[TUICandidateGrid updateBounce](self, "updateBounce");
    WeakRetained = objc_loadWeakRetained(location);
    objc_msgSend(WeakRetained, "indexPathsForVisibleItems");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "valueForKeyPath:", CFSTR("@min.self"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateGrid setFirstVisibleIndexPath:](self, "setFirstVisibleIndexPath:", v19);

    if (!a3)
      -[TUICandidateGrid setLastUserSelectedCursorX:](self, "setLastUserSelectedCursorX:", 0.0);
    if (v10)
    {
      -[TUICandidateGrid collectionView](self, "collectionView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setShowsVerticalScrollIndicator:", 0);

      -[TUICandidateGrid setAnimating:](self, "setAnimating:", 1);
      -[TUICandidateGrid setStylePending:](self, "setStylePending:", v13);
      v21 = objc_loadWeakRetained(location);
      -[TUICandidateGrid firstVisibleIndexPath](self, "firstVisibleIndexPath");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "layoutAttributesForItemAtIndexPath:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (a3 == 1)
      {
        v24 = v13;
      }
      else
      {
        -[TUICandidateGrid style](self, "style");
        v24 = (id)objc_claimAutoreleasedReturnValue();
      }
      v28 = v24;
      v29 = objc_alloc_init(TUICandidateLayout);
      -[TUICandidateLayout setRowType:](v29, "setRowType:", 1);
      -[TUICandidateLayout setCandidateNumberEnabled:](v29, "setCandidateNumberEnabled:", -[TUICandidateGrid candidateNumberEnabled](self, "candidateNumberEnabled"));
      -[TUICandidateLayout setTransitionState:](v29, "setTransitionState:", 1);
      -[TUICandidateGrid firstVisibleIndexPath](self, "firstVisibleIndexPath");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUICandidateLayout setOldFirstVisibleIndexPath:](v29, "setOldFirstVisibleIndexPath:", v30);

      objc_msgSend(v23, "frame");
      MinX = CGRectGetMinX(v66);
      -[TUICandidateGrid collectionView](self, "collectionView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "contentOffset");
      -[TUICandidateLayout setOldFirstVisibleOffset:](v29, "setOldFirstVisibleOffset:", MinX - v33);

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v34 = objc_msgSend(v28, "shouldJustifyRow");
      else
        v34 = 0;
      -[TUICandidateLayout setShouldJustifyRow:](v29, "setShouldJustifyRow:", v34);
      -[TUICandidateLayout setColumnsCount:](v29, "setColumnsCount:", objc_msgSend(v28, "columnsCount"));
      -[TUICandidateLayout setLayoutOrientation:](v29, "setLayoutOrientation:", objc_msgSend(v28, "layoutOrientation"));
      objc_msgSend(v28, "gridPadding");
      -[TUICandidateLayout setGridPadding:](v29, "setGridPadding:");
      objc_msgSend(v28, "gridLinePadding");
      -[TUICandidateLayout setGridLinePadding:](v29, "setGridLinePadding:");
      v35 = objc_opt_respondsToSelector();
      v36 = 0.0;
      v37 = 0.0;
      if ((v35 & 1) != 0)
        objc_msgSend(v28, "interRowSpacing", 0.0);
      -[TUICandidateLayout setInterRowSpacing:](v29, "setInterRowSpacing:", v37);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v28, "slottedCandidatesIterItemSpacing");
        v36 = v38;
      }
      -[TUICandidateLayout setSlottedCandidatesIterItemSpacing:](v29, "setSlottedCandidatesIterItemSpacing:", v36);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v39 = objc_msgSend(v28, "hideSlottedCellSeparators");
      else
        v39 = 0;
      -[TUICandidateLayout setHideSlottedCellSeparators:](v29, "setHideSlottedCellSeparators:", v39);
      objc_msgSend(v28, "gridLineOffset");
      -[TUICandidateLayout setGridLineOffset:](v29, "setGridLineOffset:");
      if (a3 == 1)
      {
        -[TUICandidateGrid stylePending](self, "stylePending");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUICandidateGrid setStyle:reload:](self, "setStyle:reload:", v40, 0);

        v41 = objc_loadWeakRetained(location);
        objc_msgSend(v41, "setCollectionViewLayout:animated:", v29, 0);

        v42 = objc_loadWeakRetained(location);
        objc_msgSend(v42, "layoutIfNeeded");

        -[TUICandidateGrid forceUpdateVisibleCells](self, "forceUpdateVisibleCells");
        -[TUICandidateGrid firstVisibleIndexPath](self, "firstVisibleIndexPath");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = -[TUICandidateGrid indexPathIsValid:](self, "indexPathIsValid:", v43);

        if (v44)
        {
          -[TUICandidateGrid firstVisibleIndexPath](self, "firstVisibleIndexPath");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUICandidateGrid scrollToCandidateAtIndexPath:animated:](self, "scrollToCandidateAtIndexPath:animated:", v45, 0);

        }
        v46 = (void *)-[TUICandidateLayout copy](v29, "copy");
        objc_msgSend(v46, "setTransitionState:", 2);
        v47 = MEMORY[0x1E0C809B0];
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = __74__TUICandidateGrid_setRowType_options_style_animated_animator_completion___block_invoke;
        v62[3] = &unk_1E24FBE18;
        objc_copyWeak(&v64, location);
        v63 = v46;
        v48 = v46;
        objc_msgSend(v14, "addAnimations:", v62);
        v59[0] = v47;
        v59[1] = 3221225472;
        v59[2] = __74__TUICandidateGrid_setRowType_options_style_animated_animator_completion___block_invoke_2;
        v59[3] = &unk_1E24FB818;
        objc_copyWeak(&v61, location);
        v59[4] = self;
        v60 = v15;
        objc_msgSend(v14, "addCompletion:", v59);

        objc_destroyWeak(&v61);
        objc_destroyWeak(&v64);
      }
      else
      {
        v49 = (void *)-[TUICandidateLayout copy](v29, "copy");
        objc_msgSend(v49, "setTransitionState:", 2);
        v50 = objc_loadWeakRetained(location);
        objc_msgSend(v50, "setCollectionViewLayout:animated:", v49, 0);

        v51 = objc_loadWeakRetained(location);
        objc_msgSend(v51, "layoutIfNeeded");

        -[TUICandidateGrid forceUpdateVisibleCells](self, "forceUpdateVisibleCells");
        v52 = MEMORY[0x1E0C809B0];
        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = __74__TUICandidateGrid_setRowType_options_style_animated_animator_completion___block_invoke_3;
        v56[3] = &unk_1E24FBE18;
        objc_copyWeak(&v58, location);
        v57 = v29;
        objc_msgSend(v14, "addAnimations:", v56);
        v53[0] = v52;
        v53[1] = 3221225472;
        v53[2] = __74__TUICandidateGrid_setRowType_options_style_animated_animator_completion___block_invoke_4;
        v53[3] = &unk_1E24FB818;
        v53[4] = self;
        objc_copyWeak(&v55, location);
        v54 = v15;
        objc_msgSend(v14, "addCompletion:", v53);

        objc_destroyWeak(&v55);
        objc_destroyWeak(&v58);

      }
    }
    else
    {
      -[TUICandidateGrid setStyle:](self, "setStyle:", v13);
      v25 = objc_loadWeakRetained(location);
      -[TUICandidateGrid collectionViewLayout](self, "collectionViewLayout");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setCollectionViewLayout:", v26);

      -[TUICandidateGrid updateGradientLayerToCollectionView](self, "updateGradientLayerToCollectionView");
      -[TUICandidateGrid firstVisibleIndexPath](self, "firstVisibleIndexPath");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUICandidateGrid scrollToCandidateAtIndexPath:animated:](self, "scrollToCandidateAtIndexPath:animated:", v27, 0);

      -[TUICandidateGrid setFirstVisibleIndexPath:](self, "setFirstVisibleIndexPath:", 0);
      if (v15)
        (*((void (**)(id, uint64_t))v15 + 2))(v15, 1);
    }
    objc_destroyWeak(location);
  }

}

- (void)setCandidateNumberEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_candidateNumberEnabled = a3;
  -[TUICandidateGrid collectionViewLayout](self, "collectionViewLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCandidateNumberEnabled:", v3);

}

- (void)setCustomHeader:(id)a3
{
  UIView *v5;
  int64_t v6;
  void *v7;
  double Height;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIView *v14;
  CGRect v15;

  v5 = (UIView *)a3;
  v14 = v5;
  if (self->_customHeader != v5)
  {
    objc_storeStrong((id *)&self->_customHeader, a3);
    -[TUICandidateGrid updateContentInset](self, "updateContentInset");
    v5 = v14;
  }
  if (v5)
  {
    v6 = -[TUICandidateGrid rowType](self, "rowType");
    v5 = v14;
    if (v6 == 1)
    {
      -[TUICandidateGrid customHeader](self, "customHeader");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "frame");
      Height = CGRectGetHeight(v15);
      -[TUICandidateGrid collectionViewLayout](self, "collectionViewLayout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCustomHeaderHeight:", Height);

      -[TUICandidateGrid collectionViewLayout](self, "collectionViewLayout");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "invalidateLayout");

      -[TUICandidateGrid collectionView](self, "collectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "supplementaryViewForElementKind:atIndexPath:", CFSTR("CustomHeader"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSubview:", v14);

      v5 = v14;
    }
  }

}

- (UIEdgeInsets)safeAreaInsets
{
  void *v3;
  double MaxY;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  UIEdgeInsets result;

  -[TUICandidateGrid window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  MaxY = CGRectGetMaxY(v17);
  -[TUICandidateGrid window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateGrid bounds](self, "bounds");
  objc_msgSend(v5, "convertRect:fromView:", self);
  v6 = MaxY - CGRectGetMaxY(v18);

  v7 = *MEMORY[0x1E0DC49E8];
  v8 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v9 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[TUICandidateGrid window](self, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safeAreaInsets");
  v12 = fmax(v11 - fmax(v6, 0.0), 0.0);

  v13 = v7;
  v14 = v8;
  v15 = v12;
  v16 = v9;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)updateContentInset
{
  void *v3;
  double v4;
  double Height;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  char v35;
  double v36;
  double v37;
  char v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  id v47;
  CGRect v48;

  -[TUICandidateGrid collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentInset");

  v4 = 0.0;
  Height = 0.0;
  if (-[TUICandidateGrid rowType](self, "rowType"))
  {
    -[TUICandidateGrid customHeader](self, "customHeader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    Height = CGRectGetHeight(v48);

  }
  -[TUICandidateGrid collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentSize");
  v9 = v8;
  v11 = v10;

  -[TUICandidateGrid style](self, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "layoutOrientation");

  -[TUICandidateGrid style](self, "style");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rowHeight");
  v16 = v15;
  -[TUICandidateGrid firstIndexPath](self, "firstIndexPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (double)objc_msgSend(v17, "row");

  v19 = v11 - v16 * v18;
  if (v13)
    v20 = v9 - v16 * v18;
  else
    v20 = v9;
  if (v13)
    v21 = v11;
  else
    v21 = v19;
  if (-[TUICandidateGrid rowType](self, "rowType") == 1)
  {
    -[TUICandidateGrid collectionView](self, "collectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v24 = v23;

    if (v21 < v24)
    {
      -[TUICandidateGrid collectionView](self, "collectionView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "bounds");
      v4 = v26 - v21;

    }
  }
  v27 = 0.0;
  if (-[TUICandidateGrid rowType](self, "rowType") == 1)
  {
    -[TUICandidateGrid style](self, "style");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "layoutOrientation") == 1)
    {
      -[TUICandidateGrid collectionView](self, "collectionView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "bounds");
      v31 = v30;

      if (v20 >= v31)
        goto LABEL_17;
      -[TUICandidateGrid collectionView](self, "collectionView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "bounds");
      v27 = v32 - v20;
    }

  }
LABEL_17:
  -[TUICandidateGrid style](self, "style");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TUICandidateGrid style](self, "style");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "shouldUpdateCollectionViewWidthForArrowButtonVisibility");

  }
  else
  {
    v35 = 0;
  }

  v36 = 0.0;
  if (!-[TUICandidateGrid rowType](self, "rowType"))
  {
    -[TUICandidateGrid bounds](self, "bounds");
    v38 = v9 <= v37 ? 1 : v35;
    if ((v38 & 1) == 0)
    {
      -[TUICandidateGrid arrowButtonSize](self, "arrowButtonSize");
      v36 = v39;
    }
  }
  -[TUICandidateGrid style](self, "style");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TUICandidateGrid bounds](self, "bounds");
    v42 = v41;

    if (v9 <= v42)
      goto LABEL_30;
    -[TUICandidateGrid style](self, "style");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "widthOfGridGradient");
    v36 = v36 + v43;
  }

LABEL_30:
  -[TUICandidateGrid collectionView](self, "collectionView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setContentInset:", Height, v27, v4, v36);

  if (-[TUICandidateGrid rowType](self, "rowType"))
  {
    -[TUICandidateGrid arrowButtonSize](self, "arrowButtonSize");
    v46 = v45;
  }
  else
  {
    v46 = 0.0;
  }
  -[TUICandidateGrid collectionView](self, "collectionView");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setVerticalScrollIndicatorInsets:", v46, 0.0, 0.0, 0.0);

}

- (void)updateBounce
{
  int64_t v3;
  _BOOL8 v4;
  void *v5;
  id v6;

  v3 = -[TUICandidateGrid rowType](self, "rowType");
  if (v3 == 1)
  {
    -[TUICandidateGrid style](self, "style");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "layoutOrientation") == 0;
  }
  else
  {
    v4 = 0;
  }
  -[TUICandidateGrid collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlwaysBounceVertical:", v4);

  if (v3 == 1)
}

- (double)rowHeight
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  -[TUICandidateGrid style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowHeight");
  v5 = v4;

  -[TUICandidateGrid maximumRowHeight](self, "maximumRowHeight");
  if (v5 >= v6)
    v6 = v5;
  -[TUICandidateGrid setMaximumRowHeight:](self, "setMaximumRowHeight:", v6);
  -[TUICandidateGrid style](self, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowHeight");
  v9 = v8;

  return v9;
}

- (void)scrollToTop
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  -[TUICandidateGrid collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowsVerticalScrollIndicator:", 0);

  -[TUICandidateGrid style](self, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "layoutOrientation");

  if (v5 == 1)
  {
    -[TUICandidateGrid collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentSize");
    v8 = v7 + -1.0;
    v9 = 1.0;

  }
  else
  {
    v9 = 1.0;
    v8 = 0.0;
  }
  -[TUICandidateGrid collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scrollRectToVisible:animated:", 0, v8, 0.0, v9, v9);

  -[TUICandidateGrid collectionView](self, "collectionView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShowsVerticalScrollIndicator:", 1);

}

- (id)candidateAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[TUICandidateGrid indexPathIsValid:](self, "indexPathIsValid:", v4))
  {
    -[TUICandidateGrid candidateGroups](self, "candidateGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "candidates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)showingSlottedCandidates
{
  unint64_t v3;

  v3 = -[TUICandidateGrid slottedCandidatesCount](self, "slottedCandidatesCount");
  return v3 + -[TUICandidateGrid autofillExtraCandidatesCount](self, "autofillExtraCandidatesCount") != 0;
}

- (unint64_t)slottedCandidatesCount
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  unint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[TUICandidateGrid candidateGroups](self, "candidateGroups", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "isSlottedCandidate")
          && (objc_msgSend(v11, "isAutofillExtraCandidate") & 1) == 0)
        {
          v8 += objc_msgSend(v11, "isStickerCandidate") ^ 1;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  if (!-[TUICandidateGrid rowType](self, "rowType"))
  {
    -[TUICandidateGrid style](self, "style");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "maxNumberOfProactiveCells");

    if (v8 >= v13)
      return v13;
  }
  return v8;
}

- (unint64_t)autofillExtraCandidatesCount
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[TUICandidateGrid candidateGroups](self, "candidateGroups", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v7 += objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "isAutofillExtraCandidate");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CGSize)contentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  -[TUICandidateGrid collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSize");
  v5 = v4;
  v7 = v6;

  -[TUICandidateGrid firstIndexPath](self, "firstIndexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (double)objc_msgSend(v8, "row");
  -[TUICandidateGrid style](self, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowHeight");
  v12 = v11 * v9;

  v13 = 0.0;
  if (v12 < v7)
    v13 = v12;
  v14 = v7 - v13;
  v15 = v5;
  result.height = v14;
  result.width = v15;
  return result;
}

- (void)setIsArrowButtonVisible:(BOOL)a3
{
  self->_isArrowButtonVisible = a3;
  -[TUICandidateGrid updateCollectionViewFrameForArrowButton](self, "updateCollectionViewFrameForArrowButton");
}

- (void)updateCollectionViewFrameForArrowButton
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
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  -[TUICandidateGrid bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[TUICandidateGrid isArrowButtonVisible](self, "isArrowButtonVisible"))
  {
    -[TUICandidateGrid arrowButtonSize](self, "arrowButtonSize");
    v8 = v8 - v11;
  }
  -[TUICandidateGrid style](self, "style");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TUICandidateGrid style](self, "style");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "shouldUpdateCollectionViewWidthForArrowButtonVisibility") & 1) != 0)
    {
      -[TUICandidateGrid collectionView](self, "collectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "frame");
      v15 = v14;

      if (v8 == v15)
        return;
      -[TUICandidateGrid collectionView](self, "collectionView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFrame:", v4, v6, v8, v10);

      -[TUICandidateGrid collectionView](self, "collectionView");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "layoutIfNeeded");
    }
    else
    {

    }
  }

}

- (NSIndexPath)firstIndexPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  -[TUICandidateGrid candidateGroups](self, "candidateGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {

    goto LABEL_10;
  }
  -[TUICandidateGrid candidateGroups](self, "candidateGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
LABEL_10:
    v19 = 0;
    return (NSIndexPath *)v19;
  }
  v8 = -[TUICandidateGrid numberOfTransliterationCandidatesInSection:](self, "numberOfTransliterationCandidatesInSection:", 0);
  -[TUICandidateGrid style](self, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "skipInlineCandidate");

  if (v10)
  {
    -[TUICandidateGrid candidateGroups](self, "candidateGroups");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "candidates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v8 < v14)
    {
      -[TUICandidateGrid candidateGroups](self, "candidateGroups");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "candidates");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 += objc_msgSend(v18, "isInlineCandidate");

    }
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v8, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  return (NSIndexPath *)v19;
}

- (id)lastIndexPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  -[TUICandidateGrid candidateGroups](self, "candidateGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[TUICandidateGrid candidateGroups](self, "candidateGroups");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateGrid candidateGroups](self, "candidateGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(v5, "count") - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "candidates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (!v8)
    {
      v15 = 0;
      return v15;
    }
    v9 = (void *)MEMORY[0x1E0CB36B0];
    -[TUICandidateGrid candidateGroups](self, "candidateGroups");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateGrid candidateGroups](self, "candidateGroups");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(v10, "count") - 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "candidates");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count") - 1;
    -[TUICandidateGrid candidateGroups](self, "candidateGroups");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "indexPathForRow:inSection:", v13, objc_msgSend(v14, "count") - 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)setSelectedIndexPath:(id)a3
{
  -[TUICandidateGrid setSelectedIndexPath:animated:scrollPosition:](self, "setSelectedIndexPath:animated:scrollPosition:", a3, 0, 0);
}

- (void)setSelectedIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  _BOOL8 v6;
  NSIndexPath *v9;
  int v10;
  NSIndexPath *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSIndexPath *v23;
  _QWORD v24[5];

  v6 = a4;
  v9 = (NSIndexPath *)a3;
  v23 = v9;
  if (self->_selectedIndexPath != v9 || (v10 = -[NSIndexPath isEqual:](v9, "isEqual:", v9), v11 = v23, v10))
  {
    objc_storeStrong((id *)&self->_selectedIndexPath, a3);
    if (v23
      && -[TUICandidateGrid indexPathIsValid:](self, "indexPathIsValid:", v23)
      && (-[TUICandidateGrid collectionView](self, "collectionView"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "numberOfItemsInSection:", -[NSIndexPath section](v23, "section")),
          v14 = -[NSIndexPath row](v23, "row"),
          v12,
          v13 > v14))
    {
      -[TUICandidateGrid collectionView](self, "collectionView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "selectItemAtIndexPath:animated:scrollPosition:", v23, v6, a5);

      -[TUICandidateGrid collectionView](self, "collectionView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "layoutAttributesForItemAtIndexPath:", v23);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "frame");
      -[TUICandidateGrid setSelectedRowY:](self, "setSelectedRowY:", v18);
    }
    else
    {
      -[TUICandidateGrid collectionView](self, "collectionView", v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "indexPathsForSelectedItems");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[TUICandidateGrid collectionView](self, "collectionView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "deselectItemAtIndexPath:animated:", v17, 0);

      }
    }

    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __65__TUICandidateGrid_setSelectedIndexPath_animated_scrollPosition___block_invoke;
    v24[3] = &unk_1E24FC068;
    v24[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v24);
    -[TUICandidateGrid delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "candidateGridSelectionDidChange:", self);

    -[TUICandidateGrid didMoveHighlightFrame](self, "didMoveHighlightFrame");
    v11 = v23;
  }

}

- (BOOL)indexPathIsValid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  BOOL v12;

  v4 = a3;
  v5 = v4;
  if (!v4 || objc_msgSend(v4, "section") < 0 || objc_msgSend(v5, "row") < 0)
  {
    v12 = 0;
  }
  else
  {
    -[TUICandidateGrid candidateGroups](self, "candidateGroups");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    if (v7 <= objc_msgSend(v5, "section"))
    {
      v12 = 0;
    }
    else
    {
      -[TUICandidateGrid candidateGroups](self, "candidateGroups");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "candidates");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");
      v12 = v11 > objc_msgSend(v5, "row");

    }
  }

  return v12;
}

- (TIKeyboardCandidate)selectedCandidate
{
  void *v3;
  void *v4;

  -[TUICandidateGrid selectedIndexPath](self, "selectedIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateGrid candidateAtIndexPath:](self, "candidateAtIndexPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (TIKeyboardCandidate *)v4;
}

- (id)indexPathInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  unint64_t v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  uint64_t j;
  void *v51;
  double MinX;
  double v53;
  double MaxX;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *i;
  void *v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  void *v75;
  void *v76;
  double v77;
  CGFloat v78;
  double v79;
  CGFloat v80;
  double v81;
  CGFloat v82;
  double v83;
  CGFloat v84;
  double v85;
  double v87;
  void *v88;
  double v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  CGFloat v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;

  v5 = a3;
  v104 = *MEMORY[0x1E0C80C00];
  -[TUICandidateGrid selectedIndexPath](self, "selectedIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[TUICandidateGrid indexPathIsValid:](self, "indexPathIsValid:", v7))
    goto LABEL_63;
  if (a4)
  {
    if (a4 == 1)
    {
      -[TUICandidateGrid style](self, "style");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "layoutOrientation");

      -[TUICandidateGrid collectionView](self, "collectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "layoutAttributesForItemAtIndexPath:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "frame");
      v15 = v14;
      v17 = v16;
      if (v9 == 1)
      {
        v18 = v12;
        v19 = v13;

        -[TUICandidateGrid collectionView](self, "collectionView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "bounds");
        v22 = 1.0;
        if (v5)
          v22 = -1.0;
        v23 = v18 + v21 * v22;

        -[TUICandidateGrid collectionView](self, "collectionView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "collectionViewLayout");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "layoutAttributesForElementsInRect:", v23, v15, v19, v17);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "sortedArrayUsingComparator:", &__block_literal_global_47);
        v27 = (id)objc_claimAutoreleasedReturnValue();

        v100 = 0u;
        v101 = 0u;
        v98 = 0u;
        v99 = 0u;
        if (v5)
        {
          v28 = v27;
        }
        else
        {
          objc_msgSend(v27, "reverseObjectEnumerator");
          v28 = (id)objc_claimAutoreleasedReturnValue();
        }
        v67 = v28;
        v38 = (void *)objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v98, v103, 16);
        if (v38)
        {
          v68 = *(_QWORD *)v99;
          while (2)
          {
            for (i = 0; i != v38; i = (char *)i + 1)
            {
              if (*(_QWORD *)v99 != v68)
                objc_enumerationMutation(v67);
              v70 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)i);
              if (!objc_msgSend(v70, "representedElementCategory"))
              {
                objc_msgSend(v70, "frame");
                v112.origin.x = v71;
                v112.origin.y = v72;
                v112.size.width = v73;
                v112.size.height = v74;
                v107.origin.x = v23;
                v107.origin.y = v15;
                v107.size.width = v19;
                v107.size.height = v17;
                v108 = CGRectIntersection(v107, v112);
                if (v108.size.width > v19 * 0.25)
                {
                  objc_msgSend(v70, "indexPath", v108.origin.x, v108.origin.y);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_51;
                }
              }
            }
            v38 = (void *)objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v98, v103, 16);
            if (v38)
              continue;
            break;
          }
        }
LABEL_51:

      }
      else
      {

        v39 = -1.0;
        if (v5)
          v39 = 1.0;
        v40 = v15 + v17 * v39;
        -[TUICandidateGrid bounds](self, "bounds");
        v42 = v41;
        -[TUICandidateGrid collectionView](self, "collectionView");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "collectionViewLayout");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "layoutAttributesForElementsInRect:", 0.0, v40, v42, v17);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        v96 = 0u;
        v97 = 0u;
        v94 = 0u;
        v95 = 0u;
        v27 = v45;
        v46 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
        if (v46)
        {
          v47 = v46;
          v38 = 0;
          v48 = *(_QWORD *)v95;
          v49 = 1.79769313e308;
          while (2)
          {
            for (j = 0; j != v47; ++j)
            {
              if (*(_QWORD *)v95 != v48)
                objc_enumerationMutation(v27);
              v51 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * j);
              if (!objc_msgSend(v51, "representedElementCategory", (_QWORD)v94))
              {
                objc_msgSend(v51, "frame");
                MinX = CGRectGetMinX(v105);
                -[TUICandidateGrid lastUserSelectedCursorX](self, "lastUserSelectedCursorX");
                if (MinX < v53)
                {
                  objc_msgSend(v51, "frame");
                  MaxX = CGRectGetMaxX(v106);
                  -[TUICandidateGrid lastUserSelectedCursorX](self, "lastUserSelectedCursorX");
                  if (MaxX > v55)
                  {
                    objc_msgSend(v51, "indexPath");
                    v66 = objc_claimAutoreleasedReturnValue();

                    v38 = (void *)v66;
                    goto LABEL_53;
                  }
                }
                objc_msgSend(v51, "frame");
                UIRectGetCenter();
                v57 = v56;
                -[TUICandidateGrid lastUserSelectedCursorX](self, "lastUserSelectedCursorX");
                v59 = v57 - v58;
                if (v59 >= 0.0)
                  v60 = v59;
                else
                  v60 = -v59;
                if (v60 < v49)
                {
                  objc_msgSend(v51, "indexPath");
                  v61 = objc_claimAutoreleasedReturnValue();

                  v49 = v60;
                  v38 = (void *)v61;
                }
              }
            }
            v47 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
            if (v47)
              continue;
            break;
          }
        }
        else
        {
          v38 = 0;
        }
LABEL_53:

      }
    }
    else
    {
      v38 = 0;
    }
  }
  else
  {
    v29 = objc_msgSend(v7, "section");
    v30 = objc_msgSend(v7, "row");
    if (v5)
      v31 = v30 + 1;
    else
      v31 = v30 - 1;
    if ((v31 & 0x8000000000000000) != 0)
    {
      if (v29-- < 1)
      {
        v31 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        -[TUICandidateGrid candidateGroups](self, "candidateGroups");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "objectAtIndexedSubscript:", v29);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "candidates");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v65, "count") - 1;

      }
    }
    else
    {
      -[TUICandidateGrid candidateGroups](self, "candidateGroups");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectAtIndexedSubscript:", v29);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "candidates");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "count");

      if (v31 >= v35)
      {
        ++v29;
        -[TUICandidateGrid candidateGroups](self, "candidateGroups");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "count");

        if (v29 >= v37)
          v31 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v31 = 0;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v31, v29);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!-[TUICandidateGrid indexPathIsValid:](self, "indexPathIsValid:", v38, (_QWORD)v94))
  {

LABEL_63:
    v38 = 0;
    goto LABEL_64;
  }
  if (!a4 && v38)
  {
    -[TUICandidateGrid collectionView](self, "collectionView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "layoutAttributesForItemAtIndexPath:", v38);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "frame");
    v78 = v77;
    v80 = v79;
    v82 = v81;
    v84 = v83;

    v109.origin.x = v78;
    v109.origin.y = v80;
    v109.size.width = v82;
    v109.size.height = v84;
    if (CGRectGetMinX(v109) == 0.0)
    {
      v85 = 0.0;
    }
    else
    {
      v110.origin.x = v78;
      v110.origin.y = v80;
      v110.size.width = v82;
      v110.size.height = v84;
      v87 = CGRectGetMaxX(v110);
      -[TUICandidateGrid collectionView](self, "collectionView");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "bounds");
      v89 = CGRectGetMaxX(v111);

      v90 = v78;
      v91 = v80;
      v92 = v82;
      v93 = v84;
      if (v87 == v89)
        v85 = CGRectGetMaxX(*(CGRect *)&v90);
      else
        UIRectGetCenter();
    }
    -[TUICandidateGrid setLastUserSelectedCursorX:](self, "setLastUserSelectedCursorX:", v85);
  }
LABEL_64:

  return v38;
}

- (BOOL)indexPathIsFullyVisible:(id)a3 granularity:(int)a4
{
  id v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t i;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;
  CGRect v42;
  CGRect v43;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[TUICandidateGrid collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "visibleBounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[TUICandidateGrid arrowButtonSize](self, "arrowButtonSize");
  v17 = v16;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[TUICandidateGrid collectionView](self, "collectionView", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "indexPathsForVisibleItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v20)
  {
    v21 = v20;
    v22 = v13 - v17;
    v23 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v37 != v23)
          objc_enumerationMutation(v19);
        if (objc_msgSend(v6, "isEqual:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i)))
        {
          -[TUICandidateGrid collectionView](self, "collectionView");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "layoutAttributesForItemAtIndexPath:", v6);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          -[TUICandidateGrid style](self, "style");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[TUICandidateGrid style](self, "style");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "shouldScrollIfShowingLastVisibleRow");

            if (((a4 == 1) & v30) != 0)
              v15 = v15 + -1.0;
          }
          else
          {

          }
          objc_msgSend(v27, "frame");
          v43.origin.x = v31;
          v43.origin.y = v32;
          v43.size.width = v33;
          v43.size.height = v34;
          v42.origin.x = v9;
          v42.origin.y = v11;
          v42.size.width = v22;
          v42.size.height = v15;
          v25 = CGRectContainsRect(v42, v43);

          goto LABEL_16;
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v21)
        continue;
      break;
    }
  }
  v25 = 0;
LABEL_16:

  return v25;
}

- (BOOL)hasCandidateInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  -[TUICandidateGrid selectedIndexPath](self, "selectedIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TUICandidateGrid indexPathInForwardDirection:granularity:](self, "indexPathInForwardDirection:granularity:", v5, v4);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
  }
  else
  {
    -[TUICandidateGrid candidateGroups](self, "candidateGroups");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "count");
  }
  v10 = v8 != 0;

  return v10;
}

- (void)showCandidateInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  _BOOL4 v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v24;
  uint64_t v25;
  BOOL v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  char v30;
  id v31;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  -[TUICandidateGrid indexPathInForwardDirection:granularity:](self, "indexPathInForwardDirection:granularity:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[TUICandidateGrid selectedIndexPath](self, "selectedIndexPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      return;
    if (v5)
    {
      -[TUICandidateGrid firstIndexPath](self, "firstIndexPath");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[TUICandidateGrid style](self, "style");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "dontSelectLastItemByBackwardMoving");

      if ((v30 & 1) != 0)
        return;
      -[TUICandidateGrid lastIndexPath](self, "lastIndexPath");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v20;
    if (!v20)
      return;
  }
  -[TUICandidateGrid setSelectedIndexPath:animated:scrollPosition:](self, "setSelectedIndexPath:animated:scrollPosition:", v7, 0, 0);
  v31 = v7;
  -[TUICandidateGrid style](self, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "showOneMoreCandidate");

  v10 = v31;
  if (v9)
  {
    -[TUICandidateGrid indexPathInForwardDirection:granularity:](self, "indexPathInForwardDirection:granularity:", v5, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v12 = v11;
    else
      v12 = v31;
    v10 = v12;

  }
  if (!-[TUICandidateGrid indexPathIsFullyVisible:granularity:](self, "indexPathIsFullyVisible:granularity:", v10, v4))
  {
    if (-[TUICandidateGrid canExpandCandidateGrid](self, "canExpandCandidateGrid")
      && ((-[TUICandidateGrid style](self, "style"),
           v13 = (void *)objc_claimAutoreleasedReturnValue(),
           v14 = objc_msgSend(v13, "showOneMoreCandidate"),
           v13,
           !v14)
       || v5))
    {
      -[TUICandidateGrid delegate](self, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "candidateGridNeedsToExpand:", self);
    }
    else
    {
      -[TUICandidateGrid style](self, "style");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "showOneMoreCandidate");

      if (v16 && v5)
      {
        v17 = 1;
        v18 = 36;
      }
      else
      {
        -[TUICandidateGrid style](self, "style");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "layoutOrientation");
        v17 = (_DWORD)v4 != 1 || v22 != 1;

        if (v17)
          v18 = 9;
        else
          v18 = 33;
      }
      -[TUICandidateGrid style](self, "style");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "columnsCount");

      if ((_DWORD)v4)
        v26 = 0;
      else
        v26 = v25 == 1;
      v27 = !v26 && v17;
      -[TUICandidateGrid collectionView](self, "collectionView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "scrollToItemAtIndexPath:atScrollPosition:animated:", v10, v18, v27);
    }

  }
}

- (unint64_t)candidateNumberForIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v4 = a3;
  -[TUICandidateGrid style](self, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "layoutOrientation");

  if (v6 == 1)
    v7 = -[TUICandidateGrid candidateNumberInVerticalLayoutForIndexPath:](self, "candidateNumberInVerticalLayoutForIndexPath:", v4);
  else
    v7 = -[TUICandidateGrid candidateNumberInHorizontalLayoutForIndexPath:](self, "candidateNumberInHorizontalLayoutForIndexPath:", v4);
  v8 = v7;

  return v8;
}

- (BOOL)canExpandCandidateGrid
{
  void *v3;
  char v4;
  void *v5;

  -[TUICandidateGrid style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "scrollDisabled") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[TUICandidateGrid style](self, "style");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "allowCandidateGridExpanding");

  }
  return v4;
}

- (unint64_t)candidateNumberInHorizontalLayoutForIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  double MidY;
  void *v27;
  char v28;
  unint64_t v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;
  CGRect v37;
  CGRect v38;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUICandidateGrid style](self, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "columnsCount");

  -[TUICandidateGrid collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 == 1)
  {
    objc_msgSend(v7, "visibleBounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    -[TUICandidateGrid visibleAttributes](self, "visibleAttributes");
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = 0;
      v22 = *(_QWORD *)v32;
      while (2)
      {
        v23 = 0;
        v24 = v21 + v19;
        do
        {
          if (*(_QWORD *)v32 != v22)
            objc_enumerationMutation(v17);
          v25 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v23);
          objc_msgSend(v25, "frame", (_QWORD)v31);
          MidY = CGRectGetMidY(v37);
          v38.origin.x = v10;
          v38.origin.y = v12;
          v38.size.width = v14;
          v38.size.height = v16;
          if (MidY < CGRectGetMinY(v38))
            ++v20;
          objc_msgSend(v25, "indexPath");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "isEqual:", v4);

          if ((v28 & 1) != 0)
          {
            v24 = v21 + v23;
            goto LABEL_16;
          }
          ++v23;
        }
        while (v19 != v23);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        v21 = v24;
        if (v19)
          continue;
        break;
      }
    }
    else
    {
      v20 = 0;
      v24 = 0;
    }
LABEL_16:

    v29 = v24 - v20 + 1;
  }
  else
  {
    objc_msgSend(v7, "layoutAttributesForItemAtIndexPath:", v4);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    v29 = objc_msgSend(v17, "candidateNumber");
  }

  return v29;
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

  -[TUICandidateGrid collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[TUICandidateGrid collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "collectionViewLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutAttributesForElementsInRect:", v5, v7, v9, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_52);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "filteredArrayUsingPredicate:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "sortedArrayUsingComparator:", &__block_literal_global_53);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (unint64_t)candidateNumberInVerticalLayoutForIndexPath:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  double MidX;
  void *v24;
  char v25;
  unint64_t v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  CGRect v34;
  CGRect v35;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[TUICandidateGrid candidateNumberEnabled](self, "candidateNumberEnabled"))
  {
    -[TUICandidateGrid collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visibleBounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    -[TUICandidateGrid visibleAttributes](self, "visibleAttributes");
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = 0;
      v19 = *(_QWORD *)v29;
      while (2)
      {
        v20 = 0;
        v21 = v18 + v16;
        do
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v14);
          v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v20);
          objc_msgSend(v22, "frame", (_QWORD)v28);
          MidX = CGRectGetMidX(v34);
          v35.origin.x = v7;
          v35.origin.y = v9;
          v35.size.width = v11;
          v35.size.height = v13;
          if (MidX > CGRectGetMaxX(v35))
            ++v17;
          objc_msgSend(v22, "indexPath");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "isEqual:", v4);

          if ((v25 & 1) != 0)
          {
            v21 = v18 + v20;
            goto LABEL_16;
          }
          ++v20;
        }
        while (v16 != v20);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        v18 = v21;
        if (v16)
          continue;
        break;
      }
    }
    else
    {
      v17 = 0;
      v21 = 0;
    }
LABEL_16:

    v26 = v21 - v17 + 1;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)indexPathForVerticalCandidateNumber:(unint64_t)a3
{
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  double MidX;
  double v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v31 = *MEMORY[0x1E0C80C00];
  -[TUICandidateGrid collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleBounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[TUICandidateGrid visibleAttributes](self, "visibleAttributes");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v15)
  {
    v16 = 0;
    v17 = 0;
    v18 = *(_QWORD *)v27;
    v19 = a3 - 1;
    while (2)
    {
      v20 = 0;
      v21 = v19 - v16;
      v16 += v15;
      do
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v14);
        v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v20);
        objc_msgSend(v22, "frame", (_QWORD)v26);
        MidX = CGRectGetMidX(v32);
        v33.origin.x = v7;
        v33.origin.y = v9;
        v33.size.width = v11;
        v33.size.height = v13;
        if (MidX > CGRectGetMaxX(v33))
          ++v17;
        if (v21 + v17 == v20)
        {
          objc_msgSend(v22, "frame");
          v24 = CGRectGetMidX(v34);
          v35.origin.x = v7;
          v35.origin.y = v9;
          v35.size.width = v11;
          v35.size.height = v13;
          if (v24 > CGRectGetMinX(v35))
          {
            objc_msgSend(v22, "indexPath");
            v15 = objc_claimAutoreleasedReturnValue();
            goto LABEL_14;
          }
        }
        ++v20;
      }
      while (v15 != v20);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_14:

  return (id)v15;
}

- (id)indexPathForCandidateNumber:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
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
  if (a3 - 1 <= 8)
  {
    -[TUICandidateGrid style](self, "style");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "layoutOrientation");

    if (v6 == 1)
    {
      -[TUICandidateGrid indexPathForVerticalCandidateNumber:](self, "indexPathForVerticalCandidateNumber:", a3);
      return (id)objc_claimAutoreleasedReturnValue();
    }
    if (-[TUICandidateGrid rowType](self, "rowType") == 1
      && (-[TUICandidateGrid style](self, "style"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "columnsCount"),
          v8,
          v9 == 1))
    {
      -[TUICandidateGrid visibleAttributes](self, "visibleAttributes");
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v32;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v32 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            objc_msgSend(v15, "indexPath");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = -[TUICandidateGrid candidateNumberInVerticalLayoutForIndexPath:](self, "candidateNumberInVerticalLayoutForIndexPath:", v16);

            if (v17 == a3)
            {
              objc_msgSend(v15, "indexPath");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:

              return v26;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
          if (v12)
            continue;
          break;
        }
      }

      v18 = 0;
    }
    else
    {
      -[TUICandidateGrid indexPathsForSelectedRow](self, "indexPathsForSelectedRow");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = v18;
    v19 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v28;
      while (2)
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v10);
          v23 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
          -[TUICandidateGrid collectionView](self, "collectionView", (_QWORD)v27);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "layoutAttributesForItemAtIndexPath:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v25, "candidateNumber") == a3)
          {
            objc_msgSend(v25, "indexPath");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_28;
          }

        }
        v20 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v20)
          continue;
        break;
      }
    }

  }
  return 0;
}

- (id)indexPathsInTheRowThatContainsFrame:(CGRect)a3
{
  double height;
  double y;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  height = a3.size.height;
  y = a3.origin.y;
  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3.origin.x, a3.origin.y, a3.size.width);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateGrid collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[TUICandidateGrid collectionView](self, "collectionView", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionViewLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutAttributesForElementsInRect:", 0.0, y, v9, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (!objc_msgSend(v17, "representedElementCategory"))
        {
          objc_msgSend(v17, "indexPath");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v18);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  return v6;
}

- (id)indexPathsForSelectedRow
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[TUICandidateGrid selectedIndexPath](self, "selectedIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 && -[TUICandidateGrid indexPathIsValid:](self, "indexPathIsValid:", v3)
     || (objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0),
         v4 = objc_claimAutoreleasedReturnValue(),
         v3,
         (v3 = (void *)v4) != 0))
    && -[TUICandidateGrid indexPathIsValid:](self, "indexPathIsValid:", v3))
  {
    -[TUICandidateGrid collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutAttributesForItemAtIndexPath:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "frame");
    -[TUICandidateGrid indexPathsInTheRowThatContainsFrame:](self, "indexPathsInTheRowThatContainsFrame:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (id)indexPathForCandidate:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[TUICandidateGrid candidateGroups](self, "candidateGroups", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (char *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = 0;
      v8 = *(_QWORD *)v16;
      while (2)
      {
        v9 = 0;
        v10 = &v6[(_QWORD)v7];
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v9), "candidates");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            v13 = objc_msgSend(v11, "indexOfObject:", v4);
            if (v13 != 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v13, &v9[(_QWORD)v7]);
              v6 = (char *)objc_claimAutoreleasedReturnValue();

              goto LABEL_14;
            }
          }

          ++v9;
        }
        while (v6 != v9);
        v6 = (char *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v7 = v10;
        if (v6)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)viewOffsetForCandidate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t MinX;
  CGRect v9;

  -[TUICandidateGrid indexPathForCandidate:](self, "indexPathForCandidate:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TUICandidateGrid collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutAttributesForItemAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "frame");
    MinX = (uint64_t)CGRectGetMinX(v9);

  }
  else
  {
    MinX = 0x7FFFFFFFFFFFFFFFLL;
  }

  return MinX;
}

- (int64_t)rowForCandidate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[TUICandidateGrid indexPathForCandidate:](self, "indexPathForCandidate:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TUICandidateGrid collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutAttributesForItemAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "row");
  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (BOOL)handleNumberKey:(unint64_t)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;

  -[TUICandidateGrid indexPathForCandidateNumber:](self, "indexPathForCandidateNumber:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TUICandidateGrid indexPathIsValid:](self, "indexPathIsValid:", v4);
  if (v5)
  {
    -[TUICandidateGrid candidateAtIndexPath:](self, "candidateAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateGrid setSelectedIndexPath:](self, "setSelectedIndexPath:", v4);
    -[TUICandidateGrid delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "candidateGrid:didAcceptCandidate:atIndexPath:", self, v6, v4);

  }
  return v5;
}

- (void)updateSelectedRowHighlightView
{
  void *v3;
  void *v4;
  void *v5;
  double Width;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  double MinX;
  double MinY;
  CGFloat v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v29 = *MEMORY[0x1E0C80C00];
  -[TUICandidateGrid style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "highlightedRowBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TUICandidateGrid indexPathsForSelectedRow](self, "indexPathsForSelectedRow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateGrid bounds](self, "bounds");
    Width = CGRectGetWidth(v30);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          -[TUICandidateGrid collectionView](self, "collectionView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "layoutAttributesForItemAtIndexPath:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "frame");
          MinX = CGRectGetMinX(v31);
          if (Width >= MinX)
            Width = MinX;
          objc_msgSend(v14, "frame");
          MinY = CGRectGetMinY(v32);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v9);
    }
    else
    {
      MinY = 0.0;
    }

    -[TUICandidateGrid bounds](self, "bounds");
    v17 = CGRectGetWidth(v33) - Width;
    -[TUICandidateGrid style](self, "style");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "rowHeight");
    v20 = v19;

    -[TUICandidateGrid selectedRowHighlightView](self, "selectedRowHighlightView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFrame:", Width, MinY, v17, v20);

    -[TUICandidateGrid selectedRowHighlightView](self, "selectedRowHighlightView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHidden:", 0);

  }
  else
  {
    -[TUICandidateGrid selectedRowHighlightView](self, "selectedRowHighlightView");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setHidden:", 1);

  }
}

- (void)scrollToCandidateAtIndexPath:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  uint64_t v17;
  double MaxX;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  int64_t v28;
  void *v30;
  double v31;
  double Width;
  double v33;
  double v34;
  void *v35;
  BOOL IsEmpty;
  double v37;
  double v38;
  double v39;
  id v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v4 = a4;
  v40 = a3;
  -[TUICandidateGrid collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutAttributesForItemAtIndexPath:", v40);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[TUICandidateGrid style](self, "style");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "layoutOrientation");

  if (v17)
  {
    v41.origin.x = v9;
    v41.origin.y = v11;
    v41.size.width = v13;
    v41.size.height = v15;
    MaxX = CGRectGetMaxX(v41);
    -[TUICandidateGrid collectionView](self, "collectionView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    v21 = MaxX - v20;

    v11 = 0.0;
  }
  else
  {
    if (objc_msgSend(v40, "section") || objc_msgSend(v40, "item"))
    {
      v22 = v9;
    }
    else
    {
      v42.origin.x = v9;
      v42.origin.y = v11;
      v42.size.width = v13;
      v42.size.height = v15;
      v31 = CGRectGetMaxX(v42);
      -[TUICandidateGrid bounds](self, "bounds");
      Width = CGRectGetWidth(v43);
      -[TUICandidateGrid arrowButtonSize](self, "arrowButtonSize");
      v34 = Width - v33;
      v22 = 0.0;
      if (v31 > v34
        && !-[TUICandidateGrid rowType](self, "rowType")
        && !-[TUICandidateGrid showingSlottedCandidates](self, "showingSlottedCandidates"))
      {
        -[TUICandidateGrid collectionView](self, "collectionView");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "bounds");
        IsEmpty = CGRectIsEmpty(v44);

        if (!IsEmpty)
        {
          v45.origin.x = v9;
          v45.origin.y = v11;
          v45.size.width = v13;
          v45.size.height = v15;
          v37 = CGRectGetMaxX(v45);
          -[TUICandidateGrid bounds](self, "bounds");
          v38 = v37 - CGRectGetWidth(v46);
          -[TUICandidateGrid arrowButtonSize](self, "arrowButtonSize");
          v22 = v38 + v39;
        }
      }
    }
    -[TUICandidateGrid style](self, "style");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "rowHeight");
    if (v11 >= v24)
    {

    }
    else
    {
      -[TUICandidateGrid style](self, "style");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "gridLinePadding");
      v27 = v26;

      if (v27 == 0.0)
        v11 = 0.0;
    }
    v28 = -[TUICandidateGrid rowType](self, "rowType");
    if (v22 < 0.0 || v28 == 1)
      v21 = 0.0;
    else
      v21 = v22;
  }
  -[TUICandidateGrid collectionView](self, "collectionView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setContentOffset:animated:", v4, v21, v11);

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
  -[TUICandidateGrid collectionView](self, "collectionView", 0);
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
        -[TUICandidateGrid collectionView](self, "collectionView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cellForItemAtIndexPath:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[TUICandidateGrid collectionView](self, "collectionView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUICandidateGrid collectionView:willDisplayCell:forItemAtIndexPath:](self, "collectionView:willDisplayCell:forItemAtIndexPath:", v12, v11, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)updateGradientLayerToCollectionView
{
  double v3;
  double v4;
  double Width;
  void *v6;
  double v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  _QWORD v18[3];
  CGRect v19;

  v18[2] = *MEMORY[0x1E0C80C00];
  -[TUICandidateGrid contentSize](self, "contentSize");
  v4 = v3;
  -[TUICandidateGrid frame](self, "frame");
  Width = CGRectGetWidth(v19);
  -[TUICandidateGrid style](self, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ((objc_msgSend(v6, "widthOfGridGradient"), v7 > 0.0) ? (v8 = v4 <= Width) : (v8 = 1), v8))
  {
    -[UICollectionView layer](self->_collectionView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMask:", 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView bounds](self->_collectionView, "bounds");
    objc_msgSend(v10, "setFrame:");
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18[0] = objc_msgSend(v11, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18[1] = objc_msgSend(v12, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setColors:", v13);

    objc_msgSend(v10, "setLocations:", &unk_1E25177F8);
    -[UICollectionView frame](self->_collectionView, "frame");
    v15 = v14;
    objc_msgSend(v6, "widthOfGridGradient");
    objc_msgSend(v10, "setStartPoint:", (v15 - v16) / v15, 0.5);
    objc_msgSend(v10, "setEndPoint:", 1.0, 0.5);
    -[UICollectionView layer](self->_collectionView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setMask:", v10);

  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  _BOOL8 v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  CGSize result;

  v8 = a3;
  v9 = a4;
  -[TUICandidateGrid candidateAtIndexPath:](self, "candidateAtIndexPath:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isSlottedCandidate") || (objc_msgSend(v10, "isStickerCandidate") & 1) != 0)
  {
    -[TUICandidateGrid rowHeight](self, "rowHeight");
    v12 = v11;
    if (objc_msgSend(v9, "rowType") != 1 || objc_msgSend(v9, "transitionState") != 1)
    {
LABEL_18:
      if (objc_msgSend(v10, "isStickerCandidate"))
      {
        -[TUICandidateGrid style](self, "style");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "minimumCellWidth");
        v20 = v26;

        if (v12 >= v20)
          v20 = v12;
      }
      else
      {
        v27 = -[TUICandidateGrid candidateNumberEnabled](self, "candidateNumberEnabled");
        -[TUICandidateGrid style](self, "style");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[TUICandidateCell widthForCandidate:showCandidateNumber:style:](TUICandidateCell, "widthForCandidate:showCandidateNumber:style:", v10, v27, v28);
        v20 = v29;

      }
      goto LABEL_23;
    }
    if (-[TUICandidateGrid rowType](self, "rowType"))
    {
      -[TUICandidateGrid style](self, "style");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[TUICandidateGrid stylePending](self, "stylePending");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        -[TUICandidateGrid style](self, "style");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "rowHeight");
        v24 = v33;

        v22 = 0;
LABEL_16:

        if (v24 > 0.0)
          v12 = v24;
        goto LABEL_18;
      }
    }
    v22 = v13;
    objc_msgSend(v13, "rowHeight");
    v24 = v23;
    goto LABEL_16;
  }
  v14 = -[TUICandidateGrid slottedCandidatesCount](self, "slottedCandidatesCount");
  -[TUICandidateGrid style](self, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "maxNumberOfProactiveCells");

  if (v16 >= v14)
    v17 = v14;
  else
    v17 = v16;
  if (v17 <= 1)
    v18 = 1;
  else
    v18 = v17;
  objc_msgSend(v8, "bounds");
  v20 = v19 / (double)v18;
  -[TUICandidateGrid rowHeight](self, "rowHeight");
  v12 = v21;
LABEL_23:

  v30 = v20;
  v31 = v12;
  result.height = v31;
  result.width = v30;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 widthForGroupHeaderInSection:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;

  -[TUICandidateGrid candidateGroups](self, "candidateGroups", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length"))
  {
    -[TUICandidateGrid style](self, "style");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "candidateFont");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tui_optimizedSizeWithFont:", v11);
    v13 = v12 + 20.0;

    -[TUICandidateGrid style](self, "style");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[TUICandidateGrid style](self, "style");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "groupHeaderPadding");
      v13 = v13 + v16;

    }
  }
  else
  {
    v13 = 0.0;
  }

  return v13;
}

- (void)scrollViewDidChangeContentSize:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[TUICandidateGrid updateContentInset](self, "updateContentInset");
  -[TUICandidateGrid updateGradientLayerToCollectionView](self, "updateGradientLayerToCollectionView");
  -[TUICandidateGrid delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[TUICandidateGrid delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentSize");
    objc_msgSend(v6, "candidateGrid:didChangeContentSize:", self);

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  double x;
  double y;
  double width;
  double height;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  char v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUICandidateGrid collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleSupplementaryViewsOfKind:", CFSTR("GroupHeader"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUICandidateGrid collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentOffset");
  v9 = v8;
  v11 = v10;
  -[TUICandidateGrid collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v17 = v6;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v43 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v22, "frame", (_QWORD)v42);
        v51.origin.x = v9;
        v51.origin.y = v11;
        v51.size.width = v14;
        v51.size.height = v16;
        v49 = CGRectIntersection(v48, v51);
        x = v49.origin.x;
        y = v49.origin.y;
        width = v49.size.width;
        height = v49.size.height;
        if (!CGRectIsNull(v49))
        {
          v50.origin.x = x;
          v50.origin.y = y;
          v50.size.width = width;
          v50.size.height = height;
          if (!CGRectIsEmpty(v50))
          {
            -[TUICandidateGrid collectionView](self, "collectionView");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "convertRect:fromView:", v27, x, y, width, height);
            v29 = v28;
            v31 = v30;
            v33 = v32;
            v35 = v34;

            objc_msgSend(v22, "setVisibleBounds:", v29, v31, v33, v35);
          }
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v19);
  }

  -[TUICandidateGrid style](self, "style");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v36, "layoutOrientation") == 1)
  {

LABEL_15:
    -[TUICandidateGrid forceUpdateVisibleCells](self, "forceUpdateVisibleCells", (_QWORD)v42);
    goto LABEL_17;
  }
  if (-[TUICandidateGrid candidateNumberEnabled](self, "candidateNumberEnabled"))
  {
    -[TUICandidateGrid style](self, "style");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "columnsCount");

    if (v38 != 1)
      goto LABEL_17;
    goto LABEL_15;
  }

LABEL_17:
  -[TUICandidateGrid delegate](self, "delegate", (_QWORD)v42);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_opt_respondsToSelector();

  if ((v40 & 1) != 0)
  {
    -[TUICandidateGrid delegate](self, "delegate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "scrollViewDidScroll:", v4);

  }
  -[TUICandidateGrid updateGradientLayerToCollectionView](self, "updateGradientLayerToCollectionView");

}

- (BOOL)respondsToSelector:(SEL)a3
{
  BOOL v5;
  void *v6;
  char v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TUICandidateGrid;
  if (-[TUICandidateGrid respondsToSelector:](&v10, sel_respondsToSelector_))
    return 1;
  -[TUICandidateGrid delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
    return 0;
  NSStringFromSelector(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "rangeOfString:options:", CFSTR("scrollView"), 1) != 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  double y;
  CGFloat x;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  objc_msgSend(a3, "collectionViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateGrid firstVisibleIndexPath](self, "firstVisibleIndexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && -[TUICandidateGrid indexPathIsValid:](self, "indexPathIsValid:", v8))
  {
    -[TUICandidateGrid firstVisibleIndexPath](self, "firstVisibleIndexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutAttributesForItemAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    x = v11;
    y = v12;

    if (objc_msgSend(v7, "rowType") == 1)
    {
      -[TUICandidateGrid style](self, "style");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "rowHeight");
      v15 = v14;

      if (y < v15)
        y = 0.0;
      x = 0.0;
    }
    else
    {
      y = 0.0;
    }
  }

  v16 = x;
  v17 = y;
  result.y = v17;
  result.x = v16;
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
  -[TUICandidateGrid delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[TUICandidateGrid delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateGrid candidateAtIndexPath:](self, "candidateAtIndexPath:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "candidateGrid:didAcceptCandidate:atIndexPath:", self, v8, v9);

  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int64_t v24;
  _BOOL4 v25;
  void *v26;
  uint64_t v27;
  void *v29;
  id v30;

  v30 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v8;
    objc_msgSend(v30, "layoutAttributesForItemAtIndexPath:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateGrid style](self, "style");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "showExtraLineBeforeFirstRow");

    objc_msgSend(v11, "frame");
    v15 = v14;
    -[TUICandidateGrid selectedRowY](self, "selectedRowY");
    if (v15 == v16)
    {
      -[TUICandidateGrid selectedIndexPath](self, "selectedIndexPath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17 != 0;

    }
    else
    {
      v18 = 0;
    }
    objc_msgSend(v10, "setRowSelected:", v18);
    -[TUICandidateGrid selectedIndexPath](self, "selectedIndexPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSelected:", objc_msgSend(v19, "isEqual:", v9));

    if (-[TUICandidateGrid candidateNumberEnabled](self, "candidateNumberEnabled"))
    {
      -[TUICandidateGrid style](self, "style");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "layoutOrientation");

      if (v21 == 1)
      {
        v22 = 1;
      }
      else
      {
        v24 = -[TUICandidateGrid rowType](self, "rowType");
        v25 = v24 == 0;
        if (-[TUICandidateGrid rowType](self, "rowType") == 1)
        {
          -[TUICandidateGrid style](self, "style");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "columnsCount");

          v25 = v27 == 1 || v24 == 0;
        }
        v22 = v18 | v25;
        -[TUICandidateGrid selectedIndexPath](self, "selectedIndexPath");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {

        }
        else if (objc_msgSend(v11, "row") == v13)
        {
          v22 = 1;
        }
        else
        {
          v22 = v22;
        }
      }
      objc_msgSend(v10, "setShouldShowCandidateNumber:", v22);
      v23 = -[TUICandidateGrid candidateNumberForIndexPath:](self, "candidateNumberForIndexPath:", v9);
    }
    else
    {
      objc_msgSend(v10, "setShouldShowCandidateNumber:", 0);
      v23 = 0;
    }
    objc_msgSend(v10, "setCandidateNumber:", v23);

  }
}

- (void)setSlottedSeparatorHidden:(BOOL)a3 inCollectionView:(id)a4 nearHighlightItemAtIndexPath:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;
  CGRect v40;
  CGRect v41;

  v6 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = -[TUICandidateGrid slottedCandidatesCount](self, "slottedCandidatesCount");
  if (v10 + -[TUICandidateGrid autofillExtraCandidatesCount](self, "autofillExtraCandidatesCount"))
  {
    objc_msgSend(v8, "cellForItemAtIndexPath:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");

    UIRectInset();
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v8, "subviews", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v35;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v35 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v24);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v25, "frame");
            v41.origin.x = v26;
            v41.origin.y = v27;
            v41.size.width = v28;
            v41.size.height = v29;
            v40.origin.x = v13;
            v40.origin.y = v15;
            v40.size.width = v17;
            v40.size.height = v19;
            if (CGRectIntersectsRect(v40, v41))
              objc_msgSend(v25, "setHidden:", v6);
          }
          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v22);
    }

    -[TUICandidateGrid delegate](self, "delegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_opt_respondsToSelector();

    if ((v31 & 1) != 0)
    {
      -[TUICandidateGrid delegate](self, "delegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (!v6)
      {
        v13 = *MEMORY[0x1E0C9D628];
        v15 = *(double *)(MEMORY[0x1E0C9D628] + 8);
        v17 = *(double *)(MEMORY[0x1E0C9D628] + 16);
        v19 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      }
      objc_msgSend(v32, "candidateGrid:didMoveHighlightFrame:", self, v13, v15, v17, v19);

    }
  }

}

- (void)didMoveHighlightFrame
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;

  -[TUICandidateGrid delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[TUICandidateGrid collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPathsForSelectedItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v22 = (id)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[TUICandidateGrid collectionView](self, "collectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "layoutAttributesForItemAtIndexPath:", v22);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "frame");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;

      -[TUICandidateGrid collectionView](self, "collectionView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "contentOffset");
      v19 = v18;

      v20 = v10 - v19;
    }
    else
    {
      v20 = *MEMORY[0x1E0C9D628];
      v12 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v14 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v16 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    }
    -[TUICandidateGrid delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "candidateGrid:didMoveHighlightFrame:", self, v20, v12, v14, v16);

  }
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  -[TUICandidateGrid setSlottedSeparatorHidden:inCollectionView:nearHighlightItemAtIndexPath:](self, "setSlottedSeparatorHidden:inCollectionView:nearHighlightItemAtIndexPath:", 1, a3, a4);
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  -[TUICandidateGrid setSlottedSeparatorHidden:inCollectionView:nearHighlightItemAtIndexPath:](self, "setSlottedSeparatorHidden:inCollectionView:nearHighlightItemAtIndexPath:", 0, a3, a4);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[TUICandidateGrid didMoveHighlightFrame](self, "didMoveHighlightFrame", a3);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  int64_t v4;

  -[TUICandidateGrid candidateGroups](self, "candidateGroups", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  unint64_t v6;
  int64_t v7;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;

  v6 = -[TUICandidateGrid slottedCandidatesCount](self, "slottedCandidatesCount", a3);
  v7 = -[TUICandidateGrid autofillExtraCandidatesCount](self, "autofillExtraCandidatesCount") + v6;
  if (v7)
    return v7;
  -[TUICandidateGrid style](self, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hidesPartialCandidates");

  if (v10)
  {
    v7 = -[TUICandidateGrid numberOfNonPartialCandidatesInSection:](self, "numberOfNonPartialCandidatesInSection:", a4);
    v11 = v7
        - -[TUICandidateGrid numberOfTransliterationCandidatesInSection:](self, "numberOfTransliterationCandidatesInSection:", a4);
    -[TUICandidateGrid style](self, "style");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "minimumNumberOfCandidates");

    if (v11 >= v13)
      return v7;
  }
  -[TUICandidateGrid candidateGroups](self, "candidateGroups");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "candidates");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  return v17;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  __objc2_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  -[TUICandidateGrid candidateAtIndexPath:](self, "candidateAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isSecureContentCandidate"))
  {
    +[TUIProactiveCandidateCell reuseIdentifier](TUIProactiveCandidateCell, "reuseIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v9, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[TUICandidateGrid style](self, "style");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setStyle:", v11);

    objc_msgSend(v10, "setCandidate:", v8);
  }
  else
  {
    if (objc_msgSend(v8, "isAutofillExtraCandidate"))
    {
      v12 = TUIAutofillExtraCandidateCell;
    }
    else
    {
      if (!objc_msgSend((id)objc_opt_class(), "isSafariPasswordSuggestionCandidate:", v8))
      {
        +[TUICandidateCell reuseIdentifier](TUICandidateCell, "reuseIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v15, v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[TUICandidateGrid style](self, "style");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setStyle:", v17);

        -[TUICandidateGrid maximumRowHeight](self, "maximumRowHeight");
        objc_msgSend(v16, "setMinimumTextLabelHeight:");
        objc_msgSend(v16, "setCandidate:", v8);
        -[TUICandidateGrid style](self, "style");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setAlignment:", objc_msgSend(v18, "cellTextAlignment"));

        -[TUICandidateGrid selectedIndexPath](self, "selectedIndexPath");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setSelected:", objc_msgSend(v7, "isEqual:", v19));

        v20 = (void *)MEMORY[0x1E0DC3F10];
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __58__TUICandidateGrid_collectionView_cellForItemAtIndexPath___block_invoke;
        v22[3] = &unk_1E24FC068;
        v10 = v16;
        v23 = v10;
        objc_msgSend(v20, "performWithoutAnimation:", v22);

        goto LABEL_9;
      }
      v12 = TUISuggestionCandidateCell;
    }
    -[__objc2_class reuseIdentifier](v12, "reuseIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v13, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setCandidate:", v8);
    -[TUICandidateGrid style](self, "style");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setStyle:", v14);

  }
LABEL_9:

  return v10;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  void *v5;
  id v9;
  id v10;
  id v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("Line")))
  {
    +[TUICandidateLine reuseIdentifier](TUICandidateLine, "reuseIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("Line");
LABEL_3:
    objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v13, v12, v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[TUICandidateGrid style](self, "style");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStyle:", v14);
LABEL_12:

    goto LABEL_13;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("GroupHeader")))
  {
    +[TUICandidateGroupHeader reuseIdentifier](TUICandidateGroupHeader, "reuseIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", CFSTR("GroupHeader"), v15, v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[TUICandidateGrid style](self, "style");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStyle:", v16);

    -[TUICandidateGrid style](self, "style");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlignment:", objc_msgSend(v17, "cellTextAlignment"));

    -[TUICandidateGrid candidateGroups](self, "candidateGroups");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v11, "section"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "title");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v19);

    goto LABEL_12;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("CustomHeader")))
  {
    objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", CFSTR("CustomHeader"), CFSTR("CustomHeader"), v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subviews");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeFromSuperview");

    -[TUICandidateGrid customHeader](self, "customHeader");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v14);
    goto LABEL_12;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("SlottedCellSeparator")))
  {
    +[TUICandidateSlottedSeparator reuseIdentifier](TUICandidateSlottedSeparator, "reuseIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("SlottedCellSeparator");
    goto LABEL_3;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("DummyCandidate")))
  {
    objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", CFSTR("DummyCandidate"), CFSTR("DummyCandidate"), v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateGrid style](self, "style");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStyle:", v22);

    -[TUICandidateGrid candidateAtIndexPath:](self, "candidateAtIndexPath:", v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCandidate:", v23);

    -[TUICandidateGrid selectedIndexPath](self, "selectedIndexPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSelected:", objc_msgSend(v11, "isEqual:", v14));
    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

- (id)_sectionIndexTitlesForCollectionView:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[TUICandidateGrid style](self, "style", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showsIndex");

  if (!v5)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[TUICandidateGrid candidateGroups](self, "candidateGroups", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
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
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "title");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "length");

        if (v14)
        {
          objc_msgSend(v12, "title");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v15);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
    v16 = v6;
  else
    v16 = 0;
  v17 = v16;

  return v17;
}

- (id)_collectionView:(id)a3 indexPathForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, a5);
}

- (int64_t)numberOfTransliterationCandidatesInSection:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[TUICandidateGrid candidateGroups](self, "candidateGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 > a3)
  {
    -[TUICandidateGrid candidateGroups](self, "candidateGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "candidates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__TUICandidateGrid_numberOfTransliterationCandidatesInSection___block_invoke;
    v12[3] = &unk_1E24FB8E0;
    v12[4] = &v13;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

  }
  v10 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (int64_t)numberOfNonPartialCandidatesInSection:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[TUICandidateGrid candidateGroups](self, "candidateGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 > a3)
  {
    -[TUICandidateGrid candidateGroups](self, "candidateGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "candidates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__TUICandidateGrid_numberOfNonPartialCandidatesInSection___block_invoke;
    v12[3] = &unk_1E24FB8E0;
    v12[4] = &v13;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

  }
  v10 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (void)addAppCandidatesRenderSignposts
{
  const void *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  os_signpost_id_t v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  v2 = (const void *)arc4random();
  kdebug_trace();
  kac_get_log();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, v2);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18C785000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "appCandidatesRender", " enableTelemetry=YES ", buf, 2u);
    }
  }

  v6 = (void *)*MEMORY[0x1E0DC4730];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__TUICandidateGrid_addAppCandidatesRenderSignposts__block_invoke;
  v7[3] = &__block_descriptor_40_e5_v8__0l;
  v7[4] = v2;
  objc_msgSend(v6, "_performBlockAfterCATransactionCommits:", v7);
}

- (NSArray)candidateGroups
{
  return self->_candidateGroups;
}

- (TUICandidateViewStyle)style
{
  return self->_style;
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (NSIndexPath)lastSelectedIndexPath
{
  return self->_lastSelectedIndexPath;
}

- (void)setLastSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, a3);
}

- (int64_t)rowType
{
  return self->_rowType;
}

- (BOOL)candidateNumberEnabled
{
  return self->_candidateNumberEnabled;
}

- (UIView)customHeader
{
  return self->_customHeader;
}

- (TUICandidateGridDelegate)delegate
{
  return (TUICandidateGridDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGSize)arrowButtonSize
{
  double width;
  double height;
  CGSize result;

  width = self->_arrowButtonSize.width;
  height = self->_arrowButtonSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setArrowButtonSize:(CGSize)a3
{
  self->_arrowButtonSize = a3;
}

- (BOOL)isArrowButtonVisible
{
  return self->_isArrowButtonVisible;
}

- (BOOL)suppressCollectionViewLayout
{
  return self->_suppressCollectionViewLayout;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (void)setSingleRowLayout:(id)a3
{
  objc_storeStrong((id *)&self->_singleRowLayout, a3);
}

- (void)setMultiRowLayout:(id)a3
{
  objc_storeStrong((id *)&self->_multiRowLayout, a3);
}

- (NSIndexPath)firstVisibleIndexPath
{
  return self->_firstVisibleIndexPath;
}

- (void)setFirstVisibleIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_firstVisibleIndexPath, a3);
}

- (double)lastUserSelectedCursorX
{
  return self->_lastUserSelectedCursorX;
}

- (void)setLastUserSelectedCursorX:(double)a3
{
  self->_lastUserSelectedCursorX = a3;
}

- (double)selectedRowY
{
  return self->_selectedRowY;
}

- (void)setSelectedRowY:(double)a3
{
  self->_selectedRowY = a3;
}

- (UIView)selectedRowHighlightView
{
  return self->_selectedRowHighlightView;
}

- (void)setSelectedRowHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRowHighlightView, a3);
}

- (BOOL)collectionViewLayoutWasSkipped
{
  return self->_collectionViewLayoutWasSkipped;
}

- (void)setCollectionViewLayoutWasSkipped:(BOOL)a3
{
  self->_collectionViewLayoutWasSkipped = a3;
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (TUICandidateViewStyle)stylePending
{
  return self->_stylePending;
}

- (void)setStylePending:(id)a3
{
  objc_storeStrong((id *)&self->_stylePending, a3);
}

- (double)maximumRowHeight
{
  return self->_maximumRowHeight;
}

- (void)setMaximumRowHeight:(double)a3
{
  self->_maximumRowHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stylePending, 0);
  objc_storeStrong((id *)&self->_selectedRowHighlightView, 0);
  objc_storeStrong((id *)&self->_firstVisibleIndexPath, 0);
  objc_storeStrong((id *)&self->_multiRowLayout, 0);
  objc_storeStrong((id *)&self->_singleRowLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_customHeader, 0);
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_candidateGroups, 0);
}

void __51__TUICandidateGrid_addAppCandidatesRenderSignposts__block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  kdebug_trace();
  kac_get_log();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)v5 = 0;
      _os_signpost_emit_with_name_impl(&dword_18C785000, v2, OS_SIGNPOST_INTERVAL_END, v4, "appCandidatesRender", " enableTelemetry=YES ", v5, 2u);
    }
  }

}

void __58__TUICandidateGrid_numberOfNonPartialCandidatesInSection___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v6, "isPartialCandidate"))
    *a4 = 1;
  else
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

}

void __63__TUICandidateGrid_numberOfTransliterationCandidatesInSection___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v6, "isTransliterationCandidate"))
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  else
    *a4 = 1;

}

uint64_t __58__TUICandidateGrid_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __37__TUICandidateGrid_visibleAttributes__block_invoke_2(uint64_t a1, void *a2, void *a3)
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

BOOL __37__TUICandidateGrid_visibleAttributes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "representedElementCategory") == 0;
}

uint64_t __60__TUICandidateGrid_indexPathInForwardDirection_granularity___block_invoke(uint64_t a1, void *a2, void *a3)
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

uint64_t __65__TUICandidateGrid_setSelectedIndexPath_animated_scrollPosition___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "forceUpdateVisibleCells");
  return objc_msgSend(*(id *)(a1 + 32), "updateSelectedRowHighlightView");
}

void __74__TUICandidateGrid_setRowType_options_style_animated_animator_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setCollectionViewLayout:", *(_QWORD *)(a1 + 32));

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "layoutIfNeeded");

}

uint64_t __74__TUICandidateGrid_setRowType_options_style_animated_animator_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t result;

  v4 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setCollectionViewLayout:", v6);

  objc_msgSend(*(id *)(a1 + 32), "updateGradientLayerToCollectionView");
  v7 = objc_loadWeakRetained(v4);
  objc_msgSend(v7, "setShowsVerticalScrollIndicator:", 1);

  objc_msgSend(*(id *)(a1 + 32), "setFirstVisibleIndexPath:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setAnimating:", 0);
  objc_msgSend(*(id *)(a1 + 32), "stylePending");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "stylePending");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setStyle:", v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "setStylePending:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 0);
  return result;
}

void __74__TUICandidateGrid_setRowType_options_style_animated_animator_completion___block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setCollectionViewLayout:", *(_QWORD *)(a1 + 32));

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "layoutIfNeeded");

}

uint64_t __74__TUICandidateGrid_setRowType_options_style_animated_animator_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t result;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "stylePending");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStyle:reload:", v5, 0);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "collectionViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setCollectionViewLayout:animated:", v7, 0);

  objc_msgSend(*(id *)(a1 + 32), "updateGradientLayerToCollectionView");
  v8 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v8, "setShowsVerticalScrollIndicator:", 1);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v9, "firstVisibleIndexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v9, "indexPathIsValid:", v10);

  if ((_DWORD)v9)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v11, "firstVisibleIndexPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scrollToCandidateAtIndexPath:animated:", v12, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "setFirstVisibleIndexPath:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setAnimating:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setStylePending:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 0);
  return result;
}

uint64_t __31__TUICandidateGrid_updateIndex__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __37__TUICandidateGrid_visibleCandidates__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (BOOL)isSafariPasswordSuggestionCandidate:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
