@implementation SBMainDisplaySceneLayoutStatusBarView

- (SBMainDisplaySceneLayoutStatusBarView)initWithFrame:(CGRect)a3
{
  SBMainDisplaySceneLayoutStatusBarView *v3;
  SBMainDisplaySceneLayoutStatusBarView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBMainDisplaySceneLayoutStatusBarView;
  v3 = -[SBMainDisplaySceneLayoutStatusBarView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SBMainDisplaySceneLayoutStatusBarView _setupDebugging](v3, "_setupDebugging");
    -[SBMainDisplaySceneLayoutStatusBarView setRealStyleDelegate:](v4, "setRealStyleDelegate:", SBApp);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[SBMainDisplaySceneLayoutStatusBarView _tearDownStatusBar](self, "_tearDownStatusBar");
  v3.receiver = self;
  v3.super_class = (Class)SBMainDisplaySceneLayoutStatusBarView;
  -[SBMainDisplaySceneLayoutStatusBarView dealloc](&v3, sel_dealloc);
}

- (void)beginRequiringStatusBarForReason:(id)a3
{
  NSMutableSet *statusBarRequiringReasons;
  NSMutableSet *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  id v10;

  v10 = a3;
  statusBarRequiringReasons = self->_statusBarRequiringReasons;
  if (!statusBarRequiringReasons)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = self->_statusBarRequiringReasons;
    self->_statusBarRequiringReasons = v5;

    statusBarRequiringReasons = self->_statusBarRequiringReasons;
  }
  v7 = -[NSMutableSet count](statusBarRequiringReasons, "count");
  -[NSMutableSet addObject:](self->_statusBarRequiringReasons, "addObject:", v10);
  v8 = -[NSMutableSet count](self->_statusBarRequiringReasons, "count");
  if (v7)
    v9 = 1;
  else
    v9 = v8 == 0;
  if (!v9)
    -[SBMainDisplaySceneLayoutStatusBarView _addStatusBarIfNeeded](self, "_addStatusBarIfNeeded");

}

- (void)endRequiringStatusBarForReason:(id)a3
{
  NSMutableSet *statusBarRequiringReasons;
  id v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  statusBarRequiringReasons = self->_statusBarRequiringReasons;
  v5 = a3;
  v6 = -[NSMutableSet count](statusBarRequiringReasons, "count");
  -[NSMutableSet removeObject:](self->_statusBarRequiringReasons, "removeObject:", v5);

  v7 = -[NSMutableSet count](self->_statusBarRequiringReasons, "count");
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 0;
  if (v8)
    -[SBMainDisplaySceneLayoutStatusBarView _tearDownStatusBar](self, "_tearDownStatusBar");
}

- (id)createStatusBarWithFrame:(CGRect)a3 interfaceOrientation:(int64_t)a4 reason:(id)a5
{
  double width;
  double y;
  double x;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a5;
  -[SBMainDisplaySceneLayoutStatusBarView _defaultStatusBarStyleRequest](self, "_defaultStatusBarStyleRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA9E8], "heightForStyle:orientation:", objc_msgSend(v11, "style"), a4);
  v13 = v12;
  +[SBWindowSceneStatusBarManager windowSceneStatusBarManagerForEmbeddedDisplay](SBWindowSceneStatusBarManager, "windowSceneStatusBarManagerForEmbeddedDisplay");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reusePool");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "getReusableStatusBarWithReason:withFrame:", v10, x, y, width, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setBounds:", x, y, width, v13);
  UIRectGetCenter();
  objc_msgSend(v16, "setCenter:");
  objc_msgSend(v16, "setStyleDelegate:", self);
  objc_msgSend(v16, "setAutoresizingMask:", 34);
  objc_msgSend(v16, "setOrientation:", a4);
  objc_msgSend(v16, "setLegibilityStyle:", 0);
  objc_msgSend(v16, "setForegroundColor:", 0);

  return v16;
}

