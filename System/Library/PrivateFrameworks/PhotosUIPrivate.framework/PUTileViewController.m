@implementation PUTileViewController

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;

  -[PUTileViewController _onReadyToDisplayBlock](self, "_onReadyToDisplayBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __31__PUTileViewController_dealloc__block_invoke;
    v10 = &unk_1E58ABAC8;
    v11 = v3;
    px_dispatch_on_main_queue();

  }
  -[PUTileViewController _setOnReadyToDisplayBlock:](self, "_setOnReadyToDisplayBlock:", 0);
  -[PUTileViewController _readinessTimer](self, "_readinessTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[PUTileViewController _setReadinessTimer:](self, "_setReadinessTimer:", 0);
  v6.receiver = self;
  v6.super_class = (Class)PUTileViewController;
  -[PUTileViewController dealloc](&v6, sel_dealloc);
}

- (void)addToTilingView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUTileViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);
  -[PUTileViewController gestureRecognizers](self, "gestureRecognizers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v4, "addGestureRecognizer:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (id)loadView
{
  id v2;
  void *v6;

  if (self->_view)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileViewController.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_view == nil"));

  }
  v2 = objc_alloc(MEMORY[0x1E0DC3F10]);
  return (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (UIView)view
{
  UIView *view;
  void *v5;
  id v6;
  UIView *v7;
  UIView *v8;
  void *v10;

  view = self->_view;
  if (!view)
  {
    if (-[PUTileViewController _isLoadingView](self, "_isLoadingView"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileViewController.m"), 78, CFSTR("Tried to access the view property while it is loading, which isn't supported."));

    }
    -[PUTileViewController _setLoadingView:](self, "_setLoadingView:", 1);
    -[PUTileViewController loadView](self, "loadView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTileViewController _setLoadedView:](self, "_setLoadedView:", v5);
    if (-[PUTileViewController isContentViewEnabled](self, "isContentViewEnabled"))
    {
      v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
      objc_msgSend(v5, "frame");
      v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
      -[UIView setClipsToBounds:](v7, "setClipsToBounds:", 1);
      -[UIView bounds](v7, "bounds");
      objc_msgSend(v5, "setFrame:");
      objc_msgSend(v5, "setAutoresizingMask:", 18);
      -[UIView addSubview:](v7, "addSubview:", v5);
    }
    else
    {
      v7 = v5;
    }
    v8 = self->_view;
    self->_view = v7;

    -[PUTileViewController _setLoadingView:](self, "_setLoadingView:", 0);
    -[PUTileViewController _updateTintView](self, "_updateTintView");
    -[PUTileViewController _updateVisibleRectView](self, "_updateVisibleRectView");
    -[PUTileViewController viewDidLoad](self, "viewDidLoad");

    view = self->_view;
  }
  return view;
}

- (UIView)viewIfLoaded
{
  return self->_view;
}

- (void)setContentViewEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  if (self->_contentViewEnabled != a3)
  {
    v3 = a3;
    self->_contentViewEnabled = a3;
    if (-[PUTileViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[PUTileViewController view](self, "view");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      -[PUTileViewController view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isHidden");

      if (v3)
      {
        objc_msgSend(v20, "superview");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_alloc(MEMORY[0x1E0DC3F10]);
        objc_msgSend(v20, "frame");
        v10 = (void *)objc_msgSend(v9, "initWithFrame:");
        objc_msgSend(v10, "setClipsToBounds:", 1);
        objc_msgSend(v20, "removeFromSuperview");
        objc_msgSend(v10, "bounds");
        objc_msgSend(v20, "setFrame:");
        objc_msgSend(v20, "setAutoresizingMask:", 18);
        objc_msgSend(v20, "setHidden:", 0);
        objc_msgSend(v10, "addSubview:", v20);
        objc_msgSend(v8, "addSubview:", v10);
        -[PUTileViewController _setView:](self, "_setView:", v10);
        -[PUTileViewController _setContentView:](self, "_setContentView:", v10);

      }
      else
      {
        objc_msgSend(v20, "subviews");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v12 != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileViewController.m"), 132, CFSTR("Only able to disable contentView if there is a single child view available to promote."));

        }
        -[PUTileViewController contentView](self, "contentView");
        v13 = (id)objc_claimAutoreleasedReturnValue();

        v14 = v20;
        if (v20 != v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileViewController.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view == [self contentView]"));

          v14 = v20;
        }
        objc_msgSend(v14, "subviews");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "removeFromSuperview");
        objc_msgSend(v20, "frame");
        objc_msgSend(v8, "setFrame:");
        objc_msgSend(v20, "removeFromSuperview");
        -[PUTileController tilingView](self, "tilingView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addSubview:", v8);

        -[PUTileViewController _setView:](self, "_setView:", v20);
        -[PUTileViewController _setContentView:](self, "_setContentView:", 0);
      }

      -[PUTileViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setHidden:", v7);

    }
  }
}

- (UIView)originalView
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[PUTileViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUTileViewController isContentViewEnabled](self, "isContentViewEnabled"))
  {
    objc_msgSend(v3, "subviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return (UIView *)v3;
}

- (void)setIsOnPrimaryDisplay:(BOOL)a3
{
  if (self->_isOnPrimaryDisplay != a3)
  {
    self->_isOnPrimaryDisplay = a3;
    -[PUTileViewController didChangeIsOnPrimaryDisplay](self, "didChangeIsOnPrimaryDisplay");
  }
}

- (NSArray)gestureRecognizers
{
  id v3;

  if (!-[PUTileViewController isViewLoaded](self, "isViewLoaded"))
    v3 = -[PUTileViewController loadView](self, "loadView");
  return self->_gestureRecognizers;
}

- (BOOL)isViewLoaded
{
  return self->_view != 0;
}

- (void)becomeReusable
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUTileViewController;
  -[PUTileController becomeReusable](&v4, sel_becomeReusable);
  -[PUTileViewController setIsOnPrimaryDisplay:](self, "setIsOnPrimaryDisplay:", 0);
  -[PUTileViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[PUTileViewController _invalidateTintView](self, "_invalidateTintView");
  -[PUTileViewController _setEdgeAntialiasingEnabled:](self, "_setEdgeAntialiasingEnabled:", 0);
  -[PUTileController setShouldPreserveCurrentContent:](self, "setShouldPreserveCurrentContent:", 0);
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUTileViewController;
  -[PUTileController prepareForReuse](&v4, sel_prepareForReuse);
  -[PUTileViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[PUTileViewController _updateTintView](self, "_updateTintView");
  -[PUTileViewController _handleReadinessForced:](self, "_handleReadinessForced:", 1);
}

- (id)presentationLayoutInfo
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  float v19;
  __int128 v20;
  double m43;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  CATransform3D v34;
  CGAffineTransform v35;
  CATransform3D v36;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)PUTileViewController;
  -[PUTileController presentationLayoutInfo](&v37, sel_presentationLayoutInfo);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileViewController.m"), 212, CFSTR("missing layout info"));

  }
  -[PUTileViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileViewController.m"), 215, CFSTR("missing view"));

  }
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentationLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7 || objc_msgSend(v7, "isHidden"))
  {
    v9 = v6;

    v8 = v9;
  }
  objc_msgSend(v8, "position");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v8, "bounds");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v8, "opacity");
  v19 = v18;
  v20 = 0uLL;
  memset(&v36, 0, sizeof(v36));
  if (v8)
  {
    objc_msgSend(v8, "transform");
    v20 = 0uLL;
  }
  *(_OWORD *)&v35.c = v20;
  *(_OWORD *)&v35.tx = v20;
  *(_OWORD *)&v35.a = v20;
  v34 = v36;
  CATransform3DGetAffineTransform(&v35, &v34);
  m43 = v36.m43;
  -[PUTileController tilingView](self, "tilingView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileViewController.m"), 231, CFSTR("missing tiling view"));

  }
  objc_msgSend(v22, "fixedCoordinateSystem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "contentCoordinateSystem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v24, v23, v11, v13);
  v27 = v26;

  -[PUTileController layoutInfo](self, "layoutInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&v34.m11 = *(_OWORD *)&v35.a;
  *(_OWORD *)&v34.m13 = *(_OWORD *)&v35.c;
  *(_OWORD *)&v34.m21 = *(_OWORD *)&v35.tx;
  objc_msgSend(v28, "layoutInfoWithCenter:size:alpha:transform:zPosition:coordinateSystem:", &v34, v23, v25, v27, v15, v17, v19, m43);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (BOOL)isPresentationActive
{
  void *v2;
  void *v3;
  void *v4;

  -[PUTileViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4 != 0;
}

- (void)applyLayoutInfo:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  void (**v20)(void *, _QWORD);
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  __int128 v40;
  CGFloat v41;
  void *v42;
  double v43;
  void *v44;
  int v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  _BOOL4 v54;
  _BOOL4 v55;
  uint64_t v56;
  void *v57;
  id v58;
  void *v59;
  _BOOL4 v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  objc_super v77;
  CATransform3D v78;
  CATransform3D m;
  CATransform3D v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD aBlock[4];
  id v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;
  CGPoint v97;
  CGPoint v98;
  CGPoint v99;
  CGPoint v100;

  v96 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileViewController.m"), 245, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layoutInfo != nil"));

  }
  -[PUTileController tilingView](self, "tilingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileViewController.m"), 248, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tilingView != nil"));

  }
  objc_msgSend(v5, "center");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v5, "coordinateSystem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentCoordinateSystem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v11, v12, v8, v10);
  v15 = v14;

  -[PUTileViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "center");
  if (v18 != v13 || v17 != v15)
  {
    if (!CGFloatIsValid() || (CGFloatIsValid() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v97.x = v13;
      v97.y = v15;
      NSStringFromCGPoint(v97);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "center");
      NSStringFromCGPoint(v98);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "coordinateSystem");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "coordinateSystemOrigin");
      NSStringFromCGPoint(v99);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contentCoordinateSystem");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "coordinateSystemOrigin");
      NSStringFromCGPoint(v100);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileViewController.m"), 253, CFSTR("invalid converted center: %@, from %@ + coordinate origins: %@ to %@"), v72, v68, v69, v71);

    }
    objc_msgSend(v16, "setCenter:", v13, v15);
  }
  v73 = v6;
  objc_msgSend(v5, "alpha");
  v75 = v16;
  objc_msgSend(v16, "setAlpha:");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__PUTileViewController_applyLayoutInfo___block_invoke;
  aBlock[3] = &unk_1E58A91B8;
  v19 = v5;
  v93 = v19;
  v20 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  -[PUTileViewController viewsForApplyingCornerRadius](self, "viewsForApplyingCornerRadius");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v89 != v24)
          objc_enumerationMutation(v21);
        v20[2](v20, *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
    }
    while (v23);
  }

  if (-[PUTileViewController isContentViewEnabled](self, "isContentViewEnabled"))
  {
    -[PUTileViewController contentView](self, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void *, void *))v20)[2](v20, v26);

  }
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  -[PUTileViewController viewsForApplyingBorder](self, "viewsForApplyingBorder");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v85;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v85 != v30)
          objc_enumerationMutation(v27);
        objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * j), "layer");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "borderWidth");
        objc_msgSend(v32, "setBorderWidth:");
        objc_msgSend(v19, "borderColor");
        v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v32, "setBorderColor:", objc_msgSend(v33, "CGColor"));

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
    }
    while (v29);
  }

  if (-[PUTileViewController isContentViewEnabled](self, "isContentViewEnabled"))
  {
    objc_msgSend(v19, "parallaxOffset");
    v35 = -v34;
    v37 = -v36;
  }
  else
  {
    v35 = *MEMORY[0x1E0C9D538];
    v37 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  objc_msgSend(v19, "size");
  objc_msgSend(v75, "setBounds:", v35, v37, v38, v39);
  v40 = 0uLL;
  v82 = 0u;
  v83 = 0u;
  v81 = 0u;
  if (v5)
  {
    objc_msgSend(v19, "transform");
    v40 = 0uLL;
  }
  *(_OWORD *)&v80.m41 = v40;
  *(_OWORD *)&v80.m43 = v40;
  *(_OWORD *)&v80.m31 = v40;
  *(_OWORD *)&v80.m33 = v40;
  *(_OWORD *)&v80.m21 = v40;
  *(_OWORD *)&v80.m23 = v40;
  *(_OWORD *)&v80.m11 = v40;
  *(_OWORD *)&v80.m13 = v40;
  *(_OWORD *)&m.m11 = v81;
  *(_OWORD *)&m.m13 = v82;
  *(_OWORD *)&m.m21 = v83;
  CATransform3DMakeAffineTransform(&v80, (CGAffineTransform *)&m);
  objc_msgSend(v19, "zPosition");
  v78 = v80;
  CATransform3DTranslate(&m, &v78, 0.0, 0.0, v41);
  v80 = m;
  objc_msgSend(v75, "layer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  m = v80;
  objc_msgSend(v42, "setTransform:", &m);

  v43 = *((double *)&v81 + 1);
  if (*((double *)&v81 + 1) != 0.0)
  {
    +[PUTilingViewSettings sharedInstance](PUTilingViewSettings, "sharedInstance", *((double *)&v81 + 1));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "allowsEdgeAntialiasing");

    if (v45)
      -[PUTileViewController _setEdgeAntialiasingEnabled:](self, "_setEdgeAntialiasingEnabled:", 1);
  }
  objc_msgSend(v19, "cropInsets", v43);
  v49 = v48;
  v51 = v50;
  v52 = v46;
  v53 = v47;
  v54 = v50 == *(double *)(MEMORY[0x1E0DC49E8] + 8);
  if (v48 != *MEMORY[0x1E0DC49E8])
    v54 = 0;
  if (v47 != *(double *)(MEMORY[0x1E0DC49E8] + 24))
    v54 = 0;
  v55 = v46 == *(double *)(MEMORY[0x1E0DC49E8] + 16) && v54;
  -[PUTileViewController _maskView](self, "_maskView");
  v56 = objc_claimAutoreleasedReturnValue();
  v57 = (void *)v56;
  if (v56 || v55)
  {
    if (v56)
      v60 = v55;
    else
      v60 = 0;
    if (v60)
    {
      objc_msgSend(v75, "setMaskView:", 0);
      -[PUTileViewController _setMaskView:](self, "_setMaskView:", 0);
      v61 = v73;
LABEL_50:
      objc_msgSend(v75, "bounds");
      objc_msgSend(v57, "setFrame:", v51 + v62, v49 + v63, v64 - (v51 + v53), v65 - (v49 + v52));

      goto LABEL_51;
    }
  }
  else
  {
    v58 = objc_alloc(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v75, "bounds");
    v57 = (void *)objc_msgSend(v58, "initWithFrame:");
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setBackgroundColor:", v59);

    objc_msgSend(v57, "setOpaque:", 1);
    objc_msgSend(v75, "setMaskView:", v57);
    -[PUTileViewController _setMaskView:](self, "_setMaskView:", v57);
  }
  v61 = v73;
  if (v57)
    goto LABEL_50;
LABEL_51:
  v77.receiver = self;
  v77.super_class = (Class)PUTileViewController;
  -[PUTileController applyLayoutInfo:](&v77, sel_applyLayoutInfo_, v19);

}

