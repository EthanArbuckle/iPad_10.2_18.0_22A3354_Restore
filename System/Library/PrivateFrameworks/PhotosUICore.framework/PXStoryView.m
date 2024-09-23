@implementation PXStoryView

- (PXStoryView)initWithFrame:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryView.m"), 107, CFSTR("%s is not available as initializer"), "-[PXStoryView initWithFrame:]");

  abort();
}

- (PXStoryView)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryView.m"), 111, CFSTR("%s is not available as initializer"), "-[PXStoryView initWithCoder:]");

  abort();
}

- (PXStoryView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  PXStoryView *v11;
  PXStoryView *v12;
  void *v13;
  uint64_t v14;
  OS_dispatch_queue *storyQueue;
  PXStoryPacingAutoIncrementingTimeSource *v16;
  PXStoryPacingTimeSource *timeSource;
  void *v18;
  PXStoryViewModel *v19;
  void *v20;
  uint64_t v21;
  PXStoryViewModel *viewModel;
  PXStoryViewLayout *v23;
  PXStoryViewLayout *viewLayout;
  PXGViewCoordinator *v25;
  PXStoryViewLayout *v26;
  void *v27;
  id v28;
  uint64_t v29;
  PXGViewCoordinator *tungstenViewCoordinator;
  void *v31;
  char v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  PXUpdater *updater;
  _QWORD v38[4];
  id v39;
  objc_super v40;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v40.receiver = self;
  v40.super_class = (Class)PXStoryView;
  v11 = -[PXStoryView initWithFrame:](&v40, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_viewConfiguration, a4);
    objc_msgSend(v10, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "storyQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    storyQueue = v12->_storyQueue;
    v12->_storyQueue = (OS_dispatch_queue *)v14;

    v16 = objc_alloc_init(PXStoryPacingAutoIncrementingTimeSource);
    timeSource = v12->_timeSource;
    v12->_timeSource = (PXStoryPacingTimeSource *)v16;

    objc_msgSend(v13, "mediaProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = [PXStoryViewModel alloc];
    objc_msgSend(v10, "extendedTraitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[PXStoryViewModel initWithConfiguration:extendedTraitCollection:timeSource:mediaProvider:](v19, "initWithConfiguration:extendedTraitCollection:timeSource:mediaProvider:", v13, v20, v12->_timeSource, v18);
    viewModel = v12->_viewModel;
    v12->_viewModel = (PXStoryViewModel *)v21;

    -[PXStoryViewModel registerChangeObserver:context:](v12->_viewModel, "registerChangeObserver:context:", v12, ViewModelObservationContext_129948);
    v23 = -[PXStoryViewLayout initWithViewModel:]([PXStoryViewLayout alloc], "initWithViewModel:", v12->_viewModel);
    viewLayout = v12->_viewLayout;
    v12->_viewLayout = v23;

    v25 = [PXGViewCoordinator alloc];
    v26 = v12->_viewLayout;
    objc_msgSend(v10, "containerViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __43__PXStoryView_initWithFrame_configuration___block_invoke;
    v38[3] = &unk_1E512AC80;
    v28 = v18;
    v39 = v28;
    v29 = -[PXGViewCoordinator initWithContentLayout:containerView:belowSubview:containerViewController:configuration:](v25, "initWithContentLayout:containerView:belowSubview:containerViewController:configuration:", v26, v12, 0, v27, v38);
    tungstenViewCoordinator = v12->_tungstenViewCoordinator;
    v12->_tungstenViewCoordinator = (PXGViewCoordinator *)v29;

    -[PXStoryView _updateBackgroundColor](v12, "_updateBackgroundColor");
    objc_msgSend(v10, "configuration");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "options");

    if ((v32 & 0x20) != 0)
    {
      v33 = 2;
    }
    else
    {
      +[PXStoryTransitionsSettings sharedInstance](PXStoryTransitionsSettings, "sharedInstance");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v31, "transitionQuality");
    }
    -[PXGViewCoordinator tungstenView](v12->_tungstenViewCoordinator, "tungstenView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setOffscreenEffectQuality:", v33);

    if ((v32 & 0x20) == 0)
    if ((objc_msgSend(v13, "options") & 0x400) == 0)
      -[PXStoryView _initializeGestureRecognizers](v12, "_initializeGestureRecognizers");
    v35 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v12, sel__setNeedsUpdate);
    updater = v12->_updater;
    v12->_updater = (PXUpdater *)v35;

    -[PXUpdater addUpdateSelector:needsUpdate:](v12->_updater, "addUpdateSelector:needsUpdate:", sel__updateGestureRecognizers, 1);
    -[PXUpdater addUpdateSelector:](v12->_updater, "addUpdateSelector:", sel__updateBackgroundColor);
    -[PXUpdater addUpdateSelector:needsUpdate:](v12->_updater, "addUpdateSelector:needsUpdate:", sel__updateMainModel, 1);

  }
  return v12;
}

- (void)setIsActive:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  BOOL v6;

  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    -[PXStoryView viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __27__PXStoryView_setIsActive___block_invoke;
    v5[3] = &__block_descriptor_33_e35_v16__0___PXStoryMutableViewModel__8l;
    v6 = a3;
    objc_msgSend(v4, "performChanges:", v5);

  }
}

