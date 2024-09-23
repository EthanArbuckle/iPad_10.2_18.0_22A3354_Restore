@implementation PBUIFakeBlurView

- (void)rotateToInterfaceOrientation:(int64_t)a3
{
  PBUIWallpaperView *wallpaperView;
  double v6;
  int IsActive;
  __int128 v8;
  CGAffineTransform *v9;
  double v10;
  CGAffineTransform v11;
  char v12;
  _OWORD v13[3];
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  if ((PBUIWallpaperTransformOptionsShouldIgnoreRotation(self->_transformOptions) & 1) == 0)
  {
    if (PBUIWallpaperTransformOptionsShouldIgnoreLandscapeRotation(self->_transformOptions))
    {
      wallpaperView = self->_wallpaperView;
      switch(a3)
      {
        case 1:
          v6 = 0.0;
          break;
        case 3:
          v6 = 1.57079633;
          break;
        case 4:
          v6 = -1.57079633;
          break;
        default:
          v6 = 3.14159265;
          if (a3 != 2)
            v6 = 0.0;
          break;
      }
      CGAffineTransformMakeRotation(&v14, v6);
      UIIntegralTransform();
      CGAffineTransformInvert(&v16, &v15);
      v9 = &v16;
    }
    else
    {
      IsActive = soft_PUIDynamicRotationIsActive();
      wallpaperView = self->_wallpaperView;
      if (IsActive)
      {
        v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v13[0] = *MEMORY[0x1E0C9BAA8];
        v13[1] = v8;
        v13[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        v9 = (CGAffineTransform *)v13;
      }
      else
      {
        switch(a3)
        {
          case 1:
            v10 = 0.0;
            break;
          case 3:
            v10 = 1.57079633;
            break;
          case 4:
            v10 = -1.57079633;
            break;
          default:
            v10 = 3.14159265;
            if (a3 != 2)
              v10 = 0.0;
            break;
        }
        CGAffineTransformMakeRotation(&v11, v10);
        UIIntegralTransform();
        v9 = (CGAffineTransform *)&v12;
      }
    }
    -[PBUIWallpaperView setTransform:](wallpaperView, "setTransform:", v9);
  }
  -[PBUIFakeBlurView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)willMoveToWindow:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBUIFakeBlurView;
  -[PBUIFakeBlurView willMoveToWindow:](&v5, sel_willMoveToWindow_, a3);
  -[PBUIFakeBlurView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimations");

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBUIFakeBlurView;
  -[PBUIFakeBlurView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[PBUIFakeBlurView _createOrRemoveMatchMoveAnimationIfNeeded]((unsigned __int8 *)self);
}

- (void)_createOrRemoveMatchMoveAnimationIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  char v17;
  int v18;
  void *v19;
  id v20;
  void *v21;
  char v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  void *v31;
  double MinX;
  void *v33;
  void *v34;
  double MaxX;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[5];
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v45[4] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "window");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "superlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "superlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "superlayer");
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
    if (!v4)
      goto LABEL_18;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AlignFakeWallpaperToLayer-%p"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "bounds");
    v9 = v8;
    v11 = v10;
    objc_msgSend(a1, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    if (v13 == -1)
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "userInterfaceIdiom");

      v14 = (v16 & 0xFFFFFFFFFFFFFFFBLL) != 1;
    }
    else
    {
      v14 = v13 == 0;
    }
    v17 = 0;
    if (v14 && v11 < v9)
      v17 = soft_PUIFeatureEnabled(0);
    v18 = a1[448];
    objc_msgSend(a1, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (!v18 || (v17 & 1) != 0)
    {
      objc_msgSend(v19, "removeAnimationForKey:", v7);
    }
    else
    {
      objc_msgSend(v19, "animationKeys");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "containsObject:", v7);

      if ((v22 & 1) != 0)
      {
LABEL_17:

LABEL_18:
        return;
      }
      objc_msgSend(v4, "bounds");
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;
      objc_msgSend(a1, "setFrame:");
      objc_msgSend(a1, "layoutIfNeeded");
      v20 = objc_alloc_init(MEMORY[0x1E0CD27C0]);
      objc_msgSend(v20, "setSourceLayer:", v4);
      v31 = (void *)MEMORY[0x1E0CB3B18];
      v46.origin.x = v24;
      v46.origin.y = v26;
      v46.size.width = v28;
      v46.size.height = v30;
      MinX = CGRectGetMinX(v46);
      v47.origin.x = v24;
      v47.origin.y = v26;
      v47.size.width = v28;
      v47.size.height = v30;
      objc_msgSend(v31, "valueWithCGPoint:", MinX, CGRectGetMinY(v47));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v33;
      v34 = (void *)MEMORY[0x1E0CB3B18];
      v48.origin.x = v24;
      v48.origin.y = v26;
      v48.size.width = v28;
      v48.size.height = v30;
      MaxX = CGRectGetMaxX(v48);
      v49.origin.x = v24;
      v49.origin.y = v26;
      v49.size.width = v28;
      v49.size.height = v30;
      objc_msgSend(v34, "valueWithCGPoint:", MaxX, CGRectGetMinY(v49));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v45[1] = v36;
      v37 = (void *)MEMORY[0x1E0CB3B18];
      v50.origin.x = v24;
      v50.origin.y = v26;
      v50.size.width = v28;
      v50.size.height = v30;
      v38 = CGRectGetMaxX(v50);
      v51.origin.x = v24;
      v51.origin.y = v26;
      v51.size.width = v28;
      v51.size.height = v30;
      objc_msgSend(v37, "valueWithCGPoint:", v38, CGRectGetMaxY(v51));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v45[2] = v39;
      v40 = (void *)MEMORY[0x1E0CB3B18];
      v52.origin.x = v24;
      v52.origin.y = v26;
      v52.size.width = v28;
      v52.size.height = v30;
      v41 = CGRectGetMinX(v52);
      v53.origin.x = v24;
      v53.origin.y = v26;
      v53.size.width = v28;
      v53.size.height = v30;
      objc_msgSend(v40, "valueWithCGPoint:", v41, CGRectGetMaxY(v53));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v45[3] = v42;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 4);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setSourcePoints:", v43);

      objc_msgSend(v20, "setDuration:", INFINITY);
      objc_msgSend(v20, "setFillMode:", *MEMORY[0x1E0CD2B58]);
      objc_msgSend(v20, "setRemovedOnCompletion:", 0);
      objc_msgSend(a1, "layer");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addAnimation:forKey:", v20, v7);

    }
    goto LABEL_17;
  }
}

