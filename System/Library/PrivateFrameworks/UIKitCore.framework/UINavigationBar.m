@implementation UINavigationBar

- (BOOL)_subclassImplementsDrawRect
{
  uint64_t v3;
  BOOL v4;

  if (!__drawRectUINavigationBarIMP)
    __drawRectUINavigationBarIMP = +[UINavigationBar instanceMethodForSelector:](UINavigationBar, "instanceMethodForSelector:", sel_drawRect_);
  v3 = -[UINavigationBar methodForSelector:](self, "methodForSelector:", sel_drawRect_);
  if (v3)
    v4 = v3 == __drawRectUINavigationBarIMP;
  else
    v4 = 1;
  return !v4;
}

+ (void)_initializeForIdiom:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  UIImage *v7;
  void *v8;
  uint64_t v9;
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
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    if (a3 == 2 || a3 == 8)
    {
      v22 = _UIAppearanceContainerForUserInterfaceIdiom();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIBarItem appearanceWhenContainedInInstancesOfClasses:](UIBarButtonItem, "appearanceWhenContainedInInstancesOfClasses:", v19);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"), *(_QWORD *)off_1E1678D90);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTitleTextAttributes:forState:", v6, 0);
    }
    else
    {
      if (a3 != 3)
        return;
      +[UITraitCollection traitCollectionWithUserInterfaceIdiom:](UITraitCollection, "traitCollectionWithUserInterfaceIdiom:", 3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIView appearanceForTraitCollection:](UINavigationBar, "appearanceForTraitCollection:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIBarItem appearanceForTraitCollection:](UIBarButtonItem, "appearanceForTraitCollection:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_alloc_init(UIImage);
      objc_msgSend(v5, "setBackgroundImage:forBarMetrics:", v7, 0);

      +[UIColor _externalBarBackgroundColor](UIColor, "_externalBarBackgroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBackgroundColor:", v8);

      v25[0] = *(_QWORD *)off_1E1678D90;
      v9 = v25[0];
      objc_msgSend(off_1E167A828, "systemFontOfSize:", 17.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v10;
      v25[1] = *(_QWORD *)off_1E1678D98;
      +[UIColor _externalSystemWhiteColor](UIColor, "_externalSystemWhiteColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTitleTextAttributes:", v12);

      objc_msgSend(v5, "setTitleVerticalPositionAdjustment:forBarMetrics:", 0, 0.0);
      +[UIImage _kitImageNamed:withTrait:](UIImage, "_kitImageNamed:withTrait:", CFSTR("UINavigationBarBackIndicatorDefault"), v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "imageFlippedForRightToLeftLayoutDirection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBackIndicatorImage:", v14);

      +[UIImage _kitImageNamed:withTrait:](UIImage, "_kitImageNamed:withTrait:", CFSTR("UINavigationBarTitleTransitionBackIndicatorMask"), v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "imageFlippedForRightToLeftLayoutDirection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBackIndicatorTransitionMaskImage:", v16);

      objc_msgSend(v5, "_setBackIndicatorLeftMargin:", 12.0);
      v23 = v9;
      objc_msgSend(off_1E167A828, "systemFontOfSize:", 17.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTitleTextAttributes:forState:", v18, 0);

    }
  }
}

- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5
{
  void *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UINavigationBar;
  -[UIView _didChangeFromIdiom:onScreen:traverseHierarchy:](&v9, sel__didChangeFromIdiom_onScreen_traverseHierarchy_, a3, a4, a5);
  -[UIView _screen](self, "_screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_userInterfaceIdiom");

  if (v8 != a3 && (a3 == 3 || v8 == 3))
    -[UINavigationBar _accessibilityButtonShapesParametersDidChange](self, "_accessibilityButtonShapesParametersDidChange");
}

- (BOOL)prefersLargeTitles
{
  return self->_prefersLargeTitles;
}

- (int64_t)barPosition
{
  return self->_barPosition;
}

- (double)_overrideBackgroundExtension
{
  return self->__overrideBackgroundExtension;
}

- (_UINavigationBarItemStack)_stack
{
  return self->_stack;
}

- ($1AB5FA073B851C12C2339EC22442E995)_layoutHeightsForNavigationItem:(id)a3 fittingWidth:(double)a4
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _UINavigationBarVisualProvider *visualProvider;
  UINavigationItem *itemForMeasuring;
  double v17;
  double v18;
  double v19;
  $1AB5FA073B851C12C2339EC22442E995 result;

  v7 = a3;
  objc_storeStrong((id *)&self->_visualProvider->_itemForMeasuring, a3);
  if (-[_UINavigationBarVisualProvider shouldUseHeightRangeFittingWidth](self->_visualProvider, "shouldUseHeightRangeFittingWidth"))
  {
    -[_UINavigationBarVisualProvider layoutHeightsFittingWidth:](self->_visualProvider, "layoutHeightsFittingWidth:", a4);
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  else
  {
    -[UINavigationBar sizeThatFits:](self, "sizeThatFits:", a4, 0.0);
    v13 = v14;
    v11 = v14;
    v9 = v14;
  }
  visualProvider = self->_visualProvider;
  itemForMeasuring = visualProvider->_itemForMeasuring;
  visualProvider->_itemForMeasuring = 0;

  v17 = v9;
  v18 = v11;
  v19 = v13;
  result.var2 = v19;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- (id)_accessibility_navigationController
{
  void *v2;
  void *v3;
  id v4;

  -[UINavigationBar _effectiveDelegate](self, "_effectiveDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (BOOL)_hasVariableHeight
{
  return -[_UINavigationBarVisualProvider topItemHasVariableHeight](self->_visualProvider, "topItemHasVariableHeight");
}

- (BOOL)_hasLegacyProvider
{
  return -[_UINavigationBarVisualProvider _shim](self->_visualProvider, "_shim");
}

- (BOOL)supportsRefreshControlHosting
{
  return -[_UINavigationBarVisualProvider supportsRefreshControlHosting](self->_visualProvider, "supportsRefreshControlHosting");
}

- (BOOL)isTranslucent
{
  unint64_t barStyle;
  void *v4;
  void *v5;
  BOOL IsTranslucentOnScreen;
  int64_t barTranslucence;
  void *v8;
  uint64_t v9;
  _UINavigationBarAppearanceStorage *v10;
  void *v11;
  void *v12;
  BOOL v14;

  barStyle = self->_barStyle;
  -[UINavigationBar _effectiveBarTintColor](self, "_effectiveBarTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _screen](self, "_screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IsTranslucentOnScreen = _UIBarStyleWithTintColorIsTranslucentOnScreen(barStyle, (uint64_t)v4, v5);

  v14 = IsTranslucentOnScreen;
  barTranslucence = self->_barTranslucence;
  if (barTranslucence)
    return barTranslucence == 1;
  -[UIView _screen](self, "_screen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_userInterfaceIdiom");

  if (v9 != 3)
  {
    v10 = self->_appearanceStorage;
    if (-[_UIBarAppearanceStorage hasAnyCustomBackgroundImage](v10, "hasAnyCustomBackgroundImage"))
    {
      -[UIView _screen](self, "_screen");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarAppearanceStorage representativeImageForIdiom:](v10, "representativeImageForIdiom:", objc_msgSend(v11, "_userInterfaceIdiom"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "_isInvisibleAndGetIsTranslucent:", &v14);
    }

    return v14;
  }
  return IsTranslucentOnScreen;
}

- (id)_effectiveBarTintColor
{
  return self->_barTintColor;
}

- (id)_appearanceStorage
{
  return self->_appearanceStorage;
}

- (id)_effectiveDelegate
{
  void *v3;
  void *v4;

  -[UINavigationBar topItem](self, "topItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationBar _effectiveDelegateForItem:](self, "_effectiveDelegateForItem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_effectiveDelegateSupportsScrollEdgeTransitionProgress
{
  return (*(_WORD *)&self->_navbarFlags >> 7) & 1;
}

- (UINavigationItem)topItem
{
  return -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
}

- (NSDirectionalEdgeInsets)_resolvedLayoutMargins
{
  NSDirectionalEdgeInsets *p_resolvedLayoutMargins;
  double leading;
  double trailing;
  double v6;
  _BOOL4 v7;
  double v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id WeakRetained;
  char v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double top;
  double bottom;
  NSDirectionalEdgeInsets result;

  p_resolvedLayoutMargins = &self->_resolvedLayoutMargins;
  leading = self->_resolvedLayoutMargins.leading;
  if (leading == -1.79769313e308 || (trailing = self->_resolvedLayoutMargins.trailing, trailing == -1.79769313e308))
  {
    -[UIView _rawLayoutMargins](self, "_rawLayoutMargins");
    v7 = v6 == -1.79769313e308;
    v9 = v8 == -1.79769313e308;
    v10 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    if (v10)
      v11 = v7;
    else
      v11 = v9;
    if (!v10)
      v9 = v7;
    -[UIView directionalLayoutMargins](self, "directionalLayoutMargins");
    v13 = v12;
    v15 = v14;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v17 = objc_opt_respondsToSelector();
    v18 = v13;
    v19 = v15;
    if ((v17 & 1) != 0 && (v9 || v11))
      objc_msgSend(WeakRetained, "_layoutMarginsforNavigationBar:", self);
    if (v9)
      v20 = v18;
    else
      v20 = v13;
    p_resolvedLayoutMargins->leading = v20;
    if (v11)
      v21 = v19;
    else
      v21 = v15;
    p_resolvedLayoutMargins->trailing = v21;

    leading = p_resolvedLayoutMargins->leading;
    trailing = p_resolvedLayoutMargins->trailing;
  }
  top = p_resolvedLayoutMargins->top;
  bottom = p_resolvedLayoutMargins->bottom;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (NSDirectionalEdgeInsets)_resolvedSearchBarMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  -[_UINavigationBarVisualProvider resolvedSearchBarMargins](self->_visualProvider, "resolvedSearchBarMargins");
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- (BOOL)_hostsLayoutEngineAllowsTAMIC_NO
{
  return 0;
}

- (void)setRefreshControlHost:(id)a3
{
  -[_UINavigationBarVisualProvider setRefreshControlHost:](self->_visualProvider, "setRefreshControlHost:", a3);
}

- (_UINavigationControllerRefreshControlHost)refreshControlHost
{
  return -[_UINavigationBarVisualProvider refreshControlHost](self->_visualProvider, "refreshControlHost");
}

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  -[UIView center](self, "center");
  v8 = vabdd_f64(y, v7);
  if (vabdd_f64(x, v6) >= 0.00000011920929 || v8 >= 0.00000011920929)
  {
    v10.receiver = self;
    v10.super_class = (Class)UINavigationBar;
    -[UIView setCenter:](&v10, sel_setCenter_, x, y);
    -[_UINavigationBarVisualProvider _shim_updateBackgroundViewIgnoringFlag](self->_visualProvider, "_shim_updateBackgroundViewIgnoringFlag");
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
  if ((_UIRectEquivalentToRectWithAccuracy(x, y, width, height, v8, v9, v10, v11, 0.00000011920929) & 1) == 0)
  {
    -[UIView bounds](self, "bounds");
    v13 = v12;
    v15 = v14;
    v17.receiver = self;
    v17.super_class = (Class)UINavigationBar;
    -[UIView setBounds:](&v17, sel_setBounds_, x, y, width, height);
    if (width != v13 || height != v15)
      -[UINavigationBar _barSizeDidChange:](self, "_barSizeDidChange:", v13, v15);
  }
}

- (void)_barSizeDidChange:(CGSize)a3
{
  -[_UINavigationBarVisualProvider recordBarSize:](self->_visualProvider, "recordBarSize:", a3.width, a3.height);
  -[_UINavigationBarVisualProvider barSizeChanged](self->_visualProvider, "barSizeChanged");
  -[_UINavigationBarVisualProvider _shim_updateBackgroundViewIgnoringFlag](self->_visualProvider, "_shim_updateBackgroundViewIgnoringFlag");
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
  -[UIView frame](self, "frame");
  if ((_UIRectEquivalentToRectWithAccuracy(x, y, width, height, v8, v9, v10, v11, 0.00000011920929) & 1) == 0)
  {
    -[UIView frame](self, "frame");
    v13 = v12;
    v15 = v14;
    v17.receiver = self;
    v17.super_class = (Class)UINavigationBar;
    -[UIView setFrame:](&v17, sel_setFrame_, x, y, width, height);
    if (width != v13 || height != v15)
      -[UINavigationBar _barSizeDidChange:](self, "_barSizeDidChange:", v13, v15);
  }
}

- (BOOL)_forceScrollEdgeAppearance
{
  return -[_UINavigationBarVisualProvider forceScrollEdgeAppearance](self->_visualProvider, "forceScrollEdgeAppearance");
}

- (int64_t)_barPosition
{
  return self->_barPosition;
}

- (UINavigationBarAppearance)scrollEdgeAppearance
{
  return self->_scrollEdgeAppearance;
}

- (BOOL)_scrollEdgeAppearanceHasChromelessBehavior
{
  return -[_UINavigationBarVisualProvider scrollEdgeAppearanceHasChromelessBehavior](self->_visualProvider, "scrollEdgeAppearanceHasChromelessBehavior");
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UINavigationBar;
  -[UIView safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[_UINavigationBarVisualProvider safeAreaInsetsDidChange](self->_visualProvider, "safeAreaInsetsDidChange");
}

- (int64_t)_activeBarMetrics
{
  return -[_UINavigationBarAppearanceStorage activeBarMetrics](self->_appearanceStorage, "activeBarMetrics");
}

- (BOOL)_hasFixedMaximumHeight
{
  BOOL v3;
  void *v4;

  if (-[_UINavigationBarVisualProvider wantsLargeTitleDisplayed](self->_visualProvider, "wantsLargeTitleDisplayed"))
    return 0;
  -[_UINavigationBarVisualProvider refreshControlHost](self->_visualProvider, "refreshControlHost");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 == 0;

  return v3;
}

- (double)_requestedMaxBackButtonWidth
{
  return self->_requestedMaxBackButtonWidth;
}

- (NSDictionary)largeTitleTextAttributes
{
  return self->_largeTitleTextAttributes;
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  -[_UINavigationBarVisualProvider intrinsicContentSizeInvalidatedForChildView:](self->_visualProvider, "intrinsicContentSizeInvalidatedForChildView:", a3);
}

- (UIImage)backIndicatorTransitionMaskImage
{
  void *v3;
  void *v4;

  -[_UINavigationBarAppearanceStorage backIndicatorImage](self->_appearanceStorage, "backIndicatorImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UINavigationBarAppearanceStorage backIndicatorTransitionMaskImage](self->_appearanceStorage, "backIndicatorTransitionMaskImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (UIImage *)v4;
}

- (UIImage)backIndicatorImage
{
  void *v3;
  void *v4;

  -[_UINavigationBarAppearanceStorage backIndicatorTransitionMaskImage](self->_appearanceStorage, "backIndicatorTransitionMaskImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UINavigationBarAppearanceStorage backIndicatorImage](self->_appearanceStorage, "backIndicatorImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (UIImage *)v4;
}

- (void)_setBarPosition:(int64_t)a3
{
  int64_t v3;

  v3 = 2;
  if (a3)
    v3 = a3;
  if (self->_barPosition != v3)
  {
    self->_barPosition = v3;
    -[_UINavigationBarVisualProvider changeAppearance](self->_visualProvider, "changeAppearance");
  }
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  _UINavigationBarVisualProvider *visualProvider;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  if ((*(_WORD *)&self->_navbarFlags & 0x10) == 0
    || (WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        v6 = objc_msgSend(WeakRetained, "_freezeLayoutForOrientationChangeOnDismissal"),
        WeakRetained,
        (v6 & 1) == 0))
  {
    visualProvider = self->_visualProvider;
    -[UINavigationBar topItem](self, "topItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationBar backItem](self, "backItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarVisualProvider _shim_updateUserContentGuideForTopItem:backItem:](visualProvider, "_shim_updateUserContentGuideForTopItem:backItem:", v8, v9);

    v10.receiver = self;
    v10.super_class = (Class)UINavigationBar;
    -[UIView layoutSublayersOfLayer:](&v10, sel_layoutSublayersOfLayer_, v4);
  }

}

- (UINavigationItem)backItem
{
  return -[_UINavigationBarItemStack backItem](self->_stack, "backItem");
}

- (void)setItems:(NSArray *)items
{
  -[UINavigationBar setItems:animated:](self, "setItems:animated:", items, 0);
}

- (void)invalidateIntrinsicContentSize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UINavigationBar;
  -[UIView invalidateIntrinsicContentSize](&v3, sel_invalidateIntrinsicContentSize);
  -[_UINavigationBarVisualProvider invalidateIntrinsicContentSize](self->_visualProvider, "invalidateIntrinsicContentSize");
}

- (NSDictionary)titleTextAttributes
{
  return -[_UINavigationBarAppearanceStorage textAttributes](self->_appearanceStorage, "textAttributes");
}

- (void)_updatePaletteBackgroundIfNecessary
{
  id WeakRetained;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __54__UINavigationBar__updatePaletteBackgroundIfNecessary__block_invoke;
    v4[3] = &unk_1E16B5C00;
    v4[4] = self;
    objc_msgSend(WeakRetained, "_updatePalettesWithBlock:", v4);
  }

}

uint64_t __54__UINavigationBar__updatePaletteBackgroundIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePalette:", a2);
}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  _UINavigationBarVisualProvider *visualProvider;
  id v5;
  void *v6;
  void *v7;

  visualProvider = self->_visualProvider;
  v5 = a3;
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarVisualProvider traitCollectionForChild:baseTraitCollection:](visualProvider, "traitCollectionForChild:baseTraitCollection:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (UIBarStyle)barStyle
{
  return self->_barStyle;
}

- (BOOL)_hidesShadow
{
  return -[_UINavigationBarAppearanceStorage hidesShadow](self->_appearanceStorage, "hidesShadow");
}

- (NSArray)backgroundEffects
{
  return self->_backgroundEffects;
}

- (UIImage)shadowImage
{
  return -[_UINavigationBarAppearanceStorage shadowImage](self->_appearanceStorage, "shadowImage");
}

- (void)_getBackgroundImage:(id *)a3 shouldRespectOversizedBackgroundImage:(BOOL *)a4 actualBarMetrics:(int64_t *)a5 actualBarPosition:(int64_t *)a6
{
  int64_t v11;
  int64_t v12;
  void *v13;
  int64_t v14;
  double v15;
  _BOOL4 v16;
  _BOOL8 v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  id v23;
  uint64_t v24;
  id *v25;
  int64_t v26;

  v11 = -[UINavigationBar _activeBarMetrics](self, "_activeBarMetrics");
  v12 = -[UINavigationBar _barPosition](self, "_barPosition");
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    -[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self->_appearanceStorage, "backgroundImageForBarPosition:barMetrics:", v12, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
LABEL_3:
      v14 = v12;
      goto LABEL_30;
    }
    -[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self->_appearanceStorage, "backgroundImageForBarPosition:barMetrics:", 0, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = 0;
      goto LABEL_30;
    }
    switch(v11)
    {
      case 0:
LABEL_47:
        v13 = 0;
        goto LABEL_3;
      case 102:
        v24 = 1;
        -[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self->_appearanceStorage, "backgroundImageForBarPosition:barMetrics:", v12, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          goto LABEL_3;
        break;
      case 101:
        -[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self->_appearanceStorage, "backgroundImageForBarPosition:barMetrics:", v12, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          goto LABEL_3;
        v24 = 0;
        break;
      default:
LABEL_48:
        -[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self->_appearanceStorage, "backgroundImageForBarPosition:barMetrics:", v12, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v12;
        if (!v13)
        {
          -[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self->_appearanceStorage, "backgroundImageForBarPosition:barMetrics:", 0, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            v14 = 0;
          else
            v14 = v12;
        }
        goto LABEL_30;
    }
    -[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self->_appearanceStorage, "backgroundImageForBarPosition:barMetrics:", 0, v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    if (v13)
      goto LABEL_30;
    if (v11 == 101)
      goto LABEL_47;
    goto LABEL_48;
  }
  v25 = a3;
  v26 = v11;
  -[UIView bounds](self, "bounds");
  v16 = v15 == 54.0 || v15 == 74.0;
  v17 = v15 == 54.0 || v15 <= 32.0;
  v18 = -[UINavigationBar _barPosition](self, "_barPosition");
  v19 = 102;
  if (!v16)
    v19 = 1;
  v20 = 101;
  if (!v16)
    v20 = 0;
  if (v17)
    v21 = v19;
  else
    v21 = v20;
  -[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self->_appearanceStorage, "backgroundImageForBarPosition:barMetrics:", v18, v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 == 3 && !v13)
  {
    -[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self->_appearanceStorage, "backgroundImageForBarPosition:barMetrics:", 0, v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v13)
    v22 = 0;
  else
    v22 = v16;
  if (v22)
  {
    -[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self->_appearanceStorage, "backgroundImageForBarPosition:barMetrics:", v18, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!v13)
  {
    -[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self->_appearanceStorage, "backgroundImageForBarPosition:barMetrics:", 0, v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      -[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self->_appearanceStorage, "backgroundImageForBarPosition:barMetrics:", v18, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      a3 = v25;
      v11 = v26;
      if (!v13)
      {
        -[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self->_appearanceStorage, "backgroundImageForBarPosition:barMetrics:", 0, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_3;
    }
  }
  v14 = v12;
  a3 = v25;
  v11 = v26;
LABEL_30:
  v23 = objc_retainAutorelease(v13);
  *a3 = v23;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = v11;
  if (a6)
    *a6 = v14;

}

- (void)_updatePalette:(id)a3
{
  void *v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t barStyle;
  void *v11;
  double v12;
  double v13;
  BOOL v14;
  void *v15;
  void *v16;
  id v17;
  id *v18;
  double v19;
  double v20;
  void *v21;
  id v22;

  v22 = a3;
  objc_msgSend(v22, "_backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v22, "_paletteOverridesPinningBar") & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      objc_msgSend(v22, "_backgroundViewLayout");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationBar backgroundEffects](self, "backgroundEffects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v7, "configureWithEffects:", v8);
      }
      else if (objc_msgSend(v22, "_supportsSpecialSearchBarTransitions")
             && (-[_UINavigationBarItemStack topItem](self->_stack, "topItem"),
                 v9 = (void *)objc_claimAutoreleasedReturnValue(),
                 v3 = (void *)objc_msgSend(v9, "_backgroundHidden"),
                 v9,
                 (_DWORD)v3))
      {
        objc_msgSend(v7, "configureAsTransparent");
      }
      else
      {
        barStyle = self->_barStyle;
        -[UINavigationBar backgroundImageForBarMetrics:](self, "backgroundImageForBarMetrics:", -[UINavigationBar _activeBarMetrics](self, "_activeBarMetrics"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = v11;
        if (v11
          && ((objc_msgSend(v11, "size"), v13 == *MEMORY[0x1E0C9D820])
            ? (v14 = v12 == *(double *)(MEMORY[0x1E0C9D820] + 8))
            : (v14 = 0),
              v14))
        {
          objc_msgSend(v7, "configureImage:forceOpaque:barStyle:", v3, -[UINavigationBar isTranslucent](self, "isTranslucent") ^ 1, self->_barStyle);
        }
        else
        {
          -[UINavigationBar _effectiveBarTintColor](self, "_effectiveBarTintColor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "configureEffectForStyle:backgroundTintColor:forceOpaque:", barStyle, v15, -[UINavigationBar isTranslucent](self, "isTranslucent") ^ 1);

        }
        if (barStyle == 3 || objc_msgSend(v22, "paletteShadowIsHidden"))
          objc_msgSend(v7, "configureWithoutShadow");
        else
          objc_msgSend(v7, "configureShadowForBarStyle:", barStyle);

      }
      -[UINavigationBar _backdropViewLayerGroupName](self, "_backdropViewLayerGroupName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setGroupName:", v16);

      -[_UINavigationBarItemStack topEntry](self->_stack, "topEntry");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "activeLayout");
      v18 = (id *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v17 = v18[22];
        objc_msgSend(v17, "layout");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "backgroundAlpha");
        v20 = v19;
      }
      else
      {
        v20 = 1.0;
      }
      objc_msgSend(v6, "layout");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setBackgroundAlpha:", v20);

      if (v18)
      {

      }
      objc_msgSend(v6, "transitionBackgroundViews");
      objc_msgSend(v22, "_propagateBackgroundToContents");

    }
  }

}

- (UIImage)backgroundImageForBarMetrics:(UIBarMetrics)barMetrics
{
  _UINavigationBarAppearanceStorage *appearanceStorage;
  UIBarMetrics v4;
  UIBarMetrics v5;

  appearanceStorage = self->_appearanceStorage;
  if ((unint64_t)(barMetrics - 101) >= 2)
    v4 = UIBarMetricsDefault;
  else
    v4 = barMetrics;
  if ((unint64_t)barMetrics >= 2)
    v5 = v4;
  else
    v5 = barMetrics;
  return (UIImage *)-[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](appearanceStorage, "backgroundImageForBarPosition:barMetrics:", 0, v5);
}

- (void)_palette:(id)a3 isAttaching:(BOOL)a4 didComplete:(BOOL)a5
{
  if (a4)
    -[UINavigationBar _updatePalette:](self, "_updatePalette:", a3, a4, a5);
}

- (id)_backgroundViewForPalette:(id)a3
{
  id v3;
  _UIBarBackground *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _UIBarBackground *v13;
  _UIBarBackgroundLayoutLegacy *v14;

  v3 = a3;
  v4 = [_UIBarBackground alloc];
  objc_msgSend(v3, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = -[_UIBarBackground initWithFrame:](v4, "initWithFrame:", v6, v8, v10, v12);
  -[_UIBarBackground setTopAligned:](v13, "setTopAligned:", 1);
  v14 = objc_alloc_init(_UIBarBackgroundLayoutLegacy);
  -[_UIBarBackground setLayout:](v13, "setLayout:", v14);

  return v13;
}

- (void)setTranslucent:(BOOL)translucent
{
  int64_t barTranslucence;
  int64_t v4;
  int64_t barStyle;
  uint64_t v7;

  barTranslucence = self->_barTranslucence;
  v4 = 1;
  if (!translucent)
    v4 = 2;
  self->_barTranslucence = v4;
  if (barTranslucence != v4)
  {
    barStyle = self->_barStyle;
    if (translucent || barStyle != 2)
    {
      if (barStyle != 1)
      {
LABEL_12:
        -[UINavigationBar _updateOpacity](self, "_updateOpacity");
        -[UINavigationBar _setNeedsBackgroundViewUpdate](self, "_setNeedsBackgroundViewUpdate");
        -[UIView setNeedsDisplay](self, "setNeedsDisplay");
        -[UINavigationBar _updatePaletteBackgroundIfNecessary](self, "_updatePaletteBackgroundIfNecessary");
        return;
      }
    }
    else
    {
      self->_barStyle = 1;
    }
    if (translucent)
      v7 = 2;
    else
      v7 = 1;
    -[UINavigationBar _updateNavigationBarItemsForStyle:](self, "_updateNavigationBarItemsForStyle:", v7);
    goto LABEL_12;
  }
}

- (void)setBarTintColor:(UIColor *)barTintColor
{
  BOOL v5;
  UIColor *v6;
  void *v7;
  UIColor *v8;

  v8 = barTintColor;
  v5 = -[UIColor isEqual:](v8, "isEqual:", self->_barTintColor);
  v6 = v8;
  if (!v5 && self->_barTintColor != v8)
  {
    -[UINavigationBar _effectiveBarTintColor](self, "_effectiveBarTintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_barTintColor, barTintColor);
    -[UINavigationBar _effectiveBarTintColorDidChangeWithPreviousColor:](self, "_effectiveBarTintColorDidChangeWithPreviousColor:", v7);

    v6 = v8;
  }

}

- (void)_effectiveBarTintColorDidChangeWithPreviousColor:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UINavigationBar _effectiveBarTintColor](self, "_effectiveBarTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqual:", v4);

  if ((v5 & 1) == 0)
    -[UINavigationBar _propagateEffectiveBarTintColorWithPreviousColor:](self, "_propagateEffectiveBarTintColorWithPreviousColor:", v6);
  if (!-[UINavigationBar isTranslucent](self, "isTranslucent"))
    -[UINavigationBar _setNeedsBackgroundViewUpdate](self, "_setNeedsBackgroundViewUpdate");

}

- (void)_propagateEffectiveBarTintColorWithPreviousColor:(id)a3
{
  id v4;

  v4 = a3;
  -[UINavigationBar _setNeedsBackgroundViewUpdate](self, "_setNeedsBackgroundViewUpdate");
  -[UINavigationBar _updateNavigationBarItemsForStyle:previousTintColor:](self, "_updateNavigationBarItemsForStyle:previousTintColor:", -[UINavigationBar _currentBarStyle](self, "_currentBarStyle"), v4);

  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
}

- (int)state
{
  return -[_UINavigationBarItemStack state](self->_stack, "state");
}

- (BOOL)_hasBackButton
{
  void *v3;
  BOOL v4;
  void *v5;

  -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hidesBackButton") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[_UINavigationBarItemStack backItem](self->_stack, "backItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v4 = -[UINavigationBar _shouldShowBackButtonForNavigationItem:](self, "_shouldShowBackButtonForNavigationItem:", v5);
    else
      v4 = 0;

  }
  return v4;
}

- (void)didMoveToWindow
{
  objc_super v3;

  if (dyld_program_sdk_at_least())
  {
    v3.receiver = self;
    v3.super_class = (Class)UINavigationBar;
    -[UIView didMoveToWindow](&v3, sel_didMoveToWindow);
  }
  -[_UINavigationBarVisualProvider barDidMoveToWindow](self->_visualProvider, "barDidMoveToWindow");
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)UINavigationBar;
  -[UIView tintColorDidChange](&v22, sel_tintColorDidChange);
  -[UINavigationBar topItem](self, "topItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v3, "leftBarButtonItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v8++), "_updateView");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v6);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "rightBarButtonItems", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "_updateView");
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
    }
    while (v11);
  }

  -[UINavigationBar _updateNavigationBarItemsForStyle:](self, "_updateNavigationBarItemsForStyle:", -[UINavigationBar _currentBarStyle](self, "_currentBarStyle"));
}

- (void)didAddSubview:(id)a3
{
  _UINavigationBarVisualProvider *visualProvider;
  id v5;
  int64_t v6;
  id v7;

  visualProvider = self->_visualProvider;
  v5 = a3;
  -[_UINavigationBarVisualProvider barDidAddSubview:](visualProvider, "barDidAddSubview:", v5);
  v6 = -[UINavigationBar _currentBarStyle](self, "_currentBarStyle");
  -[UINavigationBar _effectiveBarTintColor](self, "_effectiveBarTintColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UINavigationBar _updateNavigationBarItem:forStyle:previousTintColor:](self, "_updateNavigationBarItem:forStyle:previousTintColor:", v5, v6, v7);

}

- (int64_t)_currentBarStyle
{
  int64_t result;

  result = self->_barStyle;
  if (result == 1 && self->_barTranslucence == 1)
    return 2;
  return result;
}

- (void)_updateNavigationBarItem:(id)a3 forStyle:(int64_t)a4 previousTintColor:(id)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "setControlSize:", -[UINavigationBar isMinibar](self, "isMinibar"));
    objc_msgSend(v10, "setBarStyle:", a4);
    -[UINavigationBar _effectiveBarTintColor](self, "_effectiveBarTintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNavigationBarTintColor:", v7);

    if (objc_msgSend(v10, "_wantsAccessibilityButtonShapes"))
      objc_msgSend(v10, "setNeedsLayout");
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "setControlSize:", -[UINavigationBar isMinibar](self, "isMinibar"));
LABEL_7:
    objc_msgSend(v10, "setBarStyle:", a4);
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "setStyle:", a4);
  }
  else
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v10, "_updateLabelColor");
    }
  }
LABEL_8:

}

- (void)_updateNavigationBarItemsForStyle:(int64_t)a3
{
  id v5;

  -[UINavigationBar _effectiveBarTintColor](self, "_effectiveBarTintColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UINavigationBar _updateNavigationBarItemsForStyle:previousTintColor:](self, "_updateNavigationBarItemsForStyle:previousTintColor:", a3, v5);

}

- (void)_updateNavigationBarItemsForStyle:(int64_t)a3 previousTintColor:(id)a4
{
  _UINavigationBarItemStack *stack;
  _QWORD v7[5];

  if (-[UIView _areAccessibilityButtonShapesEnabled]((uint64_t)self))
  {
    stack = self->_stack;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __71__UINavigationBar__updateNavigationBarItemsForStyle_previousTintColor___block_invoke;
    v7[3] = &__block_descriptor_40_e30_v24__0__UINavigationItem_8_B16l;
    v7[4] = a3;
    -[_UINavigationBarItemStack iterateItems:](stack, "iterateItems:", v7);
  }
}

- (BOOL)_shouldShowBackButtonForNavigationItem:(id)a3
{
  return 1;
}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UINavigationBar;
  -[UIView updateConstraints](&v3, sel_updateConstraints);
  -[_UINavigationBarVisualProvider updateConstraints](self->_visualProvider, "updateConstraints");
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_pushNavigationItem:(id)a3 transitionAssistant:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  _UINavigationBarVisualProvider *visualProvider;
  uint64_t v18;
  _UINavigationBarVisualProvider *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];

  v7 = a3;
  v8 = a4;
  -[UINavigationBar _effectiveDelegateForItem:](self, "_effectiveDelegateForItem:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || objc_msgSend(v9, "navigationBar:shouldPushItem:", self, v7))
  {
    if (_UINavigationBarShouldCheckLegacyViolation(self))
    {
      objc_msgSend(v7, "searchController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationBar.m"), 2049, CFSTR("UISearchController integration not supported when forcing the legacy provider. Remove your +_forceLegacyVisualProvider override."));

      }
      objc_msgSend(v7, "titleView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationBar.m"), 2051, CFSTR("_UINavigationBarTitleView not supported when forcing the legacy provider. Remove your +_forceLegacyVisualProvider override."));

      }
      objc_msgSend(v7, "_weeTitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationBar.m"), 2052, CFSTR("Wee Title not supported when forcing the legacy provider. Remove your +_forceLegacyVisualProvider override."));

      }
    }
    objc_msgSend(v7, "_setNavigationBar:", self);
    -[_UINavigationBarItemStack pushItem:withTransitionAssistant:](self->_stack, "pushItem:withTransitionAssistant:", v7, v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "_navigationBarDidUpdateStack:", self);
    -[_UINavigationBarVisualProvider prepareForPush](self->_visualProvider, "prepareForPush");
    -[_UINavigationBarItemStack previousTopItem](self->_stack, "previousTopItem");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14
      && (v15 = (void *)v14,
          v16 = -[UINavigationBar _isAnimationEnabled](self, "_isAnimationEnabled"),
          v15,
          v16))
    {
      visualProvider = self->_visualProvider;
      if (visualProvider
        && !-[_UINavigationBarVisualProvider allowsUserInteractionDuringTransitions](visualProvider, "allowsUserInteractionDuringTransitions"))
      {
        -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
      }
      v18 = 1;
    }
    else
    {
      v18 = 0;
    }
    v19 = self->_visualProvider;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __59__UINavigationBar__pushNavigationItem_transitionAssistant___block_invoke;
    v25[3] = &unk_1E16B5C78;
    v25[4] = self;
    -[_UINavigationBarVisualProvider pushAnimated:completion:](v19, "pushAnimated:completion:", v18, v25);
    -[_UINavigationBarItemStack transitionAssistant](self->_stack, "transitionAssistant");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "finishTrackingInteractiveTransition");

    -[_UINavigationBarItemStack transitionAssistant](self->_stack, "transitionAssistant");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setShouldHideBackButtonDuringTransition:", 0);

  }
}

