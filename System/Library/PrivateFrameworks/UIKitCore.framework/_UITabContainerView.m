@implementation _UITabContainerView

- (_UITabContainerView)initWithSidebar:(id)a3 tabBar:(id)a4
{
  id *v6;
  id v7;
  _UITabContainerView *v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = (id *)a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UITabContainerView;
  v8 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v8)
  {
    if (v6)
    {
      v9 = v6[5];
      v10 = v9;
      if (v9)
      {
        v11 = (void *)*((_QWORD *)v9 + 144);
LABEL_5:
        objc_storeStrong((id *)&v8->_tabModel, v11);

        objc_storeStrong((id *)&v8->_tabBar, a4);
        objc_storeWeak((id *)&v8->_sidebar, v6);
        -[_UITabContainerView _createViewHierarchy](v8, "_createViewHierarchy");
        goto LABEL_6;
      }
    }
    else
    {
      v10 = 0;
    }
    v11 = 0;
    goto LABEL_5;
  }
LABEL_6:

  return v8;
}

- (_UITabOutlineView)outlineView
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sidebar);
  objc_msgSend(WeakRetained, "_outlineView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UITabOutlineView *)v3;
}

- (_UIFloatingTabBar)floatingTabBar
{
  _UIFloatingTabBar *v3;
  _UIFloatingTabBar *v4;
  _UIFloatingTabBar *floatingTabBar;
  _QWORD v7[4];
  id v8;
  id location;

  if (!self->_floatingTabBar && (-[_UITabContainerView supportedComponent](self, "supportedComponent") & 1) != 0)
  {
    v3 = [_UIFloatingTabBar alloc];
    v4 = -[_UIFloatingTabBar initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[_UIFloatingTabBar setTabModel:](v4, "setTabModel:", self->_tabModel);
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37___UITabContainerView_floatingTabBar__block_invoke;
    v7[3] = &unk_1E16E12A0;
    objc_copyWeak(&v8, &location);
    -[_UIFloatingTabBar setContentFrameDidChangeBlock:](v4, "setContentFrameDidChangeBlock:", v7);
    floatingTabBar = self->_floatingTabBar;
    self->_floatingTabBar = v4;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return self->_floatingTabBar;
}

- (void)_createViewHierarchy
{
  UITabBar *tabBar;
  UITabBar *v4;
  UITabBar *v5;
  UITabBar *v6;
  UITabBar *v7;
  UITabBar *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[2];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  tabBar = self->_tabBar;
  if (tabBar)
  {
    v4 = tabBar;
  }
  else
  {
    v5 = [UITabBar alloc];
    v4 = -[UITabBar initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  v6 = v4;
  -[UIView setAutoresizingMask:](v4, "setAutoresizingMask:", 0);
  v7 = self->_tabBar;
  self->_tabBar = v6;
  v8 = v6;

  v14[0] = 0x1E1A994F8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[UIView _registerForTraitTokenChanges:withTarget:action:](self, "_registerForTraitTokenChanges:withTarget:action:", v9, self, sel__horizontalSizeClassDidChange);

  v13[0] = 0x1E1A994C8;
  v13[1] = 0x1E1A99540;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UIView _registerForTraitTokenChanges:withTarget:action:](self, "_registerForTraitTokenChanges:withTarget:action:", v11, self, sel_setNeedsLayout);

  -[_UITabContainerView _updateVisibleBarAnimated:](self, "_updateVisibleBarAnimated:", 0);
}

- (void)safeAreaInsetsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UITabContainerView;
  -[UIView safeAreaInsetsDidChange](&v4, sel_safeAreaInsetsDidChange);
  -[_UITabContainerView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsetsDidChange");

}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  BOOL v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v15.origin.x = v8;
  v15.origin.y = v9;
  v15.size.width = v10;
  v15.size.height = v11;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v12 = CGRectEqualToRect(v14, v15);
  v13.receiver = self;
  v13.super_class = (Class)_UITabContainerView;
  -[UIView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (!v12)
  {
    if (-[_UITabContainerView _hasActiveMorphTransition](self, "_hasActiveMorphTransition"))
      -[_UITabContainerView _updateSidebarAppearanceForMorphTransitionAnimated:](self, "_updateSidebarAppearanceForMorphTransitionAnimated:", 0);
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UITabContainerView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[_UITabContainerView _updateFloatingTabBarFrame](self, "_updateFloatingTabBarFrame");
  -[_UITabContainerView _updateOutlineViewFrame](self, "_updateOutlineViewFrame");
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_dimmingView, "setFrame:");
}

- (void)_updateFloatingTabBarFrame
{
  _UIFloatingTabBar *v3;
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
  double v15;
  double Width;
  double v17;
  double v18;
  id WeakRetained;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double height;
  float64x2_t *v29;
  float64x2_t *v30;
  double y;
  double x;
  double v33;
  CGFloat v34;
  CGRectEdge v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGRect v40;
  CGRect remainder;
  CGRect v42;
  CGRect v43;

  v3 = self->_floatingTabBar;
  -[UIView safeAreaInsets](self, "safeAreaInsets");
  v5 = v4;
  -[UIView center](v3, "center");
  v7 = v6;
  v9 = v8;
  -[UIView bounds](self, "bounds");
  -[_UIFloatingTabBar sizeThatFits:](v3, "sizeThatFits:", v10, v11);
  v13 = v12;
  -[_UITabContainerView _floatingTabBarTopOffset](self, "_floatingTabBarTopOffset");
  v15 = v5 + v14;
  -[UIView bounds](self, "bounds");
  Width = CGRectGetWidth(v42);
  -[_UIFloatingTabBar setBounds:](v3, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), Width, v13);
  -[UIView setCenter:](v3, "setCenter:", Width * 0.5 + 0.0, v15 + v13 * 0.5);
  -[UIView center](v3, "center");
  if (v7 != v18 || v9 != v17)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_floatingTabBarHost);
    objc_msgSend(WeakRetained, "tabBarContainerDidLayoutFloatingTabBar:", self);

  }
  -[_UITabContainerView tabModel](self, "tabModel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEditing");

  if (v22)
  {
    -[UIView traitCollection](self, "traitCollection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _UIFloatingTabBarGetPlatformMetrics(objc_msgSend(v23, "userInterfaceIdiom"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    remainder.origin.x = 0.0;
    remainder.origin.y = 0.0;
    remainder.size.width = Width;
    -[_UITabContainerView _floatingTabBarFittingHeight](self, "_floatingTabBarFittingHeight");
    v26 = v15 + v25;
    objc_msgSend(v24, "expandedDropTargetInset");
    height = v26 + v27;
    remainder.size.height = height;
    -[_UITabContainerView outlineView](self, "outlineView");
    v29 = (float64x2_t *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29
      && (y = 0.0,
          (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(v29[39]), (int32x4_t)vceqzq_f64(v29[40]))))) & 1) != 0))
    {
      x = 0.0;
    }
    else
    {
      -[_UITabContainerView _currentSidebarWidth](self, "_currentSidebarWidth");
      v34 = v33;
      if (-[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection", *MEMORY[0x1E0C9D648], *(_QWORD *)(MEMORY[0x1E0C9D648] + 8), *(_QWORD *)(MEMORY[0x1E0C9D648] + 16), *(_QWORD *)(MEMORY[0x1E0C9D648] + 24)))
      {
        v35 = CGRectMaxXEdge;
      }
      else
      {
        v35 = CGRectMinXEdge;
      }
      v43.origin.x = 0.0;
      v43.origin.y = 0.0;
      v43.size.width = Width;
      v43.size.height = height;
      CGRectDivide(v43, &v40, &remainder, v34, v35);
      x = remainder.origin.x;
      y = remainder.origin.y;
      Width = remainder.size.width;
      height = remainder.size.height;
    }
    -[UIView convertRect:toView:](self, "convertRect:toView:", v3, x, y, Width, height);
    remainder.origin.x = v36;
    remainder.origin.y = v37;
    remainder.size.width = v38;
    remainder.size.height = v39;
    -[_UIFloatingTabBar setFrameForExpandedDropTarget:](v3, "setFrameForExpandedDropTarget:");

  }
  else
  {
    -[_UIFloatingTabBar setFrameForExpandedDropTarget:](v3, "setFrameForExpandedDropTarget:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  }

}

- (void)_updateOutlineViewFrame
{
  double v3;
  double Height;
  double v5;
  double v6;
  void *v7;
  void *v8;
  CGRect v9;
  CGRect v10;

  if (-[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    -[UIView bounds](self, "bounds");
    v3 = CGRectGetWidth(v9) + -320.0 + 160.0;
  }
  else
  {
    v3 = 160.0;
  }
  -[UIView bounds](self, "bounds");
  Height = CGRectGetHeight(v10);
  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[_UITabContainerView outlineView](self, "outlineView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBounds:", v5, v6, 320.0, Height);

  -[_UITabContainerView outlineView](self, "outlineView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCenter:", v3, Height * 0.5 + 0.0);

  -[_UITabContainerView outlineView](self, "outlineView");
  -[_UITabContainerView _updateOverlaySidebarButtonFrame](self, "_updateOverlaySidebarButtonFrame");
}

- (void)setSidebarLayout:(int64_t)a3
{
  if (self->_sidebarLayout != a3)
  {
    self->_sidebarLayout = a3;
    -[_UITabContainerView _updateVisibleBarAnimated:](self, "_updateVisibleBarAnimated:", 0);
  }
}

- (void)setSupportedComponent:(int64_t)a3
{
  char v3;
  uint64_t v5;
  _UITabContainerView *v6;
  id v7;

  if (self->_supportedComponent != a3)
  {
    v3 = a3;
    self->_supportedComponent = a3;
    -[_UITabContainerView sidebar](self, "sidebar");
    v5 = objc_claimAutoreleasedReturnValue();
    v7 = (id)v5;
    if ((v3 & 2) != 0)
      v6 = self;
    else
      v6 = 0;
    -[UITabBarControllerSidebar _setSidebarViewDelegate:](v5, v6);

  }
}

- (void)setAvailableComponent:(int64_t)a3
{
  -[_UITabContainerView setAvailableComponent:animated:](self, "setAvailableComponent:animated:", a3, 0);
}

- (void)setAvailableComponent:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_availableComponent != a3)
  {
    v4 = a4;
    self->_availableComponent = a3;
    -[_UITabContainerView _updateToggleAction](self, "_updateToggleAction");
    -[_UITabContainerView _updateVisibleBarAnimated:](self, "_updateVisibleBarAnimated:", v4);
  }
}

- (void)setSuppressTabBar:(BOOL)a3
{
  if (self->_suppressTabBar != a3)
  {
    self->_suppressTabBar = a3;
    if (-[_UITabContainerView canShowFloatingUI](self, "canShowFloatingUI"))
    {
      -[_UITabContainerView _updateVisibleBarAnimated:](self, "_updateVisibleBarAnimated:", 1);
      -[_UITabContainerView _updateToggleAction](self, "_updateToggleAction");
    }
  }
}

- (void)setOverrideTidebarButtonAction:(id)a3
{
  UIAction *v5;
  UIAction *v6;

  v5 = (UIAction *)a3;
  if (self->_overrideTidebarButtonAction != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_overrideTidebarButtonAction, a3);
    -[_UITabContainerView _updateToggleAction](self, "_updateToggleAction");
    v5 = v6;
  }

}

