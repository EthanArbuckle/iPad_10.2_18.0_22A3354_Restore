@implementation PXBaseMessagesStackView

- (PXBaseMessagesStackView)initWithFrame:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  PXBaseMessagesStackView *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  PXGView *v12;
  PXGView *tungstenView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PXMessagesStackItemsLayout *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  double v22;
  void *v23;
  PXMessagesStackItemsLayout *layout;
  PXMessagesStackItemsLayout *v25;
  PXGDecoratingLayout *v26;
  PXGDecoratingLayout *decoratingLayout;
  PXGDecoratingLayout *v28;
  NSShadow *v29;
  NSShadow *centerItemShadow;
  double v31;
  void *v32;
  double v33;
  void *v34;
  uint64_t v35;
  PXEventCoalescer *settledEventCoalescer;
  __int128 v37;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)PXBaseMessagesStackView;
  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v7 = -[PXBaseMessagesStackView initWithFrame:](&v39, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v4, v5, v6);
  if (v7)
  {
    +[PXMessagesUISettings sharedInstance](PXMessagesUISettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_horizontalAlignment = 1;
    v7->_useAspectTiles = objc_msgSend(v8, "aspectTilesEnabled");
    v9 = objc_msgSend(v8, "renderWithCA");
    v10 = &unk_1E53E9150;
    if (!v9)
      v10 = 0;
    v11 = v10;
    v12 = -[PXGView initWithFrame:allowedPresentationTypes:]([PXGView alloc], "initWithFrame:allowedPresentationTypes:", v11, v3, v4, v5, v6);

    tungstenView = v7->_tungstenView;
    v7->_tungstenView = v12;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGView setBackgroundColor:](v7->_tungstenView, "setBackgroundColor:", v14);

    -[PXGView scrollViewController](v7->_tungstenView, "scrollViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scrollView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setAlwaysBounceVertical:", 0);
    objc_msgSend(v16, "setShowsHorizontalScrollIndicator:", 0);
    objc_msgSend(v16, "setShowsVerticalScrollIndicator:", 0);
    objc_msgSend(v16, "setDecelerationRate:", *MEMORY[0x1E0DC5360]);
    objc_msgSend(v16, "setClipsToBounds:", 0);
    -[PXGView scrollViewController](v7->_tungstenView, "scrollViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "registerObserver:", v7);

    v18 = objc_alloc_init(PXMessagesStackItemsLayout);
    -[PXMessagesStackItemsLayout setPresentationType:](v18, "setPresentationType:", 0);
    if (-[PXBaseMessagesStackView debugColorModeEnabled](v7, "debugColorModeEnabled"))
      v19 = 5;
    else
      v19 = objc_msgSend((id)objc_opt_class(), "itemMediaKind");
    -[PXMessagesStackItemsLayout setMediaKind:](v18, "setMediaKind:", v19);
    -[PXGLayout setContentSource:](v18, "setContentSource:", v7);
    -[PXMessagesStackItemsLayout setAccessoryPresentationType:](v18, "setAccessoryPresentationType:", 1);
    if (-[PXBaseMessagesStackView debugColorModeEnabled](v7, "debugColorModeEnabled"))
      v20 = 5;
    else
      v20 = objc_msgSend((id)objc_opt_class(), "accessoryMediaKind");
    -[PXMessagesStackItemsLayout setAccessoryMediaKind:](v18, "setAccessoryMediaKind:", v20);
    -[PXGItemsLayout setAccessoryItemContentSource:](v18, "setAccessoryItemContentSource:", v7);
    -[PXMessagesStackItemsLayout setPrimaryItemDelegate:](v18, "setPrimaryItemDelegate:", v7);
    -[PXMessagesStackItemsLayout setStackedItemsCount:](v18, "setStackedItemsCount:", objc_msgSend(v8, "stackedItemsCount"));
    v21 = objc_msgSend(v8, "renderWithCA");
    objc_msgSend(v8, "normalizedPageWidth");
    if (!v21)
      v22 = v22 * 0.5;
    -[PXMessagesStackItemsLayout setNormalizedPageWidth:](v18, "setNormalizedPageWidth:", v22);
    objc_msgSend(v8, "normalizedStackSizeTransform");
    -[PXMessagesStackItemsLayout setNormalizedStackSizeTransform:](v18, "setNormalizedStackSizeTransform:");
    objc_msgSend(v8, "horizontalOffsets");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXMessagesStackItemsLayout setNormalizedStackHorizontalOffsets:](v18, "setNormalizedStackHorizontalOffsets:", v23);

    objc_msgSend(v8, "rotationAngle");
    PXDegreesToRadians();
    -[PXMessagesStackItemsLayout setRotationAngle:](v18, "setRotationAngle:");
    -[PXMessagesStackItemsLayout setPresentationType:](v18, "setPresentationType:", objc_msgSend(v8, "renderWithCA"));
    -[PXMessagesStackItemsLayout scrollToBeginning](v18, "scrollToBeginning");
    layout = v7->_layout;
    v7->_layout = v18;
    v25 = v18;

    v26 = -[PXGDecoratingLayout initWithDecoratedLayout:]([PXGDecoratingLayout alloc], "initWithDecoratedLayout:", v25);
    -[PXGDecoratingLayout setAllowsViewDecorationHitTesting:](v26, "setAllowsViewDecorationHitTesting:", 1);
    -[PXGDecoratingLayout setActiveDecorations:](v26, "setActiveDecorations:", &unk_1E53E9168);
    -[PXGDecoratingLayout setDecorationSource:](v26, "setDecorationSource:", v7);
    -[PXGDecoratingLayout setContentSource:](v26, "setContentSource:", v7);
    decoratingLayout = v7->_decoratingLayout;
    v7->_decoratingLayout = v26;
    v28 = v26;

    -[PXGView setRootLayout:](v7->_tungstenView, "setRootLayout:", v28);
    -[PXBaseMessagesStackView addSubview:](v7, "addSubview:", v7->_tungstenView);
    -[PXBaseMessagesStackView registerAllTextureProvidersWithMediaProvider:](v7, "registerAllTextureProvidersWithMediaProvider:", 0);
    v29 = (NSShadow *)objc_alloc_init(MEMORY[0x1E0DC1298]);
    centerItemShadow = v7->_centerItemShadow;
    v7->_centerItemShadow = v29;

    objc_msgSend(v8, "stackShadowYOffset");
    -[NSShadow setShadowOffset:](v7->_centerItemShadow, "setShadowOffset:", 0.0, v31);
    objc_msgSend(v8, "stackShadowBlurRadius");
    -[NSShadow setShadowBlurRadius:](v7->_centerItemShadow, "setShadowBlurRadius:");
    v32 = (void *)MEMORY[0x1E0DC3658];
    objc_msgSend(v8, "stackShadowAlpha");
    objc_msgSend(v32, "colorWithWhite:alpha:", 0.0, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSShadow setShadowColor:](v7->_centerItemShadow, "setShadowColor:", v34);

    objc_msgSend(off_1E50B23F8, "delayedCoalescerWithDelay:", 0.2);
    v35 = objc_claimAutoreleasedReturnValue();
    settledEventCoalescer = v7->_settledEventCoalescer;
    v7->_settledEventCoalescer = (PXEventCoalescer *)v35;

    -[PXEventCoalescer registerObserver:](v7->_settledEventCoalescer, "registerObserver:", v7);
    -[PXBaseMessagesStackView setSettled:](v7, "setSettled:", 1);
    v7->_indexToRestore = 0x7FFFFFFFFFFFFFFFLL;
    v37 = *((_OWORD *)off_1E50B8778 + 1);
    *(_OWORD *)&v7->_lastKnownPrimaryIndex.dataSourceIdentifier = *(_OWORD *)off_1E50B8778;
    *(_OWORD *)&v7->_lastKnownPrimaryIndex.item = v37;

  }
  return v7;
}

