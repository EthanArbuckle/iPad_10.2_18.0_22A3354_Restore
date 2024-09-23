@implementation PUScrubberView

- (PUScrubberView)initWithFrame:(CGRect)a3
{
  PUScrubberView *v3;
  PUScrubberView *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *scrubbingIdentifier;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *contentScrubbingIdentifier;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSString *transitionLayoutIdentifier;
  uint64_t v29;
  UITapGestureRecognizer *tapGestureRecognizer;
  PUTouchingGestureRecognizer *v31;
  PUTouchingGestureRecognizer *touchingGestureRecognizer;
  NSMutableDictionary *v33;
  NSMutableDictionary *aspectRatioByIndexPath;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)PUScrubberView;
  v3 = -[PUScrubberView initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_canExpandCurrentAsset = 1;
    +[PUScrubberSettings sharedInstance](PUScrubberSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "slitAspectRatio");
    v4->_slitAspectRatio = v6;
    objc_msgSend(v5, "interItemSpacing");
    v4->_interItemSpacing = v7;
    objc_msgSend(v5, "interSectionSpacing");
    v4->_interSectionSpacing = v8;
    objc_msgSend(v5, "itemCornerRadius");
    v4->_itemCornerRadius = v9;
    objc_msgSend(v5, "topOutset");
    v4->_topOutset = v10;
    v4->_useEmbeddedVideoScrubber = 0;
    v4->_embeddedVideoScrubberWidthFraction = 0.7;
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "useDebuggingColors");

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "yellowColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUScrubberView setBackgroundColor:](v4, "setBackgroundColor:", v13);

    }
    objc_msgSend((id)objc_opt_class(), "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingString:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    scrubbingIdentifier = v4->_scrubbingIdentifier;
    v4->_scrubbingIdentifier = (NSString *)v17;

    objc_msgSend((id)objc_opt_class(), "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByAppendingString:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    contentScrubbingIdentifier = v4->_contentScrubbingIdentifier;
    v4->_contentScrubbingIdentifier = (NSString *)v22;

    objc_msgSend((id)objc_opt_class(), "description");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByAppendingString:", v26);
    v27 = objc_claimAutoreleasedReturnValue();
    transitionLayoutIdentifier = v4->_transitionLayoutIdentifier;
    v4->_transitionLayoutIdentifier = (NSString *)v27;

    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel__handleTap_);
    tapGestureRecognizer = v4->__tapGestureRecognizer;
    v4->__tapGestureRecognizer = (UITapGestureRecognizer *)v29;

    v31 = -[PUTouchingGestureRecognizer initWithTarget:action:]([PUTouchingGestureRecognizer alloc], "initWithTarget:action:", v4, sel_handleTouchGesture_);
    touchingGestureRecognizer = v4->_touchingGestureRecognizer;
    v4->_touchingGestureRecognizer = v31;

    -[PUTouchingGestureRecognizer setDelegate:](v4->_touchingGestureRecognizer, "setDelegate:", v4);
    -[PUScrubberView addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_touchingGestureRecognizer);
    v4->__useSmoothingTransitionCoordinator = 1;
    v4->__scrollViewSettled = 1;
    v33 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    aspectRatioByIndexPath = v4->_aspectRatioByIndexPath;
    v4->_aspectRatioByIndexPath = v33;

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[PUTilingView setDelegate:](self->__tilingView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PUScrubberView;
  -[PUScrubberView dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUScrubberView;
  -[PUScrubberView layoutSubviews](&v3, sel_layoutSubviews);
  -[PUScrubberView updateIfNeeded](self, "updateIfNeeded");
}

- (void)setBrowsingSession:(id)a3
{
  PUBrowsingSession *v5;
  PUBrowsingSession *browsingSession;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PUBrowsingSession *v13;

  v5 = (PUBrowsingSession *)a3;
  browsingSession = self->_browsingSession;
  v13 = v5;
  if (browsingSession != v5)
  {
    -[PUBrowsingSession viewModel](browsingSession, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unregisterChangeObserver:", self);

    objc_storeStrong((id *)&self->_browsingSession, a3);
    -[PUBrowsingSession viewModel](self->_browsingSession, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerChangeObserver:", self);

    -[NSMutableDictionary removeAllObjects](self->_aspectRatioByIndexPath, "removeAllObjects");
    -[PUScrubberView _setDecelerationTargetIndexPath:](self, "_setDecelerationTargetIndexPath:", 0);
    -[PUScrubberView _invalidateLoupeEffect](self, "_invalidateLoupeEffect");
    -[PUScrubberView _invalidateScrubberLayout](self, "_invalidateScrubberLayout");
    -[PUScrubberView _invalidateSnapToExpandedItem](self, "_invalidateSnapToExpandedItem");
    -[PUBrowsingSession actionManager](v13, "actionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "px_selectionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUScrubberView setSelectionManager:](self, "setSelectionManager:", v10);

    -[PUScrubberView _tilingView](self, "_tilingView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[PUScrubberView _tilingView](self, "_tilingView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUBrowsingSession configureTilingView:](v13, "configureTilingView:", v12);

    }
  }

}

- (void)setSelectionManager:(id)a3
{
  PXSectionedSelectionManager *v5;
  PXSectionedSelectionManager *selectionManager;
  PXSectionedSelectionManager *v7;

  v5 = (PXSectionedSelectionManager *)a3;
  selectionManager = self->_selectionManager;
  if (selectionManager != v5)
  {
    v7 = v5;
    -[PXSectionedSelectionManager unregisterChangeObserver:context:](selectionManager, "unregisterChangeObserver:context:", self, PXSelectionManagerObservationContext);
    objc_storeStrong((id *)&self->_selectionManager, a3);
    -[PXSectionedSelectionManager registerChangeObserver:context:](self->_selectionManager, "registerChangeObserver:context:", self, PXSelectionManagerObservationContext);
    v5 = v7;
  }

}

- (void)setType:(int64_t)a3
{
  if (self->_type != a3)
  {
    self->_type = a3;
    -[PUScrubberView _invalidateScrubberLayout](self, "_invalidateScrubberLayout");
  }
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToShouldIgnoreHitTestWithEvent = objc_opt_respondsToSelector() & 1;
  }

}

- (void)beginPreviewing
{
  -[PUScrubberView _handleUserScrollWillBegin:](self, "_handleUserScrollWillBegin:", 1);
}

- (void)endPreviewing
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PUScrubberView *v8;

  -[PUScrubberView _endScrubbing](self, "_endScrubbing");
  -[PUScrubberView browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUScrubberView _updateScrollPositionAnimated:](self, "_updateScrollPositionAnimated:", 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__PUScrubberView_endPreviewing__block_invoke;
  v6[3] = &unk_1E58ABCA8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "performChanges:", v6);

}

- (void)cancelDeceleration
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  -[PUScrubberView _tilingView](self, "_tilingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDecelerating");

  if (v4)
  {
    -[PUScrubberView _tilingView](self, "_tilingView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PUScrubberView _tilingView](self, "_tilingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentOffset");
    objc_msgSend(v6, "setContentOffset:animated:", 0);

  }
}

- (void)_setUseLoupe:(BOOL)a3
{
  if (self->__useLoupe != a3)
  {
    self->__useLoupe = a3;
    -[PUScrubberView _invalidateScrubberLayout](self, "_invalidateScrubberLayout");
  }
}

- (void)setUseThinLoupe:(BOOL)a3
{
  if (self->_useThinLoupe != a3)
  {
    self->_useThinLoupe = a3;
    -[PUScrubberView _invalidateScrubberLayout](self, "_invalidateScrubberLayout");
  }
}

- (void)_setSnapToExpandedItem:(BOOL)a3
{
  if (self->__snapToExpandedItem != a3)
  {
    self->__snapToExpandedItem = a3;
    -[PUScrubberView _invalidateScrubberLayout](self, "_invalidateScrubberLayout");
  }
}

- (void)_setHandlingScrollViewWillEndDragging:(BOOL)a3
{
  if (self->__isHandlingScrollViewWillEndDragging != a3)
  {
    self->__isHandlingScrollViewWillEndDragging = a3;
    -[PUScrubberView _invalidateLoupeEffect](self, "_invalidateLoupeEffect");
    -[PUScrubberView _invalidateScrubberLayout](self, "_invalidateScrubberLayout");
  }
}

- (void)_setDecelerationTargetIndexPath:(id)a3
{
  NSIndexPath *v5;
  NSIndexPath *decelerationTargetIndexPath;
  char v7;
  NSIndexPath *v8;

  v5 = (NSIndexPath *)a3;
  decelerationTargetIndexPath = self->__decelerationTargetIndexPath;
  if (decelerationTargetIndexPath != v5)
  {
    v8 = v5;
    v7 = -[NSIndexPath isEqual:](decelerationTargetIndexPath, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->__decelerationTargetIndexPath, a3);
      -[PUScrubberView _invalidateLoupeEffect](self, "_invalidateLoupeEffect");
      -[PUScrubberView _invalidateScrubberLayout](self, "_invalidateScrubberLayout");
      v5 = v8;
    }
  }

}

- (void)updateIfNeeded
{
  -[PUScrubberView _updateLoupeEffectIfNeeded](self, "_updateLoupeEffectIfNeeded");
  -[PUScrubberView _updateSnapToExpandedItemIfNeeded](self, "_updateSnapToExpandedItemIfNeeded");
  -[PUScrubberView _updateScrubberLayoutIfNeeded](self, "_updateScrubberLayoutIfNeeded");
  -[PUScrubberView _updateTilingViewIfNeeded](self, "_updateTilingViewIfNeeded");
}