- (void)layoutSubviews
{
  double v3;
  double x;
  double v5;
  double y;
  double v7;
  double width;
  double v9;
  double height;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  PBUIWallpaperReachabilityCoordinating *reachabilityCoordinator;
  void *v19;
  _BOOL4 v20;
  double v21;
  CGFloat v22;
  objc_super v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v23.receiver = self;
  v23.super_class = (Class)PBUIFakeBlurView;
  -[PBUIFakeBlurView layoutSubviews](&v23, sel_layoutSubviews);
  -[UIView sizeToFit](self->_providedImageView, "sizeToFit");
  -[PBUIFakeBlurView bounds](self, "bounds");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  if (soft_PUIDynamicRotationIsActive() && height > width)
  {
    BSRectGetCenter();
    v12 = v11;
    v14 = v13;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_referenceBounds");
    width = v16;
    height = v17;

    x = v12 - width * 0.5;
    y = v14 - height * 0.5;
  }
  reachabilityCoordinator = self->_reachabilityCoordinator;
  if (reachabilityCoordinator)
  {
    -[PBUIFakeBlurView window](self, "window");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[PBUIWallpaperReachabilityCoordinating isWindowIgnoredForReachability:](reachabilityCoordinator, "isWindowIgnoredForReachability:", v19) & 1) != 0)
    {

    }
    else
    {
      v20 = -[PBUIFakeBlurView shouldMatchWallpaperPosition](self, "shouldMatchWallpaperPosition");

      if (v20)
      {
        -[PBUIWallpaperReachabilityCoordinating effectiveReachabilityYOffset](self->_reachabilityCoordinator, "effectiveReachabilityYOffset");
        v22 = -v21;
        v24.origin.x = x;
        v24.origin.y = y;
        v24.size.width = width;
        v24.size.height = height;
        v25 = CGRectOffset(v24, 0.0, v22);
        x = v25.origin.x;
        y = v25.origin.y;
        width = v25.size.width;
        height = v25.size.height;
      }
    }
  }
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v27 = CGRectOffset(v26, self->_wallpaperOffset.x, self->_wallpaperOffset.y);
  -[PBUIWallpaperView setFrame:](self->_wallpaperView, "setFrame:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);
  -[PBUIWallpaperView setNeedsLayout](self->_wallpaperView, "setNeedsLayout");
}

