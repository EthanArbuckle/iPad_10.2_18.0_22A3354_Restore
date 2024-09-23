@implementation PUTilingView

- (PUTilingView)initWithFrame:(CGRect)a3 layout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  PUTilingView *v12;
  PUTilingView *v13;
  PUTilingViewContentCoordinateSystem *v14;
  PUTilingCoordinateSystem *contentCoordinateSystem;
  PUTilingViewFixedCoordinateSystem *v16;
  PUTilingCoordinateSystem *fixedCoordinateSystem;
  PUReuseQueue *v18;
  PUReuseQueue *tileControllerReuseQueue;
  PUReuseQueue *v20;
  void *v21;
  PUTileTree *v22;
  PUTileTree *activeTileControllers;
  PUTileTree *v24;
  PUTileTree *inactiveTileControllers;
  PUTileTree *v26;
  PUTileTree *detachedTileControllers;
  uint64_t v28;
  NSMutableDictionary *referencedDataSourcesByIdentifiers;
  uint64_t v30;
  NSMutableSet *referencedCoordinateSystems;
  uint64_t v32;
  NSMutableArray *pendingUpdateItems;
  void *v34;
  NSMutableDictionary *v35;
  NSMutableDictionary *postLayoutBlocks;
  void *v38;
  objc_super v39;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingView.m"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layout != nil"));

  }
  v39.receiver = self;
  v39.super_class = (Class)PUTilingView;
  v12 = -[PUTilingView initWithFrame:](&v39, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_layout, a4);
    -[PUTilingLayout setTilingView:](v13->_layout, "setTilingView:", v13);
    v13->__reasonForNextLayoutCoordinateSystemUpdate = 1;
    v14 = -[PUTilingViewCoordinateSystem initWithTilingView:]([PUTilingViewContentCoordinateSystem alloc], "initWithTilingView:", v13);
    contentCoordinateSystem = v13->_contentCoordinateSystem;
    v13->_contentCoordinateSystem = (PUTilingCoordinateSystem *)v14;

    v16 = -[PUTilingViewCoordinateSystem initWithTilingView:]([PUTilingViewFixedCoordinateSystem alloc], "initWithTilingView:", v13);
    fixedCoordinateSystem = v13->_fixedCoordinateSystem;
    v13->_fixedCoordinateSystem = (PUTilingCoordinateSystem *)v16;

    v18 = objc_alloc_init(PUReuseQueue);
    tileControllerReuseQueue = v13->__tileControllerReuseQueue;
    v13->__tileControllerReuseQueue = v18;

    v20 = v13->__tileControllerReuseQueue;
    +[PUTilingViewSettings sharedInstance](PUTilingViewSettings, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUReuseQueue setReuseEnabled:](v20, "setReuseEnabled:", objc_msgSend(v21, "allowTileReuse"));

    v22 = -[PUTileTree initUsingUniqueLeafs:]([PUTileTree alloc], "initUsingUniqueLeafs:", 1);
    activeTileControllers = v13->__activeTileControllers;
    v13->__activeTileControllers = v22;

    v24 = -[PUTileTree initUsingUniqueLeafs:]([PUTileTree alloc], "initUsingUniqueLeafs:", 0);
    inactiveTileControllers = v13->__inactiveTileControllers;
    v13->__inactiveTileControllers = v24;

    v26 = -[PUTileTree initUsingUniqueLeafs:]([PUTileTree alloc], "initUsingUniqueLeafs:", 1);
    detachedTileControllers = v13->__detachedTileControllers;
    v13->__detachedTileControllers = v26;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v28 = objc_claimAutoreleasedReturnValue();
    referencedDataSourcesByIdentifiers = v13->__referencedDataSourcesByIdentifiers;
    v13->__referencedDataSourcesByIdentifiers = (NSMutableDictionary *)v28;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v30 = objc_claimAutoreleasedReturnValue();
    referencedCoordinateSystems = v13->__referencedCoordinateSystems;
    v13->__referencedCoordinateSystems = (NSMutableSet *)v30;

    v13->__needsUpdateLayoutVisibleRect = 1;
    v13->__needsUpdateLayoutCoordinateSystem = 1;
    v13->__needsUpdateLayout = 1;
    v13->__needsUpdateScrollViewProperties = 1;
    v13->__needsUpdateTileControllers = 1;
    v13->__needsUpdateReferencedDataSources = 1;
    v13->__needsUpdateReferencedCoordinateSystems = 1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v32 = objc_claimAutoreleasedReturnValue();
    pendingUpdateItems = v13->__pendingUpdateItems;
    v13->__pendingUpdateItems = (NSMutableArray *)v32;

    objc_msgSend(v11, "dataSource");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTilingView _registerDataSource:](v13, "_registerDataSource:", v34);

    -[PUTilingView _adjustScrollViewPagingDeceleration](v13, "_adjustScrollViewPagingDeceleration");
    v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    postLayoutBlocks = v13->__postLayoutBlocks;
    v13->__postLayoutBlocks = v35;

  }
  return v13;
}

