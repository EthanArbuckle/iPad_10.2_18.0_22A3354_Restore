@implementation _UISceneHostingView

- (Class)_intelligenceBaseClass
{
  sub_1856A4200();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _UISceneHostingView *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = self;
  _UISceneHostingView._intelligenceCollectContent(in:collector:)((uint64_t)v9, x, y, width, height);

}

- (void)_intelligenceCollectRemoteContentIn:(CGRect)a3 remoteContextWrapper:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _UISceneHostingController *v10;
  _UISceneHostingIntelligenceSupportHost *v11;
  _UISceneHostingView *v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v12 = self;
  v10 = -[_UISceneHostingView _sceneHostingController](v12, sel__sceneHostingController);
  v11 = -[_UISceneHostingController intelligenceHostSceneComponent](v10, sel_intelligenceHostSceneComponent);

  if (v11)
  {
    -[_UISceneHostingIntelligenceSupportHost collectRemoteContentInVisibleRect:withRemoteContextWrapper:](v11, sel_collectRemoteContentInVisibleRect_withRemoteContextWrapper_, v9, x, y, width, height);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (_UISceneHostingView)initWithSceneHostingController:(id)a3
{
  id v4;
  _UISceneHostingView *v5;
  _UISceneHostingView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISceneHostingView;
  v5 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_sceneHostingController, v4);
    -[UIView _addGeometryChangeObserver:](v6, v6);
  }

  return v6;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UISceneHostingView;
  -[UIView layoutSubviews](&v5, sel_layoutSubviews);
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[_UISceneHostingView requestSceneSettingsUpdateIfNecessary](self, "requestSceneSettingsUpdateIfNecessary");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHostingController);
  objc_msgSend(WeakRetained, "traitCollectionReceiver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTraitCollection:", v5);

}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UISceneHostingView;
  -[UIView willMoveToWindow:](&v9, sel_willMoveToWindow_, v4);
  if (objc_msgSend((id)UIApp, "_supportedOnLockScreen"))
    v5 = objc_msgSend((id)objc_opt_class(), "_isSecure");
  else
    v5 = 0;
  -[UIView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = (_QWORD *)MEMORY[0x1E0CD2FF8];
  if (!v5)
    v8 = (_QWORD *)MEMORY[0x1E0CD2FF0];
  objc_msgSend(v6, "setSecurityMode:", *v8);

}