- (BOOL)shouldMatchWallpaperPosition
{
  return self->_shouldMatchWallpaperPosition;
}

- (void)offsetWallpaperBy:(CGPoint)a3
{
  if (self->_wallpaperOffset.x != a3.x || self->_wallpaperOffset.y != a3.y)
  {
    self->_wallpaperOffset = a3;
    -[PBUIFakeBlurView setNeedsLayout](self, "setNeedsLayout");
    -[PBUIFakeBlurView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)requestStyle:(int64_t)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  if (self->_requestedStyle != a3)
  {
    self->_requestedStyle = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_imageProvider);

    if (WeakRetained)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[UIView requestStyle:](self->_providedImageView, "requestStyle:", a3);
      -[PBUIFakeBlurView traitCollection](self, "traitCollection");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[PBUIFakeBlurView _updateImageFromProviderWithTraitCollection:]((id *)&self->super.super.super.isa, v8);
    }
    else
    {
      -[PBUIFakeBlurView wallpaperViewController](self, "wallpaperViewController");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_sourceForFakeBlurView:", self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fakeBlurViewOverrideTraitCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIFakeBlurView _updateImageWithSource:overrideTraitCollection:notifyObserver:]((uint64_t)self, v6, v7);

    }
  }
}

- (void)setShouldMatchWallpaperPosition:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_shouldMatchWallpaperPosition != a3)
  {
    v3 = a3;
    self->_shouldMatchWallpaperPosition = a3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIView setShouldMatchWallpaperPosition:](self->_providedImageView, "setShouldMatchWallpaperPosition:", v3);
    -[PBUIFakeBlurView _createOrRemoveMatchMoveAnimationIfNeeded]((unsigned __int8 *)self);
  }
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (void)reconfigureFromProvider
{
  id WeakRetained;
  char v4;
  int64_t v5;
  PBUIWallpaperView *wallpaperView;
  uint64_t v7;
  PBUIWallpaperView *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_imageProvider);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v4 = -[PBUIFakeBlurView transformOptions](self, "transformOptions");
    v5 = -[PBUIFakeBlurView variant](self, "variant");
    wallpaperView = self->_wallpaperView;
    objc_msgSend(v9, "parallaxFactorForVariant:", v5);
    -[PBUIWallpaperView setParallaxFactor:](wallpaperView, "setParallaxFactor:");
    if ((v4 & 8) != 0)
      v7 = 0;
    else
      v7 = objc_msgSend(v9, "parallaxEnabledForVariant:", v5);
    -[PBUIWallpaperView setParallaxEnabled:](self->_wallpaperView, "setParallaxEnabled:", v7);
    WeakRetained = v9;
    if ((v4 & 4) == 0)
    {
      v8 = self->_wallpaperView;
      objc_msgSend(v9, "zoomFactorForVariant:", v5);
      -[PBUIWallpaperView setZoomFactor:](v8, "setZoomFactor:");
      WeakRetained = v9;
    }
  }

}

- (int64_t)effectiveStyle
{
  return self->_effectiveStyle;
}

- (unint64_t)transformOptions
{
  return self->_transformOptions;
}