- (PUTilingView)initWithFrame:(CGRect)a3
{
  return -[PUTilingView initWithFrame:layout:](self, "initWithFrame:layout:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PUTilingView)initWithCoder:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingView.m"), 162, CFSTR("unsupported initializer"));

  return -[PUTilingView initWithFrame:layout:](self, "initWithFrame:layout:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)setTileTransitionDelegate:(id)a3
{
  id WeakRetained;
  $D4D6E66E4D33FFD141D5DB4620E24FA0 *p_tileTransitionDelegateFlags;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tileTransitionDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_tileTransitionDelegate, obj);
    p_tileTransitionDelegateFlags = &self->_tileTransitionDelegateFlags;
    p_tileTransitionDelegateFlags->respondsToDataSourceConverterForTransitionFromLayoutToLayout = objc_opt_respondsToSelector() & 1;
    p_tileTransitionDelegateFlags->respondsToTileTransitionCoordinatorForTransitionFromLayoutWithContext = objc_opt_respondsToSelector() & 1;
    p_tileTransitionDelegateFlags->respondsToTileTransitionCoordinatorForUpdateWithItems = objc_opt_respondsToSelector() & 1;
    p_tileTransitionDelegateFlags->respondsToTileTransitionCoordinatorForChangeFromFrame = objc_opt_respondsToSelector() & 1;
    p_tileTransitionDelegateFlags->respondsToTileTransitionCoordinatorForReattachedTileControllers = objc_opt_respondsToSelector() & 1;
    p_tileTransitionDelegateFlags->respondsToTileTransitionCoordinatorForLayoutInvalidationContext = objc_opt_respondsToSelector() & 1;
    p_tileTransitionDelegateFlags->respondsToCanBypass20069585Check = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setScrollDelegate:(id)a3
{
  id WeakRetained;
  $0E427056FECB816668311DEACC77D8B4 *p_scrollDelegateFlags;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_scrollDelegate, obj);
    p_scrollDelegateFlags = &self->_scrollDelegateFlags;
    p_scrollDelegateFlags->respondsToScrollInfoWithLayout = objc_opt_respondsToSelector() & 1;
    p_scrollDelegateFlags->respondsToInitialVisibleOriginWithLayout = objc_opt_respondsToSelector() & 1;
    p_scrollDelegateFlags->respondsToTargetVisibleOriginForProposedVisibleOrigin = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setTileUseDelegate:(id)a3
{
  id WeakRetained;
  $F28346E1A3285B6808C27EF0D049EA25 *p_tileUseDelegateFlags;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tileUseDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_tileUseDelegate, obj);
    p_tileUseDelegateFlags = &self->_tileUseDelegateFlags;
    p_tileUseDelegateFlags->respondsToWillStartUsingTileController = objc_opt_respondsToSelector() & 1;
    p_tileUseDelegateFlags->respondsToDidStopUsingTileController = objc_opt_respondsToSelector() & 1;
    p_tileUseDelegateFlags->respondsToDidUpdateTileControllers = objc_opt_respondsToSelector() & 1;
    p_tileUseDelegateFlags->respondsToDidEndAnimatingTileControllers = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
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
  double v22;
  double v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUTilingView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v26.origin.x = v9;
  v26.origin.y = v11;
  v26.size.width = v13;
  v26.size.height = v15;
  if (!CGRectEqualToRect(v25, v26))
  {
    -[PUTilingView frame](self, "frame");
    v22 = v17;
    v23 = v16;
    v20 = v19;
    v21 = v18;
    v24.receiver = self;
    v24.super_class = (Class)PUTilingView;
    -[PUTilingView setBounds:](&v24, sel_setBounds_, x, y, width, height);
    -[PUTilingView _handleChangeFromBounds:fromFrame:](self, "_handleChangeFromBounds:fromFrame:", v9, v11, v13, v15, v23, v22, v21, v20);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
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
  double v22;
  double v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUTilingView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v26.origin.x = v9;
  v26.origin.y = v11;
  v26.size.width = v13;
  v26.size.height = v15;
  if (!CGRectEqualToRect(v25, v26))
  {
    -[PUTilingView bounds](self, "bounds");
    v22 = v17;
    v23 = v16;
    v20 = v19;
    v21 = v18;
    v24.receiver = self;
    v24.super_class = (Class)PUTilingView;
    -[PUTilingView setFrame:](&v24, sel_setFrame_, x, y, width, height);
    -[PUTilingView _handleChangeFromBounds:fromFrame:](self, "_handleChangeFromBounds:fromFrame:", v23, v22, v21, v20, v9, v11, v13, v15);
  }
}

- (void)layoutSublayersOfLayer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUTilingView;
  -[PUTilingView layoutSublayersOfLayer:](&v4, sel_layoutSublayersOfLayer_, a3);
  -[PUTilingView _updateIfNeeded](self, "_updateIfNeeded");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  double v21;
  double v22;
  uint64_t v23;
  id *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[PUTilingView isUserInteractionEnabled](self, "isUserInteractionEnabled"))
  {
    v23 = 0;
    v24 = (id *)&v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__95495;
    v27 = __Block_byref_object_dispose__95496;
    v28 = 0;
    if (-[PUTilingView pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
    {
      objc_storeStrong(v24 + 5, self);
      -[PUTilingView bounds](self, "bounds");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __34__PUTilingView_hitTest_withEvent___block_invoke;
      v18[3] = &unk_1E58A9408;
      v21 = x;
      v22 = y;
      v18[4] = self;
      v19 = v7;
      v20 = &v23;
      -[PUTilingView enumeratePresentedTileControllersInRect:usingBlock:](self, "enumeratePresentedTileControllersInRect:usingBlock:", v18, v9, v11, v13, v15);

    }
    v16 = v24[5];
    _Block_object_dispose(&v23, 8);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)_handleChangeFromBounds:(CGRect)a3 fromFrame:(CGRect)a4
{
  double height;
  double width;
  CGFloat y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[PUTilingView _invalidateLayoutVisibleRect](self, "_invalidateLayoutVisibleRect", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PUTilingView _invalidateTileControllers](self, "_invalidateTileControllers");
  -[PUTilingView frame](self, "frame");
  if (width != v11 || height != v12)
  {
    v14 = v9;
    v15 = v10;
    v16 = v11;
    v17 = v12;
    v22 = y;
    v18 = 0;
    if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock"))
    {
      objc_msgSend(MEMORY[0x1E0DC3F10], "_currentAnimationDuration");
      v18 = v19;
    }
    if (self->_tileTransitionDelegateFlags.respondsToTileTransitionCoordinatorForChangeFromFrame)
    {
      -[PUTilingView tileTransitionDelegate](self, "tileTransitionDelegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "tilingView:tileTransitionCoordinatorForChangeFromFrame:toFrame:duration:", self, x, v22, width, height, v14, v15, v16, v17, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = 0;
    }
    -[PUTilingView _invalidateLayoutCoordinateSystemWithReason:](self, "_invalidateLayoutCoordinateSystemWithReason:", 2);
    -[PUTilingView _invalidateScrollViewProperties](self, "_invalidateScrollViewProperties");
    -[PUTilingView _invalidateTileControllersWithTileTransitionCoordinator:](self, "_invalidateTileControllersWithTileTransitionCoordinator:", v21);

  }
  -[PUTilingView _adjustScrollViewPagingDeceleration](self, "_adjustScrollViewPagingDeceleration");
}

- (void)_adjustScrollViewPagingDeceleration
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  long double v8;
  double v9;
  long double v10;
  void *v11;
  id v12;

  -[PUTilingView bounds](self, "bounds");
  v4 = 1024.0;
  if (v3 <= 1024.0)
    v4 = v3;
  v5 = v4 * -0.000000184659091 + 0.000359090909;
  v6 = v4 * 0.00000994318182 + 0.966818182;
  -[PUTilingView _pagingSpringPullAdjustment](self, "_pagingSpringPullAdjustment");
  v8 = exp(v7 * 0.1) * v5;
  -[PUTilingView _pagingFrictionAdjustment](self, "_pagingFrictionAdjustment");
  v10 = 1.0 - (1.0 - v6) * exp(v9 * 0.1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTilingView setValue:forKey:](self, "setValue:forKey:", v11, CFSTR("_pagingSpringPull"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[PUTilingView setValue:forKey:](self, "setValue:forKey:", v12, CFSTR("_pagingFriction"));

}

- (void)setLoadingInsets:(UIEdgeInsets)a3
{
  if (self->_loadingInsets.left != a3.left
    || self->_loadingInsets.top != a3.top
    || self->_loadingInsets.right != a3.right
    || self->_loadingInsets.bottom != a3.bottom)
  {
    self->_loadingInsets = a3;
    -[PUTilingView _invalidateLayoutVisibleRect](self, "_invalidateLayoutVisibleRect");
    -[PUTilingView _invalidateTileControllers](self, "_invalidateTileControllers");
  }
}

- (void)setAllowEDRHeadroomMonitoring:(BOOL)a3
{
  PXDisplayScreenDynamicRangeMonitor *screenDynamicRangeMonitor;
  PXDisplayScreenDynamicRangeMonitor *v5;
  PXDisplayScreenDynamicRangeMonitor *v6;
  PXDisplayScreenDynamicRangeMonitor *v7;

  if (self->_allowEDRHeadroomMonitoring != a3)
  {
    self->_allowEDRHeadroomMonitoring = a3;
    screenDynamicRangeMonitor = self->_screenDynamicRangeMonitor;
    if (a3)
    {
      if (!screenDynamicRangeMonitor)
      {
        v5 = (PXDisplayScreenDynamicRangeMonitor *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B310]), "initWithAutomaticApplicationStateTracking:", 1);
        v6 = self->_screenDynamicRangeMonitor;
        self->_screenDynamicRangeMonitor = v5;

      }
      -[PUTilingView _startHeadroomMonitoringIfPossible](self, "_startHeadroomMonitoringIfPossible");
    }
    else
    {
      -[PXDisplayScreenDynamicRangeMonitor stopMonitoring](screenDynamicRangeMonitor, "stopMonitoring");
      v7 = self->_screenDynamicRangeMonitor;
      self->_screenDynamicRangeMonitor = 0;

    }
  }
}

- (void)_startHeadroomMonitoringIfPossible
{
  void *v3;
  PXDisplayScreenDynamicRangeMonitor *screenDynamicRangeMonitor;
  _QWORD v5[4];
  id v6;
  id location;

  -[PUTilingView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_initWeak(&location, self);
    screenDynamicRangeMonitor = self->_screenDynamicRangeMonitor;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __50__PUTilingView__startHeadroomMonitoringIfPossible__block_invoke;
    v5[3] = &unk_1E58A9430;
    objc_copyWeak(&v6, &location);
    -[PXDisplayScreenDynamicRangeMonitor startMonitoringWithScreenProvider:](screenDynamicRangeMonitor, "startMonitoringWithScreenProvider:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)configureDynamicRangeProperties
{
  uint64_t v3;

  if (PXSupportsImageModulation())
    v3 = PXUserAllowFullHDR();
  else
    v3 = 0;
  -[PUTilingView setShouldDisplayHDR:](self, "setShouldDisplayHDR:", v3);
  -[PUTilingView setAllowEDRHeadroomMonitoring:](self, "setAllowEDRHeadroomMonitoring:", v3);
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUTilingView;
  -[PUTilingView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[PXDisplayScreenDynamicRangeMonitor stopMonitoring](self->_screenDynamicRangeMonitor, "stopMonitoring");
  -[PUTilingView _startHeadroomMonitoringIfPossible](self, "_startHeadroomMonitoringIfPossible");
}

- (void)registerTileControllerClass:(Class)a3 forReuseIdentifier:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  Class v13;

  v7 = a4;
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingView.m"), 356, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[tileControllerClass isSubclassOfClass:[PUTileController class]]"));

  }
  -[PUTilingView _tileControllerReuseQueue](self, "_tileControllerReuseQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__PUTilingView_registerTileControllerClass_forReuseIdentifier___block_invoke;
  v11[3] = &unk_1E58A9458;
  v12 = v7;
  v13 = a3;
  v9 = v7;
  objc_msgSend(v8, "registerObjectCreationBlock:withReuseIdentifier:", v11, v9);

}

- (id)dequeueTileControllerWithReuseIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  PUTilingView *v8;
  void *v9;
  void *v10;
  void *v12;
  char v13;

  v5 = a3;
  v13 = 0;
  -[PUTilingView _tileControllerReuseQueue](self, "_tileControllerReuseQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueObjectWithReuseIdentifier:isReused:", v5, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingView.m"), 373, CFSTR("No tile controller class has been registered for reuse identifier '%@'."), v5);

  }
  if (v13)
  {
    objc_msgSend(v7, "prepareForReuse");
    objc_msgSend(v7, "tilingView");
    v8 = (PUTilingView *)objc_claimAutoreleasedReturnValue();

    if (v8 != self)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingView.m"), 380, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[tileController tilingView] == self"));

    }
  }
  else
  {
    objc_msgSend(v7, "setTilingView:", self);
    objc_msgSend(v7, "addToTilingView:", self);
  }
  if (self->_tileUseDelegateFlags.respondsToWillStartUsingTileController)
  {
    -[PUTilingView tileUseDelegate](self, "tileUseDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tilingView:willStartUsingTileController:", self, v7);

  }
  return v7;
}

- (void)enqueueTileControllerForReuse:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "becomeReusable");
  objc_msgSend(v20, "layoutInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingView.m"), 394, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layoutInfo != nil"));

  }
  -[PUTilingView _inactiveTileControllers](self, "_inactiveTileControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tileIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:withTileIdentifier:", v20, v7);

  objc_msgSend(v20, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTilingView _tileControllerReuseQueue](self, "_tileControllerReuseQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enqueueObjectForReuse:withReuseIdentifier:", v20, v8);

  -[PUTilingView layout](self, "layout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSourceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "isEqualToString:", v13);

  if ((v14 & 1) == 0)
    -[PUTilingView _invalidateReferencedDataSources](self, "_invalidateReferencedDataSources");
  objc_msgSend(v5, "coordinateSystem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "coordinateSystem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqual:", v16);

  if ((v17 & 1) == 0)
    -[PUTilingView _invalidateReferencedCoordinateSystems](self, "_invalidateReferencedCoordinateSystems");
  if (self->_tileUseDelegateFlags.respondsToDidStopUsingTileController)
  {
    -[PUTilingView tileUseDelegate](self, "tileUseDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "tilingView:didStopUsingTileController:", self, v20);

  }
}

- (void)tileControllerDidEndAnimating:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  id v7;

  v4 = a3;
  if (self->_tileUseDelegateFlags.respondsToDidEndAnimatingTileControllers)
  {
    v7 = v4;
    v5 = -[PUTilingView isAnyTileControllerAnimating](self, "isAnyTileControllerAnimating");
    v4 = v7;
    if (!v5)
    {
      -[PUTilingView tileUseDelegate](self, "tileUseDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "tilingViewDidEndAnimatingTileControllers:", self);

      v4 = v7;
    }
  }

}

- (void)transitionToLayout:(id)a3
{
  -[PUTilingView transitionToLayout:withContext:animationSetupCompletionHandler:](self, "transitionToLayout:withContext:animationSetupCompletionHandler:", a3, 0, 0);
}

- (void)transitionToLayout:(id)a3 withContext:(id)a4 animationSetupCompletionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingView.m"), 430, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layout != nil"));

  }
  -[PUTilingView _setPendingLayout:](self, "_setPendingLayout:", 0);
  -[PUTilingView layout](self, "layout");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 != v9)
  {
    -[PUTilingView _setPendingLayout:](self, "_setPendingLayout:", v9);
    -[PUTilingView _invalidateLayout](self, "_invalidateLayout");
    -[PUTilingView _invalidateReferencedDataSources](self, "_invalidateReferencedDataSources");
    -[PUTilingView _invalidateReferencedCoordinateSystems](self, "_invalidateReferencedCoordinateSystems");
    -[PUTilingView _invalidateLayoutVisibleRect](self, "_invalidateLayoutVisibleRect");
    -[PUTilingView _invalidateLayoutCoordinateSystemWithReason:](self, "_invalidateLayoutCoordinateSystemWithReason:", 1);
    -[PUTilingView _invalidateScrollViewProperties](self, "_invalidateScrollViewProperties");
    if (self->_tileTransitionDelegateFlags.respondsToTileTransitionCoordinatorForTransitionFromLayoutWithContext)
    {
      -[PUTilingView tileTransitionDelegate](self, "tileTransitionDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "tilingView:tileTransitionCoordinatorForTransitionFromLayout:toLayout:withContext:", self, v12, v9, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
LABEL_7:
        -[PUTilingView _invalidateTileControllersWithTileTransitionCoordinator:](self, "_invalidateTileControllersWithTileTransitionCoordinator:", v14);

        goto LABEL_10;
      }
    }
    else
    {
      v14 = 0;
      if (!v11)
        goto LABEL_7;
    }
    -[PUTilingView onNextTileControllersUpdateBlock](self, "onNextTileControllersUpdateBlock");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __79__PUTilingView_transitionToLayout_withContext_animationSetupCompletionHandler___block_invoke;
    v18[3] = &unk_1E58A9480;
    v19 = v15;
    v20 = v11;
    v16 = v15;
    -[PUTilingView setOnNextTileControllersUpdateBlock:](self, "setOnNextTileControllersUpdateBlock:", v18);

    goto LABEL_7;
  }
  if (v11)
    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
LABEL_10:

}

- (void)performBatchUpdates:(id)a3
{
  _BOOL8 v5;
  void *v6;
  void (**v7)(void);

  v7 = (void (**)(void))a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingView.m"), 469, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updates != NULL"));

  }
  v5 = -[PUTilingView _isPerformingBatchUpdates](self, "_isPerformingBatchUpdates");
  -[PUTilingView _setPerformingBatchUpdates:](self, "_setPerformingBatchUpdates:", 1);
  v7[2]();
  -[PUTilingView _setPerformingBatchUpdates:](self, "_setPerformingBatchUpdates:", v5);
  if (!v5)
    -[PUTilingView _applyPendingUpdates](self, "_applyPendingUpdates");

}