- (PXGView)tungstenView
{
  void *v2;
  void *v3;

  -[PXStoryView tungstenViewCoordinator](self, "tungstenViewCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tungstenView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXGView *)v3;
}

- (void)setIsTouching:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[4];
  BOOL v7;

  if (self->_isTouching != a3)
  {
    self->_isTouching = a3;
    -[PXStoryView viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mainModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __29__PXStoryView_setIsTouching___block_invoke;
    v6[3] = &__block_descriptor_33_e31_v16__0___PXStoryMutableModel__8l;
    v7 = a3;
    objc_msgSend(v5, "performChanges:", v6);

  }
}

- (id)mainItemReference
{
  void *v2;
  void *v3;

  -[PXStoryView viewLayout](self, "viewLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainItemReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)itemPlacementControllerForItemReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXStoryView viewLayout](self, "viewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemPlacementControllerForItemReference:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_initializeGestureRecognizers
{
  void *v3;
  PXVerticalSwipeGestureRecognizerHelper *v4;
  PXVerticalSwipeGestureRecognizerHelper *swipeDownGestureHelper;
  PXTouchingUIGestureRecognizer *v6;
  PXTouchingUIGestureRecognizer *touchingGestureRecognizer;
  UITapGestureRecognizer *v8;
  UITapGestureRecognizer *tapGestureRecognizer;
  UILongPressGestureRecognizer *v10;
  UILongPressGestureRecognizer *longPressGestureRecognizer;
  void *v12;
  id v13;
  void (**v14)(void *, uint64_t);
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  NSArray *v20;
  NSArray *swipeGestureRecognizers;
  UIPanGestureRecognizer *v22;
  UIPanGestureRecognizer *panDownGestureRecognizer;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD aBlock[5];
  id v34;
  _BYTE v35[128];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(PXVerticalSwipeGestureRecognizerHelper);
  swipeDownGestureHelper = self->_swipeDownGestureHelper;
  self->_swipeDownGestureHelper = v4;

  -[PXVerticalSwipeGestureRecognizerHelper setAllowSwipeUp:](self->_swipeDownGestureHelper, "setAllowSwipeUp:", 0);
  -[PXVerticalSwipeGestureRecognizerHelper setDelegate:](self->_swipeDownGestureHelper, "setDelegate:", self);
  v6 = -[PXTouchingUIGestureRecognizer initWithTarget:action:]([PXTouchingUIGestureRecognizer alloc], "initWithTarget:action:", 0, 0);
  touchingGestureRecognizer = self->_touchingGestureRecognizer;
  self->_touchingGestureRecognizer = v6;

  -[PXTouchingUIGestureRecognizer setDelegate:](self->_touchingGestureRecognizer, "setDelegate:", self);
  -[PXTouchingUIGestureRecognizer setTouchDelegate:](self->_touchingGestureRecognizer, "setTouchDelegate:", self);
  objc_msgSend(v3, "addObject:", self->_touchingGestureRecognizer);
  v8 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTap_);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v8;

  -[UITapGestureRecognizer setDelegate:](self->_tapGestureRecognizer, "setDelegate:", self);
  objc_msgSend(v3, "addObject:", self->_tapGestureRecognizer);
  v10 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__handleLongPress_);
  longPressGestureRecognizer = self->_longPressGestureRecognizer;
  self->_longPressGestureRecognizer = v10;

  -[UILongPressGestureRecognizer setDelegate:](self->_longPressGestureRecognizer, "setDelegate:", self);
  objc_msgSend(v3, "addObject:", self->_longPressGestureRecognizer);
  if (PFOSVariantHasInternalUI())
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTwoFingerTap_);
    objc_msgSend(v12, "setNumberOfTouchesRequired:", 2);
    objc_msgSend(v3, "addObject:", v12);

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__PXStoryView__initializeGestureRecognizers__block_invoke;
  aBlock[3] = &unk_1E512ACA8;
  aBlock[4] = self;
  v13 = v3;
  v34 = v13;
  v14 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  -[PXStoryView viewConfiguration](self, "viewConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "allowsVerticalGestures");

  if (v17)
  {
    v14[2](v14, 8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v18;
    v14[2](v14, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
    swipeGestureRecognizers = self->_swipeGestureRecognizers;
    self->_swipeGestureRecognizers = v20;

    v22 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel__handlePanDown_);
    panDownGestureRecognizer = self->_panDownGestureRecognizer;
    self->_panDownGestureRecognizer = v22;

    -[UIPanGestureRecognizer setDelegate:](self->_panDownGestureRecognizer, "setDelegate:", self);
    objc_msgSend(v13, "addObject:", self->_panDownGestureRecognizer);
  }

  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v24 = v13;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v30;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v30 != v27)
          objc_enumerationMutation(v24);
        -[PXStoryView addGestureRecognizer:](self, "addGestureRecognizer:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v28++), (_QWORD)v29);
      }
      while (v26 != v28);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v26);
  }

}

- (BOOL)acceptsFirstResponder
{
  return 1;
}

- (void)insertText:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  PXStoryView *v14;

  v4 = a3;
  -[PXStoryView viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "viewMode");
  if (objc_msgSend(v4, "isEqualToString:", CFSTR(" "))
    && (objc_msgSend(v5, "wantsRelatedOverlayVisible") & 1) == 0
    && v6 == 1)
  {
    -[PXStoryView _togglePlayback](self, "_togglePlayback");
  }
  if (PFOSVariantHasInternalUI())
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __26__PXStoryView_insertText___block_invoke;
    v12 = &unk_1E5132A08;
    v7 = v4;
    v13 = v7;
    v14 = self;
    objc_msgSend(v5, "performChanges:", &v9);
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("v"), v9, v10, v11, v12))
    {
      objc_msgSend(v5, "actionPerformer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "showVisualDiagnostics");

    }
  }

}

- (void)_moveLeftAfterEdgeTap:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;

  v3 = a3;
  if (-[PXStoryView _isRTL](self, "_isRTL"))
    v5 = 1;
  else
    v5 = -1;
  -[PXStoryView _skipToSegmentWithOffset:afterEdgeTap:](self, "_skipToSegmentWithOffset:afterEdgeTap:", v5, v3);
}

- (void)_moveRightAfterEdgeTap:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;

  v3 = a3;
  if (-[PXStoryView _isRTL](self, "_isRTL"))
    v5 = -1;
  else
    v5 = 1;
  -[PXStoryView _skipToSegmentWithOffset:afterEdgeTap:](self, "_skipToSegmentWithOffset:afterEdgeTap:", v5, v3);
}

