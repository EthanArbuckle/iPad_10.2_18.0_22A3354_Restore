@implementation UITabBar

- (void)addConstraint:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (-[UITabBar isLocked](self, "isLocked"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Cannot modify constraints for UITabBar managed by a controller"));
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UITabBar;
    -[UIView addConstraint:](&v5, sel_addConstraint_, v4);
  }

}

- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITabBar;
  return -[UIView _edgesPropagatingSafeAreaInsetsToSubviews](&v3, sel__edgesPropagatingSafeAreaInsetsToSubviews);
}

- (BOOL)_subclassImplementsDrawRect
{
  uint64_t v3;
  BOOL v4;

  if (!__drawRectUITabBarIMP)
    __drawRectUITabBarIMP = +[UITabBar instanceMethodForSelector:](UITabBar, "instanceMethodForSelector:", sel_drawRect_);
  v3 = -[UITabBar methodForSelector:](self, "methodForSelector:", sel_drawRect_);
  if (v3)
    v4 = v3 == __drawRectUITabBarIMP;
  else
    v4 = 1;
  return !v4;
}

- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)UITabBar;
  -[UIView _didChangeFromIdiom:onScreen:traverseHierarchy:](&v19, sel__didChangeFromIdiom_onScreen_traverseHierarchy_, a3, a4, a5);
  if (dyld_program_sdk_at_least())
  {
    -[UIView frame](self, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[UITabBar sizeThatFits:](self, "sizeThatFits:", v11, v13);
    if (v15 != v14)
    {
      -[UITabBar setFrame:](self, "setFrame:", v8, v10, v12, v15);
      -[UIView superview](self, "superview");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setNeedsLayout");

    }
    -[UIView _screen](self, "_screen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "_userInterfaceIdiom");

    if (v18 != a3 && (a3 == 3 || v18 == 3))
      -[UITabBar _accessibilityButtonShapesParametersDidChange](self, "_accessibilityButtonShapesParametersDidChange");
  }
}

+ (void)_initializeForIdiom:(int64_t)a3
{
  void *v3;
  void *v4;
  UIImage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[2];
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  if (a3 == 2 || a3 == 8)
  {
    if ((id)objc_opt_class() != a1)
      return;
    v28 = _UIAppearanceContainerForUserInterfaceIdiom();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIView appearanceWhenContainedInInstancesOfClasses:](UITabBar, "appearanceWhenContainedInInstancesOfClasses:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setBarMetrics:", 3);
    objc_msgSend(v4, "_setScrollsItems:", 1);
    objc_msgSend(v4, "setItemPositioning:", 2);
    objc_msgSend(v4, "setItemSpacing:", 70.0);
    goto LABEL_8;
  }
  if (a3 == 3 && (id)objc_opt_class() == a1)
  {
    v40[0] = _UIAppearanceContainerForUserInterfaceIdiom();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIView appearanceWhenContainedInInstancesOfClasses:](UITabBar, "appearanceWhenContainedInInstancesOfClasses:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(UIImage);
    objc_msgSend(v4, "setBackgroundImage:", v5);

    +[UIColor _externalBarBackgroundColor](UIColor, "_externalBarBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorWithAlphaComponent:", 0.8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v7);

    +[UIColorEffect colorEffectSaturate:](UIColorEffect, "colorEffectSaturate:", 1.5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 10.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v27;
    v39[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundEffects:", v9);

    objc_msgSend(v4, "_setBarMetrics:", 1);
    objc_msgSend(v4, "_setImageStyle:", 1);
    objc_msgSend(v4, "_setShowsHighlightedState:", 1);
    +[UIView appearanceWhenContainedInInstancesOfClasses:](UITabBarButton, "appearanceWhenContainedInInstancesOfClasses:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor _carSystemSecondaryColor](UIColor, "_carSystemSecondaryColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setContentTintColor:forState:", v11, 0);

    +[UIColor _carSystemFocusSecondaryColor](UIColor, "_carSystemFocusSecondaryColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setContentTintColor:forState:", v12, 1);

    +[UIColor _carSystemFocusSecondaryColor](UIColor, "_carSystemFocusSecondaryColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setContentTintColor:forState:", v13, 8);

    +[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setContentTintColor:forState:", v14, 5);

    +[UIBarItem appearanceWhenContainedInInstancesOfClasses:](UITabBarItem, "appearanceWhenContainedInInstancesOfClasses:", v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *(_QWORD *)off_1E1678D98;
    v16 = v37;
    +[UIColor _carSystemSecondaryColor](UIColor, "_carSystemSecondaryColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitleTextAttributes:forState:", v18, 0);

    v35 = v16;
    +[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitleTextAttributes:forState:", v20, 4);

    v33 = v16;
    +[UIColor _carSystemFocusSecondaryColor](UIColor, "_carSystemFocusSecondaryColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitleTextAttributes:forState:", v22, 8);

    v31 = v16;
    +[UIColor _carSystemFocusSecondaryColor](UIColor, "_carSystemFocusSecondaryColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitleTextAttributes:forState:", v24, 1);

    v29 = v16;
    +[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitleTextAttributes:forState:", v26, 5);

LABEL_8:
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
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)UITabBar;
  -[UIView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (v9 != width || v11 != height)
  {
    -[_UITabBarVisualProvider tabBarSizeChanged:](self->_visualProvider, "tabBarSizeChanged:", v9, v11);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- (id)_normalInheritedTintColor
{
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  -[_UITabBarVisualProvider defaultTintColor](self->_visualProvider, "defaultTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIView _definesTintColor](self, "_definesTintColor") || !v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)UITabBar;
    -[UIView _normalInheritedTintColor](&v7, sel__normalInheritedTintColor);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int64_t v14;
  double v15;
  double v16;
  CGSize result;

  -[UITabBar _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[UIView superview](self, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[UIView superview](self, "superview");
  else
    -[UIView _screen](self, "_screen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;

  v14 = -[UITabBar _effectiveBarOrientation](self, "_effectiveBarOrientation");
  if ((unint64_t)(v14 - 1) >= 2)
    v15 = v7;
  else
    v15 = v13;
  if ((unint64_t)(v14 - 1) >= 2)
    v16 = v11;
  else
    v16 = v5;
  result.height = v15;
  result.width = v16;
  return result;
}

- (int64_t)_effectiveBarOrientation
{
  if (self->_barOrientation)
    return self->_barOrientation;
  else
    return 4;
}

- (int64_t)_barMetrics
{
  return self->_barMetrics;
}

- (int64_t)barPosition
{
  return 1;
}

- (int64_t)_expectedInterfaceOrientation
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  id WeakRetained;

  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_2;
  if ((*((_BYTE *)&self->_tabBarFlags + 2) & 2) == 0)
  {
    v3 = 0;
LABEL_8:
    v5 = 1;
    goto LABEL_9;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "_tabBarWindowForInterfaceOrientation:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_8;
LABEL_2:
  v4 = objc_msgSend(v3, "_windowInterfaceOrientation");
  if (!v4)
    v4 = objc_msgSend((id)UIApp, "_sceneInterfaceOrientationFromWindow:", v3);
  v5 = v4;
LABEL_9:

  return v5;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[_UITabBarVisualProvider intrinsicContentSizeGivenSize:](self->_visualProvider, "intrinsicContentSizeGivenSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIView)_externalViewForSafeAreaInsets
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[UITabBar _expectedSuperviewFollowingAnimation](self, "_expectedSuperviewFollowingAnimation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UIView superview](self, "superview");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (UIView *)v6;
}

- (UIView)_expectedSuperviewFollowingAnimation
{
  return self->__expectedSuperviewFollowingAnimation;
}

- (int64_t)_imageStyle
{
  if (self->_imageStyle)
    return self->_imageStyle;
  else
    return 2;
}

- (id)_effectiveUnselectedTintColor
{
  void *v2;

  -[UITabBar unselectedItemTintColor](self, "unselectedItemTintColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.57254902, 0.85);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_effectiveUnselectedTabTintColorConsideringView:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_UITabBarAppearanceStorage unselectedImageTintColor](self->_appearanceStorage, "unselectedImageTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[UITabBar _unselectedTabTintColorForView:](UITabBar, "_unselectedTabTintColorForView:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)_unselectedTabTintColorForView:(id)a3
{
  return (id)objc_msgSend(a3, "tintColor");
}

- (BOOL)_useVibrantItems
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  BOOL v8;

  if (!dyld_program_sdk_at_least() || !-[UITabBar isTranslucent](self, "isTranslucent"))
    return 0;
  -[UITabBar barTintColor](self, "barTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBar unselectedItemTintColor](self, "unselectedItemTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_msgSend(v3, "alphaComponent"), v5 != 0.0) || v4 && (objc_msgSend(v4, "alphaComponent"), v6 != 0.0))
  {
    v8 = 0;
  }
  else
  {
    -[UIView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom") != 3;

  }
  return v8;
}

- (BOOL)isTranslucent
{
  int v2;
  void *v5;
  void *v6;
  char v7;

  v7 = 1;
  v2 = (*(_DWORD *)&self->_tabBarFlags >> 7) & 7;
  if (v2)
    return v2 == 1;
  if (-[UIView _currentUserInterfaceIdiom](self, "_currentUserInterfaceIdiom") == 3)
    return 1;
  -[_UITabBarAppearanceStorage backgroundImage](self->_appearanceStorage, "backgroundImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "_isInvisibleAndGetIsTranslucent:", &v7);

  return v7 != 0;
}

- (UIColor)unselectedItemTintColor
{
  return -[_UITabBarAppearanceStorage unselectedImageTintColor](self->_appearanceStorage, "unselectedImageTintColor");
}

- (UIColor)barTintColor
{
  return -[_UITabBarAppearanceStorage barTintColor](self->_appearanceStorage, "barTintColor");
}

- (int64_t)_tabBarSizing
{
  return self->_tabBarSizing;
}

- (void)_setBackgroundNeedsUpdate:(BOOL)a3
{
  $A65F59733608D94F9E77A112F9FC6161 tabBarFlags;
  int v4;

  tabBarFlags = self->_tabBarFlags;
  if ((*(_DWORD *)&tabBarFlags & 0x40000) == 0)
  {
    if (a3)
      v4 = 1024;
    else
      v4 = 0;
    self->_tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&tabBarFlags & 0xFFFFFBFF | v4);
    if (a3)
      -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)_disableBlurTinting
{
  return (*((unsigned __int8 *)&self->_tabBarFlags + 1) >> 6) & 1;
}

- (void)_setBackgroundTransitionProgress:(double)a3 forceUpdate:(BOOL)a4 animated:(BOOL)a5
{
  -[_UITabBarVisualProvider setBackgroundTransitionProgress:forceUpdate:animated:](self->_visualProvider, "setBackgroundTransitionProgress:forceUpdate:animated:", a4, a5, a3);
}

- (double)_backgroundTransitionProgress
{
  double result;

  -[_UITabBarVisualProvider backgroundTransitionProgress](self->_visualProvider, "backgroundTransitionProgress");
  return result;
}

- (UITabBarItem)selectedItem
{
  return (UITabBarItem *)objc_loadWeakRetained((id *)&self->_selectedItem);
}

- (UITabBarAppearance)scrollEdgeAppearance
{
  return self->_scrollEdgeAppearance;
}

- (void)_setBackgroundTransitionProgress:(double)a3
{
  -[_UITabBarVisualProvider setBackgroundTransitionProgress:](self->_visualProvider, "setBackgroundTransitionProgress:", a3);
}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  _UITabBarVisualProvider *visualProvider;
  id v5;
  void *v6;
  void *v7;

  visualProvider = self->_visualProvider;
  v5 = a3;
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITabBarVisualProvider traitCollectionForChild:baseTraitCollection:](visualProvider, "traitCollectionForChild:baseTraitCollection:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (UIBarStyle)barStyle
{
  return ((unint64_t)self->_tabBarFlags >> 4) & 7;
}

- (UIImage)backgroundImage
{
  return -[_UITabBarAppearanceStorage backgroundImage](self->_appearanceStorage, "backgroundImage");
}

- (NSArray)backgroundEffects
{
  return self->_backgroundEffects;
}

- (id)_effectiveUnselectedLabelTintColor
{
  void *v2;

  -[UITabBar unselectedItemTintColor](self, "unselectedItemTintColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.57254902, 1.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setLocked:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&self->_tabBarFlags & 0xFFFFFFF7 | v3);
}

- (id)_appearanceStorage
{
  return self->_appearanceStorage;
}

- (BOOL)_showsHighlightedState
{
  return self->_showsHighlightedState;
}

- (NSArray)items
{
  return self->_items;
}

- (UIImage)selectionIndicatorImage
{
  return -[_UITabBarAppearanceStorage selectionIndicatorImage](self->_appearanceStorage, "selectionIndicatorImage");
}

- (CGFloat)itemWidth
{
  return self->_itemDimension;
}

- (CGFloat)itemSpacing
{
  return self->_itemSpacing;
}

- (UITabBarItemPositioning)itemPositioning
{
  return self->_itemPositioning;
}

- (void)_positionAllItems
{
  -[_UITabBarVisualProvider _shim_layoutItemsOnly](self->_visualProvider, "_shim_layoutItemsOnly");
}

- (void)_updateTabBarItemView:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSArray containsObject:](self->_items, "containsObject:"))
    -[_UITabBarVisualProvider _shim_updateTabBarItemView:](self->_visualProvider, "_shim_updateTabBarItemView:", v4);

}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  double v6;
  _UITabBarDelegateInternal **p_delegate;
  id WeakRetained;
  char v9;
  id v10;
  objc_super v11;

  v3 = a3;
  v5 = -[UIView isHidden](self, "isHidden");
  v11.receiver = self;
  v11.super_class = (Class)UITabBar;
  -[UIView setHidden:](&v11, sel_setHidden_, v3);
  if (v5 != v3)
  {
    if (-[UITabBar isLocked](self, "isLocked"))
    {
      -[UIView alpha](self, "alpha");
      if (v6 != 0.0)
      {
        p_delegate = &self->_delegate;
        WeakRetained = objc_loadWeakRetained((id *)p_delegate);
        v9 = objc_opt_respondsToSelector();

        if ((v9 & 1) != 0)
        {
          v10 = objc_loadWeakRetained((id *)p_delegate);
          objc_msgSend(v10, "_tabBarVisibilityDidChange");

        }
      }
    }
  }
}

- (void)setSelectedItem:(UITabBarItem *)selectedItem
{
  UITabBarItem *WeakRetained;
  UITabBarItem *v5;
  BOOL v6;
  UITabBarItem *obj;

  obj = selectedItem;
  if (!-[UITabBar isLocked](self, "isLocked"))
  {
    WeakRetained = (UITabBarItem *)objc_loadWeakRetained((id *)&self->_selectedItem);
    v5 = WeakRetained;
    if (obj)
    {
      if (-[NSArray containsObject:](self->_items, "containsObject:", obj))
        v6 = v5 == obj;
      else
        v6 = 1;
      if (v6)
        goto LABEL_9;
    }
    else if (!WeakRetained)
    {
      goto LABEL_9;
    }
    objc_storeWeak((id *)&self->_selectedItem, obj);
    -[_UITabBarVisualProvider changeSelectedItem:fromItem:](self->_visualProvider, "changeSelectedItem:fromItem:", obj, v5);
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Directly modifying a tab bar managed by a tab bar controller is not allowed."));
LABEL_10:

}

- (void)setItems:(NSArray *)items animated:(BOOL)animated
{
  _BOOL4 v4;
  NSArray *v6;
  void *v7;
  void *v8;
  id v9;
  NSArray *v10;
  NSArray *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _UITabBarVisualProvider *visualProvider;
  NSArray *v29;
  id v30;
  void *v31;
  id *location;
  id WeakRetained;
  void *v34;
  _BOOL4 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v4 = animated;
  v48 = *MEMORY[0x1E0C80C00];
  v6 = items;
  if (-[UITabBar isLocked](self, "isLocked"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Directly modifying a tab bar managed by a tab bar controller is not allowed."));
  }
  else if (self->_items != v6)
  {
    -[_UITabBarAppearanceStorage _tabItemAppearanceStorage](self->_appearanceStorage, "_tabItemAppearanceStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __30__UITabBar_setItems_animated___block_invoke;
      v44[3] = &unk_1E16B7330;
      v45 = v7;
      -[NSArray enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:", v44);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_selectedItem);
    v35 = v4;
    v34 = v8;
    location = (id *)&self->_selectedItem;
    if (-[NSArray containsObject:](v6, "containsObject:"))
    {
      v9 = objc_loadWeakRetained((id *)&self->_selectedItem);
      objc_storeWeak((id *)&self->_selectedItem, v9);

    }
    else
    {
      objc_storeWeak((id *)&self->_selectedItem, 0);
    }
    v31 = (void *)-[NSArray mutableCopy](self->_items, "mutableCopy");
    objc_msgSend(v31, "removeObjectsInArray:", v6);
    v10 = (NSArray *)-[NSArray copy](v6, "copy");
    v11 = self->_items;
    self->_items = v10;

    -[UITabBar _setSpringLoaded:force:](self, "_setSpringLoaded:force:", HIWORD(*(_DWORD *)&self->_tabBarFlags) & 1, 0);
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v12 = self->_items;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v41;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v41 != v15)
            objc_enumerationMutation(v12);
          v17 = *(id **)(*((_QWORD *)&v40 + 1) + 8 * i);
          -[UIView traitCollection](self, "traitCollection");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "userInterfaceIdiom");

          if (v19 == 6 && v17)
            objc_storeWeak(v17 + 35, self);
          if (objc_msgSend(v17, "_usesModernAppearance"))
          {
            -[UITabBar _useModernAppearance](self, "_useModernAppearance");
            goto LABEL_22;
          }
        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_22:

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v20 = v31;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v37 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
          -[UIView traitCollection](self, "traitCollection");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "userInterfaceIdiom");

          if (v27 == 6 && v25)
            objc_storeWeak((id *)(v25 + 280), 0);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      }
      while (v22);
    }

    visualProvider = self->_visualProvider;
    v29 = self->_items;
    v30 = objc_loadWeakRetained(location);
    -[_UITabBarVisualProvider changeItemsTo:removingItems:selectedItem:oldSelectedItem:animate:](visualProvider, "changeItemsTo:removingItems:selectedItem:oldSelectedItem:animate:", v29, v20, v30, WeakRetained, v35);

  }
}

- (BOOL)isLocked
{
  return (*(_BYTE *)&self->_tabBarFlags >> 3) & 1;
}

- (void)setSpringLoaded:(BOOL)a3
{
  -[UITabBar _setSpringLoaded:force:](self, "_setSpringLoaded:force:", a3, 1);
}

- (void)setItems:(NSArray *)items
{
  -[UITabBar setItems:animated:](self, "setItems:animated:", items, 0);
}

- (void)setTintColor:(UIColor *)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITabBar;
  -[UIView setTintColor:](&v3, sel_setTintColor_, tintColor);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITabBar;
  v4 = a3;
  -[UIView traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, v4);
  -[_UITabBarVisualProvider traitCollectionDidChange:](self->_visualProvider, "traitCollectionDidChange:", v4, v5.receiver, v5.super_class);

}

- (void)layoutSubviews
{
  objc_super v3;

  -[_UITabBarVisualProvider layoutSubviews](self->_visualProvider, "layoutSubviews");
  v3.receiver = self;
  v3.super_class = (Class)UITabBar;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  -[UIView frame](self, "frame");
  v13 = v12;
  v15 = v14;
  v17.receiver = self;
  v17.super_class = (Class)UITabBar;
  -[UIView setFrame:](&v17, sel_setFrame_, x, y, width, height);
  if (width != v13 || height != v15)
  {
    -[_UITabBarVisualProvider tabBarSizeChanged:](self->_visualProvider, "tabBarSizeChanged:", v9, v11);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setDelegate:(id)delegate
{
  id WeakRetained;
  void *v5;
  id v6;
  int v7;
  id obj;

  obj = delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    if (-[UITabBar isLocked](self, "isLocked"))
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Changing the delegate of a tab bar managed by a tab bar controller is not allowed."));
    }
    else
    {
      v6 = objc_storeWeak((id *)&self->_delegate, obj);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = 0x20000;
      else
        v7 = 0;
      self->_tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&self->_tabBarFlags & 0xFFFDFFFF | v7);

    }
    v5 = obj;
  }

}

- (void)_setHidesShadow:(BOOL)a3
{
  id v4;

  self->_hidesShadow = a3;
  -[_UITabBarVisualProvider _shim_shadowView](self->_visualProvider, "_shim_shadowView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", self->_hidesShadow);

}

- (void)_setBarOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  int64_t v7;

  if ((unint64_t)(a3 - 1) >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[UITabBar _setBarOrientation:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("UITabBar.m"), 1655, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("UIDeviceOrientationIsValidInterfaceOrientation(orientation)"));

  }
  v7 = -[UITabBar _effectiveBarOrientation](self, "_effectiveBarOrientation");
  self->_barOrientation = a3;
  if (v7 != -[UITabBar _effectiveBarOrientation](self, "_effectiveBarOrientation"))
    -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setAccessoryView:(id)a3
{
  -[_UITabBarVisualProvider _shim_setAccessoryView:](self->_visualProvider, "_shim_setAccessoryView:", a3);
}

- (UITabBar)initWithFrame:(CGRect)a3
{
  UITabBar *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITabBar;
  v3 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UITabBar _doCommonTabBarPreInit](v3, "_doCommonTabBarPreInit");
  -[UITabBar _setBackgroundNeedsUpdate:](v3, "_setBackgroundNeedsUpdate:", 1);
  -[UITabBar _doCommonTabBarInit](v3, "_doCommonTabBarInit");
  return v3;
}

- (void)_doCommonTabBarPreInit
{
  int v3;
  void *v4;
  int v5;
  _UITabBarVisualProvider *v6;
  _UITabBarVisualProvider *visualProvider;

  v3 = dyld_program_sdk_at_least();
  self->_displayStyle = 0;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("UseTabBarLegacyTVStyle"));

    if (v5)
      self->_displayStyle = 0;
  }
  objc_msgSend((id)objc_opt_class(), "_visualProviderForTabBar:", self);
  v6 = (_UITabBarVisualProvider *)objc_claimAutoreleasedReturnValue();
  visualProvider = self->_visualProvider;
  self->_visualProvider = v6;

}

- (void)_doCommonTabBarInit
{
  id WeakRetained;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = 0x20000;
  else
    v4 = 0;
  self->_tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&self->_tabBarFlags & 0xFFFDFFFF | v4);

  if (self->_standardAppearance)
    goto LABEL_7;
  if (_UIBarAppearanceAPIVersion() >= 2)
  {
    -[UITabBar _installDefaultAppearance](self, "_installDefaultAppearance");
LABEL_7:
    -[_UITabBarVisualProvider setUseModernAppearance:](self->_visualProvider, "setUseModernAppearance:", 1);
  }
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    -[UIView _screen](self, "_screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_userInterfaceIdiom");

    if (v6 == 1)
      self->_barMetrics = 2;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__accessibilityButtonShapesEnabledDidChangeNotification_, CFSTR("UIAccessibilityButtonShapesEnabledStatusDidChangeNotification"), 0);

  -[_UITabBarVisualProvider prepare](self->_visualProvider, "prepare");
}

+ (id)_visualProviderForTabBar:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_visualProviderClassForTabBar:", v4)), "initWithTabBar:", v4);

  return v5;
}

+ (Class)_visualProviderClassForTabBar:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)_setBackdropViewLayerGroupName:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  -[UIView traitOverrides](self, "traitOverrides");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v4, "setObject:forTrait:", v7, v5);
LABEL_5:

    goto LABEL_6;
  }
  v6 = objc_msgSend(v4, "containsTrait:", v5);

  if (v6)
  {
    -[UIView traitOverrides](self, "traitOverrides");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeTrait:", v5);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UITabBar;
  -[UIView _didMoveFromWindow:toWindow:](&v11, sel__didMoveFromWindow_toWindow_, a3, v6);
  if (v6 && !-[UIView _canDrawContent](self, "_canDrawContent"))
  {
    objc_msgSend(v6, "screen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    v9 = v8;
    -[UIView layer](self, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRasterizationScale:", v9);

  }
}

- (void)_setBackgroundView:(id)a3
{
  -[_UITabBarVisualProvider _shim_setCustomBackgroundView:](self->_visualProvider, "_shim_setCustomBackgroundView:", a3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_UITabBarVisualProvider teardown](self->_visualProvider, "teardown");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIAccessibilityButtonShapesEnabledStatusDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)UITabBar;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (void)setTranslucent:(BOOL)translucent
{
  $A65F59733608D94F9E77A112F9FC6161 tabBarFlags;
  unsigned int v4;

  tabBarFlags = self->_tabBarFlags;
  if (translucent)
    v4 = 128;
  else
    v4 = 256;
  self->_tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&tabBarFlags & 0xFFFFFC7F | v4);
  if (((*(unsigned int *)&tabBarFlags >> 7) & 7) != v4 >> 7)
    -[UITabBar _setBackgroundNeedsUpdate:](self, "_setBackgroundNeedsUpdate:", 1);
}

- (void)setBarTintColor:(UIColor *)barTintColor
{
  UIColor *v4;
  _UITabBarAppearanceStorage *appearanceStorage;
  _UITabBarAppearanceStorage *v6;
  _UITabBarAppearanceStorage *v7;
  UIColor *v8;
  UIColor *v9;

  v4 = barTintColor;
  appearanceStorage = self->_appearanceStorage;
  v9 = v4;
  if (v4)
  {
    if (!appearanceStorage)
    {
      v6 = objc_alloc_init(_UITabBarAppearanceStorage);
      v7 = self->_appearanceStorage;
      self->_appearanceStorage = v6;

      appearanceStorage = self->_appearanceStorage;
    }
  }
  else if (!appearanceStorage)
  {
    goto LABEL_7;
  }
  -[_UITabBarAppearanceStorage barTintColor](appearanceStorage, "barTintColor");
  v8 = (UIColor *)objc_claimAutoreleasedReturnValue();

  v4 = v9;
  if (v8 != v9)
  {
    -[_UITabBarAppearanceStorage setBarTintColor:](self->_appearanceStorage, "setBarTintColor:", v9);
    -[UITabBar _effectiveBarTintColorDidChange](self, "_effectiveBarTintColorDidChange");
    v4 = v9;
  }
LABEL_7:

}

- (void)_effectiveBarTintColorDidChange
{
  -[UITabBar _setBackgroundNeedsUpdate:](self, "_setBackgroundNeedsUpdate:", 1);
}

- (void)_setMinimumWidthForHorizontalLayout:(double)a3
{
  -[_UITabBarVisualProvider setMinimumWidthForHorizontalLayout:](self->_visualProvider, "setMinimumWidthForHorizontalLayout:", a3);
}

- (NSString)_backdropViewLayerGroupName
{
  void *v2;
  void *v3;
  void *v4;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForTrait:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setStandardAppearance:(UITabBarAppearance *)standardAppearance
{
  UITabBarAppearance *v4;
  UITabBarAppearance *v5;
  UITabBarAppearance *v6;
  BOOL v7;
  UITabBarAppearance *v8;
  UITabBarAppearance *v9;
  UITabBarAppearance *v10;
  UITabBarAppearance *v11;
  void *v12;
  UITabBarAppearance *v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  UITabBarAppearance *v21;

  v4 = standardAppearance;
  v5 = self->_standardAppearance;
  v6 = v4;
  v21 = v6;
  if (v5 == v6)
  {

    v8 = v21;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[UIBarAppearance isEqual:](v5, "isEqual:", v6);

      if (v7)
        goto LABEL_22;
    }
    else
    {

    }
    v8 = self->_standardAppearance;
    v9 = self->_standardAppearance;
    if (v9)
      objc_storeWeak((id *)&v9->super._changeObserver, 0);
    v10 = -[UIBarAppearance copy](v21, "copy");
    v11 = self->_standardAppearance;
    self->_standardAppearance = v10;

    -[UITabBar _installDefaultAppearance](self, "_installDefaultAppearance");
    -[_UITabBarVisualProvider appearanceObserver](self->_visualProvider, "appearanceObserver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->_standardAppearance;
    if (v13)
      objc_storeWeak((id *)&v13->super._changeObserver, v12);

    -[_UITabBarVisualProvider backgroundTransitionProgress](self->_visualProvider, "backgroundTransitionProgress");
    if (v14 < 1.0)
    {
      -[UIBarAppearance _backgroundData](self->_standardAppearance, "_backgroundData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBarAppearance _backgroundData](v8, "_backgroundData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v15;
      v18 = v16;
      if (v17 == v18)
      {

      }
      else
      {
        v19 = v18;
        if (v17 && v18)
        {
          v20 = objc_msgSend(v17, "isEqual:", v18);

          if ((v20 & 1) != 0)
            goto LABEL_21;
        }
        else
        {

        }
        -[UITabBar _setBackgroundNeedsUpdate:](self, "_setBackgroundNeedsUpdate:", 1);
      }
    }
  }
LABEL_21:

LABEL_22:
  -[UITabBar _useModernAppearance](self, "_useModernAppearance");

}

- (UITabBarAppearance)standardAppearance
{
  UITabBarAppearance *standardAppearance;

  standardAppearance = self->_standardAppearance;
  if (!standardAppearance)
  {
    -[UITabBar _installDefaultAppearance](self, "_installDefaultAppearance");
    standardAppearance = self->_standardAppearance;
  }
  return standardAppearance;
}

- (void)setScrollEdgeAppearance:(UITabBarAppearance *)scrollEdgeAppearance
{
  UITabBarAppearance *v4;
  UITabBarAppearance *v5;
  UITabBarAppearance *v6;
  BOOL v7;
  UITabBarAppearance *v8;
  UITabBarAppearance *v9;
  UITabBarAppearance *v10;
  UITabBarAppearance *v11;
  void *v12;
  UITabBarAppearance *v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  UITabBarAppearance *v21;

  v4 = scrollEdgeAppearance;
  v5 = self->_scrollEdgeAppearance;
  v6 = v4;
  v21 = v6;
  if (v5 == v6)
  {

    v8 = v21;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[UIBarAppearance isEqual:](v5, "isEqual:", v6);

      if (v7)
        goto LABEL_22;
    }
    else
    {

    }
    v8 = self->_scrollEdgeAppearance;
    v9 = self->_scrollEdgeAppearance;
    if (v9)
      objc_storeWeak((id *)&v9->super._changeObserver, 0);
    v10 = -[UIBarAppearance copy](v21, "copy");
    v11 = self->_scrollEdgeAppearance;
    self->_scrollEdgeAppearance = v10;

    -[UITabBar _installDefaultAppearance](self, "_installDefaultAppearance");
    -[_UITabBarVisualProvider appearanceObserver](self->_visualProvider, "appearanceObserver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->_scrollEdgeAppearance;
    if (v13)
      objc_storeWeak((id *)&v13->super._changeObserver, v12);

    -[_UITabBarVisualProvider backgroundTransitionProgress](self->_visualProvider, "backgroundTransitionProgress");
    if (v14 > 0.0)
    {
      -[UIBarAppearance _backgroundData](self->_scrollEdgeAppearance, "_backgroundData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBarAppearance _backgroundData](v8, "_backgroundData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v15;
      v18 = v16;
      if (v17 == v18)
      {

      }
      else
      {
        v19 = v18;
        if (v17 && v18)
        {
          v20 = objc_msgSend(v17, "isEqual:", v18);

          if ((v20 & 1) != 0)
            goto LABEL_21;
        }
        else
        {

        }
        -[UITabBar _setBackgroundNeedsUpdate:](self, "_setBackgroundNeedsUpdate:", 1);
      }
    }
  }
LABEL_21:

LABEL_22:
  -[UITabBar _useModernAppearance](self, "_useModernAppearance");

}

- (void)_installDefaultAppearance
{
  UITabBarAppearance *v3;
  UITabBarAppearance *standardAppearance;
  void *v5;
  UITabBarAppearance *v6;
  void *v7;

  if (!self->_standardAppearance)
  {
    v3 = (UITabBarAppearance *)objc_opt_new();
    standardAppearance = self->_standardAppearance;
    self->_standardAppearance = v3;

    -[_UITabBarVisualProvider appearanceObserver](self->_visualProvider, "appearanceObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = self->_standardAppearance;
    if (v6)
    {
      v7 = v5;
      objc_storeWeak((id *)&v6->super._changeObserver, v5);
      v5 = v7;
    }

  }
}

- (void)_useModernAppearance
{
  -[_UITabBarVisualProvider setUseModernAppearance:](self->_visualProvider, "setUseModernAppearance:", 1);
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITabBar;
  -[UIView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  -[_UITabBarVisualProvider setSemanticContentAttribute:](self->_visualProvider, "setSemanticContentAttribute:", a3);
}

- (void)setBarStyle:(UIBarStyle)barStyle
{
  unint64_t tabBarFlags;

  if ((unint64_t)barStyle >= UIBarStyleBlackTranslucent)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Bar style not supported by UITabBar. Supported bar styles are UIBarStyleDefault and UIBarStyleBlack"));
  tabBarFlags = self->_tabBarFlags;
  if (((tabBarFlags >> 4) & 7) != barStyle)
  {
    self->_tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(tabBarFlags & 0xFFFFFF8F | (16 * (barStyle & 7)));
    -[UITabBar _setBackgroundNeedsUpdate:](self, "_setBackgroundNeedsUpdate:", 1);
  }
}

- (void)setAlpha:(double)a3
{
  double v5;
  double v6;
  _UITabBarDelegateInternal **p_delegate;
  id WeakRetained;
  char v9;
  id v10;
  objc_super v11;

  -[UIView alpha](self, "alpha");
  v6 = v5;
  v11.receiver = self;
  v11.super_class = (Class)UITabBar;
  -[UIView setAlpha:](&v11, sel_setAlpha_, a3);
  if (!-[UIView isHidden](self, "isHidden") && (a3 == 0.0 && v6 != 0.0 || a3 != 0.0 && v6 == 0.0))
  {
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v10, "_tabBarVisibilityDidChange");

    }
  }
}

- (void)setBackgroundEffects:(id)a3
{
  NSArray *v4;
  NSArray *backgroundEffects;
  BOOL v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;

  v4 = (NSArray *)a3;
  backgroundEffects = self->_backgroundEffects;
  if (backgroundEffects != v4)
  {
    v9 = v4;
    v6 = -[NSArray isEqualToArray:](backgroundEffects, "isEqualToArray:", v4);
    v4 = v9;
    if (!v6)
    {
      v7 = (NSArray *)-[NSArray copy](v9, "copy");
      v8 = self->_backgroundEffects;
      self->_backgroundEffects = v7;

      -[UITabBar _setBackgroundNeedsUpdate:](self, "_setBackgroundNeedsUpdate:", 1);
      v4 = v9;
    }
  }

}

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[UITabBar isLocked](self, "isLocked"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Cannot choose layout method for UITabBar managed by a controller"));
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UITabBar;
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](&v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, v3);
  }
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
  UIImage *v4;
  _UITabBarAppearanceStorage *appearanceStorage;
  UIImage *v6;
  _UITabBarAppearanceStorage *v7;
  _UITabBarAppearanceStorage *v8;
  double v9;
  uint64_t v10;
  UIImage *v11;
  UIImage *v12;
  UIImage *v13;

  v4 = backgroundImage;
  appearanceStorage = self->_appearanceStorage;
  if (v4)
  {
    v6 = v4;
    v12 = v4;
    if (!appearanceStorage)
    {
      v7 = objc_alloc_init(_UITabBarAppearanceStorage);
      v8 = self->_appearanceStorage;
      self->_appearanceStorage = v7;

      v6 = v12;
    }
    if (-[UIImage _isResizable](v6, "_isResizable") || (-[UIImage size](v12, "size"), v9 <= 1.0))
    {
      v4 = v12;
    }
    else
    {
      -[UIImage resizableImageWithCapInsets:](v12, "resizableImageWithCapInsets:", 0.0, 0.0, 0.0, 0.0);
      v10 = objc_claimAutoreleasedReturnValue();

      v4 = (UIImage *)v10;
    }
  }
  else if (!appearanceStorage)
  {
    goto LABEL_11;
  }
  v13 = v4;
  -[_UITabBarAppearanceStorage backgroundImage](self->_appearanceStorage, "backgroundImage");
  v11 = (UIImage *)objc_claimAutoreleasedReturnValue();

  v4 = v13;
  if (v13 != v11)
  {
    -[_UITabBarAppearanceStorage setBackgroundImage:](self->_appearanceStorage, "setBackgroundImage:", v13);
    -[UITabBar _setBackgroundNeedsUpdate:](self, "_setBackgroundNeedsUpdate:", 1);
    v4 = v13;
  }
LABEL_11:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundEffects, 0);
  objc_storeStrong((id *)&self->__expectedSuperviewFollowingAnimation, 0);
  objc_storeStrong((id *)&self->_scrollEdgeAppearance, 0);
  objc_storeStrong((id *)&self->_standardAppearance, 0);
  objc_storeStrong((id *)&self->_trailingBarAccessoryView, 0);
  objc_storeStrong((id *)&self->_leadingBarAccessoryView, 0);
  objc_storeStrong((id *)&self->_visualProvider, 0);
  objc_storeStrong((id *)&self->_appearanceStorage, 0);
  objc_storeStrong((id *)&self->_customizationItems, 0);
  objc_destroyWeak((id *)&self->_selectedItem);
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_customizeView, 0);
}

- (UIImage)shadowImage
{
  return -[_UITabBarAppearanceStorage shadowImage](self->_appearanceStorage, "shadowImage");
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITabBar;
  -[UIView description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_standardAppearance)
    objc_msgSend(v4, "appendFormat:", CFSTR(" standardAppearance=%p"), self->_standardAppearance);
  if (self->_scrollEdgeAppearance)
    objc_msgSend(v4, "appendFormat:", CFSTR(" scrollEdgeAppearance=%p"), self->_scrollEdgeAppearance);
  return (NSString *)v4;
}

- (UIView)_backgroundView
{
  return (UIView *)-[_UITabBarVisualProvider _shim_compatibilityBackgroundView](self->_visualProvider, "_shim_compatibilityBackgroundView");
}

- (void)_setLabelFont:(id)a3
{
  id v4;
  _UITabBarAppearanceStorage *appearanceStorage;
  _UITabBarAppearanceStorage *v6;
  _UITabBarAppearanceStorage *v7;
  void *v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    v6 = objc_alloc_init(_UITabBarAppearanceStorage);
    v7 = self->_appearanceStorage;
    self->_appearanceStorage = v6;

    appearanceStorage = self->_appearanceStorage;
  }
  -[_UITabBarAppearanceStorage tabItemAppearanceStorage](appearanceStorage, "tabItemAppearanceStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)off_1E1678D90;
  objc_msgSend(v8, "setTextAttribute:forKey:state:", v4, *(_QWORD *)off_1E1678D90, 0);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_items;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "_setTitleTextAttributeValue:forAttributeKey:state:", v4, v9, 0, (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)_setLabelTextColor:(id)a3 selectedTextColor:(id)a4
{
  id v6;
  id v7;
  _UITabBarAppearanceStorage *appearanceStorage;
  _UITabBarAppearanceStorage *v9;
  _UITabBarAppearanceStorage *v10;
  void *v11;
  uint64_t v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    v9 = objc_alloc_init(_UITabBarAppearanceStorage);
    v10 = self->_appearanceStorage;
    self->_appearanceStorage = v9;

    appearanceStorage = self->_appearanceStorage;
  }
  -[_UITabBarAppearanceStorage tabItemAppearanceStorage](appearanceStorage, "tabItemAppearanceStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)off_1E1678D98;
  objc_msgSend(v11, "setTextAttribute:forKey:state:", v6, *(_QWORD *)off_1E1678D98, 0);
  objc_msgSend(v11, "setTextAttribute:forKey:state:", v7, v12, 4);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = self->_items;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v18, "_setTitleTextAttributeValue:forAttributeKey:state:", v6, v12, 0, (_QWORD)v19);
        objc_msgSend(v18, "_setTitleTextAttributeValue:forAttributeKey:state:", v7, v12, 4);
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }

}

- (void)_setLabelShadowColor:(id)a3
{
  id v4;
  _UITabBarAppearanceStorage *appearanceStorage;
  _UITabBarAppearanceStorage *v6;
  _UITabBarAppearanceStorage *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    v6 = objc_alloc_init(_UITabBarAppearanceStorage);
    v7 = self->_appearanceStorage;
    self->_appearanceStorage = v6;

    appearanceStorage = self->_appearanceStorage;
  }
  -[_UITabBarAppearanceStorage tabItemAppearanceStorage](appearanceStorage, "tabItemAppearanceStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)off_1E1679048;
  objc_msgSend(v8, "textAttributeForKey:state:", *(_QWORD *)off_1E1679048, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (!v10)
    v10 = objc_alloc_init((Class)off_1E1679CA0);
  objc_msgSend(v10, "setShadowColor:", v4);
  -[_UITabBarAppearanceStorage tabItemAppearanceStorage](self->_appearanceStorage, "tabItemAppearanceStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextAttribute:forKey:state:", v10, v9, 0);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = self->_items;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "_setTitleTextAttributeValue:forAttributeKey:state:", v10, v9, 0, (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (void)_setLabelShadowOffset:(CGSize)a3
{
  double height;
  double width;
  _UITabBarAppearanceStorage *appearanceStorage;
  _UITabBarAppearanceStorage *v7;
  _UITabBarAppearanceStorage *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  height = a3.height;
  width = a3.width;
  v23 = *MEMORY[0x1E0C80C00];
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    v7 = objc_alloc_init(_UITabBarAppearanceStorage);
    v8 = self->_appearanceStorage;
    self->_appearanceStorage = v7;

    appearanceStorage = self->_appearanceStorage;
  }
  -[_UITabBarAppearanceStorage tabItemAppearanceStorage](appearanceStorage, "tabItemAppearanceStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)off_1E1679048;
  objc_msgSend(v9, "textAttributeForKey:state:", *(_QWORD *)off_1E1679048, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (!v11)
    v11 = objc_alloc_init((Class)off_1E1679CA0);
  objc_msgSend(v11, "setShadowOffset:", width, height);
  -[_UITabBarAppearanceStorage tabItemAppearanceStorage](self->_appearanceStorage, "tabItemAppearanceStorage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextAttribute:forKey:state:", v11, v10, 0);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = self->_items;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17++), "_setTitleTextAttributeValue:forAttributeKey:state:", v11, v10, 0, (_QWORD)v18);
      }
      while (v15 != v17);
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

}

- (void)_setVibrantLabels:(BOOL)a3
{
  int v3;

  if (((((*(_DWORD *)&self->_tabBarFlags & 0x2000) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v3 = 0x2000;
    else
      v3 = 0;
    self->_tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&self->_tabBarFlags & 0xFFFFDFFF | v3);
  }
}

- (BOOL)_vibrantLabels
{
  return (*((unsigned __int8 *)&self->_tabBarFlags + 1) >> 5) & 1;
}

- (BOOL)_blurEnabled
{
  return 1;
}

- (void)_setDisableBlurTinting:(BOOL)a3
{
  int v3;

  if (((((*(_DWORD *)&self->_tabBarFlags & 0x4000) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v3 = 0x4000;
    else
      v3 = 0;
    self->_tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&self->_tabBarFlags & 0xFFFFBFFF | v3);
    -[UITabBar _setBackgroundNeedsUpdate:](self, "_setBackgroundNeedsUpdate:", 1);
  }
}

- (void)_tabDataProviderContentDidChange:(id)a3
{
  -[_UITabBarVisualProvider updateItem:](self->_visualProvider, "updateItem:", a3);
}

- (double)_nextSelectionSlideDuration
{
  return 0.0;
}

- (UIView)_accessoryView
{
  return (UIView *)-[_UITabBarVisualProvider _shim_accessoryView](self->_visualProvider, "_shim_accessoryView");
}

- (double)_minimumWidthForHorizontalLayout
{
  double result;

  -[_UITabBarVisualProvider minimumWidthForHorizontalLayout](self->_visualProvider, "minimumWidthForHorizontalLayout");
  return result;
}

- (double)_shadowAlpha
{
  void *v2;
  double v3;
  double v4;

  -[_UITabBarVisualProvider _shim_shadowView](self->_visualProvider, "_shim_shadowView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v4 = v3;

  return v4;
}

- (void)_setShadowAlpha:(double)a3
{
  id v4;

  -[_UITabBarVisualProvider _shim_shadowView](self->_visualProvider, "_shim_shadowView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", a3);

}

- (void)_setSuspendBackgroundUpdates:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&self->_tabBarFlags & 0xFFFBFFFF | v3);
  if (!a3)
    -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_suspendBackgroundUpdates
{
  return (*((unsigned __int8 *)&self->_tabBarFlags + 2) >> 2) & 1;
}

- (BOOL)_backgroundNeedsUpdate
{
  return (*((unsigned __int8 *)&self->_tabBarFlags + 1) >> 2) & 1;
}

- (void)_setTabBarSizing:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  int64_t barMetrics;
  int64_t v8;
  id WeakRetained;

  -[UIView _screen](self, "_screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_userInterfaceIdiom");

  self->_tabBarSizing = a3;
  barMetrics = self->_barMetrics;
  if (a3 == 2)
  {
    v8 = 2;
  }
  else if ((unint64_t)(v6 - 2) > 6)
  {
    v8 = 0;
  }
  else
  {
    v8 = qword_1866795C8[v6 - 2];
  }
  self->_barMetrics = v8;
  if (barMetrics != v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "tabBarSizingDidChange:", self);

  }
}

- (UITabBar)initWithCoder:(id)a3
{
  id v4;
  UITabBar *v5;
  UITabBar *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  UITabBarAppearance *standardAppearance;
  uint64_t v20;
  UITabBarAppearance *scrollEdgeAppearance;
  double v22;
  double v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UITabBar;
  v5 = -[UIView initWithCoder:](&v25, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[UITabBar _doCommonTabBarPreInit](v5, "_doCommonTabBarPreInit");
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIDelegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v6->_delegate, v7);

    v8 = -[UITabBar isLocked](v6, "isLocked");
    -[UITabBar setLocked:](v6, "setLocked:", 0);
    -[UIView setClipsToBounds:](v6, "setClipsToBounds:", 0);
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UISelectionIndicatorImage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBar setSelectionIndicatorImage:](v6, "setSelectionIndicatorImage:", v9);

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UISpringLoaded")))
    {
      if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UISpringLoaded")))
        v10 = 0x10000;
      else
        v10 = 0;
      v6->_tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&v6->_tabBarFlags & 0xFFFEFFFF | v10);
    }
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIItems"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if ((_DWORD)v8)
        objc_storeStrong((id *)&v6->_items, v11);
      else
        -[UITabBar setItems:animated:](v6, "setItems:animated:", v11, 0);
    }
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UISelectedItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBar setSelectedItem:](v6, "setSelectedItem:", v12);
    -[UITabBar setLocked:](v6, "setLocked:", v8);
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIBarTintColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBar setBarTintColor:](v6, "setBarTintColor:", v13);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIBarUnselectedImageTintColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBar setUnselectedItemTintColor:](v6, "setUnselectedItemTintColor:", v14);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UISelectedImageTintColor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      -[UITabBar setSelectedImageTintColor:](v6, "setSelectedImageTintColor:", v15);
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIShadowImage"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBar setShadowImage:](v6, "setShadowImage:", v16);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIBackgroundImage"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      -[UITabBar setBackgroundImage:](v6, "setBackgroundImage:", v17);
    else
      -[UITabBar _setBackgroundNeedsUpdate:](v6, "_setBackgroundNeedsUpdate:", 1);
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITabBarStandardAppearance"));
    v18 = objc_claimAutoreleasedReturnValue();
    standardAppearance = v6->_standardAppearance;
    v6->_standardAppearance = (UITabBarAppearance *)v18;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITabBarScrollEdgeAppearance"));
    v20 = objc_claimAutoreleasedReturnValue();
    scrollEdgeAppearance = v6->_scrollEdgeAppearance;
    v6->_scrollEdgeAppearance = (UITabBarAppearance *)v20;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UITabBarItemPositioning")))
      v6->_itemPositioning = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UITabBarItemPositioning"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UITabBarItemWidth")))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("UITabBarItemWidth"));
      v6->_itemDimension = v22;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UITabBarItemSpacing")))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("UITabBarItemSpacing"));
      v6->_itemSpacing = v23;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIBarTranslucence")))
      v6->_tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&v6->_tabBarFlags & 0xFFFFFC7F | ((objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIBarTranslucence")) & 7) << 7));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIBarStyle")))
      v6->_tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&v6->_tabBarFlags & 0xFFFFFF8F | (16 * (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIBarStyle")) & 7)));

  }
  -[UITabBar _doCommonTabBarInit](v6, "_doCommonTabBarInit");

  return v6;
}