- (id)description
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)_UISceneHostingView;
  -[UIView description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHostingController);
  v6 = WeakRetained;
  if (WeakRetained)
    v7 = (void *)*((_QWORD *)WeakRetained + 9);
  else
    v7 = 0;
  v8 = v7;
  objc_msgSend(v8, "identityToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ => hosting %@"), v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  unint64_t var0;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  int64_t var6;
  BOOL v19;
  BOOL v20;
  _BOOL4 v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGRect v26;
  CGRect v27;

  var0 = a3->var0;
  -[UIView _window](self, "_window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  if ((var0 & 0x1000) != 0)
  {
    -[UIView _window](self, "_window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "interfaceOrientation");

    var6 = a3->var6;
    v19 = (unint64_t)(v17 - 3) <= 1 && (unint64_t)(var6 - 3) < 2;
    v20 = (unint64_t)(var6 - 1) < 2;
    if ((unint64_t)(v17 - 1) > 1)
      v20 = v19;
    if (v20 || vabdd_f64(v13, v15) <= 2.22044605e-16)
      goto LABEL_13;
  }
  v21 = -[UIWindow isRotating](self->super._window, "isRotating");
  if (v21)
  {
    -[UIView frame](self, "frame");
    v27.origin.x = v22;
    v27.origin.y = v23;
    v27.size.width = v24;
    v27.size.height = v25;
    v26.origin.x = v9;
    v26.origin.y = v11;
    v26.size.width = v13;
    v26.size.height = v15;
    LOBYTE(v21) = CGRectEqualToRect(v26, v27);
  }
  if ((var0 & 0x36) != 0 && !v21)
LABEL_13:
    -[_UISceneHostingView requestSceneSettingsUpdateIfNecessary](self, "requestSceneSettingsUpdateIfNecessary");
}

- (void)setPresentedScene:(id)a3
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIScenePresenter *v11;
  UIScenePresenter *scenePresenter;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  int v22;
  UILabel *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  UILabel *debugLabel;
  UILabel *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[3];
  uint8_t buf[4];
  id v46;
  __int16 v47;
  _UISceneHostingView *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  _UISceneHostingView *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneHostingView.m"), 136, CFSTR("Can not set up _UISceneHostingView with a nil scene"));

  }
  v6 = setPresentedScene____s_category;
  if (!setPresentedScene____s_category)
  {
    v6 = __UILogCategoryGetNode("UISceneHosting", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v6, (unint64_t *)&setPresentedScene____s_category);
  }
  if ((*(_BYTE *)v6 & 1) != 0)
  {
    v19 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = v19;
      *(_DWORD *)buf = 138413058;
      v46 = (id)objc_opt_class();
      v47 = 2048;
      v48 = self;
      v49 = 2112;
      v50 = v5;
      v51 = 2112;
      v52 = self;
      v21 = v46;
      _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "[<%@;%p>] Presenting scene: %@ (self: %@)", buf, 0x2Au);

    }
  }
  objc_msgSend(v5, "uiPresentationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UISceneHostingScenePresenter-%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createPresenterWithIdentifier:", v10);
  v11 = (UIScenePresenter *)objc_claimAutoreleasedReturnValue();
  scenePresenter = self->_scenePresenter;
  self->_scenePresenter = v11;

  -[UIScenePresenter modifyPresentationContext:](self->_scenePresenter, "modifyPresentationContext:", &__block_literal_global_597);
  -[UIScenePresenter activate](self->_scenePresenter, "activate");
  -[UIScenePresenter presentationView](self->_scenePresenter, "presentationView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView frame](self, "frame");
  objc_msgSend(v13, "setFrame:");
  objc_msgSend(v13, "setAutoresizingMask:", 18);
  -[UIView setClipsToBounds:](self, "setClipsToBounds:", 1);
  -[UIView addSubview:](self, "addSubview:", v13);
  -[UIView sendSubviewToBack:](self, "sendSubviewToBack:", v13);
  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHostingController);
  objc_msgSend(WeakRetained, "traitCollectionReceiver");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTraitCollection:", v16);

  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v17 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    v22 = _UIInternalPreference_SceneHostingDebugOverlay;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_SceneHostingDebugOverlay)
    {
      while (v17 >= v22)
      {
        _UIInternalPreferenceSync(v17, &_UIInternalPreference_SceneHostingDebugOverlay, (uint64_t)CFSTR("SceneHostingDebugOverlay"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        v22 = _UIInternalPreference_SceneHostingDebugOverlay;
        if (v17 == _UIInternalPreference_SceneHostingDebugOverlay)
          goto LABEL_9;
      }
      if (byte_1EDDA837C && !self->_debugLabel)
      {
        v23 = objc_alloc_init(UILabel);
        -[UILabel setNumberOfLines:](v23, "setNumberOfLines:", 0);
        v24 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v5, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("Hosting: %@"), v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setText:](v23, "setText:", v26);

        -[UIView sizeToFit](v23, "sizeToFit");
        -[UIView addSubview:](self, "addSubview:", v23);
        -[UIView bringSubviewToFront:](self, "bringSubviewToFront:", v23);
        +[UIColor systemGreenColor](UIColor, "systemGreenColor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "colorWithAlphaComponent:", 0.8);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v23, "setBackgroundColor:", v28);

        debugLabel = self->_debugLabel;
        self->_debugLabel = v23;
        v30 = v23;

        -[UIView layer](self->_debugLabel, "layer");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setAllowsHitTesting:", 0);

        -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v38 = (void *)MEMORY[0x1E0D156E0];
        -[UIView leftAnchor](v30, "leftAnchor");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView leftAnchor](self, "leftAnchor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "constraintEqualToAnchor:", v42);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v44[0] = v41;
        -[UIView topAnchor](v30, "topAnchor");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "topAnchor");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "constraintEqualToAnchor:", v37);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v44[1] = v36;
        -[UIView rightAnchor](v30, "rightAnchor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView rightAnchor](self, "rightAnchor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "constraintLessThanOrEqualToAnchor:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v44[2] = v34;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "activateConstraints:", v35);

      }
    }
  }
LABEL_9:

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)_isHostingRemoteContent
{
  return 1;
}

