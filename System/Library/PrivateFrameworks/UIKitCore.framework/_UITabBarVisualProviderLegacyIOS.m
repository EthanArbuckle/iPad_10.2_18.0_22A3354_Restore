@implementation _UITabBarVisualProviderLegacyIOS

- (void)_configureItems:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int64_t style;
  BOOL v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[UITabBar _barMetrics](self->super._tabBar, "_barMetrics");
  v6 = -[UITabBar _imageStyle](self->super._tabBar, "_imageStyle");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "_barMetrics", (_QWORD)v16) != v5 || objc_msgSend(v12, "_imageStyle") != v6)
        {
          objc_msgSend(v12, "_setBarMetrics:", v5);
          objc_msgSend(v12, "_setImageStyle:", v6);
          objc_msgSend(v12, "_updateViewAndPositionItems:", 0);
        }
        -[UITabBarItem _tabBarButton]((id *)v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setSemanticContentAttribute:", -[UIView semanticContentAttribute](self->super._tabBar, "semanticContentAttribute"));
        objc_msgSend(v13, "setLayoutStyle:", self->_style);
        style = self->_style;
        if (style)
          v15 = style == 3;
        else
          v15 = 1;
        if (!v15)
          objc_msgSend(v13, "layoutIfNeeded");

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (CGSize)intrinsicContentSizeGivenSize:(CGSize)a3
{
  int64_t v4;
  uint64_t v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  CGSize result;

  v4 = -[UITabBar _barMetrics](self->super._tabBar, "_barMetrics", a3.width, a3.height);
  if (v4)
  {
    if (v4 == 1)
    {
      v5 = 0x4046000000000000;
    }
    else
    {
      if (v4 != 2)
      {
        v6 = -1.0;
        goto LABEL_16;
      }
      v5 = 0x404C000000000000;
    }
    v6 = *(double *)&v5;
  }
  else
  {
    if (_UIUseMiniHeightInLandscape((unint64_t)(-[UITabBar _expectedInterfaceOrientation](self->super._tabBar, "_expectedInterfaceOrientation")- 3) < 2)&& (dyld_program_sdk_at_least() & 1) != 0)
    {
      v6 = 32.0;
    }
    else
    {
      v6 = 49.0;
    }
    if (_UIBarsUseNewPadHeights())
      v6 = 50.0;
    -[UIView traitCollection](self->super._tabBar, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    if (v8 != 3)
      v6 = v6 + _UIBackgroundExtensionForBar(self->super._tabBar);
  }
LABEL_16:
  v9 = -1.0;
  v10 = v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)_updateBackgroundAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  char isKindOfClass;
  _UIBarBackgroundLayout *backgroundViewLayout;
  _UIBarBackgroundLayout *v16;
  _BOOL4 useModernAppearance;
  double v18;

  v3 = a3;
  -[UITabBar _setBackgroundNeedsUpdate:](self->super._tabBar, "_setBackgroundNeedsUpdate:", 0);
  if (-[UIView _canDrawContent](self->super._tabBar, "_canDrawContent"))
  {
    -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
    return;
  }
  -[UIView bounds](self->super._tabBar, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UITabBar delegate](self->super._tabBar, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    v12 = v12 + _UIBackgroundExtensionForBar(self->super._tabBar);
  if (self->_customBackgroundView)
  {
    backgroundViewLayout = self->_backgroundViewLayout;
    self->_backgroundViewLayout = 0;
LABEL_9:

    goto LABEL_10;
  }
  if (+[_UIBarBackgroundLayoutPrototyping prototypingEnabled](_UIBarBackgroundLayoutPrototyping, "prototypingEnabled"))
  {
    +[_UIBarBackgroundLayoutPrototyping prototypingLayoutForBarType:](_UIBarBackgroundLayoutPrototyping, "prototypingLayoutForBarType:", 3);
    v16 = (_UIBarBackgroundLayout *)objc_claimAutoreleasedReturnValue();
    backgroundViewLayout = self->_backgroundViewLayout;
    self->_backgroundViewLayout = v16;
    goto LABEL_9;
  }
  if (self->_useModernAppearance)
    -[_UITabBarVisualProviderLegacyIOS _updateBackgroundModern](self, "_updateBackgroundModern");
  else
    -[_UITabBarVisualProviderLegacyIOS _updateBackgroundLegacy](self, "_updateBackgroundLegacy");
LABEL_10:
  -[UIView insertSubview:atIndex:](self->super._tabBar, "insertSubview:atIndex:", self->_backgroundView, 0);
  -[_UIBarBackground setLayout:](self->_backgroundView, "setLayout:", self->_backgroundViewLayout);
  -[_UIBarBackground setCustomBackgroundView:](self->_backgroundView, "setCustomBackgroundView:", self->_customBackgroundView);
  -[_UIBarBackgroundLayout setDisableTinting:](self->_backgroundViewLayout, "setDisableTinting:", -[UITabBar _disableBlurTinting](self->super._tabBar, "_disableBlurTinting"));
  -[UIView setFrame:](self->_backgroundView, "setFrame:", v6, v8, v10, v12);
  useModernAppearance = self->_useModernAppearance;
  -[_UITabBarVisualProviderLegacyIOS backgroundTransitionProgress](self, "backgroundTransitionProgress");
  if (useModernAppearance)
    -[_UIBarBackgroundLayout setBackgroundTransitionProgress:](self->_backgroundViewLayout, "setBackgroundTransitionProgress:");
  else
    -[_UIBarBackgroundLayout setBackgroundAlpha:](self->_backgroundViewLayout, "setBackgroundAlpha:", 1.0 - v18);
  -[_UITabBarVisualProviderLegacyIOS updateBackgroundGroupName](self, "updateBackgroundGroupName");
  -[_UIBarBackground transitionBackgroundViewsAnimated:](self->_backgroundView, "transitionBackgroundViewsAnimated:", v3);
}

- (void)updateBackgroundGroupName
{
  void *v3;
  void *v4;
  id v5;

  -[UIView traitCollection](self->super._tabBar, "traitCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForTrait:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarBackground setGroupName:](self->_backgroundView, "setGroupName:", v4);

}

- (void)setBackgroundTransitionProgress:(double)a3 forceUpdate:(BOOL)a4 animated:(BOOL)a5
{
  self->_backgroundTransitionProgress = fmax(fmin(a3, 1.0), 0.0);
  -[_UITabBarVisualProviderLegacyIOS _updateBackgroundAnimated:](self, "_updateBackgroundAnimated:", a5);
}

- (double)backgroundTransitionProgress
{
  return self->_backgroundTransitionProgress;
}

- (void)setBackgroundTransitionProgress:(double)a3
{
  -[_UITabBarVisualProviderLegacyIOS setBackgroundTransitionProgress:forceUpdate:animated:](self, "setBackgroundTransitionProgress:forceUpdate:animated:", 0, 0, a3);
}

- (void)_updateBackgroundLegacy
{
  _UIBarBackgroundLayout **p_backgroundViewLayout;
  _UIBarBackgroundLayoutLegacy *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  UIBarStyle v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  void *v19;
  char v20;

  p_backgroundViewLayout = &self->_backgroundViewLayout;
  v4 = self->_backgroundViewLayout;
  if (!v4)
  {
    v4 = objc_alloc_init(_UIBarBackgroundLayoutLegacy);
    objc_storeStrong((id *)p_backgroundViewLayout, v4);
  }
  -[UIView traitCollection](self->super._tabBar, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarBackgroundLayout setInterfaceIdiom:](*p_backgroundViewLayout, "setInterfaceIdiom:", objc_msgSend(v5, "userInterfaceIdiom"));

  -[UIView traitCollection](self->super._tabBar, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarBackgroundLayout setInterfaceStyle:](*p_backgroundViewLayout, "setInterfaceStyle:", objc_msgSend(v6, "userInterfaceStyle"));

  v7 = -[UITabBar isTranslucent](self->super._tabBar, "isTranslucent");
  -[UITabBar _effectiveBarTintColor](self->super._tabBar, "_effectiveBarTintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBar backgroundImage](self->super._tabBar, "backgroundImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[UITabBar barStyle](self->super._tabBar, "barStyle");
  -[UITabBar backgroundEffects](self->super._tabBar, "backgroundEffects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[_UIBarBackgroundLayoutLegacy configureWithEffects:](v4, "configureWithEffects:", v11);
  }
  else if (v9)
  {
    objc_msgSend(v9, "size");
    v13 = v12;
    if ((objc_msgSend(v9, "_isResizable") & 1) == 0)
    {
      objc_msgSend(v9, "stretchableImageWithLeftCapWidth:topCapHeight:", 0, (uint64_t)(v13 + -1.0));
      v14 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v14;
    }
    v20 = 0;
    objc_msgSend(v9, "_isInvisibleAndGetIsTranslucent:", &v20);
    if (v7)
    {
      -[_UIBarBackgroundLayoutLegacy configureImage:forceTranslucent:](v4, "configureImage:forceTranslucent:", v9, v20 == 0);
    }
    else
    {
      v17 = v20 != 0;
      if (v8)
        -[_UIBarBackgroundLayoutLegacy configureImage:forceOpaque:backgroundTintColor:](v4, "configureImage:forceOpaque:backgroundTintColor:", v9, v17, v8);
      else
        -[_UIBarBackgroundLayoutLegacy configureImage:forceOpaque:barStyle:](v4, "configureImage:forceOpaque:barStyle:", v9, v17, v10);
    }
    -[UITabBar shadowImage](self->super._tabBar, "shadowImage");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      -[_UIBarBackgroundLayoutLegacy configureShadowImage:](v4, "configureShadowImage:", v18);

      goto LABEL_6;
    }
  }
  else
  {
    -[UIView _screen](self->super._tabBar, "_screen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "_userInterfaceIdiom");

    if (v16 == 3)
      -[_UIBarBackgroundLayoutLegacy configureAsTransparent](v4, "configureAsTransparent");
    else
      -[_UIBarBackgroundLayoutLegacy configureEffectForStyle:backgroundTintColor:forceOpaque:](v4, "configureEffectForStyle:backgroundTintColor:forceOpaque:", v10, v8, !v7);
    v9 = 0;
  }
  -[_UIBarBackgroundLayoutLegacy configureShadowForBarStyle:](v4, "configureShadowForBarStyle:", v10);
LABEL_6:

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
  void *v14;
  __CFString *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  __CFString *v21;
  uint64_t v22;

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
    v11 = -[UITabBar barStyle](self->super._tabBar, "barStyle") - 1;
    if (v10 == 2 || v11 >= 2)
      v9 = 0;
    else
      v9 = 2;
  }
  objc_msgSend(v8, "preferredContentSizeCategory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 && (objc_msgSend(v13, "isEqualToString:", CFSTR("UICTContentSizeCategoryL")) & 1) == 0)
    v15 = CFSTR("UICTContentSizeCategoryL");
  else
    v15 = 0;
  v16 = v8;
  v17 = v16;
  if (v9 || (v18 = v16, v15))
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __80___UITabBarVisualProviderLegacyIOS_traitCollectionForChild_baseTraitCollection___block_invoke;
    v20[3] = &unk_1E16B7380;
    v22 = v9;
    v21 = v15;
    objc_msgSend(v17, "traitCollectionByModifyingTraits:", v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

- (id)createViewForTabBarItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  UITabBarButton *v9;
  void *v10;
  void *v11;
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
  double v22;
  double v23;
  double v24;
  double v25;
  UITabBarButton *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;

  v5 = a3;
  if (!objc_msgSend(v5, "_imageStyle"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITabBarVisualProviderLegacyIOS.m"), 272, CFSTR("A default style should never be returned at this point"));

  }
  -[UITabBar _appearanceStorage](self->super._tabBar, "_appearanceStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedImageTintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isSystemItem") & 1) != 0)
    objc_msgSend(v5, "_internalTitle");
  else
    objc_msgSend(v5, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [UITabBarButton alloc];
  objc_msgSend(v5, "unselectedImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_internalLandscapeTemplateImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_internalLandscapeSelectedImagePhone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageInsets");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(v5, "landscapeImagePhoneInsets");
  v26 = -[UITabBarButton initWithImage:landscapeImage:selectedImage:landscapeSelectedImage:label:withInsets:landscapeInsets:tabBar:](v9, "initWithImage:landscapeImage:selectedImage:landscapeSelectedImage:label:withInsets:landscapeInsets:tabBar:", v10, v11, v12, v13, v8, self->super._tabBar, v15, v17, v19, v21, v22, v23, v24, v25);

  objc_msgSend(v5, "badgeOffset");
  -[UITabBarButton _setBadgeOffset:](v26, "_setBadgeOffset:");
  if (objc_msgSend(v5, "isSpringLoaded"))
    -[UITabBarButton setSpringLoaded:](v26, "setSpringLoaded:", 1);

  -[UITabBarButton _setAppearanceGuideClass:](v26, "_setAppearanceGuideClass:", objc_opt_class());
  -[UIView frame](v26, "frame");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  -[UIView bounds](self->super._tabBar, "bounds");
  -[UIView setFrame:](v26, "setFrame:", v28, v30, v32);
  objc_msgSend(v5, "_appearanceStorage");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(v5, &_UIAppearanceCustomizedSelectorsAssociationKey);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBarButton _applyTabBarButtonAppearanceStorage:withTaggedSelectors:](v26, "_applyTabBarButtonAppearanceStorage:withTaggedSelectors:", v33, v34);

  -[UITabBar _appearanceStorage](self->super._tabBar, "_appearanceStorage");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "selectionIndicatorImage");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
    -[UITabBarButton _setCustomSelectedIndicatorImage:](v26, "_setCustomSelectedIndicatorImage:", v36);
  -[UIControl addTarget:action:forControlEvents:](v26, "addTarget:action:forControlEvents:", self->super._tabBar, sel__buttonDown_, 1);
  -[UIControl addTarget:action:forControlEvents:](v26, "addTarget:action:forControlEvents:", self->super._tabBar, sel__buttonUp_, 64);
  -[UIControl addTarget:action:forControlEvents:](v26, "addTarget:action:forControlEvents:", self->super._tabBar, sel__buttonCancel_, 256);
  -[UIControl addTarget:action:forControlEvents:](v26, "addTarget:action:forControlEvents:", self->super._tabBar, sel__sendAction_withEvent_, 0x40000000);
  -[UIControl addTarget:action:forControlEvents:](v26, "addTarget:action:forControlEvents:", self->super._tabBar, sel__sendAction_withEvent_, 0x2000);
  -[UITabBarButton setEnabled:](v26, "setEnabled:", objc_msgSend(v5, "isEnabled"));
  -[UITabBarButton _setShowsHighlightedState:](v26, "_setShowsHighlightedState:", -[UITabBar _showsHighlightedState](self->super._tabBar, "_showsHighlightedState"));
  objc_msgSend(v5, "badgeValue");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
    -[UITabBarButton _setBadgeValue:](v26, "_setBadgeValue:", v37);
  -[UITabBarButton setSemanticContentAttribute:](v26, "setSemanticContentAttribute:", -[UIView semanticContentAttribute](self->super._tabBar, "semanticContentAttribute"));

  return v26;
}

- (void)_layoutTabBarItems
{
  void *v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  UITabBarItemPositioning v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  int64_t style;
  unint64_t v35;
  BOOL v36;
  _BOOL4 v37;
  _BOOL4 v38;
  BOOL v39;
  double v40;
  _BOOL4 v41;
  double v42;
  double v43;
  BOOL v44;
  BOOL v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  unint64_t v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  id v62;
  _UITabBarVisualProviderLegacyIOS *v63;
  uint64_t *v64;
  _QWORD *v65;
  _QWORD *v66;
  double v67;
  uint64_t v68;
  double v69;
  double v70;
  BOOL v71;
  BOOL v72;
  BOOL v73;
  _QWORD v74[4];
  _QWORD v75[3];
  int v76;
  uint64_t v77;
  double *v78;
  uint64_t v79;
  uint64_t v80;

  -[UITabBar items](self->super._tabBar, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    if (!self->_useModernAppearance)
    {
      -[UITabBar selectionIndicatorImage](self->super._tabBar, "selectionIndicatorImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[UITabBar itemPositioning](self->super._tabBar, "itemPositioning");
      -[UITabBar itemWidth](self->super._tabBar, "itemWidth");
      v11 = v10;
      -[UITabBar itemSpacing](self->super._tabBar, "itemSpacing");
      v13 = v12;
      if (!dyld_program_sdk_at_least() || self->_style == 3)
      {
        v57 = 0;
        v58 = 0;
        v55 = 0;
LABEL_24:
        -[_UITabBarVisualProviderLegacyIOS _layoutRegion](self, "_layoutRegion");
        v25 = v24;
        v27 = v26;
        v29 = v28;
        v30 = 0.0;
        if (v8 && (objc_msgSend(v8, "_isResizable") & 1) == 0)
        {
          objc_msgSend(v8, "size");
          v30 = v31;
        }
        v56 = v8;
        -[UIView traitCollection](self->super._tabBar, "traitCollection");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v3;
        v33 = objc_msgSend(v3, "count");
        style = self->_style;
        v35 = style - 1;
        v36 = (unint64_t)(style - 1) < 2;
        v37 = 0;
        v38 = objc_msgSend(v32, "horizontalSizeClass") == 2;
        v39 = style == 3;
        if (style == 3)
          v38 = 0;
        if (v9 == UITabBarItemPositioningAutomatic && v38 && v30 > 0.0)
        {
          v40 = v30 * (double)v33;
          v37 = v40 <= v27 && v40 > v27 - (double)(10 * v33);
        }
        if (v9 == UITabBarItemPositioningFill
          || v37
          || !v38
          || v27 <= (double)(110 * v33 - 30)
          || objc_msgSend(v32, "userInterfaceIdiom") != 1)
        {
          if (v9 == UITabBarItemPositioningCentered)
          {
            v42 = 80.0;
            if (v11 > 0.0)
              v42 = v11;
            v43 = 30.0;
            if (v13 > 0.0)
              v43 = v13;
            v41 = v42 * (double)v33 + v43 * (double)(v33 - 1) < v27;
          }
          else
          {
            v41 = 0;
          }
        }
        else
        {
          v41 = 1;
        }
        v44 = v11 > 0.0;
        v45 = v11 > 0.0 && v41;
        v77 = 0;
        v78 = (double *)&v77;
        v79 = 0x2020000000;
        v80 = 0;
        v75[0] = 0;
        v75[1] = v75;
        v75[2] = 0x2020000000;
        v76 = 0;
        if (!self->_accessoryView)
          v25 = 0.0;
        -[_UITabBarVisualProviderLegacyIOS _configureItems:](self, "_configureItems:", v59);
        if (v35 > 1)
        {
          v50 = (void *)v57;
          if (v37)
          {
            v78[3] = v30;
            v46 = round((v27 - v30 * (double)v33) / (double)v33);
            v25 = floor(v46 * 0.5) + v25;
          }
          else
          {
            if (v41)
            {
              v51 = 80.0;
              if (v11 > 0.0)
                v51 = v11;
              v78[3] = v51;
              if (v13 <= 0.0)
                v46 = 30.0;
              else
                v46 = v13;
              v25 = round(v27 * 0.5 - (v51 * (double)v33 + v46 * (double)(v33 - 1)) * 0.5) + v25;
              v49 = 0.0;
              v45 = v44;
              goto LABEL_66;
            }
            v45 = 0;
            v78[3] = v27 / (double)v33;
            v46 = 0.0;
          }
          v49 = 0.0;
        }
        else
        {
          v46 = 0.0;
          -[UITabBar _totalDimensionForItems:spacing:dimension:scaleFactor:](self->super._tabBar, "_totalDimensionForItems:spacing:dimension:scaleFactor:", v59, 0.0, v78[3], 1.0);
          v48 = v27 - v47;
          v49 = round((v27 - v47) / (double)(v33 + 1));
          v25 = v25 + floor((v48 - v49 * (double)v33) * 0.5);
          v50 = (void *)v57;
        }
LABEL_66:
        v74[0] = 0;
        v74[1] = v74;
        v74[2] = 0x2020000000;
        *(double *)&v74[3] = v25;
        v52 = ((unint64_t)*((unsigned int *)&self->super._tabBar->super._viewFlags + 4) >> 18) & 2;
        v60[0] = MEMORY[0x1E0C809B0];
        v60[1] = 3221225472;
        v60[2] = __54___UITabBarVisualProviderLegacyIOS__layoutTabBarItems__block_invoke;
        v60[3] = &unk_1E16B7358;
        v71 = v36;
        v64 = &v77;
        v67 = v49;
        v53 = v50;
        v61 = v53;
        v54 = v58;
        v68 = v29;
        v69 = v46;
        v70 = v25;
        v65 = v74;
        v66 = v75;
        v72 = v39;
        v73 = v45;
        v62 = v54;
        v63 = self;
        v3 = v59;
        objc_msgSend(v59, "enumerateObjectsWithOptions:usingBlock:", v52, v60);

        _Block_object_dispose(v74, 8);
        _Block_object_dispose(v75, 8);
        _Block_object_dispose(&v77, 8);

        goto LABEL_67;
      }
      -[UITabBar barTintColor](self->super._tabBar, "barTintColor");
      v7 = objc_claimAutoreleasedReturnValue();
      -[UITabBar unselectedItemTintColor](self->super._tabBar, "unselectedItemTintColor");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v7 | v14)
      {
        v20 = (void *)v14;
        v57 = 0;
        v58 = 0;
        v55 = 0;
        goto LABEL_23;
      }
      if (-[UITabBar barStyle](self->super._tabBar, "barStyle") == UIBarStyleBlack)
        v15 = 20;
      else
        v15 = 10;
      +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIVibrancyEffect effectForBlurEffect:style:](UIVibrancyEffect, "effectForBlurEffect:style:", v23, 4);
      v57 = 0;
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      v7 = 0;
      v55 = 0;
      goto LABEL_22;
    }
    if (_UIBarsApplyChromelessEverywhere())
    {
      -[_UITabBarVisualProviderLegacyIOS backgroundTransitionProgress](self, "backgroundTransitionProgress");
      if (v4 > 0.5)
      {
        -[UITabBar selectedItem](self->super._tabBar, "selectedItem");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "scrollEdgeAppearance");
        v6 = objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          v7 = v6;
LABEL_18:

          goto LABEL_19;
        }
        -[UITabBar scrollEdgeAppearance](self->super._tabBar, "scrollEdgeAppearance");
        v7 = objc_claimAutoreleasedReturnValue();

        if (v7)
        {
LABEL_19:
          objc_msgSend((id)v7, "_tabLayoutAppearanceData");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "selectionIndicatorTintColor");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "selectionIndicatorImage");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v20, "itemPositioning");
          objc_msgSend(v20, "itemWidth");
          v11 = v21;
          objc_msgSend(v20, "itemSpacing");
          v13 = v22;
          objc_msgSend((id)v7, "_dataForItemStyle:", self->_style);
          v57 = objc_claimAutoreleasedReturnValue();
          if (self->_style == 3)
          {
            v58 = 0;
LABEL_23:

            goto LABEL_24;
          }
          objc_msgSend((id)v7, "_backgroundData");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "tabBarVibrancyEffect");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

          goto LABEL_23;
        }
      }
    }
    v16 = v3;
    -[UITabBar selectedItem](self->super._tabBar, "selectedItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "standardAppearance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      -[UITabBar standardAppearance](self->super._tabBar, "standardAppearance");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = (uint64_t)v19;

    v3 = v16;
    goto LABEL_18;
  }
