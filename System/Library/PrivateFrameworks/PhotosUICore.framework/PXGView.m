@implementation PXGView

- (void)engine:(id)a3 updateDebugHUDWithStats:(id *)a4
{
  void *v5;

  -[PXGDebugHUDLayer updateDebugHUDWithStats:](self->_debugHUDLayer, "updateDebugHUDWithStats:", a4);
  if (self->_rectDiagnosticsLayer)
  {
    -[PXGView rootLayout](self, "rootLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGRectDiagnosticsLayer setLayout:](self->_rectDiagnosticsLayer, "setLayout:", v5);

    -[PXGRectDiagnosticsLayer update](self->_rectDiagnosticsLayer, "update");
  }
}

- (PXGLayout)rootLayout
{
  void *v4;
  void *v5;
  void *v7;

  -[PXGView engine](self, "engine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGView.m"), 1231, CFSTR("layout not set yet on %@"), self);

  }
  return (PXGLayout *)v5;
}

- (PXGEngine)engine
{
  return self->_engine;
}

- (BOOL)engine:(id)a3 shouldRenderLayout:(id)a4 sprites:(id)a5
{
  return 1;
}

+ (int64_t)screenPixelCount
{
  void *v4;
  void *v5;
  double v6;
  int64_t v7;
  void *v9;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nativeBounds");
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nativeScale");
  PXSizeScale();

  PXSizeGetArea();
  v7 = (uint64_t)v6;
  if ((uint64_t)v6 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXGView.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("screenPixelCount > 0"));

  }
  return v7;
}

- (void)engineSetNeedsUpdate:(id)a3
{
  id v3;

  objc_msgSend(a3, "scrollController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdate");

}

- (void)scrollViewControllerDidLayoutSubviews:(id)a3
{
  void *v4;
  void (**v5)(_QWORD);
  void (**v6)(_QWORD);

  -[PXGView updater](self, "updater", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateIfNeeded");

  -[PXGView nextDidLayoutHandler](self, "nextDidLayoutHandler");
  v5 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    -[PXGView setNextDidLayoutHandler:](self, "setNextDidLayoutHandler:", 0);
    v6[2](v6);
    v5 = v6;
  }

}

- (PXUpdater)updater
{
  return self->_updater;
}

- (id)nextDidLayoutHandler
{
  return self->_nextDidLayoutHandler;
}

- (void)_invalidateScrollableAxis
{
  id v2;

  -[PXGView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateScrollableAxis);

}

- (void)safeAreaInsetsDidChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PXGView;
  -[PXGView safeAreaInsetsDidChange](&v19, sel_safeAreaInsetsDidChange);
  -[PXGView safeAreaInsets](self, "safeAreaInsets");
  -[PXGView px_screenScale](self, "px_screenScale");
  PXEdgeInsetsRoundToPixel();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXGView scrollViewController](self, "scrollViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentInset");
  v12 = PXEdgeInsetsEqualToEdgeInsets();

  if ((v12 & 1) == 0)
  {
    -[PXGView scrollViewController](self, "scrollViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentInset:", v4, v6, v8, v10);

    -[PXGView scrollViewController](self, "scrollViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isBouncing");

    if ((v15 & 1) == 0)
    {
      -[PXGView rootLayout](self, "rootLayout");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "createAnchorForVisibleArea");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (id)objc_msgSend(v17, "autoInvalidate");

    }
  }
}

- (UIEdgeInsets)safeAreaInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  UIEdgeInsets result;

  v7.receiver = self;
  v7.super_class = (Class)PXGView;
  -[PXGView safeAreaInsets](&v7, sel_safeAreaInsets);
  -[PXGView additionalSafeAreaInsets](self, "additionalSafeAreaInsets");
  PXEdgeInsetsAdd();
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)additionalSafeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_additionalSafeAreaInsets.top;
  left = self->_additionalSafeAreaInsets.left;
  bottom = self->_additionalSafeAreaInsets.bottom;
  right = self->_additionalSafeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setShouldWorkaround18475431:(BOOL)a3
{
  self->_shouldWorkaround18475431 = a3;
}

- (void)setAdditionalSafeAreaInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_additionalSafeAreaInsets.left
    || a3.top != self->_additionalSafeAreaInsets.top
    || a3.right != self->_additionalSafeAreaInsets.right
    || a3.bottom != self->_additionalSafeAreaInsets.bottom)
  {
    self->_additionalSafeAreaInsets = a3;
    -[PXGView safeAreaInsetsDidChange](self, "safeAreaInsetsDidChange");
  }
}

- (void)_setNeedsUpdate
{
  id v2;

  -[PXGView scrollViewController](self, "scrollViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdate");

}

- (void)scrollViewControllerDidScroll:(id)a3
{
  id v4;

  if (-[PXGView isScrolling](self, "isScrolling", a3)
    || -[PXGView isFocusFastScrolling](self, "isFocusFastScrolling")
    || -[PXGView isAnimatingScroll](self, "isAnimatingScroll"))
  {
    -[PXGView rootLayout](self, "rootLayout");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearLastVisibleAreaAnchoringInformation");

  }
}

- (BOOL)isScrolling
{
  return self->_isScrolling;
}

- (BOOL)isFocusFastScrolling
{
  return self->_isFocusFastScrolling;
}

- (BOOL)isAnimatingScroll
{
  return self->_isAnimatingScroll;
}

- (PXScrollViewController)scrollViewController
{
  return self->_scrollViewController;
}

- (void)installLayoutCompletionHandler:(id)a3
{
  dispatch_async(MEMORY[0x1E0C80D38], a3);
}

- (void)setDiagnosticsSource:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_diagnosticsSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_diagnosticsSource, obj);
    -[PXGView _updateRectDiagnosticsLayer](self, "_updateRectDiagnosticsLayer");
    v5 = obj;
  }

}

- (void)setAxNextResponder:(id)a3
{
  objc_storeWeak((id *)&self->axNextResponder, a3);
}

- (void)registerAllTextureProvidersWithMediaProvider:(id)a3 namedImagesBundle:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PXGView engine](self, "engine");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerAllTextureProvidersWithMediaProvider:namedImagesBundle:", v7, v6);

}

- (PXGView)initWithFrame:(CGRect)a3
{
  return -[PXGView initWithFrame:allowedPresentationTypes:](self, "initWithFrame:allowedPresentationTypes:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)didMoveToWindow
{
  PXGView *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[PXGView _updateIsSceneBackgrounded](self, "_updateIsSceneBackgrounded");
  -[PXGView _updateLayoutScreenProperties](self, "_updateLayoutScreenProperties");
  -[PXGView _updateLayoutViewEnvironment](self, "_updateLayoutViewEnvironment");
  if (-[PXGView isVisible](self, "isVisible"))
  {
    -[PXGView _updateIsVisible](self, "_updateIsVisible");
  }
  else
  {
    v3 = self;
    +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __26__PXGView_didMoveToWindow__block_invoke;
    v6[3] = &unk_1E5149198;
    v6[4] = v3;
    objc_msgSend(v4, "scheduleTaskAfterCATransactionCommits:", v6);

  }
  -[PXGView engine](self, "engine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDidChangeWindow:", 1);

  -[PXGView _updateEngineWindowProperties](self, "_updateEngineWindowProperties");
}

- (void)setRootLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PXGView *v8;
  NSObject *v9;
  void *v10;
  PXGView *v11;
  NSObject *v12;
  void *v13;
  PXGView *v14;
  NSObject *v15;
  void *v16;
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t buf[16];

  v4 = a3;
  -[PXGView engine](self, "engine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "scrollDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "scrollDelegate");
    v8 = (PXGView *)objc_claimAutoreleasedReturnValue();

    if (v8 != self)
    {
      PXAssertGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "unexpected scrollDelegate of rootLayout", buf, 2u);
      }

    }
    objc_msgSend(v6, "setScrollDelegate:", 0);
  }
  objc_msgSend(v6, "viewDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "viewDelegate");
    v11 = (PXGView *)objc_claimAutoreleasedReturnValue();

    if (v11 != self)
    {
      PXAssertGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_error_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "unexpected viewDelegate of rootLayout", v18, 2u);
      }

    }
    objc_msgSend(v6, "setViewDelegate:", 0);
  }
  objc_msgSend(v6, "focusDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v6, "focusDelegate");
    v14 = (PXGView *)objc_claimAutoreleasedReturnValue();

    if (v14 != self)
    {
      PXAssertGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_error_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "unexpected focusDelegate of rootLayout", v17, 2u);
      }

    }
    objc_msgSend(v6, "setFocusDelegate:", 0);
  }
  -[PXGView engine](self, "engine");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLayout:", v4);

  -[PXGView _updateLayoutScreenProperties](self, "_updateLayoutScreenProperties");
  -[PXGView _updateUserInterfaceDirection](self, "_updateUserInterfaceDirection");
  -[PXGView _updateLayoutViewEnvironment](self, "_updateLayoutViewEnvironment");
  -[PXGView _updateFocusItemProvider](self, "_updateFocusItemProvider");
  -[PXGView _updateDebugHUD](self, "_updateDebugHUD");
  objc_msgSend(v4, "setScrollDelegate:", self);
  objc_msgSend(v4, "setViewDelegate:", self);
  objc_msgSend(v4, "setFocusDelegate:", self);

  -[PXGView _invalidateScrollableAxis](self, "_invalidateScrollableAxis");
}

- (void)_updateLayoutViewEnvironment
{
  void *v3;
  PXGViewEnvironment *v4;

  v4 = -[PXGViewEnvironment initWithView:accessibilityEnabled:isBeingFullPageSnapshotted:]([PXGViewEnvironment alloc], "initWithView:accessibilityEnabled:isBeingFullPageSnapshotted:", self, -[PXGView isAccessibilityEnabled](self, "isAccessibilityEnabled"), -[PXGView isBeingFullPageSnapshotted](self, "isBeingFullPageSnapshotted"));
  -[PXGView engine](self, "engine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setViewEnvironment:", v4);

}

- (BOOL)isBeingFullPageSnapshotted
{
  return self->_isBeingFullPageSnapshotted;
}

- (BOOL)isAccessibilityEnabled
{
  return self->_isAccessibilityEnabled;
}

- (PXGLayout)rootLayoutIfExists
{
  void *v2;
  void *v3;

  -[PXGView engine](self, "engine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXGLayout *)v3;
}

- (void)_updateUserInterfaceDirection
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  if (objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PXGView semanticContentAttribute](self, "semanticContentAttribute")))
  {
    v3 = 1;
  }
  else
  {
    -[PXGView ppt_currentTestOptions](self, "ppt_currentTestOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("forceRTL"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "BOOLValue");

  }
  -[PXGView rootLayout](self, "rootLayout");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInterfaceDirection:", v3);

}

- (NSDictionary)ppt_currentTestOptions
{
  return self->_ppt_currentTestOptions;
}

- (void)_updateRectDiagnosticsLayer
{
  PXGRectDiagnosticsLayer *v3;
  PXGRectDiagnosticsLayer *rectDiagnosticsLayer;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  +[PXGRectDiagnosticsLayer layer](PXGRectDiagnosticsLayer, "layer");
  v3 = (PXGRectDiagnosticsLayer *)objc_claimAutoreleasedReturnValue();
  rectDiagnosticsLayer = self->_rectDiagnosticsLayer;
  self->_rectDiagnosticsLayer = v3;

  +[PXGRectDiagnosticsLayer defaultRectDiagnosticsProviders](PXGRectDiagnosticsLayer, "defaultRectDiagnosticsProviders");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[PXGView diagnosticsSource](self, "diagnosticsSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PXGView diagnosticsSource](self, "diagnosticsSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "additionalRectDiagnosticsProvidersForView:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v8;
  }
  else
  {
    v9 = v13;
  }
  v14 = v9;
  -[PXGRectDiagnosticsLayer setRectDiagnosticsProviders:](self->_rectDiagnosticsLayer, "setRectDiagnosticsProviders:", v9);
  -[PXGDebugHUDLayer zPosition](self->_debugHUDLayer, "zPosition");
  -[PXGRectDiagnosticsLayer setZPosition:](self->_rectDiagnosticsLayer, "setZPosition:", v10 + -1.0);
  -[PXGDebugHUDLayer superlayer](self->_debugHUDLayer, "superlayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "insertSublayer:below:", self->_rectDiagnosticsLayer, self->_debugHUDLayer);

  -[PXGView rootLayout](self, "rootLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayScale");
  -[PXGRectDiagnosticsLayer setContentsScale:](self->_rectDiagnosticsLayer, "setContentsScale:");

}

- (PXGViewDiagnosticsSource)diagnosticsSource
{
  return (PXGViewDiagnosticsSource *)objc_loadWeakRetained((id *)&self->_diagnosticsSource);
}

- (void)_updateIsVisible
{
  _BOOL8 v3;
  id v4;

  v3 = -[PXGView isVisible](self, "isVisible");
  -[PXGView engine](self, "engine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVisible:", v3);

}

- (BOOL)isVisible
{
  uint64_t v3;
  void *v4;
  char v5;

  -[PXGView window](self, "window");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[PXGView isHidden](self, "isHidden");

    if ((v5 & 1) != 0)
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = !-[PXGView isSceneBackgrounded](self, "isSceneBackgrounded");
  }
  return v3;
}

- (BOOL)isSceneBackgrounded
{
  return self->_isSceneBackgrounded;
}

- (void)_updateIsSceneBackgrounded
{
  void *v3;
  id v4;

  -[PXGView windowScene](self, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[PXGView setIsSceneBackgrounded:](self, "setIsSceneBackgrounded:", objc_msgSend(v3, "activationState") == 2);
    v3 = v4;
  }

}

- (UIWindowScene)windowScene
{
  void *v2;
  void *v3;

  -[PXGView window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIWindowScene *)v3;
}

- (void)setIsSceneBackgrounded:(BOOL)a3
{
  if (self->_isSceneBackgrounded != a3)
  {
    self->_isSceneBackgrounded = a3;
    -[PXGView _updateIsVisible](self, "_updateIsVisible");
  }
}

- (void)_updateFocusItemProvider
{
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  id v11;

  -[PXGView scrollViewController](self, "scrollViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGView.m"), 1340, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.scrollViewController"), v8);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_descriptionForAssertionMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGView.m"), 1340, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.scrollViewController"), v8, v10);

    goto LABEL_6;
  }
LABEL_3:
  -[PXGView rootLayout](self, "rootLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "axGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFocusItemProvider:", v5);

}

- (void)_updateDebugHUD
{
  uint64_t v3;
  id v4;

  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "wantsStatsDebugHUD") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v4, "wantsRectDiagnosticsDebugHUD");
  -[PXGView setShowDebugHUD:](self, "setShowDebugHUD:", v3);

}

