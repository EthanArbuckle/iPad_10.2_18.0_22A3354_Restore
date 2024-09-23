@implementation UISplitViewController

- (void)viewWillLayoutSubviews
{
  -[UISplitViewControllerImpl viewWillLayoutSubviews](self->_impl, "viewWillLayoutSubviews");
}

- (void)viewDidLayoutSubviews
{
  -[UISplitViewControllerImpl viewDidLayoutSubviews](self->_impl, "viewDidLayoutSubviews");
}

- (id)_traitOverridesForChildViewController:(id)a3
{
  return (id)-[UISplitViewControllerImpl _traitCollectionForChildEnvironment:](self->_impl, "_traitCollectionForChildEnvironment:", a3);
}

- (void)_marginInfoForChild:(id)a3 leftMargin:(double *)a4 rightMargin:(double *)a5
{
  -[UISplitViewControllerImpl _marginInfoForChild:leftMargin:rightMargin:](self->_impl, "_marginInfoForChild:leftMargin:rightMargin:", a3, a4, a5);
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  -[UISplitViewControllerImpl _edgeInsetsForChildViewController:insetsAreAbsolute:](self->_impl, "_edgeInsetsForChildViewController:insetsAreAbsolute:", a3, a4);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (double)_contentMarginForChildViewController:(id)a3
{
  double result;

  -[UISplitViewControllerImpl _contentMarginForChildViewController:](self->_impl, "_contentMarginForChildViewController:", a3);
  return result;
}

- (id)_contentOrObservableScrollViewForEdge:(unint64_t)a3
{
  return -[UIViewController _contentOrObservableScrollViewInContainerForEdge:](self, a3);
}

- (void)_updateChildContentMargins
{
  -[UISplitViewControllerImpl _updateChildContentMargins](self->_impl, "_updateChildContentMargins");
}

- (void)loadView
{
  -[UISplitViewControllerImpl loadView](self->_impl, "loadView");
}

- (void)traitCollectionDidChange:(id)a3
{
  -[UISplitViewControllerImpl traitCollectionDidChange:](self->_impl, "traitCollectionDidChange:", a3);
  -[UISplitViewController _updateScrollEdgeBehaviorForDetailNavigationContoller](self, "_updateScrollEdgeBehaviorForDetailNavigationContoller");
}

- (int64_t)_preferredModalPresentationStyle
{
  if (!self)
    return 4;
  if (!dyld_program_sdk_at_least())
    return 4;
  if (-[UISplitViewControllerImpl style](self->_impl, "style"))
    return 2;
  return 4;
}

- (id)delegate
{
  return (id)-[UISplitViewControllerImpl delegate](self->_impl, "delegate");
}

- (unint64_t)supportedInterfaceOrientations
{
  return -[UISplitViewControllerImpl supportedInterfaceOrientations](self->_impl, "supportedInterfaceOrientations");
}

- (unint64_t)_super_supportedInterfaceOrientations
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISplitViewController;
  return -[UIViewController supportedInterfaceOrientations](&v3, sel_supportedInterfaceOrientations);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UISplitViewController;
  -[UIViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  -[UISplitViewControllerImpl viewWillAppear:](self->_impl, "viewWillAppear:", v3);
  -[UISplitViewController _updateScrollEdgeBehaviorForDetailNavigationContoller](self, "_updateScrollEdgeBehaviorForDetailNavigationContoller");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UISplitViewController;
  -[UIViewController viewDidAppear:](&v5, sel_viewDidAppear_);
  -[UISplitViewControllerImpl viewDidAppear:](self->_impl, "viewDidAppear:", v3);
}

- (void)setDefinesPresentationContext:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  -[UIViewController setDefinesPresentationContext:](&v9, sel_setDefinesPresentationContext_, v3);
}

- (BOOL)_isSplitViewController
{
  return 1;
}

- (id)childViewControllerForStatusBarStyle
{
  return (id)-[UISplitViewControllerImpl childViewControllerForStatusBarStyle](self->_impl, "childViewControllerForStatusBarStyle");
}

- (int64_t)preferredCenterStatusBarStyle
{
  return -[UISplitViewControllerImpl preferredCenterStatusBarStyle](self->_impl, "preferredCenterStatusBarStyle");
}

- (UISplitViewControllerPrimaryEdge)primaryEdge
{
  return -[UISplitViewControllerImpl primaryEdge](self->_impl, "primaryEdge");
}

- (void)setDelegate:(id)delegate
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = delegate;
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v7);

  }
  -[UISplitViewControllerImpl setDelegate:](self->_impl, "setDelegate:", v8);

}

- (UISplitViewControllerStyle)style
{
  return -[UISplitViewControllerImpl style](self->_impl, "style");
}

void __60__UISplitViewController__devicePrefersOverlayInRegularWidth__block_invoke()
{
  id v0;

  +[UIScreen _embeddedScreen](UIScreen, "_embeddedScreen");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1ECD7C5B9 = _UIScreenIsPhyiscallyLargePhone(objc_msgSend(v0, "_screenType"));

}

- (unint64_t)preferredScreenEdgesDeferringSystemGestures
{
  return -[UISplitViewControllerImpl preferredScreenEdgesDeferringSystemGestures](self->_impl, "preferredScreenEdgesDeferringSystemGestures");
}

- (unint64_t)_super_preferredScreenEdgesDeferringSystemGestures
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISplitViewController;
  return -[UIViewController preferredScreenEdgesDeferringSystemGestures](&v3, sel_preferredScreenEdgesDeferringSystemGestures);
}

- (void)_updateLayoutForStatusBarAndInterfaceOrientation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISplitViewController;
  -[UIViewController _updateLayoutForStatusBarAndInterfaceOrientation](&v3, sel__updateLayoutForStatusBarAndInterfaceOrientation);
  -[UISplitViewControllerImpl _updateLayoutForStatusBarAndInterfaceOrientation](self->_impl, "_updateLayoutForStatusBarAndInterfaceOrientation");
}

- (void)removeChildViewController:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v5 = a3;
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UISplitViewControllerImpl removeChildViewController:](self->_impl, "removeChildViewController:", v5);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UISplitViewController;
    -[UIViewController removeChildViewController:](&v9, sel_removeChildViewController_, v5);
  }

}

- (void)_navigationControllerDidUpdateStack:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[UISplitViewControllerImpl style](self->_impl, "style"))
  {
    -[UISplitViewController _panelImpl](self, "_panelImpl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_navigationControllerDidUpdateStack:", v5);

  }
}

- (BOOL)_isViewControllerForObservableScrollViewAmbiguous
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "_isViewControllerForObservableScrollViewAmbiguous");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UISplitViewController;
    v5 = -[UIViewController _isViewControllerForObservableScrollViewAmbiguous](&v8, sel__isViewControllerForObservableScrollViewAmbiguous);
  }
  v6 = v5;

  return v6;
}

- (_UISplitViewControllerStyle)_styleProvider
{
  return self->_styleProvider;
}

- (UIViewController)viewControllerForColumn:(UISplitViewControllerColumn)column
{
  void *v5;
  void *v6;

  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerForColumn:", column);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v6;
}

- (id)_panelImpl
{
  UISplitViewControllerImpl *impl;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    impl = self->_impl;
  else
    impl = 0;
  return impl;
}

- (BOOL)presentsWithGesture
{
  return -[UISplitViewControllerImpl presentsWithGesture](self->_impl, "presentsWithGesture");
}

- (int64_t)preferredTrailingStatusBarStyle
{
  return -[UISplitViewControllerImpl preferredTrailingStatusBarStyle](self->_impl, "preferredTrailingStatusBarStyle");
}

- (BOOL)_shouldUseSeparateStatusBarStyles
{
  BOOL v3;
  void *v4;

  if ((_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_UISplitViewAutomaticStatusBarStyleSeparationMode, (uint64_t)CFSTR("UISplitViewAutomaticStatusBarStyleSeparationMode"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger) & 1) != 0|| !qword_1ECD76090)
  {
    if (!-[UISplitViewController _shouldUseNewStatusBarBehavior](self, "_shouldUseNewStatusBarBehavior"))
      return 0;
  }
  else if (qword_1ECD76090 < 1)
  {
    return 0;
  }
  if (-[UISplitViewController isCollapsed](self, "isCollapsed"))
    return 0;
  if (-[UISplitViewControllerImpl style](self->_impl, "style"))
    return 1;
  -[UISplitViewController viewControllers](self, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "count") == 2;

  return v3;
}

