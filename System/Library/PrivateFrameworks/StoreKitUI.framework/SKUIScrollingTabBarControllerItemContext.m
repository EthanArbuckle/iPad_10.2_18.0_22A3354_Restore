@implementation SKUIScrollingTabBarControllerItemContext

- (SKUIScrollingTabBarControllerItemContext)init
{
  return -[SKUIScrollingTabBarControllerItemContext initWithViewController:](self, "initWithViewController:", 0);
}

- (SKUIScrollingTabBarControllerItemContext)initWithViewController:(id)a3
{
  id v5;
  SKUIScrollingTabBarControllerItemContext *v6;
  SKUIScrollingTabBarControllerItemContext *v7;
  objc_super v9;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIScrollingTabBarControllerItemContext initWithViewController:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIScrollingTabBarControllerItemContext;
  v6 = -[SKUIScrollingTabBarControllerItemContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_viewController, a3);
      v7->_viewControllerIsNavigationController = -1;
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIScrollingTabBarControllerItemContext prepareViewControllerForTearDown](self, "prepareViewControllerForTearDown");
  v3.receiver = self;
  v3.super_class = (Class)SKUIScrollingTabBarControllerItemContext;
  -[SKUIScrollingTabBarControllerItemContext dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  objc_super v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)_SKUIScrollingTabNestedPagingScrollViewContentOffsetObservingContext == a6)
  {
    if (!self->_adjustingNestedPagingScrollViewContentOffset)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "scrollingTabBarControllerItemContextRequestsContentOffsetUpdate:", self);

    }
  }
  else if ((void *)_SKUIScrollingTabNestedPagingScrollViewContentSizeObservingContext == a6)
  {
    -[SKUIScrollingTabBarControllerItemContext _notifyDelegateOfUpdatedContentWidthInObservedNestedPagingScrollView](self, "_notifyDelegateOfUpdatedContentWidthInObservedNestedPagingScrollView");
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SKUIScrollingTabBarControllerItemContext;
    -[SKUIScrollingTabBarControllerItemContext observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)observedNavigationStackDidChange:(id)a3
{
  void *v4;
  UIScrollView *v5;
  id WeakRetained;
  id v7;

  v7 = a3;
  -[SKUIScrollingTabBarControllerItemContext _nestedPagedScrollingConformingViewControllerForcingViewLoading:](self, "_nestedPagedScrollingConformingViewControllerForcingViewLoading:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollingTabNestedPagingScrollView");
  v5 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
  if (v5 != self->_observedNestedPagingScrollView)
    -[SKUIScrollingTabBarControllerItemContext updateForPossibleNestedPagingScrollViewChange](self, "updateForPossibleNestedPagingScrollViewChange");
  -[SKUIScrollingTabBarControllerItemContext _updateAppliedContentInsetsAdjustment](self, "_updateAppliedContentInsetsAdjustment");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "scrollingTabBarControllerItemContext:observedNavigationStackDidChange:", self, v7);

}

- (UIScrollView)nestedPagingScrollView
{
  return self->_observedNestedPagingScrollView;
}

- (double)nestedPagingScrollViewContentWidth
{
  UIScrollView *observedNestedPagingScrollView;
  double result;

  observedNestedPagingScrollView = self->_observedNestedPagingScrollView;
  if (!observedNestedPagingScrollView)
    return 0.0;
  -[UIScrollView contentSize](observedNestedPagingScrollView, "contentSize");
  self->_lastSeenContentWidth = result;
  return result;
}

- (BOOL)viewControllerIsNavigationController
{
  int viewControllerIsNavigationController;
  char isKindOfClass;

  viewControllerIsNavigationController = self->_viewControllerIsNavigationController;
  if (viewControllerIsNavigationController < 0)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    viewControllerIsNavigationController = isKindOfClass & 1;
    self->_viewControllerIsNavigationController = isKindOfClass & 1;
  }
  return viewControllerIsNavigationController != 0;
}