- (void)_addStatusBarIfNeeded
{
  SBMainDisplaySceneLayoutStatusBarView *v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  BSUIOrientationTransformWrapperView *statusBarContainerView;
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
  void *v19;
  BSUIOrientationTransformWrapperView *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  UIView *statusBarWrapperView;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  UIStatusBar *v36;
  UIStatusBar *statusBar;
  uint64_t v38;
  _UIStatusBar *statusBarUnderlyingViewAccessor;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  UITapGestureRecognizer *scrollToTopGestureRecognizer;
  void *v49;
  int v50;
  uint64_t v51;
  UITapGestureRecognizer *showDebugGestureRecognizer;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if (!self->_statusBar)
  {
    v3 = self;
    WeakRetained = objc_loadWeakRetained((id *)&v3->_dataSource);
    v5 = objc_alloc(MEMORY[0x1E0D01940]);
    -[SBMainDisplaySceneLayoutStatusBarView bounds](v3, "bounds");
    v6 = objc_msgSend(v5, "initWithFrame:");
    statusBarContainerView = v3->_statusBarContainerView;
    v3->_statusBarContainerView = (BSUIOrientationTransformWrapperView *)v6;

    -[BSUIOrientationTransformWrapperView setContentOrientation:](v3->_statusBarContainerView, "setContentOrientation:", objc_msgSend(WeakRetained, "statusBarOrientation"));
    -[BSUIOrientationTransformWrapperView setTranslatesAutoresizingMaskIntoConstraints:](v3->_statusBarContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBMainDisplaySceneLayoutStatusBarView addSubview:](v3, "addSubview:", v3->_statusBarContainerView);
    -[BSUIOrientationTransformWrapperView leftAnchor](v3->_statusBarContainerView, "leftAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMainDisplaySceneLayoutStatusBarView leftAnchor](v3, "leftAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setActive:", 1);

    -[BSUIOrientationTransformWrapperView rightAnchor](v3->_statusBarContainerView, "rightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMainDisplaySceneLayoutStatusBarView rightAnchor](v3, "rightAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

    -[BSUIOrientationTransformWrapperView topAnchor](v3->_statusBarContainerView, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMainDisplaySceneLayoutStatusBarView topAnchor](v3, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    -[BSUIOrientationTransformWrapperView bottomAnchor](v3->_statusBarContainerView, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMainDisplaySceneLayoutStatusBarView bottomAnchor](v3, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    v20 = v3->_statusBarContainerView;
    -[SBMainDisplaySceneLayoutStatusBarView bounds](v3, "bounds");
    -[BSUIOrientationTransformWrapperView convertRectFromContainerInterfaceOrientationToContentInterfaceOrientation:](v20, "convertRectFromContainerInterfaceOrientationToContentInterfaceOrientation:");
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v21, v22, v23, v24);
    statusBarWrapperView = v3->_statusBarWrapperView;
    v3->_statusBarWrapperView = (UIView *)v25;

    v27 = objc_msgSend(WeakRetained, "statusBarOrientation");
    -[SBMainDisplaySceneLayoutStatusBarView _statusBarFrameForOrientation:](v3, "_statusBarFrameForOrientation:", v27);
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %p"), objc_opt_class(), v3);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMainDisplaySceneLayoutStatusBarView createStatusBarWithFrame:interfaceOrientation:reason:](v3, "createStatusBarWithFrame:interfaceOrientation:reason:", v27, v29, v31, v33, v35);
    v36 = (UIStatusBar *)objc_claimAutoreleasedReturnValue();
    statusBar = self->_statusBar;
    self->_statusBar = v36;

    -[UIStatusBar requestResolvedStyle:](self->_statusBar, "requestResolvedStyle:", 0);
    -[UIStatusBar statusBar](self->_statusBar, "statusBar");
    v38 = objc_claimAutoreleasedReturnValue();
    statusBarUnderlyingViewAccessor = v3->_statusBarUnderlyingViewAccessor;
    v3->_statusBarUnderlyingViewAccessor = (_UIStatusBar *)v38;

    if (!-[SBMainDisplaySceneLayoutStatusBarView _allowChangingIndividualStatusBarParts](v3, "_allowChangingIndividualStatusBarParts"))
    {
      -[UIStatusBar layer](self->_statusBar, "layer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setHitTestsAsOpaque:", 1);

    }
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v54 = WeakRetained;
    objc_msgSend(WeakRetained, "statusBarDescribers");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v56;
      do
      {
        v45 = 0;
        do
        {
          if (*(_QWORD *)v56 != v44)
            objc_enumerationMutation(v41);
          -[SBMainDisplaySceneLayoutStatusBarView applyStatusBarStylesForDescriber:](v3, "applyStatusBarStylesForDescriber:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v45++));
        }
        while (v43 != v45);
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
      }
      while (v43);
    }

    -[_UIStatusBar actionGestureRecognizer](v3->_statusBarUnderlyingViewAccessor, "actionGestureRecognizer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v3, sel__statusBarScrollToTop_);
    scrollToTopGestureRecognizer = v3->_scrollToTopGestureRecognizer;
    v3->_scrollToTopGestureRecognizer = (UITapGestureRecognizer *)v47;

    -[UITapGestureRecognizer requireGestureRecognizerToFail:](v3->_scrollToTopGestureRecognizer, "requireGestureRecognizerToFail:", v46);
    -[_UIStatusBar addGestureRecognizer:](v3->_statusBarUnderlyingViewAccessor, "addGestureRecognizer:", v3->_scrollToTopGestureRecognizer);
    +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "isInternalInstall");

    if (v50)
    {
      v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v3, sel__statusBarShowDebug_);
      showDebugGestureRecognizer = v3->_showDebugGestureRecognizer;
      v3->_showDebugGestureRecognizer = (UITapGestureRecognizer *)v51;

      -[UITapGestureRecognizer setNumberOfTouchesRequired:](v3->_showDebugGestureRecognizer, "setNumberOfTouchesRequired:", 2);
      -[UITapGestureRecognizer requireGestureRecognizerToFail:](v3->_showDebugGestureRecognizer, "requireGestureRecognizerToFail:", v46);
      -[_UIStatusBar addGestureRecognizer:](v3->_statusBarUnderlyingViewAccessor, "addGestureRecognizer:", v3->_showDebugGestureRecognizer);
    }
    -[UIView addSubview:](v3->_statusBarWrapperView, "addSubview:", self->_statusBar);
    -[BSUIOrientationTransformWrapperView addContentView:](v3->_statusBarContainerView, "addContentView:", v3->_statusBarWrapperView);
    -[BSUIOrientationTransformWrapperView addHitTestView:](v3->_statusBarContainerView, "addHitTestView:", self->_statusBar);
    -[SBMainDisplaySceneLayoutStatusBarView _updateHitTestLayers](v3, "_updateHitTestLayers");
    -[SBMainDisplaySceneLayoutStatusBarView _updateDebugBackgroundColor](v3, "_updateDebugBackgroundColor");

  }
}

- (void)_statusBarScrollToTop:(id)a3
{
  -[SBMainDisplaySceneLayoutStatusBarView _statusBarTapped:type:](self, "_statusBarTapped:type:", a3, 0);
}

- (void)_statusBarShowDebug:(id)a3
{
  -[SBMainDisplaySceneLayoutStatusBarView _statusBarTapped:type:](self, "_statusBarTapped:type:", a3, 1);
}

- (void)_statusBarTapped:(id)a3 type:(int64_t)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v16;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v16 = *MEMORY[0x1E0C9D538];
  if ((*((_BYTE *)&self->_conformanceFlags + 1) & 4) == 0)
  {
    -[SBMainDisplaySceneLayoutStatusBarView _statusBarDescriberForPrimaryApplicationIfAny](self, "_statusBarDescriberForPrimaryApplicationIfAny");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sceneToHandleStatusBarTapIfExists");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "locationInView:", self->_statusBarUnderlyingViewAccessor);
    *(_QWORD *)&v16 = v10;
    *((_QWORD *)&v16 + 1) = v11;
    if (!v9)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v6, "locationInView:", self);
  objc_msgSend(WeakRetained, "statusBarDescriberAtPoint:inView:pointInSceneLayoutSpace:", self, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sceneToHandleStatusBarTapIfExists");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
LABEL_5:
    v13 = objc_alloc(MEMORY[0x1E0CEAA10]);
    v14 = (void *)objc_msgSend(v13, "initWithType:xPosition:", a4, *(double *)&v16);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendActions:", v15);

  }
LABEL_6:

}

- (id)_anyAppViewControllerOwningInterfaceOrientation
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "statusBarDescribers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "sceneWantsDeviceOrientationEventsEnabled"))
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_statusBarDescriberForPrimaryApplicationIfAny
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "statusBarDescriberForStatusBarPart:", *MEMORY[0x1E0CEC200]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_sceneHandleForClassicApplicationIfAny
{
  void *v2;
  void *v3;

  -[SBMainDisplaySceneLayoutStatusBarView _statusBarDescriberForPrimaryApplicationIfAny](self, "_statusBarDescriberForPrimaryApplicationIfAny");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "classicApplicationSceneHandleIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)layoutStatusBarForSpringBoardRotationToOrientation:(int64_t)a3
{
  void *v5;

  -[SBMainDisplaySceneLayoutStatusBarView _anyAppViewControllerOwningInterfaceOrientation](self, "_anyAppViewControllerOwningInterfaceOrientation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[SBMainDisplaySceneLayoutStatusBarView _layoutStatusBarForOrientation:](self, "_layoutStatusBarForOrientation:", a3);
}

- (void)updateStatusBarOrientationForLegacyApp
{
  void *v3;
  id WeakRetained;
  id v5;

  -[SBMainDisplaySceneLayoutStatusBarView _anyAppViewControllerOwningInterfaceOrientation](self, "_anyAppViewControllerOwningInterfaceOrientation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "statusBarDescriberForStatusBarPart:", *MEMORY[0x1E0CEC200]);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    -[SBMainDisplaySceneLayoutStatusBarView _layoutStatusBarForOrientation:](self, "_layoutStatusBarForOrientation:", objc_msgSend(v5, "statusBarOrientation"));
  }
}

- (BOOL)_statusBarNeedsSpecialLayoutForClassic
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;

  -[SBMainDisplaySceneLayoutStatusBarView _sceneHandleForClassicApplicationIfAny](self, "_sceneHandleForClassicApplicationIfAny");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    && (objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "userInterfaceIdiom"),
        v3,
        (v4 & 0xFFFFFFFFFFFFFFFBLL) == 1))
  {
    objc_msgSend(v2, "application");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "classicAppNonFullScreenWithHomeAffordance"))
      v6 = objc_msgSend(v5, "classicAppPhoneAppRunningOnPad") ^ 1;
    else
      LOBYTE(v6) = 0;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (CGRect)_statusBarFrameForOrientation:(int64_t)a3
{
  BSUIOrientationTransformWrapperView *statusBarContainerView;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double debugOffsetIndex;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect result;

  statusBarContainerView = self->_statusBarContainerView;
  -[SBMainDisplaySceneLayoutStatusBarView bounds](self, "bounds");
  -[BSUIOrientationTransformWrapperView convertRectFromContainerInterfaceOrientationToContentInterfaceOrientation:](statusBarContainerView, "convertRectFromContainerInterfaceOrientationToContentInterfaceOrientation:");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[SBMainDisplaySceneLayoutStatusBarView _defaultStatusBarStyleRequest](self, "_defaultStatusBarStyleRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBMainDisplaySceneLayoutStatusBarView _statusBarNeedsSpecialLayoutForClassic](self, "_statusBarNeedsSpecialLayoutForClassic"))
  {
    -[SBMainDisplaySceneLayoutStatusBarView _sceneHandleForClassicApplicationIfAny](self, "_sceneHandleForClassicApplicationIfAny");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "displayIdentity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBUIController statusBarFrameForDeviceApplicationSceneHandle:displayConfiguration:interfaceOrientation:statusBarStyleRequest:withinBounds:inReferenceSpace:](SBUIController, "statusBarFrameForDeviceApplicationSceneHandle:displayConfiguration:interfaceOrientation:statusBarStyleRequest:withinBounds:inReferenceSpace:", v15, v17, a3, v14, 0, v7, v9, v11, v13);
    v7 = v18;
    v9 = v19;
    v11 = v20;

  }
  objc_msgSend(MEMORY[0x1E0CEA9E8], "heightForStyle:orientation:", objc_msgSend(v14, "style"), a3);
  v22 = v21;
  if (self->_debugOffsetEnabled)
  {
    debugOffsetIndex = (double)self->_debugOffsetIndex;
    v28.origin.x = v7;
    v28.origin.y = v9;
    v28.size.width = v11;
    v28.size.height = v22;
    v9 = CGRectGetHeight(v28) * debugOffsetIndex;
  }

  v24 = v7;
  v25 = v9;
  v26 = v11;
  v27 = v22;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)_layoutStatusBarForOrientation:(int64_t)a3
{
  uint64_t v5;
  int statusBarLaidOutForClassic;
  int v7;
  _BOOL4 v8;
  NSObject *v9;
  UIStatusBar *statusBar;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = -[UIStatusBar orientation](self->_statusBar, "orientation");
  statusBarLaidOutForClassic = self->_statusBarLaidOutForClassic;
  v7 = -[SBMainDisplaySceneLayoutStatusBarView _statusBarNeedsSpecialLayoutForClassic](self, "_statusBarNeedsSpecialLayoutForClassic");
  v8 = v5 != a3;
  if (statusBarLaidOutForClassic != v7)
  {
    self->_statusBarLaidOutForClassic = v7;
    v8 = 1;
  }
  SBLogAppStatusBars();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v13 = (void *)objc_opt_class();
    v16 = v13;
    BSInterfaceOrientationDescription();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    BSInterfaceOrientationDescription();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v18 = v13;
    v19 = 2112;
    v20 = v14;
    v21 = 2112;
    v22 = v15;
    v23 = 1024;
    v24 = v8;
    v25 = 1024;
    v26 = v5 != a3;
    _os_log_debug_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEBUG, "%@ statusBar laying out for orientation %@ (was %@) needsFrameUpdate = %{BOOL}u, needsOrientationUpdate = %{BOOL}u", buf, 0x2Cu);

  }
  if (v8)
  {
    -[BSUIOrientationTransformWrapperView setContentOrientation:](self->_statusBarContainerView, "setContentOrientation:", a3);
    statusBar = self->_statusBar;
    -[SBMainDisplaySceneLayoutStatusBarView _statusBarFrameForOrientation:](self, "_statusBarFrameForOrientation:", a3);
    -[UIStatusBar setFrame:](statusBar, "setFrame:");
    -[UIView _sbWindowScene](self, "_sbWindowScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "statusBarManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMainDisplaySceneLayoutStatusBarView _statusBarAvoidanceFrame](self, "_statusBarAvoidanceFrame");
    objc_msgSend(v12, "setAvoidanceFrame:reason:statusBar:animationSettings:", CFSTR("SBMainDisplaySceneLayoutStatusBarView _layoutStatusBarForOrientation"), self->_statusBar, 0);

  }
  if (v5 != a3)
    -[UIStatusBar setOrientation:](self->_statusBar, "setOrientation:", a3);
  -[SBMainDisplaySceneLayoutStatusBarView _updateHitTestLayers](self, "_updateHitTestLayers");
}