- (void)setOverlaySidebarButtonTintColor:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_overlaySidebarButtonTintColor);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_overlaySidebarButtonTintColor, obj);
    -[_UITabContainerView _updateOverlaySidebarButtonTintColor](self, "_updateOverlaySidebarButtonTintColor");
    v5 = obj;
  }

}

- (BOOL)canShowFloatingUI
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_UITabModel tabBarController](self->_tabModel, "tabBarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass") == 2;

  return v4;
}

- (BOOL)isShowingFloatingTabBar
{
  _BOOL4 v3;

  if (-[_UITabContainerView _hasActiveMorphTransition](self, "_hasActiveMorphTransition"))
  {
    LOBYTE(v3) = self->_isAnimatingToTabBar;
  }
  else
  {
    v3 = -[_UITabContainerView canShowFloatingTabBar](self, "canShowFloatingTabBar");
    if (v3)
      LOBYTE(v3) = !-[_UITabContainerView _isShowingSidebar](self, "_isShowingSidebar");
  }
  return v3;
}

- (BOOL)canShowFloatingTabBar
{
  return (-[_UITabContainerView availableComponent](self, "availableComponent") & 1) != 0
      && -[_UITabContainerView canShowFloatingUI](self, "canShowFloatingUI");
}

- (BOOL)isSidebarOverlappingContent
{
  void *v3;
  void *v4;
  BOOL v5;

  -[_UITabContainerView outlineView](self, "outlineView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[_UITabContainerView sidebarLayout](self, "sidebarLayout") == 0;
  else
    v5 = 0;

  return v5;
}

- (BOOL)_isShowingSidebar
{
  void *v2;
  char isSidebarSupportedAnd;

  -[_UITabContainerView sidebar](self, "sidebar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isSidebarSupportedAnd = -[UITabBarControllerSidebar _isSidebarSupportedAndVisible](v2);

  return isSidebarSupportedAnd;
}

- (UIEdgeInsets)edgeInsetsForChildViewController:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  char v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  v4 = a3;
  v5 = 0.0;
  v6 = 0.0;
  if (-[_UITabContainerView isShowingFloatingTabBar](self, "isShowingFloatingTabBar"))
  {
    -[_UITabContainerView tabModel](self, "tabModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tabItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v9 = objc_msgSend(v4, "_shouldOverlayTabBar");

      if ((v9 & 1) == 0)
      {
        -[_UITabContainerView _floatingTabBarFittingHeight](self, "_floatingTabBarFittingHeight");
        v6 = v10;
      }
    }
    else
    {

    }
  }
  if (-[_UITabContainerView sidebarLayout](self, "sidebarLayout"))
  {
    v11 = 0.0;
  }
  else
  {
    v11 = 0.0;
    if (-[_UITabContainerView _isShowingSidebar](self, "_isShowingSidebar"))
    {
      -[_UITabContainerView _currentSidebarWidth](self, "_currentSidebarWidth");
      v11 = v12;
      v13 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
      if (v13)
        v5 = v11;
      else
        v5 = 0.0;
      if (v13)
        v11 = 0.0;
    }
  }

  v14 = 0.0;
  v15 = v6;
  v16 = v11;
  v17 = v5;
  result.right = v17;
  result.bottom = v14;
  result.left = v16;
  result.top = v15;
  return result;
}

- (double)floatingTabBarTopInsetForViewController:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v4 = a3;
  v5 = 0.0;
  if (-[_UITabContainerView isShowingFloatingTabBar](self, "isShowingFloatingTabBar"))
  {
    objc_msgSend(v4, "_hostingNavigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[_UITabContainerView floatingTabBar](self, "floatingTabBar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentLayoutFrame");
      v5 = v8 + 14.0;

    }
    else
    {
      -[_UITabContainerView _floatingTabBarFittingHeight](self, "_floatingTabBarFittingHeight");
      v5 = v9;
    }
  }

  return v5;
}

- (UIEdgeInsets)additionalContentMargins
{
  double v3;
  _BOOL4 v4;
  double v5;
  double v6;
  double v7;
  _BOOL4 v8;
  double v9;
  double v10;
  double v11;
  UIEdgeInsets result;

  v3 = 0.0;
  if (-[_UITabContainerView sidebarLayout](self, "sidebarLayout") == 1)
  {
    v4 = -[_UITabContainerView _isShowingSidebar](self, "_isShowingSidebar");
    v5 = 0.0;
    if (v4)
    {
      -[_UITabContainerView _currentSidebarWidth](self, "_currentSidebarWidth");
      v7 = v6;
      v8 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
      if (v8)
        v3 = v7;
      else
        v3 = 0.0;
      if (v8)
        v5 = 0.0;
      else
        v5 = v7;
    }
  }
  else
  {
    v5 = 0.0;
  }
  v9 = 0.0;
  v10 = 0.0;
  v11 = v3;
  result.right = v11;
  result.bottom = v10;
  result.left = v5;
  result.top = v9;
  return result;
}

