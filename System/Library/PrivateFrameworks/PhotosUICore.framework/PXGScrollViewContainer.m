@implementation PXGScrollViewContainer

- (PXGScrollViewContainer)initWithFrame:(CGRect)a3
{
  PXGScrollViewContainer *v3;
  uint64_t v4;
  PXUpdater *updater;
  PXUIScrollViewController *v6;
  PXUIScrollViewController *v7;
  void *v8;
  PXScrollViewController *scrollViewController;
  PXUIScrollViewController *v10;
  uint64_t v11;
  PXScrollViewSpeedometer *speedometer;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXGScrollViewContainer;
  v3 = -[PXGScrollViewContainer initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v3, sel__setNeedsUpdate);
    updater = v3->_updater;
    v3->_updater = (PXUpdater *)v4;

    -[PXUpdater addUpdateSelector:needsUpdate:](v3->_updater, "addUpdateSelector:needsUpdate:", sel__updateScrollViewController, 1);
    -[PXUpdater addUpdateSelector:needsUpdate:](v3->_updater, "addUpdateSelector:needsUpdate:", sel__updateScrollViewDecelerationRate, 1);
    v6 = [PXUIScrollViewController alloc];
    -[PXGScrollViewContainer bounds](v3, "bounds");
    v7 = -[PXUIScrollViewController initWithFrame:](v6, "initWithFrame:");
    -[PXUIScrollViewController setFocusItemProvider:](v7, "setFocusItemProvider:", v3);
    -[PXUIScrollViewController scrollView](v7, "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAutoresizingMask:", 18);
    scrollViewController = v3->_scrollViewController;
    v3->_scrollViewController = &v7->super;
    v10 = v7;

    -[PXScrollViewController registerObserver:](v3->_scrollViewController, "registerObserver:", v3);
    -[PXGScrollViewContainer addSubview:](v3, "addSubview:", v8);
    v11 = objc_msgSend(objc_alloc((Class)off_1E50B47A0), "initWithScrollController:", v3->_scrollViewController);
    speedometer = v3->_speedometer;
    v3->_speedometer = (PXScrollViewSpeedometer *)v11;

    -[PXScrollViewSpeedometer registerChangeObserver:context:](v3->_speedometer, "registerChangeObserver:context:", v3, SpeedometerObservationContext);
  }
  return v3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  void *v7;
  BOOL v8;
  CGPoint v10;
  CGRect v11;

  y = a3.y;
  x = a3.x;
  -[PXGScrollViewContainer bounds](self, "bounds", a4);
  -[PXGScrollViewContainer scrollViewModel](self, "scrollViewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hitTestContentInsets");
  PXEdgeInsetsInsetRect();
  v10.x = x;
  v10.y = y;
  v8 = CGRectContainsPoint(v11, v10);

  return v8;
}

- (void)setScrollViewModel:(id)a3
{
  PXGScrollViewModel *v5;
  PXGScrollViewModel *scrollViewModel;
  PXGScrollViewModel *v7;

  v5 = (PXGScrollViewModel *)a3;
  scrollViewModel = self->_scrollViewModel;
  if (scrollViewModel != v5)
  {
    v7 = v5;
    -[PXGScrollViewModel unregisterChangeObserver:context:](scrollViewModel, "unregisterChangeObserver:context:", self, ScrollViewModelObservationContext);
    objc_storeStrong((id *)&self->_scrollViewModel, a3);
    -[PXGScrollViewModel registerChangeObserver:context:](self->_scrollViewModel, "registerChangeObserver:context:", self, ScrollViewModelObservationContext);
    -[PXGScrollViewContainer _invalidateScrollViewController](self, "_invalidateScrollViewController");
    -[PXGScrollViewContainer _invalidateScrollViewDecelerationRate](self, "_invalidateScrollViewDecelerationRate");
    v5 = v7;
  }

}