- (BOOL)isCollapsed
{
  return -[UISplitViewControllerImpl isCollapsed](self->_impl, "isCollapsed");
}

- (BOOL)_shouldUseNewStatusBarBehavior
{
  return dyld_program_sdk_at_least();
}

- (BOOL)_isCollapsed
{
  return -[UISplitViewControllerImpl _isCollapsed](self->_impl, "_isCollapsed");
}

- (int64_t)preferredLeadingStatusBarStyle
{
  return -[UISplitViewControllerImpl preferredLeadingStatusBarStyle](self->_impl, "preferredLeadingStatusBarStyle");
}

- (id)_viewControllerForObservableScrollView
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v9;
  objc_super v10;

  if (-[UIViewController _shouldRequestViewControllerForObservableScrollViewFromPresentedViewController](self))
  {
    v10.receiver = self;
    v10.super_class = (Class)UISplitViewController;
    -[UIViewController _viewControllerForObservableScrollView](&v10, sel__viewControllerForObservableScrollView);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UISplitViewController _panelImpl](self, "_panelImpl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_viewControllerForObservableScrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)UISplitViewController;
      -[UIViewController _viewControllerForObservableScrollView](&v9, sel__viewControllerForObservableScrollView);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

    return v8;
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UISplitViewController;
  -[UIViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  -[UISplitViewControllerImpl viewWillDisappear:](self->_impl, "viewWillDisappear:", v3);
}

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)CFSTR("UISplitViewController");
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UISplitViewControllerImpl preferredContentSizeDidChangeForChildContentContainer:](self->_impl, "preferredContentSizeDidChangeForChildContentContainer:", v4);

}

- (BOOL)_disableAutomaticKeyboardBehavior
{
  return -[UISplitViewControllerImpl _disableAutomaticKeyboardBehavior](self->_impl, "_disableAutomaticKeyboardBehavior");
}

- (void)_didChangeToFirstResponder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISplitViewController;
  v4 = a3;
  -[UIResponder _didChangeToFirstResponder:](&v5, sel__didChangeToFirstResponder_, v4);
  -[UISplitViewControllerImpl _didChangeToFirstResponder:](self->_impl, "_didChangeToFirstResponder:", v4, v5.receiver, v5.super_class);

}

- (BOOL)_super_disableAutomaticKeyboardBehavior
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISplitViewController;
  return -[UIResponder _disableAutomaticKeyboardBehavior](&v3, sel__disableAutomaticKeyboardBehavior);
}

- (BOOL)_shouldPersistViewWhenCoding
{
  return -[UISplitViewControllerImpl _shouldPersistViewWhenCoding](self->_impl, "_shouldPersistViewWhenCoding");
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  -[UISplitViewControllerImpl willTransitionToTraitCollection:withTransitionCoordinator:](self->_impl, "willTransitionToTraitCollection:withTransitionCoordinator:", a3, a4);
}

void __55__UISplitViewController__commonInitForcingColumnStyle___block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  if ((dyld_program_sdk_at_least() & 1) == 0)
    _MergedGlobals_15 = 1;
  _UIMainBundleIdentifier();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Preferences")))
    _MergedGlobals_15 = 1;
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.mobilenotes")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.DocumentManagerUICore.Service")) & 1) != 0
    || objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.DocumentsApp")))
  {
    _MergedGlobals_15 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("_UISplitViewControllerUseSlidingBars"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_variant_has_internal_diagnostics() && v1 && objc_msgSend(v1, "BOOLValue"))
    _MergedGlobals_15 = 0;

}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISplitViewController;
  -[UISplitViewController description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (os_variant_has_internal_diagnostics())
    objc_msgSend(v4, "appendFormat:", CFSTR(" impl=%p"), self->_impl);
  return (NSString *)v4;
}

- (void)setViewController:(UIViewController *)vc forColumn:(UISplitViewControllerColumn)column
{
  UIViewController *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v7 = vc;
  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  if (column != UISplitViewControllerColumnCompact
    || (-[UISplitViewController _panelImpl](self, "_panelImpl"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "inCollapsingToProposedTopColumnCallback"),
        v8,
        (v9 & 1) == 0))
  {
    if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
    {
      v10 = (void *)MEMORY[0x1E0C99DA0];
      v11 = *MEMORY[0x1E0C99778];
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "raise:format:", v11, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v12);

    }
  }
  if (v7
    && (unint64_t)(column - 2) >= 2
    && column
    && (column != UISplitViewControllerColumnSupplementary
     || -[UISplitViewControllerImpl style](self->_impl, "style") != 2))
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99768];
    _UISplitViewControllerColumnDescription(column);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(-[UISplitViewControllerImpl style](self->_impl, "style"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "raise:format:", v14, CFSTR("Non-nil view controller not accepted for %@ column in %@ UISplitViewController"), v15, v16);

  }
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setViewController:forColumn:", v7, column);

}

- (void)addChildViewController:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v5 = a3;
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  -[UIViewController addChildViewController:](&v9, sel_addChildViewController_, v5);
  -[UISplitViewController _updateScrollEdgeBehaviorForDetailNavigationContoller](self, "_updateScrollEdgeBehaviorForDetailNavigationContoller");

}

- (void)_updateScrollEdgeBehaviorForDetailNavigationContoller
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  id v9;

  -[UISplitViewController masterViewController](self, "masterViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[UISplitViewController detailViewController](self, "detailViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v9, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "prefersLargeTitles");

  -[UISplitViewController detailViewController](self, "detailViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_6:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_11;
  }
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (_UIBarAppearanceAPIVersion() >= 1 && (_UIBarsApplyChromelessEverywhere() & 1) == 0)
  {
    -[UIViewController traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "verticalSizeClass") != 1;

    objc_msgSend(v6, "_setForceScrollEdgeAppearance:", v8);
  }

LABEL_11:
}

- (id)masterViewController
{
  return (id)-[UISplitViewControllerImpl masterViewController](self->_impl, "masterViewController");
}

- (id)detailViewController
{
  return (id)-[UISplitViewControllerImpl detailViewController](self->_impl, "detailViewController");
}

- (void)_super_removeChildViewController:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISplitViewController;
  -[UIViewController removeChildViewController:](&v3, sel_removeChildViewController_, a3);
}

- (void)_viewControllerChildViewControllersDidChange:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[UISplitViewControllerImpl style](self->_impl, "style"))
  {
    -[UISplitViewController _panelImpl](self, "_panelImpl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_viewControllerChildViewControllersDidChange:", v5);

  }
}

- (BOOL)_wrapsNavigationController:(id *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UISplitViewController;
  return -[UIViewController _wrapsNavigationController:](&v4, sel__wrapsNavigationController_, a3);
}

- (void)_super_willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UISplitViewController;
  -[UIViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v4, sel_willTransitionToTraitCollection_withTransitionCoordinator_, a3, a4);
}

- (CGFloat)minimumPrimaryColumnWidth
{
  CGFloat result;

  -[UISplitViewControllerImpl minimumPrimaryColumnWidth](self->_impl, "minimumPrimaryColumnWidth");
  return result;
}

- (void)setPresentsWithGesture:(BOOL)presentsWithGesture
{
  -[UISplitViewControllerImpl setPresentsWithGesture:](self->_impl, "setPresentsWithGesture:", presentsWithGesture);
}

- (UISplitViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  UISplitViewController *v5;
  UISplitViewController *v6;
  uint64_t v7;
  void *v8;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UISplitViewController;
  v5 = -[UIViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, nibNameOrNil, nibBundleOrNil);
  v6 = v5;
  if (v5)
  {
    v7 = -[UISplitViewController _shouldInitializeColumnStyle](v5, "_shouldInitializeColumnStyle");
    -[UISplitViewController _commonInitForcingColumnStyle:](v6, "_commonInitForcingColumnStyle:", v7);
    if ((_DWORD)v7)
    {
      -[UISplitViewController _panelImpl](v6, "_panelImpl");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("UISplitViewController.m"), 176, CFSTR("Wrong implementation class for column-style UISplitViewController support"));

      }
      objc_msgSend(v8, "setStyle:", 1);

    }
  }
  return v6;
}

- (BOOL)_shouldInitializeColumnStyle
{
  return 0;
}

