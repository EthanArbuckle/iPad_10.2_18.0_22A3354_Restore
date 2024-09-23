@implementation SBHMultiplexingWrapperViewController

- (SBHMultiplexingWrapperViewController)initWithIcon:(id)a3 location:(id)a4 multiplexingViewController:(id)a5 appPredictionViewController:(id)a6 canAlignWithGrid:(BOOL)a7
{
  id v12;
  SBHMultiplexingWrapperViewController *v13;
  SBHMultiplexingWrapperViewController *v14;
  uint64_t v15;

  v12 = a6;
  v13 = -[SBHMultiplexingWrapperViewController initWithIcon:location:multiplexingViewController:component:](self, "initWithIcon:location:multiplexingViewController:component:", a3, a4, a5, 0);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_appPredictionViewController, v12);
    v14->_canAlignWithGrid = a7;
    v15 = -[SBHMultiplexingWrapperViewController expectedAppPredictionViewControllerMode](v14, "expectedAppPredictionViewControllerMode");
    if (v15 != objc_msgSend(v12, "mode"))
      objc_msgSend(v12, "setMode:", v15);
  }

  return v14;
}

- (SBHMultiplexingWrapperViewController)initWithIcon:(id)a3 location:(id)a4 multiplexingViewController:(id)a5 component:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  SBHMultiplexingWrapperViewController *v14;
  SBHMultiplexingWrapperViewController *v15;
  uint64_t v16;
  NSString *location;
  void *v18;
  void *v19;
  id v20;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SBHMultiplexingWrapperViewController;
  v14 = -[SBHMultiplexingWrapperViewController initWithNibName:bundle:](&v22, sel_initWithNibName_bundle_, 0, 0);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_icon, a3);
    v16 = objc_msgSend(v12, "copy");
    location = v15->_location;
    v15->_location = (NSString *)v16;

    objc_storeStrong((id *)&v15->_multiplexingViewController, a5);
    v15->_component = a6;
    objc_msgSend(v13, "addObserver:", v15);
    v15->_imageViewAlignment = 0;
    objc_opt_self();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)-[SBHMultiplexingWrapperViewController registerForTraitChanges:withAction:](v15, "registerForTraitChanges:withAction:", v19, sel__updateEdgeAntialiasing);

  }
  return v15;
}