- (void)insertItemAtIndexPath:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  PUTilingView *v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__PUTilingView_insertItemAtIndexPath_dataSource___block_invoke;
  v10[3] = &unk_1E58AB790;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  -[PUTilingView performBatchUpdates:](self, "performBatchUpdates:", v10);

}

- (void)deleteItemAtIndexPath:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  PUTilingView *v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__PUTilingView_deleteItemAtIndexPath_dataSource___block_invoke;
  v10[3] = &unk_1E58AB790;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  -[PUTilingView performBatchUpdates:](self, "performBatchUpdates:", v10);

}

- (void)moveItemFromIndexPath:(id)a3 toIndexPath:(id)a4 dataSource:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  PUTilingView *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__PUTilingView_moveItemFromIndexPath_toIndexPath_dataSource___block_invoke;
  v14[3] = &unk_1E58A9AE0;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v18 = self;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[PUTilingView performBatchUpdates:](self, "performBatchUpdates:", v14);

}

- (void)reloadItemAtIndexPath:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  PUTilingView *v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__PUTilingView_reloadItemAtIndexPath_dataSource___block_invoke;
  v10[3] = &unk_1E58AB790;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  -[PUTilingView performBatchUpdates:](self, "performBatchUpdates:", v10);

}

- (void)_applyPendingUpdates
{
  void *v3;
  void *v4;
  id v5;
  void (**v6)(void *, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  PUTilingView *v16;
  id v17;

  -[PUTilingView _pendingUpdateItems](self, "_pendingUpdateItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTilingView layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateLayoutForUpdateWithItems:", v3);
  -[PUTilingView _invalidateLayoutCoordinateSystemWithReason:](self, "_invalidateLayoutCoordinateSystemWithReason:", 3);
  -[PUTilingView _invalidateLayout](self, "_invalidateLayout");
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __36__PUTilingView__applyPendingUpdates__block_invoke;
  v15 = &unk_1E58A94D0;
  v16 = self;
  v5 = v3;
  v17 = v5;
  v6 = (void (**)(void *, void *))_Block_copy(&v12);
  -[PUTilingView _activeTileControllers](self, "_activeTileControllers", v12, v13, v14, v15, v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);

  -[PUTilingView _inactiveTileControllers](self, "_inactiveTileControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v8);

  -[PUTilingView _detachedTileControllers](self, "_detachedTileControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v9);

  if (self->_tileTransitionDelegateFlags.respondsToTileTransitionCoordinatorForUpdateWithItems)
  {
    -[PUTilingView tileTransitionDelegate](self, "tileTransitionDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tilingView:tileTransitionCoordinatorForUpdateWithItems:", self, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  -[PUTilingView _invalidateTileControllersWithTileTransitionCoordinator:](self, "_invalidateTileControllersWithTileTransitionCoordinator:", v11);
  objc_msgSend(v5, "removeAllObjects");

}

- (void)detachTileControllers:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isDetached") & 1) == 0)
        {
          objc_msgSend(v10, "layoutInfo");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v11)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingView.m"), 580, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layoutInfo != nil"));

          }
          -[PUTilingView _detachedTileControllers](self, "_detachedTileControllers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "tileIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:withTileIdentifier:", v10, v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v7);
  }
  -[PUTilingView _invalidateTileControllersWithTileTransitionCoordinator:](self, "_invalidateTileControllersWithTileTransitionCoordinator:", 0);
  -[PUTilingView _updateIfNeeded](self, "_updateIfNeeded");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = v5;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
        if ((objc_msgSend(v20, "isActive") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingView.m"), 588, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[tileController isActive] == YES"));

        }
        objc_msgSend(v20, "setDetached:", 1);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v17);
  }

}

- (id)freezeTileController:(id)a3
{
  id v5;
  PUTilingView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v5 = a3;
  objc_msgSend(v5, "tilingView");
  v6 = (PUTilingView *)objc_claimAutoreleasedReturnValue();

  if (v6 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingView.m"), 594, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[tileController tilingView] == self"));

  }
  -[PUTilingView tileAnimator](self, "tileAnimator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "freezeTileController:", v5);
  else
    objc_msgSend(v5, "freeze");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)reattachTileControllers:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v12, "isDetached"))
        {
          if ((objc_msgSend(v12, "isActive") & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingView.m"), 607, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[tileController isActive] == YES"));

          }
          objc_msgSend(v12, "presentationLayoutInfo");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUTilingView _detachedTileControllers](self, "_detachedTileControllers");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "tileIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "removeObject:withTileIdentifier:", v12, v15);

          objc_msgSend(v12, "setDetached:", 0);
          objc_msgSend(v12, "setLayoutInfo:", v13);

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }
  if (self->_tileTransitionDelegateFlags.respondsToTileTransitionCoordinatorForReattachedTileControllers)
  {
    -[PUTilingView tileTransitionDelegate](self, "tileTransitionDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tilingView:tileTransitionCoordinatorForReattachedTileControllers:context:", self, v6, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }
  -[PUTilingView _invalidateTileControllersWithTileTransitionCoordinator:](self, "_invalidateTileControllersWithTileTransitionCoordinator:", v18);
  -[PUTilingView _invalidateReferencedDataSources](self, "_invalidateReferencedDataSources");
  -[PUTilingView _invalidateReferencedCoordinateSystems](self, "_invalidateReferencedCoordinateSystems");
  -[PUTilingView _updateIfNeeded](self, "_updateIfNeeded");

}

- (id)presentedTileControllerWithIndexPath:(id)a3 kind:(id)a4 dataSourceIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PUTileIdentifier *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8 && v9 && v10)
  {
    v12 = -[PUTileIdentifier initWithIndexPath:tileKind:dataSourceIdentifier:]([PUTileIdentifier alloc], "initWithIndexPath:tileKind:dataSourceIdentifier:", v8, v9, v10);
    -[PUTilingView _activeTileControllers](self, "_activeTileControllers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectWithTileIdentifier:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      -[PUTilingView _detachedTileControllers](self, "_detachedTileControllers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectWithTileIdentifier:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    PLOneUpGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v18 = 138412802;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_DEBUG, "presentedTileControllerWithIndexPath invoked with indexPath %@ tileKind %@ dataSourceIdentifier %@", (uint8_t *)&v18, 0x20u);
    }

    v14 = 0;
  }

  return v14;
}

- (void)enumeratePresentedTileControllersInRect:(CGRect)a3 usingBlock:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void (**v10)(id, void *, uint64_t, unsigned __int8 *);
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  id v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  _BYTE v34[128];
  uint64_t v35;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v35 = *MEMORY[0x1E0C80C00];
  v10 = (void (**)(id, void *, uint64_t, unsigned __int8 *))a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingView.m"), 647, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerationBlock != NULL"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __67__PUTilingView_enumeratePresentedTileControllersInRect_usingBlock___block_invoke;
  v28[3] = &unk_1E58A94F8;
  v28[4] = self;
  v30 = x;
  v31 = y;
  v32 = width;
  v33 = height;
  v12 = v11;
  v29 = v12;
  -[PUTilingView _enumerateAllTileControllersUsingBlock:](self, "_enumerateAllTileControllersUsingBlock:", v28);
  objc_msgSend(v12, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sortedArrayUsingComparator:", &__block_literal_global_95551);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
LABEL_5:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v18)
        objc_enumerationMutation(v15);
      v20 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v19);
      objc_msgSend(v12, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      v10[2](v10, v21, v20, &v23);
      LODWORD(v20) = v23;

      if ((_DWORD)v20)
        break;
      if (v17 == ++v19)
      {
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
        if (v17)
          goto LABEL_5;
        break;
      }
    }
  }

}

- (id)tileControllerWithIndexPath:(id)a3 kind:(id)a4 dataSourceIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v27[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  id *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v34 = 0;
  v35 = (id *)&v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__95495;
  v38 = __Block_byref_object_dispose__95496;
  -[PUTilingView presentedTileControllerWithIndexPath:kind:dataSourceIdentifier:](self, "presentedTileControllerWithIndexPath:kind:dataSourceIdentifier:", v8, v9, v10);
  v39 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v35[5];
  if (!v11)
  {
    -[PUTilingView layout](self, "layout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutInfoForTileWithIndexPath:kind:", v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v28 = 0;
      v29 = &v28;
      v30 = 0x3032000000;
      v31 = __Block_byref_object_copy__95495;
      v32 = __Block_byref_object_dispose__95496;
      v33 = 0;
      -[PUTilingView _inactiveTileControllers](self, "_inactiveTileControllers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "tileIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __70__PUTilingView_tileControllerWithIndexPath_kind_dataSourceIdentifier___block_invoke;
      v27[3] = &unk_1E58A9560;
      v27[4] = &v34;
      v27[5] = &v28;
      objc_msgSend(v14, "enumerateObjectsWithTileIdentifier:usingBlock:", v15, v27);

      if (!v35[5])
      {
        v16 = (void *)v29[5];
        if (!v16 || (objc_storeStrong(v35 + 5, v16), !v35[5]))
        {
          objc_msgSend(v13, "dataSourceIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUTilingView _dataSourceWithIdentifier:](self, "_dataSourceWithIdentifier:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          -[PUTilingView tileSource](self, "tileSource");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUTilingView _createTileControllerWithIndexPath:kind:dataSource:tileSource:](self, "_createTileControllerWithIndexPath:kind:dataSource:tileSource:", v8, v9, v18, v19);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = v35[5];
          v35[5] = (id)v20;

          -[PUTilingView _inactiveTileControllers](self, "_inactiveTileControllers");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v35[5];
          objc_msgSend(v13, "tileIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:withTileIdentifier:", v23, v24);

        }
      }
      _Block_object_dispose(&v28, 8);

    }
    v11 = v35[5];
  }
  v25 = v11;
  _Block_object_dispose(&v34, 8);

  return v25;
}

- (void)enumerateAllTileControllersUsingBlock:(id)a3
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingView.m"), 721, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerationBlock != NULL"));

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__PUTilingView_enumerateAllTileControllersUsingBlock___block_invoke;
  v8[3] = &unk_1E58A9588;
  v9 = v5;
  v6 = v5;
  -[PUTilingView _enumerateAllTileControllersUsingBlock:](self, "_enumerateAllTileControllersUsingBlock:", v8);

}

- (void)_enumerateAllTileControllersUsingBlock:(id)a3
{
  id v5;
  id v6;
  void (**v7)(void *, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD aBlock[4];
  id v13;
  _QWORD *v14;
  _QWORD v15[3];
  char v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingView.m"), 729, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerationBlock != NULL"));

  }
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PUTilingView__enumerateAllTileControllersUsingBlock___block_invoke;
  aBlock[3] = &unk_1E58A95D8;
  v14 = v15;
  v6 = v5;
  v13 = v6;
  v7 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[PUTilingView _activeTileControllers](self, "_activeTileControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v8);

  -[PUTilingView _inactiveTileControllers](self, "_inactiveTileControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v9);

  -[PUTilingView _detachedTileControllers](self, "_detachedTileControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v10);

  _Block_object_dispose(v15, 8);
}

- (void)_enumerateActiveTileControllersUsingBlock:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD v12[3];
  char v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingView.m"), 749, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerationBlock != NULL"));

  }
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v13 = 0;
  -[PUTilingView _activeTileControllers](self, "_activeTileControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__PUTilingView__enumerateActiveTileControllersUsingBlock___block_invoke;
  v9[3] = &unk_1E58A95B0;
  v7 = v5;
  v10 = v7;
  v11 = v12;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  _Block_object_dispose(v12, 8);
}

