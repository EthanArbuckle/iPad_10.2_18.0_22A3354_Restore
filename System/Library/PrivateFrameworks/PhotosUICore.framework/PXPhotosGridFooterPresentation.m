@implementation PXPhotosGridFooterPresentation

- (PXPhotosGridFooterPresentation)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridFooterPresentation.m"), 76, CFSTR("%s is not available as initializer"), "-[PXPhotosGridFooterPresentation init]");

  abort();
}

- (PXPhotosGridFooterPresentation)initWithViewModel:(id)a3 gridView:(id)a4 layout:(id)a5
{
  id v10;
  id v11;
  id v12;
  PXPhotosGridFooterPresentation *v13;
  PXPhotosGridFooterPresentation *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridFooterPresentation.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gridView"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridFooterPresentation.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewModel"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridFooterPresentation.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layout"));

LABEL_4:
  v20.receiver = self;
  v20.super_class = (Class)PXPhotosGridFooterPresentation;
  v13 = -[PXPhotosGridFooterPresentation init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_gridView, a4);
    -[PXGView scrollViewController](v14->_gridView, "scrollViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerObserver:", v14);
    objc_storeStrong((id *)&v14->_layout, a5);
    objc_storeStrong((id *)&v14->_viewModel, a3);
    -[PXPhotosViewModel registerChangeObserver:context:](v14->_viewModel, "registerChangeObserver:context:", v14, PXPhotosViewModelObserverContext_259864);

  }
  return v14;
}

- (void)viewWillAppear
{
  -[PXPhotosGridFooterPresentation _updateWantsFooter](self, "_updateWantsFooter");
  -[PXPhotosGridFooterPresentation _updateFooterMaskViewFrame](self, "_updateFooterMaskViewFrame");
}

- (void)viewDidAppear
{
  self->_hasAppearedOnce = 1;
  -[PXPhotosGridFooterPresentation _updateWantsFooter](self, "_updateWantsFooter");
  -[PXPhotosGridFooterPresentation _updateFooterMaskViewFrame](self, "_updateFooterMaskViewFrame");
}

- (void)viewDidScrollToInitialPosition
{
  self->_hasReachedInitialPosition = 1;
  -[PXPhotosGridFooterPresentation _updateWantsFooter](self, "_updateWantsFooter");
  -[PXPhotosGridFooterPresentation _updateFooterMaskViewFrame](self, "_updateFooterMaskViewFrame");
}

- (void)setShouldAutoReveal:(BOOL)a3
{
  if (self->_shouldAutoReveal != a3)
  {
    self->_shouldAutoReveal = a3;
    -[PXPhotosGridFooterPresentation _updateWantsFooter](self, "_updateWantsFooter");
  }
}

- (void)setWantsFooter:(BOOL)a3
{
  if (self->_wantsFooter != a3)
  {
    self->_wantsFooter = a3;
    -[PXPhotosGridFooterPresentation _updateFooterView](self, "_updateFooterView");
  }
}

- (BOOL)wantsFooterMask
{
  return -[PXPhotosViewModel wantsFooterMask](self->_viewModel, "wantsFooterMask");
}

- (void)setFooterFullyMasked:(BOOL)a3
{
  if (self->_footerFullyMasked != a3)
  {
    self->_footerFullyMasked = a3;
    -[PXPhotosGridFooterPresentation _updateFooterAndMaskVisibility](self, "_updateFooterAndMaskVisibility");
  }
}

- (double)_footerVisibleAmountIncludingSafeAreaInsets:(BOOL)a3
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double Height;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat v43;
  void *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  double v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  -[PXPhotosLayout footerView](self->_layout, "footerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (objc_class *)objc_opt_class();
      NSStringFromClass(v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "px_descriptionForAssertionMessage");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridFooterPresentation.m"), 152, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("_layout.footerView"), v47, v48);

    }
    -[PXGView scrollViewController](self->_gridView, "scrollViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v7, "scrollView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "convertRect:toView:", v16, v9, v11, v13, v15);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    v50.origin.x = v18;
    v50.origin.y = v20;
    v50.size.width = v22;
    v50.size.height = v24;
    Height = CGRectGetHeight(v50);
    v26 = 0.0;
    if (Height > 0.0)
    {
      v49 = Height;
      objc_msgSend(v7, "scrollViewVisibleRect");
      v29 = v28;
      v31 = v30;
      v33 = v32;
      if (!a3)
      {
        -[PXGView safeAreaInsets](self->_gridView, "safeAreaInsets");
        PXEdgeInsetsInsetRect();
        v29 = v34;
        v31 = v35;
        v33 = v36;
      }
      v37 = v29;
      v38 = v31;
      v39 = v33;
      v53.origin.x = v18;
      v53.origin.y = v20;
      v53.size.width = v22;
      v53.size.height = v24;
      v51 = CGRectIntersection(*(CGRect *)&v27, v53);
      x = v51.origin.x;
      y = v51.origin.y;
      width = v51.size.width;
      v43 = v51.size.height;
      if (!CGRectIsEmpty(v51))
      {
        v52.origin.x = x;
        v52.origin.y = y;
        v52.size.width = width;
        v52.size.height = v43;
        v26 = CGRectGetHeight(v52) / v49;
      }
    }

  }
  else
  {
    v26 = 0.0;
  }

  return v26;
}

