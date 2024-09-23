@implementation PBUIScrollableStaticWallpaperView

- (PBUIScrollableStaticWallpaperView)initWithFrame:(CGRect)a3 configuration:(id)a4 variant:(int64_t)a5 cacheGroup:(id)a6 delegate:(id)a7 options:(unint64_t)a8
{
  PBUIScrollableStaticWallpaperView *v8;
  void *v9;
  uint64_t v10;
  PBUIWallpaperParallaxSettings *parallaxSettings;
  dispatch_queue_t v12;
  OS_dispatch_queue *workQueue;
  uint64_t v14;
  BSAtomicFlag *throttleCanUpdateFlag;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PBUIScrollableStaticWallpaperView;
  v8 = -[PBUIStaticWallpaperView initWithFrame:configuration:variant:cacheGroup:delegate:options:](&v17, sel_initWithFrame_configuration_variant_cacheGroup_delegate_options_, a4, a5, a6, a7, a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v8)
  {
    +[PBUIWallpaperDomain rootSettings](PBUIWallpaperDomain, "rootSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lockScreenParallaxSettings");
    v10 = objc_claimAutoreleasedReturnValue();
    parallaxSettings = v8->_parallaxSettings;
    v8->_parallaxSettings = (PBUIWallpaperParallaxSettings *)v10;

    v8->_automaticallyEnablesParallax = 1;
    v12 = dispatch_queue_create("com.apple.PaperBoardSevices.ScrollableStaticWallpaperView", 0);
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
    throttleCanUpdateFlag = v8->_throttleCanUpdateFlag;
    v8->_throttleCanUpdateFlag = (BSAtomicFlag *)v14;

    -[PBUIScrollableStaticWallpaperView setOpaque:](v8, "setOpaque:", 1);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[PBUIScrollableStaticWallpaperView _cancelThrottle](self, "_cancelThrottle");
  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PBUIScrollableStaticWallpaperView;
  -[PBUIWallpaperView dealloc](&v3, sel_dealloc);
}

+ (BOOL)_shouldScaleForParallax
{
  return 0;
}

- (void)setParallaxEnabled:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double minimumZoomScale;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v3 = a3;
  if (!-[PBUIWallpaperView parallaxEnabled](self, "parallaxEnabled") && v3)
  {
    -[UIScrollView zoomScale](self->_scrollView, "zoomScale");
    minimumZoomScale = v5;
    -[UIScrollView zoomScale](self->_scrollView, "zoomScale");
    if (v7 < self->_minimumZoomScaleForParallax)
    {
      -[UIScrollView setZoomScale:animated:](self->_scrollView, "setZoomScale:animated:", 1);
      minimumZoomScale = self->_minimumZoomScale;
    }
    -[PBUIScrollableStaticWallpaperView _boundedContentOffsetForOverhang](self, "_boundedContentOffsetForOverhang");
    v9 = v8;
    v11 = v10;
    -[UIScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", 1);
    -[PBUIScrollableStaticWallpaperView _parallaxFactorWithZoomScale:contentOffset:](self, "_parallaxFactorWithZoomScale:contentOffset:", minimumZoomScale, v9, v11);
    -[PBUIWallpaperView setParallaxFactor:](self, "setParallaxFactor:");
  }
  v12.receiver = self;
  v12.super_class = (Class)PBUIScrollableStaticWallpaperView;
  -[PBUIWallpaperView setParallaxEnabled:](&v12, sel_setParallaxEnabled_, v3);
}

- (double)_scrollViewParallaxFactor
{
  UIScrollView *scrollView;
  double v4;
  double v5;
  double v6;
  double v7;
  double result;

  scrollView = self->_scrollView;
  if (!scrollView)
    return 1.0;
  -[UIScrollView zoomScale](scrollView, "zoomScale");
  v5 = v4;
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  -[PBUIScrollableStaticWallpaperView _parallaxFactorWithZoomScale:contentOffset:](self, "_parallaxFactorWithZoomScale:contentOffset:", v5, v6, v7);
  return result;
}

- (double)_parallaxFactorWithZoomScale:(double)a3 contentOffset:(CGPoint)a4
{
  double y;
  double x;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  double minimumZoomScale;
  NSObject *v12;
  double minimumZoomScaleForParallax;
  double v14;
  NSObject *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSObject *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  NSObject *v26;
  double v27;
  NSObject *v28;
  double v29;
  double v30;
  NSObject *v31;
  double v32;
  double v33;
  NSObject *v34;
  double v35;
  double v36;
  NSObject *v37;
  double v38;
  NSObject *v39;
  NSObject *v40;
  double v42;
  uint8_t buf[4];
  double v44;
  uint64_t v45;
  CGPoint v46;
  CGPoint v47;

  y = a4.y;
  x = a4.x;
  v45 = *MEMORY[0x1E0C80C00];
  PBUILogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B71C0000, v8, OS_LOG_TYPE_INFO, "//////////_parallaxFactorWithZoomScale//////////", buf, 2u);
  }

  PBUILogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v44 = a3;
    _os_log_impl(&dword_1B71C0000, v9, OS_LOG_TYPE_INFO, "zoomScale %g", buf, 0xCu);
  }

  PBUILogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    minimumZoomScale = self->_minimumZoomScale;
    *(_DWORD *)buf = 134217984;
    v44 = minimumZoomScale;
    _os_log_impl(&dword_1B71C0000, v10, OS_LOG_TYPE_INFO, "minimumZoomScale %g", buf, 0xCu);
  }

  PBUILogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    minimumZoomScaleForParallax = self->_minimumZoomScaleForParallax;
    *(_DWORD *)buf = 134217984;
    v44 = minimumZoomScaleForParallax;
    _os_log_impl(&dword_1B71C0000, v12, OS_LOG_TYPE_INFO, "minimumZoomScaleForParallax %g", buf, 0xCu);
  }

  v14 = fmin(fmax((a3 - self->_minimumZoomScale) / (self->_minimumZoomScaleForParallax - self->_minimumZoomScale), 0.0), 1.0);
  PBUILogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v44 = v14;
    _os_log_impl(&dword_1B71C0000, v15, OS_LOG_TYPE_INFO, "zoomFactor %g", buf, 0xCu);
  }
  v42 = v14;

  -[PBUIScrollableStaticWallpaperView _minimumContentOffsetForOverhang](self, "_minimumContentOffsetForOverhang");
  v17 = v16;
  v19 = v18;
  PBUILogCommon();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v46.x = v17;
    v46.y = v19;
    NSStringFromCGPoint(v46);
    v21 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 138543362;
    v44 = v21;
    _os_log_impl(&dword_1B71C0000, v20, OS_LOG_TYPE_INFO, "minOffset %{public}@", buf, 0xCu);

  }
  -[PBUIScrollableStaticWallpaperView _maximumContentOffsetForOverhang](self, "_maximumContentOffsetForOverhang");
  v23 = v22;
  v25 = v24;
  PBUILogCommon();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v47.x = v23;
    v47.y = v25;
    NSStringFromCGPoint(v47);
    v27 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 138543362;
    v44 = v27;
    _os_log_impl(&dword_1B71C0000, v26, OS_LOG_TYPE_INFO, "maxOffset %{public}@", buf, 0xCu);

  }
  PBUILogCommon();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v44 = x / v17;
    _os_log_impl(&dword_1B71C0000, v28, OS_LOG_TYPE_INFO, "minOffsetXFactor %g", buf, 0xCu);
  }

  v29 = y;
  v30 = y / v19;
  PBUILogCommon();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v44 = v30;
    _os_log_impl(&dword_1B71C0000, v31, OS_LOG_TYPE_INFO, "minOffsetYFactor %g", buf, 0xCu);
  }

  if (x / v17 >= v30)
    v32 = v30;
  else
    v32 = x / v17;
  v33 = fmin(fmax(v32, 0.0), 1.0);
  PBUILogCommon();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v44 = v33;
    _os_log_impl(&dword_1B71C0000, v34, OS_LOG_TYPE_INFO, "minOffsetFactor %g", buf, 0xCu);
  }

  v35 = (v17 + v23 - x) / v17;
  if (v35 >= (v19 + v25 - v29) / v19)
    v35 = (v19 + v25 - v29) / v19;
  v36 = fmin(fmax(v35, 0.0), 1.0);
  PBUILogCommon();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v44 = v36;
    _os_log_impl(&dword_1B71C0000, v37, OS_LOG_TYPE_INFO, "maxOffsetFactor %g", buf, 0xCu);
  }

  v38 = v42;
  if (v42 > v33)
    v38 = v33;
  if (v38 <= v36)
    v36 = v38;
  PBUILogCommon();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v44 = v36;
    _os_log_impl(&dword_1B71C0000, v39, OS_LOG_TYPE_INFO, "result: %g", buf, 0xCu);
  }

  PBUILogCommon();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B71C0000, v40, OS_LOG_TYPE_INFO, "/////////////////////////", buf, 2u);
  }

  return v36;
}