- (void)setShowDebugHUD:(BOOL)a3
{
  _BOOL4 v3;
  PXGDebugHUDLayer *debugHUDLayer;
  PXGRectDiagnosticsLayer *rectDiagnosticsLayer;
  PXGDebugHUDLayer *v7;
  PXGDebugHUDLayer *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;

  if (self->_showDebugHUD != a3)
  {
    v3 = a3;
    self->_showDebugHUD = a3;
    -[PXGDebugHUDLayer removeFromSuperlayer](self->_debugHUDLayer, "removeFromSuperlayer");
    -[PXGRectDiagnosticsLayer removeFromSuperlayer](self->_rectDiagnosticsLayer, "removeFromSuperlayer");
    debugHUDLayer = self->_debugHUDLayer;
    self->_debugHUDLayer = 0;

    rectDiagnosticsLayer = self->_rectDiagnosticsLayer;
    self->_rectDiagnosticsLayer = 0;

    if (v3)
    {
      +[PXGDebugHUDLayer layer](PXGDebugHUDLayer, "layer");
      v7 = (PXGDebugHUDLayer *)objc_claimAutoreleasedReturnValue();
      v8 = self->_debugHUDLayer;
      self->_debugHUDLayer = v7;

      -[PXGView scrollViewController](self, "scrollViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "scrollView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safeAreaInsets");
      v12 = v11;
      v14 = v13;

      -[PXGDebugHUDLayer setFrame:](self->_debugHUDLayer, "setFrame:", v14, v12, 100.0, 100.0);
      -[PXGView layer](self, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addSublayer:", self->_debugHUDLayer);

      -[PXGView rootLayout](self, "rootLayout");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "displayScale");
      -[PXGDebugHUDLayer setContentsScale:](self->_debugHUDLayer, "setContentsScale:");

      -[PXGView engine](self, "engine");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setStatsTrackingEnabled:", 1);

      -[PXGView _updateRectDiagnosticsLayer](self, "_updateRectDiagnosticsLayer");
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXGView bounds](self, "bounds");
  if (width != v9 || height != v8)
    -[PXGView _willChangeBoundsSizeFrom:toBounds:](self, "_willChangeBoundsSizeFrom:toBounds:");
  v11.receiver = self;
  v11.super_class = (Class)PXGView;
  -[PXGView setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (void)setBackgroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;
  UIColor *v7;
  char v8;
  objc_super v9;

  v5 = (UIColor *)a3;
  v6 = self->_backgroundColor;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[UIColor isEqual:](v6, "isEqual:", v5);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_backgroundColor, a3);
      -[PXGView _updateMetalView](self, "_updateMetalView");
      v9.receiver = self;
      v9.super_class = (Class)PXGView;
      -[PXGView setBackgroundColor:](&v9, sel_setBackgroundColor_, v5);
    }
  }

}

- (PXGView)initWithFrame:(CGRect)a3 allowedPresentationTypes:(id)a4
{
  __int128 v5;
  uint64_t v6;

  v5 = *(_OWORD *)off_1E50B8410;
  v6 = *((_QWORD *)off_1E50B8410 + 2);
  return -[PXGView initWithFrame:allowedPresentationTypes:displayConfiguration:](self, "initWithFrame:allowedPresentationTypes:displayConfiguration:", a4, &v5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_willChangeBoundsSizeFrom:(CGRect)a3 toBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  int v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  _BOOL4 v60;
  double v61;
  double v62;
  void *v63;
  id v64;
  void *v65;
  double v66;
  double v67;
  uint64_t v68;
  void *v69;
  id v70;
  void *v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  CGFloat rect2;
  id rect2a;
  void *v78;
  CGFloat v79;
  uint64_t v80;
  CGFloat v81;
  uint64_t v82;
  CGFloat v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[5];
  _QWORD v90[4];
  id v91;
  _QWORD *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  _QWORD v97[5];
  id v98;
  _QWORD *v99;
  CGFloat v100;
  CGFloat v101;
  double v102;
  CGFloat v103;
  double v104;
  double v105;
  double v106;
  double v107;
  _QWORD v108[5];
  id v109;
  _QWORD v110[4];
  id v111;
  _QWORD v112[4];
  id v113;
  _QWORD v114[4];
  id v115;
  double v116;
  double v117;
  double v118;
  double v119;
  _QWORD v120[6];
  id v121;
  double v122;
  double v123;
  double v124;
  double v125;
  BOOL v126;
  _QWORD v127[5];
  _QWORD v128[5];
  id v129;
  double v130;
  double v131;
  double v132;
  double v133;
  BOOL v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _BYTE v139[128];
  _BYTE v140[128];
  uint64_t v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v141 = *MEMORY[0x1E0C80C00];
  -[PXGView metalView](self, "metalView");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGView entityHostingView](self, "entityHostingView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[PXGView entityHostingView](self, "entityHostingView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v81 = v16;
    v83 = v15;
    v79 = v17;
    rect2 = v18;

  }
  else
  {
    objc_msgSend(v78, "frame");
    v81 = v20;
    v83 = v19;
    v79 = v21;
    rect2 = v22;
  }

  if (!-[PXGView shouldWorkaround18475431](self, "shouldWorkaround18475431"))
    goto LABEL_58;
  v142.origin.x = v11;
  v142.origin.y = v10;
  v142.size.width = v9;
  v142.size.height = v8;
  CGRectGetWidth(v142);
  v143.origin.x = x;
  v143.origin.y = y;
  v143.size.width = width;
  v143.size.height = height;
  CGRectGetWidth(v143);
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
LABEL_58:
    v144.origin.x = x;
    v144.origin.y = y;
    v144.size.width = width;
    v144.size.height = height;
    v145.origin.y = v81;
    v145.origin.x = v83;
    v145.size.width = v79;
    v145.size.height = rect2;
    if (!CGRectEqualToRect(v144, v145))
    {
      -[PXGView rootLayout](self, "rootLayout");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "createAnchorForVisibleArea");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (id)objc_msgSend(v24, "autoInvalidate");

      v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
      -[PXGView metalView](self, "metalView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        -[PXGView metalView](self, "metalView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "addObject:", v27);

      }
      -[PXGView entityHostingView](self, "entityHostingView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        -[PXGView entityHostingView](self, "entityHostingView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "addObject:", v29);

      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v75);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGView scrollViewController](self, "scrollViewController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "scrollView");
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      if (v84)
        objc_msgSend(v74, "addObject:");
      v31 = PXIsPhotoPicker();
      -[PXGView traitCollection](self, "traitCollection");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "userInterfaceIdiom") != 1
        || (PXSizeIsEmpty() & 1) != 0
        || (PXSizeIsEmpty() & 1) != 0
        || (PXFloatApproximatelyEqualToFloat() & 1) != 0)
      {

      }
      else
      {
        v47 = PXFloatApproximatelyEqualToFloat();

        if (v47
          && ((objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlockWithAnimationsEnabled") ^ 1 | v31) & 1) == 0)
        {
          v137 = 0u;
          v138 = 0u;
          v135 = 0u;
          v136 = 0u;
          rect2a = v75;
          v82 = objc_msgSend(rect2a, "countByEnumeratingWithState:objects:count:", &v135, v140, 16);
          if (v82)
          {
            v80 = *(_QWORD *)v136;
            v48 = MEMORY[0x1E0C809B0];
            do
            {
              for (i = 0; i != v82; ++i)
              {
                if (*(_QWORD *)v136 != v80)
                  objc_enumerationMutation(rect2a);
                v50 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * i);
                -[PXGView rootLayout](self, "rootLayout");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "createDefaultAnimationForCurrentContext");
                v52 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x1E0DC3F10], "inheritedAnimationDuration");
                objc_msgSend(v52, "setDuration:");
                -[PXGView superview](self, "superview");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "superview");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "layer");
                v55 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v55, "animationKeys");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "firstObject");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "animationForKey:", v57);
                v58 = (void *)objc_claimAutoreleasedReturnValue();

                if (v58)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v52, "setSpringAnimation:", v58);
                    objc_msgSend(v52, "setCurve:", 3);
                  }
                }
                objc_msgSend(v50, "frame");
                v60 = v59 > width;
                v61 = dbl_1A7C0C8C0[v59 > width];
                *(float *)&v61 = v61;
                objc_msgSend(v52, "setSpringAnimationInitialProgress:", v61);
                if (v60)
                  v62 = 0.95;
                else
                  v62 = 1.0;
                *(float *)&v62 = v62;
                objc_msgSend(v52, "setSpringAnimationProgressMultiplier:", v62);
                v63 = (void *)MEMORY[0x1E0DC3F10];
                v128[0] = v48;
                v128[1] = 3221225472;
                v128[2] = __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke;
                v128[3] = &unk_1E513F7F0;
                v134 = v60;
                v128[4] = v50;
                v130 = x;
                v131 = y;
                v132 = width;
                v133 = height;
                v64 = v84;
                v129 = v64;
                objc_msgSend(v63, "performWithoutAnimation:", v128);
                v65 = (void *)MEMORY[0x1E0DC3F10];
                objc_msgSend(MEMORY[0x1E0DC3F10], "inheritedAnimationDuration");
                v67 = v66;
                v127[0] = v48;
                v127[1] = 3221225472;
                v127[2] = __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_2;
                v127[3] = &unk_1E5149198;
                v127[4] = v50;
                v120[0] = v48;
                v120[1] = 3221225472;
                v120[2] = __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_3;
                v120[3] = &unk_1E513F818;
                v126 = v60;
                v122 = x;
                v123 = y;
                v124 = width;
                v125 = height;
                v120[4] = v50;
                v120[5] = self;
                v121 = v64;
                objc_msgSend(v65, "animateWithDuration:animations:completion:", v127, v120, v67);

              }
              v82 = objc_msgSend(rect2a, "countByEnumeratingWithState:objects:count:", &v135, v140, 16);
            }
            while (v82);
          }

          if (!objc_msgSend(rect2a, "count"))
          {
            v68 = MEMORY[0x1E0C809B0];
            v69 = (void *)MEMORY[0x1E0DC3F10];
            v114[0] = MEMORY[0x1E0C809B0];
            v114[1] = 3221225472;
            v114[2] = __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_5;
            v114[3] = &unk_1E51490B0;
            v70 = v84;
            v115 = v70;
            v116 = x;
            v117 = y;
            v118 = width;
            v119 = height;
            objc_msgSend(v69, "performWithoutAnimation:", v114);
            v71 = (void *)MEMORY[0x1E0DC3F10];
            objc_msgSend(MEMORY[0x1E0DC3F10], "inheritedAnimationDuration");
            v73 = v72;
            v112[0] = v68;
            v112[1] = 3221225472;
            v112[2] = __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_6;
            v112[3] = &unk_1E5149198;
            v113 = v70;
            v110[0] = v68;
            v110[1] = 3221225472;
            v110[2] = __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_7;
            v110[3] = &unk_1E5147360;
            v111 = v113;
            objc_msgSend(v71, "animateWithDuration:animations:completion:", v112, v110, v73);

          }
          goto LABEL_37;
        }
      }
      if (!objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlockWithAnimationsEnabled")
        || -[PXGView avoidSnapshotOnHeightChanges](self, "avoidSnapshotOnHeightChanges") && v9 == width)
      {
        if (-[PXGView resizesDrawableManually](self, "resizesDrawableManually") && v78)
          objc_msgSend(v78, "setAutoResizeDrawable:", 0);
        v87 = 0u;
        v88 = 0u;
        v85 = 0u;
        v86 = 0u;
        v33 = v74;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v85, v139, 16);
        if (v34)
        {
          v35 = *(_QWORD *)v86;
          do
          {
            for (j = 0; j != v34; ++j)
            {
              if (*(_QWORD *)v86 != v35)
                objc_enumerationMutation(v33);
              objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * j), "setFrame:", x, y, width, height);
            }
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v85, v139, 16);
          }
          while (v34);
        }

        if (-[PXGView resizesDrawableManually](self, "resizesDrawableManually") && v78 != 0)
        {
          objc_msgSend(v78, "window");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "screen");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38;
          if (v38)
          {
            objc_msgSend(v38, "nativeScale");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "nativeScale");

          }
          -[PXGView displayScaleMultiplier](self, "displayScaleMultiplier");
          PXSizeScale();
          objc_msgSend(v78, "setDrawableSize:");
        }
      }
      else
      {
        v108[0] = 0;
        v108[1] = v108;
        v108[2] = 0x3032000000;
        v108[3] = __Block_byref_object_copy__255621;
        v108[4] = __Block_byref_object_dispose__255622;
        v109 = 0;
        v40 = (void *)MEMORY[0x1E0DC3F10];
        v41 = MEMORY[0x1E0C809B0];
        v97[0] = MEMORY[0x1E0C809B0];
        v97[1] = 3221225472;
        v97[2] = __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_54;
        v97[3] = &unk_1E513F840;
        v99 = v108;
        v97[4] = self;
        v100 = v11;
        v101 = v10;
        v102 = v9;
        v103 = v8;
        v42 = v74;
        v98 = v42;
        v104 = x;
        v105 = y;
        v106 = width;
        v107 = height;
        objc_msgSend(v40, "performWithoutAnimation:", v97);
        v43 = (void *)MEMORY[0x1E0DC3F10];
        objc_msgSend(MEMORY[0x1E0DC3F10], "inheritedAnimationDuration");
        v45 = v44;
        v90[0] = v41;
        v90[1] = 3221225472;
        v90[2] = __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_2_55;
        v90[3] = &unk_1E513F868;
        v92 = v108;
        v93 = x;
        v94 = y;
        v95 = width;
        v96 = height;
        v91 = v42;
        v89[0] = v41;
        v89[1] = 3221225472;
        v89[2] = __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_3_56;
        v89[3] = &unk_1E513F890;
        v89[4] = v108;
        objc_msgSend(v43, "animateWithDuration:animations:completion:", v90, v89, v45);

        _Block_object_dispose(v108, 8);
      }
LABEL_37:

    }
  }

}

- (BOOL)resizesDrawableManually
{
  return self->_resizesDrawableManually;
}

- (MTKView)metalView
{
  return self->_metalView;
}

- (BOOL)shouldWorkaround18475431
{
  return self->_shouldWorkaround18475431;
}