- (void)_invalidateLoupeEffect
{
  self->_loupeEffectIsValid = 0;
  -[PUScrubberView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateLoupeEffectIfNeeded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  id v9;

  if (!self->_loupeEffectIsValid)
  {
    self->_loupeEffectIsValid = 1;
    +[PUScrubberSettings sharedInstance](PUScrubberSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "interactiveLoupeBehavior");

    -[PUScrubberView _tilingView](self, "_tilingView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isDecelerating") && !objc_msgSend(v9, "isTracking")
      || -[PUScrubberView _isHandlingScrollViewWillEndDragging](self, "_isHandlingScrollViewWillEndDragging")
      || objc_msgSend(v9, "isDragging") && !v4)
    {
      v5 = 0;
    }
    else
    {
      v5 = objc_msgSend(v9, "pu_isPerformingScrollTest") ^ 1;
    }
    -[PUScrubberView _setUseLoupe:](self, "_setUseLoupe:", v5);
    if ((objc_msgSend(v9, "isDragging") & 1) != 0 || objc_msgSend(v9, "isDecelerating"))
    {
      -[PUScrubberView _decelerationTargetIndexPath](self, "_decelerationTargetIndexPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        v7 = 0;
      else
        v7 = v4 == 1;
      v8 = v7;

    }
    else
    {
      v8 = 0;
    }
    -[PUScrubberView setUseThinLoupe:](self, "setUseThinLoupe:", v8);

  }
}

- (void)_invalidateSnapToExpandedItem
{
  self->_snapToExpandedIsValid = 0;
  -[PUScrubberView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateSnapToExpandedItemIfNeeded
{
  if (!self->_snapToExpandedIsValid)
  {
    self->_snapToExpandedIsValid = 1;
    -[PUScrubberView _setSnapToExpandedItem:](self, "_setSnapToExpandedItem:", -[PUScrubberView _allowExitFromContentScrubbing](self, "_allowExitFromContentScrubbing") ^ 1);
  }
}

- (void)_setVideoScrubberController:(id)a3
{
  PXVideoScrubberController *v5;
  PXVideoScrubberController *videoScrubberController;
  PXVideoScrubberController *v7;

  v5 = (PXVideoScrubberController *)a3;
  videoScrubberController = self->__videoScrubberController;
  v7 = v5;
  if (videoScrubberController != v5)
  {
    -[PXVideoScrubberController setDelegate:](videoScrubberController, "setDelegate:", 0);
    objc_storeStrong((id *)&self->__videoScrubberController, a3);
    -[PXVideoScrubberController setDelegate:](v7, "setDelegate:", self);
  }

}

- (void)_setScrubbingAwayFromContentEdge:(BOOL)a3
{
  if (self->__isScrubbingAwayFromContentEdge != a3)
  {
    self->__isScrubbingAwayFromContentEdge = a3;
    -[PUScrubberView _invalidateSnapToExpandedItem](self, "_invalidateSnapToExpandedItem");
  }
}

- (void)_setTilingView:(id)a3
{
  PUTilingView *v5;
  PUTilingView **p_tilingView;
  PUTilingView *tilingView;
  void *v8;
  void *v9;
  PUTilingView *v10;
  PUTilingView *v11;
  void *v12;
  PUTilingView *v13;

  v5 = (PUTilingView *)a3;
  p_tilingView = &self->__tilingView;
  tilingView = self->__tilingView;
  if (tilingView != v5)
  {
    v13 = v5;
    -[PUTilingView setTileSource:](tilingView, "setTileSource:", 0);
    -[PUTilingView setTileTransitionDelegate:](*p_tilingView, "setTileTransitionDelegate:", 0);
    -[PUTilingView setScrollDelegate:](*p_tilingView, "setScrollDelegate:", 0);
    -[PUTilingView setDelegate:](*p_tilingView, "setDelegate:", 0);
    objc_storeStrong((id *)&self->__tilingView, a3);
    -[PUTilingView setTileSource:](*p_tilingView, "setTileSource:", self);
    -[PUTilingView setTileTransitionDelegate:](*p_tilingView, "setTileTransitionDelegate:", self);
    -[PUTilingView setScrollDelegate:](*p_tilingView, "setScrollDelegate:", self);
    -[PUTilingView setDelegate:](*p_tilingView, "setDelegate:", self);
    -[PUScrubberView browsingSession](self, "browsingSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configureTilingView:", v13);

    -[PUScrubberView _tapGestureRecognizer](self, "_tapGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (PUTilingView *)objc_claimAutoreleasedReturnValue();
    v11 = *p_tilingView;

    if (v10 != v11)
    {
      objc_msgSend(v9, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeGestureRecognizer:", v9);

      -[PUTilingView addGestureRecognizer:](*p_tilingView, "addGestureRecognizer:", v9);
    }

    v5 = v13;
  }

}

- (void)_updateTilingViewIfNeeded
{
  void *v3;
  PUTilingView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  PUTilingView *v22;
  id v23;

  -[PUScrubberView _tilingView](self, "_tilingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [PUTilingView alloc];
    -[PUScrubberView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[PUScrubberView _scrubberLayout](self, "_scrubberLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[PUTilingView initWithFrame:layout:](v4, "initWithFrame:layout:", v13, v6, v8, v10, v12);

    -[PUTilingView setAutoresizingMask:](v22, "setAutoresizingMask:", 18);
    -[PUTilingView setTranslatesAutoresizingMaskIntoConstraints:](v22, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    -[PUTilingView setShowsHorizontalScrollIndicator:](v22, "setShowsHorizontalScrollIndicator:", 0);
    -[PUTilingView setShowsVerticalScrollIndicator:](v22, "setShowsVerticalScrollIndicator:", 0);
    -[PUTilingView setClipsToBounds:](v22, "setClipsToBounds:", 0);
    -[PUTilingView _setContentOffsetRoundingEnabled:](v22, "_setContentOffsetRoundingEnabled:", 0);
    -[PUTilingView _setAutomaticContentOffsetAdjustmentEnabled:](v22, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
    -[PUTilingView _setSupportsPointerDragScrolling:](v22, "_setSupportsPointerDragScrolling:", 1);
    -[PUScrubberView addSubview:](self, "addSubview:", v22);
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](v22, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUFilmstripTileViewReuseIdentifier"));
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](v22, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUScrubberImageTileViewReuseIdentifier"));
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](v22, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUPlayheadTileViewReuseIdentifier"));
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](v22, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUPlaybackTimeIndicatorTileViewReuseIdentifier"));
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](v22, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUVideoHighlightStripTileViewControllerReuseIdentifier"));
    -[PUScrubberView _setTilingView:](self, "_setTilingView:", v22);
    v3 = v22;
  }
  v23 = v3;
  objc_msgSend(v3, "layout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  v16 = v15;
  objc_msgSend(v14, "slitAspectRatio");
  v18 = v17 * v16;
  objc_msgSend(v14, "interItemSpacing");
  v20 = (v18 + v19) * -3.0;
  v21 = 0.0;
  if (v20 <= 0.0)
    v21 = v20;
  objc_msgSend(v23, "setLoadingInsets:", 0.0, v21, 0.0, v21);

}

- (id)_newScrubberLayoutWithDataSource:(id)a3
{
  id v4;
  PUScrubberTilingLayout *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;

  v4 = a3;
  v5 = -[PUSectionedTilingLayout initWithDataSource:]([PUScrubberTilingLayout alloc], "initWithDataSource:", v4);

  -[PUScrubberView itemCornerRadius](self, "itemCornerRadius");
  -[PUScrubberTilingLayout setItemCornerRadius:](v5, "setItemCornerRadius:");
  -[PUScrubberView slitAspectRatio](self, "slitAspectRatio");
  -[PUScrubberTilingLayout setSlitAspectRatio:](v5, "setSlitAspectRatio:");
  -[PUScrubberView interItemSpacing](self, "interItemSpacing");
  v7 = v6;
  -[PUScrubberView interSectionSpacing](self, "interSectionSpacing");
  v9 = v8;
  -[PUScrubberTilingLayout setInterItemSpacing:](v5, "setInterItemSpacing:", v7, v7);
  -[PUSectionedTilingLayout setInterSectionSpacing:](v5, "setInterSectionSpacing:", v9, v9);
  -[PUScrubberTilingLayout setUseEmbeddedVideoScrubber:](v5, "setUseEmbeddedVideoScrubber:", -[PUScrubberView useEmbeddedVideoScrubber](self, "useEmbeddedVideoScrubber"));
  if (-[PUScrubberView useEmbeddedVideoScrubber](self, "useEmbeddedVideoScrubber"))
    -[PUScrubberTilingLayout setExpandedItemPadding:](v5, "setExpandedItemPadding:", 8.0);
  +[PUScrubberSettings sharedInstance](PUScrubberSettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "verticalMargin");
  v12 = v11;

  -[PUScrubberView topOutset](self, "topOutset");
  -[PUScrubberTilingLayout setContentPadding:](v5, "setContentPadding:", v12 + v13, 0.0, v12, 0.0);
  -[PUScrubberTilingLayout setPlayheadVerticalOverhang:](v5, "setPlayheadVerticalOverhang:", v12 * 0.5);
  -[PUScrubberTilingLayout setDelegate:](v5, "setDelegate:", self);
  return v5;
}

- (BOOL)_isLibraryScrubbing
{
  PUScrubberView *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  -[PUScrubberView browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitionDriverIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v5, "isEqualToString:", v2->_scrubbingIdentifier);
  return (char)v2;
}

- (BOOL)_isContentScrubbing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[PUScrubberView browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitionDriverIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUScrubberView _scrubberLayout](self, "_scrubberLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", self->_contentScrubbingIdentifier))
  {
    -[PUScrubberView _videoScrubberController](self, "_videoScrubberController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "expandedItemIndexPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8 != 0;

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_isDrivingPlayheadProgress
{
  void *v3;
  char v4;

  -[PUScrubberView _tilingView](self, "_tilingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUScrubberView _isHandlingUserScroll](self, "_isHandlingUserScroll")
    || (objc_msgSend(v3, "isTracking") & 1) != 0
    || (objc_msgSend(v3, "isDecelerating") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isDragging");
  }

  return v4;
}

- (BOOL)_allowExitFromContentScrubbing
{
  void *v3;
  BOOL v4;

  if (!-[PUScrubberView _isScrubbingAwayFromContentEdge](self, "_isScrubbingAwayFromContentEdge")
    && -[PUScrubberView _expandedItemType](self, "_expandedItemType") != 1
    && -[PUScrubberView _expandedItemType](self, "_expandedItemType") != 4)
  {
    return 0;
  }
  -[PUScrubberView _tilingView](self, "_tilingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isTracking"))
    v4 = -[PUScrubberView type](self, "type") != 1;
  else
    v4 = 0;

  return v4;
}

- (void)_handleUserScrollWillBegin:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL8 v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  int *v46;
  int v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;

  v3 = a3;
  -[PUScrubberView _setIsHandlingUserScroll:](self, "_setIsHandlingUserScroll:", 1);
  -[PUScrubberView _updateScrubbingAwayFromContentEdgeBeganDragging:](self, "_updateScrubbingAwayFromContentEdgeBeganDragging:", v3);
  if (v3)
    -[PUScrubberView _setDecelerationTargetIndexPath:](self, "_setDecelerationTargetIndexPath:", 0);
  -[PUScrubberView _tilingView](self, "_tilingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isDragging") & 1) != 0 || objc_msgSend(v5, "isDecelerating"))
    -[PUScrubberView _setScrollViewSettled:](self, "_setScrollViewSettled:", 0);
  -[PUScrubberView _scrubberLayout](self, "_scrubberLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUScrubberView _currentAssetsDataSource](self, "_currentAssetsDataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v7)
  {

    v13 = (uint64_t)v7;
  }
  else
  {
    v9 = v8;
    v10 = objc_msgSend(v8, "isEqual:", v7);

    if ((v10 & 1) != 0)
      goto LABEL_11;
    -[PUScrubberView updateIfNeeded](self, "updateIfNeeded");
    -[PUScrubberView _tilingView](self, "_tilingView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutIfNeeded");

    -[PUScrubberView _scrubberLayout](self, "_scrubberLayout");
    v12 = objc_claimAutoreleasedReturnValue();

    -[PUScrubberView _currentAssetsDataSource](self, "_currentAssetsDataSource");
    v13 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v12;
  }

  v7 = (id)v13;
LABEL_11:
  objc_msgSend(v6, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqual:", v7) & 1) == 0)
  {
    objc_msgSend(v6, "dataSource");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15 == v7)
      goto LABEL_15;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUScrubberView.m"), 482, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[scrubberLayout.dataSource isEqual:assetsDataSource] || scrubberLayout.dataSource == assetsDataSource"));
  }

LABEL_15:
  -[PUScrubberView _videoScrubberController](self, "_videoScrubberController");
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v65 = 0;
    v66 = &v65;
    v67 = 0x2020000000;
    v68 = 0;
    goto LABEL_27;
  }
  v17 = (void *)v16;
  objc_msgSend(v6, "expandedItemIndexPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 0;
  if (!v18)
    goto LABEL_27;
  if (v3)
  {
    -[PUScrubberView _tilingView](self, "_tilingView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "panGestureRecognizer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUScrubberView _tilingView](self, "_tilingView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "locationInView:", v21);

    PXRectWithCenterAndSize();
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    -[PUScrubberView browsingSession](self, "browsingSession");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "viewModel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "currentAssetReference");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "indexPath");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUScrubberView _tilingView](self, "_tilingView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = MEMORY[0x1E0C809B0];
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __45__PUScrubberView__handleUserScrollWillBegin___block_invoke;
    v62[3] = &unk_1E58A7BF8;
    v36 = v33;
    v63 = v36;
    v64 = &v65;
    objc_msgSend(v34, "enumeratePresentedTileControllersInRect:usingBlock:", v62, v23, v25, v27, v29);

    -[PUScrubberView browsingSession](self, "browsingSession");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "viewModel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "assetViewModelForCurrentAssetReference");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "videoPlayer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (*((_BYTE *)v66 + 24))
    {
      v60[0] = v35;
      v60[1] = 3221225472;
      v60[2] = __45__PUScrubberView__handleUserScrollWillBegin___block_invoke_2;
      v60[3] = &unk_1E58ABD10;
      v61 = v40;
      objc_msgSend(v61, "performChanges:", v60);

      v41 = *((_BYTE *)v66 + 24) != 0;
    }
    else
    {
      v41 = 0;
    }
    -[PUScrubberView setCurrentDragBeganOnContent:](self, "setCurrentDragBeganOnContent:", v41);

    goto LABEL_26;
  }
  if (-[PUScrubberView _expandedItemType](self, "_expandedItemType") == 2
    || -[PUScrubberView _expandedItemType](self, "_expandedItemType") == 3)
  {
    objc_msgSend(v6, "currentItemFocusProgress");
    v43 = v42;
    -[PUScrubberView _videoScrubberController](self, "_videoScrubberController");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setPlayheadProgress:", v43);
LABEL_26:

  }
LABEL_27:
  objc_msgSend(v6, "currentItemIndexPath");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expandedItemIndexPath");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v44, "isEqual:", v45) & 1) != 0)
  {

    v46 = &OBJC_IVAR___PUScrubberView__contentScrubbingIdentifier;
  }
  else
  {
    v47 = *((unsigned __int8 *)v66 + 24);

    v46 = &OBJC_IVAR___PUScrubberView__contentScrubbingIdentifier;
    if (!v47)
      v46 = &OBJC_IVAR___PUScrubberView__scrubbingIdentifier;
  }
  v48 = *(id *)((char *)&self->super.super.super.isa + *v46);
  if (v44)
  {
    objc_msgSend(v6, "currentItemTransitionProgress");
    -[PUScrubberView _setScrubbingTransitionProgress:](self, "_setScrubbingTransitionProgress:");
    objc_msgSend(v7, "assetReferenceAtIndexPath:", v44);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v49)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUScrubberView.m"), 526, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetReference != nil"));

    }
    -[PUScrubberView browsingSession](self, "browsingSession");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "viewModel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __45__PUScrubberView__handleUserScrollWillBegin___block_invoke_3;
    v56[3] = &unk_1E58AB790;
    v52 = v51;
    v57 = v52;
    v53 = v49;
    v58 = v53;
    v59 = v48;
    objc_msgSend(v52, "performChanges:", v56);

  }
  -[PUScrubberView _invalidateSnapToExpandedItem](self, "_invalidateSnapToExpandedItem");
  -[PUScrubberView _setIsHandlingUserScroll:](self, "_setIsHandlingUserScroll:", 0);

  _Block_object_dispose(&v65, 8);
}

- (void)_handleTap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  PUScrubberView *v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v4 = a3;
  -[PUScrubberView _tilingView](self, "_tilingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUScrubberView browsingSession](self, "browsingSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "assetsDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__84295;
  v33 = __Block_byref_object_dispose__84296;
  v34 = 0;
  objc_msgSend(v4, "locationInView:", v5);
  v10 = v9;
  v12 = v11;
  v13 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __29__PUScrubberView__handleTap___block_invoke;
  v26[3] = &unk_1E58A7BF8;
  v14 = v8;
  v27 = v14;
  v28 = &v29;
  objc_msgSend(v5, "enumeratePresentedTileControllersInRect:usingBlock:", v26, v10, v12, 1.0, 1.0);
  if (v30[5])
  {
    objc_msgSend(v14, "assetReferenceAtIndexPath:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentAssetReference");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqual:", v15);

    if (v17)
    {
      objc_msgSend(v7, "assetViewModelForAssetReference:", v15);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "videoPlayer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "irisPlayer");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if (v19)
      {
        -[PUScrubberView _handleTapOnBrowsingVideoPlayer:](self, "_handleTapOnBrowsingVideoPlayer:", v19);
      }
      else if (v20)
      {
        -[PUScrubberView _handleTapOnBrowsingIrisPlayer:](self, "_handleTapOnBrowsingIrisPlayer:", v20);
      }

    }
    else
    {
      v22[0] = v13;
      v22[1] = 3221225472;
      v22[2] = __29__PUScrubberView__handleTap___block_invoke_2;
      v22[3] = &unk_1E58AB790;
      v23 = v7;
      v24 = v15;
      v25 = self;
      objc_msgSend(v23, "performChanges:", v22);

      v18 = v23;
    }

  }
  _Block_object_dispose(&v29, 8);

}

- (void)_handleTapOnBrowsingVideoPlayer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id *v7;
  id v8;
  _QWORD *v9;
  void *v10;
  int v11;
  uint64_t v12;
  id v13;
  void *v14;
  int v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v3 = a3;
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "canPlayLoopingVideo") & 1) == 0)
  {
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "allowAutoplayVideoForAsset:", v4);

    if (v6)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __50__PUScrubberView__handleTapOnBrowsingVideoPlayer___block_invoke;
      v24[3] = &unk_1E58ABD10;
      v7 = &v25;
      v8 = v3;
      v25 = v8;
      v9 = v24;
    }
    else
    {
      objc_msgSend(v3, "asset");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "canPlayLoopingVideo");

      if ((v11 & 1) == 0)
      {
        v12 = MEMORY[0x1E0C809B0];
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __50__PUScrubberView__handleTapOnBrowsingVideoPlayer___block_invoke_2;
        v22[3] = &unk_1E58ABD10;
        v7 = &v23;
        v13 = v3;
        v23 = v13;
        objc_msgSend(v13, "performChanges:", v22);
        +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "allowPlayButtonInBars");

        if (v15)
        {
          if ((unint64_t)objc_msgSend(v13, "desiredPlayState") <= 2)
            v16 = 4;
          else
            v16 = 2;
          v19[0] = v12;
          v19[1] = 3221225472;
          v19[2] = __50__PUScrubberView__handleTapOnBrowsingVideoPlayer___block_invoke_3;
          v19[3] = &unk_1E58AACF0;
          v20 = v13;
          v21 = v16;
          objc_msgSend(v20, "performChanges:", v19);

        }
        goto LABEL_7;
      }
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __50__PUScrubberView__handleTapOnBrowsingVideoPlayer___block_invoke_4;
      v17[3] = &unk_1E58ABD10;
      v7 = &v18;
      v8 = v3;
      v18 = v8;
      v9 = v17;
    }
    objc_msgSend(v8, "performChanges:", v9);