uint64_t __59__UINavigationBar__pushNavigationItem_transitionAssistant___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completePushOperationAnimated:transitionAssistant:", a2, a3);
}

- (UINavigationBar)initWithFrame:(CGRect)a3
{
  UINavigationBar *v3;
  uint64_t v4;
  _UINavigationBarVisualProvider *visualProvider;
  _UINavigationBarItemStack *v6;
  _UINavigationBarItemStack *stack;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UINavigationBar;
  v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "_visualProviderForNavigationBar:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    visualProvider = v3->_visualProvider;
    v3->_visualProvider = (_UINavigationBarVisualProvider *)v4;

    v6 = objc_alloc_init(_UINavigationBarItemStack);
    stack = v3->_stack;
    v3->_stack = v6;

    -[_UINavigationBarVisualProvider setStack:](v3->_visualProvider, "setStack:", v3->_stack);
    -[UINavigationBar _updateOpacity](v3, "_updateOpacity");
    -[UINavigationBar _commonNavBarInit](v3, "_commonNavBarInit");
  }
  return v3;
}

- (void)_updateOpacity
{
  int v3;
  int v4;
  id WeakRetained;

  v3 = -[UIView isOpaque](self, "isOpaque");
  v4 = -[UINavigationBar isTranslucent](self, "isTranslucent");
  if (v3 == v4)
  {
    -[UIView setOpaque:](self, "setOpaque:", v4 ^ 1u);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "navigationBarDidChangeOpacity:", self);

  }
}

+ (id)_visualProviderForNavigationBar:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_visualProviderClassForNavigationBar:", v4)), "initWithNavigationBar:", v4);

  return v5;
}

+ (Class)_visualProviderClassForNavigationBar:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "_requiresModernVisualProvider") & 1) != 0
    || (objc_msgSend((id)objc_opt_class(), "_forceLegacyVisualProvider") & 1) == 0)
  {
    objc_msgSend(v3, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInterfaceIdiom");

  }
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

+ (BOOL)_requiresModernVisualProvider
{
  return 0;
}

+ (BOOL)_forceLegacyVisualProvider
{
  return _UIUseModernBars() ^ 1;
}

- (void)_pushNavigationItemUsingCurrentTransition:(id)a3
{
  id v4;
  int currentPushTransition;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  currentPushTransition = self->_currentPushTransition;
  v8 = v4;
  if (currentPushTransition)
  {
    -[UINavigationBar _effectiveDelegateForItem:](self, "_effectiveDelegateForItem:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UINavigationBarTransitionAssistant pushTransitionAssistantForNavigationBar:delegate:crossfade:](_UINavigationBarTransitionAssistant, "pushTransitionAssistantForNavigationBar:delegate:crossfade:", self, v6, currentPushTransition == 6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UINavigationBar _disableAnimation](self, "_disableAnimation");
    v7 = 0;
  }
  -[UINavigationBar _pushNavigationItem:transitionAssistant:](self, "_pushNavigationItem:transitionAssistant:", v8, v7);
  objc_msgSend(v8, "_updateViewsForBarSizeChangeAndApply:", 0);
  if (!-[UINavigationBar _isAlwaysHidden](self, "_isAlwaysHidden"))
  {
    -[_UINavigationBarVisualProvider updateTopNavigationItemAnimated:](self->_visualProvider, "updateTopNavigationItemAnimated:", -[UINavigationBar _isAnimationEnabled](self, "_isAnimationEnabled"));
    -[UINavigationBar updatePrompt](self, "updatePrompt");
  }
  if (!currentPushTransition)
    -[UINavigationBar _enableAnimation](self, "_enableAnimation");

}

- (BOOL)_isAnimationEnabled
{
  BOOL v2;
  void *v4;
  void *v5;

  if (self->_animationDisabledCount)
    return 0;
  -[UIView superview](self, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v5 != 0;

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)_enableAnimation
{
  --self->_animationDisabledCount;
}

- (void)_disableAnimation
{
  ++self->_animationDisabledCount;
}

- (void)_commonNavBarInit
{
  BOOL v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = -[UINavigationBar _isAlwaysHidden](self, "_isAlwaysHidden");
  if (!self->_barPosition)
    self->_barPosition = 2;
  if (!v3)
  {
    -[_UINavigationBarVisualProvider _shim_setUseContentView:](self->_visualProvider, "_shim_setUseContentView:", objc_msgSend((id)objc_opt_class(), "_supportsCanvasView"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__accessibilityButtonShapesDidChangeNotification_, CFSTR("UIAccessibilityButtonShapesEnabledStatusDidChangeNotification"), 0);

  }
  *(_OWORD *)&self->_resolvedLayoutMargins.top = xmmword_186679330;
  *(_OWORD *)&self->_resolvedLayoutMargins.bottom = xmmword_186679330;
  -[_UINavigationBarVisualProvider prepare](self->_visualProvider, "prepare");
  if (self->_standardAppearance)
    v5 = 2;
  else
    v5 = _UIBarAppearanceAPIVersion();
  -[_UINavigationBarVisualProvider setAppearanceAPIVersion:](self->_visualProvider, "setAppearanceAPIVersion:", v5);
  if (-[_UINavigationBarVisualProvider appearanceAPIVersion](self->_visualProvider, "appearanceAPIVersion") >= 2)
    -[UINavigationBar _installDefaultAppearance](self, "_installDefaultAppearance");
  -[UINavigationBar _setupAXHUDGestureIfNecessary](self, "_setupAXHUDGestureIfNecessary");
  v9[0] = 0x1E1A99498;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIView _registerForTraitTokenChanges:withTarget:action:](self, "_registerForTraitTokenChanges:withTarget:action:", v6, self, sel__setupAXHUDGestureIfNecessary);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__largeContentViewerEnabledStatusDidChange_, CFSTR("UILargeContentViewerInteractionEnabledStatusDidChangeNotification"), 0);

}

- (void)layoutSubviews
{
  void *v4;
  UINavigationBar *v5;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  unint64_t v12;
  NSObject *v13;
  _UINavigationBarItemStack *stack;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  NSObject *v20;
  _UINavigationBarItemStack *v21;
  NSObject *v22;
  void *v23;
  objc_super v24;
  uint8_t buf[4];
  UINavigationBar *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  UINavigationBar *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)UINavigationBar;
  -[UIView layoutSubviews](&v24, sel_layoutSubviews);
  if (!-[UINavigationBar _isAlwaysHidden](self, "_isAlwaysHidden"))
  {
    -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_navigationBar");
    v5 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();

    if (-[UIView isHidden](self, "isHidden"))
    {
      if (v5 != self && v5 != 0)
        goto LABEL_31;
    }
    if (v5 == self || v5 == 0)
    {
LABEL_13:
      -[_UINavigationBarVisualProvider _shim](self->_visualProvider, "_shim");
      if (!-[_UINavigationBarItemStack state](self->_stack, "state"))
      {
        *(_WORD *)&self->_navbarFlags |= 8u;
        if (-[_UINavigationBarVisualProvider _shim](self->_visualProvider, "_shim"))
          -[UINavigationBar _updateActiveBarMetrics](self, "_updateActiveBarMetrics");
        -[_UINavigationBarVisualProvider layoutSubviews](self->_visualProvider, "layoutSubviews");
        *(_WORD *)&self->_navbarFlags &= ~8u;
      }
      goto LABEL_31;
    }
    -[UIView window](self, "window");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[UIView window](v5, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {

      }
      else
      {
        v11 = dyld_program_sdk_at_least();

        if ((v11 & 1) == 0)
          goto LABEL_13;
      }
    }
    else if (!dyld_program_sdk_at_least())
    {
      goto LABEL_13;
    }
    if (_UIIsPrivateMainBundle())
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          goto LABEL_30;
        -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v26 = self;
        v27 = 2112;
        v28 = v16;
        v29 = 2112;
        v30 = v5;
        _os_log_fault_impl(&dword_185066000, v15, OS_LOG_TYPE_FAULT, "Skipping layout for visible navigation bar, %@, because the top item's navigation bar doesn't match.  topItem = %@, topItem's navigation bar = %@", buf, 0x20u);
      }
      else
      {
        v12 = qword_1ECD7B620;
        if (!qword_1ECD7B620)
        {
          v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v12, (unint64_t *)&qword_1ECD7B620);
        }
        v13 = *(NSObject **)(v12 + 8);
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          goto LABEL_31;
        stack = self->_stack;
        v15 = v13;
        -[_UINavigationBarItemStack topItem](stack, "topItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v26 = self;
        v27 = 2112;
        v28 = v16;
        v29 = 2112;
        v30 = v5;
        _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Skipping layout for visible navigation bar, %@, because the top item's navigation bar doesn't match.  topItem = %@, topItem's navigation bar = %@", buf, 0x20u);
      }

LABEL_30:
LABEL_31:

      return;
    }
    _UIIsPrivateMainBundle();
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationBar.m"), 3895, CFSTR("Layout requested for visible navigation bar, %@, when the top item belongs to a different navigation bar. topItem = %@, navigation bar = %@, possibly from a client attempt to nest wrapped navigation controllers."), self, v18, v5);

      goto LABEL_13;
    }
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        goto LABEL_41;
      -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v26 = self;
      v27 = 2112;
      v28 = v23;
      v29 = 2112;
      v30 = v5;
      _os_log_fault_impl(&dword_185066000, v22, OS_LOG_TYPE_FAULT, "Layout requested for visible navigation bar, %@, when the top item belongs to a different navigation bar. topItem = %@, navigation bar = %@, possibly from a client attempt to nest wrapped navigation controllers. This mismatch may cause a layout feedback loop. This will become an assert in a future version.", buf, 0x20u);
    }
    else
    {
      v19 = qword_1ECD7B628;
      if (!qword_1ECD7B628)
      {
        v19 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v19, (unint64_t *)&qword_1ECD7B628);
      }
      v20 = *(NSObject **)(v19 + 8);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      v21 = self->_stack;
      v22 = v20;
      -[_UINavigationBarItemStack topItem](v21, "topItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v26 = self;
      v27 = 2112;
      v28 = v23;
      v29 = 2112;
      v30 = v5;
      _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "Layout requested for visible navigation bar, %@, when the top item belongs to a different navigation bar. topItem = %@, navigation bar = %@, possibly from a client attempt to nest wrapped navigation controllers. This mismatch may cause a layout feedback loop. This will become an assert in a future version.", buf, 0x20u);
    }

LABEL_41:
    goto LABEL_13;
  }
}

- (BOOL)_isAlwaysHidden
{
  return 0;
}

+ (BOOL)_supportsCanvasView
{
  return dyld_program_sdk_at_least();
}

- (void)updatePrompt
{
  void *v3;
  __CFString *v4;
  BOOL v5;
  BOOL v6;
  void *v7;
  id v8;

  -[_UINavigationBarVisualProvider _shim_promptText](self->_visualProvider, "_shim_promptText");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UINavigationBar topItem](self, "topItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prompt");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (-[_UINavigationBarItemStack isPushingOrPopping](self->_stack, "isPushingOrPopping"))
  {
    if (v8)
      v5 = 1;
    else
      v5 = v4 == 0;
    if (!v5)
    {

      v4 = 0;
LABEL_13:
      -[_UINavigationBarItemStack transitionAssistant](self->_stack, "transitionAssistant");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setShouldUpdatePromptAfterTransition:", 1);

      goto LABEL_14;
    }
    if (v8)
      v6 = v4 == 0;
    else
      v6 = 0;
    if (v6)
    {
      v4 = &stru_1E16EDF20;
      goto LABEL_13;
    }
  }
LABEL_14:
  -[UINavigationBar _setPrompt:](self, "_setPrompt:", v4);

}

- (void)_setPrompt:(id)a3
{
  _UINavigationBarVisualProvider *visualProvider;
  id v5;

  visualProvider = self->_visualProvider;
  v5 = a3;
  -[_UINavigationBarVisualProvider _shim_setPromptText:animated:](visualProvider, "_shim_setPromptText:animated:", v5, -[UINavigationBar _isAnimationEnabled](self, "_isAnimationEnabled"));

}

- (void)_completePushOperationAnimated:(BOOL)a3 transitionAssistant:(id)a4
{
  _BOOL4 v4;
  void *v6;
  int v7;
  int v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = a4;
  -[UINavigationBar _effectiveDelegate](self, "_effectiveDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();
  v8 = v7;
  if (!v4)
    goto LABEL_6;
  if ((v7 & 1) == 0)
    -[UINavigationBar _reenableUserInteraction](self, "_reenableUserInteraction");
  if (objc_msgSend(v10, "cancelledTransition"))
  {
    -[UINavigationBar _cancelInteractiveTransition](self, "_cancelInteractiveTransition");
  }
  else
  {
LABEL_6:
    -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarItemStack completeOperation](self->_stack, "completeOperation");
    -[UINavigationBar _accessibility_navigationBarContentsDidChange](self, "_accessibility_navigationBarContentsDidChange");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "navigationBar:didPushItem:", self, v9);

  }
  if ((v4 & v8) == 1)
    objc_msgSend(v6, "_navigationBarDidEndAnimation:", self);

}