- (CGRect)adjustedFrameForContentTransitionViewFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  double v12;
  CGFloat v13;
  CGRectEdge v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect remainder;
  CGRect v21;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  remainder = a3;
  -[_UITabContainerView sidebar](self, "sidebar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UITabBarControllerSidebar _isSidebarSupportedAndVisible](v8))
  {
    -[_UITabContainerView outlineView](self, "outlineView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;

  }
  else
  {
    v11 = 1;
  }

  if (-[_UITabContainerView sidebarLayout](self, "sidebarLayout") == 1 && !v11)
  {
    -[_UITabContainerView _currentSidebarWidth](self, "_currentSidebarWidth");
    v13 = v12;
    if (-[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection", *MEMORY[0x1E0C9D648], *(_QWORD *)(MEMORY[0x1E0C9D648] + 8), *(_QWORD *)(MEMORY[0x1E0C9D648] + 16), *(_QWORD *)(MEMORY[0x1E0C9D648] + 24)))
    {
      v14 = CGRectMaxXEdge;
    }
    else
    {
      v14 = CGRectMinXEdge;
    }
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    CGRectDivide(v21, &v19, &remainder, v13, v14);
    x = remainder.origin.x;
    y = remainder.origin.y;
    width = remainder.size.width;
    height = remainder.size.height;
  }
  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)floatingTabBarContentFrameInCoordinateSpace:(id)a3
{
  id v4;
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
  double v17;
  double MidX;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  void *v28;
  uint64_t v29;
  void *v30;
  BOOL v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect result;

  v4 = a3;
  -[_UIFloatingTabBar contentLayoutFrame](self->_floatingTabBar, "contentLayoutFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIView center](self->_floatingTabBar, "center");
  v14 = v13;
  v16 = v15;
  -[UIView bounds](self->_floatingTabBar, "bounds");
  v17 = v14 - CGRectGetWidth(v36) * 0.5;
  -[UIView bounds](self->_floatingTabBar, "bounds");
  MidX = v6 + v17;
  v19 = v8 + v16 - CGRectGetHeight(v37) * 0.5;
  v38.origin.x = MidX;
  v38.origin.y = v19;
  v38.size.width = v10;
  v38.size.height = v12;
  if (CGRectEqualToRect(v38, *MEMORY[0x1E0C9D648]))
  {
    -[UIView bounds](self, "bounds");
    MidX = CGRectGetMidX(v39);
    v12 = 0.0;
    v10 = 0.0;
    v19 = 0.0;
  }
  -[UIView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v4, MidX, v19, v10, v12);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[_UITabContainerView tabModel](self, "tabModel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v28, "isEditing") & 1) != 0
    || (-[UIView superview](self->_floatingTabBar, "superview"), (v29 = objc_claimAutoreleasedReturnValue()) == 0))
  {

  }
  else
  {
    v30 = (void *)v29;
    v31 = -[_UIFloatingTabBar isInTransitionAnimation](self->_floatingTabBar, "isInTransitionAnimation");

    if (!v31)
      goto LABEL_9;
  }
  v40.origin.x = v21;
  v40.origin.y = v23;
  v40.size.width = v25;
  v40.size.height = v27;
  v21 = CGRectGetMidX(v40);
  v25 = 0.0;
LABEL_9:

  v32 = v21;
  v33 = v23;
  v34 = v25;
  v35 = v27;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (void)_updateSidebarContentMarginsWithTabBarContentFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  _BOOL4 v22;
  void *v23;
  int v24;
  void (**v25)(_QWORD);
  void *v26;
  _QWORD aBlock[9];
  CGRect v28;
  CGRect v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UITabContainerView floatingTabBar](self, "floatingTabBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertRect:toView:", self, x, y, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[_UITabContainerView outlineView](self, "outlineView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  v29.origin.x = v18;
  v29.origin.y = v19;
  v29.size.width = v20;
  v29.size.height = v21;
  v28.origin.x = v10;
  v28.origin.y = v12;
  v28.size.width = v14;
  v28.size.height = v16;
  v22 = CGRectIntersectsRect(v28, v29);

  if (!v22)
    height = 0.0;
  self->_sidebarAdditionalEditingInsets.top = height;
  self->_sidebarAdditionalEditingInsets.bottom = 0.0;
  self->_sidebarAdditionalEditingInsets.right = 0.0;
  self->_sidebarAdditionalEditingInsets.left = 0.0;
  if (!self->_suppressesEditingInsetsChanges)
  {
    -[_UITabContainerView tabModel](self, "tabModel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEditing");

    if (v24)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __74___UITabContainerView__updateSidebarContentMarginsWithTabBarContentFrame___block_invoke;
      aBlock[3] = &unk_1E16B20D8;
      aBlock[4] = self;
      *(double *)&aBlock[5] = height;
      memset(&aBlock[6], 0, 24);
      v25 = (void (**)(_QWORD))_Block_copy(aBlock);
      if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
      {
        v25[2](v25);
      }
      else
      {
        +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v26, 0, v25, 0);

      }
    }
  }
}

- (void)_updateToggleAction
{
  void *v3;
  id *v4;
  void *v5;
  void *v6;
  id v7;

  -[_UITabContainerView _sidebarToggleAction](self, "_sidebarToggleAction");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITabContainerView floatingTabBar](self, "floatingTabBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSidebarButtonAction:", v7);

  -[_UITabContainerView outlineView](self, "outlineView");
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  -[_UITabOutlineView setSidebarButtonAction:](v4, v7);

  LODWORD(v4) = !-[_UITabContainerView _isTabBarHidden](self, "_isTabBarHidden");
  -[_UITabContainerView outlineView](self, "outlineView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITabOutlineView setTransitionsToTabBar:]((uint64_t)v5, (int)v4);

  LODWORD(v4) = -[_UITabContainerView _showsOverlaySidebarButton](self, "_showsOverlaySidebarButton");
  -[_UITabContainerView outlineView](self, "outlineView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITabOutlineView setSuppressesSidebarButton:]((uint64_t)v6, (int)v4);

}

- (UIAction)_sidebarToggleAction
{
  void *v3;
  void *v4;
  UIAction *sidebarToggleAction;
  UIAction *v6;
  UIAction *v7;
  _QWORD v9[4];
  id v10;
  id location;

  -[_UITabContainerView overrideTidebarButtonAction](self, "overrideTidebarButtonAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UITabContainerView overrideTidebarButtonAction](self, "overrideTidebarButtonAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return (UIAction *)v4;
  }
  if (-[_UITabContainerView supportedComponent](self, "supportedComponent") != 3
    && !-[_UITabContainerView wantsOverlaySidebarButton](self, "wantsOverlaySidebarButton"))
  {
    v4 = 0;
    return (UIAction *)v4;
  }
  sidebarToggleAction = self->_sidebarToggleAction;
  if (!sidebarToggleAction)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43___UITabContainerView__sidebarToggleAction__block_invoke;
    v9[3] = &unk_1E16B58D0;
    objc_copyWeak(&v10, &location);
    +[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v9);
    v6 = (UIAction *)objc_claimAutoreleasedReturnValue();
    v7 = self->_sidebarToggleAction;
    self->_sidebarToggleAction = v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    sidebarToggleAction = self->_sidebarToggleAction;
  }
  return sidebarToggleAction;
}

- (double)_currentSidebarWidth
{
  void *v2;
  double v3;
  double v4;
  double result;

  -[_UITabContainerView outlineView](self, "outlineView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;

  result = 320.0;
  if (v4 > 0.0)
    return v4;
  return result;
}

- (double)_floatingTabBarTopOffset
{
  double v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  id WeakRetained;
  double v11;
  double v12;
  double v13;

  v3 = 4.0;
  if (_UITabBarControllerWantsNavigationBarExtensionForFloatingTabBar())
  {
    -[UIView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _UIFloatingTabBarGetPlatformMetrics(objc_msgSend(v4, "userInterfaceIdiom"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "safeAreaOffset");
    v7 = v6;
    -[UIView traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "_presentationSemanticContext") == 2)
      v9 = 10.0;
    else
      v9 = 0.0;

    WeakRetained = objc_loadWeakRetained((id *)&self->_floatingTabBarHost);
    objc_msgSend(WeakRetained, "contentViewVerticalOffsetInTabBarContainer:", self);
    v12 = v11;

    -[_UIFloatingTabBar baselineOffsetFromTop](self->_floatingTabBar, "baselineOffsetFromTop");
    v3 = v7 + v9 + v12 - v13;

  }
  return v3;
}

- (double)_floatingTabBarFittingHeight
{
  int v2;
  int v3;
  double result;

  v2 = -[_UITabContainerView availableComponent](self, "availableComponent");
  v3 = _UITabBarControllerWantsNavigationBarExtensionForFloatingTabBar();
  result = 50.0;
  if ((v3 & v2) != 0)
    return 64.0;
  return result;
}

- (BOOL)_hasActiveMorphTransition
{
  return self->_transitionContainerView != 0;
}

- (BOOL)_isTabBarHidden
{
  _BOOL4 v2;

  if ((self->_availableComponent & 1) != 0)
  {
    v2 = -[_UITabContainerView canShowFloatingUI](self, "canShowFloatingUI");
    if (v2)
      LOBYTE(v2) = -[_UITabContainerView suppressTabBar](self, "suppressTabBar");
  }
  else
  {
    LOBYTE(v2) = 1;
  }
  return v2;
}

- (void)updateSidebarAppearanceStateAnimated:(BOOL)a3 animator:(id)a4
{
  _BOOL8 v4;
  _UITabBarControllerSidebarAnimator *v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  _BOOL4 v10;
  void *v11;
  _UITabBarControllerSidebarAnimator *alongsideAnimator;
  _UITabBarControllerSidebarAnimator *v13;
  _UITabBarControllerSidebarAnimator *v14;

  v4 = a3;
  v6 = (_UITabBarControllerSidebarAnimator *)a4;
  -[UIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "horizontalSizeClass");

  if (-[_UITabContainerView _isTabBarHidden](self, "_isTabBarHidden"))
  {
    v9 = 0;
  }
  else
  {
    v10 = v8 == 2;
    -[_UITabContainerView tabModel](self, "tabModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10 & ~objc_msgSend(v11, "isEditing");

  }
  alongsideAnimator = self->_alongsideAnimator;
  self->_alongsideAnimator = v6;
  v14 = v6;

  if (v9)
    -[_UITabContainerView _updateSidebarAppearanceForMorphTransitionAnimated:](self, "_updateSidebarAppearanceForMorphTransitionAnimated:", v4);
  else
    -[_UITabContainerView _updateVisibleBarAnimated:](self, "_updateVisibleBarAnimated:", v4);
  v13 = self->_alongsideAnimator;
  self->_alongsideAnimator = 0;

}

- (void)_updateSidebarAppearanceForMorphTransitionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _UITabBarControllerSidebarAnimator *v5;
  void *v6;
  _UIGroupCompletion *transitionGroupCompletion;
  _BOOL4 v8;
  id *v9;
  UIView *v10;
  _UIDuoShadowView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  UIView *v32;
  UIView *v33;
  UIView *p_super;
  id WeakRetained;
  UIView *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  UIVisualEffectView *v42;
  void *v43;
  UIVisualEffectView *v44;
  void *v45;
  UIView *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  _UIPortalView *v51;
  UIView *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  _UIPortalView *v71;
  UIView *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  UIView *v82;
  UIView *v83;
  UIView *v84;
  UIView *v85;
  id *v86;
  void *v87;
  UIVisualEffectView *v88;
  UIVisualEffectView *v89;
  UIVisualEffectView *v90;
  UIVisualEffectView *v91;
  id v92;
  void *v93;
  void *v94;
  unint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  __int128 v99;
  void *v100;
  void *v101;
  void *v102;
  _UIRopeAnimation *currentRopeAnimation;
  id v104;
  void *v105;
  void *v106;
  uint64_t v107;
  id v108;
  UIView *v109;
  id v110;
  __int128 v111;
  __int128 v112;
  _UIDuoShadowView *v113;
  UIVisualEffectView *v114;
  UIVisualEffectView *v115;
  id v116;
  id v117;
  _UIDuoShadowView *v118;
  UIView *v119;
  id v120;
  _UIDuoShadowView *v121;
  void *v122;
  id v123;
  _UIRopeAnimation *v124;
  _UIRopeAnimation *v125;
  _UIRopeAnimation *v126;
  id *v127;
  id v128;
  id v129;
  id *v130;
  id *v131;
  UIView *v132;
  __int128 v133;
  UIView *v134;
  __int128 v135;
  UIView *v136;
  UIView *v137;
  void *v138;
  __int128 v139;
  id *v140;
  UIView *v141;
  double v142;
  UIView *v143;
  UIView *v144;
  _UITabBarControllerSidebarAnimator *v145;
  UIVisualEffectView *v146;
  UIView *v147;
  UIView *v148;
  _UIRopeAnimation *v149;
  UIVisualEffectView *v150;
  int v151;
  _UIDuoShadowView *v152;
  id v153;
  UIView *v154;
  UIView *v155;
  UIView *v156;
  UIView *v157;
  void *v158;
  UIVisualEffectView *v159;
  void *v160;
  UIView *obj;
  UIView *obja;
  void *v163;
  UIVisualEffectView *v164;
  void (**v165)(void);
  _QWORD v166[4];
  id v167;
  _UIRopeAnimation *v168;
  id v169;
  _QWORD v170[4];
  id v171;
  _UITabContainerView *v172;
  id *v173;
  id v174;
  id v175;
  UIView *v176;
  id v177;
  id *v178;
  _UIDuoShadowView *v179;
  UIVisualEffectView *v180;
  UIVisualEffectView *v181;
  UIView *v182;
  UIView *v183;
  UIView *v184;
  id v185;
  id v186[19];
  id v187[19];
  CGAffineTransform v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  char v192;
  char v193;
  _QWORD v194[5];
  id v195;
  id *v196;
  UIView *v197;
  UIView *v198;
  _UIDuoShadowView *v199;
  UIVisualEffectView *v200;
  UIVisualEffectView *v201;
  id v202;
  id v203[19];
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  char v210;
  char v211;
  _QWORD v212[4];
  id v213;
  _UITabContainerView *v214;
  _UITabBarControllerSidebarAnimator *v215;
  CGAffineTransform v216;
  _OWORD v217[4];
  _OWORD v218[4];
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  _OWORD v223[4];
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  _OWORD v228[4];
  CGAffineTransform v229;
  CGAffineTransform v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  id v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  id v250;
  id v251[5];
  double v252;
  double v253;
  double v254;
  id v255;
  id v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  id v265;
  id v266[4];
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  id v274;
  _QWORD aBlock[4];
  id v276;
  id location;
  void *v278;
  _QWORD v279[4];
  CGRect v280;

  v3 = a3;
  v279[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke;
  aBlock[3] = &unk_1E16B3F40;
  objc_copyWeak(&v276, &location);
  v165 = (void (**)(void))_Block_copy(aBlock);
  if (v3)
    v3 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  -[_UITabContainerView updateDimmingViewAnimated:](self, "updateDimmingViewAnimated:", v3);
  v5 = self->_alongsideAnimator;
  if (v3 && (self->_availableComponent & 2) != 0)
  {
    -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v8 = -[_UITabContainerView _isShowingSidebar](self, "_isShowingSidebar");
    -[_UITabContainerView outlineView](self, "outlineView");
    v9 = (id *)objc_claimAutoreleasedReturnValue();
    -[_UITabContainerView floatingTabBar](self, "floatingTabBar");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITabOutlineView contentView](v9);
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = v8;
    v145 = v5;
    objc_msgSend(v163, "contentView");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = self->_transitionContainerView;
    v154 = self->_outlineTransitionBackgroundView;
    v10 = self->_tabBarTransitionBackgroundView;
    v136 = self->_outlineTransitionView;
    v134 = self->_tabBarTransitionView;
    v11 = self->_shadowTransitionView;
    -[_UITabContainerView _configuredGroupCompletion](self, "_configuredGroupCompletion");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "increment");
    if (!v148)
    {
      objc_msgSend(v9, "setHidden:", 1);
      -[UIView setHidden:](self->_floatingTabBar, "setHidden:", 1);
      self->_isAnimatingToTabBar = v151;
      -[_UITabContainerView _updateVisibleBarAnimated:requireLayout:updateDimmingView:](self, "_updateVisibleBarAnimated:requireLayout:updateDimmingView:", 0, 1, 0);
    }
    v274 = 0;
    v273 = 0u;
    v272 = 0u;
    v271 = 0u;
    v270 = 0u;
    v269 = 0u;
    v268 = 0u;
    v267 = 0u;
    objc_msgSend(v160, "bounds");
    v266[0] = v12;
    v266[1] = v13;
    v266[2] = v14;
    v266[3] = v15;
    v16 = *MEMORY[0x1E0C9D538];
    v17 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v160, "convertPoint:toView:", self, *MEMORY[0x1E0C9D538], v17);
    *(_QWORD *)&v267 = v18;
    *((_QWORD *)&v267 + 1) = v19;
    *(_QWORD *)&v268 = -[_UITabOutlineView sidebarButtonOrigin](v9);
    *((_QWORD *)&v268 + 1) = v20;
    -[_UITabOutlineView primaryShadow](v9);
    *(_QWORD *)&v269 = objc_claimAutoreleasedReturnValue();
    -[_UITabOutlineView secondaryShadow](v9);
    *((_QWORD *)&v269 + 1) = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v9, "_intersectedSceneCornerRadii");
    }
    else
    {
      v272 = 0u;
      v273 = 0u;
      v270 = 0u;
      v271 = 0u;
    }
    +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 0.9, 0.4);
    v140 = v9;
    v274 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "bounds");
    v251[0] = v21;
    v251[1] = v22;
    v251[2] = v23;
    v251[3] = v24;
    objc_msgSend(v158, "convertPoint:toView:", self, v16, v17);
    v26 = v25;
    v251[4] = v27;
    v252 = v25;
    objc_msgSend(v163, "sidebarButtonOrigin");
    v142 = v28;
    v30 = v29;
    v253 = v28;
    v254 = v29;
    v256 = 0;
    v255 = 0;
    objc_msgSend(v163, "contentCornerRadius");
    v257 = v31;
    v258 = v31;
    v259 = v31;
    v260 = v31;
    v261 = v31;
    v262 = v31;
    v263 = v31;
    v264 = v31;
    +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.45);
    v265 = (id)objc_claimAutoreleasedReturnValue();
    if (-[_UITabContainerView _isTabBarHidden](self, "_isTabBarHidden"))
    {
      objc_msgSend(v163, "frame");
      v252 = v26 - CGRectGetMaxY(v280);
    }
    if (v148)
    {
      v152 = v11;
      v32 = v134;
      v33 = v136;
      v150 = (UIVisualEffectView *)v10;
      p_super = v154;
      obj = v148;
    }
    else
    {
      objc_msgSend(v163, "prepareForTransitionToVisibility:", v151 ^ 1u);
      -[_UITabOutlineView prepareForTransitionToVisibility:](v9, v151);
      WeakRetained = objc_loadWeakRetained((id *)&self->_floatingTabBarHost);
      objc_msgSend(WeakRetained, "tabBarContainerDidLayoutFloatingTabBar:", self);

      v36 = [UIView alloc];
      v37 = *MEMORY[0x1E0C9D648];
      v38 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v39 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v40 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      obj = -[UIView initWithFrame:](v36, "initWithFrame:", *MEMORY[0x1E0C9D648], v38, v39, v40);
      -[UIView layer](obj, "layer");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setAnchorPoint:", v16, v17);

      -[UIView addSubview:](self, "addSubview:", obj);
      objc_storeStrong((id *)&self->_transitionContainerView, obj);
      v152 = -[_UIDuoShadowView initWithFrame:]([_UIDuoShadowView alloc], "initWithFrame:", v37, v38, v39, v40);

      -[UIView addSubview:](obj, "addSubview:", v152);
      objc_storeStrong((id *)&self->_shadowTransitionView, v152);
      v42 = [UIVisualEffectView alloc];
      objc_msgSend(v163, "currentBackgroundEffect");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v150 = -[UIVisualEffectView initWithEffect:](v42, "initWithEffect:", v43);

      -[UIView setClipsToBounds:](v150, "setClipsToBounds:", 1);
      -[UIView addSubview:](obj, "addSubview:", v150);
      objc_storeStrong((id *)&self->_tabBarTransitionBackgroundView, v150);
      v44 = [UIVisualEffectView alloc];
      -[_UITabOutlineView currentBackgroundEffect](v9);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v146 = -[UIVisualEffectView initWithEffect:](v44, "initWithEffect:", v45);

      -[UIView setClipsToBounds:](v146, "setClipsToBounds:", 1);
      -[UIView addSubview:](obj, "addSubview:", v146);
      objc_storeStrong((id *)&self->_outlineTransitionBackgroundView, v146);
      v46 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v37, v38, v39, v40);
      -[UIView setAutoresizingMask:](v46, "setAutoresizingMask:", 18);
      -[UIView setClipsToBounds:](v46, "setClipsToBounds:", 1);
      -[UIView addSubview:](obj, "addSubview:", v46);
      v132 = v46;
      objc_msgSend(v160, "bounds");
      v48 = v47;
      v50 = v49;
      v51 = -[_UIPortalView initWithSourceView:]([_UIPortalView alloc], "initWithSourceView:", v160);
      -[_UIPortalView setFrame:](v51, "setFrame:", v16 - *(double *)&v268, v17 - *((double *)&v268 + 1), v48, v50);
      -[_UIPortalView setForwardsClientHitTestingToSourceView:](v51, "setForwardsClientHitTestingToSourceView:", 1);
      -[_UIPortalView setHidesSourceView:](v51, "setHidesSourceView:", 1);
      -[_UIPortalView setAllowsBackdropGroups:](v51, "setAllowsBackdropGroups:", 1);
      v52 = [UIView alloc];
      -[UIView bounds](v51, "bounds");
      v54 = v53;
      v56 = v55;
      v58 = v57;
      v60 = v59;
      objc_msgSend(v160, "safeAreaInsets");
      v155 = -[UIView initWithFrame:](v52, "initWithFrame:", v54 + v64, v56 + v61, v58 - (v64 + v62), v60 - (v61 + v63));

      -[UIView layer](v155, "layer");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setAnchorPoint:", v16, v17);

      -[UIView layer](v155, "layer");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setPosition:", v268);

      -[UIView addSubview:](v155, "addSubview:", v51);
      -[UIView addSubview:](v132, "addSubview:", v155);
      objc_storeStrong((id *)&self->_outlineTransitionView, v155);
      objc_msgSend(v158, "bounds");
      v68 = v67;
      v70 = v69;
      v71 = -[_UIPortalView initWithSourceView:]([_UIPortalView alloc], "initWithSourceView:", v158);
      -[_UIPortalView setFrame:](v71, "setFrame:", v16 - v142, v17 - v30, v68, v70);
      -[_UIPortalView setForwardsClientHitTestingToSourceView:](v71, "setForwardsClientHitTestingToSourceView:", 1);
      -[_UIPortalView setHidesSourceView:](v71, "setHidesSourceView:", 1);
      -[_UIPortalView setAllowsBackdropGroups:](v71, "setAllowsBackdropGroups:", 1);
      v72 = [UIView alloc];
      -[UIView bounds](v71, "bounds");
      v32 = -[UIView initWithFrame:](v72, "initWithFrame:");

      -[UIView layer](v32, "layer");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "setAnchorPoint:", v16, v17);

      -[UIView layer](v32, "layer");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setPosition:", v142, v30);

      -[UIView addSubview:](v32, "addSubview:", v71);
      -[UIView addSubview:](v132, "addSubview:", v32);
      objc_storeStrong((id *)&self->_tabBarTransitionView, v32);
      v75 = *MEMORY[0x1E0CD2C88];
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v279[0] = v76;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v279, 1);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView layer](v155, "layer");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setFilters:", v77);

      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v75);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v278 = v79;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v278, 1);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView layer](v32, "layer");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setFilters:", v80);

      objc_msgSend(v138, "addNonIncrementingCompletion:", v165);
      p_super = &v146->super;
      v33 = v155;
    }
    if (v151)
      v82 = v33;
    else
      v82 = v32;
    v156 = v33;
    if (v151)
      v83 = v32;
    else
      v83 = v33;
    v84 = v82;
    v85 = v83;
    v250 = 0;
    v249 = 0u;
    v248 = 0u;
    v247 = 0u;
    v246 = 0u;
    v245 = 0u;
    v244 = 0u;
    v243 = 0u;
    v242 = 0u;
    v241 = 0u;
    v147 = p_super;
    if (v151)
    {
      __copy_constructor_8_8_t0w64_s64_s72_t80w64_s144((uint64_t)&v241, v266);
      v86 = v251;
      v87 = v160;
      v88 = v150;
      v89 = (UIVisualEffectView *)p_super;
    }
    else
    {
      __copy_constructor_8_8_t0w64_s64_s72_t80w64_s144((uint64_t)&v241, v251);
      v86 = v266;
      v87 = v158;
      v88 = (UIVisualEffectView *)p_super;
      v89 = v150;
    }
    v240 = 0;
    v239 = 0u;
    v238 = 0u;
    v237 = 0u;
    v235 = 0u;
    v236 = 0u;
    v233 = 0u;
    v234 = 0u;
    v231 = 0u;
    v232 = 0u;
    __copy_constructor_8_8_t0w64_s64_s72_t80w64_s144((uint64_t)&v231, v86);
    v90 = v89;
    v91 = v88;
    v92 = v87;
    if (!v148)
    {
      -[UIView layer](v85, "layer");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "setValue:forKeyPath:", &unk_1E1A96060, CFSTR("filters.gaussianBlur.inputRadius"));

      -[UIView layer](v84, "layer");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "setValue:forKeyPath:", &unk_1E1A96070, CFSTR("filters.gaussianBlur.inputRadius"));

      -[UIView setAlpha:](v84, "setAlpha:", 0.0);
      v95 = v232;
      CGAffineTransformMakeScale(&v230, *(double *)&v232 / *(double *)&v242, 1.0);
      v229 = v230;
      -[UIView setTransform:](v84, "setTransform:", &v229);
      -[UIView setCenter:](obj, "setCenter:", v233);
      -[UIView setBounds:](obj, "setBounds:", v231, __PAIR128__(*((unint64_t *)&v232 + 1), v95));
      -[UIView layer](obj, "layer");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v228[0] = v236;
      v228[1] = v237;
      v228[2] = v238;
      v228[3] = v239;
      objc_msgSend(v96, "setCornerRadii:", v228);

      -[UIView setAlpha:](v90, "setAlpha:", 0.0);
      -[UIView setFrame:](v90, "setFrame:", v231, v232);
      -[UIView setFrame:](v91, "setFrame:", v231, v232);
      v224 = v236;
      v225 = v237;
      v226 = v238;
      v227 = v239;
      -[UIView layer](v90, "layer");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v223[0] = v224;
      v223[1] = v225;
      v223[2] = v226;
      v223[3] = v227;
      objc_msgSend(v97, "setCornerRadii:", v223);

      v219 = v236;
      v220 = v237;
      v221 = v238;
      v222 = v239;
      -[UIView layer](v91, "layer");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v218[0] = v219;
      v218[1] = v220;
      v218[2] = v221;
      v218[3] = v222;
      objc_msgSend(v98, "setCornerRadii:", v218);

      v99 = v234;
      -[UIView layer](v156, "layer");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "setPosition:", v99);

      -[UIView layer](v32, "layer");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "setPosition:", v99);

      -[_UIDuoShadowView setFrame:](v152, "setFrame:", v231, v232);
      -[_UIDuoShadowView setPrimaryShadow:]((uint64_t)v152, (void *)v235);
      -[_UIDuoShadowView setSecondaryShadow:]((uint64_t)v152, *((void **)&v235 + 1));
      v217[0] = v236;
      v217[1] = v237;
      v217[2] = v238;
      v217[3] = v239;
      -[_UIDuoShadowView setCornerRadii:]((id *)&v152->super.super.super.isa, v217);
    }
    -[UIView superview](v84, "superview");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "bringSubviewToFront:", v84);

    memset(&v216, 0, sizeof(v216));
    CGAffineTransformMakeScale(&v216, *(double *)&v242 / *(double *)&v232, 1.0);
    if (self->_isAnimatingEditModeAppearance)
      -[_UITabContainerView _finalizeEditingState](self, "_finalizeEditingState");
    currentRopeAnimation = self->_currentRopeAnimation;
    if (currentRopeAnimation)
      -[_UIRopeAnimation invalidate](currentRopeAnimation, "invalidate");
    v149 = objc_alloc_init(_UIRopeAnimation);
    v212[0] = MEMORY[0x1E0C809B0];
    v212[1] = 3221225472;
    v212[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_25;
    v212[3] = &unk_1E16B47A8;
    v104 = v138;
    v213 = v104;
    v214 = self;
    v215 = v145;
    v105 = _Block_copy(v212);
    v143 = v32;
    v106 = v92;
    v107 = MEMORY[0x1E0C809B0];
    v194[0] = MEMORY[0x1E0C809B0];
    v194[1] = 3254779904;
    v194[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_4;
    v194[3] = &unk_1E168B7E8;
    v194[4] = self;
    v210 = v151;
    v108 = v104;
    v109 = v85;
    v110 = v108;
    v195 = v108;
    v130 = obj;
    v196 = v130;
    obja = v84;
    v197 = obja;
    v137 = v109;
    v198 = v137;
    __copy_constructor_8_8_t0w64_s64_s72_t80w64_s144((uint64_t)v203, (id *)&v241);
    v204 = *(_OWORD *)&v216.a;
    v205 = *(_OWORD *)&v216.c;
    v111 = *MEMORY[0x1E0C9BAA8];
    v112 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v206 = *(_OWORD *)&v216.tx;
    v207 = v111;
    v139 = v111;
    v133 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v135 = v112;
    v208 = v112;
    v209 = v133;
    v113 = v152;
    v199 = v113;
    v114 = v90;
    v200 = v114;
    v115 = v91;
    v201 = v115;
    v211 = v151;
    v116 = v105;
    v202 = v116;
    -[_UIRopeAnimation addAnimation:](v149, "addAnimation:", v194);
    v170[0] = v107;
    v170[1] = 3254779904;
    v170[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_31;
    v170[3] = &unk_1E168B858;
    v153 = v106;
    v171 = v153;
    v172 = self;
    v192 = v151;
    v127 = v140;
    v173 = v127;
    v128 = v163;
    v174 = v128;
    v129 = v158;
    v175 = v129;
    __copy_constructor_8_8_t0w64_s64_s72_t80w64_s144((uint64_t)v186, v251);
    v144 = v143;
    v176 = v144;
    v117 = v110;
    v177 = v117;
    __copy_constructor_8_8_t0w64_s64_s72_t80w64_s144((uint64_t)v187, (id *)&v241);
    v131 = v130;
    v178 = v131;
    v118 = v113;
    v179 = v118;
    v159 = v114;
    v180 = v159;
    v164 = v115;
    v181 = v164;
    v141 = v156;
    v182 = v141;
    v157 = v137;
    v183 = v157;
    v188 = v216;
    v119 = obja;
    v184 = v119;
    v189 = v139;
    v190 = v135;
    v191 = v133;
    v193 = v151;
    v120 = v116;
    v185 = v120;
    -[_UIRopeAnimation addAnimation:](v149, "addAnimation:", v170);
    v121 = v118;
    +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.3);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v166[0] = MEMORY[0x1E0C809B0];
    v166[1] = 3221225472;
    v166[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_40;
    v166[3] = &unk_1E16E1318;
    objc_copyWeak(&v169, &location);
    v123 = v117;
    v167 = v123;
    v124 = v149;
    v168 = v124;
    -[_UIRopeAnimation beginUsingSpringBehavior:completion:](v124, "beginUsingSpringBehavior:completion:", v122, v166);
    v125 = self->_currentRopeAnimation;
    self->_currentRopeAnimation = v124;
    v126 = v124;

    objc_destroyWeak(&v169);
    v5 = v145;
  }
  else
  {
    -[_UITabContainerView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateContentLayoutForSidebarAppearanceWithTransitionCoordinator:", 0);

    -[_UITabBarControllerSidebarAnimator runAnimations](v5, "runAnimations");
    -[_UITabBarControllerSidebarAnimator runCompletions](v5, "runCompletions");
    transitionGroupCompletion = self->_transitionGroupCompletion;
    if (transitionGroupCompletion)
      -[_UIGroupCompletion completeImmediately](transitionGroupCompletion, "completeImmediately");
    else
      v165[2]();
  }

  objc_destroyWeak(&v276);
  objc_destroyWeak(&location);
}

- (void)updateEditModeAppearanceAnimated:(BOOL)a3
{
  void *v4;
  int v5;
  char v6;
  _BYTE *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _BOOL8 v16;
  char v17;
  void *v18;
  id v19;
  id v20;
  _BYTE *v21;
  _BOOL4 v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _UITabContainerView *v28;
  BOOL v29;
  char v30;
  char v31;

  v22 = a3;
  -[_UITabContainerView tabModel](self, "tabModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEditing");

  v6 = -[_UITabContainerView supportedComponent](self, "supportedComponent");
  -[_UITabContainerView outlineView](self, "outlineView");
  v7 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  -[_UITabContainerView floatingTabBar](self, "floatingTabBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v5 & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    v11 = -[_UITabContainerView _isShowingSidebar](self, "_isShowingSidebar");
    if (-[_UITabContainerView _isShowingSidebar](self, "_isShowingSidebar"))
    {
      v12 = 0;
      goto LABEL_6;
    }
  }
  v12 = v6 & 1;
LABEL_6:
  -[_UITabContainerView _configuredGroupCompletion](self, "_configuredGroupCompletion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "increment");
  self->_suppressesEditingInsetsChanges = 1;
  -[_UITabOutlineView tabModelEditingStateDidChange]((uint64_t)v7);
  objc_msgSend(v8, "tabModelEditingStateDidChange");
  if (v5)
  {
    -[_UITabOutlineView setEditing:animated:](v7, 1, v9 != 0);
    v14 = v8;
    v15 = 1;
    v16 = v10 != 0;
LABEL_12:
    objc_msgSend(v14, "setEditing:animated:", v15, v16);
    goto LABEL_13;
  }
  if (v11)
    -[_UITabOutlineView setEditing:animated:](v7, 0, 1);
  if (v12)
  {
    v14 = v8;
    v15 = 0;
    v16 = 1;
    goto LABEL_12;
  }
LABEL_13:
  -[_UITabContainerView _updateVisibleBarAnimated:requireLayout:updateDimmingView:](self, "_updateVisibleBarAnimated:requireLayout:updateDimmingView:", v22, 1, 1);
  if (!v9 && v11)
    objc_msgSend(v7, "setAlpha:", 0.0);
  v17 = v5;
  if (!v10 && ((v12 ^ 1) & 1) == 0)
    objc_msgSend(v8, "setAlpha:", 0.0);
  -[UIView bringSubviewToFront:](self, "bringSubviewToFront:", v8);
  self->_isAnimatingEditModeAppearance = 1;
  +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __56___UITabContainerView_updateEditModeAppearanceAnimated___block_invoke;
  v25[3] = &unk_1E16E1340;
  v29 = v11;
  v26 = v7;
  v27 = v8;
  v30 = v12;
  v31 = v17;
  v28 = self;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __56___UITabContainerView_updateEditModeAppearanceAnimated___block_invoke_2;
  v23[3] = &unk_1E16B2588;
  v24 = v13;
  v19 = v13;
  v20 = v8;
  v21 = v7;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v18, 0, v25, v23);

}

- (id)_configuredGroupCompletion
{
  _UIGroupCompletion *transitionGroupCompletion;
  _UIGroupCompletion *v4;
  _UIGroupCompletion *v5;
  _UIGroupCompletion *v6;
  _QWORD v8[4];
  id v9;
  id location;

  transitionGroupCompletion = self->_transitionGroupCompletion;
  if (!transitionGroupCompletion)
  {
    v4 = objc_alloc_init(_UIGroupCompletion);
    v5 = self->_transitionGroupCompletion;
    self->_transitionGroupCompletion = v4;

    objc_initWeak(&location, self);
    v6 = self->_transitionGroupCompletion;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49___UITabContainerView__configuredGroupCompletion__block_invoke;
    v8[3] = &unk_1E16B3F40;
    objc_copyWeak(&v9, &location);
    -[_UIGroupCompletion addNonIncrementingCompletion:](v6, "addNonIncrementingCompletion:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    transitionGroupCompletion = self->_transitionGroupCompletion;
  }
  return transitionGroupCompletion;
}

- (void)_finalizeEditingState
{
  void *v3;
  uint64_t v4;
  _BYTE *v5;
  id v6;

  if (self->_isAnimatingEditModeAppearance)
  {
    -[_UITabContainerView tabModel](self, "tabModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEditing");

    -[_UITabContainerView floatingTabBar](self, "floatingTabBar");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[_UITabContainerView outlineView](self, "outlineView");
    v5 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 1.0);
    objc_msgSend(v5, "setAlpha:", 1.0);
    objc_msgSend(v6, "setEditing:animated:", v4, 0);
    -[_UITabOutlineView setEditing:animated:](v5, v4, 0);
    self->_isAnimatingEditModeAppearance = 0;
    self->_suppressesEditingInsetsChanges = 0;

  }
}

- (void)_horizontalSizeClassDidChange
{
  _BOOL8 v3;
  void *v4;

  v3 = -[_UITabContainerView canShowFloatingUI](self, "canShowFloatingUI");
  -[_UITabContainerView floatingTabBar](self, "floatingTabBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowRecentItem:", v3);

  -[_UITabContainerView _updateVisibleBarAnimated:](self, "_updateVisibleBarAnimated:", 0);
}

- (void)_updateVisibleBarAnimated:(BOOL)a3
{
  -[_UITabContainerView _updateVisibleBarAnimated:requireLayout:updateDimmingView:](self, "_updateVisibleBarAnimated:requireLayout:updateDimmingView:", a3, 0, 1);
}

- (void)_updateVisibleBarAnimated:(BOOL)a3 requireLayout:(BOOL)a4 updateDimmingView:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v7;
  int64_t v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  __int128 v15;
  double v16;
  double v17;
  int v18;
  double v19;
  _BOOL4 v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _BOOL4 v25;
  double v26;
  double v27;
  int v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  _UITabSidebarTransitionAnimator *v36;
  uint64_t v37;
  _UITabSidebarTransitionAnimator *v38;
  _UITabBarControllerSidebarAnimator *v39;
  void *v40;
  _UITabSidebarTransitionAnimator *v41;
  _UITabBarControllerSidebarAnimator *v42;
  void *v43;
  void *v44;
  void *v45;
  _UITabBarControllerSidebarAnimator *v46;
  _BOOL4 v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  id v53;
  char v54;
  _QWORD v55[4];
  _UITabSidebarTransitionAnimator *v56;
  _UITabBarControllerSidebarAnimator *v57;
  _QWORD v58[5];
  _UITabSidebarTransitionAnimator *v59;
  _UITabBarControllerSidebarAnimator *v60;
  _QWORD v61[5];
  id v62;
  id v63;
  id v64[2];
  _QWORD aBlock[4];
  id v66;
  id v67;
  double v68;
  CGAffineTransform v69;
  CGAffineTransform v70;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v73;
  CGAffineTransform v74;
  _QWORD v75[5];
  id v76;
  id v77;
  BOOL v78;
  BOOL v79;
  BOOL v80;

  v5 = a5;
  v7 = a3;
  if (-[_UITabContainerView _hasActiveMorphTransition](self, "_hasActiveMorphTransition"))
  {
    if (v7)
      -[_UITabContainerView _updateSidebarAppearanceForMorphTransitionAnimated:](self, "_updateSidebarAppearanceForMorphTransitionAnimated:", 1);
  }
  else
  {
    v47 = v5;
    v9 = -[_UITabContainerView _currentVisibleComponents](self, "_currentVisibleComponents");
    v10 = -[_UITabContainerView _isTabBarHidden](self, "_isTabBarHidden");
    -[_UITabContainerView outlineView](self, "outlineView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITabContainerView floatingTabBar](self, "floatingTabBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = self->_alongsideAnimator;
    v75[0] = MEMORY[0x1E0C809B0];
    v75[1] = 3221225472;
    v75[2] = __81___UITabContainerView__updateVisibleBarAnimated_requireLayout_updateDimmingView___block_invoke;
    v75[3] = &unk_1E16E1340;
    v75[4] = self;
    v78 = v7 || a4;
    v79 = (v9 & 4) != 0;
    v13 = v11;
    v76 = v13;
    v80 = (v9 & 2) != 0;
    v14 = v12;
    v77 = v14;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v75);
    v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v74.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v74.c = v15;
    *(_OWORD *)&v74.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&v73.a = *(_OWORD *)&v74.a;
    *(_OWORD *)&v73.c = v15;
    *(_OWORD *)&v73.tx = *(_OWORD *)&v74.tx;
    if ((v9 & 4) == 0 && v10)
    {
      -[_UITabContainerView _currentSidebarWidth](self, "_currentSidebarWidth");
      v17 = v16;
      v18 = objc_msgSend(v13, "_shouldReverseLayoutDirection");
      v19 = -v17;
      if (v18)
        v19 = v17;
      CGAffineTransformMakeTranslation(&v74, v19, 0.0);
    }
    v20 = (v9 & 2) == 0 && v10;
    v21 = 1.0;
    if (v20)
    {
      -[UIView bounds](self, "bounds");
      objc_msgSend(v14, "sizeThatFits:", v22, v23);
      v21 = 0.0;
      CGAffineTransformMakeTranslation(&v73, 0.0, -v24);
    }
    if (v13)
      objc_msgSend(v13, "transform");
    else
      memset(&t1, 0, sizeof(t1));
    t2 = v74;
    v25 = CGAffineTransformEqualToTransform(&t1, &t2);
    objc_msgSend(v14, "alpha");
    v27 = v26;
    if (-[_UITabContainerView canShowFloatingUI](self, "canShowFloatingUI"))
      v28 = v27 != v21 || !v25;
    else
      v28 = 0;
    if (v27 != v21)
    {
      -[_UITabContainerView floatingTabBarHost](self, "floatingTabBarHost");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "tabBarContainerWillChangeFloatingTabBarVisibility:", self);

    }
    v30 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __81___UITabContainerView__updateVisibleBarAnimated_requireLayout_updateDimmingView___block_invoke_2;
    aBlock[3] = &unk_1E16E1368;
    v31 = v14;
    v66 = v31;
    v68 = v21;
    v69 = v73;
    v32 = v13;
    v67 = v32;
    v70 = v74;
    v48 = _Block_copy(aBlock);
    objc_initWeak((id *)&t2, self);
    v61[0] = v30;
    v61[1] = 3221225472;
    v61[2] = __81___UITabContainerView__updateVisibleBarAnimated_requireLayout_updateDimmingView___block_invoke_3;
    v61[3] = &unk_1E16E1390;
    objc_copyWeak(v64, (id *)&t2);
    v61[4] = self;
    v64[1] = (id)v9;
    v33 = v31;
    v62 = v33;
    v34 = v32;
    v63 = v34;
    v35 = _Block_copy(v61);
    v36 = 0;
    if (v7 && v28)
      v36 = -[_UITabSidebarTransitionAnimator initWithContainerView:duration:]([_UITabSidebarTransitionAnimator alloc], "initWithContainerView:duration:", self, 0.5);
    v45 = v33;
    v37 = MEMORY[0x1E0C809B0];
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __81___UITabContainerView__updateVisibleBarAnimated_requireLayout_updateDimmingView___block_invoke_4;
    v58[3] = &unk_1E16B47A8;
    v58[4] = self;
    v38 = v36;
    v59 = v38;
    v39 = v46;
    v60 = v39;
    v40 = _Block_copy(v58);
    v55[0] = v37;
    v55[1] = 3221225472;
    v55[2] = __81___UITabContainerView__updateVisibleBarAnimated_requireLayout_updateDimmingView___block_invoke_5;
    v55[3] = &unk_1E16B2218;
    v41 = v38;
    v56 = v41;
    v42 = v39;
    v57 = v42;
    v43 = _Block_copy(v55);
    if (v47)
      -[_UITabContainerView updateDimmingViewAnimated:](self, "updateDimmingViewAnimated:", v7, v45);
    if (v7)
    {
      +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.35);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v44, 0, v48, v35);
      if (v28)
        +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v40, v43, 0.5, 0.0, 1.0, 0.0);
    }
    else
    {
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __81___UITabContainerView__updateVisibleBarAnimated_requireLayout_updateDimmingView___block_invoke_6;
      v49[3] = &unk_1E16E13B8;
      v50 = v48;
      v54 = v28;
      v51 = v40;
      v52 = v43;
      v53 = v35;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v49);

      v44 = v50;
    }

    objc_destroyWeak(v64);
    objc_destroyWeak((id *)&t2);

  }
}