LABEL_67:

}

- (CGRect)_layoutRegion
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *accessoryView;
  double v12;
  UITabBar *tabBar;
  double v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  -[UIView bounds](self->super._tabBar, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  accessoryView = self->_accessoryView;
  if (accessoryView)
  {
    -[UIView frame](accessoryView, "frame");
    v8 = v8 - v12;
    tabBar = self->super._tabBar;
    v14 = -0.0;
    if ((*((_DWORD *)&tabBar->super._viewFlags + 4) & 0x80000) != 0)
      v14 = v12;
    v4 = v4 + v14;
  }
  else
  {
    tabBar = self->super._tabBar;
  }
  -[UIView traitCollection](tabBar, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  if (v16 != 3)
  {
    -[UIView safeAreaInsets](self->super._tabBar, "safeAreaInsets");
    v18 = v17;
    if (v17 != 0.0)
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "userInterfaceIdiom");

      if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v18 = _UIBackgroundExtensionForBar(self->super._tabBar);
    }
    v10 = v10 - v18;
  }
  v21 = v4;
  v22 = v6;
  v23 = v8;
  v24 = v10;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)_updateAppearanceForTransitionFromItem:(id)a3 toItem:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  char v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  char v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  id v49;
  id v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_useModernAppearance)
  {
    -[UITabBar standardAppearance](self->super._tabBar, "standardAppearance");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "standardAppearance");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = (void *)v8;
    v12 = v11;

    objc_msgSend(v7, "standardAppearance");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v51 = (void *)v8;
    if (v13)
      v15 = (void *)v13;
    else
      v15 = (void *)v8;
    v16 = v15;

    objc_msgSend(v12, "_backgroundData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_backgroundData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v17;
    v20 = v18;
    v49 = v7;
    v50 = v6;
    if (v19 == v20)
    {

      goto LABEL_25;
    }
    v21 = v20;
    if (v19 && v20)
    {
      v22 = objc_msgSend(v19, "isEqual:", v20);

      if ((v22 & 1) != 0)
        goto LABEL_25;
    }
    else
    {

    }
    if (!-[UITabBar _suspendBackgroundUpdates](self->super._tabBar, "_suspendBackgroundUpdates"))
      -[_UITabBarVisualProviderLegacyIOS _updateBackgroundAnimated:](self, "_updateBackgroundAnimated:", 0);
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    -[UITabBar items](self->super._tabBar, "items");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v57 != v26)
            objc_enumerationMutation(v23);
          -[UITabBarItem _tabBarButton](*(id **)(*((_QWORD *)&v56 + 1) + 8 * i));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "_backgroundData");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "tabBarVibrancyEffect");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setItemVibrantEffect:", v30);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      }
      while (v25);
    }

    v7 = v49;
    v6 = v50;