- (BOOL)_isRTL
{
  return -[PXStoryView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1;
}

- (void)_skipToSegmentWithOffset:(int64_t)a3 afterEdgeTap:(BOOL)a4
{
  void *v6;
  _QWORD v7[5];
  BOOL v8;

  -[PXStoryView viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__PXStoryView__skipToSegmentWithOffset_afterEdgeTap___block_invoke;
  v7[3] = &__block_descriptor_41_e35_v16__0___PXStoryMutableViewModel__8l;
  v7[4] = a3;
  v8 = a4;
  objc_msgSend(v6, "performChanges:", v7);

}

- (BOOL)_handlePrimaryInteractionAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  BOOL v19;
  int v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat width;
  CGFloat height;
  double v26;
  double v27;
  PXStoryView *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *);
  void *v33;
  id v34;
  id v35;
  CGPoint v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  y = a3.y;
  x = a3.x;
  -[PXStoryView viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "viewMode");
  if (v7 == 4)
  {
    objc_msgSend(v6, "mainConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isAppleMusicPreview");

    if ((v9 & 1) == 0)
    {
      objc_msgSend(v6, "mainModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mainModel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "styleManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = MEMORY[0x1E0C809B0];
      v31 = 3221225472;
      v32 = __48__PXStoryView__handlePrimaryInteractionAtPoint___block_invoke;
      v33 = &unk_1E5132A08;
      v34 = v12;
      v35 = v10;
      v13 = v10;
      v14 = v12;
      objc_msgSend(v6, "performChanges:", &v30);

    }
    goto LABEL_7;
  }
  v15 = v7;
  -[PXStoryView tungstenView](self, "tungstenView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "convertPoint:fromView:", self, x, y);
  v17 = objc_msgSend(v16, "handlePrimaryInteractionAtPoint:");

  if ((v17 & 1) == 0)
  {
    if (objc_msgSend(v6, "wantsRelatedOverlayVisible"))
    {
      objc_msgSend(v6, "performChanges:", &__block_literal_global_70);
      goto LABEL_7;
    }
    objc_msgSend(v6, "viewLayoutSpec");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v18, "wantsEdgeTapToChangeCurrentSegment");
    if (v15 == 1 && v21)
    {
      -[PXStoryView bounds](self, "bounds");
      objc_msgSend(v18, "tapNavigationAreaInsets");
      PXEdgeInsetsInsetRect();
      v22 = v37.origin.x;
      v23 = v37.origin.y;
      width = v37.size.width;
      height = v37.size.height;
      v36.x = x;
      v36.y = y;
      if (CGRectContainsPoint(v37, v36))
      {
        objc_msgSend(v18, "tapNavigationAreaWidth");
        v27 = v26;
        v38.origin.x = v22;
        v38.origin.y = v23;
        v38.size.width = width;
        v38.size.height = height;
        if (x <= v27 + CGRectGetMinX(v38))
        {
          v28 = self;
          v29 = 2;
          goto LABEL_20;
        }
        v39.origin.x = v22;
        v39.origin.y = v23;
        v39.size.width = width;
        v39.size.height = height;
        if (x >= CGRectGetMaxX(v39) - v27)
        {
          v28 = self;
          v29 = 8;
LABEL_20:
          -[PXStoryView _handleEdgeTap:](v28, "_handleEdgeTap:", v29);
          goto LABEL_8;
        }
      }
    }
    else if (v15 == 2)
    {
      v19 = 0;
      goto LABEL_9;
    }
    -[PXStoryView _toggleChrome](self, "_toggleChrome");
    goto LABEL_8;
  }
LABEL_7:
  objc_msgSend(v6, "viewLayoutSpec", v30, v31, v32, v33);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v19 = 1;
LABEL_9:

  return v19;
}

- (void)_handleRelatedKeyboardNavigation:(unint64_t)a3
{
  void *v6;
  _QWORD v7[7];

  -[PXStoryView viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__PXStoryView__handleRelatedKeyboardNavigation___block_invoke;
  v7[3] = &unk_1E512AD50;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = a2;
  objc_msgSend(v6, "performChanges:", v7);

}

- (void)_handleEdgeTap:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  char v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  BOOL v20;
  _QWORD v21[4];
  BOOL v22;
  char v23;
  uint8_t buf[4];
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[PXStoryView viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "currentSegmentIdentifier");
  objc_msgSend(v6, "timeline");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "lastSegmentIdentifier");

  v10 = -[PXStoryView _isRTL](self, "_isRTL");
  if (v7 == v9 && (a3 != 8 ? (v11 = 1) : (v11 = v10), a3 == 2 ? (v12 = v10) : (v12 = 0), v12 || (v11 & 1) == 0))
  {
    -[PXStoryView viewModel](self, "viewModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "shouldAutoReplayPreference");

    -[PXStoryView viewModel](self, "viewModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "mainConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "shouldReplayAtEnd");

    if ((v18 & 1) != 0 || v15)
    {
      -[PXStoryView viewModel](self, "viewModel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "desiredPlayState") == 1;

      -[PXStoryView viewModel](self, "viewModel");
      v13 = objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __30__PXStoryView__handleEdgeTap___block_invoke;
      v21[3] = &__block_descriptor_34_e35_v16__0___PXStoryMutableViewModel__8l;
      v22 = v20;
      v23 = v15;
      -[NSObject performChanges:](v13, "performChanges:", v21);
LABEL_20:

      goto LABEL_21;
    }
    objc_msgSend(v6, "performChanges:", &__block_literal_global_74_129984);
  }
  else if (a3 == 2)
  {
    -[PXStoryView _moveLeftAfterEdgeTap:](self, "_moveLeftAfterEdgeTap:", 1);
  }
  else
  {
    if (a3 != 8)
    {
      PXAssertGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        v25 = a3;
        _os_log_fault_impl(&dword_1A6789000, v13, OS_LOG_TYPE_FAULT, "Unexpected tappedEdge argument: %lu", buf, 0xCu);
      }
      goto LABEL_20;
    }
    -[PXStoryView _moveRightAfterEdgeTap:](self, "_moveRightAfterEdgeTap:", 1);
  }
LABEL_21:

}

- (id)_storyHitTestResultAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  id v8;

  y = a3.y;
  x = a3.x;
  -[PXStoryView tungstenView](self, "tungstenView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:fromView:", self, x, y);
  objc_msgSend(v6, "hitTestResultAtPoint:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)_togglePlayback
{
  id v2;

  -[PXStoryView viewModel](self, "viewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performChanges:", &__block_literal_global_76_129983);

}

- (void)_toggleChrome
{
  id v2;

  -[PXStoryView viewModel](self, "viewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performChanges:", &__block_literal_global_77);

}

- (void)_hideRelatedOverlay
{
  id v2;

  -[PXStoryView viewModel](self, "viewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performChanges:", &__block_literal_global_78);

}

- (void)_changeStyle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  -[PXStoryView viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "styleManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfStyles");
  if (v6 >= 1)
  {
    v7 = v6;
    v8 = objc_msgSend(v5, "indexOfCurrentStyle");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __27__PXStoryView__changeStyle__block_invoke;
    v9[3] = &unk_1E512ADF8;
    v11 = (v8 + 1) % v7;
    v10 = v5;
    objc_msgSend(v4, "performChanges:origin:", v9, 2);

  }
}

- (void)_changeColorGrade
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  -[PXStoryView viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "styleManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__PXStoryView__changeColorGrade__block_invoke;
  v6[3] = &unk_1E5133780;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "performChanges:origin:", v6, 2);

}

- (void)_changeOverallDuration:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[PXStoryView viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recipeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__PXStoryView__changeOverallDuration___block_invoke;
  v7[3] = &__block_descriptor_40_e39_v16__0___PXStoryMutableRecipeManager__8l;
  v7[4] = a3;
  objc_msgSend(v6, "performChanges:", v7);

}

- (void)_editCurrentChapter
{
  void *v2;
  id v3;

  -[PXStoryView viewModel](self, "viewModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionPerformer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentChapterEditor");

}

- (NSMutableArray)lastDemotedDisplayAssets
{
  NSMutableArray *lastDemotedDisplayAssets;
  NSMutableArray *v5;
  NSMutableArray *v6;
  void *v8;

  if ((PFOSVariantHasInternalUI() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryView.m"), 543, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PLHasInternalUI()"));

  }
  lastDemotedDisplayAssets = self->_lastDemotedDisplayAssets;
  if (!lastDemotedDisplayAssets)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = self->_lastDemotedDisplayAssets;
    self->_lastDemotedDisplayAssets = v5;

    lastDemotedDisplayAssets = self->_lastDemotedDisplayAssets;
  }
  return lastDemotedDisplayAssets;
}