- (BOOL)_shouldDecodeSubviews
{
  return objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_visualProviderClassForTabBar:", self), "shouldDecodeSubviews");
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITabBar;
  v4 = a3;
  -[UIView _populateArchivedSubviews:](&v5, sel__populateArchivedSubviews_, v4);
  -[_UITabBarVisualProvider updateArchivedSubviews:](self->_visualProvider, "updateArchivedSubviews:", v4, v5.receiver, v5.super_class);

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id WeakRetained;
  NSArray *items;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t itemPositioning;
  unint64_t tabBarFlags;
  uint64_t v20;
  uint64_t v21;
  UITabBarAppearance *standardAppearance;
  UITabBarAppearance *scrollEdgeAppearance;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)UITabBar;
  -[UIView encodeWithCoder:](&v24, sel_encodeWithCoder_, v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
    objc_msgSend(v4, "encodeConditionalObject:forKey:", WeakRetained, CFSTR("UIDelegate"));
  items = self->_items;
  if (items)
    objc_msgSend(v4, "encodeObject:forKey:", items, CFSTR("UIItems"));
  v7 = objc_loadWeakRetained((id *)&self->_selectedItem);

  if (v7)
  {
    v8 = objc_loadWeakRetained((id *)&self->_selectedItem);
    objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("UISelectedItem"));

  }
  -[_UITabBarAppearanceStorage barTintColor](self->_appearanceStorage, "barTintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_UITabBarAppearanceStorage barTintColor](self->_appearanceStorage, "barTintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("UIBarTintColor"));

  }
  -[_UITabBarAppearanceStorage unselectedImageTintColor](self->_appearanceStorage, "unselectedImageTintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_UITabBarAppearanceStorage unselectedImageTintColor](self->_appearanceStorage, "unselectedImageTintColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("UIBarUnselectedImageTintColor"));

  }
  -[_UITabBarAppearanceStorage selectedImageTintColor](self->_appearanceStorage, "selectedImageTintColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_UITabBarAppearanceStorage selectedImageTintColor](self->_appearanceStorage, "selectedImageTintColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("UISelectedImageTintColor"));

  }
  -[_UITabBarAppearanceStorage selectionIndicatorImage](self->_appearanceStorage, "selectionIndicatorImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("UISelectionIndicatorImage"));
  -[_UITabBarAppearanceStorage shadowImage](self->_appearanceStorage, "shadowImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("UIShadowImage"));
  -[_UITabBarAppearanceStorage backgroundImage](self->_appearanceStorage, "backgroundImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("UIBackgroundImage"));
  itemPositioning = self->_itemPositioning;
  if (itemPositioning)
    objc_msgSend(v4, "encodeInteger:forKey:", itemPositioning, CFSTR("UITabBarItemPositioning"));
  if (self->_itemDimension > 0.0)
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("UITabBarItemWidth"));
  if (self->_itemSpacing > 0.0)
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("UITabBarItemSpacing"));
  tabBarFlags = self->_tabBarFlags;
  v20 = (tabBarFlags >> 7) & 7;
  if ((_DWORD)v20)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", v20, CFSTR("UIBarTranslucence"));
    LODWORD(tabBarFlags) = self->_tabBarFlags;
  }
  v21 = (tabBarFlags >> 4) & 7;
  if ((_DWORD)v21)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", v21, CFSTR("UIBarStyle"));
    LODWORD(tabBarFlags) = self->_tabBarFlags;
  }
  if ((tabBarFlags & 0x10000) != 0)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UISpringLoaded"));
  if (-[_UITabBarVisualProvider useModernAppearance](self->_visualProvider, "useModernAppearance"))
  {
    standardAppearance = self->_standardAppearance;
    if (standardAppearance)
      objc_msgSend(v4, "encodeObject:forKey:", standardAppearance, CFSTR("UITabBarStandardAppearance"));
    scrollEdgeAppearance = self->_scrollEdgeAppearance;
    if (scrollEdgeAppearance)
      objc_msgSend(v4, "encodeObject:forKey:", scrollEdgeAppearance, CFSTR("UITabBarScrollEdgeAppearance"));
  }

}

