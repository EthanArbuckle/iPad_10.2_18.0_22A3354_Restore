@implementation PUReviewScrubber

- (void)_commonPUReviewScrubberInitialization
{
  void *v3;
  UIImageView *v4;
  UIImageView *arrowImageView;
  PUHorizontalCollectionViewLayout *v6;
  PUHorizontalCollectionViewLayout *collectionViewLayout;
  PUHorizontalCollectionViewLayout *v8;
  id v9;
  UICollectionView *v10;
  UICollectionView *collectionView;
  UICollectionView *v12;
  void *v13;
  UITapGestureRecognizer *v14;
  UITapGestureRecognizer *tapGestureRecognizer;
  UIImpactFeedbackGenerator *v16;
  UIImpactFeedbackGenerator *impactFeedbackBehavior;
  NSIndexPath *v18;
  NSIndexPath *indexPathForPreviousFeedbackQuery;
  id v20;

  objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", CFSTR("AvalancheReviewModeArrow.png"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithRenderingMode:", 2);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v20);
  arrowImageView = self->__arrowImageView;
  self->__arrowImageView = v4;

  -[PUReviewScrubber addSubview:](self, "addSubview:", self->__arrowImageView);
  v6 = objc_alloc_init(PUHorizontalCollectionViewLayout);
  collectionViewLayout = self->__collectionViewLayout;
  self->__collectionViewLayout = v6;

  v8 = self->__collectionViewLayout;
  -[PUReviewScrubber itemSize](self, "itemSize");
  -[PUHorizontalCollectionViewLayout setItemSize:](v8, "setItemSize:");
  -[PUHorizontalCollectionViewLayout setInteritemSpacing:](self->__collectionViewLayout, "setInteritemSpacing:", 3.0);
  -[PUHorizontalCollectionViewLayout _setWantsRightToLeftHorizontalMirroringIfNeeded:](self->__collectionViewLayout, "_setWantsRightToLeftHorizontalMirroringIfNeeded:", 1);
  v9 = objc_alloc(MEMORY[0x1E0DC35B8]);
  v10 = (UICollectionView *)objc_msgSend(v9, "initWithFrame:collectionViewLayout:", self->__collectionViewLayout, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  collectionView = self->__collectionView;
  self->__collectionView = v10;

  v12 = self->__collectionView;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](v12, "setBackgroundColor:", v13);

  -[UICollectionView setShowsVerticalScrollIndicator:](self->__collectionView, "setShowsVerticalScrollIndicator:", 0);
  -[UICollectionView setShowsHorizontalScrollIndicator:](self->__collectionView, "setShowsHorizontalScrollIndicator:", 0);
  -[UICollectionView setDelegate:](self->__collectionView, "setDelegate:", self);
  -[UICollectionView setDataSource:](self->__collectionView, "setDataSource:", self);
  -[UICollectionView _setSupportsPointerDragScrolling:](self->__collectionView, "_setSupportsPointerDragScrolling:", 1);
  -[PUReviewScrubber setScrubberCellClass:](self, "setScrubberCellClass:", objc_opt_class());
  -[PUReviewScrubber addSubview:](self, "addSubview:", self->__collectionView);
  v14 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTapOnReviewScrubber_);
  tapGestureRecognizer = self->__tapGestureRecognizer;
  self->__tapGestureRecognizer = v14;

  -[UITapGestureRecognizer setNumberOfTapsRequired:](self->__tapGestureRecognizer, "setNumberOfTapsRequired:", 1);
  -[UITapGestureRecognizer setNumberOfTouchesRequired:](self->__tapGestureRecognizer, "setNumberOfTouchesRequired:", 1);
  -[UITapGestureRecognizer setDelegate:](self->__tapGestureRecognizer, "setDelegate:", self);
  -[UICollectionView addGestureRecognizer:](self->__collectionView, "addGestureRecognizer:", self->__tapGestureRecognizer);
  v16 = (UIImpactFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E0DC3898]);
  impactFeedbackBehavior = self->__impactFeedbackBehavior;
  self->__impactFeedbackBehavior = v16;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v18 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  indexPathForPreviousFeedbackQuery = self->__indexPathForPreviousFeedbackQuery;
  self->__indexPathForPreviousFeedbackQuery = v18;

  *(_WORD *)&self->__ignoreScrollViewDidScrollUpdate = 1;
  -[PUReviewScrubber sendSubviewToBack:](self, "sendSubviewToBack:", self->__backdropView);

}