- (int64_t)_currentVisibleComponents
{
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  char v8;
  char v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  BOOL v14;
  int v15;
  char v16;
  int v17;
  int64_t v18;

  v3 = -[_UITabContainerView _isTabBarHidden](self, "_isTabBarHidden");
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "horizontalSizeClass");

  -[_UITabContainerView tabModel](self, "tabModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEditing");

  v8 = -[_UITabContainerView supportedComponent](self, "supportedComponent");
  v9 = -[_UITabContainerView supportedComponent](self, "supportedComponent");
  -[_UITabContainerView sidebar](self, "sidebar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isHidden");
  if ((v9 & 2) != 0)
    v12 = v11;
  else
    v12 = 1;

  v13 = 0;
  if (v5 == 2 && v7 | v12 ^ 1)
    v13 = (LOBYTE(self->_availableComponent) >> 1) & 1;
  v14 = (v8 & 1) != 0 && v5 == 2;
  v15 = !v14;
  if (v14)
    v16 = v7;
  else
    v16 = 1;
  v17 = v15 ^ 1;
  if ((v16 & 1) == 0)
    v17 = v12 & ~v3;
  if (v17)
    v18 = (v5 != 2) & ~v3 | 2;
  else
    v18 = (v5 != 2) & ~v3;
  if (v13)
    return v18 | 4;
  else
    return v18;
}