- (NSArray)viewsForApplyingBorder
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!-[PUTileViewController isViewLoaded](self, "isViewLoaded"))
    return (NSArray *)0;
  -[PUTileViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)viewsForApplyingCornerRadius
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!-[PUTileViewController isViewLoaded](self, "isViewLoaded"))
    return (NSArray *)0;
  -[PUTileViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)removeAllAnimations
{
  id v3;
  id v4;

  -[PUTileViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pu_removeAllGeometryAnimationsRecursively:", 0);
  -[PUTileViewController loadedView](self, "loadedView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v3)
    objc_msgSend(v3, "pu_removeAllGeometryAnimationsRecursively:", 0);

}

- (CGRect)visibleRect
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
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect result;
  CGRect v36;

  if (-[PUTileViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PUTileController tilingView](self, "tilingView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[PUTileViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertRect:fromView:", v3, v5, v7, v9, v11);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(v12, "bounds");
    v36.origin.x = v21;
    v36.origin.y = v22;
    v36.size.width = v23;
    v36.size.height = v24;
    v33.origin.x = v14;
    v33.origin.y = v16;
    v33.size.width = v18;
    v33.size.height = v20;
    v34 = CGRectIntersection(v33, v36);
    x = v34.origin.x;
    y = v34.origin.y;
    width = v34.size.width;
    height = v34.size.height;

  }
  else
  {
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v29 = x;
  v30 = y;
  v31 = width;
  v32 = height;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (BOOL)wantsVisibleRectChanges
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUTileViewController;
  v3 = -[PUTileController wantsVisibleRectChanges](&v9, sel_wantsVisibleRectChanges);
  +[PUTilingViewSettings sharedInstance](PUTilingViewSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "showVisibleRects"))
  {
    -[PUTileController layoutInfo](self, "layoutInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tileKind");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("PUTileKindItemContent"));

    v3 |= v7;
  }

  return v3;
}