- (void)_updateMetalView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  CGColorSpace *v17;
  id v18;
  CGColor *CopyByMatchingToColorSpace;
  const CGFloat *Components;
  size_t NumberOfComponents;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  _BOOL4 v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[PXGView metalView](self, "metalView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_37;
  v35 = 0.0;
  v36 = 0.0;
  v33 = 0.0;
  v34 = 0.0;
  -[PXGView backgroundColor](self, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedColorWithTraitCollection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "getRed:green:blue:alpha:", &v36, &v35, &v34, &v33) & 1) == 0)
  {
    PXGTungstenGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[PXGView backgroundColor](self, "backgroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v8;
      v39 = 2114;
      v40 = v6;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Unable to retrieve color components from backgroundColor:%{public}@ resolved:%{public}@", buf, 0x16u);

    }
    v33 = 1.0;
    v34 = 1.0;
    v35 = 1.0;
    v36 = 1.0;
  }
  if (UIAccessibilityIsInvertColorsEnabled())
  {
    -[PXGView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceStyle") == 1;

  }
  else
  {
    v10 = 0;
  }
  -[PXGView metalRenderer](self, "metalRenderer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIsInvertColorsEnabled:", v10);

  LODWORD(v11) = v33 == 1.0;
  v12 = v11 & ~-[PXGView enableUnderlaySupport](self, "enableUnderlaySupport", v33);
  if ((_DWORD)v12 == 1)
  {
    v13 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  objc_msgSend(v3, "setBackgroundColor:", v13);
  objc_msgSend(v3, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setOpaque:", v12);

  if (v14)
  {
    -[PXGView metalRenderer](self, "metalRenderer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (CGColorSpace *)MEMORY[0x1A85CCEEC](objc_msgSend(v16, "destinationColorSpaceName"));

    v18 = objc_retainAutorelease(v14);
    CGColorGetColorSpace((CGColorRef)objc_msgSend(v18, "CGColor"));
    if ((CGColorSpaceEqualToColorSpace() & 1) == 0)
    {
      CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v17, kCGRenderingIntentDefault, (CGColorRef)objc_msgSend(objc_retainAutorelease(v18), "CGColor"), 0);
      Components = CGColorGetComponents(CopyByMatchingToColorSpace);
      NumberOfComponents = CGColorGetNumberOfComponents(CopyByMatchingToColorSpace);
      if (NumberOfComponents != 3)
      {
        if (NumberOfComponents == 2)
        {
          v23 = Components[1];
          v34 = *Components;
          v35 = v34;
          v36 = v34;
        }
        else
        {
          if (NumberOfComponents == 1)
          {
            v34 = *Components;
            v35 = v34;
            v36 = v34;
LABEL_19:
            v33 = 1.0;
LABEL_24:
            CGColorRelease(CopyByMatchingToColorSpace);
            goto LABEL_25;
          }
          if (NumberOfComponents < 4)
            goto LABEL_24;
          v24 = *Components;
          v35 = Components[1];
          v36 = v24;
          v23 = Components[3];
          v34 = Components[2];
        }
        v33 = v23;
        goto LABEL_24;
      }
      v22 = *Components;
      v35 = Components[1];
      v36 = v22;
      v34 = Components[2];
      goto LABEL_19;
    }
  }
LABEL_25:
  v25 = v36;
  if (v10)
  {
    v25 = 1.0 - v36;
    v26 = 1.0 - v35;
    v27 = 1.0 - v34;
  }
  else
  {
    v27 = v34;
    v26 = v35;
  }
  objc_msgSend(v3, "setClearColor:", v25 * v33, v26 * v33, v27 * v33);
  -[PXGView displayConfiguration](self, "displayConfiguration");
  v28 = PXGPixelFormatNameToMetalFormat();
  if (!v28)
  {
    v29 = -[PXGView hasExtendedColorDisplay](self, "hasExtendedColorDisplay");
    v30 = 552;
    if ((_DWORD)v12)
      v30 = 554;
    if (v29)
      v28 = v30;
    else
      v28 = 80;
  }
  if (objc_msgSend(v3, "colorPixelFormat") != v28)
    objc_msgSend(v3, "setColorPixelFormat:", v28);
  objc_msgSend(v3, "setHidden:", -[PXGView contentShouldBeObscured](self, "contentShouldBeObscured"));
  -[PXGView engine](self, "engine");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "layout");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setNeedsUpdate");

LABEL_37:
}

- (id)backgroundColor
{
  return self->_backgroundColor;
}

- (PXGMetalRenderer)metalRenderer
{
  return self->_metalRenderer;
}

- (BOOL)hasExtendedColorDisplay
{
  void *v2;
  BOOL v3;

  -[PXGView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "displayGamut") == 1;

  return v3;
}

- (BOOL)contentShouldBeObscured
{
  return self->_contentShouldBeObscured;
}

+ (BOOL)forceAccessibilityEnabled
{
  return s_forceAccessibilityEnabled;
}

+ (unint64_t)supportLevel
{
  if (supportLevel_onceToken != -1)
    dispatch_once(&supportLevel_onceToken, &__block_literal_global_255669);
  return supportLevel_supportLevel;
}

- (PXScrollViewSpeedometer)scrollingSpeedometer
{
  return self->_scrollingSpeedometer;
}

- (void)_updateScrollableAxis
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[PXGView rootLayout](self, "rootLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "scrollableAxis");

  -[PXGView scrollViewController](self, "scrollViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAlwaysBounceHorizontal:", v4 == 2);
  objc_msgSend(v6, "setAlwaysBounceVertical:", v4 == 1);

}

- (PXVisualDiagnosticsConfiguration)visualDiagnosticsConfigurationForFullPageSnapshot
{
  PXGView *v2;
  id v3;

  v2 = self;
  v3 = PXGView.visualDiagnosticsConfigurationForFullPageSnapshot.getter();

  return (PXVisualDiagnosticsConfiguration *)v3;
}

- (void)enumerateCuratedLibraryHitTestResultsAtPoint:(CGPoint)a3 usingBlock:(id)a4
{
  double y;
  double x;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  if (v8)
  {
    -[PXGView hitTestResultsAtPoint:](self, "hitTestResultsAtPoint:", x, y);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __108__PXGView_PXCuratedLibraryHitTestResultExtensions__enumerateCuratedLibraryHitTestResultsAtPoint_usingBlock___block_invoke;
    v9[3] = &unk_1E511F6C8;
    v10 = v8;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

  }
}

- (void)enumerateCuratedLibraryHitTestResultsAtPoint:(CGPoint)a3 withControls:(id)a4 usingBlock:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __121__PXGView_PXCuratedLibraryHitTestResultExtensions__enumerateCuratedLibraryHitTestResultsAtPoint_withControls_usingBlock___block_invoke;
  v13[3] = &unk_1E5118590;
  v14 = v9;
  v15 = v10;
  v11 = v10;
  v12 = v9;
  -[PXGView enumerateCuratedLibraryHitTestResultsAtPoint:usingBlock:](self, "enumerateCuratedLibraryHitTestResultsAtPoint:usingBlock:", v13, x, y);

}

- (id)firstCuratedLibraryHitTestResultsAtPoint:(CGPoint)a3 withControl:(int64_t)a4
{
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__14420;
  v11 = __Block_byref_object_dispose__14421;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __105__PXGView_PXCuratedLibraryHitTestResultExtensions__firstCuratedLibraryHitTestResultsAtPoint_withControl___block_invoke;
  v6[3] = &unk_1E51185B8;
  v6[4] = &v7;
  v6[5] = a4;
  -[PXGView enumerateCuratedLibraryHitTestResultsAtPoint:usingBlock:](self, "enumerateCuratedLibraryHitTestResultsAtPoint:usingBlock:", v6, a3.x, a3.y);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)enumerateCuratedLibraryHitTestResultsInDirection:(unint64_t)a3 fromSpriteReference:(id)a4 usingBlock:(id)a5
{
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a5;
  if (v9)
  {
    -[PXGView hitTestResultsInDirection:fromSpriteReference:](self, "hitTestResultsInDirection:fromSpriteReference:", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __132__PXGView_PXCuratedLibraryHitTestResultExtensions__enumerateCuratedLibraryHitTestResultsInDirection_fromSpriteReference_usingBlock___block_invoke;
    v10[3] = &unk_1E511F6C8;
    v11 = v9;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

  }
}

- (void)enumerateCuratedLibraryHitTestResultsInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[PXGView hitTestResultsInRect:passingTest:](self, "hitTestResultsInRect:passingTest:", 0, x, y, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __107__PXGView_PXCuratedLibraryHitTestResultExtensions__enumerateCuratedLibraryHitTestResultsInRect_usingBlock___block_invoke;
  v12[3] = &unk_1E511F6C8;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v12);

}

- (id)curatedLibraryHitTestResultsInRect:(CGRect)a3 withControl:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  int64_t v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __99__PXGView_PXCuratedLibraryHitTestResultExtensions__curatedLibraryHitTestResultsInRect_withControl___block_invoke;
  v13[3] = &unk_1E51185E0;
  v15 = a4;
  v11 = v10;
  v14 = v11;
  -[PXGView enumerateCuratedLibraryHitTestResultsInRect:usingBlock:](self, "enumerateCuratedLibraryHitTestResultsInRect:usingBlock:", v13, x, y, width, height);

  return v11;
}

void __99__PXGView_PXCuratedLibraryHitTestResultExtensions__curatedLibraryHitTestResultsInRect_withControl___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "control") == *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __107__PXGView_PXCuratedLibraryHitTestResultExtensions__enumerateCuratedLibraryHitTestResultsInRect_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __132__PXGView_PXCuratedLibraryHitTestResultExtensions__enumerateCuratedLibraryHitTestResultsInDirection_fromSpriteReference_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __105__PXGView_PXCuratedLibraryHitTestResultExtensions__firstCuratedLibraryHitTestResultsAtPoint_withControl___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "control") == *(_QWORD *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __121__PXGView_PXCuratedLibraryHitTestResultExtensions__enumerateCuratedLibraryHitTestResultsAtPoint_withControls_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "control"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __108__PXGView_PXCuratedLibraryHitTestResultExtensions__enumerateCuratedLibraryHitTestResultsAtPoint_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)feedHitTestResultAtPoint:(CGPoint)a3
{
  return -[PXGView feedHitTestResultAtPoint:ignoringOverlayContent:](self, "feedHitTestResultAtPoint:ignoringOverlayContent:", 0, a3.x, a3.y);
}