- (id)_createTileControllerWithIndexPath:(id)a3 kind:(id)a4 dataSource:(id)a5 tileSource:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v17;
  void *v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingView.m"), 761, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tileSource != nil"));

  }
  objc_msgSend(v14, "tilingView:tileControllerWithIndexPath:kind:dataSource:", self, v11, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingView.m"), 763, CFSTR("no tile controller returned for {%@, %@}"), v11, v12);

  }
  return v15;
}

- (BOOL)isAnyTileControllerAnimating
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__PUTilingView_isAnyTileControllerAnimating__block_invoke;
  v4[3] = &unk_1E58A9600;
  v4[4] = &v5;
  -[PUTilingView _enumerateAllTileControllersUsingBlock:](self, "_enumerateAllTileControllersUsingBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)invalidateLayout:(id)a3 withContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  if (v13)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingView.m"), 781, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layout != nil"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingView.m"), 782, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invalidationContext != nil"));

LABEL_3:
  -[PUTilingView layout](self, "layout");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v13)
  {
    -[PUTilingView _invalidateLayout](self, "_invalidateLayout");
    if (objc_msgSend(v7, "invalidatedContentBounds"))
      -[PUTilingView _invalidateScrollViewProperties](self, "_invalidateScrollViewProperties");
    if (objc_msgSend(v7, "invalidatedAnyTile"))
    {
      if (self->_tileTransitionDelegateFlags.respondsToTileTransitionCoordinatorForLayoutInvalidationContext
        && (-[PUTilingView tileTransitionDelegate](self, "tileTransitionDelegate"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v9, "tilingView:tileTransitionCoordinatorForLayoutInvalidationContext:", self, v7),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v9,
            v10))
      {
        -[PUTilingView _invalidateTileControllersWithTileTransitionCoordinator:](self, "_invalidateTileControllersWithTileTransitionCoordinator:", v10);

      }
      else
      {
        -[PUTilingView _invalidateTileControllers](self, "_invalidateTileControllers");
      }
    }
  }

}