- (id)_tabBarItemForButtonAtPoint:(CGPoint)a3
{
  void *v4;
  id *v5;
  NSArray *v6;
  uint64_t v7;
  id *i;
  id *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[UITabBar hitTest:withEvent:](self, "hitTest:withEvent:", 0, a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_items;
    v5 = (id *)-[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v5; i = (id *)((char *)i + 1))
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v6);
          v9 = *(id **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          -[UITabBarItem _tabBarButton](v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10 == v4)
          {
            v5 = v9;
            goto LABEL_12;
          }
        }
        v5 = (id *)-[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return v5;
}

- (double)_heightForCustomizingItems
{
  double result;

  -[_UITabBarVisualProvider _shim_heightForCustomizingItems](self->_visualProvider, "_shim_heightForCustomizingItems");
  return result;
}

- (void)_accessibilityButtonShapesParametersDidChange
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[UITabBar items](self, "items", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        -[UITabBarItem _tabBarButton](*(id **)(*((_QWORD *)&v8 + 1) + 8 * i));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "_isSelected"))
        {
          objc_msgSend(v7, "_showSelectedIndicator:changeSelection:", 1, 0);

          goto LABEL_11;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)_sendAction:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id *v13;
  id v14;
  id WeakRetained;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = self->_items;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(id **)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[UITabBarItem _tabBarButton](v13);
        v14 = (id)objc_claimAutoreleasedReturnValue();

        if (v14 == v6)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(WeakRetained, "tabBar:didSelectItem:", self, v13, (_QWORD)v19);
          if (objc_msgSend(v13, "action", (_QWORD)v19))
          {
            v16 = (void *)UIApp;
            v17 = objc_msgSend(v13, "action");
            objc_msgSend(v13, "target");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "sendAction:toTarget:fromSender:forEvent:", v17, v18, v13, v7);

          }
          goto LABEL_16;
        }
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_16:

}