- (id)feedHitTestResultAtPoint:(CGPoint)a3 ignoringOverlayContent:(BOOL)a4
{
  void *v4;
  id v5;

  if (a4)
    -[PXGView hitTestResultAtPoint:padding:passingTest:](self, "hitTestResultAtPoint:padding:passingTest:", &__block_literal_global_38408, a3.x, a3.y, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
  else
    -[PXGView hitTestResultAtPoint:](self, "hitTestResultAtPoint:", a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (id)feedHitTestResultsInRect:(CGRect)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PXGView hitTestResultsInRect:passingTest:](self, "hitTestResultsInRect:passingTest:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_47);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)handlePrimaryInteractionAtPoint:(CGPoint)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;

  -[PXGView feedHitTestResultAtPoint:](self, "feedHitTestResultAtPoint:", a3.x, a3.y);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryAction");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (*(uint64_t (**)(uint64_t))(v4 + 16))(v4);
  else
    v6 = 0;

  return v6;
}

- (id)handleTouchAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  y = a3.y;
  x = a3.x;
  -[PXGView feedHitTestResultAtPoint:](self, "feedHitTestResultAtPoint:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "touchAction");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "layout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      -[PXGView rootLayout](self, "rootLayout");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v10;

    -[PXGView convertPoint:toLayout:](self, "convertPoint:toLayout:", v12, x, y);
    ((void (**)(_QWORD, void *))v7)[2](v7, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  v13 = _Block_copy(v11);

  return v13;
}

uint64_t __44__PXGView_PXFeed__feedHitTestResultsInRect___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __67__PXGView_PXFeed__feedHitTestResultAtPoint_ignoringOverlayContent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  char isKindOfClass;

  objc_msgSend(a3, "leafSublayoutForSpriteIndex:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y;
  double x;
  objc_class *v7;
  id v8;
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  PXDiagnosticsItemProvider *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  CGPoint v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  v7 = (objc_class *)MEMORY[0x1E0C99DE8];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  -[PXGView convertPoint:fromCoordinateSpace:](self, "convertPoint:fromCoordinateSpace:", v8, x, y);
  v11 = v10;
  v13 = v12;

  -[PXGView bounds](self, "bounds");
  v19.x = v11;
  v19.y = v13;
  if (CGRectContainsPoint(v20, v19))
  {
    v14 = objc_alloc_init(PXDiagnosticsItemProvider);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __80__PXGView_PXDiagnostics__px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke;
    v18[3] = &unk_1E5148158;
    v18[4] = self;
    -[PXDiagnosticsItemProvider registerItemForIdentifier:loadHandler:](v14, "registerItemForIdentifier:loadHandler:", CFSTR("PXDiagnosticsItemIdentifierTungstenView"), v18);
    objc_msgSend(v9, "addObject:", v14);
    -[PXGView rootLayout](self, "rootLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PXRectWithOriginAndSize();
    -[PXGView hitTestPadding](self, "hitTestPadding");
    sub_1A7AE3F38();
    PXEdgeInsetsInsetRect();
    -[PXGView convertRect:toLayout:](self, "convertRect:toLayout:", v15);
    objc_msgSend(v15, "diagnosticsItemProvidersInRect:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v16);

  }
  return v9;
}

id __80__PXGView_PXDiagnostics__px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (PXGView)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGView.m"), 212, CFSTR("%s is not available as initializer"), "-[PXGView initWithCoder:]");

  abort();
}

- (PXGView)initWithFrame:(CGRect)a3 allowedPresentationTypes:(id)a4 displayConfiguration:(id *)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  PXGView *v12;
  PXGView *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unint64_t var2;
  void *v23;
  __int128 v24;
  void *v25;
  PXUIScrollViewController *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id *p_scrollViewController;
  uint64_t v33;
  PXScrollViewSpeedometer *scrollingSpeedometer;
  void *v35;
  int v36;
  PXGViewRenderer *v37;
  PXGViewRenderer *viewRenderer;
  PXGMetalViewRenderDestination *v39;
  PXGMetalViewRenderDestination *v40;
  PXGMetalRenderer *v41;
  uint64_t v42;
  PXGMetalRenderer *metalRenderer;
  uint64_t v44;
  MTKView *metalView;
  PXGEngine *v46;
  PXGAnimator *v47;
  uint64_t v48;
  PXGEngine *engine;
  void *v50;
  uint64_t v51;
  PXUpdater *updater;
  MTKView *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  __int128 v59;
  unint64_t v60;
  objc_super v61;
  objc_super v62;
  _QWORD v63[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v63[2] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v62.receiver = self;
  v62.super_class = (Class)PXGView;
  v12 = -[PXGView initWithFrame:](&v62, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
  {
    -[PXGView bounds](v12, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    var2 = a5->var2;
    *(_OWORD *)&v13->_displayConfiguration.allowHDR = *(_OWORD *)&a5->var0;
    v13->_displayConfiguration.requiredPixelFormat = var2;
    v13->_displayScaleMultiplier = 1.0;
    if (!v11)
    {
      v63[0] = &unk_1E53EF270;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v63[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    v24 = *((_OWORD *)off_1E50B8010 + 1);
    *(_OWORD *)&v13->_hitTestPadding.top = *(_OWORD *)off_1E50B8010;
    *(_OWORD *)&v13->_hitTestPadding.bottom = v24;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v61.receiver = v13;
    v61.super_class = (Class)PXGView;
    -[PXGView setBackgroundColor:](&v61, sel_setBackgroundColor_, v25);

    v26 = -[PXUIScrollViewController initWithFrame:]([PXUIScrollViewController alloc], "initWithFrame:", v15, v17, v19, v21);
    -[PXUIScrollViewController scrollView](v26, "scrollView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setContentInsetAdjustmentBehavior:", 1);

    -[PXUIScrollViewController scrollView](v26, "scrollView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);

    -[PXUIScrollViewController scrollView](v26, "scrollView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_setShouldContentOffsetAlwaysIgnoreSafeAreaInsetsChange:", 1);

    -[PXUIScrollViewController scrollView](v26, "scrollView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAutoresizingMask:", 0);

    -[PXUIScrollViewController scrollView](v26, "scrollView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setClipsToBounds:", 0);

    p_scrollViewController = (id *)&v13->_scrollViewController;
    objc_storeStrong((id *)&v13->_scrollViewController, v26);
    -[PXScrollViewController setRespectsContentZOrder:](v13->_scrollViewController, "setRespectsContentZOrder:", 1);
    -[PXScrollViewController registerObserver:](v13->_scrollViewController, "registerObserver:", v13);
    v33 = objc_msgSend(objc_alloc((Class)off_1E50B47A0), "initWithScrollController:", v13->_scrollViewController);
    scrollingSpeedometer = v13->_scrollingSpeedometer;
    v13->_scrollingSpeedometer = (PXScrollViewSpeedometer *)v33;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v11, "containsObject:", &unk_1E53EF288);
    if (objc_msgSend(v11, "containsObject:", &unk_1E53EF270))
    {
      v37 = objc_alloc_init(PXGViewRenderer);
      viewRenderer = v13->_viewRenderer;
      v13->_viewRenderer = v37;

      -[PXGViewRenderer setScrollViewController:](v13->_viewRenderer, "setScrollViewController:", *p_scrollViewController);
      -[PXGViewRenderer setShouldSeparateViewLayers:](v13->_viewRenderer, "setShouldSeparateViewLayers:", 0);
      -[PXGViewRenderer setRootView:](v13->_viewRenderer, "setRootView:", v13);
      objc_msgSend(v35, "addObject:", v13->_viewRenderer);
    }
    if (v36)
    {
      v39 = [PXGMetalViewRenderDestination alloc];
      v59 = *(_OWORD *)&a5->var0;
      v60 = a5->var2;
      v40 = -[PXGMetalViewRenderDestination initWithDisplayConfiguration:](v39, "initWithDisplayConfiguration:", &v59);
      -[PXGView displayScaleMultiplier](v13, "displayScaleMultiplier");
      -[PXGMetalViewRenderDestination setDisplayScaleMultiplier:](v40, "setDisplayScaleMultiplier:");
      v41 = [PXGMetalRenderer alloc];
      v42 = -[PXGMetalRenderer initWithRenderDestination:layoutQueue:](v41, "initWithRenderDestination:layoutQueue:", v40, MEMORY[0x1E0C80D38]);
      metalRenderer = v13->_metalRenderer;
      v13->_metalRenderer = (PXGMetalRenderer *)v42;

      -[PXGMetalViewRenderDestination metalView](v40, "metalView");
      v44 = objc_claimAutoreleasedReturnValue();
      metalView = v13->_metalView;
      v13->_metalView = (MTKView *)v44;

      objc_msgSend(v35, "addObject:", v13->_metalRenderer);
    }
    v46 = [PXGEngine alloc];
    v47 = objc_alloc_init(PXGAnimator);
    v48 = -[PXGEngine initWithAnimator:renderers:displayLinkClass:layoutQueue:](v46, "initWithAnimator:renderers:displayLinkClass:layoutQueue:", v47, v35, objc_opt_class(), MEMORY[0x1E0C80D38]);
    engine = v13->_engine;
    v13->_engine = (PXGEngine *)v48;

    -[PXGEngine setScrollController:](v13->_engine, "setScrollController:", v26);
    -[PXGEngine setScrollViewSpeedometer:](v13->_engine, "setScrollViewSpeedometer:", v13->_scrollingSpeedometer);
    -[PXGEngine setInteractionView:](v13->_engine, "setInteractionView:", v13);
    -[PXGEngine setDelegate:](v13->_engine, "setDelegate:", v13);
    -[PXGEngine coalescingAXResponder](v13->_engine, "coalescingAXResponder");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setAxNextResponder:", v13);

    v51 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v13, sel__setNeedsUpdate);
    updater = v13->_updater;
    v13->_updater = (PXUpdater *)v51;

    -[PXUpdater addUpdateSelector:](v13->_updater, "addUpdateSelector:", sel__updateScrollableAxis);
    if (v36)
    {
      v53 = v13->_metalView;
      -[PXGView bounds](v13, "bounds");
      -[MTKView setFrame:](v53, "setFrame:");
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTKView setBackgroundColor:](v53, "setBackgroundColor:", v54);

      -[MTKView setAutoresizingMask:](v53, "setAutoresizingMask:", 0);
      -[PXGView addSubview:](v13, "addSubview:", v13->_metalView);

    }
    objc_msgSend(*p_scrollViewController, "scrollView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGView addSubview:](v13, "addSubview:", v55);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGView setBackgroundColor:](v13, "setBackgroundColor:", v57);

    objc_msgSend(v56, "addObserver:selector:name:object:", v13, sel__updateInvertColors, *MEMORY[0x1E0DC4528], 0);
    objc_msgSend(v56, "addObserver:selector:name:object:", v13, sel__handleSceneDidEnterBackground_, *MEMORY[0x1E0DC5318], 0);
    objc_msgSend(v56, "addObserver:selector:name:object:", v13, sel__handleSceneWillEnterForeground_, *MEMORY[0x1E0DC5338], 0);
    v13->_isAccessibilityEnabled = objc_msgSend((id)objc_opt_class(), "forceAccessibilityEnabled");
    v13->_offscreenEffectQuality = 3;

  }
  return v13;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if ((void *)WindowFirstResponderObserverContext == a6)
  {
    -[PXGView _updateLayoutViewEnvironment](self, "_updateLayoutViewEnvironment", a3, a4, a5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXGView;
    -[PXGView observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXGView bounds](self, "bounds");
  if (width != v9 || height != v8)
    -[PXGView _willChangeBoundsSizeFrom:toBounds:](self, "_willChangeBoundsSizeFrom:toBounds:");
  v11.receiver = self;
  v11.super_class = (Class)PXGView;
  -[PXGView setBounds:](&v11, sel_setBounds_, x, y, width, height);
}

- (void)setShouldScrollViewContentInsetAlwaysAdjustToAvoidSafeArea:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (self->_shouldScrollViewContentInsetAlwaysAdjustToAvoidSafeArea != a3)
  {
    v3 = a3;
    self->_shouldScrollViewContentInsetAlwaysAdjustToAvoidSafeArea = a3;
    -[PXGView scrollViewController](self, "scrollViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scrollView");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v3)
      v5 = 3;
    else
      v5 = 1;
    objc_msgSend(v6, "setContentInsetAdjustmentBehavior:", v5);
    objc_msgSend(v6, "_setAutomaticContentOffsetAdjustmentEnabled:", v3);
    objc_msgSend(v6, "_setShouldContentOffsetAlwaysIgnoreSafeAreaInsetsChange:", v3 ^ 1);

  }
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGView;
  -[PXGView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[PXGView _updateLayoutViewEnvironment](self, "_updateLayoutViewEnvironment");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXGView;
  v4 = a3;
  -[PXGView traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  -[PXGView traitCollection](self, "traitCollection", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v6)
    -[PXGView _updateMetalView](self, "_updateMetalView");
  -[PXGView _updateLayoutViewEnvironment](self, "_updateLayoutViewEnvironment");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXGView;
  v6 = a3;
  -[PXGView didUpdateFocusInContext:withAnimationCoordinator:](&v11, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(v6, "previouslyFocusedItem", v11.receiver, v11.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXGView px_isAncestorOfFocusEnvironment:](self, "px_isAncestorOfFocusEnvironment:", v7);

  objc_msgSend(v6, "nextFocusedItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PXGView px_isAncestorOfFocusEnvironment:](self, "px_isAncestorOfFocusEnvironment:", v9);
  if ((v8 & 1) != 0 || v10)
    -[PXGView _updateLayoutViewEnvironment](self, "_updateLayoutViewEnvironment");
}

- (void)setAllowLargerImagesDuringScrollingInLowMemoryMode:(BOOL)a3
{
  if (self->_allowLargerImagesDuringScrollingInLowMemoryMode != a3)
  {
    self->_allowLargerImagesDuringScrollingInLowMemoryMode = a3;
    -[PXGView _updateEngineLowMemoryMode](self, "_updateEngineLowMemoryMode");
  }
}

- (void)setDisableMetalViewDisplayCompositing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_disableMetalViewDisplayCompositing != a3)
  {
    v3 = a3;
    self->_disableMetalViewDisplayCompositing = a3;
    -[PXGView engine](self, "engine");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDisableMetalViewDisplayCompositing:", v3);

  }
}

- (void)setLowMemoryModeEnabled:(BOOL)a3
{
  if (self->_lowMemoryModeEnabled != a3)
  {
    self->_lowMemoryModeEnabled = a3;
    -[PXGView _updateEngineLowMemoryMode](self, "_updateEngineLowMemoryMode");
  }
}

- (void)setOffscreenEffectQuality:(unint64_t)a3
{
  double v3;
  void *v6;

  if (self->_offscreenEffectQuality != a3)
  {
    self->_offscreenEffectQuality = a3;
    if (a3 == 1)
    {
      v3 = 0.25;
    }
    else if (a3 == 2)
    {
      v3 = 0.5;
    }
    else
    {
      v3 = 1.0;
      if (!a3)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 1.0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGView.m"), 649, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
    }
    -[PXGMetalRenderer setOffscreenEffectScale:](self->_metalRenderer, "setOffscreenEffectScale:", v3);
  }
}

- (void)_handleSceneDidEnterBackground:(id)a3
{
  id v4;
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXGView windowScene](self, "windowScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
    -[PXGView setIsSceneBackgrounded:](self, "setIsSceneBackgrounded:", 1);

}

- (void)_handleSceneWillEnterForeground:(id)a3
{
  id v4;
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXGView windowScene](self, "windowScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
    -[PXGView setIsSceneBackgrounded:](self, "setIsSceneBackgrounded:", 0);

}

- (void)notifyContentFullyLoadedWithTimeout:(double)a3 block:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[PXGView engine](self, "engine");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notifyContentFullyLoadedWithTimeout:block:", v6, a3);

}

- (void)setEnableUnderlaySupport:(BOOL)a3
{
  if (self->_enableUnderlaySupport != a3)
  {
    self->_enableUnderlaySupport = a3;
    -[PXGView _updateMetalView](self, "_updateMetalView");
  }
}

- (id)preferredFocusEnvironments
{
  void *v2;
  void *v3;

  -[PXGView rootLayout](self, "rootLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXGDeepestPreferredFocusEnvironmentsForLayout(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)exportDebugHierarchyToURL:(id)a3 error:(id *)a4
{
  return +[PXDebugHierarchyCAArchiver archiveDebugHierarchyWithIdentifier:provider:toURL:error:](PXDebugHierarchyCAArchiver, "archiveDebugHierarchyWithIdentifier:provider:toURL:error:", CFSTR("PXGViewLayoutsAndSpritesHierarchyIdentifier"), self, a3, a4);
}

- (NSString)preferredFileNameForExportingDebugHierarchy
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@-%p-%lx.caar"), v5, self, objc_msgSend(v6, "hash"));

  return (NSString *)v7;
}

- (void)_updateAccessibility
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  PXGTungstenGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "Accessibility Enabled", v6, 2u);
  }

  -[PXGView setIsAccessibilityEnabled:](self, "setIsAccessibilityEnabled:", 1);
  -[PXGView _updateLayoutViewEnvironment](self, "_updateLayoutViewEnvironment");
  -[PXGView engine](self, "engine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsUpdate");

}

- (void)_updateInvertColors
{
  -[PXGView _updateMetalView](self, "_updateMetalView");
  -[PXGView _updateWolfRendererInvertColors](self, "_updateWolfRendererInvertColors");
}

- (void)setContentShouldBeObscured:(BOOL)a3
{
  if (self->_contentShouldBeObscured != a3)
  {
    self->_contentShouldBeObscured = a3;
    -[PXGView _updateMetalView](self, "_updateMetalView");
  }
}

- (void)setHidden:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXGView;
  -[PXGView setHidden:](&v4, sel_setHidden_, a3);
  -[PXGView _updateIsVisible](self, "_updateIsVisible");
}

- (void)registerTextureProvider:(id)a3 forMediaKind:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[PXGView engine](self, "engine");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerTextureProvider:forMediaKind:", v6, v4);

}

- (void)registerAllTextureProvidersWithMediaProvider:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXGView engine](self, "engine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerAllTextureProvidersWithMediaProvider:namedImagesBundle:", v4, 0);

}

- (void)installRenderingCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    -[PXGView engine](self, "engine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "renderingCompletionHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__PXGView_installRenderingCompletionHandler___block_invoke;
    v8[3] = &unk_1E513F8E8;
    v9 = v6;
    v10 = v4;
    v7 = v6;
    objc_msgSend(v5, "setRenderingCompletionHandler:", v8);

  }
}

- (void)installAnimationRenderingCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    -[PXGView engine](self, "engine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "animationRenderingCompletionHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__PXGView_installAnimationRenderingCompletionHandler___block_invoke;
    v8[3] = &unk_1E513F8E8;
    v9 = v6;
    v10 = v4;
    v7 = v6;
    objc_msgSend(v5, "setAnimationRenderingCompletionHandler:", v8);

  }
}

- (void)_updateLayoutScreenProperties
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  float v8;
  double v9;
  id v10;

  -[PXGView maximumDynamicRangeHeadroom](self, "maximumDynamicRangeHeadroom");
  v4 = v3;
  -[PXGView rootLayoutIfExists](self, "rootLayoutIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisplayMaximumHeadroom:", v4);

  -[PXGView px_screenScale](self, "px_screenScale");
  v7 = v6;
  -[PXGView displayScaleMultiplier](self, "displayScaleMultiplier");
  v9 = v7 * v8;
  -[PXGView rootLayoutIfExists](self, "rootLayoutIfExists");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDisplayScale:", v9);

}

