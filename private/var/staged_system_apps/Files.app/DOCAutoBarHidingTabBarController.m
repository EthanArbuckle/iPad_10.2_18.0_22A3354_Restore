@implementation DOCAutoBarHidingTabBarController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DOCAutoBarHidingTabBarController;
  -[DOCAutoBarHidingTabBarController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCAutoBarHidingTabBarController tabBar](self, "tabBar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  objc_msgSend(v4, "setHitTestsAsOpaque:", 1);

}

- (void)setSafeAreaUpdatesDisabledDuringTransitions:(BOOL)a3
{
  self->_safeAreaUpdatesDisabledDuringTransitions = a3;
}

- (void)loadViewControllers:(id)a3 initialIndex:(unint64_t)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  DOCTabItemPlaceholderViewController *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  DOCAutoBarHidingTabBarController *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  unint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];

  v6 = a3;
  v7 = -[DOCAutoBarHidingTabBarController selectedIndex](self, "selectedIndex");
  v37 = 0u;
  v38 = 0u;
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
    v8 = 0;
  else
    v8 = (unint64_t)v7;
  v39 = 0uLL;
  v40 = 0uLL;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DOCAutoBarHidingTabBarController viewControllers](self, "viewControllers"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i), "removeObserver:forKeyPath:", self, CFSTR("preferredContentSize"));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v11);
  }

  v14 = objc_msgSend(v6, "count");
  if (a4 == 0x7FFFFFFFFFFFFFFFLL || !v14 || (unint64_t)objc_msgSend(v6, "count") <= v8)
  {
    v27 = self;
    v28 = v6;
LABEL_25:
    -[DOCAutoBarHidingTabBarController setViewControllers:animated:](v27, "setViewControllers:animated:", v28, 0);
    goto LABEL_26;
  }
  v15 = objc_msgSend(v6, "count");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v34 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j), "addObserver:forKeyPath:options:context:", self, CFSTR("preferredContentSize"), 1, 0);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v18);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", a4));
  objc_msgSend(v21, "preferredContentSize");
  -[DOCAutoBarHidingTabBarController setPreferredContentSize:](self, "setPreferredContentSize:");

  if (v8 == a4 || (unint64_t)v15 <= a4)
  {
    v27 = self;
    v28 = v16;
    goto LABEL_25;
  }
  v22 = objc_opt_new(DOCTabItemPlaceholderViewController);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", v8));
  -[DOCTabItemPlaceholderViewController setActualViewController:](v22, "setActualViewController:", v23);

  v24 = objc_msgSend(v16, "mutableCopy");
  objc_msgSend(v24, "replaceObjectAtIndex:withObject:", v8, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", a4));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000B9818;
  v29[3] = &unk_1005BE758;
  v29[4] = self;
  v30 = v24;
  v32 = a4;
  v31 = v16;
  v26 = v24;
  -[DOCAutoBarHidingTabBarController _performWhileNotingInflightSelectedViewController:block:](self, "_performWhileNotingInflightSelectedViewController:block:", v25, v29);

LABEL_26:
}

- (void)_setSelectedViewController:(id)a3
{
  id v4;
  id v5;
  NSNumber *soleValidIndex;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD *v11;
  _BOOL4 usingSharedSplitBrowserStrategy;
  unsigned int v13;
  BOOL v14;
  _QWORD v15[4];
  _QWORD *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  if (objc_msgSend(v4, "doc_isAppearing"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[DOCAutoBarHidingTabBarController _underlyingSelectedViewController](self, "_underlyingSelectedViewController"));

    if (v5 != v4)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000B9698;
      v19[3] = &unk_1005BE558;
      v20 = v4;
      +[UIViewController doc_performWithDeferredTransitionsAndAnimationsDisabled:](UIViewController, "doc_performWithDeferredTransitionsAndAnimationsDisabled:", v19);

    }
  }
  soleValidIndex = self->_soleValidIndex;
  if (soleValidIndex)
  {
    v7 = -[NSNumber unsignedIntegerValue](soleValidIndex, "unsignedIntegerValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCAutoBarHidingTabBarController viewControllers](self, "viewControllers"));
    v9 = objc_msgSend(v8, "indexOfObject:", v4);

    if (v9 != v7)
      DOCLogAssertionFailure("selectedIndex == requiredIndex", "/Library/Caches/com.apple.xbs/Sources/DocumentManager_executables/Service/DOCAutoBarHidingTabBarController.m", "-[DOCAutoBarHidingTabBarController _setSelectedViewController:]", 204, CFSTR("Invalid tab index detected"));
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000B96C8;
  v17[3] = &unk_1005BE508;
  v17[4] = self;
  v10 = v4;
  v18 = v10;
  v11 = objc_retainBlock(v17);
  usingSharedSplitBrowserStrategy = self->_usingSharedSplitBrowserStrategy;
  v13 = -[DOCAutoBarHidingTabBarController enclosedInUIPDocumentLanding](self, "enclosedInUIPDocumentLanding");
  v14 = !usingSharedSplitBrowserStrategy && v13 == 0;
  if (v14 || (objc_msgSend((id)objc_opt_class(self), "disableWorkaroundFor123787016") & 1) != 0)
  {
    ((void (*)(_QWORD *))v11[2])(v11);
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000B9778;
    v15[3] = &unk_1005BE618;
    v16 = v11;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v15);

  }
}