- (void)_tearDownStatusBar
{
  void *v3;
  UITapGestureRecognizer *scrollToTopGestureRecognizer;
  void *v5;
  UITapGestureRecognizer *showDebugGestureRecognizer;
  void *v7;
  void *v8;
  UIStatusBar *statusBar;
  UIView *statusBarWrapperView;
  BSUIOrientationTransformWrapperView *statusBarContainerView;
  NSMutableDictionary *hitTestLayers;

  -[UITapGestureRecognizer view](self->_scrollToTopGestureRecognizer, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", self->_scrollToTopGestureRecognizer);

  scrollToTopGestureRecognizer = self->_scrollToTopGestureRecognizer;
  self->_scrollToTopGestureRecognizer = 0;

  -[UITapGestureRecognizer view](self->_showDebugGestureRecognizer, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeGestureRecognizer:", self->_showDebugGestureRecognizer);

  showDebugGestureRecognizer = self->_showDebugGestureRecognizer;
  self->_showDebugGestureRecognizer = 0;

  +[SBWindowSceneStatusBarManager windowSceneStatusBarManagerForEmbeddedDisplay](SBWindowSceneStatusBarManager, "windowSceneStatusBarManagerForEmbeddedDisplay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reusePool");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recycleStatusBar:", self->_statusBar);

  -[BSUIOrientationTransformWrapperView removeFromSuperview](self->_statusBarContainerView, "removeFromSuperview");
  statusBar = self->_statusBar;
  self->_statusBar = 0;

  statusBarWrapperView = self->_statusBarWrapperView;
  self->_statusBarWrapperView = 0;

  statusBarContainerView = self->_statusBarContainerView;
  self->_statusBarContainerView = 0;

  hitTestLayers = self->_hitTestLayers;
  self->_hitTestLayers = 0;

}

- (BOOL)isRequiringStatusBar
{
  return -[NSMutableSet count](self->_statusBarRequiringReasons, "count") != 0;
}

- (BOOL)isStatusBarEffectivelyHidden
{
  void *v3;
  BOOL v4;

  if (!self->_statusBarUnderlyingViewAccessor)
    return 1;
  if (-[SBMainDisplaySceneLayoutStatusBarView _allowChangingIndividualStatusBarParts](self, "_allowChangingIndividualStatusBarParts"))
  {
    -[_UIStatusBar enabledPartIdentifiers](self->_statusBarUnderlyingViewAccessor, "enabledPartIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count") == 0;

    return v4;
  }
  return -[UIStatusBar isHidden](self->_statusBar, "isHidden");
}

- (BOOL)_allowChangingIndividualStatusBarParts
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v3 = objc_msgSend(WeakRetained, "allowsConfiguringIndividualStatusBarParts");

  return v3;
}

- (void)updateBreadcrumbActionIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  NSString **p_statusBarBreadcrumbSceneIdentifier;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _UIStatusBar *statusBarUnderlyingViewAccessor;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;

  -[SBMainDisplaySceneLayoutStatusBarView _statusBarDescriberForPrimaryApplicationIfAny](self, "_statusBarDescriberForPrimaryApplicationIfAny");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusBarSceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overlayStatusBarData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  p_statusBarBreadcrumbSceneIdentifier = &self->_statusBarBreadcrumbSceneIdentifier;
  if (!BSEqualStrings()
    || (-[_UIStatusBar currentData](self->_statusBarUnderlyingViewAccessor, "currentData"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7 != v5))
  {
    objc_msgSend(v3, "breadcrumbProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && self->_statusBarUnderlyingViewAccessor)
    {
      v9 = MEMORY[0x1E0C809B0];
      v10 = (void *)MEMORY[0x1E0CEABB0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __74__SBMainDisplaySceneLayoutStatusBarView_updateBreadcrumbActionIfNecessary__block_invoke;
      v17[3] = &unk_1E8E9E820;
      v17[4] = self;
      v11 = v5;
      v18 = v11;
      objc_msgSend(v10, "performWithoutAnimation:", v17);
      if (v11 && objc_msgSend(v8, "hasBreadcrumb"))
      {
        statusBarUnderlyingViewAccessor = self->_statusBarUnderlyingViewAccessor;
        v13 = (void *)MEMORY[0x1E0CEAED0];
        v15[0] = v9;
        v15[1] = 3221225472;
        v15[2] = __74__SBMainDisplaySceneLayoutStatusBarView_updateBreadcrumbActionIfNecessary__block_invoke_2;
        v15[3] = &unk_1E8EA98B8;
        v16 = v8;
        objc_msgSend(v13, "actionWithBlock:", v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIStatusBar setAction:forPartWithIdentifier:](statusBarUnderlyingViewAccessor, "setAction:forPartWithIdentifier:", v14, *MEMORY[0x1E0CEC1E0]);

      }
    }
    objc_storeStrong((id *)p_statusBarBreadcrumbSceneIdentifier, v4);

  }
}

uint64_t __74__SBMainDisplaySceneLayoutStatusBarView_updateBreadcrumbActionIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setOverlayData:", *(_QWORD *)(a1 + 40));
}

uint64_t __74__SBMainDisplaySceneLayoutStatusBarView_updateBreadcrumbActionIfNecessary__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activateBreadcrumbIfPossible");
}

- (void)_updateHitTestLayers
{
  id WeakRetained;
  NSMutableDictionary *v4;
  NSMutableDictionary *hitTestLayers;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  double height;
  double width;
  double y;
  double x;
  uint64_t v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  void *v36;
  void *v37;
  id obj;
  double v39;
  double v40;
  double v41;
  double v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v48 = *MEMORY[0x1E0C80C00];
  if (-[SBMainDisplaySceneLayoutStatusBarView _allowChangingIndividualStatusBarParts](self, "_allowChangingIndividualStatusBarParts"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (!self->_hitTestLayers)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      hitTestLayers = self->_hitTestLayers;
      self->_hitTestLayers = v4;

    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[SBMainDisplaySceneLayoutStatusBarView allValidStatusBarPartIdentifiers](self, "allValidStatusBarPartIdentifiers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v44;
      v41 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v42 = *MEMORY[0x1E0C9D628];
      v39 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      v40 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v44 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(WeakRetained, "statusBarDescriberForStatusBarPart:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](self->_hitTestLayers, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          height = v39;
          width = v40;
          y = v41;
          x = v42;
          if ((objc_msgSend(v11, "statusBarHidden") & 1) == 0)
          {
            height = v39;
            width = v40;
            y = v41;
            x = v42;
            if ((*(_WORD *)&self->_conformanceFlags & 0x800) != 0)
            {
              objc_msgSend(v11, "statusBarSceneIdentifier");
              v17 = v8;
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(WeakRetained, "frameForSceneIdentifier:inView:", v18, self->_statusBar);
              v20 = v19;
              v22 = v21;
              v24 = v23;
              v26 = v25;

              v8 = v17;
              v49.origin.x = v20;
              v49.origin.y = v22;
              v49.size.width = v24;
              v49.size.height = v26;
              height = v39;
              width = v40;
              y = v41;
              x = v42;
              if (!CGRectIsNull(v49))
              {
                -[UIStatusBar layer](self->_statusBar, "layer");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "bounds");
                v29 = v28;
                v31 = v30;
                v33 = v32;
                v35 = v34;

                v8 = v17;
                v50.origin.x = v20;
                v50.origin.y = v22;
                v50.size.width = v24;
                v50.size.height = v26;
                v53.origin.x = v29;
                v53.origin.y = v31;
                v53.size.width = v33;
                v53.size.height = v35;
                v51 = CGRectIntersection(v50, v53);
                x = v51.origin.x;
                y = v51.origin.y;
                width = v51.size.width;
                height = v51.size.height;
              }
            }
          }
          v52.origin.x = x;
          v52.origin.y = y;
          v52.size.width = width;
          v52.size.height = height;
          if (CGRectIsEmpty(v52))
          {
            objc_msgSend(v12, "removeFromSuperlayer");
          }
          else
          {
            if (!v12)
            {
              objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setHitTestsAsOpaque:", 1);
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_hitTestLayers, "setObject:forKeyedSubscript:", v12, v10);
            }
            objc_msgSend(v12, "superlayer");
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v36)
            {
              -[UIStatusBar layer](self->_statusBar, "layer");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "addSublayer:", v12);

            }
            objc_msgSend(v12, "setFrame:", x, y, width, height);
          }

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v7);
    }

  }
}