- (void)setDelegate:(id)a3
{
  PXGScrollViewContainerDelegate *v5;
  $128C24D4106CDDDAD74AF69DC7C067E8 *p_delegateRespondsTo;
  BOOL v7;
  PXGScrollViewContainerDelegate *v8;

  v5 = (PXGScrollViewContainerDelegate *)a3;
  if (self->_delegate != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_delegate, a3);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->willBeginScrolling = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->didScroll = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->willEndScrollingWithVelocityTargetContentOffsetCurrentContentOffset = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->didEndScrolling = objc_opt_respondsToSelector() & 1;
    v7 = objc_opt_respondsToSelector() & 1;
    v5 = v8;
    p_delegateRespondsTo->focusItemsInRect = v7;
  }

}

- (void)_willLayout
{
  id v2;

  -[PXGScrollViewContainer updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateIfNeeded");

}

- (void)layoutSubviews
{
  objc_super v3;

  -[PXGScrollViewContainer _willLayout](self, "_willLayout");
  v3.receiver = self;
  v3.super_class = (Class)PXGScrollViewContainer;
  -[PXGScrollViewContainer layoutSubviews](&v3, sel_layoutSubviews);
}

- (void)setAlpha:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGScrollViewContainer;
  -[PXGScrollViewContainer setAlpha:](&v5, sel_setAlpha_);
  -[PXGScrollViewContainer setHidden:](self, "setHidden:", a3 == 0.0);
}

- (BOOL)isRTL
{
  return -[PXGScrollViewContainer effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1;
}

- (void)_invalidateScrollViewController
{
  id v2;

  -[PXGScrollViewContainer updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateScrollViewController);

}

- (void)_updateScrollViewController
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
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
  double v24;
  double v25;
  double v26;
  id v27;

  -[PXGScrollViewContainer scrollViewController](self, "scrollViewController");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  -[PXGScrollViewContainer scrollViewModel](self, "scrollViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isUpdatingScrollViewController = 1;
  objc_msgSend(v3, "contentSize");
  PXRectWithOriginAndSize();
  objc_msgSend(v27, "setContentBounds:");
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  v7 = v6;
  if (-[PXGScrollViewContainer shouldFlipContentOffset](self, "shouldFlipContentOffset"))
  {
    objc_msgSend(v3, "contentOffset");
    objc_msgSend(v27, "contentBounds");
    -[PXGScrollViewContainer bounds](self, "bounds");
    PXContentOffsetFlippedHorizontally();
    v5 = v8;
    v7 = v9;
  }
  objc_msgSend(v27, "setVisibleOrigin:", v5, v7);
  if (v3)
    v10 = objc_msgSend(v3, "clipsToBounds");
  else
    v10 = 1;
  objc_msgSend(v27, "setClipsToBounds:", v10);
  objc_msgSend(v27, "setShowsHorizontalScrollIndicator:", objc_msgSend(v3, "showsHorizontalScrollIndicator"));
  objc_msgSend(v27, "setShowsVerticalScrollIndicator:", objc_msgSend(v3, "showsVerticalScrollIndicator"));
  objc_msgSend(v27, "setDraggingPerformsScroll:", objc_msgSend(v3, "draggingPerformsScroll"));
  objc_msgSend(v3, "horizontalInterPageSpacing");
  objc_msgSend(v27, "setHorizontalInterPageSpacing:");
  objc_msgSend(v27, "setAlwaysBounceHorizontal:", objc_msgSend(v3, "alwaysBounceHorizontal"));
  objc_msgSend(v27, "setAlwaysBounceVertical:", objc_msgSend(v3, "alwaysBounceVertical"));
  objc_msgSend(v27, "setTransfersScrollToContainer:", objc_msgSend(v3, "transfersScrollToContainer"));
  objc_msgSend(v3, "horizontalScrollIndicatorInsets");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v3, "verticalScrollIndicatorInsets");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  objc_msgSend(v27, "setHorizontalScrollIndicatorInsets:", v12, v14, v16, v18);
  objc_msgSend(v27, "setVerticalScrollIndicatorInsets:", v20, v22, v24, v26);
  objc_msgSend(v3, "hitTestContentInsets");
  objc_msgSend(v27, "setHitTestContentInsets:");
  self->_isUpdatingScrollViewController = 0;

}

- (void)_invalidateScrollViewDecelerationRate
{
  id v2;

  -[PXGScrollViewContainer updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateScrollViewDecelerationRate);

}