- (UISplitViewController)initWithStyle:(UISplitViewControllerStyle)style
{
  UISplitViewController *v6;
  UISplitViewController *v7;
  void *v8;
  void *v10;
  void *v11;
  objc_super v12;

  if (style == UISplitViewControllerStyleUnspecified)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewController.m"), 208, CFSTR("API misuse. -initWithStyle: may not be used with UISplitViewControllerStyleUnspecified"));

  }
  v12.receiver = self;
  v12.super_class = (Class)UISplitViewController;
  v6 = -[UIViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    -[UISplitViewController _commonInitForcingColumnStyle:](v6, "_commonInitForcingColumnStyle:", 1);
    -[UISplitViewController _panelImpl](v7, "_panelImpl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("UISplitViewController.m"), 213, CFSTR("Wrong implementation class for column-style UISplitViewController support"));

    }
    objc_msgSend(v8, "setStyle:", style);

  }
  return v7;
}

- (void)_commonInitForcingColumnStyle:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_class *v11;
  _UISplitViewControllerStyle *v12;
  _UISplitViewControllerStyle *styleProvider;
  UISplitViewControllerImpl *v14;
  UISplitViewControllerImpl *impl;
  id v16;

  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (!v5)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("UISplitViewController is only supported when running under UIUserInterfaceIdiomPad"));
  }
  if (qword_1ECD7C5C0 != -1)
    dispatch_once(&qword_1ECD7C5C0, &__block_literal_global_138);
  objc_msgSend((id)objc_opt_class(), "_forcedImpl");
  v6 = (objc_class *)objc_opt_class();
  +[_UIVisualStyleRegistry defaultRegistry](_UIVisualStyleRegistry, "defaultRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  objc_msgSend(v7, "registerVisualStyleClass:forStylableClass:", v8, objc_opt_class());

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", objc_msgSend(v9, "userInterfaceIdiom"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_msgSend(v10, "visualStyleClassForStylableClass:", objc_opt_class());

  v12 = (_UISplitViewControllerStyle *)objc_msgSend([v11 alloc], "initWithSplitViewController:", self);
  styleProvider = self->_styleProvider;
  self->_styleProvider = v12;

  v14 = (UISplitViewControllerImpl *)objc_msgSend([v6 alloc], "initWithSplitViewController:", self);
  impl = self->_impl;
  self->_impl = v14;

  -[UISplitViewControllerImpl _commonInit](self->_impl, "_commonInit");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:selector:name:object:", self, sel__willBeginSnapshotSession_, CFSTR("UISceneWillBeginSystemSnapshotSequence"), 0);
  objc_msgSend(v16, "addObserver:selector:name:object:", self, sel__didEndSnapshotSession_, CFSTR("UISceneDidCompleteSystemSnapshotSequence"), 0);

}

+ (int64_t)_forcedImpl
{
  return __forcedImpl;
}

+ (BOOL)_devicePrefersOverlayInRegularWidth
{
  if (qword_1ECD7C5C8 != -1)
    dispatch_once(&qword_1ECD7C5C8, &__block_literal_global_56);
  return byte_1ECD7C5B9;
}

- (id)_additionalViewControllersToCheckForUserActivity
{
  return (id)-[UISplitViewControllerImpl _additionalViewControllersToCheckForUserActivity](self->_impl, "_additionalViewControllersToCheckForUserActivity");
}

- (id)transitionCoordinator
{
  void *v3;
  void *v4;
  objc_super v6;

  if (!-[UISplitViewControllerImpl style](self->_impl, "style")
    || (-[UISplitViewController _panelImpl](self, "_panelImpl"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "transitionCoordinator"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    v6.receiver = self;
    v6.super_class = (Class)UISplitViewController;
    -[UIViewController transitionCoordinator](&v6, sel_transitionCoordinator);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)_navigationControllerDidChangeNavigationBarHidden:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_navigationControllerDidChangeNavigationBarHidden:", v4);

}

- (NSArray)viewControllers
{
  return (NSArray *)-[UISplitViewControllerImpl viewControllers](self->_impl, "viewControllers");
}

- (void)_navigationController:(id)a3 navigationBar:(id)a4 itemBackButtonUpdated:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if (-[UISplitViewControllerImpl style](self->_impl, "style"))
  {
    -[UISplitViewController _panelImpl](self, "_panelImpl");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_navigationController:navigationBar:itemBackButtonUpdated:", v11, v8, v9);

  }
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISplitViewController;
  -[UIViewController didMoveToParentViewController:](&v3, sel_didMoveToParentViewController_, a3);
}

- (UISplitViewControllerDisplayMode)displayMode
{
  return -[UISplitViewControllerImpl displayMode](self->_impl, "displayMode");
}

- (BOOL)hidesMasterViewInPortrait
{
  return -[UISplitViewControllerImpl hidesMasterViewInPortrait](self->_impl, "hidesMasterViewInPortrait");
}

- (id)_effectiveInteractionActivityTrackingBaseName
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;

  -[UIViewController interactionActivityTrackingBaseName](self, "interactionActivityTrackingBaseName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (-[UISplitViewController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
    {
      -[UISplitViewController masterViewController](self, "masterViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_effectiveInteractionActivityTrackingBaseName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(CFSTR("UISVC-"), "stringByAppendingString:", v5);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = 0;
      }

    }
    else
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (void)_navigationController:(id)a3 navigationBar:(id)a4 topItemUpdatedContentLayout:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if (-[UISplitViewControllerImpl style](self->_impl, "style"))
  {
    -[UISplitViewController _panelImpl](self, "_panelImpl");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_navigationController:navigationBar:topItemUpdatedContentLayout:", v11, v8, v9);

  }
}

- (void)setConfiguration:(id)a3
{
  UISplitViewControllerImpl *impl;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  impl = self->_impl;
  v6 = a3;
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](impl, "lockedForDelegateCallback"))
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v9);

  }
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConfiguration:", v6);

}

- (UISplitViewController)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UISplitViewController *v5;
  UISplitViewController *v6;
  objc_super v8;

  v4 = coder;
  v8.receiver = self;
  v8.super_class = (Class)UISplitViewController;
  v5 = -[UIViewController initWithCoder:](&v8, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[UISplitViewController _commonInitForcingColumnStyle:](v5, "_commonInitForcingColumnStyle:", 0);
    -[UISplitViewControllerImpl _initWithCoder:](v6->_impl, "_initWithCoder:", v4);
  }

  return v6;
}

- (void)setViewControllers:(NSArray *)viewControllers
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSArray *v8;

  v8 = viewControllers;
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v7);

  }
  -[UISplitViewControllerImpl setViewControllers:](self->_impl, "setViewControllers:", v8);

}

- (void)_setUsesExtraWidePrimaryColumn:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  -[UISplitViewControllerImpl _setUsesExtraWidePrimaryColumn:](self->_impl, "_setUsesExtraWidePrimaryColumn:", v3);
}

- (void)setView:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v5 = a3;
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  -[UIViewController setView:](&v9, sel_setView_, v5);

}

- (void)setPreferredDisplayMode:(UISplitViewControllerDisplayMode)preferredDisplayMode
{
  uint64_t v6;
  UISplitViewControllerDisplayMode v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = -[UISplitViewControllerImpl style](self->_impl, "style");
  v7 = UISplitViewControllerDisplayModeTwoDisplaceSecondary;
  if (!v6)
    v7 = UISplitViewControllerDisplayModeOneOverSecondary;
  if (preferredDisplayMode < 0 || v7 < preferredDisplayMode)
  {
    NSLog(CFSTR("%s: Caller is trying to set unsupported displayMode = %d, ignoring. SplitViewController = %@"), "-[UISplitViewController setPreferredDisplayMode:]", preferredDisplayMode, self);
  }
  else
  {
    if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
    {
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99778];
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise:format:", v9, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v10);

    }
    -[UISplitViewControllerImpl setPreferredDisplayMode:](self->_impl, "setPreferredDisplayMode:", preferredDisplayMode);
  }
}

- (UIBarButtonItem)displayModeButtonItem
{
  return (UIBarButtonItem *)-[UISplitViewControllerImpl displayModeButtonItem](self->_impl, "displayModeButtonItem");
}

- (CGFloat)preferredPrimaryColumnWidth
{
  void *v2;
  double v3;
  double v4;

  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredPrimaryColumnWidth");
  v4 = v3;

  return v4;
}

