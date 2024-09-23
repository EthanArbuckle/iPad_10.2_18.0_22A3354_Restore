@implementation _UIToolbarVisualProviderModernIOS

- (BOOL)toolbarIsSmall
{
  void *v3;
  uint64_t v4;
  int v5;
  double v6;
  double v7;

  -[UIView traitCollection](self->super._toolbar, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = _UIUseMiniHeightInLandscape(1u);
  if (v5)
  {
    if (v4 == 5)
      v6 = 34.0;
    else
      v6 = 44.0;
    -[UIView bounds](self->super._toolbar, "bounds");
    LOBYTE(v5) = v7 < v6;
  }
  return v5;
}

- (CGSize)defaultSizeForOrientation:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;
  char v11;
  void *v12;
  double v13;
  UIToolbar *v14;
  double v15;
  double v16;
  CGSize result;

  if (_UIBarsUseNewPadHeights())
  {
    -[UIView _screen](self->super._toolbar, "_screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;

    -[UIView traitCollection](self->super._toolbar, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    if (v9 == 5)
      v10 = 38.0;
    else
      v10 = 50.0;
  }
  else
  {
    v11 = _UIUseMiniHeightInLandscape((unint64_t)(a3 - 3) < 2);
    -[UIView _screen](self->super._toolbar, "_screen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v7 = v13;

    if ((v11 & 1) != 0)
    {
      v10 = 32.0;
    }
    else
    {
      v14 = self->super._toolbar;
      if ((-[UIToolbar barPosition](v14, "barPosition") == 4
         || -[UIToolbar barPosition](v14, "barPosition") == 1 && _UIBackgroundExtensionForBar(v14) > 0.0)
        && !-[UIToolbar isMinibar](v14, "isMinibar"))
      {
        v10 = 49.0;
      }
      else
      {
        v10 = 44.0;
      }

    }
  }
  v15 = v7;
  v16 = v10;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)setBackgroundTransitionProgress:(double)a3
{
  double backgroundTransitionProgress;
  double v4;

  backgroundTransitionProgress = self->_backgroundTransitionProgress;
  v4 = fmax(fmin(a3, 1.0), 0.0);
  self->_backgroundTransitionProgress = v4;
  if (backgroundTransitionProgress != v4)
    -[_UIToolbarVisualProviderModernIOS updateAppearance](self, "updateAppearance");
}

- (void)updateBarBackgroundSize
{
  double v3;
  double v4;

  -[_UIToolbarVisualProviderModernIOS _backgroundFrame](self, "_backgroundFrame");
  -[UIView setSize:](self->_backgroundView, "setSize:", v3, v4);
}

- (void)_itemDidChangeWidth:(id)a3
{
  _UIToolbarContentView *contentView;
  id v4;

  contentView = self->_contentView;
  -[UIToolbar items](self->super._toolbar, "items", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIToolbarContentView reloadWithItems:](contentView, "reloadWithItems:", v4);

}

- (void)updateBarBackground
{
  _BOOL4 v3;
  _UIBarBackground *backgroundView;
  _UIBarBackground *v5;
  _UIBarBackground *v6;
  _UIBarBackground *v7;
  int64_t v8;
  _UIBarBackgroundLayout *backgroundViewLayout;
  _UIBarBackgroundLayout *v10;
  _BOOL4 useModernAppearance;
  double v12;

  v3 = -[UIView _canDrawContent](self->super._toolbar, "_canDrawContent");
  backgroundView = self->_backgroundView;
  if (v3)
  {
    -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
    return;
  }
  if (!backgroundView)
  {
    v5 = [_UIBarBackground alloc];
    -[_UIToolbarVisualProviderModernIOS _backgroundFrame](self, "_backgroundFrame");
    v6 = -[_UIBarBackground initWithFrame:](v5, "initWithFrame:");
    v7 = self->_backgroundView;
    self->_backgroundView = v6;

  }
  v8 = -[UIToolbar barPosition](self->super._toolbar, "barPosition");
  -[_UIBarBackground setTopAligned:](self->_backgroundView, "setTopAligned:", (v8 & 0xFFFFFFFFFFFFFFFELL) == 2);
  -[_UIBarBackground setCustomBackgroundView:](self->_backgroundView, "setCustomBackgroundView:", self->_customBackgroundView);
  if (self->_customBackgroundView)
  {
    backgroundViewLayout = self->_backgroundViewLayout;
    self->_backgroundViewLayout = 0;
LABEL_9:

    goto LABEL_10;
  }
  if (+[_UIBarBackgroundLayoutPrototyping prototypingEnabled](_UIBarBackgroundLayoutPrototyping, "prototypingEnabled"))
  {
    +[_UIBarBackgroundLayoutPrototyping prototypingLayoutForBarType:](_UIBarBackgroundLayoutPrototyping, "prototypingLayoutForBarType:", 2);
    v10 = (_UIBarBackgroundLayout *)objc_claimAutoreleasedReturnValue();
    backgroundViewLayout = self->_backgroundViewLayout;
    self->_backgroundViewLayout = v10;
    goto LABEL_9;
  }
  if (self->_useModernAppearance)
    -[_UIToolbarVisualProviderModernIOS _updateBackgroundModern](self, "_updateBackgroundModern");
  else
    -[_UIToolbarVisualProviderModernIOS _updateBackgroundLegacyForPosition:](self, "_updateBackgroundLegacyForPosition:", v8);
LABEL_10:
  -[_UIBarBackgroundLayout setDisableTinting:](self->_backgroundViewLayout, "setDisableTinting:", -[UIToolbar _disableBlurTinting](self->super._toolbar, "_disableBlurTinting"));
  useModernAppearance = self->_useModernAppearance;
  -[_UIToolbarVisualProviderModernIOS backgroundTransitionProgress](self, "backgroundTransitionProgress");
  if (useModernAppearance)
    -[_UIBarBackgroundLayout setBackgroundTransitionProgress:](self->_backgroundViewLayout, "setBackgroundTransitionProgress:");
  else
    -[_UIBarBackgroundLayout setBackgroundAlpha:](self->_backgroundViewLayout, "setBackgroundAlpha:", 1.0 - v12);
  -[_UIBarBackground setLayout:](self->_backgroundView, "setLayout:", self->_backgroundViewLayout);
  -[UIView insertSubview:atIndex:](self->super._toolbar, "insertSubview:atIndex:", self->_backgroundView, 0);
  -[_UIToolbarVisualProviderModernIOS updateBackgroundGroupName](self, "updateBackgroundGroupName");
  -[_UIToolbarVisualProviderModernIOS _backgroundFrame](self, "_backgroundFrame");
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  -[_UIBarBackground transitionBackgroundViews](self->_backgroundView, "transitionBackgroundViews");
}

- (CGRect)_backgroundFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  _UIBarBackgroundLayout *backgroundViewLayout;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[UIView bounds](self->super._toolbar, "bounds");
  v6 = v5;
  v8 = v7;
  if (-[UIToolbar barPosition](self->super._toolbar, "barPosition") == 3
    && (-[UIView traitCollection](self->super._toolbar, "traitCollection"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "userInterfaceIdiom"),
        v9,
        v10 != 3))
  {
    -[UIView window](self->super._toolbar, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    __UIStatusBarManagerForWindow(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "statusBarHeight");
    v16 = v15;

    v4 = v4 - v16;
    v8 = v8 + v16;
  }
  else
  {
    backgroundViewLayout = self->_backgroundViewLayout;
    if (backgroundViewLayout)
    {
      -[_UIBarBackgroundLayout topInset](backgroundViewLayout, "topInset");
      v4 = v4 - v12;
      v8 = v8 + v12;
    }
  }
  v17 = v8 + _UIBackgroundExtensionForBar(self->super._toolbar);
  v18 = v3;
  v19 = v4;
  v20 = v6;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (double)backgroundTransitionProgress
{
  return self->_backgroundTransitionProgress;
}

- (void)updateBackgroundGroupName
{
  void *v3;
  void *v4;
  id v5;

  -[UIView traitCollection](self->super._toolbar, "traitCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForTrait:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarBackground setGroupName:](self->_backgroundView, "setGroupName:", v4);

}

- (void)_updateBackgroundLegacyForPosition:(int64_t)a3
{
  _UIBarBackgroundLayout **p_backgroundViewLayout;
  _UIBarBackgroundLayoutLegacy *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  UIBarStyle v11;
  void *v12;
  BOOL v13;
  void *v14;
  unint64_t v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  char v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  uint64_t v32;
  double v33;
  _BOOL8 v34;
  void *v35;
  BOOL v36;
  char v37;

  p_backgroundViewLayout = &self->_backgroundViewLayout;
  v6 = self->_backgroundViewLayout;
  if (!v6)
  {
    v6 = objc_alloc_init(_UIBarBackgroundLayoutLegacy);
    objc_storeStrong((id *)p_backgroundViewLayout, v6);
  }
  -[UIView traitCollection](self->super._toolbar, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarBackgroundLayout setInterfaceIdiom:](*p_backgroundViewLayout, "setInterfaceIdiom:", objc_msgSend(v7, "userInterfaceIdiom"));

  -[UIView traitCollection](self->super._toolbar, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarBackgroundLayout setInterfaceStyle:](*p_backgroundViewLayout, "setInterfaceStyle:", objc_msgSend(v8, "userInterfaceStyle"));

  v9 = -[UIToolbar isTranslucent](self->super._toolbar, "isTranslucent");
  -[UIToolbar barTintColor](self->super._toolbar, "barTintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UIToolbar barStyle](self->super._toolbar, "barStyle");
  if (v11 == 4)
  {
    v12 = 0;
  }
  else
  {
    -[_UIToolbarVisualProviderModernIOS _currentCustomBackground](self, "_currentCustomBackground");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = -[UIToolbar _hidesShadow](self->super._toolbar, "_hidesShadow");
  -[UIToolbar backgroundEffects](self->super._toolbar, "backgroundEffects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = a3 & 0xFFFFFFFFFFFFFFFELL;
  v36 = v13;
  if (v14)
  {
    -[_UIBarBackgroundLayoutLegacy configureWithEffects:](v6, "configureWithEffects:", v14);
LABEL_8:
    v16 = 0;
    goto LABEL_9;
  }
  if (!v12)
  {
    -[UIView traitCollection](self->super._toolbar, "traitCollection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "userInterfaceIdiom");

    if (v32 == 3)
      -[_UIBarBackgroundLayoutLegacy configureAsTransparent](v6, "configureAsTransparent");
    else
      -[_UIBarBackgroundLayoutLegacy configureEffectForStyle:backgroundTintColor:forceOpaque:](v6, "configureEffectForStyle:backgroundTintColor:forceOpaque:", v11, v10, !v9);
    goto LABEL_8;
  }
  objc_msgSend(v12, "size");
  v21 = v20;
  objc_msgSend(v12, "capInsets");
  v16 = 0;
  if (a3 == 3 && v22 == 0.0 && v23 == 0.0)
  {
    v35 = v10;
    -[UIView window](self->super._toolbar, "window");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    __UIStatusBarManagerForWindow(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isStatusBarHidden");

    if ((v26 & 1) != 0)
    {
      v16 = 0;
    }
    else
    {
      -[UIView bounds](self->super._toolbar, "bounds");
      v16 = v21 == v33;
    }
    v10 = v35;
  }
  v37 = 0;
  objc_msgSend(v12, "_isInvisibleAndGetIsTranslucent:", &v37);
  if (v9)
  {
    -[_UIBarBackgroundLayoutLegacy configureImage:forceTranslucent:](v6, "configureImage:forceTranslucent:", v12, v37 == 0);
  }
  else
  {
    v34 = v37 != 0;
    if (v10)
      -[_UIBarBackgroundLayoutLegacy configureImage:forceOpaque:backgroundTintColor:](v6, "configureImage:forceOpaque:backgroundTintColor:", v12, v34, v10);
    else
      -[_UIBarBackgroundLayoutLegacy configureImage:forceOpaque:barStyle:](v6, "configureImage:forceOpaque:barStyle:", v12, v34, v11);
  }
LABEL_9:
  -[UIToolbar __appearanceStorage](self->super._toolbar, "__appearanceStorage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v15 == 2)
    objc_msgSend(v17, "topShadowImage");
  else
    objc_msgSend(v17, "shadowImage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[_UIBarBackgroundLayoutLegacy configureShadowImage:](v6, "configureShadowImage:", v19);
  }
  else if (v36)
  {
    -[_UIBarBackgroundLayoutLegacy configureWithoutShadow](v6, "configureWithoutShadow");
  }
  else
  {
    -[_UIBarBackgroundLayoutLegacy configureShadowForBarStyle:](v6, "configureShadowForBarStyle:", v11);
  }
  v27 = 0.0;
  if (v16)
  {
    -[UIView window](self->super._toolbar, "window");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    __UIStatusBarManagerForWindow(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "defaultStatusBarHeightInOrientation:", 1);
    v27 = v30;

  }
  -[_UIBarBackgroundLayoutLegacy setTopInset:](v6, "setTopInset:", v27);

}

- (id)_currentCustomBackground
{
  int64_t v3;
  void *v4;
  id v5;
  void *v7;
  _BOOL4 v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = -[UIToolbar _barPosition](self->super._toolbar, "_barPosition");
  -[UIToolbar __appearanceStorage](self->super._toolbar, "__appearanceStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundImageForBarPosition:barMetrics:", v3, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == 3 && v5 == 0)
    v3 = 2;
  if (!v5)
  {
    if (v3 == -[UIToolbar _barPosition](self->super._toolbar, "_barPosition"))
    {
      v5 = 0;
    }
    else
    {
      -[UIToolbar __appearanceStorage](self->super._toolbar, "__appearanceStorage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "backgroundImageForBarPosition:barMetrics:", v3, 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v8 = -[UIToolbar isMinibar](self->super._toolbar, "isMinibar");
  if (v5)
    v9 = !v8;
  else
    v9 = 1;
  if (!v9)
  {
    -[UIToolbar __appearanceStorage](self->super._toolbar, "__appearanceStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "backgroundImageForBarPosition:barMetrics:", -[UIToolbar _barPosition](self->super._toolbar, "_barPosition"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = v5;
      v5 = v11;
    }
    else
    {
      if (v3 == -[UIToolbar _barPosition](self->super._toolbar, "_barPosition"))
      {
LABEL_19:

        return v5;
      }
      -[UIToolbar __appearanceStorage](self->super._toolbar, "__appearanceStorage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v12, "backgroundImageForBarPosition:barMetrics:", v3, 1);
    }

    goto LABEL_19;
  }
  return v5;
}

- (void)_updateBackgroundModern
{
  _UIBarBackgroundLayout **p_backgroundViewLayout;
  void *v4;
  void *v5;
  _BOOL4 v6;
  UIToolbar *toolbar;
  UIToolbar *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _UIBarBackgroundLayoutModern *v20;

  p_backgroundViewLayout = &self->_backgroundViewLayout;
  v20 = self->_backgroundViewLayout;
  if (!v20)
  {
    v20 = objc_alloc_init(_UIBarBackgroundLayoutModern);
    objc_storeStrong((id *)p_backgroundViewLayout, v20);
  }
  -[UIView traitCollection](self->super._toolbar, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarBackgroundLayout setInterfaceIdiom:](v20, "setInterfaceIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));

  -[UIView traitCollection](self->super._toolbar, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarBackgroundLayout setInterfaceStyle:](v20, "setInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));

  LODWORD(v5) = _UIBarsApplyChromelessEverywhere();
  v6 = -[_UIToolbarVisualProviderModernIOS toolbarIsSmall](self, "toolbarIsSmall");
  toolbar = self->super._toolbar;
  if ((_DWORD)v5)
  {
    if (v6)
    {
      v8 = toolbar;
      -[UIToolbar compactAppearance](v8, "compactAppearance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        -[UIToolbar standardAppearance](v8, "standardAppearance");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = v11;

      objc_msgSend(v16, "_backgroundData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIToolbar compactScrollEdgeAppearance](self->super._toolbar, "compactScrollEdgeAppearance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v19 = v17;
      }
      else
      {
        -[UIToolbar scrollEdgeAppearance](self->super._toolbar, "scrollEdgeAppearance");
        v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      v14 = v19;

    }
    else
    {
      -[UIToolbar standardAppearance](toolbar, "standardAppearance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_backgroundData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIToolbar scrollEdgeAppearance](self->super._toolbar, "scrollEdgeAppearance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[_UIBarBackgroundLayoutModern setBackgroundData1:](v20, "setBackgroundData1:", v13);
    if (v14)
      objc_msgSend(v14, "_backgroundData");
    else
      +[_UIBarBackgroundAppearanceData transparentBackgroundData](_UIBarBackgroundAppearanceData, "transparentBackgroundData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBarBackgroundLayoutModern setBackgroundData2:](v20, "setBackgroundData2:", v15);

  }
  else
  {
    if (v6)
      -[UIToolbar compactAppearance](toolbar, "compactAppearance");
    else
      -[UIToolbar standardAppearance](toolbar, "standardAppearance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_backgroundData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBarBackgroundLayoutModern setBackgroundData1:](v20, "setBackgroundData1:", v15);
  }

}

- (void)prepare
{
  _QWORD v3[4];
  id v4;
  id location;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIToolbarVisualProviderModernIOS;
  -[_UIToolbarVisualProvider prepare](&v6, sel_prepare);
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44___UIToolbarVisualProviderModernIOS_prepare__block_invoke;
  v3[3] = &unk_1E16B6588;
  objc_copyWeak(&v4, &location);
  +[_UIBarBackgroundLayoutPrototyping registerPrototypingCallback:](_UIBarBackgroundLayoutPrototyping, "registerPrototypingCallback:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)updateBarForStyle:(int64_t)a3
{
  void *v5;
  id v6;

  -[UIToolbar barTintColor](self->super._toolbar, "barTintColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView _screen](self->super._toolbar, "_screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = _UIBarStyleWithTintColorIsTranslucentOnScreen(a3, (uint64_t)v6, v5);

  if ((a3 & 1) == 0)
    -[UIView setOpaque:](self->super._toolbar, "setOpaque:", -[UIToolbar isTranslucent](self->super._toolbar, "isTranslucent") ^ 1);

}

- (void)updateWithItems:(id)a3 fromOldItems:(id)a4 animate:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  _UIToolbarContentView *v9;
  _UIToolbarContentView *v10;
  _UIToolbarContentView *contentView;
  id v12;

  v5 = a5;
  v12 = a3;
  v8 = a4;
  if (!self->_contentView)
  {
    v9 = [_UIToolbarContentView alloc];
    -[UIView bounds](self->super._toolbar, "bounds");
    v10 = -[_UIBarContentView initWithFrame:](v9, "initWithFrame:");
    contentView = self->_contentView;
    self->_contentView = v10;

    _UIBarsSetAccessibilityLimits(self->_contentView);
    -[UIView addSubview:](self->super._toolbar, "addSubview:", self->_contentView);
  }
  -[_UIToolbarVisualProviderModernIOS _updateContentView](self, "_updateContentView");
  -[_UIToolbarVisualProviderModernIOS _setViewOwnersAndUpdateContentViewForItems:withOldItems:animated:](self, "_setViewOwnersAndUpdateContentViewForItems:withOldItems:animated:", v12, v8, v5);

}

- (void)updateAppearance
{
  -[_UIToolbarVisualProviderModernIOS updateBarBackground](self, "updateBarBackground");
  -[_UIToolbarVisualProviderModernIOS _updateContentView](self, "_updateContentView");
  -[_UIToolbarContentView updateContent](self->_contentView, "updateContent");
}

- (void)_updateContentView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL8 v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;

  if (self->_contentView)
  {
    -[UIView bounds](self->super._toolbar, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[_UIToolbarContentView setItemDistribution:](self->_contentView, "setItemDistribution:", self->_itemDistribution);
    -[_UIBarContentView setCenterTextButtons:](self->_contentView, "setCenterTextButtons:", -[UIToolbar centerTextButtons](self->super._toolbar, "centerTextButtons"));
    v11 = -[_UIToolbarVisualProviderModernIOS toolbarIsSmall](self, "toolbarIsSmall");
    -[_UIToolbarContentView setCompactMetrics:](self->_contentView, "setCompactMetrics:", v11);
    -[UIView window](self->super._toolbar, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "windowScene");
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if (v20)
      v13 = objc_msgSend(v20, "interfaceOrientation");
    else
      v13 = 1;
    -[_UIToolbarVisualProviderModernIOS defaultSizeForOrientation:](self, "defaultSizeForOrientation:", v13);
    if (v10 == v14)
    {
      -[_UIToolbarVisualProviderModernIOS contentViewMargins](self, "contentViewMargins");
      -[_UIToolbarContentView setPadding:](self->_contentView, "setPadding:");
    }
    if (!self->_useModernAppearance)
      goto LABEL_24;
    if (_UIBarsApplyChromelessEverywhere())
    {
      -[_UIToolbarVisualProviderModernIOS backgroundTransitionProgress](self, "backgroundTransitionProgress");
      if (v11)
      {
        if (v15 > 0.25)
        {
          -[UIToolbar compactScrollEdgeAppearance](self->super._toolbar, "compactScrollEdgeAppearance");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            goto LABEL_23;
          -[UIToolbar scrollEdgeAppearance](self->super._toolbar, "scrollEdgeAppearance");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            goto LABEL_23;
          v17 = 1;
          goto LABEL_17;
        }
LABEL_16:
        v17 = 0;
LABEL_17:
        -[UIToolbar compactAppearance](self->super._toolbar, "compactAppearance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          goto LABEL_23;
        if (!v17)
          goto LABEL_22;
LABEL_21:
        -[UIToolbar scrollEdgeAppearance](self->super._toolbar, "scrollEdgeAppearance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_22;
LABEL_23:
        objc_msgSend(v16, "_plainButtonAppearanceData");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIToolbarContentView setPlainItemAppearance:](self->_contentView, "setPlainItemAppearance:", v18);

        objc_msgSend(v16, "_doneButtonAppearanceData");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIToolbarContentView setDoneItemAppearance:](self->_contentView, "setDoneItemAppearance:", v19);

LABEL_24:
        -[UIView setFrame:](self->_contentView, "setFrame:", v4, v6, v8, v10);

        return;
      }
      if (v15 > 0.25)
        goto LABEL_21;
    }
    else if (v11)
    {
      goto LABEL_16;
    }
LABEL_22:
    -[UIToolbar standardAppearance](self->super._toolbar, "standardAppearance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
}

- (NSDirectionalEdgeInsets)contentViewMargins
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  UIToolbar *v7;
  double v8;
  double v9;
  double v10;
  NSDirectionalEdgeInsets result;

  -[UIView traitCollection](self->super._toolbar, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (_UIBarsUseNewPadHeights())
  {
    if (v4 == 5)
      v5 = 0.0;
    else
      v5 = 3.0;
    v6 = v5;
  }
  else
  {
    v7 = self->super._toolbar;
    if (-[UIToolbar barPosition](v7, "barPosition") != 4
      && (-[UIToolbar barPosition](v7, "barPosition") != 1 || _UIBackgroundExtensionForBar(v7) <= 0.0)
      || (v6 = 5.0, -[UIToolbar isMinibar](v7, "isMinibar")))
    {
      v6 = 0.0;
    }

    v5 = 0.0;
  }
  v8 = 0.0;
  v9 = 0.0;
  v10 = v6;
  result.trailing = v9;
  result.bottom = v5;
  result.leading = v8;
  result.top = v10;
  return result;
}

- (void)_setViewOwnersAndUpdateContentViewForItems:(id)a3 withOldItems:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v5 = a5;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v14, "isSystemItem") && objc_msgSend(v14, "systemItem") == 6)
          objc_msgSend(v14, "_setViewOwner:", self);
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }
  -[_UIToolbarContentView updateWithItems:fromOldItems:animate:](self->_contentView, "updateWithItems:fromOldItems:animate:", v8, v9, v5);

}

- (id)traitCollectionForChild:(id)a3 baseTraitCollection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v13;
  __CFString *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  __CFString *v20;
  uint64_t v21;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_useModernAppearance)
  {
    v9 = 0;
  }
  else
  {
    v10 = objc_msgSend(v7, "userInterfaceStyle");
    v11 = -[UIToolbar barStyle](self->super._toolbar, "barStyle") - 1;
    if (v10 == 2 || v11 >= 2)
      v9 = 0;
    else
      v9 = 2;
  }
  objc_msgSend(v8, "preferredContentSizeCategory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  if ((_UIBarsUseDynamicType() & 1) == 0 && v13)
  {
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("UICTContentSizeCategoryL")) & 1) != 0)
      v14 = 0;
    else
      v14 = CFSTR("UICTContentSizeCategoryL");
  }
  v15 = v8;
  v16 = v15;
  if (v9 || (v17 = v15, v14))
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __81___UIToolbarVisualProviderModernIOS_traitCollectionForChild_baseTraitCollection___block_invoke;
    v19[3] = &unk_1E16B7380;
    v21 = v9;
    v20 = v14;
    objc_msgSend(v16, "traitCollectionByModifyingTraits:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

- (void)setUseModernAppearance:(BOOL)a3
{
  _UIBarBackgroundLayout *backgroundViewLayout;
  id v7;

  if (!self->_useModernAppearance || a3)
  {
    if (!self->_useModernAppearance && a3)
    {
      self->_useModernAppearance = 1;
      backgroundViewLayout = self->_backgroundViewLayout;
      self->_backgroundViewLayout = 0;

      -[_UIToolbarVisualProviderModernIOS updateAppearance](self, "updateAppearance");
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIToolbarVisualProviderModernIOS.m"), 260, CFSTR("Downgrading modern appearance flag from YES to NO not supported"));

  }
}

- (void)setItemDistribution:(int64_t)a3
{
  self->_itemDistribution = a3;
  -[_UIToolbarContentView setItemDistribution:](self->_contentView, "setItemDistribution:");
}

- (void)setCustomBackgroundView:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_customBackgroundView, a3);
  v5 = a3;
  -[_UIBarBackground setCustomBackgroundView:](self->_backgroundView, "setCustomBackgroundView:", v5);

}

- (int64_t)itemDistribution
{
  return self->_itemDistribution;
}

- (id)currentBackgroundView
{
  _UIBarBackground *customBackgroundView;

  customBackgroundView = (_UIBarBackground *)self->_customBackgroundView;
  if (!customBackgroundView)
    customBackgroundView = self->_backgroundView;
  return customBackgroundView;
}

- (CGRect)backgroundFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIView frame](self->_backgroundView, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)useModernAppearance
{
  return self->_useModernAppearance;
}

- (void)updateArchivedSubviews:(id)a3
{
  objc_msgSend(a3, "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_customBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundViewLayout, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
