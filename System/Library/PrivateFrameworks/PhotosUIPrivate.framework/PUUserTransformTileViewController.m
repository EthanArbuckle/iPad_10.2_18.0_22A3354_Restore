@implementation PUUserTransformTileViewController

- (PUUserTransformTileViewController)initWithReuseIdentifier:(id)a3
{
  PUUserTransformTileViewController *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUUserTransformTileViewController;
  result = -[PUTileController initWithReuseIdentifier:](&v4, sel_initWithReuseIdentifier_, a3);
  if (result)
  {
    result->_userInteractionEnabled = 1;
    result->_minimumScaleWhileApplyingInsets = 1.0;
  }
  return result;
}

- (void)dealloc
{
  PUUserTransformTileViewController *v3;
  objc_super v4;

  -[PUUserTransformView delegate](self->_userTransformView, "delegate");
  v3 = (PUUserTransformTileViewController *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
    -[PUUserTransformView setDelegate:](self->_userTransformView, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)PUUserTransformTileViewController;
  -[PUTileViewController dealloc](&v4, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $C74E0AB39690C59F1216899EA69A190E *p_delegateRespondsTo;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->didChangeIsUserInteracting = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->shouldReceiveTouchAtLocationFromProvider = objc_opt_respondsToSelector() & 1;
  }

}

- (void)becomeReusable
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUUserTransformTileViewController;
  -[PUTileViewController becomeReusable](&v3, sel_becomeReusable);
  -[PUUserTransformTileViewController setBrowsingViewModel:](self, "setBrowsingViewModel:", 0);
  -[PUUserTransformTileViewController setAssetViewModel:](self, "setAssetViewModel:", 0);
}

- (id)loadView
{
  void *v4;
  PUUserTransformView *v5;
  UIView *v6;
  UIView *interactionHostView;
  void *v8;
  void *v10;

  -[PUUserTransformTileViewController userTransformView](self, "userTransformView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUUserTransformTileViewController.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self userTransformView] == nil"));

  }
  v5 = -[PUUserTransformView initWithFrame:]([PUUserTransformView alloc], "initWithFrame:", 0.0, 0.0, 10.0, 10.0);
  -[PUUserTransformView setDelegate:](v5, "setDelegate:", self);
  -[PUUserTransformTileViewController _setUserTransformView:](self, "_setUserTransformView:", v5);
  v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  interactionHostView = self->_interactionHostView;
  self->_interactionHostView = v6;

  -[UIView setClipsToBounds:](self->_interactionHostView, "setClipsToBounds:", 1);
  -[PUUserTransformView setHostedView:](v5, "setHostedView:", self->_interactionHostView);
  -[PUUserTransformTileViewController userTransformTileLayoutInfo](self, "userTransformTileLayoutInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUUserTransformTileViewController _updateUserTransformView:](self, "_updateUserTransformView:", v8);

  -[PUUserTransformTileViewController _updateMinimumZoomScale:](self, "_updateMinimumZoomScale:", 0);
  -[PUUserTransformTileViewController _updateInteractionHostViewRegistration](self, "_updateInteractionHostViewRegistration");
  return v5;
}

- (void)setBrowsingViewModel:(id)a3
{
  PUBrowsingViewModel *v5;
  PUBrowsingViewModel *browsingViewModel;
  PUBrowsingViewModel *v7;

  v5 = (PUBrowsingViewModel *)a3;
  browsingViewModel = self->_browsingViewModel;
  if (browsingViewModel != v5)
  {
    v7 = v5;
    -[PUBrowsingViewModel unregisterChangeObserver:](browsingViewModel, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_browsingViewModel, a3);
    -[PUBrowsingViewModel registerChangeObserver:](self->_browsingViewModel, "registerChangeObserver:", self);
    -[PUUserTransformTileViewController _updateMinimumZoomScale:](self, "_updateMinimumZoomScale:", 0);
    -[PUUserTransformTileViewController _updateUserTransformOffset:](self, "_updateUserTransformOffset:", 0);
    v5 = v7;
  }

}