- (CGFloat)supplementaryColumnWidth
{
  void *v3;
  double v4;
  double v5;

  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  _supplementaryColumnWidthSupportCheck(self);
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supplementaryColumnWidth");
  v5 = v4;

  return v5;
}

- (void)setPreferredSupplementaryColumnWidth:(CGFloat)preferredSupplementaryColumnWidth
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  _supplementaryColumnWidthSupportCheck(self);
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPreferredSupplementaryColumnWidth:", preferredSupplementaryColumnWidth);

}

- (void)setMaximumSupplementaryColumnWidth:(CGFloat)maximumSupplementaryColumnWidth
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  _supplementaryColumnWidthSupportCheck(self);
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMaximumSupplementaryColumnWidth:", maximumSupplementaryColumnWidth);

}

- (void)setPreferredPrimaryColumnWidth:(CGFloat)preferredPrimaryColumnWidth
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPreferredPrimaryColumnWidth:", preferredPrimaryColumnWidth);

}

- (void)setMinimumSupplementaryColumnWidth:(CGFloat)minimumSupplementaryColumnWidth
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  _supplementaryColumnWidthSupportCheck(self);
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMinimumSupplementaryColumnWidth:", minimumSupplementaryColumnWidth);

}

- (void)setMinimumPrimaryColumnWidth:(CGFloat)minimumPrimaryColumnWidth
{
  void *v6;
  uint64_t v7;
  void *v8;

  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  -[UISplitViewControllerImpl setMinimumPrimaryColumnWidth:](self->_impl, "setMinimumPrimaryColumnWidth:", minimumPrimaryColumnWidth);
}

- (void)setMaximumPrimaryColumnWidth:(CGFloat)maximumPrimaryColumnWidth
{
  void *v6;
  uint64_t v7;
  void *v8;

  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  -[UISplitViewControllerImpl setMaximumPrimaryColumnWidth:](self->_impl, "setMaximumPrimaryColumnWidth:", maximumPrimaryColumnWidth);
}

- (void)setPreferredSplitBehavior:(UISplitViewControllerSplitBehavior)preferredSplitBehavior
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPreferredSplitBehavior:", preferredSplitBehavior);

}

- (CGSize)preferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGSize result;

  v12.receiver = self;
  v12.super_class = (Class)UISplitViewController;
  -[UIViewController preferredContentSize](&v12, sel_preferredContentSize);
  v4 = v3;
  v6 = v5;
  if (((dyld_program_sdk_at_least() & 1) != 0
     || -[UISplitViewController _alwaysAllowsSystemPreferredContentSize](self, "_alwaysAllowsSystemPreferredContentSize"))&& v4 == *MEMORY[0x1E0C9D820]&& v6 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[UISplitViewControllerImpl _preferredContentSize](self->_impl, "_preferredContentSize");
    v4 = v8;
    v6 = v9;
  }
  v10 = v4;
  v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)showDetailViewController:(UIViewController *)vc sender:(id)sender
{
  -[UISplitViewControllerImpl showDetailViewController:sender:](self->_impl, "showDetailViewController:sender:", vc, sender);
}

- (void)_setForceDisplayModeBarButtonHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[UISplitViewControllerImpl style](self->_impl, "style"))
  {
    -[UISplitViewController _panelImpl](self, "_panelImpl");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setForceDisplayModeBarButtonHidden:", v3);

  }
}

- (void)setDisplayModeButtonVisibility:(UISplitViewControllerDisplayModeButtonVisibility)displayModeButtonVisibility
{
  id v5;

  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisplayModeButtonVisibility:", displayModeButtonVisibility);

}

- (CGFloat)primaryColumnWidth
{
  CGFloat result;

  -[UISplitViewControllerImpl primaryColumnWidth](self->_impl, "primaryColumnWidth");
  return result;
}

- (UISplitViewControllerDisplayMode)preferredDisplayMode
{
  return -[UISplitViewControllerImpl preferredDisplayMode](self->_impl, "preferredDisplayMode");
}

- (void)setExtendedLayoutIncludesOpaqueBars:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  -[UIViewController setExtendedLayoutIncludesOpaqueBars:](&v9, sel_setExtendedLayoutIncludesOpaqueBars_, v3);
}

- (void)setPrimaryBackgroundStyle:(UISplitViewControllerBackgroundStyle)primaryBackgroundStyle
{
  void *v6;
  uint64_t v7;
  void *v8;

  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  -[UISplitViewControllerImpl setPrimaryBackgroundStyle:](self->_impl, "setPrimaryBackgroundStyle:", primaryBackgroundStyle);
}

- (UISplitViewControllerSplitBehavior)preferredSplitBehavior
{
  void *v3;
  UISplitViewControllerSplitBehavior v4;

  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preferredSplitBehavior");

  return v4;
}

- (void)setShowsSecondaryOnlyButton:(BOOL)showsSecondaryOnlyButton
{
  _BOOL8 v3;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = showsSecondaryOnlyButton;
  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShowsSecondaryOnlyButton:", v3);

}

- (void)_setPrefersOverlayInRegularWidthPhone:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  -[UISplitViewControllerImpl setPrefersOverlayInRegularWidthPhone:](self->_impl, "setPrefersOverlayInRegularWidthPhone:", v3);
}

- (void)setPrimaryEdge:(UISplitViewControllerPrimaryEdge)primaryEdge
{
  void *v6;
  uint64_t v7;
  void *v8;

  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  -[UISplitViewControllerImpl setPrimaryEdge:](self->_impl, "setPrimaryEdge:", primaryEdge);
}

- (void)setGutterWidth:(float)a3
{
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v9);

  }
  *(float *)&v6 = a3;
  -[UISplitViewControllerImpl setGutterWidth:](self->_impl, "setGutterWidth:", v6);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UISplitViewController;
  -[UIViewController viewDidDisappear:](&v5, sel_viewDidDisappear_);
  -[UISplitViewControllerImpl viewDidDisappear:](self->_impl, "viewDidDisappear:", v3);
}

- (void)_setDisplayModeButtonItemTitle:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v7);

  }
  -[UISplitViewControllerImpl _setDisplayModeButtonItemTitle:](self->_impl, "_setDisplayModeButtonItemTitle:", v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_impl, 0);
}

- (void)showColumn:(UISplitViewControllerColumn)column
{
  int v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  v6 = -[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback");
  v7 = (_QWORD *)MEMORY[0x1E0C99778];
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", v9, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v10);

  }
  if (column == UISplitViewControllerColumnCompact)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v7, CFSTR("Progammatic column showing not supported for Compact column of UISplitViewController"));
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "showColumn:", column);

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISplitViewController;
  v4 = a3;
  -[UIViewController encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  -[UISplitViewControllerImpl encodeWithCoder:](self->_impl, "encodeWithCoder:", v4, v5.receiver, v5.super_class);

}

- (void)setStyle:(int64_t)a3
{
  void *v6;
  id v7;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewController.m"), 226, CFSTR("SPI misuse. -setStyle: should be used by IB to set up UISplitViewController for column-style behavior using UISplitViewControllerStyleDoubleColumn or -TripleColumn"));

  }
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStyle:", a3);

}

- (int64_t)composition
{
  return -[UISplitViewControllerImpl style](self->_impl, "style");
}

- (BOOL)showsSecondaryOnlyButton
{
  void *v3;
  char v4;

  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showsSecondaryOnlyButton");

  return v4;
}

- (UISplitViewControllerSplitBehavior)splitBehavior
{
  void *v3;
  UISplitViewControllerSplitBehavior v4;

  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "splitBehavior");

  return v4;
}

- (void)hideColumn:(UISplitViewControllerColumn)column
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "inCollapsingToProposedTopColumnCallback") & 1) == 0
    && (objc_msgSend(v10, "inExpandingToProposedDisplayModeCallback") & 1) == 0
    && -[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  if (column == UISplitViewControllerColumnCompact)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Progammatic column hiding not supported for Compact column of UISplitViewController"));
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hideColumn:", column);

}

- (void)setPreferredSupplementaryColumnWidthFraction:(CGFloat)preferredSupplementaryColumnWidthFraction
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  _supplementaryColumnWidthSupportCheck(self);
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPreferredSupplementaryColumnWidthFraction:", preferredSupplementaryColumnWidthFraction);

}