- (int64_t)containerOrientation
{
  return -[BSUIOrientationTransformWrapperView containerOrientation](self->_statusBarContainerView, "containerOrientation");
}

- (void)setContainerOrientation:(int64_t)a3
{
  -[BSUIOrientationTransformWrapperView setContainerOrientation:](self->_statusBarContainerView, "setContainerOrientation:", a3);
}

- (id)statusBarStyleRequestForStatusBarPart:(id)a3
{
  uint64_t v3;

  if (a3)
    v3 = _SBStatusBarLegacyStyleFromStyle(-[SBMainDisplaySceneLayoutStatusBarView _effectiveStyleForPartIdentifier:](self, "_effectiveStyleForPartIdentifier:"));
  else
    v3 = 0;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0F20]), "initWithResolvedStyle:foregroundColor:", _SBStatusBarStyleFromLegacyStyle(v3), 0);
}

- (id)allValidStatusBarPartIdentifiers
{
  uint64_t v2;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CEC1E8];
  v4[0] = *MEMORY[0x1E0CEC200];
  v4[1] = v2;
  v4[2] = *MEMORY[0x1E0CEC210];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)applyStatusBarStylesForDescriber:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "statusBarSceneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogAppStatusBars();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v10 = (void *)objc_opt_class();
    v11 = v10;
    *(_DWORD *)buf = 138413058;
    v17 = v5;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = (id)objc_opt_class();
    v22 = 2048;
    v23 = v4;
    v12 = v21;
    _os_log_debug_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEBUG, "(%@) %@ applying styles for <%@ %p>", buf, 0x2Au);

  }
  -[SBMainDisplaySceneLayoutStatusBarView _applyStatusBarHidden:withAnimation:toSceneWithIdentifier:](self, "_applyStatusBarHidden:withAnimation:toSceneWithIdentifier:", objc_msgSend(v4, "statusBarHidden"), 0, v5);
  objc_msgSend(v4, "backgroundActivitiesToSuppress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainDisplaySceneLayoutStatusBarView _applyBackgroundActivitiesToSuppress:toSceneWithIdentifier:](self, "_applyBackgroundActivitiesToSuppress:toSceneWithIdentifier:", v7, v5);

  -[SBMainDisplaySceneLayoutStatusBarView _applyStatusBarStyle:toSceneWithIdentifier:](self, "_applyStatusBarStyle:toSceneWithIdentifier:", objc_msgSend(v4, "statusBarStyle"), v5);
  objc_msgSend(v4, "statusBarAlpha");
  -[SBMainDisplaySceneLayoutStatusBarView _applyStatusBarAlpha:toSceneWithIdentifier:](self, "_applyStatusBarAlpha:toSceneWithIdentifier:", v5);
  objc_msgSend(v4, "statusBarAvoidanceFrame");
  -[SBMainDisplaySceneLayoutStatusBarView _applyStatusBarAvoidanceFrame:toSceneWithIdentifier:](self, "_applyStatusBarAvoidanceFrame:toSceneWithIdentifier:", v5);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__SBMainDisplaySceneLayoutStatusBarView_applyStatusBarStylesForDescriber___block_invoke;
  v13[3] = &unk_1E8EA98E0;
  v13[4] = self;
  v14 = v4;
  v15 = v5;
  v8 = v5;
  v9 = v4;
  -[SBMainDisplaySceneLayoutStatusBarView _enumerateValidStatusBarPartIdentifiersForSceneWithIdentifier:withBlock:](self, "_enumerateValidStatusBarPartIdentifiersForSceneWithIdentifier:withBlock:", v8, v13);

}

void __74__SBMainDisplaySceneLayoutStatusBarView_applyStatusBarStylesForDescriber___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)a1[4];
  v4 = (void *)a1[5];
  v5 = a2;
  objc_msgSend(v3, "_applyStatusBarStyle:toPartIdentifier:ofSceneWithIdentifier:", objc_msgSend(v4, "statusBarStyleForPartWithIdentifier:", v5), v5, a1[6]);

}

- (void)_applyStatusBarStyle:(int64_t)a3 toSceneWithIdentifier:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_statusBarUnderlyingViewAccessor)
  {
    if (-[SBMainDisplaySceneLayoutStatusBarView _allowChangingIndividualStatusBarParts](self, "_allowChangingIndividualStatusBarParts"))
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __84__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarStyle_toSceneWithIdentifier___block_invoke;
      v11[3] = &unk_1E8EA9908;
      v11[4] = self;
      v13 = a3;
      v12 = v6;
      -[SBMainDisplaySceneLayoutStatusBarView _enumerateValidStatusBarPartIdentifiersForSceneWithIdentifier:withBlock:](self, "_enumerateValidStatusBarPartIdentifiersForSceneWithIdentifier:withBlock:", v12, v11);

    }
    else
    {
      SBLogAppStatusBars();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8 = (void *)objc_opt_class();
        v9 = v8;
        _SBStringFromStatusBarStyle(a3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v15 = v6;
        v16 = 2112;
        v17 = v8;
        v18 = 2112;
        v19 = v10;
        _os_log_debug_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEBUG, "(%@) %@ changing style for whole bar to %@", buf, 0x20u);

      }
      -[UIStatusBar requestResolvedStyle:](self->_statusBar, "requestResolvedStyle:", a3);
    }
  }

}

void __84__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarStyle_toSceneWithIdentifier___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!*(_QWORD *)(a1[4] + 456))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = a1[4];
    v6 = *(void **)(v5 + 456);
    *(_QWORD *)(v5 + 456) = v4;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 456), "setObject:forKeyedSubscript:", v7, v3);

  objc_msgSend(*(id *)(a1[4] + 464), "objectForKey:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    SBLogAppStatusBars();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = a1[5];
      v11 = (void *)objc_opt_class();
      v12 = a1[6];
      v13 = v11;
      _SBStringFromStatusBarStyle(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138413058;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v3;
      v21 = 2112;
      v22 = v14;
      _os_log_debug_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEBUG, "(%@) %@ changing style for %@ to %@", (uint8_t *)&v15, 0x2Au);

    }
    objc_msgSend(*(id *)(a1[4] + 440), "setStyle:forPartWithIdentifier:", a1[6], v3);
  }

}