+ (BOOL)_canCacheImages
{
  return 0;
}

+ (BOOL)_canDownscaleSampleImage
{
  return 0;
}

- (void)_resetColorBoxes
{
  id v3;

  -[PBUIStaticWallpaperView _createColorBoxes](self, "_createColorBoxes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PBUIStaticWallpaperView setColorBoxes:](self, "setColorBoxes:", v3);

}

- (void)setContentView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBUIScrollableStaticWallpaperView;
  -[PBUIWallpaperView setContentView:](&v4, sel_setContentView_, a3);
  -[PBUIScrollableStaticWallpaperView _resetColorBoxes](self, "_resetColorBoxes");
}

- (void)_setupContentViewWithOptions:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIScrollView *v8;
  UIScrollView *scrollView;
  UIScrollView *v10;
  UIImageView *v11;
  UIImageView *imageView;
  id v13;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v13, "bounds");
  v8 = (UIScrollView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA970]), "initWithFrame:", v4, v5, v6, v7);
  scrollView = self->_scrollView;
  self->_scrollView = v8;

  v10 = self->_scrollView;
  -[PBUIScrollableStaticWallpaperView frame](self, "frame");
  UIRectGetCenter();
  -[UIScrollView setCenter:](v10, "setCenter:");
  -[UIScrollView setClipsToBounds:](self->_scrollView, "setClipsToBounds:", 0);
  -[UIScrollView setScrollsToTop:](self->_scrollView, "setScrollsToTop:", 0);
  -[UIScrollView setShowsHorizontalScrollIndicator:](self->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView setShowsVerticalScrollIndicator:](self->_scrollView, "setShowsVerticalScrollIndicator:", 0);
  -[UIScrollView setContentInsetAdjustmentBehavior:](self->_scrollView, "setContentInsetAdjustmentBehavior:", 2);
  -[UIScrollView _setSupportsPointerDragScrolling:](self->_scrollView, "_setSupportsPointerDragScrolling:", 1);
  v11 = -[PBUIScrollableStaticWallpaperView _newImageView](self, "_newImageView");
  imageView = self->_imageView;
  self->_imageView = v11;

  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_imageView);
  -[PBUIScrollableStaticWallpaperView _setupScrollView](self, "_setupScrollView");
  -[PBUIScrollableStaticWallpaperView setContentView:](self, "setContentView:", self->_scrollView);

}