- (CGFloat)preferredSupplementaryColumnWidthFraction
{
  void *v3;
  double v4;
  double v5;

  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  _supplementaryColumnWidthSupportCheck(self);
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredSupplementaryColumnWidthFraction");
  v5 = v4;

  return v5;
}

- (CGFloat)minimumSupplementaryColumnWidth
{
  void *v3;
  double v4;
  double v5;

  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  _supplementaryColumnWidthSupportCheck(self);
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minimumSupplementaryColumnWidth");
  v5 = v4;

  return v5;
}

- (CGFloat)maximumSupplementaryColumnWidth
{
  void *v3;
  double v4;
  double v5;

  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  _supplementaryColumnWidthSupportCheck(self);
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maximumSupplementaryColumnWidth");
  v5 = v4;

  return v5;
}

- (UISplitViewControllerDisplayModeButtonVisibility)displayModeButtonVisibility
{
  void *v3;
  UISplitViewControllerDisplayModeButtonVisibility v4;

  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "displayModeButtonVisibility");

  return v4;
}

- (void)_setVisibleToggleButtonRequiresPresentsWithGesture:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[UISplitViewControllerImpl style](self->_impl, "style"))
  {
    -[UISplitViewController _panelImpl](self, "_panelImpl");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setVisibleToggleButtonRequiresPresentsWithGesture:", v3);

  }
}

- (BOOL)_visibleToggleButtonRequiresPresentsWithGesture
{
  uint64_t v3;
  void *v4;
  char v5;

  v3 = -[UISplitViewControllerImpl style](self->_impl, "style");
  if (v3)
  {
    -[UISplitViewController _panelImpl](self, "_panelImpl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_visibleToggleButtonRequiresPresentsWithGesture");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)_forceDisplayModeBarButtonHidden
{
  uint64_t v3;
  void *v4;
  char v5;

  v3 = -[UISplitViewControllerImpl style](self->_impl, "style");
  if (v3)
  {
    -[UISplitViewController _panelImpl](self, "_panelImpl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_forceDisplayModeBarButtonHidden");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)_setAllowsDimmedSecondaryAsDeepestUnambiguousResponder:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[UISplitViewControllerImpl style](self->_impl, "style"))
  {
    -[UISplitViewController _panelImpl](self, "_panelImpl");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setAllowsDimmedSecondaryAsDeepestUnambiguousResponder:", v3);

  }
}

- (BOOL)_allowsDimmedSecondaryAsDeepestUnambiguousResponder
{
  uint64_t v3;
  void *v4;
  char v5;

  v3 = -[UISplitViewControllerImpl style](self->_impl, "style");
  if (v3)
  {
    -[UISplitViewController _panelImpl](self, "_panelImpl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_allowsDimmedSecondaryAsDeepestUnambiguousResponder");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)_setIgnoresSheetContext:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[UISplitViewControllerImpl style](self->_impl, "style"))
  {
    -[UISplitViewController _panelImpl](self, "_panelImpl");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setIgnoresSheetContext:", v3);

  }
}

- (BOOL)_ignoresSheetContext
{
  uint64_t v3;
  void *v4;
  char v5;

  v3 = -[UISplitViewControllerImpl style](self->_impl, "style");
  if (v3)
  {
    -[UISplitViewController _panelImpl](self, "_panelImpl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_ignoresSheetContext");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (CGFloat)preferredPrimaryColumnWidthFraction
{
  CGFloat result;

  -[UISplitViewControllerImpl preferredPrimaryColumnWidthFraction](self->_impl, "preferredPrimaryColumnWidthFraction");
  return result;
}

- (void)setPreferredPrimaryColumnWidthFraction:(CGFloat)preferredPrimaryColumnWidthFraction
{
  void *v6;
  uint64_t v7;
  void *v8;

  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  -[UISplitViewControllerImpl setPreferredPrimaryColumnWidthFraction:](self->_impl, "setPreferredPrimaryColumnWidthFraction:", preferredPrimaryColumnWidthFraction);
}

- (CGFloat)maximumPrimaryColumnWidth
{
  CGFloat result;

  -[UISplitViewControllerImpl maximumPrimaryColumnWidth](self->_impl, "maximumPrimaryColumnWidth");
  return result;
}

- (void)showViewController:(UIViewController *)vc sender:(id)sender
{
  -[UISplitViewControllerImpl showViewController:sender:](self->_impl, "showViewController:sender:", vc, sender);
}

- (float)gutterWidth
{
  float result;

  -[UISplitViewControllerImpl gutterWidth](self->_impl, "gutterWidth");
  return result;
}

- (void)setHidesMasterViewInPortrait:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  -[UISplitViewControllerImpl setHidesMasterViewInPortrait:](self->_impl, "setHidesMasterViewInPortrait:", v3);
}

- (NSString)_displayModeButtonItemTitle
{
  return (NSString *)-[UISplitViewControllerImpl _displayModeButtonItemTitle](self->_impl, "_displayModeButtonItemTitle");
}

- (id)_primaryDimmingView
{
  return (id)-[UISplitViewControllerImpl _primaryDimmingView](self->_impl, "_primaryDimmingView");
}

- (void)_setWantsFloatingSidebar:(BOOL)a3
{
  -[UISplitViewControllerImpl _setWantsFloatingSidebar:](self->_impl, "_setWantsFloatingSidebar:", a3);
}

- (BOOL)_wantsFloatingSidebar
{
  return -[UISplitViewControllerImpl _wantsFloatingSidebar](self->_impl, "_wantsFloatingSidebar");
}

- (BOOL)_prefersOverlayInRegularWidthPhone
{
  return -[UISplitViewControllerImpl prefersOverlayInRegularWidthPhone](self->_impl, "prefersOverlayInRegularWidthPhone");
}

- (void)_setUsesDeviceOverlayPreferences:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  -[UISplitViewControllerImpl setUsesDeviceOverlayPreferences:](self->_impl, "setUsesDeviceOverlayPreferences:", v3);
}

- (BOOL)_usesDeviceOverlayPreferences
{
  return -[UISplitViewControllerImpl usesDeviceOverlayPreferences](self->_impl, "usesDeviceOverlayPreferences");
}

- (BOOL)_usesExtraWidePrimaryColumn
{
  return -[UISplitViewControllerImpl _usesExtraWidePrimaryColumn](self->_impl, "_usesExtraWidePrimaryColumn");
}

- (CGFloat)preferredSupplementaryColumnWidth
{
  void *v3;
  double v4;
  double v5;

  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  _supplementaryColumnWidthSupportCheck(self);
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredSupplementaryColumnWidth");
  v5 = v4;

  return v5;
}

- (int64_t)_primaryOffscreenGestureMode
{
  return -[UISplitViewControllerImpl _primaryOffscreenGestureMode](self->_impl, "_primaryOffscreenGestureMode");
}

- (void)_setPrimaryOffscreenGestureMode:(int64_t)a3
{
  -[UISplitViewControllerImpl _setPrimaryOffscreenGestureMode:](self->_impl, "_setPrimaryOffscreenGestureMode:", a3);
}

- (void)_allowingMutationsInDelegateCallback:(id)a3
{
  void (**v4)(void);
  void *v5;
  void (**v6)(void);

  v4 = (void (**)(void))a3;
  if (v4)
  {
    v6 = v4;
    if (-[UISplitViewControllerImpl style](self->_impl, "style"))
    {
      -[UISplitViewController _panelImpl](self, "_panelImpl");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_allowingMutationsInDelegateCallback:", v6);

    }
    else
    {
      v6[2]();
    }
    v4 = v6;
  }

}

- (BOOL)_canTileSidebarColumn:(int64_t)a3
{
  void *v4;
  char v5;

  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-_canTileSidebarColumn not available"));
  v5 = objc_msgSend(v4, "canTileSidebarColumn:", a3);

  return v5;
}

- (void)_tabBarControllerDidChangeSelection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_tabBarControllerDidChangeSelection:", v4);

}