LABEL_7:

  }
}

- (void)_handleTapOnBrowsingIrisPlayer:(id)a3
{
  id v3;
  id *v4;
  id v5;
  _QWORD *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  _QWORD v10[2];
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  if ((objc_msgSend(v3, "isActivated") & 1) == 0)
  {
    if (v3)
    {
      objc_msgSend(v3, "currentVideoDuration");
      if ((v11 & 0x100000000) != 0)
      {
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __49__PUScrubberView__handleTapOnBrowsingIrisPlayer___block_invoke;
        v9[3] = &unk_1E58ABD10;
        v4 = (id *)v10;
        v5 = v3;
        v10[0] = v5;
        v6 = v9;
LABEL_8:
        objc_msgSend(v5, "performChanges:", v6);

        goto LABEL_9;
      }
    }
    else
    {
      v10[1] = 0;
      v11 = 0;
      v12 = 0;
    }
  }
  if (objc_msgSend(v3, "isActivated"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__PUScrubberView__handleTapOnBrowsingIrisPlayer___block_invoke_2;
    v7[3] = &unk_1E58ABD10;
    v4 = &v8;
    v5 = v3;
    v8 = v5;
    v6 = v7;
    goto LABEL_8;
  }
LABEL_9:

}

- (double)_lengthForDuration:(double)a3
{
  void *v4;
  double v5;
  double v6;
  float v7;
  double v8;
  double v9;

  +[PUScrubberSettings sharedInstance](PUScrubberSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minVideoDuration");
  if (v5 <= a3)
    v5 = a3;
  if (v5 >= 2.0)
  {
    v7 = v5;
    v6 = log2f(v7);
  }
  else
  {
    v6 = v5 * 0.5;
  }
  objc_msgSend(v4, "baseVideoWidth");
  v9 = v6 * v8;

  return v9;
}

- (id)_currentAssetsDataSource
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[PUScrubberView browsingSession](self, "browsingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "assetsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    +[PUAssetsDataSource emptyDataSource](PUAssetsDataSource, "emptyDataSource");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)_expandedAssetReference
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  id v12;

  if (!-[PUScrubberView canExpandCurrentAsset](self, "canExpandCurrentAsset"))
    return 0;
  -[PUScrubberView browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "currentAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetViewModelForAssetReference:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "videoPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "irisPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUScrubberView _expandedItemType](self, "_expandedItemType") != 4)
  {
    if ((-[PUScrubberView _expandedItemType](self, "_expandedItemType") == 2
       || -[PUScrubberView _expandedItemType](self, "_expandedItemType") == 1)
      && (objc_msgSend(v6, "isLivePhoto") & 1) == 0
      && (objc_msgSend(v6, "canPlayPhotoIris") & 1) == 0)
    {
      if (objc_msgSend(v6, "playbackStyle") != 4
        || (objc_msgSend(v8, "isActivated") & 1) == 0 && objc_msgSend(v8, "desiredPlayState") != 3)
      {
        goto LABEL_16;
      }
    }
    else if (-[PUScrubberView _expandedItemType](self, "_expandedItemType") != 3
           || !objc_msgSend(v9, "isActivated"))
    {
      goto LABEL_16;
    }
LABEL_12:
    v11 = v5;
    goto LABEL_17;
  }
  if (objc_msgSend(v6, "playbackStyle") == 4)
    goto LABEL_12;
LABEL_16:
  v11 = 0;
LABEL_17:
  v12 = v11;

  return v12;
}

- (void)_invalidateScrubberLayoutEnsureTransition
{
  self->_scrubberLayoutNeedsTransition = 1;
  -[PUScrubberView _invalidateScrubberLayout](self, "_invalidateScrubberLayout");
}

- (void)_invalidateScrubberLayout
{
  self->_scrubberLayoutIsValid = 0;
  -[PUScrubberView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateScrubberLayoutIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double Seconds;
  int *v26;
  void *v27;
  void *v28;
  double v29;
  _BOOL4 v30;
  int64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  int v45;
  unsigned int v46;
  double v47;
  double v48;
  double v49;
  int v51;
  void *v52;
  char v53;
  void *v54;
  id v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  _BOOL4 v65;
  int v66;
  id v67;
  void *v68;
  int v69;
  _BOOL4 v70;
  int v71;
  double v72;
  double v73;
  _BOOL4 v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  _BOOL4 v82;
  id v83;
  void *v84;
  double v85;
  int64_t v86;
  uint64_t v87;
  double v88;
  void *v89;
  double v90;
  double v91;
  void *v92;
  _BOOL8 v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  int v105;
  void *v106;
  void *v107;
  CMTime time;
  CMTime v109;

  if (!self->_scrubberLayoutIsValid)
  {
    self->_scrubberLayoutIsValid = 1;
    -[PUScrubberView _tilingView](self, "_tilingView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUScrubberView browsingSession](self, "browsingSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUScrubberView _currentAssetsDataSource](self, "_currentAssetsDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentAssetReference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPath");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetViewModelForAssetReference:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "videoPlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "irisPlayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = objc_msgSend(v8, "isDisplayingSearchQueryLabel");
    if (-[PUScrubberView _areLayoutTransitionsDisabled](self, "_areLayoutTransitionsDisabled")
      && !self->_scrubberLayoutNeedsTransition
      && !objc_msgSend(v5, "isChromeVisible"))
    {
LABEL_94:

      return;
    }
    v100 = v9;
    objc_msgSend(v9, "avPlayer");
    v11 = objc_claimAutoreleasedReturnValue();
    v99 = v3;
    v103 = v6;
    v97 = v7;
    if (objc_msgSend(v5, "isScrubbing")
      && -[PUScrubberView _isLibraryScrubbing](self, "_isLibraryScrubbing"))
    {
      v12 = 0;
      goto LABEL_21;
    }
    objc_msgSend(v7, "asset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "playbackStyle");

    if (v14 != 5)
    {
      objc_msgSend(v7, "asset");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "playbackStyle") == 4)
      {
        v17 = -[PUScrubberView useEmbeddedVideoScrubber](self, "useEmbeddedVideoScrubber");

        if (v17)
        {
          v15 = 4;
          if (v11)
            goto LABEL_10;
          goto LABEL_19;
        }
      }
      else
      {

      }
      v18 = v100;
      if (objc_msgSend(v100, "desiredPlayState") == 4 || (objc_msgSend(v100, "isActivated") & 1) != 0)
      {
        v15 = 2;
        if (v11)
          goto LABEL_10;
        goto LABEL_19;
      }
      if (objc_msgSend(v100, "desiredPlayState") == 3)
      {
        if (-[PUScrubberView _isLibraryScrubbing](self, "_isLibraryScrubbing"))
        {
          -[PUScrubberView _tilingView](self, "_tilingView");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v94, "isTracking") & 1) != 0 || (objc_msgSend(v94, "isDecelerating") & 1) != 0)
          {

            goto LABEL_9;
          }

          v18 = v100;
        }
        v15 = objc_msgSend(v18, "playState") != 5;
        if (v11)
          goto LABEL_10;
        goto LABEL_19;
      }
    }
LABEL_9:
    v15 = 0;
    if (v11)
    {
LABEL_10:
      -[PUScrubberView _setExpandedItemType:](self, "_setExpandedItemType:", v15);
LABEL_22:
      v19 = v10;
      -[PUScrubberView _videoScrubberController](self, "_videoScrubberController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "target");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "videoPlayer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v102 = (void *)v11;
      if (v22 != (void *)v11)
      {
        objc_msgSend(v7, "asset");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "duration");
        Seconds = v24;
        v26 = &OBJC_IVAR___PUPhotoViewContentHelper__fillMode;
        if (objc_msgSend(v23, "canPlayPhotoIris"))
        {
          memset(&v109, 0, sizeof(v109));
          if (v23)
          {
            objc_msgSend(v23, "photoIrisVideoDuration");
            if ((v109.flags & 1) != 0)
            {
              time = v109;
              Seconds = CMTimeGetSeconds(&time);
            }
          }
        }
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B9B0]), "initWithVideoPlayer:", v102);
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7BBC8]), "initWithTarget:estimatedDuration:", v27, Seconds);
        -[PUScrubberView _setVideoScrubberController:](self, "_setVideoScrubberController:", v28);
        objc_msgSend(v28, "playheadProgress");
        v30 = v29 > 0.0;

        v10 = v19;
        v6 = v103;
