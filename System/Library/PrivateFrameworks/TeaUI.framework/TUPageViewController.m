@implementation TUPageViewController

- (TUPageViewController)initWithCoder:(id)a3
{
  TUPageViewController *v3;
  TUPageViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUPageViewController;
  v3 = -[TUPageViewController initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[TUPageViewController commonInit](v3, "commonInit");
  return v4;
}

- (TUPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  TUPageViewController *v4;
  TUPageViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TUPageViewController;
  v4 = -[TUPageViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[TUPageViewController commonInit](v4, "commonInit");
  return v5;
}

- (void)commonInit
{
  TUPageViewControllerScrollView *v3;
  TUPageViewControllerScrollView *scrollView;
  OS_dispatch_group *v5;
  OS_dispatch_group *idleDispatchGroup;
  NSMutableArray *v7;
  NSMutableArray *replayViewTransitions;

  v3 = objc_alloc_init(TUPageViewControllerScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  -[TUPageViewControllerScrollView setAllowsKeyboardScrolling:](self->_scrollView, "setAllowsKeyboardScrolling:", 0);
  -[TUPageViewControllerScrollView _setContentInsetAdjustmentBehavior:](self->_scrollView, "_setContentInsetAdjustmentBehavior:", 2);
  -[TUPageViewControllerScrollView setAutoresizesSubviews:](self->_scrollView, "setAutoresizesSubviews:", 0);
  -[TUPageViewControllerScrollView setPagingEnabled:](self->_scrollView, "setPagingEnabled:", 1);
  -[TUPageViewControllerScrollView setAlwaysBounceHorizontal:](self->_scrollView, "setAlwaysBounceHorizontal:", 1);
  -[TUPageViewControllerScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", 0);
  -[TUPageViewControllerScrollView setShowsHorizontalScrollIndicator:](self->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[TUPageViewControllerScrollView setShowsVerticalScrollIndicator:](self->_scrollView, "setShowsVerticalScrollIndicator:", 0);
  -[TUPageViewControllerScrollView setCanCancelContentTouches:](self->_scrollView, "setCanCancelContentTouches:", 1);
  -[TUPageViewControllerScrollView setDelaysContentTouches:](self->_scrollView, "setDelaysContentTouches:", 0);
  -[TUPageViewControllerScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  -[TUPageViewControllerScrollView setAccessibilityDelegate:](self->_scrollView, "setAccessibilityDelegate:", self);
  -[TUPageViewControllerScrollView setDirectionalLockEnabled:](self->_scrollView, "setDirectionalLockEnabled:", 1);
  self->_pageGutter = 4.0;
  v5 = (OS_dispatch_group *)dispatch_group_create();
  idleDispatchGroup = self->_idleDispatchGroup;
  self->_idleDispatchGroup = v5;

  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  replayViewTransitions = self->_replayViewTransitions;
  self->_replayViewTransitions = v7;

  -[TUPageViewControllerScrollView setFocusEffect:](self->_scrollView, "setFocusEffect:", 0);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TUPageViewController;
  -[TUPageViewController viewDidLoad](&v14, sel_viewDidLoad);
  -[TUPageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreservesSuperviewLayoutMargins:", 1);

  -[TUPageViewController scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreservesSuperviewLayoutMargins:", 1);

  -[TUPageViewController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUPageViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  -[TUPageViewController calculateScrollViewFrameFromViewBounds:](self, "calculateScrollViewFrameFromViewBounds:");
  objc_msgSend(v5, "setFrame:");

  -[TUPageViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUPageViewController scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[TUPageViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  -[TUPageViewController transitionToSize:](self, "transitionToSize:", v10, v11);

  -[TUPageViewController updateScrollView](self, "updateScrollView");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_didReceiveBlueprintDidBeginItemDraggingEvent, CFSTR("TUBlueprintDidBeginItemDraggingNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_didReceiveBlueprintDidEndItemDraggingEvent, CFSTR("TUBlueprintDidEndItemDraggingNotification"), 0);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double width;
  double height;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v22;
  double v23;
  double v24;
  objc_super v25;
  CGRect v26;
  CGRect v27;

  v25.receiver = self;
  v25.super_class = (Class)TUPageViewController;
  -[TUPageViewController viewWillLayoutSubviews](&v25, sel_viewWillLayoutSubviews);
  -[TUPageViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[TUPageViewController pageGutter](self, "pageGutter");
  v13 = v12 * 0.5;
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  v27 = CGRectInset(v26, v13, 0.0);
  width = v27.size.width;
  height = v27.size.height;

  -[TUPageViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;

  if (width != v18 || height != v20)
  {
    -[TUPageViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    -[TUPageViewController transitionToSize:](self, "transitionToSize:", v23, v24);

    -[TUPageViewController managePreviousAndNextViewController](self, "managePreviousAndNextViewController");
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
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
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id location;
  objc_super v29;

  v3 = a3;
  v29.receiver = self;
  v29.super_class = (Class)TUPageViewController;
  -[TUPageViewController viewWillAppear:](&v29, sel_viewWillAppear_);
  -[TUPageViewController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  -[TUPageViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;

  if (v7 != v12 || v9 != v14)
  {
    -[TUPageViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    -[TUPageViewController transitionToSize:](self, "transitionToSize:", v17, v18);

  }
  -[TUPageViewController visibleViewController](self, "visibleViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[TUPageViewController visibleViewController](self, "visibleViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "beginAppearanceTransition:animated:", 1, v3);

  }
  else
  {
    objc_initWeak(&location, self);
    -[TUPageViewController replayViewTransitions](self, "replayViewTransitions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __39__TUPageViewController_viewWillAppear___block_invoke;
    v26 = &unk_1E63095A8;
    objc_copyWeak(&v27, &location);
    v22 = _Block_copy(&v23);
    objc_msgSend(v21, "addObject:", v22, v23, v24, v25, v26);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
}

void __39__TUPageViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "visibleViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "beginAppearanceTransition:animated:", 1, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TUPageViewController;
  -[TUPageViewController viewDidAppear:](&v14, sel_viewDidAppear_, a3);
  -[TUPageViewController visibleViewController](self, "visibleViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TUPageViewController visibleViewController](self, "visibleViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endAppearanceTransition");

  }
  else
  {
    objc_initWeak(&location, self);
    -[TUPageViewController replayViewTransitions](self, "replayViewTransitions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __38__TUPageViewController_viewDidAppear___block_invoke;
    v11 = &unk_1E63095A8;
    objc_copyWeak(&v12, &location);
    v7 = _Block_copy(&v8);
    objc_msgSend(v6, "addObject:", v7, v8, v9, v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __38__TUPageViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "visibleViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endAppearanceTransition");

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;
  objc_super v15;

  v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TUPageViewController;
  -[TUPageViewController viewWillDisappear:](&v15, sel_viewWillDisappear_);
  -[TUPageViewController visibleViewController](self, "visibleViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TUPageViewController visibleViewController](self, "visibleViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "beginAppearanceTransition:animated:", 0, v3);

  }
  else
  {
    objc_initWeak(&location, self);
    -[TUPageViewController replayViewTransitions](self, "replayViewTransitions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __42__TUPageViewController_viewWillDisappear___block_invoke;
    v12 = &unk_1E63095A8;
    objc_copyWeak(&v13, &location);
    v8 = _Block_copy(&v9);
    objc_msgSend(v7, "addObject:", v8, v9, v10, v11, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __42__TUPageViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "visibleViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "beginAppearanceTransition:animated:", 0, 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TUPageViewController;
  -[TUPageViewController viewDidDisappear:](&v14, sel_viewDidDisappear_, a3);
  -[TUPageViewController visibleViewController](self, "visibleViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TUPageViewController visibleViewController](self, "visibleViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endAppearanceTransition");

  }
  else
  {
    objc_initWeak(&location, self);
    -[TUPageViewController replayViewTransitions](self, "replayViewTransitions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __41__TUPageViewController_viewDidDisappear___block_invoke;
    v11 = &unk_1E63095A8;
    objc_copyWeak(&v12, &location);
    v7 = _Block_copy(&v8);
    objc_msgSend(v6, "addObject:", v7, v8, v9, v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __41__TUPageViewController_viewDidDisappear___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "visibleViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endAppearanceTransition");

}

- (void)viewLayoutMarginsDidChange
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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TUPageViewController;
  -[TUPageViewController viewLayoutMarginsDidChange](&v14, sel_viewLayoutMarginsDidChange);
  -[TUPageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMargins");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[TUPageViewController visibleViewController](self, "visibleViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLayoutMargins:", v5, v7, v9, v11);

}

- (void)performWhenIdle:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[TUPageViewController idleDispatchGroup](self, "idleDispatchGroup");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(v5, MEMORY[0x1E0C80D38], v4);

}

- (void)setVisibleViewController:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[TUPageViewController visibleViewController](self, "visibleViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    -[TUPageViewController visibleViewController](self, "visibleViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUPageViewController visibleViewController](self, "visibleViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[TUPageViewController visibleViewController](self, "visibleViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUPageViewController removeViewController:](self, "removeViewController:", v9);

    }
    -[TUPageViewController addViewController:fromScroll:](self, "addViewController:fromScroll:", v5, 0);
    objc_storeStrong((id *)&self->_visibleViewController, a3);
    -[TUPageViewController reindexViewControllers](self, "reindexViewControllers");
    -[TUPageViewController replayViewTransitions](self, "replayViewTransitions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      -[TUPageViewController replayViewTransitions](self, "replayViewTransitions", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v22;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v22 != v14)
              objc_enumerationMutation(v11);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v15++) + 16))();
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v13);
      }

      -[TUPageViewController setReplayViewTransitions:](self, "setReplayViewTransitions:", 0);
    }
    else if (-[TUPageViewController _appearState](self, "_appearState") == 2 && v7)
    {
      -[TUPageViewController visibleViewController](self, "visibleViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "beginAppearanceTransition:animated:", 1, 0);

      -[TUPageViewController visibleViewController](self, "visibleViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "endAppearanceTransition");

    }
    -[TUPageViewController updateContentOffset](self, "updateContentOffset");
    -[TUPageViewController delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      -[TUPageViewController delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "pageViewController:didChangeVisibleViewControllerFromViewController:direction:", self, v7, 0);

    }
  }

}

- (void)didReceiveBlueprintDidBeginItemDraggingEvent
{
  -[TUPageViewController setPagingEnabled:](self, "setPagingEnabled:", 0);
}

- (void)didReceiveBlueprintDidEndItemDraggingEvent
{
  -[TUPageViewController setPagingEnabled:](self, "setPagingEnabled:", 1);
}

- (void)setPageGutter:(double)a3
{
  void *v4;
  void *v5;

  self->_pageGutter = a3;
  -[TUPageViewController scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUPageViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  -[TUPageViewController calculateScrollViewFrameFromViewBounds:](self, "calculateScrollViewFrameFromViewBounds:");
  objc_msgSend(v4, "setFrame:");

  -[TUPageViewController updateScrollView](self, "updateScrollView");
}

- (CGSize)pageSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[TUPageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  if (-[TUPageViewController isTransitioning](self, "isTransitioning"))
  {
    -[TUPageViewController transitioningSize](self, "transitioningSize");
  }
  else
  {
    v8 = v5;
    v9 = v7;
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setPagingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TUPageViewController scrollView](self, "scrollView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollEnabled:", v3);

}

- (BOOL)pagingEnabled
{
  void *v2;
  char v3;

  -[TUPageViewController scrollView](self, "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isScrollEnabled");

  return v3;
}

- (CGRect)calculateScrollViewFrameFromViewBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  CGFloat v8;
  CGRect v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TUPageViewController pageGutter](self, "pageGutter");
  v8 = v7 * -0.5;
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  return CGRectInset(v9, v8, 0.0);
}

- (void)updateScrollView
{
  -[TUPageViewController updateContentSize](self, "updateContentSize");
  -[TUPageViewController updateContentOffset](self, "updateContentOffset");
}

- (void)updateContentSize
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  -[TUPageViewController nextViewController](self, "nextViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = 2;
  else
    v4 = 1;
  -[TUPageViewController previousViewController](self, "previousViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v4 + 1;
  else
    v6 = v4;
  -[TUPageViewController pageSize](self, "pageSize");
  v8 = v7;
  -[TUPageViewController pageGutter](self, "pageGutter");
  v10 = v9 * (double)v6 + v8 * (double)v6;
  -[TUPageViewController pageSize](self, "pageSize");
  v12 = v11;
  -[TUPageViewController setCancelScrollViewDidScroll:](self, "setCancelScrollViewDidScroll:", 1);
  -[TUPageViewController scrollView](self, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContentSize:", v10, v12);

  -[TUPageViewController setCancelScrollViewDidScroll:](self, "setCancelScrollViewDidScroll:", 0);
}

- (void)updateContentOffset
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  CGRect v13;

  -[TUPageViewController visibleViewController](self, "visibleViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "center");
  v6 = v5;
  -[TUPageViewController visibleViewController](self, "visibleViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v9 = v6 - CGRectGetWidth(v13) * 0.5;
  -[TUPageViewController pageGutter](self, "pageGutter");
  v11 = v9 - v10 * 0.5;

  -[TUPageViewController setCancelScrollViewDidScroll:](self, "setCancelScrollViewDidScroll:", 1);
  -[TUPageViewController scrollView](self, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setContentOffset:", v11, 0.0);

  -[TUPageViewController setCancelScrollViewDidScroll:](self, "setCancelScrollViewDidScroll:", 0);
}

- (void)setSecondaryVisibleViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_secondaryVisibleViewController;
  void *v7;
  UIViewController *v8;

  v5 = (UIViewController *)a3;
  p_secondaryVisibleViewController = &self->_secondaryVisibleViewController;
  if (*p_secondaryVisibleViewController != v5)
  {
    v8 = v5;
    if (-[UIViewController isViewLoaded](*p_secondaryVisibleViewController, "isViewLoaded"))
    {
      -[UIViewController view](*p_secondaryVisibleViewController, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setUserInteractionEnabled:", 1);

    }
    objc_storeStrong((id *)p_secondaryVisibleViewController, a3);
    v5 = v8;
  }

}

- (CGPoint)centerForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  -[TUPageViewController pageSize](self, "pageSize");
  v6 = v5;
  -[TUPageViewController pageGutter](self, "pageGutter");
  v8 = v7 * (double)a3 + v6 * ((double)a3 + 0.5);
  -[TUPageViewController pageGutter](self, "pageGutter");
  v10 = v8 + v9 * 0.5;
  -[TUPageViewController pageSize](self, "pageSize");
  v12 = v11 * 0.5;
  v13 = v10;
  result.y = v12;
  result.x = v13;
  return result;
}

- (void)repositionPages
{
  void *v3;
  void *v4;
  id v5;

  -[TUPageViewController nextViewController](self, "nextViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUPageViewController updatePositionForViewController:](self, "updatePositionForViewController:", v3);

  -[TUPageViewController visibleViewController](self, "visibleViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUPageViewController updatePositionForViewController:](self, "updatePositionForViewController:", v4);

  -[TUPageViewController previousViewController](self, "previousViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TUPageViewController updatePositionForViewController:](self, "updatePositionForViewController:", v5);

}

- (void)managePreviousAndNextViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double Width;
  void *v12;
  double Height;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  -[TUPageViewController managedForViewController](self, "managedForViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUPageViewController visibleViewController](self, "visibleViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != v4)
  {
    -[TUPageViewController previousViewController](self, "previousViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[TUPageViewController dataSource](self, "dataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUPageViewController visibleViewController](self, "visibleViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pageViewController:viewControllerBeforeViewController:", self, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUPageViewController setPreviousViewController:](self, "setPreviousViewController:", v8);

    }
    -[TUPageViewController previousViewController](self, "previousViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[TUPageViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      Width = CGRectGetWidth(v31);
      -[TUPageViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      Height = CGRectGetHeight(v32);
      -[TUPageViewController previousViewController](self, "previousViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setBounds:", 0.0, 0.0, Width, Height);

      -[TUPageViewController previousViewController](self, "previousViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUPageViewController updatePositionForViewController:](self, "updatePositionForViewController:", v16);

    }
    -[TUPageViewController nextViewController](self, "nextViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      -[TUPageViewController dataSource](self, "dataSource");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUPageViewController visibleViewController](self, "visibleViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "pageViewController:viewControllerAfterViewController:", self, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUPageViewController setNextViewController:](self, "setNextViewController:", v20);

    }
    -[TUPageViewController nextViewController](self, "nextViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[TUPageViewController view](self, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bounds");
      v23 = CGRectGetWidth(v33);
      -[TUPageViewController view](self, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bounds");
      v25 = CGRectGetHeight(v34);
      -[TUPageViewController nextViewController](self, "nextViewController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setBounds:", 0.0, 0.0, v23, v25);

      -[TUPageViewController nextViewController](self, "nextViewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUPageViewController updatePositionForViewController:](self, "updatePositionForViewController:", v28);

    }
    -[TUPageViewController visibleViewController](self, "visibleViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUPageViewController updatePositionForViewController:](self, "updatePositionForViewController:", v29);

    -[TUPageViewController updateContentSize](self, "updateContentSize");
    -[TUPageViewController visibleViewController](self, "visibleViewController");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    -[TUPageViewController setManagedForViewController:](self, "setManagedForViewController:", v30);

  }
}

- (void)updatePositionForViewController:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v13 = a3;
  -[TUPageViewController visibleViewController](self, "visibleViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[TUPageViewController previousViewController](self, "previousViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v13)
  {
    v7 = v5 != 0;
LABEL_9:

    goto LABEL_10;
  }

  if (v5 != v13)
  {
    -[TUPageViewController nextViewController](self, "nextViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v13)
    {
      -[TUPageViewController previousViewController](self, "previousViewController");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (v5)
        v7 = 2;
      else
        v7 = 1;
      goto LABEL_9;
    }
  }
  v7 = 0;
LABEL_10:
  -[TUPageViewController centerForIndex:](self, "centerForIndex:", v7);
  v9 = v8;
  v11 = v10;
  objc_msgSend(v13, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCenter:", v9, v11);

}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)removeViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[TUPageViewController appearingViewController](self, "appearingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v9)
  {
    objc_msgSend(v9, "beginAppearanceTransition:animated:", 0, 0);
    -[TUPageViewController setAppearingViewController:](self, "setAppearingViewController:", 0);
  }
  objc_msgSend(v9, "endAppearanceTransition");
  objc_msgSend(v9, "willMoveToParentViewController:", 0);
  objc_msgSend(v9, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  objc_msgSend(v9, "removeFromParentViewController");
  -[TUPageViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[TUPageViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pageViewController:didHideViewController:", self, v9);

  }
}

- (void)addViewController:(id)a3 fromScroll:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double Width;
  void *v14;
  double Height;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  CGRect v30;
  CGRect v31;

  v4 = a4;
  v29 = a3;
  -[TUPageViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[TUPageViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUPageViewController visibleViewController](self, "visibleViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pageViewController:willShowViewController:previousViewController:fromScroll:", self, v29, v9, v4);

  }
  -[TUPageViewController addChildViewController:](self, "addChildViewController:", v29);
  -[TUPageViewController setAppearingViewController:](self, "setAppearingViewController:", v29);
  -[TUPageViewController visibleViewController](self, "visibleViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "beginAppearanceTransition:animated:", 0, 0);

  -[TUPageViewController visibleViewController](self, "visibleViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUPageViewController setDisappearingViewController:](self, "setDisappearingViewController:", v11);

  -[TUPageViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  Width = CGRectGetWidth(v30);
  -[TUPageViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  Height = CGRectGetHeight(v31);
  objc_msgSend(v29, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBounds:", 0.0, 0.0, Width, Height);

  -[TUPageViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layoutMargins");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend(v29, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setLayoutMargins:", v19, v21, v23, v25);

  -[TUPageViewController scrollView](self, "scrollView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addSubview:", v28);

  objc_msgSend(v29, "didMoveToParentViewController:", self);
}

- (void)reindexViewControllers
{
  -[TUPageViewController setNextViewController:](self, "setNextViewController:", 0);
  -[TUPageViewController setPreviousViewController:](self, "setPreviousViewController:", 0);
  -[TUPageViewController setManagedForViewController:](self, "setManagedForViewController:", 0);
  -[TUPageViewController managePreviousAndNextViewController](self, "managePreviousAndNextViewController");
  -[TUPageViewController updateContentOffset](self, "updateContentOffset");
}

- (void)reindexPreviousViewControllers
{
  -[TUPageViewController setPreviousViewController:](self, "setPreviousViewController:", 0);
  -[TUPageViewController setManagedForViewController:](self, "setManagedForViewController:", 0);
  -[TUPageViewController managePreviousAndNextViewController](self, "managePreviousAndNextViewController");
  -[TUPageViewController updateContentOffset](self, "updateContentOffset");
}

- (void)reindexNextViewControllers
{
  -[TUPageViewController setNextViewController:](self, "setNextViewController:", 0);
  -[TUPageViewController setManagedForViewController:](self, "setManagedForViewController:", 0);
  -[TUPageViewController managePreviousAndNextViewController](self, "managePreviousAndNextViewController");
  -[TUPageViewController updateContentOffset](self, "updateContentOffset");
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[TUPageViewController visibleViewController](self, "visibleViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUPageViewController setOriginalVisibleViewController:](self, "setOriginalVisibleViewController:", v4);

  -[TUPageViewController originalVisibleViewController](self, "originalVisibleViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  -[TUPageViewController handleScrollStart](self, "handleScrollStart");
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[TUPageViewController handleScrollEnd](self, "handleScrollEnd", a3);
}

- (void)handleScrollStart
{
  NSObject *v3;

  if (!-[TUPageViewController scrollViewStartedScrolling](self, "scrollViewStartedScrolling"))
  {
    -[TUPageViewController idleDispatchGroup](self, "idleDispatchGroup");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v3);

    self->_scrollViewStartedScrolling = 1;
  }
}

- (void)handleScrollEnd
{
  NSObject *v3;

  if (-[TUPageViewController scrollViewStartedScrolling](self, "scrollViewStartedScrolling"))
  {
    -[TUPageViewController idleDispatchGroup](self, "idleDispatchGroup");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v3);

    self->_scrollViewStartedScrolling = 0;
  }
  -[TUPageViewController callLastViewAppearanceMethods](self, "callLastViewAppearanceMethods");
}

- (void)callLastViewAppearanceMethods
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

  -[TUPageViewController originalVisibleViewController](self, "originalVisibleViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 1);

  if (!-[TUPageViewController scrollViewStartedScrolling](self, "scrollViewStartedScrolling"))
  {
    -[TUPageViewController visibleViewController](self, "visibleViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUPageViewController disappearingViewController](self, "disappearingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
    {
      -[TUPageViewController disappearingViewController](self, "disappearingViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "beginAppearanceTransition:animated:", 1, 0);

      -[TUPageViewController disappearingViewController](self, "disappearingViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "endAppearanceTransition");

    }
    -[TUPageViewController visibleViewController](self, "visibleViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUPageViewController appearingViewController](self, "appearingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 != v10)
    {
      -[TUPageViewController appearingViewController](self, "appearingViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "beginAppearanceTransition:animated:", 0, 0);

      -[TUPageViewController appearingViewController](self, "appearingViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "endAppearanceTransition");

    }
    -[TUPageViewController visibleViewController](self, "visibleViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUPageViewController appearingViewController](self, "appearingViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 == v14)
    {
      -[TUPageViewController appearingViewController](self, "appearingViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "endAppearanceTransition");

    }
    -[TUPageViewController setAppearingViewController:](self, "setAppearingViewController:", 0);
    -[TUPageViewController setDisappearingViewController:](self, "setDisappearingViewController:", 0);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  void *v45;
  double v46;
  CGFloat v47;
  void *v48;
  CGFloat v49;
  double width;
  void *v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  void *v68;
  double v69;
  CGFloat v70;
  void *v71;
  CGFloat v72;
  double v73;
  void *v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  void *v86;
  void *v87;
  double v88;
  double v89;
  void *v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  id v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;

  v95 = a3;
  if (!-[TUPageViewController cancelScrollViewDidScroll](self, "cancelScrollViewDidScroll")
    && !-[TUPageViewController _shouldIgnoreDidScrollWithScrollView:](self, "_shouldIgnoreDidScrollWithScrollView:", v95))
  {
    objc_msgSend(v95, "contentOffset");
    v5 = v4;
    objc_msgSend(v95, "contentOffset");
    v7 = v6;
    -[TUPageViewController visibleViewController](self, "visibleViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "center");
    v11 = v10;
    objc_msgSend(v95, "bounds");
    v13 = v7 - (v11 + v12 * -0.5);

    if (v13 >= 0.0)
    {
      if (v13 <= 0.0)
      {
        v15 = 0;
        goto LABEL_9;
      }
      -[TUPageViewController nextViewController](self, "nextViewController");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[TUPageViewController previousViewController](self, "previousViewController");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v14;
LABEL_9:
    -[TUPageViewController secondaryVisibleViewController](self, "secondaryVisibleViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 || !v15)
    {
      -[TUPageViewController secondaryVisibleViewController](self, "secondaryVisibleViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        if (v17)
        {
          -[TUPageViewController secondaryVisibleViewController](self, "secondaryVisibleViewController");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUPageViewController removeViewController:](self, "removeViewController:", v94);

          -[TUPageViewController setSecondaryVisibleViewController:](self, "setSecondaryVisibleViewController:", 0);
        }
LABEL_16:
        -[TUPageViewController secondaryVisibleViewController](self, "secondaryVisibleViewController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "view");
        v22 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v22, "setUserInteractionEnabled:", 0);

        -[TUPageViewController delegate](self, "delegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v22) = objc_opt_respondsToSelector();

        if ((v22 & 1) != 0)
        {
          -[TUPageViewController view](self, "view");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUPageViewController visibleViewController](self, "visibleViewController");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "view");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "bounds");
          v28 = v27;
          v30 = v29;
          v32 = v31;
          v34 = v33;
          -[TUPageViewController visibleViewController](self, "visibleViewController");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "view");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "convertRect:fromView:", v36, v28, v30, v32, v34);
          v38 = v37;
          v40 = v39;
          v42 = v41;
          v44 = v43;

          -[TUPageViewController view](self, "view");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "bounds");
          v47 = v46;
          -[TUPageViewController view](self, "view");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "bounds");
          v100.size.height = v49;
          v100.origin.x = 0.0;
          v100.origin.y = 0.0;
          v96.origin.x = v38;
          v96.origin.y = v40;
          v96.size.width = v42;
          v96.size.height = v44;
          v100.size.width = v47;
          v97 = CGRectIntersection(v96, v100);
          width = v97.size.width;

          -[TUPageViewController view](self, "view");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "bounds");
          v53 = width / v52;

          -[TUPageViewController delegate](self, "delegate");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUPageViewController visibleViewController](self, "visibleViewController");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13 <= 0.0)
            v56 = 1;
          else
            v56 = 2;
          objc_msgSend(v54, "pageViewController:viewController:changedVisibilityFactor:scrollDirection:", self, v55, v56, v53);

          -[TUPageViewController secondaryVisibleViewController](self, "secondaryVisibleViewController");
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          if (v57)
          {
            -[TUPageViewController secondaryVisibleViewController](self, "secondaryVisibleViewController");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "view");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "frame");
            v61 = v60;
            v63 = v62;
            v65 = v64;
            v67 = v66;
            -[TUPageViewController view](self, "view");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "bounds");
            v70 = v69;
            -[TUPageViewController view](self, "view");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "bounds");
            v101.size.height = v72;
            v101.origin.y = 0.0;
            v98.origin.x = v61;
            v98.origin.y = v63;
            v98.size.width = v65;
            v98.size.height = v67;
            v101.origin.x = v5;
            v101.size.width = v70;
            v99 = CGRectIntersection(v98, v101);
            v73 = v99.size.width;

            -[TUPageViewController view](self, "view");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "bounds");
            v76 = v73 / v75;

            -[TUPageViewController delegate](self, "delegate");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            -[TUPageViewController secondaryVisibleViewController](self, "secondaryVisibleViewController");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "pageViewController:viewController:changedVisibilityFactor:scrollDirection:", self, v78, v56, v76);

          }
        }
        -[TUPageViewController visibleViewController](self, "visibleViewController");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "view");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "center");
        v82 = v81;
        -[TUPageViewController scrollView](self, "scrollView");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "bounds");
        v85 = v82 + v84 * -1.5;

        -[TUPageViewController visibleViewController](self, "visibleViewController");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "view");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "center");
        v89 = v88;
        -[TUPageViewController scrollView](self, "scrollView");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "bounds");
        v92 = v91;

        -[TUPageViewController visibleViewController](self, "visibleViewController");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5 <= v85)
        {
          -[TUPageViewController switchToPreviousViewController](self, "switchToPreviousViewController");
        }
        else
        {
          if (v5 < v89 + v92 * 0.5)
          {
LABEL_27:

            goto LABEL_28;
          }
          -[TUPageViewController switchToNextViewController](self, "switchToNextViewController");
        }
        -[TUPageViewController removeViewController:](self, "removeViewController:", v93);
        -[TUPageViewController setSecondaryVisibleViewController:](self, "setSecondaryVisibleViewController:", 0);
        goto LABEL_27;
      }
      if (v17 == v15)
        goto LABEL_16;
      -[TUPageViewController secondaryVisibleViewController](self, "secondaryVisibleViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUPageViewController removeViewController:](self, "removeViewController:", v18);

      -[TUPageViewController setSecondaryVisibleViewController:](self, "setSecondaryVisibleViewController:", v15);
      -[TUPageViewController secondaryVisibleViewController](self, "secondaryVisibleViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUPageViewController addViewController:fromScroll:](self, "addViewController:fromScroll:", v19, 1);

    }
    else
    {
      -[TUPageViewController setSecondaryVisibleViewController:](self, "setSecondaryVisibleViewController:", v15);
      -[TUPageViewController addViewController:fromScroll:](self, "addViewController:fromScroll:", v15, 1);
    }
    -[TUPageViewController secondaryVisibleViewController](self, "secondaryVisibleViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "beginAppearanceTransition:animated:", 1, 0);

    goto LABEL_16;
  }
LABEL_28:

}

- (BOOL)_shouldIgnoreDidScrollWithScrollView:(id)a3
{
  id v4;
  char v5;
  BOOL v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  if ((objc_msgSend(v4, "isDragging") & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isDecelerating");
  v6 = -[TUPageViewController _assistiveTechnologyIsRunning](self, "_assistiveTechnologyIsRunning");
  -[TUPageViewController visibleViewController](self, "visibleViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if ((v5 & 1) == 0 && !v6 && !-[TUPageViewController scrollViewStartedScrolling](self, "scrollViewStartedScrolling"))
    v8 = 1;

  return v8;
}

- (BOOL)_assistiveTechnologyIsRunning
{
  return UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning();
}

- (void)switchToNextViewController
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  UIViewController *v7;
  void *v8;
  UIViewController *visibleViewController;
  UIViewController *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  id v37;

  -[TUPageViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[TUPageViewController nextViewController](self, "nextViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TUPageViewController nextViewController](self, "nextViewController");
    v7 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    -[TUPageViewController visibleViewController](self, "visibleViewController");
    v37 = (id)objc_claimAutoreleasedReturnValue();
    -[TUPageViewController setNextViewController:](self, "setNextViewController:", 0);
    -[TUPageViewController visibleViewController](self, "visibleViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUPageViewController setPreviousViewController:](self, "setPreviousViewController:", v8);

    visibleViewController = self->_visibleViewController;
    self->_visibleViewController = v7;
    v10 = v7;

    -[TUPageViewController visibleViewController](self, "visibleViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUPageViewController setOriginalVisibleViewController:](self, "setOriginalVisibleViewController:", v11);

    -[TUPageViewController originalVisibleViewController](self, "originalVisibleViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v13, "setUserInteractionEnabled:", 0);

    -[TUPageViewController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[TUPageViewController delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pageViewController:didChangeVisibleViewControllerFromViewController:direction:", self, v37, 2);

    }
    -[TUPageViewController managePreviousAndNextViewController](self, "managePreviousAndNextViewController");
    -[TUPageViewController scrollView](self, "scrollView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentOffset");
    v18 = v17;

    -[TUPageViewController setCancelScrollViewDidScroll:](self, "setCancelScrollViewDidScroll:", 1);
    -[TUPageViewController nextViewController](self, "nextViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[TUPageViewController scrollView](self, "scrollView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "contentOffset");
      v22 = v21;
      v24 = v23;

      -[TUPageViewController scrollView](self, "scrollView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "bounds");
      v27 = v26 + v26;

      if (v22 < v27)
      {
LABEL_12:
        -[TUPageViewController setCancelScrollViewDidScroll:](self, "setCancelScrollViewDidScroll:", 0);

        return;
      }
      -[TUPageViewController scrollView](self, "scrollView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "bounds");
      v30 = v22 - v29;

    }
    else
    {
      v31 = v5 * 0.5;
      v32 = v5 * 0.5 + v18;
      -[TUPageViewController previousViewController](self, "previousViewController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      -[TUPageViewController scrollView](self, "scrollView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "contentOffset");
      v24 = v35;

      if (v33)
        v30 = v32 - v31;
      else
        v30 = v32 - v5 - v31;
    }
    -[TUPageViewController scrollView](self, "scrollView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setContentOffset:", v30, v24);

    goto LABEL_12;
  }
}

- (BOOL)canSwitchToPreviousViewController
{
  void *v2;
  BOOL v3;

  -[TUPageViewController previousViewController](self, "previousViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)canSwitchToNextViewController
{
  void *v2;
  BOOL v3;

  -[TUPageViewController nextViewController](self, "nextViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_keyboardSwitchGoingRight:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  double Width;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  CGRect v20;

  v3 = a3;
  if (!-[TUPageViewController scrollViewStartedScrolling](self, "scrollViewStartedScrolling")
    && -[TUPageViewController pagingEnabled](self, "pagingEnabled"))
  {
    v5 = -[TUPageViewController canSwitchToNextViewController](self, "canSwitchToNextViewController");
    v6 = -[TUPageViewController canSwitchToPreviousViewController](self, "canSwitchToPreviousViewController");
    if (v3 ? v5 : v6)
    {
      -[TUPageViewController visibleViewController](self, "visibleViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUPageViewController setOriginalVisibleViewController:](self, "setOriginalVisibleViewController:", v8);

      -[TUPageViewController scrollView](self, "scrollView");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bounds");
      Width = CGRectGetWidth(v20);
      if (v3)
        v10 = Width;
      else
        v10 = -Width;
      objc_msgSend(v19, "contentOffset");
      v12 = fmax(v10 + v11, 0.0);
      objc_msgSend(v19, "contentSize");
      v14 = v13 - Width;
      if (v12 >= v14)
        v15 = v14;
      else
        v15 = v12;
      objc_msgSend(v19, "contentOffset");
      v17 = v16;
      -[TUPageViewController handleScrollStart](self, "handleScrollStart");
      -[TUPageViewController scrollView](self, "scrollView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setContentOffset:animated:", 1, v15, v17);

    }
  }
}

- (void)keyboardOrActionSwitchToNextViewController
{
  -[TUPageViewController _keyboardSwitchGoingRight:](self, "_keyboardSwitchGoingRight:", 1);
}

- (void)keyboardOrActionSwitchToPreviousViewController
{
  -[TUPageViewController _keyboardSwitchGoingRight:](self, "_keyboardSwitchGoingRight:", 0);
}

- (void)switchToPreviousViewController
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  UIViewController *v10;
  void *v11;
  UIViewController *visibleViewController;
  UIViewController *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  id v29;

  -[TUPageViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[TUPageViewController scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentOffset");
  v8 = v7;

  -[TUPageViewController previousViewController](self, "previousViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[TUPageViewController previousViewController](self, "previousViewController");
    v10 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    -[TUPageViewController visibleViewController](self, "visibleViewController");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    -[TUPageViewController setPreviousViewController:](self, "setPreviousViewController:", 0);
    -[TUPageViewController visibleViewController](self, "visibleViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUPageViewController setNextViewController:](self, "setNextViewController:", v11);

    visibleViewController = self->_visibleViewController;
    self->_visibleViewController = v10;
    v13 = v10;

    -[TUPageViewController visibleViewController](self, "visibleViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUPageViewController setOriginalVisibleViewController:](self, "setOriginalVisibleViewController:", v14);

    -[TUPageViewController originalVisibleViewController](self, "originalVisibleViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v16, "setUserInteractionEnabled:", 0);

    -[TUPageViewController delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[TUPageViewController delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "pageViewController:didChangeVisibleViewControllerFromViewController:direction:", self, v29, 1);

    }
    -[TUPageViewController managePreviousAndNextViewController](self, "managePreviousAndNextViewController");
    -[TUPageViewController setCancelScrollViewDidScroll:](self, "setCancelScrollViewDidScroll:", 1);
    -[TUPageViewController previousViewController](self, "previousViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[TUPageViewController scrollView](self, "scrollView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "contentOffset");
    v23 = v22;
    if (v19)
    {
      v24 = v21;

      -[TUPageViewController scrollView](self, "scrollView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "bounds");
      v27 = v24 + v26;

    }
    else
    {

      v27 = v5 * 0.5 + v8 - v5 * 0.5;
    }
    -[TUPageViewController scrollView](self, "scrollView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setContentOffset:", v27, v23);

    -[TUPageViewController setCancelScrollViewDidScroll:](self, "setCancelScrollViewDidScroll:", 0);
  }
}

- (void)accessibilityHandleRequestToGoBackForPageViewControllerScrollView:(id)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  -[TUPageViewController keyboardOrActionSwitchToPreviousViewController](self, "keyboardOrActionSwitchToPreviousViewController", a3);
  v4 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__TUPageViewController_accessibilityHandleRequestToGoBackForPageViewControllerScrollView___block_invoke;
  block[3] = &unk_1E63095D0;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E0C80D38], block);
}

void __90__TUPageViewController_accessibilityHandleRequestToGoBackForPageViewControllerScrollView___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  void *v2;
  id v3;

  v1 = *MEMORY[0x1E0DC4578];
  objc_msgSend(*(id *)(a1 + 32), "visibleViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);

}

- (void)accessibilityHandleRequestToGoForewardForPageViewControllerScrollView:(id)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  -[TUPageViewController keyboardOrActionSwitchToNextViewController](self, "keyboardOrActionSwitchToNextViewController", a3);
  v4 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__TUPageViewController_accessibilityHandleRequestToGoForewardForPageViewControllerScrollView___block_invoke;
  block[3] = &unk_1E63095D0;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E0C80D38], block);
}

void __94__TUPageViewController_accessibilityHandleRequestToGoForewardForPageViewControllerScrollView___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  void *v2;
  id v3;

  v1 = *MEMORY[0x1E0DC4578];
  objc_msgSend(*(id *)(a1 + 32), "visibleViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);

}

- (void)transitionToSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  height = a3.height;
  width = a3.width;
  v31 = *MEMORY[0x1E0C80C00];
  -[TUPageViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  -[TUPageViewController scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUPageViewController calculateScrollViewFrameFromViewBounds:](self, "calculateScrollViewFrameFromViewBounds:", v8, v10, width, height);
  objc_msgSend(v11, "setFrame:");

  -[TUPageViewController childViewControllers](self, "childViewControllers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[TUPageViewController childViewControllers](self, "childViewControllers", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v19, "view");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bounds");
          v22 = v21;
          v24 = v23;

          objc_msgSend(v19, "view");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setBounds:", v22, v24, width, height);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v16);
    }

    -[TUPageViewController repositionPages](self, "repositionPages");
  }
  -[TUPageViewController updateScrollView](self, "updateScrollView");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  _QWORD aBlock[7];
  objc_super v23;
  CGRect v24;

  height = a3.height;
  width = a3.width;
  v23.receiver = self;
  v23.super_class = (Class)TUPageViewController;
  v7 = a4;
  -[TUPageViewController viewWillTransitionToSize:withTransitionCoordinator:](&v23, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[TUPageViewController scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isDecelerating"))
  {

LABEL_4:
    -[TUPageViewController visibleViewController](self, "visibleViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "center");
    v14 = v13;
    -[TUPageViewController visibleViewController](self, "visibleViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v17 = v14 - CGRectGetWidth(v24) * 0.5;
    -[TUPageViewController pageGutter](self, "pageGutter");
    v19 = v17 - v18 * 0.5;

    -[TUPageViewController scrollView](self, "scrollView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setContentOffset:animated:", 0, v19, 0.0);

    goto LABEL_5;
  }
  -[TUPageViewController scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isDragging");

  if (v10)
    goto LABEL_4;
LABEL_5:
  self->_isTransitioning = 1;
  self->_transitioningSize.width = width;
  self->_transitioningSize.height = height;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__TUPageViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  aBlock[3] = &unk_1E63095F8;
  aBlock[4] = self;
  *(double *)&aBlock[5] = width;
  *(double *)&aBlock[6] = height;
  v21 = _Block_copy(aBlock);
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v21, 0);

}

uint64_t __75__TUPageViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "transitionToSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 969) = 0;
  return result;
}

- (TUPageViewControllerDataSource)dataSource
{
  return (TUPageViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (TUPageViewControllerDelegate)delegate
{
  return (TUPageViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)visibleViewController
{
  return self->_visibleViewController;
}

- (UIViewController)secondaryVisibleViewController
{
  return self->_secondaryVisibleViewController;
}

- (UIViewController)previousViewController
{
  return self->_previousViewController;
}

- (void)setPreviousViewController:(id)a3
{
  objc_storeStrong((id *)&self->_previousViewController, a3);
}

- (UIViewController)nextViewController
{
  return self->_nextViewController;
}

- (void)setNextViewController:(id)a3
{
  objc_storeStrong((id *)&self->_nextViewController, a3);
}

- (double)pageGutter
{
  return self->_pageGutter;
}

- (TUPageViewControllerScrollView)scrollView
{
  return self->_scrollView;
}

- (OS_dispatch_group)idleDispatchGroup
{
  return self->_idleDispatchGroup;
}

- (UIViewController)managedForViewController
{
  return self->_managedForViewController;
}

- (void)setManagedForViewController:(id)a3
{
  objc_storeStrong((id *)&self->_managedForViewController, a3);
}

- (UIViewController)originalVisibleViewController
{
  return self->_originalVisibleViewController;
}

- (void)setOriginalVisibleViewController:(id)a3
{
  objc_storeStrong((id *)&self->_originalVisibleViewController, a3);
}

- (UIViewController)appearingViewController
{
  return self->_appearingViewController;
}

- (void)setAppearingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_appearingViewController, a3);
}

- (UIViewController)disappearingViewController
{
  return self->_disappearingViewController;
}

- (void)setDisappearingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_disappearingViewController, a3);
}

- (BOOL)cancelScrollViewDidScroll
{
  return self->_cancelScrollViewDidScroll;
}

- (void)setCancelScrollViewDidScroll:(BOOL)a3
{
  self->_cancelScrollViewDidScroll = a3;
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

- (CGSize)transitioningSize
{
  double width;
  double height;
  CGSize result;

  width = self->_transitioningSize.width;
  height = self->_transitioningSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)scrollViewStartedScrolling
{
  return self->_scrollViewStartedScrolling;
}

- (NSMutableArray)replayViewTransitions
{
  return self->_replayViewTransitions;
}

- (void)setReplayViewTransitions:(id)a3
{
  objc_storeStrong((id *)&self->_replayViewTransitions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replayViewTransitions, 0);
  objc_storeStrong((id *)&self->_disappearingViewController, 0);
  objc_storeStrong((id *)&self->_appearingViewController, 0);
  objc_storeStrong((id *)&self->_originalVisibleViewController, 0);
  objc_storeStrong((id *)&self->_managedForViewController, 0);
  objc_storeStrong((id *)&self->_idleDispatchGroup, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_nextViewController, 0);
  objc_storeStrong((id *)&self->_previousViewController, 0);
  objc_storeStrong((id *)&self->_secondaryVisibleViewController, 0);
  objc_storeStrong((id *)&self->_visibleViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