- (void)_setupAXHUDGestureIfNecessary
{
  void *v3;
  int v4;
  UIAccessibilityHUDGestureManager *v5;
  UIAccessibilityHUDGestureManager *axHUDGestureManager;

  if (!self->_axHUDGestureManager && dyld_program_sdk_at_least())
  {
    -[UIView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_isLargeContentViewerEnabled");

    if (v4)
    {
      v5 = -[UIAccessibilityHUDGestureManager initWithView:delegate:]([UIAccessibilityHUDGestureManager alloc], "initWithView:delegate:", self, self);
      axHUDGestureManager = self->_axHUDGestureManager;
      self->_axHUDGestureManager = v5;

    }
  }
}

- (void)_setBarStyle:(int64_t)a3
{
  void *v4;

  if (self->_barStyle != a3)
  {
    self->_barStyle = a3;
    -[UINavigationBar _setNeedsBackgroundViewUpdate](self, "_setNeedsBackgroundViewUpdate");
    -[_UINavigationBarVisualProvider changeAppearance](self->_visualProvider, "changeAppearance");
    -[UINavigationBar _effectiveBarTintColor](self, "_effectiveBarTintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[UINavigationBar _updateNavigationBarItemsForStyle:](self, "_updateNavigationBarItemsForStyle:", -[UINavigationBar _currentBarStyle](self, "_currentBarStyle"));
      -[UINavigationBar _updateOpacity](self, "_updateOpacity");
      -[UIView setNeedsDisplay](self, "setNeedsDisplay");
      -[UINavigationBar _updatePaletteBackgroundIfNecessary](self, "_updatePaletteBackgroundIfNecessary");
      -[_UINavigationBarVisualProvider changeAppearance](self->_visualProvider, "changeAppearance");
    }
    -[UINavigationBar _sendNavigationBarDidChangeStyle](self, "_sendNavigationBarDidChangeStyle");
  }
}

- (UINavigationBarAppearance)standardAppearance
{
  UINavigationBarAppearance *standardAppearance;

  standardAppearance = self->_standardAppearance;
  if (!standardAppearance)
  {
    -[UINavigationBar _installDefaultAppearance](self, "_installDefaultAppearance");
    standardAppearance = self->_standardAppearance;
  }
  return standardAppearance;
}

- (int64_t)_barStyle
{
  return self->_barStyle;
}

- (BOOL)_didVisibleItemsChangeWithNewItems:(id)a3 oldItems:(id)a4
{
  id v5;
  id v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  BOOL v14;
  BOOL v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "count");
  v8 = objc_msgSend(v5, "count");
  v9 = v8;
  if (v7 <= 1)
    v10 = 1;
  else
    v10 = v7;
  if (v8 <= 1)
    v11 = 1;
  else
    v11 = v8;
  if (v10 == v11)
  {
    objc_msgSend(v6, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v12 == v13;
    v15 = v12 != v13;
    if (v14 && v7 >= 2)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", (v7 - 2));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v9 - 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v16 != v17;

    }
  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (void)_setStaticNavBarButtonLingers:(BOOL)a3
{
  -[_UINavigationBarVisualProvider setStaticNavBarButtonLingers:](self->_visualProvider, "setStaticNavBarButtonLingers:", a3);
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

- (void)setShadowImage:(UIImage *)shadowImage
{
  unint64_t v4;
  _UINavigationBarAppearanceStorage *appearanceStorage;
  void *v6;
  _UINavigationBarAppearanceStorage *v7;
  _UINavigationBarAppearanceStorage *v8;
  double v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;

  v4 = shadowImage;
  appearanceStorage = self->_appearanceStorage;
  if (v4 | (unint64_t)appearanceStorage)
  {
    v6 = (void *)v4;
    v13 = (id)v4;
    if (!appearanceStorage)
    {
      v7 = objc_alloc_init(_UINavigationBarAppearanceStorage);
      v8 = self->_appearanceStorage;
      self->_appearanceStorage = v7;

      v6 = v13;
    }
    if ((objc_msgSend(v6, "_isResizable") & 1) == 0)
    {
      objc_msgSend(v13, "size");
      if (v9 > 1.0)
      {
        objc_msgSend(v13, "resizableImageWithCapInsets:", 0.0, 0.0, 0.0, 0.0);
        v10 = objc_claimAutoreleasedReturnValue();

        v13 = (id)v10;
      }
    }
    -[_UINavigationBarAppearanceStorage shadowImage](self->_appearanceStorage, "shadowImage");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v12 = v13;
    if (v13 != v11)
    {
      -[_UINavigationBarAppearanceStorage setShadowImage:](self->_appearanceStorage, "setShadowImage:", v13);
      -[UINavigationBar _setNeedsBackgroundViewUpdate](self, "_setNeedsBackgroundViewUpdate");
      v12 = v13;
    }
  }
  else
  {
    v12 = 0;
  }

}

- (void)setTitleTextAttributes:(NSDictionary *)titleTextAttributes
{
  unint64_t v4;
  _UINavigationBarAppearanceStorage *appearanceStorage;
  void *v6;
  _UINavigationBarAppearanceStorage *v7;
  _UINavigationBarAppearanceStorage *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  char v13;
  id v14;

  v4 = titleTextAttributes;
  appearanceStorage = self->_appearanceStorage;
  if (v4 | (unint64_t)appearanceStorage)
  {
    v6 = (void *)v4;
    if (!appearanceStorage)
    {
      v7 = objc_alloc_init(_UINavigationBarAppearanceStorage);
      v8 = self->_appearanceStorage;
      self->_appearanceStorage = v7;

    }
    objc_msgSend(v6, "_ui_attributesForDictionaryContainingUIStringDrawingKeys");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    -[_UINavigationBarAppearanceStorage textAttributes](self->_appearanceStorage, "textAttributes");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = v14 == 0;
    else
      v11 = 0;
    if (v11)
    {
      -[_UINavigationBarAppearanceStorage setTextAttributes:](self->_appearanceStorage, "setTextAttributes:", 0);
    }
    else
    {
      if (v9)
        v12 = v14 == 0;
      else
        v12 = 1;
      if (v12)
      {
        -[_UINavigationBarAppearanceStorage setTextAttributes:](self->_appearanceStorage, "setTextAttributes:", v14);
        if (!v14 || v10)
          goto LABEL_19;
      }
      else
      {
        v13 = objc_msgSend(v14, "isEqualToDictionary:", v9);
        -[_UINavigationBarAppearanceStorage setTextAttributes:](self->_appearanceStorage, "setTextAttributes:", v14);
        if ((v13 & 1) != 0)
          goto LABEL_19;
      }
    }
    -[_UINavigationBarVisualProvider changeAppearance](self->_visualProvider, "changeAppearance");
LABEL_19:

  }
}

- (int64_t)requestedContentSize
{
  return self->_requestedContentSize;
}

- (void)_sendNavigationBarResize
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "_navigationBarChangedSize:", self);

}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UINavigationBar;
  -[UIView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  self->_resolvedLayoutMargins.trailing = -1.79769313e308;
  self->_resolvedLayoutMargins.leading = -1.79769313e308;
  -[UINavigationBar setNeedsLayout](self, "setNeedsLayout");
  -[_UINavigationBarVisualProvider navigationBarInvalidatedResolvedLayoutMargins](self->_visualProvider, "navigationBarInvalidatedResolvedLayoutMargins");
}

- (void)setNeedsLayout
{
  objc_super v2;

  if ((*(_WORD *)&self->_navbarFlags & 8) == 0)
  {
    v2.receiver = self;
    v2.super_class = (Class)UINavigationBar;
    -[UIView setNeedsLayout](&v2, sel_setNeedsLayout);
  }
}

- (void)_setTitleOpacity:(double)a3
{
  -[_UINavigationBarVisualProvider setTitleAlpha:](self->_visualProvider, "setTitleAlpha:", a3);
}

- (void)setTintColor:(UIColor *)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UINavigationBar;
  -[UIView setTintColor:](&v3, sel_setTintColor_, tintColor);
}

- (void)setLocked:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_navbarFlags = *(_WORD *)&self->_navbarFlags & 0xFFFD | v3;
}

- (void)_pushNavigationItem:(id)a3 transition:(int)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int v10;

  v6 = a3;
  self->_currentPushTransition = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__UINavigationBar__pushNavigationItem_transition___block_invoke;
  v8[3] = &unk_1E16B5C50;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[UINavigationBar _performUpdatesIgnoringLock:](self, "_performUpdatesIgnoringLock:", v8);

}

- (void)_performUpdatesIgnoringLock:(id)a3
{
  __int16 v4;

  v4 = *(_WORD *)&self->_navbarFlags & 2;
  *(_WORD *)&self->_navbarFlags = *(_WORD *)&self->_navbarFlags & 0xFFF9 | 4;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  *(_WORD *)&self->_navbarFlags = *(_WORD *)&self->_navbarFlags & 0xFFF9 | v4;
}

uint64_t __50__UINavigationBar__pushNavigationItem_transition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pushNavigationItem:animated:", *(_QWORD *)(a1 + 40), *(_DWORD *)(a1 + 48) != 0);
}

- (void)pushNavigationItem:(UINavigationItem *)item animated:(BOOL)animated
{
  _BOOL4 v4;
  void *v7;
  uint64_t v8;
  void *v9;
  UINavigationItem *v10;

  v4 = animated;
  v10 = item;
  if (-[UINavigationBar isLocked](self, "isLocked"))
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("Cannot call %@ directly on a UINavigationBar managed by a controller."), v9);

  }
  else
  {
    if ((*(_WORD *)&self->_navbarFlags & 4) == 0)
      self->_currentPushTransition = v4;
    -[UINavigationBar _pushNavigationItemUsingCurrentTransition:](self, "_pushNavigationItemUsingCurrentTransition:", v10);
  }

}

- (void)setDelegate:(id)delegate
{
  id WeakRetained;
  _UINavigationBarDelegatePrivate **p_delegate;
  id v6;
  __int16 v7;
  id v8;
  __int16 v9;
  id v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id obj;

  obj = delegate;
  if (-[UINavigationBar isLocked](self, "isLocked"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Cannot manually set the delegate on a UINavigationBar managed by a controller."));
  }
  else
  {
    if ((*(_WORD *)&self->_navbarFlags & 0x100) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

      if (WeakRetained != obj)
        *(_WORD *)&self->_navbarFlags |= 0x200u;
    }
    p_delegate = &self->_delegate;
    v6 = objc_storeWeak((id *)&self->_delegate, obj);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 16;
    else
      v7 = 0;
    *(_WORD *)&self->_navbarFlags = *(_WORD *)&self->_navbarFlags & 0xFFEF | v7;

    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 32;
    else
      v9 = 0;
    *(_WORD *)&self->_navbarFlags = *(_WORD *)&self->_navbarFlags & 0xFFDF | v9;

    v10 = objc_loadWeakRetained((id *)p_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 64;
    else
      v11 = 0;
    *(_WORD *)&self->_navbarFlags = *(_WORD *)&self->_navbarFlags & 0xFFBF | v11;

    v12 = objc_loadWeakRetained((id *)p_delegate);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = 128;
    else
      v13 = 0;
    *(_WORD *)&self->_navbarFlags = *(_WORD *)&self->_navbarFlags & 0xFF7F | v13;

  }
}

- (BOOL)isLocked
{
  return (*(_WORD *)&self->_navbarFlags >> 1) & 1;
}

- (BOOL)_lostNavigationControllerDelegate
{
  return (*(_WORD *)&self->_navbarFlags >> 9) & 1;
}

- (void)setItems:(NSArray *)items animated:(BOOL)animated
{
  _BOOL4 v4;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *v12;

  v4 = animated;
  v12 = items;
  if (-[UINavigationBar isLocked](self, "isLocked"))
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("Cannot call %@ directly on a UINavigationBar managed by a controller."), v9);

  }
  else
  {
    if (v4)
    {
      -[UINavigationBar items](self, "items");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[UINavigationBar _transitionForOldItems:newItems:](self, "_transitionForOldItems:newItems:", v10, v12);

    }
    else
    {
      v11 = 0;
    }
    -[UINavigationBar _setItems:transition:](self, "_setItems:transition:", v12, v11);
  }

}

- (void)_setItems:(id)a3 transition:(int)a4
{
  -[UINavigationBar _setItems:transition:reset:](self, "_setItems:transition:reset:", a3, *(_QWORD *)&a4, 0);
}

- (NSArray)items
{
  return -[_UINavigationBarItemStack items](self->_stack, "items");
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

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[UINavigationBar isLocked](self, "isLocked"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Cannot choose layout method for UINavigationBar managed by a controller"));
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UINavigationBar;
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](&v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, v3);
  }
}

- (BOOL)_shouldDecodeSubviews
{
  return objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_visualProviderClassForNavigationBar:", self), "shouldDecodeSubviews");
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id WeakRetained;
  void *v7;
  double v8;
  double v9;
  void *v10;
  int64_t v11;
  _UINavigationBarVisualStyle *visualStyle;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)UINavigationBar;
  -[UIView _didMoveFromWindow:toWindow:](&v20, sel__didMoveFromWindow_toWindow_, a3);
  if (a4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UINavigationBar _setBarPosition:](self, "_setBarPosition:", objc_msgSend(WeakRetained, "positionForBar:", self));
    objc_msgSend(a4, "screen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    v9 = v8;
    -[UIView layer](self, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRasterizationScale:", v9);

    -[UINavigationBar _setNeedsBackgroundViewUpdate](self, "_setNeedsBackgroundViewUpdate");
    -[UINavigationBar _configurePaletteConstraintsIfNecessary](self, "_configurePaletteConstraintsIfNecessary");
    v11 = -[_UINavigationBarVisualStyle idiom](self->_visualStyle, "idiom");
    if (v11 != objc_msgSend(v7, "_userInterfaceIdiom"))
    {
      visualStyle = self->_visualStyle;
      self->_visualStyle = 0;

    }
    -[_UINavigationBarVisualProvider _shim_updateBackIndicator](self->_visualProvider, "_shim_updateBackIndicator");
    -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_searchControllerIfAllowed");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "searchBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_setHostedInlineByNavigationBar:", objc_msgSend(v13, "_hasInlineSearchBar"));

    if (dyld_program_sdk_at_least())
    {
      os_variant_has_internal_diagnostics();
      +[UITraitCollection _currentTraitCollectionIfExists]();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView traitCollection](self, "traitCollection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v17);

      v18 = (void *)_UISetCurrentFallbackEnvironment(self);
      -[UINavigationBar traitCollectionDidChange:](self, "traitCollectionDidChange:", 0);
      _UIRestorePreviousFallbackEnvironment(v18);
      +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v16);

    }
  }
  else
  {
    if (!self->_visualStyle)
      return;
    -[UINavigationBar currentBackButton](self, "currentBackButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPressed:", 0);

    v13 = self->_visualStyle;
    self->_visualStyle = 0;
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _UINavigationBarVisualProvider **p_visualProvider;
  _BOOL8 v10;
  BOOL v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UINavigationBar;
  -[UIView traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "userInterfaceIdiom");
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v5 == v7)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_visualProviderForNavigationBar:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    p_visualProvider = &self->_visualProvider;
    if ((objc_msgSend(v8, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
      v10 = -[UINavigationBar isLocked](self, "isLocked");
      -[_UINavigationBarVisualProvider teardown](*p_visualProvider, "teardown");
      objc_storeStrong((id *)&self->_visualProvider, v8);
      v11 = -[UINavigationBar _isAlwaysHidden](self, "_isAlwaysHidden");
      -[UINavigationBar _updateOpacity](self, "_updateOpacity");
      if (!v11)
        -[_UINavigationBarVisualProvider _shim_setUseContentView:](*p_visualProvider, "_shim_setUseContentView:", objc_msgSend((id)objc_opt_class(), "_supportsCanvasView"));
      -[_UINavigationBarVisualProvider prepare](*p_visualProvider, "prepare");
      -[_UINavigationBarVisualProvider setStack:](*p_visualProvider, "setStack:", self->_stack);
      -[_UINavigationBarVisualProvider updateTopNavigationItemAnimated:](*p_visualProvider, "updateTopNavigationItemAnimated:", 0);
      -[_UINavigationBarVisualProvider updateTopNavigationItemTitleView](*p_visualProvider, "updateTopNavigationItemTitleView");
      -[UINavigationBar _updateAppearancesForNewVisualProvider](self, "_updateAppearancesForNewVisualProvider");
      -[UINavigationBar setLocked:](self, "setLocked:", v10);
      -[UINavigationBar setNeedsLayout](self, "setNeedsLayout");
      -[UIView layoutIfNeeded](self, "layoutIfNeeded");
    }
  }
  -[_UINavigationBarVisualProvider traitCollectionDidChange:](self->_visualProvider, "traitCollectionDidChange:", v4);

}

- (void)_configurePaletteConstraintsIfNecessary
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "_updatePaletteConstraints");

}

- (void)_setNeedsBackgroundViewUpdate
{
  if (!-[UIView _isInLayoutSubviews](self, "_isInLayoutSubviews"))
    -[UINavigationBar setNeedsLayout](self, "setNeedsLayout");
}

- (UIView)_backgroundView
{
  return (UIView *)-[_UINavigationBarVisualProvider _shim_compatibilityBackgroundView](self->_visualProvider, "_shim_compatibilityBackgroundView");
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UINavigationBar;
  -[UIView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  -[_UINavigationBarVisualProvider setSemanticContentAttribute:](self->_visualProvider, "setSemanticContentAttribute:", a3);
}

- (void)setPrefersLargeTitles:(BOOL)prefersLargeTitles
{
  _BOOL4 v3;
  void *v6;

  v3 = prefersLargeTitles;
  if (_UINavigationBarShouldCheckLegacyViolation(self) && v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationBar.m"), 2536, CFSTR("Large titles not supported when forcing the legacy provider. Remove your +_forceLegacyVisualProvider override."));

  }
  if (self->_prefersLargeTitles != v3)
  {
    self->_prefersLargeTitles = v3;
    -[_UINavigationBarVisualProvider changeLayout](self->_visualProvider, "changeLayout");
  }
}

- (void)setBackgroundImage:(UIImage *)backgroundImage forBarMetrics:(UIBarMetrics)barMetrics
{
  -[UINavigationBar setBackgroundImage:forBarPosition:barMetrics:](self, "setBackgroundImage:forBarPosition:barMetrics:", backgroundImage, 0, barMetrics);
}

- (void)_willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UINavigationBar;
  -[UIView _willMoveToWindow:](&v9, sel__willMoveToWindow_, v4);
  if (v4)
  {
    objc_msgSend(v4, "screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UINavigationBar _shouldShowBackButtonForScreen:](self, "_shouldShowBackButtonForScreen:", v5);

    if (!v6)
    {
      -[_UINavigationBarItemStack backItem](self->_stack, "backItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "existingBackButtonView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v8, "removeFromSuperview");
        -[UINavigationBar setNeedsLayout](self, "setNeedsLayout");
      }

    }
  }

}

- (BOOL)_shouldShowBackButtonForScreen:(id)a3
{
  return !-[UINavigationBar _isAlwaysHidden](self, "_isAlwaysHidden", a3);
}

- (void)setBackIndicatorTransitionMaskImage:(UIImage *)backIndicatorTransitionMaskImage
{
  unint64_t v4;
  _UINavigationBarAppearanceStorage *appearanceStorage;
  _UINavigationBarAppearanceStorage *v6;
  _UINavigationBarAppearanceStorage *v7;
  UIImage *v8;
  UIImage *v9;

  v4 = backIndicatorTransitionMaskImage;
  appearanceStorage = self->_appearanceStorage;
  if (v4 | (unint64_t)appearanceStorage)
  {
    v9 = (UIImage *)v4;
    if (!appearanceStorage)
    {
      v6 = objc_alloc_init(_UINavigationBarAppearanceStorage);
      v7 = self->_appearanceStorage;
      self->_appearanceStorage = v6;

      appearanceStorage = self->_appearanceStorage;
    }
    -[_UINavigationBarAppearanceStorage backIndicatorTransitionMaskImage](appearanceStorage, "backIndicatorTransitionMaskImage");
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue();

    v4 = (unint64_t)v9;
    if (v8 != v9)
    {
      -[_UINavigationBarAppearanceStorage setBackIndicatorTransitionMaskImage:](self->_appearanceStorage, "setBackIndicatorTransitionMaskImage:", v9);
      -[_UINavigationBarVisualProvider changeAppearance](self->_visualProvider, "changeAppearance");
      v4 = (unint64_t)v9;
    }
  }

}

- (void)setBackIndicatorImage:(UIImage *)backIndicatorImage
{
  unint64_t v4;
  _UINavigationBarAppearanceStorage *appearanceStorage;
  _UINavigationBarAppearanceStorage *v6;
  _UINavigationBarAppearanceStorage *v7;
  UIImage *v8;
  UIImage *v9;

  v4 = backIndicatorImage;
  appearanceStorage = self->_appearanceStorage;
  if (v4 | (unint64_t)appearanceStorage)
  {
    v9 = (UIImage *)v4;
    if (!appearanceStorage)
    {
      v6 = objc_alloc_init(_UINavigationBarAppearanceStorage);
      v7 = self->_appearanceStorage;
      self->_appearanceStorage = v6;

      appearanceStorage = self->_appearanceStorage;
    }
    -[_UINavigationBarAppearanceStorage backIndicatorImage](appearanceStorage, "backIndicatorImage");
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue();

    v4 = (unint64_t)v9;
    if (v8 != v9)
    {
      -[_UINavigationBarAppearanceStorage setBackIndicatorImage:](self->_appearanceStorage, "setBackIndicatorImage:", v9);
      -[_UINavigationBarVisualProvider changeAppearance](self->_visualProvider, "changeAppearance");
      v4 = (unint64_t)v9;
    }
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[_UINavigationBarVisualProvider sizeThatFits:](self->_visualProvider, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setBackgroundImage:(UIImage *)backgroundImage forBarPosition:(UIBarPosition)barPosition barMetrics:(UIBarMetrics)barMetrics
{
  unint64_t v8;
  void *v9;
  const char *v10;
  _UINavigationBarAppearanceStorage *appearanceStorage;
  _UINavigationBarAppearanceStorage *v12;
  _UINavigationBarAppearanceStorage *v13;
  double v14;
  uint64_t v15;
  UIBarMetrics v16;
  id v17;
  id v18;

  v8 = backgroundImage;
  v9 = (void *)v8;
  if (barPosition == 4)
  {
    if ((byte_1ECD7B5F9 & 1) == 0)
    {
      byte_1ECD7B5F9 = 1;
      v10 = "UIBarPositionBottomAttached";
      goto LABEL_7;
    }
  }
  else if (barPosition == UIBarPositionBottom)
  {
    if ((_MergedGlobals_43 & 1) == 0)
    {
      _MergedGlobals_43 = 1;
      v10 = "UIBarPositionBottom";
LABEL_7:
      v18 = (id)v8;
      NSLog(CFSTR("%s customization of %@ for %s is ignored."), "UINavigationBar", CFSTR("background image"), v10);
LABEL_21:
      v9 = v18;
    }
  }
  else
  {
    appearanceStorage = self->_appearanceStorage;
    if (!(v8 | (unint64_t)appearanceStorage))
    {
      v9 = 0;
      goto LABEL_23;
    }
    v18 = (id)v8;
    if (!appearanceStorage)
    {
      v12 = objc_alloc_init(_UINavigationBarAppearanceStorage);
      v13 = self->_appearanceStorage;
      self->_appearanceStorage = v12;

      v9 = v18;
    }
    if ((objc_msgSend(v9, "_isResizable") & 1) == 0)
    {
      objc_msgSend(v18, "size");
      if (v14 > 1.0)
      {
        objc_msgSend(v18, "resizableImageWithCapInsets:", 0.0, 0.0, 0.0, 0.0);
        v15 = objc_claimAutoreleasedReturnValue();

        v18 = (id)v15;
      }
    }
    if ((unint64_t)(barMetrics - 101) >= 2)
      v16 = UIBarMetricsDefault;
    else
      v16 = barMetrics;
    if ((unint64_t)barMetrics >= 2)
      barMetrics = v16;
    -[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self->_appearanceStorage, "backgroundImageForBarPosition:barMetrics:", barPosition, barMetrics);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    v9 = v18;
    if (v18 != v17)
    {
      -[_UIBarAppearanceStorage setBackgroundImage:forBarPosition:barMetrics:](self->_appearanceStorage, "setBackgroundImage:forBarPosition:barMetrics:", v18, barPosition, barMetrics);
      -[UINavigationBar _setNeedsBackgroundViewUpdate](self, "_setNeedsBackgroundViewUpdate");
      -[UIView _updateNeedsDisplayOnBoundsChange](self);
      -[UINavigationBar _sendNavigationBarDidChangeStyle](self, "_sendNavigationBarDidChangeStyle");
      goto LABEL_21;
    }
  }
LABEL_23:

}

- (void)_sendNavigationBarDidChangeStyle
{
  id WeakRetained;
  void *v4;
  char v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "_navigationBarDidChangeStyle:", self);
      v4 = v6;
    }
  }

}

- (void)_displayItemsKeepingOwningNavigationBar:(id)a3
{
  -[UINavigationBar _setItems:transition:reset:](self, "_setItems:transition:reset:", a3, 0, 0);
}

- (void)_fadeAllViewsIn
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[_UINavigationBarVisualProvider _shim_displayViewsIncludingHiddenBackButtonViews:](self->_visualProvider, "_shim_displayViewsIncludingHiddenBackButtonViews:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setAlpha:", 1.0);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_setForceScrollEdgeAppearance:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v3 = a3;
  if (_UIBarsApplyChromelessEverywhere()
    && -[UINavigationBar _effectiveDelegateSupportsScrollEdgeTransitionProgress](self, "_effectiveDelegateSupportsScrollEdgeTransitionProgress"))
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "forceScrollEdgeAppearance IPI should not be used for chromeless-everywhere to avoid possible conflicts", buf, 2u);
      }

    }
    else
    {
      v5 = _setForceScrollEdgeAppearance____s_category;
      if (!_setForceScrollEdgeAppearance____s_category)
      {
        v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v5, (unint64_t *)&_setForceScrollEdgeAppearance____s_category);
      }
      v6 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "forceScrollEdgeAppearance IPI should not be used for chromeless-everywhere to avoid possible conflicts", v8, 2u);
      }
    }
  }
  -[_UINavigationBarVisualProvider setForceScrollEdgeAppearance:](self->_visualProvider, "setForceScrollEdgeAppearance:", v3);
}