LABEL_32:
        -[PUScrubberView _expandedAssetReference](self, "_expandedAssetReference");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[PUScrubberView type](self, "type");
        +[PUScrubberSettings sharedInstance](PUScrubberSettings, "sharedInstance");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUScrubberView _scrubberLayout](self, "_scrubberLayout");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        v34 = v26[1014];
        if (*((_BYTE *)&self->super.super.super.isa + v34))
        {
          *((_BYTE *)&self->super.super.super.isa + v34) = 0;
          v30 = 1;
        }
        v95 = v8;
        v101 = v10;
        if (v32)
        {
          objc_msgSend(v32, "dataSource");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "identifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "identifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v36, "isEqualToString:", v37) ^ 1;

        }
        else
        {
          v38 = 1;
        }
        objc_msgSend(v107, "indexPath", v95);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "expandedItemIndexPath");
        v40 = objc_claimAutoreleasedReturnValue();
        v98 = v5;
        if (v39 == (void *)v40)
        {

        }
        else
        {
          v41 = (void *)v40;
          objc_msgSend(v107, "indexPath");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "expandedItemIndexPath");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v42, "isEqual:", v43);

          if (!v44)
          {
            v45 = 1;
LABEL_42:
            v46 = (v31 == 1) ^ objc_msgSend(v33, "onlyShowExpandedItem");
            -[PUScrubberView _expandedItemWidth](self, "_expandedItemWidth");
            v48 = v47;
            objc_msgSend(v33, "expandedItemWidth");
            if (v48 == v49 || v107 == 0)
              v51 = v46;
            else
              v51 = 1;
            -[PUScrubberView _decelerationTargetIndexPath](self, "_decelerationTargetIndexPath");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend(v106, "isEqual:", v52);
            v54 = v52;
            if ((v53 & 1) != 0)
              goto LABEL_49;
            if (v52)
            {
              if (!-[PUScrubberView _isHandlingScrollViewWillEndDragging](self, "_isHandlingScrollViewWillEndDragging"))
              {
                objc_msgSend(v104, "decelerationTargetExpansionDistance");
                if (v56 > 0.0)
                {
                  objc_msgSend(v99, "contentOffset");
                  v58 = v57;
                  v60 = v59;
                  -[PUScrubberView _decelerationTargetOffset](self, "_decelerationTargetOffset");
                  v63 = hypot(v61 - v58, v62 - v60);
                  objc_msgSend(v104, "decelerationTargetExpansionDistance");
                  v54 = v52;
                  if (v63 < v64)
                    goto LABEL_49;
                }
              }
            }
            if (-[PUScrubberView _useLoupe](self, "_useLoupe")
              && (v65 = -[PUScrubberView _isLibraryScrubbing](self, "_isLibraryScrubbing"), v54 = v106, v65))
            {
LABEL_49:
              v55 = v54;
            }
            else
            {
              v55 = 0;
            }
            v66 = v51 | v45;
            objc_msgSend(v33, "overrideLoupeIndexPath");
            v67 = (id)objc_claimAutoreleasedReturnValue();
            if (v67 != v55)
            {
              objc_msgSend(v33, "overrideLoupeIndexPath");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              v69 = objc_msgSend(v68, "isEqual:", v55) ^ 1;

              v66 |= v69;
            }

            v70 = -[PUScrubberView _useLoupe](self, "_useLoupe");
            if (v55)
              v71 = 1;
            else
              v71 = v70;
            if (v71)
              v72 = 1.0;
            else
              v72 = 0.0;
            objc_msgSend(v33, "loupeAmount");
            v75 = v73 != v72 && v107 == 0;
            if (-[PUScrubberView useThinLoupe](self, "useThinLoupe"))
              -[PUScrubberView slitAspectRatio](self, "slitAspectRatio");
            else
              objc_msgSend(v104, "maxAspectRatio");
            v77 = v76;
            v6 = v103;
            objc_msgSend(v33, "maxAspectRatio");
            v79 = v78;
            if (v105)
              v80 = -30.0;
            else
              v80 = 0.0;
            objc_msgSend(v33, "timeIndicatorVerticalOffset");
            v82 = v80 != v81;
            if (v77 != v79)
              v82 = 1;
            if ((v82 | v75 | v66) == 1)
            {
              v83 = -[PUScrubberView _newScrubberLayoutWithDataSource:](self, "_newScrubberLayoutWithDataSource:", v103);

              objc_msgSend(v107, "indexPath");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "setExpandedItemIndexPath:", v84);

              objc_msgSend(v83, "setOnlyShowExpandedItem:", v31 == 1);
              -[PUScrubberView _setScrubberLayout:](self, "_setScrubberLayout:", v83);
              v33 = v83;
            }
            v5 = v98;
            v3 = v99;
            v85 = -24.0;
            if (!v105)
              v85 = 0.0;
            objc_msgSend(v33, "setTimeIndicatorVerticalOffset:", v85);
            objc_msgSend(v33, "setMaxAspectRatio:", v77);
            objc_msgSend(v33, "setOverrideLoupeIndexPath:", v55);
            objc_msgSend(v33, "setLoupeAmount:", v72);
            objc_msgSend(v33, "setExpandedItemWidth:", v48);
            objc_msgSend(v33, "setShouldHighlightSelectedItems:", objc_msgSend(v98, "isInSelectionMode"));
            v86 = -[PUScrubberView _expandedItemType](self, "_expandedItemType");
            if (v86 == 3)
              v87 = objc_msgSend(v101, "isPlaying") ^ 1;
            else
              v87 = v86 == 2;
            objc_msgSend(v33, "setShowPlayheadForExpandedItem:", v87);
            switch(-[PUScrubberView _expandedItemType](self, "_expandedItemType"))
            {
              case 0:
              case 1:
              case 4:
                v88 = 0.5;
                break;
              case 2:
                -[PUScrubberView _videoScrubberController](self, "_videoScrubberController");
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v89, "playheadProgress");
                v88 = v90;

                break;
              case 3:
                -[PUScrubberView _playheadProgressForIrisAssetReference:](self, "_playheadProgressForIrisAssetReference:", v107);
                v88 = v91;
                break;
              default:
                v88 = 0.0;
                break;
            }
            objc_msgSend(v33, "setExpandedItemPlayheadProgress:", v88);
            objc_msgSend(v33, "setSnapToExpandedItem:", -[PUScrubberView _allowExitFromContentScrubbing](self, "_allowExitFromContentScrubbing") ^ 1);
            objc_msgSend(v99, "layout");
            v92 = (void *)objc_claimAutoreleasedReturnValue();

            if (v92 != v33)
            {
              v93 = -[PUScrubberView _useSmoothingTransitionCoordinator](self, "_useSmoothingTransitionCoordinator");
              -[PUScrubberView _setUseSmoothingTransitionCoordinator:](self, "_setUseSmoothingTransitionCoordinator:", 0);
              objc_msgSend(v99, "transitionToLayout:", v33);
              objc_msgSend(v99, "layoutIfNeeded");
              -[PUScrubberView _setUseSmoothingTransitionCoordinator:](self, "_setUseSmoothingTransitionCoordinator:", v93);
            }

            v8 = v96;
            v7 = v97;
            v9 = v100;
            v10 = v101;
            goto LABEL_94;
          }
        }
        v45 = v38 | v30;
        goto LABEL_42;
      }
      v30 = 0;
      v10 = v19;
      v6 = v103;