- (PBUIFakeBlurView)initWithVariant:(int64_t)a3 imageProvider:(id)a4 fakeBlurRegistry:(id)a5 wallpaperViewDelegate:(id)a6 transformOptions:(unint64_t)a7 reachabilityCoordinator:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  PBUIFakeBlurView *v19;
  PBUIWallpaperConfiguration *v20;
  PBUIWallpaperView *v21;
  uint64_t v22;
  PBUIWallpaperView *wallpaperView;
  uint64_t v24;
  UIView *providedImageView;
  void *v26;
  objc_super v28;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v28.receiver = self;
  v28.super_class = (Class)PBUIFakeBlurView;
  v19 = -[PBUIFakeBlurView initWithFrame:](&v28, sel_initWithFrame_);

  if (v19)
  {
    v19->_wallpaperOffset = (CGPoint)*MEMORY[0x1E0C9D538];
    v20 = -[PBUIWallpaperConfiguration initWithVariant:type:]([PBUIWallpaperConfiguration alloc], "initWithVariant:type:", a3, 1);
    v21 = [PBUIWallpaperView alloc];
    v22 = -[PBUIWallpaperView initWithFrame:configuration:variant:cacheGroup:delegate:options:](v21, "initWithFrame:configuration:variant:cacheGroup:delegate:options:", v20, a3, 0, v16, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    wallpaperView = v19->_wallpaperView;
    v19->_wallpaperView = (PBUIWallpaperView *)v22;

    -[PBUIFakeBlurView addSubview:](v19, "addSubview:", v19->_wallpaperView);
    -[PBUIFakeBlurView setTransformOptions:](v19, "setTransformOptions:", a7);
    v24 = objc_msgSend(v14, "newImageProviderView");
    providedImageView = v19->_providedImageView;
    v19->_providedImageView = (UIView *)v24;

    -[UIView setOpaque:](v19->_providedImageView, "setOpaque:", 1);
    -[UIView layer](v19->_providedImageView, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setContentsOpaque:", 1);

    -[PBUIWallpaperView setContentView:](v19->_wallpaperView, "setContentView:", v19->_providedImageView);
    objc_storeWeak((id *)&v19->_imageProvider, v14);
    objc_storeWeak((id *)&v19->_fakeBlurRegistry, v15);
    objc_msgSend(v15, "_registerFakeBlurView:", v19);
    -[PBUIFakeBlurView reconfigureFromProvider](v19, "reconfigureFromProvider");
    v19->_effectiveStyle = -1;
    v19->_requestedStyle = -1;
    v19->_shouldMatchWallpaperPosition = 1;
    objc_storeStrong((id *)&v19->_reachabilityCoordinator, a8);
    -[PBUIWallpaperReachabilityCoordinating addReachabilityObserver:](v19->_reachabilityCoordinator, "addReachabilityObserver:", v19);

  }
  return v19;
}

- (void)setTransformOptions:(unint64_t)a3
{
  PBUIWallpaperView *wallpaperView;
  __int128 v6;
  _OWORD v7[3];

  if (self->_transformOptions != a3)
  {
    self->_transformOptions = a3;
    if (PBUIWallpaperTransformOptionsShouldIgnoreRotation(a3))
    {
      wallpaperView = self->_wallpaperView;
      v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v7[0] = *MEMORY[0x1E0C9BAA8];
      v7[1] = v6;
      v7[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      -[PBUIWallpaperView setTransform:](wallpaperView, "setTransform:", v7);
    }
    -[PBUIWallpaperView setTransformOptions:](self->_wallpaperView, "setTransformOptions:", a3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIView setTransformOptions:](self->_providedImageView, "setTransformOptions:", a3);
  }
}

- (void)_updateImageFromProviderWithTraitCollection:(id *)a1
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  id v7;

  if (a1)
  {
    v7 = a1[53];
    v3 = a1 + 61;
    v4 = a2;
    WeakRetained = objc_loadWeakRetained(v3);
    objc_msgSend(WeakRetained, "imageForWallpaperStyle:variant:traitCollection:", &v7, objc_msgSend(a1, "variant"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PBUIFakeBlurView _setImage:style:notify:]((uint64_t)a1, v6, (uint64_t)v7, 1);
  }
}

- (int64_t)variant
{
  return -[PBUIWallpaperView variant](self->_wallpaperView, "variant");
}

- (void)_setImage:(uint64_t)a3 style:(int)a4 notify:
{
  id WeakRetained;
  int v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];

  v11 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 488));
    v8 = objc_msgSend(WeakRetained, "updateImageProviderView:withImage:", *(_QWORD *)(a1 + 456), v11);

    if (v8)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __43__PBUIFakeBlurView__setImage_style_notify___block_invoke;
      v12[3] = &unk_1E6B94728;
      v12[4] = a1;
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v12);
      objc_msgSend(*(id *)(a1 + 440), "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "reloadValueForKeyPath:", CFSTR("contents"));

      objc_msgSend(*(id *)(a1 + 440), "setNeedsLayout");
    }
    if (*(_QWORD *)(a1 + 432) != a3)
    {
      *(_QWORD *)(a1 + 432) = a3;
      if (a4)
      {
        v10 = objc_loadWeakRetained((id *)(a1 + 480));
        objc_msgSend(v10, "fakeBlurView:didChangeStyle:", a1, *(_QWORD *)(a1 + 432));

      }
    }
  }

}