- (BOOL)isGridAligned
{
  BOOL v2;
  id WeakRetained;

  if (self->_component)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appPredictionViewController);
  v2 = objc_msgSend(WeakRetained, "mode") == 0;

  return v2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  void *v3;
  id v4;
  UIView *v5;
  UIView *containerView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBHMultiplexingWrapperViewController;
  -[SBHMultiplexingWrapperViewController loadView](&v7, sel_loadView);
  -[SBHMultiplexingWrapperViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v3, "bounds");
  v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
  containerView = self->_containerView;
  self->_containerView = v5;

  -[UIView setClipsToBounds:](self->_containerView, "setClipsToBounds:", 1);
  objc_msgSend(v3, "addSubview:", self->_containerView);
  -[SBHMultiplexingWrapperViewController _updateMultiplexingViewControllerModeAnimated:](self, "_updateMultiplexingViewControllerModeAnimated:", 0);
  -[SBHMultiplexingWrapperViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", self->_multiplexingViewController, self->_containerView);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHMultiplexingWrapperViewController;
  -[SBHMultiplexingWrapperViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SBHMultiplexingWrapperViewController _updateMultiplexingViewControllerModeAnimated:](self, "_updateMultiplexingViewControllerModeAnimated:", 0);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  id WeakRetained;
  uint64_t v13;
  uint64_t v14;
  double v15;
  BOOL v16;
  double v17;
  CGFloat v18;
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
  double v29;
  double v30;
  void *v31;
  void *v32;
  double continuousCornerRadius;
  double v34;
  double v35;
  objc_super v36;
  CGRect v37;
  CGRect v38;

  v36.receiver = self;
  v36.super_class = (Class)SBHMultiplexingWrapperViewController;
  -[SBHMultiplexingWrapperViewController viewWillLayoutSubviews](&v36, sel_viewWillLayoutSubviews);
  -[SBHMultiplexingWrapperViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_appPredictionViewController);
  v13 = objc_msgSend(WeakRetained, "mode");
  v14 = v13;
  v15 = 0.0;
  if (self->_component)
    v16 = 1;
  else
    v16 = v13 == 1;
  if (!v16)
  {
    objc_msgSend(WeakRetained, "parentLayoutInsets", 0.0);
    v15 = v17 * 0.5;
  }
  v18 = -v15;
  v37.origin.x = v5;
  v37.origin.y = v7;
  v37.size.width = v9;
  v37.size.height = v11;
  v38 = CGRectInset(v37, v18, v18);
  -[UIView setFrame:](self->_containerView, "setFrame:", v38.origin.x, v38.origin.y, v38.size.width, v38.size.height);
  -[UIView bounds](self->_containerView, "bounds");
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  BSRectWithSize();
  v20 = v19;
  v22 = v21;
  v35 = v23;
  v25 = v24;
  UIRectGetCenter();
  v28 = v27;
  v29 = -((v11 - v25) * 0.5);
  if (self->_imageViewAlignment)
    v29 = (v11 - v25) * 0.5;
  v30 = v26 + v29;
  -[UIViewController view](self->_multiplexingViewController, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBounds:", v20, v22, v35, v25);

  -[UIViewController view](self->_multiplexingViewController, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setCenter:", v28, v30);

  continuousCornerRadius = self->_iconImageInfo.continuousCornerRadius;
  -[UIView _setContinuousCornerRadius:](self->_containerView, "_setContinuousCornerRadius:", continuousCornerRadius);
  -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", continuousCornerRadius);
  -[UIView setClipsToBounds:](self->_containerView, "setClipsToBounds:", BSFloatEqualToFloat() ^ 1);
  if (!self->_component)
  {
    v34 = 0.0;
    if (v14 == 1)
      v34 = 1.0;
    -[SBHMultiplexingWrapperViewController _setBackgroundViewWeighting:](self, "_setBackgroundViewWeighting:", v34);
  }

}

- (void)multiplexingViewControllerDidActivate:(id)a3
{
  -[SBHMultiplexingWrapperViewController _updateMultiplexingViewControllerModeAnimated:](self, "_updateMultiplexingViewControllerModeAnimated:", 0);
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SBIconImageInfo *p_iconImageInfo;
  void *v13;
  void *v14;
  id v15;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if (!SBIconImageInfoEqualToIconImageInfo(self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius, v3, v4, v5, v6))
  {
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    -[SBHMultiplexingWrapperViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setCornerRadius:", v7);
    objc_msgSend(v15, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    -[SBHMultiplexingWrapperViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNeedsLayout");

  }
}

- (void)setEditing:(BOOL)a3
{
  -[SBHMultiplexingWrapperViewController setEditing:animated:](self, "setEditing:animated:", a3, 0);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_editing != a3)
  {
    v4 = a4;
    self->_editing = a3;
    -[SBHMultiplexingWrapperViewController _updateWidgetViewHitTesting](self, "_updateWidgetViewHitTesting");
    -[SBHMultiplexingWrapperViewController _updateMultiplexingViewControllerModeAnimated:](self, "_updateMultiplexingViewControllerModeAnimated:", v4);
  }
}

- (void)setWantsEditingDisplayStyle:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_wantsEditingDisplayStyle != a3)
  {
    self->_wantsEditingDisplayStyle = a3;
    -[SBHMultiplexingWrapperViewController _updateMultiplexingViewControllerModeAnimated:](self, "_updateMultiplexingViewControllerModeAnimated:", a4);
  }
}

- (void)setShowingContextMenu:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_showingContextMenu != a3)
  {
    v3 = a3;
    self->_showingContextMenu = a3;
    -[SBHMultiplexingWrapperViewController _updateMultiplexingViewControllerModeAnimated:](self, "_updateMultiplexingViewControllerModeAnimated:", 1);
    -[SBHMultiplexingWrapperViewController _widgetContextMenuController](self, "_widgetContextMenuController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShowingContextMenu:", v3);

  }
}