LABEL_31:
      v26 = &OBJC_IVAR___PUPhotoViewContentHelper__fillMode;
      goto LABEL_32;
    }
LABEL_19:
    if ((objc_msgSend(v10, "isActivated") & 1) == 0)
    {
      -[PUScrubberView _setExpandedItemType:](self, "_setExpandedItemType:", v15);
      goto LABEL_30;
    }
    objc_msgSend(v10, "videoPlayer");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = 3;
LABEL_21:
    -[PUScrubberView _setExpandedItemType:](self, "_setExpandedItemType:", v12);
    if (v11)
      goto LABEL_22;
LABEL_30:
    -[PUScrubberView _setVideoScrubberController:](self, "_setVideoScrubberController:", 0);
    v102 = 0;
    v30 = 0;
    goto LABEL_31;
  }
}

- (void)_updateScrubbingAwayFromContentEdgeBeganDragging:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  _BOOL4 v8;
  uint64_t v9;

  v3 = a3;
  -[PUScrubberView _videoScrubberController](self, "_videoScrubberController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PUScrubberView _videoScrubberController](self, "_videoScrubberController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playheadProgress");
    v8 = v7 < 0.99 && v7 > 0.00999999978;
    if (v3 && !v8 && -[PUScrubberView _scrollViewSettled](self, "_scrollViewSettled"))
      v9 = 1;
    else
      v9 = -[PUScrubberView _isScrubbingAwayFromContentEdge](self, "_isScrubbingAwayFromContentEdge") & !v8;

  }
  else
  {
    v9 = 0;
  }
  -[PUScrubberView _setScrubbingAwayFromContentEdge:](self, "_setScrubbingAwayFromContentEdge:", v9);
}

- (double)_expandedItemWidth
{
  void *v3;
  double v4;
  double Width;
  double v6;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  CGRect v15;

  if (-[PUScrubberView _expandedItemType](self, "_expandedItemType") == 1)
  {
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "autoplayScrubberWidth");
  }
  else
  {
    if (-[PUScrubberView _expandedItemType](self, "_expandedItemType") == 4)
    {
      -[PUScrubberView bounds](self, "bounds");
      Width = CGRectGetWidth(v15);
      -[PUScrubberView embeddedVideoScrubberWidthFraction](self, "embeddedVideoScrubberWidthFraction");
      return Width * v6;
    }
    -[PUScrubberView _videoScrubberController](self, "_videoScrubberController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[PUScrubberView browsingSession](self, "browsingSession");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "viewModel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "currentAssetReference");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "asset");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "duration");
      -[PUScrubberView _lengthForDuration:](self, "_lengthForDuration:");
      v9 = v14;

      return v9;
    }
    -[PUScrubberView _videoScrubberController](self, "_videoScrubberController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "length");
  }
  v9 = v4;

  return v9;
}

- (double)_playheadProgressForIrisAssetReference:(id)a3
{
  id v4;
  void *v5;
  int v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double Seconds;
  CMTime v14;
  CMTime time1;
  CMTime v16[2];

  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canPlayPhotoIris");

  v7 = 0.0;
  if (v6)
  {
    -[PUScrubberView browsingSession](self, "browsingSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "assetViewModelForAssetReference:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "irisPlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    memset(&v16[1], 0, sizeof(CMTime));
    if (v11)
    {
      objc_msgSend(v11, "currentPhotoTime");
      memset(v16, 0, 24);
      objc_msgSend(v11, "currentVideoDuration");
    }
    else
    {
      memset(v16, 0, 24);
    }
    time1 = v16[0];
    v14 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    if (CMTimeCompare(&time1, &v14) >= 1 && (v16[0].flags & 0x1D) == 1 && (v16[1].flags & 0x1D) == 1)
    {
      time1 = v16[1];
      Seconds = CMTimeGetSeconds(&time1);
      time1 = v16[0];
      v7 = Seconds / CMTimeGetSeconds(&time1);
    }

  }
  return v7;
}

- (id)tilingView:(id)a3 tileControllerWithIndexPath:(id)a4 kind:(id)a5 dataSource:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  PUScrubberView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  char v33;
  __CFString **v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  objc_class *v50;
  uint64_t v51;
  PUScrubberView *v52;
  void *v53;
  objc_class *v54;
  void *v55;
  void *v56;
  PUScrubberView *v58;
  void *v59;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[PUScrubberView browsingSession](self, "browsingSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "viewModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "assetsDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v13, "isEqual:", v16);

  if ((v17 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUScrubberView.m"), 967, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[dataSource isEqual:assetsDataSource]"));

  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("PUTileKindItemContent")))
  {
    v59 = v10;
    -[PUScrubberView browsingSession](self, "browsingSession");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "mediaProvider");
    v19 = self;
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "assetReferenceAtIndexPath:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "assetViewModelForAssetReference:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v19;
    if (!-[PUScrubberView useEmbeddedVideoScrubber](v19, "useEmbeddedVideoScrubber"))
    {
      objc_msgSend(v22, "asset");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "mediaType") == 2)
      {

LABEL_12:
        v34 = PUFilmstripTileViewReuseIdentifier;
LABEL_14:
        objc_msgSend(v59, "dequeueTileControllerWithReuseIdentifier:", *v34);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setAssetViewModel:", v22);
        objc_msgSend(v24, "setMediaProvider:", v20);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "scrubberPlaceholderColor");
          v36 = v15;
          v37 = v16;
          v38 = v12;
          v39 = v11;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setPlaceholderColor:", v40);

          v11 = v39;
          v12 = v38;
          v16 = v37;
          v15 = v36;

        }
        v10 = v59;
        goto LABEL_17;
      }
      objc_msgSend(v22, "asset");
      v56 = v15;
      v29 = v16;
      v30 = v12;
      v31 = v11;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "canPlayPhotoIris");

      v11 = v31;
      v12 = v30;
      v16 = v29;
      v15 = v56;

      if ((v33 & 1) != 0)
        goto LABEL_12;
    }
    v34 = &PUScrubberImageTileViewReuseIdentifier;
    goto LABEL_14;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("PUTileKindPlayhead")))
  {
    objc_msgSend(v10, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PUPlayheadTileViewReuseIdentifier"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("PUTileKindPlaybackTimeIndicator")))
  {
    objc_msgSend(v16, "assetReferenceAtIndexPath:", v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "assetViewModelForAssetReference:", v25);
    v26 = v11;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "videoPlayer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PUPlaybackTimeIndicatorTileViewReuseIdentifier"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDelegate:", self);
    objc_msgSend(v24, "setVideoPlayer:", v28);
    objc_msgSend(v24, "setViewModel:", v15);

    v11 = v26;
    goto LABEL_18;
  }
  if (!objc_msgSend(v12, "isEqualToString:", CFSTR("PUTileKindVideoHighlightStrip")))
    goto LABEL_24;
  objc_msgSend(v10, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PUVideoHighlightStripTileViewControllerReuseIdentifier"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = self;
  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (objc_class *)objc_opt_class();
    NSStringFromClass(v50);
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = self;
    v53 = (void *)v51;
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, v52, CFSTR("PUScrubberView.m"), 1005, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[tilingView dequeueTileControllerWithReuseIdentifier:PUVideoHighlightStripTileViewControllerReuseIdentifier]"), v51);
LABEL_27:

    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (objc_class *)objc_opt_class();
    NSStringFromClass(v54);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "px_descriptionForAssertionMessage");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, v58, CFSTR("PUScrubberView.m"), 1005, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[tilingView dequeueTileControllerWithReuseIdentifier:PUVideoHighlightStripTileViewControllerReuseIdentifier]"), v53, v55);

    goto LABEL_27;
  }
LABEL_23:
  objc_msgSend(v16, "assetReferenceAtIndexPath:", v11);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "assetViewModelForAssetReference:", v42);
  v43 = v11;
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAssetViewModel:", v44);
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "videoHighlightColor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setHighlightColor:", v46);

  v11 = v43;
LABEL_17:
  self = v58;
LABEL_18:
  if (!v24)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUScrubberView.m"), 1014, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tileController != nil"));

    v24 = 0;
  }

  return v24;
}

- (float)layout:(id)a3 aspectRatioForItemAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  float v14;
  _BOOL4 v15;
  _BOOL4 v16;
  int v17;
  float v18;
  float v19;
  void *v21;
  void *v22;

  v7 = a3;
  v8 = a4;
  -[PUScrubberView loupeAspectRatio](self, "loupeAspectRatio");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PUScrubberView loupeAspectRatio](self, "loupeAspectRatio");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_aspectRatioByIndexPath, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(v7, "dataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUScrubberView.m"), 1030, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[assetsDataSource isKindOfClass:[PUAssetsDataSource class]]"));

      }
      objc_msgSend(v11, "assetAtIndexPath:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "aspectRatio");
      v14 = v13;
      v15 = (LODWORD(v14) & 0x7FFFFFFFu) - 1 < 0x7FFFFF;
      v16 = ((LODWORD(v14) & 0x7FFFFFFFu) - 0x800000) >> 24 < 0x7F;
      if (v14 >= 0.0)
      {
        v16 = 0;
        v15 = 0;
      }
      if (!fabs(v13))
        v15 = 1;
      v17 = COERCE_INT(fabs(v13)) == 2139095040 || v15;
      if (COERCE_UNSIGNED_INT(fabs(v13)) > 0x7F800000)
        v17 = 1;
      if ((v17 | v16) == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUScrubberView.m"), 1033, CFSTR("Asset:%@ must provide a valid aspect ratio, got:%f."), v12, v14);

      }
      *(float *)&v13 = v14;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_aspectRatioByIndexPath, "setObject:forKeyedSubscript:", v10, v8);

    }
  }
  objc_msgSend(v10, "floatValue");
  v19 = v18;

  return v19;
}

- (BOOL)layout:(id)a3 shouldShowTimeIndicatorForExpandedItemAtIndexPath:(id)a4
{
  id v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  void *v13;

  v7 = a3;
  v8 = a4;
  if (-[PUScrubberView useEmbeddedVideoScrubber](self, "useEmbeddedVideoScrubber"))
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    objc_msgSend(v7, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUScrubberView.m"), 1050, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[assetsDataSource isKindOfClass:[PUAssetsDataSource class]]"));

    }
    objc_msgSend(v10, "assetAtIndexPath:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "canPlayPhotoIris") ^ 1;

  }
  return v9;
}