- (void)_invalidateLayoutVisibleRect
{
  -[PUTilingView _setNeedsUpdateLayoutVisibleRect:](self, "_setNeedsUpdateLayoutVisibleRect:", 1);
  -[PUTilingView _invalidateTileControllersVisibleRect](self, "_invalidateTileControllersVisibleRect");
  -[PUTilingView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateTileControllersVisibleRect
{
  -[PUTilingView _setNeedsUpdateTileControllersVisibleRect:](self, "_setNeedsUpdateTileControllersVisibleRect:", 1);
  -[PUTilingView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateLayoutCoordinateSystemWithReason:(int64_t)a3
{
  -[PUTilingView _setNeedsUpdateLayoutCoordinateSystem:](self, "_setNeedsUpdateLayoutCoordinateSystem:", 1);
  -[PUTilingView _setReasonForNextLayoutCoordinateSystemUpdate:](self, "_setReasonForNextLayoutCoordinateSystemUpdate:", a3);
  -[PUTilingView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateLayout
{
  -[PUTilingView _setNeedsUpdateLayout:](self, "_setNeedsUpdateLayout:", 1);
  -[PUTilingView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateScrollViewProperties
{
  -[PUTilingView _setNeedsUpdateScrollViewProperties:](self, "_setNeedsUpdateScrollViewProperties:", 1);
  -[PUTilingView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateReferencedDataSources
{
  -[PUTilingView _setNeedsUpdateReferencedDataSources:](self, "_setNeedsUpdateReferencedDataSources:", 1);
  -[PUTilingView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateReferencedCoordinateSystems
{
  -[PUTilingView _setNeedsUpdateReferencedCoordinateSystems:](self, "_setNeedsUpdateReferencedCoordinateSystems:", 1);
  -[PUTilingView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateTileControllers
{
  -[PUTilingView _setNeedsUpdateTileControllers:](self, "_setNeedsUpdateTileControllers:", 1);
  -[PUTilingView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateTileControllersWithTileTransitionCoordinator:(id)a3
{
  -[PUTilingView _setTileTransitionCoordinatorForNextLayout:](self, "_setTileTransitionCoordinatorForNextLayout:", a3);
  -[PUTilingView _setNeedsUpdateTileControllers:](self, "_setNeedsUpdateTileControllers:", 1);
  -[PUTilingView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateIfNeeded
{
  -[PUTilingView _updateLayoutVisibleRectIfNeeded](self, "_updateLayoutVisibleRectIfNeeded");
  -[PUTilingView _updateLayoutIfNeeded](self, "_updateLayoutIfNeeded");
  -[PUTilingView _updateLayoutCoordinateSystemIfNeeded](self, "_updateLayoutCoordinateSystemIfNeeded");
  -[PUTilingView _updateScrollViewPropertiesIfNeeded](self, "_updateScrollViewPropertiesIfNeeded");
  -[PUTilingView _updateTileControllersIfNeeded](self, "_updateTileControllersIfNeeded");
  -[PUTilingView _updateTileControllersVisibleRectIfNeeded](self, "_updateTileControllersVisibleRectIfNeeded");
  -[PUTilingView _updateReferencedDataSourcesIfNeeded](self, "_updateReferencedDataSourcesIfNeeded");
  -[PUTilingView _updateReferencedCoordinateSystemsIfNeeded](self, "_updateReferencedCoordinateSystemsIfNeeded");
  -[PUTilingView _runPostLayoutBlocks](self, "_runPostLayoutBlocks");
}

- (void)_updateLayoutIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PUTilingDataSourceConverter *v8;
  void *v9;
  id v10;

  if (-[PUTilingView _needsUpdateLayout](self, "_needsUpdateLayout"))
  {
    -[PUTilingView _setNeedsUpdateLayout:](self, "_setNeedsUpdateLayout:", 0);
    -[PUTilingView _pendingLayout](self, "_pendingLayout");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[PUTilingView layout](self, "layout");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUTilingView _setPendingLayout:](self, "_setPendingLayout:", 0);
      -[PUTilingView _setLayout:](self, "_setLayout:", v10);
      objc_msgSend(v10, "setTilingView:", self);
      objc_msgSend(v3, "dataSource");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dataSource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5 != v4 && (objc_msgSend(v5, "isEqual:", v4) & 1) == 0)
      {
        if (self->_tileTransitionDelegateFlags.respondsToDataSourceConverterForTransitionFromLayoutToLayout)
        {
          -[PUTilingView tileTransitionDelegate](self, "tileTransitionDelegate");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "tilingView:dataSourceConverterForTransitionFromLayout:toLayout:", self, v3, v10);
          v8 = (PUTilingDataSourceConverter *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v8 = objc_alloc_init(PUTilingDataSourceConverter);
        }
        -[PUTilingView _transferTileControllersToDataSource:usingDataSourceConverter:](self, "_transferTileControllersToDataSource:usingDataSourceConverter:", v6, v8);

      }
    }
    -[PUTilingView layout](self, "layout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "prepareLayout");

  }
}

- (void)_updateLayoutCoordinateSystemIfNeeded
{
  int64_t v4;
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
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _BOOL4 v25;
  void *v26;
  double v27;
  double v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  PUTilingView *v45;
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (-[PUTilingView _needsUpdateLayoutCoordinateSystem](self, "_needsUpdateLayoutCoordinateSystem"))
  {
    -[PUTilingView _setNeedsUpdateLayoutCoordinateSystem:](self, "_setNeedsUpdateLayoutCoordinateSystem:", 0);
    v4 = -[PUTilingView _reasonForNextLayoutCoordinateSystemUpdate](self, "_reasonForNextLayoutCoordinateSystemUpdate");
    -[PUTilingView _setReasonForNextLayoutCoordinateSystemUpdate:](self, "_setReasonForNextLayoutCoordinateSystemUpdate:", 0);
    -[PUTilingView layout](self, "layout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parentCoordinateSystem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parentCoordinateSystem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __53__PUTilingView__updateLayoutCoordinateSystemIfNeeded__block_invoke;
      v43[3] = &unk_1E58A9628;
      v44 = v5;
      v45 = self;
      v46 = v7;
      -[PUTilingView _enumerateAllTileControllersUsingBlock:](self, "_enumerateAllTileControllersUsingBlock:", v43);

    }
    -[PUTilingView contentCoordinateSystem](self, "contentCoordinateSystem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setParentCoordinateSystem:", v9);

    if (-[PUTilingView isDecelerating](self, "isDecelerating")
      && -[PUTilingView isPagingEnabled](self, "isPagingEnabled"))
    {
      -[PUTilingView _pageDecelerationTarget](self, "_pageDecelerationTarget");
    }
    else
    {
      -[PUTilingView contentOffset](self, "contentOffset");
    }
    v12 = v10;
    v13 = v11;
    v15 = *MEMORY[0x1E0C9D538];
    v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    if ((unint64_t)(v4 - 2) < 2)
    {
      -[PUTilingView fixedCoordinateSystem](self, "fixedCoordinateSystem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "coordinateSystem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v17, v18, v15, v14);
      v14 = v19;

      if (self->_scrollDelegateFlags.respondsToTargetVisibleOriginForProposedVisibleOrigin)
      {
        -[PUTilingView scrollDelegate](self, "scrollDelegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "tilingView:targetVisibleOriginForProposedVisibleOrigin:withLayout:", self, v5, v15, v14);
        v22 = v21;
        v24 = v23;

        v25 = v22 != v15;
        if (v24 != v14)
          v25 = 1;
        if (!v6)
          v25 = 1;
        v38 = v25;
        v14 = v24;
        v15 = v22;
      }
      else
      {
        v38 = v6 == 0;
      }
    }
    else
    {
      v38 = v6 == 0;
      if (v4 == 1)
      {
        if (self->_scrollDelegateFlags.respondsToInitialVisibleOriginWithLayout)
        {
          -[PUTilingView scrollDelegate](self, "scrollDelegate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "tilingView:initialVisibleOriginWithLayout:", self, v5);
          v15 = v27;
          v14 = v28;

        }
      }
      else if (!v4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingView.m"), 939, CFSTR("no valid reason to update coordinate system"));

      }
    }
    objc_msgSend(v5, "setCoordinateSystemOrigin:", v12 - v15, v13 - v14);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v29 = v7;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v40 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v34, "layoutInfo");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "coordinateSystem");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "layoutInfoWithCoordinateSystem:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v34, "setLayoutInfo:", v37);
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v31);
    }

    if (v38)
    {
      -[PUTilingView _invalidateLayoutVisibleRect](self, "_invalidateLayoutVisibleRect");
      -[PUTilingView _updateLayoutVisibleRectIfNeeded](self, "_updateLayoutVisibleRectIfNeeded");
      -[PUTilingView _updateLayoutIfNeeded](self, "_updateLayoutIfNeeded");
    }

  }
}

- (void)_updateLayoutVisibleRectIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
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
  id v18;

  if (-[PUTilingView _needsUpdateLayoutVisibleRect](self, "_needsUpdateLayoutVisibleRect"))
  {
    -[PUTilingView _setNeedsUpdateLayoutVisibleRect:](self, "_setNeedsUpdateLayoutVisibleRect:", 0);
    -[PUTilingView _pendingLayout](self, "_pendingLayout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      -[PUTilingView layout](self, "layout");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v5;

    -[PUTilingView bounds](self, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v18, "parentCoordinateSystem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[PUTilingView contentCoordinateSystem](self, "contentCoordinateSystem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "coordinateSystem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v15, v16, v7, v9);
      v9 = v17;

    }
    objc_msgSend(v18, "setVisibleRect:", v7, v9, v11, v13);

  }
}

- (void)_updateTileControllersVisibleRectIfNeeded
{
  if (-[PUTilingView _needsUpdateTileControllersVisibleRect](self, "_needsUpdateTileControllersVisibleRect"))
  {
    -[PUTilingView _setNeedsUpdateTileControllersVisibleRect:](self, "_setNeedsUpdateTileControllersVisibleRect:", 0);
    -[PUTilingView _enumerateActiveTileControllersUsingBlock:](self, "_enumerateActiveTileControllersUsingBlock:", &__block_literal_global_94);
  }
}

- (void)_updateScrollViewPropertiesIfNeeded
{
  id v3;

  if (-[PUTilingView _needsUpdateScrollViewProperties](self, "_needsUpdateScrollViewProperties"))
  {
    -[PUTilingView _setNeedsUpdateScrollViewProperties:](self, "_setNeedsUpdateScrollViewProperties:", 0);
    -[PUTilingView layout](self, "layout");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[PUTilingView _updateScrollViewPropertiesWithLayout:](self, "_updateScrollViewPropertiesWithLayout:", v3);

  }
}

- (void)_updateScrollViewPropertiesWithLayout:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  CGFloat v16;
  uint64_t v17;
  double MinX;
  double MinY;
  void *v20;
  void *v21;
  double v22;
  double v23;
  unint64_t v24;
  unsigned int v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  int v31;
  unint64_t v32;
  double MaxY;
  double MaxX;
  id v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v35 = a3;
  objc_msgSend(v35, "contentBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v35, "coordinateSystem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTilingView contentCoordinateSystem](self, "contentCoordinateSystem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v12, v13, v5, v7);
  v16 = v15;

  v36.origin.x = v14;
  v36.origin.y = v16;
  v36.size.width = v9;
  v36.size.height = v11;
  MaxX = CGRectGetMaxX(v36);
  v37.origin.x = v14;
  v37.origin.y = v16;
  v37.size.width = v9;
  v37.size.height = v11;
  MaxY = CGRectGetMaxY(v37);
  v17 = MEMORY[0x1E0DC49E8];
  v38.origin.x = v14;
  v38.origin.y = v16;
  v38.size.width = v9;
  v38.size.height = v11;
  MinX = CGRectGetMinX(v38);
  v39.origin.x = v14;
  v39.origin.y = v16;
  v39.size.width = v9;
  v39.size.height = v11;
  MinY = CGRectGetMinY(v39);
  if (!self->_scrollDelegateFlags.respondsToScrollInfoWithLayout
    || (-[PUTilingView scrollDelegate](self, "scrollDelegate"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v20, "tilingView:scrollInfoWithLayout:", self, v35),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v20,
        !v21))
  {
    objc_msgSend(v35, "preferredScrollInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = *(double *)(v17 + 16);
  v23 = *(double *)(v17 + 24);
  v24 = objc_msgSend(v21, "scrollDirections");
  v25 = objc_msgSend(v21, "shouldEnablePaging");
  objc_msgSend(v21, "interpageSpacing");
  v27 = v26;
  v29 = v28;
  +[PUTilingViewSettings sharedInstance](PUTilingViewSettings, "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "allowPaging");

  v32 = v24 & 4;
  if (((v24 >> 1) & 1) != -[PUTilingView alwaysBounceHorizontal](self, "alwaysBounceHorizontal")
    || (v32 >> 2) != -[PUTilingView alwaysBounceVertical](self, "alwaysBounceVertical"))
  {
    -[PUTilingView contentOffset](self, "contentOffset");
    -[PUTilingView setContentOffset:animated:](self, "setContentOffset:animated:", 0);
  }
  -[PUTilingView setContentSize:](self, "setContentSize:", MaxX, MaxY);
  -[PUTilingView setContentInset:](self, "setContentInset:", -MinY, -MinX, v22, v23);
  -[PUTilingView setAlwaysBounceHorizontal:](self, "setAlwaysBounceHorizontal:", (v24 & 2) != 0);
  -[PUTilingView setAlwaysBounceVertical:](self, "setAlwaysBounceVertical:", v32 != 0);
  -[PUTilingView setPagingEnabled:](self, "setPagingEnabled:", v31 & v25);
  -[PUTilingView _setInterpageSpacing:](self, "_setInterpageSpacing:", v27, v29);
  -[PUTilingView _setPagingOrigin:](self, "_setPagingOrigin:", MinX, MinY);
  objc_msgSend(v21, "pagingSpringPullAdjustment");
  -[PUTilingView _setPagingSpringPullAdjustment:](self, "_setPagingSpringPullAdjustment:");
  objc_msgSend(v21, "pagingFrictionAdjustment");
  -[PUTilingView _setPagingFrictionAdjustment:](self, "_setPagingFrictionAdjustment:");
  -[PUTilingView _adjustScrollViewPagingDeceleration](self, "_adjustScrollViewPagingDeceleration");

}

- (void)_updateTileControllersIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  if (-[PUTilingView _needsUpdateTileControllers](self, "_needsUpdateTileControllers"))
  {
    -[PUTilingView _setNeedsUpdateTileControllers:](self, "_setNeedsUpdateTileControllers:", 0);
    -[PUTilingView window](self, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[PUTilingView _tileTransitionCoordinatorForNextLayout](self, "_tileTransitionCoordinatorForNextLayout");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PUTilingView _setTileTransitionCoordinatorForNextLayout:](self, "_setTileTransitionCoordinatorForNextLayout:", 0);
    -[PUTilingView layout](self, "layout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__PUTilingView__updateTileControllersIfNeeded__block_invoke;
    v10[3] = &unk_1E58AB790;
    v10[4] = self;
    v11 = v4;
    v12 = v3;
    v5 = v3;
    v6 = v4;
    +[PUAnimationGroup animationGroupWithAnimations:](PUAnimationGroup, "animationGroupWithAnimations:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTilingView onNextTileControllersUpdateBlock](self, "onNextTileControllersUpdateBlock");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[PUTilingView setOnNextTileControllersUpdateBlock:](self, "setOnNextTileControllersUpdateBlock:", 0);
      ((void (**)(_QWORD, void *))v8)[2](v8, v7);
    }
    if (self->_tileUseDelegateFlags.respondsToDidUpdateTileControllers)
    {
      -[PUTilingView tileUseDelegate](self, "tileUseDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "tilingViewDidUpdateTileControllers:", self);

    }
  }
}

- (void)_updateTileControllersWithLayout:(id)a3 tileTransitionCoordinator:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  SEL v15;
  _QWORD v16[5];
  id v17;
  id v18;
  SEL v19;
  _QWORD v20[5];
  id v21;
  id v22;
  SEL v23;
  _QWORD v24[5];
  id v25;
  id v26;
  SEL v27;
  _QWORD v28[5];
  id v29;
  SEL v30;

  v7 = a3;
  v8 = a4;
  -[PUTilingView tileAnimator](self, "tileAnimator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {

    v8 = 0;
  }
  v10 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke;
  v28[3] = &unk_1E58A9690;
  v30 = a2;
  v28[4] = self;
  v29 = v8;
  v24[0] = v10;
  v24[1] = 3221225472;
  v24[2] = __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_2;
  v24[3] = &unk_1E58A96B8;
  v27 = a2;
  v24[4] = self;
  v25 = v29;
  v26 = v9;
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_4;
  v20[3] = &unk_1E58A96E0;
  v23 = a2;
  v20[4] = self;
  v21 = v25;
  v22 = v26;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_6;
  v16[3] = &unk_1E58A9708;
  v19 = a2;
  v16[4] = self;
  v17 = v21;
  v18 = v22;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_8;
  v13[3] = &unk_1E58A9730;
  v14 = v18;
  v15 = a2;
  v13[4] = self;
  v11 = v18;
  v12 = v21;
  -[PUTilingView _updateTileControllersWithLayout:reactivatability:appearanceHandler:updateHandler:disappearanceHandler:heartBeatHandler:](self, "_updateTileControllersWithLayout:reactivatability:appearanceHandler:updateHandler:disappearanceHandler:heartBeatHandler:", v7, v28, v24, v20, v16, v13);

}

- (void)_updateTileControllersWithLayout:(id)a3 reactivatability:(id)a4 appearanceHandler:(id)a5 updateHandler:(id)a6 disappearanceHandler:(id)a7 heartBeatHandler:(id)a8
{
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  int v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  PUTilingView *v62;
  id v63;
  id v64;
  void *v65;
  uint64_t (**v66)(id, uint64_t, void *);
  id v67;
  id v68;
  void *v69;
  id v70;
  id obj;
  void *v72;
  _QWORD v73[4];
  id v74;
  _QWORD v75[4];
  id v76;
  PUTilingView *v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  _QWORD v83[4];
  id v84;
  id v85;
  id v86;
  _QWORD v87[4];
  id v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v63 = a4;
  v61 = a5;
  v66 = (uint64_t (**)(id, uint64_t, void *))a6;
  v60 = a7;
  v64 = a8;
  -[PUTilingView bounds](self, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  +[PUTilingViewSettings sharedInstance](PUTilingViewSettings, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a7) = objc_msgSend(v23, "allowPreheating");

  if ((_DWORD)a7)
  {
    -[PUTilingView loadingInsets](self, "loadingInsets");
    v16 = v16 + v24;
    v18 = v18 + v25;
    v20 = v20 - (v24 + v26);
    v22 = v22 - (v25 + v27);
  }
  -[PUTilingView contentCoordinateSystem](self, "contentCoordinateSystem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "coordinateSystem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v28, v29, v16, v18);
  v32 = v31;

  objc_msgSend(v14, "layoutInfosForTilesInRect:", v30, v32, v20, v22);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v14;
  objc_msgSend(v14, "dataSource");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTilingView _activeTileControllers](self, "_activeTileControllers");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTilingView _inactiveTileControllers](self, "_inactiveTileControllers");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = -[PUTileTree initUsingUniqueLeafs:]([PUTileTree alloc], "initUsingUniqueLeafs:", 1);
  v69 = v34;
  v35 = (void *)objc_msgSend(v34, "copy");
  v62 = self;
  -[PUTilingView _detachedTileControllers](self, "_detachedTileControllers");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)objc_msgSend(v36, "copy");
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  obj = v33;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v94, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v91;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v91 != v39)
          objc_enumerationMutation(obj);
        v41 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
        objc_msgSend(v41, "tileIdentifier", v58);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectWithTileIdentifier:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          objc_msgSend(v72, "removeObject:withTileIdentifier:", v43, v42);
LABEL_10:
          objc_msgSend(v35, "removeObjectWithTileIdentifier:", v42);
          goto LABEL_14;
        }
        objc_msgSend(v69, "objectWithTileIdentifier:", v42);
        v44 = objc_claimAutoreleasedReturnValue();
        if (v44)
        {
          v45 = (void *)v44;
          v46 = v66[2](v66, v44, v41);

          if (v46)
            goto LABEL_10;
        }
        objc_msgSend(v67, "addObject:withTileIdentifier:", v41, v42);
LABEL_14:

      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v94, 16);
    }
    while (v38);
  }

  v47 = MEMORY[0x1E0C809B0];
  v87[0] = MEMORY[0x1E0C809B0];
  v87[1] = 3221225472;
  v87[2] = __136__PUTilingView__updateTileControllersWithLayout_reactivatability_appearanceHandler_updateHandler_disappearanceHandler_heartBeatHandler___block_invoke;
  v87[3] = &unk_1E58A9758;
  v88 = v35;
  v89 = v67;
  v48 = v67;
  v68 = v35;
  objc_msgSend(v72, "enumerateObjectsUsingBlock:", v87);
  v83[0] = v47;
  v83[1] = 3221225472;
  v83[2] = __136__PUTilingView__updateTileControllersWithLayout_reactivatability_appearanceHandler_updateHandler_disappearanceHandler_heartBeatHandler___block_invoke_2;
  v83[3] = &unk_1E58A9780;
  v49 = v69;
  v84 = v49;
  v50 = v58;
  v85 = v50;
  v86 = v60;
  v70 = v60;
  objc_msgSend(v68, "enumerateObjectsUsingBlock:", v83);
  v75[0] = v47;
  v75[1] = 3221225472;
  v75[2] = __136__PUTilingView__updateTileControllersWithLayout_reactivatability_appearanceHandler_updateHandler_disappearanceHandler_heartBeatHandler___block_invoke_3;
  v75[3] = &unk_1E58A97D0;
  v76 = v36;
  v77 = v62;
  v78 = v50;
  v79 = v59;
  v80 = v49;
  v81 = v63;
  v82 = v61;
  v51 = v61;
  v52 = v49;
  v53 = v59;
  v54 = v63;
  v55 = v50;
  v56 = v36;
  objc_msgSend(v48, "enumerateObjectsUsingBlock:", v75);
  v73[0] = v47;
  v73[1] = 3221225472;
  v73[2] = __136__PUTilingView__updateTileControllersWithLayout_reactivatability_appearanceHandler_updateHandler_disappearanceHandler_heartBeatHandler___block_invoke_5;
  v73[3] = &unk_1E58A9588;
  v74 = v64;
  v57 = v64;
  objc_msgSend(v55, "enumerateObjectsUsingBlock:", v73);

}

- (void)_updateReferencedDataSourcesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void (**v11)(void *, void *);
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD aBlock[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[PUTilingView _needsUpdateReferencedDataSources](self, "_needsUpdateReferencedDataSources"))
  {
    -[PUTilingView _setNeedsUpdateReferencedDataSources:](self, "_setNeedsUpdateReferencedDataSources:", 0);
    -[PUTilingView _referencedDataSourcesByIdentifiers](self, "_referencedDataSourcesByIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v3, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUTilingView layout](self, "layout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v6, "removeObject:", v9);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__PUTilingView__updateReferencedDataSourcesIfNeeded__block_invoke;
    aBlock[3] = &unk_1E58A9820;
    v10 = v6;
    v24 = v10;
    v11 = (void (**)(void *, void *))_Block_copy(aBlock);
    -[PUTilingView _inactiveTileControllers](self, "_inactiveTileControllers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v12);

    -[PUTilingView _detachedTileControllers](self, "_detachedTileControllers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v13);

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18++), (_QWORD)v19);
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v16);
    }

  }
}

- (void)_updateReferencedCoordinateSystemsIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  void (**v6)(void *, void *);
  void *v7;
  void *v8;
  void *v9;
  _QWORD aBlock[4];
  id v11;

  if (-[PUTilingView _needsUpdateReferencedCoordinateSystems](self, "_needsUpdateReferencedCoordinateSystems"))
  {
    -[PUTilingView _setNeedsUpdateReferencedCoordinateSystems:](self, "_setNeedsUpdateReferencedCoordinateSystems:", 0);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTilingView layout](self, "layout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__PUTilingView__updateReferencedCoordinateSystemsIfNeeded__block_invoke;
    aBlock[3] = &unk_1E58A9820;
    v11 = v3;
    v5 = v3;
    v6 = (void (**)(void *, void *))_Block_copy(aBlock);
    -[PUTilingView _inactiveTileControllers](self, "_inactiveTileControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v7);

    -[PUTilingView _detachedTileControllers](self, "_detachedTileControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8);

    -[PUTilingView _referencedCoordinateSystems](self, "_referencedCoordinateSystems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSet:", v5);

  }
}

- (void)_runPostLayoutBlocks
{
  id v3;
  _QWORD v4[5];

  -[PUTilingView _postLayoutBlocks](self, "_postLayoutBlocks");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__PUTilingView__runPostLayoutBlocks__block_invoke;
  v4[3] = &unk_1E58A9848;
  v4[4] = self;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

- (void)registerPostLayoutBlock:(id)a3 forIdentifier:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingView.m"), 1373, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  -[PUTilingView _postLayoutBlocks](self, "_postLayoutBlocks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v7);

}

- (void)_registerDataSource:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PUTilingView _referencedDataSourcesByIdentifiers](self, "_referencedDataSourcesByIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

}

- (id)_dataSourceWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUTilingView _referencedDataSourcesByIdentifiers](self, "_referencedDataSourcesByIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_transferTileControllersToDataSource:(id)a3 usingDataSourceConverter:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(void *, void *);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD aBlock[5];
  id v19;
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingView.m"), 1391, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSourceConverter != nil"));

  }
  -[PUTilingView _registerDataSource:](self, "_registerDataSource:", v7);
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__PUTilingView__transferTileControllersToDataSource_usingDataSourceConverter___block_invoke;
  aBlock[3] = &unk_1E58A9898;
  aBlock[4] = self;
  v19 = v8;
  v20 = v7;
  v21 = v9;
  v10 = v9;
  v11 = v7;
  v12 = v8;
  v13 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[PUTilingView _activeTileControllers](self, "_activeTileControllers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2](v13, v14);

  -[PUTilingView _inactiveTileControllers](self, "_inactiveTileControllers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2](v13, v15);

  -[PUTilingView _detachedTileControllers](self, "_detachedTileControllers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2](v13, v16);

}

- (PUTilingViewTileSource)tileSource
{
  return (PUTilingViewTileSource *)objc_loadWeakRetained((id *)&self->_tileSource);
}

- (void)setTileSource:(id)a3
{
  objc_storeWeak((id *)&self->_tileSource, a3);
}

- (UIEdgeInsets)loadingInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_loadingInsets.top;
  left = self->_loadingInsets.left;
  bottom = self->_loadingInsets.bottom;
  right = self->_loadingInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (PUTilingLayout)layout
{
  return self->_layout;
}

- (void)_setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (PUTileAnimator)tileAnimator
{
  return (PUTileAnimator *)objc_loadWeakRetained((id *)&self->_tileAnimator);
}

- (void)setTileAnimator:(id)a3
{
  objc_storeWeak((id *)&self->_tileAnimator, a3);
}

- (PUTilingViewTileTransitionDelegate)tileTransitionDelegate
{
  return (PUTilingViewTileTransitionDelegate *)objc_loadWeakRetained((id *)&self->_tileTransitionDelegate);
}

- (PUTilingViewScrollDelegate)scrollDelegate
{
  return (PUTilingViewScrollDelegate *)objc_loadWeakRetained((id *)&self->_scrollDelegate);
}

- (PUTilingViewTileUseDelegate)tileUseDelegate
{
  return (PUTilingViewTileUseDelegate *)objc_loadWeakRetained((id *)&self->_tileUseDelegate);
}

- (PUTilingCoordinateSystem)contentCoordinateSystem
{
  return self->_contentCoordinateSystem;
}

- (PUTilingCoordinateSystem)fixedCoordinateSystem
{
  return self->_fixedCoordinateSystem;
}

- (BOOL)shouldDisplayHDR
{
  return self->_shouldDisplayHDR;
}

- (void)setShouldDisplayHDR:(BOOL)a3
{
  self->_shouldDisplayHDR = a3;
}

- (PUTilingLayout)_pendingLayout
{
  return self->__pendingLayout;
}

- (void)_setPendingLayout:(id)a3
{
  objc_storeStrong((id *)&self->__pendingLayout, a3);
}

- (PUReuseQueue)_tileControllerReuseQueue
{
  return self->__tileControllerReuseQueue;
}

- (PUTileTree)_activeTileControllers
{
  return self->__activeTileControllers;
}

- (PUTileTree)_inactiveTileControllers
{
  return self->__inactiveTileControllers;
}

- (PUTileTree)_detachedTileControllers
{
  return self->__detachedTileControllers;
}

- (NSMutableDictionary)_referencedDataSourcesByIdentifiers
{
  return self->__referencedDataSourcesByIdentifiers;
}

- (NSMutableSet)_referencedCoordinateSystems
{
  return self->__referencedCoordinateSystems;
}

- (BOOL)_needsUpdateLayoutVisibleRect
{
  return self->__needsUpdateLayoutVisibleRect;
}

- (void)_setNeedsUpdateLayoutVisibleRect:(BOOL)a3
{
  self->__needsUpdateLayoutVisibleRect = a3;
}

- (BOOL)_needsUpdateTileControllersVisibleRect
{
  return self->__needsUpdateTileControllersVisibleRect;
}

- (void)_setNeedsUpdateTileControllersVisibleRect:(BOOL)a3
{
  self->__needsUpdateTileControllersVisibleRect = a3;
}

- (BOOL)_needsUpdateLayoutCoordinateSystem
{
  return self->__needsUpdateLayoutCoordinateSystem;
}

- (void)_setNeedsUpdateLayoutCoordinateSystem:(BOOL)a3
{
  self->__needsUpdateLayoutCoordinateSystem = a3;
}

- (BOOL)_needsUpdateLayout
{
  return self->__needsUpdateLayout;
}

- (void)_setNeedsUpdateLayout:(BOOL)a3
{
  self->__needsUpdateLayout = a3;
}

- (BOOL)_needsUpdateScrollViewProperties
{
  return self->__needsUpdateScrollViewProperties;
}

- (void)_setNeedsUpdateScrollViewProperties:(BOOL)a3
{
  self->__needsUpdateScrollViewProperties = a3;
}

- (BOOL)_needsUpdateTileControllers
{
  return self->__needsUpdateTileControllers;
}

- (void)_setNeedsUpdateTileControllers:(BOOL)a3
{
  self->__needsUpdateTileControllers = a3;
}

- (BOOL)_needsUpdateReferencedDataSources
{
  return self->__needsUpdateReferencedDataSources;
}

- (void)_setNeedsUpdateReferencedDataSources:(BOOL)a3
{
  self->__needsUpdateReferencedDataSources = a3;
}

- (BOOL)_needsUpdateReferencedCoordinateSystems
{
  return self->__needsUpdateReferencedCoordinateSystems;
}

- (void)_setNeedsUpdateReferencedCoordinateSystems:(BOOL)a3
{
  self->__needsUpdateReferencedCoordinateSystems = a3;
}

- (PUTileTransitionCoordinator)_tileTransitionCoordinatorForNextLayout
{
  return self->__tileTransitionCoordinatorForNextLayout;
}

- (void)_setTileTransitionCoordinatorForNextLayout:(id)a3
{
  objc_storeStrong((id *)&self->__tileTransitionCoordinatorForNextLayout, a3);
}

- (int64_t)_reasonForNextLayoutCoordinateSystemUpdate
{
  return self->__reasonForNextLayoutCoordinateSystemUpdate;
}

- (void)_setReasonForNextLayoutCoordinateSystemUpdate:(int64_t)a3
{
  self->__reasonForNextLayoutCoordinateSystemUpdate = a3;
}

- (BOOL)_isPerformingBatchUpdates
{
  return self->__performingBatchUpdates;
}

- (void)_setPerformingBatchUpdates:(BOOL)a3
{
  self->__performingBatchUpdates = a3;
}

- (NSMutableArray)_pendingUpdateItems
{
  return self->__pendingUpdateItems;
}

- (double)_pagingSpringPullAdjustment
{
  return self->__pagingSpringPullAdjustment;
}

- (void)_setPagingSpringPullAdjustment:(double)a3
{
  self->__pagingSpringPullAdjustment = a3;
}

- (double)_pagingFrictionAdjustment
{
  return self->__pagingFrictionAdjustment;
}

- (void)_setPagingFrictionAdjustment:(double)a3
{
  self->__pagingFrictionAdjustment = a3;
}

- (NSMutableDictionary)_postLayoutBlocks
{
  return self->__postLayoutBlocks;
}

- (BOOL)allowEDRHeadroomMonitoring
{
  return self->_allowEDRHeadroomMonitoring;
}

- (id)onNextTileControllersUpdateBlock
{
  return self->_onNextTileControllersUpdateBlock;
}

- (void)setOnNextTileControllersUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 2272);
}

- (PXDisplayScreenDynamicRangeMonitor)screenDynamicRangeMonitor
{
  return self->_screenDynamicRangeMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenDynamicRangeMonitor, 0);
  objc_storeStrong(&self->_onNextTileControllersUpdateBlock, 0);
  objc_storeStrong((id *)&self->__postLayoutBlocks, 0);
  objc_storeStrong((id *)&self->__pendingUpdateItems, 0);
  objc_storeStrong((id *)&self->__tileTransitionCoordinatorForNextLayout, 0);
  objc_storeStrong((id *)&self->__referencedCoordinateSystems, 0);
  objc_storeStrong((id *)&self->__referencedDataSourcesByIdentifiers, 0);
  objc_storeStrong((id *)&self->__detachedTileControllers, 0);
  objc_storeStrong((id *)&self->__inactiveTileControllers, 0);
  objc_storeStrong((id *)&self->__activeTileControllers, 0);
  objc_storeStrong((id *)&self->__tileControllerReuseQueue, 0);
  objc_storeStrong((id *)&self->__pendingLayout, 0);
  objc_storeStrong((id *)&self->_fixedCoordinateSystem, 0);
  objc_storeStrong((id *)&self->_contentCoordinateSystem, 0);
  objc_destroyWeak((id *)&self->_tileUseDelegate);
  objc_destroyWeak((id *)&self->_scrollDelegate);
  objc_destroyWeak((id *)&self->_tileTransitionDelegate);
  objc_destroyWeak((id *)&self->_tileAnimator);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_destroyWeak((id *)&self->_tileSource);
}

void __78__PUTilingView__transferTileControllersToDataSource_usingDataSourceConverter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "copy");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__PUTilingView__transferTileControllersToDataSource_usingDataSourceConverter___block_invoke_2;
  v7[3] = &unk_1E58A9870;
  v5 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = v3;
  v6 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

}