- (id)_navigationController:(id)a3 navigationBarAdditionalActionsForBackButtonMenu:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (-[UISplitViewControllerImpl style](self->_impl, "style"))
  {
    -[UISplitViewController _panelImpl](self, "_panelImpl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_navigationController:navigationBarAdditionalActionsForBackButtonMenu:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_navigationControllerShouldNotAdjustTransitioningSizeForChildContainer:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (-[UISplitViewControllerImpl style](self->_impl, "style"))
  {
    -[UISplitViewController _panelImpl](self, "_panelImpl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_navigationControllerShouldNotAdjustTransitioningSizeForChildContainer:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)_columnForViewController:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  if (v4 && -[UISplitViewControllerImpl style](self->_impl, "style"))
  {
    -[UISplitViewController _panelImpl](self, "_panelImpl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_columnForViewController:", v4);

  }
  else
  {
    v6 = 999;
  }

  return v6;
}

- (int64_t)_columnForMonitoredNavigationController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[UISplitViewController _panelImpl](self, "_panelImpl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_columnForMonitoredNavigationController:", v4);

  }
  else
  {
    v7 = 999;
  }

  return v7;
}

- (UIEdgeInsets)_tvOSColumnStyleExtraInsetsForChildViewController:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  v4 = a3;
  v5 = 0.0;
  if (v4)
  {
    v6 = 0.0;
    v7 = 0.0;
    v8 = 0.0;
    if (-[UISplitViewControllerImpl style](self->_impl, "style"))
    {
      -[UISplitViewController _panelImpl](self, "_panelImpl");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_tvOSColumnStyleExtraInsetsForChildViewController:", v4);
      v5 = v10;
      v6 = v11;
      v7 = v12;
      v8 = v13;

    }
  }
  else
  {
    v6 = 0.0;
    v7 = 0.0;
    v8 = 0.0;
  }

  v14 = v5;
  v15 = v6;
  v16 = v7;
  v17 = v8;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (UIScreenEdgePanGestureRecognizer)_fluidOpenSidebarPresentationGestureRecognizer
{
  void *v2;
  void *v3;

  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_fluidOpenSidebarPresentationGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIScreenEdgePanGestureRecognizer *)v3;
}

- (BOOL)_shouldUseFluidSidebarGestures
{
  uint64_t v3;
  void *v4;
  char v5;

  v3 = -[UISplitViewControllerImpl style](self->_impl, "style");
  if (v3)
  {
    -[UISplitViewController _panelImpl](self, "_panelImpl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_shouldUseFluidSidebarGestures");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)_isRotating
{
  return -[UISplitViewControllerImpl _isRotating](self->_impl, "_isRotating");
}

- (BOOL)_isAnimating
{
  return -[UISplitViewControllerImpl _isAnimating](self->_impl, "_isAnimating");
}

- (BOOL)_isExpanding
{
  return -[UISplitViewControllerImpl _isExpanding](self->_impl, "_isExpanding");
}

- (double)_primaryDividerPosition
{
  double result;

  -[UISplitViewControllerImpl _primaryDividerPosition](self->_impl, "_primaryDividerPosition");
  return result;
}

- (double)_supplementaryDividerPosition
{
  double result;

  -[UISplitViewControllerImpl _supplementaryDividerPosition](self->_impl, "_supplementaryDividerPosition");
  return result;
}

- (CGSize)_contentSizeForChildViewController:(id)a3 inPopoverController:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  -[UISplitViewControllerImpl _contentSizeForChildViewController:inPopoverController:](self->_impl, "_contentSizeForChildViewController:inPopoverController:", a3, a4);
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)_popoverController:(id)a3 willChangeToVisible:(BOOL)a4
{
  -[UISplitViewControllerImpl _popoverController:willChangeToVisible:](self->_impl, "_popoverController:willChangeToVisible:", a3, a4);
}

- (void)_popoverController:(id)a3 didChangeFromVisible:(BOOL)a4
{
  -[UISplitViewControllerImpl _popoverController:didChangeFromVisible:](self->_impl, "_popoverController:didChangeFromVisible:", a3, a4);
}

- (void)_descendantWillPresentViewController:(id)a3 modalSourceViewController:(id)a4 presentationController:(id)a5 animated:(BOOL)a6
{
  -[UISplitViewControllerImpl _descendantWillPresentViewController:modalSourceViewController:presentationController:animated:](self->_impl, "_descendantWillPresentViewController:modalSourceViewController:presentationController:animated:", a3, a4, a5, a6);
}

- (void)_willShowCollapsedDetailViewController:(id)a3 inTargetController:(id)a4
{
  -[UISplitViewControllerImpl _willShowCollapsedDetailViewController:inTargetController:](self->_impl, "_willShowCollapsedDetailViewController:inTargetController:", a3, a4);
}

- (void)_willBeginSnapshotSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    -[UIViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowScene");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v8;
    if (v8 == v7)
    {
      -[UISplitViewControllerImpl _willBeginSnapshotSession](self->_impl, "_willBeginSnapshotSession");
      v4 = v8;
    }
  }

}

- (void)_didEndSnapshotSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    -[UIViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowScene");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v8;
    if (v8 == v7)
    {
      -[UISplitViewControllerImpl _didEndSnapshotSession](self->_impl, "_didEndSnapshotSession");
      v4 = v8;
    }
  }

}

+ (BOOL)_automaticDisplayModeOnPhoneUsesOverlayInLandscapeDefaultValue
{
  return (byte_1EDDA7EEC != 0) & ~_UIInternalPreferenceUsesDefault(&_UIInternalPreference_PhoneLandscapeSVCUsesOverlay, (uint64_t)CFSTR("PhoneLandscapeSVCUsesOverlay"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
}

- (BOOL)_iPhoneShouldUseOverlayInCurrentEnvironment
{
  return -[UISplitViewControllerImpl _iPhoneShouldUseOverlayInCurrentEnvironment](self->_impl, "_iPhoneShouldUseOverlayInCurrentEnvironment");
}

- (BOOL)_layoutPrimaryOnRight
{
  return -[UISplitViewControllerImpl _layoutPrimaryOnRight](self->_impl, "_layoutPrimaryOnRight");
}

- (void)toggleMasterVisible:(id)a3
{
  -[UISplitViewControllerImpl toggleMasterVisible:](self->_impl, "toggleMasterVisible:", a3);
}

- (UISplitViewControllerBackgroundStyle)primaryBackgroundStyle
{
  return -[UISplitViewControllerImpl primaryBackgroundStyle](self->_impl, "primaryBackgroundStyle");
}

- (void)_setSupplementaryColumnAdoptsPrimaryBackgroundStyle:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSupplementaryColumnAdoptsPrimaryBackgroundStyle:", v3);

}

- (BOOL)_supplementaryColumnAdoptsPrimaryBackgroundStyle
{
  void *v2;
  char v3;

  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supplementaryColumnAdoptsPrimaryBackgroundStyle");

  return v3;
}

- (void)toggleSidebar:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[UISplitViewControllerImpl style](self->_impl, "style"))
  {
    -[UISplitViewController _panelImpl](self, "_panelImpl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_triggerSidebarKeyCommandAction:", v5);

  }
}

- (BOOL)_needsNSToolbarSidebarToggle
{
  return 0;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  void *v5;
  char v6;
  objc_super v7;

  if (sel_toggleSidebar_ == a3)
  {
    -[UISplitViewController _panelImpl](self, "_panelImpl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_allowsTriggeringSidebarKeyCommandAction");

    return v6;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UISplitViewController;
    return -[UIViewController canPerformAction:withSender:](&v7, sel_canPerformAction_withSender_);
  }
}

- (void)validateCommand:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if ((char *)objc_msgSend(v4, "action") == sel_toggleSidebar_)
  {
    -[UISplitViewController _panelImpl](self, "_panelImpl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_validateTriggerSidebarKeyCommand:", v4);

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UISplitViewController;
    -[UIResponder validateCommand:](&v6, sel_validateCommand_, v4);
  }

}

- (void)setProvidesPresentationContextTransitionStyle:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  -[UIViewController setProvidesPresentationContextTransitionStyle:](&v9, sel_setProvidesPresentationContextTransitionStyle_, v3);
}

- (void)setRestoresFocusAfterTransition:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  -[UIViewController setRestoresFocusAfterTransition:](&v9, sel_setRestoresFocusAfterTransition_, v3);
}

- (void)setModalTransitionStyle:(int64_t)a3
{
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  -[UIViewController setModalTransitionStyle:](&v9, sel_setModalTransitionStyle_, a3);
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  -[UIViewController setModalPresentationStyle:](&v9, sel_setModalPresentationStyle_, a3);
}

- (void)setModalPresentationCapturesStatusBarAppearance:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  -[UIViewController setModalPresentationCapturesStatusBarAppearance:](&v9, sel_setModalPresentationCapturesStatusBarAppearance_, v3);
}