- (BOOL)layout:(id)a3 isItemAtAtIndexPathSelected:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  _QWORD v17[4];

  v5 = a4;
  -[PUScrubberView browsingSession](self, "browsingSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "px_selectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "identifier");
    v12 = objc_msgSend(v5, "section");
    v13 = objc_msgSend(v5, "item");

    objc_msgSend(v9, "selectedIndexPaths");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    v17[1] = v12;
    v17[2] = v13;
    v17[3] = 0x7FFFFFFFFFFFFFFFLL;
    v15 = objc_msgSend(v14, "containsIndexPath:", v17);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForTransitionFromLayout:(id)a4 toLayout:(id)a5 withContext:(id)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;

  +[PUTileTransitionCoordinator browsingTileTransitionCoordinatorForTransitionFromLayout:toLayout:withTilingView:anchorAssetReference:context:](PUTileTransitionCoordinator, "browsingTileTransitionCoordinatorForTransitionFromLayout:toLayout:withTilingView:anchorAssetReference:context:", a4, a5, a3, 0, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUScrubberView browsingSession](self, "browsingSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transitionDriverIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUScrubberView _decelerationTargetIndexPath](self, "_decelerationTargetIndexPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    if ((objc_msgSend(v10, "isEqual:", self->_transitionLayoutIdentifier) & 1) == 0
      && !objc_msgSend(v10, "isEqual:", CFSTR("PUBrowsingViewModelTransitionDriverIdentifierLivePhotoOverlay")))
    {
      objc_msgSend(v7, "setAnimationDuration:", &unk_1E59BC6F0);
      goto LABEL_9;
    }
    v16 = (void *)MEMORY[0x1E0CB37E8];
    +[PUScrubberSettings sharedInstance](PUScrubberSettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tapAnimationDuration");
    goto LABEL_7;
  }
  +[PUScrubberSettings sharedInstance](PUScrubberSettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUScrubberView _decelerationDistance](self, "_decelerationDistance");
  v14 = v13;
  objc_msgSend(v12, "settleRequiredDecelerationDistance");
  if (v14 > v15)
  {
    v16 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v12, "settleAnimationDuration");
LABEL_7:
    objc_msgSend(v16, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAnimationDuration:", v17);

  }
LABEL_9:

  return v7;
}

- (id)tilingView:(id)a3 dataSourceConverterForTransitionFromLayout:(id)a4 toLayout:(id)a5
{
  return +[PUOneUpAssetsDataSourceConverter defaultConverter](PUOneUpAssetsDataSourceConverter, "defaultConverter", a3, a4, a5);
}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForChangeFromFrame:(CGRect)a4 toFrame:(CGRect)a5 duration:(double)a6
{
  void *v6;

  if (a6 <= 0.0)
  {
    v6 = 0;
  }
  else
  {
    +[PUTileTransitionCoordinator defaultTileTransitionCoordinatorForFrameChangeWithTileCrossFade:tilingView:](PUTileTransitionCoordinator, "defaultTileTransitionCoordinatorForFrameChangeWithTileCrossFade:tilingView:", 0, a3, a6, a4.origin.y, a4.size.width, a4.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForLayoutInvalidationContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "invalidatedExpandedItem"))
  {
    +[PUTileTransitionCoordinator defaultTileTransitionCoordinatorForFrameChangeWithTileCrossFade:tilingView:](PUDefaultFrameChangeTileTransitionCoordinator, "defaultTileTransitionCoordinatorForFrameChangeWithTileCrossFade:tilingView:", 0, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  +[PUScrubberSettings sharedInstance](PUScrubberSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "useSmoothingAnimation"))
    v10 = v8 == 0;
  else
    v10 = 0;
  if (v10)
  {
    -[PUScrubberView _expandedAssetReference](self, "_expandedAssetReference");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      v8 = 0;
    }
    else
    {
      v13 = -[PUScrubberView _useSmoothingTransitionCoordinator](self, "_useSmoothingTransitionCoordinator");

      if (!v13)
      {
        v8 = 0;
        goto LABEL_16;
      }
      +[PUTileTransitionCoordinator defaultTileTransitionCoordinatorForFrameChangeWithTileCrossFade:tilingView:](PUDefaultFrameChangeTileTransitionCoordinator, "defaultTileTransitionCoordinatorForFrameChangeWithTileCrossFade:tilingView:", 0, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB37E8];
      +[PUScrubberSettings sharedInstance](PUScrubberSettings, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "smoothingAnimationDuration");
      objc_msgSend(v14, "numberWithDouble:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAnimationDuration:", v12);
    }

  }
LABEL_16:

  return v8;
}

- (CGPoint)tilingView:(id)a3 initialVisibleOriginWithLayout:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  CGPoint result;

  v6 = a4;
  -[PUScrubberView browsingSession](self, "browsingSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUScrubberView _currentAssetsDataSource](self, "_currentAssetsDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v9);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUScrubberView.m"), 1123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[layout dataSource] isEqual:assetsDataSource]"));

  }
  objc_msgSend(v8, "currentAssetReference");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPathForAssetReference:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 && v9)
  {
    if (objc_msgSend(v9, "isEmpty"))
    {
LABEL_10:
      v14 = *MEMORY[0x1E0C9D648];
      v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      goto LABEL_13;
    }
    objc_msgSend(v9, "firstItemIndexPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!v13)
    goto LABEL_10;
  if (-[PUScrubberView _isLibraryScrubbing](self, "_isLibraryScrubbing"))
    -[PUScrubberView _scrubbingTransitionProgress](self, "_scrubbingTransitionProgress");
  else
    objc_msgSend(v8, "currentAssetTransitionProgress");
  objc_msgSend(v6, "visibleRectForScrollingToItemAtIndexPath:transitionProgress:", v13);
  v14 = v16;
  v15 = v17;

LABEL_13:
  v18 = v14;
  v19 = v15;
  result.y = v19;
  result.x = v18;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  int v6;
  char v7;
  _BOOL4 v8;
  id v9;

  v9 = a3;
  -[PUScrubberView _tilingView](self, "_tilingView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v9;
  if (v4 == v9)
  {
    -[PUScrubberView _invalidateLoupeEffect](self, "_invalidateLoupeEffect");
    if ((objc_msgSend(v9, "isDragging") & 1) != 0 || (objc_msgSend(v9, "isDecelerating") & 1) != 0)
      v6 = 1;
    else
      v6 = objc_msgSend(v9, "isTracking");
    v7 = objc_msgSend(v9, "pu_isPerformingScrollTest");
    v5 = v9;
    if ((v7 & 1) != 0
      || v6
      && (-[PUScrubberView _isContentScrubbing](self, "_isContentScrubbing")
       || (v8 = -[PUScrubberView _isLibraryScrubbing](self, "_isLibraryScrubbing"), v5 = v9, v8)))
    {
      -[PUScrubberView _handleUserScrollWillBegin:](self, "_handleUserScrollWillBegin:", 0);
      v5 = v9;
    }
  }

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUScrubberView _tilingView](self, "_tilingView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[PUScrubberView _handleUserScrollWillBegin:](self, "_handleUserScrollWillBegin:", 0);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  void *v8;
  void *v9;
  double x;
  double y;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  id v44;

  v44 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUScrubberView.m"), 1174, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[tilingView isKindOfClass:[PUTilingView class]]"));

  }
  -[PUScrubberView _scrubberLayout](self, "_scrubberLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "expandedItemIndexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[PUScrubberView _setHandlingScrollViewWillEndDragging:](self, "_setHandlingScrollViewWillEndDragging:", 1);
    -[PUScrubberView updateIfNeeded](self, "updateIfNeeded");
    x = a5->x;
    y = a5->y;
    objc_msgSend(v8, "focusPoint");
    v13 = v12;
    v15 = v14;
    objc_msgSend(v8, "coordinateSystem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "contentCoordinateSystem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v16, v17, v13, v15);
    v20 = v19;

    objc_msgSend(v44, "contentOffset");
    v23 = x + v18 - v21;
    v24 = y + v20 - v22;
    objc_msgSend(v44, "contentCoordinateSystem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coordinateSystem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v25, v26, v23, v24);
    v29 = v28;

    objc_msgSend(v8, "indexPathOfItemClosestToPoint:", v27, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      -[PUScrubberView _scrubberLayout](self, "_scrubberLayout");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "visibleRectForScrollingToItemAtIndexPath:transitionProgress:", v30, 0.0);
      v33 = v32;
      v35 = v34;
      objc_msgSend(v31, "coordinateSystem");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "contentCoordinateSystem");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v36, v37, v33, v35);
      v40 = v39;

    }
    else
    {
      v38 = x;
      v40 = y;
    }
    if ((PUPointIsEqualToPointWithTolerance() & 1) == 0)
    {
      a5->x = v38;
      a5->y = v40;
    }
    -[PUScrubberView _setDecelerationTargetIndexPath:](self, "_setDecelerationTargetIndexPath:", v30);
    -[PUScrubberView _setDecelerationTargetOffset:](self, "_setDecelerationTargetOffset:", v38, v40);
    objc_msgSend(v44, "contentOffset");
    -[PUScrubberView _setDecelerationDistance:](self, "_setDecelerationDistance:", (double)hypot(v38 - v41, v40 - v42));
    -[PUScrubberView _setHandlingScrollViewWillEndDragging:](self, "_setHandlingScrollViewWillEndDragging:", 0);

  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[PUScrubberView _endScrubbing](self, "_endScrubbing", a3);
}

- (void)_endScrubbing
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  -[PUScrubberView _tilingView](self, "_tilingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isTracking") & 1) == 0
    && (objc_msgSend(v3, "isDecelerating") & 1) == 0
    && (objc_msgSend(v3, "isDragging") & 1) == 0)
  {
    -[PUScrubberView _setScrollViewSettled:](self, "_setScrollViewSettled:", 1);
  }
  -[PUScrubberView browsingSession](self, "browsingSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __31__PUScrubberView__endScrubbing__block_invoke;
  v17[3] = &unk_1E58ABD10;
  v7 = v5;
  v18 = v7;
  objc_msgSend(v7, "performChanges:", v17);
  if (-[PUScrubberView _expandedItemType](self, "_expandedItemType") == 3
    || -[PUScrubberView _expandedItemType](self, "_expandedItemType") == 1)
  {
    objc_msgSend(v7, "currentAssetReference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assetViewModelForAssetReference:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "irisPlayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v6;
    v13 = 3221225472;
    v14 = __31__PUScrubberView__endScrubbing__block_invoke_2;
    v15 = &unk_1E58ABD10;
    v16 = v10;
    v11 = v10;
    objc_msgSend(v11, "performChanges:", &v12);
    -[PUScrubberView _updateScrollPositionAnimated:](self, "_updateScrollPositionAnimated:", 1, v12, v13, v14, v15);

  }
}

- (void)handleTouchGesture:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(a3, "state");
  if ((unint64_t)(v4 - 3) >= 2)
  {
    if (v4 == 1)
      -[PUScrubberView _handleUserScrollWillBegin:](self, "_handleUserScrollWillBegin:", 1);
  }
  else
  {
    -[PUScrubberView _tilingView](self, "_tilingView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isDecelerating") & 1) == 0 && (objc_msgSend(v5, "isDragging") & 1) == 0)
      -[PUScrubberView _endScrubbing](self, "_endScrubbing");

  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  SEL v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[PUScrubberView _tilingView](self, "_tilingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (objc_msgSend(v8, "chromeVisibilityDidChange"))
    {
      if (objc_msgSend(v7, "isChromeVisible"))
      {
        if (-[PUScrubberView _areLayoutTransitionsDisabled](self, "_areLayoutTransitionsDisabled"))
          -[PUScrubberView _invalidateScrubberLayout](self, "_invalidateScrubberLayout");
      }
      else
      {
        -[PUScrubberView _disableLayoutTransitionsForDuration:](self, "_disableLayoutTransitionsForDuration:", 0.5);
      }
    }
    v32 = a2;
    objc_msgSend(v7, "currentAssetReference");
    v10 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v10;
    if (v10)
    {
      objc_msgSend(v8, "assetViewModelChangesByAssetReference");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v14)
      {
        v15 = v14;
        v16 = 0;
        v17 = *(_QWORD *)v35;
        v31 = v9;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v35 != v17)
              objc_enumerationMutation(v13);
            v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_msgSend(v19, "videoPlayerChange");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v20, "avPlayerDidChange") & 1) != 0
              || (objc_msgSend(v20, "isActivatedDidChange") & 1) != 0)
            {
              -[PUScrubberView _invalidateScrubberLayout](self, "_invalidateScrubberLayout");

              v9 = v31;
              goto LABEL_31;
            }
            if ((objc_msgSend(v20, "desiredPlayStateDidChange") & 1) != 0
              || objc_msgSend(v20, "playStateDidChange"))
            {
              -[PUScrubberView _invalidateScrubberLayout](self, "_invalidateScrubberLayout");
            }
            if (objc_msgSend(v19, "isDisplayingSearchQueryLabelChanged"))
              -[PUScrubberView _invalidateScrubberLayout](self, "_invalidateScrubberLayout");
            objc_msgSend(v19, "irisPlayerChange");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v21, "activatedDidChange"))
            {
              -[PUScrubberView _invalidateScrubberLayoutEnsureTransition](self, "_invalidateScrubberLayoutEnsureTransition");
              -[PUScrubberView _invalidateLoupeEffect](self, "_invalidateLoupeEffect");
            }
            if (objc_msgSend(v21, "scrubbingPhotoTimeDidChange"))
              -[PUScrubberView _invalidateScrubberLayout](self, "_invalidateScrubberLayout");
            if (objc_msgSend(v21, "playingDidChange"))
              v16 = 1;

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          v9 = v31;
          if (v15)
            continue;
          break;
        }
      }
      else
      {
        v16 = 0;
      }