void __30__UITabBar_setItems_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "textAttributesForState:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleTextAttributes:forState:", v5, 0);

  objc_msgSend(*(id *)(a1 + 32), "textAttributesForState:", 4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleTextAttributes:forState:", v6, 4);

}

- (void)removeConstraint:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (-[UITabBar isLocked](self, "isLocked"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Cannot modify constraints for UITabBar managed by a controller"));
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UITabBar;
    -[UIView removeConstraint:](&v5, sel_removeConstraint_, v4);
  }

}

- (void)beginCustomizingItems:(NSArray *)items
{
  NSArray *v4;
  NSArray *customizationItems;
  id WeakRetained;
  void *v7;
  NSArray *v8;

  v8 = items;
  if (-[UITabBar isLocked](self, "isLocked"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Directly modifying a tab bar managed by a tab bar controller is not allowed."));
  }
  else if (!self->_customizeView)
  {
    v4 = (NSArray *)-[NSArray copy](v8, "copy");
    customizationItems = self->_customizationItems;
    self->_customizationItems = v4;

    -[UITabBar _customizeWithAvailableItems:](self, "_customizeWithAvailableItems:", self->_customizationItems);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UITabBar items](self, "items");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "tabBar:willBeginCustomizingItems:", self, v7);

    }
  }

}