- (void)moveLeft:(id)a3
{
  void *v4;
  char v5;

  -[PXStoryView viewModel](self, "viewModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "wantsRelatedOverlayVisible");

  if ((v5 & 1) != 0)
    -[PXStoryView _handleRelatedKeyboardNavigation:](self, "_handleRelatedKeyboardNavigation:", 2);
  else
    -[PXStoryView _handleEdgeTap:](self, "_handleEdgeTap:", 2);
}

- (void)moveRight:(id)a3
{
  void *v4;
  char v5;

  -[PXStoryView viewModel](self, "viewModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "wantsRelatedOverlayVisible");

  if ((v5 & 1) != 0)
    -[PXStoryView _handleRelatedKeyboardNavigation:](self, "_handleRelatedKeyboardNavigation:", 8);
  else
    -[PXStoryView _handleEdgeTap:](self, "_handleEdgeTap:", 8);
}

- (void)insertNewline:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;

  -[PXStoryView viewModel](self, "viewModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "highlightedRelatedIndex");

  -[PXStoryView viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "wantsRelatedOverlayVisible");

  if (v7)
  {
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[PXStoryView viewModel](self, "viewModel");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "performChanges:", &__block_literal_global_85);

    }
  }
}

- (void)cancelOperation:(id)a3
{
  void *v3;
  id v4;

  -[PXStoryView viewModel](self, "viewModel", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionPerformer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissStoryViewController");

}

- (void)_handlePlayPauseGesture:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[PXStoryView _togglePlayback](self, "_togglePlayback");
}

- (void)_handleMenuGestureRecognizer:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  if (objc_msgSend(a3, "state") == 3)
  {
    -[PXStoryView viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "viewMode");

    if (v5 == 1)
    {
      -[PXStoryView viewModel](self, "viewModel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "wantsRelatedOverlayVisible");

      if (v8)
        -[PXStoryView _hideRelatedOverlay](self, "_hideRelatedOverlay");
      else
        -[PXStoryView _toggleChrome](self, "_toggleChrome");
    }
    else if (v5 == 4 || v5 == 2)
    {
      -[PXStoryView viewModel](self, "viewModel");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mainModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "performChanges:", &__block_literal_global_86);

    }
  }
}

- (void)_handleAnyTouchOrPressGesture:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  if ((unint64_t)(v5 - 3) >= 3)
  {
    if ((unint64_t)(v5 - 1) <= 1)
      -[NSMutableSet addObject:](self->_activeRemoteGestureRecognizers, "addObject:", v4);
  }
  else
  {
    -[NSMutableSet removeObject:](self->_activeRemoteGestureRecognizers, "removeObject:", v4);
  }
  -[PXStoryView viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__PXStoryView__handleAnyTouchOrPressGesture___block_invoke;
  v7[3] = &unk_1E5146E78;
  v7[4] = self;
  objc_msgSend(v6, "performChanges:", v7);

}

- (void)_handleSwipeGesture:(id)a3
{
  BOOL v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(v11, "state") == 3;
  v5 = v11;
  if (v4)
  {
    v6 = objc_msgSend(v11, "direction");
    if (v6 == 8)
    {
      +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "swipeDownAction");

      v5 = v11;
      if (v8 != 2)
        goto LABEL_12;
      -[PXStoryView viewModel](self, "viewModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "actionPerformer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dismissStoryViewController");

    }
    else if (v6 == 2)
    {
      -[PXStoryView _moveRightAfterEdgeTap:](self, "_moveRightAfterEdgeTap:", 0);
    }
    else
    {
      v4 = v6 == 1;
      v5 = v11;
      if (!v4)
        goto LABEL_12;
      -[PXStoryView _moveLeftAfterEdgeTap:](self, "_moveLeftAfterEdgeTap:", 0);
    }
    v5 = v11;
  }
LABEL_12:

}

- (void)_handleTap:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    objc_msgSend(v4, "locationInView:", self);
    -[PXStoryView _handlePrimaryInteractionAtPoint:](self, "_handlePrimaryInteractionAtPoint:");
  }

}

- (void)_handleLongPress:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  PXStoryView *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "state") != 2)
  {
    PLStoryGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 134218240;
      v7 = self;
      v8 = 2048;
      v9 = objc_msgSend(v4, "state");
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_INFO, "%p long press state=%li", (uint8_t *)&v6, 0x16u);
    }

  }
}

- (void)_handleArrowButton:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "state") == 3)
  {
    -[PXStoryView viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "wantsChromeVisible");

    if ((v5 & 1) == 0)
    {
      objc_msgSend(v10, "allowedPressTypes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToArray:", &unk_1E53E99C0);

      if (v7)
      {
        -[PXStoryView _moveLeftAfterEdgeTap:](self, "_moveLeftAfterEdgeTap:", 0);
      }
      else
      {
        objc_msgSend(v10, "allowedPressTypes");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToArray:", &unk_1E53E99D8);

        if (v9)
          -[PXStoryView _moveRightAfterEdgeTap:](self, "_moveRightAfterEdgeTap:", 0);
      }
    }
  }

}

- (PXStoryViewDismissalController)dismissalController
{
  PXStoryViewDismissalController *dismissalController;
  PXStoryViewDismissalController *v4;
  void *v5;
  PXStoryViewDismissalController *v6;
  PXStoryViewDismissalController *v7;

  dismissalController = self->_dismissalController;
  if (!dismissalController)
  {
    v4 = [PXStoryViewDismissalController alloc];
    -[PXStoryView viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PXStoryViewDismissalController initWithViewModel:](v4, "initWithViewModel:", v5);
    v7 = self->_dismissalController;
    self->_dismissalController = v6;

    dismissalController = self->_dismissalController;
  }
  return dismissalController;
}

- (void)_handlePanDown:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  int v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _OWORD v35[4];
  uint64_t v36;
  _QWORD v37[4];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  _QWORD v48[4];
  id v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PXStoryView viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "swipeDownBehavior");

  if ((unint64_t)(v8 - 1) < 2)
  {
    -[PXStoryView tungstenView](self, "tungstenView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastTouchTimestamp");
    v11 = v10;
    switch(objc_msgSend(v5, "state"))
    {
      case 0:
      case 3:
      case 4:
      case 5:
        v47 = 0;
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        if (v6)
          objc_msgSend(v6, "swipeDownInteractionState");
        v35[2] = v45;
        v35[3] = v46;
        v36 = v47;
        v35[0] = v43;
        v35[1] = v44;
        if ((PXStorySwipeDownInteractionStateEqualsState((uint64_t)v35, (uint64_t)&PXStorySwipeDownInteractionStateNull) & 1) == 0)
        {
          v12 = &__block_literal_global_97;
          goto LABEL_25;
        }
        break;
      case 1:
        objc_msgSend(v6, "viewModeTransition");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryView.m"), 773, CFSTR("Shuld not have a viewModeTransition at this point"));

        }
        objc_msgSend(v5, "locationInView:", v9);
        v17 = v16;
        v19 = v18;
        objc_msgSend(v5, "velocityInView:", v9);
        v21 = v20;
        v23 = v22;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        -[PXStoryView tungstenView](self, "tungstenView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "hitTestResultsAtPoint:", v17, v19);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
        if (v26)
        {
          v27 = *(_QWORD *)v61;
          while (2)
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v61 != v27)
                objc_enumerationMutation(v25);
              v29 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v29, "clipIdentifier"))
              {
                v26 = objc_msgSend(v29, "clipIdentifier");
                goto LABEL_27;
              }
            }
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
            if (v26)
              continue;
            break;
          }
        }