- (void)setAssetViewModel:(id)a3
{
  PUAssetViewModel *v5;
  PUAssetViewModel **p_assetViewModel;
  PUAssetViewModel *assetViewModel;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PUAssetViewModel *v14;

  v5 = (PUAssetViewModel *)a3;
  p_assetViewModel = &self->_assetViewModel;
  assetViewModel = self->_assetViewModel;
  if (assetViewModel != v5)
  {
    v14 = v5;
    -[PUUserTransformTileViewController interactionHostView](self, "interactionHostView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAssetViewModel unregisterView:forImageAnalysisInteractionHostMode:](assetViewModel, "unregisterView:forImageAnalysisInteractionHostMode:", v8, 1);

    -[PUAssetViewModel unregisterChangeObserver:](*p_assetViewModel, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_assetViewModel, a3);
    -[PUAssetViewModel registerChangeObserver:](*p_assetViewModel, "registerChangeObserver:", self);
    objc_msgSend((id)objc_opt_class(), "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUUserTransformTileViewController _setIdentifier:](self, "_setIdentifier:", v12);
    -[PUUserTransformTileViewController setDisplayTileTransform:](self, "setDisplayTileTransform:", 0);
    -[PUUserTransformTileViewController userTransformTileLayoutInfo](self, "userTransformTileLayoutInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUUserTransformTileViewController _updateUserTransformView:](self, "_updateUserTransformView:", v13);

    -[PUUserTransformTileViewController _updateInteractionHostViewRegistration](self, "_updateInteractionHostViewRegistration");
    v5 = v14;
  }

}

- (void)applyLayoutInfo:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double MaxX;
  CGFloat v25;
  double MinY;
  double MaxY;
  PUUserTransformTileViewController *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat rect;
  objc_super v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUUserTransformTileViewController.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[layoutInfo isKindOfClass:[PUUserTransformTileLayoutInfo class]]"));

  }
  v39.receiver = self;
  v39.super_class = (Class)PUUserTransformTileViewController;
  -[PUTileViewController applyLayoutInfo:](&v39, sel_applyLayoutInfo_, v5);
  -[PUUserTransformTileViewController _updateUserTransformView:](self, "_updateUserTransformView:", v5);
  -[PUUserTransformTileViewController _updateUserTransformPadding](self, "_updateUserTransformPadding");
  -[PUUserTransformTileViewController _updateDisplayTileTransform](self, "_updateDisplayTileTransform");
  -[PUUserTransformTileViewController userTransformView](self, "userTransformView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

  objc_msgSend(v5, "untransformedContentFrame");
  objc_msgSend(v5, "chromeInsets");
  if (objc_msgSend(MEMORY[0x1E0D7B568], "isOneUpRefreshEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0D7B568], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "insetAllContent");

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0D7B568], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "minimumMarginForInsetContent");
      PXEdgeInsetsMaxEachEdge();

    }
  }
  objc_msgSend(v5, "size");
  v33 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v34 = *MEMORY[0x1E0C9D538];
  PXRectWithOriginAndSize();
  PXEdgeInsetsInsetRect();
  rect = v10;
  v35 = v11;
  v13 = v12;
  v15 = v14;
  PXSizeGetAspectRatio();
  PFSizeWithAspectRatioFittingSize();
  PXRectGetCenter();
  PXRectWithCenterAndSize();
  x = v40.origin.x;
  y = v40.origin.y;
  width = v40.size.width;
  height = v40.size.height;
  MinX = CGRectGetMinX(v40);
  v41.origin.x = rect;
  v41.origin.y = v35;
  v36 = v13;
  v37 = v15;
  v41.size.width = v13;
  v41.size.height = v15;
  if (MinX >= CGRectGetMinX(v41))
  {
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = height;
    MaxX = CGRectGetMaxX(v43);
    v44.size.height = v15;
    v44.origin.x = rect;
    v44.origin.y = v35;
    v44.size.width = v13;
    if (MaxX <= CGRectGetMaxX(v44))
    {
      v21 = y;
      v22 = height;
      v23 = width;
    }
    else
    {
      v45.size.height = v15;
      v45.origin.x = rect;
      v45.origin.y = v35;
      v45.size.width = v13;
      v32 = CGRectGetMaxX(v45);
      v46.origin.x = x;
      v21 = y;
      v46.origin.y = y;
      v23 = width;
      v46.size.width = width;
      v22 = height;
      v46.size.height = height;
      x = v32 - CGRectGetWidth(v46);
    }
  }
  else
  {
    v21 = y;
    v22 = height;
    v23 = width;
    v42.size.height = v37;
    v42.origin.x = rect;
    v42.origin.y = v35;
    v42.size.width = v36;
    x = CGRectGetMinX(v42);
  }
  v47.origin.x = x;
  v47.origin.y = v21;
  v25 = v23;
  v47.size.width = v23;
  v47.size.height = v22;
  MinY = CGRectGetMinY(v47);
  v48.size.height = v37;
  v48.origin.x = rect;
  v48.origin.y = v35;
  v48.size.width = v36;
  if (MinY >= CGRectGetMinY(v48))
  {
    v50.origin.x = x;
    v50.origin.y = v21;
    v50.size.width = v25;
    v50.size.height = v22;
    MaxY = CGRectGetMaxY(v50);
    v51.size.height = v37;
    v51.origin.x = rect;
    v51.origin.y = v35;
    v51.size.width = v36;
    if (MaxY > CGRectGetMaxY(v51))
    {
      v52.size.height = v37;
      v52.origin.x = rect;
      v52.origin.y = v35;
      v52.size.width = v36;
      CGRectGetMaxY(v52);
      v53.origin.x = x;
      v53.origin.y = v21;
      v53.size.width = v25;
      v53.size.height = v22;
      CGRectGetHeight(v53);
    }
  }
  else
  {
    v49.size.height = v37;
    v49.origin.x = rect;
    v49.origin.y = v35;
    v49.size.width = v36;
    CGRectGetMinY(v49);
  }
  if ((PXSizeIsEmpty() & 1) != 0 || (PXSizeIsEmpty() & 1) != 0)
  {
    -[PUUserTransformTileViewController setMinimumScaleWhileApplyingInsets:](self, "setMinimumScaleWhileApplyingInsets:", 1.0);
    v28 = self;
    v30 = v33;
    v29 = v34;
  }
  else
  {
    PXAffineTransformMakeFromRects();
    PXAffineTransformGetUniformScale();
    -[PUUserTransformTileViewController setMinimumScaleWhileApplyingInsets:](self, "setMinimumScaleWhileApplyingInsets:");
    PXRectGetCenter();
    PXRectGetCenter();
    PXPointSubtract();
    v28 = self;
  }
  -[PUUserTransformTileViewController setOffsetWhileApplyingInsets:](v28, "setOffsetWhileApplyingInsets:", v29, v30);

}