- (BOOL)endCustomizingAnimated:(BOOL)animated
{
  _BOOL8 v3;
  _BOOL4 v5;

  v3 = animated;
  if (-[UITabBar isLocked](self, "isLocked"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Directly modifying a tab bar managed by a tab bar controller is not allowed."));
    LOBYTE(v5) = 0;
  }
  else
  {
    -[UITabBar _dismissCustomizeSheet:](self, "_dismissCustomizeSheet:", v3);
    return (*(_BYTE *)&self->_tabBarFlags >> 1) & 1;
  }
  return v5;
}

- (BOOL)isCustomizing
{
  return self->_customizeView != 0;
}

- (void)_makeCurrentButtonFirstResponder
{
  void *v2;
  id *v3;

  -[UITabBar selectedItem](self, "selectedItem");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[UITabBarItem _tabBarButton](v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "becomeFirstResponder");

}

- (id)preferredFocusedView
{
  return -[_UITabBarVisualProvider preferredFocusedView](self->_visualProvider, "preferredFocusedView");
}

- (void)_setSpringLoaded:(BOOL)a3 force:(BOOL)a4
{
  _BOOL8 v4;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if (a3 || a4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_items;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "setSpringLoaded:", v4, (_QWORD)v12);
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
  if (v4)
    v11 = 0x10000;
  else
    v11 = 0;
  self->_tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&self->_tabBarFlags & 0xFFFEFFFF | v11);
}