- (void)_updateScrollViewDecelerationRate
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PXGScrollViewContainer scrollViewModel](self, "scrollViewModel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v8, "scrollDecelerationRate");
  if (v3 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXScrollViewDecelerationRate PXScrollViewDecelerationRateFromPXGScrollDecelerationRate(PXGScrollDecelerationRate)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGScrollViewContainer.m"), 28, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v4 = v3;
  -[PXGScrollViewContainer scrollViewController](self, "scrollViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDecelerationRate:", v4);

}

- (void)_invalidateScrollViewModel
{
  if (!self->_isUpdatingScrollViewController)
    -[PXGScrollViewContainer _updateScrollViewModel](self, "_updateScrollViewModel");
}

- (void)_updateScrollViewModel
{
  void *v3;
  _QWORD v4[5];

  -[PXGScrollViewContainer scrollViewModel](self, "scrollViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__PXGScrollViewContainer__updateScrollViewModel__block_invoke;
  v4[3] = &unk_1E511B380;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:options:", v4, 2);

}

- (void)setUserData:(id)a3
{
  PXGScrollViewContainerConfiguration *v4;
  void *v5;
  BOOL v6;
  PXGScrollViewContainerConfiguration *v7;
  PXGScrollViewContainerConfiguration *userData;
  void *v9;
  PXGScrollViewContainerConfiguration *v10;

  v10 = (PXGScrollViewContainerConfiguration *)a3;
  v4 = self->_userData;
  v5 = v10;
  if (v4 == v10)
    goto LABEL_4;
  v6 = -[PXGScrollViewContainerConfiguration isEqual:](v10, "isEqual:", v4);

  if (!v6)
  {
    v7 = (PXGScrollViewContainerConfiguration *)-[PXGScrollViewContainerConfiguration copy](v10, "copy");
    userData = self->_userData;
    self->_userData = v7;

    -[PXGScrollViewContainerConfiguration scrollViewModel](self->_userData, "scrollViewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGScrollViewContainer setScrollViewModel:](self, "setScrollViewModel:", v9);

    -[PXGScrollViewContainerConfiguration delegate](self->_userData, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGScrollViewContainer setDelegate:](self, "setDelegate:", v5);
LABEL_4:

  }
}

- (void)prepareForReuse
{
  -[PXGScrollViewContainer setUserData:](self, "setUserData:", 0);
}

- (void)addHostedView:(id)a3
{
  -[PXScrollViewController addSubview:](self->_scrollViewController, "addSubview:", a3);
}

- (void)addHostedLayer:(id)a3
{
  -[PXScrollViewController addFloatingSublayer:forAxis:](self->_scrollViewController, "addFloatingSublayer:forAxis:", a3, 1);
}

- (CGPoint)convertHostedChildCenter:(CGPoint)a3 fromGlobalLayer:(id)a4
{
  double y;
  double x;
  PXScrollViewController *scrollViewController;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  scrollViewController = self->_scrollViewController;
  v7 = a4;
  -[PXScrollViewController scrollView](scrollViewController, "scrollView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "convertPoint:fromLayer:", v7, x, y);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  id v9;
  char v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v9 = a3;
  if ((void *)ScrollViewModelObservationContext == a5)
  {
    v13 = v9;
    v10 = objc_msgSend(v9, "changesOptions");
    if ((v6 & 0xFFE3) != 0 && (v10 & 2) == 0)
      -[PXGScrollViewContainer _invalidateScrollViewController](self, "_invalidateScrollViewController");
    if ((v6 & 8) != 0)
      -[PXGScrollViewContainer _invalidateScrollViewDecelerationRate](self, "_invalidateScrollViewDecelerationRate");
    v9 = v13;
    if ((v6 & 0x10) != 0)
    {
      -[PXGScrollViewContainer scrollViewController](self, "scrollViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stopScrollingAndZoomingAnimations");

      goto LABEL_12;
    }
  }
  else
  {
    if ((void *)SpeedometerObservationContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGScrollViewContainer.m"), 320, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 2) != 0)
    {
      v13 = v9;
      -[PXGScrollViewContainer _invalidateScrollViewModel](self, "_invalidateScrollViewModel");
LABEL_12:
      v9 = v13;
    }
  }

}

- (void)scrollViewControllerWillBeginScrolling:(id)a3
{
  id v4;

  if (self->_delegateRespondsTo.willBeginScrolling)
  {
    -[PXGScrollViewContainer delegate](self, "delegate", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scrollViewContainerWillBeginScrolling:", self);

  }
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  void *v4;

  if (self->_delegateRespondsTo.didScroll)
  {
    -[PXGScrollViewContainer delegate](self, "delegate", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scrollViewContainerDidScroll:", self);

  }
  -[PXGScrollViewContainer _invalidateScrollViewModel](self, "_invalidateScrollViewModel", a3);
}

- (void)scrollViewControllerWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6
{
  double y;
  double x;
  double v9;
  double v10;
  id v12;
  _BOOL4 v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  CGFloat v21;
  CGFloat v22;
  void *v23;
  id v24;

  y = a6.y;
  x = a6.x;
  v9 = a4.y;
  v10 = a4.x;
  v12 = a3;
  if (self->_delegateRespondsTo.willEndScrollingWithVelocityTargetContentOffsetCurrentContentOffset)
  {
    v24 = v12;
    v13 = -[PXGScrollViewContainer shouldFlipContentOffset](self, "shouldFlipContentOffset");
    objc_msgSend(v24, "contentBounds");
    -[PXGScrollViewContainer bounds](self, "bounds");
    if (v13)
    {
      PXContentOffsetFlippedHorizontally();
      a5->x = v14;
      a5->y = v15;
      PXVelocityFlippedHorizontally();
      v17 = v16;
      v19 = v18;
      -[PXGScrollViewContainer delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "scrollViewContainerWillEndScrolling:withVelocity:targetContentOffset:currentContentOffset:", self, a5, v17, v19, x, y);

      PXContentOffsetFlippedHorizontally();
      a5->x = v21;
      a5->y = v22;
    }
    else
    {
      -[PXGScrollViewContainer delegate](self, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "scrollViewContainerWillEndScrolling:withVelocity:targetContentOffset:currentContentOffset:", self, a5, v10, v9, x, y);

    }
    v12 = v24;
  }

}

- (void)scrollViewControllerDidEndScrolling:(id)a3
{
  id v4;

  if (self->_delegateRespondsTo.didEndScrolling)
  {
    -[PXGScrollViewContainer delegate](self, "delegate", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scrollViewContainerDidEndScrolling:", self);

  }
}

- (id)focusItemsForScrollViewController:(id)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;

  if (self->_delegateRespondsTo.focusItemsInRect)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    -[PXGScrollViewContainer delegate](self, "delegate", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "focusItemsForScrollViewContainer:inRect:", self, x, y, width, height);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v10;
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (PXGScrollViewContainerConfiguration)userData
{
  return self->_userData;
}

- (PXScrollViewController)scrollViewController
{
  return self->_scrollViewController;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXScrollViewSpeedometer)speedometer
{
  return self->_speedometer;
}

- (PXGScrollViewModel)scrollViewModel
{
  return self->_scrollViewModel;
}

- (PXGScrollViewContainerDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_scrollViewModel, 0);
  objc_storeStrong((id *)&self->_speedometer, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_scrollViewController, 0);
  objc_storeStrong((id *)&self->_userData, 0);
}

void __48__PXGScrollViewContainer__updateScrollViewModel__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "scrollViewController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "visibleOrigin");
  v6 = v5;
  v8 = v7;
  if (objc_msgSend(*(id *)(a1 + 32), "shouldFlipContentOffset"))
  {
    objc_msgSend(v12, "visibleOrigin");
    objc_msgSend(v12, "contentBounds");
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    PXContentOffsetFlippedHorizontally();
    v6 = v9;
    v8 = v10;
  }
  objc_msgSend(v4, "setContentOffset:", v6, v8);
  objc_msgSend(*(id *)(a1 + 32), "speedometer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollRegime:", objc_msgSend(v11, "regime"));

}

@end