- (PXBaseMessagesStackView)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXBaseMessagesStackView.m"), 125, CFSTR("%s is not available as initializer"), "-[PXBaseMessagesStackView initWithCoder:]");

  abort();
}

- (void)setDataSourceManager:(id)a3
{
  PXSectionedDataSourceManager *v5;
  PXSectionedDataSourceManager *dataSourceManager;
  __int128 v7;
  PXSectionedDataSourceManager *v8;

  v5 = (PXSectionedDataSourceManager *)a3;
  dataSourceManager = self->_dataSourceManager;
  if (dataSourceManager != v5)
  {
    v8 = v5;
    -[PXSectionedDataSourceManager unregisterChangeObserver:context:](dataSourceManager, "unregisterChangeObserver:context:", self, DataSourceManagerObservationContext_74806);
    objc_storeStrong((id *)&self->_dataSourceManager, a3);
    -[PXSectionedDataSourceManager registerChangeObserver:context:](self->_dataSourceManager, "registerChangeObserver:context:", self, DataSourceManagerObservationContext_74806);
    -[PXBaseMessagesStackView _updateDataSource](self, "_updateDataSource");
    v5 = v8;
    v7 = *((_OWORD *)off_1E50B8778 + 1);
    *(_OWORD *)&self->_lastKnownPrimaryIndex.dataSourceIdentifier = *(_OWORD *)off_1E50B8778;
    *(_OWORD *)&self->_lastKnownPrimaryIndex.item = v7;
  }

}