- (void)willShowContextMenuAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  char v7;
  id v8;

  y = a3.y;
  x = a3.x;
  -[SBHMultiplexingWrapperViewController _widgetContextMenuController](self, "_widgetContextMenuController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SBHMultiplexingWrapperViewController _widgetContextMenuController](self, "_widgetContextMenuController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "willShowContextMenuAtLocation:", x, y);

  }
}

- (void)setOverlapping:(BOOL)a3
{
  id v3;

  if (self->_overlapping != a3)
  {
    self->_overlapping = a3;
    -[SBHMultiplexingWrapperViewController view](self, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsLayout");

  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  if (self->_userInteractionEnabled != a3)
  {
    self->_userInteractionEnabled = a3;
    -[SBHMultiplexingWrapperViewController _updateWidgetViewHitTesting](self, "_updateWidgetViewHitTesting");
  }
}

- (SBLeafIconDataSource)visiblyActiveDataSource
{
  SBIcon *icon;
  uint64_t v3;
  SBIcon *v4;
  SBIcon *v5;
  SBIcon *v6;
  void *v7;

  icon = self->_icon;
  v3 = objc_opt_class();
  v4 = icon;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  -[SBIcon activeDataSource](v6, "activeDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBLeafIconDataSource *)v7;
}

- (void)setForcesEdgeAntialiasing:(BOOL)a3
{
  if (self->_forcesEdgeAntialiasing != a3)
  {
    self->_forcesEdgeAntialiasing = a3;
    -[SBHMultiplexingWrapperViewController _updateEdgeAntialiasing](self, "_updateEdgeAntialiasing");
  }
}

- (void)setBackgroundViewProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id backgroundViewProvider;
  UIView *backgroundView;
  UIView *v9;
  void (**v10)(id, _QWORD);
  UIView *v11;
  UIView *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v5 = v4;
  if (self->_backgroundViewProvider != v4)
  {
    v15 = v4;
    v6 = (void *)objc_msgSend(v4, "copy");
    backgroundViewProvider = self->_backgroundViewProvider;
    self->_backgroundViewProvider = v6;

    backgroundView = self->_backgroundView;
    if (backgroundView)
    {
      -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
      v9 = self->_backgroundView;
      self->_backgroundView = 0;

    }
    v10 = (void (**)(id, _QWORD))self->_backgroundViewProvider;
    v5 = v15;
    if (v10)
    {
      ((void (**)(id, id))v10)[2](v10, v15);
      v11 = (UIView *)objc_claimAutoreleasedReturnValue();
      v12 = self->_backgroundView;
      self->_backgroundView = v11;

      -[UIView setClipsToBounds:](self->_backgroundView, "setClipsToBounds:", !self->_showsSquareCorners);
      -[UIView insertSubview:atIndex:](self->_containerView, "insertSubview:atIndex:", self->_backgroundView, 0);
      -[SBHMultiplexingWrapperViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setNeedsLayout");

      -[SBHMultiplexingWrapperViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "layoutIfNeeded");

      -[SBHMultiplexingWrapperViewController _configureBackgroundViewIfNecessary](self, "_configureBackgroundViewIfNecessary");
      v5 = v15;
    }
  }

}

- (void)setBackgroundViewConfigurator:(id)a3
{
  void *v4;
  id backgroundViewConfigurator;
  void *v6;

  if (self->_backgroundViewConfigurator != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    backgroundViewConfigurator = self->_backgroundViewConfigurator;
    self->_backgroundViewConfigurator = v4;

    if (!self->_backgroundViewConfigurator)
    {
      v6 = _Block_copy(self->_backgroundViewProvider);
      -[SBHMultiplexingWrapperViewController setBackgroundViewProvider:](self, "setBackgroundViewProvider:", 0);
      -[SBHMultiplexingWrapperViewController setBackgroundViewProvider:](self, "setBackgroundViewProvider:", v6);

    }
    -[SBHMultiplexingWrapperViewController _configureBackgroundViewIfNecessary](self, "_configureBackgroundViewIfNecessary");
  }
}

- (BOOL)wantsCaptureOnlyBackgroundView
{
  if (self->_backgroundViewProvider && !self->_backgroundAnimationCount)
    return !-[SBHMultiplexingWrapperViewController isGridAligned](self, "isGridAligned");
  else
    return 0;
}

- (void)setImageViewAlignment:(unint64_t)a3
{
  void *v4;
  id v5;

  if (self->_imageViewAlignment != a3)
  {
    self->_imageViewAlignment = a3;
    -[SBHMultiplexingWrapperViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

    -[SBHMultiplexingWrapperViewController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutIfNeeded");

  }
}

- (void)setLegibilitySettings:(id)a3
{
  _UILegibilitySettings *v5;
  id WeakRetained;
  _UILegibilitySettings *v7;

  v5 = (_UILegibilitySettings *)a3;
  if (self->_legibilitySettings != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    v5 = v7;
    if (!self->_component)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_appPredictionViewController);
      objc_msgSend(WeakRetained, "setLegibilitySettings:", v7);

      v5 = v7;
    }
  }

}

- (NSArray)applicationShortcutItems
{
  void *v2;
  void *v3;

  -[SBHMultiplexingWrapperViewController _widgetContextMenuController](self, "_widgetContextMenuController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationShortcutItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)didSelectApplicationShortcutItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBHMultiplexingWrapperViewController _widgetContextMenuController](self, "_widgetContextMenuController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didSelectApplicationShortcutItem:", v4);

}

- (id)_widgetContextMenuController
{
  id WeakRetained;
  id v3;
  void *v4;
  id v5;

  if (self->_component)
    WeakRetained = 0;
  else
    WeakRetained = objc_loadWeakRetained((id *)&self->_appPredictionViewController);
  v3 = WeakRetained;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)setPauseReasons:(unint64_t)a3
{
  id WeakRetained;

  if (self->_pauseReasons != a3)
  {
    self->_pauseReasons = a3;
    if (!self->_component)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_appPredictionViewController);
      objc_msgSend(WeakRetained, "setOccluded:", a3 != 0);

    }
  }
}

- (CGRect)visibleBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[SBHMultiplexingWrapperViewController iconImageInfo](self, "iconImageInfo");
  v3 = v2;
  v5 = v4;
  v6 = 0.0;
  v7 = 0.0;
  result.size.height = v5;
  result.size.width = v3;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (double)continuousCornerRadius
{
  double v2;

  -[SBHMultiplexingWrapperViewController iconImageInfo](self, "iconImageInfo");
  return v2;
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  if (self->_showsSquareCorners != a3)
  {
    self->_showsSquareCorners = a3;
    -[UIView setClipsToBounds:](self->_backgroundView, "setClipsToBounds:", !a3);
  }
}

- (void)addCustomImageViewControllerObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeCustomImageViewControllerObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)_setBackgroundViewWeighting:(double)a3
{
  UIView *backgroundView;
  uint64_t v6;
  UIView *v7;
  UIView *v8;
  UIView *v9;

  backgroundView = self->_backgroundView;
  v6 = objc_opt_class();
  v7 = backgroundView;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  if (v9)
    -[UIView setWeighting:](v9, "setWeighting:", a3);
  else
    -[UIView setAlpha:](self->_backgroundView, "setAlpha:", a3);

}

- (void)_updateBackgroundViewWeighting
{
  double v3;
  _BOOL4 v4;

  v3 = 1.0;
  if (!self->_editing && !self->_showingContextMenu)
  {
    v4 = -[NSString isEqualToString:](self->_location, "isEqualToString:", CFSTR("SBIconLocationAddWidgetSheet"), 1.0);
    v3 = 0.0;
    if (v4)
      v3 = 1.0;
  }
  -[SBHMultiplexingWrapperViewController _setBackgroundViewWeighting:](self, "_setBackgroundViewWeighting:", v3);
}

- (unint64_t)expectedAppPredictionViewControllerMode
{
  _BOOL4 v3;
  _BOOL4 v4;

  v3 = -[SBHMultiplexingWrapperViewController canAlignWithGrid](self, "canAlignWithGrid");
  if (self->_editing)
    return 1;
  if (self->_wantsEditingDisplayStyle)
    return 1;
  if (self->_showingContextMenu)
    return 1;
  v4 = v3;
  return (SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupTodayView"), self->_location) & 1) != 0
      || -[NSString isEqualToString:](self->_location, "isEqualToString:", CFSTR("SBIconLocationAddWidgetSheet"))
      || !v4;
}

- (void)_updateMultiplexingViewControllerModeAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  id WeakRetained;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  SBHMultiplexingWrapperViewController *v20;
  id v21;
  BOOL v22;
  _QWORD aBlock[4];
  id v24;
  unint64_t v25;

  v3 = a3;
  v5 = MEMORY[0x1E0C809B0];
  if (self->_component)
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_appPredictionViewController);
    v10 = -[SBHMultiplexingWrapperViewController expectedAppPredictionViewControllerMode](self, "expectedAppPredictionViewControllerMode");
    v7 = v10 != objc_msgSend(WeakRetained, "mode");
    aBlock[0] = v5;
    aBlock[1] = 3221225472;
    aBlock[2] = __86__SBHMultiplexingWrapperViewController__updateMultiplexingViewControllerModeAnimated___block_invoke;
    aBlock[3] = &unk_1E8D84C78;
    v24 = WeakRetained;
    v25 = v10;
    v8 = v24;
    v6 = _Block_copy(aBlock);

  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  ++self->_backgroundAnimationCount;
  if (v7)
  {
    -[SBHMultiplexingWrapperViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v12, "multiplexingWrapperViewControllerWillChangeGridAlignment:", self);

  }
  v13 = (void *)MEMORY[0x1E0DC3F10];
  v18[0] = v5;
  if (v3)
    v14 = 3;
  else
    v14 = 2;
  v18[1] = 3221225472;
  v18[2] = __86__SBHMultiplexingWrapperViewController__updateMultiplexingViewControllerModeAnimated___block_invoke_2;
  v18[3] = &unk_1E8D88888;
  v22 = v7;
  v20 = self;
  v21 = v6;
  v19 = v8;
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __86__SBHMultiplexingWrapperViewController__updateMultiplexingViewControllerModeAnimated___block_invoke_3;
  v17[3] = &unk_1E8D888B0;
  v17[4] = self;
  v15 = v8;
  v16 = v6;
  objc_msgSend(v13, "sb_animateWithSettings:mode:animations:completion:", v11, v14, v18, v17);

}