- (void)didChangeVisibleRect
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUTileViewController;
  -[PUTileController didChangeVisibleRect](&v3, sel_didChangeVisibleRect);
  -[PUTileViewController _updateVisibleRectView](self, "_updateVisibleRectView");
}

- (void)_updateDynamicStateDebugging
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  _BOOL4 v8;
  double v9;
  dispatch_time_t v10;
  _QWORD v11[4];
  id v12;
  id location;

  +[PUTilingViewSettings sharedInstance](PUTilingViewSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showSnapshottableTiles");

  if (v4)
  {
    -[PUTileViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "setBorderColor:", objc_msgSend(v7, "CGColor"));

    v8 = -[PUTileController shouldAvoidInPlaceSnapshottedFadeOut](self, "shouldAvoidInPlaceSnapshottedFadeOut");
    v9 = 0.0;
    if (v8)
      v9 = 10.0;
    objc_msgSend(v6, "setBorderWidth:", v9);
    objc_initWeak(&location, self);
    v10 = dispatch_time(0, 50000000);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52__PUTileViewController__updateDynamicStateDebugging__block_invoke;
    v11[3] = &unk_1E58AB2F8;
    objc_copyWeak(&v12, &location);
    dispatch_after(v10, MEMORY[0x1E0C80D38], v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
}

- (void)_updateTintView
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  +[PUTilingViewSettings sharedInstance](PUTilingViewSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tintTiles");

  -[PUTileViewController _tintView](self, "_tintView");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v4)
  {
    v16 = (void *)v5;
    -[PUTileViewController _invalidateTintView](self, "_invalidateTintView");
    goto LABEL_6;
  }
  if (!v5)
  {
    v16 = 0;
    v7 = -[PUTileViewController isViewLoaded](self, "isViewLoaded");
    v6 = 0;
    if (v7)
    {
      -[PUTileViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc(MEMORY[0x1E0DC3F10]);
      objc_msgSend(v8, "bounds");
      v10 = (void *)objc_msgSend(v9, "initWithFrame:");
      objc_msgSend(v10, "setAutoresizingMask:", 18);
      objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
      objc_msgSend(v8, "addSubview:", v10);
      -[PUTileViewController _setTintView:](self, "_setTintView:", v10);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", (double)fmod(v11 / 10.0, 1.0), 1.0, 1.0, 1.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "colorWithAlphaComponent:", 0.5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackgroundColor:", v13);

      objc_msgSend(v10, "setOpaque:", 0);
      objc_msgSend(v10, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_retainAutorelease(v12);
      objc_msgSend(v14, "setBorderColor:", objc_msgSend(v15, "CGColor"));
      objc_msgSend(v14, "setBorderWidth:", 2.0);

LABEL_6:
      v6 = v16;
    }
  }

}

- (void)_invalidateTintView
{
  void *v3;

  -[PUTileViewController _tintView](self, "_tintView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[PUTileViewController _setTintView:](self, "_setTintView:", 0);
}

- (void)_updateVisibleRectView
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  double x;
  double y;
  double width;
  double height;
  _BOOL8 IsEmpty;
  id v16;
  CGRect v17;

  +[PUTilingViewSettings sharedInstance](PUTilingViewSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "showVisibleRects"))
    v4 = -[PUTileViewController isViewLoaded](self, "isViewLoaded");
  else
    v4 = 0;

  -[PUTileViewController _visibleRectView](self, "_visibleRectView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v16 = v5;
    -[PUTileViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 1.0, 0.0, 0.100000001);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBackgroundColor:", v8);

      objc_msgSend(v7, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v9, "setBorderColor:", objc_msgSend(v10, "CGColor"));

      objc_msgSend(v9, "setBorderWidth:", 2.0);
      objc_msgSend(v7, "setOpaque:", 0);
      objc_msgSend(v6, "addSubview:", v7);
      -[PUTileViewController _setVisibleRectView:](self, "_setVisibleRectView:", v7);

    }
    -[PUTileViewController visibleRect](self, "visibleRect");
    x = v17.origin.x;
    y = v17.origin.y;
    width = v17.size.width;
    height = v17.size.height;
    IsEmpty = CGRectIsEmpty(v17);
    if (!IsEmpty)
      objc_msgSend(v16, "setFrame:", x, y, width, height);
    objc_msgSend(v16, "setHidden:", IsEmpty);

    goto LABEL_12;
  }
  if (v5)
  {
    v16 = v5;
    objc_msgSend(v5, "removeFromSuperview");
    -[PUTileViewController _setVisibleRectView:](self, "_setVisibleRectView:", 0);
LABEL_12:
    v5 = v16;
  }

}