- (void)layoutSubviews
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;
  int64_t indexToRestore;
  double v24;
  double v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PXBaseMessagesStackView;
  -[PXBaseMessagesStackView layoutSubviews](&v26, sel_layoutSubviews);
  v3 = -[PXBaseMessagesStackView bounds](self, "bounds");
  v6 = MEMORY[0x1A85CD660](v3, 1.0, v4, v5);
  v8 = v7;
  -[NSShadow shadowOffset](self->_centerItemShadow, "shadowOffset");
  v10 = v9;
  -[NSShadow shadowBlurRadius](self->_centerItemShadow, "shadowBlurRadius");
  v12 = v11;
  v13 = -[PXBaseMessagesStackView horizontalAlignment](self, "horizontalAlignment");
  if (v13 && v13 != 2)
  {
    v15 = 0.0;
  }
  else
  {
    -[PXGLayout displayScale](self->_layout, "displayScale");
    PXFloatRoundToPixel();
    v15 = v14;
  }
  v16 = 0.0;
  v17 = v8;
  v18 = v6;
  if (!-[PXMessagesStackItemsLayout presentationType](self->_layout, "presentationType"))
  {
    v18 = v6 + v6;
    v17 = v8 + v10 + v12;
    v16 = v6 * 0.5;
    v15 = -(v6 * 0.5);
  }
  -[PXGView frame](self->_tungstenView, "frame");
  v21 = v20 == v17 && v19 == v18;
  indexToRestore = self->_indexToRestore;
  if (!v21 && indexToRestore == 0x7FFFFFFFFFFFFFFFLL)
    indexToRestore = -[PXMessagesStackItemsLayout primaryItemIndex](self->_layout, "primaryItemIndex");
  self->_indexToRestore = indexToRestore;
  -[PXGView setFrame:](self->_tungstenView, "setFrame:", v15, 0.0, v18, v17);
  -[PXBaseMessagesStackView verticalContentInsets](self, "verticalContentInsets");
  v25 = v24 / v8;
  if (v8 <= 0.0)
    v25 = 0.0;
  -[PXMessagesStackItemsLayout setNormalizedContentInsets:](self->_layout, "setNormalizedContentInsets:", v25);
  -[PXMessagesStackItemsLayout setDesiredLayoutRect:](self->_layout, "setDesiredLayoutRect:", v16, 0.0, v6, v8);
}

- (void)setDebugColorModeEnabled:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (self->_debugColorModeEnabled != a3)
  {
    self->_debugColorModeEnabled = a3;
    if (a3)
    {
      -[PXBaseMessagesStackView layout](self, "layout");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 5;
      objc_msgSend(v4, "setMediaKind:", 5);

    }
    else
    {
      v6 = objc_msgSend((id)objc_opt_class(), "itemMediaKind");
      -[PXBaseMessagesStackView layout](self, "layout");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMediaKind:", v6);

      v5 = objc_msgSend((id)objc_opt_class(), "accessoryMediaKind");
    }
    -[PXBaseMessagesStackView layout](self, "layout");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessoryMediaKind:", v5);

  }
}

- (BOOL)scrollToIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  BOOL v9;
  _QWORD v11[4];

  v4 = a4;
  -[PXBaseMessagesStackView currentDataSource](self, "currentDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "numberOfItemsInSection:", 0) <= a3)
  {
    v9 = 0;
  }
  else
  {
    v11[0] = objc_msgSend(v7, "identifier");
    v11[1] = 0;
    v11[2] = a3;
    v11[3] = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v7, "objectReferenceAtIndexPath:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXBaseMessagesStackView scrollToObjectReference:animated:](self, "scrollToObjectReference:animated:", v8, v4);

  }
  return v9;
}