- (void)setEdgesForExtendedLayout:(unint64_t)a3
{
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  -[UIViewController setEdgesForExtendedLayout:](&v9, sel_setEdgesForExtendedLayout_, a3);
}

- (void)setAutomaticallyAdjustsScrollViewInsets:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  -[UIViewController setAutomaticallyAdjustsScrollViewInsets:](&v9, sel_setAutomaticallyAdjustsScrollViewInsets_, v3);
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v9);

  }
  v10.receiver = self;
  v10.super_class = (Class)UISplitViewController;
  -[UIViewController setPreferredContentSize:](&v10, sel_setPreferredContentSize_, width, height);
}

- (CGSize)_super_preferredContentSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v4.receiver = self;
  v4.super_class = (Class)UISplitViewController;
  -[UIViewController preferredContentSize](&v4, sel_preferredContentSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setOverrideTraitCollection:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v5 = a3;
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  -[UIViewController setOverrideTraitCollection:](&v9, sel_setOverrideTraitCollection_, v5);

}

- (void)setViewRespectsSystemMinimumLayoutMargins:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  -[UIViewController setViewRespectsSystemMinimumLayoutMargins:](&v9, sel_setViewRespectsSystemMinimumLayoutMargins_, v3);
}

- (void)removeFromParentViewController
{
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  if (-[UISplitViewControllerImpl lockedForDelegateCallback](self->_impl, "lockedForDelegateCallback"))
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "raise:format:", v5, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v6);

  }
  v7.receiver = self;
  v7.super_class = (Class)UISplitViewController;
  -[UIViewController removeFromParentViewController](&v7, sel_removeFromParentViewController);
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double v4;
  double v5;
  CGSize result;

  -[UISplitViewControllerImpl sizeForChildContentContainer:withParentContainerSize:](self->_impl, "sizeForChildContentContainer:withParentContainerSize:", a3, a4.width, a4.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_super_sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  v6.receiver = self;
  v6.super_class = (Class)UISplitViewController;
  -[UIViewController sizeForChildContentContainer:withParentContainerSize:](&v6, sel_sizeForChildContentContainer_withParentContainerSize_, a3, a4.width, a4.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  -[UISplitViewControllerImpl viewWillTransitionToSize:withTransitionCoordinator:](self->_impl, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
}

- (void)_super_viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UISplitViewController;
  -[UIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v4, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
}

- (id)preferredFocusedView
{
  return (id)-[UISplitViewControllerImpl preferredFocusedView](self->_impl, "preferredFocusedView");
}

- (id)_super_preferredFocusedView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISplitViewController;
  -[UIViewController preferredFocusedView](&v3, sel_preferredFocusedView);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)_subclassPreferredFocusedViewPrioritizationType
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  BOOL v7;

  if (!qword_1ECD7C5D0)
  {
    qword_1ECD7C5D0 = +[UISplitViewController instanceMethodForSelector:](UISplitViewController, "instanceMethodForSelector:", sel_preferredFocusedView);
    qword_1ECD7C5D8 = +[UISplitViewController instanceMethodForSelector:](UISplitViewController, "instanceMethodForSelector:", sel_preferredFocusEnvironments);
  }
  v3 = -[UISplitViewController methodForSelector:](self, "methodForSelector:", sel_preferredFocusedView);
  v4 = -[UISplitViewController methodForSelector:](self, "methodForSelector:", sel_preferredFocusEnvironments);
  if (v3)
    v5 = v3 == qword_1ECD7C5D0;
  else
    v5 = 1;
  if (v5)
    return 0;
  if (v4)
    v7 = v4 == qword_1ECD7C5D8;
  else
    v7 = 1;
  if (v7)
    return 1;
  else
    return 2;
}

- (id)preferredFocusEnvironments
{
  return (id)-[UISplitViewControllerImpl preferredFocusEnvironments](self->_impl, "preferredFocusEnvironments");
}

- (id)_super_preferredFocusEnvironments
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISplitViewController;
  -[UIViewController preferredFocusEnvironments](&v3, sel_preferredFocusEnvironments);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_overridingPreferredFocusEnvironment
{
  return (id)-[UISplitViewControllerImpl _overridingPreferredFocusEnvironment](self->_impl, "_overridingPreferredFocusEnvironment");
}

- (id)_super_overridingPreferredFocusEnvironment
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISplitViewController;
  -[UIViewController _overridingPreferredFocusEnvironment](&v3, sel__overridingPreferredFocusEnvironment);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return -[UISplitViewControllerImpl shouldUpdateFocusInContext:](self->_impl, "shouldUpdateFocusInContext:", a3);
}

- (BOOL)_super_shouldUpdateFocusInContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UISplitViewController;
  return -[UIViewController shouldUpdateFocusInContext:](&v4, sel_shouldUpdateFocusInContext_, a3);
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return (id)-[UISplitViewControllerImpl childViewControllerForHomeIndicatorAutoHidden](self->_impl, "childViewControllerForHomeIndicatorAutoHidden");
}

- (id)_super_childViewControllerForStatusBarStyle
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISplitViewController;
  -[UIViewController childViewControllerForStatusBarStyle](&v3, sel_childViewControllerForStatusBarStyle);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return -[UISplitViewControllerImpl shouldAutorotateToInterfaceOrientation:](self->_impl, "shouldAutorotateToInterfaceOrientation:", a3);
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  if (!_UIAppUseModernRotationAndPresentationBehaviors())
    -[UISplitViewControllerImpl willRotateToInterfaceOrientation:duration:](self->_impl, "willRotateToInterfaceOrientation:duration:", a3, a4);
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  if (!_UIAppUseModernRotationAndPresentationBehaviors())
    -[UISplitViewControllerImpl willAnimateRotationToInterfaceOrientation:duration:](self->_impl, "willAnimateRotationToInterfaceOrientation:duration:", a3, a4);
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  if (!_UIAppUseModernRotationAndPresentationBehaviors())
    -[UISplitViewControllerImpl didRotateFromInterfaceOrientation:](self->_impl, "didRotateFromInterfaceOrientation:", a3);
}

- (BOOL)_hasPreferredInterfaceOrientationForPresentation
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UISplitViewController;
  if (-[UIViewController _hasPreferredInterfaceOrientationForPresentation](&v4, sel__hasPreferredInterfaceOrientationForPresentation))
  {
    return 1;
  }
  else
  {
    return -[UISplitViewControllerImpl _hasPreferredInterfaceOrientationForPresentation](self->_impl, "_hasPreferredInterfaceOrientationForPresentation");
  }
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return -[UISplitViewControllerImpl preferredInterfaceOrientationForPresentation](self->_impl, "preferredInterfaceOrientationForPresentation");
}

- (int64_t)_super_preferredInterfaceOrientationForPresentation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISplitViewController;
  return -[UIViewController preferredInterfaceOrientationForPresentation](&v3, sel_preferredInterfaceOrientationForPresentation);
}

- (void)unloadViewForced:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UISplitViewController;
  -[UIViewController unloadViewForced:](&v5, sel_unloadViewForced_);
  -[UISplitViewControllerImpl unloadViewForced:](self->_impl, "unloadViewForced:", v3);
}

- (void)_didUpdateFocusInContext:(id)a3
{
  -[UISplitViewControllerImpl _didUpdateFocusInContext:](self->_impl, "_didUpdateFocusInContext:", a3);
}

- (void)_super_didUpdateFocusInContext:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISplitViewController;
  -[UIViewController _didUpdateFocusInContext:](&v3, sel__didUpdateFocusInContext_, a3);
}