void __78__PUTilingView__transferTileControllersToDataSource_usingDataSourceConverter___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "dataSourceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_dataSourceWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "indexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tileKind");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v11;
  v23 = v10;
  v12 = objc_msgSend(*(id *)(a1 + 40), "convertIndexPath:tileKind:fromDataSource:toDataSource:", &v23, &v22, v9, *(_QWORD *)(a1 + 48));
  v13 = v23;

  v14 = v22;
  if (v12)
  {
    objc_msgSend(v5, "layoutInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layoutInfoWithIndexPath:tileKind:dataSourceIdentifier:", v13, v14, *(_QWORD *)(a1 + 56));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "tileIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 64), "useUniqueLeafs")
      && (objc_msgSend(*(id *)(a1 + 64), "objectWithTileIdentifier:", v17),
          (v18 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v19 = (void *)v18;
      PLOneUpGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 138413314;
        v25 = v5;
        v26 = 2112;
        v27 = v6;
        v28 = 2112;
        v29 = v17;
        v30 = 2112;
        v31 = v19;
        v32 = 2112;
        v33 = v21;
        _os_log_impl(&dword_1AAB61000, v20, OS_LOG_TYPE_DEFAULT, "Tried converting tileController:%@ from:%@ to:%@, but that tile identifier is already occuped by:%@, so disallowing conversion in tileTree:%@", buf, 0x34u);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 64), "removeObject:withTileIdentifier:", v5, v6);
      objc_msgSend(v5, "setLayoutInfo:", v16);
      objc_msgSend(*(id *)(a1 + 64), "addObject:withTileIdentifier:", v5, v17);
    }

  }
}