- (UINavigationBar)initWithCoder:(id)a3
{
  id v4;
  UINavigationBar *v5;
  uint64_t v6;
  _UINavigationBarVisualProvider *visualProvider;
  void *v8;
  _UINavigationBarAppearanceStorage *appearanceStorage;
  _UINavigationBarAppearanceStorage *v10;
  _UINavigationBarAppearanceStorage *v11;
  uint64_t v12;
  NSDictionary *largeTitleTextAttributes;
  __int16 v14;
  uint64_t v15;
  UIColor *barTintColor;
  void *v17;
  id *p_delegate;
  id WeakRetained;
  char v20;
  id v21;
  char v22;
  id v23;
  char v24;
  id v25;
  char isKindOfClass;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  UINavigationBarAppearance *standardAppearance;
  void *v33;
  UINavigationBarAppearance *v34;
  uint64_t v35;
  UINavigationBarAppearance *compactAppearance;
  void *v37;
  UINavigationBarAppearance *v38;
  uint64_t v39;
  UINavigationBarAppearance *scrollEdgeAppearance;
  void *v41;
  UINavigationBarAppearance *v42;
  uint64_t v43;
  UINavigationBarAppearance *compactScrollEdgeAppearance;
  void *v45;
  UINavigationBarAppearance *v46;
  void *v47;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)UINavigationBar;
  v5 = -[UIView initWithCoder:](&v49, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "_visualProviderForNavigationBar:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    visualProvider = v5->_visualProvider;
    v5->_visualProvider = (_UINavigationBarVisualProvider *)v6;

    v5->_barStyle = 0;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIBarStyle")))
      v5->_barStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIBarStyle"));
    if (dyld_program_sdk_at_least())
    {
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIBarPrefersLargeTitles")))
        v5->_prefersLargeTitles = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIBarPrefersLargeTitles"));
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIBarBackgroundImages")))
      {
        objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIBarBackgroundImages"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        appearanceStorage = v5->_appearanceStorage;
        if (!appearanceStorage)
        {
          v10 = objc_alloc_init(_UINavigationBarAppearanceStorage);
          v11 = v5->_appearanceStorage;
          v5->_appearanceStorage = v10;

          appearanceStorage = v5->_appearanceStorage;
        }
        -[_UIBarAppearanceStorage setAllBackgroundImages:](appearanceStorage, "setAllBackgroundImages:", v8);

      }
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIBarLargeTitleTextAttributes")))
      {
        objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIBarLargeTitleTextAttributes"));
        v12 = objc_claimAutoreleasedReturnValue();
        largeTitleTextAttributes = v5->_largeTitleTextAttributes;
        v5->_largeTitleTextAttributes = (NSDictionary *)v12;

      }
    }
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIIsLocked")))
      v14 = 2;
    else
      v14 = 0;
    *(_WORD *)&v5->_navbarFlags = *(_WORD *)&v5->_navbarFlags & 0xFFFD | v14;
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIBarTintColor"));
    v15 = objc_claimAutoreleasedReturnValue();
    barTintColor = v5->_barTintColor;
    v5->_barTintColor = (UIColor *)v15;

    -[UIView setClipsToBounds:](v5, "setClipsToBounds:", 0);
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIDelegate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    p_delegate = (id *)&v5->_delegate;
    objc_storeWeak((id *)&v5->_delegate, v17);

    WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
      *(_WORD *)&v5->_navbarFlags |= 0x10u;
    v21 = objc_loadWeakRetained(p_delegate);
    v22 = objc_opt_respondsToSelector();

    if ((v22 & 1) != 0)
      *(_WORD *)&v5->_navbarFlags |= 0x20u;
    v23 = objc_loadWeakRetained(p_delegate);
    v24 = objc_opt_respondsToSelector();

    if ((v24 & 1) != 0)
      *(_WORD *)&v5->_navbarFlags |= 0x40u;
    v25 = objc_loadWeakRetained(p_delegate);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      *(_WORD *)&v5->_navbarFlags |= 0x80u;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIShadowImage")))
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIShadowImage"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationBar setShadowImage:](v5, "setShadowImage:", v27);

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UITitleTextAttributes")))
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITitleTextAttributes"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationBar setTitleTextAttributes:](v5, "setTitleTextAttributes:", v28);

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIBarPosition")))
      v5->_barPosition = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIBarPosition"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIBarTranslucence")))
      v5->_barTranslucence = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIBarTranslucence"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIBackIndicatorImage")))
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIBackIndicatorImage"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationBar setBackIndicatorImage:](v5, "setBackIndicatorImage:", v29);

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIBackIndicatorTransitionMask")))
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIBackIndicatorTransitionMask"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationBar setBackIndicatorTransitionMaskImage:](v5, "setBackIndicatorTransitionMaskImage:", v30);

    }
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UINavigationBarStandardAppearance"));
    v31 = objc_claimAutoreleasedReturnValue();
    standardAppearance = v5->_standardAppearance;
    v5->_standardAppearance = (UINavigationBarAppearance *)v31;

    -[_UINavigationBarVisualProvider appearanceObserver](v5->_visualProvider, "appearanceObserver");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v5->_standardAppearance;
    if (v34)
      objc_storeWeak((id *)&v34->super._changeObserver, v33);

    if (v5->_standardAppearance)
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UINavigationBarCompactAppearance"));
      v35 = objc_claimAutoreleasedReturnValue();
      compactAppearance = v5->_compactAppearance;
      v5->_compactAppearance = (UINavigationBarAppearance *)v35;

      -[_UINavigationBarVisualProvider appearanceObserver](v5->_visualProvider, "appearanceObserver");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v5->_compactAppearance;
      if (v38)
        objc_storeWeak((id *)&v38->super._changeObserver, v37);

      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UINavigationBarScrollEdgeAppearance"));
      v39 = objc_claimAutoreleasedReturnValue();
      scrollEdgeAppearance = v5->_scrollEdgeAppearance;
      v5->_scrollEdgeAppearance = (UINavigationBarAppearance *)v39;

      -[_UINavigationBarVisualProvider appearanceObserver](v5->_visualProvider, "appearanceObserver");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v5->_scrollEdgeAppearance;
      if (v42)
        objc_storeWeak((id *)&v42->super._changeObserver, v41);

      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UINavigationBarCompactScrollEdgeAppearance"));
      v43 = objc_claimAutoreleasedReturnValue();
      compactScrollEdgeAppearance = v5->_compactScrollEdgeAppearance;
      v5->_compactScrollEdgeAppearance = (UINavigationBarAppearance *)v43;

      -[_UINavigationBarVisualProvider appearanceObserver](v5->_visualProvider, "appearanceObserver");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v5->_compactScrollEdgeAppearance;
      if (v46)
        objc_storeWeak((id *)&v46->super._changeObserver, v45);

      *(_WORD *)&v5->_navbarFlags |= 0x400u;
    }
    -[UINavigationBar _commonNavBarInit](v5, "_commonNavBarInit");
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIItems"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationBar _setDecodedItems:](v5, "_setDecodedItems:", v47);

  }
  return v5;
}

- (void)_setItemsUpToItem:(id)a3 transition:(int)a4
{
  uint64_t v4;
  void *v6;
  _UINavigationBarItemStack *stack;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = *(_QWORD *)&a4;
  v11 = a3;
  if (!-[_UINavigationBarItemStack state](self->_stack, "state"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    stack = self->_stack;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __48__UINavigationBar__setItemsUpToItem_transition___block_invoke;
    v12[3] = &unk_1E16B5CC8;
    v8 = v11;
    v13 = v8;
    v9 = v6;
    v14 = v9;
    -[_UINavigationBarItemStack iterateItems:](stack, "iterateItems:", v12);
    if ((_DWORD)v4)
    {
      objc_msgSend(v9, "addObject:", v8);
      -[UINavigationBar _setItems:transition:reset:](self, "_setItems:transition:reset:", v9, 0, 0);
      v10 = -[UINavigationBar _popNavigationItemWithTransition:](self, "_popNavigationItemWithTransition:", v4);
    }
    else
    {
      -[UINavigationBar _setItems:transition:reset:](self, "_setItems:transition:reset:", v9, 0, 0);
    }

  }
}

- (void)dealloc
{
  void *v3;
  _UINavigationBarItemStack *stack;
  objc_super v5;
  _QWORD v6[5];

  -[_UINavigationBarVisualProvider teardown](self->_visualProvider, "teardown");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIAccessibilityButtonShapesEnabledStatusDidChangeNotification"), 0);

  stack = self->_stack;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__UINavigationBar_dealloc__block_invoke;
  v6[3] = &unk_1E16B5C28;
  v6[4] = self;
  -[_UINavigationBarItemStack iterateItems:](stack, "iterateItems:", v6);
  if (self->_navControllerAnimatingContext)
    -[UINavigationBar _reenableUserInteraction](self, "_reenableUserInteraction");
  v5.receiver = self;
  v5.super_class = (Class)UINavigationBar;
  -[UIView dealloc](&v5, sel_dealloc);
}

- (void)_setDecodedItems:(id)a3
{
  id v4;
  _UINavigationBarItemStack *stack;
  BOOL v6;
  void *v7;
  _UINavigationBarItemStack *v8;
  uint64_t v9;
  _UINavigationBarItemStack *v10;
  _UINavigationBarItemStack *v11;
  _UINavigationBarItemStack *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  _QWORD v16[5];

  v4 = a3;
  stack = self->_stack;
  v14 = v4;
  if (stack)
  {
    v6 = -[_UINavigationBarItemStack stackItemsAreEqualTo:](stack, "stackItemsAreEqualTo:", v4);
    v7 = v14;
    if (v6)
      goto LABEL_8;
    v8 = self->_stack;
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __36__UINavigationBar__setDecodedItems___block_invoke;
    v16[3] = &unk_1E16B5C28;
    v16[4] = self;
    -[_UINavigationBarItemStack iterateItems:](v8, "iterateItems:", v16);
    -[_UINavigationBarItemStack setItems:withTransitionAssistant:](self->_stack, "setItems:withTransitionAssistant:", v14, 0);
    v10 = self->_stack;
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __36__UINavigationBar__setDecodedItems___block_invoke_2;
    v15[3] = &unk_1E16B5C28;
    v15[4] = self;
    -[_UINavigationBarItemStack iterateItems:](v10, "iterateItems:", v15);
  }
  else
  {
    v11 = -[_UINavigationBarItemStack initWithItems:]([_UINavigationBarItemStack alloc], "initWithItems:", v4);
    v12 = self->_stack;
    self->_stack = v11;

    -[_UINavigationBarVisualProvider setStack:](self->_visualProvider, "setStack:", self->_stack);
  }
  -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    -[_UINavigationBarVisualProvider setupTopNavigationItem](self->_visualProvider, "setupTopNavigationItem");
  -[_UINavigationBarItemStack completeOperation](self->_stack, "completeOperation");
  -[UINavigationBar _accessibility_navigationBarContentsDidChange](self, "_accessibility_navigationBarContentsDidChange");

  v7 = v14;
LABEL_8:

}

void __26__UINavigationBar_dealloc__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "_navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    objc_msgSend(v5, "_removeTitleAndButtonViews");
    objc_msgSend(v5, "_setNavigationBar:", 0);
  }

}

uint64_t __48__UINavigationBar__setItemsUpToItem_transition___block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  if (*(_QWORD *)(result + 32) != a2)
    return objc_msgSend(*(id *)(result + 40), "addObject:", a2);
  *a3 = 1;
  return result;
}

void __36__UINavigationBar__setDecodedItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 480);
  v4 = a2;
  objc_msgSend(v3, "removeContentForItem:", v4);
  objc_msgSend(v4, "_setNavigationBar:", *(_QWORD *)(a1 + 32));

}

void __36__UINavigationBar__setDecodedItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 480);
  v3 = a2;
  objc_msgSend(v2, "removeContentForItem:", v3);
  objc_msgSend(v3, "_setNavigationBar:", 0);

}

uint64_t __34__UINavigationBar__redisplayItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)_redisplayItems
{
  void *v3;
  _UINavigationBarItemStack *stack;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  stack = self->_stack;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __34__UINavigationBar__redisplayItems__block_invoke;
  v18[3] = &unk_1E16B5CA0;
  v5 = v3;
  v19 = v5;
  -[_UINavigationBarItemStack iterateEntries:](stack, "iterateEntries:", v18);
  -[UINavigationBar _setItems:transition:reset:](self, "_setItems:transition:reset:", 0, 0, 1);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
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
        objc_msgSend(v11, "item", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_stackEntry");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "updateStateFromCounterpart:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v8);
  }

}

- (void)_addItem:(id)a3 withEffectiveDelegate:(id)a4 transition:(int)a5
{
  uint64_t v5;
  id v7;
  id v8;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  -[UINavigationBar setLocked:](self, "setLocked:", 0);
  -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v8)
    -[UINavigationBar _pushNavigationItem:transition:](self, "_pushNavigationItem:transition:", v8, v5);
  -[UINavigationBar setLocked:](self, "setLocked:", 1);

}

- (void)setTitleVerticalPositionAdjustment:(CGFloat)adjustment forBarMetrics:(UIBarMetrics)barMetrics
{
  _UINavigationBarAppearanceStorage *appearanceStorage;
  _UINavigationBarAppearanceStorage *v9;
  _UINavigationBarAppearanceStorage *v10;
  double v11;

  appearanceStorage = self->_appearanceStorage;
  if (adjustment != 0.0 || appearanceStorage != 0)
  {
    if (!appearanceStorage)
    {
      v9 = objc_alloc_init(_UINavigationBarAppearanceStorage);
      v10 = self->_appearanceStorage;
      self->_appearanceStorage = v9;

      appearanceStorage = self->_appearanceStorage;
    }
    -[_UINavigationBarAppearanceStorage titleVerticalAdjustmentForBarMetrics:](appearanceStorage, "titleVerticalAdjustmentForBarMetrics:", barMetrics);
    if (v11 != adjustment)
    {
      -[_UINavigationBarAppearanceStorage setTitleVerticalAdjustment:forBarMetrics:](self->_appearanceStorage, "setTitleVerticalAdjustment:forBarMetrics:", barMetrics, adjustment);
      -[UINavigationBar setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)_traitCollectionDidChangeOnSubtreeInternal:(const _UITraitCollectionChangeDescription *)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UINavigationBar;
  -[UIView _traitCollectionDidChangeOnSubtreeInternal:](&v5, sel__traitCollectionDidChangeOnSubtreeInternal_);
  -[_UINavigationBarVisualProvider traitCollectionDidChangeOnSubtree:](self->_visualProvider, "traitCollectionDidChangeOnSubtree:", a3->var0);
}

- (void)_setHidesShadow:(BOOL)a3
{
  _BOOL8 v3;
  _UINavigationBarAppearanceStorage *appearanceStorage;
  _UINavigationBarAppearanceStorage *v6;
  _UINavigationBarAppearanceStorage *v7;

  v3 = a3;
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    v6 = objc_alloc_init(_UINavigationBarAppearanceStorage);
    v7 = self->_appearanceStorage;
    self->_appearanceStorage = v6;

    appearanceStorage = self->_appearanceStorage;
  }
  if (-[_UINavigationBarAppearanceStorage hidesShadow](appearanceStorage, "hidesShadow") != v3)
  {
    -[_UINavigationBarAppearanceStorage setHidesShadow:](self->_appearanceStorage, "setHidesShadow:", v3);
    -[_UINavigationBarVisualProvider changeAppearance](self->_visualProvider, "changeAppearance");
  }
}

- (void)_setBackgroundView:(id)a3
{
  -[_UINavigationBarVisualProvider _shim_setCustomBackgroundView:](self->_visualProvider, "_shim_setCustomBackgroundView:", a3);
}

- (void)setCompactAppearance:(UINavigationBarAppearance *)compactAppearance
{
  UINavigationBarAppearance *v4;
  UINavigationBarAppearance *v5;
  UINavigationBarAppearance *v6;
  BOOL v7;
  UINavigationBarAppearance *v8;
  UINavigationBarAppearance *v9;
  UINavigationBarAppearance *v10;
  void *v11;
  UINavigationBarAppearance *v12;
  void *v13;
  void *v14;
  double *v15;
  double v16;
  UINavigationBarAppearance *v17;

  v4 = compactAppearance;
  v5 = self->_compactAppearance;
  v6 = v4;
  v17 = v6;
  if (v5 == v6)
  {

LABEL_17:
    *(_WORD *)&self->_navbarFlags |= 0x400u;
    -[UINavigationBar _upgradeAppearanceAPI](self, "_upgradeAppearanceAPI");
    goto LABEL_18;
  }
  if (v6 && v5)
  {
    v7 = -[UIBarAppearance isEqual:](v5, "isEqual:", v6);

    if (v7)
      goto LABEL_17;
  }
  else
  {

  }
  v8 = self->_compactAppearance;
  if (v8)
    objc_storeWeak((id *)&v8->super._changeObserver, 0);
  v9 = -[UIBarAppearance copy](v17, "copy");
  v10 = self->_compactAppearance;
  self->_compactAppearance = v9;

  -[UINavigationBar _installDefaultAppearance](self, "_installDefaultAppearance");
  -[_UINavigationBarVisualProvider appearanceObserver](self->_visualProvider, "appearanceObserver");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = self->_compactAppearance;
  if (v12)
    objc_storeWeak((id *)&v12->super._changeObserver, v11);

  if (!_UIBarsApplyChromelessEverywhere() || !-[UINavigationBar isMinibar](self, "isMinibar"))
    goto LABEL_17;
  -[_UINavigationBarVisualProvider stack](self->_visualProvider, "stack");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topEntry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activeLayout");
  v15 = (double *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {

    *(_WORD *)&self->_navbarFlags |= 0x400u;
    -[UINavigationBar _upgradeAppearanceAPI](self, "_upgradeAppearanceAPI");
    goto LABEL_16;
  }
  v16 = v15[36];

  *(_WORD *)&self->_navbarFlags |= 0x400u;
  -[UINavigationBar _upgradeAppearanceAPI](self, "_upgradeAppearanceAPI");
  if (v16 != 1.0)
LABEL_16:
    -[UINavigationBar setNeedsLayout](self, "setNeedsLayout");
LABEL_18:

}

- (BOOL)isMinibar
{
  int64_t v2;

  v2 = -[UINavigationBar _activeBarMetrics](self, "_activeBarMetrics");
  return v2 == 1 || v2 == 102;
}

- (void)setStandardAppearance:(UINavigationBarAppearance *)standardAppearance
{
  UINavigationBarAppearance *v4;
  UINavigationBarAppearance *v5;
  UINavigationBarAppearance *v6;
  BOOL v7;
  UINavigationBarAppearance *v8;
  UINavigationBarAppearance *v9;
  UINavigationBarAppearance *v10;
  void *v11;
  UINavigationBarAppearance *v12;
  void *v13;
  void *v14;
  double *v15;
  double v16;
  UINavigationBarAppearance *v17;

  v4 = standardAppearance;
  v5 = self->_standardAppearance;
  v6 = v4;
  v17 = v6;
  if (v5 == v6)
  {

LABEL_16:
    *(_WORD *)&self->_navbarFlags |= 0x400u;
    -[UINavigationBar _upgradeAppearanceAPI](self, "_upgradeAppearanceAPI");
    goto LABEL_17;
  }
  if (v6 && v5)
  {
    v7 = -[UIBarAppearance isEqual:](v5, "isEqual:", v6);

    if (v7)
      goto LABEL_16;
  }
  else
  {

  }
  v8 = self->_standardAppearance;
  if (v8)
    objc_storeWeak((id *)&v8->super._changeObserver, 0);
  v9 = -[UIBarAppearance copy](v17, "copy");
  v10 = self->_standardAppearance;
  self->_standardAppearance = v9;

  -[UINavigationBar _installDefaultAppearance](self, "_installDefaultAppearance");
  -[_UINavigationBarVisualProvider appearanceObserver](self->_visualProvider, "appearanceObserver");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = self->_standardAppearance;
  if (v12)
    objc_storeWeak((id *)&v12->super._changeObserver, v11);

  if (!_UIBarsApplyChromelessEverywhere())
    goto LABEL_16;
  -[_UINavigationBarVisualProvider stack](self->_visualProvider, "stack");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topEntry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activeLayout");
  v15 = (double *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {

    *(_WORD *)&self->_navbarFlags |= 0x400u;
    -[UINavigationBar _upgradeAppearanceAPI](self, "_upgradeAppearanceAPI");
    goto LABEL_15;
  }
  v16 = v15[36];

  *(_WORD *)&self->_navbarFlags |= 0x400u;
  -[UINavigationBar _upgradeAppearanceAPI](self, "_upgradeAppearanceAPI");
  if (v16 != 1.0)
LABEL_15:
    -[UINavigationBar setNeedsLayout](self, "setNeedsLayout");
LABEL_17:

}

- (void)_installDefaultAppearance
{
  UINavigationBarAppearance *v3;
  void *v4;
  UINavigationBarAppearance *v5;
  UINavigationBarAppearance *standardAppearance;
  void *v7;
  UINavigationBarAppearance *v8;
  void *v9;

  if (!self->_standardAppearance)
  {
    v3 = [UINavigationBarAppearance alloc];
    -[UIView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[UIBarAppearance initWithIdiom:](v3, "initWithIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
    standardAppearance = self->_standardAppearance;
    self->_standardAppearance = v5;

    -[_UINavigationBarVisualProvider appearanceObserver](self->_visualProvider, "appearanceObserver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_standardAppearance;
    if (v8)
    {
      v9 = v7;
      objc_storeWeak((id *)&v8->super._changeObserver, v7);
      v7 = v9;
    }

  }
}

- (void)setScrollEdgeAppearance:(UINavigationBarAppearance *)scrollEdgeAppearance
{
  UINavigationBarAppearance *v4;
  UINavigationBarAppearance *v5;
  UINavigationBarAppearance *v6;
  BOOL v7;
  UINavigationBarAppearance *v8;
  UINavigationBarAppearance *v9;
  UINavigationBarAppearance *v10;
  void *v11;
  UINavigationBarAppearance *v12;
  void *v13;
  void *v14;
  double *v15;
  double v16;
  UINavigationBarAppearance *v17;

  v4 = scrollEdgeAppearance;
  v5 = self->_scrollEdgeAppearance;
  v6 = v4;
  v17 = v6;
  if (v5 == v6)
  {

LABEL_17:
    *(_WORD *)&self->_navbarFlags |= 0x400u;
    -[UINavigationBar _upgradeAppearanceAPI](self, "_upgradeAppearanceAPI");
    goto LABEL_18;
  }
  if (v6 && v5)
  {
    v7 = -[UIBarAppearance isEqual:](v5, "isEqual:", v6);

    if (v7)
      goto LABEL_17;
  }
  else
  {

  }
  v8 = self->_scrollEdgeAppearance;
  if (v8)
    objc_storeWeak((id *)&v8->super._changeObserver, 0);
  v9 = -[UIBarAppearance copy](v17, "copy");
  v10 = self->_scrollEdgeAppearance;
  self->_scrollEdgeAppearance = v9;

  -[UINavigationBar _installDefaultAppearance](self, "_installDefaultAppearance");
  -[_UINavigationBarVisualProvider appearanceObserver](self->_visualProvider, "appearanceObserver");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = self->_scrollEdgeAppearance;
  if (v12)
    objc_storeWeak((id *)&v12->super._changeObserver, v11);

  if (!_UIBarsApplyChromelessEverywhere())
    goto LABEL_17;
  -[_UINavigationBarVisualProvider stack](self->_visualProvider, "stack");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topEntry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activeLayout");
  v15 = (double *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {

    goto LABEL_17;
  }
  v16 = v15[36];

  *(_WORD *)&self->_navbarFlags |= 0x400u;
  -[UINavigationBar _upgradeAppearanceAPI](self, "_upgradeAppearanceAPI");
  if (v16 == 1.0)
    -[UINavigationBar setNeedsLayout](self, "setNeedsLayout");
LABEL_18:

}

- (void)_upgradeAppearanceAPI
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[_UINavigationBarVisualProvider appearanceAPIVersion](self->_visualProvider, "appearanceAPIVersion") <= 1)
  {
    -[_UINavigationBarVisualProvider setAppearanceAPIVersion:](self->_visualProvider, "setAppearanceAPIVersion:", 2);
    if (-[_UINavigationBarVisualProvider appearanceAPIVersion](self->_visualProvider, "appearanceAPIVersion") != 2)
    {
      -[UIView window](self, "window");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        -[UIView traitCollection](self, "traitCollection");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        _NSStringFromUIUserInterfaceIdiom(objc_msgSend(v5, "userInterfaceIdiom"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationBar.m"), 911, CFSTR("New Bar Appearance API is not supported in this configuration. Are you using a legacy navigation bar? Idiom: %@, Navigation bar: %@"), v6, self);

      }
    }
  }
}

- (double)_titleOpacity
{
  double result;

  -[_UINavigationBarVisualProvider titleAlpha](self->_visualProvider, "titleAlpha");
  return result;
}

- (void)_updateSearchBarForPlacementChangeIfApplicable
{
  -[_UINavigationBarVisualProvider updateSearchBarForPlacementChangeIfApplicable](self->_visualProvider, "updateSearchBarForPlacementChangeIfApplicable");
}

- (void)setForceFullHeightInLandscape:(BOOL)a3
{
  __int16 navbarFlags;

  navbarFlags = (__int16)self->_navbarFlags;
  if (((((navbarFlags & 1) == 0) ^ a3) & 1) == 0)
  {
    *(_WORD *)&self->_navbarFlags = navbarFlags & 0xFFFE | a3;
    -[UINavigationBar invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[UINavigationBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundEffects, 0);
  objc_storeStrong((id *)&self->_compactScrollEdgeAppearance, 0);
  objc_storeStrong((id *)&self->_scrollEdgeAppearance, 0);
  objc_storeStrong((id *)&self->_compactAppearance, 0);
  objc_storeStrong((id *)&self->_largeTitleTextAttributes, 0);
  objc_storeStrong((id *)&self->_standardAppearance, 0);
  objc_storeStrong((id *)&self->_accessibilityButtonBackgroundTintColor, 0);
  objc_storeStrong((id *)&self->_axHUDGestureManager, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_visualProvider, 0);
  objc_storeStrong((id *)&self->_navControllerAnimatingContext, 0);
  objc_storeStrong((id *)&self->_appearanceStorage, 0);
  objc_storeStrong((id *)&self->_barTintColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stack, 0);
}

- (void)_setShadowAlpha:(double)a3
{
  -[_UINavigationBarVisualProvider _shim_setShadowAlpha:](self->_visualProvider, "_shim_setShadowAlpha:", a3);
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

      -[_UINavigationBarVisualProvider changeAppearance](self->_visualProvider, "changeAppearance");
      v4 = v9;
    }
  }

}

- (void)setLargeTitleTextAttributes:(NSDictionary *)largeTitleTextAttributes
{
  NSDictionary *v4;
  NSDictionary *v5;

  if (self->_largeTitleTextAttributes != largeTitleTextAttributes)
  {
    v4 = (NSDictionary *)-[NSDictionary copy](largeTitleTextAttributes, "copy");
    v5 = self->_largeTitleTextAttributes;
    self->_largeTitleTextAttributes = v4;

    -[_UINavigationBarVisualProvider changeAppearance](self->_visualProvider, "changeAppearance");
    -[_UINavigationBarVisualProvider changeLayout](self->_visualProvider, "changeLayout");
  }
}

- (void)_setStaticNavBarButtonItem:(id)a3
{
  -[_UINavigationBarVisualProvider setStaticNavBarButtonItem:](self->_visualProvider, "setStaticNavBarButtonItem:", a3);
}

- (void)_setRequestedMaxBackButtonWidth:(double)a3
{
  self->_requestedMaxBackButtonWidth = a3;
}

- (void)_setBackgroundOpacity:(double)a3
{
  -[_UINavigationBarVisualProvider setBackgroundAlpha:](self->_visualProvider, "setBackgroundAlpha:", a3);
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id WeakRetained;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UINavigationBar;
  -[UIView description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v4, "appendFormat:", CFSTR(" delegate=%p"), v6);

  }
  if (objc_msgSend((id)objc_opt_class(), "_forceLegacyVisualProvider"))
    objc_msgSend(v4, "appendFormat:", CFSTR(" forcedLegacyProvider"));
  if (self->_standardAppearance)
    objc_msgSend(v4, "appendFormat:", CFSTR(" standardAppearance=%p"), self->_standardAppearance);
  if (self->_scrollEdgeAppearance)
    objc_msgSend(v4, "appendFormat:", CFSTR(" scrollEdgeAppearance=%p"), self->_scrollEdgeAppearance);
  if (self->_compactAppearance)
    objc_msgSend(v4, "appendFormat:", CFSTR(" compactAppearance=%p"), self->_compactAppearance);
  if (self->_compactScrollEdgeAppearance)
    objc_msgSend(v4, "appendFormat:", CFSTR(" compactScrollEdgeAppearance=%p"), self->_compactScrollEdgeAppearance);
  if ((*(_WORD *)&self->_navbarFlags & 0x80) == 0)
    objc_msgSend(v4, "appendString:", CFSTR(" no-scroll-edge-support"));
  return (NSString *)v4;
}

- (void)_setDecodedUnlockedWithNavigationControllerDelegate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_navbarFlags = *(_WORD *)&self->_navbarFlags & 0xFEFF | v3;
}

- (BOOL)_wasDecodedUnlockedWithNavigationControllerDelegate
{
  return HIBYTE(*(_WORD *)&self->_navbarFlags) & 1;
}

- (BOOL)_useInlineBackgroundHeightWhenLarge
{
  return -[_UINavigationBarVisualProvider useInlineBackgroundHeightWhenLarge](self->_visualProvider, "useInlineBackgroundHeightWhenLarge");
}

- (void)_setUseInlineBackgroundHeightWhenLarge:(BOOL)a3
{
  -[_UINavigationBarVisualProvider setUseInlineBackgroundHeightWhenLarge:](self->_visualProvider, "setUseInlineBackgroundHeightWhenLarge:", a3);
}

- (double)_backgroundOpacity
{
  double result;

  -[_UINavigationBarVisualProvider backgroundAlpha](self->_visualProvider, "backgroundAlpha");
  return result;
}

- (double)_shadowAlpha
{
  double result;

  -[_UINavigationBarVisualProvider _shim_shadowAlpha](self->_visualProvider, "_shim_shadowAlpha");
  return result;
}

- (BOOL)_disableBlurTinting
{
  return -[_UINavigationBarVisualProvider _shim_disableBlurTinting](self->_visualProvider, "_shim_disableBlurTinting");
}

- (void)_setDisableBlurTinting:(BOOL)a3
{
  -[_UINavigationBarVisualProvider _shim_setDisableBlurTinting:](self->_visualProvider, "_shim_setDisableBlurTinting:", a3);
}

- (void)_applySPIAppearanceToButtons
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[UIView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          -[_UINavigationBarAppearanceStorage barButtonAppearanceStorage](self->_appearanceStorage, "barButtonAppearanceStorage");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "_applyBarButtonAppearanceStorage:withTaggedSelectors:", v9, 0);

          objc_msgSend(v8, "setNeedsDisplay");
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)_setBackgroundImage:(id)a3 mini:(id)a4
{
  id v6;

  v6 = a4;
  -[UINavigationBar setBackgroundImage:forBarMetrics:](self, "setBackgroundImage:forBarMetrics:", a3, 0);
  -[UINavigationBar setBackgroundImage:forBarMetrics:](self, "setBackgroundImage:forBarMetrics:", v6, 1);

}

- (void)_setButtonBackgroundImage:(id)a3 mini:(id)a4 forStates:(unint64_t)a5
{
  id v9;
  _UINavigationBarAppearanceStorage *appearanceStorage;
  _UINavigationBarAppearanceStorage *v11;
  _UINavigationBarAppearanceStorage *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v17 = a3;
  v9 = a4;
  if (a5 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationBar.m"), 470, CFSTR("Normal and Highlighted (pressed) states are the only supported states"));

  }
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    v11 = objc_alloc_init(_UINavigationBarAppearanceStorage);
    v12 = self->_appearanceStorage;
    self->_appearanceStorage = v11;

    appearanceStorage = self->_appearanceStorage;
  }
  -[_UINavigationBarAppearanceStorage barButtonAppearanceStorage](appearanceStorage, "barButtonAppearanceStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "backgroundImageForState:style:isMini:", a5, 8, 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14 != v17)
  {

LABEL_8:
    objc_msgSend(v13, "setBackgroundImage:forState:style:isMini:", v17, a5, 8, 0);
    objc_msgSend(v13, "setBackgroundImage:forState:style:isMini:", v9, a5, 8, 1);
    -[UINavigationBar _applySPIAppearanceToButtons](self, "_applySPIAppearanceToButtons");
    goto LABEL_9;
  }
  objc_msgSend(v13, "backgroundImageForState:style:isMini:", a5, 8, 1);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15 != v9)
    goto LABEL_8;
LABEL_9:

}

- (void)_setBackButtonBackgroundImage:(id)a3 mini:(id)a4 forStates:(unint64_t)a5
{
  id v9;
  _UINavigationBarAppearanceStorage *appearanceStorage;
  _UINavigationBarAppearanceStorage *v11;
  _UINavigationBarAppearanceStorage *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v17 = a3;
  v9 = a4;
  if (a5 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationBar.m"), 486, CFSTR("Normal and Highlighted (pressed) states are the only supported states"));

  }
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    v11 = objc_alloc_init(_UINavigationBarAppearanceStorage);
    v12 = self->_appearanceStorage;
    self->_appearanceStorage = v11;

    appearanceStorage = self->_appearanceStorage;
  }
  -[_UINavigationBarAppearanceStorage barButtonAppearanceStorage](appearanceStorage, "barButtonAppearanceStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "backButtonBackgroundImageForState:isMini:", a5, 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14 != v17)
  {

LABEL_8:
    objc_msgSend(v13, "setBackButtonBackgroundImage:forState:isMini:", v17, a5, 0);
    objc_msgSend(v13, "setBackButtonBackgroundImage:forState:isMini:", v9, a5, 1);
    -[UINavigationBar _applySPIAppearanceToButtons](self, "_applySPIAppearanceToButtons");
    goto LABEL_9;
  }
  objc_msgSend(v13, "backButtonBackgroundImageForState:isMini:", a5, 1);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15 != v9)
    goto LABEL_8;
LABEL_9:

}

- (void)_setButtonItemTextColor:(id)a3 shadowColor:(id)a4 forState:(unint64_t)a5
{
  id v8;
  _UINavigationBarAppearanceStorage *appearanceStorage;
  _UINavigationBarAppearanceStorage *v10;
  _UINavigationBarAppearanceStorage *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  id v22;

  v22 = a3;
  v8 = a4;
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    v10 = objc_alloc_init(_UINavigationBarAppearanceStorage);
    v11 = self->_appearanceStorage;
    self->_appearanceStorage = v10;

    appearanceStorage = self->_appearanceStorage;
  }
  -[_UINavigationBarAppearanceStorage barButtonAppearanceStorage](appearanceStorage, "barButtonAppearanceStorage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textAttributesForState:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22 || v8 || v13)
  {
    v14 = (id)objc_msgSend(v13, "mutableCopy");
    if (!v14)
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v15 = *(_QWORD *)off_1E1678D98;
    if (v22)
      objc_msgSend(v14, "setObject:forKey:", v22, v15);
    else
      objc_msgSend(v14, "removeObjectForKey:", v15);
    v16 = *(_QWORD *)off_1E1679048;
    objc_msgSend(v13, "objectForKey:", *(_QWORD *)off_1E1679048);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      if (!v8)
        goto LABEL_19;
    }
    else
    {
      v17 = objc_alloc_init((Class)off_1E1679CA0);
      objc_msgSend(v17, "setShadowOffset:", 0.0, -1.0);
      objc_msgSend(v17, "setShadowColor:", 0);
      if (!v8)
        goto LABEL_19;
    }
    if (a5 == 1)
    {
      if (-[_UINavigationBarAppearanceStorage reversesShadowOffset](self->_appearanceStorage, "reversesShadowOffset"))
      {
        objc_msgSend(v12, "textAttributeForKey:state:", v16, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          objc_msgSend(v18, "shadowOffset");
        }
        else
        {
          v21 = -1.0;
          v20 = 0.0;
        }
        objc_msgSend(v17, "setShadowOffset:", -v20, -v21);

      }
      goto LABEL_23;
    }
LABEL_19:
    if (!v8)
    {
      objc_msgSend(v14, "removeObjectForKey:", v16);
LABEL_24:
      if ((objc_msgSend(v14, "isEqualToDictionary:", v13) & 1) == 0)
      {
        objc_msgSend(v12, "setTextAttributes:forState:", v14, a5);
        -[UINavigationBar _applySPIAppearanceToButtons](self, "_applySPIAppearanceToButtons");
      }

      goto LABEL_27;
    }
LABEL_23:
    objc_msgSend(v14, "setObject:forKey:", v17, v16);
    goto LABEL_24;
  }
LABEL_27:

}