- (BOOL)_shouldAutoRevealFooterView
{
  void *v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  void *v7;
  double v8;
  int v9;
  int v10;
  BOOL v11;
  BOOL v12;
  void *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  int v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PXGView window](self->_gridView, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (self->_autoRevealMinimumIdleTimer)
    {
      PLUserStatusUIGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v19) = 0;
        v5 = "[GZFooter] Suppressing auto-reveal: Waiting for idle timer";
LABEL_19:
        _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, v5, (uint8_t *)&v19, 2u);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    if (!-[PXPhotosViewModel footerHasImportantInformation](self->_viewModel, "footerHasImportantInformation"))
    {
      PLUserStatusUIGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v19) = 0;
        v5 = "[GZFooter] Suppressing auto-reveal: No important information";
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    -[PXGView scrollViewController](self->_gridView, "scrollViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosLayout footerView](self->_layout, "footerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = objc_msgSend(v6, "isScrolledAtEdge:tolerance:", 3, v8 + 1.0);

    -[PXPhotosGridFooterPresentation _footerVisibleAmountIncludingSafeAreaInsets:](self, "_footerVisibleAmountIncludingSafeAreaInsets:", 0);
    v10 = PXFloatEqualToFloatWithTolerance();
    if (v9)
      v11 = v10 == 0;
    else
      v11 = 0;
    if (!v11)
    {
      PLUserStatusUIGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v19) = 0;
        v5 = "[GZFooter] Suppressing auto-reveal: Not scrolled to bottom, or footer already fully visible";
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    if (self->_didAutoReveal)
    {
      PLUserStatusUIGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v19) = 0;
        v5 = "[GZFooter] Suppressing auto-reveal: Already scrolled once";
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentMode");
    v4 = objc_claimAutoreleasedReturnValue();

    if ((-[NSObject isEqualToString:](v4, "isEqualToString:", *MEMORY[0x1E0C99748]) & 1) != 0)
    {
      if (!-[PXPhotosViewModel isInSelectMode](self->_viewModel, "isInSelectMode")
        || !-[PXPhotosViewModel hideFooterInSelectMode](self->_viewModel, "hideFooterInSelectMode"))
      {
        v12 = 1;
        goto LABEL_21;
      }
      PLUserStatusUIGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        goto LABEL_30;
      LOWORD(v19) = 0;
      v16 = "[GZFooter] Suppressing auto-reveal: In selection mode";
      v17 = v15;
      v18 = 2;
    }
    else
    {
      PLUserStatusUIGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
LABEL_30:

        goto LABEL_20;
      }
      v19 = 138412290;
      v20 = v4;
      v16 = "[GZFooter] Suppressing auto-reveal: In \"%@\" run loop mode (default mode required)";
      v17 = v15;
      v18 = 12;
    }
    _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_DEBUG, v16, (uint8_t *)&v19, v18);
    goto LABEL_30;
  }
  PLUserStatusUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v19) = 0;
    v5 = "[GZFooter] Suppressing auto-reveal: Not visible";
    goto LABEL_19;
  }
LABEL_20:
  v12 = 0;
LABEL_21:

  return v12;
}