- (void)_applyStatusBarStyle:(int64_t)a3 toPartIdentifier:(id)a4 ofSceneWithIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  NSMutableDictionary *partIdentifiersCustomStyles;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (self->_statusBarUnderlyingViewAccessor)
  {
    if (-[SBMainDisplaySceneLayoutStatusBarView _allowChangingIndividualStatusBarParts](self, "_allowChangingIndividualStatusBarParts"))
    {
      -[SBMainDisplaySceneLayoutStatusBarView _validStatusBarPartIdentifiersForSceneWithIdentifier:](self, "_validStatusBarPartIdentifiersForSceneWithIdentifier:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "containsObject:", v8);

      if (v11)
      {
        if (a3 == 4)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_partIdentifiersDefaultStyles, "objectForKeyedSubscript:", v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          a3 = objc_msgSend(v12, "integerValue");

          partIdentifiersCustomStyles = self->_partIdentifiersCustomStyles;
          if (partIdentifiersCustomStyles)
            -[NSMutableDictionary removeObjectForKey:](partIdentifiersCustomStyles, "removeObjectForKey:", v8);
        }
        else
        {
          if (!self->_partIdentifiersCustomStyles)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
            v15 = self->_partIdentifiersCustomStyles;
            self->_partIdentifiersCustomStyles = v14;

          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_partIdentifiersCustomStyles, "setObject:forKeyedSubscript:", v16, v8);

        }
        SBLogAppStatusBars();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          v18 = (void *)objc_opt_class();
          v19 = v18;
          _SBStringFromStatusBarStyle(a3);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138413058;
          v22 = v9;
          v23 = 2112;
          v24 = v18;
          v25 = 2112;
          v26 = v8;
          v27 = 2112;
          v28 = v20;
          _os_log_debug_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEBUG, "(%@) %@ changing style for %@ to %@", (uint8_t *)&v21, 0x2Au);

        }
        -[_UIStatusBar setStyle:forPartWithIdentifier:](self->_statusBarUnderlyingViewAccessor, "setStyle:forPartWithIdentifier:", a3, v8);
      }
    }
  }

}

- (void)_applyStatusBarHidden:(BOOL)a3 withAnimation:(int64_t)a4 toSceneWithIdentifier:(id)a5
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id *v13;
  id *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  _QWORD v26[2];
  void *v27;
  _QWORD v28[5];
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  int64_t v36;
  uint64_t v37;

  v6 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (self->_statusBarUnderlyingViewAccessor)
  {
    SBLogAppStatusBars();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v17 = (void *)objc_opt_class();
      v18 = v17;
      NSStringFromBOOL();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v30 = v8;
      v31 = 2112;
      v32 = v17;
      v33 = 2112;
      v34 = v19;
      v35 = 2048;
      v36 = a4;
      _os_log_debug_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEBUG, "(%@) %@ begin to change status bar hidden to %@ with animation %ld", buf, 0x2Au);

    }
    -[UIView _sbWindowScene](self, "_sbWindowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recordingIndicatorManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SBMainDisplaySceneLayoutStatusBarView _allowChangingIndividualStatusBarParts](self, "_allowChangingIndividualStatusBarParts"))
    {
      v12 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __99__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarHidden_withAnimation_toSceneWithIdentifier___block_invoke_36;
      v23[3] = &unk_1E8EA9958;
      v23[4] = self;
      v13 = &v24;
      v24 = v8;
      v20[0] = v12;
      v20[1] = 3221225472;
      v20[2] = __99__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarHidden_withAnimation_toSceneWithIdentifier___block_invoke_2_37;
      v20[3] = &unk_1E8E9EEF0;
      v20[4] = self;
      v14 = &v21;
      v21 = v24;
      v22 = v11;
      v15 = v11;
      -[SBMainDisplaySceneLayoutStatusBarView _animateHidden:withAnimation:transitionHandler:applyHandler:](self, "_animateHidden:withAnimation:transitionHandler:applyHandler:", v6, a4, v23, v20);

    }
    else
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __99__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarHidden_withAnimation_toSceneWithIdentifier___block_invoke;
      v28[3] = &unk_1E8EA9930;
      v28[4] = self;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __99__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarHidden_withAnimation_toSceneWithIdentifier___block_invoke_2;
      v25[3] = &unk_1E8E9EEF0;
      v13 = (id *)v26;
      v26[0] = v8;
      v26[1] = self;
      v14 = &v27;
      v27 = v11;
      v16 = v11;
      -[SBMainDisplaySceneLayoutStatusBarView _animateHidden:withAnimation:transitionHandler:applyHandler:](self, "_animateHidden:withAnimation:transitionHandler:applyHandler:", v6, a4, v28, v25);
    }

  }
}

uint64_t __99__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarHidden_withAnimation_toSceneWithIdentifier___block_invoke(uint64_t a1, _OWORD *a2, double a3)
{
  void *v6;
  __int128 v7;
  _OWORD v9[3];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "_removeAllAnimations:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", a3);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
  v7 = a2[1];
  v9[0] = *a2;
  v9[1] = v7;
  v9[2] = a2[2];
  return objc_msgSend(v6, "setTransform:", v9);
}

uint64_t __99__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarHidden_withAnimation_toSceneWithIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;

  SBLogAppStatusBars();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __99__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarHidden_withAnimation_toSceneWithIdentifier___block_invoke_2_cold_1(a1, a2, v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 432), "setHidden:", a2);
  return objc_msgSend(*(id *)(a1 + 48), "updateRecordingIndicatorForStatusBarChanges");
}

uint64_t __99__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarHidden_withAnimation_toSceneWithIdentifier___block_invoke_36(uint64_t a1, uint64_t a2, double a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "_removeAllAnimations:", 1);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_validStatusBarPartIdentifiersForSceneWithIdentifier:", *(_QWORD *)(a1 + 40), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:forPartWithIdentifier:", v11, a3);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setOffset:forPartWithIdentifier:", v11, *(double *)(a2 + 32), *(double *)(a2 + 40));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "layoutIfNeeded");
}

void __99__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarHidden_withAnimation_toSceneWithIdentifier___block_invoke_2_37(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "enabledPartIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(id **)(a1 + 32);
  if (v5)
    objc_msgSend(v6[55], "enabledPartIdentifiers");
  else
    objc_msgSend(v6, "allValidStatusBarPartIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v7);

  v8 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "_validStatusBarPartIdentifiersForSceneWithIdentifier:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
    objc_msgSend(v4, "minusSet:", v10);
  else
    objc_msgSend(v4, "unionSet:", v10);
  v11 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "_currentlyValidStatusBarPartIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intersectSet:", v13);

  SBLogAppStatusBars();
  v14 = objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);

  if ((_DWORD)v12)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "enabledPartIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqualToArray:", v16);
    SBLogAppStatusBars();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
    if (v17)
    {
      if (v19)
      {
        v20 = *(_QWORD *)(a1 + 40);
        v21 = (void *)objc_opt_class();
        v30 = v21;
        NSStringFromBOOL();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v32 = v20;
        v33 = 2112;
        v34 = v21;
        v35 = 2112;
        v36 = v22;
        v23 = "(%@) %@ changing hidden to %@, which results in unchanged enabled parts";
        v24 = v18;
        v25 = 32;
LABEL_15:
        _os_log_debug_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEBUG, v23, buf, v25);

      }
    }
    else if (v19)
    {
      v28 = *(_QWORD *)(a1 + 40);
      v29 = (void *)objc_opt_class();
      v30 = v29;
      NSStringFromBOOL();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v32 = v28;
      v33 = 2112;
      v34 = v29;
      v35 = 2112;
      v36 = v22;
      v37 = 2112;
      v38 = v15;
      v39 = 2112;
      v40 = v4;
      v23 = "(%@) %@ changing hidden to %@, which results in enabled parts changing from %@ to %@";
      v24 = v18;
      v25 = 52;
      goto LABEL_15;
    }

  }
  v26 = *(void **)(*(_QWORD *)(a1 + 32) + 440);
  objc_msgSend(v4, "allObjects");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setEnabledPartIdentifiers:", v27);

  objc_msgSend(*(id *)(a1 + 48), "updateRecordingIndicatorForStatusBarChanges");
  objc_msgSend(*(id *)(a1 + 32), "_updateHitTestLayers");

}