- (void)_setButtonItemTextColor:(id)a3 shadowColor:(id)a4
{
  -[UINavigationBar _setButtonItemTextColor:shadowColor:forState:](self, "_setButtonItemTextColor:shadowColor:forState:", a3, a4, 0);
}

- (void)_setPressedButtonItemTextColor:(id)a3 shadowColor:(id)a4
{
  -[UINavigationBar _setButtonItemTextColor:shadowColor:forState:](self, "_setButtonItemTextColor:shadowColor:forState:", a3, a4, 1);
}

- (void)_setButtonTextShadowOffset:(CGSize)a3
{
  double height;
  double width;
  _UINavigationBarAppearanceStorage *appearanceStorage;
  _UINavigationBarAppearanceStorage *v7;
  _UINavigationBarAppearanceStorage *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _BOOL4 v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  double v18;
  double v19;
  id v20;

  height = a3.height;
  width = a3.width;
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    v7 = objc_alloc_init(_UINavigationBarAppearanceStorage);
    v8 = self->_appearanceStorage;
    self->_appearanceStorage = v7;

    appearanceStorage = self->_appearanceStorage;
  }
  -[_UINavigationBarAppearanceStorage barButtonAppearanceStorage](appearanceStorage, "barButtonAppearanceStorage");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "textAttributesForState:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "textAttributesForState:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v9, "mutableCopy");
  if (!v11)
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = (id)objc_msgSend(v10, "mutableCopy");
  if (!v12)
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = -[_UINavigationBarAppearanceStorage reversesShadowOffset](self->_appearanceStorage, "reversesShadowOffset");
  v14 = *(_QWORD *)off_1E1679048;
  objc_msgSend(v9, "objectForKey:", *(_QWORD *)off_1E1679048);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v14);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (id)v16;
  if (v15)
  {
    if (v16)
      goto LABEL_9;
  }
  else
  {
    v15 = objc_alloc_init((Class)off_1E1679CA0);
    objc_msgSend(v15, "setShadowColor:", 0);
    if (v17)
      goto LABEL_9;
  }
  v17 = objc_alloc_init((Class)off_1E1679CA0);
  objc_msgSend(v17, "setShadowColor:", 0);
LABEL_9:
  objc_msgSend(v15, "setShadowOffset:", width, height);
  v18 = -width;
  v19 = -height;
  if (!v13)
  {
    v19 = height;
    v18 = width;
  }
  objc_msgSend(v17, "setShadowOffset:", v18, v19);
  objc_msgSend(v11, "setObject:forKey:", v15, v14);
  objc_msgSend(v12, "setObject:forKey:", v17, v14);
  if (objc_msgSend(v11, "isEqualToDictionary:", v9))
  {
    if ((objc_msgSend(v12, "isEqual:", v10) & 1) != 0)
      goto LABEL_17;
    goto LABEL_15;
  }
  objc_msgSend(v20, "setTextAttributes:forState:", v11, 0);
  if ((objc_msgSend(v12, "isEqual:", v10) & 1) == 0)
LABEL_15:
    objc_msgSend(v20, "setTextAttributes:forState:", v12, 1);
  -[UINavigationBar _applySPIAppearanceToButtons](self, "_applySPIAppearanceToButtons");
LABEL_17:

}

- (void)_setReversesButtonTextShadowOffsetWhenPressed:(BOOL)a3
{
  _BOOL8 v3;
  _UINavigationBarAppearanceStorage *appearanceStorage;
  _UINavigationBarAppearanceStorage *v6;
  _UINavigationBarAppearanceStorage *v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;

  v3 = a3;
  appearanceStorage = self->_appearanceStorage;
  if (a3)
  {
    if (!appearanceStorage)
    {
      v6 = objc_alloc_init(_UINavigationBarAppearanceStorage);
      v7 = self->_appearanceStorage;
      self->_appearanceStorage = v6;

      appearanceStorage = self->_appearanceStorage;
    }
LABEL_5:
    -[_UINavigationBarAppearanceStorage barButtonAppearanceStorage](appearanceStorage, "barButtonAppearanceStorage");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "textAttributesForState:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "textAttributesForState:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v3 && !v8 && v9 == 0)
    {
LABEL_23:

      return;
    }
    v12 = (id)objc_msgSend(v9, "mutableCopy");
    if (!v12)
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[_UINavigationBarAppearanceStorage setReversesShadowOffset:](self->_appearanceStorage, "setReversesShadowOffset:", v3);
    v13 = *(_QWORD *)off_1E1679048;
    objc_msgSend(v8, "objectForKey:", *(_QWORD *)off_1E1679048);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v13);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (v14)
      {
LABEL_14:
        objc_msgSend(v14, "shadowOffset");
LABEL_18:
        v18 = -v16;
        v19 = -v17;
        if (v3)
        {
          v16 = -v16;
          v17 = -v17;
        }
        objc_msgSend(v15, "setShadowOffset:", v16, v17, v18, v19);
        objc_msgSend(v12, "setObject:forKey:", v15, v13);
        if ((objc_msgSend(v12, "isEqual:", v10) & 1) == 0)
        {
          objc_msgSend(v20, "setTextAttributes:forState:", v12, 1);
          -[UINavigationBar _applySPIAppearanceToButtons](self, "_applySPIAppearanceToButtons");
        }

        goto LABEL_23;
      }
    }
    else
    {
      v15 = objc_alloc_init((Class)off_1E1679CA0);
      objc_msgSend(v15, "setShadowColor:", 0);
      if (v14)
        goto LABEL_14;
    }
    v17 = -1.0;
    v16 = 0.0;
    goto LABEL_18;
  }
  if (appearanceStorage)
    goto LABEL_5;
}

+ (id)_statusBarBaseTintColorForStyle:(int64_t)a3 translucent:(BOOL)a4 tintColor:(id)a5 backgroundImage:(id)a6 viewSize:(CGSize)a7
{
  return 0;
}

+ (id)_statusBarBaseTintColorForStyle:(int64_t)a3 translucent:(BOOL)a4 tintColor:(id)a5
{
  return (id)objc_msgSend(a1, "_statusBarBaseTintColorForStyle:translucent:tintColor:backgroundImage:viewSize:", a3, a4, a5, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (id)_effectiveDelegateForItem:(id)a3
{
  id v4;
  id v5;
  void *WeakRetained;

  v4 = a3;
  if ((*(_WORD *)&self->_navbarFlags & 0x40) == 0
    || (v5 = objc_loadWeakRetained((id *)&self->_delegate),
        objc_msgSend(v5, "_effectiveDelegateForNavigationItem:", v4),
        WeakRetained = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !WeakRetained))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }

  return WeakRetained;
}

- (int64_t)_barTranslucence
{
  return self->_barTranslucence;
}

- (double)_heightIncludingBackground
{
  double result;
  double v3;

  if (self->_barPosition == 3)
  {
    -[_UINavigationBarVisualProvider _shim_backgroundHeight](self->_visualProvider, "_shim_backgroundHeight");
  }
  else
  {
    -[UIView frame](self, "frame");
    return v3;
  }
  return result;
}

- (void)_updateBarVisibilityForTopItem
{
  -[_UINavigationBarVisualProvider updateBarVisibilityForTopItem](self->_visualProvider, "updateBarVisibilityForTopItem");
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("filters")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UINavigationBar;
    v5 = -[UIView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (double)_backIndicatorLeftMargin
{
  void *v2;
  double v3;
  double v4;

  -[_UINavigationBarAppearanceStorage backIndicatorLeftMargin](self->_appearanceStorage, "backIndicatorLeftMargin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (void)_setBackIndicatorLeftMargin:(double)a3
{
  _UINavigationBarAppearanceStorage *appearanceStorage;
  _UINavigationBarAppearanceStorage *v6;
  _UINavigationBarAppearanceStorage *v7;
  void *v8;
  double v9;
  double v10;
  _UINavigationBarAppearanceStorage *v11;
  void *v12;

  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    v6 = objc_alloc_init(_UINavigationBarAppearanceStorage);
    v7 = self->_appearanceStorage;
    self->_appearanceStorage = v6;

    appearanceStorage = self->_appearanceStorage;
  }
  -[_UINavigationBarAppearanceStorage backIndicatorLeftMargin](appearanceStorage, "backIndicatorLeftMargin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  if (v10 != a3)
  {
    v11 = self->_appearanceStorage;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarAppearanceStorage setBackIndicatorLeftMargin:](v11, "setBackIndicatorLeftMargin:", v12);

    -[UINavigationBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)_effectiveBackIndicatorLeftMargin
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  -[_UINavigationBarAppearanceStorage backIndicatorImage](self->_appearanceStorage, "backIndicatorImage");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[_UINavigationBarAppearanceStorage backIndicatorTransitionMaskImage](self->_appearanceStorage, "backIndicatorTransitionMaskImage");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[_UINavigationBarAppearanceStorage backIndicatorLeftMargin](self->_appearanceStorage, "backIndicatorLeftMargin");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[_UINavigationBarAppearanceStorage backIndicatorLeftMargin](self->_appearanceStorage, "backIndicatorLeftMargin");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "doubleValue");
        v10 = v9;
        goto LABEL_9;
      }
    }
    else
    {

    }
  }
  -[UINavigationBar _currentVisualStyle](self, "_currentVisualStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _contentMargin](self, "_contentMargin");
  v12 = v11;
  objc_msgSend(v8, "horizontalMarginAdjustment");
  v14 = v12 - v13;
  if (v14 >= 0.0)
    v10 = v14;
  else
    v10 = 0.0;
LABEL_9:

  return v10;
}

- (UILayoutGuide)_userContentGuide
{
  return (UILayoutGuide *)-[_UINavigationBarVisualProvider _shim_userContentGuide](self->_visualProvider, "_shim_userContentGuide");
}

- (int64_t)_itemStackCount
{
  return -[_UINavigationBarItemStack itemCount](self->_stack, "itemCount");
}

- (void)_setAccessibilityButtonBackgroundTintColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_accessibilityButtonBackgroundTintColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_accessibilityButtonBackgroundTintColor, a3);
    -[UINavigationBar _accessibilityButtonShapesParametersDidChange](self, "_accessibilityButtonShapesParametersDidChange");
    v5 = v6;
  }

}