- (BOOL)_showsOverlaySidebarButton
{
  void *v3;
  char isSidebarSupportedAnd;

  if (!-[_UITabContainerView wantsOverlaySidebarButton](self, "wantsOverlaySidebarButton")
    || !-[_UITabContainerView _isTabBarHidden](self, "_isTabBarHidden"))
  {
    return 0;
  }
  if (!self->_suppressTabBar)
    return 1;
  -[_UITabContainerView sidebar](self, "sidebar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isSidebarSupportedAnd = -[UITabBarControllerSidebar _isSidebarSupportedAndVisible](v3);

  return isSidebarSupportedAnd;
}

- (void)_updateOverlaySidebarButtonFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;
  double MaxX;
  CGRect v14;
  CGRect v15;

  -[UIButton intrinsicContentSize](self->_overlaySidebarButton, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  -[_UITabContainerView _floatingTabBarFittingHeight](self, "_floatingTabBarFittingHeight");
  v8 = v7;
  -[UIView safeAreaInsets](self, "safeAreaInsets");
  v10 = round(v9 + (v8 - v6) * 0.5);
  v11 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v12 = 12.0;
  if (v11)
  {
    -[UIView bounds](self, "bounds", 12.0);
    MaxX = CGRectGetMaxX(v14);
    v15.origin.x = 0.0;
    v15.origin.y = v10;
    v15.size.width = v4;
    v15.size.height = v6;
    v12 = MaxX - CGRectGetWidth(v15) + -12.0;
  }
  -[UIButton setFrame:](self->_overlaySidebarButton, "setFrame:", v12, v10, v4, v6);
}

- (void)_updateOverlaySidebarButtonTintColor
{
  void *v3;
  int isSidebarSupportedAnd;
  id v5;

  -[_UITabContainerView sidebar](self, "sidebar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isSidebarSupportedAnd = -[UITabBarControllerSidebar _isSidebarSupportedAndVisible](v3);

  if (isSidebarSupportedAnd)
  {
    -[UIButton setTintColor:](self->_overlaySidebarButton, "setTintColor:", 0);
  }
  else
  {
    -[_UITabContainerView overlaySidebarButtonTintColor](self, "overlaySidebarButtonTintColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](self->_overlaySidebarButton, "setTintColor:", v5);

  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;

  -[_UITabContainerView tabModel](self, "tabModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEditing");

  if (v5)
  {
    -[_UITabContainerView floatingTabBar](self, "floatingTabBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "hasActiveDrag") & 1) != 0)
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      -[_UITabContainerView sidebar](self, "sidebar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_outlineView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[_UITabOutlineView hasActiveDrag](v9) ^ 1;

    }
  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (void)_handleDimmingViewTap:(id)a3
{
  void *v4;
  int v5;
  id v6;

  -[_UITabContainerView tabModel](self, "tabModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEditing");

  if (v5)
  {
    -[_UITabContainerView tabModel](self, "tabModel");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEditing:", 0);
  }
  else
  {
    -[_UITabContainerView sidebar](self, "sidebar");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UITabBarControllerSidebar _setHidden:userInitiated:]((uint64_t)v6, 1, 1);
  }

}

- (void)updateDimmingViewAnimated:(BOOL)a3
{
  void *v4;
  int v5;
  int64_t v6;
  void *v7;
  int isSidebarSupportedAnd;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  double v13;
  char v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  _QWORD v21[4];
  id v22;
  char v23;
  _QWORD v24[4];
  id v25;
  double v26;

  -[_UITabContainerView tabModel](self, "tabModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEditing");

  v6 = -[_UITabContainerView sidebarLayout](self, "sidebarLayout");
  -[_UITabContainerView sidebar](self, "sidebar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isSidebarSupportedAnd = -[UITabBarControllerSidebar _isSidebarSupportedAndVisible](v7);

  -[UIView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "horizontalSizeClass");

  if (v10 == 2 && (v6 == 2 ? (v11 = isSidebarSupportedAnd) : (v11 = 0), ((v5 | v11) & 1) != 0))
  {
    -[_UITabContainerView _dimmingView](self, "_dimmingView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 1.0;
    v14 = 1;
    v15 = 0.0;
  }
  else
  {
    -[UIView superview](self->_dimmingView, "superview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      return;
    -[_UITabContainerView _dimmingView](self, "_dimmingView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v13 = 0.0;
    v15 = 1.0;
  }
  objc_msgSend(v12, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(v12, "setAlpha:", v15);
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v12, 0);
  }
  +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __49___UITabContainerView_updateDimmingViewAnimated___block_invoke;
  v24[3] = &unk_1E16B1888;
  v25 = v12;
  v26 = v13;
  v21[0] = v19;
  v21[1] = 3221225472;
  v21[2] = __49___UITabContainerView_updateDimmingViewAnimated___block_invoke_2;
  v21[3] = &unk_1E16E13E0;
  v23 = v14;
  v22 = v25;
  v20 = v25;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v18, 0, v24, v21);

}

- (UIView)_dimmingView
{
  UIView *dimmingView;
  UIView *v4;
  UIView *v5;
  void *v6;
  UIView *v7;
  UIView *v8;
  UITapGestureRecognizer *v9;
  UIDropInteraction *v10;

  dimmingView = self->_dimmingView;
  if (!dimmingView)
  {
    v4 = [UIView alloc];
    -[UIView bounds](self, "bounds");
    v5 = -[UIView initWithFrame:](v4, "initWithFrame:");
    -[UIView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
    +[UIColor _dimmingViewColor](UIColor, "_dimmingViewColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v7 = self->_dimmingView;
    self->_dimmingView = v5;
    v8 = v5;

    v9 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleDimmingViewTap_);
    -[UIGestureRecognizer setDelegate:](v9, "setDelegate:", self);
    -[UIView addGestureRecognizer:](v8, "addGestureRecognizer:", v9);
    v10 = -[UIDropInteraction initWithDelegate:]([UIDropInteraction alloc], "initWithDelegate:", self);
    -[UIView addInteraction:](v8, "addInteraction:", v10);

    dimmingView = self->_dimmingView;
  }
  return dimmingView;
}

- (id)preferredFocusEnvironments
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[_UITabContainerView outlineView](self, "outlineView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UITabContainerView outlineView](self, "outlineView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  -[_UITabContainerView floatingTabBar](self, "floatingTabBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_UITabContainerView floatingTabBar](self, "floatingTabBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  -[_UITabContainerView tabBar](self, "tabBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_UITabContainerView tabBar](self, "tabBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

  }
  return v3;
}

- (id)resolvedPopoverPresentationControllerSourceItemForTab:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[_UITabContainerView tabBar](self, "tabBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[_UITabContainerView outlineView](self, "outlineView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[_UITabContainerView outlineView](self, "outlineView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[_UITabContainerView floatingTabBar](self, "floatingTabBar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "window");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        v13 = 0;
        goto LABEL_11;
      }
      -[_UITabContainerView floatingTabBar](self, "floatingTabBar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v9;
    v10 = v4;
    goto LABEL_10;
  }
  objc_msgSend(v4, "_parentGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "_parentGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self;
    v10 = v8;
LABEL_10:
    objc_msgSend(v9, "resolvedPopoverPresentationControllerSourceItemForTab:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  objc_msgSend(v4, "_resolvedTabBarItemSourceItemForPopoverPresentationControllerSourceItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v13;
}

- (void)outlineView:(id)a3 didSelectTab:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  -[_UITabContainerView tabModel](self, "tabModel", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEditing");

  if ((v6 & 1) == 0)
  {
    -[UIView superview](self->_dimmingView, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[_UITabContainerView sidebar](self, "sidebar");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[UITabBarControllerSidebar _setHidden:userInitiated:]((uint64_t)v8, 1, 0);

    }
  }
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;

  v5 = a4;
  -[_UITabContainerView tabModel](self, "tabModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEditing");

  if (v7)
  {
    objc_msgSend(v5, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count") == 1)
    {
      objc_msgSend(v9, "localObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(v9, "localObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "previewProvider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {

      }
      else
      {
        -[_UITabContainerView outlineView](self, "outlineView");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
          v16 = *(void **)(v14 + 488);
        else
          v16 = 0;
        v17 = v16;
        objc_msgSend(v5, "localDragSession");
        v18 = (id)objc_claimAutoreleasedReturnValue();

        if (v17 == v18)
        {
          -[UIView traitCollection](self, "traitCollection");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "userInterfaceStyle");

          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __55___UITabContainerView_dropInteraction_sessionDidEnter___block_invoke;
          v21[3] = &unk_1E16E1408;
          v22 = v10;
          v23 = v20;
          objc_msgSend(v9, "setPreviewProvider:", v21);

        }
      }
    }

    goto LABEL_11;
  }
LABEL_12:

}

- (UIButton)_overlaySidebarButton
{
  return self->_overlaySidebarButton;
}

- (_UITabContainerViewDelegate)delegate
{
  return (_UITabContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UITabModel)tabModel
{
  return self->_tabModel;
}

- (UITabBarControllerSidebar)sidebar
{
  return (UITabBarControllerSidebar *)objc_loadWeakRetained((id *)&self->_sidebar);
}

- (int64_t)sidebarLayout
{
  return self->_sidebarLayout;
}

- (int64_t)supportedComponent
{
  return self->_supportedComponent;
}

- (int64_t)availableComponent
{
  return self->_availableComponent;
}

- (UIColor)overlaySidebarButtonTintColor
{
  return (UIColor *)objc_loadWeakRetained((id *)&self->_overlaySidebarButtonTintColor);
}

- (UIAction)overrideTidebarButtonAction
{
  return self->_overrideTidebarButtonAction;
}

- (_UITabContainerViewFloatingTabBarHost)floatingTabBarHost
{
  return (_UITabContainerViewFloatingTabBarHost *)objc_loadWeakRetained((id *)&self->_floatingTabBarHost);
}

- (void)setFloatingTabBarHost:(id)a3
{
  objc_storeWeak((id *)&self->_floatingTabBarHost, a3);
}

- (BOOL)suppressTabBar
{
  return self->_suppressTabBar;
}

- (UIBarButtonItem)sidebarPlaceholder
{
  return self->_sidebarPlaceholder;
}

- (BOOL)wantsOverlaySidebarButton
{
  return self->_wantsOverlaySidebarButton;
}

- (void)setWantsOverlaySidebarButton:(BOOL)a3
{
  self->_wantsOverlaySidebarButton = a3;
}

- (UITabBar)tabBar
{
  return self->_tabBar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabBar, 0);
  objc_storeStrong((id *)&self->_sidebarPlaceholder, 0);
  objc_destroyWeak((id *)&self->_floatingTabBarHost);
  objc_storeStrong((id *)&self->_overrideTidebarButtonAction, 0);
  objc_destroyWeak((id *)&self->_overlaySidebarButtonTintColor);
  objc_destroyWeak((id *)&self->_sidebar);
  objc_storeStrong((id *)&self->_tabModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_floatingTabBar, 0);
  objc_storeStrong((id *)&self->_overlaySidebarButton, 0);
  objc_storeStrong((id *)&self->_sidebarToggleAction, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_alongsideAnimator, 0);
  objc_storeStrong((id *)&self->_currentRopeAnimation, 0);
  objc_storeStrong((id *)&self->_transitionGroupCompletion, 0);
  objc_storeStrong((id *)&self->_shadowTransitionView, 0);
  objc_storeStrong((id *)&self->_tabBarTransitionView, 0);
  objc_storeStrong((id *)&self->_outlineTransitionView, 0);
  objc_storeStrong((id *)&self->_tabBarTransitionBackgroundView, 0);
  objc_storeStrong((id *)&self->_outlineTransitionBackgroundView, 0);
  objc_storeStrong((id *)&self->_transitionContainerView, 0);
}

@end
