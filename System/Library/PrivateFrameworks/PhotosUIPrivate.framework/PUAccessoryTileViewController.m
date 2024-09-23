@implementation PUAccessoryTileViewController

- (PUAccessoryTileViewController)initWithReuseIdentifier:(id)a3
{
  PUAccessoryTileViewController *result;
  CGSize v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUAccessoryTileViewController;
  result = -[PUTileController initWithReuseIdentifier:](&v5, sel_initWithReuseIdentifier_, a3);
  if (result)
  {
    v4 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    result->__keyboardFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    result->__keyboardFrame.size = v4;
  }
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PUAccessoryTileViewController;
  -[PUTileViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUAccessoryTileViewController;
  -[PUTileViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PUAccessoryTileViewController _invalidateLoadedContentViewController](self, "_invalidateLoadedContentViewController");
}

- (void)becomeReusable
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUAccessoryTileViewController;
  -[PUTileViewController becomeReusable](&v4, sel_becomeReusable);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__PUAccessoryTileViewController_becomeReusable__block_invoke;
  v3[3] = &unk_1E58ABD10;
  v3[4] = self;
  -[PUAccessoryTileViewController _performChanges:](self, "_performChanges:", v3);
}

- (void)applyLayoutInfo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUAccessoryTileViewController;
  -[PUTileViewController applyLayoutInfo:](&v8, sel_applyLayoutInfo_, v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__PUAccessoryTileViewController_applyLayoutInfo___block_invoke;
  v6[3] = &unk_1E58ABCA8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PUAccessoryTileViewController _performChanges:](self, "_performChanges:", v6);

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $5BA391482D72DE319C56BFB960053ACC *p_delegateFlags;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToViewHostingGestureRecognizers = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToWillHideToolbarWhenShowingAccessoryView = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToWillHideNavigationBarWhenShowingAccessoryView = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldUseSquareImageWhenShowingAccessoryView = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setAssetViewModel:(id)a3
{
  PUAssetViewModel *v5;
  PUAssetViewModel *v6;

  v5 = (PUAssetViewModel *)a3;
  if (self->_assetViewModel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_assetViewModel, a3);
    -[PUAccessoryTileViewController _invalidateMasterContentOffset](self, "_invalidateMasterContentOffset");
    v5 = v6;
  }

}

- (void)setAssetReference:(id)a3
{
  PUAssetReference *v5;
  PUAssetReference *v6;

  v5 = (PUAssetReference *)a3;
  if (self->_assetReference != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_assetReference, a3);
    -[PUAccessoryTileViewController _invalidateContentViewController](self, "_invalidateContentViewController");
    v5 = v6;
  }

}

- (void)didChangeActive
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUAccessoryTileViewController;
  -[PUTileController didChangeActive](&v3, sel_didChangeActive);
  -[PUAccessoryTileViewController _invalidateMasterContentOffset](self, "_invalidateMasterContentOffset");
}