LABEL_31:

      LODWORD(v10) = v16 & 1;
    }
    if ((objc_msgSend(v8, "currentAssetDidChange") & 1) != 0
      || (objc_msgSend(v8, "currentAssetTransitionProgressDidChange") & 1) != 0
      || objc_msgSend(v8, "transitionDriverIdentifierDidChange"))
    {
      objc_msgSend(v7, "transitionDriverIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "isEqualToString:", self->_transitionLayoutIdentifier))
      {

LABEL_38:
        -[PUScrubberView _invalidateLoupeEffect](self, "_invalidateLoupeEffect");
        -[PUScrubberView _invalidateScrubberLayoutEnsureTransition](self, "_invalidateScrubberLayoutEnsureTransition");
        v25 = 1;
        goto LABEL_40;
      }
      objc_msgSend(v7, "transitionDriverIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("PUBrowsingViewModelTransitionDriverIdentifierLivePhotoOverlay"));

      if (v24)
        goto LABEL_38;
    }
    v25 = 0;
LABEL_40:
    if (objc_msgSend(v8, "transitionDriverIdentifierDidChange"))
      -[PUScrubberView _invalidateScrubberLayout](self, "_invalidateScrubberLayout");
    if ((objc_msgSend(v8, "currentAssetDidChange") & 1) != 0
      || (objc_msgSend(v8, "isScrubbingDidChange") & 1) != 0
      || objc_msgSend(v8, "isInSelectionModeDidChange"))
    {
      -[PUScrubberView _invalidateScrubberLayout](self, "_invalidateScrubberLayout");
    }
    objc_msgSend(v7, "assetsDataSource");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "assetsDataSourceDidChange") | v10) == 1)
    {
      -[NSMutableDictionary removeAllObjects](self->_aspectRatioByIndexPath, "removeAllObjects");
      -[PUScrubberView _setDecelerationTargetIndexPath:](self, "_setDecelerationTargetIndexPath:", 0);
      -[PUScrubberView _invalidateScrubberLayoutEnsureTransition](self, "_invalidateScrubberLayoutEnsureTransition");
    }
    -[PUScrubberView updateIfNeeded](self, "updateIfNeeded");
    -[PUScrubberView _scrubberLayout](self, "_scrubberLayout");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dataSource");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v26, "isEqual:", v28);

    if ((v29 & 1) != 0)
    {
      if ((v25 & 1) == 0)
      {
LABEL_50:
        if (!-[PUScrubberView _isLibraryScrubbing](self, "_isLibraryScrubbing")
          && !-[PUScrubberView _isContentScrubbing](self, "_isContentScrubbing")
          && ((objc_msgSend(v8, "currentAssetDidChange") & 1) != 0
           || (objc_msgSend(v8, "currentAssetTransitionProgressDidChange") & 1) != 0
           || objc_msgSend(v8, "transitionDriverIdentifierDidChange")))
        {
          -[PUScrubberView _setDecelerationTargetIndexPath:](self, "_setDecelerationTargetIndexPath:", 0);
          -[PUScrubberView _updateScrollPositionAnimated:](self, "_updateScrollPositionAnimated:", 0);
        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", v32, self, CFSTR("PUScrubberView.m"), 1345, CFSTR("Session and layout data sources are out of sync."));

      if ((v25 & 1) == 0)
        goto LABEL_50;
    }

  }
}

- (void)_updateScrollPositionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  id v25;
  CGRect v26;

  v3 = a3;
  -[PUScrubberView updateIfNeeded](self, "updateIfNeeded");
  -[PUScrubberView _tilingView](self, "_tilingView");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "layoutIfNeeded");
  -[PUScrubberView _scrubberLayout](self, "_scrubberLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUScrubberView _isContentScrubbing](self, "_isContentScrubbing"))
  {
    objc_msgSend(v5, "expandedItemIndexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visibleRectForScrollingToItemAtIndexPath:scrollPosition:", v6, 2);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
  }
  else
  {
    -[PUScrubberView browsingSession](self, "browsingSession");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "currentAssetReference");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "indexPath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v6, "currentAssetTransitionProgress");
      objc_msgSend(v5, "visibleRectForScrollingToItemAtIndexPath:transitionProgress:", v17);
      v8 = v18;
      v10 = v19;
      v12 = v20;
      v14 = v21;
    }
    else
    {
      v8 = *MEMORY[0x1E0C9D5E0];
      v10 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
      v12 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
      v14 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
    }

  }
  v26.origin.x = v8;
  v26.origin.y = v10;
  v26.size.width = v12;
  v26.size.height = v14;
  if (!CGRectIsInfinite(v26))
  {
    objc_msgSend(v5, "coordinateSystem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "contentCoordinateSystem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v22, v23, v8, v10);

    objc_msgSend(v25, "setContentOffset:animated:", v3, v24, 0.0);
    if (v3)
      objc_msgSend(v25, "px_cancelScrollGesture");
  }

}

- (BOOL)_areLayoutTransitionsDisabled
{
  return -[PUScrubberView _layoutTransitionsDisabledCount](self, "_layoutTransitionsDisabledCount") > 0;
}

- (void)_disableLayoutTransitionsForDuration:(double)a3
{
  dispatch_time_t v5;
  _QWORD v6[4];
  id v7;
  id location;

  -[PUScrubberView _setLayoutTransitionsDisabledCount:](self, "_setLayoutTransitionsDisabledCount:", -[PUScrubberView _layoutTransitionsDisabledCount](self, "_layoutTransitionsDisabledCount") + 1);
  objc_initWeak(&location, self);
  v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__PUScrubberView__disableLayoutTransitionsForDuration___block_invoke;
  v6[3] = &unk_1E58AB2F8;
  objc_copyWeak(&v7, &location);
  dispatch_after(v5, MEMORY[0x1E0C80D38], v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_reenableLayoutTransitions
{
  int64_t v3;

  v3 = -[PUScrubberView _layoutTransitionsDisabledCount](self, "_layoutTransitionsDisabledCount") - 1;
  -[PUScrubberView _setLayoutTransitionsDisabledCount:](self, "_setLayoutTransitionsDisabledCount:", v3);
  if (!v3)
  {
    -[PUScrubberView _invalidateScrubberLayout](self, "_invalidateScrubberLayout");
    -[PUScrubberView updateIfNeeded](self, "updateIfNeeded");
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v9 = a3;
  if ((void *)PXSelectionManagerObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUScrubberView.m"), 1426, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    v12 = v9;
    -[PUScrubberView _scrubberLayout](self, "_scrubberLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "shouldHighlightSelectedItems"))
      objc_msgSend(v10, "invalidateSelectedItems");

    v9 = v12;
  }

}

- (void)videoScrubberControllerDidUpdate:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  double v19;
  void *v20;
  uint64_t v21;
  id v22;

  v22 = a3;
  -[PUScrubberView _tilingView](self, "_tilingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PUScrubberView _scrubberLayout](self, "_scrubberLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "expandedItemWidth");
    v7 = v6;
    objc_msgSend(v22, "length");
    v9 = v8;

    if (v7 != v9)
      -[PUScrubberView _invalidateScrubberLayout](self, "_invalidateScrubberLayout");
    -[PUScrubberView _scrubberLayout](self, "_scrubberLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUScrubberView _videoScrubberController](self, "_videoScrubberController");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v10, "expandedItemIndexPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v22, "playheadProgress");
        v15 = v14;
        -[PUScrubberView _expandedAssetReference](self, "_expandedAssetReference");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "asset");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "canPlayPhotoIris");

        if (v18)
        {
          -[PUScrubberView _playheadProgressForIrisAssetReference:](self, "_playheadProgressForIrisAssetReference:", v16);
          v15 = v19;
        }
        -[PUScrubberView _scrubberLayout](self, "_scrubberLayout");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setExpandedItemPlayheadProgress:", v15);

        if (!-[PUScrubberView _isDrivingPlayheadProgress](self, "_isDrivingPlayheadProgress")
          && -[PUScrubberView _expandedItemType](self, "_expandedItemType") == 2)
        {
          v21 = objc_msgSend(v4, "_contentOffsetRoundingEnabled");
          objc_msgSend(v4, "_setContentOffsetRoundingEnabled:", 1);
          -[PUScrubberView _updateScrollPositionAnimated:](self, "_updateScrollPositionAnimated:", 0);
          objc_msgSend(v4, "_setContentOffsetRoundingEnabled:", v21);
        }

      }
    }

  }
}

- (void)videoScrubberController:(id)a3 desiredSeekTime:(id *)a4
{
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v15;
  int64_t var3;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  int64_t v20;

  -[PUScrubberView browsingSession](self, "browsingSession", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PUScrubberView _expandedItemType](self, "_expandedItemType");
  if (v8 == 2)
  {
    objc_msgSend(v7, "currentAssetReference");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assetViewModelForAssetReference:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "videoPlayer");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v15 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    objc_msgSend(v12, "setDesiredSeekTime:", &v15);
    goto LABEL_5;
  }
  if (v8 == 3)
  {
    objc_msgSend(v7, "currentAssetReference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assetViewModelForAssetReference:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "irisPlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUScrubberView _invalidateScrubberLayout](self, "_invalidateScrubberLayout");
    -[PUScrubberView updateIfNeeded](self, "updateIfNeeded");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __58__PUScrubberView_videoScrubberController_desiredSeekTime___block_invoke;
    v17[3] = &unk_1E58AA1F8;
    v18 = v11;
    v19 = *(_OWORD *)&a4->var0;
    v20 = a4->var3;
    v12 = v11;
    objc_msgSend(v12, "performChanges:", v17);

LABEL_5:
  }

}