- (BOOL)scrollToObjectReference:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  id v11;
  double v13;

  v4 = a4;
  v6 = a3;
  -[PXBaseMessagesStackView currentDataSource](self, "currentDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectReferenceForObjectReference:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v13 = 0.0;
    v9 = -[PXMessagesStackItemsLayout getHorizontalOffsetForObjectReference:outOffset:](self->_layout, "getHorizontalOffsetForObjectReference:outOffset:", v8, &v13);
    if (v9)
    {
      self->_isProgramaticallyScrolling = 1;
      -[PXGView scrollViewController](self->_tungstenView, "scrollViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scrollView");
      v11 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "px_scrollToContentOffset:animated:", v4, v13, 0.0);
      if (!v4)
        -[PXGView ensureUpdatedLayout](self->_tungstenView, "ensureUpdatedLayout");
      self->_indexToRestore = 0x7FFFFFFFFFFFFFFFLL;
      self->_isProgramaticallyScrolling = 0;

    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (unint64_t)currentIndex
{
  void *v2;
  unint64_t v3;

  -[PXBaseMessagesStackView layout](self, "layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "primaryItemIndex");

  return v3;
}

- (PXSectionedObjectReference)currentObjectReference
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v3 = -[PXBaseMessagesStackView currentIndex](self, "currentIndex");
  -[PXBaseMessagesStackView currentDataSource](self, "currentDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    v6 = 0;
    if (objc_msgSend(v4, "numberOfItemsInSection:", 0) > v3)
    {
      v8[0] = objc_msgSend(v5, "identifier");
      v8[1] = 0;
      v8[2] = v3;
      v8[3] = 0x7FFFFFFFFFFFFFFFLL;
      objc_msgSend(v5, "objectReferenceAtIndexPath:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return (PXSectionedObjectReference *)v6;
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PXBaseMessagesStackView tungstenView](self, "tungstenView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "panGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIPanGestureRecognizer *)v5;
}

- (void)setVerticalContentInsets:(double)a3
{
  if (self->_verticalContentInsets != a3)
  {
    self->_verticalContentInsets = a3;
    -[PXBaseMessagesStackView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)horizontalContentMargin
{
  double result;

  -[PXMessagesStackItemsLayout horizontalContentMargin](self->_layout, "horizontalContentMargin");
  return result;
}

- (double)horizontalContentMarginForSize:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double result;

  v4 = MEMORY[0x1A85CD660](self, a2, 1.0, a3.width, a3.height);
  v6 = v5;
  -[PXBaseMessagesStackView verticalContentInsets](self, "verticalContentInsets");
  v8 = v7 / v6;
  if (v6 <= 0.0)
    v9 = 0.0;
  else
    v9 = v8;
  -[PXMessagesStackItemsLayout horizontalContentMarginForSize:normalizedVerticalContentInsets:](self->_layout, "horizontalContentMarginForSize:normalizedVerticalContentInsets:", v4, v6, v9);
  return result;
}

- (void)setLeftEdgeHorizontalContentMarginAdjustment:(double)a3
{
  -[PXMessagesStackItemsLayout setLeftEdgeInternalHorizontalAlignment:](self->_layout, "setLeftEdgeInternalHorizontalAlignment:", a3);
}

- (double)leftEdgeHorizontalContentMarginAdjustment
{
  double result;

  -[PXMessagesStackItemsLayout leftEdgeInternalHorizontalAlignment](self->_layout, "leftEdgeInternalHorizontalAlignment");
  return result;
}

- (void)setRightEdgeHorizontalContentMarginAdjustment:(double)a3
{
  -[PXMessagesStackItemsLayout setRightEdgeInternalHorizontalAlignment:](self->_layout, "setRightEdgeInternalHorizontalAlignment:", a3);
}

- (double)rightEdgeHorizontalContentMarginAdjustment
{
  double result;

  -[PXMessagesStackItemsLayout rightEdgeInternalHorizontalAlignment](self->_layout, "rightEdgeInternalHorizontalAlignment");
  return result;
}

- (void)setSelectionOverlayEnabled:(BOOL)a3
{
  id v3;

  if (self->_selectionOverlayEnabled != a3)
  {
    self->_selectionOverlayEnabled = a3;
    -[PXBaseMessagesStackView layout](self, "layout");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateDecorationAndSprites");

  }
}

- (void)setHorizontalAlignment:(int64_t)a3
{
  if (self->_horizontalAlignment != a3)
  {
    self->_horizontalAlignment = a3;
    -[PXBaseMessagesStackView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setNumberOfAccessoryItems:(int64_t)a3
{
  uint64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t indexToRestore;
  id v9;

  -[PXBaseMessagesStackView layout](self, "layout");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "numberOfAccessoryItems") != a3)
  {
    v5 = objc_msgSend(v9, "numberOfItems");
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    v7 = v5 + a3 - 1;
    if (v5 + a3 >= 1)
    {
      indexToRestore = self->_indexToRestore;
      if (indexToRestore == 0x7FFFFFFFFFFFFFFFLL)
        indexToRestore = objc_msgSend(v9, "primaryItemIndex");
      if (v7 >= indexToRestore)
        v6 = indexToRestore;
      else
        v6 = v7;
    }
    self->_indexToRestore = v6;
    objc_msgSend(v9, "setNumberOfAccessoryItems:", a3);
    -[PXBaseMessagesStackView reloadAccessoryItems](self, "reloadAccessoryItems");
  }

}

- (int64_t)numberOfAccessoryItems
{
  void *v2;
  int64_t v3;

  -[PXBaseMessagesStackView layout](self, "layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfAccessoryItems");

  return v3;
}

- (void)reloadAccessoryItems
{
  id v2;

  -[PXBaseMessagesStackView layout](self, "layout");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadAccessoryItems");

}

- (BOOL)contentChangedForItemBeforeDataSource:(id)a3 beforeIndexPath:(PXSimpleIndexPath *)a4 afterDataSource:(id)a5 afterIndexPath:(PXSimpleIndexPath *)a6
{
  return 0;
}

- (void)registerAllTextureProvidersWithMediaProvider:(id)a3
{
  id v4;
  PXGDecorationTextureProvider *v5;
  id v6;

  v4 = a3;
  -[PXBaseMessagesStackView tungstenView](self, "tungstenView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerAllTextureProvidersWithMediaProvider:", v4);

  v5 = objc_alloc_init(PXGDecorationTextureProvider);
  -[PXGDecorationTextureProvider setOverlayViewSource:](v5, "setOverlayViewSource:", self);
  objc_msgSend(v6, "registerTextureProvider:forMediaKind:", v5, 8);

}

- (void)setCurrentDataSource:(id)a3
{
  PXSectionedDataSource *v5;
  PXSectionedDataSource *v6;

  v5 = (PXSectionedDataSource *)a3;
  if (self->_currentDataSource != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_currentDataSource, a3);
    -[PXBaseMessagesStackView currentDataSourceDidChange](self, "currentDataSourceDidChange");
    -[PXBaseMessagesStackView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setSettled:(BOOL)a3
{
  if (self->_settled != a3)
  {
    self->_settled = a3;
    -[PXBaseMessagesStackView settledDidChange](self, "settledDidChange");
  }
}

- (void)_updateDataSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  int64_t indexToRestore;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  PXMessagesStackItemsLayout *layout;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  -[PXBaseMessagesStackView currentDataSource](self, "currentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBaseMessagesStackView dataSourceManager](self, "dataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != v5)
  {
    -[PXBaseMessagesStackView dataSourceManager](self, "dataSourceManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allChangeDetailsFromDataSource:toDataSource:", v3, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(_OWORD *)&self->_lastKnownPrimaryIndex.item;
    v23 = *(_OWORD *)&self->_lastKnownPrimaryIndex.dataSourceIdentifier;
    v24 = v8;
    objc_msgSend(off_1E50B4A18, "indexPathAfterApplyingChanges:toIndexPath:hasIncrementalChanges:objectChanged:", v7, &v23, 0, 0);
    v9 = v26;
    *(_OWORD *)&self->_lastKnownPrimaryIndex.dataSourceIdentifier = v25;
    *(_OWORD *)&self->_lastKnownPrimaryIndex.item = v9;
    v10 = objc_msgSend(v3, "numberOfItemsInSection:", 0);
    indexToRestore = self->_indexToRestore;
    if (indexToRestore == 0x7FFFFFFFFFFFFFFFLL)
      indexToRestore = -[PXBaseMessagesStackView currentIndex](self, "currentIndex");
    if (indexToRestore == 0x7FFFFFFFFFFFFFFFLL || indexToRestore < v10)
    {
      if (indexToRestore == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(v5, "numberOfItemsInSection:", 0) <= 0)
          v13 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v13 = 0;
      }
      else
      {
        v14 = objc_msgSend(v3, "identifier");
        v25 = 0u;
        v26 = 0u;
        v23 = (unint64_t)v14;
        *(_QWORD *)&v24 = indexToRestore;
        *((_QWORD *)&v24 + 1) = 0x7FFFFFFFFFFFFFFFLL;
        objc_msgSend(off_1E50B4A18, "indexPathAfterApplyingChanges:toIndexPath:hasIncrementalChanges:objectChanged:", v7, &v23, 0, 0);
        if ((_QWORD)v25 == *(_QWORD *)off_1E50B7E98)
        {
          v15 = objc_msgSend(v5, "numberOfItemsInSection:", 0);
          v13 = v15 - 1;
          if (v15 <= 0)
            v13 = 0x7FFFFFFFFFFFFFFFLL;
          if (indexToRestore < v15)
            v13 = indexToRestore;
        }
        else
        {
          v13 = v26;
        }
      }
    }
    else
    {
      v13 = indexToRestore - v10 + objc_msgSend(v5, "numberOfItemsInSection:", 0);
    }
    self->_indexToRestore = v13;
    if ((objc_msgSend(v3, "containsAnyItems") & 1) != 0
      && objc_msgSend(v5, "containsAnyItems")
      && -[PXGLayout appearState](self->_layout, "appearState") == 1)
    {
      -[PXGLayout createDefaultAnimationForCurrentContext](self->_layout, "createDefaultAnimationForCurrentContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "defaultAnimationDuration");
      objc_msgSend(v16, "setDuration:");

    }
    layout = self->_layout;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __44__PXBaseMessagesStackView__updateDataSource__block_invoke;
    v20[3] = &unk_1E5121C78;
    v20[4] = self;
    v21 = v3;
    v19 = v5;
    v22 = v19;
    -[PXGLayout applySectionedChangeDetailsForSingleSection:dataSourceBeforeChanges:dataSourceAfterChanges:changeMediaVersionHandler:](layout, "applySectionedChangeDetailsForSingleSection:dataSourceBeforeChanges:dataSourceAfterChanges:changeMediaVersionHandler:", v7, v21, v19, v20);
    -[PXBaseMessagesStackView setCurrentDataSource:](self, "setCurrentDataSource:", v19);

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)DataSourceManagerObservationContext_74806 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXBaseMessagesStackView.m"), 444, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    v11 = v9;
    -[PXBaseMessagesStackView _updateDataSource](self, "_updateDataSource");
    v9 = v11;
  }

}

- (void)primaryItemDidChangeForStackItemsLayout:(id)a3
{
  unint64_t v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t dataSourceIdentifier;
  _BOOL8 v10;
  id v13;

  -[PXBaseMessagesStackView currentDataSource](self, "currentDataSource", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[PXBaseMessagesStackView currentIndex](self, "currentIndex");
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || (v5 = v4, objc_msgSend(v13, "numberOfItemsInSection:", 0) <= v4))
  {
    v6 = *(_QWORD *)off_1E50B8778;
    v7 = *((_QWORD *)off_1E50B8778 + 1);
    v5 = *((_QWORD *)off_1E50B8778 + 2);
    v8 = *((_QWORD *)off_1E50B8778 + 3);
  }
  else
  {
    v6 = objc_msgSend(v13, "identifier");
    v7 = 0;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  dataSourceIdentifier = self->_lastKnownPrimaryIndex.dataSourceIdentifier;
  if (dataSourceIdentifier == *(_QWORD *)off_1E50B7E98)
    v10 = 0;
  else
    v10 = dataSourceIdentifier != v6
       || self->_lastKnownPrimaryIndex.section != v7
       || self->_lastKnownPrimaryIndex.item != v5
       || self->_lastKnownPrimaryIndex.subitem != v8;
  self->_lastKnownPrimaryIndex.dataSourceIdentifier = v6;
  self->_lastKnownPrimaryIndex.section = v7;
  self->_lastKnownPrimaryIndex.item = v5;
  self->_lastKnownPrimaryIndex.subitem = v8;
  -[PXBaseMessagesStackView primaryItemDidChange:didChangeIndex:](self, "primaryItemDidChange:didChangeIndex:", self->_isProgramaticallyScrolling, v10);

}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v4;
  PXMessagesStackItemsLayout *v6;
  PXMessagesStackItemsLayout *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;

  v4 = *(_QWORD *)&a3;
  v6 = (PXMessagesStackItemsLayout *)a4;
  v7 = v6;
  if (self->_layout == v6)
  {
    v9 = -[PXGItemsLayout itemForSpriteIndex:](v6, "itemForSpriteIndex:", v4);
    if (colorAtIndex_inLayout__onceToken != -1)
      dispatch_once(&colorAtIndex_inLayout__onceToken, &__block_literal_global_74804);
    v10 = objc_msgSend((id)colorAtIndex_inLayout__colors, "count");
    objc_msgSend((id)colorAtIndex_inLayout__colors, "objectAtIndexedSubscript:", v9 % v10);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v8;

  return v11;
}

- (id)solidColorOverlayForLayout:(id)a3
{
  if (-[PXBaseMessagesStackView selectionOverlayEnabled](self, "selectionOverlayEnabled", a3))
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.807843137, 0.807843137, 0.823529412, 1.0);
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)solidColorOverlayAlphaForSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v4;
  _BOOL4 v6;
  PXMessagesStackItemsLayout *layout;
  double result;

  v4 = *(_QWORD *)&a3;
  v6 = -[PXBaseMessagesStackView selectionOverlayEnabled](self, "selectionOverlayEnabled", *(_QWORD *)&a3, a4);
  layout = self->_layout;
  if (v6)
    -[PXMessagesStackItemsLayout selectionOverlayAlphaForSpriteIndex:](layout, "selectionOverlayAlphaForSpriteIndex:", v4);
  else
    -[PXMessagesStackItemsLayout overlayAlphaForSpriteIndex:](layout, "overlayAlphaForSpriteIndex:", v4);
  return result;
}

- (id)shadowForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  int64_t v8;
  NSShadow *v9;
  unsigned int v11;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v11 = -1;
  if (objc_msgSend(v6, "isSpriteIndex:decoratingSpriteWithIndex:", v4, &v11)
    && (v7 = objc_msgSend(v6, "convertSpriteIndex:toDescendantLayout:", v11, self->_layout), (_DWORD)v7 != -1)
    && (v8 = -[PXGItemsLayout itemForSpriteIndex:](self->_layout, "itemForSpriteIndex:", v7),
        v8 == -[PXMessagesStackItemsLayout primaryItemIndex](self->_layout, "primaryItemIndex")))
  {
    v9 = self->_centerItemShadow;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (double)cornerRadiusForShadowSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 20.0;
}

- (double)alphaForShadowAtSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  double v4;

  -[PXMessagesStackItemsLayout primaryItemFocus](self->_layout, "primaryItemFocus", *(_QWORD *)&a3, a4);
  return 1.0 - v4;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v4;
  PXGDecoratingLayout *v6;
  PXGDecoratingLayout *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _DWORD v21[2];
  __int16 v22;
  PXGDecoratingLayout *v23;
  uint64_t v24;

  v4 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = (PXGDecoratingLayout *)a4;
  if (self->_decoratingLayout == v6)
  {
    -[PXBaseMessagesStackView viewClassForSpriteAtIndex:inDecoratingLayout:](self, "viewClassForSpriteAtIndex:inDecoratingLayout:", v4, v6);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[PXBaseMessagesStackView layout](self, "layout");
  v7 = (PXGDecoratingLayout *)objc_claimAutoreleasedReturnValue();

  -[PXBaseMessagesStackView layout](self, "layout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 == v6)
  {
    v17 = objc_msgSend(v8, "itemForSpriteIndex:", v4);

    -[PXBaseMessagesStackView layout](self, "layout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXBaseMessagesStackView viewClassForItemAtIndex:inStackLayout:](self, "viewClassForItemAtIndex:inStackLayout:", v17, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  v10 = objc_msgSend(v8, "convertSpriteIndex:fromDescendantLayout:", v4, v6);

  -[PXBaseMessagesStackView layout](self, "layout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "accessoryItemForSpriteIndex:", v10);

  -[PXBaseMessagesStackView layout](self, "layout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "numberOfAccessoryItems");

  if (v12 < v14)
  {
    -[PXBaseMessagesStackView viewClassForAccessoryItemAtIndex:](self, "viewClassForAccessoryItemAtIndex:", v12);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v16 = (void *)v15;
    goto LABEL_11;
  }
  PXAssertGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v21[0] = 67109378;
    v21[1] = v4;
    v22 = 2112;
    v23 = v6;
    _os_log_error_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "Asked to provide a view for unknown sprite index %u in layout %@", (uint8_t *)v21, 0x12u);
  }

  v16 = 0;
LABEL_11:

  return (Class)v16;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inDecoratingLayout:(id)a4
{
  id v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  PXAssertGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Subclasses must provide a view for the decorating layout %@", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (Class)viewClassForItemAtIndex:(int64_t)a3 inStackLayout:(id)a4
{
  id v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  PXAssertGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Subclasses must provide a view for the stack layout %@", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (Class)viewClassForAccessoryItemAtIndex:(int64_t)a3
{
  NSObject *v3;
  uint8_t v5[16];

  PXAssertGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_1A6789000, v3, OS_LOG_TYPE_ERROR, "Subclasses must provide a view for the stack accessory layout", v5, 2u);
  }

  return 0;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v4;
  PXGDecoratingLayout *v6;
  PXGDecoratingLayout *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _DWORD v21[2];
  __int16 v22;
  PXGDecoratingLayout *v23;
  uint64_t v24;

  v4 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = (PXGDecoratingLayout *)a4;
  if (self->_decoratingLayout == v6)
  {
    -[PXBaseMessagesStackView viewUserDataForSpriteAtIndex:inDecoratingLayout:](self, "viewUserDataForSpriteAtIndex:inDecoratingLayout:", v4, v6);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[PXBaseMessagesStackView layout](self, "layout");
  v7 = (PXGDecoratingLayout *)objc_claimAutoreleasedReturnValue();

  -[PXBaseMessagesStackView layout](self, "layout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 == v6)
  {
    v17 = objc_msgSend(v8, "itemForSpriteIndex:", v4);

    -[PXBaseMessagesStackView layout](self, "layout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXBaseMessagesStackView viewUserDataForItemAtIndex:inStackLayout:](self, "viewUserDataForItemAtIndex:inStackLayout:", v17, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  v10 = objc_msgSend(v8, "convertSpriteIndex:fromDescendantLayout:", v4, v6);

  -[PXBaseMessagesStackView layout](self, "layout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "accessoryItemForSpriteIndex:", v10);

  -[PXBaseMessagesStackView layout](self, "layout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "numberOfAccessoryItems");

  if (v12 < v14)
  {
    -[PXBaseMessagesStackView viewUserDataForAccessoryItemAtIndex:](self, "viewUserDataForAccessoryItemAtIndex:", v12);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v16 = (void *)v15;
    goto LABEL_11;
  }
  PXAssertGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v21[0] = 67109378;
    v21[1] = v4;
    v22 = 2112;
    v23 = v6;
    _os_log_error_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "Asked to provide view user data for unknown sprite index %u in layout %@", (uint8_t *)v21, 0x12u);
  }

  v16 = 0;
LABEL_11:

  return v16;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inDecoratingLayout:(id)a4
{
  id v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  PXAssertGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Subclasses must provide view user data for the decorating layout %@", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (id)viewUserDataForItemAtIndex:(int64_t)a3 inStackLayout:(id)a4
{
  id v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  PXAssertGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Subclasses must provide view user data for the stack layout %@", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (id)viewUserDataForAccessoryItemAtIndex:(int64_t)a3
{
  NSObject *v3;
  uint8_t v5[16];

  PXAssertGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_1A6789000, v3, OS_LOG_TYPE_ERROR, "Subclasses must provide view user data for the stack accessory layout", v5, 2u);
  }

  return 0;
}

- (void)scrollViewControllerWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6
{
  double x;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  PXMessagesStackItemsLayout *layout;
  double v19;
  CGFloat v20;
  PXMessagesStackItemsLayout *v21;
  CGFloat v22;
  NSObject *v23;
  CGFloat v24;
  int v25;
  double v26;
  __int16 v27;
  CGFloat v28;
  __int16 v29;
  CGFloat v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  x = a4.x;
  v33 = *MEMORY[0x1E0C80C00];
  +[PXMessagesUISettings sharedInstance](PXMessagesUISettings, "sharedInstance", a3, a4.x, a4.y, a6.x, a6.y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "pagingBehavior");
  -[PXBaseMessagesStackView bounds](self, "bounds");
  v12 = v11;
  objc_msgSend(v9, "pagingVelocityThreshold");
  switch(v10)
  {
    case 1:
      v17 = a5->x;
      layout = self->_layout;
      goto LABEL_12;
    case 2:
      v19 = v13 * (v12 / 355.0);
      -[PXGLayout visibleRect](self->_layout, "visibleRect");
      if (x < -v19)
      {
        -[PXMessagesStackItemsLayout pageOffsetLessThanOffset:](self->_layout, "pageOffsetLessThanOffset:");
LABEL_13:
        a5->x = v20;
        break;
      }
      layout = self->_layout;
      if (x > v19)
      {
        -[PXMessagesStackItemsLayout pageOffsetGreaterThanOffset:](layout, "pageOffsetGreaterThanOffset:");
        goto LABEL_13;
      }
LABEL_12:
      -[PXMessagesStackItemsLayout closestPageOffsetForHorizontalOffset:](layout, "closestPageOffsetForHorizontalOffset:", v17);
      goto LABEL_13;
    case 3:
      -[PXGLayout visibleRect](self->_layout, "visibleRect");
      v15 = v14;
      if (x <= 0.0)
      {
        v21 = self->_layout;
        if (x < 0.0)
          -[PXMessagesStackItemsLayout pageOffsetLessThanOffset:](v21, "pageOffsetLessThanOffset:");
        else
          -[PXMessagesStackItemsLayout closestPageOffsetForHorizontalOffset:](v21, "closestPageOffsetForHorizontalOffset:");
      }
      else
      {
        -[PXMessagesStackItemsLayout pageOffsetGreaterThanOffset:](self->_layout, "pageOffsetGreaterThanOffset:", v14);
      }
      v22 = v16;
      PLUIGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v24 = a5->x;
        v25 = 134218752;
        v26 = v15;
        v27 = 2048;
        v28 = v24;
        v29 = 2048;
        v30 = v22;
        v31 = 2048;
        v32 = x;
        _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_DEBUG, "Settling nearest clamped. Current (%lf). Proposed (%lf). Final (%lf). Velocity (%lf).", (uint8_t *)&v25, 0x2Au);
      }

      a5->x = v22;
      break;
  }
  -[PXMessagesStackItemsLayout setIsSettling:](self->_layout, "setIsSettling:", 1);

}

- (void)scrollViewControllerWillBeginScrolling:(id)a3
{
  -[PXBaseMessagesStackView setSettled:](self, "setSettled:", 0);
  -[PXMessagesStackItemsLayout setIsSettling:](self->_layout, "setIsSettling:", 0);
  -[PXEventCoalescer cancel](self->_settledEventCoalescer, "cancel");
  -[PXBaseMessagesStackView willBeginScrolling](self, "willBeginScrolling");
}

- (void)scrollViewControllerDidEndScrolling:(id)a3
{
  -[PXEventCoalescer inputEvent](self->_settledEventCoalescer, "inputEvent", a3);
}

- (void)scrollViewControllerDidLayoutSubviews:(id)a3
{
  int64_t indexToRestore;

  indexToRestore = self->_indexToRestore;
  if (indexToRestore != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PXBaseMessagesStackView scrollToIndex:animated:](self, "scrollToIndex:animated:", indexToRestore, 0);
    self->_indexToRestore = 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)outputEventSignaledForCoalescer:(id)a3
{
  -[PXBaseMessagesStackView setSettled:](self, "setSettled:", 1);
}

- (PXSectionedDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (double)verticalContentInsets
{
  return self->_verticalContentInsets;
}

- (BOOL)selectionOverlayEnabled
{
  return self->_selectionOverlayEnabled;
}

- (BOOL)useAspectTiles
{
  return self->_useAspectTiles;
}

- (void)setUseAspectTiles:(BOOL)a3
{
  self->_useAspectTiles = a3;
}

- (int64_t)horizontalAlignment
{
  return self->_horizontalAlignment;
}

- (PXGView)tungstenView
{
  return self->_tungstenView;
}

- (PXMessagesStackItemsLayout)layout
{
  return self->_layout;
}

- (BOOL)debugColorModeEnabled
{
  return self->_debugColorModeEnabled;
}

- (PXSectionedDataSource)currentDataSource
{
  return self->_currentDataSource;
}

- (BOOL)isSettled
{
  return self->_settled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDataSource, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_tungstenView, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_settledEventCoalescer, 0);
  objc_storeStrong((id *)&self->_centerItemShadow, 0);
  objc_storeStrong((id *)&self->_decoratingLayout, 0);
}

void __49__PXBaseMessagesStackView_colorAtIndex_inLayout___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[8];

  v9[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v1;
  objc_msgSend(MEMORY[0x1E0DC3658], "yellowColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v2;
  objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v3;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v4;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemIndigoColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[5] = v5;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemPurpleColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[6] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 7);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)colorAtIndex_inLayout__colors;
  colorAtIndex_inLayout__colors = v7;

}

uint64_t __44__PXBaseMessagesStackView__updateDataSource__block_invoke(_QWORD *a1, _OWORD *a2, _OWORD *a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  _OWORD v9[2];
  _OWORD v10[2];

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a2[1];
  v10[0] = *a2;
  v10[1] = v6;
  v7 = a3[1];
  v9[0] = *a3;
  v9[1] = v7;
  return objc_msgSend(v3, "contentChangedForItemBeforeDataSource:beforeIndexPath:afterDataSource:afterIndexPath:", v4, v10, v5, v9);
}

+ (unsigned)itemMediaKind
{
  return 0;
}

+ (unsigned)accessoryMediaKind
{
  return 0;
}

@end