- (BOOL)isLocationFromProviderInContentArea:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  char v11;

  v4 = a3;
  -[PUAccessoryTileViewController _contentView](self, "_contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "locationInView:", v5);
    v7 = v6;
    v9 = v8;
    -[PUAccessoryTileViewController _loadedContentViewController](self, "_loadedContentViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "contentAreaContainsPoint:inCoordinateSpace:", v5, v7, v9);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_setContentViewController:(id)a3
{
  PUAccessoryContentViewController *v5;
  PUAccessoryContentViewController **p_contentViewController;
  PUAccessoryContentViewController *contentViewController;
  PUAccessoryTileViewController *v8;
  PUAccessoryContentViewController *v9;

  v5 = (PUAccessoryContentViewController *)a3;
  p_contentViewController = &self->__contentViewController;
  contentViewController = self->__contentViewController;
  if (contentViewController != v5)
  {
    v9 = v5;
    -[PUAccessoryContentViewController accessoryContentViewControllerDelegate](contentViewController, "accessoryContentViewControllerDelegate");
    v8 = (PUAccessoryTileViewController *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[PUAccessoryContentViewController setAccessoryContentViewControllerDelegate:](*p_contentViewController, "setAccessoryContentViewControllerDelegate:", 0);
    objc_storeStrong((id *)&self->__contentViewController, a3);
    -[PUAccessoryContentViewController setAccessoryContentViewControllerDelegate:](*p_contentViewController, "setAccessoryContentViewControllerDelegate:", self);
    -[PUAccessoryTileViewController _invalidateLoadedContentViewController](self, "_invalidateLoadedContentViewController");
    v5 = v9;
  }

}

- (void)_setLoadedContentViewController:(id)a3
{
  PUAccessoryContentViewController *v6;
  PUAccessoryContentViewController **p_loadedContentViewController;
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
  char v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  PUAccessoryTileViewController *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = (PUAccessoryContentViewController *)a3;
  p_loadedContentViewController = &self->__loadedContentViewController;
  if (self->__loadedContentViewController != v6)
  {
    if (-[PUTileViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[PUTileViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    if (*p_loadedContentViewController)
    {
      -[PUAccessoryContentViewController view](*p_loadedContentViewController, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 == v8)
      {
        -[PUAccessoryContentViewController willMoveToParentViewController:](*p_loadedContentViewController, "willMoveToParentViewController:", 0);
        -[PUAccessoryContentViewController view](*p_loadedContentViewController, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeFromSuperview");

        -[PUAccessoryContentViewController removeFromParentViewController](*p_loadedContentViewController, "removeFromParentViewController");
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE8], 0);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE0], 0);

      }
    }
    objc_storeStrong((id *)&self->__loadedContentViewController, a3);
    if (*p_loadedContentViewController)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObserver:selector:name:object:", self, sel__keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

      -[PUAccessoryTileViewController delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "accessoryTileViewControllerHostViewController:", self);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17
        && objc_msgSend(v17, "isViewLoaded")
        && (objc_msgSend(v17, "view"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = objc_msgSend(v8, "isDescendantOfView:", v18),
            v18,
            (v19 & 1) != 0))
      {
        objc_msgSend(v17, "addChildViewController:", *p_loadedContentViewController);
        -[PUAccessoryContentViewController view](*p_loadedContentViewController, "view");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAccessoryTileViewController.m"), 189, CFSTR("missing container view"));

        }
        objc_msgSend(v8, "addSubview:", v20);
        objc_msgSend(v8, "layer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setAllowsGroupOpacity:", 0);

        -[PUAccessoryContentViewController didMoveToParentViewController:](*p_loadedContentViewController, "didMoveToParentViewController:", v17);
      }
      else
      {
        PLUIGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v24 = 138412802;
          v25 = self;
          v26 = 2112;
          v27 = v17;
          v28 = 2112;
          v29 = v8;
          _os_log_impl(&dword_1AAB61000, v22, OS_LOG_TYPE_DEFAULT, "%@: hostViewController %@ doesn't contain containerView %@", (uint8_t *)&v24, 0x20u);
        }

        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }
    -[PUAccessoryTileViewController _setContentView:](self, "_setContentView:", v20);

  }
}

- (void)_setContentView:(id)a3
{
  UIView *v5;
  void *v6;
  UIView *v7;

  v5 = (UIView *)a3;
  if (self->__contentView != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->__contentView, a3);
    -[UIView layer](self->__contentView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupOpacity:", 0);

    -[PUAccessoryTileViewController _invalidateContentViewMetrics](self, "_invalidateContentViewMetrics");
    -[PUAccessoryTileViewController _invalidateContentBounds](self, "_invalidateContentBounds");
    v5 = v7;
  }

}

- (void)_setContentBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_contentBounds;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_contentBounds = &self->__contentBounds;
  if ((PXRectApproximatelyEqualToRect() & 1) == 0)
  {
    p_contentBounds->origin.x = x;
    p_contentBounds->origin.y = y;
    p_contentBounds->size.width = width;
    p_contentBounds->size.height = height;
    -[PUAccessoryTileViewController _invalidateMasterContentOffset](self, "_invalidateMasterContentOffset");
  }
}

- (void)_setUntransformedMasterContentFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_untransformedMasterContentFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_untransformedMasterContentFrame = &self->__untransformedMasterContentFrame;
  if (!CGRectEqualToRect(a3, self->__untransformedMasterContentFrame))
  {
    p_untransformedMasterContentFrame->origin.x = x;
    p_untransformedMasterContentFrame->origin.y = y;
    p_untransformedMasterContentFrame->size.width = width;
    p_untransformedMasterContentFrame->size.height = height;
    -[PUAccessoryTileViewController _invalidateMasterContentOffset](self, "_invalidateMasterContentOffset");
    -[PUAccessoryTileViewController _invalidateContentViewMetrics](self, "_invalidateContentViewMetrics");
  }
}