- (PUReviewScrubber)initWithFrame:(CGRect)a3
{
  PUReviewScrubber *v3;
  PUReviewScrubber *v4;
  PUReviewScrubber *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUReviewScrubber;
  v3 = -[PUReviewScrubber initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PUReviewScrubber _commonPUReviewScrubberInitialization](v3, "_commonPUReviewScrubberInitialization");
    v5 = v4;
  }

  return v4;
}

- (PUReviewScrubber)initWithCoder:(id)a3
{
  PUReviewScrubber *v3;
  PUReviewScrubber *v4;
  PUReviewScrubber *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUReviewScrubber;
  v3 = -[PUReviewScrubber initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[PUReviewScrubber _commonPUReviewScrubberInitialization](v3, "_commonPUReviewScrubberInitialization");
    v5 = v4;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_scrubberDelegate, 0);
  objc_storeWeak((id *)&self->_dataSource, 0);
  -[UITapGestureRecognizer setDelegate:](self->__tapGestureRecognizer, "setDelegate:", 0);
  -[PUReviewScrubber _endFeedbackInteraction](self, "_endFeedbackInteraction");
  v3.receiver = self;
  v3.super_class = (Class)PUReviewScrubber;
  -[PUReviewScrubber dealloc](&v3, sel_dealloc);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[PUReviewScrubber window](self, "window", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "interfaceOrientation");

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;

  v9 = 52.0;
  if ((unint64_t)(v5 - 3) >= 2)
    v9 = 64.0;
  v10 = v8;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  UIImageView *arrowImageView;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  UICollectionView *collectionView;
  double Width;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v28.receiver = self;
  v28.super_class = (Class)PUReviewScrubber;
  -[PUReviewScrubber layoutSubviews](&v28, sel_layoutSubviews);
  -[PUReviewScrubber bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  arrowImageView = self->__arrowImageView;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "colorWithAlphaComponent:", 0.25);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](arrowImageView, "setTintColor:", v13);

  -[UIImageView sizeToFit](self->__arrowImageView, "sizeToFit");
  -[UIImageView bounds](self->__arrowImageView, "bounds");
  UIRectCenteredIntegralRectScale();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (-[PUReviewScrubber isMinibar](self, "isMinibar", 0))
    v20 = 3.0;
  else
    v20 = 6.0;
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  v21 = CGRectGetMinY(v29) + v20;
  -[UIImageView setFrame:](self->__arrowImageView, "setFrame:", v15, v21, v17, v19);
  v30.origin.x = v15;
  v30.origin.y = v21;
  v30.size.width = v17;
  v30.size.height = v19;
  CGRectGetMaxY(v30);
  PXEdgeInsetsWithValueForEdges();
  PXEdgeInsetsInsetRect();
  self->__ignoreScrollViewDidScrollUpdate = 1;
  -[UICollectionView setFrame:](self->__collectionView, "setFrame:");
  collectionView = self->__collectionView;
  v31.origin.x = v4;
  v31.origin.y = v6;
  v31.size.width = v8;
  v31.size.height = v10;
  Width = CGRectGetWidth(v31);
  -[PUReviewScrubber itemSize](self, "itemSize");
  v25 = floor((Width - v24) * 0.5);
  v32.origin.x = v4;
  v32.origin.y = v6;
  v32.size.width = v8;
  v32.size.height = v10;
  v26 = CGRectGetWidth(v32);
  -[PUReviewScrubber itemSize](self, "itemSize");
  -[UICollectionView setContentInset:](collectionView, "setContentInset:", 0.0, v25, 0.0, floor((v26 - v27) * 0.5));
  if (!-[PUReviewScrubber _performingInteractiveUpdate](self, "_performingInteractiveUpdate")
    && (-[UICollectionView isTracking](self->__collectionView, "isTracking") & 1) == 0
    && (-[UICollectionView isDecelerating](self->__collectionView, "isDecelerating") & 1) == 0)
  {
    -[PUReviewScrubber contentOffsetForIndexPath:inCollectionView:](self, "contentOffsetForIndexPath:inCollectionView:", self->_selectedIndexPath, self->__collectionView);
    -[UICollectionView setContentOffset:](self->__collectionView, "setContentOffset:");
  }
  self->__ignoreScrollViewDidScrollUpdate = 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PUReviewScrubber convertPoint:toView:](self, "convertPoint:toView:", self->__collectionView, x, y);
  -[UICollectionView hitTest:withEvent:](self->__collectionView, "hitTest:withEvent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v10.receiver = self;
    v10.super_class = (Class)PUReviewScrubber;
    -[PUReviewScrubber hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)isMinibar
{
  double v2;

  -[PUReviewScrubber bounds](self, "bounds");
  return v2 < 64.0;
}

- (void)setScrubberCellClass:(Class)a3
{
  Class *p_scrubberCellClass;
  NSString *v5;
  NSString *cellReuseIdentifier;

  p_scrubberCellClass = &self->_scrubberCellClass;
  if (self->_scrubberCellClass != a3)
  {
    objc_storeStrong((id *)&self->_scrubberCellClass, a3);
    NSStringFromClass(*p_scrubberCellClass);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    cellReuseIdentifier = self->_cellReuseIdentifier;
    self->_cellReuseIdentifier = v5;

    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->__collectionView, "registerClass:forCellWithReuseIdentifier:", *p_scrubberCellClass, self->_cellReuseIdentifier);
  }
}