- (void)applyNewContentInsetDescriptor:(id *)a3
{
  __int128 v3;
  __int128 v4;

  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_desiredContentInsetAdjustmentDescriptor.contentInset.top, *(float64x2_t *)&a3->var0.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_desiredContentInsetAdjustmentDescriptor.contentInset.bottom, *(float64x2_t *)&a3->var0.bottom))), 0xFuLL))) & 1) == 0|| vabdd_f64(self->_desiredContentInsetAdjustmentDescriptor.bottomInsetValueAddedForScrollingTabBar, a3->var1) > 0.00000011920929)
  {
    v3 = *(_OWORD *)&a3->var0.top;
    v4 = *(_OWORD *)&a3->var0.bottom;
    self->_desiredContentInsetAdjustmentDescriptor.bottomInsetValueAddedForScrollingTabBar = a3->var1;
    *(_OWORD *)&self->_desiredContentInsetAdjustmentDescriptor.contentInset.top = v3;
    *(_OWORD *)&self->_desiredContentInsetAdjustmentDescriptor.contentInset.bottom = v4;
    -[SKUIScrollingTabBarControllerItemContext _updateAppliedContentInsetsAdjustment](self, "_updateAppliedContentInsetsAdjustment");
  }
}

- (void)notifyOfUpdatedAppearanceStatus:(id)a3
{
  uint64_t v3;
  double var0;
  void *v6;
  id v7;

  v3 = *(_QWORD *)&a3.var1;
  var0 = a3.var0;
  if (vabdd_f64(self->_lastSentAppearanceStatus.progress, a3.var0) > 0.00000011920929
    || a3.var1 != self->_lastSentAppearanceStatus.isBouncingOffTheEdge)
  {
    -[SKUIScrollingTabBarControllerItemContext _appearanceStatusObserver](self, "_appearanceStatusObserver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "scrollingTabAppearanceStatusWasUpdated:", *(_QWORD *)&var0, v3);
      v6 = v7;
      self->_lastSentAppearanceStatus.progress = var0;
      *(_QWORD *)&self->_lastSentAppearanceStatus.isBouncingOffTheEdge = v3;
    }

  }
}