- (NSString)description
{
  void *v3;
  unint64_t requestedStyle;
  int64_t effectiveStyle;
  void *v6;
  const __CFString *v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  requestedStyle = self->_requestedStyle;
  effectiveStyle = self->_effectiveStyle;
  PBUIWallpaperStyleDescription(requestedStyle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (requestedStyle == effectiveStyle)
  {
    v7 = CFSTR("style");
  }
  else
  {
    v8 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("requestedStyle"));

    PBUIWallpaperStyleDescription(self->_effectiveStyle);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("effectiveStyle");
  }
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v6, v7);

  v10 = (id)objc_msgSend(v3, "appendSuper");
  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (void)_updateImageWithSource:(uint64_t)a1 overrideTraitCollection:(void *)a2 notifyObserver:(void *)a3
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  if (a1)
  {
    v8 = *(_QWORD *)(a1 + 424);
    v5 = a3;
    v6 = a2;
    objc_msgSend((id)objc_opt_class(), "_imageForStyle:withSource:overrideTraitCollection:", &v8, v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PBUIFakeBlurView _setImage:style:notify:](a1, v7, v8, 1);
  }
}

- (double)zoomScale
{
  double result;

  -[PBUIWallpaperView zoomFactor](self->_wallpaperView, "zoomFactor");
  return result;
}

- (void)setZoomScale:(double)a3
{
  -[PBUIWallpaperView setZoomFactor:](self->_wallpaperView, "setZoomFactor:", a3);
}

- (void)handleReachabilityYOffsetDidChange
{
  -[PBUIFakeBlurView setNeedsLayout](self, "setNeedsLayout");
  -[PBUIFakeBlurView layoutIfNeeded](self, "layoutIfNeeded");
}

- (PBUIFakeBlurView)initWithVariant:(int64_t)a3 wallpaperViewController:(id)a4 transformOptions:(unint64_t)a5 reachabilityCoordinator:(id)a6
{
  id v10;
  PBUIFakeBlurView *v11;
  PBUIFakeBlurView *v12;
  void *v13;

  v10 = a4;
  v11 = -[PBUIFakeBlurView initWithVariant:imageProvider:fakeBlurRegistry:wallpaperViewDelegate:transformOptions:reachabilityCoordinator:](self, "initWithVariant:imageProvider:fakeBlurRegistry:wallpaperViewDelegate:transformOptions:reachabilityCoordinator:", a3, self, v10, v10, a5, a6);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_wallpaperViewController, v10);
    objc_msgSend(v10, "_sourceForFakeBlurView:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIFakeBlurView reconfigureWithSource:](v12, "reconfigureWithSource:", v13);

  }
  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PBUIFakeBlurView wallpaperViewController](self, "wallpaperViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_unregisterFakeBlurView:", self);
  if (self->_providedImageView && (objc_opt_respondsToSelector() & 1) != 0)
    -[UIView invalidate](self->_providedImageView, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)PBUIFakeBlurView;
  -[PBUIFakeBlurView dealloc](&v4, sel_dealloc);
}