- (void)setSelectedIndexPath:(id)a3
{
  -[PUReviewScrubber setSelectedIndexPath:animated:](self, "setSelectedIndexPath:animated:", a3, 0);
}

- (void)setSelectedIndexPath:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSIndexPath *v7;

  v4 = a4;
  v7 = (NSIndexPath *)a3;
  if (self->_selectedIndexPath != v7)
  {
    objc_storeStrong((id *)&self->_selectedIndexPath, a3);
    -[PUReviewScrubber _updateContentOffsetForSelectedIndexPathAnimated:](self, "_updateContentOffsetForSelectedIndexPathAnimated:", v4);
    -[PUReviewScrubber _setIndexPathForPreviousFeedbackQuery:](self, "_setIndexPathForPreviousFeedbackQuery:", v7);
  }

}

- (void)reloadData
{
  id v2;

  -[PUReviewScrubber _collectionView](self, "_collectionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)toggleIndexPath:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  -[PUReviewScrubber _collectionView](self, "_collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItemAtIndexPath:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "setFavorite:animated:", objc_msgSend(v8, "isFavorite") ^ 1, v4);

}

- (void)toggleSelectedIndexPathAnimated:(BOOL)a3
{
  -[PUReviewScrubber toggleIndexPath:animated:](self, "toggleIndexPath:animated:", self->_selectedIndexPath, a3);
}

- (void)reloadIndexPath:(id)a3 animated:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PUReviewScrubber _collectionView](self, "_collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForItemAtIndexPath:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PUReviewScrubber scrubberDelegate](self, "scrubberDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "reviewScrubber:willDisplayCell:atIndexPath:", self, v6, v8);

  }
}

- (void)reloadSelectedIndexPathAnimated:(BOOL)a3
{
  -[PUReviewScrubber reloadIndexPath:animated:](self, "reloadIndexPath:animated:", self->_selectedIndexPath, a3);
}

- (void)setCellAspectRatio:(id)a3
{
  NSNumber *v5;
  void *v6;
  char v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSNumber *v12;

  v12 = (NSNumber *)a3;
  v5 = self->_cellAspectRatio;
  v6 = v12;
  if (v5 == v12)
    goto LABEL_4;
  v7 = -[NSNumber isEqual:](v12, "isEqual:", v5);

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_cellAspectRatio, a3);
    -[PUReviewScrubber itemSize](self, "itemSize");
    v9 = v8;
    v11 = v10;
    -[PUReviewScrubber _collectionViewLayout](self, "_collectionViewLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setItemSize:", v9, v11);