- (void)_updateAppearancesForNewVisualProvider
{
  void *v3;
  UINavigationBarAppearance *standardAppearance;
  void *v5;
  UINavigationBarAppearance *compactAppearance;
  void *v7;
  UINavigationBarAppearance *scrollEdgeAppearance;
  void *v9;
  UINavigationBarAppearance *compactScrollEdgeAppearance;

  -[UINavigationBar _installDefaultAppearance](self, "_installDefaultAppearance");
  -[_UINavigationBarVisualProvider appearanceObserver](self->_visualProvider, "appearanceObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  standardAppearance = self->_standardAppearance;
  if (standardAppearance)
    objc_storeWeak((id *)&standardAppearance->super._changeObserver, v3);

  -[_UINavigationBarVisualProvider appearanceObserver](self->_visualProvider, "appearanceObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  compactAppearance = self->_compactAppearance;
  if (compactAppearance)
    objc_storeWeak((id *)&compactAppearance->super._changeObserver, v5);

  -[_UINavigationBarVisualProvider appearanceObserver](self->_visualProvider, "appearanceObserver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  scrollEdgeAppearance = self->_scrollEdgeAppearance;
  if (scrollEdgeAppearance)
    objc_storeWeak((id *)&scrollEdgeAppearance->super._changeObserver, v7);

  -[_UINavigationBarVisualProvider appearanceObserver](self->_visualProvider, "appearanceObserver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  compactScrollEdgeAppearance = self->_compactScrollEdgeAppearance;
  if (compactScrollEdgeAppearance)
    objc_storeWeak((id *)&compactScrollEdgeAppearance->super._changeObserver, v9);

  if ((*(_WORD *)&self->_navbarFlags & 0x400) != 0)
    -[UINavigationBar _upgradeAppearanceAPI](self, "_upgradeAppearanceAPI");
  -[UINavigationBar setNeedsLayout](self, "setNeedsLayout");
}

- (void)setCompactScrollEdgeAppearance:(UINavigationBarAppearance *)compactScrollEdgeAppearance
{
  UINavigationBarAppearance *v4;
  UINavigationBarAppearance *v5;
  UINavigationBarAppearance *v6;
  BOOL v7;
  UINavigationBarAppearance *v8;
  UINavigationBarAppearance *v9;
  UINavigationBarAppearance *v10;
  void *v11;
  UINavigationBarAppearance *v12;
  void *v13;
  void *v14;
  double *v15;
  double v16;
  UINavigationBarAppearance *v17;

  v4 = compactScrollEdgeAppearance;
  v5 = self->_compactScrollEdgeAppearance;
  v6 = v4;
  v17 = v6;
  if (v5 == v6)
  {

LABEL_18:
    *(_WORD *)&self->_navbarFlags |= 0x400u;
    -[UINavigationBar _upgradeAppearanceAPI](self, "_upgradeAppearanceAPI");
    goto LABEL_19;
  }
  if (v6 && v5)
  {
    v7 = -[UIBarAppearance isEqual:](v5, "isEqual:", v6);

    if (v7)
      goto LABEL_18;
  }
  else
  {

  }
  v8 = self->_compactScrollEdgeAppearance;
  if (v8)
    objc_storeWeak((id *)&v8->super._changeObserver, 0);
  v9 = -[UIBarAppearance copy](v17, "copy");
  v10 = self->_compactScrollEdgeAppearance;
  self->_compactScrollEdgeAppearance = v9;

  -[UINavigationBar _installDefaultAppearance](self, "_installDefaultAppearance");
  -[_UINavigationBarVisualProvider appearanceObserver](self->_visualProvider, "appearanceObserver");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = self->_compactScrollEdgeAppearance;
  if (v12)
    objc_storeWeak((id *)&v12->super._changeObserver, v11);

  if (!_UIBarsApplyChromelessEverywhere() || !-[UINavigationBar isMinibar](self, "isMinibar"))
    goto LABEL_18;
  -[_UINavigationBarVisualProvider stack](self->_visualProvider, "stack");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topEntry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activeLayout");
  v15 = (double *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {

    goto LABEL_18;
  }
  v16 = v15[36];

  *(_WORD *)&self->_navbarFlags |= 0x400u;
  -[UINavigationBar _upgradeAppearanceAPI](self, "_upgradeAppearanceAPI");
  if (v16 == 1.0)
    -[UINavigationBar setNeedsLayout](self, "setNeedsLayout");
LABEL_19:

}

- (UIImage)backgroundImageForBarPosition:(UIBarPosition)barPosition barMetrics:(UIBarMetrics)barMetrics
{
  const char *v4;

  if (barPosition == 4)
  {
    if ((byte_1ECD7B5FB & 1) == 0)
    {
      byte_1ECD7B5FB = 1;
      v4 = "UIBarPositionBottomAttached";
      goto LABEL_7;
    }
    return (UIImage *)0;
  }
  if (barPosition == UIBarPositionBottom)
  {
    if ((byte_1ECD7B5FA & 1) == 0)
    {
      byte_1ECD7B5FA = 1;
      v4 = "UIBarPositionBottom";
LABEL_7:
      NSLog(CFSTR("%s customization of %@ for %s is ignored."), a2, "UINavigationBar", CFSTR("background image"), v4);
      return (UIImage *)0;
    }
    return (UIImage *)0;
  }
  -[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self->_appearanceStorage, "backgroundImageForBarPosition:barMetrics:");
  return (UIImage *)(id)objc_claimAutoreleasedReturnValue();
}

- (CGFloat)titleVerticalPositionAdjustmentForBarMetrics:(UIBarMetrics)barMetrics
{
  CGFloat result;

  -[_UINavigationBarAppearanceStorage titleVerticalAdjustmentForBarMetrics:](self->_appearanceStorage, "titleVerticalAdjustmentForBarMetrics:", barMetrics);
  return result;
}

- (BOOL)_deferShadowToSearchBar
{
  return -[_UINavigationBarAppearanceStorage deferShadowToSearchBar](self->_appearanceStorage, "deferShadowToSearchBar");
}

- (void)_setDeferShadowToSearchBar:(BOOL)a3
{
  _BOOL8 v3;
  _UINavigationBarAppearanceStorage *appearanceStorage;
  _UINavigationBarAppearanceStorage *v6;
  _UINavigationBarAppearanceStorage *v7;
  double v8;

  v3 = a3;
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    v6 = objc_alloc_init(_UINavigationBarAppearanceStorage);
    v7 = self->_appearanceStorage;
    self->_appearanceStorage = v6;

    appearanceStorage = self->_appearanceStorage;
  }
  if (-[_UINavigationBarAppearanceStorage deferShadowToSearchBar](appearanceStorage, "deferShadowToSearchBar") != v3)
  {
    -[_UINavigationBarAppearanceStorage setDeferShadowToSearchBar:](self->_appearanceStorage, "setDeferShadowToSearchBar:", v3);
    v8 = 1.0;
    if (v3)
      v8 = 0.0;
    -[_UINavigationBarVisualProvider _shim_setShadowAlpha:](self->_visualProvider, "_shim_setShadowAlpha:", v8);
  }
}

- (void)_setAlwaysUseDefaultMetrics:(BOOL)a3
{
  if (self->_alwaysUseDefaultMetrics != a3)
  {
    self->_alwaysUseDefaultMetrics = a3;
    -[UINavigationBar setNeedsLayout](self, "setNeedsLayout");
  }
}

+ (id)_defaultVisualStyleForOrientation:(int64_t)a3
{
  if (qword_1ECD7B608 != -1)
    dispatch_once(&qword_1ECD7B608, &__block_literal_global_57);
  objc_msgSend((id)qword_1ECD7B600, "setMetrics:", _UIUseMiniHeightInLandscape((unint64_t)(a3 - 3) < 2));
  objc_msgSend((id)qword_1ECD7B600, "setInPopover:", 0);
  return (id)qword_1ECD7B600;
}

void __53__UINavigationBar__defaultVisualStyleForOrientation___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_UINavigationBarVisualStyle visualStyleForIdiom:](_UINavigationBarVisualStyle, "visualStyleForIdiom:", -1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7B600;
  qword_1ECD7B600 = v0;

}

- (id)_currentVisualStyle
{
  _UINavigationBarVisualStyle *visualStyle;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  _UINavigationBarVisualStyle *v10;
  _UINavigationBarVisualStyle *v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  if ((-[_UINavigationBarVisualProvider _shim](self->_visualProvider, "_shim") & 1) != 0)
  {
    visualStyle = self->_visualStyle;
    if (!visualStyle)
    {
      -[UIView _screen](self, "_screen");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
        v6 = objc_msgSend(v4, "_userInterfaceIdiom");
      else
        v6 = -1;
      +[_UINavigationBarVisualStyle visualStyleForIdiom:](_UINavigationBarVisualStyle, "visualStyleForIdiom:", v6);
      v10 = (_UINavigationBarVisualStyle *)objc_claimAutoreleasedReturnValue();
      v11 = self->_visualStyle;
      self->_visualStyle = v10;

      visualStyle = self->_visualStyle;
    }
    return visualStyle;
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v12, OS_LOG_TYPE_FAULT, "Requesting visual style in an implementation that has disabled it, returning nil. Behavior of caller is undefined.", buf, 2u);
      }

    }
    else
    {
      v7 = _currentVisualStyle___s_category;
      if (!_currentVisualStyle___s_category)
      {
        v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&_currentVisualStyle___s_category);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Requesting visual style in an implementation that has disabled it, returning nil. Behavior of caller is undefined.", v13, 2u);
      }
    }
    return 0;
  }
}

- (double)defaultBackButtonAlignmentHeight
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  -[UINavigationBar _currentVisualStyle](self, "_currentVisualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buttonHeight");
  v5 = v4;
  -[UINavigationBar currentBackButton](self, "currentBackButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UINavigationBar isMinibar](self, "isMinibar");
  if ((objc_msgSend(v6, "_wantsAccessibilityButtonShapes") & 1) != 0)
    _UINavigationButtonAccessibilityBackground(1, v7);
  else
    objc_msgSend(v6, "_backButtonBackgroundImageForState:barMetrics:", 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "alignmentRectInsets");
    v11 = v10;
    v13 = v12;
    objc_msgSend(v9, "size");
    v5 = v14 - (v11 + v13);
  }

  return v5;
}

- (double)defaultHeightForMetrics:(int64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  -[UINavigationBar _currentVisualStyle](self, "_currentVisualStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "barHeightForMetrics:", a3);
    v7 = v6;
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "defaultHeightForMetrics: should be avoided as it does not handle many cases for layout of modern bars. If you think you need this, please discuss with UIKit.", buf, 2u);
      }

    }
    else
    {
      v9 = qword_1ECD7B610;
      if (!qword_1ECD7B610)
      {
        v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v9, (unint64_t *)&qword_1ECD7B610);
      }
      v10 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "defaultHeightForMetrics: should be avoided as it does not handle many cases for layout of modern bars. If you think you need this, please discuss with UIKit.", v12, 2u);
      }
    }
    if (qword_1ECD7B618 != -1)
      dispatch_once(&qword_1ECD7B618, &__block_literal_global_230);
    if (byte_1ECD7B5FC)
    {
      if (a3)
      {
        v7 = 32.0;
      }
      else if (_UIBarsUseNewPadHeights())
      {
        v7 = 50.0;
      }
      else
      {
        v7 = 44.0;
      }
    }
    else
    {
      v7 = 0.0;
    }
  }

  return v7;
}

void __43__UINavigationBar_defaultHeightForMetrics___block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (id)objc_claimAutoreleasedReturnValue();

  byte_1ECD7B5FC = objc_msgSend(&unk_1E1A92B88, "containsObject:", v1);
}

- (double)defaultHeight
{
  return 50.0;
}

- (CGSize)defaultSizeForOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  -[UINavigationBar _currentVisualStyle](self, "_currentVisualStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_UINavigationBarVisualProvider _shim_promptText](self->_visualProvider, "_shim_promptText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "navigationBar:metricsForOrientation:hasPrompt:", self, a3, v6 != 0);

    -[UIView _screen](self, "_screen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_mainSceneBoundsForInterfaceOrientation:", a3);
    v10 = v9;
    objc_msgSend(v5, "barHeightForMetrics:", v7);
    v12 = v11;

  }
  else
  {
    -[UINavigationBar sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v10 = v13;
    v12 = v14;
  }

  v15 = v10;
  v16 = v12;
  result.height = v16;
  result.width = v15;
  return result;
}

+ (CGSize)defaultSizeForOrientation:(int64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  objc_msgSend(a1, "_defaultVisualStyleForOrientation:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_mainSceneBoundsForInterfaceOrientation:", a3);
  v7 = v6;
  objc_msgSend(v4, "barHeight");
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (CGSize)defaultSizeWithPromptForOrientation:(int64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  objc_msgSend(a1, "_defaultVisualStyleForOrientation:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_mainSceneBoundsForInterfaceOrientation:", a3);
  v7 = v6;
  objc_msgSend(v4, "barPromptHeight");
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (CGSize)defaultSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(a1, "defaultSizeForOrientation:", 1);
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)defaultSizeWithPrompt
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(a1, "defaultSizeWithPromptForOrientation:", 1);
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)defaultPromptFont
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_defaultVisualStyleForOrientation:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "promptFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (double)defaultAnimationDuration
{
  return 0.35;
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UINavigationBar;
  v4 = a3;
  -[UIView _populateArchivedSubviews:](&v5, sel__populateArchivedSubviews_, v4);
  -[_UINavigationBarVisualProvider updateArchivedSubviews:](self->_visualProvider, "updateArchivedSubviews:", v4, v5.receiver, v5.super_class);

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t barStyle;
  void *v6;
  NSDictionary *largeTitleTextAttributes;
  UIColor *barTintColor;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  int64_t barPosition;
  int64_t barTranslucence;
  void *v16;
  void *v17;
  UINavigationBarAppearance *standardAppearance;
  UINavigationBarAppearance *compactAppearance;
  UINavigationBarAppearance *scrollEdgeAppearance;
  UINavigationBarAppearance *compactScrollEdgeAppearance;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)UINavigationBar;
  -[UIView encodeWithCoder:](&v22, sel_encodeWithCoder_, v4);
  barStyle = self->_barStyle;
  if (barStyle)
    objc_msgSend(v4, "encodeInteger:forKey:", barStyle, CFSTR("UIBarStyle"));
  if (dyld_program_sdk_at_least())
  {
    if (self->_prefersLargeTitles)
      objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIBarPrefersLargeTitles"));
    -[_UIBarAppearanceStorage allBackgroundImages](self->_appearanceStorage, "allBackgroundImages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("UIBarBackgroundImages"));
    largeTitleTextAttributes = self->_largeTitleTextAttributes;
    if (largeTitleTextAttributes)
      objc_msgSend(v4, "encodeObject:forKey:", largeTitleTextAttributes, CFSTR("UIBarLargeTitleTextAttributes"));

  }
  if ((*(_WORD *)&self->_navbarFlags & 2) != 0)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIIsLocked"));
  barTintColor = self->_barTintColor;
  if (barTintColor)
    objc_msgSend(v4, "encodeObject:forKey:", barTintColor, CFSTR("UIBarTintColor"));
  -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_UINavigationBarItemStack items](self->_stack, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("UIItems"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
    objc_msgSend(v4, "encodeConditionalObject:forKey:", WeakRetained, CFSTR("UIDelegate"));
  -[UINavigationBar shadowImage](self, "shadowImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("UIShadowImage"));
  -[UINavigationBar titleTextAttributes](self, "titleTextAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("UITitleTextAttributes"));
  barPosition = self->_barPosition;
  if (barPosition)
    objc_msgSend(v4, "encodeInteger:forKey:", barPosition, CFSTR("UIBarPosition"));
  barTranslucence = self->_barTranslucence;
  if (barTranslucence)
    objc_msgSend(v4, "encodeInteger:forKey:", barTranslucence, CFSTR("UIBarTranslucence"));
  -[UINavigationBar backIndicatorImage](self, "backIndicatorImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("UIBackIndicatorImage"));
  -[UINavigationBar backIndicatorTransitionMaskImage](self, "backIndicatorTransitionMaskImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("UIBackIndicatorTransitionMask"));
  if (-[_UINavigationBarVisualProvider appearanceAPIVersion](self->_visualProvider, "appearanceAPIVersion") >= 2)
  {
    standardAppearance = self->_standardAppearance;
    if (standardAppearance)
      objc_msgSend(v4, "encodeObject:forKey:", standardAppearance, CFSTR("UINavigationBarStandardAppearance"));
    compactAppearance = self->_compactAppearance;
    if (compactAppearance)
      objc_msgSend(v4, "encodeObject:forKey:", compactAppearance, CFSTR("UINavigationBarCompactAppearance"));
    scrollEdgeAppearance = self->_scrollEdgeAppearance;
    if (scrollEdgeAppearance)
      objc_msgSend(v4, "encodeObject:forKey:", scrollEdgeAppearance, CFSTR("UINavigationBarScrollEdgeAppearance"));
    compactScrollEdgeAppearance = self->_compactScrollEdgeAppearance;
    if (compactScrollEdgeAppearance)
      objc_msgSend(v4, "encodeObject:forKey:", compactScrollEdgeAppearance, CFSTR("UINavigationBarCompactScrollEdgeAppearance"));
  }

}

- (id)_defaultTitleFontFittingHeight:(double)a3 withScaleAdjustment:(double)a4
{
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  int v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t v21;

  if (a4 == 0.0)
    v6 = 1.0;
  else
    v6 = a4;
  -[_UINavigationBarAppearanceStorage textAttributes](self->_appearanceStorage, "textAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *(_QWORD *)off_1E1678D90);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[UINavigationBar _currentVisualStyle](self, "_currentVisualStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[UIView traitCollection](self, "traitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UINavigationBarTitleFontProvider providerForIdiom:](_UINavigationBarTitleFontProvider, "providerForIdiom:", objc_msgSend(v18, "userInterfaceIdiom"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "defaultInlineTitleFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 >= 1.0)
      goto LABEL_16;
    goto LABEL_15;
  }
  objc_msgSend(v8, "pointSize");
  if (v10 == 0.0)
  {
    objc_msgSend(v9, "headingFontSize");
    v12 = v11;
    objc_msgSend(v8, "fontWithSize:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 <= 0.0)
      goto LABEL_13;
    -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "_hasDefaultTitleView");

    if (v15 && (objc_msgSend(v13, "lineHeight"), v16 + 2.0 > a3))
    {
      do
      {
        objc_msgSend(v13, "fontWithSize:", v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = v12 + -1.0;
        objc_msgSend(v8, "lineHeight");
        v13 = v8;
      }
      while (v17 + 2.0 > a3);
    }
    else
    {
LABEL_13:
      v8 = v13;
    }
    if (v6 < 1.0)
    {
LABEL_15:
      objc_msgSend(v8, "pointSize");
      objc_msgSend(v8, "fontWithSize:", v6 * v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v21;
    }
  }
LABEL_16:

  return v8;
}

- (id)_defaultTitleFont
{
  return -[UINavigationBar _defaultTitleFontWithScaleAdjustment:](self, "_defaultTitleFontWithScaleAdjustment:", 0.0);
}

- (id)_defaultTitleFontWithScaleAdjustment:(double)a3
{
  double v5;

  -[UIView bounds](self, "bounds");
  return -[UINavigationBar _defaultTitleFontFittingHeight:withScaleAdjustment:](self, "_defaultTitleFontFittingHeight:withScaleAdjustment:", v5, a3);
}

- (UINavigationBarNSToolbarSection)currentNSToolbarSection
{
  return 0;
}

- (UIBehavioralStyle)behavioralStyle
{
  return 1;
}

- (UIBehavioralStyle)preferredBehavioralStyle
{
  return 0;
}

- (void)_customViewChangedForButtonItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;

  v25 = a3;
  -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftBarButtonItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "indexOfObject:", v25);
  else
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v4, "rightBarButtonItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_19;
LABEL_11:
    v18 = indexOfViewForIndexOfItem(v8, v7);
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v19 = v18;
      if (v5)
      {
        v14 = v4;
        v15 = v19;
        v16 = v5;
        v17 = 1;
        goto LABEL_14;
      }
      objc_msgSend(v25, "createViewForNavigationItem:", v4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v4;
      v22 = v19;
      v23 = v20;
      v24 = 1;
LABEL_17:
      objc_msgSend(v21, "_replaceCustomLeftRightViewAtIndex:withView:left:", v22, v23, v24);

    }
LABEL_18:
    objc_msgSend(v4, "updateNavigationBarButtonsAnimated:", 0);
    goto LABEL_19;
  }
  v11 = objc_msgSend(v9, "indexOfObject:", v25);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_11;
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = indexOfViewForIndexOfItem(v11, v10);
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = v12;
      if (v5)
      {
        v14 = v4;
        v15 = v13;
        v16 = v5;
        v17 = 0;
LABEL_14:
        objc_msgSend(v14, "_replaceCustomLeftRightViewAtIndex:withView:left:", v15, v16, v17);
        goto LABEL_18;
      }
      objc_msgSend(v25, "createViewForNavigationItem:", v4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v4;
      v22 = v13;
      v23 = v20;
      v24 = 0;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
LABEL_19:

}

- (NSArray)_animationIds
{
  void *v2;
  void *v3;

  -[_UINavigationBarItemStack transitionAssistant](self->_stack, "transitionAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)_beginInteractiveTransition
{
  -[_UINavigationBarItemStack beginInteractiveTransition](self->_stack, "beginInteractiveTransition");
}

- (void)_updateInteractiveTransition:(double)a3
{
  id v4;

  -[_UINavigationBarItemStack transitionAssistant](self->_stack, "transitionAssistant");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateInteractiveTransitionPercent:", fmax(a3, 0.0));

}

- (void)_finishInteractiveTransition:(double)a3 completionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  void *v9;

  -[_UINavigationBarItemStack transitionAssistant](self->_stack, "transitionAssistant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "finishInteractiveTransitionPercent:completionSpeed:completionCurve:", a5, a3, a4);

  -[_UINavigationBarItemStack endInteractiveTransition](self->_stack, "endInteractiveTransition");
}

- (void)_cancelInteractiveTransition:(double)a3 completionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  void *v9;
  void *v10;

  -[_UINavigationBarItemStack transitionAssistant](self->_stack, "transitionAssistant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cancelInteractiveTransitionPercent:completionSpeed:completionCurve:", a5, a3, a4);

  -[_UINavigationBarItemStack endInteractiveTransition](self->_stack, "endInteractiveTransition");
  -[_UINavigationBarItemStack previousTopItem](self->_stack, "previousTopItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v10, "_backgroundHidden");

  if ((_DWORD)v9)
    -[_UINavigationBarVisualProvider _shim_setShadowAlpha:](self->_visualProvider, "_shim_setShadowAlpha:", 0.0);
}

- (double)_heightForRestoringFromCancelledTransition
{
  double result;

  -[_UINavigationBarVisualProvider heightForRestoringFromCancelledTransition](self->_visualProvider, "heightForRestoringFromCancelledTransition");
  return result;
}

- (void)pushNavigationItem:(id)a3
{
  -[UINavigationBar _pushNavigationItem:transitionAssistant:](self, "_pushNavigationItem:transitionAssistant:", a3, 0);
}

- (UINavigationItem)popNavigationItemAnimated:(BOOL)animated
{
  _BOOL4 v3;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = animated;
  if (-[UINavigationBar isLocked](self, "isLocked"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Cannot call %@ directly on a UINavigationBar managed by a controller."), v8);

    v9 = 0;
  }
  else
  {
    if (v3)
    {
      if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0)
        v10 = 1;
      else
        v10 = 2;
    }
    else
    {
      v10 = 0;
    }
    -[UINavigationBar _popNavigationItemWithTransition:](self, "_popNavigationItemWithTransition:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UINavigationItem *)v9;
}

- (void)_popNestedNavigationItem
{
  UINavigationBar *v3;
  id v4;

  -[_UINavigationBarItemStack _shim_popNestedNavigationItem](self->_stack, "_shim_popNestedNavigationItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_navigationBar");
  v3 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
    objc_msgSend(v4, "_setNavigationBar:", 0);

}

- (void)_pushNestedNavigationItem:(id)a3
{
  -[_UINavigationBarItemStack _shim_pushNestedNavigationItem:](self->_stack, "_shim_pushNestedNavigationItem:", a3);
}

- (id)_popNavigationItemWithTransition:(int)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[UINavigationBar _effectiveDelegate](self, "_effectiveDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) == 0
    || objc_msgSend(v5, "navigationBar:shouldPopItem:", self, v6))
  {
    if (a3)
    {
      -[UINavigationBar _effectiveDelegate](self, "_effectiveDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UINavigationBarTransitionAssistant popTransitionAssistantForNavigationBar:delegate:crossfade:](_UINavigationBarTransitionAssistant, "popTransitionAssistantForNavigationBar:delegate:crossfade:", self, v7, a3 == 6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[UINavigationBar _disableAnimation](self, "_disableAnimation");
      v8 = 0;
    }
    -[UINavigationBar _popNavigationItemWithTransitionAssistant:](self, "_popNavigationItemWithTransitionAssistant:", v8);
    if (!-[UINavigationBar _isAlwaysHidden](self, "_isAlwaysHidden"))
    {
      -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_updateViewsForBarSizeChangeAndApply:", 0);
      -[_UINavigationBarVisualProvider updateTopNavigationItemAnimated:](self->_visualProvider, "updateTopNavigationItemAnimated:", -[UINavigationBar _isAnimationEnabled](self, "_isAnimationEnabled"));
      -[UINavigationBar updatePrompt](self, "updatePrompt");

    }
    if (!a3)
      -[UINavigationBar _enableAnimation](self, "_enableAnimation");

  }
  return v6;
}

- (void)popNavigationItem
{
  -[UINavigationBar _popNavigationItemWithTransitionAssistant:](self, "_popNavigationItemWithTransitionAssistant:", 0);
}

- (void)_completePopOperationAnimated:(BOOL)a3 transitionAssistant:(id)a4
{
  _BOOL4 v4;
  void *v6;
  int v7;
  int v8;
  void *v9;
  UINavigationBar *v10;
  UINavigationBar *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  UINavigationBar *v16;
  id v17;

  v4 = a3;
  v17 = a4;
  -[UINavigationBar _effectiveDelegate](self, "_effectiveDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();
  v8 = v7;
  if (!v4)
    goto LABEL_6;
  if ((v7 & 1) == 0)
    -[UINavigationBar _reenableUserInteraction](self, "_reenableUserInteraction");
  if (objc_msgSend(v17, "cancelledTransition"))
  {
    -[UINavigationBar _cancelInteractiveTransition](self, "_cancelInteractiveTransition");
  }
  else
  {
LABEL_6:
    -[_UINavigationBarItemStack previousTopItem](self->_stack, "previousTopItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)objc_opt_class(), "_forceLegacyVisualProvider"))
      objc_msgSend(v9, "_removeTitleAndButtonViews");
    objc_msgSend(v9, "_navigationBar");
    v10 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 == self
      || v10
      && (-[UINavigationBar items](v10, "items"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "containsObject:", v9),
          v12,
          (v13 & 1) == 0))
    {
      objc_msgSend(v9, "_setNavigationBar:", 0);
    }
    objc_msgSend(v9, "_searchControllerIfAllowed");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "searchBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "superview");
    v16 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();

    if (v16 == self)
      objc_msgSend(v15, "removeFromSuperview");
    -[_UINavigationBarItemStack completeOperation](self->_stack, "completeOperation");
    -[UINavigationBar _accessibility_navigationBarContentsDidChange](self, "_accessibility_navigationBarContentsDidChange");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "navigationBar:didPopItem:", self, v9);

  }
  if ((v4 & v8) == 1)
    objc_msgSend(v6, "_navigationBarDidEndAnimation:", self);

}

- (void)_popNavigationItemWithTransitionAssistant:(id)a3
{
  void *v4;
  _BOOL4 v5;
  _BOOL8 v6;
  _UINavigationBarVisualProvider *visualProvider;
  _UINavigationBarVisualProvider *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  -[_UINavigationBarItemStack popItemWithTransitionAssistant:](self->_stack, "popItemWithTransitionAssistant:", a3);
  -[_UINavigationBarItemStack previousTopItem](self->_stack, "previousTopItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarVisualProvider prepareForPop](self->_visualProvider, "prepareForPop");
  v5 = -[UINavigationBar _isAnimationEnabled](self, "_isAnimationEnabled");
  if (v4)
    v6 = v5;
  else
    v6 = 0;
  if (v6)
  {
    visualProvider = self->_visualProvider;
    if (visualProvider)
    {
      if (!-[_UINavigationBarVisualProvider allowsUserInteractionDuringTransitions](visualProvider, "allowsUserInteractionDuringTransitions"))-[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
    }
  }
  v8 = self->_visualProvider;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__UINavigationBar__popNavigationItemWithTransitionAssistant___block_invoke;
  v12[3] = &unk_1E16B5C78;
  v12[4] = self;
  -[_UINavigationBarVisualProvider popAnimated:completion:](v8, "popAnimated:completion:", v6, v12);
  -[UINavigationBar _effectiveDelegate](self, "_effectiveDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "_navigationBarDidUpdateStack:", self);
  -[_UINavigationBarItemStack transitionAssistant](self->_stack, "transitionAssistant");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "finishTrackingInteractiveTransition");

  -[_UINavigationBarItemStack transitionAssistant](self->_stack, "transitionAssistant");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShouldHideBackButtonDuringTransition:", 0);

}

uint64_t __61__UINavigationBar__popNavigationItemWithTransitionAssistant___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completePopOperationAnimated:transitionAssistant:", a2, a3);
}

- (int)_transitionForOldItems:(id)a3 newItems:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;

  v5 = a3;
  objc_msgSend(a4, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    v8 = 0;
  }
  else if (objc_msgSend(v5, "containsObject:", v6))
  {
    v8 = 2;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)_setItems:(id)a3 transition:(int)a4 reset:(BOOL)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  _UINavigationBarVisualProvider *visualProvider;
  int v28;
  _UINavigationBarVisualProvider *v29;
  _UINavigationBarVisualProvider *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t m;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int64_t v55;
  int64_t v56;
  char v57;
  void *v58;
  void *v59;
  BOOL v60;
  void *v61;
  BOOL v62;
  _QWORD v63[5];
  _QWORD v64[5];
  _QWORD v65[4];
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (a5)
  {
    -[_UINavigationBarItemStack items](self->_stack, "items");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    v12 = 1;
    goto LABEL_10;
  }
  if (v8)
    v10 = v8;
  else
    v10 = (id)MEMORY[0x1E0C9AA60];
  if (!-[_UINavigationBarItemStack stackItemsAreEqualTo:](self->_stack, "stackItemsAreEqualTo:", v10))
  {
    -[_UINavigationBarItemStack items](self->_stack, "items");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[UINavigationBar _didVisibleItemsChangeWithNewItems:oldItems:](self, "_didVisibleItemsChangeWithNewItems:oldItems:", v10, v11)|| (a4 - 3) < 0xFFFFFFFE;
LABEL_10:
    v62 = v12;
    if (a4 != 2)
    {
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v13 = v11;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v81;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v81 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * i), "_setNavigationBar:", 0);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
        }
        while (v15);
      }

    }
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v10 = v10;
    v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v77;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v77 != v20)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * j), "_setNavigationBar:", self);
        }
        v19 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
      }
      while (v19);
    }

    -[UINavigationBar _effectiveDelegate](self, "_effectiveDelegate");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    if (a4 == 1)
    {
      +[_UINavigationBarTransitionAssistant pushTransitionAssistantForNavigationBar:delegate:crossfade:](_UINavigationBarTransitionAssistant, "pushTransitionAssistantForNavigationBar:delegate:crossfade:", self, v22, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarItemStack setItems:withTransitionAssistant:](self->_stack, "setItems:withTransitionAssistant:", v10, v24);
      -[_UINavigationBarVisualProvider prepareForPush](self->_visualProvider, "prepareForPush");
      -[_UINavigationBarItemStack previousBackItem](self->_stack, "previousBackItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_setNavigationBar:", self);

      goto LABEL_30;
    }
    if (a4 == 2)
    {
      +[_UINavigationBarTransitionAssistant popTransitionAssistantForNavigationBar:delegate:crossfade:](_UINavigationBarTransitionAssistant, "popTransitionAssistantForNavigationBar:delegate:crossfade:", self, v22, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarItemStack setItems:withTransitionAssistant:](self->_stack, "setItems:withTransitionAssistant:", v10, v24);
      -[_UINavigationBarVisualProvider prepareForPop](self->_visualProvider, "prepareForPop");
LABEL_30:

      -[UINavigationBar _barStyle](self, "_barStyle");
      v26 = -[UINavigationBar _isAnimationEnabled](self, "_isAnimationEnabled");
      if (v26 && (visualProvider = self->_visualProvider) != 0)
        v28 = !-[_UINavigationBarVisualProvider allowsUserInteractionDuringTransitions](visualProvider, "allowsUserInteractionDuringTransitions");
      else
        v28 = 0;
      if (a4 == 1)
      {
        if (v28)
          -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v23, "_navigationBarDidUpdateStack:", self);
        v29 = self->_visualProvider;
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __46__UINavigationBar__setItems_transition_reset___block_invoke_2;
        v64[3] = &unk_1E16B5C78;
        v64[4] = self;
        -[_UINavigationBarVisualProvider pushAnimated:completion:](v29, "pushAnimated:completion:", v26, v64);
      }
      else
      {
        if (v28)
          -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
        v30 = self->_visualProvider;
        v63[0] = MEMORY[0x1E0C809B0];
        v63[1] = 3221225472;
        v63[2] = __46__UINavigationBar__setItems_transition_reset___block_invoke_3;
        v63[3] = &unk_1E16B5C78;
        v63[4] = self;
        -[_UINavigationBarVisualProvider popAnimated:completion:](v30, "popAnimated:completion:", v26, v63);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v23, "_navigationBarDidUpdateStack:", self);
      }
      -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "_updateViewsForBarSizeChangeAndApply:", 0);
      -[_UINavigationBarVisualProvider updateTopNavigationItemAnimated:](self->_visualProvider, "updateTopNavigationItemAnimated:", v26);