- (void)_setContentInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->__contentInsets.left
    || a3.top != self->__contentInsets.top
    || a3.right != self->__contentInsets.right
    || a3.bottom != self->__contentInsets.bottom)
  {
    self->__contentInsets = a3;
    -[PUAccessoryTileViewController _invalidateContentViewMetrics](self, "_invalidateContentViewMetrics");
  }
}

- (void)_setKeyboardFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_keyboardFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_keyboardFrame = &self->__keyboardFrame;
  if (!CGRectEqualToRect(a3, self->__keyboardFrame))
  {
    p_keyboardFrame->origin.x = x;
    p_keyboardFrame->origin.y = y;
    p_keyboardFrame->size.width = width;
    p_keyboardFrame->size.height = height;
    -[PUAccessoryTileViewController _invalidateContentViewMetrics](self, "_invalidateContentViewMetrics");
  }
}

- (void)_setMinimumVisibleHeight:(double)a3
{
  if ((PXFloatEqualToFloatWithTolerance() & 1) == 0)
  {
    self->__minimumVisibleHeight = a3;
    -[PUAccessoryTileViewController _invalidateContentViewMetrics](self, "_invalidateContentViewMetrics");
    -[PUAccessoryTileViewController _setContentInsetsChangeReason:](self, "_setContentInsetsChangeReason:", 1);
  }
}

- (void)_performChanges:(id)a3
{
  void (**v4)(_QWORD);
  _BOOL4 isPerformingChanges;
  void (**v6)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  isPerformingChanges = self->_isPerformingChanges;
  self->_isPerformingChanges = 1;
  v6 = v4;
  if (v4)
  {
    v4[2](v4);
    v4 = v6;
  }
  self->_isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
  {
    -[PUAccessoryTileViewController _updateIfNeeded](self, "_updateIfNeeded");
    v4 = v6;
  }

}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.contentViewController
      || self->_needsUpdateFlags.loadedContentViewController
      || self->_needsUpdateFlags.contentViewMetrics
      || self->_needsUpdateFlags.contentBounds
      || self->_needsUpdateFlags.masterContentOffset;
}

- (void)_setNeedsUpdate
{
  _QWORD v2[4];
  id v3;
  id location;

  if (!self->_isPerformingChanges && !self->_isPerformingUpdates && !self->_isUpdateScheduled)
  {
    self->_isUpdateScheduled = 1;
    objc_initWeak(&location, self);
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __48__PUAccessoryTileViewController__setNeedsUpdate__block_invoke;
    v2[3] = &unk_1E58AB2F8;
    objc_copyWeak(&v3, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v2);
    objc_destroyWeak(&v3);
    objc_destroyWeak(&location);
  }
}

- (void)_handleScheduledUpdate
{
  self->_isUpdateScheduled = 0;
  -[PUAccessoryTileViewController _performChanges:](self, "_performChanges:", 0);
}

- (void)_updateIfNeeded
{
  BOOL isPerformingUpdates;

  if (-[PUAccessoryTileViewController _needsUpdate](self, "_needsUpdate"))
  {
    isPerformingUpdates = self->_isPerformingUpdates;
    self->_isPerformingUpdates = 1;
    -[PUAccessoryTileViewController _updateContentViewControllerIfNeeded](self, "_updateContentViewControllerIfNeeded");
    -[PUAccessoryTileViewController _updateLoadedContentViewControllerIfNeeded](self, "_updateLoadedContentViewControllerIfNeeded");
    -[PUAccessoryTileViewController _updateContentViewMetricsIfNeeded](self, "_updateContentViewMetricsIfNeeded");
    -[PUAccessoryTileViewController _updateContentBoundsIfNeeded](self, "_updateContentBoundsIfNeeded");
    -[PUAccessoryTileViewController _updateMasterContentOffsetIfNeeded](self, "_updateMasterContentOffsetIfNeeded");
    -[PUAccessoryTileViewController _setContentInsetsChangeReason:](self, "_setContentInsetsChangeReason:", 0);
    self->_isPerformingUpdates = isPerformingUpdates;
  }
}