LABEL_4:

  }
}

- (void)beginInteractiveUpdate
{
  if (self->__performingInteractiveUpdate)
    -[PUReviewScrubber finishInteractiveUpdate](self, "finishInteractiveUpdate");
  self->__performingInteractiveUpdate = 1;
  -[UICollectionView _stopScrollingAndZoomingAnimations](self->__collectionView, "_stopScrollingAndZoomingAnimations");
  -[PUReviewScrubber _beginFeedbackInteraction](self, "_beginFeedbackInteraction");
}

- (void)updateWithAbsoluteProgress:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  if (self->__performingInteractiveUpdate)
  {
    self->__ignoreScrollViewDidScrollUpdate = 1;
    -[PUReviewScrubber itemSize](self, "itemSize");
    v6 = v5 + 3.0;
    -[UICollectionView contentOffset](self->__collectionView, "contentOffset");
    v8 = v7;
    -[UICollectionView contentInset](self->__collectionView, "contentInset");
    v10 = v6 * a3 - v9;
    v12 = v8 - v11;
    -[PUReviewScrubber _collectionView](self, "_collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentOffset:", v10, v12);

    -[PUReviewScrubber _playFeedbackIfNeeded](self, "_playFeedbackIfNeeded");
    self->__ignoreScrollViewDidScrollUpdate = 0;
  }
}

- (void)finishInteractiveUpdate
{
  UICollectionView *collectionView;
  NSIndexPath *v4;
  NSIndexPath *selectedIndexPath;

  collectionView = self->__collectionView;
  -[UICollectionView contentOffset](collectionView, "contentOffset");
  -[PUReviewScrubber indexPathUnderTickMarkInCollectionView:atContentOffset:](self, "indexPathUnderTickMarkInCollectionView:atContentOffset:", collectionView);
  v4 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  selectedIndexPath = self->_selectedIndexPath;
  self->_selectedIndexPath = v4;

  -[PUReviewScrubber _updateContentOffsetForSelectedIndexPathAnimated:](self, "_updateContentOffsetForSelectedIndexPathAnimated:", 0);
  -[PUReviewScrubber _endFeedbackInteraction](self, "_endFeedbackInteraction");
  self->__performingInteractiveUpdate = 0;
}

- (void)_beginFeedbackInteraction
{
  void *v3;
  int v4;
  id v5;

  -[PUReviewScrubber _impactFeedbackBehavior](self, "_impactFeedbackBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isActive");

  if (v4)
    -[PUReviewScrubber _endFeedbackInteraction](self, "_endFeedbackInteraction");
  -[PUReviewScrubber _impactFeedbackBehavior](self, "_impactFeedbackBehavior");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activateWithCompletionBlock:", 0);

}