- (void)_updateEngineLowMemoryMode
{
  _BOOL8 v3;
  void *v4;
  _BOOL8 v5;
  id v6;

  v3 = -[PXGView lowMemoryModeEnabled](self, "lowMemoryModeEnabled");
  -[PXGView engine](self, "engine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLowMemoryMode:", v3);

  v5 = -[PXGView allowLargerImagesDuringScrollingInLowMemoryMode](self, "allowLargerImagesDuringScrollingInLowMemoryMode");
  -[PXGView engine](self, "engine");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowLargerImagesDuringScrollingInLowMemoryMode:", v5);

}

- (void)_installNextDidLayoutHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  -[PXGView nextDidLayoutHandler](self, "nextDidLayoutHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__PXGView__installNextDidLayoutHandler___block_invoke;
  v8[3] = &unk_1E513F8E8;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  -[PXGView setNextDidLayoutHandler:](self, "setNextDidLayoutHandler:", v8);

}

- (void)setScrollingAnimationAnchor:(id)a3
{
  PXGAnchor *v5;
  PXGAnchor *scrollingAnimationAnchor;
  PXGAnchor *v7;
  _QWORD v8[4];
  PXGAnchor *v9;

  v5 = (PXGAnchor *)a3;
  scrollingAnimationAnchor = self->_scrollingAnimationAnchor;
  if (scrollingAnimationAnchor != v5)
  {
    v7 = scrollingAnimationAnchor;
    objc_storeStrong((id *)&self->_scrollingAnimationAnchor, a3);
    if (v7)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __39__PXGView_setScrollingAnimationAnchor___block_invoke;
      v8[3] = &unk_1E5149198;
      v9 = v7;
      -[PXGView installLayoutCompletionHandler:](self, "installLayoutCompletionHandler:", v8);

    }
  }

}

- (void)disablePreheating
{
  void *v3;
  void *v4;
  id v5;

  +[PXGTextureManagerPreheatingStrategy noPreheatingStrategy](PXGTextureManagerPreheatingStrategy, "noPreheatingStrategy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXGView engine](self, "engine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textureManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreheatingStrategy:", v5);

}

- (id)hitTestResultAtPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;

  y = a3.y;
  x = a3.x;
  -[PXGView hitTestPadding](self, "hitTestPadding");
  return -[PXGView hitTestResultAtPoint:padding:passingTest:](self, "hitTestResultAtPoint:padding:passingTest:", 0, x, y, v6, v7, v8, v9);
}

- (id)hitTestResultAtPoint:(CGPoint)a3 padding:(UIEdgeInsets)a4 passingTest:(id)a5
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  double y;
  double x;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v31;
  double v32;
  double v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint64_t *v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  int64x2_t v49;
  __int128 v50;
  __int128 v51;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  y = a3.y;
  x = a3.x;
  v13 = a5;
  -[PXGView rootLayout](self, "rootLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGView.m"), 1436, CFSTR("can't do hit testing without a layout"));

  }
  -[PXGView convertPoint:toLayout:](self, "convertPoint:toLayout:", v14, x, y);
  v16 = v15;
  v18 = v17;
  PXRectWithEdges();
  v32 = v20;
  v33 = v19;
  v22 = v21;
  v24 = v23;
  v46 = 0x5810000000;
  v49 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  v25 = *((_OWORD *)off_1E50B8358 + 1);
  v50 = *(_OWORD *)off_1E50B8358;
  v44 = 0;
  v45 = &v44;
  v47 = &unk_1A7E74EE7;
  v48 = 0xFFFFFFFFLL;
  v51 = v25;
  -[PXGView engine](self, "engine");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __52__PXGView_hitTestResultAtPoint_padding_passingTest___block_invoke;
  v34[3] = &unk_1E513F910;
  v38 = top;
  v39 = left;
  v40 = bottom;
  v41 = right;
  v42 = v16;
  v43 = v18;
  v37 = &v44;
  v27 = v13;
  v36 = v27;
  v28 = v14;
  v35 = v28;
  objc_msgSend(v26, "enumerateSpritesInRect:usingBlock:", v34, v33, v32, v22, v24);

  if (*((_DWORD *)v45 + 8) == -1)
  {
    v29 = 0;
  }
  else
  {
    objc_msgSend(v28, "hitTestResultForSpriteIndex:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v44, 8);
  return v29;
}

- (id)hitTestResultsAtPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;

  y = a3.y;
  x = a3.x;
  -[PXGView hitTestPadding](self, "hitTestPadding");
  return -[PXGView hitTestResultsAtPoint:padding:passingTest:](self, "hitTestResultsAtPoint:padding:passingTest:", 0, x, y, v6, v7, v8, v9);
}

- (id)hitTestResultsAtPoint:(CGPoint)a3 withIdentifiers:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PXGView hitTestPadding](self, "hitTestPadding");
  -[PXGView hitTestResultsAtPoint:padding:passingTest:](self, "hitTestResultsAtPoint:padding:passingTest:", 0, x, y, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3880];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __49__PXGView_hitTestResultsAtPoint_withIdentifiers___block_invoke;
  v18[3] = &unk_1E513F938;
  v19 = v7;
  v14 = v7;
  objc_msgSend(v13, "predicateWithBlock:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "filteredArrayUsingPredicate:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)hitTestResultsAtPoint:(CGPoint)a3 padding:(UIEdgeInsets)a4 passingTest:(id)a5
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  double y;
  double x;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v38;
  double v39;
  double v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  uint64_t v53;
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  y = a3.y;
  x = a3.x;
  v56 = *MEMORY[0x1E0C80C00];
  v13 = a5;
  -[PXGView rootLayout](self, "rootLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGView.m"), 1492, CFSTR("can't do hit testing without a layout"));

  }
  -[PXGView convertPoint:toLayout:](self, "convertPoint:toLayout:", v14, x, y);
  v16 = v15;
  v18 = v17;
  PXRectWithEdges();
  v39 = v20;
  v40 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGView engine](self, "engine");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __53__PXGView_hitTestResultsAtPoint_padding_passingTest___block_invoke;
  v45[3] = &unk_1E513F960;
  v27 = v13;
  v48 = v27;
  v28 = v14;
  v46 = v28;
  v49 = top;
  v50 = left;
  v51 = bottom;
  v52 = right;
  v53 = v16;
  v54 = v18;
  v29 = v25;
  v47 = v29;
  objc_msgSend(v26, "enumerateSpritesInRect:usingBlock:", v45, v40, v39, v22, v24);

  objc_msgSend(v29, "sortUsingSelector:", sel_compare_);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v29, "count"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v31 = v29;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v42 != v34)
          objc_enumerationMutation(v31);
        objc_msgSend(v28, "hitTestResultForSpriteIndex:", *(unsigned int *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i)), "hitInfo"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
          objc_msgSend(v30, "addObject:", v36);

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
    }
    while (v33);
  }

  return v30;
}

- (id)hitTestResultsInRect:(CGRect)a3 passingTest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXGView scrollViewController](self, "scrollViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentCoordinateSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PXRectConvertFromCoordinateSpaceToCoordinateSpace();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[PXGView rootLayout](self, "rootLayout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGView.m"), 1532, CFSTR("can't do hit testing without a layout"));

  }
  -[PXGView engine](self, "engine");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __44__PXGView_hitTestResultsInRect_passingTest___block_invoke;
  v26[3] = &unk_1E513F988;
  v28 = v7;
  v29 = v6;
  v27 = v18;
  v20 = v7;
  v21 = v18;
  v22 = v6;
  objc_msgSend(v19, "enumerateSpritesInRect:usingBlock:", v26, v11, v13, v15, v17);

  v23 = (void *)objc_msgSend(v20, "copy");
  return v23;
}

- (id)hitTestResultsInDirection:(unint64_t)a3 fromSpriteReference:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double MaxY;
  double MinY;
  double v23;
  char v24;
  double v25;
  double v26;
  uint64_t v27;
  void (**v28)(_QWORD, double, double, double, double);
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  double v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[10];
  char v45;
  BOOL v46;
  _QWORD aBlock[5];
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v6 = a4;
  -[PXGView rootLayout](self, "rootLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGView regionOfInterestForSpriteReference:](self, "regionOfInterestForSpriteReference:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "rectInCoordinateSpace:", self);
  PXRectShrinkToPixel();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  switch(a3)
  {
    case 1uLL:
    case 6uLL:
      objc_msgSend(v7, "referenceSize");
      v18 = v17;
      v20 = v19;
      v48.origin.x = v10;
      v48.origin.y = v12;
      v48.size.width = v14;
      v48.size.height = v16;
      MaxY = CGRectGetMaxY(v48);
      v49.origin.x = v10;
      v49.origin.y = v12;
      v49.size.width = v18;
      v40 = v20;
      v49.size.height = v20;
      MinY = MaxY - CGRectGetHeight(v49);
      v23 = 0.0;
      v24 = 1;
      break;
    case 2uLL:
    case 5uLL:
      objc_msgSend(v7, "referenceSize");
      v18 = v25;
      v40 = v26;
      v50.origin.x = v10;
      v50.origin.y = v12;
      v50.size.width = v14;
      v50.size.height = v16;
      MinY = CGRectGetMinY(v50);
      v24 = 0;
      v23 = 0.0;
      break;
    case 3uLL:
      v23 = v10 - v14;
      v24 = 1;
      goto LABEL_7;
    case 4uLL:
      v24 = 0;
      v23 = v10 + v14;
LABEL_7:
      v40 = v16;
      v18 = v14;
      MinY = v12;
      break;
    default:
      v24 = 0;
      v40 = v16;
      v18 = v14;
      MinY = v12;
      v23 = v10;
      break;
  }
  v27 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__PXGView_hitTestResultsInDirection_fromSpriteReference___block_invoke;
  aBlock[3] = &unk_1E513F9D8;
  aBlock[4] = self;
  v28 = (void (**)(_QWORD, double, double, double, double))_Block_copy(aBlock);
  -[PXGView rootLayout](self, "rootLayout");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "userInterfaceDirection") == 1;

  v28[2](v28, v10, v12, v14, v16);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2](v28, v23, MinY, v18, v40);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v27;
  v44[1] = 3221225472;
  v44[2] = __57__PXGView_hitTestResultsInDirection_fromSpriteReference___block_invoke_3;
  v44[3] = &unk_1E513FA00;
  *(double *)&v44[5] = v10;
  *(double *)&v44[6] = v12;
  *(double *)&v44[7] = v14;
  *(double *)&v44[8] = v16;
  v44[4] = self;
  v45 = v24;
  v46 = v30;
  v44[9] = a3;
  objc_msgSend(v32, "sortedArrayUsingComparator:", v44);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "firstObject");
  v42[0] = v27;
  v42[1] = 3221225472;
  v42[2] = __57__PXGView_hitTestResultsInDirection_fromSpriteReference___block_invoke_5;
  v42[3] = &unk_1E513FA28;
  v43 = (id)objc_claimAutoreleasedReturnValue();
  v34 = v43;
  v35 = objc_msgSend(v33, "indexOfObjectPassingTest:", v42);
  if (v35 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v36 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v33, "subarrayWithRange:", v35 + 1, objc_msgSend(v33, "count") - (v35 + 1));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41 = v7;
  v37 = v7;
  PXMap();
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (id)dropTargetObjectReferenceForLocation:(CGPoint)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  -[PXGView rootLayout](self, "rootLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceDirection");

  if (v5 == 1)
    -[PXGView bounds](self, "bounds");
  -[PXGView scrollViewController](self, "scrollViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentCoordinateSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PXPointConvertFromCoordinateSpaceToCoordinateSpace();
  v9 = v8;
  v11 = v10;

  -[PXGView rootLayout](self, "rootLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dropTargetObjectReferenceForLocation:", v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (CGPoint)convertPoint:(CGPoint)a3 toLayout:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGPoint result;

  v5 = a4;
  -[PXGView scrollViewController](self, "scrollViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentCoordinateSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PXPointConvertFromCoordinateSpaceToCoordinateSpace();
  v9 = v8;
  v11 = v10;

  -[PXGView rootLayout](self, "rootLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertPoint:fromLayout:", v12, v9, v11);
  v14 = v13;
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.y = v18;
  result.x = v17;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromLayout:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PXGView rootLayout](self, "rootLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:fromLayout:", v7, x, y);

  -[PXGView scrollViewController](self, "scrollViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentCoordinateSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PXPointConvertFromCoordinateSpaceToCoordinateSpace();
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toLayout:(id)a4
{
  id v5;
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
  CGRect result;

  v5 = a4;
  -[PXGView scrollViewController](self, "scrollViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentCoordinateSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PXRectConvertFromCoordinateSpaceToCoordinateSpace();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[PXGView rootLayout](self, "rootLayout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertRect:fromLayout:", v16, v9, v11, v13, v15);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = v18;
  v26 = v20;
  v27 = v22;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[PXGView rootLayout](self, "rootLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertRect:fromLayout:", v9, x, y, width, height);

  -[PXGView scrollViewController](self, "scrollViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentCoordinateSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PXRectConvertFromCoordinateSpaceToCoordinateSpace();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)regionOfInterestForSpriteReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _OWORD v21[2];
  _OWORD v22[2];
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  _OWORD v26[10];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[PXGView engine](self, "engine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_5;
    v7 = *((_OWORD *)off_1E50B8358 + 1);
    v24 = *(_OWORD *)off_1E50B8358;
    v25 = v7;
    v8 = *((_OWORD *)off_1E50B83A0 + 7);
    v33 = *((_OWORD *)off_1E50B83A0 + 6);
    v34 = v8;
    v9 = *((_OWORD *)off_1E50B83A0 + 9);
    v35 = *((_OWORD *)off_1E50B83A0 + 8);
    v36 = v9;
    v10 = *((_OWORD *)off_1E50B83A0 + 3);
    v29 = *((_OWORD *)off_1E50B83A0 + 2);
    v30 = v10;
    v11 = *((_OWORD *)off_1E50B83A0 + 5);
    v31 = *((_OWORD *)off_1E50B83A0 + 4);
    v32 = v11;
    v12 = *((_OWORD *)off_1E50B83A0 + 1);
    v27 = *(_OWORD *)off_1E50B83A0;
    v28 = v12;
    v13 = *((_OWORD *)off_1E50B8398 + 1);
    v22[0] = *(_OWORD *)off_1E50B8398;
    v22[1] = v13;
    v23 = *((_QWORD *)off_1E50B8398 + 4);
    -[PXGView engine](self, "engine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copyPresentedSpriteFor:geometry:style:info:", v4, &v24, &v27, v22);

    if (v15)
    {
      -[PXGView scrollViewController](self, "scrollViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "contentCoordinateSpace");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v21[0] = v24;
      v21[1] = v25;
      v26[6] = v33;
      v26[7] = v34;
      v26[8] = v35;
      v26[9] = v36;
      v26[2] = v29;
      v26[3] = v30;
      v26[4] = v31;
      v26[5] = v32;
      v26[0] = v27;
      v26[1] = v28;
      PXGRegionOfInterestForSprite((uint64_t)v21, (float *)v26, v18, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_5:
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)regionOfInterestForHitTestResult:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "spriteReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGView regionOfInterestForSpriteReference:](self, "regionOfInterestForSpriteReference:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)regionOfInterestForObjectReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PXGView rootLayout](self, "rootLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "spriteReferenceForObjectReference:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXGView regionOfInterestForSpriteReference:](self, "regionOfInterestForSpriteReference:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isObjectReference:(id)a3 visuallyBeforeObjectReference:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
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
  void *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  BOOL v44;
  NSObject *v45;
  void *v47;
  void *v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGView.m"), 1707, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectReference1"));

    if (v9)
      goto LABEL_3;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGView.m"), 1708, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectReference2"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_13;
LABEL_3:
  -[PXGView regionOfInterestForObjectReference:](self, "regionOfInterestForObjectReference:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGView regionOfInterestForObjectReference:](self, "regionOfInterestForObjectReference:", v9);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10 && v11)
  {
    objc_msgSend(v10, "rectInCoordinateSpace:", self);
    PXRectRoundToPixel();
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(v12, "rectInCoordinateSpace:", self);
    PXRectRoundToPixel();
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    -[PXGView rootLayout](self, "rootLayout");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "userInterfaceDirection");

    if (v30 == 1)
    {
      v31 = -[PXGView bounds](self, "bounds");
      v32 = v20;
      v34 = v33;
      v35 = v18;
      v37 = v36;
      v38 = v16;
      v40 = v39;
      v41 = v14;
      v43 = v42;
      MEMORY[0x1A85CD2B8](v31, v41, v38, v35, v32, v34, v37, v39, v42);
      MEMORY[0x1A85CD2B8](v22, v24, v26, v28, v34, v37, v40, v43);
    }
    v44 = PXRectCompareForHorizontalMovementInVerticalLayout() != 1;
  }
  else
  {
    PLUIGetLog();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v50 = v7;
      v51 = 2112;
      v52 = v9;
      _os_log_impl(&dword_1A6789000, v45, OS_LOG_TYPE_ERROR, "Couldn't find region of interests for visual comparison of %@ with %@", buf, 0x16u);
    }

    v44 = 1;
  }

  return v44;
}

- (CGImage)textureSnapshotForSpriteReference:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  CGImage *v9;

  v4 = a3;
  -[PXGView rootLayout](self, "rootLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "spriteIndexForSpriteReference:", v4);

  -[PXGView engine](self, "engine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textureManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (CGImage *)objc_msgSend(v8, "textureSnapshotForSpriteIndex:", v6);

  return v9;
}

- (void)_updateEngineWindowProperties
{
  void *v3;
  void *v4;
  id v5;

  -[PXGView window](self, "window");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGView engine](self, "engine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScreen:", v3);

}

- (void)setShowPerspectiveDebug:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (self->_showPerspectiveDebug != a3)
  {
    v3 = a3;
    self->_showPerspectiveDebug = a3;
    objc_msgSend(off_1E50B5CD0, "sharedInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWantsPerspectiveDebug:", v3);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel_handlePan_);
    objc_msgSend(v5, "setMaximumNumberOfTouches:", 1);
    objc_msgSend(v5, "setDelegate:", self);
    -[PXGView addGestureRecognizer:](self, "addGestureRecognizer:", v5);

  }
}

- (void)handlePan:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "state") == 2)
  {
    objc_msgSend(v6, "translationInView:", self);
    objc_msgSend(v4, "setPerspectiveAngle:");
    -[PXGView rootLayout](self, "rootLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsUpdate");

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)canBlockMainThreadIfNeeded
{
  void *v2;
  char v3;

  -[PXGView engine](self, "engine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canBlockMainThreadIfNeeded");

  return v3;
}