- (void)_conditionallyAutoRevealFooterViewWithLastUserScrollTime:(double)a3
{
  NSTimer *autoRevealMinimumIdleTimer;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[2];
  __int16 v12;

  autoRevealMinimumIdleTimer = self->_autoRevealMinimumIdleTimer;
  self->_autoRevealMinimumIdleTimer = 0;

  if (self->_lastUserScrollTime == a3)
  {
    if (-[PXPhotosGridFooterPresentation _shouldAutoRevealFooterView](self, "_shouldAutoRevealFooterView"))
    {
      self->_didAutoReveal = 1;
      PLUserStatusUIGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEBUG, "[GZFooter] Performing auto-reveal", v10, 2u);
      }

      -[PXGView scrollViewController](self->_gridView, "scrollViewController");
      v6 = objc_claimAutoreleasedReturnValue();
      -[NSObject scrollToEdge:animated:](v6, "scrollToEdge:animated:", 3, 1);
    }
    else
    {
      PLUserStatusUIGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v7 = "[GZFooter] Suppressing auto-reveal: conditions changed";
        v8 = buf;
        goto LABEL_10;
      }
    }
  }
  else
  {
    PLUserStatusUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v12 = 0;
      v7 = "[GZFooter] Suppressing auto-reveal: user scrolled";
      v8 = (uint8_t *)&v12;
LABEL_10:
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, v7, v8, 2u);
    }
  }

  -[PXPhotosGridFooterPresentation setShouldAutoReveal:](self, "setShouldAutoReveal:", 0);
}

- (void)_conditionallyAutoRevealFooterView
{
  NSObject *v3;
  double lastUserScrollTime;
  void *v5;
  NSTimer *v6;
  NSTimer *autoRevealMinimumIdleTimer;
  _QWORD v8[4];
  id v9[2];
  id buf[2];

  if (-[PXPhotosGridFooterPresentation _shouldAutoRevealFooterView](self, "_shouldAutoRevealFooterView"))
  {
    PLUserStatusUIGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "[GZFooter] Should auto-reveal, waiting for idle timer", (uint8_t *)buf, 2u);
    }

    -[PXPhotosGridFooterPresentation setShouldAutoReveal:](self, "setShouldAutoReveal:", 1);
    lastUserScrollTime = self->_lastUserScrollTime;
    objc_initWeak(buf, self);
    v5 = (void *)MEMORY[0x1E0C99E88];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__PXPhotosGridFooterPresentation__conditionallyAutoRevealFooterView__block_invoke;
    v8[3] = &unk_1E5141020;
    objc_copyWeak(v9, buf);
    v9[1] = *(id *)&lastUserScrollTime;
    objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 0, v8, 2.0);
    v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    autoRevealMinimumIdleTimer = self->_autoRevealMinimumIdleTimer;
    self->_autoRevealMinimumIdleTimer = v6;

    objc_destroyWeak(v9);
    objc_destroyWeak(buf);
  }
}

- (void)_updateWantsFooter
{
  _BOOL4 v3;
  _BOOL4 v5;
  int v6;
  _BOOL8 v7;
  void *v8;

  v3 = -[PXPhotosViewModel wantsFooterVisibleImmediately](self->_viewModel, "wantsFooterVisibleImmediately");
  if (self->_hasAppearedOnce || v3)
  {
    v5 = v3;
    if (-[PXPhotosViewModel wantsFooterVisible](self->_viewModel, "wantsFooterVisible")
      && (self->_hasReachedInitialPosition ? (v6 = 1) : (v6 = v5),
          v6 == 1
       && (!-[PXPhotosViewModel isInSelectMode](self->_viewModel, "isInSelectMode")
        || !-[PXPhotosViewModel hideFooterInSelectMode](self->_viewModel, "hideFooterInSelectMode"))))
    {
      if (-[PXPhotosViewModel wantsFooterVisibleWhenEmpty](self->_viewModel, "wantsFooterVisibleWhenEmpty"))
      {
        v7 = 1;
      }
      else
      {
        -[PXPhotosViewModel currentDataSource](self->_viewModel, "currentDataSource");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v8, "totalNumberOfItems") > 0;

      }
    }
    else
    {
      v7 = 0;
    }
    -[PXPhotosGridFooterPresentation setWantsFooter:](self, "setWantsFooter:", v7);
  }
}