- (void)_playFeedbackIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  -[PUReviewScrubber _impactFeedbackBehavior](self, "_impactFeedbackBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = v3;
    -[PUReviewScrubber _collectionView](self, "_collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentOffset");
    -[PUReviewScrubber indexPathUnderTickMarkInCollectionView:atContentOffset:](self, "indexPathUnderTickMarkInCollectionView:atContentOffset:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUReviewScrubber _indexPathForPreviousFeedbackQuery](self, "_indexPathForPreviousFeedbackQuery");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6 || objc_msgSend(v5, "compare:", v6))
    {
      -[PUReviewScrubber dataSource](self, "dataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "reviewScrubber:shouldProvideFeedbackForCellAtIndexPath:", self, v5);

      if (v8)
        objc_msgSend(v9, "impactOccurred");
      -[PUReviewScrubber _setIndexPathForPreviousFeedbackQuery:](self, "_setIndexPathForPreviousFeedbackQuery:", v5);
    }

    v3 = v9;
  }

}

- (void)_endFeedbackInteraction
{
  void *v3;
  int v4;
  id v5;

  -[PUReviewScrubber _impactFeedbackBehavior](self, "_impactFeedbackBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isActive");

  if (v4)
  {
    -[PUReviewScrubber _impactFeedbackBehavior](self, "_impactFeedbackBehavior");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivate");

  }
}

- (id)_indexPathInCollectionView:(id)a3 closestToPoint:(CGPoint)a4 excludingIndexPath:(id)a5
{
  double y;
  double x;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  y = a4.y;
  x = a4.x;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "indexPathForItemAtPoint:", x, y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v8, "visibleCells");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v10 = 0;
      v14 = *(_QWORD *)v25;
      v15 = 1.79769313e308;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v8, "indexPathForCell:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v9, "isEqual:", v18) & 1) == 0)
          {
            objc_msgSend(v17, "center");
            v21 = (v20 - y) * (v20 - y) + (v19 - x) * (v19 - x);
            if (v21 < v15)
            {
              v22 = v18;

              v15 = v21;
              v10 = v22;
            }
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v13);
    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (void)_handleTapAtIndexPath:(id)a3
{
  -[PUReviewScrubber _updateToSelectedIndexPath:](self, "_updateToSelectedIndexPath:", a3);
  -[PUReviewScrubber _updateContentOffsetForSelectedIndexPathAnimated:](self, "_updateContentOffsetForSelectedIndexPathAnimated:", 1);
  -[PUReviewScrubber _notifyDelegateOfSelection](self, "_notifyDelegateOfSelection");
}

- (void)_handleTapOnReviewScrubber:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  void *v16;
  id v17;

  v4 = a3;
  -[PUReviewScrubber _collectionView](self, "_collectionView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v17);
  v6 = v5;
  v8 = v7;

  -[PUReviewScrubber _collectionViewLayout](self, "_collectionViewLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentSize");
  v11 = v10;
  objc_msgSend(v9, "itemsContentInset");
  v14 = v11 - fabs(v13);
  v15 = v6 > fabs(v12) && v6 < v14;
  if (v15 && (objc_msgSend(v17, "isDecelerating") & 1) == 0)
  {
    -[PUReviewScrubber _indexPathInCollectionView:closestToPoint:excludingIndexPath:](self, "_indexPathInCollectionView:closestToPoint:excludingIndexPath:", v17, 0, v6, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUReviewScrubber _handleTapAtIndexPath:](self, "_handleTapAtIndexPath:", v16);

  }
}

- (void)_updateContentOffsetForSelectedIndexPathAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[PUReviewScrubber _collectionView](self, "_collectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PUReviewScrubber contentOffsetForIndexPath:inCollectionView:](self, "contentOffsetForIndexPath:inCollectionView:", self->_selectedIndexPath, v5);
  objc_msgSend(v5, "setContentOffset:animated:", v3);

}

- (id)indexPathUnderTickMarkInCollectionView:(id)a3 atContentOffset:(CGPoint)a4
{
  double x;
  id v6;
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
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;

  x = a4.x;
  v6 = a3;
  objc_msgSend(v6, "contentInset");
  v8 = v7;
  v10 = v9;
  v12 = x + v11;
  objc_msgSend(v6, "bounds");
  v14 = (v13 - (v8 + v10)) * 0.5;
  -[PUReviewScrubber itemSize](self, "itemSize");
  v16 = v12 + v15 * 0.5;
  objc_msgSend(v6, "contentSize");
  v18 = v17;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "scale");
  v21 = -1.0 / v20;

  v22 = v18 + v21;
  if (v18 + v21 >= v16)
    v22 = v16;
  v23 = fmax(v22, 0.0);
  objc_msgSend(v6, "indexPathForItemAtPoint:", v23, v14);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    objc_msgSend(v6, "indexPathForItemAtPoint:", v23 + 1.5, v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      objc_msgSend(v6, "indexPathForItemAtPoint:", v23 + -1.5, v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v24;
}

- (CGPoint)contentOffsetForIndexPath:(id)a3 inCollectionView:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGPoint result;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "contentInset");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "contentOffset");
  v13 = v12;
  objc_msgSend(v7, "collectionViewLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutAttributesForItemAtIndexPath:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "frame");
    v18 = v17 - v11;
    v19 = v13 - v9;
  }
  else
  {
    v20 = objc_msgSend(v6, "item");
    if (objc_msgSend(v6, "section") >= 1)
    {
      v21 = 0;
      do
        v20 += -[PUReviewScrubber collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", v7, v21++);
      while (v21 < objc_msgSend(v6, "section"));
    }
    -[PUReviewScrubber contentOffsetForItemAtIndex:ofScrollView:](self, "contentOffsetForItemAtIndex:ofScrollView:", v20, v7);
    v18 = v22;
    v19 = v23;
  }

  v24 = v18;
  v25 = v19;
  result.y = v25;
  result.x = v24;
  return result;
}