- (void)_applyStatusBarAlpha:(double)a3 toSceneWithIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  double v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_statusBarUnderlyingViewAccessor)
  {
    -[UIView _sbWindowScene](self, "_sbWindowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordingIndicatorManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SBMainDisplaySceneLayoutStatusBarView _allowChangingIndividualStatusBarParts](self, "_allowChangingIndividualStatusBarParts"))
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __84__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarAlpha_toSceneWithIdentifier___block_invoke;
      v11[3] = &unk_1E8EA9980;
      v11[4] = self;
      v14 = a3;
      v12 = v6;
      v13 = v8;
      -[SBMainDisplaySceneLayoutStatusBarView _enumerateValidStatusBarPartIdentifiersForSceneWithIdentifier:withBlock:](self, "_enumerateValidStatusBarPartIdentifiersForSceneWithIdentifier:withBlock:", v12, v11);

    }
    else
    {
      SBLogAppStatusBars();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v16 = v6;
        v17 = 2112;
        v18 = (id)objc_opt_class();
        v19 = 2048;
        v20 = a3;
        v10 = v18;
        _os_log_debug_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEBUG, "(%@) %@ changing alpha for whole bar to %f", buf, 0x20u);

      }
      -[_UIStatusBar setAlpha:](self->_statusBarUnderlyingViewAccessor, "setAlpha:", a3);
      objc_msgSend(v8, "updateRecordingIndicatorForStatusBarChanges");
    }

  }
}

void __84__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarAlpha_toSceneWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:forPartWithIdentifier:", v3, *(double *)(a1 + 56));
  SBLogAppStatusBars();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = (void *)objc_opt_class();
    v7 = *(_QWORD *)(a1 + 56);
    v9 = 138413058;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v3;
    v15 = 2048;
    v16 = v7;
    v8 = v6;
    _os_log_debug_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEBUG, "(%@) %@ changing alpha for %@ to %f", (uint8_t *)&v9, 0x2Au);

  }
  if (objc_msgSend(v3, "isEqual:", CFSTR("trailingPartIdentifier")))
    objc_msgSend(*(id *)(a1 + 48), "updateRecordingIndicatorForStatusBarChanges");

}

- (void)_applyBackgroundActivitiesToSuppress:(id)a3 toSceneWithIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_statusBarUnderlyingViewAccessor)
  {
    -[UIStatusBar requestResolvedStyle:](self->_statusBar, "requestResolvedStyle:", -[UIStatusBar currentResolvedStyle](self->_statusBar, "currentResolvedStyle"));
    SBLogAppStatusBars();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      STBackgroundActivityIdentifiersDescription();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBMainDisplaySceneLayoutStatusBarView _effectiveBackgroundActivityIdentifiersToSuppress](self, "_effectiveBackgroundActivityIdentifiersToSuppress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      STBackgroundActivityIdentifiersDescription();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      SBLogAppStatusBars();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v15 = 138413058;
        v16 = v7;
        v17 = 2112;
        v18 = (id)objc_opt_class();
        v19 = 2112;
        v20 = v10;
        v21 = 2112;
        v22 = v12;
        v14 = v18;
        _os_log_debug_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEBUG, "(%@) %@ changing style overrides to %@ (effectively %@)", (uint8_t *)&v15, 0x2Au);

      }
    }
  }

}