- (BOOL)isSpringLoaded
{
  return *((_BYTE *)&self->_tabBarFlags + 2) & 1;
}

- (void)_setDisplayStyle:(int64_t)a3
{
  _UITabBarVisualProvider *visualProvider;
  _UITabBarVisualProvider *v6;
  _UITabBarVisualProvider *v7;

  if (self->_displayStyle != a3)
  {
    -[_UITabBarVisualProvider teardown](self->_visualProvider, "teardown");
    visualProvider = self->_visualProvider;
    self->_visualProvider = 0;

    self->_displayStyle = a3;
    +[UITabBar _visualProviderForTabBar:](UITabBar, "_visualProviderForTabBar:", self);
    v6 = (_UITabBarVisualProvider *)objc_claimAutoreleasedReturnValue();
    v7 = self->_visualProvider;
    self->_visualProvider = v6;

    -[_UITabBarVisualProvider prepare](self->_visualProvider, "prepare");
  }
}

- (void)setShadowImage:(UIImage *)shadowImage
{
  UIImage *v4;
  _UITabBarAppearanceStorage *appearanceStorage;
  UIImage *v6;
  _UITabBarAppearanceStorage *v7;
  _UITabBarAppearanceStorage *v8;
  double v9;
  uint64_t v10;
  UIImage *v11;
  UIImage *v12;
  UIImage *v13;

  v4 = shadowImage;
  appearanceStorage = self->_appearanceStorage;
  if (v4)
  {
    v6 = v4;
    v12 = v4;
    if (!appearanceStorage)
    {
      v7 = objc_alloc_init(_UITabBarAppearanceStorage);
      v8 = self->_appearanceStorage;
      self->_appearanceStorage = v7;

      v6 = v12;
    }
    if (-[UIImage _isResizable](v6, "_isResizable") || (-[UIImage size](v12, "size"), v9 <= 1.0))
    {
      v4 = v12;
    }
    else
    {
      -[UIImage resizableImageWithCapInsets:](v12, "resizableImageWithCapInsets:", 0.0, 0.0, 0.0, 0.0);
      v10 = objc_claimAutoreleasedReturnValue();

      v4 = (UIImage *)v10;
    }
  }
  else if (!appearanceStorage)
  {
    goto LABEL_11;
  }
  v13 = v4;
  -[_UITabBarAppearanceStorage shadowImage](self->_appearanceStorage, "shadowImage");
  v11 = (UIImage *)objc_claimAutoreleasedReturnValue();

  v4 = v13;
  if (v13 != v11)
  {
    -[_UITabBarAppearanceStorage setShadowImage:](self->_appearanceStorage, "setShadowImage:", v13);
    -[UITabBar _setBackgroundNeedsUpdate:](self, "_setBackgroundNeedsUpdate:", 1);
    v4 = v13;
  }
LABEL_11:

}