- (CGPoint)contentOffsetForItemAtIndex:(int64_t)a3 ofScrollView:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  v6 = a4;
  objc_msgSend(v6, "contentInset");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "contentOffset");
  v12 = v11;

  -[PUReviewScrubber itemSize](self, "itemSize");
  v14 = (v13 + 3.0) * (double)a3 - v10;
  v15 = v12 - v8;
  result.y = v15;
  result.x = v14;
  return result;
}

- (void)_updateToSelectedIndexPath:(id)a3
{
  id v5;
  NSIndexPath **p_selectedIndexPath;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  p_selectedIndexPath = &self->_selectedIndexPath;
  v9 = v5;
  if (!*p_selectedIndexPath || (v7 = objc_msgSend(v5, "compare:"), v8 = v9, v7))
  {
    objc_storeStrong((id *)p_selectedIndexPath, a3);
    v8 = v9;
  }

}

- (void)_notifyDelegateOfScrub
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;

  -[PUReviewScrubber scrubberDelegate](self, "scrubberDelegate");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v6 = (void *)v3;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "reviewScrubberDidScrub:", self);
      v4 = v6;
    }
  }

}

- (void)_notifyDelegateOfSelection
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[PUReviewScrubber scrubberDelegate](self, "scrubberDelegate");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v7 = (void *)v3;
    v5 = objc_opt_respondsToSelector();
    v4 = v7;
    if ((v5 & 1) != 0)
    {
      -[PUReviewScrubber selectedIndexPath](self, "selectedIndexPath", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "reviewScrubberDidSelectItemAtIndexPath:", v6);

      v4 = v7;
    }
  }

}