- (id)_presentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UISheetPresentationController *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self && dyld_program_sdk_at_least() && -[UISplitViewControllerImpl style](self->_impl, "style"))
  {
    v13.receiver = self;
    v13.super_class = (Class)UISplitViewController;
    -[UIViewController _presentationControllerForPresentedController:presentingController:sourceController:](&v13, sel__presentationControllerForPresentedController_presentingController_sourceController_, v8, v9, v10);
    v11 = (_UISheetPresentationController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = -[UISheetPresentationController initWithPresentedViewController:presentingViewController:]([_UISheetPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v8, v9);
    -[UISheetPresentationController _setWantsBottomAttached:](v11, "_setWantsBottomAttached:", 1);
  }

  return v11;
}

- (id)_multitaskingDragExclusionRects
{
  return (id)-[UISplitViewControllerImpl _multitaskingDragExclusionRects](self->_impl, "_multitaskingDragExclusionRects");
}

- (id)_super_multitaskingDragExclusionRects
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISplitViewController;
  -[UIViewController _multitaskingDragExclusionRects](&v3, sel__multitaskingDragExclusionRects);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGRect)_frameForChildContentContainer:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UISplitViewControllerImpl _frameForChildContentContainer:](self->_impl, "_frameForChildContentContainer:", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (BOOL)doesOverridePreferredInterfaceOrientationForPresentation
{
  return objc_msgSend(a1, "doesOverrideViewControllerMethod:inBaseClass:", sel_preferredInterfaceOrientationForPresentation, objc_opt_class());
}

- (BOOL)_optsOutOfPopoverControllerHierarchyCheck
{
  return -[UISplitViewControllerImpl _optsOutOfPopoverControllerHierarchyCheck](self->_impl, "_optsOutOfPopoverControllerHierarchyCheck");
}

- (void)_getRotationContentSettings:(id *)a3
{
  -[UISplitViewControllerImpl _getRotationContentSettings:](self->_impl, "_getRotationContentSettings:", a3);
}

- (id)_childViewControllersToSendViewWillTransitionToSize
{
  return (id)-[UISplitViewControllerImpl _childViewControllersToSendViewWillTransitionToSize](self->_impl, "_childViewControllersToSendViewWillTransitionToSize");
}

- (id)_super_childViewControllersToSendViewWillTransitionToSize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISplitViewController;
  -[UIViewController _childViewControllersToSendViewWillTransitionToSize](&v3, sel__childViewControllersToSendViewWillTransitionToSize);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_handlesCounterRotationForPresentation
{
  return -[UISplitViewControllerImpl _handlesCounterRotationForPresentation](self->_impl, "_handlesCounterRotationForPresentation");
}

- (BOOL)_shouldOverlayTabBar
{
  return 1;
}

- (_UITabContainerView)_tabBarHostedView
{
  void *v2;
  void *v3;

  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabBarHostedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UITabContainerView *)v3;
}

- (void)_setTabBarHostedView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTabBarHostedView:", v4);

}

- (id)_primaryContentResponder
{
  return (id)-[UISplitViewControllerImpl _primaryContentResponder](self->_impl, "_primaryContentResponder");
}

- (id)_deepestActionResponder
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__UISplitViewController__deepestActionResponder__block_invoke;
  v3[3] = &unk_1E16BE5F0;
  v3[4] = self;
  -[UIViewController _deepestPresentedActionResponderOrBlock:](self, "_deepestPresentedActionResponderOrBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __48__UISplitViewController__deepestActionResponder__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "_deepestActionResponder");
}

- (id)_super_deepestActionResponder
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISplitViewController;
  -[UIViewController _deepestActionResponder](&v3, sel__deepestActionResponder);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_nextResponderUsingTargetActionStrategyFromChildViewController:(id)a3 didTraverseToParentViewController:(BOOL *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UISplitViewController *v13;

  v6 = a3;
  if (qword_1ECD7C5E0 != -1)
    dispatch_once(&qword_1ECD7C5E0, &__block_literal_global_160);
  if ((byte_1ECD7C5BA & 1) == 0 && dyld_program_sdk_at_least())
  {
    v7 = v6;
    if (v7)
    {
      v8 = v7;
      while (1)
      {
        -[UISplitViewControllerImpl _nextVisibleViewControllerForResponderAfterChildViewController:](self->_impl, "_nextVisibleViewControllerForResponderAfterChildViewController:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "_hasDeepestActionResponder"))
          break;

        v8 = v9;
        if (!v9)
          goto LABEL_9;
      }
      objc_msgSend(v9, "_deepestActionResponder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!a4)
        goto LABEL_11;
    }
    else
    {
LABEL_9:
      v10 = 0;
      if (!a4)
        goto LABEL_11;
    }
    *a4 = 1;
LABEL_11:
    if (!v10)
    {
      -[UIViewController _existingView](self, "_existingView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "window");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v11, "_deepestActionResponder");
        v13 = (UISplitViewController *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = self;
      }
      v10 = v13;

    }
    goto LABEL_17;
  }
  if (a4)
    *a4 = 1;
  objc_msgSend(v6, "nextResponder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v10;
}

void __122__UISplitViewController__nextResponderUsingTargetActionStrategyFromChildViewController_didTraverseToParentViewController___block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  uint64_t v3;

  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_UISplitViewControllerSkipTargetActionBundleChecks, (uint64_t)CFSTR("UISplitViewControllerSkipTargetActionBundleChecks"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| !byte_1ECD7609C)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "bundleIdentifier");
    v3 = objc_claimAutoreleasedReturnValue();

    v1 = (void *)v3;
    if (v3)
    {
      v2 = objc_msgSend(&unk_1E1A93158, "containsObject:", v3);
      v1 = (void *)v3;
      if (v2)
        byte_1ECD7C5BA = 1;
    }

  }
}

+ (void)_setForcedImpl:(int64_t)a3
{
  __forcedImpl = a3;
}

- (BOOL)_isLockedForDelegateCallback
{
  return self->__lockedForDelegateCallback;
}

- (void)_setLockedForDelegateCallback:(BOOL)a3
{
  self->__lockedForDelegateCallback = a3;
}

- (BOOL)_alwaysAllowsSystemPreferredContentSize
{
  return self->__alwaysAllowsSystemPreferredContentSize;
}

- (void)set_alwaysAllowsSystemPreferredContentSize:(BOOL)a3
{
  self->__alwaysAllowsSystemPreferredContentSize = a3;
}

- (id)_allContainedViewControllers
{
  return (id)-[UISplitViewControllerImpl _allContainedViewControllers](self->_impl, "_allContainedViewControllers");
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  UISplitViewControllerImpl *impl;
  id v5;
  objc_super v6;

  impl = self->_impl;
  v5 = a3;
  -[UISplitViewControllerImpl encodeRestorableStateWithCoder:](impl, "encodeRestorableStateWithCoder:", v5);
  v6.receiver = self;
  v6.super_class = (Class)UISplitViewController;
  -[UIViewController encodeRestorableStateWithCoder:](&v6, sel_encodeRestorableStateWithCoder_, v5);

}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  UISplitViewControllerImpl *impl;
  id v5;
  objc_super v6;

  impl = self->_impl;
  v5 = a3;
  -[UISplitViewControllerImpl decodeRestorableStateWithCoder:](impl, "decodeRestorableStateWithCoder:", v5);
  v6.receiver = self;
  v6.super_class = (Class)UISplitViewController;
  -[UIResponder decodeRestorableStateWithCoder:](&v6, sel_decodeRestorableStateWithCoder_, v5);

}

- (id)_effectiveActivityItemsConfiguration
{
  return (id)-[UISplitViewControllerImpl _effectiveActivityItemsConfiguration](self->_impl, "_effectiveActivityItemsConfiguration");
}

- (id)_super_effectiveActivityItemsConfiguration
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISplitViewController;
  -[UIResponder _effectiveActivityItemsConfiguration](&v3, sel__effectiveActivityItemsConfiguration);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_usesPanelImpl
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (UISlidingBarConfiguration)configuration
{
  void *v2;
  void *v3;

  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UISlidingBarConfiguration *)v3;
}

- (UISlidingBarState)currentState
{
  void *v2;
  void *v3;

  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UISlidingBarState *)v3;
}

- (NSArray)possibleStates
{
  void *v2;
  void *v3;

  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "possibleStates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (UISlidingBarStateRequest)stateRequest
{
  void *v2;
  void *v3;

  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stateRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UISlidingBarStateRequest *)v3;
}

- (void)setStateRequest:(id)a3
{
  UISplitViewControllerImpl *impl;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  impl = self->_impl;
  v6 = a3;
  if (-[UISplitViewControllerImpl lockedForDelegateCallback](impl, "lockedForDelegateCallback"))
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("Mutating UISplitViewController with -%@ is not allowed during a delegate callback."), v9);

  }
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStateRequest:", v6);

}

- (void)_animateToRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animateToRequest:", v4);

}

- (void)_updateDisplayModeButtonItem
{
  id v2;

  -[UISplitViewController _panelImpl](self, "_panelImpl");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateDisplayModeButtonItem");

}

@end