- (void)_handleAssetViewModelChange:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "accessoryViewVisibilityChanged"))
  {
    -[PUUserTransformTileViewController assetViewModel](self, "assetViewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAccessoryViewVisible");

    if (v5)
    {
      -[PUUserTransformTileViewController userTransformView](self, "userTransformView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "zoomOut:", 1);

    }
  }
  if (objc_msgSend(v11, "accessoryViewVisibilityChanged"))
  {
    -[PUUserTransformTileViewController userTransformTileLayoutInfo](self, "userTransformTileLayoutInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUUserTransformTileViewController _updateUserTransformView:](self, "_updateUserTransformView:", v7);

  }
  if (objc_msgSend(v11, "isZoomedInChanged"))
    -[PUUserTransformTileViewController _updateUserTransformOffset:](self, "_updateUserTransformOffset:", 1);
  if (objc_msgSend(v11, "isFullyOutOfFocusChanged"))
  {
    -[PUUserTransformTileViewController assetViewModel](self, "assetViewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isFullyOutOfFocus");

    if (v9)
    {
      -[PUUserTransformTileViewController userTransformView](self, "userTransformView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "zoomOut:", 0);

    }
  }

}

- (void)setDisplayTileTransform:(id)a3
{
  PUDisplayTileTransform *v5;
  PUDisplayTileTransform *v6;

  v5 = (PUDisplayTileTransform *)a3;
  if (self->_displayTileTransform != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_displayTileTransform, a3);
    -[PUUserTransformTileViewController _updateAssetViewModelProperties](self, "_updateAssetViewModelProperties");
    v5 = v6;
  }

}

- (void)setOffsetWhileApplyingInsets:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint *p_offsetWhileApplyingInsets;

  y = a3.y;
  x = a3.x;
  p_offsetWhileApplyingInsets = &self->_offsetWhileApplyingInsets;
  if ((PXPointApproximatelyEqualToPoint() & 1) == 0)
  {
    p_offsetWhileApplyingInsets->x = x;
    p_offsetWhileApplyingInsets->y = y;
    -[PUUserTransformTileViewController _updateUserTransformOffset:](self, "_updateUserTransformOffset:", 0);
  }
}