LABEL_27:

        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __30__PXStoryView__handlePanDown___block_invoke;
        v48[3] = &unk_1E512AE80;
        v50 = v17;
        v51 = v19;
        v52 = v17;
        v53 = v19;
        v54 = v21;
        v55 = v23;
        v56 = v9;
        v57 = v11;
        v58 = v11;
        v49 = v6;
        v59 = v26;
        objc_msgSend(v49, "performChanges:", v48);

        break;
      case 2:
        v47 = 0;
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        if (v6)
          objc_msgSend(v6, "swipeDownInteractionState");
        objc_msgSend(v5, "locationInView:", v9);
        *(_QWORD *)&v44 = v30;
        *((_QWORD *)&v44 + 1) = v31;
        objc_msgSend(v5, "velocityInView:", v9);
        *(_QWORD *)&v45 = v32;
        *((_QWORD *)&v45 + 1) = v33;
        v47 = v11;
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __30__PXStoryView__handlePanDown___block_invoke_3;
        v37[3] = &__block_descriptor_104_e35_v16__0___PXStoryMutableViewModel__8lu80l8;
        v39 = v44;
        v38 = v43;
        v40 = v45;
        v41 = v46;
        v42 = v11;
        v12 = v37;
LABEL_25:
        objc_msgSend(v6, "performChanges:", v12);
        break;
      default:
        goto LABEL_28;
    }
    goto LABEL_28;
  }
  if (!v8)
  {
    objc_msgSend(v6, "viewLayoutSpec");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "wantsSwipeDownGestureToDismiss");

    if (v14)
    {
      -[PXStoryView dismissalController](self, "dismissalController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handlePanDownGestureRecognizer:", v5);
LABEL_28:

    }
  }

}

- (void)_handleTwoFingerTap:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  if (objc_msgSend(a3, "state") == 3)
  {
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "twoFingerTapAction");

    switch(v5)
    {
      case 1:
        -[PXStoryView viewModel](self, "viewModel");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v6;
        v7 = &__block_literal_global_98;
        goto LABEL_8;
      case 2:
        -[PXStoryView viewModel](self, "viewModel");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v6;
        v7 = &__block_literal_global_99;
        goto LABEL_8;
      case 3:
        -[PXStoryView _changeStyle](self, "_changeStyle");
        return;
      case 4:
        -[PXStoryView viewModel](self, "viewModel");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v6;
        v7 = &__block_literal_global_100;
LABEL_8:
        objc_msgSend(v6, "performChanges:", v7);

        break;
      case 5:
        -[PXStoryView _editCurrentChapter](self, "_editCurrentChapter");
        break;
      default:
        return;
    }
  }
}

- (void)_considerUpdatingFocusForChrome
{
  int v3;
  double v4;
  BOOL v5;
  id v6;

  -[PXStoryView viewModel](self, "viewModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "wantsChromeVisible");
  objc_msgSend(v6, "chromeVisibilityFraction");
  if (v3)
    v5 = v4 != 1.0;
  else
    v5 = v4 != 0.0;
  if (!v5)
    -[PXStoryView setNeedsFocusUpdate](self, "setNeedsFocusUpdate");

}

- (void)_considerUpdatingFocusForRelatedOverlay
{
  int v3;
  double v4;
  BOOL v5;
  id v6;

  -[PXStoryView viewModel](self, "viewModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "wantsRelatedOverlayVisible");
  objc_msgSend(v6, "relatedOverlayVisibilityFraction");
  if (v3)
    v5 = v4 != 1.0;
  else
    v5 = v4 != 0.0;
  if (!v5)
    -[PXStoryView setNeedsFocusUpdate](self, "setNeedsFocusUpdate");

}

- (void)_considerUpdatingFocusForInfoPanel
{
  double v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  -[PXStoryView mainModel](self, "mainModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "desiredInfoPanelVisibilityFraction");
  if (v3 == 0.0)
  {
    -[PXStoryView mainModel](self, "mainModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "infoPanelVisibilityFraction");
    v6 = v5;

    if (v6 == 0.0)
      -[PXStoryView setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }
  else
  {

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  PXTouchingUIGestureRecognizer *touchingGestureRecognizer;
  id v7;
  id v8;
  id v9;

  touchingGestureRecognizer = self->_touchingGestureRecognizer;
  v7 = a3;
  -[PXStoryView anyIndirectTouchGestureRecognizer](self, "anyIndirectTouchGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[PXStoryView anyPressGestureRecognizer](self, "anyPressGestureRecognizer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  return v9 == v7 || v8 == v7 || touchingGestureRecognizer == a3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  char isKindOfClass;
  id v11;
  id v12;
  BOOL v13;

  v6 = a3;
  v7 = a4;
  if (-[PXStoryView disableGestures](self, "disableGestures"))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v7, "locationInView:", self);
    -[PXStoryView hitTest:withEvent:](self, "hitTest:withEvent:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    -[PXStoryView anyIndirectTouchGestureRecognizer](self, "anyIndirectTouchGestureRecognizer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 == v6)
    {
      v8 = 1;
    }
    else
    {
      -[PXStoryView anyPressGestureRecognizer](self, "anyPressGestureRecognizer");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = v12 == v6;

      v8 = v13 | isKindOfClass ^ 1;
    }

  }
  return v8 & 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  char v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  v4 = a3;
  if (-[PXStoryView disableGestures](self, "disableGestures"))
  {
    v5 = 0;
  }
  else
  {
    -[PXStoryView panDownGestureRecognizer](self, "panDownGestureRecognizer");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      -[PXStoryView swipeDownGestureHelper](self, "swipeDownGestureHelper");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v8, "verticalSwipeGestureRecognizerShouldBegin:ignoringScrollViews:", v4, 1);

    }
    else
    {
      -[PXStoryView panUpGestureRecognizer](self, "panUpGestureRecognizer");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 == v4)
      {
        -[PXStoryView panUpGestureRecognizer](self, "panUpGestureRecognizer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXStoryView tungstenView](self, "tungstenView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "velocityInView:", v10);
        v12 = v11;
        v14 = v13;

        MEMORY[0x1A85CCC64](v14, v12);
        PXRadiansToDegrees();
        +[PXKitSettings sharedInstance](PXKitSettings, "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "upGesturesAngularToleranceInDegrees");

        v5 = PXFloatEqualToFloatWithTolerance();
      }
      else
      {
        v5 = 1;
      }
    }
  }

  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  char v9;
  char v10;
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[PXStoryView panUpGestureRecognizer](self, "panUpGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 != v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

LABEL_6:
      -[PXStoryView panDownGestureRecognizer](self, "panDownGestureRecognizer");
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 == v6)
      {
        -[PXStoryView swipeDownGestureHelper](self, "swipeDownGestureHelper");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v13, "verticalSwipeGestureRecognizer:shouldBeRequiredToFailByGestureRecognizer:", v6, v7);
      }
      else
      {
        -[PXStoryView longPressGestureRecognizer](self, "longPressGestureRecognizer");
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 != v6)
        {
          v10 = 0;
          goto LABEL_12;
        }
        -[PXStoryView panDownGestureRecognizer](self, "panDownGestureRecognizer");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v10 = v13 == v7;
      }

      goto LABEL_12;
    }
  }
  v9 = objc_msgSend(v7, "px_isPanGestureRecognizerOfScrollView:", 0);

  if ((v9 & 1) == 0)
    goto LABEL_6;
  v10 = 1;