- (void)prepareViewControllerForDisplayWithSize:(CGSize)a3
{
  -[SKUIScrollingTabBarControllerItemContext _prepareViewControllerForDisplayWithViewFrame:updateContentOffset:contentOffset:](self, "_prepareViewControllerForDisplayWithViewFrame:updateContentOffset:contentOffset:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), a3.width, a3.height, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)updateForPossibleNestedPagingScrollViewChange
{
  UIScrollView *observedNestedPagingScrollView;
  id v4;

  observedNestedPagingScrollView = self->_observedNestedPagingScrollView;
  if (observedNestedPagingScrollView)
    -[UIScrollView contentOffset](self->_observedNestedPagingScrollView, "contentOffset");
  -[SKUIScrollingTabBarControllerItemContext _prepareViewControllerForTearDown](self, "_prepareViewControllerForTearDown");
  -[UIViewController view](self->_viewController, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  -[SKUIScrollingTabBarControllerItemContext _prepareViewControllerForDisplayWithViewFrame:updateContentOffset:contentOffset:](self, "_prepareViewControllerForDisplayWithViewFrame:updateContentOffset:contentOffset:", observedNestedPagingScrollView != 0);

}

- (void)updateNestedPagingScrollViewContentOffset:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;

  y = a3.y;
  x = a3.x;
  if (self->_adjustingNestedPagingScrollViewContentOffset)
  {
    -[SKUIScrollingTabBarControllerItemContext nestedPagingScrollView](self, "nestedPagingScrollView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContentOffset:", x, y);

  }
  else
  {
    self->_adjustingNestedPagingScrollViewContentOffset = 1;
    -[SKUIScrollingTabBarControllerItemContext nestedPagingScrollView](self, "nestedPagingScrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentOffset:", x, y);

    self->_adjustingNestedPagingScrollViewContentOffset = 0;
  }
}

- (id)viewControllerInNestedPagingScrollViewAtPageIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[SKUIScrollingTabBarControllerItemContext _nestedPagedScrollingConformingViewControllerForcingViewLoading:](self, "_nestedPagedScrollingConformingViewControllerForcingViewLoading:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollingTabViewControllerInNestedPagingScrollViewAtPageIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_appearanceStatusObserver
{
  _BOOL4 v3;
  UIViewController *viewController;
  UIViewController *v5;
  void *v6;
  void *v7;
  UIViewController *v8;

  v3 = -[SKUIScrollingTabBarControllerItemContext viewControllerIsNavigationController](self, "viewControllerIsNavigationController");
  viewController = self->_viewController;
  if (v3)
  {
    v5 = viewController;
    -[UIViewController viewControllers](v5, "viewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v6) = objc_msgSend(v7, "conformsToProtocol:", &unk_1EF448B10);
    if ((_DWORD)v6)
      v8 = v7;
    else
      v8 = 0;

  }
  else if (-[UIViewController conformsToProtocol:](viewController, "conformsToProtocol:", &unk_1EF448B10))
  {
    v8 = self->_viewController;
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)_applyNewContentInset:(UIEdgeInsets)a3 withOldContentInset:(UIEdgeInsets)a4 toContentScrollView:(id)a5
{
  double right;
  double bottom;
  double left;
  double top;
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
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;

  if (a4.left != a3.left || a4.top != a3.top || a4.right != a3.right || a4.bottom != a3.bottom)
  {
    right = a4.right;
    bottom = a4.bottom;
    left = a4.left;
    top = a4.top;
    v12 = a3.right;
    v13 = a3.bottom;
    v14 = a3.left;
    v15 = a3.top;
    v36 = a5;
    objc_msgSend(v36, "contentInset");
    v26 = v16;
    v27 = v17;
    v28 = v18;
    v29 = v19;
    objc_msgSend(v36, "scrollIndicatorInsets");
    v30 = v20;
    v31 = v21;
    v32 = v22;
    v33 = v23;
    objc_msgSend(v36, "contentOffset");
    v34 = v25;
    v35 = v24;
    objc_msgSend(v36, "setContentInset:", v15 + v26 - top, v14 + v27 - left, v13 + v28 - bottom, v12 + v29 - right);
    objc_msgSend(v36, "setScrollIndicatorInsets:", v15 + v30 - top, v14 + v31 - left, v13 + v32 - bottom, v12 + v33 - right);
    objc_msgSend(v36, "setContentOffset:", v35, top + v34 - v15);

  }
}

- (id)_nestedPagedScrollingConformingViewControllerForcingViewLoading:(BOOL)a3
{
  _BOOL4 v3;
  UIViewController *viewController;
  id v6;
  _BOOL4 v7;
  UIViewController *v8;
  UIViewController *v9;
  void *v10;
  void *v11;
  id v12;
  UIViewController *v13;

  v3 = a3;
  viewController = self->_viewController;
  if (a3)
  {
    v6 = -[UIViewController view](viewController, "view");
  }
  else if (!-[UIViewController isViewLoaded](viewController, "isViewLoaded"))
  {
LABEL_9:
    v13 = 0;
    goto LABEL_15;
  }
  v7 = -[SKUIScrollingTabBarControllerItemContext viewControllerIsNavigationController](self, "viewControllerIsNavigationController");
  v8 = self->_viewController;
  if (!v7)
  {
    if (-[UIViewController conformsToProtocol:](v8, "conformsToProtocol:", &unk_1EF448BD8))
    {
      v13 = self->_viewController;
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  v9 = v8;
  -[UIViewController viewControllers](v9, "viewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v12 = (id)objc_msgSend(v11, "view");
  }
  else if (!objc_msgSend(v11, "isViewLoaded"))
  {
LABEL_13:
    v13 = 0;
    goto LABEL_14;
  }
  if (!objc_msgSend(v11, "conformsToProtocol:", &unk_1EF448BD8))
    goto LABEL_13;
  v13 = v11;
LABEL_14:

LABEL_15:
  if (!+[SKUIScrollingTabBarController areScrollingTabsAllowed](SKUIScrollingTabBarController, "areScrollingTabsAllowed"))
  {

    v13 = 0;
  }
  return v13;
}

- (void)_notifyDelegateOfUpdatedContentWidthInObservedNestedPagingScrollView
{
  double v3;
  id WeakRetained;

  -[UIScrollView contentSize](self->_observedNestedPagingScrollView, "contentSize");
  if (vabdd_f64(v3, self->_lastSeenContentWidth) > 0.00000011920929)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "scrollingTabBarControllerItemContextRequestsContentSizeUpdate:", self);

  }
}

- (void)_prepareViewControllerForDisplayWithViewFrame:(CGRect)a3 updateContentOffset:(BOOL)a4 contentOffset:(CGPoint)a5
{
  double y;
  double x;
  _BOOL4 v7;
  double height;
  double width;
  double v10;
  double v11;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  unint64_t v17;
  void *v18;
  id v19;
  CGRect v20;

  if (!self->_readyForDisplay)
  {
    y = a5.y;
    x = a5.x;
    v7 = a4;
    height = a3.size.height;
    width = a3.size.width;
    v10 = a3.origin.y;
    v11 = a3.origin.x;
    -[SKUIScrollingTabBarControllerItemContext _nestedPagedScrollingConformingViewControllerForcingViewLoading:](self, "_nestedPagedScrollingConformingViewControllerForcingViewLoading:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v13;
    if (v13)
    {
      objc_msgSend(v13, "scrollingTabNestedPagingScrollView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14 != 0;
      if (v14)
      {
        -[UIViewController view](self->_viewController, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "autoresizingMask");
        self->_originalAutoresizingMask = v17;
        objc_msgSend(v16, "setAutoresizingMask:", v17 & 0xFFFFFFFFFFFFFFFDLL);
        objc_msgSend(v16, "setFrame:", v11, v10, width, height);
        if (v7)
          objc_msgSend(v14, "setContentOffset:", x, y);
        objc_msgSend(v16, "layoutIfNeeded");
        if (self->_lastSeenContentWidth < 0.00000011920929)
        {
          v20.origin.x = v11;
          v20.origin.y = v10;
          v20.size.width = width;
          v20.size.height = height;
          self->_lastSeenContentWidth = CGRectGetWidth(v20);
        }
        objc_msgSend(v14, "setPagingEnabled:", 0);
        objc_msgSend(v14, "panGestureRecognizer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_setCanPanHorizontally:", 0);

        objc_msgSend(v14, "addObserver:forKeyPath:options:context:", self, CFSTR("contentOffset"), 0, _SKUIScrollingTabNestedPagingScrollViewContentOffsetObservingContext);
        objc_msgSend(v14, "addObserver:forKeyPath:options:context:", self, CFSTR("contentSize"), 0, _SKUIScrollingTabNestedPagingScrollViewContentSizeObservingContext);
        objc_storeStrong((id *)&self->_observedNestedPagingScrollView, v14);

      }
    }
    else
    {
      v15 = 0;
    }
    if (-[UIViewController conformsToProtocol:](self->_viewController, "conformsToProtocol:", &unk_1EF4AAE30))-[UIViewController setNavigationStackObserver:](self->_viewController, "setNavigationStackObserver:", self);
    self->_readyForDisplay = 1;
    if (v15)
      -[SKUIScrollingTabBarControllerItemContext _notifyDelegateOfUpdatedContentWidthInObservedNestedPagingScrollView](self, "_notifyDelegateOfUpdatedContentWidthInObservedNestedPagingScrollView");

  }
}

- (void)_prepareViewControllerForTearDown
{
  void *v3;
  void *v4;
  UIScrollView *observedNestedPagingScrollView;
  UIScrollView *v6;

  if (self->_readyForDisplay)
  {
    v6 = self->_observedNestedPagingScrollView;
    if (v6)
    {
      -[UIScrollView removeObserver:forKeyPath:context:](v6, "removeObserver:forKeyPath:context:", self, CFSTR("contentSize"), _SKUIScrollingTabNestedPagingScrollViewContentSizeObservingContext);
      -[UIScrollView removeObserver:forKeyPath:context:](v6, "removeObserver:forKeyPath:context:", self, CFSTR("contentOffset"), _SKUIScrollingTabNestedPagingScrollViewContentOffsetObservingContext);
      -[UIScrollView panGestureRecognizer](v6, "panGestureRecognizer");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_setCanPanHorizontally:", 1);

      -[UIScrollView setPagingEnabled:](v6, "setPagingEnabled:", 1);
      -[UIViewController view](self->_viewController, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAutoresizingMask:", self->_originalAutoresizingMask);

      observedNestedPagingScrollView = self->_observedNestedPagingScrollView;
      self->_observedNestedPagingScrollView = 0;
      self->_originalAutoresizingMask = 0;

    }
    if (-[UIViewController conformsToProtocol:](self->_viewController, "conformsToProtocol:", &unk_1EF4AAE30))-[UIViewController setNavigationStackObserver:](self->_viewController, "setNavigationStackObserver:", 0);
    self->_readyForDisplay = 0;

  }
}

- (void)_updateAppliedContentInsetsAdjustment
{
  _BOOL4 v3;
  UIViewController *viewController;
  UIViewController *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIScrollView *insetAdjustedContentScrollView;
  _OWORD *v10;
  __int128 v11;
  int v12;
  int v13;
  CGFloat top;
  CGFloat left;
  CGFloat right;
  double bottom;
  void *v18;
  id obja;
  id obj;

  v3 = -[SKUIScrollingTabBarControllerItemContext viewControllerIsNavigationController](self, "viewControllerIsNavigationController");
  viewController = self->_viewController;
  if (v3)
  {
    v5 = viewController;
    -[UIViewController viewControllers](v5, "viewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "contentScrollView");
    obja = (id)objc_claimAutoreleasedReturnValue();

    v8 = (uint64_t)obja;
  }
  else
  {
    -[UIViewController contentScrollView](viewController, "contentScrollView");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  insetAdjustedContentScrollView = self->_insetAdjustedContentScrollView;
  obj = (id)v8;
  if (insetAdjustedContentScrollView != (UIScrollView *)v8)
  {
    v10 = (_OWORD *)MEMORY[0x1E0DC49E8];
    if (insetAdjustedContentScrollView)
      -[SKUIScrollingTabBarControllerItemContext _applyNewContentInset:withOldContentInset:toContentScrollView:](self, "_applyNewContentInset:withOldContentInset:toContentScrollView:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24), self->_appliedContentInsetsAdjustment.top, self->_appliedContentInsetsAdjustment.left, self->_appliedContentInsetsAdjustment.bottom, self->_appliedContentInsetsAdjustment.right);
    v11 = v10[1];
    *(_OWORD *)&self->_appliedContentInsetsAdjustment.top = *v10;
    *(_OWORD *)&self->_appliedContentInsetsAdjustment.bottom = v11;
    objc_storeStrong((id *)&self->_insetAdjustedContentScrollView, obj);
  }
  v12 = -[UIViewController conformsToProtocol:](self->_viewController, "conformsToProtocol:", &unk_1EF4AAD10);
  v13 = v12;
  if (self->_insetAdjustedContentScrollView)
  {
    top = self->_desiredContentInsetAdjustmentDescriptor.contentInset.top;
    left = self->_desiredContentInsetAdjustmentDescriptor.contentInset.left;
    bottom = self->_desiredContentInsetAdjustmentDescriptor.contentInset.bottom;
    right = self->_desiredContentInsetAdjustmentDescriptor.contentInset.right;
    if (v12)
      bottom = bottom - self->_desiredContentInsetAdjustmentDescriptor.bottomInsetValueAddedForScrollingTabBar;
    -[SKUIScrollingTabBarControllerItemContext _applyNewContentInset:withOldContentInset:toContentScrollView:](self, "_applyNewContentInset:withOldContentInset:toContentScrollView:", self->_desiredContentInsetAdjustmentDescriptor.contentInset.top, self->_desiredContentInsetAdjustmentDescriptor.contentInset.left, bottom, self->_desiredContentInsetAdjustmentDescriptor.contentInset.right, self->_appliedContentInsetsAdjustment.top, self->_appliedContentInsetsAdjustment.left, self->_appliedContentInsetsAdjustment.bottom, self->_appliedContentInsetsAdjustment.right);
    self->_appliedContentInsetsAdjustment.top = top;
    self->_appliedContentInsetsAdjustment.left = left;
    self->_appliedContentInsetsAdjustment.bottom = bottom;
    self->_appliedContentInsetsAdjustment.right = right;
  }
  v18 = obj;
  if (v13)
  {
    -[UIViewController scrollingTabBarBottomInsetAdjustmentDidChange](self->_viewController, "scrollingTabBarBottomInsetAdjustmentDidChange");
    v18 = obj;
  }

}

- (SKUIViewControllerContainerCollectionViewCell)collectionViewCell
{
  return self->_collectionViewCell;
}

- (void)setCollectionViewCell:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewCell, a3);
}

- (SKUIScrollingTabBarControllerItemContextDelegate)delegate
{
  return (SKUIScrollingTabBarControllerItemContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)lastSelectedPageIndex
{
  return self->_lastSelectedPageIndex;
}

- (void)setLastSelectedPageIndex:(unint64_t)a3
{
  self->_lastSelectedPageIndex = a3;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collectionViewCell, 0);
  objc_storeStrong((id *)&self->_observedNestedPagingScrollView, 0);
  objc_storeStrong((id *)&self->_insetAdjustedContentScrollView, 0);
}

- (void)initWithViewController:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIScrollingTabBarControllerItemContext initWithViewController:]";
}

@end