- (id)_newImageView
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CEA658]);
  -[PBUIStaticWallpaperView wallpaperImage](self, "wallpaperImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithImage:", v4);

  return v5;
}

- (id)_scrollView
{
  return self->_scrollView;
}

- (void)didMoveToWindow
{
  void *v3;

  -[PBUIScrollableStaticWallpaperView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[PBUIScrollableStaticWallpaperView _scrollViewDidUpdate](self, "_scrollViewDidUpdate");
}

- (CGSize)_imageSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[PBUIScrollableStaticWallpaperView _cropRect](self, "_cropRect");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (id)_wallpaperImageForAnalysis
{
  double v3;
  CGFloat v4;
  void *v5;
  double v6;
  CGFloat v7;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  void *v12;
  CGContext *CurrentContext;
  void *v14;
  CGSize v16;
  CGRect v17;

  -[UIScrollView zoomScale](self->_scrollView, "zoomScale");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;

  -[PBUIScrollableStaticWallpaperView _cropRect](self, "_cropRect");
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  if (CGRectEqualToRect(v17, *MEMORY[0x1E0C9D648]))
  {
    v12 = 0;
  }
  else
  {
    v16.width = width;
    v16.height = height;
    UIGraphicsBeginImageContextWithOptions(v16, 1, v7);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(CurrentContext, v4, v4);
    -[PBUIStaticWallpaperView wallpaperImage](self, "wallpaperImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "drawAtPoint:", -x / v4, -y / v4);

    UIGraphicsGetImageFromCurrentImageContext();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  return v12;
}

- (void)_cancelThrottle
{
  NSObject *throttleTimer;
  OS_dispatch_source *v4;

  throttleTimer = self->_throttleTimer;
  if (throttleTimer)
  {
    dispatch_source_cancel(throttleTimer);
    v4 = self->_throttleTimer;
    self->_throttleTimer = 0;

  }
  -[BSAtomicFlag setFlag:](self->_throttleCanUpdateFlag, "setFlag:", 0);
}

- (void)_scrollViewDidUpdate
{
  uint64_t v3;
  double v4;
  double v5;
  NSObject *v6;
  dispatch_time_t v7;
  OS_dispatch_source *throttleTimer;
  NSObject *workQueue;
  _QWORD block[4];
  id v11;
  id location;
  _QWORD handler[5];

  if (-[BSAtomicFlag setFlag:](self->_throttleCanUpdateFlag, "setFlag:", 1))
  {
    v3 = MEMORY[0x1E0C809B0];
    if (!self->_throttleTimer)
    {
      -[PBUIScrollableStaticWallpaperView _throttleDuration](self, "_throttleDuration");
      v5 = v4;
      handler[0] = v3;
      handler[1] = 3221225472;
      handler[2] = __57__PBUIScrollableStaticWallpaperView__scrollViewDidUpdate__block_invoke;
      handler[3] = &unk_1E6B94728;
      handler[4] = self;
      v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
      if (v6)
      {
        v7 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
        dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
        dispatch_source_set_event_handler(v6, handler);
        dispatch_resume(v6);
      }
      throttleTimer = self->_throttleTimer;
      self->_throttleTimer = (OS_dispatch_source *)v6;

    }
    -[PBUIScrollableStaticWallpaperView _updateParallaxForScroll](self, "_updateParallaxForScroll");
    objc_initWeak(&location, self);
    workQueue = self->_workQueue;
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __57__PBUIScrollableStaticWallpaperView__scrollViewDidUpdate__block_invoke_2;
    block[3] = &unk_1E6B95B70;
    objc_copyWeak(&v11, &location);
    dispatch_async(workQueue, block);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

uint64_t __57__PBUIScrollableStaticWallpaperView__scrollViewDidUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelThrottle");
}

void __57__PBUIScrollableStaticWallpaperView__scrollViewDidUpdate__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_createColorBoxes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__PBUIScrollableStaticWallpaperView__scrollViewDidUpdate__block_invoke_3;
  v5[3] = &unk_1E6B96160;
  objc_copyWeak(&v7, v1);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __57__PBUIScrollableStaticWallpaperView__scrollViewDidUpdate__block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setColorBoxes:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "_computeAverageColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "updateLegibilitySettingsForAverageColor:", v2);

}

- (void)_updateParallaxForScroll
{
  double v3;
  double v4;
  _BOOL4 v5;
  BOOL v7;
  double v8;
  char v9;
  objc_super v10;
  objc_super v11;

  -[PBUIScrollableStaticWallpaperView _scrollViewParallaxFactor](self, "_scrollViewParallaxFactor");
  v4 = v3;
  v5 = -[PBUIWallpaperView parallaxEnabled](self, "parallaxEnabled");
  if (v4 >= 0.75 || !v5)
  {
    v7 = v5;
    v11.receiver = self;
    v11.super_class = (Class)PBUIScrollableStaticWallpaperView;
    -[PBUIWallpaperView parallaxFactor](&v11, sel_parallaxFactor);
    if (v4 >= 0.75 && vabdd_f64(v4, v8) > 0.1)
    {
      -[PBUIWallpaperView setParallaxFactor:](self, "setParallaxFactor:", v4);
      v9 = !self->_automaticallyEnablesParallax || v7;
      if ((v9 & 1) != 0)
      {
        -[PBUIWallpaperView _applyParallaxSettings](self, "_applyParallaxSettings");
      }
      else
      {
        v10.receiver = self;
        v10.super_class = (Class)PBUIScrollableStaticWallpaperView;
        -[PBUIWallpaperView setParallaxEnabled:](&v10, sel_setParallaxEnabled_, 1);
        self->_automaticallyEnablesParallax = 0;
      }
    }
  }
  else
  {
    -[PBUIScrollableStaticWallpaperView setParallaxEnabled:](self, "setParallaxEnabled:", 0);
    self->_automaticallyEnablesParallax = 1;
  }
}

- (double)_throttleDuration
{
  void *v2;
  double v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_graphicsQuality") == 100)
    v3 = 0.2;
  else
    v3 = 1.0;

  return v3;
}

- (void)_updateScrollViewZoomScales
{
  NSObject *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  void *v19;
  double v20;
  NSObject *v21;
  double v22;
  NSObject *v23;
  double v24;
  NSObject *v25;
  double minimumZoomScaleForParallax;
  NSObject *v27;
  objc_super v28;
  uint8_t buf[4];
  double v30;
  uint64_t v31;
  CGSize v32;
  CGSize v33;

  v31 = *MEMORY[0x1E0C80C00];
  PBUILogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B71C0000, v3, OS_LOG_TYPE_INFO, "//////////_updateScrollViewZoomScales//////////", buf, 2u);
  }

  v28.receiver = self;
  v28.super_class = (Class)PBUIScrollableStaticWallpaperView;
  -[PBUIStaticWallpaperView wallpaperImage](&v28, sel_wallpaperImage);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;

  PBUILogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v32.width = v6;
    v32.height = v8;
    NSStringFromCGSize(v32);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = *(double *)&v10;
    _os_log_impl(&dword_1B71C0000, v9, OS_LOG_TYPE_INFO, "imageSize: %{public}@", buf, 0xCu);

  }
  -[UIScrollView bounds](self->_scrollView, "bounds");
  v13 = v12 / v6;
  if (v12 / v6 < v11 / v8)
    v13 = v11 / v8;
  self->_minimumZoomScale = v13;
  -[UIScrollView setMinimumZoomScale:](self->_scrollView, "setMinimumZoomScale:");
  -[UIScrollView setMaximumZoomScale:](self->_scrollView, "setMaximumZoomScale:", fmax(self->_minimumZoomScale + self->_minimumZoomScale, 5.0));
  +[PBUIWallpaperParallaxSettings minimumWallpaperSizeForCurrentDevice](PBUIWallpaperParallaxSettings, "minimumWallpaperSizeForCurrentDevice");
  v15 = v14;
  v17 = v16;
  PBUILogCommon();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v33.width = v15;
    v33.height = v17;
    NSStringFromCGSize(v33);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = *(double *)&v19;
    _os_log_impl(&dword_1B71C0000, v18, OS_LOG_TYPE_INFO, "parallaxSize: %{public}@", buf, 0xCu);

  }
  v20 = v15 / v6;
  PBUILogCommon();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v30 = v20;
    _os_log_impl(&dword_1B71C0000, v21, OS_LOG_TYPE_INFO, "scaleX: %g", buf, 0xCu);
  }

  v22 = v17 / v8;
  PBUILogCommon();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v30 = v22;
    _os_log_impl(&dword_1B71C0000, v23, OS_LOG_TYPE_INFO, "scaleY: %g", buf, 0xCu);
  }

  if (v20 >= v22)
    v24 = v20;
  else
    v24 = v22;
  self->_minimumZoomScaleForParallax = v24;
  PBUILogCommon();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    minimumZoomScaleForParallax = self->_minimumZoomScaleForParallax;
    *(_DWORD *)buf = 134217984;
    v30 = minimumZoomScaleForParallax;
    _os_log_impl(&dword_1B71C0000, v25, OS_LOG_TYPE_INFO, "minimumZoomScaleForParallax: %g", buf, 0xCu);
  }

  PBUILogCommon();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B71C0000, v27, OS_LOG_TYPE_INFO, "/////////////////////////", buf, 2u);
  }

}