- (CGSize)itemSize
{
  void *v2;

  -[PUReviewScrubber cellAspectRatio](self, "cellAspectRatio");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");

  JUMPOUT(0x1AF42AA68);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = v4;
  if (!self->__ignoreScrollViewDidScrollUpdate)
  {
    v9 = v4;
    v6 = objc_msgSend(v4, "_isAnimatingScroll");
    v5 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = v9;
      objc_msgSend(v7, "contentOffset");
      -[PUReviewScrubber indexPathUnderTickMarkInCollectionView:atContentOffset:](self, "indexPathUnderTickMarkInCollectionView:atContentOffset:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[PUReviewScrubber _updateToSelectedIndexPath:](self, "_updateToSelectedIndexPath:", v8);
      -[PUReviewScrubber _notifyDelegateOfScrub](self, "_notifyDelegateOfScrub");
      -[PUReviewScrubber _playFeedbackIfNeeded](self, "_playFeedbackIfNeeded");

      v5 = v9;
    }
  }

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[PUReviewScrubber _endFeedbackInteraction](self, "_endFeedbackInteraction", a3);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  id v16;

  v7 = a3;
  objc_msgSend(v7, "collectionViewLayout");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[PUReviewScrubber indexPathUnderTickMarkInCollectionView:atContentOffset:](self, "indexPathUnderTickMarkInCollectionView:atContentOffset:", v7, a5->x, a5->y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layoutAttributesForItemAtIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v7, "contentInset");
  v15 = v14;

  a5->x = v11 - v15;
  a5->y = v13;

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  PUReviewScrubberDataSource **p_dataSource;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  int64_t v10;

  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (!WeakRetained)
    return 1;
  v6 = WeakRetained;
  v7 = objc_loadWeakRetained((id *)p_dataSource);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0)
    return 1;
  v9 = objc_loadWeakRetained((id *)p_dataSource);
  v10 = objc_msgSend(v9, "numberOfSectionsInReviewScrubber:", self);

  return v10;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  PUReviewScrubberDataSource **p_dataSource;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  int64_t v12;

  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (!WeakRetained)
    return 0;
  v8 = WeakRetained;
  v9 = objc_loadWeakRetained((id *)p_dataSource);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) == 0)
    return 0;
  v11 = objc_loadWeakRetained((id *)p_dataSource);
  v12 = objc_msgSend(v11, "reviewScrubber:numberOfItemsInSection:", self, a4);

  return v12;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[PUReviewScrubber cellReuseIdentifier](self, "cellReuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUReviewScrubber scrubberDelegate](self, "scrubberDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "reviewScrubber:willDisplayCell:atIndexPath:", self, v9, v6);

  return v9;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  -[PUReviewScrubber _handleTapAtIndexPath:](self, "_handleTapAtIndexPath:", a4);
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  UITapGestureRecognizer *v7;
  void *v8;
  UITapGestureRecognizer *tapGestureRecognizer;
  char v10;
  id v11;

  v6 = a4;
  v7 = (UITapGestureRecognizer *)a3;
  -[PUReviewScrubber _collectionView](self, "_collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  tapGestureRecognizer = self->__tapGestureRecognizer;

  if (tapGestureRecognizer == v7)
  {
    objc_msgSend(v8, "panGestureRecognizer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 == v6)
      v10 = objc_msgSend(v8, "isDecelerating");
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSNumber)cellAspectRatio
{
  return self->_cellAspectRatio;
}

- (PUReviewScrubberDataSource)dataSource
{
  return (PUReviewScrubberDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (PUReviewScrubberDelegate)scrubberDelegate
{
  return (PUReviewScrubberDelegate *)objc_loadWeakRetained((id *)&self->_scrubberDelegate);
}

- (void)setScrubberDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_scrubberDelegate, a3);
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (Class)scrubberCellClass
{
  return self->_scrubberCellClass;
}

- (_UIBackdropView)_backdropView
{
  return self->__backdropView;
}

- (UIImageView)_shadowView
{
  return self->__shadowView;
}

- (UIImageView)_arrowImageView
{
  return self->__arrowImageView;
}

- (PUHorizontalCollectionViewLayout)_collectionViewLayout
{
  return self->__collectionViewLayout;
}

- (UICollectionView)_collectionView
{
  return self->__collectionView;
}

- (NSString)cellReuseIdentifier
{
  return self->_cellReuseIdentifier;
}

- (void)setCellReuseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cellReuseIdentifier, a3);
}

- (BOOL)_ignoreScrollViewDidScrollUpdate
{
  return self->__ignoreScrollViewDidScrollUpdate;
}

- (BOOL)_performingInteractiveUpdate
{
  return self->__performingInteractiveUpdate;
}

- (UITapGestureRecognizer)_tapGestureRecognizer
{
  return self->__tapGestureRecognizer;
}

- (UIImpactFeedbackGenerator)_impactFeedbackBehavior
{
  return self->__impactFeedbackBehavior;
}

- (NSIndexPath)_indexPathForPreviousFeedbackQuery
{
  return self->__indexPathForPreviousFeedbackQuery;
}

- (void)_setIndexPathForPreviousFeedbackQuery:(id)a3
{
  objc_storeStrong((id *)&self->__indexPathForPreviousFeedbackQuery, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__indexPathForPreviousFeedbackQuery, 0);
  objc_storeStrong((id *)&self->__impactFeedbackBehavior, 0);
  objc_storeStrong((id *)&self->__tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_cellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->__collectionView, 0);
  objc_storeStrong((id *)&self->__collectionViewLayout, 0);
  objc_storeStrong((id *)&self->__arrowImageView, 0);
  objc_storeStrong((id *)&self->__shadowView, 0);
  objc_storeStrong((id *)&self->__backdropView, 0);
  objc_storeStrong((id *)&self->_scrubberCellClass, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_destroyWeak((id *)&self->_scrubberDelegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_cellAspectRatio, 0);
}

@end