uint64_t __36__PUTilingView__runPostLayoutBlocks__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a3 + 16))(a3, *(_QWORD *)(a1 + 32));
}

void __58__PUTilingView__updateReferencedCoordinateSystemsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__PUTilingView__updateReferencedCoordinateSystemsIfNeeded__block_invoke_2;
  v3[3] = &unk_1E58A97F8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v3);

}

void __58__PUTilingView__updateReferencedCoordinateSystemsIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coordinateSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __52__PUTilingView__updateReferencedDataSourcesIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__PUTilingView__updateReferencedDataSourcesIfNeeded__block_invoke_2;
  v3[3] = &unk_1E58A97F8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v3);

}

void __52__PUTilingView__updateReferencedDataSourcesIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "dataSourceIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", v4);

}

void __136__PUTilingView__updateTileControllersWithLayout_reactivatability_appearanceHandler_updateHandler_disappearanceHandler_heartBeatHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectWithTileIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObject:withTileIdentifier:", v6, v5);
  }
  else
  {
    objc_msgSend(v8, "layoutInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:withTileIdentifier:", v7, v5);

  }
}

void __136__PUTilingView__updateTileControllersWithLayout_reactivatability_appearanceHandler_updateHandler_disappearanceHandler_heartBeatHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "removeObjectWithTileIdentifier:", v6);
  objc_msgSend(*(id *)(a1 + 40), "addObject:withTileIdentifier:", v7, v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __136__PUTilingView__updateTileControllersWithLayout_reactivatability_appearanceHandler_updateHandler_disappearanceHandler_heartBeatHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  id *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a2;
  v6 = a3;
  v21 = 0;
  v22 = (id *)&v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__95495;
  v25 = __Block_byref_object_dispose__95496;
  v26 = 0;
  objc_msgSend(*(id *)(a1 + 32), "objectWithTileIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_storeStrong(v22 + 5, v7);
  objc_msgSend(*(id *)(a1 + 40), "tileSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v22[5];
  if (!v9)
  {
    v10 = *(void **)(a1 + 48);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __136__PUTilingView__updateTileControllersWithLayout_reactivatability_appearanceHandler_updateHandler_disappearanceHandler_heartBeatHandler___block_invoke_4;
    v17[3] = &unk_1E58A97A8;
    v19 = *(id *)(a1 + 72);
    v18 = v5;
    v20 = &v21;
    objc_msgSend(v10, "enumerateObjectsWithTileIdentifier:usingBlock:", v6, v17);

    v9 = v22[5];
    if (!v9)
      goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 48), "removeObject:withTileIdentifier:", v9, v6);
  v11 = v22[5];
  if (!v11)
  {
LABEL_6:
    v12 = *(void **)(a1 + 40);
    objc_msgSend(v6, "indexPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tileKind");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_createTileControllerWithIndexPath:kind:dataSource:tileSource:", v13, v14, *(_QWORD *)(a1 + 56), v8);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v22[5];
    v22[5] = (id)v15;

    v11 = v22[5];
  }
  objc_msgSend(*(id *)(a1 + 64), "addObject:withTileIdentifier:", v11, v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

  _Block_object_dispose(&v21, 8);
}

uint64_t __136__PUTilingView__updateTileControllersWithLayout_reactivatability_appearanceHandler_updateHandler_disappearanceHandler_heartBeatHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __136__PUTilingView__updateTileControllersWithLayout_reactivatability_appearanceHandler_updateHandler_disappearanceHandler_heartBeatHandler___block_invoke_4(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *a3 = 1;
  }

}

uint64_t __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "isDetached"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("PUTilingView.m"), 1100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[tileController isDetached] == NO"));

  }
  objc_msgSend(v6, "center");
  if ((PXPointIsValid() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("PUTilingView.m"), 1101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXPointIsValid(layoutInfo.center)"));

  }
  v7 = (void *)a1[5];
  if (v7)
  {
    objc_msgSend(v7, "initialLayoutInfoForAppearingTileController:toLayoutInfo:", v5, v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;
  objc_msgSend(v5, "layoutInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isGeometryEqualToLayoutInfo:", v9);

  return v11;
}

void __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "isDetached"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PUTilingView.m"), 1107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[appearingTileController isDetached] == NO"));

  }
  if (objc_msgSend(v5, "isReusable"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PUTilingView.m"), 1108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[appearingTileController isReusable] == NO"));

  }
  if (objc_msgSend(v5, "isActive"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PUTilingView.m"), 1109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[appearingTileController isActive] == NO"));

  }
  objc_msgSend(v6, "center");
  if ((PXPointIsValid() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PUTilingView.m"), 1110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXPointIsValid(layoutInfo.center)"));

  }
  objc_msgSend(v5, "setActive:", 1);
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    objc_msgSend(v7, "initialLayoutInfoForAppearingTileController:toLayoutInfo:", v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqual:", v6) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PUTilingView.m"), 1115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[initialLayoutInfo isEqual:layoutInfo]"));

    }
    objc_msgSend(*(id *)(a1 + 40), "optionsForAnimatingTileController:toLayoutInfo:withAnimationType:", v5, v6, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isAnimating") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "prepareTileControllerForAnimation:withInitialLayoutInfo:", v5, v8);
      objc_msgSend(v5, "setLayoutInfo:", v8);
    }
    v10 = objc_msgSend(v5, "willBeginAnimation");
    v11 = *(void **)(a1 + 48);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_3;
    v17[3] = &unk_1E58AACF0;
    v18 = v5;
    v19 = v10;
    objc_msgSend(v11, "animateTileController:toLayoutInfo:withOptions:completionHandler:", v18, v6, v9, v17);

  }
  else if (objc_msgSend(v5, "isAnimating"))
  {
    objc_msgSend(*(id *)(a1 + 48), "updateAnimationForTileController:withRepositionedTargetLayoutInfo:", v5, v6);
  }
  else
  {
    objc_msgSend(v5, "applyLayoutInfo:", v6);
  }
  objc_msgSend(v5, "setLayoutInfo:", v6);

}

uint64_t __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "isDetached"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PUTilingView.m"), 1137, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[updatedTileController isDetached] == NO"));

  }
  if (objc_msgSend(v5, "isReusable"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PUTilingView.m"), 1138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[updatedTileController isReusable] == NO"));

  }
  if ((objc_msgSend(v5, "isActive") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PUTilingView.m"), 1139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[updatedTileController isActive] == YES"));

  }
  v7 = objc_msgSend(*(id *)(a1 + 40), "useDoubleSidedTransitionForUpdatedTileController:toLayoutInfo:", v5, v6);
  if ((v7 & 1) == 0)
  {
    objc_msgSend(v6, "coordinateSystem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "coordinateSystem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqual:", v10) & 1) != 0)
    {
      objc_msgSend(v5, "layoutInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isGeometryEqualToLayoutInfo:", v6);

      if ((v12 & 1) != 0)
        goto LABEL_22;
    }
    else
    {

    }
    v13 = *(_QWORD *)(a1 + 40);
    v14 = objc_msgSend(v5, "isAnimating");
    if (v13)
    {
      if ((v14 & 1) == 0)
      {
        objc_msgSend(v5, "layoutInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PUTilingView.m"), 1150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initialLayoutInfo != nil"));

        }
        objc_msgSend(*(id *)(a1 + 48), "prepareTileControllerForAnimation:withInitialLayoutInfo:", v5, v15);

      }
      objc_msgSend(*(id *)(a1 + 40), "optionsForAnimatingTileController:toLayoutInfo:withAnimationType:", v5, v6, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v5, "willBeginAnimation");
      v18 = *(void **)(a1 + 48);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_5;
      v24[3] = &unk_1E58AACF0;
      v25 = v5;
      v26 = v17;
      objc_msgSend(v18, "animateTileController:toLayoutInfo:withOptions:completionHandler:", v25, v6, v16, v24);

    }
    else if (v14)
    {
      objc_msgSend(*(id *)(a1 + 48), "updateAnimationForTileController:withRepositionedTargetLayoutInfo:", v5, v6);
    }
    else
    {
      objc_msgSend(v5, "applyLayoutInfo:", v6);
    }
    objc_msgSend(v5, "setLayoutInfo:", v6);
  }