- (void)setCanBlockMainThreadIfNeeded:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PXGView engine](self, "engine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCanBlockMainThreadIfNeeded:", v3);

}

- (BOOL)slowAnimationsEnabled
{
  void *v2;
  char v3;

  -[PXGView engine](self, "engine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "slowAnimationsEnabled");

  return v3;
}

- (void)setSlowAnimationsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PXGView engine](self, "engine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSlowAnimationsEnabled:", v3);

}

- (void)scrollViewControllerWillBeginScrolling:(id)a3
{
  -[PXGView _ensureEndAnimatedScroll](self, "_ensureEndAnimatedScroll", a3);
  -[PXGView setIsScrolling:](self, "setIsScrolling:", 1);
}

- (void)scrollViewControllerDidEndScrolling:(id)a3
{
  -[PXGView _ensureEndAnimatedScroll](self, "_ensureEndAnimatedScroll", a3);
  -[PXGView setIsScrolling:](self, "setIsScrolling:", 0);
}

- (void)scrollViewControllerDidBeginFocusFastScrolling:(id)a3
{
  -[PXGView _ensureEndAnimatedScroll](self, "_ensureEndAnimatedScroll", a3);
  -[PXGView setIsFocusFastScrolling:](self, "setIsFocusFastScrolling:", 1);
}

- (void)scrollViewControllerDidEndFocusFastScrolling:(id)a3
{
  -[PXGView _ensureEndAnimatedScroll](self, "_ensureEndAnimatedScroll", a3);
  -[PXGView setIsFocusFastScrolling:](self, "setIsFocusFastScrolling:", 0);
}

- (void)scrollViewControllerWillBeginScrollingAnimation:(id)a3 towardsContentEdges:(unint64_t)a4
{
  void *v6;
  id v7;

  -[PXGView rootLayout](self, "rootLayout", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clearLastVisibleAreaAnchoringInformation");
  -[PXGView setIsAnimatingScroll:](self, "setIsAnimatingScroll:", 1);
  objc_msgSend(v7, "createAnchorForScrollingAnimationTowardsContentEdges:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGView setScrollingAnimationAnchor:](self, "setScrollingAnimationAnchor:", v6);

}

- (void)_ensureEndAnimatedScroll
{
  -[PXGView setIsAnimatingScroll:](self, "setIsAnimatingScroll:", 0);
  -[PXGView setScrollingAnimationAnchor:](self, "setScrollingAnimationAnchor:", 0);
}

- (NSString)diagnosticDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  -[PXGView description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "px_removeSuffix:", CFSTR(">"));
  -[PXGView rootLayout](self, "rootLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recursiveDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\nLayout Hierarchy: {\n%@\n}\n"), v7);

  v8 = (void *)objc_msgSend(off_1E50B2CF8, "newSpriteDataStore");
  objc_msgSend(v8, "setCount:", objc_msgSend(v6, "numberOfSprites"));
  v9 = objc_msgSend(v8, "count") << 32;
  v10 = objc_retainAutorelease(v8);
  v11 = objc_msgSend(v10, "entities");
  v12 = objc_retainAutorelease(v10);
  v13 = objc_msgSend(v12, "geometries");
  v14 = objc_retainAutorelease(v12);
  v15 = objc_msgSend(v14, "styles");
  v16 = objc_retainAutorelease(v14);
  objc_msgSend(v6, "copyLayoutForSpritesInRange:entities:geometries:styles:infos:", v9, v11, v13, v15, objc_msgSend(v16, "infos"));
  objc_msgSend(v16, "diagnosticDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\nSprites: { %@ }\n"), v17);

  objc_msgSend(v16, "recycle");
  objc_msgSend(v5, "appendString:", CFSTR("\nDescendant Layouts: {\n"));
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __32__PXGView_diagnosticDescription__block_invoke;
  v20[3] = &unk_1E513FA78;
  v18 = v5;
  v21 = v18;
  objc_msgSend(v6, "enumerateDescendantsLayoutsUsingBlock:", v20);
  objc_msgSend(v18, "appendString:", CFSTR("}"));
  objc_msgSend(v18, "appendString:", CFSTR(">"));

  return (NSString *)v18;
}

- (NSArray)debugHierarchyIdentifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("PXGViewLayoutsAndSpritesHierarchyIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)enumerateDebugHierarchyWithIdentifier:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  id v7;
  void (**v8)(id, PXDebugHierarchyMutableElement *, uint64_t);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  PXDebugHierarchyMutableElement *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  void (**v26)(void *, uint64_t, _QWORD);
  void *v27;
  id v28;
  void *v29;
  void *v30;
  PXDebugHierarchyMutableElement *v31;
  void (**v32)(id, PXDebugHierarchyMutableElement *, uint64_t);
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  void (**v39)(id, PXDebugHierarchyMutableElement *, uint64_t);
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (**v45)(void *, uint64_t, _QWORD);
  id v46;
  id v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  PXDebugHierarchyMutableElement *v57;
  id v58;
  id v59;
  void (**v60)(id, PXDebugHierarchyMutableElement *, uint64_t);
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  _QWORD v66[4];
  PXDebugHierarchyMutableElement *v67;
  id v68;
  id v69;
  id v70;
  void (**v71)(id, PXDebugHierarchyMutableElement *, uint64_t);
  id v72;
  id v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  _QWORD v78[4];
  id v79;
  id v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD v86[4];
  id v87;
  id v88;
  _QWORD aBlock[4];
  id v90;
  id v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  char v95;
  _BYTE v96[128];
  uint64_t v97;

  v50 = a4;
  v97 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, PXDebugHierarchyMutableElement *, uint64_t))a5;
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v95 = 0;
  v51 = v7;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXGViewLayoutsAndSpritesHierarchyIdentifier")))
  {
    -[PXGView rootLayout](self, "rootLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "visibleRect");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v49 = v9;
    -[PXGView engine](self, "engine");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "textureManager");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_alloc_init(PXDebugHierarchyMutableElement);
    -[PXGView bounds](self, "bounds");
    -[PXDebugHierarchyMutableElement setFrame:](v19, "setFrame:");
    -[PXGView backgroundColor](self, "backgroundColor");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[PXDebugHierarchyMutableElement setBackgroundColor:](v19, "setBackgroundColor:", objc_msgSend(v20, "CGColor"));

    -[PXDebugHierarchyMutableElement setName:](v19, "setName:", CFSTR("Tungsten Hierarchies"));
    -[PXDebugHierarchyMutableElement setCanHaveChildren:](v19, "setCanHaveChildren:", 1);
    v8[2](v8, v19, (uint64_t)(v93 + 3));
    if (!*((_BYTE *)v93 + 24))
    {
      v21 = -[PXDebugHierarchyMutableElement identifier](v19, "identifier");
      -[PXDebugHierarchyMutableElement prepareForReuse](v19, "prepareForReuse");
      -[PXGView bounds](self, "bounds");
      -[PXDebugHierarchyMutableElement setFrame:](v19, "setFrame:");
      -[PXDebugHierarchyMutableElement setName:](v19, "setName:", CFSTR("Layouts"));
      -[PXDebugHierarchyMutableElement setCanHaveChildren:](v19, "setCanHaveChildren:", 1);
      -[PXDebugHierarchyMutableElement setParentIdentifier:](v19, "setParentIdentifier:", v21);
      v8[2](v8, v19, (uint64_t)(v93 + 3));
      if (!*((_BYTE *)v93 + 24))
      {
        v22 = -[PXDebugHierarchyMutableElement identifier](v19, "identifier");
        v44 = v21;
        v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v24 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke_3;
        aBlock[3] = &unk_1E513FB48;
        v25 = v23;
        v90 = v25;
        v91 = &__block_literal_global_142_255519;
        v26 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
        v86[0] = v24;
        v86[1] = 3221225472;
        v86[2] = __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke_4;
        v86[3] = &unk_1E513FB70;
        v47 = v25;
        v87 = v47;
        v88 = &__block_literal_global_142_255519;
        v27 = _Block_copy(v86);
        v78[0] = v24;
        v78[1] = 3221225472;
        v78[2] = __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke_5;
        v78[3] = &unk_1E513FB98;
        v82 = v11;
        v83 = v13;
        v84 = v15;
        v85 = v17;
        v79 = v48;
        v28 = v49;
        v80 = v28;
        v81 = &__block_literal_global_137_255520;
        v29 = _Block_copy(v78);
        v26[2](v26, v22, 0);
        objc_msgSend(off_1E50B5CD0, "sharedInstance");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v22) = objc_msgSend(v30, "includeLayoutsLocalSpritesInDebugHierarchy");

        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke_6;
        v66[3] = &unk_1E513FBC0;
        v75 = v11;
        v76 = v13;
        v31 = v19;
        v67 = v31;
        v69 = &__block_literal_global_137_255520;
        v46 = v27;
        v70 = v46;
        v32 = v8;
        v71 = v32;
        v74 = &v92;
        v45 = v26;
        v72 = v45;
        v77 = v22;
        v33 = v28;
        v68 = v33;
        v34 = v29;
        v73 = v34;
        objc_msgSend(v33, "enumerateDescendantsLayoutsUsingBlock:", v66);
        if (!*((_BYTE *)v93 + 24))
        {
          -[PXDebugHierarchyMutableElement prepareForReuse](v31, "prepareForReuse");
          -[PXGView bounds](self, "bounds");
          -[PXDebugHierarchyMutableElement setFrame:](v31, "setFrame:");
          -[PXDebugHierarchyMutableElement setName:](v31, "setName:", CFSTR("Sprites"));
          -[PXDebugHierarchyMutableElement setCanHaveChildren:](v31, "setCanHaveChildren:", 1);
          -[PXDebugHierarchyMutableElement setParentIdentifier:](v31, "setParentIdentifier:", v44);
          v8[2](v32, v31, (uint64_t)(v93 + 3));
          if (!*((_BYTE *)v93 + 24))
          {
            v35 = -[PXDebugHierarchyMutableElement identifier](v31, "identifier");
            if ((v50 & 1) != 0)
              v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v33, "numberOfSprites"));
            else
              v36 = 0;
            v37 = objc_msgSend(v33, "numberOfSprites", v44, v45, v46, v47) << 32;
            v56[0] = MEMORY[0x1E0C809B0];
            v56[1] = 3221225472;
            v56[2] = __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke_7;
            v56[3] = &unk_1E513FBE8;
            v57 = v31;
            v62 = v35;
            v59 = v34;
            v63 = v11;
            v64 = v13;
            v65 = v50 & 1;
            v38 = v36;
            v58 = v38;
            v39 = v32;
            v60 = v39;
            v61 = &v92;
            objc_msgSend(v33, "enumerateSpritesInRange:usingBlock:", v37, v56);
            if ((v50 & 1) != 0 && !*((_BYTE *)v93 + 24))
            {
              objc_msgSend(v38, "sortUsingComparator:", &__block_literal_global_153_255523);
              v54 = 0u;
              v55 = 0u;
              v52 = 0u;
              v53 = 0u;
              v40 = v38;
              v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v52, v96, 16);
              if (v41)
              {
                v42 = *(_QWORD *)v53;
LABEL_13:
                v43 = 0;
                while (1)
                {
                  if (*(_QWORD *)v53 != v42)
                    objc_enumerationMutation(v40);
                  v8[2](v39, *(PXDebugHierarchyMutableElement **)(*((_QWORD *)&v52 + 1) + 8 * v43), (uint64_t)(v93 + 3));
                  if (*((_BYTE *)v93 + 24))
                    break;
                  if (v41 == ++v43)
                  {
                    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v52, v96, 16);
                    if (v41)
                      goto LABEL_13;
                    break;
                  }
                }
              }

            }
          }
        }

      }
    }

  }
  _Block_object_dispose(&v92, 8);

}