LABEL_12:

  return v10;
}

- (BOOL)verticalSwipeGestureRecognizerHelper:(id)a3 shouldRecognizeSwipeDownGestureRecognizer:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[PXStoryView panDownGestureRecognizer](self, "panDownGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
    return 1;
  -[PXStoryView viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "viewMode") == 1)
  {
    objc_msgSend(v8, "viewModeTransition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9 == 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)touchingUIGestureRecognizerDidBeginTouching:(id)a3
{
  -[PXStoryView setIsTouching:](self, "setIsTouching:", 1);
}

- (void)touchingUIGestureRecognizerDidEndTouching:(id)a3
{
  -[PXStoryView setIsTouching:](self, "setIsTouching:", 0);
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  -[PXStoryView updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

  v4.receiver = self;
  v4.super_class = (Class)PXStoryView;
  -[PXStoryView layoutSubviews](&v4, sel_layoutSubviews);
}

- (void)_invalidateGestureRecognizers
{
  id v2;

  -[PXStoryView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateGestureRecognizers);

}

- (void)_updateGestureRecognizers
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PXStoryView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wantsChromeVisible");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PXStoryView swipeGestureRecognizers](self, "swipeGestureRecognizers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9++), "setEnabled:", 1);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  -[PXStoryView viewModel](self, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "viewMode") == 1;
  -[PXStoryView panUpGestureRecognizer](self, "panUpGestureRecognizer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEnabled:", v11);

  -[PXStoryView viewModel](self, "viewModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "viewMode");

  if (v14 != 1)
    v4 = v14 == 4 || v14 == 2;
  -[PXStoryView menuGestureRecognizer](self, "menuGestureRecognizer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEnabled:", v4);

}

- (void)_invalidateBackgroundColor
{
  id v2;

  -[PXStoryView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateBackgroundColor);

}

- (void)_updateBackgroundColor
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[PXStoryView viewModel](self, "viewModel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewLayoutSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewModeTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "viewMode") == 2
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !objc_msgSend(v4, "isComplete"))
  {
    objc_msgSend(v3, "browseGridBackgroundColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "playerBackgroundColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  -[PXStoryView tungstenView](self, "tungstenView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

}

- (void)_invalidateMainModel
{
  id v2;

  -[PXStoryView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateMainModel);

}

- (void)_updateMainModel
{
  void *v3;
  id v4;

  -[PXStoryView viewModel](self, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryView setMainModel:](self, "setMainModel:", v3);

}

- (void)setMainModel:(id)a3
{
  PXStoryModel *v5;
  PXStoryModel *mainModel;
  PXStoryModel *v7;

  v5 = (PXStoryModel *)a3;
  mainModel = self->_mainModel;
  if (mainModel != v5)
  {
    v7 = v5;
    -[PXStoryModel unregisterChangeObserver:context:](mainModel, "unregisterChangeObserver:context:", self, ModelObservationContext_129949);
    objc_storeStrong((id *)&self->_mainModel, a3);
    -[PXStoryModel registerChangeObserver:context:](self->_mainModel, "registerChangeObserver:context:", self, ModelObservationContext_129949);
    v5 = v7;
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  void *v10;
  id v11;

  v9 = a3;
  if ((void *)ViewModelObservationContext_129948 == a5)
  {
    v11 = v9;
    if ((a4 & 0x2008) != 0)
    {
      -[PXStoryView _invalidateGestureRecognizers](self, "_invalidateGestureRecognizers");
      v9 = v11;
    }
    if ((a4 & 0x10400000020) != 0)
    {
      -[PXStoryView _invalidateBackgroundColor](self, "_invalidateBackgroundColor");
      v9 = v11;
    }
    if ((a4 & 0x40) != 0)
    {
      -[PXStoryView _invalidateMainModel](self, "_invalidateMainModel");
      v9 = v11;
    }
  }
  else if ((void *)ModelObservationContext_129949 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryView.m"), 1148, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }

}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PXStoryView viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubprovider:", v5);

  -[PXStoryView tungstenView](self, "tungstenView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubprovider:", v6);

  -[PXStoryView viewLayout](self, "viewLayout");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubprovider:", v7);

}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (UIPanGestureRecognizer)panUpGestureRecognizer
{
  return self->_panUpGestureRecognizer;
}

- (UIPanGestureRecognizer)panDownGestureRecognizer
{
  return self->_panDownGestureRecognizer;
}

- (PXVerticalSwipeGestureRecognizerHelper)swipeDownGestureHelper
{
  return self->_swipeDownGestureHelper;
}

- (NSArray)swipeGestureRecognizers
{
  return self->_swipeGestureRecognizers;
}

- (UITapGestureRecognizer)menuGestureRecognizer
{
  return self->_menuGestureRecognizer;
}

- (PXTouchingUIGestureRecognizer)touchingGestureRecognizer
{
  return self->_touchingGestureRecognizer;
}

- (UILongPressGestureRecognizer)anyIndirectTouchGestureRecognizer
{
  return self->_anyIndirectTouchGestureRecognizer;
}

- (UILongPressGestureRecognizer)anyPressGestureRecognizer
{
  return self->_anyPressGestureRecognizer;
}

- (NSMutableSet)activeRemoteGestureRecognizers
{
  return self->_activeRemoteGestureRecognizers;
}

- (PXStoryViewConfiguration)viewConfiguration
{
  return self->_viewConfiguration;
}

- (PXStoryModel)mainModel
{
  return self->_mainModel;
}

- (PXStoryPacingTimeSource)timeSource
{
  return self->_timeSource;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXStoryViewLayout)viewLayout
{
  return self->_viewLayout;
}

- (BOOL)isTouching
{
  return self->_isTouching;
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (PXGViewCoordinator)tungstenViewCoordinator
{
  return self->_tungstenViewCoordinator;
}

- (BOOL)disableGestures
{
  return self->_disableGestures;
}

- (void)setDisableGestures:(BOOL)a3
{
  self->_disableGestures = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tungstenViewCoordinator, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_viewLayout, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_timeSource, 0);
  objc_storeStrong((id *)&self->_mainModel, 0);
  objc_storeStrong((id *)&self->_viewConfiguration, 0);
  objc_storeStrong((id *)&self->_activeRemoteGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_anyPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_anyIndirectTouchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_touchingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_menuGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_swipeGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_swipeDownGestureHelper, 0);
  objc_storeStrong((id *)&self->_panDownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panUpGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
  objc_storeStrong((id *)&self->_dismissalController, 0);
  objc_storeStrong((id *)&self->_lastDemotedDisplayAssets, 0);
}

void __35__PXStoryView__handleTwoFingerTap___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setWantsRelatedOverlayVisible:", objc_msgSend(v2, "wantsRelatedOverlayVisible") ^ 1);

}

uint64_t __35__PXStoryView__handleTwoFingerTap___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cycleHUDType");
}

uint64_t __35__PXStoryView__handleTwoFingerTap___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "toggleHUD");
}

void __30__PXStoryView__handlePanDown___block_invoke(uint64_t a1, void *a2)
{
  __int128 v3;
  __int128 v4;
  void *v5;
  _QWORD v6[5];
  _OWORD v7[4];
  uint64_t v8;

  v3 = *(_OWORD *)(a1 + 56);
  v4 = *(_OWORD *)(a1 + 88);
  v7[2] = *(_OWORD *)(a1 + 72);
  v7[3] = v4;
  v8 = *(_QWORD *)(a1 + 104);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v3;
  objc_msgSend(a2, "setSwipeDownInteractionState:", v7);
  objc_msgSend(*(id *)(a1 + 32), "mainModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__PXStoryView__handlePanDown___block_invoke_2;
  v6[3] = &__block_descriptor_40_e31_v16__0___PXStoryMutableModel__8l;
  v6[4] = *(_QWORD *)(a1 + 112);
  objc_msgSend(v5, "performChanges:", v6);

}

uint64_t __30__PXStoryView__handlePanDown___block_invoke_3(uint64_t a1, void *a2)
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[4];
  uint64_t v6;

  v2 = *(_OWORD *)(a1 + 80);
  v5[2] = *(_OWORD *)(a1 + 64);
  v5[3] = v2;
  v6 = *(_QWORD *)(a1 + 96);
  v3 = *(_OWORD *)(a1 + 48);
  v5[0] = *(_OWORD *)(a1 + 32);
  v5[1] = v3;
  return objc_msgSend(a2, "setSwipeDownInteractionState:", v5);
}

uint64_t __30__PXStoryView__handlePanDown___block_invoke_4(uint64_t a1, void *a2)
{
  _OWORD v3[4];
  uint64_t v4;

  v4 = 0;
  memset(v3, 0, sizeof(v3));
  return objc_msgSend(a2, "setSwipeDownInteractionState:", v3);
}

void __30__PXStoryView__handlePanDown___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setLastHitAssetReference:", 0);
  objc_msgSend(v3, "setLastHitClipIdentifier:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setViewMode:", 2);

}