- (void)reconfigureWithSource:(id)a3
{
  char v4;
  PBUIWallpaperView *wallpaperView;
  uint64_t v6;
  PBUIWallpaperView *v7;
  id v8;

  v8 = a3;
  v4 = -[PBUIFakeBlurView transformOptions](self, "transformOptions");
  wallpaperView = self->_wallpaperView;
  objc_msgSend(v8, "parallaxFactor");
  -[PBUIWallpaperView setParallaxFactor:](wallpaperView, "setParallaxFactor:");
  if ((v4 & 8) != 0 || !objc_msgSend(v8, "parallaxEnabled"))
    v6 = 0;
  else
    v6 = objc_msgSend((id)objc_opt_class(), "allowsParallax");
  -[PBUIWallpaperView setParallaxEnabled:](self->_wallpaperView, "setParallaxEnabled:", v6);
  if ((v4 & 4) == 0)
  {
    v7 = self->_wallpaperView;
    objc_msgSend(v8, "zoomFactor");
    -[PBUIWallpaperView setZoomFactor:](v7, "setZoomFactor:");
  }

}

- (id)_effectiveTraitCollectionForMode:(void *)a1
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (a1)
  {
    objc_msgSend(a1, "wallpaperViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fakeBlurViewOverrideTraitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      if (a2 == 2)
        v5 = 2;
      else
        v5 = 1;
      objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)updateImageWithSource:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PBUIFakeBlurView _effectiveTraitCollectionForMode:](self, objc_msgSend(v4, "wallpaperMode"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PBUIFakeBlurView _updateImageWithSource:overrideTraitCollection:notifyObserver:]((uint64_t)self, v4, v5);

}

- (void)updateImageWithSource:(void *)a3 overrideTraitCollection:
{
  if (a1)
    -[PBUIFakeBlurView _updateImageWithSource:overrideTraitCollection:notifyObserver:](a1, a2, a3);
}

- (void)updateImageFromProviderForWallpaperMode:(int64_t)a3
{
  id v4;

  -[PBUIFakeBlurView _effectiveTraitCollectionForMode:](self, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PBUIFakeBlurView _updateImageFromProviderWithTraitCollection:]((id *)&self->super.super.super.isa, v4);

}

uint64_t __43__PBUIFakeBlurView__setImage_style_notify___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "sizeToFit");
}

+ (id)_imageForStyle:(int64_t *)a3 withSource:(id)a4
{
  return (id)objc_msgSend(a1, "_imageForStyle:withSource:overrideTraitCollection:", a3, a4, 0);
}

+ (id)_imageForStyle:(int64_t *)a3 withSource:(id)a4 overrideTraitCollection:(id)a5
{
  id v8;
  id v9;
  int64_t v10;
  id v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v8 = a4;
  v9 = a5;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  v10 = *a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__PBUIFakeBlurView__imageForStyle_withSource_overrideTraitCollection___block_invoke;
  v13[3] = &unk_1E6B94B78;
  v13[4] = &v14;
  v13[5] = a3;
  objc_msgSend(a1, "_imageForStyle:withSource:overrideTraitCollection:result:", v10, v8, v9, v13);
  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __70__PBUIFakeBlurView__imageForStyle_withSource_overrideTraitCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v7 = a2;
  **(_QWORD **)(a1 + 40) = a4;

}