- (void)setSelectionIndicatorImage:(UIImage *)selectionIndicatorImage
{
  UIImage *v4;
  _UITabBarAppearanceStorage *appearanceStorage;
  _UITabBarAppearanceStorage *v6;
  _UITabBarAppearanceStorage *v7;
  UIImage *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = selectionIndicatorImage;
  appearanceStorage = self->_appearanceStorage;
  if (v4)
  {
    if (!appearanceStorage)
    {
      v6 = objc_alloc_init(_UITabBarAppearanceStorage);
      v7 = self->_appearanceStorage;
      self->_appearanceStorage = v6;

      appearanceStorage = self->_appearanceStorage;
    }
  }
  else if (!appearanceStorage)
  {
    goto LABEL_16;
  }
  -[_UITabBarAppearanceStorage selectionIndicatorImage](appearanceStorage, "selectionIndicatorImage");
  v8 = (UIImage *)objc_claimAutoreleasedReturnValue();

  if (v8 != v4)
  {
    -[_UITabBarAppearanceStorage setSelectionIndicatorImage:](self->_appearanceStorage, "setSelectionIndicatorImage:", v4);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[UIView subviews](self, "subviews", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v14, "_setCustomSelectedIndicatorImage:", v4);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
LABEL_16:

}

- (id)_defaultUnselectedTintColorForDefaultTV
{
  if (_AXSEnhanceBackgroundContrastEnabled())
    +[UIColor whiteColor](UIColor, "whiteColor");
  else
    +[UIColor labelColor](UIColor, "labelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setUnselectedItemTintColor:(UIColor *)unselectedItemTintColor
{
  UIColor *v4;
  _UITabBarAppearanceStorage *appearanceStorage;
  _UITabBarAppearanceStorage *v6;
  _UITabBarAppearanceStorage *v7;
  UIColor *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = unselectedItemTintColor;
  appearanceStorage = self->_appearanceStorage;
  if (v4)
  {
    if (!appearanceStorage)
    {
      v6 = objc_alloc_init(_UITabBarAppearanceStorage);
      v7 = self->_appearanceStorage;
      self->_appearanceStorage = v6;

      appearanceStorage = self->_appearanceStorage;
    }
  }
  else if (!appearanceStorage)
  {
    v9 = 0;
    goto LABEL_16;
  }
  -[_UITabBarAppearanceStorage unselectedImageTintColor](appearanceStorage, "unselectedImageTintColor");
  v8 = (UIColor *)objc_claimAutoreleasedReturnValue();

  if (v8 == v4)
  {
    v9 = v4;
  }
  else
  {
    -[_UITabBarAppearanceStorage setUnselectedImageTintColor:](self->_appearanceStorage, "setUnselectedImageTintColor:", v4);
    -[UITabBar _effectiveUnselectedTintColor](self, "_effectiveUnselectedTintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_items;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          -[UITabBarItem _tabBarButton](*(id **)(*((_QWORD *)&v16 + 1) + 8 * v14));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "_setUnselectedTintColor:", v9, (_QWORD)v16);

          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
LABEL_16:

}

- (UIColor)selectedImageTintColor
{
  return -[_UITabBarAppearanceStorage selectedImageTintColor](self->_appearanceStorage, "selectedImageTintColor");
}

- (id)_shadowView
{
  return -[_UITabBarVisualProvider _shim_shadowView](self->_visualProvider, "_shim_shadowView");
}

- (id)_dividerImageForLeftButtonState:(unint64_t)a3 rightButtonState:(unint64_t)a4
{
  return 0;
}

- (void)_setBarMetrics:(int64_t)a3
{
  id WeakRetained;

  if (self->_barMetrics != a3)
  {
    self->_barMetrics = a3;
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "tabBarSizingDidChange:", self);

  }
}

- (void)_setImageStyle:(int64_t)a3
{
  if (self->_imageStyle != a3)
  {
    self->_imageStyle = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_setShowsHighlightedState:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  self->_showsHighlightedState = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_items;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[UITabBarItem _tabBarButton](*(id **)(*((_QWORD *)&v10 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_setShowsHighlightedState:", v3, (_QWORD)v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_setScrollsItems:(BOOL)a3
{
  if (self->_scrollsItems != a3)
  {
    self->_scrollsItems = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_systemDefaultFocusGroupIdentifier
{
  void *v3;
  char v4;
  void *v5;
  objc_super v7;

  -[UIView _focusBehavior](self, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "focusGroupContainmentBehavior");

  if ((v4 & 0x20) != 0)
  {
    _UIFocusGroupIdentifierForInstance(self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITabBar;
    -[UIView _systemDefaultFocusGroupIdentifier](&v7, sel__systemDefaultFocusGroupIdentifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (int64_t)_rotaryFocusMovementAxis
{
  return 1;
}

- (BOOL)_isEligibleForFocusInteraction
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITabBar;
  return -[UIView _isEligibleForFocusInteraction](&v4, sel__isEligibleForFocusInteraction)
      || -[UITabBar _isHiddenAwaitingFocus](self, "_isHiddenAwaitingFocus");
}

- (BOOL)_isEligibleForFocusOcclusion
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITabBar;
  return -[UIView _isEligibleForFocusOcclusion](&v4, sel__isEligibleForFocusOcclusion)
      || -[UITabBar _isHiddenAwaitingFocus](self, "_isHiddenAwaitingFocus");
}

- (BOOL)canBecomeFocused
{
  void *v3;
  int v4;

  -[UIView _focusBehavior](self, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tabBarCanBecomeFocused");

  if (v4)
    return !-[UIView _isFocusedOrAncestorOfFocusedView](self, "_isFocusedOrAncestorOfFocusedView");
  else
    return 0;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (-[_UITabBarVisualProvider shouldUpdateFocusInContext:](self->_visualProvider, "shouldUpdateFocusInContext:", v4))
  {
    v7.receiver = self;
    v7.super_class = (Class)UITabBar;
    v5 = -[UIView shouldUpdateFocusInContext:](&v7, sel_shouldUpdateFocusInContext_, v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  -[_UITabBarVisualProvider didUpdateFocusInContext:withAnimationCoordinator:](self->_visualProvider, "didUpdateFocusInContext:withAnimationCoordinator:", a3, a4);
}

- (BOOL)_isHiddenAwaitingFocus
{
  return (*((unsigned __int8 *)&self->_tabBarFlags + 1) >> 3) & 1;
}

- (void)_setHiddenAwaitingFocus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&self->_tabBarFlags & 0xFFFFF7FF | v3);
}

- (BOOL)_focusedItemHighlightShouldBeVisible
{
  return (*((unsigned __int8 *)&self->_tabBarFlags + 1) >> 4) & 1;
}

- (void)_setFocusedItemHightlightShouldBeVisible:(BOOL)a3
{
  int v3;

  if (((((*(_DWORD *)&self->_tabBarFlags & 0x1000) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v3 = 4096;
    else
      v3 = 0;
    self->_tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&self->_tabBarFlags & 0xFFFFEFFF | v3);
    -[_UITabBarVisualProvider _shim_updateFocusHighlightVisibility](self->_visualProvider, "_shim_updateFocusHighlightVisibility");
  }
}

- (BOOL)_pendingFocusAction
{
  return *((unsigned __int8 *)&self->_tabBarFlags + 1) >> 7;
}

- (void)_setPendingFocusAction:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&self->_tabBarFlags & 0xFFFF7FFF | v3);
}

- (UITabBarItem)_focusedTabBarItem
{
  NSArray *v2;
  id *v3;
  uint64_t v4;
  id *i;
  id *v6;
  void *v7;
  char v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_items;
  v3 = (id *)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (id *)((char *)i + 1))
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(id **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        -[UITabBarItem _tabBarButton](v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isFocused", (_QWORD)v10);

        if ((v8 & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id *)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (UITabBarItem *)v3;
}

- (int64_t)_focusedIndex
{
  void *v3;
  void *v4;
  int64_t v5;

  -[UITabBar items](self, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBar _focusedTabBarItem](self, "_focusedTabBarItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "indexOfObject:", v4);

  return v5;
}

- (BOOL)_deferViewUpdateToFocusUpdate
{
  return 0;
}

- (void)_tabBarFinishedAnimating
{
  objc_msgSend((id)UIApp, "setIgnoresInteractionEvents:", 0);
}

- (void)dismissCustomizeSheet:(BOOL)a3
{
  if (self->_customizeView)
    -[UITabBar _dismissCustomizeSheet:](self, "_dismissCustomizeSheet:", a3);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  UITabBar *v5;
  objc_super v7;

  if (self->_customizeView)
  {
    if (-[UIView pointInside:withEvent:](self, "pointInside:withEvent:", a4, a3.x, a3.y))
      v5 = self;
    else
      v5 = 0;
    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITabBar;
    -[UIView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  if (self->_customizeView)
  {
    -[UITabBarCustomizeView tabBarTouchesBegan:withEvent:](self->_customizeView, "tabBarTouchesBegan:withEvent:", a3, a4);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)UITabBar;
    -[UIResponder touchesBegan:withEvent:](&v4, sel_touchesBegan_withEvent_, a3, a4);
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  if (self->_customizeView)
  {
    -[UITabBarCustomizeView tabBarTouchesMoved:withEvent:](self->_customizeView, "tabBarTouchesMoved:withEvent:", a3, a4);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)UITabBar;
    -[UIResponder touchesMoved:withEvent:](&v4, sel_touchesMoved_withEvent_, a3, a4);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  if (self->_customizeView)
  {
    -[UITabBarCustomizeView tabBarTouchesEnded:withEvent:](self->_customizeView, "tabBarTouchesEnded:withEvent:", a3, a4);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)UITabBar;
    -[UIResponder touchesEnded:withEvent:](&v4, sel_touchesEnded_withEvent_, a3, a4);
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  if (self->_customizeView)
  {
    -[UITabBarCustomizeView tabBarTouchesCancelled:withEvent:](self->_customizeView, "tabBarTouchesCancelled:withEvent:", a3, a4);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)UITabBar;
    -[UIResponder touchesCancelled:withEvent:](&v4, sel_touchesCancelled_withEvent_, a3, a4);
  }
}

- (void)_buttonDown:(id)a3
{
  id v4;

  v4 = a3;
  *(_DWORD *)&self->_tabBarFlags &= ~4u;
  if ((dyld_program_sdk_at_least() & 1) == 0)
    -[UITabBar performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__buttonDownDelayed_, v4, 0.2);

}

- (void)_buttonDownDelayed:(id)a3
{
  id v4;

  *(_DWORD *)&self->_tabBarFlags |= 4u;
  v4 = a3;
  -[UITabBar _adjustButtonSelection:](self, "_adjustButtonSelection:", v4);
  objc_msgSend(v4, "sendActionsForControlEvents:", 0x40000000);

}

- (void)_buttonUp:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__buttonDownDelayed_);
  if ((*(_BYTE *)&self->_tabBarFlags & 4) == 0)
  {
    -[UITabBar _adjustButtonSelection:](self, "_adjustButtonSelection:", v4);
    objc_msgSend(v4, "sendActionsForControlEvents:", 0x40000000);
  }
  if (objc_msgSend(v4, "isFirstResponder"))
    objc_msgSend(v4, "resignFirstResponder");

}

- (void)_buttonCancel:(id)a3
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__buttonDownDelayed_, a3);
}

- (void)_adjustButtonSelection:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id *v10;
  id v11;
  _BOOL8 v12;
  $A65F59733608D94F9E77A112F9FC6161 tabBarFlags;
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
  v5 = self->_items;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id **)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[UITabBarItem _tabBarButton](v10);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          v12 = -[UITabBar isLocked](self, "isLocked", (_QWORD)v14);
          -[UITabBar setLocked:](self, "setLocked:", 0);
          tabBarFlags = self->_tabBarFlags;
          if (v12)
            self->_tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&tabBarFlags | 0x40000);
          -[UITabBar setSelectedItem:](self, "setSelectedItem:", v10);
          self->_tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&self->_tabBarFlags & 0xFFFBFFFF | (((*(unsigned int *)&tabBarFlags >> 18) & 1) << 18));
          -[UITabBar setLocked:](self, "setLocked:", v12);
          goto LABEL_13;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)_dismissCustomizeSheet:(BOOL)a3
{
  _BOOL4 v3;
  NSArray *customizationItems;
  uint64_t v6;
  void (**v7)(void *, uint64_t);
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  _QWORD v14[9];
  _QWORD aBlock[5];

  v3 = a3;
  customizationItems = self->_customizationItems;
  if (customizationItems)
  {
    self->_customizationItems = 0;

  }
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__UITabBar__dismissCustomizeSheet___block_invoke;
  aBlock[3] = &unk_1E16B3FD8;
  aBlock[4] = self;
  v7 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if (v3)
  {
    -[UIView frame](self->_customizeView, "frame");
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __35__UITabBar__dismissCustomizeSheet___block_invoke_2;
    v14[3] = &unk_1E16B20D8;
    v14[4] = self;
    v14[5] = v8;
    *(double *)&v14[6] = v9 + v10;
    v14[7] = v11;
    *(double *)&v14[8] = v10;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v14, v7, 0.33);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UITabBar items](self, "items");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "tabBar:willEndCustomizingItems:changed:", self, v13, (*(_DWORD *)&self->_tabBarFlags >> 1) & 1);

  }
  if (!v3)
    v7[2](v7, 1);

}

void __35__UITabBar__dismissCustomizeSheet___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 424));
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "items");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "tabBar:didEndCustomizingItems:changed:", v2, v3, (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 464) >> 1) & 1);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "removeFromSuperview");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 416);
  *(_QWORD *)(v4 + 416) = 0;

}