- (void)_applyStatusBarAvoidanceFrame:(CGRect)a3 toSceneWithIdentifier:(id)a4
{
  void *v5;
  id v6;

  if (self->_statusBarUnderlyingViewAccessor)
  {
    -[UIView _sbWindowScene](self, "_sbWindowScene", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "statusBarManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMainDisplaySceneLayoutStatusBarView _statusBarAvoidanceFrame](self, "_statusBarAvoidanceFrame");
    objc_msgSend(v5, "setAvoidanceFrame:reason:statusBar:animationSettings:", CFSTR("SBMainDisplaySceneLayoutStatusBarView _applyStatusBarAvoidanceFrame"), self->_statusBar, 0);

  }
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarStyleTo:(int64_t)a4
{
  -[SBMainDisplaySceneLayoutStatusBarView _applyStatusBarStyle:toSceneWithIdentifier:](self, "_applyStatusBarStyle:toSceneWithIdentifier:", a4, a3);
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarStyleTo:(int64_t)a4 forPartWithIdentifier:(id)a5
{
  -[SBMainDisplaySceneLayoutStatusBarView _applyStatusBarStyle:toPartIdentifier:ofSceneWithIdentifier:](self, "_applyStatusBarStyle:toPartIdentifier:ofSceneWithIdentifier:", a4, a5, a3);
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarHiddenTo:(BOOL)a4 withAnimation:(int64_t)a5
{
  -[SBMainDisplaySceneLayoutStatusBarView _applyStatusBarHidden:withAnimation:toSceneWithIdentifier:](self, "_applyStatusBarHidden:withAnimation:toSceneWithIdentifier:", a4, a5, a3);
}

- (void)sceneWithIdentifier:(id)a3 didChangeBackgroundActivitiesToSuppressTo:(id)a4
{
  -[SBMainDisplaySceneLayoutStatusBarView _applyBackgroundActivitiesToSuppress:toSceneWithIdentifier:](self, "_applyBackgroundActivitiesToSuppress:toSceneWithIdentifier:", a4, a3);
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarOrientationTo:(int64_t)a4
{
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  id WeakRetained;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  -[SBMainDisplaySceneLayoutStatusBarView _anyAppViewControllerOwningInterfaceOrientation](self, "_anyAppViewControllerOwningInterfaceOrientation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    SBLogAppStatusBars();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      if ((*(_WORD *)&self->_conformanceFlags & 0x100) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
        objc_msgSend(WeakRetained, "statusBarPartsForSceneWithIdentifier:", v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[SBMainDisplaySceneLayoutStatusBarView allValidStatusBarPartIdentifiers](self, "allValidStatusBarPartIdentifiers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToArray:", v12);

        if ((v13 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplaySceneLayoutStatusBarView.m"), 698, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[statusBarParts isEqualToArray:[self allValidStatusBarPartIdentifiers]]"));

        }
      }
      -[SBMainDisplaySceneLayoutStatusBarView _statusBarDescriberForPrimaryApplicationIfAny](self, "_statusBarDescriberForPrimaryApplicationIfAny");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "statusBarSceneIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v19, "isEqualToString:", v15);

      if ((v16 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplaySceneLayoutStatusBarView.m"), 700, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[sceneIdentifier isEqualToString:[[self _statusBarDescriberForPrimaryApplicationIfAny] statusBarSceneIdentifier]]"));

      }
    }
    -[SBMainDisplaySceneLayoutStatusBarView _layoutStatusBarForOrientation:](self, "_layoutStatusBarForOrientation:", a4);
    -[BSUIOrientationTransformWrapperView setNeedsLayout](self->_statusBarContainerView, "setNeedsLayout");
    -[BSUIOrientationTransformWrapperView layoutIfNeeded](self->_statusBarContainerView, "layoutIfNeeded");
  }

}

- (void)didInvalidateStatusBarDescriptionForSceneWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SBMainDisplaySceneLayoutStatusBarView dataSource](self, "dataSource", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusBarDescribers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "statusBarSceneIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if (v13)
          -[SBMainDisplaySceneLayoutStatusBarView applyStatusBarStylesForDescriber:](self, "applyStatusBarStylesForDescriber:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 256;
    else
      v5 = 0;
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xFEFF | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 512;
    else
      v6 = 0;
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xFDFF | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 1024;
    else
      v7 = 0;
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xFBFF | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 2048;
    else
      v8 = 0;
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xF7FF | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 4096;
    else
      v9 = 0;
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xEFFF | v9;
  }

}

- (id)_currentlyValidStatusBarPartIdentifiers
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = WeakRetained;
  if ((*(_WORD *)&self->_conformanceFlags & 0x200) != 0)
    objc_msgSend(WeakRetained, "currentlyValidStatusBarPartIdentifiers");
  else
    -[SBMainDisplaySceneLayoutStatusBarView allValidStatusBarPartIdentifiers](self, "allValidStatusBarPartIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGRect)_statusBarAvoidanceFrame
{
  id WeakRetained;
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
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = WeakRetained;
  if ((*(_WORD *)&self->_conformanceFlags & 0x1000) != 0)
  {
    objc_msgSend(WeakRetained, "statusBarAvoidanceFrame");
    v5 = v9;
    v6 = v10;
    v7 = v11;
    v8 = v12;
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v13 = v5;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)_validStatusBarPartIdentifiersForSceneWithIdentifier:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v6 = WeakRetained;
  if ((*(_WORD *)&self->_conformanceFlags & 0x100) != 0)
    objc_msgSend(WeakRetained, "statusBarPartsForSceneWithIdentifier:", v4);
  else
    -[SBMainDisplaySceneLayoutStatusBarView allValidStatusBarPartIdentifiers](self, "allValidStatusBarPartIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)_effectiveStyleForPartIdentifier:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = _SBStatusBarStyleFromLegacyStyle(-[UIStatusBar currentStyle](self->_statusBar, "currentStyle"));
  if (-[SBMainDisplaySceneLayoutStatusBarView _allowChangingIndividualStatusBarParts](self, "_allowChangingIndividualStatusBarParts"))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_partIdentifiersDefaultStyles, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_partIdentifiersCustomStyles, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 || (v7 = v6) != 0)
      v5 = objc_msgSend(v7, "integerValue");

  }
  return v5;
}

- (id)_defaultStatusBarStyleRequest
{
  return -[SBMainDisplaySceneLayoutStatusBarView statusBarStyleRequestForStatusBarPart:](self, "statusBarStyleRequestForStatusBarPart:", 0);
}

- (void)_enumerateValidStatusBarPartIdentifiersForSceneWithIdentifier:(id)a3 withBlock:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a4;
  if (v6)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[SBMainDisplaySceneLayoutStatusBarView _validStatusBarPartIdentifiersForSceneWithIdentifier:](self, "_validStatusBarPartIdentifiersForSceneWithIdentifier:", a3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          v6[2](v6, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (unint64_t)_effectiveStatusBarStyleOverridesToSuppress
{
  void *v2;
  unint64_t v3;

  -[SBMainDisplaySceneLayoutStatusBarView _effectiveBackgroundActivityIdentifiersToSuppress](self, "_effectiveBackgroundActivityIdentifiersToSuppress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = STUIStyleOverridesForBackgroundActivityIdentifiers();

  return v3;
}

- (id)_effectiveBackgroundActivityIdentifiersToSuppress
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SBMainDisplaySceneLayoutStatusBarView dataSource](self, "dataSource", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusBarDescribers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "backgroundActivitiesToSuppress");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (void)_animateHidden:(BOOL)a3 withAnimation:(int64_t)a4 transitionHandler:(id)a5 applyHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id *v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28[2];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  BOOL v32;
  _QWORD v33[4];
  id v34;
  id v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;

  v10 = a5;
  v11 = a6;
  v41 = 0u;
  v42 = 0u;
  v40 = 0u;
  -[SBMainDisplaySceneLayoutStatusBarView _hiddenTransformForAnimation:](self, "_hiddenTransformForAnimation:", a4);
  -[SBMainDisplaySceneLayoutStatusBarView _hiddenAlphaForAnimation:](self, "_hiddenAlphaForAnimation:", a4);
  v13 = v12;
  self->_lastHiddenValueForAnimation = a3;
  v14 = objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlock");
  if (a4 && v14)
  {
    if (!a3)
    {
      v15 = (void *)MEMORY[0x1E0CEABB0];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __101__SBMainDisplaySceneLayoutStatusBarView__animateHidden_withAnimation_transitionHandler_applyHandler___block_invoke;
      v33[3] = &unk_1E8EA99A8;
      v34 = v11;
      v35 = v10;
      v36 = v13;
      v37 = v40;
      v38 = v41;
      v39 = v42;
      objc_msgSend(v15, "performWithoutAnimation:", v33);

    }
    v16 = (void *)MEMORY[0x1E0CEABB0];
    v17 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __101__SBMainDisplaySceneLayoutStatusBarView__animateHidden_withAnimation_transitionHandler_applyHandler___block_invoke_2;
    v27[3] = &unk_1E8EA99D0;
    v18 = v28;
    v28[0] = v10;
    v32 = a3;
    v28[1] = v13;
    v29 = v40;
    v30 = v41;
    v31 = v42;
    v24[0] = v17;
    v24[1] = 3221225472;
    v24[2] = __101__SBMainDisplaySceneLayoutStatusBarView__animateHidden_withAnimation_transitionHandler_applyHandler___block_invoke_3;
    v24[3] = &unk_1E8EA99F8;
    v24[4] = self;
    v25 = v11;
    v26 = v28[0];
    v19 = v11;
    objc_msgSend(v16, "animateWithDuration:animations:completion:", v27, v24, 0.0);

  }
  else
  {
    v20 = (void *)MEMORY[0x1E0CEABB0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __101__SBMainDisplaySceneLayoutStatusBarView__animateHidden_withAnimation_transitionHandler_applyHandler___block_invoke_4;
    v22[3] = &unk_1E8E9F1E8;
    v18 = &v23;
    v22[4] = self;
    v23 = v11;
    v21 = v11;
    objc_msgSend(v20, "performWithoutAnimation:", v22);
  }

}

uint64_t __101__SBMainDisplaySceneLayoutStatusBarView__animateHidden_withAnimation_transitionHandler_applyHandler___block_invoke(uint64_t a1)
{
  double v2;
  uint64_t (*v3)(double);
  __int128 v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(double *)(a1 + 48);
  v3 = *(uint64_t (**)(double))(*(_QWORD *)(a1 + 40) + 16);
  v4 = *(_OWORD *)(a1 + 72);
  v6 = *(_OWORD *)(a1 + 56);
  v7 = v4;
  v8 = *(_OWORD *)(a1 + 88);
  return v3(v2);
}

uint64_t __101__SBMainDisplaySceneLayoutStatusBarView__animateHidden_withAnimation_transitionHandler_applyHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v7;
  __int128 v8;
  __n128 v9;

  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 96))
  {
    a2.n128_u64[0] = *(_QWORD *)(a1 + 40);
    v4 = *(_OWORD *)(a1 + 64);
    v7 = *(_OWORD *)(a1 + 48);
    v8 = v4;
    v9 = *(__n128 *)(a1 + 80);
  }
  else
  {
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v7 = *MEMORY[0x1E0C9BAA8];
    v8 = v5;
    a2 = *(__n128 *)(MEMORY[0x1E0C9BAA8] + 32);
    v9 = a2;
    a2.n128_u64[0] = 1.0;
  }
  return (*(uint64_t (**)(uint64_t, __int128 *, __n128))(v3 + 16))(v3, &v7, a2);
}

uint64_t __101__SBMainDisplaySceneLayoutStatusBarView__animateHidden_withAnimation_transitionHandler_applyHandler___block_invoke_3(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t (*v3)(double);
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  if (a2)
  {
    v2 = result;
    (*(void (**)(void))(*(_QWORD *)(result + 40) + 16))();
    v3 = *(uint64_t (**)(double))(*(_QWORD *)(v2 + 48) + 16);
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v5 = *MEMORY[0x1E0C9BAA8];
    v6 = v4;
    v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    return v3(1.0);
  }
  return result;
}

uint64_t __101__SBMainDisplaySceneLayoutStatusBarView__animateHidden_withAnimation_transitionHandler_applyHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 489));
}

- (CGAffineTransform)_hiddenTransformForAnimation:(SEL)a3
{
  CGFloat MaxY;
  uint64_t v6;
  __int128 v7;
  CGRect v8;

  if (a4 == 2)
  {
    objc_msgSend(*(id *)&self[9].a, "frame");
    MaxY = CGRectGetMaxY(v8);
    return CGAffineTransformMakeTranslation(retstr, 0.0, -MaxY);
  }
  else
  {
    v6 = MEMORY[0x1E0C9BAA8];
    v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v7;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v6 + 32);
  }
  return self;
}

- (double)_hiddenAlphaForAnimation:(int64_t)a3
{
  double result;

  result = 0.0;
  if (a3 == 2)
    return 1.0;
  return result;
}

- (void)_setupDebugging
{
  SBMedusaSettings *v3;
  SBMedusaSettings *medusaSettings;

  +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
  v3 = (SBMedusaSettings *)objc_claimAutoreleasedReturnValue();
  medusaSettings = self->_medusaSettings;
  self->_medusaSettings = v3;

  -[PTSettings addKeyObserver:](self->_medusaSettings, "addKeyObserver:", self);
  self->_debugBackgroundColorEnabled = -[SBMedusaSettings statusBarDebugBackgroundColorsEnabled](self->_medusaSettings, "statusBarDebugBackgroundColorsEnabled");
  self->_debugOffsetEnabled = -[SBMedusaSettings statusBarDebugOffsettingEnabled](self->_medusaSettings, "statusBarDebugOffsettingEnabled");
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;

  v6 = a4;
  v7 = v6;
  if (self->_medusaSettings == a3)
  {
    v9 = v6;
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("statusBarDebugBackgroundColorsEnabled")))
    {
      self->_debugBackgroundColorEnabled = -[SBMedusaSettings statusBarDebugBackgroundColorsEnabled](self->_medusaSettings, "statusBarDebugBackgroundColorsEnabled");
      -[SBMainDisplaySceneLayoutStatusBarView _updateDebugBackgroundColor](self, "_updateDebugBackgroundColor");
LABEL_6:
      v7 = v9;
      goto LABEL_7;
    }
    v8 = objc_msgSend(v9, "isEqualToString:", CFSTR("statusBarDebugOffsettingEnabled"));
    v7 = v9;
    if (v8)
    {
      self->_debugOffsetEnabled = -[SBMedusaSettings statusBarDebugOffsettingEnabled](self->_medusaSettings, "statusBarDebugOffsettingEnabled");
      -[SBMainDisplaySceneLayoutStatusBarView _updateDebugOffset](self, "_updateDebugOffset");
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)_setDebugBackgroundColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_debugBackgroundColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_debugBackgroundColor, a3);
    -[SBMainDisplaySceneLayoutStatusBarView _updateDebugBackgroundColor](self, "_updateDebugBackgroundColor");
  }

}