- (id)axContainingScrollViewForAXGroup:(id)a3
{
  void *v3;
  void *v4;

  -[PXGView scrollViewController](self, "scrollViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[PXGView axNextResponder](self, "axNextResponder");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "axGroup:didChange:userInfo:", v9, a4, v8);

}

- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  -[PXGView axNextResponder](self, "axNextResponder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v10, "axGroup:didRequestToPerformAction:userInfo:", v9, a4, v8);

  return a4;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXGView diagnosticDescription](self, "diagnosticDescription");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("Summary"));

}

- (void)test_installRenderSnapshotHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXGView engine](self, "engine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "test_installRenderSnapshotHandler:", v4);

}

- (id)contentCoordinateSpaceForLayout:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PXGView rootLayout](self, "rootLayout");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[PXGView scrollViewController](self, "scrollViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentCoordinateSpace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)layout:(id)a3 viewForSpriteIndex:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  id v7;
  void *v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[PXGView rootLayout](self, "rootLayout");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    -[PXGView viewForSpriteIndex:](self, "viewForSpriteIndex:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (PXAnonymousScrollView)diagnosticsMainScrollView
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  -[PXGView scrollViewController](self, "scrollViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  while (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "px_popFirst");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "addObject:", v7);
    objc_msgSend(v7, "subviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v8);

  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v3;
  }
  v10 = v9;

  return (PXAnonymousScrollView *)v10;
}

- (void)ppt_prepareForTest:(id)a3 withOptions:(id)a4 isScrollTest:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  _OWORD *v8;

  v5 = a5;
  -[PXGView ppt_setCurrentTestOptions:](self, "ppt_setCurrentTestOptions:", a4);
  -[PXGView engine](self, "engine");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (_OWORD *)objc_msgSend(v7, "stats");
  *v8 = 0u;
  v8[1] = 0u;
  v8[2] = 0u;
  v8[3] = 0u;
  v8[4] = 0u;
  v8[5] = 0u;
  v8[6] = 0u;
  v8[7] = 0u;
  v8[8] = 0u;
  v8[9] = 0u;
  v8[10] = 0u;
  v8[11] = 0u;
  v8[12] = 0u;
  v8[13] = 0u;
  v8[14] = 0u;

  if (v5)
    -[PXGView setIsScrolling:](self, "setIsScrolling:", 1);
}

- (void)ppt_cleanUpAfterTest:(id)a3 isScrollTest:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  -[PXGView ppt_setCurrentTestOptions:](self, "ppt_setCurrentTestOptions:", 0);
  if (v4)
    -[PXGView setIsScrolling:](self, "setIsScrolling:", 0);
}

- (void)ppt_setCurrentTestOptions:(id)a3
{
  NSDictionary *v4;
  char v5;
  NSDictionary *v6;
  NSDictionary *ppt_currentTestOptions;
  NSDictionary *v8;

  v8 = (NSDictionary *)a3;
  v4 = self->_ppt_currentTestOptions;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSDictionary isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSDictionary *)-[NSDictionary copy](v8, "copy");
      ppt_currentTestOptions = self->_ppt_currentTestOptions;
      self->_ppt_currentTestOptions = v6;

      -[PXGView _updateUserInterfaceDirection](self, "_updateUserInterfaceDirection");
    }
  }

}

- (NSDictionary)ppt_extraResults
{
  id v2;
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  id v11;
  unint64_t i;
  __CFString *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _OWORD v27[16];

  -[PXGView engine](self, "engine");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (_OWORD *)objc_msgSend(v2, "stats");
  v4 = v3[13];
  v27[12] = v3[12];
  v27[13] = v4;
  v27[14] = v3[14];
  v5 = v3[9];
  v27[8] = v3[8];
  v27[9] = v5;
  v6 = v3[11];
  v27[10] = v3[10];
  v27[11] = v6;
  v7 = v3[5];
  v27[4] = v3[4];
  v27[5] = v7;
  v8 = v3[7];
  v27[6] = v3[6];
  v27[7] = v8;
  v9 = v3[1];
  v27[0] = *v3;
  v27[1] = v9;
  v10 = v3[3];
  v27[2] = v3[2];
  v27[3] = v10;

  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  for (i = 0; i != 48; i += 8)
  {
    v13 = off_1E513FC88[i / 8];
    v14 = *(double *)((char *)&v27[12] + i);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)((char *)&v27[9] + i) * 1000.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXTungsten:Update:%@:min"), v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, v16);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXTungsten:Update:%@:minUnits"), v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("ms"), v17);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14 * 1000.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXTungsten:Update:%@:max"), v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, v19);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXTungsten:Update:%@:maxUnits"), v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("ms"), v20);

    v21 = *(_QWORD *)((char *)&v27[6] + i);
    if (v21 >= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)((char *)&v27[3] + i) / (double)v21 * 1000.0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXTungsten:Update:%@:mean"), v13);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, v23);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXTungsten:Update:%@:meanUnits"), v13);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("ms"), v24);

    }
  }
  v25 = (void *)objc_msgSend(v11, "copy");

  return (NSDictionary *)v25;
}

- (id)viewForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  -[PXGView viewRenderer](self, "viewRenderer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForSpriteIndex:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)trackingContainerViewForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  -[PXGView viewRenderer](self, "viewRenderer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trackingContainerViewForSpriteIndex:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)viewForSpriteReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    -[PXGView engine](self, "engine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6
      || (-[PXGView engine](self, "engine"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "ensureUpdatedLayout"),
          v7,
          v8 = objc_msgSend(v6, "spriteIndexForSpriteReference:options:", v4, 0),
          (_DWORD)v8 == -1))
    {
      v9 = 0;
    }
    else
    {
      -[PXGView viewForSpriteIndex:](self, "viewForSpriteIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)ensureUpdatedLayout
{
  id v2;

  -[PXGView engine](self, "engine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ensureUpdatedLayout");

}

- (void)forceUpdate
{
  NSObject *v3;
  os_signpost_id_t v4;
  os_signpost_id_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PXGTungstenGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      -[PXGView engine](self, "engine");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 134217984;
      v10 = v6;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v3, OS_SIGNPOST_EVENT, v5, "\"forceUpdate\", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v9, 0xCu);

    }
  }

  -[PXGView engine](self, "engine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allowSecondRenderThisFrame");

  -[PXGView engine](self, "engine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ensureUpdatedLayout");

  -[PXGView px_enumerateDescendantSubviewsUsingBlock:](self, "px_enumerateDescendantSubviewsUsingBlock:", &__block_literal_global_171_255483);
}

- (void)forceFullUpdate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXGView engine](self, "engine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWantsImmediateUpdates:", 1);

  -[PXGView scrollViewController](self, "scrollViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollViewDidLayout");

  -[PXGView metalView](self, "metalView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "drawInMTKView:", v6);

}

- (void)setIsBeingFullPageSnapshotted:(BOOL)a3
{
  if (self->_isBeingFullPageSnapshotted != a3)
  {
    self->_isBeingFullPageSnapshotted = a3;
    -[PXGView _updateLayoutViewEnvironment](self, "_updateLayoutViewEnvironment");
  }
}

- (PXGAXResponder)axNextResponder
{
  return (PXGAXResponder *)objc_loadWeakRetained((id *)&self->axNextResponder);
}

- (BOOL)lowMemoryModeEnabled
{
  return self->_lowMemoryModeEnabled;
}

- (BOOL)enableUnderlaySupport
{
  return self->_enableUnderlaySupport;
}

- (PXGViewRenderer)viewRenderer
{
  return self->_viewRenderer;
}

- (UIView)entityHostingView
{
  return self->_entityHostingView;
}

- (void)setIsScrolling:(BOOL)a3
{
  self->_isScrolling = a3;
}

- (void)setIsFocusFastScrolling:(BOOL)a3
{
  self->_isFocusFastScrolling = a3;
}

- (void)setIsAnimatingScroll:(BOOL)a3
{
  self->_isAnimatingScroll = a3;
}

- (PXGAnchor)scrollingAnimationAnchor
{
  return self->_scrollingAnimationAnchor;
}

- (void)setNextDidLayoutHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (void)setIsAccessibilityEnabled:(BOOL)a3
{
  self->_isAccessibilityEnabled = a3;
}

- (void)setRootLayoutIfExists:(id)a3
{
  objc_storeStrong((id *)&self->_rootLayoutIfExists, a3);
}

- ($F86F3654D89882C10874F1715C6C992F)displayConfiguration
{
  *($C51E2077B87F80227BBF36E385921798 *)retstr = *($C51E2077B87F80227BBF36E385921798 *)((char *)self + 592);
  return self;
}

- (float)displayScaleMultiplier
{
  return self->_displayScaleMultiplier;
}

- (UIEdgeInsets)hitTestPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_hitTestPadding.top;
  left = self->_hitTestPadding.left;
  bottom = self->_hitTestPadding.bottom;
  right = self->_hitTestPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)showDebugHUD
{
  return self->_showDebugHUD;
}

- (BOOL)showPerspectiveDebug
{
  return self->_showPerspectiveDebug;
}

- (unint64_t)offscreenEffectQuality
{
  return self->_offscreenEffectQuality;
}

- (BOOL)shouldScrollViewContentInsetAlwaysAdjustToAvoidSafeArea
{
  return self->_shouldScrollViewContentInsetAlwaysAdjustToAvoidSafeArea;
}

- (void)setResizesDrawableManually:(BOOL)a3
{
  self->_resizesDrawableManually = a3;
}

- (BOOL)disableMetalViewDisplayCompositing
{
  return self->_disableMetalViewDisplayCompositing;
}

- (BOOL)allowLargerImagesDuringScrollingInLowMemoryMode
{
  return self->_allowLargerImagesDuringScrollingInLowMemoryMode;
}

- (BOOL)avoidSnapshotOnHeightChanges
{
  return self->_avoidSnapshotOnHeightChanges;
}

- (void)setAvoidSnapshotOnHeightChanges:(BOOL)a3
{
  self->_avoidSnapshotOnHeightChanges = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engine, 0);
  objc_destroyWeak((id *)&self->_diagnosticsSource);
  objc_storeStrong((id *)&self->_rootLayoutIfExists, 0);
  objc_storeStrong(&self->_nextDidLayoutHandler, 0);
  objc_storeStrong((id *)&self->_ppt_currentTestOptions, 0);
  objc_storeStrong((id *)&self->_scrollingAnimationAnchor, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_metalView, 0);
  objc_storeStrong((id *)&self->_entityHostingView, 0);
  objc_storeStrong((id *)&self->_viewRenderer, 0);
  objc_storeStrong((id *)&self->_metalRenderer, 0);
  objc_storeStrong((id *)&self->_scrollingSpeedometer, 0);
  objc_storeStrong((id *)&self->_scrollViewController, 0);
  objc_destroyWeak((id *)&self->axNextResponder);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_coalescingAXResponder, 0);
  objc_storeStrong((id *)&self->_rectDiagnosticsLayer, 0);
  objc_storeStrong((id *)&self->_debugHUDLayer, 0);
}

void __22__PXGView_forceUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v2 = v3;
  else
    v2 = 0;

  objc_msgSend(v2, "forceUpdate");
}

void __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);
}

uint64_t __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

BOOL __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, CGFloat a6, CGFloat a7, uint64_t a8, void *a9, uint64_t a10)
{
  id v18;
  id v19;
  double v20;
  double v21;
  _BOOL8 v22;
  float v23;
  double v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CGRect v32;
  CGRect v33;

  v18 = a2;
  v19 = a9;
  v20 = *(double *)(a4 + 16);
  v21 = *(double *)(a3 + 48);
  PXRectWithCenterAndSize();
  v33 = CGRectOffset(v32, a6, a7);
  v22 = CGRectIntersectsRect(v33, *(CGRect *)(a1 + 56));
  if (v22)
  {
    v23 = v21;
    v24 = v20 + v23;
    PXPointSubtract();
    objc_msgSend(v18, "setFrame:");
    objc_msgSend(v18, "setZPosition:", -v24);
    objc_msgSend(v18, "setAlpha:", *(float *)a5);
    objc_msgSend(v18, "setPreviewImage:", objc_msgSend(*(id *)(a1 + 32), "textureSnapshotForSpriteIndex:", objc_msgSend(*(id *)(a1 + 40), "convertSpriteIndex:fromDescendantLayout:", a10, v19)));
    objc_msgSend(v18, "setContentsRect:", *(float *)(a5 + 4), *(float *)(a5 + 8), *(float *)(a5 + 12), *(float *)(a5 + 16));
    CALayerContentsGravityFromPXGContentsGravity(*(unsigned __int8 *)(a5 + 70));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setContentsGravity:", v25);

    v26 = objc_alloc(MEMORY[0x1E0CB3940]);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PXGSpriteStyleDescription();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    PXGSpriteInfoDescription();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v26, "initWithFormat:", CFSTR("Sprite %u of %@ style:%@ info:%@"), a10, v27, v28, v29);
    objc_msgSend(v18, "setName:", v30);

  }
  return v22;
}