- (void)setNeverAllowShowingSystemTabs:(BOOL)a3
{
  if (self->_neverAllowShowingSystemTabs != a3)
  {
    self->_neverAllowShowingSystemTabs = a3;
    -[DOCAutoBarHidingTabBarController _updateBarVisibility](self, "_updateBarVisibility");
  }
}

- (void)setSoleValidIndex:(id)a3
{
  NSNumber *v5;
  NSNumber *soleValidIndex;
  _BOOL4 v7;
  _BOOL4 v8;
  id v9;
  NSNumber *v10;

  v5 = (NSNumber *)a3;
  soleValidIndex = self->_soleValidIndex;
  if (soleValidIndex != v5)
  {
    v7 = soleValidIndex != 0;
    v8 = v5 == 0;
    v10 = v5;
    objc_storeStrong((id *)&self->_soleValidIndex, a3);
    v5 = v10;
    if (((v8 ^ v7) & 1) == 0)
    {
      if (v10)
      {
        v9 = -[NSNumber unsignedIntegerValue](self->_soleValidIndex, "unsignedIntegerValue");
        if (v9 != -[DOCAutoBarHidingTabBarController selectedIndex](self, "selectedIndex"))
          -[DOCAutoBarHidingTabBarController setSelectedIndex:](self, "setSelectedIndex:", v9);
      }
      -[DOCAutoBarHidingTabBarController _updateBarVisibility](self, "_updateBarVisibility");
      v5 = v10;
    }
  }

}

- (id)_selectedOrInflightSelectedViewController
{
  UIViewController *tabViewControllerBeingSelected;

  tabViewControllerBeingSelected = self->_tabViewControllerBeingSelected;
  if (tabViewControllerBeingSelected)
    return tabViewControllerBeingSelected;
  else
    return (id)objc_claimAutoreleasedReturnValue(-[DOCAutoBarHidingTabBarController _underlyingSelectedViewController](self, "_underlyingSelectedViewController"));
}

- (unint64_t)selectedOrInflightSelectedTab
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCAutoBarHidingTabBarController _selectedOrInflightSelectedViewController](self, "_selectedOrInflightSelectedViewController"));
  v3 = objc_opt_class(DOCTabItemPlaceholderViewController);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "actualViewController"));

    v2 = (void *)v4;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "tabBarItem"));
  if (v5 && (v6 = objc_opt_class(_TtC5Files13DOCTabBarItem), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = objc_msgSend(v5, "tab");
  }
  else
  {
    DOCLogAssertionFailure("NO", "/Library/Caches/com.apple.xbs/Sources/DocumentManager_executables/Service/DOCAutoBarHidingTabBarController.m", "-[DOCAutoBarHidingTabBarController selectedOrInflightSelectedTab]", 93, CFSTR("Unexpected condition - tab controller is unable to determine the current DOCTab"));
    v7 = 0;
  }

  return (unint64_t)v7;
}

- (void)hideBar
{
  self->_forceBarHidden = 1;
  -[DOCAutoBarHidingTabBarController _updateBarVisibilityAnimated:](self, "_updateBarVisibilityAnimated:", 1);
}

- (void)showBarIfAllowed
{
  uint64_t v3;

  v3 = +[UIKeyboard isOnScreen](UIKeyboard, "isOnScreen") ^ 1;
  self->_forceBarHidden = 0;
  -[DOCAutoBarHidingTabBarController _updateBarVisibilityAnimated:](self, "_updateBarVisibilityAnimated:", v3);
}

- (void)_updateBarVisibility
{
  -[DOCAutoBarHidingTabBarController _updateBarVisibilityAnimated:](self, "_updateBarVisibilityAnimated:", -[DOCAutoBarHidingTabBarController _appearState](self, "_appearState") == 2);
}