LABEL_25:
    objc_msgSend(v12, "_tabLayoutAppearanceData");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_tabLayoutAppearanceData");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v31;
    v34 = v32;
    if (v33 == v34)
    {

      goto LABEL_33;
    }
    v35 = v34;
    if (v33 && v34)
    {
      v36 = objc_msgSend(v33, "isEqual:", v34);

      if ((v36 & 1) != 0)
      {
LABEL_33:
        objc_msgSend(v12, "_dataForItemStyle:", self->_style);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_dataForItemStyle:", self->_style);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v37;
        v40 = v38;
        v41 = v40;
        if (v39 != v40)
        {
          if (v39 && v40)
          {
            v42 = objc_msgSend(v39, "isEqual:", v40);

            if ((v42 & 1) != 0)
              goto LABEL_48;
          }
          else
          {

          }
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          -[UITabBar items](self->super._tabBar, "items");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
          if (v44)
          {
            v45 = v44;
            v46 = *(_QWORD *)v53;
            do
            {
              for (j = 0; j != v45; ++j)
              {
                if (*(_QWORD *)v53 != v46)
                  objc_enumerationMutation(v43);
                -[UITabBarItem _tabBarButton](*(id **)(*((_QWORD *)&v52 + 1) + 8 * j));
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "setItemAppearanceData:", v41);

              }
              v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
            }
            while (v45);
          }

          -[UIView setNeedsLayout](self->super._tabBar, "setNeedsLayout");
          v7 = v49;
          v6 = v50;
          goto LABEL_48;
        }

LABEL_48:
        goto LABEL_49;
      }
    }
    else
    {

    }
    -[UIView setNeedsLayout](self->super._tabBar, "setNeedsLayout");
    goto LABEL_33;
  }