- (void)_invalidateContentViewController
{
  self->_needsUpdateFlags.contentViewController = 1;
  -[PUAccessoryTileViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateContentViewControllerIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  if (self->_needsUpdateFlags.contentViewController)
  {
    self->_needsUpdateFlags.contentViewController = 0;
    -[PUAccessoryTileViewController assetReference](self, "assetReference");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[PUAccessoryTileViewController delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accessoryTileViewControllerAccessoryViewController:", self);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
    -[PUAccessoryTileViewController _setContentViewController:](self, "_setContentViewController:", v5);

  }
}

- (void)_invalidateLoadedContentViewController
{
  self->_needsUpdateFlags.loadedContentViewController = 1;
  -[PUAccessoryTileViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateLoadedContentViewControllerIfNeeded
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  dispatch_time_t v7;
  _QWORD v8[5];
  id v9;

  if (self->_needsUpdateFlags.loadedContentViewController)
  {
    self->_needsUpdateFlags.loadedContentViewController = 0;
    if (-[PUTileViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[PUAccessoryTileViewController _contentViewController](self, "_contentViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
    -[PUAccessoryTileViewController assetViewModel](self, "assetViewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "focusValue");
    v6 = fabs(v5);

    if (v6 >= 1.0)
    {
      v7 = dispatch_time(0, 250000000);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __75__PUAccessoryTileViewController__updateLoadedContentViewControllerIfNeeded__block_invoke;
      v8[3] = &unk_1E58ABCA8;
      v8[4] = self;
      v9 = v3;
      dispatch_after(v7, MEMORY[0x1E0C80D38], v8);

    }
    else
    {
      -[PUAccessoryTileViewController _setLoadedContentViewController:](self, "_setLoadedContentViewController:", v3);
    }

  }
}

- (void)_invalidateContentViewMetrics
{
  self->_needsUpdateFlags.contentViewMetrics = 1;
  -[PUAccessoryTileViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateContentViewMetricsIfNeeded
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  char v14;
  _BOOL4 v15;
  char v16;
  double v17;
  CGFloat x;
  double y;
  double width;
  double height;
  double v22;
  double v23;
  double v24;
  void *v25;
  int v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  int v46;
  double v47;
  double v48;
  double v49;
  uint64_t v50;
  double v51;
  int v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGFloat v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  double MaxY;
  double v78;
  double v79;
  double v80;
  double MinY;
  double v82;
  void *v83;
  char v84;
  double v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat rect;
  double v89;
  CGFloat v90;
  double v91;
  double v92;
  double v93;
  id v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;

  if (self->_needsUpdateFlags.contentViewMetrics)
  {
    self->_needsUpdateFlags.contentViewMetrics = 0;
    -[PUAccessoryTileViewController _contentView](self, "_contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
LABEL_61:

      return;
    }
    v94 = v3;
    -[PUTileViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v94, "setFrame:");
    if (self->_delegateFlags.respondsToShouldUseSquareImageWhenShowingAccessoryView)
    {
      -[PUAccessoryTileViewController delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "accessoryTileViewControllerShouldUseSquareImageWhenShowingAccessoryView:", self) ^ 1;

      v15 = -[PUAccessoryTileViewController _isPhoneAndLandscape](self, "_isPhoneAndLandscape");
      v16 = 1;
      if ((v14 & 1) == 0 && v15)
      {
        v89 = v6;
        v17 = v10;
        objc_msgSend(v94, "bounds");
        x = v95.origin.x;
        y = v95.origin.y;
        width = v95.size.width;
        height = v95.size.height;
        v22 = CGRectGetHeight(v95);
        PXSizeGetAspectRatio();
        if (v23 < 2.0)
        {
          v96.origin.x = x;
          v96.origin.y = y;
          v96.size.width = width;
          v96.size.height = height;
          v24 = CGRectGetWidth(v96);
          v97.origin.x = x;
          v97.origin.y = y;
          v97.size.width = width;
          v97.size.height = height;
          v22 = v24 - CGRectGetHeight(v97);
        }
        objc_msgSend(v94, "setFrame:", v22, y, width - v22, height);
        v16 = 0;
        v10 = v17;
        v6 = v89;
      }
    }
    else
    {
      -[PUAccessoryTileViewController _isPhoneAndLandscape](self, "_isPhoneAndLandscape");
      v16 = 1;
      v14 = 1;
    }
    if (self->_delegateFlags.respondsToWillHideToolbarWhenShowingAccessoryView)
    {
      -[PUAccessoryTileViewController delegate](self, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "accessoryTileViewControllerWillHideToolbarWhenShowingAccessoryView:", self);

    }
    else
    {
      v26 = 0;
    }
    -[PUAccessoryTileViewController _loadedContentViewController](self, "_loadedContentViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "px_safeAreaInsets");
    v29 = v28;
    objc_msgSend(v27, "preferredContentSize");
    v31 = v30;
    v32 = v6;
    v33 = v8;
    v34 = v10;
    v35 = v12;
    if ((v14 & 1) != 0)
    {
      v36 = CGRectGetHeight(*(CGRect *)&v32);
      +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "accessoryInitialTopPosition");
      v39 = 1.0 - v38;
      v40 = v29;
      if ((v26 & 1) == 0)
        -[PUAccessoryTileViewController _contentInsets](self, "_contentInsets");
      v41 = -(v40 - v36 * v39);

      -[PUAccessoryTileViewController _minimumVisibleHeight](self, "_minimumVisibleHeight");
      if (v42 < v31)
        v42 = v31;
      if (v42 >= v41)
        v43 = v41;
      else
        v43 = v42;
    }
    else
    {
      v44 = CGRectGetWidth(*(CGRect *)&v32);
      +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "squareImageCapToHalfHeight");

      if (v46)
      {
        v98.origin.x = v6;
        v98.origin.y = v8;
        v98.size.width = v10;
        v98.size.height = v12;
        v47 = CGRectGetHeight(v98) * 0.5;
        if (v47 < v44)
          v44 = v47;
      }
      v99.origin.x = v6;
      v99.origin.y = v8;
      v99.size.width = v10;
      v99.size.height = v12;
      v48 = CGRectGetHeight(v99) - v44;
      v49 = v29;
      if ((v26 & 1) == 0)
        -[PUAccessoryTileViewController _contentInsets](self, "_contentInsets");
      v43 = v48 - v49;
      v41 = v43;
    }
    v50 = MEMORY[0x1E0DC49E8];
    -[PUAccessoryTileViewController _editorHeightDelta](self, "_editorHeightDelta");
    if (v51 != 0.0)
    {
      v52 = PXFloatEqualToFloatWithTolerance();
      -[PUAccessoryTileViewController _editorHeightDelta](self, "_editorHeightDelta");
      v54 = v31 + v53;
      if (v31 + v53 >= v41)
        v54 = v41;
      v55 = v43 + v53;
      if (v52)
        v55 = v54;
      if (v41 >= v55)
        v43 = v55;
      else
        v43 = v41;
      -[PUAccessoryTileViewController _setEditorHeightDelta:](self, "_setEditorHeightDelta:", 0.0);
    }
    v92 = *(double *)(v50 + 8);
    v93 = *(double *)(v50 + 24);
    -[PUAccessoryTileViewController _contentInsets](self, "_contentInsets");
    if (!v26)
      v29 = v56;
    v100.origin.x = v6;
    v100.origin.y = v8;
    v100.size.width = v10;
    v100.size.height = v12;
    rect = v12;
    v57 = v8;
    v91 = CGRectGetHeight(v100) - v29 - v43;
    -[PUAccessoryTileViewController _keyboardFrame](self, "_keyboardFrame");
    v58 = v10;
    v59 = v101.origin.x;
    v60 = v6;
    v61 = v101.origin.y;
    v62 = v101.size.width;
    v63 = v101.size.height;
    if (CGRectIsNull(v101))
    {
      if ((v16 & 1) != 0)
      {
        v65 = v92;
        v64 = v93;
        v66 = v91;
LABEL_60:
        objc_msgSend(v27, "setContentInsets:changeReason:", -[PUAccessoryTileViewController _contentInsetsChangeReason](self, "_contentInsetsChangeReason", *(_QWORD *)&v86, *(_QWORD *)&v87), v66, v65, v29, v64);

        v3 = v94;
        goto LABEL_61;
      }
      v65 = v92;
      v64 = v93;
      if (self->_delegateFlags.respondsToWillHideNavigationBarWhenShowingAccessoryView)
      {
        -[PUAccessoryTileViewController delegate](self, "delegate");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_msgSend(v83, "accessoryTileViewControllerWillHideNavigationBarWhenShowingAccessoryView:", self);

        v66 = 0.0;
        if ((v84 & 1) != 0)
          goto LABEL_60;
      }
    }
    else
    {
      if (v61 < 0.0)
        v61 = 0.0;
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "px_firstKeyWindow");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "convertRect:fromView:", v68, v59, v61, v62, v63);
      v70 = v69;
      v72 = v71;
      v74 = v73;
      v76 = v75;

      v90 = v60;
      v102.origin.x = v60;
      v86 = v58;
      v87 = v57;
      v102.origin.y = v57;
      v102.size.width = v58;
      v102.size.height = rect;
      MaxY = CGRectGetMaxY(v102);
      v103.origin.x = v70;
      v103.origin.y = v72;
      v103.size.width = v74;
      v103.size.height = v76;
      v78 = MaxY - CGRectGetMinY(v103);
      if (v29 < v78)
        v29 = v78;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[PUAccessoryTileViewController _contentInsets](self, "_contentInsets");
        objc_msgSend(v27, "setMaxVisibleContentInsetsWhenInEdit:");
      }
      v79 = 0.0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v27, "minimumContentSize");
        v79 = v80;
      }
      v104.origin.x = v70;
      v104.origin.y = v72;
      v104.size.width = v74;
      v104.size.height = v76;
      MinY = CGRectGetMinY(v104);
      v105.origin.x = v90;
      v105.size.width = v58;
      v105.origin.y = v57;
      v105.size.height = rect;
      v82 = MinY - CGRectGetMinY(v105) - v79;
      v65 = v92;
      if (v91 < v82)
        v82 = v91;
      if (v82 >= 0.0)
        v66 = v82;
      else
        v66 = 0.0;
      v64 = v93;
      if ((v16 & 1) != 0)
        goto LABEL_60;
    }
    -[PUAccessoryTileViewController _contentInsets](self, "_contentInsets", *(_QWORD *)&v86, *(_QWORD *)&v87);
    v66 = v85;
    goto LABEL_60;
  }
}

- (void)_invalidateContentBounds
{
  self->_needsUpdateFlags.contentBounds = 1;
  -[PUAccessoryTileViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateContentBoundsIfNeeded
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double x;
  double y;
  double width;
  double height;
  id v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  if (self->_needsUpdateFlags.contentBounds)
  {
    self->_needsUpdateFlags.contentBounds = 0;
    -[PUAccessoryTileViewController _contentView](self, "_contentView");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[PUTileViewController view](self, "view");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUAccessoryTileViewController _loadedContentViewController](self, "_loadedContentViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contentBoundsInCoordinateSpace:", v3);
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;

      objc_msgSend(v3, "bounds");
      v24.origin.x = v13;
      v24.origin.y = v14;
      v24.size.width = v15;
      v24.size.height = v16;
      v22.origin.x = v6;
      v22.origin.y = v8;
      v22.size.width = v10;
      v22.size.height = v12;
      v23 = CGRectIntersection(v22, v24);
      x = v23.origin.x;
      y = v23.origin.y;
      width = v23.size.width;
      height = v23.size.height;

    }
    else
    {
      x = *MEMORY[0x1E0C9D628];
      y = *(double *)(MEMORY[0x1E0C9D628] + 8);
      width = *(double *)(MEMORY[0x1E0C9D628] + 16);
      height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    }
    -[PUAccessoryTileViewController _setContentBounds:](self, "_setContentBounds:", x, y, width, height);

  }
}

- (void)_invalidateMasterContentOffset
{
  self->_needsUpdateFlags.masterContentOffset = 1;
  -[PUAccessoryTileViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateMasterContentOffsetIfNeeded
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  int IsEmpty;
  _BOOL4 v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double MinY;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  id v23;
  double v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  double v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  if (self->_needsUpdateFlags.masterContentOffset)
  {
    self->_needsUpdateFlags.masterContentOffset = 0;
    -[PUAccessoryTileViewController _contentBounds](self, "_contentBounds");
    x = v32.origin.x;
    y = v32.origin.y;
    width = v32.size.width;
    height = v32.size.height;
    IsEmpty = CGRectIsEmpty(v32);
    v8 = -[PUTileController isActive](self, "isActive");
    if ((IsEmpty & 1) == 0)
    {
      v24 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v25 = *MEMORY[0x1E0C9D538];
      -[PUAccessoryTileViewController _untransformedMasterContentFrame](self, "_untransformedMasterContentFrame");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v33.origin.x = x;
      v33.origin.y = y;
      v33.size.width = width;
      v33.size.height = height;
      MinY = CGRectGetMinY(v33);
      v34.origin.x = v10;
      v34.origin.y = v12;
      v34.size.width = v14;
      v34.size.height = v16;
      v18 = MinY - CGRectGetMaxY(v34);
      if (v18 <= 0.0)
        v19 = v18;
      else
        v19 = 0.0;
      if (v8)
        v20 = v19;
      else
        v20 = v24;
      if (v8 == -[PUAccessoryTileViewController _wasActiveOnLastMasterContentOffsetChange](self, "_wasActiveOnLastMasterContentOffsetChange"))
      {
        if ((unint64_t)(-[PUAccessoryTileViewController _contentInsetsChangeReason](self, "_contentInsetsChangeReason")- 1) >= 3)v21 = 2;
        else
          v21 = 3;
      }
      else
      {
        v21 = 1;
      }
      -[PUAccessoryTileViewController assetViewModel](self, "assetViewModel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __67__PUAccessoryTileViewController__updateMasterContentOffsetIfNeeded__block_invoke;
      v26[3] = &unk_1E58AACA0;
      v27 = v22;
      v28 = v25;
      v29 = v20;
      v30 = v21;
      v31 = v19;
      v23 = v22;
      objc_msgSend(v23, "performChanges:", v26);

    }
    -[PUAccessoryTileViewController _setWasActiveOnLastMasterContentOffsetChange:](self, "_setWasActiveOnLastMasterContentOffsetChange:", v8 & ~IsEmpty);
  }
}

- (BOOL)_isPhoneAndLandscape
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  -[PUAccessoryTileViewController _contentViewController](self, "_contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4)
    return 0;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "interfaceOrientation");

  return (unint64_t)(v10 - 3) < 2;
}

- (id)accessoryContentViewControllerViewHostingGestureRecognizers:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;

  v5 = a3;
  if (!self->_delegateFlags.respondsToViewHostingGestureRecognizers
    || (-[PUAccessoryTileViewController delegate](self, "delegate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "accessoryTileViewControllerViewHostingGestureRecognizers:", self),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    -[PUAccessoryTileViewController _contentViewController](self, "_contentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isViewLoaded");

    if (!v9
      || (-[PUAccessoryTileViewController _contentViewController](self, "_contentViewController"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "view"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          !v7))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAccessoryTileViewController.m"), 590, CFSTR("missing viewHostingGestureRecognizers"));

      v7 = 0;
    }
  }

  return v7;
}

- (void)accessoryContentViewControllerContentBoundsDidChange:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __86__PUAccessoryTileViewController_accessoryContentViewControllerContentBoundsDidChange___block_invoke;
  v3[3] = &unk_1E58ABD10;
  v3[4] = self;
  -[PUAccessoryTileViewController _performChanges:](self, "_performChanges:", v3);
}

- (void)accessoryContentViewController:(id)a3 editorHeightDidChange:(double)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __86__PUAccessoryTileViewController_accessoryContentViewController_editorHeightDidChange___block_invoke;
  v4[3] = &unk_1E58AACF0;
  v4[4] = self;
  *(double *)&v4[5] = a4;
  -[PUAccessoryTileViewController _performChanges:](self, "_performChanges:", v4);
}

- (void)_keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[9];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__PUAccessoryTileViewController__keyboardWillShow___block_invoke;
  v14[3] = &unk_1E58AACA0;
  v14[4] = self;
  v14[5] = v7;
  v14[6] = v9;
  v14[7] = v11;
  v14[8] = v13;
  -[PUAccessoryTileViewController _performChanges:](self, "_performChanges:", v14);
}