- (void)_updateFooterView
{
  uint64_t v4;
  _BOOL4 v5;
  PXPhotosGlobalFooterView *reusableFooterView;
  PXPhotosGlobalFooterView *v7;
  _PXPhotosGridFooterMaskView *v8;
  _BOOL4 v9;
  _PXPhotosGridFooterMaskView *v10;
  PXGView *gridView;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  id obj;

  -[PXPhotosLayout footerView](self->_layout, "footerView");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;
  if (!v4)
  {
    if (!-[PXPhotosGridFooterPresentation wantsFooter](self, "wantsFooter"))
    {
      v5 = 0;
      obj = 0;
      goto LABEL_13;
    }
    reusableFooterView = self->_reusableFooterView;
    if (reusableFooterView)
    {
      v7 = reusableFooterView;
    }
    else
    {
      v7 = objc_alloc_init(PXPhotosGlobalFooterView);
      -[PXPhotosViewModel footerViewModel](self->_viewModel, "footerViewModel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosGlobalFooterView setViewModel:](v7, "setViewModel:", v14);

      -[PXPhotosGlobalFooterView setDelegate:](v7, "setDelegate:", self);
    }
    obj = v7;
    goto LABEL_11;
  }
  obj = (id)v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "px_descriptionForAssertionMessage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridFooterPresentation.m"), 279, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("_layout.footerView"), v17, v18);

  }
  if (!-[PXPhotosGridFooterPresentation wantsFooter](self, "wantsFooter"))
  {
    objc_storeStrong((id *)&self->_reusableFooterView, obj);
    v7 = 0;
LABEL_11:
    -[PXPhotosLayout setFooterView:](self->_layout, "setFooterView:", v7);
    goto LABEL_13;
  }
  v5 = 1;
LABEL_13:
  -[PXPhotosGridFooterPresentation footerMaskView](self, "footerMaskView");
  v8 = (_PXPhotosGridFooterMaskView *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXPhotosGridFooterPresentation wantsFooterMask](self, "wantsFooterMask");
  if (v5 && v9)
  {
    if (!v8)
    {
      v10 = objc_alloc_init(_PXPhotosGridFooterMaskView);
      -[_PXPhotosGridFooterMaskView setDelegate:](v10, "setDelegate:", self);
      gridView = self->_gridView;
      v8 = v10;
      -[PXGView backgroundColor](gridView, "backgroundColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PXPhotosGridFooterMaskView setBackgroundColor:](v8, "setBackgroundColor:", v12);

      -[_PXPhotosGridFooterMaskView setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 0);
      -[PXGView scrollViewController](self->_gridView, "scrollViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSubview:", v8);

    }
    -[PXPhotosGridFooterPresentation setFooterMaskView:](self, "setFooterMaskView:", v8);
    -[PXPhotosGridFooterPresentation _updateFooterMaskPadding](self, "_updateFooterMaskPadding");
    -[PXPhotosGridFooterPresentation _updateFooterMaskViewFrame](self, "_updateFooterMaskViewFrame");

  }
  else
  {
    -[_PXPhotosGridFooterMaskView removeFromSuperview](v8, "removeFromSuperview");

    -[PXPhotosGridFooterPresentation setFooterMaskView:](self, "setFooterMaskView:", 0);
  }

}

- (void)_updateFooterMaskPadding
{
  id v3;

  -[PXPhotosGridFooterPresentation delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maskPaddingForFooterPresentation:", self);
  -[PXPhotosGridFooterPresentation setFooterMaskPadding:](self, "setFooterMaskPadding:");

}

- (void)_updateFooterMaskViewOrder
{
  void *v2;
  void *v3;
  id v4;

  -[PXPhotosGridFooterPresentation footerMaskView](self, "footerMaskView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v4, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bringSubviewToFront:", v4);

  }
}

- (void)_updateFooterMaskViewFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  double MaxY;
  double v19;
  CGFloat v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  _BOOL8 v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  -[PXPhotosGridFooterPresentation footerMaskView](self, "footerMaskView");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    -[PXGView scrollViewController](self->_gridView, "scrollViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "visibleRect");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[PXPhotosGridFooterPresentation footerMaskPadding](self, "footerMaskPadding");
    v13 = v12;
    v16 = v9 - (v14 + v15);
    v17 = v5 + v14;
    v32.origin.x = v5;
    v32.origin.y = v7;
    v32.size.width = v9;
    v32.size.height = v11;
    MaxY = CGRectGetMaxY(v32);
    objc_msgSend(v3, "contentInset");
    v20 = v13 + MaxY - v19;
    v33.origin.x = v5;
    v33.origin.y = v7;
    v33.size.width = v9;
    v33.size.height = v11;
    v21 = CGRectGetMaxY(v33);
    v34.origin.x = v17;
    v34.origin.y = v20;
    v34.size.width = v16;
    v34.size.height = v11;
    objc_msgSend(v31, "setFrame:", v17, v20, v16, v21 - CGRectGetMinY(v34));
    -[PXPhotosLayout footerView](self->_layout, "footerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "convertPoint:toView:", v31, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    v24 = v23;
    objc_msgSend(v22, "window");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25 == 0;

    v27 = v24 + 1.0;
    if (v24 + 1.0 >= 0.0 && (objc_msgSend(v3, "isManuallyChanging", v27) & 1) == 0)
    {
      objc_msgSend(v22, "window");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "window");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28 == v29)
      {
        objc_msgSend(v22, "window");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v30 != 0;

      }
      else
      {
        v26 = 0;
      }

    }
    -[PXPhotosGridFooterPresentation setFooterFullyMasked:](self, "setFooterFullyMasked:", v26, v27);

  }
  else
  {
    -[PXPhotosGridFooterPresentation setFooterFullyMasked:](self, "setFooterFullyMasked:", 0);
  }

}