LABEL_49:

}

- (void)_shim_updateTabBarItemView:(id)a3
{
  id *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  UITabBar *tabBar;
  id v10;

  v4 = (id *)a3;
  -[UITabBarItem _tabBarButton](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFocused");

  if (v6)
    -[UIView setNeedsFocusUpdate](self->super._tabBar, "setNeedsFocusUpdate");
  -[UITabBarItem _tabBarButton](v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  -[_UITabBarVisualProviderLegacyIOS createViewForTabBarItem:](self, "createViewForTabBarItem:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBarItem _setTabBarButton:]((uint64_t)v4, v8);

  tabBar = self->super._tabBar;
  -[UITabBarItem _tabBarButton](v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[UIView addSubview:](tabBar, "addSubview:", v10);
}

- (void)changeSelectedItem:(id)a3 fromItem:(id)a4
{
  id *v6;
  void *v7;
  void *v8;
  id *v9;

  v6 = (id *)a4;
  v9 = (id *)a3;
  -[UITabBarItem _tabBarButton](v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_showSelectedIndicator:changeSelection:", 0, 1);

  -[UITabBarItem _tabBarButton](v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_showSelectedIndicator:changeSelection:", 1, 1);

  -[_UITabBarVisualProviderLegacyIOS _updateAppearanceForTransitionFromItem:toItem:](self, "_updateAppearanceForTransitionFromItem:toItem:", v6, v9);
}

- (void)changeItemsTo:(id)a3 removingItems:(id)a4 selectedItem:(id)a5 oldSelectedItem:(id)a6 animate:(BOOL)a7
{
  id v11;
  id v12;
  int64_t v13;
  int64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  uint64_t v27;
  double v28;
  double v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  id v39;
  id v40;
  id obj;
  _BOOL4 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _UITabBarVisualProviderLegacyIOS *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v42 = a7;
  v59 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v40 = a4;
  v12 = a5;
  v39 = a6;
  v13 = -[UITabBar _barMetrics](self->super._tabBar, "_barMetrics");
  v14 = -[UITabBar _imageStyle](self->super._tabBar, "_imageStyle");
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v15 = v11;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v54;
    obj = v15;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        v20 = v12;
        if (*(_QWORD *)v54 != v18)
          objc_enumerationMutation(obj);
        v21 = *(id *)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v21, "_setBarMetrics:", v13);
        objc_msgSend(v21, "_setImageStyle:", v14);
        -[UITabBarItem _tabBarButton]((id *)v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22 && -[UIView containsView:](self->super._tabBar, "containsView:", v22))
        {
          v23 = v22;
        }
        else
        {
          objc_msgSend(v22, "removeFromSuperview");
          -[_UITabBarVisualProviderLegacyIOS createViewForTabBarItem:](self, "createViewForTabBarItem:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          -[UIView addSubview:](self->super._tabBar, "addSubview:", v23);
          -[UITabBarItem _setTabBarButton:]((uint64_t)v21, v23);
          if (v42)
            objc_msgSend(v23, "setAlpha:", 0.0);
        }
        -[UITabBarItem _tabBarButton]((id *)v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        v26 = v21 == v20;
        v12 = v20;
        v27 = v26;
        objc_msgSend(v24, "_showSelectedIndicator:changeSelection:", v27, 1);

      }
      v15 = obj;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v17);
  }

  if (v42)
  {
    -[_UITabBarVisualProvider defaultAnimationDuration](self, "defaultAnimationDuration");
    v29 = v28;
    v30 = MEMORY[0x1E0C809B0];
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __101___UITabBarVisualProviderLegacyIOS_changeItemsTo_removingItems_selectedItem_oldSelectedItem_animate___block_invoke;
    v49[3] = &unk_1E16B47A8;
    v31 = v40;
    v50 = v40;
    v51 = self;
    v52 = v15;
    v47[0] = v30;
    v47[1] = 3221225472;
    v47[2] = __101___UITabBarVisualProviderLegacyIOS_changeItemsTo_removingItems_selectedItem_oldSelectedItem_animate___block_invoke_2;
    v47[3] = &unk_1E16B3FD8;
    v48 = v50;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v49, v47, v29);

  }
  else
  {
    v32 = v15;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v31 = v40;
    v33 = v40;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v44 != v36)
            objc_enumerationMutation(v33);
          -[UITabBarItem _tabBarButton](*(id **)(*((_QWORD *)&v43 + 1) + 8 * j));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "removeFromSuperview");

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
      }
      while (v35);
    }

    -[UIView setNeedsLayout](self->super._tabBar, "setNeedsLayout");
    v15 = v32;
  }
  if (v12 != v39)
    -[_UITabBarVisualProviderLegacyIOS _updateAppearanceForTransitionFromItem:toItem:](self, "_updateAppearanceForTransitionFromItem:toItem:", v39, v12);

}