- (void)_keyboardWillHide:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__PUAccessoryTileViewController__keyboardWillHide___block_invoke;
  v3[3] = &unk_1E58ABD10;
  v3[4] = self;
  -[PUAccessoryTileViewController _performChanges:](self, "_performChanges:", v3);
}

- (PUAccessoryTileViewControllerDelegate)delegate
{
  return (PUAccessoryTileViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (PUAssetReference)assetReference
{
  return self->_assetReference;
}

- (PUAccessoryContentViewController)_contentViewController
{
  return self->__contentViewController;
}

- (PUAccessoryContentViewController)_loadedContentViewController
{
  return self->__loadedContentViewController;
}

- (UIView)_contentView
{
  return self->__contentView;
}

- (CGRect)_contentBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__contentBounds.origin.x;
  y = self->__contentBounds.origin.y;
  width = self->__contentBounds.size.width;
  height = self->__contentBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)_untransformedMasterContentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__untransformedMasterContentFrame.origin.x;
  y = self->__untransformedMasterContentFrame.origin.y;
  width = self->__untransformedMasterContentFrame.size.width;
  height = self->__untransformedMasterContentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIEdgeInsets)_contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->__contentInsets.top;
  left = self->__contentInsets.left;
  bottom = self->__contentInsets.bottom;
  right = self->__contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGRect)_keyboardFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__keyboardFrame.origin.x;
  y = self->__keyboardFrame.origin.y;
  width = self->__keyboardFrame.size.width;
  height = self->__keyboardFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)_contentInsetsChangeReason
{
  return self->__contentInsetsChangeReason;
}