- (void)_updateFooterAndMaskVisibility
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = -[PXPhotosGridFooterPresentation isFooterFullyMasked](self, "isFooterFullyMasked");
  -[PXPhotosGridFooterPresentation footerMaskView](self, "footerMaskView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

  -[PXPhotosLayout footerView](self->_layout, "footerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  uint64_t v7;
  _QWORD block[5];

  if ((void *)PXPhotosViewModelObserverContext_259864 == a5)
  {
    if (-[PXPhotosViewModel hideFooterInSelectMode](self->_viewModel, "hideFooterInSelectMode", a3))
      v7 = 4;
    else
      v7 = 0;
    if (((v7 | 0x41) & a4) != 0)
      -[PXPhotosGridFooterPresentation _updateWantsFooter](self, "_updateWantsFooter");
    if (((v7 | 0xC0) & a4) != 0)
      -[PXPhotosGridFooterPresentation _conditionallyAutoRevealFooterView](self, "_conditionallyAutoRevealFooterView");
    if (((v7 | 0x100000000000) & a4) != 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__PXPhotosGridFooterPresentation_observable_didChange_context___block_invoke;
      block[3] = &unk_1E5149198;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

- (void)scrollViewControllerWillBeginScrolling:(id)a3
{
  double v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", a3);
  self->_lastUserScrollTime = v4;
}

- (void)scrollViewControllerContentBoundsDidChange:(id)a3
{
  -[PXPhotosLayout invalidateFooterHeight](self->_layout, "invalidateFooterHeight", a3);
}

- (void)photosGlobalFooterView:(id)a3 presentViewController:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  -[PXPhotosGridFooterPresentation delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v7)
    objc_msgSend(v5, "footerPresentation:presentViewController:", self, v7);
  else
    objc_msgSend(v5, "dismissPresentedViewControllerForFooterPresentation:", self);

}

- (void)photosGlobalFooterViewDidChangeHeight:(id)a3
{
  void *v4;
  id v5;

  -[PXGLayout createAnchorForVisibleArea](self->_layout, "createAnchorForVisibleArea", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "autoInvalidate");

  -[PXPhotosLayout invalidateFooterHeight](self->_layout, "invalidateFooterHeight");
  -[PXPhotosGridFooterPresentation _updateFooterMaskViewFrame](self, "_updateFooterMaskViewFrame");
}

- (void)photosGlobalFooterViewDidMoveToWindow:(id)a3
{
  -[PXPhotosGridFooterPresentation _updateFooterMaskViewOrder](self, "_updateFooterMaskViewOrder", a3);
  -[PXPhotosGridFooterPresentation _updateFooterMaskViewFrame](self, "_updateFooterMaskViewFrame");
}

- (PXPhotosGridFooterPresentationDelegate)delegate
{
  return (PXPhotosGridFooterPresentationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldAutoReveal
{
  return self->_shouldAutoReveal;
}

- (BOOL)wantsFooter
{
  return self->_wantsFooter;
}

- (void)setWantsFooterMask:(BOOL)a3
{
  self->_wantsFooterMask = a3;
}

- (UIView)footerMaskView
{
  return self->_footerMaskView;
}

- (void)setFooterMaskView:(id)a3
{
  objc_storeStrong((id *)&self->_footerMaskView, a3);
}

- (UIEdgeInsets)footerMaskPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_footerMaskPadding.top;
  left = self->_footerMaskPadding.left;
  bottom = self->_footerMaskPadding.bottom;
  right = self->_footerMaskPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setFooterMaskPadding:(UIEdgeInsets)a3
{
  self->_footerMaskPadding = a3;
}

- (BOOL)isFooterFullyMasked
{
  return self->_footerFullyMasked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerMaskView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_autoRevealMinimumIdleTimer, 0);
  objc_storeStrong((id *)&self->_reusableFooterView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

uint64_t __63__PXPhotosGridFooterPresentation_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFooterMaskViewFrame");
}

void __68__PXPhotosGridFooterPresentation__conditionallyAutoRevealFooterView__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_conditionallyAutoRevealFooterViewWithLastUserScrollTime:", *(double *)(a1 + 40));

}

@end