void __45__PXStoryView__handleAnyTouchOrPressGesture___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "activeRemoteGestureRecognizers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsUserPerformingRemoteGesture:", objc_msgSend(v4, "count") != 0);

}

uint64_t __44__PXStoryView__handleMenuGestureRecognizer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setViewMode:", 1);
}

void __29__PXStoryView_insertNewline___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "selectRelatedAtIndex:", objc_msgSend(v2, "highlightedRelatedIndex"));

}

uint64_t __38__PXStoryView__changeOverallDuration___block_invoke(uint64_t a1, void *a2)
{
  __int128 v2;
  __int128 v3;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v2 = *MEMORY[0x1E0D759A0];
  v7 = *(_OWORD *)(MEMORY[0x1E0D759A0] + 16);
  v3 = *(_OWORD *)(MEMORY[0x1E0D759A0] + 48);
  v8 = *(_OWORD *)(MEMORY[0x1E0D759A0] + 32);
  v9 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(MEMORY[0x1E0D759A0] + 64);
  v6 = v2;
  return objc_msgSend(a2, "applyTargetOverallDurationInfo:", &v5);
}

void __32__PXStoryView__changeColorGrade__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "currentStyle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applyFocusedStyleWithCustomizedColorGradeKind:", (objc_msgSend(v4, "customColorGradeKind") + 1) % 13);

}

uint64_t __27__PXStoryView__changeStyle__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "applyStyleAtIndex:fromDataSource:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __34__PXStoryView__hideRelatedOverlay__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWantsRelatedOverlayVisible:", 0);
}

uint64_t __28__PXStoryView__toggleChrome__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "toggleChrome");
}

uint64_t __30__PXStoryView__togglePlayback__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "togglePlayback");
}

uint64_t __30__PXStoryView__handleEdgeTap___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "rewindToBeginning:rewindMusic:", *(unsigned __int8 *)(a1 + 32), *(_BYTE *)(a1 + 33) == 0);
}

uint64_t __30__PXStoryView__handleEdgeTap___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "flickedPastEnd");
}

void __48__PXStoryView__handleRelatedKeyboardNavigation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  _BOOL4 v9;
  int v10;
  _BOOL4 v11;
  int v12;
  int v13;
  int v14;
  char v15;
  _BOOL4 v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;

  v23 = a2;
  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relatedModels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") - 1;

  v6 = objc_msgSend(v23, "highlightedRelatedIndex");
  if (objc_msgSend(v23, "highlightedRelatedIndex"))
    v7 = objc_msgSend(v23, "highlightedRelatedIndex") == 0x7FFFFFFFFFFFFFFFLL;
  else
    v7 = 1;
  v8 = objc_msgSend(v23, "highlightedRelatedIndex");
  v9 = *(_QWORD *)(a1 + 40) == 2;
  v10 = objc_msgSend(*(id *)(a1 + 32), "_isRTL");
  v11 = *(_QWORD *)(a1 + 40) == 8;
  v12 = v11 ^ objc_msgSend(*(id *)(a1 + 32), "_isRTL");
  v13 = (v9 ^ v10) & v7;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    v14 = v12;
  else
    v14 = 0;
  if (v8 == v5)
    v15 = v12;
  else
    v15 = 0;
  v17 = v6 != 0x7FFFFFFFFFFFFFFFLL && v5 >= 0;
  if ((v13 & 1) != 0)
    v17 = 0;
  if ((v15 & 1) != 0)
    v17 = 0;
  if (v14)
  {
    v18 = v23;
    v19 = 0;
LABEL_31:
    objc_msgSend(v18, "setHighlightedRelatedIndex:", v19);
    goto LABEL_32;
  }
  v20 = v23;
  if (v13)
  {
    objc_msgSend(v23, "setWantsRelatedOverlayVisible:", 0);
LABEL_32:
    v20 = v23;
    goto LABEL_33;
  }
  if (v17)
  {
    if (v12)
      v21 = 1;
    else
      v21 = -1;
    if (objc_msgSend(v23, "highlightedRelatedIndex") + v21 < 0
      || objc_msgSend(v23, "highlightedRelatedIndex") + v21 > v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("PXStoryView.m"), 444, CFSTR("Selection index out of bounds"));

    }
    v19 = objc_msgSend(v23, "highlightedRelatedIndex") + v21;
    v18 = v23;
    goto LABEL_31;
  }