- (void)setMinimumScaleWhileApplyingInsets:(double)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_minimumScaleWhileApplyingInsets = a3;
    -[PUUserTransformTileViewController _updateMinimumZoomScale:](self, "_updateMinimumZoomScale:", 0);
  }
}

- (void)_handleBrowsingViewModelChange:(id)a3
{
  if (objc_msgSend(a3, "chromeVisibilityDidChange"))
  {
    -[PUUserTransformTileViewController _updateMinimumZoomScale:](self, "_updateMinimumZoomScale:", 1);
    -[PUUserTransformTileViewController _updateUserTransformOffset:](self, "_updateUserTransformOffset:", 1);
  }
}

- (void)_updateDisplayTileTransform
{
  void *v3;
  PUModelTileTransform *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  _OWORD v17[3];
  __int128 v18;
  __int128 v19;
  __int128 v20;

  -[PUUserTransformTileViewController userTransformView](self, "userTransformView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUModelTileTransform initWithNoUserInput]([PUModelTileTransform alloc], "initWithNoUserInput");
  -[PUUserTransformTileViewController userTransformTileLayoutInfo](self, "userTransformTileLayoutInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "untransformedContentFrame");
  v7 = v6;
  v9 = v8;
  -[PUTileViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  +[PUDisplayTileTransform displayTileTransformWithModelTileTransform:initialScale:initialSize:displaySize:secondaryDisplayTileTransform:](PUDisplayTileTransform, "displayTileTransformWithModelTileTransform:initialScale:initialSize:displaySize:secondaryDisplayTileTransform:", v4, 0, 1.0, v7, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v18 = 0u;
  if (v3)
    objc_msgSend(v3, "userAffineTransform");
  -[PUUserTransformTileViewController _userInputOriginIdentifier](self, "_userInputOriginIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v3, "hasUserZoomedIn");
  v17[0] = v18;
  v17[1] = v19;
  v17[2] = v20;
  v16 = (void *)objc_msgSend(v13, "newDisplayTileTransformWithUserAffineTransform:userInputOriginIdentifier:isZoomedOut:", v17, v14, v15 ^ 1u);
  -[PUUserTransformTileViewController setDisplayTileTransform:](self, "setDisplayTileTransform:", v16);

}

- (void)_updateMinimumZoomScale:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  double v14;
  id v15;

  v3 = a3;
  -[PUUserTransformTileViewController browsingViewModel](self, "browsingViewModel");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = 1.0;
  if (v5)
  {
    v7 = (void *)v5;
    -[PUUserTransformTileViewController browsingViewModel](self, "browsingViewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isPresentedForPreview");

    if ((v9 & 1) == 0)
    {
      -[PUUserTransformTileViewController browsingViewModel](self, "browsingViewModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isChromeVisible");

      if ((v11 & 1) != 0
        || (-[PUUserTransformTileViewController browsingViewModel](self, "browsingViewModel"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = objc_msgSend(v12, "lastChromeVisibilityChangeReason"),
            v12,
            v13 == 2))
      {
        -[PUUserTransformTileViewController minimumScaleWhileApplyingInsets](self, "minimumScaleWhileApplyingInsets");
        v6 = v14;
      }
    }
  }
  -[PUUserTransformTileViewController userTransformView](self, "userTransformView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMinimumZoomScale:animated:", v3, v6);

}

- (PUUserTransformTileLayoutInfo)userTransformTileLayoutInfo
{
  void *v4;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  -[PUTileController layoutInfo](self, "layoutInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "px_descriptionForAssertionMessage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUUserTransformTileViewController.m"), 246, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.layoutInfo"), v8, v9);

    }
  }
  return (PUUserTransformTileLayoutInfo *)v4;
}

- (void)_updateUserTransformView:(id)a3
{
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
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v23;
  void *v24;
  id v25;

  v25 = a3;
  -[PUUserTransformTileViewController userTransformView](self, "userTransformView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25 && v4)
  {
    objc_msgSend(v25, "contentPixelSize");
    v6 = v5;
    v8 = v7;
    objc_msgSend(v25, "untransformedContentFrame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[PUUserTransformTileViewController displayTileTransform](self, "displayTileTransform");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D7B568], "isOneUpRefreshEnabled"))
    {
      -[PUUserTransformTileViewController assetViewModel](self, "assetViewModel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "isAccessoryViewVisible"))
      {
        -[PUUserTransformTileViewController assetViewModel](self, "assetViewModel");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "contentOffsetForAccessoryFullyVisible");
        if (v21 == *(double *)(MEMORY[0x1E0C9D538] + 8) && v20 == *MEMORY[0x1E0C9D538])
          v23 = 7;
        else
          v23 = 0;

      }
      else
      {
        v23 = 7;
      }

      objc_msgSend(MEMORY[0x1E0D7B568], "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPreferToFillOnDoubleTap:", objc_msgSend(v24, "doubleTapFillsScreen"));

    }
    else if (objc_msgSend(v17, "hasUserInput"))
    {
      v23 = 7;
    }
    else
    {
      v23 = 2;
    }
    objc_msgSend(v4, "setContentPixelSize:", v6, v8);
    objc_msgSend(v4, "setUntransformedContentFrame:", v10, v12, v14, v16);
    objc_msgSend(v4, "setEnabledInteractions:", v23);
    -[PUUserTransformTileViewController _updateUserTransformOffset:](self, "_updateUserTransformOffset:", 0);

  }
}

- (void)_updateUserTransformOffset:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  int v7;
  BOOL v8;
  double v10;
  double v11;
  id v12;

  v3 = a3;
  -[PUUserTransformTileViewController userTransformView](self, "userTransformView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[PUUserTransformTileViewController browsingViewModel](self, "browsingViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v12, "hasUserZoomedIn");
  if (v5)
    v7 = objc_msgSend(v5, "isChromeVisible");
  else
    v7 = 0;
  if (objc_msgSend(MEMORY[0x1E0D7B568], "isOneUpRefreshEnabled"))
    v8 = v6 == 1;
  else
    v8 = 1;
  if (v8 || v7 == 0)
  {
    v10 = *MEMORY[0x1E0C9D538];
    v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    -[PUUserTransformTileViewController offsetWhileApplyingInsets](self, "offsetWhileApplyingInsets");
  }
  objc_msgSend(v12, "setOffset:animated:", v3, v10, v11);

}

- (void)_updateUserTransformPadding
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  -[PUUserTransformTileViewController displayTileTransform](self, "displayTileTransform");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transformPadding");
  v4 = v3;
  v6 = v5;
  -[PUUserTransformTileViewController userTransformView](self, "userTransformView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScrollPadding:", v4, v6);

}

- (void)didChangeAnimating
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUUserTransformTileViewController;
  -[PUTileController didChangeAnimating](&v3, sel_didChangeAnimating);
  -[PUUserTransformTileViewController _updateUserInteractionEnabled](self, "_updateUserInteractionEnabled");
}

- (void)didChangeIsOnPrimaryDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUUserTransformTileViewController;
  -[PUTileViewController didChangeIsOnPrimaryDisplay](&v3, sel_didChangeIsOnPrimaryDisplay);
  -[PUUserTransformTileViewController _updateInteractionHostViewRegistration](self, "_updateInteractionHostViewRegistration");
}