- (void)_setupScrollView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PBUIScrollableStaticWallpaperView;
  -[PBUIStaticWallpaperView wallpaperImage](&v11, sel_wallpaperImage);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v5, v7);
  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  -[PBUIScrollableStaticWallpaperView _updateScrollViewZoomScales](self, "_updateScrollViewZoomScales");
  -[UIScrollView setZoomScale:](self->_scrollView, "setZoomScale:", self->_minimumZoomScaleForParallax);
  -[UIScrollView contentSize](self->_scrollView, "contentSize");
  v9 = v8;
  -[UIScrollView bounds](self->_scrollView, "bounds");
  -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", (v9 - v10) * 0.5, 0.0);
  -[PBUIScrollableStaticWallpaperView _boundedContentOffsetForOverhang](self, "_boundedContentOffsetForOverhang");
  -[UIScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", 0);
  -[UIScrollView setBounces:](self->_scrollView, "setBounces:", 1);
  -[UIScrollView setAlwaysBounceHorizontal:](self->_scrollView, "setAlwaysBounceHorizontal:", 1);
  -[UIScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", 1);
  -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", 1);
}

- (CGPoint)_boundedContentOffsetForOverhang
{
  double v3;
  double v4;
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
  CGPoint result;

  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v4 = v3;
  v6 = v5;
  -[PBUIScrollableStaticWallpaperView _minimumContentOffsetForOverhang](self, "_minimumContentOffsetForOverhang");
  v8 = v7;
  v10 = v9;
  -[PBUIScrollableStaticWallpaperView _maximumContentOffsetForOverhang](self, "_maximumContentOffsetForOverhang");
  if (v8 >= v4)
    v13 = v8;
  else
    v13 = v4;
  if (v11 > v13)
    v11 = v13;
  if (v10 >= v6)
    v14 = v10;
  else
    v14 = v6;
  if (v12 > v14)
    v12 = v14;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)_minimumContentOffsetForOverhang
{
  double v2;
  double v3;
  CGPoint result;

  +[PBUIWallpaperParallaxSettings overhangSizeForCurrentDevice](PBUIWallpaperParallaxSettings, "overhangSizeForCurrentDevice");
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)_maximumContentOffsetForOverhang
{
  double v3;
  double v4;
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
  CGPoint result;

  +[PBUIWallpaperParallaxSettings overhangSizeForCurrentDevice](PBUIWallpaperParallaxSettings, "overhangSizeForCurrentDevice");
  v4 = v3;
  v6 = v5;
  -[UIScrollView contentSize](self->_scrollView, "contentSize");
  v8 = v7;
  v10 = v9;
  -[UIScrollView bounds](self->_scrollView, "bounds");
  v12 = v8 - v11 - v4;
  v14 = v10 - v13 - v6;
  result.y = v14;
  result.x = v12;
  return result;
}

- (CGRect)_cropRect
{
  NSObject *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  void *v17;
  void *v18;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  NSObject *v28;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  NSObject *v44;
  NSObject *v45;
  double v46;
  NSObject *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGAffineTransform v57;
  objc_super v58;
  uint8_t buf[4];
  double v60;
  uint64_t v61;
  CGSize v62;
  CGSize v63;
  CGRect v64;
  CGRect v65;
  CGRect result;

  v61 = *MEMORY[0x1E0C80C00];
  PBUILogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B71C0000, v3, OS_LOG_TYPE_INFO, "//////////_cropRect//////////", buf, 2u);
  }

  -[UIScrollView bounds](self->_scrollView, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  PBUILogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v64.origin.x = v5;
    v64.origin.y = v7;
    v64.size.width = v9;
    v64.size.height = v11;
    NSStringFromCGRect(v64);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v60 = *(double *)&v13;
    _os_log_impl(&dword_1B71C0000, v12, OS_LOG_TYPE_INFO, "zoomedRect: %{public}@", buf, 0xCu);

  }
  -[UIScrollView zoomScale](self->_scrollView, "zoomScale");
  v15 = v14;
  PBUILogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v60 = v15;
    _os_log_impl(&dword_1B71C0000, v16, OS_LOG_TYPE_INFO, "zoomScale: %g", buf, 0xCu);
  }

  v58.receiver = self;
  v58.super_class = (Class)PBUIScrollableStaticWallpaperView;
  -[PBUIStaticWallpaperView wallpaperImage](&v58, sel_wallpaperImage);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v15 == 0.0 || v17 == 0)
  {
    v20 = *MEMORY[0x1E0C9D648];
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    objc_msgSend(v17, "size");
    v25 = v15 * v24;
    v27 = v15 * v26;
    PBUILogCommon();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v62.width = v25;
      v62.height = v27;
      NSStringFromCGSize(v62);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = *(double *)&v30;
      _os_log_impl(&dword_1B71C0000, v28, OS_LOG_TYPE_INFO, "scaledImageSize: %{public}@", buf, 0xCu);

    }
    v56 = v27;

    v31 = 0.0;
    if (-[PBUIWallpaperView parallaxEnabled](self, "parallaxEnabled"))
    {
      -[PBUIScrollableStaticWallpaperView parallaxFactor](self, "parallaxFactor");
      v31 = v32;
    }
    +[PBUIWallpaperParallaxSettings bestWallpaperSizeForParallaxFactor:](PBUIWallpaperParallaxSettings, "bestWallpaperSizeForParallaxFactor:", v31);
    v34 = v33;
    v36 = v35;
    PBUILogCommon();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v60 = v31;
      _os_log_impl(&dword_1B71C0000, v37, OS_LOG_TYPE_INFO, "parallaxFactor: %g", buf, 0xCu);
    }

    PBUILogCommon();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v63.width = v34;
      v63.height = v36;
      NSStringFromCGSize(v63);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = *(double *)&v39;
      _os_log_impl(&dword_1B71C0000, v38, OS_LOG_TYPE_INFO, "bestSize: %{public}@", buf, 0xCu);

    }
    v40 = (v34 - v9) * 0.5;
    v41 = (v36 - v11) * 0.5;
    if (v40 >= v5)
      v40 = v5;
    if (v40 >= v25 - (v5 + v9))
      v40 = v25 - (v5 + v9);
    if (v41 >= v7)
      v41 = v7;
    if (v41 >= v56 - (v7 + v11))
      v41 = v56 - (v7 + v11);
    if (v40 >= 0.0)
      v42 = v40;
    else
      v42 = 0.0;
    if (v41 >= 0.0)
      v43 = v41;
    else
      v43 = 0.0;
    PBUILogCommon();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v60 = v42;
      _os_log_impl(&dword_1B71C0000, v44, OS_LOG_TYPE_INFO, "extraX: %g", buf, 0xCu);
    }

    PBUILogCommon();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v60 = v43;
      _os_log_impl(&dword_1B71C0000, v45, OS_LOG_TYPE_INFO, "extraY: %g", buf, 0xCu);
    }

    -[PBUIWallpaperView contentScaleFactor](self, "contentScaleFactor");
    CGAffineTransformMakeScale(&v57, 1.0 / v46, 1.0 / v46);
    v65.origin.x = v5 - v42;
    v65.origin.y = v7 - v43;
    v65.size.width = v9 + v42 * 2.0;
    v65.size.height = v11 + v43 * 2.0;
    CGRectApplyAffineTransform(v65, &v57);
    PBUILogCommon();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B71C0000, v47, OS_LOG_TYPE_INFO, "/////////////////////////", buf, 2u);
    }

    UIRectCenteredIntegralRect();
    v20 = v48;
    v21 = v49;
    v22 = v50;
    v23 = v51;
  }

  v52 = v20;
  v53 = v21;
  v54 = v22;
  v55 = v23;
  result.size.height = v55;
  result.size.width = v54;
  result.origin.y = v53;
  result.origin.x = v52;
  return result;
}