LABEL_33:

}

void __48__PXStoryView__handlePrimaryInteractionAtPoint___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "focusedStyleIsCurrentStyle") & 1) == 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __48__PXStoryView__handlePrimaryInteractionAtPoint___block_invoke_2;
    v5[3] = &unk_1E5149198;
    v4 = *(void **)(a1 + 40);
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v4, "performWithPrerequestedPersistencePermission:", v5);

  }
  objc_msgSend(v3, "setViewMode:", 1);

}

uint64_t __48__PXStoryView__handlePrimaryInteractionAtPoint___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWantsRelatedOverlayVisible:", 0);
}

uint64_t __48__PXStoryView__handlePrimaryInteractionAtPoint___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performChanges:origin:", &__block_literal_global_129989, 2);
}

uint64_t __48__PXStoryView__handlePrimaryInteractionAtPoint___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "applyFocusedStyle");
}

uint64_t __53__PXStoryView__skipToSegmentWithOffset_afterEdgeTap___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "skipToSegmentWithOffset:byTappingEdge:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __26__PXStoryView_insertText___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("h")))
  {
    objc_msgSend(v7, "toggleHUD");
LABEL_24:
    v6 = v7;
    goto LABEL_25;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("i")))
  {
    objc_msgSend(v7, "cycleHUDType");
    goto LABEL_24;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("r")))
  {
    objc_msgSend(v7, "setWantsRelatedOverlayVisible:", objc_msgSend(v7, "wantsRelatedOverlayVisible") ^ 1);
    goto LABEL_24;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("e")))
  {
    objc_msgSend(v7, "setShouldShowErrorIndicator:", objc_msgSend(v7, "shouldShowErrorIndicator") ^ 1);
    goto LABEL_24;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("s")))
  {
    objc_msgSend(*(id *)(a1 + 40), "_changeStyle");
    goto LABEL_24;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("c")))
  {
    objc_msgSend(*(id *)(a1 + 40), "_changeColorGrade");
    goto LABEL_24;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("C")))
  {
    objc_msgSend(*(id *)(a1 + 40), "_editCurrentChapter");
    goto LABEL_24;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("1")))
  {
    v3 = *(void **)(a1 + 40);
    v4 = 3;
LABEL_23:
    objc_msgSend(v3, "_changeOverallDuration:", v4);
    goto LABEL_24;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("2")))
  {
    v3 = *(void **)(a1 + 40);
    v4 = 4;
    goto LABEL_23;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("3")))
  {
    v3 = *(void **)(a1 + 40);
    v4 = 5;
    goto LABEL_23;
  }
  v5 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("0"));
  v6 = v7;
  if (v5)
  {
    v3 = *(void **)(a1 + 40);
    v4 = 1;
    goto LABEL_23;
  }
LABEL_25:

}

id __44__PXStoryView__initializeGestureRecognizers__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D10]), "initWithTarget:action:", *(_QWORD *)(a1 + 32), sel__handleSwipeGesture_);
  objc_msgSend(v4, "setDirection:", a2);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  return v4;
}

uint64_t __29__PXStoryView_setIsTouching___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsTouching:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __27__PXStoryView_setIsActive___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsActive:", *(unsigned __int8 *)(a1 + 32));
}

void __43__PXStoryView_initWithFrame_configuration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setMediaProvider:", v2);
  objc_msgSend(v3, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v3, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v3, "setContentInsetAdjustmentBehavior:", 1);
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentationType:", objc_msgSend(v4, "playerPresentationType"));

}

+ (NSString)allDiagnosticDescriptions
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useVerboseStyleHUDText");
  objc_msgSend(v2, "setUseVerboseStyleHUDText:", 1);
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__PXStoryView_allDiagnosticDescriptions__block_invoke;
  v8[3] = &unk_1E512AF48;
  v5 = v4;
  v9 = v5;
  EnumerateAllViewsUsingBlock(v8);
  if (!objc_msgSend(v5, "length"))
    objc_msgSend(v5, "appendString:", CFSTR("Could not find an instance of Interactive Memories Player (PXStoryView) in the view hierarchy"));
  objc_msgSend(v2, "setUseVerboseStyleHUDText:", v3);
  v6 = (void *)objc_msgSend(v5, "copy");

  return (NSString *)v6;
}

+ (void)dumpTapToRadarDiagnosticAttachmentsToURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  PXRadarConfiguration *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v5 = a3;
  v6 = a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__130046;
  v14 = __Block_byref_object_dispose__130047;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__PXStoryView_dumpTapToRadarDiagnosticAttachmentsToURL_completionHandler___block_invoke;
  v9[3] = &unk_1E512AF70;
  v9[4] = &v10;
  EnumerateAllViewsUsingBlock(v9);
  if (v11[5])
  {
    v7 = objc_alloc_init(PXRadarConfiguration);
    objc_msgSend((id)v11[5], "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXRadarConfiguration addDiagnosticProvider:](v7, "addDiagnosticProvider:", v8);

    -[PXRadarConfiguration setAttachmentsIncludeAnyUserAsset:](v7, "setAttachmentsIncludeAnyUserAsset:", 0);
    PXDumpRadarAttachmentsWithConfigurationToFolderURL(v7, v5, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("couldn't find any PXStoryView"));
    v7 = (PXRadarConfiguration *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, PXRadarConfiguration *))v6 + 2))(v6, 0, v7);
  }

  _Block_object_dispose(&v10, 8);
}

void __74__PXStoryView_dumpTapToRadarDiagnosticAttachmentsToURL_completionHandler___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __40__PXStoryView_allDiagnosticDescriptions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v10;
    objc_msgSend(v3, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "diagnosticDescriptionForAllHUDTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %p:\n%@\n"), v8, v3, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "appendString:", v9);
  }

}

@end