LABEL_45:
      -[_UINavigationBarItemStack transitionAssistant](self->_stack, "transitionAssistant");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "finishTrackingInteractiveTransition");

      goto LABEL_46;
    }
    v61 = (void *)v22;
    -[_UINavigationBarItemStack setItems:withTransitionAssistant:](self->_stack, "setItems:withTransitionAssistant:", v10, 0);
    -[_UINavigationBarVisualProvider prepareForStackChange](self->_visualProvider, "prepareForStackChange");
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v33 = v11;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v73;
      do
      {
        for (k = 0; k != v35; ++k)
        {
          if (*(_QWORD *)v73 != v36)
            objc_enumerationMutation(v33);
          -[_UINavigationBarVisualProvider removeContentForItem:](self->_visualProvider, "removeContentForItem:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * k));
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
      }
      while (v35);
    }
    v60 = a5;

    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v38 = v10;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v69;
      do
      {
        for (m = 0; m != v40; ++m)
        {
          if (*(_QWORD *)v69 != v41)
            objc_enumerationMutation(v38);
          -[_UINavigationBarVisualProvider removeContentForItem:](self->_visualProvider, "removeContentForItem:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * m));
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
      }
      while (v40);
    }

    objc_msgSend(v33, "lastObject");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "_searchControllerIfAllowed");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "_searchControllerIfAllowed");
    v46 = objc_claimAutoreleasedReturnValue();
    if (v44 == (void *)v46)
    {
      v47 = v44;
    }
    else
    {
      v47 = (void *)v46;
      v59 = v11;
      -[_UINavigationBarItemStack backItem](self->_stack, "backItem");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "_searchControllerIfAllowed");
      v49 = objc_claimAutoreleasedReturnValue();
      if (v44 == (void *)v49)
      {

        v11 = v59;
      }
      else
      {
        v50 = (void *)v49;
        -[_UINavigationBarItemStack items](self->_stack, "items");
        v58 = v44;
        v51 = v43;
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v52, "containsObject:", v51);

        v43 = v51;
        v44 = v58;

        v11 = v59;
        if ((v57 & 1) != 0)
          goto LABEL_73;
        if (objc_msgSend(v58, "isActive"))
        {
          -[UIView _viewControllerForAncestor](self, "_viewControllerForAncestor");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "_splitViewControllerEnforcingClass:", 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v54 || (objc_msgSend(v54, "_isExpanding") & 1) == 0)
          {
            v65[0] = MEMORY[0x1E0C809B0];
            v65[1] = 3221225472;
            v65[2] = __46__UINavigationBar__setItems_transition_reset___block_invoke;
            v65[3] = &unk_1E16B1B50;
            v66 = v58;
            v67 = v43;
            +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v65);

          }
        }
        objc_msgSend(v58, "searchBar");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "_viewStackedInNavigationBar");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "removeFromSuperview");
      }
    }

LABEL_73:
    v55 = -[UINavigationBar _barStyle](self, "_barStyle");
    if (v62)
    {
      v56 = v55;
      -[UINavigationBar _disableAnimation](self, "_disableAnimation");
      -[UINavigationBar _setBarStyle:](self, "_setBarStyle:", v56);
      -[_UINavigationBarVisualProvider setupTopNavigationItem](self->_visualProvider, "setupTopNavigationItem");
      -[UINavigationBar setNeedsLayout](self, "setNeedsLayout");
      -[UINavigationBar _enableAnimation](self, "_enableAnimation");
      -[_UINavigationBarItemStack completeOperation](self->_stack, "completeOperation");
      -[UINavigationBar _accessibility_navigationBarContentsDidChange](self, "_accessibility_navigationBarContentsDidChange");
      v23 = v61;
      if (!v60 && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v61, "_navigationBarDidUpdateStack:", self);
    }
    else
    {
      v23 = v61;
    }
    goto LABEL_45;
  }
LABEL_46:

}

void __46__UINavigationBar__setItems_transition_reset___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setActive:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_stackEntry");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSearchActive:", 0);

}

uint64_t __46__UINavigationBar__setItems_transition_reset___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completePushOperationAnimated:transitionAssistant:", a2, a3);
}

uint64_t __46__UINavigationBar__setItems_transition_reset___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completePopOperationAnimated:transitionAssistant:", a2, a3);
}

- (void)_addItems:(id)a3 withEffectiveDelegate:(id)a4 transition:(int)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[UINavigationBar _addItem:withEffectiveDelegate:transition:](self, "_addItem:withEffectiveDelegate:transition:", (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (int64_t)_effectiveMetricsForMetrics:(int64_t)a3
{
  _BOOL4 v4;
  int64_t v5;

  v4 = -[UINavigationBar forceFullHeightInLandscape](self, "forceFullHeightInLandscape");
  v5 = 101;
  if (a3 != 102)
    v5 = a3;
  if (a3 == 1)
    v5 = 0;
  if (v4)
    return v5;
  else
    return a3;
}

- (int64_t)effectiveInterfaceOrientation
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  id WeakRetained;

  if (!-[UINavigationBar forceFullHeightInLandscape](self, "forceFullHeightInLandscape"))
  {
    -[UIView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
LABEL_4:
      v5 = objc_msgSend(v4, "_windowInterfaceOrientation");
      if (!v5)
        v5 = objc_msgSend((id)UIApp, "_sceneInterfaceOrientationFromWindow:", v4);
      v3 = v5;
      goto LABEL_11;
    }
    if ((*(_WORD *)&self->_navbarFlags & 0x20) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "_navigationBarWindowForInterfaceOrientation:", self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
        goto LABEL_4;
    }
    else
    {
      v4 = 0;
    }
    v3 = 1;
LABEL_11:

    return v3;
  }
  return 1;
}

- (void)setRequestedContentSize:(int64_t)a3
{
  int v6;
  void *v7;

  v6 = _UINavigationBarShouldCheckLegacyViolation(self);
  if (a3 && v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINavigationBar.m"), 2525, CFSTR("Explicit content size not supported when forcing the legacy provider. Remove your +_forceLegacyVisualProvider override."));

  }
  if (self->_requestedContentSize != a3)
  {
    self->_requestedContentSize = a3;
    -[_UINavigationBarVisualProvider changeLayout](self->_visualProvider, "changeLayout");
  }
}

- (int64_t)currentContentSize
{
  return -[_UINavigationBarVisualProvider currentContentSize](self->_visualProvider, "currentContentSize");
}

- (id)_restingHeights
{
  return -[_UINavigationBarVisualProvider restingHeights](self->_visualProvider, "restingHeights");
}

- (BOOL)_heightDependentOnOrientation
{
  char v2;
  void *v3;
  void *v4;

  if (self->_requestedContentSize)
    return 0;
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v2 = _UIUseMiniHeightInLandscape(1u);
  else
    v2 = 0;

  return v2;
}

- (NSDirectionalEdgeInsets)_resolvedLargeTitleMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  -[_UINavigationBarVisualProvider resolvedLargeTitleMargins](self->_visualProvider, "resolvedLargeTitleMargins");
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[_UINavigationBarVisualProvider intrinsicContentSize](self->_visualProvider, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_cancelInteractiveTransition
{
  void *v3;
  int v4;
  void *v5;
  UINavigationBar *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[_UINavigationBarItemStack transitionAssistant](self->_stack, "transitionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cancelledTransition");

  if (v4)
  {
    if (-[_UINavigationBarItemStack state](self->_stack, "state") == 1)
    {
      -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_navigationBar");
      v6 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();

      if (v6 == self)
      {
        objc_msgSend(v5, "_removeTitleAndButtonViews");
        objc_msgSend(v5, "_removeBarButtonItemViews");
        objc_msgSend(v5, "_setNavigationBar:", 0);
      }

    }
    -[_UINavigationBarItemStack cancelOperation](self->_stack, "cancelOperation");
    -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarItemStack backItem](self->_stack, "backItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_navigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v7, "backButtonView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setAbbreviatedTitleIndex:", 0x7FFFFFFFFFFFFFFFLL);

    }
    objc_msgSend(v10, "updateNavigationBarButtonsAnimated:", 0);

  }
}

- (id)navigationItemAtPoint:(CGPoint)a3
{
  return 0;
}

- (void)_reenableUserInteraction
{
  _UIViewControllerTransitionContext *navControllerAnimatingContext;

  -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
  -[_UIViewControllerTransitionContext _enableInteractionForDisabledViews](self->_navControllerAnimatingContext, "_enableInteractionForDisabledViews");
  navControllerAnimatingContext = self->_navControllerAnimatingContext;
  self->_navControllerAnimatingContext = 0;

}

- (void)_reenableUserInteractionWhenReadyWithContext:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_navControllerAnimatingContext, a3);
  if (!-[_UINavigationBarItemStack state](self->_stack, "state"))
    -[UINavigationBar _reenableUserInteraction](self, "_reenableUserInteraction");

}

- (BOOL)_canHandleStatusBarTouchAtLocation:(CGPoint)a3
{
  return -[_UINavigationBarVisualProvider canHandleStatusBarTouchAtPoint:](self->_visualProvider, "canHandleStatusBarTouchAtPoint:", a3.x, a3.y);
}

- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  double y;
  double x;
  _UINavigationBarVisualProvider *visualProvider;
  void *v7;
  void *v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  visualProvider = self->_visualProvider;
  v10.receiver = self;
  v10.super_class = (Class)UINavigationBar;
  -[UIView hitTest:forEvent:](&v10, sel_hitTest_forEvent_, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarVisualProvider hitTest:defaultViewHit:](visualProvider, "hitTest:defaultViewHit:", v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  _UINavigationBarVisualProvider *visualProvider;
  void *v7;
  void *v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  visualProvider = self->_visualProvider;
  v10.receiver = self;
  v10.super_class = (Class)UINavigationBar;
  -[UIView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarVisualProvider hitTest:defaultViewHit:](visualProvider, "hitTest:defaultViewHit:", v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_evaluateBackIndicatorForHilightedState:(BOOL)a3 ofBarButtonItem:(id)a4 inNavigationItem:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v6 = a3;
  v11 = a4;
  v8 = a5;
  if (v11
    && v8
    && objc_msgSend(v11, "_showsBackButtonIndicator")
    && (objc_msgSend(v11, "isHidden") & 1) == 0)
  {
    -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 == v8)
    {
      if ((objc_msgSend(v8, "_leftItemsWantBackButton") & 1) != 0)
      {
        v10 = -[_UINavigationBarItemStack itemCount](self->_stack, "itemCount");

        if (v10 > 1)
          goto LABEL_12;
      }
      else
      {

      }
      -[UINavigationBar _setBackIndicatorPressed:initialPress:](self, "_setBackIndicatorPressed:initialPress:", v6, 0);
    }
    else
    {

    }
  }
LABEL_12:

}

- (void)_setBackIndicatorPressed:(BOOL)a3 initialPress:(BOOL)a4
{
  -[_UINavigationBarVisualProvider _shim_pressBackIndicator:initialPress:](self->_visualProvider, "_shim_pressBackIndicator:initialPress:", a3, a4);
}

- (BOOL)_allowInteractionDuringTransition
{
  id WeakRetained;
  void *v4;
  int v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(WeakRetained, "enableBackButtonDuringTransition"))
  {
    -[_UINavigationBarItemStack transitionAssistant](self->_stack, "transitionAssistant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "interactive") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_canPreemptTransition
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(WeakRetained, "_isCurrentTransitionPreemptable");
  else
    v3 = 0;

  return v3;
}

- (BOOL)_shouldCrossFadeBackgroundVisility
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(WeakRetained, "_shouldCrossFadeNavigationBarBackgroundVisibility");
  else
    v3 = 0;

  return v3;
}

- (void)popForCarplayPressAtFakePoint:(CGPoint)a3
{
  -[_UINavigationBarVisualProvider _shim_popForCarplayPressAtFakePoint:](self->_visualProvider, "_shim_popForCarplayPressAtFakePoint:", a3.x, a3.y);
}