- (CGRect)cropRect
{
  NSObject *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  int v29;
  void *v30;
  uint64_t v31;
  CGRect v32;
  CGRect v33;
  CGRect result;

  v31 = *MEMORY[0x1E0C80C00];
  PBUILogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v29) = 0;
    _os_log_impl(&dword_1B71C0000, v3, OS_LOG_TYPE_INFO, "//////////cropRect//////////", (uint8_t *)&v29, 2u);
  }

  -[PBUIScrollableStaticWallpaperView _cropRect](self, "_cropRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  PBUILogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v32.origin.x = v5;
    v32.origin.y = v7;
    v32.size.width = v9;
    v32.size.height = v11;
    NSStringFromCGRect(v32);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543362;
    v30 = v13;
    _os_log_impl(&dword_1B71C0000, v12, OS_LOG_TYPE_INFO, "pre crop rect: %{public}@", (uint8_t *)&v29, 0xCu);

  }
  -[UIScrollView convertRect:toView:](self->_scrollView, "convertRect:toView:", self->_imageView, v5, v7, v9, v11);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  PBUILogCommon();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v33.origin.x = v15;
    v33.origin.y = v17;
    v33.size.width = v19;
    v33.size.height = v21;
    NSStringFromCGRect(v33);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543362;
    v30 = v23;
    _os_log_impl(&dword_1B71C0000, v22, OS_LOG_TYPE_INFO, "result crop rect: %{public}@", (uint8_t *)&v29, 0xCu);

  }
  PBUILogCommon();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    LOWORD(v29) = 0;
    _os_log_impl(&dword_1B71C0000, v24, OS_LOG_TYPE_INFO, "/////////////////////////", (uint8_t *)&v29, 2u);
  }

  v25 = v15;
  v26 = v17;
  v27 = v19;
  v28 = v21;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (BOOL)supportsCropping
{
  return 1;
}