uint64_t __35__UITabBar__dismissCustomizeSheet___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setIsBeingDismissed");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "tintTabBarItemsForEdit:", 0);
}

- (void)_customizeDoneButtonAction:(id)a3
{
  -[UITabBar _dismissCustomizeSheet:](self, "_dismissCustomizeSheet:", 1);
}

- (void)_customizeWithAvailableItems:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  char isKindOfClass;
  double v28;
  double v29;
  double v30;
  double v31;
  UISemanticContentAttribute v32;
  UITabBarCustomizeView *v33;
  UITabBarCustomizeView *customizeView;
  UITabBarCustomizeView *v35;
  void *v36;
  UINavigationBar *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  UINavigationBar *v43;
  UINavigationItem *v44;
  UIBarButtonItem *v45;
  void *v46;
  UIBarButtonItem *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  UITabBar *v51;
  _QWORD v52[10];

  v4 = a3;
  if (!self->_customizeView)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "tabBar:willDisplayItemsForCustomization:", self, v4);
    -[UIView superview](self, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[UIView window](self, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "windowScene");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "interfaceOrientation");

    -[UIView window](self, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    __UIStatusBarManagerForWindow(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isStatusBarHidden");

    -[UIView _screen](self, "_screen");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if ((v20 & 1) != 0)
      objc_msgSend(v21, "bounds");
    else
      objc_msgSend(v21, "_applicationFrameForInterfaceOrientation:", v17);
    v25 = v23;
    v26 = v24;

    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((unint64_t)(v17 - 3) >= 2)
      v28 = v25;
    else
      v28 = v26;
    if ((unint64_t)(v17 - 3) >= 2)
      v29 = v26;
    else
      v29 = v25;
    if ((isKindOfClass & 1) != 0)
    {
      v30 = v14;
    }
    else
    {
      v12 = v28;
      v30 = v29;
    }
    v31 = v10 + v14;
    v32 = -[UIView semanticContentAttribute](self, "semanticContentAttribute", v28, v29);
    v33 = -[UITabBarCustomizeView initWithFrame:]([UITabBarCustomizeView alloc], "initWithFrame:", v8, v31, v12, v30);
    customizeView = self->_customizeView;
    self->_customizeView = v33;

    objc_msgSend(v6, "_addSubview:positioned:relativeTo:", self->_customizeView, -3, self);
    v35 = self->_customizeView;
    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v35, "setBackgroundColor:", v36);

    -[UIView setSemanticContentAttribute:](self->_customizeView, "setSemanticContentAttribute:", v32);
    v37 = [UINavigationBar alloc];
    -[UIView window](self, "window");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    __UIStatusBarManagerForWindow(v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "statusBarHeight");
    v41 = v40;

    +[UINavigationBar defaultSizeForOrientation:](UINavigationBar, "defaultSizeForOrientation:", v17);
    v43 = -[UINavigationBar initWithFrame:](v37, "initWithFrame:", 0.0, v41, v12, v42);
    -[UIView setAutoresizingMask:](v43, "setAutoresizingMask:", 2);
    -[UINavigationBar _setBarPosition:](v43, "_setBarPosition:", 3);
    -[UINavigationBar setSemanticContentAttribute:](v43, "setSemanticContentAttribute:", v32);
    v44 = -[UINavigationItem initWithTitle:]([UINavigationItem alloc], "initWithTitle:", &stru_1E16EDF20);
    v45 = [UIBarButtonItem alloc];
    _UINSLocalizedStringWithDefaultValue(CFSTR("Done"), CFSTR("Done"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[UIBarButtonItem initWithTitle:style:target:action:](v45, "initWithTitle:style:target:action:", v46, 2, self, sel__customizeDoneButtonAction_);
    -[UINavigationItem setRightBarButtonItem:](v44, "setRightBarButtonItem:", v47);

    -[UINavigationBar pushNavigationItem:animated:](v43, "pushNavigationItem:animated:", v44, 0);
    -[UITabBarCustomizeView setNavigationBar:](self->_customizeView, "setNavigationBar:", v43);
    -[UIView addSubview:](self->_customizeView, "addSubview:", v43);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "tabBar:willShowCustomizationSheet:withNavigationBar:", self, self->_customizeView, v43);
    -[UITabBarCustomizeView setTabBar:currentItems:availableItems:](self->_customizeView, "setTabBar:currentItems:availableItems:", self, self->_items, v4);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "tabBar:didDisplayItemsForCustomization:", self, v4);
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __41__UITabBar__customizeWithAvailableItems___block_invoke;
    v52[3] = &unk_1E16B20D8;
    v52[4] = self;
    *(double *)&v52[5] = v8;
    *(double *)&v52[6] = v31 - v30;
    *(double *)&v52[7] = v12;
    *(double *)&v52[8] = v30;
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __41__UITabBar__customizeWithAvailableItems___block_invoke_2;
    v49[3] = &unk_1E16B2218;
    v50 = WeakRetained;
    v51 = self;
    v48 = WeakRetained;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v52, v49, 0.33);
    *(_DWORD *)&self->_tabBarFlags &= ~2u;

  }
}

uint64_t __41__UITabBar__customizeWithAvailableItems___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "tintTabBarItemsForEdit:", 1);
}

void __41__UITabBar__customizeWithAvailableItems___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (*(_QWORD *)(a1 + 32))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v3 = *(void **)(a1 + 32);
      v2 = *(void **)(a1 + 40);
      objc_msgSend(v2, "items");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "tabBar:didBeginCustomizingItems:", v2, v4);

    }
  }
}

- (void)_configureTabBarReplacingItem:(id)a3 withNewItem:(id)a4 swapping:(BOOL)a5
{
  _BOOL4 v5;
  NSArray *v7;
  NSArray *items;
  void *v9;
  void *v10;
  _QWORD aBlock[5];

  v5 = a5;
  -[_UITabBarVisualProvider exchangeItem:withItem:](self->_visualProvider, "exchangeItem:withItem:", a3, a4);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  items = self->_items;
  self->_items = v7;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__UITabBar__configureTabBarReplacingItem_withNewItem_swapping___block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v9 = _Block_copy(aBlock);
  v10 = v9;
  if (v5)
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9, 0.2);
  else
    (*((void (**)(void *))v9 + 2))(v9);
  *(_DWORD *)&self->_tabBarFlags |= 2u;

}

uint64_t __63__UITabBar__configureTabBarReplacingItem_withNewItem_swapping___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_positionAllItems");
}

- (double)_scaleFactorForItems:(id)a3 spacing:(double)a4 dimension:(double)a5 maxWidth:(double)a6
{
  double v7;
  BOOL v8;
  double result;

  -[UITabBar _totalDimensionForItems:spacing:dimension:scaleFactor:](self, "_totalDimensionForItems:spacing:dimension:scaleFactor:", a3, a4, a5, 1.0);
  v8 = v7 <= a6;
  result = 0.9;
  if (v8)
    return 1.0;
  return result;
}

- (double)_totalDimensionForItems:(id)a3 spacing:(double)a4 dimension:(double)a5 scaleFactor:(double)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  id *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    v13 = 0.0;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v15 = *(id **)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[UITabBarItem _tabBarButton](v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITabBarItem _tabBarButton](v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "frame");
        objc_msgSend(v16, "sizeThatFits:", v18, v19);
        v21 = v20;

        v22 = v21 * a6;
        if (v21 * a6 <= 0.0)
          v22 = a5;
        v13 = v13 + v22 + a4;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }
  else
  {
    v13 = 0.0;
  }

  return v13;
}

- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  UITabBar *v5;
  objc_super v7;

  if (self->_customizeView)
  {
    if (-[UIView pointInside:forEvent:](self, "pointInside:forEvent:", a4, a3.x, a3.y))
      v5 = self;
    else
      v5 = 0;
    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITabBar;
    -[UIView hitTest:forEvent:](&v7, sel_hitTest_forEvent_, a4, a3.x, a3.y);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (_UITabBarAccessoryView)_leadingBarAccessoryView
{
  return self->_leadingBarAccessoryView;
}

- (_UITabBarAccessoryView)_trailingBarAccessoryView
{
  return self->_trailingBarAccessoryView;
}

- (UIView)leadingAccessoryView
{
  return -[_UITabBarAccessoryView contentView](self->_leadingBarAccessoryView, "contentView");
}

- (UIView)trailingAccessoryView
{
  return -[_UITabBarAccessoryView contentView](self->_trailingBarAccessoryView, "contentView");
}

- (uint64_t)_performWhileIgnoringLock:(uint64_t)result
{
  void *v2;
  void (**v3)(_QWORD);
  uint64_t v4;

  if (result)
  {
    v2 = (void *)result;
    v3 = a2;
    v4 = objc_msgSend(v2, "isLocked");
    objc_msgSend(v2, "setLocked:", 0);
    v3[2](v3);

    return objc_msgSend(v2, "setLocked:", v4);
  }
  return result;
}

- (void)setItemPositioning:(UITabBarItemPositioning)itemPositioning
{
  self->_itemPositioning = itemPositioning;
}

- (void)setItemWidth:(CGFloat)itemWidth
{
  self->_itemDimension = itemWidth;
}

- (void)setItemSpacing:(CGFloat)itemSpacing
{
  self->_itemSpacing = itemSpacing;
}

- (BOOL)_hidesShadow
{
  return self->_hidesShadow;
}

- (BOOL)_scrollsItems
{
  return self->_scrollsItems;
}

- (unint64_t)_preferredFocusHeading
{
  return self->_preferredFocusHeading;
}

- (void)_setPreferredFocusHeading:(unint64_t)a3
{
  self->_preferredFocusHeading = a3;
}

- (void)set_expectedSuperviewFollowingAnimation:(id)a3
{
  objc_storeStrong((id *)&self->__expectedSuperviewFollowingAnimation, a3);
}

- (int64_t)_displayStyle
{
  return self->_displayStyle;
}

- (BOOL)_hasCustomAutolayoutNeighborSpacingForAttribute:(int64_t *)a3
{
  return 1;
}

- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 inContainer:(id)a5 isGuide:(BOOL)a6
{
  double result;
  objc_super v7;

  result = 0.0;
  if (a6)
  {
    v7.receiver = self;
    v7.super_class = (Class)UITabBar;
    -[UIView _autolayoutSpacingAtEdge:forAttribute:inContainer:isGuide:](&v7, sel__autolayoutSpacingAtEdge_forAttribute_inContainer_isGuide_, *(_QWORD *)&a3, a4, a5, 1, 0.0);
  }
  return result;
}

- (double)_defaultAutolayoutSpacing
{
  return 0.0;
}

@end