LABEL_22:

  return v7 ^ 1u;
}

void __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;

  v3 = a2;
  if (objc_msgSend(v3, "disappearanceAssertionsEnabled"))
  {
    if (objc_msgSend(v3, "isDetached"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PUTilingView.m"), 1171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[disappearingTileController isDetached] == NO"));

    }
    if (objc_msgSend(v3, "isReusable"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PUTilingView.m"), 1172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[disappearingTileController isReusable] == NO"));

    }
    if ((objc_msgSend(v3, "isActive") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PUTilingView.m"), 1173, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[disappearingTileController isActive] == YES"));

    }
  }
  objc_msgSend(v3, "setActive:", 0);
  objc_msgSend(v3, "layoutInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "finalLayoutInfoForDisappearingTileController:fromLayoutInfo:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "isEqual:", v4) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PUTilingView.m"), 1180, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[finalLayoutInfo isEqual:layoutInfo]"));

    }
    if ((objc_msgSend(v3, "isAnimating") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 48), "prepareTileControllerForAnimation:withInitialLayoutInfo:", v3, v4);
    objc_msgSend(*(id *)(a1 + 40), "optionsForAnimatingTileController:toLayoutInfo:withAnimationType:", v3, v6, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "willBeginAnimation");
    v9 = *(void **)(a1 + 48);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_7;
    v15[3] = &unk_1E58AACF0;
    v10 = v3;
    v16 = v10;
    v17 = v8;
    objc_msgSend(v9, "animateTileController:toLayoutInfo:withOptions:completionHandler:", v10, v6, v7, v15);
    objc_msgSend(v10, "setLayoutInfo:", v6);

  }
  else
  {
    objc_msgSend(v3, "reuseIfApplicable");
  }

}

void __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "disappearanceAssertionsEnabled"))
  {
    if (objc_msgSend(v7, "isDetached"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("PUTilingView.m"), 1197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[inactiveTileController isDetached] == NO"));

    }
    if (objc_msgSend(v7, "isReusable"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("PUTilingView.m"), 1198, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[inactiveTileController isReusable] == NO"));

    }
    if (objc_msgSend(v7, "isActive"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("PUTilingView.m"), 1199, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[inactiveTileController isActive] == NO"));

    }
  }
  objc_msgSend(v7, "layoutInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isAnimating"))
    objc_msgSend(*(id *)(a1 + 40), "updateAnimationForTileController:withRepositionedTargetLayoutInfo:", v7, v3);
  else
    objc_msgSend(v7, "applyLayoutInfo:", v3);

}

uint64_t __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didEndAnimation:", *(_QWORD *)(a1 + 40));
}

uint64_t __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didEndAnimation:", *(_QWORD *)(a1 + 40));
}

uint64_t __75__PUTilingView__updateTileControllersWithLayout_tileTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didEndAnimation:", *(_QWORD *)(a1 + 40));
}

uint64_t __46__PUTilingView__updateTileControllersIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTileControllersWithLayout:tileTransitionCoordinator:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __57__PUTilingView__updateTileControllersVisibleRectIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "wantsVisibleRectChanges"))
    objc_msgSend(v2, "didChangeVisibleRect");

}

void __53__PUTilingView__updateLayoutCoordinateSystemIfNeeded__block_invoke(id *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "layoutInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coordinateSystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "coordinateSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    objc_msgSend(a1[5], "fixedCoordinateSystem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layoutInfoWithCoordinateSystem:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setLayoutInfo:", v8);
    objc_msgSend(a1[6], "addObject:", v9);
    v3 = (void *)v8;
  }

}

uint64_t __44__PUTilingView_isAnyTileControllerAnimating__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isAnimating");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __58__PUTilingView__enumerateActiveTileControllersUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;
  return result;
}

void __55__PUTilingView__enumerateAllTileControllersUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__PUTilingView__enumerateAllTileControllersUsingBlock___block_invoke_2;
    v6[3] = &unk_1E58A95B0;
    v4 = *(id *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = v4;
    v8 = v5;
    objc_msgSend(a2, "enumerateObjectsUsingBlock:", v6);

  }
}

uint64_t __55__PUTilingView__enumerateAllTileControllersUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;
  return result;
}

uint64_t __54__PUTilingView_enumerateAllTileControllersUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__PUTilingView_tileControllerWithIndexPath_kind_dataSourceIdentifier___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a2;
  if ((objc_msgSend(v6, "isAnimating") & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __67__PUTilingView_enumeratePresentedTileControllersInRect_usingBlock___block_invoke(uint64_t a1, void *a2)
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
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  CGFloat v25;
  id v26;
  CGRect v27;

  v26 = a2;
  objc_msgSend(v26, "layoutInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v26, "presentationLayoutInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v4, "hitTestOutset");
    PXEdgeInsetsInvert();
    v14 = v6 + v13;
    v16 = v8 + v15;
    v18 = v10 - (v13 + v17);
    v20 = v12 - (v15 + v19);
    objc_msgSend(v4, "coordinateSystem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "contentCoordinateSystem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v21, v22, v14, v16);
    v25 = v24;

    v27.origin.x = v23;
    v27.origin.y = v25;
    v27.size.width = v18;
    v27.size.height = v20;
    if (CGRectIntersectsRect(*(CGRect *)(a1 + 48), v27) && objc_msgSend(v26, "isPresentationActive"))
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v26, v4);

  }
}

uint64_t __67__PUTilingView_enumeratePresentedTileControllersInRect_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a2;
  objc_msgSend(a3, "zPosition");
  objc_msgSend(v4, "zPosition");

  return PXFloatCompare();
}

void __36__PUTilingView__applyPendingUpdates__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v3, "removeAllObjects");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__PUTilingView__applyPendingUpdates__block_invoke_2;
  v8[3] = &unk_1E58A94A8;
  v5 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v4;
  v11 = v3;
  v6 = v3;
  v7 = v4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

void __36__PUTilingView__applyPendingUpdates__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PUTileIdentifier *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  PUTileIdentifier *v27;
  void *v28;
  void *v29;
  PUTileIdentifier *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v6, "dataSourceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_dataSourceWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = *(id *)(a1 + 40);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v33;
LABEL_3:
    v15 = 0;
    v16 = v7;
    while (1)
    {
      if (*(_QWORD *)v33 != v14)
        objc_enumerationMutation(v11);
      objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v15), "transformedIndexPath:withDataSource:", v16, v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v7, "pu_isValid"))
        break;
      ++v15;
      v16 = v7;
      if (v13 == v15)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v13)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_msgSend(v6, "indexPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v7, "isEqual:", v17);

  if ((v18 & 1) == 0)
  {
    objc_msgSend(v5, "layoutInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "tileKind");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dataSourceIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 48), "useUniqueLeafs") && (objc_msgSend(v7, "pu_isValid") & 1) == 0)
    {
      v31 = v5;
      while (1)
      {
        v22 = *(void **)(a1 + 56);
        v23 = -[PUTileIdentifier initWithIndexPath:tileKind:dataSourceIdentifier:]([PUTileIdentifier alloc], "initWithIndexPath:tileKind:dataSourceIdentifier:", v7, v20, v21);
        objc_msgSend(v22, "objectWithTileIdentifier:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
          break;
        objc_msgSend(v7, "indexPathByAddingIndex:", 0x7FFFFFFFFFFFFFFFLL);
        v25 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v25;
      }
      v5 = v31;
    }
    objc_msgSend(v19, "layoutInfoWithIndexPath:tileKind:dataSourceIdentifier:", v7, v20, v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setLayoutInfo:", v26);
  }
  v27 = [PUTileIdentifier alloc];
  objc_msgSend(v6, "tileKind");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSourceIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[PUTileIdentifier initWithIndexPath:tileKind:dataSourceIdentifier:](v27, "initWithIndexPath:tileKind:dataSourceIdentifier:", v7, v28, v29);

  objc_msgSend(*(id *)(a1 + 56), "addObject:withTileIdentifier:", v5, v30);
}

void __49__PUTilingView_reloadItemAtIndexPath_dataSource___block_invoke(uint64_t a1)
{
  void *v2;
  PUTilingViewUpdateItem *v3;

  v3 = -[PUTilingViewUpdateItem initWithAction:indexPathBeforeUpdate:indexPathAfterUpdate:dataSource:]([PUTilingViewUpdateItem alloc], "initWithAction:indexPathBeforeUpdate:indexPathAfterUpdate:dataSource:", 4, *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "_pendingUpdateItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __61__PUTilingView_moveItemFromIndexPath_toIndexPath_dataSource___block_invoke(uint64_t a1)
{
  void *v2;
  PUTilingViewUpdateItem *v3;

  v3 = -[PUTilingViewUpdateItem initWithAction:indexPathBeforeUpdate:indexPathAfterUpdate:dataSource:]([PUTilingViewUpdateItem alloc], "initWithAction:indexPathBeforeUpdate:indexPathAfterUpdate:dataSource:", 3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "_pendingUpdateItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __49__PUTilingView_deleteItemAtIndexPath_dataSource___block_invoke(uint64_t a1)
{
  void *v2;
  PUTilingViewUpdateItem *v3;

  v3 = -[PUTilingViewUpdateItem initWithAction:indexPathBeforeUpdate:indexPathAfterUpdate:dataSource:]([PUTilingViewUpdateItem alloc], "initWithAction:indexPathBeforeUpdate:indexPathAfterUpdate:dataSource:", 2, *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "_pendingUpdateItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __49__PUTilingView_insertItemAtIndexPath_dataSource___block_invoke(uint64_t a1)
{
  void *v2;
  PUTilingViewUpdateItem *v3;

  v3 = -[PUTilingViewUpdateItem initWithAction:indexPathBeforeUpdate:indexPathAfterUpdate:dataSource:]([PUTilingViewUpdateItem alloc], "initWithAction:indexPathBeforeUpdate:indexPathAfterUpdate:dataSource:", 1, 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "_pendingUpdateItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __79__PUTilingView_transitionToLayout_withContext_animationSetupCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = v3;
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id __63__PUTilingView_registerTileControllerClass_forReuseIdentifier___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithReuseIdentifier:", *(_QWORD *)(a1 + 32));
}

id __50__PUTilingView__startHeadroomMonitoringIfPossible__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  uint8_t v6[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    PLOneUpGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEBUG, "Window not found, monitoring will not return accurate results", v6, 2u);
    }

  }
  objc_msgSend(v2, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __34__PUTilingView_hitTest_withEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char isKindOfClass;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v14;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v14, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "convertPoint:fromView:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64));
    v10 = v9;
    v12 = v11;
    if (objc_msgSend(v8, "isUserInteractionEnabled"))
    {
      objc_msgSend(v8, "hitTest:withEvent:", *(_QWORD *)(a1 + 40), v10, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v13);
        *a4 = 1;
      }

    }
    v7 = v14;
  }

}

+ (unint64_t)_defaultEdgesScrollingContentIntoSafeArea
{
  return 0;
}

@end