uint64_t __86__SBHMultiplexingWrapperViewController__updateMultiplexingViewControllerModeAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMode:", *(_QWORD *)(a1 + 40));
}

void __86__SBHMultiplexingWrapperViewController__updateMultiplexingViewControllerModeAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNeedsLayout");

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v3 = *(id *)(*(_QWORD *)(a1 + 40) + 968);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v15 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v8, "customImageViewControllerWantsLabelHiddenDidChange:", *(_QWORD *)(a1 + 40), (_QWORD)v14);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v5);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "parentViewController", (_QWORD)v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 40);
  if (v9)
    v11 = v9 == *(void **)(v10 + 1040);
  else
    v11 = 1;
  if (v11 && *(_QWORD *)(v10 + 1088))
  {
    objc_msgSend(*(id *)(v10 + 1080), "setHidden:", 0);
    v10 = *(_QWORD *)(a1 + 40);
  }
  objc_msgSend((id)v10, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 40), "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutIfNeeded");

}

void __86__SBHMultiplexingWrapperViewController__updateMultiplexingViewControllerModeAnimated___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1088);
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 1088))
  {
    v3 = *(void **)(v1 + 1080);
    v4 = objc_opt_class();
    v5 = v3;
    if (v4)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v8 = v6;

    if (v8)
      objc_msgSend(v8, "weighting");
    else
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "alpha");
    if (BSFloatIsZero())
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setHidden:", 1);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "multiplexingWrapperViewControllerDidChangeGridAlignment:", *(_QWORD *)(a1 + 32));

  }
}