- (BOOL)playbackTimeIndicatorTileViewControllerCanFlashIndicator:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double MaxX;
  BOOL v40;
  CGRect v42;
  CGRect v43;

  objc_msgSend(a3, "presentationLayoutInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUScrubberView _tilingView](self, "_tilingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSourceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentedTileControllerWithIndexPath:kind:dataSourceIdentifier:", v6, CFSTR("PUTileKindItemContent"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "presentationLayoutInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v9, "coordinateSystem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentCoordinateSystem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v18, v19, v11, v13);
    v22 = v21;

    -[PUScrubberView convertRect:fromView:](self, "convertRect:fromView:", v5, v20, v22, v15, v17);
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    -[PUScrubberView bounds](self, "bounds");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v42.origin.x = v24;
    v42.origin.y = v26;
    v42.size.width = v28;
    v42.size.height = v30;
    MaxX = CGRectGetMaxX(v42);
    v43.origin.x = v32;
    v43.origin.y = v34;
    v43.size.width = v36;
    v43.size.height = v38;
    v40 = MaxX > CGRectGetMaxX(v43);
  }
  else
  {
    v40 = 1;
  }

  return v40;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  id WeakRetained;
  char v10;
  void *v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PUScrubberView topOutset](self, "topOutset");
  if (y < v8
    && self->_delegateFlags.respondsToShouldIgnoreHitTestWithEvent
    && (WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        v10 = objc_msgSend(WeakRetained, "scrubberView:shouldIgnoreHitTest:withEvent:", self, v7, x, y),
        WeakRetained,
        (v10 & 1) != 0))
  {
    v11 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PUScrubberView;
    -[PUScrubberView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (PUBrowsingSession)browsingSession
{
  return self->_browsingSession;
}

- (int64_t)type
{
  return self->_type;
}

- (PUScrubberViewDelegate)delegate
{
  return (PUScrubberViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (double)topOutset
{
  return self->_topOutset;
}

- (void)setTopOutset:(double)a3
{
  self->_topOutset = a3;
}

- (double)itemCornerRadius
{
  return self->_itemCornerRadius;
}

- (void)setItemCornerRadius:(double)a3
{
  self->_itemCornerRadius = a3;
}

- (double)slitAspectRatio
{
  return self->_slitAspectRatio;
}

- (void)setSlitAspectRatio:(double)a3
{
  self->_slitAspectRatio = a3;
}

- (double)interItemSpacing
{
  return self->_interItemSpacing;
}

- (void)setInterItemSpacing:(double)a3
{
  self->_interItemSpacing = a3;
}

- (double)interSectionSpacing
{
  return self->_interSectionSpacing;
}

- (void)setInterSectionSpacing:(double)a3
{
  self->_interSectionSpacing = a3;
}

- (NSNumber)loupeAspectRatio
{
  return self->_loupeAspectRatio;
}

- (void)setLoupeAspectRatio:(id)a3
{
  objc_storeStrong((id *)&self->_loupeAspectRatio, a3);
}

- (BOOL)useEmbeddedVideoScrubber
{
  return self->_useEmbeddedVideoScrubber;
}

- (void)setUseEmbeddedVideoScrubber:(BOOL)a3
{
  self->_useEmbeddedVideoScrubber = a3;
}

- (BOOL)canExpandCurrentAsset
{
  return self->_canExpandCurrentAsset;
}

- (void)setCanExpandCurrentAsset:(BOOL)a3
{
  self->_canExpandCurrentAsset = a3;
}

- (double)embeddedVideoScrubberWidthFraction
{
  return self->_embeddedVideoScrubberWidthFraction;
}

- (void)setEmbeddedVideoScrubberWidthFraction:(double)a3
{
  self->_embeddedVideoScrubberWidthFraction = a3;
}

- (PUScrubberTilingLayout)_scrubberLayout
{
  return self->__scrubberLayout;
}

- (void)_setScrubberLayout:(id)a3
{
  objc_storeStrong((id *)&self->__scrubberLayout, a3);
}

- (PUTilingView)_tilingView
{
  return self->__tilingView;
}

- (UITapGestureRecognizer)_tapGestureRecognizer
{
  return self->__tapGestureRecognizer;
}

- (PXVideoScrubberController)_videoScrubberController
{
  return self->__videoScrubberController;
}

- (int64_t)_expandedItemType
{
  return self->__expandedItemType;
}

- (void)_setExpandedItemType:(int64_t)a3
{
  self->__expandedItemType = a3;
}

- (BOOL)_isHandlingUserScroll
{
  return self->__isHandlingUserScroll;
}

- (void)_setIsHandlingUserScroll:(BOOL)a3
{
  self->__isHandlingUserScroll = a3;
}

- (BOOL)_isScrubbingAwayFromContentEdge
{
  return self->__isScrubbingAwayFromContentEdge;
}

- (BOOL)_scrollViewSettled
{
  return self->__scrollViewSettled;
}

- (void)_setScrollViewSettled:(BOOL)a3
{
  self->__scrollViewSettled = a3;
}

- (BOOL)_useLoupe
{
  return self->__useLoupe;
}

- (BOOL)useThinLoupe
{
  return self->_useThinLoupe;
}

- (BOOL)_useSmoothingTransitionCoordinator
{
  return self->__useSmoothingTransitionCoordinator;
}

- (void)_setUseSmoothingTransitionCoordinator:(BOOL)a3
{
  self->__useSmoothingTransitionCoordinator = a3;
}

- (BOOL)_snapToExpandedItem
{
  return self->__snapToExpandedItem;
}

- (NSIndexPath)_decelerationTargetIndexPath
{
  return self->__decelerationTargetIndexPath;
}

- (CGPoint)_decelerationTargetOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->__decelerationTargetOffset.x;
  y = self->__decelerationTargetOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setDecelerationTargetOffset:(CGPoint)a3
{
  self->__decelerationTargetOffset = a3;
}

- (double)_decelerationDistance
{
  return self->__decelerationDistance;
}

- (void)_setDecelerationDistance:(double)a3
{
  self->__decelerationDistance = a3;
}

- (int64_t)_layoutTransitionsDisabledCount
{
  return self->__layoutTransitionsDisabledCount;
}

- (void)_setLayoutTransitionsDisabledCount:(int64_t)a3
{
  self->__layoutTransitionsDisabledCount = a3;
}

- (double)_scrubbingTransitionProgress
{
  return self->__scrubbingTransitionProgress;
}

- (void)_setScrubbingTransitionProgress:(double)a3
{
  self->__scrubbingTransitionProgress = a3;
}

- (BOOL)_isHandlingScrollViewWillEndDragging
{
  return self->__isHandlingScrollViewWillEndDragging;
}

- (BOOL)currentDragBeganOnContent
{
  return self->_currentDragBeganOnContent;
}

- (void)setCurrentDragBeganOnContent:(BOOL)a3
{
  self->_currentDragBeganOnContent = a3;
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->__decelerationTargetIndexPath, 0);
  objc_storeStrong((id *)&self->__videoScrubberController, 0);
  objc_storeStrong((id *)&self->__tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__tilingView, 0);
  objc_storeStrong((id *)&self->__scrubberLayout, 0);
  objc_storeStrong((id *)&self->_loupeAspectRatio, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_browsingSession, 0);
  objc_storeStrong((id *)&self->_aspectRatioByIndexPath, 0);
  objc_storeStrong((id *)&self->_touchingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_transitionLayoutIdentifier, 0);
  objc_storeStrong((id *)&self->_contentScrubbingIdentifier, 0);
  objc_storeStrong((id *)&self->_scrubbingIdentifier, 0);
}

uint64_t __58__PUScrubberView_videoScrubberController_desiredSeekTime___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v3;
  uint64_t v4;

  v1 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  return objc_msgSend(v1, "setScrubbingPhotoTime:completion:", &v3, 0);
}

void __55__PUScrubberView__disableLayoutTransitionsForDuration___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reenableLayoutTransitions");

}

uint64_t __31__PUScrubberView__endScrubbing__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsScrubbing:", 0);
}

uint64_t __31__PUScrubberView__endScrubbing__block_invoke_2(uint64_t a1)
{
  void *v1;
  __int128 v3;
  uint64_t v4;

  v1 = *(void **)(a1 + 32);
  v3 = *MEMORY[0x1E0CA2E18];
  v4 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  return objc_msgSend(v1, "setScrubbingPhotoTime:completion:", &v3, 0);
}

uint64_t __49__PUScrubberView__handleTapOnBrowsingIrisPlayer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActivated:", 1);
}

uint64_t __49__PUScrubberView__handleTapOnBrowsingIrisPlayer___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActivated:", 0);
}

uint64_t __50__PUScrubberView__handleTapOnBrowsingVideoPlayer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActivated:", 1);
}

uint64_t __50__PUScrubberView__handleTapOnBrowsingVideoPlayer___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActivated:", 1);
}

uint64_t __50__PUScrubberView__handleTapOnBrowsingVideoPlayer___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDesiredPlayState:reason:", *(_QWORD *)(a1 + 40), CFSTR("User tapped on player in scrubber."));
}

uint64_t __50__PUScrubberView__handleTapOnBrowsingVideoPlayer___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setActivated:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setDesiredPlayState:reason:", 3, CFSTR("User tapped looping video in scrubber."));
}

void __29__PUScrubberView__handleTap___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "tileKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("PUTileKindItemContent"));

  if (v7)
  {
    objc_msgSend(v14, "dataSourceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
    {
      objc_msgSend(v14, "indexPath");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      *a4 = 1;
    }
  }

}

uint64_t __29__PUScrubberView__handleTap___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentAssetReference:transitionProgress:transitionDriverIdentifier:animated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 432), 0, 0.0);
}

void __45__PUScrubberView__handleUserScrollWillBegin___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  id v7;
  void *v8;
  int v9;

  v6 = *(id *)(a1 + 32);
  objc_msgSend(a3, "indexPath");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {

    goto LABEL_5;
  }
  v8 = v7;
  v9 = objc_msgSend(v6, "isEqual:", v7);

  if (v9)
  {
LABEL_5:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

uint64_t __45__PUScrubberView__handleUserScrollWillBegin___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setActivated:", 1);
  result = objc_msgSend(*(id *)(a1 + 32), "desiredPlayState");
  if (result == 3)
    return objc_msgSend(*(id *)(a1 + 32), "setDesiredPlayState:reason:", 4, CFSTR("User began scrubbing video while video was autoplaying"));
  return result;
}

uint64_t __45__PUScrubberView__handleUserScrollWillBegin___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentAssetReference:transitionProgress:transitionDriverIdentifier:animated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "setIsScrubbing:", 1);
}

void __31__PUScrubberView_endPreviewing__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "assetsDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startingAssetReference");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setCurrentAssetReference:transitionProgress:transitionDriverIdentifier:animated:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 416), 0, 0.0);
}

@end