+ (void)_imageForStyle:(int64_t)a3 withSource:(id)a4 overrideTraitCollection:(id)a5 result:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, id, void *, int64_t);
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t HasTint;
  id v18;
  _QWORD v19[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, id, void *, int64_t))a6;
  if (a3 == 3)
  {
    objc_msgSend(v10, "blurredImage");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "blurredImageURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      a3 = 3;
    else
      a3 = 0;
  }
  else
  {
    objc_msgSend(v10, "legibilitySettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    _WallpaperBackdropParametersForStyleAndAverageColor(a3, v16, (uint64_t)&v34);
    HasTint = _WallpaperStyleHasTint(a3);
    v30 = v34;
    v31 = v35;
    v32 = v36;
    v33 = v37;
    objc_msgSend(v10, "imageForBackdropParameters:includeTint:overrideTraitCollection:", &v30, HasTint, v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v30 = v34;
    v31 = v35;
    v32 = v36;
    v33 = v37;
    objc_msgSend(v10, "imageURLForBackdropParameters:includeTint:overrideTraitCollection:", &v30, HasTint, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      if (a3)
      {
        *(_QWORD *)&v30 = 0;
        *((_QWORD *)&v30 + 1) = &v30;
        *(_QWORD *)&v31 = 0x3032000000;
        *((_QWORD *)&v31 + 1) = __Block_byref_object_copy__0;
        *(_QWORD *)&v32 = __Block_byref_object_dispose__0;
        *((_QWORD *)&v32 + 1) = 0;
        v24 = 0;
        v25 = &v24;
        v26 = 0x3032000000;
        v27 = __Block_byref_object_copy__0;
        v28 = __Block_byref_object_dispose__0;
        v29 = 0;
        v20 = 0;
        v21 = &v20;
        v22 = 0x2020000000;
        v23 = 0;
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __77__PBUIFakeBlurView__imageForStyle_withSource_overrideTraitCollection_result___block_invoke;
        v19[3] = &unk_1E6B94BA0;
        v19[4] = &v30;
        v19[5] = &v24;
        v19[6] = &v20;
        objc_msgSend(a1, "_imageForStyle:withSource:overrideTraitCollection:result:", 3, v10, v11, v19);
        v13 = *(id *)(*((_QWORD *)&v30 + 1) + 40);
        v18 = (id)v25[5];

        a3 = v21[3];
        _Block_object_dispose(&v20, 8);
        _Block_object_dispose(&v24, 8);

        _Block_object_dispose(&v30, 8);
      }
      else
      {
        objc_msgSend(v10, "snapshotImage");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "snapshotImageURL");
        v18 = (id)objc_claimAutoreleasedReturnValue();

      }
      v14 = v18;
    }

  }
  v12[2](v12, v13, v14, a3);

}

void __77__PBUIFakeBlurView__imageForStyle_withSource_overrideTraitCollection_result___block_invoke(_QWORD *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v7 = a2;
  v8 = a3;
  v9 = *(_QWORD *)(a1[4] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v14 = v7;

  v11 = *(_QWORD *)(a1[5] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;
  v13 = v8;

  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a4;
}

- (void)setFullscreen:(BOOL)a3
{
  -[PBUIFakeBlurView setShouldMatchWallpaperPosition:](self, "setShouldMatchWallpaperPosition:", !a3);
}

- (BOOL)isFullscreen
{
  return !-[PBUIFakeBlurView shouldMatchWallpaperPosition](self, "shouldMatchWallpaperPosition");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBUIFakeBlurView;
  -[PBUIFakeBlurView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (_WallpaperStyleUpdatesWithUserInterfaceStyle(self->_requestedStyle))
  {
    -[PBUIFakeBlurView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "userInterfaceStyle");
    if (v6 != objc_msgSend(v5, "userInterfaceStyle"))
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __45__PBUIFakeBlurView_traitCollectionDidChange___block_invoke;
      v7[3] = &unk_1E6B94BC8;
      v7[4] = self;
      v8 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], v7);

    }
  }

}

void __45__PBUIFakeBlurView_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id *v3;
  void *v4;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 488));

  v3 = *(id **)(a1 + 32);
  if (WeakRetained)
  {
    -[PBUIFakeBlurView _updateImageFromProviderWithTraitCollection:](v3, *(void **)(a1 + 40));
  }
  else
  {
    objc_msgSend(v3, "wallpaperViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_sourceForFakeBlurView:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      -[PBUIFakeBlurView _updateImageWithSource:overrideTraitCollection:notifyObserver:](v5, v4, *(void **)(a1 + 40));

  }
}

- (id)newImageProviderView
{
  return objc_alloc_init(MEMORY[0x1E0CEA658]);
}