- (void)_updateBarVisibilityAnimated:(BOOL)a3
{
  _BOOL8 v4;
  int forceBarHidden;
  _QWORD v6[5];
  char v7;
  BOOL v8;

  v4 = a3 && +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  if (self->_soleValidIndex || self->_neverAllowShowingSystemTabs)
  {
    if ((-[DOCAutoBarHidingTabBarController _uip_isTabBarHidden](self, "_uip_isTabBarHidden") & 1) != 0)
      return;
    LOBYTE(forceBarHidden) = 1;
  }
  else
  {
    forceBarHidden = self->_forceBarHidden;
    if (forceBarHidden == -[DOCAutoBarHidingTabBarController _uip_isTabBarHidden](self, "_uip_isTabBarHidden"))return;
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B9610;
  v6[3] = &unk_1005BE730;
  v6[4] = self;
  v7 = forceBarHidden;
  v8 = v4;
  +[UIView doc_performAllowingAnimations:block:](UIView, "doc_performAllowingAnimations:block:", v4, v6);
}

- (void)_showBarWithTransition:(int)a3 isExplicit:(BOOL)a4 duration:(double)a5
{
  _BOOL8 v6;
  uint64_t v7;
  objc_super v9;

  v6 = a4;
  v7 = *(_QWORD *)&a3;
  if (!-[DOCAutoBarHidingTabBarController neverAllowShowingSystemTabs](self, "neverAllowShowingSystemTabs"))
  {
    v9.receiver = self;
    v9.super_class = (Class)DOCAutoBarHidingTabBarController;
    -[DOCAutoBarHidingTabBarController _showBarWithTransition:isExplicit:duration:](&v9, "_showBarWithTransition:isExplicit:duration:", v7, v6, a5);
  }
}

- (id)_underlyingSelectedViewController
{
  return -[DOCAutoBarHidingTabBarController selectedViewController](self, "selectedViewController");
}

- (void)_performWhileNotingInflightSelectedViewController:(id)a3 block:(id)a4
{
  UIViewController **p_tabViewControllerBeingSelected;
  void (*v8)(void);
  UIViewController *v9;
  void (**v10)(void);
  id v11;

  v11 = a3;
  p_tabViewControllerBeingSelected = &self->_tabViewControllerBeingSelected;
  if (*p_tabViewControllerBeingSelected)
  {
    v8 = (void (*)(void))*((_QWORD *)a4 + 2);
    v9 = (UIViewController *)a4;
    v8();
  }
  else
  {
    objc_storeStrong((id *)p_tabViewControllerBeingSelected, a3);
    v10 = (void (**)(void))a4;
    v10[2]();

    v9 = *p_tabViewControllerBeingSelected;
    *p_tabViewControllerBeingSelected = 0;
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  unsigned int v10;
  id v11;

  v11 = a4;
  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[DOCAutoBarHidingTabBarController _underlyingSelectedViewController](self, "_underlyingSelectedViewController"));
  v10 = objc_msgSend(v8, "isEqualToString:", CFSTR("preferredContentSize"));

  if (v10 && v9 == v11)
  {
    objc_msgSend(v11, "preferredContentSize");
    -[DOCAutoBarHidingTabBarController setPreferredContentSize:](self, "setPreferredContentSize:");
  }

}

- (void)setFloatingTabBarSidebarToggleAction:(id)a3
{
  -[DOCAutoBarHidingTabBarController _setOverrideTidebarButtonAction:](self, "_setOverrideTidebarButtonAction:", a3);
}

- (UIAction)floatingTabBarSidebarToggleAction
{
  return (UIAction *)-[DOCAutoBarHidingTabBarController _overrideTidebarButtonAction](self, "_overrideTidebarButtonAction");
}

+ (BOOL)disableWorkaroundFor123787016
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("DisableWorkaroundFor123787016"));

  return v3;
}

- (NSNumber)soleValidIndex
{
  return self->_soleValidIndex;
}

- (BOOL)neverAllowShowingSystemTabs
{
  return self->_neverAllowShowingSystemTabs;
}

- (BOOL)safeAreaUpdatesDisabledDuringTransitions
{
  return self->_safeAreaUpdatesDisabledDuringTransitions;
}

- (BOOL)usingSharedSplitBrowserStrategy
{
  return self->_usingSharedSplitBrowserStrategy;
}

- (void)setUsingSharedSplitBrowserStrategy:(BOOL)a3
{
  self->_usingSharedSplitBrowserStrategy = a3;
}

- (BOOL)forceBarHidden
{
  return self->_forceBarHidden;
}

- (void)setForceBarHidden:(BOOL)a3
{
  self->_forceBarHidden = a3;
}

- (UIViewController)tabViewControllerBeingSelected
{
  return self->_tabViewControllerBeingSelected;
}

- (void)setTabViewControllerBeingSelected:(id)a3
{
  objc_storeStrong((id *)&self->_tabViewControllerBeingSelected, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabViewControllerBeingSelected, 0);
  objc_storeStrong((id *)&self->_soleValidIndex, 0);
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  id v6;
  DOCAutoBarHidingTabBarController *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  unint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  UIEdgeInsets result;

  v23.receiver = self;
  v23.super_class = (Class)DOCAutoBarHidingTabBarController;
  v6 = a3;
  v7 = self;
  -[DOCAutoBarHidingTabBarController _edgeInsetsForChildViewController:insetsAreAbsolute:](&v23, "_edgeInsetsForChildViewController:insetsAreAbsolute:", v6, a4);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = -[DOCAutoBarHidingTabBarController traitCollection](v7, "traitCollection", v23.receiver, v23.super_class);
  v17 = sub_1001BFEB0();
  v18 = UITraitCollection.subscript.getter(&type metadata for UITraitCollection.DOCTabBarBlurAvoidanceTrait, &type metadata for UITraitCollection.DOCTabBarBlurAvoidanceTrait, v17);

  v19 = v13 + v18;
  v20 = v9;
  v21 = v11;
  v22 = v15;
  result.right = v22;
  result.bottom = v19;
  result.left = v21;
  result.top = v20;
  return result;
}

@end