- (BOOL)pointInsideContentView:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y;
  double x;
  id v7;
  PUPointDisplayLocationProvider *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = -[PUPointDisplayLocationProvider initWithPoint:inCoordinateSpace:]([PUPointDisplayLocationProvider alloc], "initWithPoint:inCoordinateSpace:", v7, x, y);

  -[PUUserTransformTileViewController userTransformView](self, "userTransformView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v9, "contentContainsLocationFromProvider:", v8);

  return (char)v7;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  if (self->_userInteractionEnabled != a3)
  {
    self->_userInteractionEnabled = a3;
    -[PUUserTransformTileViewController _updateUserInteractionEnabled](self, "_updateUserInteractionEnabled");
  }
}

- (void)_updateUserInteractionEnabled
{
  _BOOL8 v3;
  id v4;

  v3 = !-[PUTileController isAnimating](self, "isAnimating")
    && -[PUUserTransformTileViewController userInteractionEnabled](self, "userInteractionEnabled");
  -[PUTileViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", v3);

}

- (id)_userInputOriginIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  void *v9;
  CGSize v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PUUserTransformTileViewController _identifier](self, "_identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUUserTransformTileViewController userTransformView](self, "userTransformView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v11.width = v6;
  v11.height = v7;
  NSStringFromCGSize(v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ size=%@"), v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_updateInteractionHostViewRegistration
{
  void *v3;
  id v4;

  if (-[PUTileViewController isOnPrimaryDisplay](self, "isOnPrimaryDisplay"))
  {
    -[PUUserTransformTileViewController assetViewModel](self, "assetViewModel");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PUUserTransformTileViewController interactionHostView](self, "interactionHostView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerView:forImageAnalysisInteractionHostMode:", v3, 1);

  }
}

- (void)zoomInOnLocationFromProvider:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUUserTransformTileViewController userTransformView](self, "userTransformView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoomInOnLocationFromProvider:", v4);

}