- (double)cropZoomScale
{
  double v3;
  double v4;
  double v5;

  -[UIScrollView zoomScale](self->_scrollView, "zoomScale");
  v4 = v3;
  -[PBUIWallpaperView contentScaleFactor](self, "contentScaleFactor");
  return v4 * v5;
}

- (void)setCropRect:(CGRect)a3 zoomScale:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
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
  CGAffineTransform v30;
  CGRect v31;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    -[PBUIWallpaperView contentScaleFactor](self, "contentScaleFactor");
    v11 = v10;
    -[UIScrollView setZoomScale:](self->_scrollView, "setZoomScale:", a4 / v10);
    -[UIScrollView convertRect:fromView:](self->_scrollView, "convertRect:fromView:", self->_imageView, x, y, width, height);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    CGAffineTransformMakeScale(&v30, v11, v11);
    v31.origin.x = v13;
    v31.origin.y = v15;
    v31.size.width = v17;
    v31.size.height = v19;
    CGRectApplyAffineTransform(v31, &v30);
    UIRectCenteredIntegralRect();
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    -[UIScrollView bounds](self->_scrollView, "bounds");
    -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v21 + (v25 - v28) * 0.5, v23 + (v27 - v29) * 0.5);
  }
}

- (void)layoutSubviews
{
  UIScrollView *scrollView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBUIScrollableStaticWallpaperView;
  -[PBUIWallpaperView layoutSubviews](&v5, sel_layoutSubviews);
  scrollView = self->_scrollView;
  -[UIScrollView superview](scrollView, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  UIRectGetCenter();
  -[UIScrollView setCenter:](scrollView, "setCenter:");

}

- (id)viewForZoomingInScrollView:(id)a3
{
  return self->_imageView;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[PBUIScrollableStaticWallpaperView _scrollViewDidUpdate](self, "_scrollViewDidUpdate", a3);
}

- (void)scrollViewDidChangeAdjustedContentInset:(id)a3
{
  if (-[PBUIWallpaperView parallaxEnabled](self, "parallaxEnabled", a3))
  {
    -[PBUIScrollableStaticWallpaperView _boundedContentOffsetForOverhang](self, "_boundedContentOffsetForOverhang");
    -[UIScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", 1);
  }
}

- (BOOL)automaticallyEnablesParallax
{
  return self->_automaticallyEnablesParallax;
}

- (void)setAutomaticallyEnablesParallax:(BOOL)a3
{
  self->_automaticallyEnablesParallax = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttleCanUpdateFlag, 0);
  objc_storeStrong((id *)&self->_throttleTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_parallaxSettings, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