- (BOOL)updateImageProviderView:(id)a3 withImage:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  BOOL v15;
  id v16;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  v8 = v5;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  v11 = objc_opt_class();
  v12 = v6;
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  v15 = 0;
  if (v10 && v14)
  {
    objc_msgSend(v10, "image");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v14 != v16;
    if (v14 != v16)
      objc_msgSend(v10, "setImage:", v14);

  }
  return v15;
}

- (id)imageForWallpaperStyle:(int64_t *)a3 variant:(int64_t)a4 traitCollection:(id)a5
{
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;

  v9 = a5;
  if (-[PBUIFakeBlurView variant](self, "variant") != a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperVariant(a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperVariant(-[PBUIFakeBlurView variant](self, "variant"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBUIFakeBlurView.m"), 506, CFSTR("Unexpected variant %@ (expected %@)"), v15, v16);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperViewController);
  objc_msgSend(WeakRetained, "_sourceForFakeBlurView:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend((id)objc_opt_class(), "_imageForStyle:withSource:overrideTraitCollection:", a3, v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (double)parallaxFactorForVariant:(int64_t)a3
{
  id WeakRetained;
  void *v7;
  double v8;
  double v9;
  void *v11;
  void *v12;
  void *v13;

  if (-[PBUIFakeBlurView variant](self, "variant") != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperVariant(a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperVariant(-[PBUIFakeBlurView variant](self, "variant"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBUIFakeBlurView.m"), 517, CFSTR("Unexpected variant %@ (expected %@)"), v12, v13);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperViewController);
  objc_msgSend(WeakRetained, "_sourceForFakeBlurView:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parallaxFactor");
  v9 = v8;

  return v9;
}

- (BOOL)parallaxEnabledForVariant:(int64_t)a3
{
  id WeakRetained;
  void *v7;
  char v8;
  void *v10;
  void *v11;
  void *v12;

  if (-[PBUIFakeBlurView variant](self, "variant") != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperVariant(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperVariant(-[PBUIFakeBlurView variant](self, "variant"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBUIFakeBlurView.m"), 523, CFSTR("Unexpected variant %@ (expected %@)"), v11, v12);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperViewController);
  objc_msgSend(WeakRetained, "_sourceForFakeBlurView:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "parallaxEnabled"))
    v8 = objc_msgSend((id)objc_opt_class(), "allowsParallax");
  else
    v8 = 0;

  return v8;
}

- (double)zoomFactorForVariant:(int64_t)a3
{
  id WeakRetained;
  void *v7;
  double v8;
  double v9;
  void *v11;
  void *v12;
  void *v13;

  if (-[PBUIFakeBlurView variant](self, "variant") != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperVariant(a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperVariant(-[PBUIFakeBlurView variant](self, "variant"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBUIFakeBlurView.m"), 530, CFSTR("Unexpected variant %@ (expected %@)"), v12, v13);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperViewController);
  objc_msgSend(WeakRetained, "_sourceForFakeBlurView:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoomFactor");
  v9 = v8;

  return v9;
}

- (PBUIFakeBlurObserver)observer
{
  return (PBUIFakeBlurObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (UIView)providedImageView
{
  return self->_providedImageView;
}

- (PBUIFakeBlurImageProviding)imageProvider
{
  return (PBUIFakeBlurImageProviding *)objc_loadWeakRetained((id *)&self->_imageProvider);
}

- (PBUIFakeBlurViewRegistering)fakeBlurRegistry
{
  return (PBUIFakeBlurViewRegistering *)objc_loadWeakRetained((id *)&self->_fakeBlurRegistry);
}

- (PBUIWallpaperViewController)wallpaperViewController
{
  return (PBUIWallpaperViewController *)objc_loadWeakRetained((id *)&self->_wallpaperViewController);
}

- (PBUIWallpaperReachabilityCoordinating)reachabilityCoordinator
{
  return self->_reachabilityCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachabilityCoordinator, 0);
  objc_destroyWeak((id *)&self->_wallpaperViewController);
  objc_destroyWeak((id *)&self->_fakeBlurRegistry);
  objc_destroyWeak((id *)&self->_imageProvider);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_providedImageView, 0);
  objc_storeStrong((id *)&self->_wallpaperView, 0);
}

@end