- (void)_setDebugOffsetIndex:(unint64_t)a3
{
  if (self->_debugOffsetIndex != a3)
  {
    self->_debugOffsetIndex = a3;
    -[SBMainDisplaySceneLayoutStatusBarView _updateDebugOffset](self, "_updateDebugOffset");
  }
}

- (void)_updateDebugBackgroundColor
{
  UIColor *v3;
  UIColor *v4;

  if (self->_debugBackgroundColorEnabled)
    v3 = self->_debugBackgroundColor;
  else
    v3 = 0;
  v4 = v3;
  -[UIStatusBar setBackgroundColor:](self->_statusBar, "setBackgroundColor:", v3);

}

- (void)_updateDebugOffset
{
  UIStatusBar *statusBar;

  statusBar = self->_statusBar;
  -[SBMainDisplaySceneLayoutStatusBarView _statusBarFrameForOrientation:](self, "_statusBarFrameForOrientation:", -[UIStatusBar orientation](statusBar, "orientation"));
  -[UIStatusBar setFrame:](statusBar, "setFrame:");
}

- (void)setRealStyleDelegate:(id)a3
{
  id WeakRetained;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_realStyleDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_realStyleDelegate, obj);
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 2;
    else
      v5 = 0;
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xFFFD | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 4;
    else
      v6 = 0;
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xFFFB | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 8;
    else
      v7 = 0;
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xFFF7 | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 16;
    else
      v8 = 0;
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xFFEF | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 32;
    else
      v9 = 0;
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xFFDF | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 64;
    else
      v10 = 0;
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xFFBF | v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 128;
    else
      v11 = 0;
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xFF7F | v11;
  }

}

- (int64_t)statusBar:(id)a3 styleForRequestedStyle:(int64_t)a4 overrides:(unint64_t)a5
{
  UIStatusBarStyleDelegate_SpringBoardOnly **p_realStyleDelegate;
  id v9;
  id WeakRetained;
  int64_t v11;

  if ((*(_WORD *)&self->_conformanceFlags & 1) == 0)
    return a4;
  p_realStyleDelegate = &self->_realStyleDelegate;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_realStyleDelegate);
  v11 = objc_msgSend(WeakRetained, "statusBar:styleForRequestedStyle:overrides:", v9, a4, a5);

  return v11;
}

- (void)statusBar:(id)a3 willAnimateFromHeight:(double)a4 toHeight:(double)a5 duration:(double)a6 animation:(int)a7
{
  uint64_t v7;
  UIStatusBarStyleDelegate_SpringBoardOnly **p_realStyleDelegate;
  id v12;
  id WeakRetained;

  if ((*(_WORD *)&self->_conformanceFlags & 2) != 0)
  {
    v7 = *(_QWORD *)&a7;
    p_realStyleDelegate = &self->_realStyleDelegate;
    v12 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_realStyleDelegate);
    objc_msgSend(WeakRetained, "statusBar:willAnimateFromHeight:toHeight:duration:animation:", v12, v7, a4, a5, a6);

  }
}

- (void)statusBar:(id)a3 didAnimateFromHeight:(double)a4 toHeight:(double)a5 animation:(int)a6
{
  uint64_t v6;
  UIStatusBarStyleDelegate_SpringBoardOnly **p_realStyleDelegate;
  id v10;
  id WeakRetained;

  if ((*(_WORD *)&self->_conformanceFlags & 4) != 0)
  {
    v6 = *(_QWORD *)&a6;
    p_realStyleDelegate = &self->_realStyleDelegate;
    v10 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_realStyleDelegate);
    objc_msgSend(WeakRetained, "statusBar:didAnimateFromHeight:toHeight:animation:", v10, v6, a4, a5);

  }
}

- (id)statusBarSystemNavigationAction:(id)a3
{
  void *v3;
  UIStatusBarStyleDelegate_SpringBoardOnly **p_realStyleDelegate;
  id v5;
  id WeakRetained;

  if ((*(_WORD *)&self->_conformanceFlags & 8) != 0)
  {
    p_realStyleDelegate = &self->_realStyleDelegate;
    v5 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_realStyleDelegate);
    objc_msgSend(WeakRetained, "statusBarSystemNavigationAction:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)statusBar:(id)a3 didTriggerButtonType:(int64_t)a4 withAction:(int64_t)a5
{
  if ((*(_WORD *)&self->_conformanceFlags & 0x10) != 0)
    -[SBMainDisplaySceneLayoutStatusBarView statusBar:didTriggerButtonType:withAction:](self, "statusBar:didTriggerButtonType:withAction:", a3, a4, a5);
}

- (void)statusBar:(id)a3 didTriggerButtonType:(int64_t)a4 withAction:(int64_t)a5 context:(id)a6
{
  if ((*(_WORD *)&self->_conformanceFlags & 0x20) != 0)
    -[SBMainDisplaySceneLayoutStatusBarView statusBar:didTriggerButtonType:withAction:context:](self, "statusBar:didTriggerButtonType:withAction:context:", a3, a4, a5, a6);
}

- (unint64_t)statusBar:(id)a3 effectiveStyleOverridesForRequestedStyle:(int64_t)a4 overrides:(unint64_t)a5
{
  id v8;
  id WeakRetained;

  if ((*(_WORD *)&self->_conformanceFlags & 0x40) != 0)
  {
    v8 = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_realStyleDelegate);
    a5 = objc_msgSend(WeakRetained, "statusBar:effectiveStyleOverridesForRequestedStyle:overrides:", v8, a4, a5);

  }
  return a5 & ~-[SBMainDisplaySceneLayoutStatusBarView _effectiveStatusBarStyleOverridesToSuppress](self, "_effectiveStatusBarStyleOverridesToSuppress", a3, a4);
}

- (int64_t)overriddenRequestedStyleFromStyle:(int64_t)a3
{
  id WeakRetained;

  if ((*(_WORD *)&self->_conformanceFlags & 0x80) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_realStyleDelegate);
    a3 = objc_msgSend(WeakRetained, "overriddenRequestedStyleFromStyle:", a3);

  }
  return a3;
}

- (SBMainDisplaySceneLayoutStatusBarViewDataSource)dataSource
{
  return (SBMainDisplaySceneLayoutStatusBarViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (UIStatusBarStyleDelegate_SpringBoardOnly)realStyleDelegate
{
  return (UIStatusBarStyleDelegate_SpringBoardOnly *)objc_loadWeakRetained((id *)&self->_realStyleDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_realStyleDelegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_debugBackgroundColor, 0);
  objc_storeStrong((id *)&self->_medusaSettings, 0);
  objc_storeStrong((id *)&self->_showDebugGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scrollToTopGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_statusBarBreadcrumbSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_hitTestLayers, 0);
  objc_storeStrong((id *)&self->_partIdentifiersCustomStyles, 0);
  objc_storeStrong((id *)&self->_partIdentifiersDefaultStyles, 0);
  objc_storeStrong((id *)&self->_statusBarRequiringReasons, 0);
  objc_storeStrong((id *)&self->_statusBarUnderlyingViewAccessor, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_statusBarWrapperView, 0);
  objc_storeStrong((id *)&self->_statusBarContainerView, 0);
}

void __99__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarHidden_withAnimation_toSceneWithIdentifier___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)objc_opt_class();
  v6 = v5;
  NSStringFromBOOL();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  v12 = 2112;
  v13 = v7;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "(%@) %@ changing hidden to %@ for whole bar", (uint8_t *)&v8, 0x20u);

}

@end