- (void)_updateWidgetViewHitTesting
{
  _BOOL8 v2;
  id v3;

  v2 = self->_editing || !self->_userInteractionEnabled;
  -[UIViewController view](self->_multiplexingViewController, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setHitTestingDisabled:", v2);

}

- (void)_updateEdgeAntialiasing
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  -[SBHMultiplexingWrapperViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SBHMultiplexingWrapperViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  v6 = v5;

  objc_msgSend(v7, "setAllowsEdgeAntialiasing:", self->_forcesEdgeAntialiasing);
  objc_msgSend(v7, "setShouldRasterize:", self->_forcesEdgeAntialiasing);
  objc_msgSend(v7, "setRasterizationScale:", v6);

}

- (void)_configureBackgroundViewIfNecessary
{
  void *v3;
  void (**backgroundViewConfigurator)(void);
  BOOL v5;
  void *v6;

  -[SBHMultiplexingWrapperViewController visiblyActiveDataSource](self, "visiblyActiveDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  backgroundViewConfigurator = (void (**)(void))self->_backgroundViewConfigurator;
  if (backgroundViewConfigurator)
  {
    if (self->_backgroundView)
      v5 = v3 == 0;
    else
      v5 = 1;
    if (!v5)
    {
      v6 = v3;
      backgroundViewConfigurator[2]();
      v3 = v6;
    }
  }

}

- (SBIcon)icon
{
  return self->_icon;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)wantsEditingDisplayStyle
{
  return self->_wantsEditingDisplayStyle;
}

- (void)setWantsEditingDisplayStyle:(BOOL)a3
{
  self->_wantsEditingDisplayStyle = a3;
}

- (BOOL)isShowingContextMenu
{
  return self->_showingContextMenu;
}

- (BOOL)isOverlapping
{
  return self->_overlapping;
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (SBIconApproximateLayoutPosition)approximateLayoutPosition
{
  SBIconApproximateLayoutPosition *p_approximateLayoutPosition;
  unint64_t horizontal;
  unint64_t vertical;
  SBIconApproximateLayoutPosition result;

  p_approximateLayoutPosition = &self->_approximateLayoutPosition;
  horizontal = self->_approximateLayoutPosition.horizontal;
  vertical = p_approximateLayoutPosition->vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (void)setApproximateLayoutPosition:(SBIconApproximateLayoutPosition)a3
{
  self->_approximateLayoutPosition = a3;
}

- (id)backgroundViewProvider
{
  return self->_backgroundViewProvider;
}

- (id)backgroundViewConfigurator
{
  return self->_backgroundViewConfigurator;
}

- (unint64_t)imageViewAlignment
{
  return self->_imageViewAlignment;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (unint64_t)pauseReasons
{
  return self->_pauseReasons;
}

- (BOOL)forcesEdgeAntialiasing
{
  return self->_forcesEdgeAntialiasing;
}

- (BOOL)showsSquareCorners
{
  return self->_showsSquareCorners;
}

- (SBHMultiplexingWrapperViewControllerDelegate)delegate
{
  return (SBHMultiplexingWrapperViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)multiplexingViewController
{
  return self->_multiplexingViewController;
}

- (APUIAppPredictionViewController)appPredictionViewController
{
  return (APUIAppPredictionViewController *)objc_loadWeakRetained((id *)&self->_appPredictionViewController);
}

- (unint64_t)component
{
  return self->_component;
}

- (BOOL)canAlignWithGrid
{
  return self->_canAlignWithGrid;
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (unint64_t)backgroundAnimationCount
{
  return self->_backgroundAnimationCount;
}

- (void)setBackgroundAnimationCount:(unint64_t)a3
{
  self->_backgroundAnimationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_destroyWeak((id *)&self->_appPredictionViewController);
  objc_storeStrong((id *)&self->_multiplexingViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong(&self->_backgroundViewConfigurator, 0);
  objc_storeStrong(&self->_backgroundViewProvider, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