- (id)animationFactory
{
  _UINavigationBarVisualProvider *visualProvider;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    visualProvider = self->_visualProvider;
  else
    visualProvider = 0;
  return visualProvider;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  _UINavigationBarVisualProvider *visualProvider;
  id v7;
  id v8;
  objc_super v9;

  visualProvider = self->_visualProvider;
  v7 = a4;
  v8 = a3;
  if (-[_UINavigationBarVisualProvider _shim_wantsCustomTouchHandlingForTouches:](visualProvider, "_shim_wantsCustomTouchHandlingForTouches:", v8))
  {
    -[_UINavigationBarVisualProvider _shim_touchesBegan:withEvent:](self->_visualProvider, "_shim_touchesBegan:withEvent:", v8, v7);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UINavigationBar;
    -[UIResponder touchesBegan:withEvent:](&v9, sel_touchesBegan_withEvent_, v8, v7);
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  _UINavigationBarVisualProvider *visualProvider;
  id v7;
  id v8;
  objc_super v9;

  visualProvider = self->_visualProvider;
  v7 = a4;
  v8 = a3;
  if (-[_UINavigationBarVisualProvider _shim_wantsCustomTouchHandlingForTouches:](visualProvider, "_shim_wantsCustomTouchHandlingForTouches:", v8))
  {
    -[_UINavigationBarVisualProvider _shim_touchesMoved:withEvent:](self->_visualProvider, "_shim_touchesMoved:withEvent:", v8, v7);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UINavigationBar;
    -[UIResponder touchesMoved:withEvent:](&v9, sel_touchesMoved_withEvent_, v8, v7);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  _UINavigationBarVisualProvider *visualProvider;
  id v7;
  id v8;
  objc_super v9;

  visualProvider = self->_visualProvider;
  v7 = a4;
  v8 = a3;
  if (-[_UINavigationBarVisualProvider _shim_wantsCustomTouchHandlingForTouches:](visualProvider, "_shim_wantsCustomTouchHandlingForTouches:", v8))
  {
    -[_UINavigationBarVisualProvider _shim_touchesEnded:withEvent:](self->_visualProvider, "_shim_touchesEnded:withEvent:", v8, v7);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UINavigationBar;
    -[UIResponder touchesEnded:withEvent:](&v9, sel_touchesEnded_withEvent_, v8, v7);
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  _UINavigationBarVisualProvider *visualProvider;
  id v7;
  id v8;
  objc_super v9;

  visualProvider = self->_visualProvider;
  v7 = a4;
  v8 = a3;
  if (-[_UINavigationBarVisualProvider _shim_wantsCustomTouchHandlingForTouches:](visualProvider, "_shim_wantsCustomTouchHandlingForTouches:", v8))
  {
    -[_UINavigationBarVisualProvider _shim_touchesCancelled:withEvent:](self->_visualProvider, "_shim_touchesCancelled:withEvent:", v8, v7);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UINavigationBar;
    -[UIResponder touchesCancelled:withEvent:](&v9, sel_touchesCancelled_withEvent_, v8, v7);
  }

}

- (void)addConstraint:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (-[_UINavigationBarVisualProvider _shim_throwConstraintExceptions](self->_visualProvider, "_shim_throwConstraintExceptions"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Cannot modify constraints for UINavigationBar managed by a controller"));
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UINavigationBar;
    -[UIView addConstraint:](&v5, sel_addConstraint_, v4);
  }

}

- (void)removeConstraint:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (-[_UINavigationBarVisualProvider _shim_throwConstraintExceptions](self->_visualProvider, "_shim_throwConstraintExceptions"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Cannot modify constraints for UINavigationBar managed by a controller"));
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UINavigationBar;
    -[UIView removeConstraint:](&v5, sel_removeConstraint_, v4);
  }

}

void __71__UINavigationBar__updateNavigationBarItemsForStyle_previousTintColor___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "backButtonView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStyle:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setNeedsLayout");

}

- (int64_t)_statusBarStyle
{
  return -[_UINavigationBarVisualProvider statusBarStyle](self->_visualProvider, "statusBarStyle");
}

- (BOOL)forceFullHeightInLandscape
{
  return *(_WORD *)&self->_navbarFlags & 1;
}

- (id)buttonItemShadowColor
{
  return +[UIColor clearColor](UIColor, "clearColor");
}

- (id)_titleTextColor
{
  void *v3;
  void *v4;
  void *v5;

  -[UINavigationBar _currentVisualStyle](self, "_currentVisualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultTitleColorForUserInterfaceStyle:barStyle:", objc_msgSend(v4, "userInterfaceStyle"), self->_barStyle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setRightMargin:(double)a3
{
  NSLog(CFSTR("%s is deprecated and ignored."), a2, a3, "-[UINavigationBar setRightMargin:]");
}

- (BOOL)_titleAutoresizesToFit
{
  return 0;
}

- (void)_updateTitleViewIfTop:(id)a3
{
  _UINavigationBarItemStack *stack;
  id v5;
  id v6;

  stack = self->_stack;
  v5 = a3;
  -[_UINavigationBarItemStack topItem](stack, "topItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    -[_UINavigationBarVisualProvider updateTopNavigationItemTitleView](self->_visualProvider, "updateTopNavigationItemTitleView");
}

- (void)setTitleView:(id)a3
{
  NSLog(CFSTR("%s is deprecated and ignored."), a2, a3, "-[UINavigationBar setTitleView:]");
}

- (id)_currentLeftViews
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  void *v8;

  -[UINavigationBar topItem](self, "topItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_customLeftViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "mutableCopy");

  if (objc_msgSend(v5, "count"))
  {
    -[UINavigationBar topItem](self, "topItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "leftItemsSupplementBackButton"))
    {
LABEL_10:

      return v5;
    }
    v7 = -[UINavigationBar _hasBackButton](self, "_hasBackButton");

    if (!v7)
      return v5;
LABEL_6:
    if (!v5)
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[UINavigationBar backItem](self, "backItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backButtonView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      objc_msgSend(v5, "insertObject:atIndex:", v6, 0);
    goto LABEL_10;
  }
  if (-[UINavigationBar _hasBackButton](self, "_hasBackButton"))
    goto LABEL_6;
  return v5;
}

- (UIView)currentLeftView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[UINavigationBar currentBackButton](self, "currentBackButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationBar _currentLeftViews](self, "_currentLeftViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[UINavigationBar topItem](self, "topItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "leftItemsSupplementBackButton"))
    {
      v6 = v3;
    }
    else
    {
      objc_msgSend(v4, "objectAtIndex:", 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

  }
  else
  {
    v7 = v3;
  }

  return (UIView *)v7;
}

- (id)_currentRightViews
{
  void *v2;
  void *v3;

  -[UINavigationBar topItem](self, "topItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_customRightViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIView)currentRightView
{
  void *v2;
  void *v3;

  -[UINavigationBar _currentRightViews](self, "_currentRightViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (UIView *)v3;
}

- (id)_contentView
{
  return -[_UINavigationBarVisualProvider _shim_contentView](self->_visualProvider, "_shim_contentView");
}

- (void)_animateForSearchPresentation:(BOOL)a3
{
  -[_UINavigationBarVisualProvider animateForSearchPresentation:](self->_visualProvider, "animateForSearchPresentation:", a3);
}

- (void)_presentHostedSearchWithTransitionCoordinator:(id)a3
{
  -[_UINavigationBarVisualProvider presentHostedSearchWithTransitionCoordinator:](self->_visualProvider, "presentHostedSearchWithTransitionCoordinator:", a3);
}

- (void)_dismissHostedSearchWithTransitionCoordinator:(id)a3
{
  -[_UINavigationBarVisualProvider dismissHostedSearchWithTransitionCoordinator:](self->_visualProvider, "dismissHostedSearchWithTransitionCoordinator:", a3);
}

- (void)_refreshSearchSuggestionsMenuAfterGeometryChange
{
  -[_UINavigationBarVisualProvider refreshSearchSuggestionsMenuAfterGeometryChange](self->_visualProvider, "refreshSearchSuggestionsMenuAfterGeometryChange");
}

- (void)_deferSearchSuggestionsMenuRefreshForGeometryChange
{
  -[_UINavigationBarVisualProvider deferSearchSuggestionsMenuRefreshForGeometryChange](self->_visualProvider, "deferSearchSuggestionsMenuRefreshForGeometryChange");
}

- (void)_searchScopeBarWillManuallyShowOrHideForNavigationItem:(id)a3
{
  -[_UINavigationBarVisualProvider searchScopeBarWillManuallyShowOrHideForNavigationItem:](self->_visualProvider, "searchScopeBarWillManuallyShowOrHideForNavigationItem:", a3);
}

- (_UINavigationItemButtonView)currentBackButton
{
  void *v3;
  void *v4;
  void *v5;

  -[_UINavigationBarItemStack backItem](self->_stack, "backItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationBar _backButtonForBackItem:topItem:](self, "_backButtonForBackItem:topItem:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UINavigationItemButtonView *)v5;
}

- (id)_backButtonForBackItem:(id)a3 topItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6
    && (objc_msgSend(v7, "hidesBackButton") & 1) == 0
    && -[UINavigationBar _shouldShowBackButtonForNavigationItem:](self, "_shouldShowBackButtonForNavigationItem:", v6))
  {
    objc_msgSend(v6, "backButtonView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_delegateWantsNavigationBarHidden
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(WeakRetained, "isNavigationBarHidden");
  else
    v3 = 0;

  return v3;
}

- (void)_sendResizeForPromptChange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "navigationBarDidResizeForPrompt:", self);

}

- (void)_prepareToAnimateTransition
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "_navigationBarPrepareToAnimateTransition:", self);

}

- (void)_sendNavigationBarAnimateTransition
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "_navigationBarWillBeginCoordinatedTransitionAnimations:", self);

}

- (CGRect)_incomingNavigationBarFrame
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
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[UINavigationBar _accessibility_navigationController](self, "_accessibility_navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "_incomingNavigationBarFrame");
  else
    -[UIView frame](self, "frame");
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;

  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)prompt
{
  return -[_UINavigationBarVisualProvider _shim_promptText](self->_visualProvider, "_shim_promptText");
}

- (id)promptView
{
  return 0;
}

- (CGRect)promptBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isAnimationEnabled
{
  return 1;
}

- (int64_t)animationDisabledCount
{
  return 0;
}

- (void)drawBackgroundInRect:(CGRect)a3 withStyle:(int64_t)a4
{
  NSLog(CFSTR("%s is deprecated and ignored."), a2, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, "-[UINavigationBar drawBackgroundInRect:withStyle:]");
}

- (void)drawBackButtonBackgroundInRect:(CGRect)a3 withStyle:(int64_t)a4 pressed:(BOOL)a5
{
  NSLog(CFSTR("%s is deprecated and ignored."), a2, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, "-[UINavigationBar drawBackButtonBackgroundInRect:withStyle:pressed:]");
}

- (void)showButtonsWithLeftTitle:(id)a3 rightTitle:(id)a4
{
  NSLog(CFSTR("%s is deprecated and ignored."), a2, a3, a4, "-[UINavigationBar showButtonsWithLeftTitle:rightTitle:]");
}

- (void)showButtonsWithLeftTitle:(id)a3 rightTitle:(id)a4 leftBack:(BOOL)a5
{
  NSLog(CFSTR("%s is deprecated and ignored."), a2, a3, a4, a5, "-[UINavigationBar showButtonsWithLeftTitle:rightTitle:leftBack:]");
}

- (void)showButtonsWithLeft:(id)a3 right:(id)a4 leftBack:(BOOL)a5
{
  NSLog(CFSTR("%s is deprecated and ignored."), a2, a3, a4, a5, "-[UINavigationBar showButtonsWithLeft:right:leftBack:]");
}

- (void)showLeftButton:(id)a3 withStyle:(int)a4 rightButton:(id)a5 withStyle:(int)a6
{
  NSLog(CFSTR("%s is deprecated and ignored."), a2, a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, "-[UINavigationBar showLeftButton:withStyle:rightButton:withStyle:]");
}

- (void)_updateContentIfTopItem:(id)a3 animated:(BOOL)a4
{
  _UINavigationBarItemStack *stack;
  id v7;
  id v8;

  stack = self->_stack;
  v7 = a3;
  -[_UINavigationBarItemStack topItem](stack, "topItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    if (a4)
    {
      -[_UINavigationBarVisualProvider updateTopNavigationItemAnimated:](self->_visualProvider, "updateTopNavigationItemAnimated:", -[UINavigationBar _isAnimationEnabled](self, "_isAnimationEnabled"));
    }
    else
    {
      -[UINavigationBar _disableAnimation](self, "_disableAnimation");
      -[_UINavigationBarVisualProvider updateTopNavigationItemAnimated:](self->_visualProvider, "updateTopNavigationItemAnimated:", -[UINavigationBar _isAnimationEnabled](self, "_isAnimationEnabled"));
      -[UINavigationBar _enableAnimation](self, "_enableAnimation");
    }
    -[UINavigationBar _accessibility_navigationBarContentsDidChange](self, "_accessibility_navigationBarContentsDidChange");
  }
}

- (void)_updateBackButtonVisibilityIfTop:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6 == v8)
  {
    -[_UINavigationBarVisualProvider setBackButtonVisible:animated:](self->_visualProvider, "setBackButtonVisible:animated:", objc_msgSend(v8, "hidesBackButton") ^ 1, v4);
    v7 = v8;
  }

}

- (void)setButton:(int)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char isKindOfClass;
  id v14;

  v4 = a4;
  NSLog(CFSTR("This method is deprecated, please migrate to UINavigationItem and UIBarButtonItem API"), a2);
  -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rightBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "leftBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 1)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v12 = v10;
    if ((isKindOfClass & 1) == 0)
      goto LABEL_7;
LABEL_6:
    objc_msgSend(v12, "setEnabled:", v4);
    goto LABEL_7;
  }
  if (!a3)
  {
    objc_opt_class();
    v11 = objc_opt_isKindOfClass();
    v12 = v8;
    if ((v11 & 1) != 0)
      goto LABEL_6;
  }
LABEL_7:

}

- (id)createButtonWithContents:(id)a3 width:(double)a4 barStyle:(int64_t)a5 buttonStyle:(int)a6 isRight:(BOOL)a7
{
  NSLog(CFSTR("%s is deprecated and ignored."), a2, a3, a5, *(_QWORD *)&a6, a7, a4, "-[UINavigationBar createButtonWithContents:width:barStyle:buttonStyle:isRight:]");
  return 0;
}

- (void)hideButtons
{
  NSLog(CFSTR("%s is deprecated and ignored."), a2, "-[UINavigationBar hideButtons]");
}

- (void)showBackButton:(BOOL)a3 animated:(BOOL)a4
{
  -[_UINavigationBarVisualProvider setBackButtonVisible:animated:](self->_visualProvider, "setBackButtonVisible:animated:", a3, a4);
}

- (void)_accessibilityButtonShapesParametersDidChange
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[_UINavigationBarVisualProvider _shim_updateBackIndicator](self->_visualProvider, "_shim_updateBackIndicator");
  -[UINavigationBar currentBackButton](self, "currentBackButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationBar _accessibilityButtonBackgroundTintColor](self, "_accessibilityButtonBackgroundTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && objc_msgSend(v3, "_showsAccessibilityBackgroundWhenEnabled"))
  {
    objc_msgSend(v3, "_setWantsBlendModeForAccessibilityBackgrounds:", v4 == 0);
    objc_msgSend(v3, "_setAccessibilityBackgroundTintColor:", v4);
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UIView subviews](self, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && objc_msgSend(v11, "_showsAccessibilityBackgroundWhenEnabled"))
        {
          objc_msgSend(v11, "_setWantsBlendModeForAccessibilityBackgrounds:", v4 == 0);
          objc_msgSend(v11, "_setAccessibilityBackgroundTintColor:", v4);
          v8 = 1;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  if (((v12 | v8) & 1) != 0)
    -[UINavigationBar setNeedsLayout](self, "setNeedsLayout");

}

- (void)_accessibilityButtonShapesDidChangeNotification:(id)a3
{
  if (!_AXSButtonShapesEnabled())
    objc_msgSend((id)__barButtonAccessibilityBackgroundImages, "removeAllObjects");
  -[UINavigationBar _accessibilityButtonShapesParametersDidChange](self, "_accessibilityButtonShapesParametersDidChange");
}

- (BOOL)_suppressBackIndicator
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  -[UIView _screen](self, "_screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIView _screen](self, "_screen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = !-[UINavigationBar _shouldShowBackButtonForScreen:](self, "_shouldShowBackButtonForScreen:", v4);

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_updateBackIndicatorImage
{
  -[_UINavigationBarVisualProvider _shim_updateBackIndicator](self->_visualProvider, "_shim_updateBackIndicator");
}

- (CGRect)availableTitleArea
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)_allViews
{
  return -[_UINavigationBarVisualProvider _shim_displayViewsIncludingHiddenBackButtonViews:](self->_visualProvider, "_shim_displayViewsIncludingHiddenBackButtonViews:", 1);
}

- (void)_fadeAllViewsOut
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[UINavigationBar _allViews](self, "_allViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setAlpha:", 0.0);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_updateActiveBarMetrics
{
  _UINavigationBarAppearanceStorage *v3;
  _UINavigationBarAppearanceStorage *appearanceStorage;
  uint64_t v5;
  int64_t v6;
  void *v7;
  int64_t v8;
  id v9;

  if (!self->_appearanceStorage)
  {
    v3 = objc_alloc_init(_UINavigationBarAppearanceStorage);
    appearanceStorage = self->_appearanceStorage;
    self->_appearanceStorage = v3;

  }
  -[UINavigationBar _currentVisualStyle](self, "_currentVisualStyle");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_alwaysUseDefaultMetrics)
  {
    v5 = 0;
  }
  else
  {
    v6 = -[UINavigationBar effectiveInterfaceOrientation](self, "effectiveInterfaceOrientation");
    -[_UINavigationBarVisualProvider _shim_promptText](self->_visualProvider, "_shim_promptText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v9, "navigationBar:metricsForOrientation:hasPrompt:", self, v6, v7 != 0);

  }
  v8 = -[UINavigationBar _effectiveMetricsForMetrics:](self, "_effectiveMetricsForMetrics:", v5);
  -[_UINavigationBarAppearanceStorage setActiveBarMetrics:](self->_appearanceStorage, "setActiveBarMetrics:", v8);
  -[_UINavigationBarVisualStyle setMetrics:](self->_visualStyle, "setMetrics:", v8);

}

+ (void)_setUseCustomBackButtonAction:(BOOL)a3
{
  __useCustomBackButtonAction = a3;
}

+ (BOOL)_useCustomBackButtonAction
{
  return __useCustomBackButtonAction;
}

- (int64_t)_backgroundBackdropStyle
{
  return -[_UINavigationBarVisualProvider _shim_backdropStyle](self->_visualProvider, "_shim_backdropStyle");
}

- (void)_sendNavigationPopForBackBarButtonItem:(id)a3
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  id v11;
  id v12;

  v12 = a3;
  v4 = objc_msgSend(v12, "action");
  if (__useCustomBackButtonAction)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (v5)
  {
    -[UINavigationBar _effectiveDelegate](self, "_effectiveDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_popNavigationBar:item:", self, v6);

    }
    else
    {
      v10 = -[UINavigationBar isLocked](self, "isLocked");
      -[UINavigationBar setLocked:](self, "setLocked:", 0);
      v11 = -[UINavigationBar popNavigationItemAnimated:](self, "popNavigationItemAnimated:", 1);
      -[UINavigationBar setLocked:](self, "setLocked:", v10);
    }
  }
  else
  {
    v7 = v4;
    v8 = (void *)UIApp;
    objc_msgSend(v12, "target");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendAction:to:from:forEvent:", v7, v9, self, 0);
  }

}

- (_UITabContainerView)_tabBarHostedView
{
  return -[_UINavigationBarVisualProvider tabBarHostedView](self->_visualProvider, "tabBarHostedView");
}

- (void)_setTabBarHostedView:(id)a3
{
  -[_UINavigationBarVisualProvider setTabBarHostedView:](self->_visualProvider, "setTabBarHostedView:", a3);
}

- (BOOL)_isActiveTabBarHost
{
  return -[_UINavigationBarVisualProvider isActiveTabBarHost](self->_visualProvider, "isActiveTabBarHost");
}

- (void)_setActiveTabBarHost:(BOOL)a3
{
  -[_UINavigationBarVisualProvider setActiveTabBarHost:](self->_visualProvider, "setActiveTabBarHost:", a3);
}

- (BOOL)_wantsHostedTabBarMetrics
{
  return -[_UINavigationBarVisualProvider wantsHostedTabBarMetrics](self->_visualProvider, "wantsHostedTabBarMetrics");
}

- (void)_setWantsHostedTabBarMetrics:(BOOL)a3
{
  -[_UINavigationBarVisualProvider setWantsHostedTabBarMetrics:](self->_visualProvider, "setWantsHostedTabBarMetrics:", a3);
}

- (void)_setStaticNavBarButtonItem:(id)a3 trailingPosition:(BOOL)a4
{
  -[_UINavigationBarVisualProvider setStaticNavBarButtonItem:trailingPosition:](self->_visualProvider, "setStaticNavBarButtonItem:trailingPosition:", a3, a4);
}

- (UIBarButtonItem)_staticNavBarButtonItem
{
  return -[_UINavigationBarVisualProvider staticNavBarButtonItem](self->_visualProvider, "staticNavBarButtonItem");
}

- (BOOL)_isContentViewHidden
{
  return -[_UINavigationBarVisualProvider isContentViewHidden](self->_visualProvider, "isContentViewHidden");
}

- (void)_setNeedsStaticNavBarButtonUpdate
{
  -[_UINavigationBarVisualProvider setNeedsStaticNavBarButtonUpdate](self->_visualProvider, "setNeedsStaticNavBarButtonUpdate");
}

- (void)_setShouldFadeStaticNavBarButton:(BOOL)a3
{
  -[_UINavigationBarVisualProvider setShouldFadeStaticNavBarButton:](self->_visualProvider, "setShouldFadeStaticNavBarButton:", a3);
}

- (BOOL)_shouldFadeStaticNavBarButton
{
  return -[_UINavigationBarVisualProvider shouldFadeStaticNavBarButton](self->_visualProvider, "shouldFadeStaticNavBarButton");
}

- (BOOL)_staticNavBarButtonLingers
{
  return -[_UINavigationBarVisualProvider staticNavBarButtonLingers](self->_visualProvider, "staticNavBarButtonLingers");
}

- (void)_beginAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange
{
  -[_UINavigationBarVisualProvider beginAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange](self->_visualProvider, "beginAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange");
}

- (BOOL)_isAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange
{
  return -[_UINavigationBarVisualProvider isAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange](self->_visualProvider, "isAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange");
}

- (double)_navItemContentLayoutGuideAnimationDistance
{
  double result;

  -[_UINavigationBarVisualProvider navItemContentLayoutGuideAnimationDistance](self->_visualProvider, "navItemContentLayoutGuideAnimationDistance");
  return result;
}

- (BOOL)_updateNavItemContentLayoutGuideAnimationConstraintConstant:(double)a3
{
  return -[_UINavigationBarVisualProvider updateNavItemContentLayoutGuideAnimationConstraintConstant:](self->_visualProvider, "updateNavItemContentLayoutGuideAnimationConstraintConstant:", a3);
}

- (void)_endAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange
{
  -[_UINavigationBarVisualProvider endAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange](self->_visualProvider, "endAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange");
}

- (void)_removeContentClippingView
{
  -[_UINavigationBarVisualProvider _removeContentClippingView](self->_visualProvider, "_removeContentClippingView");
}

- (void)_installContentClippingView:(id)a3
{
  -[_UINavigationBarVisualProvider _installContentClippingView:](self->_visualProvider, "_installContentClippingView:", a3);
}

- (void)_refreshBackButtonMenu
{
  -[_UINavigationBarVisualProvider _refreshBackButtonMenu](self->_visualProvider, "_refreshBackButtonMenu");
}

- (void)_beginRenamingIfPossible
{
  void *v3;
  int v4;

  -[UINavigationBar topItem](self, "topItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_canRename");

  if (v4)
    -[_UINavigationBarVisualProvider _beginRenaming](self->_visualProvider, "_beginRenaming");
}

- (void)_beginRenaming
{
  -[_UINavigationBarVisualProvider _beginRenaming](self->_visualProvider, "_beginRenaming");
}

- (void)_endRenaming
{
  -[_UINavigationBarVisualProvider _endRenaming](self->_visualProvider, "_endRenaming");
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  void *v5;
  char v6;
  objc_super v7;

  if (sel_rename_ == a3)
  {
    -[UINavigationBar topItem](self, "topItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_canRename");

    return v6;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UINavigationBar;
    return -[UIView canPerformAction:withSender:](&v7, sel_canPerformAction_withSender_);
  }
}

- (id)_accessibility_contentsOfNavigationBar
{
  _UINavigationBarContents *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;

  v3 = objc_alloc_init(_UINavigationBarContents);
  -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarItemStack backItem](self->_stack, "backItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarContents setTopItem:](v3, "setTopItem:", v4);
  -[_UINavigationBarContents setBackItem:](v3, "setBackItem:", v5);
  -[UINavigationBar _staticNavBarButtonItem](self, "_staticNavBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarContents setStaticBarButtonItem:](v3, "setStaticBarButtonItem:", v6);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __57__UINavigationBar__accessibility_contentsOfNavigationBar__block_invoke;
    v19 = &unk_1E16B5D10;
    v20 = v7;
    v21 = v8;
    v9 = v8;
    v10 = v7;
    v11 = _Block_copy(&v16);
    objc_msgSend(v4, "leftBarButtonItems", v16, v17, v18, v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v11);

    objc_msgSend(v4, "rightBarButtonItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v11);

    -[_UINavigationBarContents setCancelBarButtonItems:](v3, "setCancelBarButtonItems:", v10);
    -[_UINavigationBarContents setOtherBarButtonItems:](v3, "setOtherBarButtonItems:", v9);

  }
  if (v5)
  {
    objc_msgSend(v5, "_effectiveBackBarButtonItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarContents setBackBarButtonItem:](v3, "setBackBarButtonItem:", v14);

  }
  if (v4)
    -[_UINavigationBarVisualProvider provideViewsForContents:topItem:backItem:](self->_visualProvider, "provideViewsForContents:topItem:backItem:", v3, v4, v5);

  return v3;
}

void __57__UINavigationBar__accessibility_contentsOfNavigationBar__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id *v4;
  id v5;

  v5 = a2;
  if (!objc_msgSend(v5, "isSystemItem"))
    goto LABEL_5;
  v3 = objc_msgSend(v5, "systemItem");
  if ((unint64_t)(v3 - 5) >= 2)
  {
    if (v3 == 1)
    {
      v4 = (id *)(a1 + 32);
LABEL_6:
      objc_msgSend(*v4, "addObject:", v5);
      goto LABEL_7;
    }
LABEL_5:
    v4 = (id *)(a1 + 40);
    goto LABEL_6;
  }
LABEL_7:

}

- (void)_accessibility_triggerBackButton
{
  void *v3;
  id v4;

  if (!-[_UINavigationBarItemStack state](self->_stack, "state"))
  {
    -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_effectiveBackBarButtonItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationBar _sendNavigationPopForBackBarButtonItem:](self, "_sendNavigationPopForBackBarButtonItem:", v3);

  }
}

- (void)_accessibility_triggerBarButtonItem:(id)a3
{
  objc_msgSend(a3, "_triggerActionForEvent:", 0);
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldBeginAtPoint:(CGPoint)a4
{
  double y;
  double x;

  y = a4.y;
  x = a4.x;
  return !-[_UINavigationBarItemStack state](self->_stack, "state", a3)
      && -[_UINavigationBarVisualProvider _accessibility_shouldBeginHUDGestureAtPoint:](self->_visualProvider, "_accessibility_shouldBeginHUDGestureAtPoint:", x, y);
}

- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4
{
  return -[_UINavigationBarVisualProvider _accessibility_HUDItemForPoint:](self->_visualProvider, "_accessibility_HUDItemForPoint:", a3, a4.x, a4.y);
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leftBarButtonItems");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v7)
    v10 = (void *)v7;
  else
    v10 = (void *)MEMORY[0x1E0C9AA60];
  v11 = v10;

  -[_UINavigationBarItemStack topItem](self->_stack, "topItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rightBarButtonItems");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (void *)v13;
  else
    v15 = v9;
  v16 = v15;

  objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v16);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v17);
        v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v5, "view", (_QWORD)v26);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "view");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "isDescendantOfView:", v23);

        if ((v24 & 1) != 0)
        {
          LOBYTE(v18) = 1;
          goto LABEL_17;
        }
      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v18)
        continue;
      break;
    }
  }
LABEL_17:

  return v18;
}

- (void)_accessibilityHUDGestureManager:(id)a3 gestureLiftedAtPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  id v9;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  -[_UINavigationBarVisualProvider _accessibility_controlToActivateForHUDGestureLiftAtPoint:](self->_visualProvider, "_accessibility_controlToActivateForHUDGestureLiftAtPoint:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v9, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "convertPoint:fromView:", v8, x, y);
    objc_msgSend(v7, "_activateForAccessibilityHUDLiftAtPoint:");

  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  _UINavigationBarVisualProvider *visualProvider;
  _QWORD v5[5];

  visualProvider = self->_visualProvider;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__UINavigationBar_gestureRecognizerShouldBegin___block_invoke;
  v5[3] = &unk_1E16B5D38;
  v5[4] = self;
  return -[_UINavigationBarVisualProvider gestureRecognizerShouldBegin:defaultAnswer:](visualProvider, "gestureRecognizerShouldBegin:defaultAnswer:", a3, v5);
}

id __48__UINavigationBar_gestureRecognizerShouldBegin___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)UINavigationBar;
  return objc_msgSendSuper2(&v3, sel_gestureRecognizerShouldBegin_, a2);
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
    v7.super_class = (Class)UINavigationBar;
    -[UIView _systemDefaultFocusGroupIdentifier](&v7, sel__systemDefaultFocusGroupIdentifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)preferredFocusedView
{
  return -[_UINavigationBarVisualProvider preferredFocusedView](self->_visualProvider, "preferredFocusedView");
}

- (BOOL)isTransparentFocusItem
{
  return 0;
}

- (int64_t)_sceneDraggingBehaviorOnPan
{
  if (-[_UINavigationBarVisualProvider isInCustomization](self->_visualProvider, "isInCustomization"))
    return 2;
  return -[UINavigationBar barPosition](self, "barPosition") == 3 && !-[UIView isHidden](self, "isHidden");
}

- (id)_immediatelyFinishRunningTransition
{
  return -[_UINavigationBarVisualProvider _immediatelyFinishRunningTransition](self->_visualProvider, "_immediatelyFinishRunningTransition");
}

- (UIColor)_accessibilityButtonBackgroundTintColor
{
  return self->_accessibilityButtonBackgroundTintColor;
}

- (UINavigationBarAppearance)compactAppearance
{
  return self->_compactAppearance;
}

- (UINavigationBarAppearance)compactScrollEdgeAppearance
{
  return self->_compactScrollEdgeAppearance;
}

- (void)_setOverrideBackgroundExtension:(double)a3
{
  self->__overrideBackgroundExtension = a3;
}

- (BOOL)_startedAnimationTracking
{
  return self->__startedAnimationTracking;
}

- (BOOL)alwaysUseDefaultMetrics
{
  return self->_alwaysUseDefaultMetrics;
}

- (id)backButtonViewAtPoint:(CGPoint)a3
{
  return (id)-[_UINavigationBarVisualProvider backButtonViewAtPoint:](self->_visualProvider, "backButtonViewAtPoint:", a3.x, a3.y);
}

- (void)_uikit_applyValueFromTraitStorage:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("titleTextAttributes."))
    && (unint64_t)objc_msgSend(v7, "length") >= 0x15)
  {
    objc_msgSend(v7, "substringFromIndex:", 20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationBar titleTextAttributes](self, "titleTextAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "setValue:forKeyPath:", v6, v8);
    -[UINavigationBar setTitleTextAttributes:](self, "setTitleTextAttributes:", v10);

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UINavigationBar;
    -[NSObject _uikit_applyValueFromTraitStorage:forKeyPath:](&v11, sel__uikit_applyValueFromTraitStorage_forKeyPath_, v6, v7);
  }

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
    v7.super_class = (Class)UINavigationBar;
    -[UIView _autolayoutSpacingAtEdge:forAttribute:inContainer:isGuide:](&v7, sel__autolayoutSpacingAtEdge_forAttribute_inContainer_isGuide_, *(_QWORD *)&a3, a4, a5, 1, 0.0);
  }
  return result;
}

- (double)_defaultAutolayoutSpacing
{
  return 0.0;
}

@end