- (void)_updateBackgroundModern
{
  _UIBarBackgroundLayout **p_backgroundViewLayout;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _UIBarBackgroundLayoutModern *v16;

  p_backgroundViewLayout = &self->_backgroundViewLayout;
  v16 = self->_backgroundViewLayout;
  if (!v16)
  {
    v16 = objc_alloc_init(_UIBarBackgroundLayoutModern);
    objc_storeStrong((id *)p_backgroundViewLayout, v16);
  }
  -[UIView traitCollection](self->super._tabBar, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarBackgroundLayout setInterfaceIdiom:](v16, "setInterfaceIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));

  -[UIView traitCollection](self->super._tabBar, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarBackgroundLayout setInterfaceStyle:](v16, "setInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));

  LODWORD(v5) = _UIBarsApplyChromelessEverywhere();
  -[UITabBar selectedItem](self->super._tabBar, "selectedItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "standardAppearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((_DWORD)v5)
  {
    if (v7)
    {
      objc_msgSend(v7, "_backgroundData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UITabBar standardAppearance](self->super._tabBar, "standardAppearance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_backgroundData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[UITabBar selectedItem](self->super._tabBar, "selectedItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scrollEdgeAppearance");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;

    }
    else
    {
      -[UITabBar scrollEdgeAppearance](self->super._tabBar, "scrollEdgeAppearance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        +[_UIBarBackgroundAppearanceData transparentBackgroundData](_UIBarBackgroundAppearanceData, "transparentBackgroundData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
    }
    objc_msgSend(v14, "_backgroundData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
    -[_UIBarBackgroundLayoutModern setBackgroundData1:](v16, "setBackgroundData1:", v9);
    -[_UIBarBackgroundLayoutModern setBackgroundData2:](v16, "setBackgroundData2:", v15);
    goto LABEL_16;
  }
  if (v7)
  {
    v10 = v7;
  }
  else
  {
    -[UITabBar standardAppearance](self->super._tabBar, "standardAppearance");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v10;

  objc_msgSend(v9, "_backgroundData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarBackgroundLayoutModern setBackgroundData1:](v16, "setBackgroundData1:", v15);
LABEL_16:

}

- (void)_shim_setCustomBackgroundView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_customBackgroundView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_customBackgroundView, a3);
    -[_UITabBarVisualProviderLegacyIOS _updateBackgroundAnimated:](self, "_updateBackgroundAnimated:", 0);
    v5 = v6;
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  UITabBar *tabBar;
  id v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  tabBar = self->super._tabBar;
  v5 = a3;
  -[UIView traitCollection](tabBar, "traitCollection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self->super._tabBar, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_UITabBarVisualProviderLegacyIOS _styleForTraitCollection:](self, "_styleForTraitCollection:", v6);

  if (self->_style != v7)
    -[UIView setNeedsLayout](self->super._tabBar, "setNeedsLayout");
  v8 = objc_msgSend(v10, "legibilityWeight");
  v9 = objc_msgSend(v5, "legibilityWeight");

  if (v8 != v9)
    -[UIView setNeedsLayout](self->super._tabBar, "setNeedsLayout");

}

- (void)layoutSubviews
{
  void *v3;

  -[UIView traitCollection](self->super._tabBar, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_style = -[_UITabBarVisualProviderLegacyIOS _styleForTraitCollection:](self, "_styleForTraitCollection:", v3);

  -[_UITabBarVisualProviderLegacyIOS _layoutTabBarItems](self, "_layoutTabBarItems");
  -[_UITabBarVisualProviderLegacyIOS _updateAccessoryView](self, "_updateAccessoryView");
  if (!-[UITabBar _suspendBackgroundUpdates](self->super._tabBar, "_suspendBackgroundUpdates"))
    -[_UITabBarVisualProviderLegacyIOS _updateBackgroundAnimated:](self, "_updateBackgroundAnimated:", 0);
}

- (int64_t)_styleForTraitCollection:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v7;
  void *v8;
  void *v9;
  UIView *accessoryView;
  CGRect v11;
  CGRect v12;

  v4 = a3;
  if (!v4)
    goto LABEL_4;
  if (!dyld_program_sdk_at_least())
    goto LABEL_4;
  -[_UITabBarVisualProviderLegacyIOS _layoutRegion](self, "_layoutRegion");
  if (CGRectGetWidth(v11) < self->_minimumWidthForHorizontalLayout)
    goto LABEL_4;
  v7 = objc_msgSend(v4, "userInterfaceIdiom");
  if (v7)
  {
    v5 = v7;
    if (v7 == 3)
      goto LABEL_5;
    if (v7 == 1 && objc_msgSend(v4, "horizontalSizeClass") == 2)
    {
      -[UITabBar items](self->super._tabBar, "items");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (unint64_t)objc_msgSend(v8, "count") < 9;

      goto LABEL_5;
    }
    goto LABEL_4;
  }
  -[UITabBar items](self->super._tabBar, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v9, "count") > 5)
  {

LABEL_4:
    v5 = 0;
    goto LABEL_5;
  }
  accessoryView = self->_accessoryView;

  if (accessoryView)
    goto LABEL_4;
  if (objc_msgSend(v4, "horizontalSizeClass") != 2)
  {
    if (objc_msgSend(v4, "verticalSizeClass") != 1)
      goto LABEL_4;
    -[_UITabBarVisualProviderLegacyIOS _layoutRegion](self, "_layoutRegion");
    if (CGRectGetWidth(v12) < 568.0)
      goto LABEL_4;
  }
  if (_UIUseMiniHeightInLandscape(1u))
    v5 = 2;
  else
    v5 = 1;
LABEL_5:

  return v5;
}

- (void)_updateAccessoryView
{
  UIView *accessoryView;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double MaxX;
  double MinY;
  CGRect v16;
  CGRect v17;

  accessoryView = self->_accessoryView;
  if (accessoryView)
  {
    -[UIView frame](accessoryView, "frame");
    v5 = v4;
    -[_UITabBarVisualProviderLegacyIOS _layoutRegion](self, "_layoutRegion");
    v10 = v6;
    v11 = v7;
    v12 = v8;
    v13 = v9;
    MaxX = 0.0;
    if ((*((_DWORD *)&self->super._tabBar->super._viewFlags + 4) & 0x80000) == 0)
      MaxX = CGRectGetMaxX(*(CGRect *)&v6);
    v16.origin.x = v10;
    v16.origin.y = v11;
    v16.size.width = v12;
    v16.size.height = v13;
    MinY = CGRectGetMinY(v16);
    v17.origin.x = v10;
    v17.origin.y = v11;
    v17.size.width = v12;
    v17.size.height = v13;
    -[UIView setFrame:](self->_accessoryView, "setFrame:", MaxX, MinY, v5, CGRectGetHeight(v17));
  }
}

- (void)_shim_setAccessoryView:(id)a3
{
  UIView *v4;
  UIView *accessoryView;
  UIView *v6;

  v4 = (UIView *)a3;
  -[UIView removeFromSuperview](self->_accessoryView, "removeFromSuperview");
  accessoryView = self->_accessoryView;
  self->_accessoryView = v4;
  v6 = v4;

  -[UIView addSubview:](self->super._tabBar, "addSubview:", self->_accessoryView);
  -[UIView setNeedsLayout](self->super._tabBar, "setNeedsLayout");

}

- (void)prepare
{
  double v3;
  double v4;
  double v5;
  double v6;
  _UIBarBackground *v7;
  _UIBarBackground *backgroundView;
  UIPointerInteraction *v9;
  UIPointerInteraction *pointerInteraction;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_UITabBarVisualProviderLegacyIOS;
  -[_UITabBarVisualProvider prepare](&v19, sel_prepare);
  -[UIView bounds](self->super._tabBar, "bounds");
  v7 = -[_UIBarBackground initWithFrame:]([_UIBarBackground alloc], "initWithFrame:", v3, v4, v5, v6);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v7;

  -[_UIBarBackground setTopAligned:](self->_backgroundView, "setTopAligned:", 0);
  v9 = -[UIPointerInteraction initWithDelegate:]([UIPointerInteraction alloc], "initWithDelegate:", self);
  pointerInteraction = self->_pointerInteraction;
  self->_pointerInteraction = v9;

  -[UIView addInteraction:](self->super._tabBar, "addInteraction:", self->_pointerInteraction);
  objc_initWeak(&location, self);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __43___UITabBarVisualProviderLegacyIOS_prepare__block_invoke;
  v16 = &unk_1E16B6588;
  objc_copyWeak(&v17, &location);
  +[_UIBarBackgroundLayoutPrototyping registerPrototypingCallback:](_UIBarBackgroundLayoutPrototyping, "registerPrototypingCallback:", &v13);
  +[_UIBarSettingsDomain rootSettings](_UIBarSettingsDomain, "rootSettings", v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tabBarSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addKeyObserver:", self);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)teardown
{
  _UIBarBackground *backgroundView;
  UIView *accessoryView;
  void *v5;
  void *v6;
  objc_super v7;

  -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  -[UIView removeFromSuperview](self->_accessoryView, "removeFromSuperview");
  accessoryView = self->_accessoryView;
  self->_accessoryView = 0;

  +[_UIBarSettingsDomain rootSettings](_UIBarSettingsDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tabBarSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeKeyObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)_UITabBarVisualProviderLegacyIOS;
  -[_UITabBarVisualProvider teardown](&v7, sel_teardown);
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

      -[_UITabBarVisualProviderLegacyIOS changeAppearance](self, "changeAppearance");
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITabBarVisualProviderLegacyIOS.m"), 242, CFSTR("Downgrading modern appearance flag from YES to NO not supported"));

  }
}

- (void)changeAppearance
{
  -[UIView setNeedsLayout](self->super._tabBar, "setNeedsLayout");
}

- (void)setMinimumWidthForHorizontalLayout:(double)a3
{
  if (self->_minimumWidthForHorizontalLayout != a3)
  {
    self->_minimumWidthForHorizontalLayout = a3;
    -[UIView setNeedsLayout](self->super._tabBar, "setNeedsLayout");
  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[UITabBar items](self->super._tabBar, "items", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        -[UITabBarItem _tabBarButton](*(id **)(*((_QWORD *)&v17 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setSemanticContentAttribute:", a3);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  -[UITabBar delegate](self->super._tabBar, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "_existingMoreNavigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSemanticContentAttribute:", a3);

    objc_msgSend(v12, "topViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSemanticContentAttribute:", a3);

    objc_msgSend(v12, "navigationBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSemanticContentAttribute:", a3);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_customBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundViewLayout, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
}

- (void)_applyAppearanceCustomizationsToItem:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (id *)a3;
  -[UITabBarItem _tabBarButton](v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UITabBar selectionIndicatorImage](self->super._tabBar, "selectionIndicatorImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setCustomSelectedIndicatorImage:", v5);

  objc_msgSend(v4, "_tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setTintColor:", v6);
}

- (id)exchangeItem:(id)a3 withItem:(id)a4
{
  id *v6;
  UITabBar *tabBar;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UITabBar *v20;
  void *v21;

  v6 = (id *)a4;
  tabBar = self->super._tabBar;
  v8 = a3;
  -[UITabBar items](tabBar, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexOfObject:", v8);

  v11 = objc_msgSend(v9, "indexOfObject:", v6);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL || v10 == v11)
  {
    v13 = v9;
  }
  else
  {
    v14 = v11;
    v15 = (void *)objc_msgSend(v9, "mutableCopy");
    v16 = v15;
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v15, "replaceObjectAtIndex:withObject:", v10, v6);
      -[UITabBarItem _tabBarButton](v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        objc_msgSend(v6, "_setImageStyle:", -[UITabBar _imageStyle](self->super._tabBar, "_imageStyle"));
        objc_msgSend(v6, "_setBarMetrics:", -[UITabBar _barMetrics](self->super._tabBar, "_barMetrics"));
        -[_UITabBarVisualProviderLegacyIOS createViewForTabBarItem:](self, "createViewForTabBarItem:", v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITabBarItem _setTabBarButton:]((uint64_t)v6, v18);

      }
      -[UITabBarItem _tabBarButton](v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAlpha:", 1.0);

      v20 = self->super._tabBar;
      -[UITabBarItem _tabBarButton](v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](v20, "addSubview:", v21);

      -[_UITabBarVisualProviderLegacyIOS _applyAppearanceCustomizationsToItem:](self, "_applyAppearanceCustomizationsToItem:", v6);
    }
    else
    {
      objc_msgSend(v15, "exchangeObjectAtIndex:withObjectAtIndex:", v10, v14);
    }
    v13 = (id)objc_msgSend(v16, "copy");

  }
  return v13;
}

- (void)changeLayout
{
  -[UIView setNeedsLayout](self->super._tabBar, "setNeedsLayout");
}

- (BOOL)useModernAppearance
{
  return self->_useModernAppearance;
}

- (double)minimumWidthForHorizontalLayout
{
  return self->_minimumWidthForHorizontalLayout;
}

- (void)updateArchivedSubviews:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UITabBar items](self->super._tabBar, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id **)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[UITabBarItem _tabBarButton](v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          -[UITabBarItem _tabBarButton](v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "removeObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  if (self->_backgroundView)
    objc_msgSend(v4, "removeObject:");
  if (self->_accessoryView)
    objc_msgSend(v4, "removeObject:");

}

- (CGRect)_shadowFrameForBounds:(CGRect)a3 height:(double)a4
{
  CGFloat width;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  width = a3.size.width;
  x = a3.origin.x;
  v7 = CGRectGetMinY(a3) - a4;
  v8 = x;
  v9 = width;
  v10 = a4;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v7;
  result.origin.x = v8;
  return result;
}

- (id)_preferredFocusedViewCarplay
{
  void *v3;
  void *v4;
  void *v5;
  UIView *accessoryView;
  UIView *v7;
  UITabBar *tabBar;
  int v9;
  uint64_t v10;
  void *v11;
  id *v12;
  id *v13;
  _BOOL4 v14;
  id *v15;

  -[UIView window](self->super._tabBar, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_focusEventRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_moveEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(v5, "_focusHeading") != 32)
      goto LABEL_17;
  }
  else
  {
    tabBar = self->super._tabBar;
    v9 = *((_DWORD *)&tabBar->super._viewFlags + 4);
    v10 = -[UITabBar _preferredFocusHeading](tabBar, "_preferredFocusHeading");
    if ((v9 & 0x80000) != 0 && v10 == 8 || (v9 & 0x80000) == 0 && v10 == 4)
    {
      -[UITabBar items](self->super._tabBar, "items");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (id *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if ((*(_QWORD *)&v9 & 0x80000) != 0)
      v14 = v10 == 4;
    else
      v14 = v10 == 8;
    if (!v14)
      goto LABEL_17;
  }
  accessoryView = self->_accessoryView;
  if (!accessoryView)
  {
    -[UITabBar items](self->super._tabBar, "items");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v13 = v12;
    -[UITabBarItem _tabBarButton](v12);
    v7 = (UIView *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_18;
LABEL_17:
    -[UITabBar selectedItem](self->super._tabBar, "selectedItem");
    v15 = (id *)objc_claimAutoreleasedReturnValue();
    -[UITabBarItem _tabBarButton](v15);
    v7 = (UIView *)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  v7 = accessoryView;
LABEL_18:

  return v7;
}

- (id)_preferredFocusedViewiOS
{
  void *v2;
  id *v3;
  void *v4;

  -[UITabBar items](self->super._tabBar, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[UITabBarItem _tabBarButton](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)preferredFocusedView
{
  void *v3;
  uint64_t v4;

  -[UIView traitCollection](self->super._tabBar, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 3)
    -[_UITabBarVisualProviderLegacyIOS _preferredFocusedViewCarplay](self, "_preferredFocusedViewCarplay");
  else
    -[_UITabBarVisualProviderLegacyIOS _preferredFocusedViewiOS](self, "_preferredFocusedViewiOS");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_shim_compatibilityBackgroundView
{
  _UIBarBackground *customBackgroundView;

  customBackgroundView = (_UIBarBackground *)self->_customBackgroundView;
  if (!customBackgroundView)
    customBackgroundView = self->_backgroundView;
  return customBackgroundView;
}

- (id)_shim_accessoryView
{
  return self->_accessoryView;
}

- (double)_shim_shadowAlpha
{
  double result;

  -[_UIBarBackgroundLayout shadowAlpha](self->_backgroundViewLayout, "shadowAlpha");
  return result;
}

- (void)_shim_setShadowAlpha:(double)a3
{
  double v5;

  -[_UIBarBackgroundLayout shadowAlpha](self->_backgroundViewLayout, "shadowAlpha");
  if (v5 != a3)
  {
    -[_UIBarBackgroundLayout setShadowAlpha:](self->_backgroundViewLayout, "setShadowAlpha:", a3);
    -[_UIBarBackground transitionBackgroundViews](self->_backgroundView, "transitionBackgroundViews");
  }
}

- (BOOL)_shim_shadowHidden
{
  return -[_UIBarBackgroundLayout shadowHidden](self->_backgroundViewLayout, "shadowHidden");
}

- (void)_shim_setShadowHidden:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[_UIBarBackgroundLayout shadowHidden](self->_backgroundViewLayout, "shadowHidden") != a3)
  {
    -[_UIBarBackgroundLayout setShadowHidden:](self->_backgroundViewLayout, "setShadowHidden:", v3);
    -[_UIBarBackground transitionBackgroundViews](self->_backgroundView, "transitionBackgroundViews");
  }
}

- (double)_shim_heightForCustomizingItems
{
  double v2;

  -[_UITabBarVisualProviderLegacyIOS _layoutRegion](self, "_layoutRegion");
  return v2;
}

- (id)_focusedItemHighlightView
{
  return 0;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "location", a3);
  v7 = v6;
  v9 = v8;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[UITabBar items](self->super._tabBar, "items", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v29;
LABEL_3:
    v15 = 0;
    v16 = v12 + v13;
    while (1)
    {
      if (*(_QWORD *)v29 != v14)
        objc_enumerationMutation(v10);
      -[UITabBarItem _tabBarButton](*(id **)(*((_QWORD *)&v28 + 1) + 8 * v15));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView convertPoint:toView:](self->super._tabBar, "convertPoint:toView:", v17, v7, v9);
      if ((objc_msgSend(v17, "pointInside:withEvent:", 0) & 1) != 0)
        break;

      if (v12 == ++v15)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        v13 = v16;
        if (v12)
          goto LABEL_3;
        goto LABEL_9;
      }
    }

    if (v17)
    {
      objc_msgSend(v17, "_tabBarHitRect");
      objc_msgSend(v17, "convertRect:toView:", self->super._tabBar);
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13 + v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v10, v20, v22, v24, v26);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    v18 = 0;
  }
  else
  {
LABEL_9:
    v17 = 0;
    v18 = 0;
LABEL_12:

  }
  return v18;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  UITargetedPreview *v12;
  CGFloat x;
  double y;
  CGFloat width;
  CGFloat height;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  void *v31;
  void *v32;
  uint8_t v34[16];
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  objc_msgSend(a4, "identifier", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  -[UITabBar items](self->super._tabBar, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 0x8000000000000000) != 0 || v6 >= objc_msgSend(v7, "count"))
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
    v9 = (id *)objc_claimAutoreleasedReturnValue();
    -[UITabBarItem _tabBarButton](v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = -[UITargetedPreview initWithView:]([UITargetedPreview alloc], "initWithView:", v10);
      objc_msgSend(v10, "_contentRect");
      objc_msgSend(v10, "convertRect:toView:", self->super._tabBar);
      x = v35.origin.x;
      y = v35.origin.y;
      width = v35.size.width;
      height = v35.size.height;
      if (CGRectIsNull(v35))
      {
        v17 = 0;
      }
      else
      {
        +[_UIPointerSettingsDomain rootSettings](_UIPointerSettingsDomain, "rootSettings");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "tabBarSettings");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "layoutStyle"))
        {
          objc_msgSend(v21, "inlineCornerRadius");
          v23 = v22;
          -[UIView safeAreaInsets](self->super._tabBar, "safeAreaInsets");
          if (v24 <= 0.0)
            objc_msgSend(v21, "inlineHomeButtonVerticalOffset");
          else
            objc_msgSend(v21, "inlineHomeAffordanceVerticalOffset");
          y = y + v25;
        }
        else
        {
          objc_msgSend(v21, "stackedCornerRadius");
          v23 = v26;
        }
        objc_msgSend(v10, "frame");
        v38.origin.x = v27;
        v38.origin.y = v28;
        v38.size.width = v29;
        v38.size.height = v30;
        v36.origin.x = x;
        v36.origin.y = y;
        v36.size.width = width;
        v36.size.height = height;
        v37 = CGRectIntersection(v36, v38);
        +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v37.origin.x, v37.origin.y, v37.size.width, v37.size.height, v23);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIPointerEffect effectWithPreview:](UIPointerHighlightEffect, "effectWithPreview:", v12);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v32, v31);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v18 = pointerInteraction_styleForRegion____s_category;
      if (!pointerInteraction_styleForRegion____s_category)
      {
        v18 = __UILogCategoryGetNode("TabBarPointerEffects", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v18, (unint64_t *)&pointerInteraction_styleForRegion____s_category);
      }
      v19 = *(NSObject **)(v18 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "Failed to apply pointer effect since this tab bar's internal view hierarchy was modified. This is generally a bad idea.", v34, 2u);
      }
      v17 = 0;
    }

  }
  return v17;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id *v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[_UIBarSettingsDomain rootSettings](_UIBarSettingsDomain, "rootSettings", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tabBarSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "highlightSystemItems");

  -[UITabBar items](self->super._tabBar, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(id **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v13, "isSystemItem"))
        {
          -[_UITabBarVisualProviderLegacyIOS _shim_updateTabBarItemView:](self, "_shim_updateTabBarItemView:", v13);
          -[UITabBarItem _tabBarButton](v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "layer");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v7)
          {
            +[UIColor cyanColor](UIColor, "cyanColor");
            v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v15, "setBorderColor:", objc_msgSend(v16, "CGColor"));

            v17 = 2.0;
          }
          else
          {
            objc_msgSend(v15, "setBorderColor:", 0);
            v17 = 0.0;
          }
          objc_msgSend(v15, "setBorderWidth:", v17);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

}

@end