- (void)_setReadyForDisplay:(BOOL)a3
{
  if (self->_isReadyForDisplay != a3)
  {
    self->_isReadyForDisplay = a3;
    -[PUTileViewController _handleReadinessForced:](self, "_handleReadinessForced:", 0);
  }
}

- (void)notifyWhenReadyForDisplayWithTimeOut:(double)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  v6 = a4;
  -[PUTileViewController _setOnReadyToDisplayBlock:](self, "_setOnReadyToDisplayBlock:", v6);
  -[PUTileViewController _handleReadinessForced:](self, "_handleReadinessForced:", 0);
  -[PUTileViewController _onReadyToDisplayBlock](self, "_onReadyToDisplayBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_initWeak(&location, self);
    v8 = (void *)MEMORY[0x1E0C99E88];
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __79__PUTileViewController_notifyWhenReadyForDisplayWithTimeOut_completionHandler___block_invoke;
    v13 = &unk_1E58AB2F8;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v8, "pu_scheduledTimerWithTimeInterval:repeats:block:", 0, &v10, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTileViewController _setReadinessTimer:](self, "_setReadinessTimer:", v9, v10, v11, v12, v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

- (void)_handleReadinessForced:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[PUTileViewController _onReadyToDisplayBlock](self, "_onReadyToDisplayBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (-[PUTileViewController isReadyForDisplay](self, "isReadyForDisplay") || v3))
  {
    -[PUTileViewController _setOnReadyToDisplayBlock:](self, "_setOnReadyToDisplayBlock:", 0);
    -[PUTileViewController _readinessTimer](self, "_readinessTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    -[PUTileViewController _setReadinessTimer:](self, "_setReadinessTimer:", 0);
    v7 = v5;
    px_dispatch_on_main_queue();

  }
}

- (void)_setEdgeAntialiasingEnabled:(BOOL)a3
{
  if (self->__edgeAntialiasingEnabled != a3)
  {
    self->__edgeAntialiasingEnabled = a3;
    -[PUTileViewController setEdgeAntialiasingEnabled:](self, "setEdgeAntialiasingEnabled:");
  }
}

- (void)_setGestureRecognizers:(id)a3
{
  objc_storeStrong((id *)&self->_gestureRecognizers, a3);
}

- (void)_setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (BOOL)isContentViewEnabled
{
  return self->_contentViewEnabled;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)_setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (BOOL)isOnPrimaryDisplay
{
  return self->_isOnPrimaryDisplay;
}

- (UIView)loadedView
{
  return self->_loadedView;
}

- (void)_setLoadedView:(id)a3
{
  objc_storeStrong((id *)&self->_loadedView, a3);
}

- (BOOL)_isLoadingView
{
  return self->__loadingView;
}

- (void)_setLoadingView:(BOOL)a3
{
  self->__loadingView = a3;
}

- (UIView)_tintView
{
  return self->__tintView;
}

- (void)_setTintView:(id)a3
{
  objc_storeStrong((id *)&self->__tintView, a3);
}

- (UIView)_visibleRectView
{
  return self->__visibleRectView;
}

- (void)_setVisibleRectView:(id)a3
{
  objc_storeStrong((id *)&self->__visibleRectView, a3);
}

- (id)_onReadyToDisplayBlock
{
  return self->__onReadyToDisplayBlock;
}

- (void)_setOnReadyToDisplayBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSTimer)_readinessTimer
{
  return self->__readinessTimer;
}

- (void)_setReadinessTimer:(id)a3
{
  objc_storeStrong((id *)&self->__readinessTimer, a3);
}

- (BOOL)_edgeAntialiasingEnabled
{
  return self->__edgeAntialiasingEnabled;
}

- (UIView)_maskView
{
  return self->__maskView;
}

- (void)_setMaskView:(id)a3
{
  objc_storeStrong((id *)&self->__maskView, a3);
}

- (BOOL)isReadyForDisplay
{
  return self->_isReadyForDisplay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__maskView, 0);
  objc_storeStrong((id *)&self->__readinessTimer, 0);
  objc_storeStrong(&self->__onReadyToDisplayBlock, 0);
  objc_storeStrong((id *)&self->__visibleRectView, 0);
  objc_storeStrong((id *)&self->__tintView, 0);
  objc_storeStrong((id *)&self->_loadedView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_gestureRecognizers, 0);
}

uint64_t __47__PUTileViewController__handleReadinessForced___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __79__PUTileViewController_notifyWhenReadyForDisplayWithTimeOut_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleReadinessForced:", 1);

}

void __52__PUTileViewController__updateDynamicStateDebugging__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateDynamicStateDebugging");

}

void __40__PUTileViewController_applyLayoutInfo___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  double v7;
  id v8;

  objc_msgSend(a2, "layer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cornerRadius");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "cornerCurve");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "cornerMask");
  objc_msgSend(v8, "setCornerCurve:", v5);
  if (v6 && objc_msgSend(v8, "maskedCorners") != v6)
    objc_msgSend(v8, "setMaskedCorners:", v6);
  objc_msgSend(v8, "cornerRadius");
  if (v4 != v7)
    objc_msgSend(v8, "setCornerRadius:", v4);

}

uint64_t __31__PUTileViewController_dealloc__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