void __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke_6(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;

  v5 = a2;
  v6 = *MEMORY[0x1E0C9D538];
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v5, "contentSize");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v5, "superlayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "convertRect:fromDescendantLayout:", v5, v6, v7, v9, v11);
    v15 = v14;
    v17 = v16;
    v9 = v18;
    v11 = v19;
  }
  else
  {
    PXPointSubtract();
    v15 = v20;
    v17 = v21;
  }
  objc_msgSend(*(id *)(a1 + 32), "prepareForReuse");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", v15, v17, v9, v11);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setName:", v22);

  objc_msgSend(*(id *)(a1 + 32), "setCanHaveChildren:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setParentIdentifier:", (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))());
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
  {
    *a3 = 1;
  }
  else
  {
    v23 = objc_msgSend(*(id *)(a1 + 32), "identifier");
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    if (*(_BYTE *)(a1 + 112))
    {
      objc_msgSend(*(id *)(a1 + 32), "prepareForReuse");
      objc_msgSend(*(id *)(a1 + 32), "setParentIdentifier:", v23);
      objc_msgSend(v5, "spriteDataStore", *(_QWORD *)off_1E50B8368, *((_QWORD *)off_1E50B8368 + 1), *((_QWORD *)off_1E50B8368 + 2), *((_QWORD *)off_1E50B8368 + 3), *((_QWORD *)off_1E50B8368 + 4), *((_QWORD *)off_1E50B8368 + 5), *((_QWORD *)off_1E50B8368 + 6));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");
      v26 = objc_retainAutorelease(v24);
      v27 = objc_msgSend(v26, "geometries");
      v28 = objc_retainAutorelease(v26);
      v29 = objc_msgSend(v28, "styles");
      v30 = objc_retainAutorelease(v28);
      v31 = objc_msgSend(v30, "infos");
      objc_msgSend(*(id *)(a1 + 40), "convertPoint:fromLayout:", v5, v6, v7);
      if (v25)
      {
        v34 = v32;
        v35 = v33;
        v36 = 0;
        while (1)
        {
          if ((*(unsigned int (**)(double, double, double, double))(*(_QWORD *)(a1 + 80) + 16))(v34, v35, v6, v7))
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
              break;
          }
          ++v36;
          v31 += 40;
          v29 += 160;
          v27 += 32;
          if (v25 == v36)
            goto LABEL_11;
        }
        *a3 = 1;
      }
LABEL_11:

    }
  }

}

void __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke_7(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, int a8, _BYTE *a9)
{
  unint64_t v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;

  v14 = HIDWORD(a2);
  v19 = a7;
  objc_msgSend(*(id *)(a1 + 32), "prepareForReuse");
  objc_msgSend(*(id *)(a1 + 32), "setParentIdentifier:", *(_QWORD *)(a1 + 72));
  if (v14)
  {
    v15 = *MEMORY[0x1E0C9D538];
    v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    do
    {
      if ((*(unsigned int (**)(double, double, double, double))(*(_QWORD *)(a1 + 48) + 16))(v15, v16, *(double *)(a1 + 80), *(double *)(a1 + 88)))
      {
        if (*(_BYTE *)(a1 + 96))
        {
          v17 = *(void **)(a1 + 40);
          v18 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
          objc_msgSend(v17, "addObject:", v18);

        }
        else
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          {
            *a9 = 1;
            break;
          }
        }
      }
      ++a8;
      a6 += 40;
      a5 += 160;
      a4 += 32;
      --v14;
    }
    while (v14);
  }

}

uint64_t __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "zPosition");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "zPosition");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

id __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = a2;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (%p)"), v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a2);
}

void __32__PXGView_diagnosticDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "diagnosticDescription");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("%@\n"), v3);

}

id __57__PXGView_hitTestResultsInDirection_fromSpriteReference___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "scrollViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentCoordinateSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PXRectConvertFromCoordinateSpaceToCoordinateSpace();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(*(id *)(a1 + 32), "engine");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__PXGView_hitTestResultsInDirection_fromSpriteReference___block_invoke_2;
  v16[3] = &unk_1E513F9B0;
  v14 = v2;
  v17 = v14;
  objc_msgSend(v13, "enumerateSpritesInRect:usingBlock:", v16, v6, v8, v10, v12);

  return v14;
}

uint64_t __57__PXGView_hitTestResultsInDirection_fromSpriteReference___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = a3;
  objc_msgSend(v5, "scrollViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentCoordinateSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PXRectConvertFromCoordinateSpaceToCoordinateSpace();

  objc_msgSend(v6, "rect");
  PXRectRoundToPixel();
  objc_msgSend(v7, "rect");

  PXRectRoundToPixel();
  if ((unint64_t)(*(_QWORD *)(a1 + 72) - 1) > 1)
    return PXRectCompareForHorizontalMovementInVerticalLayout();
  else
    return PXRectCompareForVerticalMovementInVerticalLayoutWithSourceRect();
}

BOOL __57__PXGView_hitTestResultsInDirection_fromSpriteReference___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3;

  if (!*(_QWORD *)(a1 + 32))
    return 0;
  v3 = objc_msgSend(a2, "tag");
  return v3 == objc_msgSend(*(id *)(a1 + 32), "tag");
}

uint64_t __57__PXGView_hitTestResultsInDirection_fromSpriteReference___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hitTestResultForSpriteIndex:", objc_msgSend(a2, "tag"));
}

void __57__PXGView_hitTestResultsInDirection_fromSpriteReference___block_invoke_2(uint64_t a1, unsigned int a2, uint64_t a3, float *a4, _BYTE *a5)
{
  _BOOL4 v8;
  int v9;
  uint64_t v11;
  id v15;
  float32x2_t v16;
  float32x2_t v17;
  id v18;

  v8 = *a4 > 0.0;
  v9 = a5[1];
  if (v9 == 8)
    v8 = *a4 > 0.0 && *a5 == 1;
  v11 = *(_QWORD *)(a3 + 24);
  if (*(float *)&v11 >= *((float *)&v11 + 1))
    LODWORD(v11) = HIDWORD(*(_QWORD *)(a3 + 24));
  if (v9 == 2 && *(float *)&v11 > 1.0 && (a5[34] & 2) == 0 && v8)
  {
    v15 = objc_alloc((Class)off_1E50B5B28);
    v16 = *(float32x2_t *)(a3 + 24);
    v17 = vmul_f32(v16, (float32x2_t)0x3F0000003F000000);
    v18 = (id)objc_msgSend(v15, "initWithRect:tag:", a2, *(double *)a3 - v17.f32[0], *(double *)(a3 + 8) - v17.f32[1], v16.f32[0], v16.f32[1]);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v18);

  }
}

void __44__PXGView_hitTestResultsInRect_passingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, float *a4, _BYTE *a5, uint64_t a6)
{
  _BOOL4 v8;
  uint64_t v10;
  uint64_t v13;
  void *v14;
  void *v15;

  v8 = *a4 > 0.0;
  if (a5[1] == 8)
    v8 = *a4 > 0.0 && *a5 == 1;
  v10 = *(_QWORD *)(a3 + 24);
  if (*(float *)&v10 >= *((float *)&v10 + 1))
    LODWORD(v10) = HIDWORD(*(_QWORD *)(a3 + 24));
  if (*(float *)&v10 > 1.0 && (a5[34] & 2) == 0 && v8)
  {
    v13 = *(_QWORD *)(a1 + 48);
    if (!v13
      || (*(unsigned int (**)(uint64_t, uint64_t, _QWORD, uint64_t))(v13 + 16))(v13, a2, *(_QWORD *)(a1 + 32), a6))
    {
      objc_msgSend(*(id *)(a1 + 32), "hitTestResultForSpriteIndex:", a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = v14;
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);
        v14 = v15;
      }

    }
  }
}

void __53__PXGView_hitTestResultsAtPoint_padding_passingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, float *a4, _BYTE *a5, uint64_t a6)
{
  int v7;
  _BOOL4 v9;
  uint64_t v11;
  float v12;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v7 = a2;
  v9 = *a4 > 0.0;
  if (a5[1] == 8)
    v9 = *a4 > 0.0 && *a5 == 1;
  v11 = *(_QWORD *)(a3 + 24);
  v12 = *((float *)&v11 + 1);
  if (*(float *)&v11 < *((float *)&v11 + 1))
    v12 = *(float *)&v11;
  if (v12 > 1.0 && (a5[34] & 2) == 0 && v9)
  {
    v15 = *(_QWORD *)(a1 + 48);
    if (!v15
      || (*(unsigned int (**)(uint64_t, uint64_t, _QWORD, uint64_t))(v15 + 16))(v15, a2, *(_QWORD *)(a1 + 32), a6))
    {
      PXRectWithCenterAndSize();
      sub_1A7AE3F38();
      PXEdgeInsetsInsetRect();
      v20 = objc_retainAutorelease(objc_alloc_init((Class)off_1E50B2A38));
      v16 = objc_msgSend(v20, "hitInfo");
      *(_DWORD *)v16 = v7;
      v17 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)(v16 + 24) = *(_OWORD *)a3;
      *(_OWORD *)(v16 + 40) = v17;
      PXRectShortestDistanceToPoint();
      *(_QWORD *)(v16 + 8) = v18;
      PXRectShortestDistanceToPoint();
      *(_QWORD *)(v16 + 16) = v19;
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v20);

    }
  }
}

uint64_t __49__PXGView_hitTestResultsAtPoint_withIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __52__PXGView_hitTestResultAtPoint_padding_passingTest___block_invoke(uint64_t result, uint64_t a2, __int128 *a3, float *a4, _BYTE *a5, uint64_t a6)
{
  _QWORD *v9;
  _BOOL4 v10;
  uint64_t v12;
  float v13;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;

  v9 = (_QWORD *)result;
  v10 = *a4 > 0.0;
  if (a5[1] == 8)
    v10 = *a4 > 0.0 && *a5 == 1;
  v12 = *((_QWORD *)a3 + 3);
  if (*(float *)&v12 >= *((float *)&v12 + 1))
    LODWORD(v13) = HIDWORD(*((_QWORD *)a3 + 3));
  else
    v13 = *(float *)&v12;
  if (v13 > 1.0 && (a5[34] & 2) == 0 && v10)
  {
    PXRectWithCenterAndSize();
    sub_1A7AE3F38();
    PXEdgeInsetsInsetRect();
    PXRectShortestDistanceToPoint();
    v17 = v16;
    result = PXRectShortestDistanceToPoint();
    v19 = v18;
    v26 = *a3;
    v20 = *((double *)a3 + 2);
    v21 = *((_QWORD *)a3 + 3);
    v22 = *(_QWORD *)(v9[6] + 8);
    v23 = *(double *)(v22 + 40);
    if (v17 < v23
      || v17 == v23
      && ((v24 = *(double *)(v22 + 72), v20 < v24)
       || v20 == v24
       && ((v25 = *(double *)(v22 + 48), v19 < v25) || v19 == v25 && *(_DWORD *)(v22 + 32) < a2)))
    {
      result = v9[5];
      if (result)
      {
        result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(result + 16))(result, a2, v9[4], a6);
        if (!(_DWORD)result)
          return result;
        v22 = *(_QWORD *)(v9[6] + 8);
      }
      *(_DWORD *)(v22 + 32) = a2;
      *(_DWORD *)(v22 + 36) = 0;
      *(double *)(v22 + 40) = v17;
      *(double *)(v22 + 48) = v19;
      *(_OWORD *)(v22 + 56) = v26;
      *(double *)(v22 + 72) = v20;
      *(_QWORD *)(v22 + 80) = v21;
    }
  }
  return result;
}

uint64_t __39__PXGView_setScrollingAnimationAnchor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __40__PXGView__installNextDidLayoutHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __54__PXGView_installAnimationRenderingCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __45__PXGView_installRenderingCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __26__PXGView_didMoveToWindow__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateIsVisible");
}

uint64_t __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 80))
    objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 40), "setShowsVerticalScrollIndicator:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.9999);
}

uint64_t __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  if (*(_BYTE *)(a1 + 88))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "contentMode");
    objc_msgSend(*(id *)(a1 + 32), "setContentMode:", 7);
    objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_4;
    v5[3] = &unk_1E5144EB8;
    v3 = *(void **)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    v5[5] = v2;
    objc_msgSend(v3, "installAnimationRenderingCompletionHandler:", v5);
  }
  return objc_msgSend(*(id *)(a1 + 48), "setShowsVerticalScrollIndicator:", 1);
}

uint64_t __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setShowsVerticalScrollIndicator:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.9999);
}

uint64_t __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_7(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 32), "setShowsVerticalScrollIndicator:", 1);
}

void __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_54(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "snapshotViewAfterScreenUpdates:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAutoresizingMask:", 0);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *(id *)(a1 + 40);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v10, "setFrame:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), (_QWORD)v11);
        PXRectGetCenter();
        objc_msgSend(v10, "setCenter:");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

void __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_2_55(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PXRectGetCenter();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setCenter:");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setAlpha:", 0.0);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        PXRectGetCenter();
        objc_msgSend(v7, "setCenter:", (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

uint64_t __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_3_56(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "removeFromSuperview");
}

uint64_t __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContentMode:", *(_QWORD *)(a1 + 40));
}

+ (void)setForceAccessibilityEnabled:(BOOL)a3
{
  void *v3;
  id v4;

  if (s_forceAccessibilityEnabled != a3)
  {
    s_forceAccessibilityEnabled = a3;
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37C0]), "initWithName:object:userInfo:", CFSTR("PXGInitializeAccessibilityNotification"), 0, 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotification:", v4);

  }
}

+ (void)enumerateAllViewsUsingBlock:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__PXGView_enumerateAllViewsUsingBlock___block_invoke;
  v5[3] = &unk_1E513F8B8;
  v6 = v3;
  v4 = v3;
  EnumerateAllViewsUsingBlock(v5);

}

+ (id)debugHierarchyChildGroupingID
{
  __CFString *v2;

  v2 = CFSTR("com.apple.AppKit.NSView");
  return CFSTR("com.apple.AppKit.NSView");
}

+ (id)debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PXDebugHierarchyObjectsInGroupForView(v7, v6, CFSTR("PXGViewLayoutsAndSpritesHierarchyIdentifier"), objc_msgSend(v8, "enableXcodeCustomDebugHierarchy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (NSString)allDescriptions
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__PXGView_allDescriptions__block_invoke;
  v6[3] = &unk_1E513FAA0;
  v4 = v3;
  v7 = v4;
  objc_msgSend(a1, "enumerateAllViewsUsingBlock:", v6);

  return (NSString *)v4;
}

void __26__PXGView_allDescriptions__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v5, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

}

void __39__PXGView_enumerateAllViewsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __23__PXGView_supportLevel__block_invoke()
{
  id v0;
  void *v1;
  char v2;

  v0 = MTLCreateSystemDefaultDevice();

  if (v0)
  {
    objc_msgSend(off_1E50B5CD0, "sharedInstance");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "simulateMissingMetalDevice") ^ 1;

  }
  else
  {
    v2 = 0;
  }
  supportLevel_supportLevel = v2;
}

- (id)storyHitTestResultAtPoint:(CGPoint)a3
{
  void *v3;
  id v4;

  -[PXGView hitTestResultAtPoint:](self, "hitTestResultAtPoint:", a3.x, a3.y);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

@end