- (void)zoomOut:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PUUserTransformTileViewController userTransformView](self, "userTransformView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoomOut:", v3);

}

- (BOOL)isZoomedIn
{
  void *v2;
  char v3;

  -[PUUserTransformTileViewController userTransformView](self, "userTransformView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasUserZoomedIn");

  return v3;
}

- (void)_updateAssetViewModelIsZoomedIn
{
  void *v3;
  void *v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  uint64_t *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  if (-[PUTileController isActive](self, "isActive"))
  {
    -[PUUserTransformTileViewController assetViewModel](self, "assetViewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUUserTransformTileViewController userTransformView](self, "userTransformView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasUserZoomedIn");

    if (v5 != objc_msgSend(v3, "isZoomedIn"))
    {
      if (v5)
      {
        v12 = MEMORY[0x1E0C809B0];
        v6 = __68__PUUserTransformTileViewController__updateAssetViewModelIsZoomedIn__block_invoke;
        v7 = &v12;
LABEL_7:
        v7[1] = 3221225472;
        v7[2] = (uint64_t)v6;
        v7[3] = (uint64_t)&unk_1E58ABD10;
        v10 = v3;
        v7[4] = (uint64_t)v10;
        objc_msgSend(v10, "performChanges:", v7);

        goto LABEL_8;
      }
      -[PUUserTransformTileViewController userTransformView](self, "userTransformView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isTrackingZoomGesture");

      if ((v9 & 1) == 0)
      {
        v11 = MEMORY[0x1E0C809B0];
        v6 = __68__PUUserTransformTileViewController__updateAssetViewModelIsZoomedIn__block_invoke_2;
        v7 = &v11;
        goto LABEL_7;
      }
    }
LABEL_8:

  }
}

- (void)_updateAssetViewModelProperties
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  if (-[PUTileController isActive](self, "isActive"))
  {
    -[PUUserTransformTileViewController assetViewModel](self, "assetViewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUUserTransformTileViewController displayTileTransform](self, "displayTileTransform");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__PUUserTransformTileViewController__updateAssetViewModelProperties__block_invoke;
    v7[3] = &unk_1E58AB790;
    v7[4] = self;
    v8 = v3;
    v9 = v4;
    v5 = v4;
    v6 = v3;
    objc_msgSend(v6, "performChanges:", v7);

  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[PUUserTransformTileViewController assetViewModel](self, "assetViewModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v9)
  {
    -[PUUserTransformTileViewController _handleAssetViewModelChange:](self, "_handleAssetViewModelChange:", v6);
  }
  else
  {
    -[PUUserTransformTileViewController browsingViewModel](self, "browsingViewModel");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
      -[PUUserTransformTileViewController _handleBrowsingViewModelChange:](self, "_handleBrowsingViewModelChange:", v6);
  }

}

- (BOOL)userTransformView:(id)a3 shouldReceiveTouchAtPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  PUPointDisplayLocationProvider *v8;
  void *v9;
  char v10;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = -[PUPointDisplayLocationProvider initWithPoint:inCoordinateSpace:]([PUPointDisplayLocationProvider alloc], "initWithPoint:inCoordinateSpace:", v7, x, y);

  if (self->_delegateRespondsTo.shouldReceiveTouchAtLocationFromProvider)
  {
    -[PUUserTransformTileViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userTransformTileViewController:shouldReceiveTouchAtLocationFromProvider:", self, v8);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)userTransformViewDidChangeIsZoomedIn:(id)a3
{
  -[PUUserTransformTileViewController _updateUserTransformOffset:](self, "_updateUserTransformOffset:", 1);
  -[PUUserTransformTileViewController _updateAssetViewModelIsZoomedIn](self, "_updateAssetViewModelIsZoomedIn");
}

- (PUUserTransformTileViewControllerDelegate)delegate
{
  return (PUUserTransformTileViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (PUUserTransformView)userTransformView
{
  return self->_userTransformView;
}

- (void)_setUserTransformView:(id)a3
{
  objc_storeStrong((id *)&self->_userTransformView, a3);
}

- (BOOL)userInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (PUDisplayTileTransform)displayTileTransform
{
  return self->_displayTileTransform;
}

- (NSString)_identifier
{
  return self->__identifier;
}

- (void)_setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (UIView)interactionHostView
{
  return self->_interactionHostView;
}

- (double)minimumScaleWhileApplyingInsets
{
  return self->_minimumScaleWhileApplyingInsets;
}

- (CGPoint)offsetWhileApplyingInsets
{
  double x;
  double y;
  CGPoint result;

  x = self->_offsetWhileApplyingInsets.x;
  y = self->_offsetWhileApplyingInsets.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionHostView, 0);
  objc_storeStrong((id *)&self->__identifier, 0);
  objc_storeStrong((id *)&self->_displayTileTransform, 0);
  objc_storeStrong((id *)&self->_userTransformView, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __68__PUUserTransformTileViewController__updateAssetViewModelProperties__block_invoke(id *a1)
{
  void *v2;
  id v3;

  objc_msgSend(a1[4], "_updateAssetViewModelIsZoomedIn");
  objc_msgSend(a1[4], "userTransformView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "setUserTransformingTile:", objc_msgSend(v2, "isUserInteracting"));

  objc_msgSend(a1[6], "modelTileTransform");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "setModelTileTransform:", v3);

}

uint64_t __68__PUUserTransformTileViewController__updateAssetViewModelIsZoomedIn__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsZoomedIn:", 0);
}

uint64_t __68__PUUserTransformTileViewController__updateAssetViewModelIsZoomedIn__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsZoomedIn:", 1);
}

@end