- (void)_setContentInsetsChangeReason:(int64_t)a3
{
  self->__contentInsetsChangeReason = a3;
}

- (double)_minimumVisibleHeight
{
  return self->__minimumVisibleHeight;
}

- (BOOL)_wasActiveOnLastMasterContentOffsetChange
{
  return self->__wasActiveOnLastMasterContentOffsetChange;
}

- (void)_setWasActiveOnLastMasterContentOffsetChange:(BOOL)a3
{
  self->__wasActiveOnLastMasterContentOffsetChange = a3;
}

- (double)_editorHeightDelta
{
  return self->__editorHeightDelta;
}

- (void)_setEditorHeightDelta:(double)a3
{
  self->__editorHeightDelta = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__contentView, 0);
  objc_storeStrong((id *)&self->__loadedContentViewController, 0);
  objc_storeStrong((id *)&self->__contentViewController, 0);
  objc_storeStrong((id *)&self->_assetReference, 0);
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __51__PUAccessoryTileViewController__keyboardWillHide___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setKeyboardFrame:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  return objc_msgSend(*(id *)(a1 + 32), "_setContentInsetsChangeReason:", 3);
}

uint64_t __51__PUAccessoryTileViewController__keyboardWillShow___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setKeyboardFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "_setContentInsetsChangeReason:", 2);
}