- (void)requestSceneSettingsUpdateIfNecessary
{
  CGRect *p_currentSceneFrame;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  BOOL v14;
  void *v16;
  _BOOL4 currentShouldUseHostCornerRadius;
  void *v18;
  uint64_t v19;
  int64_t currentOrientation;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  UITraitCollection *v25;
  UITraitCollection *currentTraitCollection;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  UIColor *v31;
  UIColor *currentTintColor;
  void *v33;
  id WeakRetained;
  id v35;
  CGRect v36;

  p_currentSceneFrame = &self->_currentSceneFrame;
  -[_UISceneHostingView portraitSceneFrame](self, "portraitSceneFrame");
  v36.origin.x = v4;
  v36.origin.y = v5;
  v36.size.width = v6;
  v36.size.height = v7;
  if (CGRectEqualToRect(*p_currentSceneFrame, v36))
  {
    -[UIView traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", self->_currentTraitCollection))
    {
      -[UIView safeAreaInsets](self, "safeAreaInsets");
      v13 = v12 == self->_currentSafeAreaInsets.left && v9 == self->_currentSafeAreaInsets.top;
      v14 = v13 && v11 == self->_currentSafeAreaInsets.right;
      if (v14 && v10 == self->_currentSafeAreaInsets.bottom)
      {
        -[UIView tintColor](self, "tintColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "isEqual:", self->_currentTintColor))
        {
          currentShouldUseHostCornerRadius = self->_currentShouldUseHostCornerRadius;
          if (currentShouldUseHostCornerRadius == -[_UISceneHostingView _shouldUseHostCornerRadius](self, "_shouldUseHostCornerRadius"))
          {
            -[UIView _window](self, "_window");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "interfaceOrientation");
            currentOrientation = self->_currentOrientation;

            if (v19 == currentOrientation)
              return;
            goto LABEL_20;
          }
        }

      }
    }

  }
LABEL_20:
  -[_UISceneHostingView portraitSceneFrame](self, "portraitSceneFrame");
  p_currentSceneFrame->origin.x = v21;
  p_currentSceneFrame->origin.y = v22;
  p_currentSceneFrame->size.width = v23;
  p_currentSceneFrame->size.height = v24;
  -[UIView traitCollection](self, "traitCollection");
  v25 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  currentTraitCollection = self->_currentTraitCollection;
  self->_currentTraitCollection = v25;

  -[UIView safeAreaInsets](self, "safeAreaInsets");
  self->_currentSafeAreaInsets.top = v27;
  self->_currentSafeAreaInsets.left = v28;
  self->_currentSafeAreaInsets.bottom = v29;
  self->_currentSafeAreaInsets.right = v30;
  -[UIView tintColor](self, "tintColor");
  v31 = (UIColor *)objc_claimAutoreleasedReturnValue();
  currentTintColor = self->_currentTintColor;
  self->_currentTintColor = v31;

  self->_currentShouldUseHostCornerRadius = -[_UISceneHostingView _shouldUseHostCornerRadius](self, "_shouldUseHostCornerRadius");
  -[UIView _window](self, "_window");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  self->_currentOrientation = objc_msgSend(v33, "interfaceOrientation");

  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHostingController);
  if (WeakRetained)
  {
    v35 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSceneSettingsFromSettingsProvidersWithFence:", 1);
    WeakRetained = v35;
  }

}

- (BOOL)_shouldUseHostCornerRadius
{
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  char v27;

  -[UIView _window](self, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_windowHostingScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v4, "_coordinateSpace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v13, v6, v8, v10, v12);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    objc_msgSend(v4, "_coordinateSpace");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v27 = _UIRectEquivalentToRectWithAccuracy(v15, v17, v19, v21, v23, v24, v25, v26, 0.1);

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)_applyOverridesToHostedSceneSettings:(id)a3
{
  double v4;
  double v5;
  id v7;
  void *v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  -[_UISceneHostingView portraitSceneFrame](self, "portraitSceneFrame");
  if (v5 != *MEMORY[0x1E0C9D820] || v4 != *(double *)(MEMORY[0x1E0C9D820] + 8))
    objc_msgSend(v20, "setFrame:");
  if (objc_msgSend(v20, "isUISubclass"))
  {
    v7 = v20;
    objc_msgSend(v7, "setSafeAreaInsetsPortrait:", _UIPortraitSafeAreaInsetsForSceneHosting(self));
    -[UIView _window](self, "_window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "interfaceOrientation");

    if (!v9)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHostingController);
      v11 = WeakRetained;
      if (WeakRetained)
        v12 = (void *)*((_QWORD *)WeakRetained + 9);
      else
        v12 = 0;
      v13 = v12;
      objc_msgSend(v13, "settings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "interfaceOrientation");

      if (v15)
        goto LABEL_12;
      v9 = 1;
    }
    objc_msgSend(v7, "setInterfaceOrientation:", v9);
LABEL_12:
    objc_msgSend(v7, "setInterfaceOrientationMode:", 2);
    if (-[_UISceneHostingView _shouldUseHostCornerRadius](self, "_shouldUseHostCornerRadius"))
    {
      -[UIView _window](self, "_window");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "windowScene");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_effectiveUISettings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "cornerRadiusConfiguration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCornerRadiusConfiguration:", v19);

    }
    else
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01730]), "initWithCornerRadius:", 0.0);
      objc_msgSend(v7, "setCornerRadiusConfiguration:", v16);
    }

  }
}

- (UIScenePresenter)_scenePresenter
{
  return self->_scenePresenter;
}

- (_UISceneHostingController)_sceneHostingController
{
  return (_UISceneHostingController *)objc_loadWeakRetained((id *)&self->_sceneHostingController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sceneHostingController);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_currentTintColor, 0);
  objc_storeStrong((id *)&self->_currentTraitCollection, 0);
}

@end