uint64_t __86__PUAccessoryTileViewController_accessoryContentViewController_editorHeightDidChange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setEditorHeightDelta:", *(double *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_invalidateContentViewMetrics");
  return objc_msgSend(*(id *)(a1 + 32), "_setContentInsetsChangeReason:", 1);
}

uint64_t __86__PUAccessoryTileViewController_accessoryContentViewControllerContentBoundsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateContentBounds");
}

uint64_t __67__PUAccessoryTileViewController__updateMasterContentOffsetIfNeeded__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentOffset:changeReason:", *(_QWORD *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setContentOffsetForAccessoryFullyVisible:", 0.0, *(double *)(a1 + 64));
}

uint64_t __75__PUAccessoryTileViewController__updateLoadedContentViewControllerIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setLoadedContentViewController:", *(_QWORD *)(a1 + 40));
}

void __48__PUAccessoryTileViewController__setNeedsUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleScheduledUpdate");

}

uint64_t __49__PUAccessoryTileViewController_applyLayoutInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "untransformedContentFrame");
  objc_msgSend(v2, "_setUntransformedMasterContentFrame:");
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "contentInsets");
  objc_msgSend(v3, "_setContentInsets:");
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "minimumVisibleHeight");
  return objc_msgSend(v4, "_setMinimumVisibleHeight:");
}

uint64_t __47__PUAccessoryTileViewController_becomeReusable__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setEditorHeightDelta:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setAssetViewModel:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setAssetReference:", 0);
}

@end
