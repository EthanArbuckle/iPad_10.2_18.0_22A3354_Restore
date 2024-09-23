@implementation UISplitViewControllerPanelImpl

void __138__UISplitViewControllerPanelImpl_panelController_collapsePrimaryViewController_withFallbackSecondaryViewController_transitionCoordinator___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void (**v5)(_QWORD);
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_QWORD *);
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __138__UISplitViewControllerPanelImpl_panelController_collapsePrimaryViewController_withFallbackSecondaryViewController_transitionCoordinator___block_invoke_2;
  v9 = &unk_1E16B51E8;
  v10 = *(id *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  v11 = v2;
  v12 = v3;
  v13 = v4;
  v5 = (void (**)(_QWORD))_Block_copy(&v6);
  if (objc_msgSend(*(id *)(a1 + 32), "_isNavigationController", v6, v7, v8, v9))
    objc_msgSend(*(id *)(a1 + 32), "_executeSplitViewControllerActions:", v5);
  else
    v5[2](v5);

}

- (BOOL)isCollapsed
{
  void *v3;
  void *v4;
  char v5;

  if (self->_transitioningToTraitCollection)
    return -[UISplitViewControllerPanelImpl _isCollapsed](self, "_isCollapsed");
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCollapsed");

  return v5;
}

- (double)_contentMarginForChildViewController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;

  v4 = a3;
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainViewController");
  v6 = objc_claimAutoreleasedReturnValue();
  if ((id)v6 == v4)
  {

    goto LABEL_5;
  }
  v7 = (void *)v6;
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collapsedViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v4)
  {
LABEL_5:
    objc_msgSend(v4, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIViewController _horizontalContentMarginForView:](UIViewController, "_horizontalContentMarginForView:", v10);
    goto LABEL_6;
  }
  objc_msgSend(v4, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIViewController _slimHorizontalContentMarginForTraitCollection:](UIViewController, "_slimHorizontalContentMarginForTraitCollection:", v10);
LABEL_6:
  v12 = v11;

  return v12;
}

- (BOOL)_isCollapsedOrCollapsing
{
  BOOL v3;
  void *v4;
  void *v5;

  if (-[UISplitViewControllerPanelImpl _isCollapsed](self, "_isCollapsed"))
    return 1;
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "_collapsedState") == 1;

  return v3;
}

- (BOOL)_isCollapsed
{
  void *v2;
  char v3;

  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCollapsed");

  return v3;
}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char v16;
  int64_t v17;
  uint64_t v18;
  _QWORD v20[5];

  v4 = a3;
  +[UITraitCollection _emptyTraitCollection]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_29;
  -[UISplitViewControllerPanelImpl _currentPrimaryChildViewController](self, "_currentPrimaryChildViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading"))
    {
      if ((objc_msgSend(v8, "leadingOverlapsMain") & 1) == 0)
      {
LABEL_5:

        goto LABEL_8;
      }
    }
    else if ((objc_msgSend(v8, "trailingOverlapsMain") & 1) == 0)
    {
      goto LABEL_5;
    }
    -[UITraitCollection _traitCollectionWithIncrementedBackgroundLevel](v5);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
    if (!v9)
      goto LABEL_29;
  }
LABEL_8:
  if (!objc_msgSend(v4, "__isKindOfUIViewController"))
    goto LABEL_29;
  -[UISplitViewControllerPanelImpl _currentPrimaryChildViewController](self, "_currentPrimaryChildViewController");
  v10 = objc_claimAutoreleasedReturnValue();
  if ((id)v10 == v4)
  {

  }
  else
  {
    v11 = (void *)v10;
    if ((*((_BYTE *)&self->_flags + 5) & 4) == 0 || -[UISplitViewControllerPanelImpl style](self, "style") != 2)
      goto LABEL_17;
    v12 = -[UISplitViewControllerPanelImpl _columnForViewController:](self, "_columnForViewController:", v4);

    if (v12 != 1)
      goto LABEL_18;
  }
  if (self->_primaryBackgroundStyle == 1)
  {
    objc_msgSend(v5, "_traitCollectionByReplacingNSIntegerValue:forTraitToken:", 2, 0x1E1A99660);
    v11 = v5;
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  }
LABEL_18:
  if (-[UISplitViewControllerPanelImpl style](self, "style")
    && !-[UISplitViewControllerPanelImpl _isCollapsed](self, "_isCollapsed"))
  {
    v13 = -[UISplitViewControllerPanelImpl _columnForViewController:](self, "_columnForViewController:", v4);
    v14 = v13;
    if (v13 < 2)
    {
      if (v13 == 1)
      {
        v15 = 3;
      }
      else
      {
        v17 = -[UISplitViewControllerPanelImpl style](self, "style");
        v15 = 1;
        if (v17 == 2)
          v15 = 2;
      }
      goto LABEL_28;
    }
    v16 = dyld_program_sdk_at_least();
    if (v14 == 3 && (v16 & 1) != 0)
    {
      v15 = 0;
LABEL_28:
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __70__UISplitViewControllerPanelImpl__traitCollectionForChildEnvironment___block_invoke;
      v20[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
      v20[4] = v15;
      objc_msgSend(v5, "traitCollectionByModifyingTraits:", v20);
      v18 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v18;
    }
  }
LABEL_29:

  return v5;
}

- (int64_t)style
{
  return -[UIPanelController style](self->_panelController, "style");
}

- (id)_currentPrimaryChildViewController
{
  void *v3;
  void *v4;

  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading"))
    objc_msgSend(v3, "leadingViewController");
  else
    objc_msgSend(v3, "trailingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIPanelController)panelController
{
  return self->_panelController;
}

- (BOOL)_isPrimaryLeading
{
  return self->_primaryEdge == 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (dyld_program_sdk_at_least() && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_svc);
    v6 = objc_msgSend(v4, "splitViewControllerSupportedInterfaceOrientations:", v5);
  }
  else
  {
    v5 = objc_loadWeakRetained((id *)p_svc);
    v6 = objc_msgSend(v5, "_super_supportedInterfaceOrientations");
  }
  v7 = v6;

  return v7;
}

- (UISplitViewControllerDelegate)delegate
{
  return (UISplitViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)viewWillAppear:(BOOL)a3
{
  self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&self->_flags & 0xFFFFFFFF7FFFFFFFLL | ((unint64_t)(self->_lastSettledDisplayMode == 0) << 31));
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4;
  $692BA5F601ABB544448C4E0A48A865F8 flags;
  int64_t v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if (_UISplitViewControllerAutoHidesColumns(WeakRetained)
    && !-[UISplitViewControllerPanelImpl _isCollapsedOrCollapsing](self, "_isCollapsedOrCollapsing"))
  {
    v4 = *(_QWORD *)&self->_flags & 0xC0000;

    if (v4)
    {
      flags = self->_flags;
      self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&flags & 0xFFFFFFFFFFF3FFFFLL);
      v6 = -[UISplitViewControllerPanelImpl displayMode](self, "displayMode");
      if (v6 != -[UISplitViewControllerPanelImpl allowedDisplayModeForCurrentSplitBehaviorGivenDisplayMode:](self, "allowedDisplayModeForCurrentSplitBehaviorGivenDisplayMode:", v6))self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFF3FFFFLL | (((*(unint64_t *)&flags >> 18) & 3) << 18));
    }
  }
  else
  {

  }
}

- (id)panelController:(id)a3 navigationBarForViewController:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;

  v5 = a4;
  if (-[UISplitViewControllerPanelImpl _alwaysHideSidebarToggleButton](self, "_alwaysHideSidebarToggleButton")
    || (v6 = -[UISplitViewControllerPanelImpl _columnForViewController:](self, "_columnForViewController:", v5), v6 > 2))
  {
    v7 = 0;
  }
  else
  {
    -[UISplitViewControllerPanelImpl _navigationBarForSidebarButtonForColumn:](self, "_navigationBarForSidebarButtonForColumn:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (Class)viewClassForPanelController:(id)a3
{
  return (Class)objc_opt_class();
}

- (UIColor)primaryBackgroundColor
{
  void *v2;
  void *v3;

  -[UISplitViewControllerPanelImpl styleProvider](self, "styleProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)panelController:(id)a3 willChangeToState:(id)a4
{
  id v6;
  int64_t animatingToDisplayMode;
  int64_t lastNotifiedMode;
  _BOOL4 v10;
  void *v11;
  int64_t v12;
  id WeakRetained;
  void *v14;
  unint64_t v15;
  int v16;
  BOOL v17;
  _BOOL4 v18;
  void *v19;
  id v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;

  v27 = a3;
  v6 = a4;
  animatingToDisplayMode = self->_animatingToDisplayMode;
  if (!animatingToDisplayMode)
    animatingToDisplayMode = -[UISplitViewControllerPanelImpl _displayModeForState:](self, "_displayModeForState:", v6);
  lastNotifiedMode = self->_lastNotifiedMode;
  v10 = animatingToDisplayMode != lastNotifiedMode && lastNotifiedMode != 0;
  if (!lastNotifiedMode)
  {
LABEL_12:
    if (!dyld_program_sdk_at_least())
      goto LABEL_43;
    goto LABEL_13;
  }
  objc_msgSend(v27, "currentState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if (v11)
      goto LABEL_43;
    goto LABEL_12;
  }
LABEL_13:
  v12 = self->_lastNotifiedMode;
  self->_lastNotifiedMode = animatingToDisplayMode;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = animatingToDisplayMode & 0xFFFFFFFFFFFFFFFELL;
  if ((v12 & 0xFFFFFFFFFFFFFFFELL) == 2 && animatingToDisplayMode == 1)
  {
    -[UISplitViewControllerPanelImpl callDeprecatedWillHideDelegateCallbackIfNecessary](self, "callDeprecatedWillHideDelegateCallbackIfNecessary");
  }
  else if (v15 == 2 && v12 == 1)
  {
    -[UISplitViewControllerPanelImpl callDeprecatedWillShowDelegateCallbackIfNecessary](self, "callDeprecatedWillShowDelegateCallbackIfNecessary");
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *(_QWORD *)&self->_flags |= 0x8000000uLL;
    objc_msgSend(v14, "splitViewController:willChangeToDisplayMode:", WeakRetained, animatingToDisplayMode);
    *(_QWORD *)&self->_flags &= ~0x8000000uLL;
  }
  -[UISplitViewControllerPanelImpl sendColumnShowHideNotificationsForNewState:newDisplayMode:oldDisplayMode:](self, "sendColumnShowHideNotificationsForNewState:newDisplayMode:oldDisplayMode:", v6, animatingToDisplayMode, v12);
  -[UISplitViewControllerPanelImpl _updateTriggerSidebarKeyCommandTitleForNewDisplayMode:](self, "_updateTriggerSidebarKeyCommandTitleForNewDisplayMode:", animatingToDisplayMode);
  if (!-[UIPanelController collapsedState](self->_panelController, "collapsedState"))
  {
    v16 = objc_msgSend(v6, "isCollapsed");
    v17 = animatingToDisplayMode == 1 || v12 == 1;
    v18 = v17;
    if (!v16 && v12 != animatingToDisplayMode && v18)
    {
      v26 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v26, "_tabBarControllerEnforcingClass:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v19, "_viewControllerObservableScrollViewAmbiguityStatusDidChange:", v20);

      v15 = animatingToDisplayMode & 0xFFFFFFFFFFFFFFFELL;
    }
  }
  if (-[UISplitViewControllerPanelImpl style](self, "style") == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21 && v10;

    if (v22
      && (v15 == 2 && (unint64_t)(v12 - 5) < 2
       || (unint64_t)(animatingToDisplayMode - 5) <= 1 && (v12 & 0xFFFFFFFFFFFFFFFELL) == 2))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "navigationController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "navigationBar");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_refreshBackButtonMenu");

    }
  }

LABEL_43:
}

- (int64_t)displayMode
{
  void *v3;
  int64_t v4;
  void *v5;

  if (-[NSMutableArray count](self->_overrideReportedDisplayModeStack, "count"))
  {
    -[NSMutableArray lastObject](self->_overrideReportedDisplayModeStack, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");
  }
  else
  {
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[UISplitViewControllerPanelImpl _displayModeForState:](self, "_displayModeForState:", v5);

  }
  return v4;
}

- (int64_t)_displayModeForState:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  int v9;
  int64_t v10;
  int64_t v11;
  int v12;
  int v13;
  void *v14;
  int v15;
  char v16;
  int v17;
  char v18;
  void *v20;
  void *v21;
  unint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    if (v4)
    {
      v5 = v4;
      if (!self)
      {
        v11 = 0;
        goto LABEL_44;
      }
      v6 = -[UISplitViewControllerPanelImpl style](self, "style");
      if (v6 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        _UISplitViewControllerStyleDescription(v6);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", sel__columnStyleDisplayModeDirectlyFromState_, self, CFSTR("UISplitViewControllerPanelImpl.m"), 9057, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v21);

      }
      v7 = -[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading");
      v8 = objc_msgSend(v5, "_collapsedState");
      if (v8 == 1)
        v9 = (*((unsigned __int8 *)&self->_flags + 3) >> 4) & 1;
      else
        v9 = 0;
      if ((unint64_t)(v8 - 3) >= 0xFFFFFFFFFFFFFFFELL && !v9)
      {
        v11 = 2;
LABEL_44:

        goto LABEL_45;
      }
      if (v7)
      {
        v12 = objc_msgSend(v5, "isLeadingVisible");
        v13 = objc_msgSend(v5, "isSupplementaryVisible");
        if (v12 && (v13 & 1) != 0)
        {
          if ((objc_msgSend(v5, "leadingOverlapsMain") & 1) != 0)
          {
LABEL_19:
            v11 = 5;
            goto LABEL_44;
          }
LABEL_23:
          objc_msgSend(v5, "configuration");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "allowTotalWidthGreaterThanParent");

          if (v15)
            v11 = 6;
          else
            v11 = 4;
          goto LABEL_44;
        }
        if (v6 == 1)
          v16 = v12;
        else
          v16 = 0;
        if ((v16 & 1) != 0)
        {
          v17 = objc_msgSend(v5, "leadingOverlapsMain");
          goto LABEL_39;
        }
      }
      else
      {
        v12 = objc_msgSend(v5, "isTrailingVisible");
        v13 = objc_msgSend(v5, "isSupplementaryVisible");
        if (v12 && (v13 & 1) != 0)
        {
          if ((objc_msgSend(v5, "trailingOverlapsMain") & 1) != 0)
            goto LABEL_19;
          goto LABEL_23;
        }
        if (v6 == 1)
          v18 = v12;
        else
          v18 = 0;
        if ((v18 & 1) != 0)
        {
          v17 = objc_msgSend(v5, "trailingOverlapsMain");
LABEL_39:
          if (v17)
            v11 = 3;
          else
            v11 = 2;
          goto LABEL_44;
        }
      }
      if ((v12 & 1) != 0 || !v13)
      {
        if (v12)
        {
          if (os_variant_has_internal_diagnostics())
          {
            __UIFaultDebugAssertLog();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v26 = v5;
              _os_log_fault_impl(&dword_185066000, v24, OS_LOG_TYPE_FAULT, "Unsupported UISlidingBarState (primary visible and supplementary not visible) for calculating displayMode. This is an internal UIKit problem. %@", buf, 0xCu);
            }

          }
          else
          {
            v22 = _columnStyleDisplayModeDirectlyFromState____s_category;
            if (!_columnStyleDisplayModeDirectlyFromState____s_category)
            {
              v22 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v22, (unint64_t *)&_columnStyleDisplayModeDirectlyFromState____s_category);
            }
            v23 = *(NSObject **)(v22 + 8);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v26 = v5;
              _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_ERROR, "Unsupported UISlidingBarState (primary visible and supplementary not visible) for calculating displayMode. This is an internal UIKit problem. %@", buf, 0xCu);
            }
          }
        }
        v11 = 1;
        goto LABEL_44;
      }
      v17 = objc_msgSend(v5, "supplementaryOverlapsMain");
      goto LABEL_39;
    }
    v10 = -[UISplitViewControllerPanelImpl _concreteDisplayModeForCurrentEnvironment](self, "_concreteDisplayModeForCurrentEnvironment");
  }
  else
  {
    v10 = -[UISplitViewControllerPanelImpl _unspecifiedStyleDisplayModeForState:](self, "_unspecifiedStyleDisplayModeForState:", v4);
  }
  v11 = v10;
LABEL_45:

  return v11;
}

- (int64_t)_unspecifiedStyleDisplayModeForState:(id)a3
{
  id v4;
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  int64_t v9;

  v4 = a3;
  v5 = -[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading");
  if (!v4)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) != 1
      || !-[UISplitViewControllerPanelImpl _iPadShouldUseOverlayInCurrentEnvironment](self, "_iPadShouldUseOverlayInCurrentEnvironment"))
    {
      goto LABEL_13;
    }
LABEL_14:
    v9 = 1;
    goto LABEL_15;
  }
  v6 = v5;
  if ((objc_msgSend(v4, "isCollapsed") & 1) != 0)
  {
LABEL_13:
    v9 = 2;
    goto LABEL_15;
  }
  if (!v6)
  {
    if ((objc_msgSend(v4, "isTrailingVisible") & 1) == 0)
      goto LABEL_14;
    if ((objc_msgSend(v4, "trailingOverlapsMain") & 1) != 0)
      goto LABEL_12;
    goto LABEL_13;
  }
  if ((objc_msgSend(v4, "isLeadingVisible") & 1) == 0)
    goto LABEL_14;
  if ((objc_msgSend(v4, "leadingOverlapsMain") & 1) == 0)
    goto LABEL_13;
LABEL_12:
  v9 = 3;
LABEL_15:

  return v9;
}

- (void)sendColumnShowHideNotificationsForNewState:(id)a3 newDisplayMode:(int64_t)a4 oldDisplayMode:(int64_t)a5
{
  int64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *perColumnViewControllers;
  void *v14;
  void *v15;
  int v16;
  int IsVisibleForDisplayMode;
  int v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  int v34;
  int v35;
  _BOOL4 v36;
  int64_t lastNotifiedTopColumnForCollapse;
  id v38;

  v38 = a3;
  v8 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (!v8)
    goto LABEL_42;
  v9 = v8;
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "_collapsedState");
  perColumnViewControllers = self->_perColumnViewControllers;
  if (!v12)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "viewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "_appearState") == 2)
      IsVisibleForDisplayMode = _UISplitViewControllerColumnIsVisibleForDisplayMode(v9, 0, a5);
    else
      IsVisibleForDisplayMode = 0;

    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "viewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "_appearState") == 2)
      v18 = _UISplitViewControllerColumnIsVisibleForDisplayMode(v9, 1, a5);
    else
      v18 = 0;

    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97470);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "viewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "_appearState") == 2)
      v19 = _UISplitViewControllerColumnIsVisibleForDisplayMode(v9, 2, a5);
    else
      v19 = 0;
    goto LABEL_19;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974A0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "viewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "_appearState");

  if (v16 != 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97470);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "viewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "_appearState");

    if (v25 == 2)
    {
      IsVisibleForDisplayMode = 0;
      v18 = 0;
      v20 = 0;
      v19 = 1;
      goto LABEL_20;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "viewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "_appearState");

    if (v32 == 2)
    {
      IsVisibleForDisplayMode = 0;
      v19 = 0;
      v20 = 0;
      v18 = 1;
      goto LABEL_20;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "viewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v19 = 0;
    IsVisibleForDisplayMode = objc_msgSend(v29, "_appearState") == 2;
LABEL_19:

    v20 = 0;
    goto LABEL_20;
  }
  IsVisibleForDisplayMode = 0;
  v18 = 0;
  v19 = 0;
  v20 = 1;
LABEL_20:
  if (!objc_msgSend(v38, "_collapsedState") || objc_msgSend(v38, "_collapsedState") == 3)
  {
    v33 = _UISplitViewControllerColumnIsVisibleForDisplayMode(v9, 0, a4);
    v34 = _UISplitViewControllerColumnIsVisibleForDisplayMode(v9, 1, a4);
    v35 = _UISplitViewControllerColumnIsVisibleForDisplayMode(v9, 2, a4);
    v36 = 0;
    if (!IsVisibleForDisplayMode)
      goto LABEL_27;
LABEL_25:
    if ((v33 & 1) == 0)
      -[UISplitViewControllerPanelImpl sendWillHideColumn:](self, "sendWillHideColumn:", 0);
    goto LABEL_27;
  }
  lastNotifiedTopColumnForCollapse = self->_lastNotifiedTopColumnForCollapse;
  v33 = lastNotifiedTopColumnForCollapse == 0;
  v34 = lastNotifiedTopColumnForCollapse == 1;
  v35 = lastNotifiedTopColumnForCollapse == 2;
  v36 = lastNotifiedTopColumnForCollapse == 3;
  if (IsVisibleForDisplayMode)
    goto LABEL_25;
LABEL_27:
  if (((v18 ^ 1 | v34) & 1) == 0)
    -[UISplitViewControllerPanelImpl sendWillHideColumn:](self, "sendWillHideColumn:", 1);
  if (((v19 ^ 1 | v35) & 1) == 0)
    -[UISplitViewControllerPanelImpl sendWillHideColumn:](self, "sendWillHideColumn:", 2);
  if (((v20 ^ 1 | v36) & 1) == 0)
    -[UISplitViewControllerPanelImpl sendWillHideColumn:](self, "sendWillHideColumn:", 3);
  if (((v18 | v34 ^ 1) & 1) == 0)
    -[UISplitViewControllerPanelImpl sendWillShowColumn:](self, "sendWillShowColumn:", 1);
  if (((IsVisibleForDisplayMode | v33 ^ 1) & 1) == 0)
    -[UISplitViewControllerPanelImpl sendWillShowColumn:](self, "sendWillShowColumn:", 0);
  if (((v19 | v35 ^ 1) & 1) == 0)
    -[UISplitViewControllerPanelImpl sendWillShowColumn:](self, "sendWillShowColumn:", 2);
  if (((v20 | !v36) & 1) == 0)
    -[UISplitViewControllerPanelImpl sendWillShowColumn:](self, "sendWillShowColumn:", 3);

LABEL_42:
}

- (void)_updateTriggerSidebarKeyCommandTitleForNewDisplayMode:(int64_t)a3
{
  void *v5;
  $692BA5F601ABB544448C4E0A48A865F8 flags;
  $692BA5F601ABB544448C4E0A48A865F8 v7;
  id v8;

  if (-[UISplitViewControllerPanelImpl style](self, "style") == 2
    && (-[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    if ((unint64_t)(a3 - 4) >= 3)
    {
LABEL_4:
      flags = self->_flags;
      if ((*(_DWORD *)&flags & 0x800000) == 0)
        return;
      v7 = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&flags & 0xFFFFFFFFFF7FFFFFLL);
      goto LABEL_9;
    }
  }
  else if (a3 == 1)
  {
    goto LABEL_4;
  }
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x800000) != 0)
    return;
  v7 = ($692BA5F601ABB544448C4E0A48A865F8)(*(unint64_t *)&flags | 0x800000);
LABEL_9:
  self->_flags = v7;
  if ((*(_DWORD *)&flags & 0x400000) != 0)
  {
    +[UIMenuSystem mainSystem](UIMenuSystem, "mainSystem");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsRevalidate");

  }
}

- (void)sendWillShowColumn:(int64_t)a3
{
  $692BA5F601ABB544448C4E0A48A865F8 flags;
  $692BA5F601ABB544448C4E0A48A865F8 v6;
  void *v7;
  void *v8;
  id WeakRetained;

  flags = self->_flags;
  if ((*(_QWORD *)&flags & 0x500000000) == 0x100000000)
  {
    self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(unint64_t *)&flags | 0x8000000);
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    v6 = self->_flags;
    -[UISplitViewControllerPanelImpl _columnStyleDelegate](self, "_columnStyleDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((*(_QWORD *)&v6 & 0x800000000) != 0)
      objc_msgSend(v7, "_splitViewController:willShowColumn:", WeakRetained, a3);
    else
      objc_msgSend(v7, "splitViewController:willShowColumn:", WeakRetained, a3);

    *(_QWORD *)&self->_flags &= ~0x8000000uLL;
  }
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  char v9;
  $692BA5F601ABB544448C4E0A48A865F8 flags;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  unint64_t v24;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[UISplitViewControllerPanelImpl _columnStyleDelegate](self, "_columnStyleDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_opt_respondsToSelector();
      v8 = 0x100000000;
      if ((v7 & 1) == 0)
        v8 = 0;
      self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&self->_flags & 0xFFFFFFFEFFFFFFFFLL | v8);
      v9 = objc_opt_respondsToSelector();
      flags = self->_flags;
      v11 = 0x200000000;
      if ((v9 & 1) == 0)
        v11 = 0;
      self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&flags & 0xFFFFFFFDFFFFFFFFLL | v11);
      if ((v9 & 1) == 0 && (*(_QWORD *)&flags & 0x100000000) == 0)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          *(_QWORD *)&self->_flags |= 0x900000000uLL;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          *(_QWORD *)&self->_flags |= 0xA00000000uLL;
      }
      v12 = objc_opt_respondsToSelector();
      v13 = 0x1000000000;
      if ((v12 & 1) == 0)
        v13 = 0;
      self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&self->_flags & 0xFFFFFFEFFFFFFFFFLL | v13);
      v14 = objc_opt_respondsToSelector();
      v15 = 0x4000000000;
      if ((v14 & 1) == 0)
        v15 = 0;
      self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&self->_flags & 0xFFFFFFBFFFFFFFFFLL | v15);
      v16 = objc_opt_respondsToSelector();
      v17 = 0x10000000000;
      if ((v16 & 1) == 0)
        v17 = 0;
      self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&self->_flags & 0xFFFFFEFFFFFFFFFFLL | v17);
      v18 = objc_opt_respondsToSelector();
      v19 = 0x20000000000;
      if ((v18 & 1) == 0)
        v19 = 0;
      self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&self->_flags & 0xFFFFFDFFFFFFFFFFLL | v19);
      v20 = objc_opt_respondsToSelector();
      v21 = 0x2000000000;
      if ((v20 & 1) == 0)
        v21 = 0;
      self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&self->_flags & 0xFFFFFFDFFFFFFFFFLL | v21);
      v22 = objc_opt_respondsToSelector();
      v23 = 0x8000000000;
      if ((v22 & 1) == 0)
        v23 = 0;
      v24 = *(_QWORD *)&self->_flags & 0xFFFFFF7FFFFFFFFFLL | v23;
    }
    else
    {
      v24 = *(_QWORD *)&self->_flags & 0xFFFFFE04FFFFFFFFLL;
    }
    self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)v24;

    v5 = obj;
  }

}

- (id)_columnStyleDelegate
{
  id WeakRetained;

  WeakRetained = -[UISplitViewControllerPanelImpl style](self, "style");
  if (WeakRetained)
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (void)_invalidateAllowsTriggeringSidebarKeyCommandAction
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "viewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

}

- (void)removeChildViewController:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;

  v4 = a3;
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeChildViewController:", v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_super_removeChildViewController:", v4);

}

- (BOOL)_isViewControllerForObservableScrollViewAmbiguous
{
  int64_t animatingToDisplayMode;

  animatingToDisplayMode = self->_animatingToDisplayMode;
  if (!animatingToDisplayMode)
    animatingToDisplayMode = -[UISplitViewControllerPanelImpl displayMode](self, "displayMode");
  return (animatingToDisplayMode != 1) & ~-[UISplitViewControllerPanelImpl isCollapsed](self, "isCollapsed");
}

- (int64_t)defaultDisplayModeForSize:(CGSize)a3
{
  double height;
  double width;
  int64_t v7;
  unint64_t v8;
  int64_t v9;
  UISplitViewController **p_svc;
  id WeakRetained;
  int v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  unint64_t v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  double v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  height = a3.height;
  width = a3.width;
  v39 = *MEMORY[0x1E0C80C00];
  v7 = -[UISplitViewControllerPanelImpl style](self, "style");
  if ((unint64_t)(v7 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v26 = v7;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 2597, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v28);

  }
  if (-[UISplitViewControllerPanelImpl preferredDisplayMode](self, "preferredDisplayMode"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerDisplayModeDescription(-[UISplitViewControllerPanelImpl preferredDisplayMode](self, "preferredDisplayMode"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 2598, CFSTR("Default display mode should not override nonautomatic preferred display mode, %@"), v30);

  }
  v8 = -[UISplitViewControllerPanelImpl splitBehaviorForSize:](self, "splitBehaviorForSize:", width, height);
  v9 = -[UISplitViewControllerPanelImpl defaultDisplayModeForSplitBehavior:](self, "defaultDisplayModeForSplitBehavior:", v8);
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v12 = _UISplitViewControllerAutoHidesColumns(WeakRetained);

  if (v12)
  {
    if (_UIGetUISplitViewControllerChamoisResizeLogging())
    {
      v13 = qword_1ECD7D520;
      if (!qword_1ECD7D520)
      {
        v13 = __UILogCategoryGetNode("ChamoisResize", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v13, (unint64_t *)&qword_1ECD7D520);
      }
      v14 = *(NSObject **)(v13 + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = v14;
        v16 = objc_loadWeakRetained((id *)&self->_svc);
        _UISplitViewControllerSplitBehaviorDescription(v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        _UISplitViewControllerDisplayModeDescription(v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v32 = v16;
        v33 = 2112;
        v34 = v17;
        v35 = 2048;
        v36 = width;
        v37 = 2112;
        v38 = v18;
        _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "%@: Initial default display mode for %@ in width %g is %@", buf, 0x2Au);

      }
    }
    if ((v8 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      v9 = -[UISplitViewControllerPanelImpl _greatestAllowedAutohidingDisplayModeInSize:](self, "_greatestAllowedAutohidingDisplayModeInSize:", width, height);
      if (_UIGetUISplitViewControllerChamoisResizeLogging())
      {
        v19 = qword_1ECD7D528;
        if (!qword_1ECD7D528)
        {
          v19 = __UILogCategoryGetNode("ChamoisResize", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v19, (unint64_t *)&qword_1ECD7D528);
        }
        v20 = *(NSObject **)(v19 + 8);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = v20;
          v22 = objc_loadWeakRetained((id *)p_svc);
          _UISplitViewControllerSplitBehaviorDescription(v8);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          _UISplitViewControllerDisplayModeDescription(v9);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v32 = v22;
          v33 = 2112;
          v34 = v23;
          v35 = 2048;
          v36 = width;
          v37 = 2112;
          v38 = v24;
          _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "%@: Greatest allowed autohiding display mode for %@ split behavior in width %g is %@", buf, 0x2Au);

        }
      }
    }
  }
  return v9;
}

- (int64_t)allowedDisplayModeForCurrentSplitBehaviorGivenDisplayMode:(int64_t)a3
{
  int64_t v5;
  int64_t v6;
  int64_t v7;

  v5 = -[UISplitViewControllerPanelImpl splitBehavior](self, "splitBehavior");
  if (!self)
    return 0;
  if ((unint64_t)(a3 - 4) >= 3)
  {
    if ((unint64_t)(a3 - 2) <= 1)
    {
      if (v5 == 2)
      {
        return 3;
      }
      else if ((*((_BYTE *)&self->_flags + 2) & 2) != 0)
      {
        return 3;
      }
      else
      {
        return 2;
      }
    }
  }
  else if (v5 == 2)
  {
    return 5;
  }
  else
  {
    v6 = 4;
    v7 = 6;
    if (v5 != 3)
      v7 = a3;
    if (v5 != 1)
      v6 = v7;
    if ((*((_BYTE *)&self->_flags + 2) & 2) != 0)
      return 5;
    else
      return v6;
  }
  return a3;
}

- (void)_updateDisplayModeButtonItemForDisplayMode:(int64_t)a3
{
  int64_t v6;
  int64_t v7;
  void *v8;
  _UIFloatableBarButtonItem *v9;
  _UIFloatableBarButtonItem *sidebarToggleButtonItem;
  BOOL v11;
  void *v12;
  _BOOL8 v13;
  _BOOL4 v14;
  int v15;
  uint64_t v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  BOOL v21;
  int v23;
  unsigned int v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  NSMutableDictionary *perColumnViewControllers;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  UIBarButtonItem *v50;
  UIBarButtonItem *secondaryOnlyShortcutButtonItem;
  void *v52;
  void *v53;
  UINavigationBar *v54;
  _BOOL8 v56;
  char v57;
  uint64_t v58;
  _BOOL8 v59;
  void *v61;
  _UIFloatableBarButtonItem *v62;
  int v63;
  _BOOL4 v64;
  BOOL v65;
  void *v66;
  UINavigationBar *v67;
  void *v68;
  double v69;
  _UIFloatableBarButtonItem *v70;
  _UIFloatableBarButtonItem *v71;
  uint64_t v72;
  _UIFloatableBarButtonItem *v73;
  void *v74;
  const __CFString *v75;
  _BOOL8 v76;
  UINavigationBar *navBarForToggleButton;
  char v78;
  UIBarButtonItem *v79;
  int v80;
  int v81;
  void *v82;
  void *v83;
  char v84;
  UINavigationBar *navBarForShortcutButton;
  int v86;
  UIBarButtonItem *v87;
  UIBarButtonItem *v88;
  char v89;
  void *v90;
  _BOOL8 v91;
  UINavigationBar *v92;
  UINavigationBar *v93;
  UINavigationBar *v94;
  void *v95;
  void *v96;
  void *v97;
  char isKindOfClass;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  void *v105;
  NSMutableDictionary *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  int64_t v115;
  _BOOL4 v116;
  unsigned int v117;
  void *v118;
  int v119;
  id WeakRetained;
  unint64_t v121;
  id v122;
  int v123;
  void *v124;
  _BOOL4 v125;
  UINavigationBar *obj;
  _QWORD v127[4];
  id v128;
  uint64_t *v129;
  char v130;
  uint64_t v131;
  uint64_t *v132;
  uint64_t v133;
  char v134;
  _QWORD v135[2];
  void (*v136)(_QWORD *, void *);
  void *v137;
  uint64_t *v138;
  uint64_t *v139;
  uint64_t *v140;
  uint64_t *v141;
  uint64_t *v142;
  uint64_t v143;
  double *v144;
  uint64_t v145;
  void *v146;
  __int128 v147;
  __int128 v148;
  uint64_t v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t (*v152)(uint64_t, uint64_t);
  void (*v153)(uint64_t);
  id v154;
  uint64_t v155;
  uint64_t *v156;
  uint64_t v157;
  uint64_t (*v158)(uint64_t, uint64_t);
  void (*v159)(uint64_t);
  id v160;
  uint64_t v161;
  uint64_t *v162;
  uint64_t v163;
  uint64_t (*v164)(uint64_t, uint64_t);
  void (*v165)(uint64_t);
  id v166;
  uint64_t v167;
  uint64_t *v168;
  uint64_t v169;
  uint64_t (*v170)(uint64_t, uint64_t);
  void (*v171)(uint64_t);
  id v172;

  v121 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v121 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v121);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 8548, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v112);

  }
  v125 = -[UISplitViewControllerPanelImpl _isCollapsedOrCollapsing](self, "_isCollapsedOrCollapsing");
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v6 = -[UISplitViewControllerPanelImpl _concreteDisplayModeForCurrentEnvironment](self, "_concreteDisplayModeForCurrentEnvironment");
  v7 = v6;
  if (a3)
    v8 = (void *)a3;
  else
    v8 = (void *)v6;
  v115 = -[UISplitViewControllerPanelImpl splitBehavior](self, "splitBehavior");
  if (!self->_sidebarToggleButtonItem && !v125)
  {
    v9 = -[UIBarButtonItem initWithImage:style:target:action:]([_UIFloatableBarButtonItem alloc], "initWithImage:style:target:action:", 0, 0, self, sel__triggerDisplayModeAction_);
    sidebarToggleButtonItem = self->_sidebarToggleButtonItem;
    self->_sidebarToggleButtonItem = v9;

  }
  v11 = -[UISplitViewControllerPanelImpl _alwaysHideSidebarToggleButton](self, "_alwaysHideSidebarToggleButton");
  v12 = -[UISplitViewControllerPanelImpl primaryEdge](self, "primaryEdge");
  v167 = 0;
  v168 = &v167;
  v13 = v12 == 0;
  v169 = 0x3032000000;
  v170 = __Block_byref_object_copy__59;
  v171 = __Block_byref_object_dispose__59;
  v172 = 0;
  v161 = 0;
  v162 = &v161;
  v163 = 0x3032000000;
  v164 = __Block_byref_object_copy__59;
  v165 = __Block_byref_object_dispose__59;
  v166 = 0;
  v155 = 0;
  v156 = &v155;
  v157 = 0x3032000000;
  v158 = __Block_byref_object_copy__59;
  v159 = __Block_byref_object_dispose__59;
  v160 = 0;
  v149 = 0;
  v150 = &v149;
  v151 = 0x3032000000;
  v152 = __Block_byref_object_copy__59;
  v153 = __Block_byref_object_dispose__59;
  v154 = 0;
  v143 = 0;
  v144 = (double *)&v143;
  v145 = 0x4010000000;
  v146 = &unk_18685B0AF;
  v147 = 0u;
  v148 = 0u;
  -[_UIFloatableBarButtonItem _setFloatable:](self->_sidebarToggleButtonItem, "_setFloatable:", 0);
  v14 = -[UISplitViewControllerPanelImpl _gestureIsForcingOverlay](self, "_gestureIsForcingOverlay");
  if (v11)
  {
    v15 = 0;
    v13 = 0;
    v122 = 0;
    obj = 0;
LABEL_11:
    v16 = 1;
    goto LABEL_87;
  }
  v17 = v14;
  v135[0] = MEMORY[0x1E0C809B0];
  v135[1] = 3221225472;
  v136 = __77__UISplitViewControllerPanelImpl__updateDisplayModeButtonItemForDisplayMode___block_invoke;
  v137 = &unk_1E16C1B90;
  v138 = &v167;
  v139 = &v161;
  v140 = &v155;
  v141 = &v149;
  v142 = &v143;
  -[UISplitViewControllerPanelImpl _navigationBarForSidebarButtonForDisplayMode:](self, "_navigationBarForSidebarButtonForDisplayMode:", v8);
  obj = (UINavigationBar *)objc_claimAutoreleasedReturnValue();
  switch((unint64_t)v8)
  {
    case 1uLL:
    case 4uLL:
      -[UISplitViewControllerPanelImpl _sidebarToggleSymbolImage](self, "_sidebarToggleSymbolImage");
      v122 = (id)objc_claimAutoreleasedReturnValue();
      -[_UIFloatableBarButtonItem _setFloatable:](self->_sidebarToggleButtonItem, "_setFloatable:", v17 ^ 1u);
      v15 = 0;
      v13 = 0;
      v16 = 0;
      goto LABEL_87;
    case 2uLL:
      if (v121 != 2)
        goto LABEL_61;
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        v21 = v115 == 1;
      else
        v21 = 1;
      v23 = v21 || v115 == 3;

      v24 = v23 ^ 1;
      if (v12)
        v25 = 0;
      else
        v25 = v24;
      if ((v23 & 1) != 0 || v25 != v24)
      {
        if ((v23 & 1) != 0)
        {
LABEL_61:
          -[UISplitViewControllerPanelImpl _sidebarToggleSymbolImage](self, "_sidebarToggleSymbolImage");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 0;
          v24 = 0;
        }
        else
        {
          -[UISplitViewControllerPanelImpl _sidebarChevronSymbolImage](self, "_sidebarChevronSymbolImage");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 1;
        }
        v122 = v33;

        v26 = 1;
      }
      else
      {
        v26 = 0;
        v122 = 0;
        v13 = v25;
      }
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "viewController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v136(v135, v35);
      v123 = v24;

      perColumnViewControllers = self->_perColumnViewControllers;
      if (v121 == 2)
        -[NSMutableDictionary objectForKeyedSubscript:](perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
      else
        -[NSMutableDictionary objectForKeyedSubscript:](perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "navigationController");
      v18 = (id)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v18, "viewControllers");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v38, "count") < 2)
        {
          v16 = 0;
        }
        else
        {
          objc_msgSend(v18, "topViewController");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "navigationItem");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v117 = v26;
          v41 = v39;
          v16 = objc_msgSend(v40, "hidesBackButton") ^ 1;

          v26 = v117;
        }

        if ((v17 & 1) == 0)
          goto LABEL_76;
LABEL_70:
        v42 = 0;
        goto LABEL_79;
      }
      v16 = 0;
      if ((v17 & 1) != 0)
        goto LABEL_70;
LABEL_76:
      if (v115 == 3)
        v42 = 0;
      else
        v42 = v26;
LABEL_79:
      -[_UIFloatableBarButtonItem _setFloatable:](self->_sidebarToggleButtonItem, "_setFloatable:", v42);
LABEL_86:

      v15 = v123;
LABEL_87:
      if (v125
        || !-[UISplitViewControllerPanelImpl allowsSecondaryOnlyShortcutButton](self, "allowsSecondaryOnlyShortcutButton"))
      {
        v124 = 0;
        v54 = 0;
LABEL_108:
        if (v13)
        {
          v119 = 0;
          v59 = v8 == (void *)3 || v8 == (void *)5;
        }
        else
        {
          v119 = 0;
          v59 = 0;
        }
        v58 = 1;
        goto LABEL_117;
      }
      if (!self->_secondaryOnlyShortcutButtonItem)
      {
        v50 = -[UIBarButtonItem initWithImage:style:target:action:]([UIBarButtonItem alloc], "initWithImage:style:target:action:", 0, 0, self, sel__triggerSecondaryOnlyShortcutAction_);
        secondaryOnlyShortcutButtonItem = self->_secondaryOnlyShortcutButtonItem;
        self->_secondaryOnlyShortcutButtonItem = v50;

      }
      -[UISplitViewControllerPanelImpl _fullScreenSymbolImageForDisplayMode:](self, "_fullScreenSymbolImageForDisplayMode:", v8);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97470);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "navigationController");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "navigationBar");
      v54 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();

      v56 = v8 == (void *)3 || v8 == (void *)5;
      if ((v8 == (void *)6
         || v8 == (void *)v56
         || -[UISplitViewControllerPanelImpl splitBehavior](self, "splitBehavior") == 2)
        && (v8 != (void *)1
         || !-[UISplitViewControllerPanelImpl _gestureIsForcingOverlayForDisplayMode:](self, "_gestureIsForcingOverlayForDisplayMode:", v7)))
      {
        goto LABEL_108;
      }
      if (v54 == obj)
        v57 = v16;
      else
        v57 = 1;
      if ((v57 & 1) != 0)
      {
        v58 = 0;
        v59 = 0;
        v119 = 1;
      }
      else
      {
        v67 = self->_navBarForToggleButton;

        v58 = 0;
        v59 = 0;
        v119 = 1;
        v54 = obj;
        v16 = 1;
        obj = v67;
      }
LABEL_117:
      -[UISplitViewControllerPanelImpl _navigationBarForSidebarButtonForColumn:](self, "_navigationBarForSidebarButtonForColumn:", 2);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "_setStaticNavBarButtonLingers:", v59);

      v62 = self->_sidebarToggleButtonItem;
      if (!v62)
      {
LABEL_158:
        v64 = 0;
        goto LABEL_159;
      }
      v63 = v15;
      if ((v16 & 1) == 0)
      {
        -[UIBarButtonItem image](v62, "image");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v64 = 1;
          goto LABEL_138;
        }
        v65 = v13 | v15;
        v64 = 1;
        if (v65
          || v115 == 3
          || -[UIBarButtonItem _showsBackButtonIndicator](self->_sidebarToggleButtonItem, "_showsBackButtonIndicator")
          || -[UIBarButtonItem _showsChevron](self->_sidebarToggleButtonItem, "_showsChevron"))
        {
          goto LABEL_138;
        }
        -[UIBarButtonItem title](self->_sidebarToggleButtonItem, "title");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        if (v66)
        {
LABEL_137:

          goto LABEL_138;
        }
      }
      if (self->_navBarForToggleButton == obj
        && (_DWORD)v16 == -[UIBarButtonItem isHidden](self->_sidebarToggleButtonItem, "isHidden"))
      {
        if ((v16 & 1) != 0)
        {
          v64 = 0;
          goto LABEL_139;
        }
        if (v13 | v63)
        {
          v66 = 0;
          v64 = 0;
        }
        else
        {
          -[UIBarButtonItem view](self->_sidebarToggleButtonItem, "view");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "alpha");
          v64 = v69 < 0.01;

          v66 = 0;
        }
        goto LABEL_137;
      }
      v64 = 1;
      if ((v16 & 1) == 0)
LABEL_138:

LABEL_139:
      -[UIBarButtonItem _setShowsBackButtonIndicator:](self->_sidebarToggleButtonItem, "_setShowsBackButtonIndicator:", v13);
      -[UIBarButtonItem _setShowsChevron:](self->_sidebarToggleButtonItem, "_setShowsChevron:", v13);
      -[UIBarButtonItem _setActsAsFakeBackButton:](self->_sidebarToggleButtonItem, "_setActsAsFakeBackButton:", v13);
      v70 = self->_sidebarToggleButtonItem;
      if (v13)
      {
        -[UIBarButtonItem setImage:](v70, "setImage:", v156[5]);
        -[UIBarButtonItem setLargeContentSizeImage:](self->_sidebarToggleButtonItem, "setLargeContentSizeImage:", v150[5]);
        -[UIBarButtonItem setLargeContentSizeImageInsets:](self->_sidebarToggleButtonItem, "setLargeContentSizeImageInsets:", v144[4], v144[5], v144[6], v144[7]);
        v71 = self->_sidebarToggleButtonItem;
        if (v156[5])
        {
          -[UIBarButtonItem setTitle:](self->_sidebarToggleButtonItem, "setTitle:", 0);
          v72 = MEMORY[0x1E0C9AA60];
        }
        else
        {
          if (objc_msgSend((id)v168[5], "length"))
            v75 = (const __CFString *)v168[5];
          else
            v75 = CFSTR(" ");
          -[UIBarButtonItem setTitle:](v71, "setTitle:", v75);
          if (v162[5])
            v72 = v162[5];
          else
            v72 = MEMORY[0x1E0C9AA60];
        }
        -[UIBarButtonItem _setBackButtonAlternateTitles:](self->_sidebarToggleButtonItem, "_setBackButtonAlternateTitles:", v72);
        -[UIBarButtonItem _setLargeContentSizeTitle:](self->_sidebarToggleButtonItem, "_setLargeContentSizeTitle:", 0);
      }
      else
      {
        -[UIBarButtonItem setImage:](v70, "setImage:", v122);
        -[UIBarButtonItem setTitle:](self->_sidebarToggleButtonItem, "setTitle:", 0);
        v73 = self->_sidebarToggleButtonItem;
        _UINSLocalizedStringWithDefaultValue(CFSTR("Sidebar"), CFSTR("Sidebar"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIBarButtonItem _setLargeContentSizeTitle:](v73, "_setLargeContentSizeTitle:", v74);

      }
      -[UIBarButtonItem setHidden:](self->_sidebarToggleButtonItem, "setHidden:", v16);
      if (v63)
        v76 = +[UIDragInteraction isEnabledByDefault](UIDragInteraction, "isEnabledByDefault");
      else
        v76 = 0;
      -[UIBarButtonItem setSpringLoaded:](self->_sidebarToggleButtonItem, "setSpringLoaded:", v76);
      navBarForToggleButton = self->_navBarForToggleButton;
      if (navBarForToggleButton == obj)
        v78 = 1;
      else
        v78 = v16;
      if ((v78 & 1) == 0)
      {
        -[UINavigationBar _setStaticNavBarButtonItem:](navBarForToggleButton, "_setStaticNavBarButtonItem:", 0);
        -[UINavigationBar _setStaticNavBarButtonItem:](obj, "_setStaticNavBarButtonItem:", self->_sidebarToggleButtonItem);
        objc_storeStrong((id *)&self->_navBarForToggleButton, obj);
        goto LABEL_158;
      }
LABEL_159:
      v79 = self->_secondaryOnlyShortcutButtonItem;
      if (!v79)
      {
LABEL_176:
        v86 = 0;
        goto LABEL_177;
      }
      v80 = -[UIBarButtonItem isHidden](v79, "isHidden");
      if ((_DWORD)v58 == v80)
      {
        v81 = 0;
      }
      else
      {
        -[UIBarButtonItem setHidden:](self->_secondaryOnlyShortcutButtonItem, "setHidden:", v58);
        v81 = 1;
      }
      -[UIBarButtonItem image](self->_secondaryOnlyShortcutButtonItem, "image");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v82
        || (-[UIBarButtonItem image](self->_secondaryOnlyShortcutButtonItem, "image"),
            v83 = (void *)objc_claimAutoreleasedReturnValue(),
            v84 = objc_msgSend(v83, "isEqual:", v124),
            v83,
            v82,
            (v84 & 1) == 0))
      {
        -[UIBarButtonItem setImage:](self->_secondaryOnlyShortcutButtonItem, "setImage:", v124);
        v81 = v58 & v80 ^ 1;
      }
      navBarForShortcutButton = self->_navBarForShortcutButton;
      if (navBarForShortcutButton != v54)
      {
        v86 = v81 != 0;
        if (!v119)
          goto LABEL_177;
        goto LABEL_173;
      }
      -[UINavigationBar _staticNavBarButtonItem](v54, "_staticNavBarButtonItem");
      v87 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
      v88 = self->_secondaryOnlyShortcutButtonItem;

      v86 = v81 != 0;
      v89 = v119 ^ 1;
      if (v87 == v88)
        v89 = 1;
      if ((v89 & 1) == 0)
      {
        navBarForShortcutButton = self->_navBarForShortcutButton;
LABEL_173:
        if (navBarForShortcutButton != self->_navBarForToggleButton)
          -[UINavigationBar _setStaticNavBarButtonItem:](navBarForShortcutButton, "_setStaticNavBarButtonItem:", 0);
        -[UINavigationBar _setStaticNavBarButtonItem:](v54, "_setStaticNavBarButtonItem:", self->_secondaryOnlyShortcutButtonItem);
        objc_storeStrong((id *)&self->_navBarForShortcutButton, v54);
        goto LABEL_176;
      }
LABEL_177:
      if (v121 == 2)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = v90 == 0;

      }
      else
      {
        v91 = 0;
      }
      if ((v64 & v86 & 1) != 0)
      {
        v92 = self->_navBarForToggleButton;
        if (v92 != self->_navBarForShortcutButton)
        {
          v64 = 1;
          v86 = 1;
          goto LABEL_189;
        }
        v93 = v92;
        v94 = v93;
        v86 = v119 | v16;
        if (((v119 | v16) & 1) != 0)
        {
          if ((v58 & 1) == 0)
          {
            -[UINavigationBar _setStaticNavBarButtonItem:](v93, "_setStaticNavBarButtonItem:", self->_secondaryOnlyShortcutButtonItem);
            v64 = 0;
LABEL_188:

            goto LABEL_189;
          }
        }
        else
        {
          -[UINavigationBar _setStaticNavBarButtonItem:](v93, "_setStaticNavBarButtonItem:", self->_sidebarToggleButtonItem);
        }
        v64 = 1;
        goto LABEL_188;
      }
LABEL_189:
      v131 = 0;
      v132 = &v131;
      v133 = 0x2020000000;
      v134 = 0;
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974A0);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "viewController");
      v96 = (void *)objc_claimAutoreleasedReturnValue();

      if (v96)
      {
        -[UINavigationBar delegate](self->_navBarForToggleButton, "delegate");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          -[UINavigationBar delegate](self->_navBarForToggleButton, "delegate");
          v99 = objc_claimAutoreleasedReturnValue();
          v100 = (void *)v99;
          if (v99 && ((*(_DWORD *)(v99 + 368) >> 1) & 3u) - 1 <= 1)
          {
            -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974A0);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v101, "viewController");
            v102 = (void *)objc_claimAutoreleasedReturnValue();

            v130 = 0;
            v127[0] = MEMORY[0x1E0C809B0];
            v127[1] = 3221225472;
            v127[2] = __77__UISplitViewControllerPanelImpl__updateDisplayModeButtonItemForDisplayMode___block_invoke_2;
            v127[3] = &unk_1E16C1BB8;
            v103 = v102;
            v128 = v103;
            v129 = &v131;
            objc_msgSend(v100, "_enumerateAncestorViewControllersUntilStop:usingBlock:", &v130, v127);

          }
        }
      }
      if (v64)
      {
        if (*((_BYTE *)v132 + 24) || !v125)
          goto LABEL_201;
        -[UINavigationBar delegate](self->_navBarForToggleButton, "delegate");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = self->_perColumnViewControllers;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v91);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v106, "objectForKeyedSubscript:", v107);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "navigationController");
        v109 = (void *)objc_claimAutoreleasedReturnValue();

        if (v105 == v109)
LABEL_201:
          -[UINavigationBar _setNeedsStaticNavBarButtonUpdate](self->_navBarForToggleButton, "_setNeedsStaticNavBarButtonUpdate");
      }
      if (v86)
        -[UINavigationBar _setNeedsStaticNavBarButtonUpdate](self->_navBarForShortcutButton, "_setNeedsStaticNavBarButtonUpdate");
      if (-[_UIFloatableBarButtonItem _isFloating](self->_sidebarToggleButtonItem, "_isFloating"))
      {
        -[_UIFloatableBarButtonItem _configuredFloatableView](self->_sidebarToggleButtonItem, "_configuredFloatableView");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "setTintColor:", 0);

      }
      _Block_object_dispose(&v131, 8);

      _Block_object_dispose(&v143, 8);
      _Block_object_dispose(&v149, 8);

      _Block_object_dispose(&v155, 8);
      _Block_object_dispose(&v161, 8);

      _Block_object_dispose(&v167, 8);
      return;
    case 3uLL:
      -[UISplitViewControllerPanelImpl _sidebarToggleSymbolImage](self, "_sidebarToggleSymbolImage");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v116 = -[UISplitViewControllerPanelImpl _wantsSideBarImageForOneOverSecondary](self, "_wantsSideBarImageForOneOverSecondary");
      v123 = !v116;
      if (v12)
        v13 = 0;
      else
        v13 = !v116;
      if (v12)
        v27 = v116;
      else
        v27 = 1;
      if ((v27 & 1) != 0)
      {
        if (v116)
          v28 = v18;
        else
          v28 = 0;
        v122 = v28;
      }
      else
      {
        -[UISplitViewControllerPanelImpl _sidebarChevronSymbolImage](self, "_sidebarChevronSymbolImage");
        v122 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (v121 == 2
        && (-[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488), (v114 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "viewController");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = 0;
        v31 = 0;
        v30 = 1;
      }
      else
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "viewController");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        v31 = 1;
      }
      v136(v135, v29);
      if (v31)
      {

      }
      if (v30)
      {

      }
      v16 = v13;
      v32 = v116;
      if (v121 != 2)
        goto LABEL_85;

      if (v116 || !v13)
      {
        if (!v13)
        {
          v16 = 0;
          goto LABEL_85;
        }
      }
      else
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = v116;
        if (!v43)
        {
          v16 = 1;
          goto LABEL_85;
        }
      }
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "navigationController");
      v45 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v45, "viewControllers");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v46, "count") < 2)
      {
        v16 = 0;
      }
      else
      {
        objc_msgSend(v45, "topViewController");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "navigationItem");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "hidesBackButton");
        v49 = v47;
        v16 = v48 ^ 1u;

      }
LABEL_85:
      -[_UIFloatableBarButtonItem _setFloatable:](self->_sidebarToggleButtonItem, "_setFloatable:", v32 & ~v17);
      goto LABEL_86;
    case 5uLL:
      if (v12)
      {
        -[UISplitViewControllerPanelImpl _sidebarChevronSymbolImage](self, "_sidebarChevronSymbolImage");
        v122 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v122 = 0;
      }
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "viewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v136(v135, v19);
      v123 = 1;
      goto LABEL_59;
    case 6uLL:
      -[UISplitViewControllerPanelImpl _sidebarToggleSymbolImage](self, "_sidebarToggleSymbolImage");
      v122 = (id)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v13 = 0;
      goto LABEL_11;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      _UISplitViewControllerDisplayModeDescription((unint64_t)v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 8638, CFSTR("Unsupported displayMode for configuring bar buttons. %@"), v19);
      v123 = 0;
      v13 = 0;
      v122 = 0;
LABEL_59:

      v16 = v13;
      goto LABEL_86;
  }
}

- (int64_t)splitBehaviorForSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  int64_t v6;

  height = a3.height;
  width = a3.width;
  -[UISplitViewControllerPanelImpl styleProvider](self, "styleProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "splitBehaviorForSize:", width, height);

  return v6;
}

- (BOOL)_alwaysHideSidebarToggleButton
{
  void *v2;
  char v3;

  -[UISplitViewControllerPanelImpl styleProvider](self, "styleProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "alwaysHideSidebarToggleButton");

  return v3;
}

- (_UISplitViewControllerStyle)styleProvider
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_styleProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UISplitViewControllerStyle *)v3;
}

- (BOOL)_usePaddingForEdgeInsetsForChildViewController:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  if (-[UISplitViewControllerPanelImpl _isCollapsedOrCollapsing](self, "_isCollapsedOrCollapsing")
    || (v5 = -[UISplitViewControllerPanelImpl style](self, "style")) == 0)
  {
    v8 = 0;
  }
  else
  {
    if (v5 == 1)
    {
      v7 = 0;
    }
    else if (v5 == 2)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 == 0;

    }
    else
    {
      v7 = 1;
    }
    v8 = -[UISplitViewControllerPanelImpl _columnForViewController:](self, "_columnForViewController:", v4) == v7;
  }

  return v8;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  id v6;
  id WeakRetained;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL4 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void *v30;
  void *v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double MaxX;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  UIEdgeInsets result;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_contentOverlayInsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  if (-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    if (-[UISplitViewControllerPanelImpl _usePaddingForEdgeInsetsForChildViewController:](self, "_usePaddingForEdgeInsetsForChildViewController:", v6))
    {
      v16 = -[UISplitViewControllerPanelImpl _layoutPrimaryOnRight](self, "_layoutPrimaryOnRight");
      -[_UIHyperConstantExtender _maximumDistance](self->_extender, "_maximumDistance");
      v18 = v11 + v17;
      v19 = v15 + v17;
      if (v16)
        v15 = v19;
      else
        v15 = 0.0;
      if (v16)
        v11 = 0.0;
      else
        v11 = v18;
    }
    else if (!-[UISplitViewControllerPanelImpl _isCollapsedOrCollapsing](self, "_isCollapsedOrCollapsing"))
    {
      objc_msgSend(v6, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "frame");
      v23 = v22;
      v50 = v24;
      v51 = v22;
      v25 = v24;
      v27 = v26;
      v48 = v28;
      v49 = v26;
      v29 = v28;

      v52.origin.x = v23;
      v52.origin.y = v25;
      v52.size.width = v27;
      v52.size.height = v29;
      v11 = fmax(fmin(v11 - CGRectGetMinX(v52), v11), 0.0);
      objc_msgSend(v6, "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "superview");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "bounds");
      v33 = v32;
      v35 = v34;
      v37 = v36;
      v39 = v38;

      v53.origin.x = v33;
      v53.origin.y = v35;
      v53.size.width = v37;
      v53.size.height = v39;
      MaxX = CGRectGetMaxX(v53);
      v54.origin.y = v50;
      v54.origin.x = v51;
      v54.size.height = v48;
      v54.size.width = v49;
      v15 = fmax(fmin(v15 - (MaxX - CGRectGetMaxX(v54)), v15), 0.0);
    }
  }
  else
  {
    -[UISplitViewControllerPanelImpl _contentMarginForChildViewController:](self, "_contentMarginForChildViewController:", v6);
    v15 = v20;
    v11 = v20;
  }
  -[UISplitViewControllerPanelImpl tabBarHostedView](self, "tabBarHostedView", *(_QWORD *)&v48, *(_QWORD *)&v49, *(_QWORD *)&v50, *(_QWORD *)&v51);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v41)
  {
    objc_msgSend(v41, "floatingTabBarTopInsetForViewController:", v6);
    v9 = v9 + v43;
  }

  *a4 = 1;
  v44 = v9;
  v45 = v11;
  v46 = v13;
  v47 = v15;
  result.right = v47;
  result.bottom = v46;
  result.left = v45;
  result.top = v44;
  return result;
}

- (void)_marginInfoForChild:(id)a3 leftMargin:(double *)a4 rightMargin:(double *)a5
{
  uint64_t v8;
  id v9;

  v9 = a3;
  if (-[UISplitViewControllerPanelImpl _shouldZeroSafeAreaInsetsForViewController:](self, "_shouldZeroSafeAreaInsetsForViewController:"))
  {
    *a4 = 0.0;
    *a5 = 0.0;
  }
  else if (-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    -[UISplitViewControllerPanelImpl _contentMarginForChildViewController:](self, "_contentMarginForChildViewController:", v9);
    *(_QWORD *)a5 = v8;
    *(_QWORD *)a4 = v8;
  }
  else
  {
    *a4 = -1.79769313e308;
    *a5 = -1.79769313e308;
  }

}

- (BOOL)_shouldZeroSafeAreaInsetsForViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UISplitViewControllerPanelImpl _currentPrimaryChildViewController](self, "_currentPrimaryChildViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4 && qword_1ECD7D5A8 != -1)
    dispatch_once(&qword_1ECD7D5A8, &__block_literal_global_1258);

  return 0;
}

- (BOOL)_forceDisplayModeBarButtonHidden
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 5) & 1;
}

- (id)viewControllerForColumn:(int64_t)a3
{
  NSMutableDictionary *perColumnViewControllers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  perColumnViewControllers = self->_perColumnViewControllers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](perColumnViewControllers, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationControllerWrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else if (v6 && !objc_msgSend(v6, "_isCreatedBySplitViewController"))
  {
    v9 = v6;
  }
  else
  {
    objc_msgSend(v5, "viewController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (uint64_t)_columnForViewController:(char)a3 forceExpandedResult:
{
  id v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  BOOL v13;
  void *v14;
  int v15;
  unint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  BOOL (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id *v24;

  v5 = a2;
  if (!a1)
  {
    v9 = 0;
    goto LABEL_19;
  }
  v6 = objc_msgSend(a1, "style");
  if ((unint64_t)(v6 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v16 = v6;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel__columnForViewController_forceExpandedResult_, a1, CFSTR("UISplitViewControllerPanelImpl.m"), 2796, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v18);

    if (v5)
      goto LABEL_4;
LABEL_18:
    v9 = 999;
    goto LABEL_19;
  }
  if (!v5)
    goto LABEL_18;
LABEL_4:
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v21 = __79__UISplitViewControllerPanelImpl__columnForViewController_forceExpandedResult___block_invoke;
  v22 = &unk_1E16C1A80;
  v23 = v5;
  v24 = a1;
  objc_msgSend(a1[1], "objectForKeyedSubscript:", &unk_1E1A974A0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = __79__UISplitViewControllerPanelImpl__columnForViewController_forceExpandedResult___block_invoke((uint64_t)v20, v7);

  if (v8)
    v9 = 3;
  else
    v9 = 999;
  if (!v8 || (a3 & 1) != 0 || (objc_msgSend(a1, "_isCollapsedOrCollapsing") & 1) == 0)
  {
    objc_msgSend(a1[1], "objectForKeyedSubscript:", &unk_1E1A97470);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = __79__UISplitViewControllerPanelImpl__columnForViewController_forceExpandedResult___block_invoke((uint64_t)v20, v10);

    if (v11)
    {
      v9 = 2;
    }
    else
    {
      objc_msgSend(a1[1], "objectForKeyedSubscript:", &unk_1E1A974B8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = __79__UISplitViewControllerPanelImpl__columnForViewController_forceExpandedResult___block_invoke((uint64_t)v20, v12);

      if (v13)
      {
        v9 = 1;
      }
      else
      {
        objc_msgSend(a1[1], "objectForKeyedSubscript:", &unk_1E1A97488);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = ((uint64_t (*)(_QWORD *, void *))v21)(v20, v14);

        if (v15)
          v9 = 0;
      }
    }
  }

LABEL_19:
  return v9;
}

BOOL __79__UISplitViewControllerPanelImpl__columnForViewController_forceExpandedResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id WeakRetained;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  _BOOL8 v21;
  uint64_t v22;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v3, "navigationController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v4 == (id)v5)
  {
    v21 = 1;
    v20 = v4;
LABEL_25:

    goto LABEL_26;
  }
  v6 = (void *)v5;
  objc_msgSend(v3, "viewController");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v4 == (id)v7)
  {
    v21 = 1;
    v13 = v4;
LABEL_24:
    v20 = v4;

    v4 = v6;
    goto LABEL_25;
  }
  v8 = (void *)v7;
  objc_msgSend(v3, "navigationControllerWrapper");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
    objc_msgSend(WeakRetained, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "presentingViewController");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11 && (void *)v11 != v6)
    {
      v13 = 0;
      do
      {
        v14 = v13;
        v13 = v12;

        objc_msgSend(v13, "presentingViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      while (v12 && v12 != v6);

      objc_msgSend(v3, "navigationController");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v13 == (id)v15)
      {
        v21 = 1;
        v16 = v13;
      }
      else
      {
        v16 = (id)v15;
        objc_msgSend(v3, "viewController");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v13 != (id)v17)
        {
          v18 = (void *)v17;
          objc_msgSend(v3, "navigationControllerWrapper");
          v19 = (id)objc_claimAutoreleasedReturnValue();

          if (v13 == v19)
          {
            v21 = 1;
            goto LABEL_24;
          }
          v12 = v4;
          v20 = v13;
          goto LABEL_17;
        }

        v21 = 1;
      }
LABEL_23:

      goto LABEL_24;
    }
    v20 = v4;
LABEL_17:

    if ((objc_msgSend(v20, "_isNestedNavigationController") & 1) != 0)
    {
      v21 = 0;
LABEL_26:
      v4 = v20;
      goto LABEL_27;
    }
    objc_msgSend(v20, "navigationController");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      v4 = 0;
      v21 = 0;
      goto LABEL_25;
    }
    v6 = (void *)v22;
    objc_msgSend(v20, "navigationController");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navigationController");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v21 = v13 == v16;
    v4 = v20;
    goto LABEL_23;
  }
  v21 = 1;
LABEL_27:

  return v21;
}

- (int64_t)splitBehavior
{
  if (self->_preferredSplitBehavior)
    return self->_preferredSplitBehavior;
  else
    return -[UISplitViewControllerPanelImpl splitBehaviorInCurrentEnvironment](self, "splitBehaviorInCurrentEnvironment");
}

- (int64_t)splitBehaviorInCurrentEnvironment
{
  unint64_t v4;
  int64_t v5;
  id WeakRetained;
  int v8;
  void *v9;
  double width;
  double height;
  void *v12;
  void *v13;

  v4 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v4 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 1668, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v13);

  }
  if (-[UISplitViewControllerPanelImpl _gestureIsForcingOverlay](self, "_gestureIsForcingOverlay"))
    return 2;
  v5 = (*(_QWORD *)&self->_flags >> 18) & 3;
  if (v5)
    return v5;
  if (dyld_program_sdk_at_least())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    v8 = _UISplitViewControllerWantsPickerBehaviors(WeakRetained);

    if (v8)
    {
      if (v4 != 2)
        return 1;
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v5 = 3;
      else
        v5 = 1;

      return v5;
    }
  }
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    width = self->_transitioningToSize.width;
    height = self->_transitioningToSize.height;
  }
  else
  {
    -[UISplitViewControllerPanelImpl _defaultViewSizeForResolvingDisplayModeOrSplitBehavior](self, "_defaultViewSizeForResolvingDisplayModeOrSplitBehavior");
  }
  return -[UISplitViewControllerPanelImpl splitBehaviorForSize:](self, "splitBehaviorForSize:", width, height);
}

- (BOOL)_gestureIsForcingOverlayForDisplayMode:(int64_t)a3
{
  BOOL v4;

  v4 = a3 == 3 || a3 == 5;
  return (*((_BYTE *)&self->_flags + 2) & 2) != 0 && v4;
}

- (CGSize)_defaultViewSizeForResolvingDisplayModeOrSplitBehavior
{
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_existingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
  }
  else
  {
    v9 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v9, "_window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v6 = v11;
    v8 = v12;

  }
  v13 = v6;
  v14 = v8;
  result.height = v14;
  result.width = v13;
  return result;
}

- (int64_t)_concreteDisplayModeForCurrentEnvironment
{
  int64_t v4;
  int64_t v5;
  void *v6;
  unint64_t v8;
  _BOOL4 v9;
  UISplitViewController **p_svc;
  id WeakRetained;
  int v12;
  unint64_t v13;
  NSObject *v14;
  id v15;
  const __CFString *v16;
  void *v17;
  __CFString *v18;
  id v19;
  char v20;
  double width;
  double height;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  __CFString *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = -[UISplitViewControllerPanelImpl style](self, "style");
  if ((unint64_t)(v4 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v24 = v4;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 5654, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v26);

  }
  v5 = -[UISplitViewControllerPanelImpl preferredDisplayMode](self, "preferredDisplayMode");
  v6 = -[UISplitViewControllerPanelImpl userGeneratedDisplayMode](self, "userGeneratedDisplayMode");
  if (-[UIPanelController collapsedState](self->_panelController, "collapsedState") == 2)
    return 2;
  if (!-[UISplitViewControllerPanelImpl presentsWithGesture](self, "presentsWithGesture")
    && -[UISplitViewControllerPanelImpl _visibleToggleButtonRequiresPresentsWithGesture](self, "_visibleToggleButtonRequiresPresentsWithGesture"))
  {
    if (v6)
    {
      if (v6 == (void *)v5)
        return v5;
    }
    else if (v5)
    {
      return v5;
    }
  }
  if (v6)
    v8 = (unint64_t)v6;
  else
    v8 = v5;
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    v9 = 0;
    v5 = v8;
    if (v8)
      goto LABEL_17;
  }
  else
  {
    v5 = -[UISplitViewControllerPanelImpl allowedDisplayModeForCurrentSplitBehaviorGivenDisplayMode:](self, "allowedDisplayModeForCurrentSplitBehaviorGivenDisplayMode:", v8);
    v9 = v5 != v8;
    if (v5)
    {
LABEL_17:
      p_svc = &self->_svc;
      WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      v12 = _UISplitViewControllerAutoHidesColumns(WeakRetained);

      if (v12 && _UIGetUISplitViewControllerChamoisResizeLogging())
      {
        v13 = qword_1ECD7D568;
        if (!qword_1ECD7D568)
        {
          v13 = __UILogCategoryGetNode("ChamoisResize", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v13, (unint64_t *)&qword_1ECD7D568);
        }
        v14 = *(id *)(v13 + 8);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = objc_loadWeakRetained((id *)p_svc);
          if (v6)
            v16 = CFSTR("user-generated");
          else
            v16 = CFSTR("preferred");
          if (v9)
          {
            v17 = (void *)MEMORY[0x1E0CB3940];
            _UISplitViewControllerDisplayModeDescription(v8);
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "stringWithFormat:", CFSTR(" converted from %@"), v6);
            v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v18 = &stru_1E16EDF20;
          }
          _UISplitViewControllerDisplayModeDescription(v5);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v28 = v15;
          v29 = 2112;
          v30 = v16;
          v31 = 2112;
          v32 = v18;
          v33 = 2112;
          v34 = v23;
          _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "%@: Using %@ display mode %@%@ for current environment", buf, 0x2Au);
          if (v9)
          {

          }
        }

      }
      return v5;
    }
  }
  if (qword_1ECD7D5A8 != -1)
    dispatch_once(&qword_1ECD7D5A8, &__block_literal_global_1258);
  if (dyld_program_sdk_at_least())
  {
    v19 = objc_loadWeakRetained((id *)&self->_svc);
    v20 = _UISplitViewControllerWantsPickerBehaviors(v19);

    if ((v20 & 1) != 0)
      return 2;
  }
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    width = self->_transitioningToSize.width;
    height = self->_transitioningToSize.height;
  }
  else
  {
    -[UISplitViewControllerPanelImpl _defaultViewSizeForResolvingDisplayModeOrSplitBehavior](self, "_defaultViewSizeForResolvingDisplayModeOrSplitBehavior");
  }
  return -[UISplitViewControllerPanelImpl defaultDisplayModeForSize:](self, "defaultDisplayModeForSize:", width, height);
}

- (BOOL)_gestureIsForcingOverlay
{
  return -[UISplitViewControllerPanelImpl _gestureIsForcingOverlayForDisplayMode:](self, "_gestureIsForcingOverlayForDisplayMode:", -[UISplitViewControllerPanelImpl userGeneratedDisplayMode](self, "userGeneratedDisplayMode"));
}

- (int64_t)userGeneratedDisplayMode
{
  int64_t v4;
  unint64_t v6;
  void *v7;
  void *v8;

  v4 = -[UISplitViewControllerPanelImpl style](self, "style");
  if ((unint64_t)(v4 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v4;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 2541, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v8);

  }
  return (*(_QWORD *)&self->_flags >> 3) & 7;
}

- (BOOL)presentsWithGesture
{
  return self->_presentsWithGesture;
}

- (int64_t)preferredDisplayMode
{
  return self->_preferredDisplayMode;
}

- (unint64_t)preferredScreenEdgesDeferringSystemGestures
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id WeakRetained;
  int v23;
  uint64_t v24;

  v3 = -[UISplitViewControllerPanelImpl _layoutPrimaryOnRight](self, "_layoutPrimaryOnRight");
  -[UISplitViewControllerPanelImpl leadingVisibleViewController](self, "leadingVisibleViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISplitViewControllerPanelImpl trailingVisibleViewController](self, "trailingVisibleViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
    v7 = (void *)v5;
  else
    v7 = v4;
  if (v3)
    v8 = v4;
  else
    v8 = (void *)v5;
  v9 = v8;
  v10 = v7;
  objc_msgSend(v10, "_effectiveScreenEdgesDeferringSystemGesturesViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "preferredScreenEdgesDeferringSystemGestures");

  if (v10 == v9)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v9, "_effectiveScreenEdgesDeferringSystemGesturesViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "preferredScreenEdgesDeferringSystemGestures");

  }
  v15 = v14 & 0xFFFFFFFFFFFFFFFDLL | v12 & 0xFFFFFFFFFFFFFFF7;
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isAnimating"))
  {
    if ((objc_msgSend(v16, "isSupplementaryViewControllerVisibleAfterAnimation") & 1) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  objc_msgSend(v16, "currentState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isSupplementaryVisible");

  if (v18)
  {
LABEL_14:
    objc_msgSend(v16, "supplementaryViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_effectiveScreenEdgesDeferringSystemGesturesViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "preferredScreenEdgesDeferringSystemGestures");

    v15 |= v21 & 0xFFFFFFFFFFFFFFF5;
  }
LABEL_15:
  if (!-[UISplitViewControllerPanelImpl _isCollapsed](self, "_isCollapsed")
    && !-[UISplitViewControllerPanelImpl _isPrimaryShown](self, "_isPrimaryShown"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    v23 = objc_msgSend(WeakRetained, "presentsWithGesture");

    v24 = 2;
    if (v3)
      v24 = 8;
    if (!v23)
      v24 = 0;
    v15 |= v24;
  }

  return v15;
}

- (id)leadingVisibleViewController
{
  int64_t v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v18;
  int v19;

  v3 = -[UISplitViewControllerPanelImpl style](self, "style");
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAnimating");
  if (!v3)
  {
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((v5 & 1) != 0)
    {
      v9 = objc_msgSend(v7, "isLeadingViewControllerVisibleAfterAnimation");

      if ((v9 & 1) == 0)
      {
LABEL_6:
        -[UISplitViewControllerPanelImpl panelController](self, "panelController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v6;
        goto LABEL_7;
      }
    }
    else
    {
      objc_msgSend(v7, "currentState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isLeadingVisible");

      if ((v12 & 1) == 0)
        goto LABEL_6;
    }
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v13;
    goto LABEL_16;
  }
  if (!-[UISplitViewControllerPanelImpl primaryEdge](self, "primaryEdge"))
  {
    if (v5)
    {
      if ((objc_msgSend(v4, "isLeadingViewControllerVisibleAfterAnimation") & 1) == 0)
      {
        if ((objc_msgSend(v4, "isSupplementaryViewControllerVisibleAfterAnimation") & 1) == 0)
          goto LABEL_3;
LABEL_19:
        objc_msgSend(v4, "supplementaryViewController");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
    }
    else
    {
      objc_msgSend(v4, "currentState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isLeadingVisible");

      if (!v15)
      {
        objc_msgSend(v4, "currentState");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isSupplementaryVisible");

        if (!v19)
          goto LABEL_3;
        goto LABEL_19;
      }
    }
    v13 = v4;
LABEL_16:
    objc_msgSend(v13, "leadingViewController");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
LABEL_3:
  v6 = v4;
LABEL_7:
  objc_msgSend(v6, "mainViewController");
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_17:
  v16 = (void *)v10;

  return v16;
}

- (id)trailingVisibleViewController
{
  int64_t v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v18;
  int v19;

  v3 = -[UISplitViewControllerPanelImpl style](self, "style");
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAnimating");
  if (!v3)
  {
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((v5 & 1) != 0)
    {
      v9 = objc_msgSend(v7, "isTrailingViewControllerVisibleAfterAnimation");

      if ((v9 & 1) == 0)
      {
LABEL_9:
        -[UISplitViewControllerPanelImpl panelController](self, "panelController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v6;
        goto LABEL_10;
      }
    }
    else
    {
      objc_msgSend(v7, "currentState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isTrailingVisible");

      if ((v12 & 1) == 0)
        goto LABEL_9;
    }
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v13;
    goto LABEL_15;
  }
  if (-[UISplitViewControllerPanelImpl primaryEdge](self, "primaryEdge") == 1)
  {
    if (v5)
    {
      if ((objc_msgSend(v4, "isTrailingViewControllerVisibleAfterAnimation") & 1) == 0)
      {
        if ((objc_msgSend(v4, "isSupplementaryViewControllerVisibleAfterAnimation") & 1) == 0)
          goto LABEL_6;
LABEL_18:
        objc_msgSend(v4, "supplementaryViewController");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
    }
    else
    {
      objc_msgSend(v4, "currentState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isTrailingVisible");

      if (!v15)
      {
        objc_msgSend(v4, "currentState");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isSupplementaryVisible");

        if (!v19)
          goto LABEL_6;
        goto LABEL_18;
      }
    }
    v13 = v4;
LABEL_15:
    objc_msgSend(v13, "trailingViewController");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
LABEL_6:
  v6 = v4;
LABEL_10:
  objc_msgSend(v6, "mainViewController");
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_16:
  v16 = (void *)v10;

  return v16;
}

- (int64_t)primaryEdge
{
  return self->_primaryEdge;
}

- (BOOL)_layoutPrimaryOnRight
{
  id WeakRetained;
  void *v3;
  int64_t primaryEdge;
  int v6;
  id v7;
  void *v8;

  primaryEdge = self->_primaryEdge;
  if (!primaryEdge)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "_shouldReverseLayoutDirection") & 1) != 0)
    {
      LOBYTE(v6) = 1;
      goto LABEL_10;
    }
    if (self->_primaryEdge != 1)
    {
      LOBYTE(v6) = 0;
      goto LABEL_10;
    }
LABEL_7:
    v7 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "_shouldReverseLayoutDirection") ^ 1;

    if (primaryEdge)
      return v6;
LABEL_10:

    return v6;
  }
  if (primaryEdge == 1)
    goto LABEL_7;
  LOBYTE(v6) = 0;
  return v6;
}

- (void)panelController:(id)a3 didChangeToState:(id)a4 withSize:(CGSize)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  id WeakRetained;
  void *v15;
  char v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  int64_t v21;
  int64_t v22;
  BOOL v23;
  _BOOL4 v24;
  void *v25;
  char v26;
  id v27;
  id v28;
  int64_t lastSettledDisplayMode;
  _BOOL4 v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  $692BA5F601ABB544448C4E0A48A865F8 flags;
  id v39;

  height = a5.height;
  width = a5.width;
  v39 = a3;
  v9 = a4;
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v39)
  {
    if (-[UISplitViewControllerPanelImpl style](self, "style"))
    {
      if ((objc_msgSend(v39, "isAnimating") & 1) == 0)
      {
        objc_msgSend(v39, "stateRequest");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11 && objc_msgSend(v11, "userInitiated"))
        {
          if (-[UISplitViewControllerPanelImpl _isPrimaryShown](self, "_isPrimaryShown"))
          {
            if (-[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading"))
              objc_msgSend(v9, "leadingWidth");
            else
              objc_msgSend(v9, "trailingWidth");
            self->_lastUserInitiatedPrimaryWidth = v13;
          }
          -[UISplitViewControllerPanelImpl setUserGeneratedDisplayMode:](self, "setUserGeneratedDisplayMode:", -[UISplitViewControllerPanelImpl _displayModeForState:](self, "_displayModeForState:", v9));
          objc_msgSend(v12, "setUserInitiated:", 0);
          objc_msgSend(v39, "setStateRequest:", v12);
        }

      }
      -[UISplitViewControllerPanelImpl _updateDisplayModeButtonItem](self, "_updateDisplayModeButtonItem");
      -[UISplitViewControllerPanelImpl _updatePresentationGestureRecognizer](self, "_updatePresentationGestureRecognizer");
      WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      -[UISplitViewControllerPanelImpl _currentPrimaryChildViewController](self, "_currentPrimaryChildViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        -[UISplitViewControllerPanelImpl _currentPrimaryChildViewController](self, "_currentPrimaryChildViewController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_splitViewControllerDidUpdate:withSize:", WeakRetained, width, height);

      }
      v18 = objc_msgSend(WeakRetained, "isCollapsed");
      if (self->_lastNotifiedIsCollapsed != v18)
      {
        self->_lastNotifiedIsCollapsed = v18;
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_loadWeakRetained((id *)&self->_svc);
        objc_msgSend(v19, "postNotificationName:object:", CFSTR("UIViewControllerShowDetailTargetDidChangeNotification"), v20);

      }
      v21 = -[UISplitViewControllerPanelImpl displayMode](self, "displayMode");
      if ((*(_BYTE *)&self->_flags & 0x80) != 0)
      {
        v22 = -[UISplitViewControllerPanelImpl _nextTargetDisplayModeForDisplayMode:showMoreIfPossible:](self, "_nextTargetDisplayModeForDisplayMode:showMoreIfPossible:", v21, 0);
        v23 = !v22 || v22 == v21;
        v24 = !v23;
        if (self->_lastShouldAllowChange != v24)
          objc_msgSend(v39, "setNeedsUpdate");
      }
      -[UISplitViewControllerPanelImpl panelController](self, "panelController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isAnimating");

      if ((v26 & 1) == 0)
      {
        v27 = objc_loadWeakRetained((id *)&self->_svc);
        objc_msgSend(v27, "setNeedsStatusBarAppearanceUpdate");

        v28 = objc_loadWeakRetained((id *)&self->_svc);
        objc_msgSend(v28, "setNeedsUpdateOfScreenEdgesDeferringSystemGestures");

      }
      lastSettledDisplayMode = self->_lastSettledDisplayMode;
      v31 = lastSettledDisplayMode != v21 && lastSettledDisplayMode != 0;
      if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled")|| (objc_msgSend(v39, "isAnimating") & 1) != 0|| !v31 && (*((_BYTE *)&self->_flags + 3) & 0xC0) == 0|| -[UIGestureRecognizer state](self->__fluidOpenSidebarPresentationGestureRecognizer, "state"))
      {
        goto LABEL_49;
      }
      v32 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v32, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if ((*((_BYTE *)&self->_flags + 3) & 0x40) != 0)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
LABEL_48:
          flags = self->_flags;
          self->_lastSettledDisplayMode = v21;
          self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&flags & 0xFFFFFFFF3FFFFFFFLL);

LABEL_49:
          goto LABEL_50;
        }
        v37 = objc_loadWeakRetained((id *)&self->_svc);
        objc_msgSend(v33, "_splitViewController:didFinishExpandToDisplayMode:", v37, v21);
      }
      else
      {
        if (!v31)
          goto LABEL_48;
        -[UISplitViewControllerPanelImpl panelController](self, "panelController");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "currentState");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "_collapsedState");

        if (v36 || (objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_48;
        v37 = objc_loadWeakRetained((id *)&self->_svc);
        objc_msgSend(v33, "_splitViewController:didChangeFromDisplayMode:toDisplayMode:", v37, self->_lastSettledDisplayMode, v21);
      }

      goto LABEL_48;
    }
    -[UISplitViewControllerPanelImpl _unspecifiedStylePanelController:didChangeToState:withSize:](self, "_unspecifiedStylePanelController:didChangeToState:withSize:", v39, v9, width, height);
  }
LABEL_50:

}

- (void)_updateDisplayModeButtonItem
{
  if (-[UISplitViewControllerPanelImpl style](self, "style"))
    -[UISplitViewControllerPanelImpl _updateDisplayModeButtonItemForDisplayMode:](self, "_updateDisplayModeButtonItemForDisplayMode:", self->_animatingToDisplayMode);
  else
    -[UISplitViewControllerPanelImpl _unspecifiedStyleUpdateDisplayModeButtonItem](self, "_unspecifiedStyleUpdateDisplayModeButtonItem");
}

- (id)_navigationBarForSidebarButtonForColumn:(int64_t)a3
{
  NSMutableDictionary *perColumnViewControllers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  perColumnViewControllers = self->_perColumnViewControllers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](perColumnViewControllers, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_existingNavigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isNavigationBarHidden"))
  {
    objc_msgSend(v6, "_targetNavigationBarForUISplitViewControllerSidebarButton");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7 == (void *)v8)
      v10 = 0;
    else
      v10 = (void *)v8;
    v11 = v10;

    v7 = v11;
  }

  return v7;
}

- (void)_fluidUpdatePresentationGestureRecognizers
{
  UISplitViewController **p_svc;
  int v4;
  void *v5;
  void *v6;
  UIPanGestureRecognizer *v7;
  UIScreenEdgePanGestureRecognizer *v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id WeakRetained;

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v4 = objc_msgSend(WeakRetained, "presentsWithGesture");
  -[UISplitViewControllerPanelImpl _fluidSidebarPresentationGestureRecognizer](self, "_fluidSidebarPresentationGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {

    if (!v6)
    {
      v7 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", self, sel__presentationGestureRecognizerChanged_);
      -[UIPanGestureRecognizer setMinimumNumberOfTouches:](v7, "setMinimumNumberOfTouches:", 1);
      -[UIPanGestureRecognizer setMaximumNumberOfTouches:](v7, "setMaximumNumberOfTouches:", 2);
      -[UIGestureRecognizer setAllowedTouchTypes:](v7, "setAllowedTouchTypes:", &unk_1E1A93230);
      -[UIPanGestureRecognizer setDelegate:](v7, "setDelegate:", self);
      -[UIPanGestureRecognizer setAllowedScrollTypesMask:](v7, "setAllowedScrollTypesMask:", 2);
      -[UISplitViewControllerPanelImpl _setFluidSidebarPresentationGestureRecognizer:](self, "_setFluidSidebarPresentationGestureRecognizer:", v7);
      v8 = -[UIScreenEdgePanGestureRecognizer initWithTarget:action:]([UIScreenEdgePanGestureRecognizer alloc], "initWithTarget:action:", self, sel__presentationGestureRecognizerChanged_);
      -[UIScreenEdgePanGestureRecognizer setMinimumNumberOfTouches:](v8, "setMinimumNumberOfTouches:", 1);
      -[UIPanGestureRecognizer setMaximumNumberOfTouches:](v8, "setMaximumNumberOfTouches:", 2);
      -[UIGestureRecognizer setAllowedTouchTypes:](v8, "setAllowedTouchTypes:", &unk_1E1A93248);
      -[UIPanGestureRecognizer setDelegate:](v8, "setDelegate:", self);
      -[UISplitViewControllerPanelImpl _setFluidOpenSidebarPresentationGestureRecognizer:](self, "_setFluidOpenSidebarPresentationGestureRecognizer:", v8);
      v9 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v9, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "addGestureRecognizer:", v7);
      objc_msgSend(v10, "addGestureRecognizer:", v8);

    }
    v11 = -[UISplitViewControllerPanelImpl _effectivePrimaryRectEdge](self, "_effectivePrimaryRectEdge");
    -[UISplitViewControllerPanelImpl _fluidOpenSidebarPresentationGestureRecognizer](self, "_fluidOpenSidebarPresentationGestureRecognizer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEdges:", v11);
    goto LABEL_7;
  }

  if (v6)
  {
    v13 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v13, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[UISplitViewControllerPanelImpl _fluidOpenSidebarPresentationGestureRecognizer](self, "_fluidOpenSidebarPresentationGestureRecognizer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeGestureRecognizer:", v14);

    -[UISplitViewControllerPanelImpl _fluidSidebarPresentationGestureRecognizer](self, "_fluidSidebarPresentationGestureRecognizer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeGestureRecognizer:", v15);

    -[UISplitViewControllerPanelImpl _setFluidOpenSidebarPresentationGestureRecognizer:](self, "_setFluidOpenSidebarPresentationGestureRecognizer:", 0);
    -[UISplitViewControllerPanelImpl _setFluidSidebarPresentationGestureRecognizer:](self, "_setFluidSidebarPresentationGestureRecognizer:", 0);
LABEL_7:

  }
}

- (int64_t)preferredCenterStatusBarStyle
{
  id WeakRetained;
  int v4;
  int64_t v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v4 = objc_msgSend(WeakRetained, "_shouldUseSeparateStatusBarStyles");

  if (v4)
  {
    v5 = -[UISplitViewControllerPanelImpl style](self, "style");
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v5)
    {
      objc_msgSend(v6, "mainViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_effectiveStatusBarStyleViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = v7;
      goto LABEL_16;
    }
    if (objc_msgSend(v6, "isAnimating"))
    {
      v8 = objc_msgSend(v7, "isLeadingViewControllerVisibleAfterAnimation");
      v9 = objc_msgSend(v7, "isTrailingViewControllerVisibleAfterAnimation");
      if (!objc_msgSend(v7, "isSupplementaryViewControllerVisibleAfterAnimation"))
        goto LABEL_11;
    }
    else
    {
      objc_msgSend(v7, "currentState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v15, "isLeadingVisible");

      objc_msgSend(v7, "currentState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v16, "isTrailingVisible");

      objc_msgSend(v7, "currentState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v16) = objc_msgSend(v17, "isSupplementaryVisible");

      if (!(_DWORD)v16)
        goto LABEL_11;
    }
    if (v8 | v9)
    {
      objc_msgSend(v7, "supplementaryViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_11:
    objc_msgSend(v7, "mainViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
    v19 = v18;
    objc_msgSend(v18, "_effectiveStatusBarStyleViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    _viewControllerIfStatusBarPartStyleProviding(v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v20;
    if (v20)
    {
      v10 = objc_msgSend(v20, "preferredTrailingStatusBarStyle");
      v11 = v7;
      v14 = v12;
      if (v10 != 4)
      {
LABEL_20:

        return v10;
      }
    }
    else
    {
      v11 = v7;
      v14 = v12;
    }
LABEL_16:
    v21 = objc_msgSend(v12, "preferredStatusBarStyle");
    if (v21 == 1)
      v10 = 1;
    else
      v10 = 2 * (v21 == 3);
    v7 = v11;
    v12 = v14;
    goto LABEL_20;
  }
  return 4;
}

- (int64_t)preferredLeadingStatusBarStyle
{
  id WeakRetained;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  uint64_t v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v4 = objc_msgSend(WeakRetained, "_shouldUseSeparateStatusBarStyles");

  if (!v4)
    return 4;
  -[UISplitViewControllerPanelImpl leadingVisibleViewController](self, "leadingVisibleViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_effectiveStatusBarStyleViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _viewControllerIfStatusBarPartStyleProviding(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7 || (v9 = objc_msgSend(v7, "preferredLeadingStatusBarStyle"), v9 == 4))
  {
    v10 = objc_msgSend(v6, "preferredStatusBarStyle");
    if (v10 == 1)
      v9 = 1;
    else
      v9 = 2 * (v10 == 3);
  }

  return v9;
}

- (int64_t)preferredTrailingStatusBarStyle
{
  id WeakRetained;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  uint64_t v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v4 = objc_msgSend(WeakRetained, "_shouldUseSeparateStatusBarStyles");

  if (!v4)
    return 4;
  -[UISplitViewControllerPanelImpl trailingVisibleViewController](self, "trailingVisibleViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_effectiveStatusBarStyleViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _viewControllerIfStatusBarPartStyleProviding(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7 || (v9 = objc_msgSend(v7, "preferredTrailingStatusBarStyle"), v9 == 4))
  {
    v10 = objc_msgSend(v6, "preferredStatusBarStyle");
    if (v10 == 1)
      v9 = 1;
    else
      v9 = 2 * (v10 == 3);
  }

  return v9;
}

- (id)childViewControllerForStatusBarStyle
{
  UISplitViewController **p_svc;
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v5 = objc_msgSend(WeakRetained, "_shouldUseNewStatusBarBehavior");

  v6 = objc_loadWeakRetained((id *)p_svc);
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    if ((objc_msgSend(v6, "_shouldUseSeparateStatusBarStyles") & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      -[UISplitViewControllerPanelImpl panelController](self, "panelController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "collapsedViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(v6, "_super_childViewControllerForStatusBarStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (UIScreenEdgePanGestureRecognizer)_fluidOpenSidebarPresentationGestureRecognizer
{
  return self->__fluidOpenSidebarPresentationGestureRecognizer;
}

- (int64_t)defaultDisplayModeForSplitBehavior:(int64_t)a3
{
  if (((a3 - 1) & 0xFFFFFFFFFFFFFFFDLL) != 0)
    return 1;
  else
    return 2;
}

- (BOOL)_visibleToggleButtonRequiresPresentsWithGesture
{
  return (*((_BYTE *)&self->_flags + 2) & 0x10) == 0;
}

- (unint64_t)_effectivePrimaryRectEdge
{
  if (-[UISplitViewControllerPanelImpl _layoutPrimaryOnRight](self, "_layoutPrimaryOnRight"))
    return 8;
  else
    return 2;
}

- (void)_setFluidOpenSidebarPresentationGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->__fluidOpenSidebarPresentationGestureRecognizer, a3);
}

- (BOOL)_isPrimaryShown
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading"))
    v5 = objc_msgSend(v4, "isLeadingVisible");
  else
    v5 = objc_msgSend(v4, "isTrailingVisible");
  v6 = v5;

  return v6;
}

- (id)panelControllerWillUpdate:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  BOOL v21;
  char v22;
  char v23;
  uint64_t v24;
  void *v25;
  _QWORD v27[5];
  id v28;
  char v29;
  char v30;
  char v31;
  char v32;
  BOOL v33;
  __int16 v34;
  int v35;

  v4 = a3;
  -[UISplitViewControllerPanelImpl _updateDimmingView](self, "_updateDimmingView");
  if (qword_1ECD7D5A8 != -1)
    dispatch_once(&qword_1ECD7D5A8, &__block_literal_global_1258);
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowShadowViews:", 1);

  *(_QWORD *)&self->_flags &= 0xFFFFFFFFFFFFFD7FLL;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "horizontalSizeClass") == 1)
    goto LABEL_28;
  v8 = -[UISplitViewControllerPanelImpl style](self, "style");
  v9 = v8 != 0;
  if (v8 && -[UISplitViewControllerPanelImpl splitBehavior](self, "splitBehavior") == 1)
  {
    if (-[UISplitViewControllerPanelImpl _alwaysHideSidebarToggleButton](self, "_alwaysHideSidebarToggleButton"))
    {
      objc_msgSend(v4, "setClippingViewsUnnecessary:", 1);
    }
    else
    {
      if (v8 == (void *)2)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
          goto LABEL_18;
      }
      if (-[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading"))
      {
        objc_msgSend(v4, "leadingBarContentClippingView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v12 = -[UISplitViewControllerPanelImpl _newBarContentAnimationClippingView](self, "_newBarContentAnimationClippingView");
          objc_msgSend(v4, "setLeadingBarContentClippingView:", v12);

        }
        objc_msgSend(v4, "setTrailingBarContentClippingView:", 0);
      }
      else
      {
        objc_msgSend(v4, "trailingBarContentClippingView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          v14 = -[UISplitViewControllerPanelImpl _newBarContentAnimationClippingView](self, "_newBarContentAnimationClippingView");
          objc_msgSend(v4, "setTrailingBarContentClippingView:", v14);

        }
        objc_msgSend(v4, "setLeadingBarContentClippingView:", 0);
      }
      if (v8 == (void *)2)
      {
LABEL_18:
        objc_msgSend(v4, "supplementaryBarContentClippingView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          v16 = -[UISplitViewControllerPanelImpl _newBarContentAnimationClippingView](self, "_newBarContentAnimationClippingView");
          objc_msgSend(v4, "setSupplementaryBarContentClippingView:", v16);

        }
      }
    }
    objc_msgSend(v4, "setFloatingBarButtonItem:", self->_sidebarToggleButtonItem);
  }
  if (objc_msgSend(v4, "isAnimating"))
  {
    objc_msgSend(v4, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (*((_BYTE *)&self->_flags + 2) & 2) != 0
       && -[UISplitViewControllerPanelImpl userGeneratedDisplayMode](self, "userGeneratedDisplayMode") == 3;
    objc_msgSend(v17, "setForceOverlay:", v18);
    objc_msgSend(v4, "setConfiguration:", v17);

LABEL_28:
    v20 = 0;
    goto LABEL_34;
  }
  objc_msgSend(v4, "stateRequest");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "userInitiated") & 1) != 0)
  {
    v20 = 0;
  }
  else
  {
    v35 = 0;
    v34 = 0;
    if (v8)
    {
      -[UISplitViewControllerPanelImpl currentState](self, "currentState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISplitViewControllerPanelImpl _getPrimaryShown:supplementaryShown:shouldUseOverlay:dimMainIfNecessary:forDisplayMode:](self, "_getPrimaryShown:supplementaryShown:shouldUseOverlay:dimMainIfNecessary:forDisplayMode:", (char *)&v34 + 1, &v34, 0, 0, -[UISplitViewControllerPanelImpl _displayModeForState:](self, "_displayModeForState:", v8));

      -[UISplitViewControllerPanelImpl _getPrimaryShown:supplementaryShown:shouldUseOverlay:dimMainIfNecessary:](self, "_getPrimaryShown:supplementaryShown:shouldUseOverlay:dimMainIfNecessary:", (char *)&v35 + 3, (char *)&v35 + 2, (char *)&v35 + 1, &v35);
      v21 = -[UISplitViewControllerPanelImpl _setPanelConfigurationWithIsPrimaryShown:isSupplementaryShown:shouldUseOverlay:dimMainIfNecessary:](self, "_setPanelConfigurationWithIsPrimaryShown:isSupplementaryShown:shouldUseOverlay:dimMainIfNecessary:", HIBYTE(v35), BYTE2(v35), BYTE1(v35), v35);
      v22 = BYTE2(v35);
      v23 = HIBYTE(v34);
      LOBYTE(v8) = v34;
    }
    else
    {
      -[UISplitViewControllerPanelImpl _getPrimaryShown:shouldUseOverlay:](self, "_getPrimaryShown:shouldUseOverlay:", (char *)&v35 + 3, (char *)&v35 + 1);
      v21 = -[UISplitViewControllerPanelImpl _setPanelConfigurationWithIsPrimaryShown:shouldUseOverlay:](self, "_setPanelConfigurationWithIsPrimaryShown:shouldUseOverlay:", HIBYTE(v35), BYTE1(v35));
      v23 = 0;
      v22 = 0;
    }
    self->_lastShouldAllowChange = v21;
    v24 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&self->_flags |= 0x80uLL;
    v27[0] = v24;
    v27[1] = 3221225472;
    v27[2] = __60__UISplitViewControllerPanelImpl_panelControllerWillUpdate___block_invoke;
    v27[3] = &unk_1E16C1AC8;
    v27[4] = self;
    v28 = WeakRetained;
    v29 = HIBYTE(v35);
    v30 = v22;
    v31 = v23;
    v32 = (char)v8;
    v33 = v9;
    v25 = _Block_copy(v27);
    v20 = _Block_copy(v25);

  }
LABEL_34:

  return v20;
}

- (void)_updateDimmingView
{
  void *v3;
  UIDimmingView *v4;
  void *v5;
  void *v6;
  id v7;

  -[UISplitViewControllerPanelImpl _dimmingView](self, "_dimmingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(UIDimmingView);
    -[UISplitViewControllerPanelImpl _setDimmingView:](self, "_setDimmingView:", v4);
    -[UIDimmingView setDelegate:](v4, "setDelegate:", self);
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDimmingView:", v4);

  }
  if (-[UISplitViewControllerPanelImpl _wantsVisibleDimmingView](self, "_wantsVisibleDimmingView"))
    +[UIDimmingView defaultDimmingColor](UIDimmingView, "defaultDimmingColor");
  else
    +[UIColor clearColor](UIColor, "clearColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UISplitViewControllerPanelImpl _dimmingView](self, "_dimmingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDimmingColor:", v7);

}

- (UIDimmingView)_dimmingView
{
  return self->__dimmingView;
}

- (BOOL)_wantsVisibleDimmingView
{
  return 1;
}

- (int64_t)topColumnForCollapsingPanelController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int64_t v8;
  id WeakRetained;
  void *v10;
  $692BA5F601ABB544448C4E0A48A865F8 *p_flags;
  id v12;
  id v13;
  int64_t suspendedState;
  id v15;
  int64_t v17;
  uint64_t v18;

  if (-[UISplitViewControllerPanelImpl style](self, "style", a3))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974A0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v7 = 3;
    else
      v7 = 2;

    v18 = v7;
    if (v6)
    {
      v8 = 3;
    }
    else
    {
      suspendedState = self->_suspendedState;
      if (suspendedState == 5)
      {
        v8 = 1;
        v18 = 1;
      }
      else if (suspendedState == 3)
      {
        v8 = 0;
        v18 = 0;
      }
      else
      {
        v8 = 2;
      }
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_opt_respondsToSelector();
      p_flags = &self->_flags;
      *(_QWORD *)&self->_flags |= 0x18000000uLL;
      v12 = objc_loadWeakRetained((id *)&self->_svc);
      v8 = objc_msgSend(v10, "splitViewController:topColumnForCollapsingToProposedTopColumn:", v12, v8);
      v18 = v8;

    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      p_flags = &self->_flags;
      *(_QWORD *)&self->_flags |= 0x18000000uLL;
      v13 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v10, "splitViewController:willCollapseToProposedTopColumn:", v13, &v18);

      v8 = v18;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_18:
        self->_lastNotifiedTopColumnForCollapse = v8;

        return v8;
      }
      p_flags = &self->_flags;
      *(_QWORD *)&self->_flags |= 0x18000000uLL;
      v17 = v8;
      v15 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v10, "_splitViewController:willCollapseToProposedTopColumn:", v15, &v17);

      v8 = v17;
      v18 = v17;
    }
    *(_QWORD *)p_flags &= 0xFFFFFFFFE7FFFFFFLL;
    goto LABEL_18;
  }
  return 999;
}

- (id)primaryViewControllerForCollapsingPanelController:(id)a3
{
  id WeakRetained;
  void *v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = -[UISplitViewControllerPanelImpl style](self, "style");
    if (!v6)
    {
      objc_msgSend(v5, "primaryViewControllerForCollapsingSplitViewController:", WeakRetained);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v7 = v6;
    v8 = primaryViewControllerForCollapsingPanelController____s_category;
    if (!primaryViewControllerForCollapsingPanelController____s_category)
    {
      v8 = __UILogCategoryGetNode("UISplitViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&primaryViewControllerForCollapsingPanelController____s_category);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      NSStringFromSelector(sel_primaryViewControllerForCollapsingSplitViewController_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _UISplitViewControllerStyleDescription(v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 2114;
      v18 = v12;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", (uint8_t *)&v15, 0x16u);

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (void)_setDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->__dimmingView, a3);
}

- (id)_viewControllerForObservableScrollView
{
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  int64_t animatingToDisplayMode;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint8_t v20[16];
  uint8_t buf[16];

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if (-[UIPanelController isCollapsed](self->_panelController, "isCollapsed"))
  {
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collapsedViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_loadWeakRetained((id *)p_svc);

      if (v6 != v7)
      {
        objc_msgSend(v6, "_viewControllerForObservableScrollView");
        v8 = objc_claimAutoreleasedReturnValue();

        WeakRetained = (id)v8;
      }
    }
    else if (-[UIPanelController collapsedState](self->_panelController, "collapsedState") != 1)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v19, OS_LOG_TYPE_FAULT, "Unexpected nil collapsedVC in the panelController", buf, 2u);
        }

      }
      else
      {
        v17 = _viewControllerForObservableScrollView___s_category;
        if (!_viewControllerForObservableScrollView___s_category)
        {
          v17 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v17, (unint64_t *)&_viewControllerForObservableScrollView___s_category);
        }
        v18 = *(NSObject **)(v17 + 8);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v20 = 0;
          _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Unexpected nil collapsedVC in the panelController", v20, 2u);
        }
      }
    }

    return WeakRetained;
  }
  animatingToDisplayMode = self->_animatingToDisplayMode;
  if (!animatingToDisplayMode)
    animatingToDisplayMode = -[UISplitViewControllerPanelImpl displayMode](self, "displayMode");
  if (animatingToDisplayMode != 1)
    return WeakRetained;
  if (-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97470);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_viewControllerForObservableScrollView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return v12;
  }
  else
  {
    -[UIPanelController mainViewController](self->_panelController, "mainViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14)
    {
      -[UIPanelController preservedDetailController](self->_panelController, "preservedDetailController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "_viewControllerForObservableScrollView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    return v16;
  }
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeDidChangeForChildContentContainer:", v4);

}

- (BOOL)_disableAutomaticKeyboardBehavior
{
  id WeakRetained;
  char v4;

  if (self->_postTransitionResponder)
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v4 = objc_msgSend(WeakRetained, "_super_disableAutomaticKeyboardBehavior");

  return v4;
}

- (void)_didChangeToFirstResponder:(id)a3
{
  UIResponder *postTransitionResponder;
  $692BA5F601ABB544448C4E0A48A865F8 flags;
  $692BA5F601ABB544448C4E0A48A865F8 v5;

  postTransitionResponder = self->_postTransitionResponder;
  if (postTransitionResponder)
  {
    if (postTransitionResponder == a3)
    {
      v5 = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFF3FFLL);
    }
    else
    {
      flags = self->_flags;
      if (a3)
        v5 = ($692BA5F601ABB544448C4E0A48A865F8)(*(unint64_t *)&flags | 0x400);
      else
        v5 = ($692BA5F601ABB544448C4E0A48A865F8)(*(unint64_t *)&flags | 0x800);
    }
    self->_flags = v5;
  }
}

- (double)minimumPrimaryColumnWidth
{
  return self->_minimumPrimaryColumnWidth;
}

- (void)_changeToDisplayMode:(int64_t)a3 fromPreferredDisplayMode:(int64_t)a4
{
  _BOOL4 v7;
  void *v8;
  void *v9;
  int64_t v10;
  id v11;

  if (-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    v7 = +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled");
    if (!a3)
    {
      if (a4 == 3 && (*(_QWORD *)&self->_flags & 0x200) != 0
        || (-[UISplitViewControllerPanelImpl panelController](self, "panelController"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v8, "currentState"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = -[UISplitViewControllerPanelImpl _displayModeForState:](self, "_displayModeForState:", v9),
            v9,
            v8,
            v10 == 3))
      {
        if (-[UISplitViewControllerPanelImpl splitBehavior](self, "splitBehavior") == 2)
          a3 = 3;
        else
          a3 = 2;
      }
      else
      {
        a3 = 0;
      }
    }
    if (v7)
    {
      -[UISplitViewControllerPanelImpl _transitionFromDisplayMode:toDisplayMode:](self, "_transitionFromDisplayMode:toDisplayMode:", -[UISplitViewControllerPanelImpl displayMode](self, "displayMode"), a3);
      return;
    }
    -[UISplitViewControllerPanelImpl setUserGeneratedDisplayMode:](self, "setUserGeneratedDisplayMode:", a3);
  }
  else
  {
    -[UISplitViewControllerPanelImpl _unspecifiedStyleChangeToDisplayMode:fromPreferredDisplayMode:](self, "_unspecifiedStyleChangeToDisplayMode:fromPreferredDisplayMode:", a3, a4);
  }
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNeedsUpdate");

}

- (void)_supplementaryOrPrimaryColumnWidthAffectingPropertyDidChange
{
  _BOOL8 v3;

  v3 = -[UIPanelController areClippingViewsUnnecessary](self->_panelController, "areClippingViewsUnnecessary");
  -[UIPanelController setClippingViewsUnnecessary:](self->_panelController, "setClippingViewsUnnecessary:", 1);
  -[UIPanelController setNeedsUpdate](self->_panelController, "setNeedsUpdate");
  -[UIPanelController setClippingViewsUnnecessary:](self->_panelController, "setClippingViewsUnnecessary:", v3);
}

- (BOOL)lockedForDelegateCallback
{
  return (*((_BYTE *)&self->_flags + 3) & 8) != 0 && -[UISplitViewControllerPanelImpl style](self, "style") != 0;
}

- (id)masterViewController
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[UISplitViewControllerPanelImpl style](self, "style") == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[UISplitViewControllerPanelImpl _currentPrimaryChildViewController](self, "_currentPrimaryChildViewController");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "navigationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v4 = v6;
      }
      else
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "viewController");
        v4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  else
  {
    -[UISplitViewControllerPanelImpl _currentPrimaryChildViewController](self, "_currentPrimaryChildViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)detailViewController
{
  return -[UIPanelController mainViewController](self->_panelController, "mainViewController");
}

- (void)_viewControllerChildViewControllersDidChange:(id)a3
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableDictionary *perColumnViewControllers;
  void *v8;
  void *v9;
  id v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  id v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  char v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  id v27;

  v27 = a3;
  v4 = -[UISplitViewControllerPanelImpl _columnForViewController:](self, "_columnForViewController:", v27);
  v5 = -[UISplitViewControllerPanelImpl _columnForViewController:forceExpandedResult:]((id *)&self->super.isa, v27, 1);
  if ((v5 & 0x3FD) == 0)
  {
    v6 = v5;
    perColumnViewControllers = self->_perColumnViewControllers;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](perColumnViewControllers, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationControllerWrapper");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 == v27)
    {
      v18 = objc_msgSend(v27, "_isTabBarController");

      if ((v18 & 1) == 0)
        goto LABEL_8;
    }
    else
    {
      v11 = self->_perColumnViewControllers;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "viewController");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v14 == v27)
      {
        v15 = self->_perColumnViewControllers;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "navigationController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "_isCreatedBySplitViewController"))
        {
          v25 = objc_msgSend(v27, "_isTabBarController");

          if ((v25 & 1) != 0)
            goto LABEL_11;
LABEL_8:
          -[UISplitViewControllerPanelImpl setViewController:forColumn:](self, "setViewController:forColumn:", v27, v6);
          goto LABEL_17;
        }

        v14 = v27;
      }

    }
  }
LABEL_11:
  if (v4 != 3 && v4 != 999)
  {
    v19 = self->_perColumnViewControllers;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "navigationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v22, "isNavigationBarHidden"))
    {
      objc_msgSend(v22, "_targetNavigationBarForUISplitViewControllerSidebarButton");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_existingNavigationBar");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23 != v24)
        -[UISplitViewControllerPanelImpl _updateDisplayModeButtonItem](self, "_updateDisplayModeButtonItem");
    }

  }
LABEL_17:

}

- (void)setViewController:(id)a3 forColumn:(int64_t)a4
{
  void *v4;
  id v7;
  int64_t v8;
  _BOOL4 v9;
  int v10;
  void *v11;
  BOOL v12;
  int v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  _BOOL4 v22;
  id v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  BOOL v30;
  NSMutableDictionary *v31;
  void *v32;
  void *v33;
  _DWORD *v34;
  _BOOL4 v35;
  unint64_t v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  int v41;
  int v42;
  id v43;
  char v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  NSMutableDictionary *perColumnViewControllers;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  uint64_t v56;
  int v57;
  int v58;
  NSMutableDictionary *v59;
  void *v60;
  void *v61;
  void *v62;
  BOOL v63;
  int v64;
  NSMutableDictionary *v65;
  void *v66;
  void *v67;
  id v68;
  BOOL v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  int v79;
  _QWORD *v80;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  UINavigationController *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  void *v99;
  uint64_t v100;
  id v101;
  NSMutableDictionary *v102;
  NSMutableDictionary *v103;
  NSMutableDictionary *v104;
  _UISplitViewControllerColumnContents *v105;
  void *v106;
  id WeakRetained;
  NSObject *v108;
  unint64_t v109;
  NSObject *v110;
  void *v111;
  NSObject *v112;
  void *v113;
  id v114;
  void *v115;
  BOOL v116;
  void *v117;
  _BOOL4 v118;
  int v119;
  id v120;
  id v121;
  _QWORD v122[4];
  id v123;
  id v124;
  BOOL v125;
  _QWORD v126[4];
  id v127;
  id v128;
  UISplitViewControllerPanelImpl *v129;
  __int128 *p_buf;
  _QWORD v131[5];
  id v132;
  BOOL v133;
  _QWORD v134[5];
  id v135;
  BOOL v136;
  _QWORD v137[5];
  id v138;
  BOOL v139;
  _QWORD v140[4];
  id v141;
  id v142;
  _QWORD v143[4];
  id v144;
  __int128 *v145;
  _QWORD v146[4];
  id v147;
  id v148;
  UISplitViewControllerPanelImpl *v149;
  __int128 *v150;
  id v151;
  id v152;
  __int128 buf;
  uint64_t v154;
  uint64_t (*v155)(uint64_t, uint64_t);
  void (*v156)(uint64_t);
  id v157;
  uint64_t v158;

  v158 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = -[UISplitViewControllerPanelImpl _columnForViewController:](self, "_columnForViewController:", v7);
  v9 = v8 != a4;
  v10 = objc_msgSend(v7, "_isTabBarController");
  if (v10)
    v11 = v7;
  else
    v11 = 0;
  v121 = v11;
  v12 = a4 == 2 || a4 == 0;
  v13 = v12;
  v119 = v13;
  if (!v12 || v8 != a4)
  {
    if (v8 == a4)
      goto LABEL_152;
    goto LABEL_32;
  }
  objc_msgSend(v7, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "_isCreatedBySplitViewController") & 1) != 0)
  {
    objc_msgSend(v7, "childViewControllers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v4, "_isNavigationController");

    if ((v16 & 1) != 0)
      goto LABEL_32;
  }
  else
  {

  }
  if (a4 == 2 && v121)
  {
    objc_msgSend(v121, "selectedViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "_isNavigationController");
    if (v18)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97470);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "navigationController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 != v19)
      {
        v9 = 1;
LABEL_29:

        goto LABEL_30;
      }
      if ((objc_msgSend(v17, "_isNavigationController") & 1) != 0)
      {
        v9 = 0;
        v19 = v17;
        goto LABEL_29;
      }
    }
    else if ((objc_msgSend(v17, "_isNavigationController") & 1) != 0)
    {
      v9 = 0;
      goto LABEL_30;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97470);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "navigationControllerWrapper");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v121 == v21;

    v19 = v17;
    if (v18)
      goto LABEL_29;
LABEL_30:

  }
  if (v9)
    goto LABEL_32;
  perColumnViewControllers = self->_perColumnViewControllers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](perColumnViewControllers, "objectForKeyedSubscript:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "navigationControllerWrapper");
  v54 = (id)objc_claimAutoreleasedReturnValue();

  if (v54 == v7)
  {
    objc_msgSend(v7, "childViewControllers");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "count");

    if (v56)
    {
      v152 = 0;
      v57 = objc_msgSend(v7, "_wrapsNavigationController:", &v152);
      v50 = (uint64_t)v152;
      if (v50)
        v58 = v57;
      else
        v58 = 0;
      if (v58 != 1)
      {
LABEL_151:

        goto LABEL_152;
      }
      v59 = self->_perColumnViewControllers;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v59, "objectForKeyedSubscript:", v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "navigationController");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v50 == (_QWORD)v62;

      if (v63)
        goto LABEL_152;
LABEL_32:
      v22 = -[UISplitViewControllerPanelImpl _isCollapsed](self, "_isCollapsed");
      v23 = v7;
      if (v22)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974A0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "viewController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25 == 0;

      }
      else
      {
        v26 = 0;
      }
      v27 = (unint64_t)(a4 - 3) < 0xFFFFFFFFFFFFFFFELL && v26;
      v118 = v27;
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974A0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "viewController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = a4 != 3 && v22;
      if (v29 || !v30)
      {

      }
      else
      {
        v31 = self->_perColumnViewControllers;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v31, "objectForKeyedSubscript:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "navigationController");
        v34 = (_DWORD *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          v35 = ((v34[92] >> 1) & 3u) - 1 < 2;

          if (v35)
          {
            if (os_variant_has_internal_diagnostics())
            {
              __UIFaultDebugAssertLog();
              v108 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v108, OS_LOG_TYPE_FAULT))
              {
                _UISplitViewControllerColumnDescription(a4);
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(buf) = 138412290;
                *(_QWORD *)((char *)&buf + 4) = v111;
                _os_log_fault_impl(&dword_185066000, v108, OS_LOG_TYPE_FAULT, "live swap of view controller in the %@ column when collapsed will result in broken UI", (uint8_t *)&buf, 0xCu);

              }
            }
            else
            {
              v36 = qword_1ECD7D4E0;
              if (!qword_1ECD7D4E0)
              {
                v36 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v36, (unint64_t *)&qword_1ECD7D4E0);
              }
              v37 = *(NSObject **)(v36 + 8);
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                v38 = v37;
                _UISplitViewControllerColumnDescription(a4);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(buf) = 138412290;
                *(_QWORD *)((char *)&buf + 4) = v39;
                _os_log_impl(&dword_185066000, v38, OS_LOG_TYPE_ERROR, "live swap of view controller in the %@ column when collapsed will result in broken UI", (uint8_t *)&buf, 0xCu);

              }
            }
          }
        }
        else
        {

        }
      }
      v40 = 0;
      v41 = 1;
      if (!v23 || a4 == 3)
      {
        v50 = (uint64_t)v23;
        v120 = 0;
      }
      else
      {
        v151 = 0;
        v42 = objc_msgSend(v23, "_wrapsNavigationController:", &v151);
        v43 = v151;
        v40 = (uint64_t)v43;
        if ((v119 & v42 & 1) == 0 && v43 != v23)
        {
          v44 = v10 ^ 1;
          if (a4 == 2)
            v44 = 1;
          if ((v44 & 1) == 0)
          {
            v45 = (void *)MEMORY[0x1E0C99DA0];
            _UISplitViewControllerColumnDescription(a4);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("UITabBarController is unsupported as viewController for -[UISplitViewController setViewController:forColumn:] in %@ column"), v46);

          }
          if (v10)
          {
            objc_msgSend(v23, "selectedViewController");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v47, "_isNavigationController"))
            {
              v48 = v47;

              objc_msgSend(v48, "topViewController");
              v49 = objc_claimAutoreleasedReturnValue();
              v40 = (uint64_t)v48;
              v120 = v23;
            }
            else
            {
              v120 = 0;
              v49 = (uint64_t)v23;
            }
            objc_msgSend(v23, "_setNotifySplitViewControllerForSelectionChange:", 1);

            v23 = (id)v49;
            if (!v40)
            {
LABEL_81:
              v65 = self->_perColumnViewControllers;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary objectForKeyedSubscript:](v65, "objectForKeyedSubscript:", v66);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "navigationController");
              v40 = objc_claimAutoreleasedReturnValue();

              if (v40)
              {
                v41 = 0;
                v64 = 1;
              }
              else
              {
                if (a4 == 2 && v10 == 1)
                {
                  v40 = 0;
                  v41 = 1;
LABEL_96:
                  v50 = (uint64_t)v23;
                  goto LABEL_143;
                }
                v87 = objc_alloc_init(UINavigationController);
                -[UINavigationController _setCreatedBySplitViewController:](v87, "_setCreatedBySplitViewController:", 1);
                v140[0] = MEMORY[0x1E0C809B0];
                v140[1] = 3221225472;
                v140[2] = __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_3;
                v140[3] = &unk_1E16B1B50;
                v40 = v87;
                v141 = (id)v40;
                v50 = (uint64_t)v23;
                v142 = (id)v50;
                objc_msgSend((id)v40, "_executeSplitViewControllerActions:", v140);

                v41 = 1;
                if (!v40)
                  goto LABEL_143;
                v64 = 0;
              }
LABEL_83:
              objc_msgSend((id)v40, "topViewController");
              v68 = (id)objc_claimAutoreleasedReturnValue();
              v69 = v68 == v23;

              if (!v69)
              {
                if (v64)
                {
                  objc_msgSend((id)v40, "_existingView");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v70, "window");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v71)
                    v116 = +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled");
                  else
                    v116 = 0;

                }
                else
                {
                  v116 = 0;
                }
                if (a4 == 2)
                {
                  objc_msgSend((id)v40, "viewControllers");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  v79 = objc_msgSend(v78, "containsObject:", v23);

                  if (v79)
                  {
                    v137[0] = MEMORY[0x1E0C809B0];
                    v137[1] = 3221225472;
                    v137[2] = __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_4;
                    v137[3] = &unk_1E16B4008;
                    v80 = v137;
                    v40 = (uint64_t)(id)v40;
                    v137[4] = v40;
                    v50 = (uint64_t)v23;
                    v138 = (id)v50;
                    v139 = v116;
                    objc_msgSend((id)v40, "_executeSplitViewControllerActions:", v137);

                  }
                  else
                  {
                    v134[0] = MEMORY[0x1E0C809B0];
                    v134[1] = 3221225472;
                    v134[2] = __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_5;
                    v134[3] = &unk_1E16B4008;
                    v80 = v134;
                    v40 = (uint64_t)(id)v40;
                    v134[4] = v40;
                    v50 = (uint64_t)v23;
                    v135 = (id)v50;
                    v136 = v116;
                    objc_msgSend((id)v40, "_executeSplitViewControllerActions:", v134);

                  }
                  goto LABEL_110;
                }
                if (a4 == 1 || !v22)
                {
                  v131[0] = MEMORY[0x1E0C809B0];
                  v131[1] = 3221225472;
                  v131[2] = __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_6;
                  v131[3] = &unk_1E16B4008;
                  v80 = v131;
                  v40 = (uint64_t)(id)v40;
                  v131[4] = v40;
                  v50 = (uint64_t)v23;
                  v132 = (id)v50;
                  v133 = v116;
                  objc_msgSend((id)v40, "_executeSplitViewControllerActions:", v131);

LABEL_110:
                  v73 = (id)v80[4];
LABEL_142:

                  goto LABEL_143;
                }
                -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v82, "navigationController");
                v73 = (id)objc_claimAutoreleasedReturnValue();

                objc_msgSend((id)v40, "_setAllowNestedNavigationControllers:", 1);
                objc_msgSend((id)v40, "viewControllers");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                v115 = (void *)objc_msgSend(v83, "mutableCopy");

                -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v84, "navigationController");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                v86 = v85;
                if (v85)
                {
                  v114 = v85;
                }
                else
                {
                  -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97470);
                  v113 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v113, "navigationControllerWrapper");
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  v89 = v88;
                  if (v88)
                  {
                    v114 = v88;
                  }
                  else
                  {
                    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97470);
                    v92 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v92, "navigationController");
                    v114 = (id)objc_claimAutoreleasedReturnValue();

                    v89 = 0;
                  }

                }
                if (v73 && v73 != (id)v40)
                {
                  *(_QWORD *)&buf = 0;
                  *((_QWORD *)&buf + 1) = &buf;
                  v154 = 0x3032000000;
                  v155 = __Block_byref_object_copy__59;
                  v156 = __Block_byref_object_dispose__59;
                  v157 = 0;
                  v126[0] = MEMORY[0x1E0C809B0];
                  v126[1] = 3221225472;
                  v126[2] = __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_7;
                  v126[3] = &unk_1E16C1A30;
                  p_buf = &buf;
                  v127 = v73;
                  v128 = v114;
                  v129 = self;
                  objc_msgSend(v127, "_executeSplitViewControllerActions:", v126);
                  if (objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count"))
                    objc_msgSend(v115, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));

                  _Block_object_dispose(&buf, 8);
                  goto LABEL_136;
                }
                if (!v73)
                {
                  if (os_variant_has_internal_diagnostics())
                  {
                    __UIFaultDebugAssertLog();
                    v112 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v112, OS_LOG_TYPE_FAULT))
                    {
                      LOWORD(buf) = 0;
                      _os_log_fault_impl(&dword_185066000, v112, OS_LOG_TYPE_FAULT, "Internal logic error setting a view controller for the Primary column", (uint8_t *)&buf, 2u);
                    }

                  }
                  else
                  {
                    v109 = qword_1ECD7D4E8;
                    if (!qword_1ECD7D4E8)
                    {
                      v109 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                      atomic_store(v109, (unint64_t *)&qword_1ECD7D4E8);
                    }
                    v110 = *(NSObject **)(v109 + 8);
                    if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
                    {
                      LOWORD(buf) = 0;
                      _os_log_impl(&dword_185066000, v110, OS_LOG_TYPE_ERROR, "Internal logic error setting a view controller for the Primary column", (uint8_t *)&buf, 2u);
                    }
                  }
                  goto LABEL_136;
                }
                v93 = objc_msgSend(v115, "indexOfObject:", v114);
                v94 = objc_msgSend(v115, "indexOfObject:", v23);
                v95 = objc_msgSend(v115, "count");
                if (v94 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  if (v95)
                  {
                    if (v93 != 0 && v93 != 0x7FFFFFFFFFFFFFFFLL)
                      v96 = v93 - 1;
                    else
                      v96 = 0;
LABEL_130:
                    objc_msgSend(v115, "insertObject:atIndex:", v23, v96);
LABEL_136:
                    v122[0] = MEMORY[0x1E0C809B0];
                    v122[1] = 3221225472;
                    v122[2] = __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_189;
                    v122[3] = &unk_1E16B4008;
                    v40 = (uint64_t)(id)v40;
                    v123 = (id)v40;
                    v124 = v115;
                    v125 = v116;
                    v98 = v115;
                    objc_msgSend((id)v40, "_executeSplitViewControllerActions:", v122);

                    v50 = (uint64_t)v23;
                    goto LABEL_142;
                  }
                }
                else
                {
                  objc_msgSend(v115, "removeObjectAtIndex:", v94);
                  if (v93 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    v97 = objc_msgSend(v115, "indexOfObject:", v114);
                    if (v97 != 0 && v97 != 0x7FFFFFFFFFFFFFFFLL)
                      v96 = v97 - 1;
                    else
                      v96 = 0;
                    goto LABEL_130;
                  }
                }
                objc_msgSend(v115, "addObject:", v23);
                goto LABEL_136;
              }
              goto LABEL_96;
            }
          }
          else
          {
            v120 = 0;
            if (!v40)
              goto LABEL_81;
          }
          v64 = 0;
          v41 = 1;
          goto LABEL_83;
        }
        if ((v119 & v42) != 0)
          v120 = v23;
        else
          v120 = 0;
        objc_msgSend((id)v40, "topViewController");
        v50 = objc_claimAutoreleasedReturnValue();

        if (v22 && !a4)
        {
          objc_msgSend((id)v40, "_setAllowNestedNavigationControllers:", 1);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "navigationController");
          v73 = (id)objc_claimAutoreleasedReturnValue();

          v41 = 1;
          if (v73 && v40 && v73 != (id)v40)
          {
            -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "navigationController");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = v75;
            if (v75)
            {
              v77 = v75;
            }
            else
            {
              -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97470);
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v117, "navigationControllerWrapper");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              v91 = v90;
              if (v90)
              {
                v77 = v90;
              }
              else
              {
                -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97470);
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v99, "navigationController");
                v77 = (id)objc_claimAutoreleasedReturnValue();

                v91 = 0;
              }

            }
            *(_QWORD *)&buf = 0;
            *((_QWORD *)&buf + 1) = &buf;
            v154 = 0x3032000000;
            v155 = __Block_byref_object_copy__59;
            v156 = __Block_byref_object_dispose__59;
            v100 = MEMORY[0x1E0C809B0];
            v157 = 0;
            v146[0] = MEMORY[0x1E0C809B0];
            v146[1] = 3221225472;
            v146[2] = __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke;
            v146[3] = &unk_1E16C1A30;
            v150 = &buf;
            v73 = v73;
            v147 = v73;
            v101 = v77;
            v148 = v101;
            v149 = self;
            objc_msgSend(v73, "_executeSplitViewControllerActions:", v146);
            if (objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count"))
            {
              v143[0] = v100;
              v143[1] = 3221225472;
              v143[2] = __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_2;
              v143[3] = &unk_1E16BACE0;
              v145 = &buf;
              v144 = (id)v40;
              objc_msgSend(v144, "_executeSplitViewControllerActions:", v143);

            }
            _Block_object_dispose(&buf, 8);

            v41 = 1;
          }
          goto LABEL_142;
        }
        v41 = 1;
      }
LABEL_143:
      v102 = self->_perColumnViewControllers;
      if (!v102)
      {
        v103 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v104 = self->_perColumnViewControllers;
        self->_perColumnViewControllers = v103;

        v102 = self->_perColumnViewControllers;
      }
      if (v40 | v50)
      {
        v105 = -[_UISplitViewControllerColumnContents initWithViewController:navigationController:navigationControllerWrapper:]([_UISplitViewControllerColumnContents alloc], "initWithViewController:navigationController:navigationControllerWrapper:", v50, v40, v120);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v102, "setObject:forKey:", v105, v106);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
        v105 = (_UISplitViewControllerColumnContents *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](v102, "removeObjectForKey:", v105);
      }

      if (v41)
        -[UISplitViewControllerPanelImpl updatePanelControllerForViewControllerChangeInColumn:alwaysAnimate:shouldUpdateCollapsedNavStack:](self, "updatePanelControllerForViewControllerChangeInColumn:alwaysAnimate:shouldUpdateCollapsedNavStack:", a4, 0, v118);
      WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(WeakRetained, "_didChangeDeepestActionResponder");

      goto LABEL_151;
    }
  }
LABEL_152:

}

- (int64_t)_columnForViewController:(id)a3
{
  return -[UISplitViewControllerPanelImpl _columnForViewController:forceExpandedResult:]((id *)&self->super.isa, a3, 0);
}

- (void)updatePanelControllerForViewControllerChangeInColumn:(int64_t)a3 alwaysAnimate:(BOOL)a4 shouldUpdateCollapsedNavStack:(BOOL)a5
{
  _BOOL4 v5;
  unint64_t v9;
  NSMutableDictionary *perColumnViewControllers;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  void *v16;
  id v17;
  int64_t v18;
  _BOOL4 v19;
  _BOOL8 v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  UIPanelController *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSMutableDictionary *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  NSMutableDictionary *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char v52;
  void *v53;
  id v54;
  void *v55;
  uint64_t v56;
  UIPanelController *panelController;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  unint64_t v68;
  NSObject *v69;
  NSObject *v70;
  char v71;
  SEL v72;
  void *v73;
  void *v75;
  _QWORD v76[4];
  id v77;
  id v78;
  BOOL v79;
  _QWORD v80[4];
  id v81;
  id v82;
  BOOL v83;
  _QWORD v84[4];
  id v85;
  id v86;
  uint8_t *v87;
  _QWORD v88[4];
  id v89;
  UISplitViewControllerPanelImpl *v90;
  uint8_t *v91;
  uint8_t buf[8];
  uint8_t *v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;

  v5 = a5;
  v9 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v9 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v9);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 2652, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v65);

  }
  v72 = a2;
  perColumnViewControllers = self->_perColumnViewControllers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](perColumnViewControllers, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "navigationController");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "navigationControllerWrapper");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = -[UISplitViewControllerPanelImpl _isCollapsed](self, "_isCollapsed");
  if (v15 || !(v13 | v14))
  {
    objc_msgSend(v12, "viewController");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v14)
      v16 = (void *)v14;
    else
      v16 = (void *)v13;
    v17 = v16;
  }
  v75 = v17;
  if (!a3)
    -[UIPanelController setLeadingTrailingWrapsNavigationController:](self->_panelController, "setLeadingTrailingWrapsNavigationController:", v14 != 0);
  v18 = -[UISplitViewControllerPanelImpl primaryEdge](self, "primaryEdge");
  if (v75)
    v19 = v5;
  else
    v19 = 0;
  if (v15 && v19)
  {
    if (v9 == 2)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v25 == 0;

      v21 = v20;
    }
    else
    {
      v20 = 0;
      v21 = 0;
    }
    switch(a3)
    {
      case 0:
        -[UIPanelController collapsedViewController](self->_panelController, "collapsedViewController");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPanelController leadingViewController](self->_panelController, "leadingViewController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v28 = 0;
        }
        else
        {
          -[UIPanelController trailingViewController](self->_panelController, "trailingViewController");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v55 == 0;

        }
        if (v14)
          v56 = v14;
        else
          v56 = v13;
        panelController = self->_panelController;
        if (v18)
        {
          -[UIPanelController setTrailingViewController:](panelController, "setTrailingViewController:", v56);
          if (!v28)
            break;
        }
        else
        {
          -[UIPanelController setLeadingViewController:](panelController, "setLeadingViewController:", v56);
          if (!v28)
            break;
        }
        -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "navigationController");
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26 != v59)
        {
          if (os_variant_has_internal_diagnostics())
          {
            __UIFaultDebugAssertLog();
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_185066000, v70, OS_LOG_TYPE_FAULT, "Surprising configuration when changing view controller in primary column while collapsed", buf, 2u);
            }

          }
          else
          {
            v68 = updatePanelControllerForViewControllerChangeInColumn_alwaysAnimate_shouldUpdateCollapsedNavStack____s_category;
            if (!updatePanelControllerForViewControllerChangeInColumn_alwaysAnimate_shouldUpdateCollapsedNavStack____s_category)
            {
              v68 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v68, (unint64_t *)&updatePanelControllerForViewControllerChangeInColumn_alwaysAnimate_shouldUpdateCollapsedNavStack____s_category);
            }
            v69 = *(NSObject **)(v68 + 8);
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_185066000, v69, OS_LOG_TYPE_ERROR, "Surprising configuration when changing view controller in primary column while collapsed", buf, 2u);
            }
          }
        }
        -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "navigationController");
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26 == v61)
        {
          -[UIPanelController setSupplementaryViewController:](self->_panelController, "setSupplementaryViewController:", 0);
          -[UIPanelController setCollapsedViewController:](self->_panelController, "setCollapsedViewController:", v13);
          *(_QWORD *)buf = 0;
          v93 = buf;
          v94 = 0x3032000000;
          v95 = __Block_byref_object_copy__59;
          v96 = __Block_byref_object_dispose__59;
          v62 = MEMORY[0x1E0C809B0];
          v97 = 0;
          v88[0] = MEMORY[0x1E0C809B0];
          v88[1] = 3221225472;
          v88[2] = __131__UISplitViewControllerPanelImpl_updatePanelControllerForViewControllerChangeInColumn_alwaysAnimate_shouldUpdateCollapsedNavStack___block_invoke;
          v88[3] = &unk_1E16B9698;
          v91 = buf;
          v63 = v26;
          v89 = v63;
          v90 = self;
          objc_msgSend(v63, "_executeSplitViewControllerActions:", v88);
          objc_msgSend(v63, "_setAllowNestedNavigationControllers:", 0);
          objc_msgSend((id)v13, "_setAllowNestedNavigationControllers:", 1);
          v84[0] = v62;
          v84[1] = 3221225472;
          v84[2] = __131__UISplitViewControllerPanelImpl_updatePanelControllerForViewControllerChangeInColumn_alwaysAnimate_shouldUpdateCollapsedNavStack___block_invoke_2;
          v84[3] = &unk_1E16BDBB0;
          v85 = (id)v13;
          v86 = v63;
          v87 = buf;
          objc_msgSend(v85, "_executeSplitViewControllerActions:", v84);

          _Block_object_dispose(buf, 8);
        }
        break;
      case 1:
        v33 = self->_perColumnViewControllers;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v33, "objectForKeyedSubscript:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "navigationController");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          if ((objc_msgSend(v26, "_isNavigationController") & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", v72, self, CFSTR("UISplitViewControllerPanelImpl.m"), 2703, CFSTR("Unexpectedly lost track of navigation controller for showing %@ column when collapsed"), CFSTR("Supplementary"));

          }
          objc_msgSend(v26, "topViewController");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36 != v75)
          {
            -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "viewController");
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            if (v36 == v38)
              -[UISplitViewControllerPanelImpl sendWillHideColumn:](self, "sendWillHideColumn:", 0);
            -[UISplitViewControllerPanelImpl sendWillShowColumn:](self, "sendWillShowColumn:", 1);
            v80[0] = MEMORY[0x1E0C809B0];
            v80[1] = 3221225472;
            v80[2] = __131__UISplitViewControllerPanelImpl_updatePanelControllerForViewControllerChangeInColumn_alwaysAnimate_shouldUpdateCollapsedNavStack___block_invoke_3;
            v80[3] = &unk_1E16B4008;
            v81 = v26;
            v82 = (id)v13;
            v83 = a4;
            objc_msgSend(v81, "_executeSplitViewControllerActions:", v80);

          }
        }
        break;
      case 2:
        v41 = self->_perColumnViewControllers;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v41, "objectForKeyedSubscript:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "navigationController");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
        {
          v71 = v21;
          if ((objc_msgSend(v44, "_isNavigationController") & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", v72, self, CFSTR("UISplitViewControllerPanelImpl.m"), 2722, CFSTR("Unexpectedly lost track of navigation controller for showing %@ column when collapsed"), CFSTR("Secondary"));

          }
          objc_msgSend(v44, "topViewController");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "viewController");
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "navigationController");
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v44, "viewControllers");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = (void *)objc_msgSend(v49, "mutableCopy");

          if (v9 != 2 || v48 == 0)
            v52 = 1;
          else
            v52 = v71;
          if ((v52 & 1) == 0 && v73 != v48)
            objc_msgSend(v50, "addObject:", v48);
          if (v73 == v46 || v73 == v48)
          {
            -[UISplitViewControllerPanelImpl sendWillHideColumn:](self, "sendWillHideColumn:", v73 != v46);
            -[UISplitViewControllerPanelImpl sendWillShowColumn:](self, "sendWillShowColumn:", 2);
          }
          if (v13)
            v53 = (void *)v13;
          else
            v53 = v75;
          objc_msgSend(v50, "addObject:", v53);
          v76[0] = MEMORY[0x1E0C809B0];
          v76[1] = 3221225472;
          v76[2] = __131__UISplitViewControllerPanelImpl_updatePanelControllerForViewControllerChangeInColumn_alwaysAnimate_shouldUpdateCollapsedNavStack___block_invoke_4;
          v76[3] = &unk_1E16B4008;
          v77 = v44;
          v78 = v50;
          v79 = a4;
          v54 = v50;
          objc_msgSend(v77, "_executeSplitViewControllerActions:", v76);

        }
        goto LABEL_82;
      case 3:
        goto LABEL_82;
      default:
        goto LABEL_30;
    }
LABEL_81:

  }
  else
  {
    switch(a3)
    {
      case 0:
        v22 = (uint64_t)v75;
        if (v13)
          v22 = v13;
        if (v14)
          v23 = v14;
        else
          v23 = v22;
        v24 = self->_panelController;
        if (v18)
          -[UIPanelController setTrailingViewController:](v24, "setTrailingViewController:", v23);
        else
          -[UIPanelController setLeadingViewController:](v24, "setLeadingViewController:", v23);
        break;
      case 1:
        -[UIPanelController configuration](self->_panelController, "configuration");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setSupplementaryEdge:", v18);

        if (v13)
          v32 = (void *)v13;
        else
          v32 = v75;
        -[UIPanelController setSupplementaryViewController:](self->_panelController, "setSupplementaryViewController:", v32);
        break;
      case 2:
        v39 = (uint64_t)v75;
        if (v13)
          v39 = v13;
        if (v14)
          v40 = v14;
        else
          v40 = v39;
        -[UIPanelController setMainViewController:](self->_panelController, "setMainViewController:", v40);
        break;
      case 3:
        break;
      default:
LABEL_30:
        v29 = (void *)MEMORY[0x1E0C99DA0];
        v30 = *MEMORY[0x1E0C99778];
        _UISplitViewControllerColumnDescription(a3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "raise:format:", v30, CFSTR("Can't assign a view controller to %@ column"), v26);
        goto LABEL_81;
    }
  }
LABEL_82:

}

uint64_t __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", *(_QWORD *)(a1 + 40), 0);
}

- (void)setUserGeneratedDisplayMode:(int64_t)a3
{
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v6 = -[UISplitViewControllerPanelImpl style](self, "style");
  if ((unint64_t)(v6 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v6;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 2523, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v10);

  }
  v7 = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFF87 | (8 * (a3 & 7));
  self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)v7;
  if (a3 != 3 && a3 != 5)
    self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(v7 & 0xFFFFFFFFFFFDFFBFLL);
}

- (BOOL)inCollapsingToProposedTopColumnCallback
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 4) & 1;
}

uint64_t __66__UISplitViewControllerPanelImpl_showDetailViewController_sender___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showViewController:sender:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __45__UISplitViewControllerPanelImpl_showColumn___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _BOOL4 v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  unint64_t v13;
  _BOOL8 v14;
  id v15;

  if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(WeakRetained, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v8 = v6 - v7;
  if (v6 <= v7)
  {
    v13 = v7 - v6;
    if (v7 > v6)
    {
      do
      {
        if (--v13)
          v14 = 0;
        else
          v14 = v5;
        v15 = (id)objc_msgSend(*(id *)(a1 + 40), "popViewControllerAnimated:", v14);
      }
      while (v13);
    }
  }
  else
  {
    v9 = 0;
    do
    {
      v10 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v8 - 1 == v9 && v5;
      objc_msgSend(v10, "pushViewController:animated:", v11, v12);

      ++v9;
    }
    while (v8 != v9);
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v7;
  id v8;
  id WeakRetained;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  int64_t v25;
  unint64_t v26;
  unint64_t v27;
  NSObject *v28;
  NSObject *v29;
  unint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int64_t v37;
  unint64_t v38;
  void *v39;
  _BOOL8 v40;
  NSMutableDictionary *perColumnViewControllers;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int64_t v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  _QWORD v57[5];
  id v58;
  id v59;
  _QWORD v60[5];
  id v61;
  id v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v10 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "_existingView");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = &qword_186677000;
  if (v11)
  {
    v14 = (void *)v11;
    objc_msgSend(WeakRetained, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "horizontalSizeClass");
    v17 = objc_msgSend(v7, "horizontalSizeClass");

    v12 = MEMORY[0x1E0C809B0];
    v18 = v16 == v17;
    v13 = &qword_186677000;
    if (!v18)
    {
      objc_storeStrong((id *)&self->_transitioningToTraitCollection, a3);
      objc_msgSend(WeakRetained, "_window");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstResponder");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "detailViewController");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (v21)
        v23 = (void *)v21;
      else
        v23 = WeakRetained;
      v24 = v23;

      if (!objc_msgSend(v24, "_containsResponder:", v20))
        goto LABEL_15;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v25 = -[UISplitViewControllerPanelImpl style](self, "style");
        if (v25)
        {
          v26 = v25;
          v27 = willTransitionToTraitCollection_withTransitionCoordinator____s_category;
          if (!willTransitionToTraitCollection_withTransitionCoordinator____s_category)
          {
            v27 = __UILogCategoryGetNode("UISplitViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v27, (unint64_t *)&willTransitionToTraitCollection_withTransitionCoordinator____s_category);
          }
          v28 = *(NSObject **)(v27 + 8);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v29 = v28;
            v30 = v26;
            v31 = v29;
            NSStringFromSelector(sel__splitViewControllerShouldRestoreResponderAfterTraitCollectionTransition_);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            _UISplitViewControllerStyleDescription(v30);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v64 = v32;
            v65 = 2114;
            v66 = v33;
            _os_log_impl(&dword_185066000, v31, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", buf, 0x16u);

          }
        }
        else if (!objc_msgSend(v10, "_splitViewControllerShouldRestoreResponderAfterTraitCollectionTransition:", WeakRetained))
        {
LABEL_15:
          v12 = MEMORY[0x1E0C809B0];
          v60[0] = MEMORY[0x1E0C809B0];
          v13 = &qword_186677000;
          v60[1] = 3221225472;
          v60[2] = __92__UISplitViewControllerPanelImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
          v60[3] = &unk_1E16BF9D0;
          v60[4] = self;
          v61 = v7;
          v62 = WeakRetained;
          objc_msgSend(v8, "animateAlongsideTransition:completion:", 0, v60);

          goto LABEL_16;
        }
      }
      objc_storeStrong((id *)&self->_postTransitionResponder, v20);
      *(_QWORD *)&self->_flags &= 0xFFFFFFFFFFFFF3FFLL;
      objc_msgSend(WeakRetained, "_window");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "_setIsSettingFirstResponder:", 1);

      goto LABEL_15;
    }
  }
LABEL_16:
  if (dyld_program_sdk_at_least())
  {
    if (-[UISplitViewControllerPanelImpl style](self, "style"))
    {
      if (self->_suspendedState == 2)
      {
        -[UISplitViewControllerPanelImpl panelController](self, "panelController");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "collapsedViewController");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          v37 = -[UISplitViewControllerPanelImpl style](self, "style");
          v38 = v37;
          if ((unint64_t)(v37 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            _UISplitViewControllerStyleDescription(v38);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 3329, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v55);

            v40 = 0;
          }
          else
          {
            if (v37 != 2)
            {
              v40 = 0;
LABEL_25:
              perColumnViewControllers = self->_perColumnViewControllers;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v40);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary objectForKeyedSubscript:](perColumnViewControllers, "objectForKeyedSubscript:", v42);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "navigationController");
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              -[UISplitViewControllerPanelImpl panelController](self, "panelController");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "collapsedViewController");
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              if (v46 != v44)
              {
LABEL_34:

                goto LABEL_35;
              }
              objc_msgSend(v44, "_nestedTopViewController");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              -[UISplitViewControllerPanelImpl viewControllerForColumn:](self, "viewControllerForColumn:", 0);
              v48 = (void *)objc_claimAutoreleasedReturnValue();

              if (v47 == v48)
              {
                v51 = 3;
              }
              else
              {
                -[UISplitViewControllerPanelImpl viewControllerForColumn:](self, "viewControllerForColumn:", 1);
                v49 = (void *)objc_claimAutoreleasedReturnValue();

                if (v47 == v49)
                {
                  v51 = 5;
                }
                else
                {
                  -[UISplitViewControllerPanelImpl viewControllerForColumn:](self, "viewControllerForColumn:", 2);
                  v50 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v47 != v50)
                  {
LABEL_33:

                    goto LABEL_34;
                  }
                  v51 = 4;
                }
              }
              self->_suspendedState = v51;
              goto LABEL_33;
            }
            -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v39 == 0;
          }

          goto LABEL_25;
        }
      }
    }
  }
LABEL_35:
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v12;
  v57[1] = v13[481];
  v57[2] = __92__UISplitViewControllerPanelImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_2;
  v57[3] = &unk_1E16B47A8;
  v57[4] = self;
  v58 = v7;
  v59 = v8;
  v53 = v8;
  v54 = v7;
  objc_msgSend(v52, "willTransitionToTraitCollection:withTransitionCoordinator:superBlock:", v54, v53, v57);

}

void __92__UISplitViewControllerPanelImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  objc_msgSend(WeakRetained, "_super_willTransitionToTraitCollection:withTransitionCoordinator:", a1[5], a1[6]);

}

- (void)panelControllerDidCollapse:(id)a3
{
  UISplitViewController **p_svc;
  id WeakRetained;
  id v5;
  id v6;

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v6, "splitViewControllerDidCollapse:", v5);

  }
}

- (UISplitViewControllerPanelImpl)initWithSplitViewController:(id)a3
{
  id v4;
  UISplitViewControllerPanelImpl *v5;
  UISplitViewControllerPanelImpl *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UISplitViewControllerPanelImpl;
  v5 = -[UISplitViewControllerPanelImpl init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_svc, v4);
    v6->_lastNotifiedTopColumnForCollapse = 999;
  }

  return v6;
}

- (void)_commonInit
{
  UIPanelController *v3;
  id WeakRetained;
  UIPanelController *v5;
  void *v6;
  int64x2_t v7;
  void *v8;
  _UIHyperpoint *v9;
  _UIHyperpoint *v10;
  NSMutableArray *v11;
  NSMutableArray *hyperpoints;
  _UIHyperregionUnion *v13;
  _UIHyperregionUnion *regionUnion;
  _UIHyperrectangle *v15;
  _UIHyperrectangle *hyperrectangle;
  _UIHyperInteractor *v17;
  _UIHyperInteractor *interactor;
  _UIHyperConstantExtender *v19;
  _UIHyperConstantExtender *extender;
  void *v21;
  id v22;
  void *v23;
  int v24;
  uint64_t v25;
  _BOOL4 v26;
  uint64_t v27;

  v3 = [UIPanelController alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v5 = -[UIPanelController initWithOwningViewController:](v3, "initWithOwningViewController:", WeakRetained);
  -[UISplitViewControllerPanelImpl setPanelController:](self, "setPanelController:", v5);

  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  self->_preferredPrimaryColumnWidthFraction = -3.40282347e38;
  v7 = vdupq_n_s64(0xC7EFFFFFE0000000);
  self->_preferredSupplementaryColumnWidthFraction = -3.40282347e38;
  *(int64x2_t *)&self->_preferredPrimaryColumnWidth = v7;
  *(int64x2_t *)&self->_maximumPrimaryColumnWidth = v7;
  *(int64x2_t *)&self->_minimumSupplementaryColumnWidth = v7;
  self->_primaryEdge = 0;
  v8 = (void *)MEMORY[0x1E0C99DE8];
  v9 = -[_UIHyperpoint initWithDimensions:]([_UIHyperpoint alloc], "initWithDimensions:", 1);
  v10 = -[_UIHyperpoint initWithDimensions:]([_UIHyperpoint alloc], "initWithDimensions:", 1);
  objc_msgSend(v8, "arrayWithObjects:", v9, v10, 0);
  v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  hyperpoints = self->_hyperpoints;
  self->_hyperpoints = v11;

  v13 = -[_UIHyperregionUnion initWithDimensions:]([_UIHyperregionUnion alloc], "initWithDimensions:", 1);
  regionUnion = self->_regionUnion;
  self->_regionUnion = v13;

  -[_UIHyperregionUnion _setRegions:](self->_regionUnion, "_setRegions:", self->_hyperpoints);
  v15 = -[_UIHyperrectangle initWithDimensions:]([_UIHyperrectangle alloc], "initWithDimensions:", 1);
  hyperrectangle = self->_hyperrectangle;
  self->_hyperrectangle = v15;

  v17 = -[_UIHyperInteractor initWithDimensions:]([_UIHyperInteractor alloc], "initWithDimensions:", 1);
  interactor = self->_interactor;
  self->_interactor = v17;

  -[_UIHyperInteractor _extender](self->_interactor, "_extender");
  v19 = (_UIHyperConstantExtender *)objc_claimAutoreleasedReturnValue();
  extender = self->_extender;
  self->_extender = v19;

  -[UISplitViewControllerPanelImpl styleProvider](self, "styleProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "maximumRubberbandingDistance");
  -[_UIHyperConstantExtender _setMaximumDistance:](self->_extender, "_setMaximumDistance:");

  v22 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v22, "traitCollection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  self->_presentsWithGesture = objc_msgSend(v23, "userInterfaceIdiom") != 6;

  v24 = dyld_program_sdk_at_least();
  v25 = 0x2000;
  if (!v24)
    v25 = 0;
  self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v25);
  v26 = +[UISplitViewController _devicePrefersOverlayInRegularWidth](UISplitViewController, "_devicePrefersOverlayInRegularWidth");
  v27 = 0x4000;
  if (!v26)
    v27 = 0;
  self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v27);
  self->_primaryBackgroundStyle = 0;
  self->_lastFocusedChildViewControllerColumn = 999;
  self->__primaryOffscreenGestureMode = -[UISplitViewControllerPanelImpl _defaultPrimaryOffscreenGestureModeForCurrentIdiom](self, "_defaultPrimaryOffscreenGestureModeForCurrentIdiom");
}

- (void)setPanelController:(id)a3
{
  objc_storeStrong((id *)&self->_panelController, a3);
}

- (int64_t)_defaultPrimaryOffscreenGestureModeForCurrentIdiom
{
  if (qword_1ECD7D5A8 != -1)
    dispatch_once(&qword_1ECD7D5A8, &__block_literal_global_1258);
  return 0;
}

- (void)setStyle:(int64_t)a3
{
  if (-[UIPanelController style](self->_panelController, "style") != a3)
    -[UIPanelController setStyle:](self->_panelController, "setStyle:", a3);
}

- (id)_additionalViewControllersToCheckForUserActivity
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[UISplitViewControllerPanelImpl panelController](self, "panelController", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allViewControllers");
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
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if (v10 && ((*(_DWORD *)(v10 + 368) >> 1) & 3u) - 1 <= 1)
          objc_msgSend(v3, "addObject:");
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (void)setPreferredDisplayMode:(int64_t)a3
{
  if (self->_preferredDisplayMode | a3)
  {
    self->_preferredDisplayMode = a3;
    -[UISplitViewControllerPanelImpl _changeToDisplayMode:fromPreferredDisplayMode:](self, "_changeToDisplayMode:fromPreferredDisplayMode:");
    *(_QWORD *)&self->_flags |= 0x200uLL;
  }
}

- (void)setMinimumPrimaryColumnWidth:(double)a3
{
  if (self->_minimumPrimaryColumnWidth != a3)
  {
    self->_minimumPrimaryColumnWidth = a3;
    -[UISplitViewControllerPanelImpl _primaryColumnWidthAffectingPropertyDidChange](self, "_primaryColumnWidthAffectingPropertyDidChange");
  }
}

- (void)setMaximumPrimaryColumnWidth:(double)a3
{
  if (self->_maximumPrimaryColumnWidth != a3)
  {
    self->_maximumPrimaryColumnWidth = a3;
    -[UISplitViewControllerPanelImpl _primaryColumnWidthAffectingPropertyDidChange](self, "_primaryColumnWidthAffectingPropertyDidChange");
  }
}

- (UIViewControllerTransitionCoordinator)transitionCoordinator
{
  void *v2;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v5 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 2104, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v2);

  }
  if (!-[UISplitViewControllerPanelImpl isCollapsed](self, "isCollapsed"))
  {
    -[UIPanelController transitionCoordinator](self->_panelController, "transitionCoordinator");
    return (UIViewControllerTransitionCoordinator *)(id)objc_claimAutoreleasedReturnValue();
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974A0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewController");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (v5 == 2
      && (-[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488), (v2 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 != 2)
      {
LABEL_13:

        if (v8)
          goto LABEL_14;
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            goto LABEL_21;
          _UISplitViewControllerStyleDescription(-[UISplitViewControllerPanelImpl style](self, "style"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v19 = v17;
          _os_log_fault_impl(&dword_185066000, v16, OS_LOG_TYPE_FAULT, "Unable to locate transition coordinator for collapsed %@ UISplitViewController", buf, 0xCu);
        }
        else
        {
          v14 = transitionCoordinator___s_category;
          if (!transitionCoordinator___s_category)
          {
            v14 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v14, (unint64_t *)&transitionCoordinator___s_category);
          }
          v15 = *(NSObject **)(v14 + 8);
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            goto LABEL_22;
          v16 = v15;
          _UISplitViewControllerStyleDescription(-[UISplitViewControllerPanelImpl style](self, "style"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v19 = v17;
          _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Unable to locate transition coordinator for collapsed %@ UISplitViewController", buf, 0xCu);
        }

LABEL_21:
LABEL_22:
        v8 = 0;
        goto LABEL_14;
      }
    }

    goto LABEL_13;
  }
  v8 = (void *)v7;

LABEL_14:
  objc_msgSend(v8, "transitionCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewControllerTransitionCoordinator *)v12;
}

- (void)_navigationControllerDidChangeNavigationBarHidden:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationControllerDidChangeNavigationBarHidden:", v8);

  if (-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    objc_msgSend(v8, "_targetNavigationBarForUISplitViewControllerSidebarButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_existingNavigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {
      v7 = objc_msgSend(v8, "isNavigationBarHidden");

      if ((v7 & 1) != 0)
        goto LABEL_7;
    }
    else
    {

    }
    if ((unint64_t)-[UISplitViewControllerPanelImpl _columnForMonitoredNavigationController:](self, "_columnForMonitoredNavigationController:", v8) <= 2)-[UISplitViewControllerPanelImpl _updateDisplayModeButtonItemIfNecessaryForChangingNavigationController:](self, "_updateDisplayModeButtonItemIfNecessaryForChangingNavigationController:", v8);
  }
LABEL_7:

}

- (void)_updateChildContentMargins
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
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
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "viewControllers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[UISplitViewControllerPanelImpl _contentMarginForChildViewController:](self, "_contentMarginForChildViewController:", v9);
        objc_msgSend(v9, "_setContentMargin:");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (NSArray)viewControllers
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "collapsedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v10[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = (void *)objc_opt_new();
      -[UISplitViewControllerPanelImpl _currentPrimaryChildViewController](self, "_currentPrimaryChildViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(v5, "addObject:", v7);
      -[UISplitViewControllerPanelImpl _currentSupplementaryChildViewController](self, "_currentSupplementaryChildViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        objc_msgSend(v5, "addObject:", v8);
      -[UISplitViewControllerPanelImpl panelController](self, "panelController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mainViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
        objc_msgSend(v5, "addObject:", v4);
    }

    return (NSArray *)v5;
  }
  else
  {
    -[UISplitViewControllerPanelImpl _unspecifiedStyleViewControllers](self, "_unspecifiedStyleViewControllers");
    return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_unspecifiedStyleViewControllers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collapsedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)objc_opt_new();
    -[UISplitViewControllerPanelImpl _currentPrimaryChildViewController](self, "_currentPrimaryChildViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v5, "addObject:", v6);
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mainViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      objc_msgSend(v5, "addObject:", v4);
  }

  return v5;
}

- (id)_currentSupplementaryChildViewController
{
  void *v5;

  if (!-[UIPanelController supportsColumnStyle](self->_panelController, "supportsColumnStyle"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 7473, CFSTR("Incorrect panelController for UISplitViewControllerStyleTripleColumn."));

  }
  return -[UIPanelController supplementaryViewController](self->_panelController, "supplementaryViewController");
}

- (void)viewDidLayoutSubviews
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  NSMutableDictionary *perColumnViewControllers;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  BOOL v37;
  void *v38;
  void *v39;
  void *v40;
  double MaxX;
  double MinX;
  double *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  UIView *v52;
  UIView *floatableButtonContainer;
  UIView *v54;
  UIView *v55;
  int v56;
  void *v57;
  double v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  -[UISplitViewControllerPanelImpl _updateFocusContainerGuideFrames](self, "_updateFocusContainerGuideFrames");
  if (-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    -[UISplitViewControllerPanelImpl _updateAllowsTriggeringSidebarKeyCommandAction](self, "_updateAllowsTriggeringSidebarKeyCommandAction");
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[UIBarButtonItem isHidden](self->_sidebarToggleButtonItem, "isHidden")
      || !-[_UIFloatableBarButtonItem _isFloating](self->_sidebarToggleButtonItem, "_isFloating")
      || -[UISplitViewControllerPanelImpl _alwaysHideSidebarToggleButton](self, "_alwaysHideSidebarToggleButton"))
    {
      if (self->_floatableButtonContainer
        || -[UIBarButtonItem isHidden](self->_sidebarToggleButtonItem, "isHidden")
        || -[UISplitViewControllerPanelImpl _alwaysHideSidebarToggleButton](self, "_alwaysHideSidebarToggleButton"))
      {
        -[UIView setAlpha:](self->_floatableButtonContainer, "setAlpha:", 0.0);
LABEL_46:

        return;
      }
      v56 = 1;
    }
    else
    {
      v56 = 0;
    }
    v5 = &unk_1E1A97470;
    if (-[UISplitViewControllerPanelImpl style](self, "style") == 2)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v6 == 0;
      if (v6)
        v5 = &unk_1E1A974B8;
    }
    else
    {
      v7 = 0;
    }
    perColumnViewControllers = self->_perColumnViewControllers;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](perColumnViewControllers, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "_existingNavigationBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v11;
    if (objc_msgSend(v11, "isNavigationBarHidden"))
    {
      objc_msgSend(v11, "_targetNavigationBarForUISplitViewControllerSidebarButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13 == v12)
        v15 = 0;
      else
        v15 = v13;

      v12 = v15;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "navigationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "_existingNavigationBar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isNavigationBarHidden"))
    {
      objc_msgSend(v17, "_targetNavigationBarForUISplitViewControllerSidebarButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19 == v18)
        v21 = 0;
      else
        v21 = v19;

      v18 = v21;
    }
    -[_UIFloatableBarButtonItem _configuredFloatableView](self->_sidebarToggleButtonItem, "_configuredFloatableView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatableBarButtonItem _referenceView](self->_sidebarToggleButtonItem, "_referenceView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "layoutIfNeeded");

    objc_msgSend(v23, "bounds");
    objc_msgSend(v4, "convertRect:fromView:", v23);
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    objc_msgSend(v23, "window");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      -[UIView frame](self->_floatableButtonContainer, "frame");
      v27 = v35;
      v29 = v36;
    }
    v37 = -[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading");
    objc_msgSend(v23, "visualProvider");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v37)
      objc_msgSend(v38, "alignmentViewForStaticNavBarButtonLeading");
    else
      objc_msgSend(v38, "alignmentViewForStaticNavBarButtonTrailing");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[UISplitViewControllerPanelImpl _layoutPrimaryOnRight](self, "_layoutPrimaryOnRight"))
    {
      objc_msgSend(v23, "bounds");
      MaxX = CGRectGetMaxX(v59);
      objc_msgSend(v40, "frame");
      MinX = MaxX - CGRectGetMaxX(v60);
    }
    else
    {
      objc_msgSend(v40, "frame");
      MinX = CGRectGetMinX(v61);
    }
    v58 = 0.0;
    if (v56)
      v43 = 0;
    else
      v43 = &v58;
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "interpolatedMarginForPrimaryNavigationBar:supplementaryOrSecondaryNavbar:getInterpolatedAlpha:", v12, v18, v43);
    v46 = v45 - MinX;

    if (-[UISplitViewControllerPanelImpl _layoutPrimaryOnRight](self, "_layoutPrimaryOnRight"))
    {
      objc_msgSend(v4, "bounds");
      v47 = CGRectGetMaxX(v62);
      objc_msgSend(v4, "safeAreaInsets");
      v49 = v47 - v48 - v46;
      v63.origin.x = v27;
      v63.origin.y = v29;
      v63.size.width = v31;
      v63.size.height = v33;
      v50 = v49 - CGRectGetWidth(v63);
    }
    else
    {
      objc_msgSend(v4, "safeAreaInsets");
      v50 = v46 + v51;
    }
    if (!self->_floatableButtonContainer)
    {
      v52 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v50, v29, v31, v33);
      floatableButtonContainer = self->_floatableButtonContainer;
      self->_floatableButtonContainer = v52;

      objc_msgSend(v4, "addSubview:", self->_floatableButtonContainer);
      _UIBarsSetAccessibilityLimits(self->_floatableButtonContainer);
    }
    if (v22)
    {
      objc_msgSend(v22, "superview");
      v54 = (UIView *)objc_claimAutoreleasedReturnValue();
      v55 = self->_floatableButtonContainer;

      if (v54 != v55)
      {
        -[UIView bounds](self->_floatableButtonContainer, "bounds");
        objc_msgSend(v22, "setFrame:");
        -[UIView addSubview:](self->_floatableButtonContainer, "addSubview:", v22);
        objc_msgSend(v22, "setAutoresizingMask:", 18);
      }
    }
    -[UIView setFrame:](self->_floatableButtonContainer, "setFrame:", v50, v29, v31, v33);
    -[UIView setAlpha:](self->_floatableButtonContainer, "setAlpha:", v58);

    goto LABEL_46;
  }
}

- (void)_updateAllowsTriggeringSidebarKeyCommandAction
{
  $692BA5F601ABB544448C4E0A48A865F8 v3;
  $692BA5F601ABB544448C4E0A48A865F8 v4;
  $692BA5F601ABB544448C4E0A48A865F8 flags;
  id v6;

  if (-[UISplitViewControllerPanelImpl style](self, "style")
    && !-[UISplitViewControllerPanelImpl _alwaysHideSidebarToggleButton](self, "_alwaysHideSidebarToggleButton"))
  {
    flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x400000) != 0)
      return;
    v4 = ($692BA5F601ABB544448C4E0A48A865F8)(*(unint64_t *)&flags | 0x400000);
  }
  else
  {
    v3 = self->_flags;
    if ((*(_DWORD *)&v3 & 0x400000) == 0)
      return;
    v4 = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&v3 & 0xFFFFFFFFFFBFFFFFLL);
  }
  self->_flags = v4;
  +[UIMenuSystem mainSystem](UIMenuSystem, "mainSystem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsRevalidate");

}

- (void)_navigationControllerDidUpdateStack:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  NSMutableDictionary *perColumnViewControllers;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  _UISplitViewControllerColumnContents *v15;
  NSMutableDictionary *v16;
  void *v17;
  id v18;

  v18 = a3;
  v4 = -[UISplitViewControllerPanelImpl _columnForMonitoredNavigationController:](self, "_columnForMonitoredNavigationController:");
  if (v4 <= 2)
  {
    v5 = v4;
    objc_msgSend(v18, "topViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    perColumnViewControllers = self->_perColumnViewControllers;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](perColumnViewControllers, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 != v10)
    {
      v11 = -[UISplitViewControllerPanelImpl _isCollapsedOrCollapsing](self, "_isCollapsedOrCollapsing");
      if (v5 || !v11)
      {
        if (v5 == 2)
          v12 = &unk_1E1A97470;
        else
          v12 = &unk_1E1A97488;
        if ((v5 | 2) != 2)
        {
          v14 = 0;
          goto LABEL_13;
        }
LABEL_11:
        -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "navigationControllerWrapper");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
        v15 = -[_UISplitViewControllerColumnContents initWithViewController:navigationController:navigationControllerWrapper:]([_UISplitViewControllerColumnContents alloc], "initWithViewController:navigationController:navigationControllerWrapper:", v6, v18, v14);
        v16 = self->_perColumnViewControllers;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v15, v17);

        goto LABEL_14;
      }
      if ((unint64_t)(-[UISplitViewControllerPanelImpl _columnForViewController:](self, "_columnForViewController:", v6)- 3) < 0xFFFFFFFFFFFFFFFELL)
      {
        v12 = &unk_1E1A97488;
        goto LABEL_11;
      }
    }
LABEL_14:
    -[UISplitViewControllerPanelImpl _updateDisplayModeButtonItemIfNecessaryForChangingNavigationController:](self, "_updateDisplayModeButtonItemIfNecessaryForChangingNavigationController:", v18);

  }
}

- (void)_navigationController:(id)a3 navigationBar:(id)a4 itemBackButtonUpdated:(id)a5
{
  if ((unint64_t)-[UISplitViewControllerPanelImpl _columnForMonitoredNavigationController:](self, "_columnForMonitoredNavigationController:", a3, a4, a5) <= 1)-[UISplitViewControllerPanelImpl _updateDisplayModeButtonItem](self, "_updateDisplayModeButtonItem");
}

- (int64_t)_columnForMonitoredNavigationController:(id)a3
{
  id v4;
  int64_t v5;
  NSMutableDictionary *perColumnViewControllers;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    v5 = -[UISplitViewControllerPanelImpl _columnForViewController:](self, "_columnForViewController:", v4);
    if (v5 != 999)
    {
      perColumnViewControllers = self->_perColumnViewControllers;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](perColumnViewControllers, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "navigationController");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9 != v4)
        v5 = 999;
    }
  }
  else
  {
    v5 = 999;
  }

  return v5;
}

- (void)_updateDisplayModeButtonItemIfNecessaryForChangingNavigationController:(id)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v5 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v5 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 9477, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v21);

  }
  if (!objc_msgSend(v22, "isNavigationBarHidden")
    || (objc_msgSend(v22, "_targetNavigationBarForUISplitViewControllerSidebarButton"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v22, "_existingNavigationBar"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v6 != v7))
  {
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "collapsedState");

    if (!v9)
    {
      objc_msgSend(v22, "transitionCoordinator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISplitViewControllerPanelImpl _updateDisplayModeButtonItemAndResetForCanceledAnimationWithTransitionCoordinator:](self, "_updateDisplayModeButtonItemAndResetForCanceledAnimationWithTransitionCoordinator:", v10);

      v11 = -[UISplitViewControllerPanelImpl _columnForMonitoredNavigationController:](self, "_columnForMonitoredNavigationController:", v22);
      if (v11 <= 1)
      {
        v12 = v11;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97470);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "navigationController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "navigationBar");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_refreshBackButtonMenu");

        if (v5 == 2)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            if (v16)
            {
              -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "navigationController");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "navigationBar");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "_refreshBackButtonMenu");

            }
          }
        }
      }
    }
  }

}

- (void)_unspecifiedStyleChangeToDisplayMode:(int64_t)a3 fromPreferredDisplayMode:(int64_t)a4
{
  int64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v8 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v8)
  {
    v13 = v8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 4922, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v15);

  }
  if ((unint64_t)(a3 - 1) >= 3)
  {
    if (a4 == 3 && (*(_QWORD *)&self->_flags & 0x200) != 0)
    {
      v9 = 2;
    }
    else
    {
      -[UISplitViewControllerPanelImpl panelController](self, "panelController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "currentState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[UISplitViewControllerPanelImpl _displayModeForState:](self, "_displayModeForState:", v11) == 3;

      v9 = 2 * v12;
    }
  }
  else
  {
    v9 = qword_18667A658[a3 - 1];
  }
  -[UISplitViewControllerPanelImpl _setPrimaryHidingState:](self, "_setPrimaryHidingState:", v9);
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNeedsUpdate");

}

- (void)_setPrimaryHidingState:(int64_t)a3
{
  self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFF9 | (2 * (a3 & 3)));
}

- (void)setPresentsWithGesture:(BOOL)a3
{
  if (self->_presentsWithGesture != a3)
  {
    self->_presentsWithGesture = a3;
    -[UISplitViewControllerPanelImpl _updatePresentationGestureRecognizer](self, "_updatePresentationGestureRecognizer");
    if (-[UISplitViewControllerPanelImpl style](self, "style"))
    {
      if (-[UISplitViewControllerPanelImpl _visibleToggleButtonRequiresPresentsWithGesture](self, "_visibleToggleButtonRequiresPresentsWithGesture"))
      {
        -[UISplitViewControllerPanelImpl _updateDisplayModeButtonItem](self, "_updateDisplayModeButtonItem");
        -[UISplitViewControllerPanelImpl _invalidateAllowsTriggeringSidebarKeyCommandAction](self, "_invalidateAllowsTriggeringSidebarKeyCommandAction");
      }
    }
  }
}

- (void)_unspecifiedStylePanelController:(id)a3 didChangeToState:(id)a4 withSize:(CGSize)a5
{
  double height;
  double width;
  int64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v18;
  char v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  int64_t v24;
  int64_t v25;
  BOOL v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  char v30;
  id v31;
  id v32;
  unint64_t v33;
  void *v34;
  void *v35;
  id v36;

  height = a5.height;
  width = a5.width;
  v36 = a4;
  v9 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v9)
  {
    v33 = v9;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 6190, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v35);

  }
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isAnimating");

  if ((v11 & 1) == 0)
  {
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stateRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 && objc_msgSend(v13, "userInitiated"))
    {
      if (-[UISplitViewControllerPanelImpl _isPrimaryShown](self, "_isPrimaryShown"))
      {
        -[UISplitViewControllerPanelImpl _setPrimaryHidingState:](self, "_setPrimaryHidingState:", 2);
        if (-[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading"))
          objc_msgSend(v36, "leadingWidth");
        else
          objc_msgSend(v36, "trailingWidth");
        self->_lastUserInitiatedPrimaryWidth = v14;
      }
      else
      {
        -[UISplitViewControllerPanelImpl _setPrimaryHidingState:](self, "_setPrimaryHidingState:", 1);
      }
      objc_msgSend(v13, "setUserInitiated:", 0);
      -[UISplitViewControllerPanelImpl panelController](self, "panelController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setStateRequest:", v13);

    }
  }
  -[UISplitViewControllerPanelImpl _updateDisplayModeButtonItem](self, "_updateDisplayModeButtonItem");
  -[UISplitViewControllerPanelImpl _updatePresentationGestureRecognizer](self, "_updatePresentationGestureRecognizer");
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  -[UISplitViewControllerPanelImpl _currentPrimaryChildViewController](self, "_currentPrimaryChildViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    -[UISplitViewControllerPanelImpl _currentPrimaryChildViewController](self, "_currentPrimaryChildViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_splitViewControllerDidUpdate:withSize:", WeakRetained, width, height);

  }
  v21 = objc_msgSend(WeakRetained, "isCollapsed");
  if (self->_lastNotifiedIsCollapsed != v21)
  {
    self->_lastNotifiedIsCollapsed = v21;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v22, "postNotificationName:object:", CFSTR("UIViewControllerShowDetailTargetDidChangeNotification"), v23);

  }
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    v24 = -[UISplitViewControllerPanelImpl displayMode](self, "displayMode");
    v25 = -[UISplitViewControllerPanelImpl _effectiveTargetDisplayModeForDisplayMode:](self, "_effectiveTargetDisplayModeForDisplayMode:", v24);
    v26 = !v25 || v25 == v24;
    v27 = !v26;
    if (self->_lastShouldAllowChange != v27)
    {
      -[UISplitViewControllerPanelImpl panelController](self, "panelController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setNeedsUpdate");

    }
  }
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isAnimating");

  if ((v30 & 1) == 0)
  {
    v31 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v31, "setNeedsStatusBarAppearanceUpdate");

    v32 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v32, "setNeedsUpdateOfScreenEdgesDeferringSystemGestures");

  }
}

- (void)_unspecifiedStyleUpdateDisplayModeButtonItem
{
  int64_t v4;
  id WeakRetained;
  int64_t v6;
  int64_t v7;
  char v8;
  __CFString *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __CFString *v23;
  __CFString *v24;
  id v25;
  unint64_t v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  __CFString *v31;
  char v32;
  char v33;
  __CFString *v34;
  id v35;
  __int16 v36;

  v4 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v4)
  {
    v26 = v4;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 8390, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v28);

  }
  if (self->_unspecifiedStyleDisplayModeButtonItem)
  {
    v36 = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    v6 = -[UISplitViewControllerPanelImpl _effectiveTargetDisplayMode](self, "_effectiveTargetDisplayMode");
    v7 = v6;
    if ((unint64_t)(v6 - 2) < 2)
      goto LABEL_9;
    if (v6 != 1)
    {
      if (v6)
      {
        v11 = 0;
        v8 = 0;
        v9 = 0;
        v10 = 0;
      }
      else
      {
        v8 = 0;
        v9 = 0;
        v10 = 0;
        v11 = 1;
        LOBYTE(v36) = 1;
      }
      goto LABEL_20;
    }
    if (objc_msgSend(WeakRetained, "displayMode") == 3)
    {
LABEL_9:
      -[UISplitViewControllerPanelImpl _currentPrimaryChildViewController](self, "_currentPrimaryChildViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) == 0
        || (-[UISplitViewControllerPanelImpl _currentPrimaryChildViewController](self, "_currentPrimaryChildViewController"), v14 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v14, "_splitViewControllerImageForDisplayModeButtonToShowPrimary:", WeakRetained), v10 = (void *)objc_claimAutoreleasedReturnValue(), v14, !v10))
      {
        objc_msgSend(WeakRetained, "_displayModeButtonItemTitle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          v9 = v15;
        }
        else
        {
          objc_msgSend(WeakRetained, "masterViewController");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "title");
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        v11 = 0;
        v10 = 0;
        v8 = 1;
        HIBYTE(v36) = 1;
        goto LABEL_20;
      }
    }
    else
    {
      -[UISplitViewControllerPanelImpl _fullScreenButtonImage](self, "_fullScreenButtonImage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        _UIImageWithName(CFSTR("UISplitViewControllerFullScreen.png"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "imageFlippedForRightToLeftLayoutDirection");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISplitViewControllerPanelImpl _setFullScreenButtonImage:](self, "_setFullScreenButtonImage:", v20);

      }
      -[UISplitViewControllerPanelImpl _fullScreenButtonImage](self, "_fullScreenButtonImage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = 0;
    v8 = 0;
    v9 = 0;
LABEL_20:
    if (!-[__CFString length](v9, "length") && !v10)
    {

      v9 = CFSTR(" ");
    }
    objc_msgSend(WeakRetained, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v34 = v9;
      v35 = v10;
      objc_msgSend(v21, "_splitViewController:willUpdateDisplayModeButtonItemForTargetMode:withHidden:image:title:showsBackButtonIndicator:", WeakRetained, v7, &v36, &v35, &v34, (char *)&v36 + 1);
      v22 = v35;

      v23 = v34;
      v8 = HIBYTE(v36);
      v11 = v36;
      v9 = v23;
      v10 = v22;
    }
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __78__UISplitViewControllerPanelImpl__unspecifiedStyleUpdateDisplayModeButtonItem__block_invoke;
    v29[3] = &unk_1E16B2950;
    v32 = v8;
    v29[4] = self;
    v30 = v10;
    v31 = v9;
    v33 = v11;
    v24 = v9;
    v25 = v10;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v29);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  int64_t v15;
  id v16;
  void *v17;
  double Width;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  BOOL v23;
  unint64_t v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  int64_t v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  unint64_t v35;
  NSObject *v36;
  NSObject *v37;
  id v38;
  void *v39;
  unint64_t v40;
  NSObject *v41;
  NSObject *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  void *v48;
  void *v49;
  id v50;
  double v51;
  double v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  double v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  double v60;
  __int16 v61;
  double v62;
  uint64_t v63;
  CGRect v64;

  v63 = *MEMORY[0x1E0C80C00];
  v50 = a3;
  if (-[UISplitViewControllerPanelImpl _shouldUseFluidSidebarGestures](self, "_shouldUseFluidSidebarGestures"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "layoutDirection");
    v7 = objc_msgSend(v50, "layoutDirection");

    if (v6 != v7)
      -[UISplitViewControllerPanelImpl _updatePresentationGestureRecognizer](self, "_updatePresentationGestureRecognizer");
  }
  if (-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    v8 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v8, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "_presentationSemanticContext");
    v11 = objc_msgSend(v50, "_presentationSemanticContext");

    if (v10 != v11)
    {
      v12 = objc_msgSend(v50, "_presentationSemanticContext");
      if (!self)
        goto LABEL_25;
      v14 = v12;
      v15 = -[UISplitViewControllerPanelImpl style](self, "style");
      if ((unint64_t)(v15 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v47 = v15;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        _UISplitViewControllerStyleDescription(v47);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", sel__updateDisplayModeIfNecessaryForChangeFromPresentationSemanticContext_, self, CFSTR("UISplitViewControllerPanelImpl.m"), 3407, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v49);

      }
      v16 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v16, "_existingView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bounds");
      Width = CGRectGetWidth(v64);

      v19 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v19, "traitCollection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "_presentationSemanticContext");

      if (Width <= 0.0)
        goto LABEL_25;
      v22 = objc_loadWeakRetained((id *)&self->_svc);
      if (!_UISplitViewControllerAutoHidesColumns(v22) || v21 == v14)
      {

      }
      else
      {
        v23 = -[UISplitViewControllerPanelImpl _isCollapsedOrCollapsing](self, "_isCollapsedOrCollapsing");

        if (!v23)
        {
          v51 = 0.0;
          v52 = 0.0;
          -[UISplitViewControllerPanelImpl getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:](self, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:", &v52, &v51, 2, 1, 0, 0, Width, 800.0);
          if (v51 == 0.0 || (v13 = v52, v52 == 0.0))
          {
            if (_UIGetUISplitViewControllerChamoisResizeLogging())
            {
              v24 = qword_1ECD7D530;
              if (!qword_1ECD7D530)
              {
                v24 = __UILogCategoryGetNode("ChamoisResize", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v24, (unint64_t *)&qword_1ECD7D530);
              }
              v25 = *(NSObject **)(v24 + 8);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                v26 = v25;
                v27 = objc_loadWeakRetained((id *)&self->_svc);
                *(_DWORD *)buf = 138412546;
                v54 = v27;
                v55 = 2048;
                v56 = Width;
                _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_ERROR, "%@: Updating display mode if necessary for change in presentationSemanticContext with width %g", buf, 0x16u);

              }
            }
            v28 = -[UISplitViewControllerPanelImpl displayMode](self, "displayMode");
            v29 = v28;
            if (v28 != 2 || v21 == 2)
            {
              if (v28 == 1
                && v21 == 2
                && !-[UISplitViewControllerPanelImpl _isSecondaryColumnCompactInTotalWidth:withPrimaryColumnWidth:supplementaryColumnWidth:](self, "_isSecondaryColumnCompactInTotalWidth:withPrimaryColumnWidth:supplementaryColumnWidth:", Width, v52, v51))
              {
                v30 = 2;
                goto LABEL_36;
              }
            }
            else if (-[UISplitViewControllerPanelImpl _isSecondaryColumnCompactInTotalWidth:withPrimaryColumnWidth:supplementaryColumnWidth:](self, "_isSecondaryColumnCompactInTotalWidth:withPrimaryColumnWidth:supplementaryColumnWidth:", Width, v52, v51))
            {
              v30 = 1;
LABEL_36:
              if (_UIGetUISplitViewControllerChamoisResizeLogging())
              {
                v40 = qword_1ECD7D538;
                if (!qword_1ECD7D538)
                {
                  v40 = __UILogCategoryGetNode("ChamoisResize", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                  atomic_store(v40, (unint64_t *)&qword_1ECD7D538);
                }
                v41 = *(NSObject **)(v40 + 8);
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                {
                  v42 = v41;
                  v43 = objc_loadWeakRetained((id *)&self->_svc);
                  _UISplitViewControllerDisplayModeDescription(v29);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  _UISplitViewControllerDisplayModeDescription(v30);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138413058;
                  v54 = v43;
                  v55 = 2112;
                  v56 = *(double *)&v44;
                  v57 = 2112;
                  v58 = (uint64_t)v45;
                  v59 = 2048;
                  v60 = Width;
                  _os_log_impl(&dword_185066000, v42, OS_LOG_TYPE_ERROR, "%@: Automatically changing displayMode from %@ to %@ for change in presentationSemanticContext with width %g", buf, 0x2Au);

                }
              }
              -[UISplitViewControllerPanelImpl setUserGeneratedDisplayMode:](self, "setUserGeneratedDisplayMode:", 0);
              -[UISplitViewControllerPanelImpl panelController](self, "panelController");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "setNeedsUpdate");

              goto LABEL_25;
            }
            if (_UIGetUISplitViewControllerChamoisResizeLogging())
            {
              v35 = qword_1ECD7D540;
              if (!qword_1ECD7D540)
              {
                v35 = __UILogCategoryGetNode("ChamoisResize", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v35, (unint64_t *)&qword_1ECD7D540);
              }
              v36 = *(NSObject **)(v35 + 8);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                v37 = v36;
                v38 = objc_loadWeakRetained((id *)&self->_svc);
                _UISplitViewControllerDisplayModeDescription(v29);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413314;
                v54 = v38;
                v55 = 2112;
                v56 = *(double *)&v39;
                v57 = 2048;
                v58 = v14;
                v59 = 2048;
                v60 = *(double *)&v21;
                v61 = 2048;
                v62 = Width;
                _os_log_impl(&dword_185066000, v37, OS_LOG_TYPE_ERROR, "%@: Unchanged displayMode, %@, despite change in presentationSemanticContext (from %ld to %ld) with width %g", buf, 0x34u);

              }
            }
          }
        }
      }
LABEL_25:
      -[UISplitViewControllerPanelImpl panelController](self, "panelController", v13);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setNeedsUpdate");

    }
  }
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v33, "traitCollection");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "traitCollectionDidChange:toNewTraits:", v50, v34);

}

- (void)_setFluidSidebarPresentationGestureRecognizer:(id)a3
{
  UIPanGestureRecognizer *v5;
  int64_t v6;
  UIPanGestureRecognizer *sidebarPanGestureRecognizer;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (UIPanGestureRecognizer *)a3;
  v6 = -[UISplitViewControllerPanelImpl style](self, "style");
  if ((unint64_t)(v6 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v6;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 7496, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v10);

  }
  if (!-[UISplitViewControllerPanelImpl _shouldUseFluidSidebarGestures](self, "_shouldUseFluidSidebarGestures"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 7497, CFSTR("Wrong accessor for fluid sidebar gesture"));

  }
  sidebarPanGestureRecognizer = self->_sidebarPanGestureRecognizer;
  self->_sidebarPanGestureRecognizer = v5;

}

- (UIPanGestureRecognizer)_presentationGestureRecognizer
{
  void *v5;

  if (-[UISplitViewControllerPanelImpl _shouldUseFluidSidebarGestures](self, "_shouldUseFluidSidebarGestures"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 7490, CFSTR("Wrong accessor for pre-iOS14 sidebar gesture"));

  }
  return self->_sidebarPanGestureRecognizer;
}

- (UIPanGestureRecognizer)_fluidSidebarPresentationGestureRecognizer
{
  int64_t v4;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = -[UISplitViewControllerPanelImpl style](self, "style");
  if ((unint64_t)(v4 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v4;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 7503, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v8);

  }
  if (!-[UISplitViewControllerPanelImpl _shouldUseFluidSidebarGestures](self, "_shouldUseFluidSidebarGestures"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 7504, CFSTR("Wrong accessor for fluid sidebar gesture"));

  }
  return self->_sidebarPanGestureRecognizer;
}

- (void)_updatePresentationGestureRecognizer
{
  int v3;
  void *v4;
  void *v5;
  UIPanGestureRecognizer *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id WeakRetained;

  if (-[UISplitViewControllerPanelImpl _shouldUseFluidSidebarGestures](self, "_shouldUseFluidSidebarGestures"))
  {
    -[UISplitViewControllerPanelImpl _fluidUpdatePresentationGestureRecognizers](self, "_fluidUpdatePresentationGestureRecognizers");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    v3 = objc_msgSend(WeakRetained, "presentsWithGesture");
    -[UISplitViewControllerPanelImpl _presentationGestureRecognizer](self, "_presentationGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {

      if (!v5)
      {
        v6 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", self, sel__presentationGestureRecognizerChanged_);
        -[UIPanGestureRecognizer setMinimumNumberOfTouches:](v6, "setMinimumNumberOfTouches:", 1);
        -[UIPanGestureRecognizer setMaximumNumberOfTouches:](v6, "setMaximumNumberOfTouches:", 2);
        -[UIGestureRecognizer setAllowedTouchTypes:](v6, "setAllowedTouchTypes:", &unk_1E1A93260);
        -[UIPanGestureRecognizer setDelegate:](v6, "setDelegate:", self);
        -[UIPanGestureRecognizer setAllowedScrollTypesMask:](v6, "setAllowedScrollTypesMask:", 2);
        -[UISplitViewControllerPanelImpl _setPresentationGestureRecognizer:](self, "_setPresentationGestureRecognizer:", v6);
        objc_msgSend(WeakRetained, "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addGestureRecognizer:", v6);

      }
      -[UISplitViewControllerPanelImpl panelController](self, "panelController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "currentState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[UISplitViewControllerPanelImpl style](self, "style"))
      {
        v10 = 1;
      }
      else
      {
        if (-[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading"))
          v13 = objc_msgSend(v9, "_leadingEntirelyOverlapsMain");
        else
          v13 = objc_msgSend(v9, "_trailingEntirelyOverlapsMain");
        v10 = v13;
      }
      -[UISplitViewControllerPanelImpl _presentationGestureRecognizer](self, "_presentationGestureRecognizer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setEnabled:", v10);

    }
    else
    {

      if (v5)
      {
        objc_msgSend(WeakRetained, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISplitViewControllerPanelImpl _presentationGestureRecognizer](self, "_presentationGestureRecognizer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeGestureRecognizer:", v12);

        -[UISplitViewControllerPanelImpl _setPresentationGestureRecognizer:](self, "_setPresentationGestureRecognizer:", 0);
      }
    }

  }
}

- (BOOL)_shouldUseFluidSidebarGestures
{
  return -[UISplitViewControllerPanelImpl style](self, "style") != 0;
}

- (int64_t)_effectiveTargetDisplayMode
{
  int64_t v4;
  void *v5;
  void *v6;
  int64_t v7;
  unint64_t v9;
  void *v10;
  void *v11;

  v4 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v4)
  {
    v9 = v4;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 8161, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v11);

  }
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UISplitViewControllerPanelImpl _displayModeForState:](self, "_displayModeForState:", v6);

  return -[UISplitViewControllerPanelImpl _effectiveTargetDisplayModeForDisplayMode:](self, "_effectiveTargetDisplayModeForDisplayMode:", v7);
}

- (int64_t)_effectiveTargetDisplayModeForDisplayMode:(int64_t)a3
{
  int64_t v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  unint64_t v16;
  BOOL v17;
  uint64_t v18;
  unint64_t v20;
  void *v21;
  void *v22;

  v6 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v6)
  {
    v20 = v6;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 8268, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v22);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "horizontalSizeClass");

  if (v9 != 1 && self->_unspecifiedStyleDisplayModeButtonItem)
  {
    objc_msgSend(WeakRetained, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UISplitViewControllerPanelImpl _pushOverrideOfReportedDisplayMode:](self, "_pushOverrideOfReportedDisplayMode:", a3);
      v11 = objc_msgSend(v10, "targetDisplayModeForActionInSplitViewController:", WeakRetained);
      -[UISplitViewControllerPanelImpl _popOverrideOfReportedDisplayMode](self, "_popOverrideOfReportedDisplayMode");
      if (v11)
        goto LABEL_36;
    }
    v12 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v12, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userInterfaceIdiom");

    v11 = objc_msgSend(WeakRetained, "preferredDisplayMode");
    if (a3 == 3)
    {
      v15 = 1;
    }
    else if (a3 == 1 && v14 == 1)
    {
      v15 = -[UISplitViewControllerPanelImpl _iPadShouldUseOverlayInCurrentEnvironment](self, "_iPadShouldUseOverlayInCurrentEnvironment");
    }
    else
    {
      v15 = 0;
      if (a3 == 1 && !v14)
        v15 = -[UISplitViewControllerPanelImpl _iPhoneShouldUseOverlayInCurrentEnvironment](self, "_iPhoneShouldUseOverlayInCurrentEnvironment");
    }
    v16 = a3 & 0xFFFFFFFFFFFFFFFELL;
    if (v11)
    {
      if (v16 == 2)
      {
        v11 = 1;
LABEL_36:

        goto LABEL_37;
      }
      if (v11 != 1)
        goto LABEL_36;
      v11 = v14 == 1 ? 3 : 2;
      if (v14)
        goto LABEL_36;
      v17 = !-[UISplitViewControllerPanelImpl _iPhoneShouldUseOverlayInCurrentEnvironment](self, "_iPhoneShouldUseOverlayInCurrentEnvironment");
      v18 = 2;
LABEL_28:
      if (v17)
        v11 = v18;
      else
        v11 = v18 + 1;
      goto LABEL_36;
    }
    if (v14 == 1)
    {
      if (!v15)
      {
        v11 = 2 * (v16 != 2);
        goto LABEL_36;
      }
    }
    else if (!v15)
    {
      v17 = v16 == 2;
      v18 = 1;
      goto LABEL_28;
    }
    if (v16 == 2)
      v11 = 1;
    else
      v11 = 3;
    goto LABEL_36;
  }
  v11 = 0;
LABEL_37:

  return v11;
}

- (void)_setPresentationGestureRecognizer:(id)a3
{
  UIPanGestureRecognizer *v5;
  UIPanGestureRecognizer *sidebarPanGestureRecognizer;
  void *v7;

  v5 = (UIPanGestureRecognizer *)a3;
  if (-[UISplitViewControllerPanelImpl _shouldUseFluidSidebarGestures](self, "_shouldUseFluidSidebarGestures"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 7484, CFSTR("Wrong accessor for pre-iOS14 sidebar gesture"));

  }
  sidebarPanGestureRecognizer = self->_sidebarPanGestureRecognizer;
  self->_sidebarPanGestureRecognizer = v5;

}

- (BOOL)allowsSecondaryOnlyShortcutButton
{
  int64_t v3;
  BOOL v4;
  void *v5;

  v3 = -[UISplitViewControllerPanelImpl style](self, "style");
  v4 = 0;
  if (-[UISplitViewControllerPanelImpl showsSecondaryOnlyButton](self, "showsSecondaryOnlyButton") && v3 == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (BOOL)showsSecondaryOnlyButton
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 2) & 1;
}

- (void)_displayModeBarButtonItemWasUsedForFirstTime:(id)a3
{
  id v3;

  -[UISplitViewControllerPanelImpl panelController](self, "panelController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdate");

}

- (void)_navigationController:(id)a3 navigationBar:(id)a4 topItemUpdatedContentLayout:(id)a5
{
  UINavigationBar *v7;
  UINavigationBar *v8;
  UINavigationBar *navBarForToggleButton;
  UINavigationBar *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = (UINavigationBar *)a4;
  -[UISplitViewControllerPanelImpl _navigationBarForSidebarButtonForDisplayMode:](self, "_navigationBarForSidebarButtonForDisplayMode:", -[UISplitViewControllerPanelImpl displayMode](self, "displayMode"));
  v8 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();
  navBarForToggleButton = v8;
  if (!v8)
    navBarForToggleButton = self->_navBarForToggleButton;
  v10 = navBarForToggleButton;

  if (v10 == v7 && (objc_msgSend(v14, "isNavigationBarHidden") & 1) == 0)
  {
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "collapsedState");

    if (v12 <= 1)
    {
      objc_msgSend(v14, "transitionCoordinator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISplitViewControllerPanelImpl _updateDisplayModeButtonItemAndResetForCanceledAnimationWithTransitionCoordinator:](self, "_updateDisplayModeButtonItemAndResetForCanceledAnimationWithTransitionCoordinator:", v13);

    }
  }

}

- (void)_updateDisplayModeButtonItemAndResetForCanceledAnimationWithTransitionCoordinator:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  -[UISplitViewControllerPanelImpl _updateDisplayModeButtonItem](self, "_updateDisplayModeButtonItem");
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __116__UISplitViewControllerPanelImpl__updateDisplayModeButtonItemAndResetForCanceledAnimationWithTransitionCoordinator___block_invoke;
  v5[3] = &unk_1E16C1BE0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "animateAlongsideTransition:completion:", 0, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (id)_navigationBarForSidebarButtonForDisplayMode:(int64_t)a3
{
  unint64_t v6;
  UINavigationBar *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  UINavigationBar *navBarForToggleButton;
  void *v18;
  void *v19;

  v6 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v6 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 6953, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v19);

  }
  switch(a3)
  {
    case 1:
      -[UISplitViewControllerPanelImpl _navigationBarForSidebarButtonForColumn:](self, "_navigationBarForSidebarButtonForColumn:", 2);
      v7 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 2:
      if (v6 == 2)
        v9 = &unk_1E1A974B8;
      else
        v9 = &unk_1E1A97488;
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "navigationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "navigationBar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 3:
      v12 = -[UISplitViewControllerPanelImpl _wantsSideBarImageForOneOverSecondary](self, "_wantsSideBarImageForOneOverSecondary");
      if (v6 == 2
        && (-[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488), (v13 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v11 = (void *)v13;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "navigationController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "navigationBar");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
LABEL_15:

      }
      else
      {
        if (v12)
          navBarForToggleButton = self->_navBarForToggleButton;
        else
          navBarForToggleButton = 0;
        v7 = navBarForToggleButton;
LABEL_20:
        v8 = v7;
      }
      return v8;
    case 4:
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "navigationController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "navigationBar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    default:
      v8 = 0;
      return v8;
  }
}

- (void)setConfiguration:(id)a3
{
  id v4;
  id v5;

  *(_QWORD *)&self->_flags |= 1uLL;
  v4 = a3;
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfiguration:", v4);

}

- (void)showDetailViewController:(id)a3 sender:(id)a4
{
  id v7;
  id v8;
  id v9;
  int64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSMutableDictionary *perColumnViewControllers;
  NSMutableDictionary **p_perColumnViewControllers;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  uint64_t *v47;
  id v48;
  void *v49;
  void *v50;
  _BOOL8 v51;
  BOOL v52;
  BOOL v53;
  int v54;
  id v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  _UISplitViewControllerColumnContents *v69;
  void *v70;
  void *v71;
  _UISplitViewControllerColumnContents *v72;
  BOOL v73;
  void *v74;
  id v75;
  id WeakRetained;
  _QWORD v77[4];
  id v78;
  id v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "detailViewController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = -[UISplitViewControllerPanelImpl style](self, "style");
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isCollapsed");

    objc_msgSend(v9, "_existingView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14 || v9 == v7)
    {
      if (v10)
        v15 = v12;
      else
        v15 = 0;
      if (v15 == 1
        && (-[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974A0), v16 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v16, "viewController"), v17 = (void *)objc_claimAutoreleasedReturnValue(), v16, v17))
      {
        v18 = v17;

        v9 = v18;
      }
      else
      {
        objc_msgSend(WeakRetained, "masterViewController");
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }

      v9 = v18;
    }
    v19 = v7;
    if (v9 == v7)
      goto LABEL_81;
    v75 = v8;
    objc_msgSend(WeakRetained, "delegate");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v20 = -[UISplitViewControllerPanelImpl style](self, "style");
      if (v20)
      {
        v21 = v20;
        v22 = showDetailViewController_sender____s_category;
        if (!showDetailViewController_sender____s_category)
        {
          v22 = __UILogCategoryGetNode("UISplitViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v22, (unint64_t *)&showDetailViewController_sender____s_category);
        }
        v23 = *(NSObject **)(v22 + 8);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = v23;
          NSStringFromSelector(sel_splitViewController_showDetailViewController_sender_);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          _UISplitViewControllerStyleDescription(v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v84 = v25;
          v85 = 2114;
          v86 = v26;
          _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", buf, 0x16u);

        }
      }
      else if ((objc_msgSend(v74, "splitViewController:showDetailViewController:sender:", WeakRetained, v7, v8) & 1) != 0)
      {
        goto LABEL_80;
      }
    }
    if (v10)
    {
      v8 = v75;
      if ((v12 & 1) == 0)
      {
        if (-[UISplitViewControllerPanelImpl _columnForViewController:](self, "_columnForViewController:", v7) == 2)
          -[UISplitViewControllerPanelImpl updatePanelControllerForViewControllerChangeInColumn:](self, "updatePanelControllerForViewControllerChangeInColumn:", 2);
        else
          -[UISplitViewControllerPanelImpl setViewController:forColumn:](self, "setViewController:forColumn:", v7, 2);
        -[UISplitViewControllerPanelImpl _revealSecondaryColumnIfNecessary](self, "_revealSecondaryColumnIfNecessary");
        goto LABEL_80;
      }
      v27 = -[UISplitViewControllerPanelImpl _columnForViewController:](self, "_columnForViewController:", v9);
      if (-[UISplitViewControllerPanelImpl style](self, "style") == 2)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28 == 0;

      }
      else
      {
        v29 = 0;
      }
      v73 = v27 == v29;
      if (v27 != v29 && (v27 & 0xFFFFFFFFFFFFFFFELL) != 2)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        _UISplitViewControllerColumnDescription(v27);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 1503, CFSTR("Unexpected target column, %@, for pushing new detail vc, %@, onto UISplitViewController, %@"), v31, v7, WeakRetained);

      }
      if (v27)
      {
        if (v27 != 2)
          goto LABEL_40;
        p_perColumnViewControllers = &self->_perColumnViewControllers;
        perColumnViewControllers = self->_perColumnViewControllers;
        v34 = &unk_1E1A97470;
      }
      else
      {
        p_perColumnViewControllers = &self->_perColumnViewControllers;
        perColumnViewControllers = self->_perColumnViewControllers;
        v34 = &unk_1E1A97488;
      }
      -[NSMutableDictionary objectForKeyedSubscript:](perColumnViewControllers, "objectForKeyedSubscript:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "navigationControllerWrapper");
      v36 = (id)objc_claimAutoreleasedReturnValue();

      if (v9 == v36)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](*p_perColumnViewControllers, "objectForKeyedSubscript:", v34);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "navigationController");
        v38 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v38;
      }
      v8 = v75;
LABEL_40:
      if (objc_msgSend(v9, "_isNavigationController"))
        v39 = v9;
      else
        v39 = 0;
      v40 = v39;
      if (!v40)
      {
        if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
        {
          v48 = objc_loadWeakRetained((id *)&self->_svc);
          objc_msgSend(v48, "view");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "window");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v7, v50 != 0, 0);

        }
        else
        {
          objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v7, 0, 0);
        }
LABEL_79:

        goto LABEL_80;
      }
      if (objc_msgSend(v7, "_isNavigationController"))
        objc_msgSend(v40, "_setAllowNestedNavigationControllers:", 1);
      if (v27 || v10 != 2)
      {
        v51 = v27 == 1;
        v52 = v27 == 2;
        if (v27 >= 2)
        {
          v53 = v73;
          if (v52)
          {
            v54 = 1;
            goto LABEL_65;
          }
LABEL_64:
          -[UISplitViewControllerPanelImpl sendWillShowColumn:](self, "sendWillShowColumn:", 2);
          v54 = 0;
LABEL_65:
          v57 = v7;
          v58 = v57;
          if (v53)
          {
            -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97470);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "navigationController");
            v60 = v54;
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "_existingView");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "window");
            v63 = (void *)objc_claimAutoreleasedReturnValue();

            v8 = v75;
            v54 = v60;

            v58 = v57;
            if (!v63)
            {
              -[UISplitViewControllerPanelImpl setViewController:forColumn:](self, "setViewController:forColumn:", v57, 2);
              -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97470);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "navigationControllerWrapper");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = v65;
              if (v65)
              {
                v58 = v65;
                v67 = v57;
              }
              else
              {
                -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97470);
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "navigationController");
                v58 = (id)objc_claimAutoreleasedReturnValue();

              }
              if (objc_msgSend(v58, "_isNavigationController"))
                objc_msgSend(v40, "_setAllowNestedNavigationControllers:", 1);
              v8 = v75;
              if (!v58)
                v58 = v57;
            }
          }
          objc_msgSend(v40, "topViewController");
          v68 = (id)objc_claimAutoreleasedReturnValue();

          if (v68 != v58)
          {
            v77[0] = MEMORY[0x1E0C809B0];
            v77[1] = 3221225472;
            v77[2] = __66__UISplitViewControllerPanelImpl_showDetailViewController_sender___block_invoke_3;
            v77[3] = &unk_1E16B47A8;
            v78 = v9;
            v79 = v58;
            v80 = v8;
            objc_msgSend(v40, "_executeSplitViewControllerActions:", v77);

          }
          if (v54)
          {
            v69 = [_UISplitViewControllerColumnContents alloc];
            -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97470);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "navigationControllerWrapper");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = -[_UISplitViewControllerColumnContents initWithViewController:navigationController:navigationControllerWrapper:](v69, "initWithViewController:navigationController:navigationControllerWrapper:", v57, v40, v71);

            v8 = v75;
            -[NSMutableDictionary setObject:forKey:](self->_perColumnViewControllers, "setObject:forKey:", v72, &unk_1E1A97470);

          }
          goto LABEL_79;
        }
        v53 = v73;
      }
      else
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "navigationController");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v40, "topViewController");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (v43 == v42)
        {
          v51 = 1;
          v53 = v73;
        }
        else
        {
          objc_msgSend(v40, "viewControllers");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "containsObject:", v42);

          if (v45)
          {
            v82 = MEMORY[0x1E0C809B0];
            v46 = __66__UISplitViewControllerPanelImpl_showDetailViewController_sender___block_invoke;
            v47 = &v82;
          }
          else
          {
            v81 = MEMORY[0x1E0C809B0];
            v46 = __66__UISplitViewControllerPanelImpl_showDetailViewController_sender___block_invoke_2;
            v47 = &v81;
          }
          v53 = v73;
          v47[1] = 3221225472;
          v47[2] = (uint64_t)v46;
          v47[3] = (uint64_t)&unk_1E16B1B50;
          v55 = v40;
          v47[4] = (uint64_t)v55;
          v47[5] = (uint64_t)v42;
          v56 = v42;
          objc_msgSend(v55, "_executeSplitViewControllerActions:", v47);

          v51 = 0;
        }

      }
      -[UISplitViewControllerPanelImpl sendWillHideColumn:](self, "sendWillHideColumn:", v51);
      goto LABEL_64;
    }
    v8 = v75;
    -[UISplitViewControllerPanelImpl _unspecifiedShowDetailViewController:onTargetVC:sender:](self, "_unspecifiedShowDetailViewController:onTargetVC:sender:", v7, v9, v75);
LABEL_80:

    v19 = v9;
LABEL_81:

  }
}

- (void)sendWillHideColumn:(int64_t)a3
{
  $692BA5F601ABB544448C4E0A48A865F8 flags;
  $692BA5F601ABB544448C4E0A48A865F8 v6;
  void *v7;
  void *v8;
  id WeakRetained;

  flags = self->_flags;
  if ((*(_QWORD *)&flags & 0x600000000) == 0x200000000)
  {
    self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(unint64_t *)&flags | 0x8000000);
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    v6 = self->_flags;
    -[UISplitViewControllerPanelImpl _columnStyleDelegate](self, "_columnStyleDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((*(_QWORD *)&v6 & 0x800000000) != 0)
      objc_msgSend(v7, "_splitViewController:willHideColumn:", WeakRetained, a3);
    else
      objc_msgSend(v7, "splitViewController:willHideColumn:", WeakRetained, a3);

    *(_QWORD *)&self->_flags &= ~0x8000000uLL;
  }
}

- (void)setGutterWidth:(float)a3
{
  void *v5;
  double v6;
  void *v7;
  id v8;

  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = a3;
  objc_msgSend(v8, "setLeadingBorderWidthInPoints:", v6);
  objc_msgSend(v8, "setTrailingBorderWidthInPoints:", v6);
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConfiguration:", v8);

}

- (void)_initWithCoder:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  id WeakRetained;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  if (objc_msgSend(v25, "containsValueForKey:", CFSTR("UISplitViewControllerPreferredDisplayMode")))
    self->_preferredDisplayMode = objc_msgSend(v25, "decodeIntegerForKey:", CFSTR("UISplitViewControllerPreferredDisplayMode"));
  if (objc_msgSend(v25, "containsValueForKey:", CFSTR("UISplitViewControllerPreferredSplitBehavior")))
    self->_preferredSplitBehavior = objc_msgSend(v25, "decodeIntegerForKey:", CFSTR("UISplitViewControllerPreferredSplitBehavior"));
  if (objc_msgSend(v25, "containsValueForKey:", CFSTR("UISplitViewControllerPreferredPrimaryColumnWidthFraction")))
  {
    objc_msgSend(v25, "decodeDoubleForKey:", CFSTR("UISplitViewControllerPreferredPrimaryColumnWidthFraction"));
    self->_preferredPrimaryColumnWidthFraction = v4;
  }
  if (objc_msgSend(v25, "containsValueForKey:", CFSTR("UISplitViewControllerPreferredPrimaryColumnWidth")))
  {
    objc_msgSend(v25, "decodeDoubleForKey:", CFSTR("UISplitViewControllerPreferredPrimaryColumnWidth"));
    self->_preferredPrimaryColumnWidth = v5;
  }
  if (objc_msgSend(v25, "containsValueForKey:", CFSTR("UISplitViewControllerMaximumPrimaryColumnWidth")))
  {
    objc_msgSend(v25, "decodeDoubleForKey:", CFSTR("UISplitViewControllerMaximumPrimaryColumnWidth"));
    self->_maximumPrimaryColumnWidth = v6;
  }
  if (objc_msgSend(v25, "containsValueForKey:", CFSTR("UISplitViewControllerMinimumPrimaryColumnWidth")))
  {
    objc_msgSend(v25, "decodeDoubleForKey:", CFSTR("UISplitViewControllerMinimumPrimaryColumnWidth"));
    self->_minimumPrimaryColumnWidth = v7;
  }
  if (objc_msgSend(v25, "containsValueForKey:", CFSTR("UISplitViewControllerPreferredSupplementaryColumnWidthFraction")))
  {
    objc_msgSend(v25, "decodeDoubleForKey:", CFSTR("UISplitViewControllerPreferredSupplementaryColumnWidthFraction"));
    self->_preferredSupplementaryColumnWidthFraction = v8;
  }
  if (objc_msgSend(v25, "containsValueForKey:", CFSTR("UISplitViewControllerPreferredSupplementaryColumnWidth")))
  {
    objc_msgSend(v25, "decodeDoubleForKey:", CFSTR("UISplitViewControllerPreferredSupplementaryColumnWidth"));
    self->_preferredSupplementaryColumnWidth = v9;
  }
  if (objc_msgSend(v25, "containsValueForKey:", CFSTR("UISplitViewControllerMaximumSupplementaryColumnWidth")))
  {
    objc_msgSend(v25, "decodeDoubleForKey:", CFSTR("UISplitViewControllerMaximumSupplementaryColumnWidth"));
    self->_maximumSupplementaryColumnWidth = v10;
  }
  if (objc_msgSend(v25, "containsValueForKey:", CFSTR("UISplitViewControllerMinimumSupplementaryColumnWidth")))
  {
    objc_msgSend(v25, "decodeDoubleForKey:", CFSTR("UISplitViewControllerMinimumSupplementaryColumnWidth"));
    self->_minimumSupplementaryColumnWidth = v11;
  }
  if (objc_msgSend(v25, "containsValueForKey:", CFSTR("UISplitViewControllerPrimaryEdge")))
    self->_primaryEdge = objc_msgSend(v25, "decodeIntegerForKey:", CFSTR("UISplitViewControllerPrimaryEdge"));
  if (objc_msgSend(v25, "containsValueForKey:", CFSTR("UISplitViewControllerPresentsWithGesture")))
    self->_presentsWithGesture = objc_msgSend(v25, "decodeBoolForKey:", CFSTR("UISplitViewControllerPresentsWithGesture"));
  if (objc_msgSend(v25, "containsValueForKey:", CFSTR("UISplitViewControllerShowsSecondaryOnlyButton")))
  {
    v12 = objc_msgSend(v25, "decodeBoolForKey:", CFSTR("UISplitViewControllerShowsSecondaryOnlyButton"));
    v13 = 0x4000000;
    if (!v12)
      v13 = 0;
    self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFBFFFFFFLL | v13);
  }
  if (objc_msgSend(v25, "containsValueForKey:", CFSTR("UISplitViewControllerUsesDeviceOverlayPreferences")))
  {
    v14 = objc_msgSend(v25, "decodeBoolForKey:", CFSTR("UISplitViewControllerUsesDeviceOverlayPreferences"));
    v15 = 0x2000;
    if (!v14)
      v15 = 0;
    self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v15);
  }
  if (objc_msgSend(v25, "containsValueForKey:", CFSTR("UISplitViewControllerUsesExtraWidePrimaryColumn")))
  {
    v16 = objc_msgSend(v25, "decodeBoolForKey:", CFSTR("UISplitViewControllerUsesExtraWidePrimaryColumn"));
    v17 = 4096;
    if (!v16)
      v17 = 0;
    self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v17);
  }
  if (objc_msgSend(v25, "containsValueForKey:", CFSTR("UISplitViewControllerPrimaryBackgroundStyle")))
    -[UISplitViewControllerPanelImpl setPrimaryBackgroundStyle:](self, "setPrimaryBackgroundStyle:", objc_msgSend(v25, "decodeIntegerForKey:", CFSTR("UISplitViewControllerPrimaryBackgroundStyle")));
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "childViewControllers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  if (objc_msgSend(v25, "containsValueForKey:", CFSTR("UISplitViewControllerStyle")))
  {
    v21 = objc_msgSend(v25, "decodeIntegerForKey:", CFSTR("UISplitViewControllerStyle"));
    if ((dyld_program_sdk_at_least() & 1) == 0 && v21 == 1)
    {
      v22 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v22, "childViewControllers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v23, "count") != 1;

    }
    -[UIPanelController setStyle:](self->_panelController, "setStyle:", v21);
  }
  -[UISplitViewControllerPanelImpl setViewControllers:](self, "setViewControllers:", v20);
  if (objc_msgSend(v25, "containsValueForKey:", CFSTR("UISplitViewControllerCompactColumnVC")))
  {
    objc_msgSend(v25, "decodeObjectForKey:", CFSTR("UISplitViewControllerCompactColumnVC"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISplitViewControllerPanelImpl setViewController:forColumn:](self, "setViewController:forColumn:", v24, 3);

  }
}

- (void)setPrimaryEdge:(int64_t)a3
{
  _BOOL4 v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;

  if (self->_primaryEdge != a3)
  {
    -[UISplitViewControllerPanelImpl _currentPrimaryChildViewController](self, "_currentPrimaryChildViewController");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    self->_primaryEdge = a3;
    v5 = -[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading");
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v7 = v12;
    else
      v7 = 0;
    if (v5)
      v8 = 0;
    else
      v8 = v12;
    objc_msgSend(v6, "setLeadingViewController:changingParentage:", v7, 0);

    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTrailingViewController:changingParentage:", v8, 0);

    -[UISplitViewControllerPanelImpl _updateConfigurationBackgroundStyle](self, "_updateConfigurationBackgroundStyle");
    if (-[UISplitViewControllerPanelImpl _shouldUseFluidSidebarGestures](self, "_shouldUseFluidSidebarGestures"))
      -[UISplitViewControllerPanelImpl _updatePresentationGestureRecognizer](self, "_updatePresentationGestureRecognizer");
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNeedsLayout");

  }
}

- (void)setPrimaryBackgroundStyle:(int64_t)a3
{
  id WeakRetained;

  if (self->_primaryBackgroundStyle != a3)
  {
    self->_primaryBackgroundStyle = a3;
    -[UISplitViewControllerPanelImpl _updateConfigurationBackgroundStyle](self, "_updateConfigurationBackgroundStyle");
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "_updateTraitsIfNecessary");

  }
}

- (void)_updateConfigurationBackgroundStyle
{
  int64_t primaryBackgroundStyle;
  _BOOL4 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  id v11;

  primaryBackgroundStyle = self->_primaryBackgroundStyle;
  if (primaryBackgroundStyle == 999 || primaryBackgroundStyle == 1)
  {
    v5 = -[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading");
    v6 = !v5;
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configuration");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "_setLeadingBackgroundStyle:", v7);
  objc_msgSend(v11, "_setTrailingBackgroundStyle:", v6);
  v9 = (*((_BYTE *)&self->_flags + 5) & 4) != 0 && -[UISplitViewControllerPanelImpl style](self, "style") == 2;
  objc_msgSend(v11, "_setSupplementaryAdoptsPrimaryBackgroundStyle:", v9);
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConfiguration:", v11);

}

- (BOOL)panelController:(id)a3 collapseOntoPrimaryViewController:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  NSObject *v21;
  id v22;
  void *v23;
  char v24;
  uint64_t *v26;
  _QWORD aBlock[4];
  id v28;
  UISplitViewControllerPanelImpl *v29;
  id v30;
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  _QWORD v42[3];

  v42[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if (-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    -[UISplitViewControllerPanelImpl preparePanelControllerForCollapse](self, "preparePanelControllerForCollapse");
    v9 = 0;
  }
  else
  {
    objc_msgSend(v7, "_splitViewControllerWillCollapseOntoPrimaryViewController:", WeakRetained);
    -[UIPanelController mainViewController](self->_panelController, "mainViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_loadWeakRetained((id *)&self->_svc);
    v42[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setViewControllers:", v11);

  }
  if (!UIApp)
  {
    v24 = 1;
    goto LABEL_17;
  }
  objc_msgSend(WeakRetained, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__UISplitViewControllerPanelImpl_panelController_collapseOntoPrimaryViewController___block_invoke;
  aBlock[3] = &unk_1E16C1AF0;
  v13 = v12;
  v28 = v13;
  v29 = self;
  v33 = &v34;
  v14 = WeakRetained;
  v30 = v14;
  v15 = v9;
  v31 = v15;
  v16 = v7;
  v32 = v16;
  v17 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (-[UISplitViewControllerPanelImpl style](self, "style") || (unint64_t)(self->_suspendedState - 3) > 1)
  {
    v17[2](v17);
    v24 = *((_BYTE *)v35 + 24) != 0;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v18 = -[UISplitViewControllerPanelImpl style](self, "style");
      if (v18)
      {
        v19 = v18;
        v20 = panelController_collapseOntoPrimaryViewController____s_category;
        if (!panelController_collapseOntoPrimaryViewController____s_category)
        {
          v20 = __UILogCategoryGetNode("UISplitViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v20, (unint64_t *)&panelController_collapseOntoPrimaryViewController____s_category);
        }
        v21 = *(id *)(v20 + 8);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__splitViewController_collapseSecondaryViewController_ontoPrimaryViewController_forRestorationOfCollapsedWhileSuspendedWithPrimaryVisible_);
          v22 = (id)objc_claimAutoreleasedReturnValue();
          _UISplitViewControllerStyleDescription(v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v39 = v22;
          v40 = 2114;
          v41 = v23;
          _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", buf, 0x16u);

        }
        v24 = 0;
      }
      else
      {
        v24 = objc_msgSend(v13, "_splitViewController:collapseSecondaryViewController:ontoPrimaryViewController:forRestorationOfCollapsedWhileSuspendedWithPrimaryVisible:", v14, v15, v16, self->_suspendedState == 3);
      }
      v26 = v35;
LABEL_22:
      *((_BYTE *)v26 + 24) = v24;
      goto LABEL_15;
    }
    v17[2](v17);
    v26 = v35;
    if (!*((_BYTE *)v35 + 24))
    {
      if (self->_suspendedState != 3)
      {
        v24 = 0;
        goto LABEL_15;
      }
      v24 = 1;
      goto LABEL_22;
    }
    v24 = 1;
  }
LABEL_15:

LABEL_17:
  _Block_object_dispose(&v34, 8);

  return v24;
}

- (void)setViewControllers:(id)a3
{
  id v4;
  int64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  UIViewController *v15;
  UISplitViewControllerPanelImpl *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  UIViewController *v21;
  UIViewController *v22;
  int v23;
  unint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (!v5)
  {
    -[UISplitViewControllerPanelImpl _unspecifiedStyleSetViewControllers:](self, "_unspecifiedStyleSetViewControllers:", v4);
    goto LABEL_32;
  }
  v6 = v5;
  v7 = objc_msgSend(v4, "count");
  v8 = v7;
  if (v7 > 3 || v7 == 1 || v6 != 1 && v7 == 2 || v6 != 2 && v7 == 3)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        goto LABEL_14;
      _UISplitViewControllerStyleDescription(v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 134218242;
      v24 = v8;
      v25 = 2112;
      v26 = v12;
      _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Assigning %ld viewControllers in -[UISplitViewController setViewControllers:] is not supported by %@ style. Extra view controllers are ignored. Dummy view controllers are inserted for missing ones.", (uint8_t *)&v23, 0x16u);
    }
    else
    {
      v9 = setViewControllers____s_category_0;
      if (!setViewControllers____s_category_0)
      {
        v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v9, (unint64_t *)&setViewControllers____s_category_0);
      }
      v10 = *(NSObject **)(v9 + 8);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      v11 = v10;
      _UISplitViewControllerStyleDescription(v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 134218242;
      v24 = v8;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Assigning %ld viewControllers in -[UISplitViewController setViewControllers:] is not supported by %@ style. Extra view controllers are ignored. Dummy view controllers are inserted for missing ones.", (uint8_t *)&v23, 0x16u);
    }

LABEL_14:
  }
LABEL_15:
  if (v6 == 1)
  {
    if (v8)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISplitViewControllerPanelImpl setViewController:forColumn:](self, "setViewController:forColumn:", v13, 0);

      if (v8 == 1)
        goto LABEL_30;
      v18 = v4;
      v19 = 1;
LABEL_29:
      objc_msgSend(v18, "objectAtIndexedSubscript:", v19);
      v21 = (UIViewController *)objc_claimAutoreleasedReturnValue();
LABEL_31:
      v22 = v21;
      -[UISplitViewControllerPanelImpl setViewController:forColumn:](self, "setViewController:forColumn:", v21, 2);

      goto LABEL_32;
    }
    v16 = self;
    v17 = 0;
  }
  else
  {
    if (v8)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISplitViewControllerPanelImpl setViewController:forColumn:](self, "setViewController:forColumn:", v14, 0);

      if (v8 == 1)
      {
        v15 = objc_alloc_init(UIViewController);
        -[UISplitViewControllerPanelImpl setViewController:forColumn:](self, "setViewController:forColumn:", v15, 1);

      }
      else
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISplitViewControllerPanelImpl setViewController:forColumn:](self, "setViewController:forColumn:", v20, 1);

        if (v8 >= 3)
        {
          v18 = v4;
          v19 = 2;
          goto LABEL_29;
        }
      }
LABEL_30:
      v21 = objc_alloc_init(UIViewController);
      goto LABEL_31;
    }
    -[UISplitViewControllerPanelImpl setViewController:forColumn:](self, "setViewController:forColumn:", 0, 0);
    v16 = self;
    v17 = 1;
  }
  -[UISplitViewControllerPanelImpl setViewController:forColumn:](v16, "setViewController:forColumn:", 0, v17);
  -[UISplitViewControllerPanelImpl setViewController:forColumn:](self, "setViewController:forColumn:", 0, 2);
LABEL_32:

}

uint64_t __84__UISplitViewControllerPanelImpl_panelController_collapseOntoPrimaryViewController___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    v3 = objc_msgSend(*(id *)(a1 + 40), "style");
    if (v3)
    {
      v4 = v3;
      v5 = kSplitViewControllerInterfaceOrientationKey_block_invoke___s_category;
      if (!kSplitViewControllerInterfaceOrientationKey_block_invoke___s_category)
      {
        v5 = __UILogCategoryGetNode("UISplitViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v5, (unint64_t *)&kSplitViewControllerInterfaceOrientationKey_block_invoke___s_category);
      }
      v6 = *(NSObject **)(v5 + 8);
      result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
      if ((_DWORD)result)
      {
        v7 = v6;
        NSStringFromSelector(sel_splitViewController_collapseSecondaryViewController_ontoPrimaryViewController_);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        _UISplitViewControllerStyleDescription(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543618;
        v11 = v8;
        v12 = 2114;
        v13 = v9;
        _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", (uint8_t *)&v10, 0x16u);

        result = 0;
      }
    }
    else
    {
      result = objc_msgSend(*(id *)(a1 + 32), "splitViewController:collapseSecondaryViewController:ontoPrimaryViewController:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = result;
  }
  return result;
}

- (void)preparePanelControllerForCollapse
{
  unint64_t v4;
  void *v5;
  UIPanelController *panelController;
  id v7;
  UIPanelController *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v4 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 2631, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v11);

  }
  -[UIPanelController collapsedViewController](self->_panelController, "collapsedViewController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      panelController = self->_panelController;
      -[UIPanelController supplementaryViewController](panelController, "supplementaryViewController");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[UIPanelController setSupplementaryViewController:changingParentage:](panelController, "setSupplementaryViewController:changingParentage:", 0, v12 != v7);

    }
  }
  v8 = self->_panelController;
  -[UIPanelController mainViewController](v8, "mainViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPanelController setMainViewController:changingParentage:](v8, "setMainViewController:changingParentage:", 0, v12 != v9);

}

- (void)_unspecifiedStyleSetViewControllers:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  if (objc_msgSend(v16, "count"))
  {
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if ((unint64_t)objc_msgSend(v16, "count") < 2)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = -[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading");
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v9 = v4;
  else
    v9 = 0;
  if (v6)
    v10 = 0;
  else
    v10 = v4;
  objc_msgSend(v7, "setLeadingViewController:", v9);

  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMainViewController:", v5);

  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTrailingViewController:", v10);

  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "mutableChildViewControllers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "indexOfObjectIdenticalTo:", v4);
    if (v15 && v15 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v14, "exchangeObjectAtIndex:withObjectAtIndex:", v15, 0);

  }
}

- (BOOL)panelController:(id)a3 collapsePrimaryViewController:(id)a4 withFallbackSecondaryViewController:(id)a5 onTopOfSupplementaryViewController:(id)a6 transitionCoordinator:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  int64_t v17;
  _QWORD v19[4];
  id v20;
  id v21;
  UISplitViewControllerPanelImpl *v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v17)
  {
    if (v15 && v13 != v15)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __173__UISplitViewControllerPanelImpl_panelController_collapsePrimaryViewController_withFallbackSecondaryViewController_onTopOfSupplementaryViewController_transitionCoordinator___block_invoke;
      v19[3] = &unk_1E16B47A8;
      v20 = v13;
      v21 = v15;
      v22 = self;
      objc_msgSend(v20, "_executeSplitViewControllerActions:", v19);

    }
    if (v14)
      -[UISplitViewControllerPanelImpl panelController:collapsePrimaryViewController:withFallbackSecondaryViewController:transitionCoordinator:](self, "panelController:collapsePrimaryViewController:withFallbackSecondaryViewController:transitionCoordinator:", v12, v13, v14, v16);
  }

  return v17 != 0;
}

- (void)panelController:(id)a3 collapsePrimaryViewController:(id)a4 withFallbackSecondaryViewController:(id)a5 transitionCoordinator:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  UISplitViewControllerPanelImpl *v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __138__UISplitViewControllerPanelImpl_panelController_collapsePrimaryViewController_withFallbackSecondaryViewController_transitionCoordinator___block_invoke;
  v15[3] = &unk_1E16B51E8;
  v16 = v9;
  v17 = v10;
  v18 = self;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v15);

}

- (void)loadView
{
  void *v3;
  id WeakRetained;
  id v5;

  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "setView:", v5);

  objc_msgSend(v5, "setImpl:", self);
  -[UISplitViewControllerPanelImpl _setUpFocusContainerGuides](self, "_setUpFocusContainerGuides");

}

uint64_t __78__UISplitViewControllerPanelImpl__unspecifiedStyleUpdateDisplayModeButtonItem__block_invoke(uint64_t a1)
{
  _BOOL8 v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "_setShowsBackButtonIndicator:", *(unsigned __int8 *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setImage:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setTitle:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setHidden:", *(unsigned __int8 *)(a1 + 57));
  if (*(_BYTE *)(a1 + 56))
    v2 = +[UIDragInteraction isEnabledByDefault](UIDragInteraction, "isEnabledByDefault");
  else
    v2 = 0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setSpringLoaded:", v2);
}

- (double)preferredPrimaryColumnWidth
{
  return self->_preferredPrimaryColumnWidth;
}

- (void)_primaryColumnWidthAffectingPropertyDidChange
{
  void *v4;

  if (-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    -[UISplitViewControllerPanelImpl _supplementaryOrPrimaryColumnWidthAffectingPropertyDidChange](self, "_supplementaryOrPrimaryColumnWidthAffectingPropertyDidChange");
  }
  else
  {
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 5626, CFSTR("Setting this property is not compatible with the new UISplitViewController SPI"));

    }
    -[UIPanelController setNeedsUpdate](self->_panelController, "setNeedsUpdate");
  }
}

- (void)setPreferredPrimaryColumnWidth:(double)a3
{
  if (self->_preferredPrimaryColumnWidth != a3)
  {
    self->_preferredPrimaryColumnWidth = a3;
    -[UISplitViewControllerPanelImpl _primaryColumnWidthAffectingPropertyDidChange](self, "_primaryColumnWidthAffectingPropertyDidChange");
  }
}

- (void)setMaximumSupplementaryColumnWidth:(double)a3
{
  if (self->_maximumSupplementaryColumnWidth != a3)
  {
    if (a3 < 0.0 && a3 != -3.40282347e38)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported %@, %g, for supplementary column. Value must be %@"), CFSTR("width fraction"), *(_QWORD *)&a3, CFSTR("UISplitViewControllerAutomaticDimension or nonnegative"));
    self->_maximumSupplementaryColumnWidth = a3;
    -[UISplitViewControllerPanelImpl _primaryColumnWidthAffectingPropertyDidChange](self, "_primaryColumnWidthAffectingPropertyDidChange");
  }
}

- (void)setMinimumSupplementaryColumnWidth:(double)a3
{
  if (self->_minimumSupplementaryColumnWidth != a3)
  {
    if (a3 < 0.0 && a3 != -3.40282347e38)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported %@, %g, for supplementary column. Value must be %@"), CFSTR("width fraction"), *(_QWORD *)&a3, CFSTR("UISplitViewControllerAutomaticDimension or nonnegative"));
    self->_minimumSupplementaryColumnWidth = a3;
    -[UISplitViewControllerPanelImpl _primaryColumnWidthAffectingPropertyDidChange](self, "_primaryColumnWidthAffectingPropertyDidChange");
  }
}

- (void)setPreferredSupplementaryColumnWidth:(double)a3
{
  if (self->_preferredSupplementaryColumnWidth != a3)
  {
    self->_preferredSupplementaryColumnWidth = a3;
    dyld_program_sdk_at_least();
    -[UISplitViewControllerPanelImpl _supplementaryOrPrimaryColumnWidthAffectingPropertyDidChange](self, "_supplementaryOrPrimaryColumnWidthAffectingPropertyDidChange");
  }
}

- (double)supplementaryColumnWidth
{
  double MatchingState;
  void *WeakRetained;
  void *v5;
  double v6;
  void *v7;
  double v8;
  int v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  MatchingState = 0.0;
  if (-[UISplitViewControllerPanelImpl style](self, "style") == 2)
  {
    if (-[UISplitViewControllerPanelImpl _shouldReturnBoundsWidthForColumnWidth](self, "_shouldReturnBoundsWidthForColumnWidth"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(WeakRetained, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bounds");
      MatchingState = v6;
    }
    else
    {
      -[UISplitViewControllerPanelImpl panelController](self, "panelController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentState");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "supplementaryWidth");
      if (v8 > 0.0)
      {
        MatchingState = v8;
LABEL_14:

        return MatchingState;
      }
      v9 = -[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading");
      -[UISplitViewControllerPanelImpl panelController](self, "panelController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (WeakRetained)
      {
        objc_msgSend(v10, "possibleStates");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          objc_msgSend(WeakRetained, "leadingWidth");
        else
          objc_msgSend(WeakRetained, "trailingWidth");
        v13 = fmax(v12, 0.0);
      }
      else
      {
        objc_msgSend(v10, "uncachedPossibleStates");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = minNonzeroPrimaryWidthInStates(v5, v9);
      }
      MatchingState = minNonzeroSupplementaryWidthInStateWithPrimaryWidthGetMatchingState(v5, v9, 0, v13);
    }

    goto LABEL_14;
  }
  return MatchingState;
}

- (double)primaryColumnWidth
{
  void *WeakRetained;
  void *v4;
  double v5;
  double v6;
  void *v7;
  int v8;
  double v9;
  void *v10;
  void *v11;

  if (-[UISplitViewControllerPanelImpl _shouldReturnBoundsWidthForColumnWidth](self, "_shouldReturnBoundsWidthForColumnWidth"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
LABEL_11:

    goto LABEL_12;
  }
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentState");
  WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading");
  if (v8)
    objc_msgSend(WeakRetained, "leadingWidth");
  else
    objc_msgSend(WeakRetained, "trailingWidth");
  v6 = v9;
  if (v9 <= 0.0)
  {
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (WeakRetained)
      objc_msgSend(v10, "possibleStates");
    else
      objc_msgSend(v10, "uncachedPossibleStates");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = minNonzeroPrimaryWidthInStates(v4, v8);
    goto LABEL_11;
  }
LABEL_12:

  return v6;
}

- (BOOL)_shouldReturnBoundsWidthForColumnWidth
{
  void *v3;
  void *v4;
  char v5;
  id WeakRetained;
  void *v7;

  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4 == 0;
  if (-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    if (v4)
    {
      v5 = objc_msgSend(v4, "isCollapsed");
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(WeakRetained, "traitCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "horizontalSizeClass") == 1;

    }
  }
  else if (v4 && (objc_msgSend(v4, "isCollapsed") & 1) != 0)
  {
    v5 = 1;
  }

  return v5;
}

- (void)setPrefersOverlayInRegularWidthPhone:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (void)setPreferredSplitBehavior:(int64_t)a3
{
  self->_preferredSplitBehavior = a3;
}

- (CGSize)_preferredContentSize
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  CGSize result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if (-[UISplitViewControllerPanelImpl style](self, "style")
    && (objc_msgSend(WeakRetained, "traitCollection"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "_presentationSemanticContext"),
        v5,
        v6 != 3))
  {
    v13 = -[UISplitViewControllerPanelImpl style](self, "style");
    if (v13 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      _UISplitViewControllerStyleDescription(v13);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 5335, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v23);

    }
    objc_msgSend(WeakRetained, "_screen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    +[UIViewController defaultFormSheetSizeForScreenSize:](UIViewController, "defaultFormSheetSizeForScreenSize:", v15, v16);
    v18 = v17;
    v10 = v19;

    if (v13 == 2)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 320.0;
      if (!v20)
        v21 = 240.0;
      v8 = v18 + v21;

    }
    else
    {
      v8 = v18 + 240.0;
    }
  }
  else
  {
    objc_msgSend(WeakRetained, "_super_preferredContentSize");
    v8 = v7;
    v10 = v9;
  }

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

void __173__UISplitViewControllerPanelImpl_panelController_collapsePrimaryViewController_withFallbackSecondaryViewController_onTopOfSupplementaryViewController_transitionCoordinator___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  id WeakRetained;

  v1 = (void *)a1[4];
  v2 = a1[5];
  WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 16));
  objc_msgSend(v1, "_collapseViewController:forSplitViewController:", v2, WeakRetained);

}

void __138__UISplitViewControllerPanelImpl_panelController_collapsePrimaryViewController_withFallbackSecondaryViewController_transitionCoordinator___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  v2 = (void *)a1[4];
  v3 = a1[5];
  WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 16));
  objc_msgSend(v2, "_collapseSecondaryViewController:forSplitViewController:withTransitionCoordinator:", v3, WeakRetained, a1[7]);

}

- (void)_setUsesExtraWidePrimaryColumn:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (void)setDisplayModeButtonVisibility:(int64_t)a3
{
  _BOOL4 v5;
  unint64_t v6;

  if (-[UISplitViewControllerPanelImpl displayModeButtonVisibility](self, "displayModeButtonVisibility") != a3)
  {
    v5 = -[UISplitViewControllerPanelImpl _isDisplayModeBarButtonVisible](self, "_isDisplayModeBarButtonVisible");
    if (a3 == 2)
    {
      v6 = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFCFFFFFLL | 0x100000;
    }
    else if (a3 == 1)
    {
      v6 = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFCFFFFFLL | 0x200000;
    }
    else
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unknown displayModeButtonVisibility value: %ld"), a3);
LABEL_10:
        if (v5 == -[UISplitViewControllerPanelImpl _alwaysHideSidebarToggleButton](self, "_alwaysHideSidebarToggleButton"))
        {
          -[UISplitViewControllerPanelImpl _updateDisplayModeButtonItem](self, "_updateDisplayModeButtonItem");
          -[UISplitViewControllerPanelImpl _invalidateAllowsTriggeringSidebarKeyCommandAction](self, "_invalidateAllowsTriggeringSidebarKeyCommandAction");
        }
        return;
      }
      v6 = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFCFFFFFLL;
    }
    self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)v6;
    goto LABEL_10;
  }
}

- (int64_t)displayModeButtonVisibility
{
  $692BA5F601ABB544448C4E0A48A865F8 flags;

  flags = self->_flags;
  if ((*(_QWORD *)&flags & 0x200000) != 0)
    return 1;
  else
    return (*(unint64_t *)&flags >> 19) & 2;
}

- (void)_setForceDisplayModeBarButtonHidden:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  uint64_t v6;
  int v7;
  int v8;

  v3 = a3;
  v5 = -[UISplitViewControllerPanelImpl _isDisplayModeBarButtonVisible](self, "_isDisplayModeBarButtonVisible");
  v6 = 0x200000;
  if (!v3)
    v6 = 0;
  self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFDFFFFFLL | v6);
  if (v3)
  {
    v7 = 0;
    v8 = 1;
  }
  else
  {
    v8 = !-[UISplitViewControllerPanelImpl _alwaysHideSidebarToggleButton](self, "_alwaysHideSidebarToggleButton");
    v7 = (*((_BYTE *)&self->_flags + 2) & 0x20) == 0;
  }
  if (v5 != v7)
  {
    if (v8)
    {
      -[UISplitViewControllerPanelImpl _updateDisplayModeButtonItem](self, "_updateDisplayModeButtonItem");
      -[UISplitViewControllerPanelImpl _invalidateAllowsTriggeringSidebarKeyCommandAction](self, "_invalidateAllowsTriggeringSidebarKeyCommandAction");
    }
  }
}

- (BOOL)_isDisplayModeBarButtonVisible
{
  void *v3;
  double v5;
  double v6;

  if (-[UISplitViewControllerPanelImpl _alwaysHideSidebarToggleButton](self, "_alwaysHideSidebarToggleButton"))
    return 0;
  -[UIView window](self->_navBarForToggleButton, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 || -[UIView isHidden](self->_navBarForToggleButton, "isHidden"))
  {

    return 0;
  }
  -[UIView alpha](self->_navBarForToggleButton, "alpha");
  v6 = v5;

  if (v6 <= 0.1)
    return 0;
  return !-[UIBarButtonItem isHidden](self->_sidebarToggleButtonItem, "isHidden");
}

- (int64_t)preferredSplitBehavior
{
  return self->_preferredSplitBehavior;
}

- (void)setShowsSecondaryOnlyButton:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (id)displayModeButtonItem
{
  UISplitViewControllerDisplayModeBarButtonItem *v3;
  UISplitViewControllerDisplayModeBarButtonItem *v4;
  UISplitViewControllerDisplayModeBarButtonItem *unspecifiedStyleDisplayModeButtonItem;
  UISplitViewControllerDisplayModeBarButtonItem *v6;
  UIBarButtonItem *v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  UIBarButtonItem *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    v3 = self->_unspecifiedStyleDisplayModeButtonItem;
    if (!self->_unspecifiedStyleDisplayModeButtonItem)
    {
      v4 = -[UIBarButtonItem initWithImage:landscapeImagePhone:style:target:action:]([UISplitViewControllerDisplayModeBarButtonItem alloc], "initWithImage:landscapeImagePhone:style:target:action:", 0, 0, 0, self, sel__triggerDisplayModeAction_);
      unspecifiedStyleDisplayModeButtonItem = self->_unspecifiedStyleDisplayModeButtonItem;
      self->_unspecifiedStyleDisplayModeButtonItem = v4;

      -[UISplitViewControllerDisplayModeBarButtonItem _setImpl:](self->_unspecifiedStyleDisplayModeButtonItem, "_setImpl:", self);
      v6 = self->_unspecifiedStyleDisplayModeButtonItem;

      v3 = v6;
    }
    if (v3)
      goto LABEL_5;
LABEL_14:
    v7 = objc_alloc_init(UIBarButtonItem);
    goto LABEL_15;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      goto LABEL_12;
    _UISplitViewControllerStyleDescription(-[UISplitViewControllerPanelImpl style](self, "style"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v11;
    _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "displayModeButtonItem is internally managed and not exposed for %@ style. Returning an empty, disconnected UIBarButtonItem to fulfill the non-null contract.", (uint8_t *)&v14, 0xCu);
LABEL_11:

LABEL_12:
    goto LABEL_13;
  }
  v8 = displayModeButtonItem___s_category;
  if (!displayModeButtonItem___s_category)
  {
    v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&displayModeButtonItem___s_category);
  }
  v9 = *(NSObject **)(v8 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = v9;
    _UISplitViewControllerStyleDescription(-[UISplitViewControllerPanelImpl style](self, "style"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v11;
    _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "displayModeButtonItem is internally managed and not exposed for %@ style. Returning an empty, disconnected UIBarButtonItem to fulfill the non-null contract.", (uint8_t *)&v14, 0xCu);
    goto LABEL_11;
  }
LABEL_13:
  v3 = self->_unspecifiedStyleDisplayModeButtonItem;
  if (!v3)
    goto LABEL_14;
LABEL_5:
  v7 = v3;
LABEL_15:
  v12 = v7;

  return v12;
}

- (void)_setDisplayModeButtonItemTitle:(id)a3
{
  NSString *v4;
  NSString *displayModeButtonItemTitle;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;

  v4 = (NSString *)a3;
  displayModeButtonItemTitle = self->_displayModeButtonItemTitle;
  if (displayModeButtonItemTitle != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](displayModeButtonItemTitle, "isEqualToString:", v4);
    v4 = v9;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      v8 = self->_displayModeButtonItemTitle;
      self->_displayModeButtonItemTitle = v7;

      -[UISplitViewControllerPanelImpl _updateDisplayModeButtonItem](self, "_updateDisplayModeButtonItem");
      v4 = v9;
    }
  }

}

- (void)showColumn:(int64_t)a3
{
  unint64_t v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  NSMutableDictionary *perColumnViewControllers;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  id v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  NSMutableDictionary *v24;
  void *v25;
  void *v26;
  NSMutableDictionary *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  _QWORD v47[2];
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v6 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v6 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v6);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 2021, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v38);

  }
  if (a3 == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 2022, CFSTR("Can't show %@ column"), CFSTR("Compact"));

    v7 = 0;
  }
  else
  {
    v7 = a3 == 1;
    if (v6 != 2 && a3 == 1)
      return;
  }
  if (v6 != 2
    || (-[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, a3)|| v8)
  {
    *(_QWORD *)&self->_flags |= 0x400000000uLL;
    if (!-[UISplitViewControllerPanelImpl _isCollapsed](self, "_isCollapsed"))
    {
      if (a3 == 2)
      {
        -[UISplitViewControllerPanelImpl _revealSecondaryColumnIfNecessary](self, "_revealSecondaryColumnIfNecessary");
      }
      else
      {
        v20 = -[UISplitViewControllerPanelImpl displayMode](self, "displayMode");
        if ((_UISplitViewControllerColumnIsVisibleForDisplayMode(-[UISplitViewControllerPanelImpl style](self, "style"), a3, v20) & 1) == 0)
        {
          v21 = v6 != 2 && a3 == 0;
          v22 = 4;
          if (v21)
            v22 = 2;
          if (v7)
            v23 = 2;
          else
            v23 = v22;
          -[UISplitViewControllerPanelImpl _transitionFromDisplayMode:toDisplayMode:](self, "_transitionFromDisplayMode:toDisplayMode:", v20, v23);
        }
      }
      goto LABEL_18;
    }
    if (v6 == 2)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9 == 0;

    }
    else
    {
      v10 = 0;
    }
    perColumnViewControllers = self->_perColumnViewControllers;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](perColumnViewControllers, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "navigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "viewControllers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");
    objc_msgSend(v14, "topViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[UISplitViewControllerPanelImpl _columnForViewController:](self, "_columnForViewController:", v17);

    if (v18 == a3)
      goto LABEL_16;
    if (a3 != 2)
    {
      if (a3 == 1)
      {
        if (v18 == 2)
        {
          v24 = self->_perColumnViewControllers;
          goto LABEL_51;
        }
        if (!v18)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "navigationController");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v48[0] = v33;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
          v19 = (id)objc_claimAutoreleasedReturnValue();

          v34 = v16 + 1;
          goto LABEL_55;
        }
      }
      else if (!a3)
      {
        v24 = self->_perColumnViewControllers;
        if (v6 == 2)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", &unk_1E1A974B8);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "navigationController");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_52;
        }
LABEL_51:
        -[NSMutableDictionary objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", &unk_1E1A97470);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "navigationControllerWrapper");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97470);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "navigationController");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v15, "indexOfObject:", v36);

          goto LABEL_54;
        }
LABEL_52:
        v34 = objc_msgSend(v15, "indexOfObject:", v26);
LABEL_54:

        v19 = 0;
LABEL_55:
        if (v34)
        {
          if (v34 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v41[0] = MEMORY[0x1E0C809B0];
            v41[1] = 3221225472;
            v41[2] = __45__UISplitViewControllerPanelImpl_showColumn___block_invoke;
            v41[3] = &unk_1E16C1C58;
            v41[4] = self;
            v44 = v34;
            v45 = v16;
            v42 = v14;
            v19 = v19;
            v43 = v19;
            objc_msgSend(v42, "_executeSplitViewControllerActions:", v41);

          }
        }
        goto LABEL_17;
      }
LABEL_16:
      v19 = 0;
LABEL_17:

LABEL_18:
      *(_QWORD *)&self->_flags &= ~0x400000000uLL;
      return;
    }
    v27 = self->_perColumnViewControllers;
    if (v6 != 2 || v18)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", &unk_1E1A97470);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "navigationControllerWrapper");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (!v29)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97470);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "navigationController");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v46 = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (v29)
        goto LABEL_49;
    }
    else
    {
      -[NSMutableDictionary objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", &unk_1E1A974B8);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "navigationController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v29;
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97470);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "navigationControllerWrapper");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (!v30)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97470);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "navigationController");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v47[1] = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {

      }
    }

LABEL_49:
    v34 = objc_msgSend(v19, "count") + v16;
    goto LABEL_55;
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIFocusMovementDidFailNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)UISplitViewControllerPanelImpl;
  -[UISplitViewControllerPanelImpl dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabBarHostedView);
  objc_storeStrong((id *)&self->_sidebarArrowButtonRecognizer, 0);
  objc_storeStrong((id *)&self->_detailFocusContainerGuide, 0);
  objc_storeStrong((id *)&self->_masterFocusContainerGuide, 0);
  objc_storeStrong((id *)&self->_menuGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__fullScreenButtonImage, 0);
  objc_storeStrong((id *)&self->__dimmingView, 0);
  objc_storeStrong((id *)&self->_panelController, 0);
  objc_storeStrong((id *)&self->__fluidOpenSidebarPresentationGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_extender, 0);
  objc_storeStrong((id *)&self->_interactor, 0);
  objc_storeStrong((id *)&self->_hyperrectangle, 0);
  objc_storeStrong((id *)&self->_regionUnion, 0);
  objc_storeStrong((id *)&self->_hyperpoints, 0);
  objc_storeStrong((id *)&self->_postTransitionResponder, 0);
  objc_storeStrong((id *)&self->_suspendedFirstResponder, 0);
  objc_storeStrong((id *)&self->_suspendedStateRequest, 0);
  objc_storeStrong((id *)&self->_suspendedTraitCollection, 0);
  objc_storeStrong((id *)&self->_transitioningToTraitCollection, 0);
  objc_storeStrong((id *)&self->_overrideReportedDisplayModeStack, 0);
  objc_storeStrong((id *)&self->_sidebarPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_navBarForShortcutButton, 0);
  objc_storeStrong((id *)&self->_secondaryOnlyShortcutButtonItem, 0);
  objc_storeStrong((id *)&self->_navBarForToggleButton, 0);
  objc_storeStrong((id *)&self->_floatableButtonContainer, 0);
  objc_storeStrong((id *)&self->_sidebarToggleButtonItem, 0);
  objc_storeStrong((id *)&self->_displayModeButtonItemTitle, 0);
  objc_storeStrong((id *)&self->_unspecifiedStyleDisplayModeButtonItem, 0);
  objc_destroyWeak((id *)&self->_svc);
  objc_storeStrong((id *)&self->_perColumnViewControllers, 0);
}

void __70__UISplitViewControllerPanelImpl__traitCollectionForChildEnvironment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "_setNSIntegerValue:forTraitToken:", v2, 0x1E1A99690);
  objc_msgSend(v3, "setHorizontalSizeClass:", 1);

}

- (id)_sidebarToggleSymbolImage
{
  const __CFString *v2;

  if (-[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading"))
    v2 = CFSTR("sidebar.leading");
  else
    v2 = CFSTR("sidebar.trailing");
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v2);
}

- (void)_handleFocusMovementDidFail:(id)a3
{
  if (qword_1ECD7D5A8 != -1)
    dispatch_once(&qword_1ECD7D5A8, &__block_literal_global_1258);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t preferredDisplayMode;
  int64_t preferredSplitBehavior;
  int64_t primaryBackgroundStyle;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a3;
  preferredDisplayMode = self->_preferredDisplayMode;
  v10 = v4;
  if (preferredDisplayMode)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", preferredDisplayMode, CFSTR("UISplitViewControllerPreferredDisplayMode"));
    v4 = v10;
  }
  preferredSplitBehavior = self->_preferredSplitBehavior;
  if (preferredSplitBehavior)
  {
    objc_msgSend(v10, "encodeInteger:forKey:", preferredSplitBehavior, CFSTR("UISplitViewControllerPreferredSplitBehavior"));
    v4 = v10;
  }
  if (self->_preferredPrimaryColumnWidthFraction != -3.40282347e38)
  {
    objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("UISplitViewControllerPreferredPrimaryColumnWidthFraction"));
    v4 = v10;
  }
  if (self->_preferredPrimaryColumnWidth != -3.40282347e38)
  {
    objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("UISplitViewControllerPreferredPrimaryColumnWidth"));
    v4 = v10;
  }
  if (self->_maximumPrimaryColumnWidth != -3.40282347e38)
  {
    objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("UISplitViewControllerMaximumPrimaryColumnWidth"));
    v4 = v10;
  }
  if (self->_minimumPrimaryColumnWidth != -3.40282347e38)
  {
    objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("UISplitViewControllerMinimumPrimaryColumnWidth"));
    v4 = v10;
  }
  if (self->_preferredSupplementaryColumnWidthFraction != -3.40282347e38)
  {
    objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("UISplitViewControllerPreferredSupplementaryColumnWidthFraction"));
    v4 = v10;
  }
  if (self->_preferredSupplementaryColumnWidth != -3.40282347e38)
  {
    objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("UISplitViewControllerPreferredSupplementaryColumnWidth"));
    v4 = v10;
  }
  if (self->_maximumSupplementaryColumnWidth != -3.40282347e38)
  {
    objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("UISplitViewControllerMaximumSupplementaryColumnWidth"));
    v4 = v10;
  }
  if (self->_minimumSupplementaryColumnWidth != -3.40282347e38)
  {
    objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("UISplitViewControllerMinimumSupplementaryColumnWidth"));
    v4 = v10;
  }
  objc_msgSend(v4, "encodeInteger:forKey:", self->_primaryEdge, CFSTR("UISplitViewControllerPrimaryEdge"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_presentsWithGesture, CFSTR("UISplitViewControllerPresentsWithGesture"));
  objc_msgSend(v10, "encodeBool:forKey:", (*(_QWORD *)&self->_flags >> 26) & 1, CFSTR("UISplitViewControllerShowsSecondaryOnlyButton"));
  objc_msgSend(v10, "encodeBool:forKey:", (*(_QWORD *)&self->_flags >> 13) & 1, CFSTR("UISplitViewControllerUsesDeviceOverlayPreferences"));
  objc_msgSend(v10, "encodeBool:forKey:", (*(_QWORD *)&self->_flags >> 12) & 1, CFSTR("UISplitViewControllerUsesExtraWidePrimaryColumn"));
  objc_msgSend(v10, "encodeInteger:forKey:", -[UIPanelController style](self->_panelController, "style"), CFSTR("UISplitViewControllerStyle"));
  primaryBackgroundStyle = self->_primaryBackgroundStyle;
  if (primaryBackgroundStyle)
    objc_msgSend(v10, "encodeInteger:forKey:", primaryBackgroundStyle, CFSTR("UISplitViewControllerPrimaryBackgroundStyle"));
  if (-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    -[UISplitViewControllerPanelImpl viewControllerForColumn:](self, "viewControllerForColumn:", 3);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("UISplitViewControllerCompactColumnVC"));

    }
  }

}

- (BOOL)_isExpanding
{
  void *v2;
  BOOL v3;

  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "collapsedState") == 3;

  return v3;
}

- (id)_displayModeButtonItem
{
  return self->_unspecifiedStyleDisplayModeButtonItem;
}

- (id)_unspecifiedCompositionDisplayModeButtonItem
{
  return self->_unspecifiedStyleDisplayModeButtonItem;
}

- (void)setPreferredPrimaryColumnWidthFraction:(double)a3
{
  if (self->_preferredPrimaryColumnWidthFraction != a3)
  {
    self->_preferredPrimaryColumnWidthFraction = a3;
    -[UISplitViewControllerPanelImpl _primaryColumnWidthAffectingPropertyDidChange](self, "_primaryColumnWidthAffectingPropertyDidChange");
  }
}

- (void)showViewController:(id)a3 sender:(id)a4
{
  id v7;
  id v8;
  id v9;
  UISplitViewController **p_svc;
  id WeakRetained;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int64_t v21;
  int64_t v22;
  int64_t v23;
  int64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  _QWORD *v32;
  int v33;
  unint64_t v34;
  NSObject *v35;
  NSObject *v36;
  objc_class *v37;
  id v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  unint64_t v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  _QWORD v60[2];
  _QWORD v61[2];
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    -[UISplitViewControllerPanelImpl _childContainingSender:](self, "_childContainingSender:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 == v7)
    {
LABEL_46:

      goto LABEL_47;
    }
    p_svc = &self->_svc;
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    -[UISplitViewControllerPanelImpl delegate](self, "delegate");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v12 = -[UISplitViewControllerPanelImpl style](self, "style");
      if (v12)
      {
        v13 = v12;
        v14 = qword_1ECD7D4C8;
        if (!qword_1ECD7D4C8)
        {
          v14 = __UILogCategoryGetNode("UISplitViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v14, (unint64_t *)&qword_1ECD7D4C8);
        }
        v15 = *(NSObject **)(v14 + 8);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = v15;
          NSStringFromSelector(sel_splitViewController_showViewController_sender_);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          _UISplitViewControllerStyleDescription(v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v63 = v17;
          v64 = 2114;
          v65 = v18;
          _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", buf, 0x16u);

        }
      }
      else if ((objc_msgSend(v59, "splitViewController:showViewController:sender:", WeakRetained, v7, v8) & 1) != 0)
      {
        goto LABEL_45;
      }
    }
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isCollapsed");

    v21 = -[UISplitViewControllerPanelImpl style](self, "style");
    if (v21)
    {
      v22 = v21;
      v23 = -[UISplitViewControllerPanelImpl _columnForViewController:](self, "_columnForViewController:", v7);
      if (v23 == 999)
      {
        v24 = -[UISplitViewControllerPanelImpl _columnForViewController:](self, "_columnForViewController:", v9);
        if (v24 == 1)
        {
          v25 = 2;
          goto LABEL_33;
        }
        if (!v24)
        {
          if (v22 == 1)
            v25 = 2;
          else
            v25 = 1;
          goto LABEL_33;
        }
      }
      else
      {
        v25 = v23;
        if (v23 == 3)
          v33 = v20;
        else
          v33 = 1;
        if (v33 == 1)
        {
LABEL_33:
          if ((*((_BYTE *)&self->_flags + 3) & 8) != 0)
          {
            v57 = (void *)MEMORY[0x1E0C99DA0];
            v58 = WeakRetained;
            v44 = *MEMORY[0x1E0C99778];
            NSStringFromSelector(a2);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_loadWeakRetained((id *)&self->_svc);
            objc_msgSend(v46, "delegate");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = v44;
            WeakRetained = v58;
            objc_msgSend(v57, "raise:format:", v48, CFSTR("%@ disallowed underneath delegate callback from %@ to %@"), v45, v46, v47);

          }
          -[UISplitViewControllerPanelImpl updatePanelControllerForViewControllerChangeInColumn:alwaysAnimate:](self, "updatePanelControllerForViewControllerChangeInColumn:alwaysAnimate:", v25, 1);
          if ((v20 & 1) != 0)
            goto LABEL_45;
          if (v25 == 2)
          {
            -[UISplitViewControllerPanelImpl _revealSecondaryColumnIfNecessary](self, "_revealSecondaryColumnIfNecessary");
            goto LABEL_45;
          }
          v49 = -[UISplitViewControllerPanelImpl displayMode](self, "displayMode");
          if ((_UISplitViewControllerColumnIsVisibleForDisplayMode(-[UISplitViewControllerPanelImpl style](self, "style"), v25, v49) & 1) == 0)
          {
            v50 = -[UISplitViewControllerPanelImpl _nextTargetDisplayModeForDisplayMode:showMoreIfPossible:](self, "_nextTargetDisplayModeForDisplayMode:showMoreIfPossible:", v49, 1);
            if ((_UISplitViewControllerColumnIsVisibleForDisplayMode(-[UISplitViewControllerPanelImpl style](self, "style"), v25, v50) & 1) == 0)v50 = -[UISplitViewControllerPanelImpl _nextTargetDisplayModeForDisplayMode:showMoreIfPossible:](self, "_nextTargetDisplayModeForDisplayMode:showMoreIfPossible:", v50, 1);
            if ((_UISplitViewControllerColumnIsVisibleForDisplayMode(-[UISplitViewControllerPanelImpl style](self, "style"), v25, v50) & 1) != 0)
            {
              -[UISplitViewControllerPanelImpl _transitionFromDisplayMode:toDisplayMode:](self, "_transitionFromDisplayMode:toDisplayMode:", v49, v50);
              goto LABEL_45;
            }
            v41 = WeakRetained;
            if (os_variant_has_internal_diagnostics())
            {
              __UIFaultDebugAssertLog();
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
              {
                _UISplitViewControllerColumnDescription(v25);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v63 = v56;
                _os_log_fault_impl(&dword_185066000, v55, OS_LOG_TYPE_FAULT, "UIKit error: Can't find a display mode where %@ column is visible", buf, 0xCu);

              }
              goto LABEL_45;
            }
            v53 = qword_1ECD7D4D0;
            if (!qword_1ECD7D4D0)
            {
              v53 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v53, (unint64_t *)&qword_1ECD7D4D0);
            }
            v54 = *(NSObject **)(v53 + 8);
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              v40 = v54;
              _UISplitViewControllerColumnDescription(v25);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v63 = v42;
              _os_log_impl(&dword_185066000, v40, OS_LOG_TYPE_ERROR, "UIKit error: Can't find a display mode where %@ column is visible", buf, 0xCu);
LABEL_30:

              WeakRetained = v41;
            }
          }
LABEL_45:

          goto LABEL_46;
        }
      }
      v34 = qword_1ECD7D4D8;
      if (!qword_1ECD7D4D8)
      {
        v34 = __UILogCategoryGetNode("UISplitViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v34, (unint64_t *)&qword_1ECD7D4D8);
      }
      v35 = *(NSObject **)(v34 + 8);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = v35;
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = WeakRetained;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v63 = v39;
        v64 = 2050;
        v65 = v38;
        _os_log_impl(&dword_185066000, v36, OS_LOG_TYPE_ERROR, "Unexpected request to show compact column when UISplitViewController is not collapsed. Using a default presentation. <%{public}@: %{public}p>", buf, 0x16u);

        WeakRetained = v38;
      }
    }
    else if ((v20 & 1) == 0)
    {
      v26 = WeakRetained;
      v27 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v27, "viewControllers");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v29, "masterViewController");
      v30 = (id)objc_claimAutoreleasedReturnValue();

      if (v30 == v9)
      {
        v61[0] = v7;
        objc_msgSend(v28, "objectAtIndexedSubscript:", 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v61[1] = v31;
        v32 = v61;
      }
      else
      {
        objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v60[0] = v31;
        v60[1] = v7;
        v32 = v60;
      }
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      v52 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v52, "setViewControllers:", v51);

      WeakRetained = v26;
      goto LABEL_45;
    }
    if (!+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
    {
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v7, 0, 0);
      goto LABEL_45;
    }
    v40 = objc_loadWeakRetained((id *)p_svc);
    -[NSObject view](v40, "view");
    v41 = WeakRetained;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "window");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "presentViewController:animated:completion:", v7, v43 != 0, 0);

    goto LABEL_30;
  }
LABEL_47:

}

- (void)_unspecifiedShowDetailViewController:(id)a3 onTargetVC:(id)a4 sender:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  void **v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isCollapsed");

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)p_svc);
  v15 = WeakRetained;
  if ((v12 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "masterViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v26 = v16;
      v27 = v8;
      v17 = (void *)MEMORY[0x1E0C99D20];
      v18 = &v26;
      v19 = 2;
    }
    else
    {
      v25 = v8;
      v17 = (void *)MEMORY[0x1E0C99D20];
      v18 = &v25;
      v19 = 1;
    }
    objc_msgSend(v17, "arrayWithObjects:count:", v18, v19, v25, v26, v27, v28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v24, "setViewControllers:", v23);

    goto LABEL_11;
  }
  objc_msgSend(WeakRetained, "_willShowCollapsedDetailViewController:inTargetController:", v8, v9);

  if (!objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel_showViewController_sender_))
  {
    v16 = objc_loadWeakRetained((id *)p_svc);
    if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
    {
      v20 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v20, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "window");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "presentViewController:animated:completion:", v8, v22 != 0, 0);

    }
    else
    {
      objc_msgSend(v16, "presentViewController:animated:completion:", v8, 0, 0);
    }
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(v9, "showViewController:sender:", v8, v10);
LABEL_12:

}

- (void)_revealSecondaryColumnIfNecessary
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[UISplitViewControllerPanelImpl currentState](self, "currentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UISplitViewControllerPanelImpl _displayModeForState:](self, "_displayModeForState:", v3);

  if (_UISplitViewControllerColumnIsHiddenOrDimmedForDisplayMode(-[UISplitViewControllerPanelImpl style](self, "style"), 2, v4))
  {
    v5 = 2;
    if (v4 != 6)
      v5 = v4;
    if (v4 == 5)
      v5 = 1;
    if (v4 == 3)
      v6 = 1;
    else
      v6 = v5;
    -[UISplitViewControllerPanelImpl _transitionFromDisplayMode:toDisplayMode:](self, "_transitionFromDisplayMode:toDisplayMode:", v4, v6);
  }
}

id __66__UISplitViewControllerPanelImpl_showDetailViewController_sender___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "popToViewController:animated:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __66__UISplitViewControllerPanelImpl_showDetailViewController_sender___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", *(_QWORD *)(a1 + 40), 0);
}

- (BOOL)_interfaceIsCompactForWidth:(double)a3
{
  id WeakRetained;
  void *v5;
  uint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 6)
    return a3 < 260.0;
  else
    return _UIUserInterfaceSizeClassForWidth(a3) == 1;
}

- (BOOL)_isSecondaryColumnCompactInTotalWidth:(double)a3 withPrimaryColumnWidth:(double)a4 supplementaryColumnWidth:(double)a5
{
  int64_t v10;
  unint64_t v11;
  double v12;
  void *v13;
  double v14;
  id WeakRetained;
  void *v17;
  void *v18;

  v10 = -[UISplitViewControllerPanelImpl style](self, "style");
  v11 = v10;
  if ((unint64_t)(v10 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 1615, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v18);

    v12 = a4;
  }
  else
  {
    v12 = a4;
    if (v10 == 2)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = -0.0;
      if (v13)
        v14 = a5;
      v12 = v14 + a4;
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if (_UISplitViewControllerWantsPickerBehaviors(WeakRetained))
  {

    if (a4 == 0.0 || a5 == 0.0)
      return 0;
  }
  else
  {

  }
  return -[UISplitViewControllerPanelImpl _interfaceIsCompactForWidth:](self, "_interfaceIsCompactForWidth:", a3 - v12);
}

void __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;

  v2 = (void *)a1[4];
  v3 = a1[5];
  WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 16));
  objc_msgSend(v2, "_separateViewControllersAfterAndIncludingViewController:forSplitViewController:", v3, WeakRetained);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[7] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_2(uint64_t a1)
{
  id v2;
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
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
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
        objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), 0, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

id __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_4(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "popToViewController:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

void __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v4[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setViewControllers:animated:", v3, *(unsigned __int8 *)(a1 + 48));

}

void __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_7(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;

  v2 = (void *)a1[4];
  v3 = a1[5];
  WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 16));
  objc_msgSend(v2, "_separateViewControllersAfterAndIncludingViewController:forSplitViewController:", v3, WeakRetained);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[7] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

uint64_t __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_189(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setViewControllers:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (BOOL)_allowClientAnimationCoordination
{
  return 1;
}

- (void)hideColumn:(int64_t)a3
{
  int64_t v6;
  BOOL v7;
  void *v8;
  BOOL v9;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  int IsVisibleForDisplayMode;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSMutableDictionary *perColumnViewControllers;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int64_t v31;
  unint64_t v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  unint64_t v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  UISplitViewControllerPanelImpl *v45;
  uint8_t buf[4];
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = -[UISplitViewControllerPanelImpl style](self, "style");
  if ((unint64_t)(v6 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v6);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 1968, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v41);

  }
  if (a3 == 1)
  {
    if (v6 != 2)
      return;
  }
  else
  {
    if (a3 != 3)
    {
      v7 = a3 == 0;
      if (!a3 && v6 == 2)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
          return;
        v7 = 1;
      }
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 1969, CFSTR("Can't hide %@ column"), CFSTR("Compact"));

  }
  v7 = 0;
LABEL_11:
  *(_QWORD *)&self->_flags |= 0x400000000uLL;
  v9 = -[UISplitViewControllerPanelImpl _isCollapsed](self, "_isCollapsed");
  v10 = -[UIPanelController collapsedState](self->_panelController, "collapsedState");
  v11 = v10;
  if (v9 || v10 == 1)
  {
    if (v6 == 2)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24 == 0;

    }
    else
    {
      v25 = 0;
    }
    perColumnViewControllers = self->_perColumnViewControllers;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](perColumnViewControllers, "objectForKeyedSubscript:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "navigationController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "topViewController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[UISplitViewControllerPanelImpl _columnForViewController:](self, "_columnForViewController:", v30);

    if (v25 != a3 && v31 == a3)
    {
      if ((*((_BYTE *)&self->_flags + 3) & 0x10) != 0)
      {
        v36 = qword_1ECD7D4F0;
        if (!qword_1ECD7D4F0)
        {
          v36 = __UILogCategoryGetNode("UISplitViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v36, (unint64_t *)&qword_1ECD7D4F0);
        }
        v37 = *(NSObject **)(v36 + 8);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v38 = v37;
          _UISplitViewControllerColumnDescription(a3);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v47 = v39;
          _os_log_impl(&dword_185066000, v38, OS_LOG_TYPE_ERROR, "Hiding %{public}@ column underneath -splitViewController:topColumnForProposedTopColumn: is ignored. The delegate method implementation should return the desired top column instead.", buf, 0xCu);

        }
      }
      else
      {
        if (v11 == 1)
        {
          v32 = qword_1ECD7D4F8;
          if (!qword_1ECD7D4F8)
          {
            v32 = __UILogCategoryGetNode("UISplitViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v32, (unint64_t *)&qword_1ECD7D4F8);
          }
          v33 = *(NSObject **)(v32 + 8);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            v34 = v33;
            _UISplitViewControllerColumnDescription(a3);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v47 = v35;
            _os_log_impl(&dword_185066000, v34, OS_LOG_TYPE_ERROR, "Hiding %{public}@ column before UISplitViewController has finished collapsing can result in inconsistent state. This is a client bug.", buf, 0xCu);

          }
        }
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __45__UISplitViewControllerPanelImpl_hideColumn___block_invoke;
        v43[3] = &unk_1E16B1B50;
        v44 = v29;
        v45 = self;
        objc_msgSend(v44, "_executeSplitViewControllerActions:", v43);

      }
    }

  }
  else if (a3 != 2)
  {
    v12 = -[UISplitViewControllerPanelImpl displayMode](self, "displayMode");
    IsVisibleForDisplayMode = _UISplitViewControllerColumnIsVisibleForDisplayMode(v6, a3, v12);
    v14 = 1;
    if (v6 == 2 && v7)
      v14 = 2;
    if (IsVisibleForDisplayMode)
      v15 = v14;
    else
      v15 = v12;
    if ((*((_BYTE *)&self->_flags + 3) & 0x20) != 0 && v12 != v15)
    {
      v16 = qword_1ECD7D500;
      if (!qword_1ECD7D500)
      {
        v16 = __UILogCategoryGetNode("UISplitViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v16, (unint64_t *)&qword_1ECD7D500);
      }
      v17 = *(NSObject **)(v16 + 8);
      v15 = v12;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = v17;
        _UISplitViewControllerColumnDescription(a3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v47 = v19;
        _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Hiding %{public}@ column underneath -splitViewController:displayModeForExpandingToProposedDisplayMode: is ignored. The delegate method implementation should return the desired displayMode instead.", buf, 0xCu);

        v15 = v12;
      }
    }
    if (-[UIPanelController collapsedState](self->_panelController, "collapsedState") == 3 && v12 != v15)
    {
      v20 = qword_1ECD7D508;
      if (!qword_1ECD7D508)
      {
        v20 = __UILogCategoryGetNode("UISplitViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v20, (unint64_t *)&qword_1ECD7D508);
      }
      v21 = *(NSObject **)(v20 + 8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = v21;
        _UISplitViewControllerColumnDescription(a3);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v47 = v23;
        _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "Hiding %{public}@ column before UISplitViewController has finished expanding can result in inconsistent state. This is a client bug.", buf, 0xCu);

      }
    }
    if (v12 != v15)
      -[UISplitViewControllerPanelImpl _transitionFromDisplayMode:toDisplayMode:](self, "_transitionFromDisplayMode:toDisplayMode:", v12, v15);
  }
  *(_QWORD *)&self->_flags &= ~0x400000000uLL;
}

void __45__UISplitViewControllerPanelImpl_hideColumn___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
    objc_msgSend(WeakRetained, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v2, "popViewControllerAnimated:", v4 != 0);

  }
  else
  {
    v6 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 0);
  }
}

- (void)setPreferredSupplementaryColumnWidthFraction:(double)a3
{
  double preferredSupplementaryColumnWidthFraction;

  preferredSupplementaryColumnWidthFraction = self->_preferredSupplementaryColumnWidthFraction;
  if (preferredSupplementaryColumnWidthFraction != a3)
  {
    if (a3 != -3.40282347e38 && (a3 < 0.0 || a3 > 1.0))
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported %@, %g, for supplementary column. Value must be %@"), CFSTR("minimum or maximum width value"), *(_QWORD *)&a3, CFSTR("UISplitViewControllerAutomaticDimension or between 0 and 1, inclusive"));
      preferredSupplementaryColumnWidthFraction = self->_preferredSupplementaryColumnWidthFraction;
    }
    self->_preferredSupplementaryColumnWidthFraction = a3;
    if (!dyld_program_sdk_at_least() || preferredSupplementaryColumnWidthFraction != a3)
      -[UISplitViewControllerPanelImpl _supplementaryOrPrimaryColumnWidthAffectingPropertyDidChange](self, "_supplementaryOrPrimaryColumnWidthAffectingPropertyDidChange");
  }
}

- (float)gutterWidth
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  float v12;

  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  if (v7 == 0.0)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    v10 = v9;

  }
  else
  {
    v10 = v7;
  }

  if (-[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading"))
    objc_msgSend(v4, "leadingBorderWidthForScale:", v10);
  else
    objc_msgSend(v4, "trailingBorderWidthForScale:", v10);
  v12 = v11;

  return v12;
}

- (BOOL)hidesMasterViewInPortrait
{
  return 1;
}

- (void)setHidesMasterViewInPortrait:(BOOL)a3
{
  int64_t v5;
  UISplitViewController **p_svc;
  id WeakRetained;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v5 = -[UISplitViewControllerPanelImpl style](self, "style", a3);
  if (v5)
  {
    v9 = v5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 2267, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v11);

  }
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(WeakRetained, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v8 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v8, "loadViewIfNeeded");

  }
}

- (NSString)_displayModeButtonItemTitle
{
  return self->_displayModeButtonItemTitle;
}

- (id)_primaryDimmingView
{
  -[UISplitViewControllerPanelImpl _updateDimmingView](self, "_updateDimmingView");
  return -[UISplitViewControllerPanelImpl _dimmingView](self, "_dimmingView");
}

- (BOOL)prefersOverlayInRegularWidthPhone
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (void)setUsesDeviceOverlayPreferences:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)usesDeviceOverlayPreferences
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (BOOL)_usesExtraWidePrimaryColumn
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (BOOL)_isRotating
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 2377, CFSTR("Should not be called in this UISplitViewController impl"));

  return 0;
}

- (CGSize)_contentSizeForChildViewController:(id)a3 inPopoverController:(id)a4
{
  void *v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 2387, CFSTR("Should not be called in this UISplitViewController impl"));

  v7 = *MEMORY[0x1E0C9D820];
  v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)_popoverController:(id)a3 willChangeToVisible:(BOOL)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 2393, CFSTR("Should not be called in this UISplitViewController impl"));

}

- (void)_popoverController:(id)a3 didChangeFromVisible:(BOOL)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 2398, CFSTR("Should not be called in this UISplitViewController impl"));

}

- (void)_willShowCollapsedDetailViewController:(id)a3 inTargetController:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreservedDetailController:", v6);

  LODWORD(v7) = objc_msgSend(v6, "_isNavigationController");
  if ((_DWORD)v7
    && objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel_showViewController_sender_))
  {
    objc_msgSend(v8, "_setAllowNestedNavigationControllers:", 1);
  }

}

- (void)_willBeginSnapshotSession
{
  void *v3;
  void *v4;
  UITraitCollection *v5;
  UITraitCollection *suspendedTraitCollection;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  void *v11;
  UISlidingBarStateRequest *v12;
  UISlidingBarStateRequest *suspendedStateRequest;
  void *v14;
  int v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *suspendedFirstResponder;
  char v22;
  UIResponder *v23;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_existingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = WeakRetained;
  if (v3)
  {
    objc_msgSend(WeakRetained, "traitCollection");
    v5 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
    suspendedTraitCollection = self->_suspendedTraitCollection;
    self->_suspendedTraitCollection = v5;

    objc_msgSend(WeakRetained, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    self->_suspendedSize.width = v8;
    self->_suspendedSize.height = v9;

    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stateRequest");
    v12 = (UISlidingBarStateRequest *)objc_claimAutoreleasedReturnValue();
    suspendedStateRequest = self->_suspendedStateRequest;
    self->_suspendedStateRequest = v12;

    if ((objc_msgSend(WeakRetained, "_isCollapsed") & 1) == 0)
    {
      -[UISplitViewControllerPanelImpl panelController](self, "panelController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_storeSuspendedConfiguration");

    }
    v15 = objc_msgSend(WeakRetained, "_isCollapsed");
    v16 = 1;
    if (v15)
      v16 = 2;
    self->_suspendedState = v16;
    objc_msgSend(WeakRetained, "_firstResponder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "windowScene");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "keyboardSceneDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "_window");
    suspendedFirstResponder = (void *)objc_claimAutoreleasedReturnValue();
    if (suspendedFirstResponder && objc_msgSend(v17, "_requiresKeyboardWhenFirstResponder"))
    {
      v22 = objc_msgSend(v20, "_isPreservedRestorableResponder:", v17);

      if ((v22 & 1) != 0)
      {
LABEL_11:

        v4 = WeakRetained;
        goto LABEL_12;
      }
      v23 = v17;
      suspendedFirstResponder = self->_suspendedFirstResponder;
      self->_suspendedFirstResponder = v23;
    }

    goto LABEL_11;
  }
LABEL_12:

}

- (void)_didEndSnapshotSession
{
  UITraitCollection *suspendedTraitCollection;
  UISlidingBarStateRequest *suspendedStateRequest;
  void *v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  UIResponder *suspendedFirstResponder;

  suspendedTraitCollection = self->_suspendedTraitCollection;
  self->_suspendedTraitCollection = 0;

  self->_suspendedSize = (CGSize)*MEMORY[0x1E0C9D820];
  suspendedStateRequest = self->_suspendedStateRequest;
  self->_suspendedStateRequest = 0;

  self->_suspendedState = 0;
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_clearSuspendedConfiguration");

  if (self->_suspendedFirstResponder)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "_window");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v9, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "_containsResponder:", self->_suspendedFirstResponder);

      if (v11)
        -[UIResponder becomeFirstResponder](self->_suspendedFirstResponder, "becomeFirstResponder");
    }
    else
    {

    }
  }
  suspendedFirstResponder = self->_suspendedFirstResponder;
  self->_suspendedFirstResponder = 0;

}

- (BOOL)_isAnimating
{
  return -[UIPanelController isAnimating](self->_panelController, "isAnimating");
}

- (double)_primaryDividerPosition
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -1.0;
  if (v4 && (objc_msgSend(v4, "isCollapsed") & 1) == 0)
  {
    if (-[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading"))
    {
      objc_msgSend(v4, "leadingWidth");
      v7 = v6;
      if (-[UISplitViewControllerPanelImpl style](self, "style"))
        objc_msgSend(v4, "leadingOffscreenWidth");
      else
        objc_msgSend(v4, "leadingDragOffset");
    }
    else
    {
      objc_msgSend(v4, "trailingWidth");
      v7 = v9;
      if (-[UISplitViewControllerPanelImpl style](self, "style"))
        objc_msgSend(v4, "trailingOffscreenWidth");
      else
        objc_msgSend(v4, "trailingDragOffset");
    }
    v10 = v7 - v8;
    if (v10 <= 0.0)
      v5 = -1.0;
    else
      v5 = v10;
  }

  return v5;
}

- (double)_supplementaryDividerPosition
{
  void *v3;
  void *v4;
  double v5;
  _BOOL4 v6;
  float v7;
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

  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -1.0;
  if (v4 && (objc_msgSend(v4, "isCollapsed") & 1) == 0)
  {
    v6 = -[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading");
    -[UISplitViewControllerPanelImpl gutterWidth](self, "gutterWidth");
    v8 = v7;
    if (v6)
    {
      objc_msgSend(v4, "leadingWidth");
      v10 = v9;
      objc_msgSend(v4, "leadingOffscreenWidth");
    }
    else
    {
      objc_msgSend(v4, "trailingWidth");
      v10 = v12;
      objc_msgSend(v4, "trailingOffscreenWidth");
    }
    v13 = v10 - v11 + v8;
    objc_msgSend(v4, "supplementaryWidth");
    v15 = v14 + v13;
    objc_msgSend(v4, "supplementaryOffscreenWidth");
    v17 = v15 - v16;
    if (v17 <= 0.0)
      v5 = -1.0;
    else
      v5 = v17;
  }

  return v5;
}

- (int64_t)_greatestAllowedAutohidingDisplayModeInSize:(CGSize)a3
{
  CGFloat height;
  double width;
  unint64_t v7;
  UISplitViewController **p_svc;
  id WeakRetained;
  char v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  id v16;
  int v17;
  void *v18;
  uint64_t i;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[2];
  uint64_t (*v30)(uint64_t, uint64_t);
  void *v31;
  UISplitViewControllerPanelImpl *v32;
  double v33;
  CGFloat v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  uint64_t v41;

  height = a3.height;
  width = a3.width;
  v41 = *MEMORY[0x1E0C80C00];
  v7 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v7 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 2563, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v27);

  }
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v10 = _UISplitViewControllerAutoHidesColumns(WeakRetained);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 2563, CFSTR("Method restricted to autohiding context for UISplitViewController"));

  }
  if (-[UISplitViewControllerPanelImpl _isSecondaryColumnCompactInTotalWidth:withPrimaryColumnWidth:supplementaryColumnWidth:](self, "_isSecondaryColumnCompactInTotalWidth:withPrimaryColumnWidth:supplementaryColumnWidth:", width, 0.0, 0.0))
  {
    if (_UIGetUISplitViewControllerChamoisResizeLogging())
    {
      v11 = qword_1ECD7D510;
      if (!qword_1ECD7D510)
      {
        v11 = __UILogCategoryGetNode("ChamoisResize", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v11, (unint64_t *)&qword_1ECD7D510);
      }
      v12 = *(NSObject **)(v11 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = v12;
        v14 = objc_loadWeakRetained((id *)&self->_svc);
        *(_DWORD *)buf = 138412546;
        v36 = v14;
        v37 = 2048;
        v38 = width;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "%@: Using SecondaryOnly as greatest allowed autohiding display mode in overly narrow width, %g", buf, 0x16u);

      }
    }
    return 1;
  }
  else
  {
    v16 = objc_loadWeakRetained((id *)&self->_svc);
    v17 = _UISplitViewControllerAutoRevealsFullSidebar(v16);
    v15 = 2;
    if (v7 == 2 && v17)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
        v15 = 4;
      else
        v15 = 2;

    }
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v30 = __78__UISplitViewControllerPanelImpl__greatestAllowedAutohidingDisplayModeInSize___block_invoke;
    v31 = &unk_1E16C1A58;
    v32 = self;
    v33 = width;
    v34 = height;
    for (i = __78__UISplitViewControllerPanelImpl__greatestAllowedAutohidingDisplayModeInSize___block_invoke((uint64_t)v29, v15); i != v15; i = v30((uint64_t)v29, i))
      v15 = i;
    if (_UIGetUISplitViewControllerChamoisResizeLogging())
    {
      v20 = qword_1ECD7D518;
      if (!qword_1ECD7D518)
      {
        v20 = __UILogCategoryGetNode("ChamoisResize", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v20, (unint64_t *)&qword_1ECD7D518);
      }
      v21 = *(NSObject **)(v20 + 8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = v21;
        v23 = objc_loadWeakRetained((id *)p_svc);
        _UISplitViewControllerDisplayModeDescription(v15);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v36 = v23;
        v37 = 2112;
        v38 = *(double *)&v24;
        v39 = 2048;
        v40 = width;
        _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "%@: Using %@ as greatest allowed autohiding display mode in width %g", buf, 0x20u);

      }
    }
  }
  return v15;
}

uint64_t __78__UISplitViewControllerPanelImpl__greatestAllowedAutohidingDisplayModeInSize___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  double v7;
  double v8;

  v7 = 0.0;
  v8 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:", &v8, &v7, a2, 1, 0, 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  v4 = objc_msgSend(*(id *)(a1 + 32), "_isSecondaryColumnCompactInTotalWidth:withPrimaryColumnWidth:supplementaryColumnWidth:", *(double *)(a1 + 40), v8, v7);
  if (a2 == 4)
    v5 = 2;
  else
    v5 = 1;
  if (v4)
    return v5;
  else
    return a2;
}

- (BOOL)inExpandingToProposedDisplayModeCallback
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 5) & 1;
}

- (void)updatePanelControllerForViewControllerChangeInColumn:(int64_t)a3
{
  -[UISplitViewControllerPanelImpl updatePanelControllerForViewControllerChangeInColumn:alwaysAnimate:](self, "updatePanelControllerForViewControllerChangeInColumn:alwaysAnimate:", a3, 0);
}

- (void)updatePanelControllerForViewControllerChangeInColumn:(int64_t)a3 alwaysAnimate:(BOOL)a4
{
  -[UISplitViewControllerPanelImpl updatePanelControllerForViewControllerChangeInColumn:alwaysAnimate:shouldUpdateCollapsedNavStack:](self, "updatePanelControllerForViewControllerChangeInColumn:alwaysAnimate:shouldUpdateCollapsedNavStack:", a3, a4, 1);
}

void __131__UISplitViewControllerPanelImpl_updatePanelControllerForViewControllerChangeInColumn_alwaysAnimate_shouldUpdateCollapsedNavStack___block_invoke(_QWORD *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v5 = (void *)a1[4];
  objc_msgSend(*(id *)(a1[5] + 8), "objectForKeyedSubscript:", &unk_1E1A97470);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "navigationControllerWrapper");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v8 = 0;
    v9 = (void *)v6;
  }
  else
  {
    objc_msgSend(*(id *)(a1[5] + 8), "objectForKeyedSubscript:", &unk_1E1A97470);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "navigationController");
    v10 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)v10;
    if (v10)
    {
      v8 = 0;
      v9 = (void *)v10;
    }
    else
    {
      objc_msgSend(*(id *)(a1[5] + 8), "objectForKeyedSubscript:", &unk_1E1A97470);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "viewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 1;
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 16));
  objc_msgSend(v5, "_separateViewControllersAfterAndIncludingViewController:forSplitViewController:", v9, WeakRetained);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1[6] + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  if (v8)
  {

  }
  if (!v7)
  {

  }
}

uint64_t __131__UISplitViewControllerPanelImpl_updatePanelControllerForViewControllerChangeInColumn_alwaysAnimate_shouldUpdateCollapsedNavStack___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", *(_QWORD *)(a1 + 40), 0);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v3)
    return objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", v3, 0);
  return result;
}

uint64_t __131__UISplitViewControllerPanelImpl_updatePanelControllerForViewControllerChangeInColumn_alwaysAnimate_shouldUpdateCollapsedNavStack___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled")|| *(_BYTE *)(a1 + 48) != 0;
  return objc_msgSend(v2, "pushViewController:animated:", v3, v4);
}

uint64_t __131__UISplitViewControllerPanelImpl_updatePanelControllerForViewControllerChangeInColumn_alwaysAnimate_shouldUpdateCollapsedNavStack___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled")|| *(_BYTE *)(a1 + 48) != 0;
  return objc_msgSend(v2, "setViewControllers:animated:", v3, v4);
}

- (void)toggleMasterVisible:(id)a3
{
  id v4;

  v4 = a3;
  if (dyld_program_sdk_at_least())
    -[UISplitViewControllerPanelImpl _triggerDisplayModeAction:](self, "_triggerDisplayModeAction:", v4);

}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  id WeakRetained;
  _BOOL4 v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double MatchingState;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  BOOL v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v9 = -[UIPanelController supportsColumnStyle](self->_panelController, "supportsColumnStyle");
  -[UIPanelController currentState](self->_panelController, "currentState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isCollapsed") & 1) != 0)
    goto LABEL_2;
  v13 = 0.0;
  if (v9)
  {
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "rubberBandExtension");
    v13 = v16;

  }
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leadingViewController");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18 == v7)
  {
    objc_msgSend(v10, "leadingWidth");
    v26 = v25;
    if (v25 <= 0.0)
    {
      -[UISplitViewControllerPanelImpl panelController](self, "panelController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "possibleStates");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      v30 = 1;
LABEL_16:
      v26 = minNonzeroPrimaryWidthInStates(v28, v30);

    }
LABEL_17:
    width = v13 + v26;
    goto LABEL_18;
  }
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingViewController");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (v20 == v7)
  {
    objc_msgSend(v10, "trailingWidth");
    v26 = v31;
    if (v31 <= 0.0)
    {
      -[UISplitViewControllerPanelImpl panelController](self, "panelController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "possibleStates");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      v30 = 0;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (v9
    && (-[UIPanelController supplementaryViewController](self->_panelController, "supplementaryViewController"),
        v21 = (id)objc_claimAutoreleasedReturnValue(),
        v21,
        v21 == v7))
  {
    objc_msgSend(v10, "supplementaryWidth");
    MatchingState = v39;
    if (v39 <= 0.0)
    {
      -[UISplitViewControllerPanelImpl panelController](self, "panelController");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "possibleStates");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v41) = -[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading");
      v43 = minNonzeroPrimaryWidthInStates(v42, (int)v41);
      MatchingState = minNonzeroSupplementaryWidthInStateWithPrimaryWidthGetMatchingState(v42, (int)v41, 0, v43);

    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = -0.0;
    if (!v44)
      v45 = v13;
    width = MatchingState + v45;
  }
  else
  {
    -[UIPanelController mainViewController](self->_panelController, "mainViewController");
    v22 = objc_claimAutoreleasedReturnValue();
    if ((id)v22 == v7)
    {

    }
    else
    {
      v23 = (void *)v22;
      -[UIPanelController preservedDetailController](self->_panelController, "preservedDetailController");
      v24 = (id)objc_claimAutoreleasedReturnValue();

      if (v24 != v7)
      {
LABEL_2:
        objc_msgSend(WeakRetained, "_super_sizeForChildContentContainer:withParentContainerSize:", v7, width, height);
        width = v11;
        height = v12;
        goto LABEL_18;
      }
    }
    objc_msgSend(WeakRetained, "traitCollection");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "displayScale");
    if (v35 == 0.0)
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "scale");
      v38 = v37;

    }
    else
    {
      v38 = v35;
    }

    if ((objc_msgSend(v10, "leadingOverlapsMain") & 1) == 0)
    {
      objc_msgSend(v10, "leadingWidth");
      if (v46 > 0.0)
      {
        objc_msgSend(v10, "leadingWidth");
        v48 = width - v47;
        objc_msgSend(v10, "configuration");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "leadingBorderWidthForScale:", v38);
        width = v48 - v50;

      }
    }
    if ((objc_msgSend(v10, "trailingOverlapsMain") & 1) == 0)
    {
      objc_msgSend(v10, "trailingWidth");
      if (v51 > 0.0)
      {
        objc_msgSend(v10, "trailingWidth");
        v53 = width - v52;
        objc_msgSend(v10, "configuration");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "trailingBorderWidthForScale:", v38);
        width = v53 - v55;

      }
    }
    if ((objc_msgSend(v10, "supplementaryOverlapsMain") & 1) == 0)
    {
      objc_msgSend(v10, "supplementaryWidth");
      if (v56 > 0.0)
      {
        objc_msgSend(v10, "supplementaryWidth");
        v58 = width - v57;
        v59 = -[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading");
        objc_msgSend(v10, "configuration");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v60;
        if (v59)
          objc_msgSend(v60, "leadingBorderWidthForScale:", v38);
        else
          objc_msgSend(v60, "trailingBorderWidthForScale:", v38);
        v63 = v62;

        width = v58 - v63;
      }
    }
  }
LABEL_18:

  v32 = width;
  v33 = height;
  result.height = v33;
  result.width = v32;
  return result;
}

void __92__UISplitViewControllerPanelImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(id *a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  char v7;
  _QWORD *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id WeakRetained;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;

  v2 = a1[4];
  v3 = (void *)v2[18];
  v2[18] = 0;

  *((_DWORD *)a1[4] + 38) = 0;
  if (objc_msgSend(a1[5], "horizontalSizeClass") != 1)
  {
    objc_msgSend(a1[4], "panelController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPreservedDetailController:", 0);

  }
  v5 = a1[4];
  v6 = (void *)v5[29];
  if (v6)
  {
    if ((*((_BYTE *)v5 + 289) & 4) == 0)
    {
      v7 = objc_msgSend(a1[6], "_containsResponder:");
      v8 = a1[4];
      if ((v7 & 1) != 0)
      {
        v9 = (void *)v8[29];
        if ((*((_BYTE *)v8 + 289) & 8) != 0)
        {
          objc_msgSend(v9, "becomeFirstResponder");
          v10 = 0;
        }
        else
        {
          v10 = v9;
          objc_msgSend(a1[6], "_window");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "_setFirstResponder:", *((_QWORD *)a1[4] + 29));

        }
        v36 = 0;
LABEL_13:
        v12 = a1[4];
        v13 = (void *)v12[29];
        v12[29] = 0;

        *((_QWORD *)a1[4] + 36) &= ~0x400uLL;
        *((_QWORD *)a1[4] + 36) &= ~0x800uLL;
        if (v36)
        {
          objc_msgSend(v36, "_finishResignFirstResponder");
          objc_msgSend(v36, "_window");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            WeakRetained = objc_loadWeakRetained((id *)a1[4] + 2);
            objc_msgSend(WeakRetained, "_window");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "windowScene");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "keyboardSceneDelegate");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "responder");
            v29 = (id)objc_claimAutoreleasedReturnValue();

            if (v29 != v36)
              goto LABEL_21;
            v32 = objc_loadWeakRetained((id *)a1[4] + 2);
            objc_msgSend(v32, "_window");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "windowScene");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "keyboardSceneDelegate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            v35 = objc_msgSend(v14, "automaticAppearanceInternalEnabled");
            objc_msgSend(v14, "setAutomaticAppearanceInternalEnabled:", 1);
            objc_msgSend(v14, "_reloadInputViewsForResponder:", 0);
            objc_msgSend(v14, "setAutomaticAppearanceInternalEnabled:", v35);
          }
        }
        else
        {
          if (!v10)
            goto LABEL_21;
          objc_msgSend(v10, "_window");
          v15 = objc_claimAutoreleasedReturnValue();
          if (!v15)
            goto LABEL_21;
          v16 = (void *)v15;
          v17 = objc_loadWeakRetained((id *)a1[4] + 2);
          objc_msgSend(v17, "_window");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "windowScene");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "keyboardSceneDelegate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "responder");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
            goto LABEL_21;
          v14 = objc_loadWeakRetained((id *)a1[4] + 2);
          objc_msgSend(v14, "_window");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "windowScene");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "keyboardSceneDelegate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "_reloadInputViewsForResponder:", v10);

        }
LABEL_21:
        v30 = objc_loadWeakRetained((id *)a1[4] + 2);
        objc_msgSend(v30, "_window");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "_setIsSettingFirstResponder:", 0);

        return;
      }
      v6 = (void *)v8[29];
    }
    v36 = v6;
    v10 = 0;
    goto LABEL_13;
  }
}

- (int64_t)_svcOrientation
{
  id WeakRetained;
  void *v3;
  void *v4;
  int64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "interfaceOrientation");

  return v5;
}

- (int64_t)_svcViewWindowOrientation
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "interfaceOrientation");

  return v6;
}

- (BOOL)canTileSidebarColumn:(int64_t)a3
{
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL result;
  id WeakRetained;
  void *v12;
  double Width;
  double v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  double v18;
  _BOOL4 v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  CGRect v30;

  v6 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v6 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 3454, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v24);

  }
  if ((unint64_t)a3 >= 2)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    _UISplitViewControllerColumnDescription(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("canTileSidebarColumn not supported for %@ column"), v9);

  }
  if (-[UISplitViewControllerPanelImpl _isCollapsed](self, "_isCollapsed"))
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_existingView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  Width = CGRectGetWidth(v30);
  if (!self)
    goto LABEL_11;
  v14 = Width;
  v15 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v15 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", sel__maximumNumberOfColumnsAllowedToTileInWidth_, self, CFSTR("UISplitViewControllerPanelImpl.m"), 3478, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v26);

  }
  if (!-[UISplitViewControllerPanelImpl _isSecondaryColumnCompactInTotalWidth:withPrimaryColumnWidth:supplementaryColumnWidth:](self, "_isSecondaryColumnCompactInTotalWidth:withPrimaryColumnWidth:supplementaryColumnWidth:", v14, 0.0, 0.0))
  {
    v28 = 0.0;
    v29 = 0.0;
    -[UISplitViewControllerPanelImpl getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:](self, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:", &v29, &v28, 2, 1, 0, 0, v14, 800.0);
    v18 = v28;
    v17 = v29;
    if (v29 != 0.0 && v28 != 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", sel__maximumNumberOfColumnsAllowedToTileInWidth_, self, CFSTR("UISplitViewControllerPanelImpl.m"), 3489, CFSTR("Internal UIKit error: UISplitViewControllerDisplayModeOneBesideSecondary should only report nonzero width for one of the primary or supplementary columns"));

      v18 = v28;
      v17 = v29;
    }
    v19 = -[UISplitViewControllerPanelImpl _isSecondaryColumnCompactInTotalWidth:withPrimaryColumnWidth:supplementaryColumnWidth:](self, "_isSecondaryColumnCompactInTotalWidth:withPrimaryColumnWidth:supplementaryColumnWidth:", v14, v17, v18);
    if (v19)
      v16 = 1;
    else
      v16 = 2;
    if (v15 == 2 && !v19)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v28 = 0.0;
        v29 = 0.0;
        -[UISplitViewControllerPanelImpl getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:](self, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:", &v29, &v28, 4, 1, 0, 0, v14, 800.0);
        if (-[UISplitViewControllerPanelImpl _isSecondaryColumnCompactInTotalWidth:withPrimaryColumnWidth:supplementaryColumnWidth:](self, "_isSecondaryColumnCompactInTotalWidth:withPrimaryColumnWidth:supplementaryColumnWidth:", v14, v29, v28))
        {
          v16 = 2;
        }
        else
        {
          v16 = 3;
        }
      }
      else
      {
        v16 = 2;
      }
    }
  }
  else
  {
LABEL_11:
    v16 = 0;
  }

  result = v16 > 1;
  if (v6 == 2 && v16 >= 2)
  {
    if (a3 == 1)
    {
      v21 = 1;
    }
    else
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v22 == 0;

    }
    return v16 == 3 || v21;
  }
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  id WeakRetained;
  int64_t v9;
  int64_t v10;
  unint64_t v11;
  double v12;
  uint64_t v13;
  CGFloat v14;
  int64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  char isKindOfClass;
  uint64_t v30;
  void *v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  int64_t v35;
  _QWORD v36[4];
  id v37;
  id v38;
  double v39;
  double v40;
  _QWORD v41[5];
  _QWORD v42[5];
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform v48;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v9 = -[UISplitViewControllerPanelImpl _svcOrientation](self, "_svcOrientation");
  v10 = v9;
  v11 = v9 - 1;
  switch(v9)
  {
    case 1:
      v12 = 0.0;
      break;
    case 3:
      v12 = 1.57079633;
      break;
    case 4:
      v12 = -1.57079633;
      break;
    default:
      v12 = 3.14159265;
      if (v9 != 2)
        v12 = 0.0;
      break;
  }
  CGAffineTransformMakeRotation(&t1, v12);
  if (v7)
    objc_msgSend(v7, "targetTransform");
  else
    memset(&t2, 0, sizeof(t2));
  CGAffineTransformConcat(&v45, &t1, &t2);
  v13 = 0;
  v33 = vrndaq_f64(*(float64x2_t *)&v45.c);
  v34 = vrndaq_f64(*(float64x2_t *)&v45.a);
  v32 = vrndaq_f64(*(float64x2_t *)&v45.tx);
  while (1)
  {
    *(float64x2_t *)&v48.a = v34;
    *(float64x2_t *)&v48.c = v33;
    v14 = 3.14159265;
    *(float64x2_t *)&v48.tx = v32;
    if (v13 <= 2)
      v14 = dbl_18667A640[v13];
    CGAffineTransformMakeRotation(&v46, v14);
    *(float64x2_t *)&v46.a = vrndaq_f64(*(float64x2_t *)&v46.a);
    *(float64x2_t *)&v46.c = vrndaq_f64(*(float64x2_t *)&v46.c);
    *(float64x2_t *)&v46.tx = vrndaq_f64(*(float64x2_t *)&v46.tx);
    v47 = v46;
    if (CGAffineTransformEqualToTransform(&v48, &v47))
      break;
    if ((_DWORD)++v13 == 4)
    {
      v15 = 0;
      goto LABEL_19;
    }
  }
  v15 = qword_18667A620[v13];
LABEL_19:
  if (self->_transitioningToTraitCollection)
    goto LABEL_29;
  objc_msgSend(WeakRetained, "_existingView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  if (width != v18 || height != v17)
    goto LABEL_28;
  if (v11 > 1)
  {
    if ((unint64_t)(v10 - 3) < 2)
    {

      if ((unint64_t)(v15 - 3) <= 1)
        goto LABEL_30;
      goto LABEL_29;
    }
LABEL_28:

    goto LABEL_29;
  }

  if ((unint64_t)(v15 - 1) < 2)
    goto LABEL_30;
LABEL_29:
  if (_os_feature_enabled_impl())
  {
LABEL_30:
    objc_msgSend(WeakRetained, "_super_viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height, *(_OWORD *)&v32, *(_OWORD *)&v33);
    goto LABEL_55;
  }
  v35 = v15;
  objc_msgSend(WeakRetained, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v20, "_existingView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "window");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "windowScene");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_effectiveUISettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "inLiveResize");

  if ((v25 & 1) == 0
    && objc_msgSend(v19, "userInterfaceIdiom") == 1
    && -[UITraitCollection horizontalSizeClass](self->_transitioningToTraitCollection, "horizontalSizeClass") != UIUserInterfaceSizeClassCompact)
  {
    if (-[UISplitViewControllerPanelImpl style](self, "style"))
    {
      if (-[UISplitViewControllerPanelImpl userGeneratedDisplayMode](self, "userGeneratedDisplayMode"))
      {
        v27 = -[UISplitViewControllerPanelImpl userGeneratedDisplayMode](self, "userGeneratedDisplayMode");
        if (v27 != -[UISplitViewControllerPanelImpl preferredDisplayMode](self, "preferredDisplayMode"))
          -[UISplitViewControllerPanelImpl setUserGeneratedDisplayMode:](self, "setUserGeneratedDisplayMode:", 0);
      }
    }
    else if (objc_msgSend(WeakRetained, "preferredDisplayMode") != 2)
    {
      -[UISplitViewControllerPanelImpl _setPrimaryHidingState:](self, "_setPrimaryHidingState:", 0);
    }
  }
  if (!objc_msgSend(v19, "userInterfaceIdiom", *(_OWORD *)&v32, *(_OWORD *)&v33)
    && -[UISplitViewControllerPanelImpl _iPhoneShouldUseOverlayInCurrentEnvironment](self, "_iPhoneShouldUseOverlayInCurrentEnvironment")&& (*(_BYTE *)&self->_transitioningFlags & 1) != 0)
  {
    if (-[UISplitViewControllerPanelImpl style](self, "style"))
    {
      if ((*(_BYTE *)&self->_transitioningFlags & 2) != 0)
        v26 = 3;
      else
        v26 = 1;
      -[UISplitViewControllerPanelImpl setUserGeneratedDisplayMode:](self, "setUserGeneratedDisplayMode:", v26);
    }
    else
    {
      if ((*(_BYTE *)&self->_transitioningFlags & 2) != 0)
        v28 = 2;
      else
        v28 = 1;
      -[UISplitViewControllerPanelImpl _setPrimaryHidingState:](self, "_setPrimaryHidingState:", v28);
    }
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v30 = MEMORY[0x1E0C809B0];
  if ((isKindOfClass & 1) != 0)
  {
    v41[4] = self;
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __85__UISplitViewControllerPanelImpl_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v42[3] = &unk_1E16B2150;
    v42[4] = self;
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __85__UISplitViewControllerPanelImpl_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v41[3] = &unk_1E16B2150;
    objc_msgSend(v7, "_animateAlongsideTransitionInView:systemAnimation:systemCompletion:animation:completion:", 0, 1, 1, v42, v41);
  }
  *(_QWORD *)&self->_flags |= 0x100uLL;
  self->_transitioningToSize.width = width;
  self->_transitioningToSize.height = height;
  self->_transitioningToOrientation = v35;
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v30;
  v36[1] = 3221225472;
  v36[2] = __85__UISplitViewControllerPanelImpl_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  v36[3] = &unk_1E16B80A8;
  v37 = WeakRetained;
  v39 = width;
  v40 = height;
  v38 = v7;
  objc_msgSend(v31, "viewWillTransitionToSize:withTransitionCoordinator:superBlock:", v38, v36, width, height);

  *(_QWORD *)&self->_flags &= ~0x100uLL;
  self->_transitioningToSize = (CGSize)*MEMORY[0x1E0C9D820];
  self->_transitioningToOrientation = 0;

LABEL_55:
}

uint64_t __85__UISplitViewControllerPanelImpl_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pushOverrideOfReportedDisplayMode:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
}

uint64_t __85__UISplitViewControllerPanelImpl_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_popOverrideOfReportedDisplayMode");
}

uint64_t __85__UISplitViewControllerPanelImpl_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_super_viewWillTransitionToSize:withTransitionCoordinator:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (id)_orderedPreferredFocusedViewControllers
{
  void *v3;
  void *WeakRetained;
  uint64_t v5;
  id v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v17[16];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  -[UISplitViewControllerPanelImpl viewControllers](self, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!dyld_program_sdk_at_least() || !objc_msgSend(v3, "count"))
  {
    v6 = v3;
    goto LABEL_10;
  }
  if (!-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObject:", v9);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_30;
  }
  if (-[UISplitViewControllerPanelImpl isCollapsed](self, "isCollapsed"))
  {
    -[UISplitViewControllerPanelImpl viewControllerForColumn:](self, "viewControllerForColumn:", 3);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    if (WeakRetained
      || (-[UIPanelController collapsedViewController](self->_panelController, "collapsedViewController"),
          (WeakRetained = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v18[0] = WeakRetained;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v17 = 0;
          _os_log_fault_impl(&dword_185066000, v16, OS_LOG_TYPE_FAULT, "Unable to get collapsedViewController while in collapsed state.", v17, 2u);
        }

      }
      else
      {
        v14 = _orderedPreferredFocusedViewControllers___s_category;
        if (!_orderedPreferredFocusedViewControllers___s_category)
        {
          v14 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v14, (unint64_t *)&_orderedPreferredFocusedViewControllers___s_category);
        }
        v15 = *(NSObject **)(v14 + 8);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Unable to get collapsedViewController while in collapsed state.", v17, 2u);
        }
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(WeakRetained, "viewControllers");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (id)v5;

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[UIPanelController isAnimating](self->_panelController, "isAnimating"))
  {
    if ((_UISplitViewControllerColumnIsHiddenOrDimmedForDisplayMode(-[UISplitViewControllerPanelImpl style](self, "style"), 2, -[UISplitViewControllerPanelImpl displayMode](self, "displayMode")) & 1) == 0)
    {
      -[UISplitViewControllerPanelImpl viewControllerForColumn:](self, "viewControllerForColumn:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(v6, "addObject:", v12);

    }
    if ((_UISplitViewControllerColumnIsHiddenOrDimmedForDisplayMode(-[UISplitViewControllerPanelImpl style](self, "style"), 0, -[UISplitViewControllerPanelImpl displayMode](self, "displayMode")) & 1) == 0)
    {
      -[UISplitViewControllerPanelImpl viewControllerForColumn:](self, "viewControllerForColumn:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        objc_msgSend(v6, "addObject:", v13);

    }
    if ((_UISplitViewControllerColumnIsHiddenOrDimmedForDisplayMode(-[UISplitViewControllerPanelImpl style](self, "style"), 1, -[UISplitViewControllerPanelImpl displayMode](self, "displayMode")) & 1) != 0)goto LABEL_10;
    -[UISplitViewControllerPanelImpl viewControllerForColumn:](self, "viewControllerForColumn:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_29;
LABEL_30:

    goto LABEL_10;
  }
  if (-[UIPanelController isTrailingViewControllerVisibleAfterAnimation](self->_panelController, "isTrailingViewControllerVisibleAfterAnimation"))
  {
    -[UIPanelController trailingViewController](self->_panelController, "trailingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);

  }
  if (-[UIPanelController isLeadingViewControllerVisibleAfterAnimation](self->_panelController, "isLeadingViewControllerVisibleAfterAnimation"))
  {
    -[UIPanelController leadingViewController](self->_panelController, "leadingViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v11);

  }
  if (-[UIPanelController isSupplementaryViewControllerVisibleAfterAnimation](self->_panelController, "isSupplementaryViewControllerVisibleAfterAnimation"))
  {
    -[UIPanelController supplementaryViewController](self->_panelController, "supplementaryViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:
    objc_msgSend(v6, "addObject:", v8);
    goto LABEL_30;
  }
LABEL_10:

  return v6;
}

- (id)preferredFocusedView
{
  void *v3;
  int64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[UISplitViewControllerPanelImpl _orderedPreferredFocusedViewControllers](self, "_orderedPreferredFocusedViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UISplitViewControllerPanelImpl _lastFocusedChildViewControllerColumn](self, "_lastFocusedChildViewControllerColumn");
  if (v4 == 999)
    goto LABEL_14;
  v5 = v4;
  if (!-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    -[UISplitViewControllerPanelImpl viewControllers](self, "viewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 >= objc_msgSend(v7, "count"))
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (!v6)
      goto LABEL_13;
LABEL_9:
    if ((objc_msgSend(v3, "containsObject:", v6) & 1) != 0)
    {
      objc_msgSend(v6, "preferredFocusedView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 && (-[UIView _containsPreferredFocusableView](v8) & 1) != 0)
        goto LABEL_27;
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  -[UISplitViewControllerPanelImpl _topLevelViewControllerForColumn:]((uint64_t)self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_9;
LABEL_13:

LABEL_14:
  v8 = 0;
LABEL_15:
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  WeakRetained = v3;
  v10 = objc_msgSend(WeakRetained, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
LABEL_17:
    v13 = 0;
    v14 = v8;
    while (1)
    {
      if (*(_QWORD *)v17 != v12)
        objc_enumerationMutation(WeakRetained);
      objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "preferredFocusedView", (_QWORD)v16);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        if ((-[UIView _containsPreferredFocusableView](v8) & 1) != 0)
          goto LABEL_26;
      }
      ++v13;
      v14 = v8;
      if (v11 == v13)
      {
        v11 = objc_msgSend(WeakRetained, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v11)
          goto LABEL_17;
        break;
      }
    }
  }

  if (!v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "_super_preferredFocusedView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

  }
LABEL_27:

  return v8;
}

- (id)_topLevelViewControllerForColumn:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationControllerWrapper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v10 = *(void **)(a1 + 8);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "navigationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v9 = v13;
      }
      else
      {
        v15 = *(void **)(a1 + 8);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "viewController");
        v9 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)preferredFocusEnvironments
{
  void *v3;
  id v4;
  int64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v17;
  id v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[UISplitViewControllerPanelImpl _orderedPreferredFocusedViewControllers](self, "_orderedPreferredFocusedViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = -[UISplitViewControllerPanelImpl _lastFocusedChildViewControllerColumn](self, "_lastFocusedChildViewControllerColumn");
  if (v5 != 999)
  {
    v6 = v5;
    if (-[UISplitViewControllerPanelImpl style](self, "style"))
    {
      -[UISplitViewControllerPanelImpl _topLevelViewControllerForColumn:]((uint64_t)self, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      -[UISplitViewControllerPanelImpl viewControllers](self, "viewControllers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 >= objc_msgSend(v8, "count"))
      {
        v7 = 0;
      }
      else
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }

      if (!v7)
        goto LABEL_11;
    }
    if (objc_msgSend(v3, "containsObject:", v7))
      objc_msgSend(v4, "addObject:", v7);
    goto LABEL_11;
  }
LABEL_12:
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v14, (_QWORD)v21) & 1) == 0)
          objc_msgSend(v4, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(WeakRetained, "_super_preferredFocusEnvironments");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v17);

  v18 = objc_loadWeakRetained((id *)p_svc);
  _UIFocusEnvironmentCombinedPreferredFocusEnvironments(v18, v4, objc_msgSend(v18, "_subclassPreferredFocusedViewPrioritizationType"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_overridingPreferredFocusEnvironment
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_super_overridingPreferredFocusEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[UISplitViewControllerPanelImpl _orderedPreferredFocusedViewControllers](self, "_orderedPreferredFocusedViewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 1)
    {
      objc_msgSend(v6, "firstObject");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  UISplitViewController **p_svc;
  id v4;
  id WeakRetained;
  char v6;

  p_svc = &self->_svc;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_svc);
  v6 = objc_msgSend(WeakRetained, "_super_shouldUpdateFocusInContext:", v4);

  return v6;
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[UISplitViewControllerPanelImpl _isCollapsed](self, "_isCollapsed");
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "collapsedViewController");
  else
    objc_msgSend(v4, "mainViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "childViewControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    v9 = 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v9 &= objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "shouldAutorotateToInterfaceOrientation:", a3);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  id WeakRetained;
  int64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v3 = objc_msgSend(WeakRetained, "_super_preferredInterfaceOrientationForPresentation");

  return v3;
}

- (void)unloadViewForced:(BOOL)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  -[UISplitViewControllerPanelImpl panelController](self, "panelController", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allViewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "unloadViewIfReloadable");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_didUpdateFocusInContext:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;

  v21 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_super_didUpdateFocusInContext:", v21);

  if (-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    objc_msgSend(v21, "nextFocusedView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_13;
    objc_msgSend(v21, "nextFocusedView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_lastFocusedChildViewControllerColumn = -[UISplitViewControllerPanelImpl _columnForView:getIsContent:](self, "_columnForView:getIsContent:", v6, 0);
  }
  else
  {
    -[UISplitViewControllerPanelImpl viewControllers](self, "viewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "nextFocusedView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_viewControllerForAncestor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      while (1)
      {
        v9 = objc_msgSend(v6, "indexOfObject:", v8);
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
          break;
        objc_msgSend(v8, "parentViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          v12 = v10;
        }
        else
        {
          objc_msgSend(v8, "presentingViewController");
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        v13 = v12;

        v8 = v13;
        if (!v13)
          goto LABEL_12;
      }
      self->_lastFocusedChildViewControllerColumn = v9;

    }
  }
LABEL_12:

LABEL_13:
  v14 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "effectiveUserInterfaceLayoutDirection");

  objc_msgSend(v21, "_focusMovement");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "_inputType") == 4)
  {
    if (v16)
      v18 = 8;
    else
      v18 = 4;
    v19 = objc_msgSend(v21, "focusHeading");

    v20 = v21;
    if (v19 == v18)
      *(_QWORD *)&self->_flags |= 0x80000000000uLL;
  }
  else
  {

    v20 = v21;
  }

}

- (id)_multitaskingDragExclusionRects
{
  void *v2;
  void *v3;

  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gatherMultitaskingDragExclusionRectsFromVisibleColumns");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_hasPreferredInterfaceOrientationForPresentation
{
  id WeakRetained;
  void *v4;
  char v5;

  if (dyld_program_sdk_at_least())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

- (CGRect)_frameForChildContentContainer:(id)a3
{
  id v4;
  void *v5;
  void *WeakRetained;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
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
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGRect result;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[UISplitViewControllerPanelImpl panelController](self, "panelController", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allViewControllers");
  WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(WeakRetained, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(WeakRetained);
        if (*(id *)(*((_QWORD *)&v24 + 1) + 8 * v10) == v4)
        {
          objc_msgSend(v4, "view");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "frame");
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(WeakRetained, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v8)
        continue;
      break;
    }
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
LABEL_11:
  v16 = v12;
  v17 = v13;
  v18 = v14;
  v19 = v15;

  v20 = v16;
  v21 = v17;
  v22 = v18;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (BOOL)_shouldPersistViewWhenCoding
{
  return 0;
}

- (BOOL)_optsOutOfPopoverControllerHierarchyCheck
{
  return 0;
}

- (UIEdgeInsets)_tvOSColumnStyleExtraInsetsForChildViewController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)_unspecifiedStyleChildViewControllersToSendViewWillTransitionToSize
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *WeakRetained;
  void *v8;

  if (!self->_lastNotifiedIsCollapsed)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "_super_childViewControllersToSendViewWillTransitionToSize");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

    return v3;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISplitViewControllerPanelImpl _currentPrimaryChildViewController](self, "_currentPrimaryChildViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainViewController");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    WeakRetained = (void *)v6;

LABEL_8:
    objc_msgSend(v3, "addObject:", WeakRetained);
    goto LABEL_9;
  }
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preservedDetailController");
  WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

  if (WeakRetained)
    goto LABEL_8;
  return v3;
}

- (id)_childViewControllersToSendViewWillTransitionToSize
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[6];

  if (-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    if (self->_lastNotifiedIsCollapsed
      && (-[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974A0), v3 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v3, "viewController"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v3, !v4))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __85__UISplitViewControllerPanelImpl__childViewControllersToSendViewWillTransitionToSize__block_invoke;
      v11[3] = &unk_1E16BE3C0;
      v11[4] = self;
      v9 = v8;
      v11[5] = v9;
      __85__UISplitViewControllerPanelImpl__childViewControllersToSendViewWillTransitionToSize__block_invoke((uint64_t)v11, 0);
      __85__UISplitViewControllerPanelImpl__childViewControllersToSendViewWillTransitionToSize__block_invoke((uint64_t)v11, 1);
      __85__UISplitViewControllerPanelImpl__childViewControllersToSendViewWillTransitionToSize__block_invoke((uint64_t)v11, 2);
      v10 = v9;

      return v10;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(WeakRetained, "_super_childViewControllersToSendViewWillTransitionToSize");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      return v6;
    }
  }
  else
  {
    -[UISplitViewControllerPanelImpl _unspecifiedStyleChildViewControllersToSendViewWillTransitionToSize](self, "_unspecifiedStyleChildViewControllersToSendViewWillTransitionToSize");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

void __85__UISplitViewControllerPanelImpl__childViewControllersToSendViewWillTransitionToSize__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v7)
  {
    objc_msgSend(v7, "navigationControllerWrapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6
      || (objc_msgSend(v7, "navigationController"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      || (objc_msgSend(v7, "viewController"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v5 = v7, v6))
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

      v5 = v7;
    }
  }

}

- (BOOL)_handlesCounterRotationForPresentation
{
  return 0;
}

- (id)_primaryContentResponder
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "detailViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setAllowsDimmedSecondaryAsDeepestUnambiguousResponder:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)_allowsDimmedSecondaryAsDeepestUnambiguousResponder
{
  return *((_BYTE *)&self->_flags + 3) & 1;
}

- (void)_setIgnoresSheetContext:(BOOL)a3
{
  uint64_t v3;

  if (((((*(_QWORD *)&self->_flags & 0x2000000) == 0) ^ a3) & 1) == 0)
  {
    v3 = 0x2000000;
    if (!a3)
      v3 = 0;
    self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFDFFFFFFLL | v3);
    -[UIPanelController setNeedsUpdate](self->_panelController, "setNeedsUpdate");
  }
}

- (BOOL)_ignoresSheetContext
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 1) & 1;
}

- (id)_deepestActionResponder
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  uint64_t VisibleColumnForResponderAfterColumn;
  void *v8;
  void *v9;
  void *v10;
  void *WeakRetained;
  uint64_t v12;
  void *v13;
  void *v14;

  v3 = -[UISplitViewControllerPanelImpl style](self, "style");
  -[UIPanelController currentState](self->_panelController, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_collapsedState");
  if (v3)
  {
    if (v5 == 2)
    {
      -[UIPanelController collapsedViewController](self->_panelController, "collapsedViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:
      if ((objc_msgSend(v9, "_hasDeepestActionResponder") & 1) != 0)
        goto LABEL_26;
      WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(WeakRetained, "_super_deepestActionResponder");
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_28:
      v14 = (void *)v12;

      goto LABEL_29;
    }
    if (!v5)
    {
      v6 = -[UISplitViewControllerPanelImpl _displayModeForState:](self, "_displayModeForState:", v4);
      if ((*((_BYTE *)&self->_flags + 3) & 1) != 0)
      {
        VisibleColumnForResponderAfterColumn = 2;
        if ((_UISplitViewControllerColumnIsVisibleForDisplayMode(v3, 2, v6) & 1) != 0)
          goto LABEL_15;
      }
      else
      {
        VisibleColumnForResponderAfterColumn = 2;
        if (!_UISplitViewControllerColumnIsHiddenOrDimmedForDisplayMode(v3, 2, v6))
        {
LABEL_15:
          v13 = 0;
          while ((objc_msgSend(v13, "_hasDeepestActionResponder") & 1) == 0)
          {
            -[UISplitViewControllerPanelImpl _topLevelViewControllerForColumn:]((uint64_t)self, VisibleColumnForResponderAfterColumn);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v9, "_hasDeepestActionResponder") & 1) == 0)
              VisibleColumnForResponderAfterColumn = _nextVisibleColumnForResponderAfterColumn(VisibleColumnForResponderAfterColumn, v3, v6);
            v13 = v9;
            if (VisibleColumnForResponderAfterColumn == 999)
              goto LABEL_25;
          }
          v9 = v13;
          goto LABEL_25;
        }
      }
      VisibleColumnForResponderAfterColumn = _nextVisibleColumnForResponderAfterColumn(2, v3, v6);
      if (VisibleColumnForResponderAfterColumn != 999)
        goto LABEL_15;
    }
LABEL_24:
    v9 = 0;
    goto LABEL_25;
  }
  -[UISplitViewControllerPanelImpl viewControllers](self, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "_hasDeepestActionResponder"))
  {
    if (!-[UISplitViewControllerPanelImpl isCollapsed](self, "isCollapsed"))
    {
      -[UISplitViewControllerPanelImpl viewControllers](self, "viewControllers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

      if (WeakRetained != v9 && (objc_msgSend(WeakRetained, "_hasDeepestActionResponder") & 1) != 0)
      {
        objc_msgSend(WeakRetained, "_deepestActionResponder");
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      }

    }
    goto LABEL_24;
  }
LABEL_26:
  objc_msgSend(v9, "_deepestActionResponder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:

  return v14;
}

- (id)_nextVisibleViewControllerForResponderAfterChildViewController:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t VisibleColumnForResponderAfterColumn;
  void *v13;
  id v14;

  v4 = a3;
  v5 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v5)
  {
    v6 = v5;
    v7 = 2;
    -[UISplitViewControllerPanelImpl _topLevelViewControllerForColumn:]((uint64_t)self, 2);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v4)
    {
      v7 = 1;
      -[UISplitViewControllerPanelImpl _topLevelViewControllerForColumn:]((uint64_t)self, 1);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9 != v4)
      {
        -[UISplitViewControllerPanelImpl _topLevelViewControllerForColumn:]((uint64_t)self, 0);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
          v7 = 0;
        else
          v7 = 999;
      }
    }
    -[UIPanelController currentState](self->_panelController, "currentState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    VisibleColumnForResponderAfterColumn = _nextVisibleColumnForResponderAfterColumn(v7, v6, -[UISplitViewControllerPanelImpl _displayModeForState:](self, "_displayModeForState:", v11));
    if (VisibleColumnForResponderAfterColumn == 999)
    {
      v13 = 0;
    }
    else
    {
      -[UISplitViewControllerPanelImpl _topLevelViewControllerForColumn:]((uint64_t)self, VisibleColumnForResponderAfterColumn);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else if (!-[UISplitViewControllerPanelImpl isCollapsed](self, "isCollapsed")
         && (-[UISplitViewControllerPanelImpl detailViewController](self, "detailViewController"),
             v14 = (id)objc_claimAutoreleasedReturnValue(),
             v14,
             v14 == v4))
  {
    -[UISplitViewControllerPanelImpl masterViewController](self, "masterViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)description
{
  void *v3;
  void *v4;
  unint64_t v6;
  void *v7;
  unint64_t preferredDisplayMode;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t preferredSplitBehavior;
  void *v13;
  id WeakRetained;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)UISplitViewControllerPanelImpl;
  -[UISplitViewControllerPanelImpl description](&v15, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (os_variant_has_internal_diagnostics())
  {
    v6 = -[UISplitViewControllerPanelImpl style](self, "style");
    _UISplitViewControllerStyleDescription(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" style=%@"), v7);

    if (v6)
    {
      objc_msgSend(v4, "appendFormat:", CFSTR(" columns=%p"), self->_perColumnViewControllers);
      preferredDisplayMode = self->_preferredDisplayMode;
      if (preferredDisplayMode)
      {
        _UISplitViewControllerDisplayModeDescription(preferredDisplayMode);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR(" preferredDisplayMode=%@"), v9);

      }
      v10 = -[UISplitViewControllerPanelImpl userGeneratedDisplayMode](self, "userGeneratedDisplayMode");
      if (v10)
      {
        _UISplitViewControllerDisplayModeDescription(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR(" userGeneratedDisplayMode=%@"), v11);

        if ((*(_BYTE *)&self->_flags & 0x40) != 0)
          objc_msgSend(v4, "appendString:", CFSTR("[strict]"));
      }
      preferredSplitBehavior = self->_preferredSplitBehavior;
      if (preferredSplitBehavior)
      {
        _UISplitViewControllerSplitBehaviorDescription(preferredSplitBehavior);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR(" preferredSplitBehavior=%@"), v13);

      }
    }
    if (self->_preferredPrimaryColumnWidth != -3.40282347e38)
      objc_msgSend(v4, "appendFormat:", CFSTR(" prefPrimaryColWidth=%g"), *(_QWORD *)&self->_preferredPrimaryColumnWidth);
    if (self->_preferredPrimaryColumnWidthFraction != -3.40282347e38)
      objc_msgSend(v4, "appendFormat:", CFSTR(" prefPrimaryColWidthFraction=%g"), *(_QWORD *)&self->_preferredPrimaryColumnWidthFraction);
    if (self->_minimumPrimaryColumnWidth != -3.40282347e38)
      objc_msgSend(v4, "appendFormat:", CFSTR(" minPrimaryColWidth=%g"), *(_QWORD *)&self->_minimumPrimaryColumnWidth);
    if (self->_maximumPrimaryColumnWidth != -3.40282347e38)
      objc_msgSend(v4, "appendFormat:", CFSTR(" maxPrimaryColWidth=%g"), *(_QWORD *)&self->_maximumPrimaryColumnWidth);
    if (v6)
    {
      if (self->_preferredSupplementaryColumnWidthFraction != -3.40282347e38)
        objc_msgSend(v4, "appendFormat:", CFSTR(" prefSupplementaryColWidthFraction=%g"), *(_QWORD *)&self->_preferredSupplementaryColumnWidthFraction);
      if (self->_preferredSupplementaryColumnWidth != -3.40282347e38)
        objc_msgSend(v4, "appendFormat:", CFSTR(" prefSupplementaryColWidth=%g"), *(_QWORD *)&self->_preferredSupplementaryColumnWidth);
      if (self->_minimumSupplementaryColumnWidth != -3.40282347e38)
        objc_msgSend(v4, "appendFormat:", CFSTR(" minSupplementaryColWidth=%g"), *(_QWORD *)&self->_minimumSupplementaryColumnWidth);
      if (self->_maximumSupplementaryColumnWidth != -3.40282347e38)
        objc_msgSend(v4, "appendFormat:", CFSTR(" maxSupplementaryColWidth=%g"), *(_QWORD *)&self->_maximumSupplementaryColumnWidth);
    }
    if (!-[UISplitViewControllerPanelImpl presentsWithGesture](self, "presentsWithGesture"))
      objc_msgSend(v4, "appendString:", CFSTR(" presentsWithGesture=NO"));
    if (-[UISplitViewControllerPanelImpl primaryEdge](self, "primaryEdge") == 1)
      objc_msgSend(v4, "appendString:", CFSTR(" primaryEdge=Trailing"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v4, "appendFormat:", CFSTR(" svc=%p"), WeakRetained);

    objc_msgSend(v4, "appendFormat:", CFSTR(" panelController=%p"), self->_panelController);
  }
  return (NSString *)v4;
}

- (id)_allContainedViewControllers
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _UISaveReferencedChildViewControllers(v6, 0);
  objc_msgSend(v4, "encodeInteger:forKey:", -[UISplitViewControllerPanelImpl _svcOrientation](self, "_svcOrientation"), CFSTR("SplitViewInterfaceOrientation"));
  v7 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v7, "displayMode"), CFSTR("SplitViewControllerDisplayMode"));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v13, "_restorationIdentifierPath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          if (_UIStateRestorationDebugLogEnabled())
            NSLog(CFSTR("%s: View Controller in SplitViewController doesn't have restoration identifier, skipping: %@"), "-[UISplitViewControllerPanelImpl encodeRestorableStateWithCoder:]", v13, (_QWORD)v15);
          objc_msgSend((id)UIApp, "ignoreSnapshotOnNextApplicationLaunch");
          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  int v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  int v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD block[6];

  v4 = a3;
  v5 = -[UISplitViewControllerPanelImpl _svcOrientation](self, "_svcOrientation");
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIApplicationStateRestorationUserInterfaceIdiom"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == (int)objc_msgSend(v8, "intValue"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "displayMode");

    if (v7 == 1)
      v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SplitViewControllerShowingMasterView"));
    else
      v10 = 0;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("SplitViewControllerDisplayMode"))
      && objc_msgSend(v4, "containsValueForKey:", CFSTR("SplitViewInterfaceOrientation")))
    {
      if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SplitViewInterfaceOrientation")) != v5)
        goto LABEL_31;
      v16 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SplitViewControllerDisplayMode"));
      goto LABEL_27;
    }
    if ((unint64_t)(v5 - 1) < 2)
      v17 = v10;
    else
      v17 = 0;
    if (v17 == 1)
    {
      v16 = 3;
LABEL_27:
      v18 = objc_loadWeakRetained((id *)&self->_svc);
      v19 = objc_msgSend(v18, "displayMode");

      if (v16 != v19)
      {
        v20 = objc_loadWeakRetained((id *)&self->_svc);
        objc_msgSend(v20, "_existingView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "window");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          -[UISplitViewControllerPanelImpl _changeToDisplayMode:fromPreferredDisplayMode:](self, "_changeToDisplayMode:fromPreferredDisplayMode:", v16, -[UISplitViewControllerPanelImpl preferredDisplayMode](self, "preferredDisplayMode"));
        }
        else
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __65__UISplitViewControllerPanelImpl_decodeRestorableStateWithCoder___block_invoke;
          block[3] = &unk_1E16B1888;
          block[4] = self;
          block[5] = v16;
          dispatch_async(MEMORY[0x1E0C80D38], block);
        }
      }
    }
  }
  else
  {
    if (v7)
      v11 = CFSTR("Unspecified");
    else
      v11 = CFSTR("iPhone");
    if (v7 == 1)
      v11 = CFSTR("iPad");
    v12 = v11;
    v13 = objc_msgSend(v8, "integerValue");
    if (v13)
      v14 = CFSTR("Unspecified");
    else
      v14 = CFSTR("iPhone");
    if (v13 == 1)
      v14 = CFSTR("iPad");
    v15 = v14;
    if (_UIStateRestorationDebugLogEnabled())
      NSLog(CFSTR("%s: Skipping check to set UISplitViewController display mode, state restoration archive was saved using a different user interface idiom. Current idiom is %@, idiom from restoration archive is %@"), "-[UISplitViewControllerPanelImpl decodeRestorableStateWithCoder:]", v12, v15);

  }
LABEL_31:

}

void __65__UISplitViewControllerPanelImpl_decodeRestorableStateWithCoder___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "_existingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "_changeToDisplayMode:fromPreferredDisplayMode:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "preferredDisplayMode"));
}

- (id)_effectiveActivityItemsConfiguration
{
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  _DWORD *v9;
  _DWORD *v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  _DWORD *v15;
  id v16;

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_super_effectiveActivityItemsConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (dyld_program_sdk_at_least())
    {
      v6 = objc_loadWeakRetained((id *)p_svc);
      v7 = objc_msgSend(v6, "style");

      v8 = v7 - 1;
      v9 = objc_loadWeakRetained((id *)p_svc);
      v10 = v9;
      if (v8 > 1)
      {
        objc_msgSend(v9, "viewControllers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastObject");
        v15 = (_DWORD *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v9, "viewControllerForColumn:", 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_loadWeakRetained((id *)p_svc);
        v13 = objc_msgSend(v12, "_isCollapsed");

        if (!v13)
        {
LABEL_12:
          objc_msgSend(v11, "_effectiveActivityItemsConfiguration");
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          return v5;
        }
        -[UISplitViewControllerPanelImpl panelController](self, "panelController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "collapsedViewController");
        v10 = (_DWORD *)objc_claimAutoreleasedReturnValue();

        if (!v10 || ((v10[92] >> 1) & 3u) - 1 > 1)
        {
LABEL_11:

          goto LABEL_12;
        }
        v15 = v10;
        v10 = v15;
      }
      v16 = v15;

      v11 = v16;
      goto LABEL_11;
    }
    v5 = 0;
  }
  return v5;
}

- (UISlidingBarConfiguration)configuration
{
  void *v2;
  void *v3;

  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UISlidingBarConfiguration *)v3;
}

- (UISlidingBarState)currentState
{
  void *v2;
  void *v3;

  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UISlidingBarState *)v3;
}

- (NSArray)possibleStates
{
  void *v2;
  void *v3;

  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "possibleStates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (UISlidingBarStateRequest)stateRequest
{
  void *v2;
  void *v3;

  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stateRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UISlidingBarStateRequest *)v3;
}

- (void)setStateRequest:(id)a3
{
  id v4;
  id v5;

  *(_QWORD *)&self->_flags |= 1uLL;
  v4 = a3;
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStateRequest:", v4);

}

- (void)animateToRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animateToRequest:", v4);

}

- (void)_updateSplitBehaviorOverridesForTransitionFromDisplayMode:(uint64_t)a1 toDisplayMode:(uint64_t)a2 shouldResizeIfNecessary:(uint64_t)a3
{
  uint64_t v6;
  id WeakRetained;
  int v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  double v20;
  uint8_t buf[8];

  if (a1)
  {
    v6 = objc_msgSend((id)a1, "style");
    if ((unint64_t)(v6 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v16 = v6;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      _UISplitViewControllerStyleDescription(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel__updateSplitBehaviorOverridesForTransitionFromDisplayMode_toDisplayMode_shouldResizeIfNecessary_, a1, CFSTR("UISplitViewControllerPanelImpl.m"), 5019, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v18);

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    v8 = _UISplitViewControllerAutoHidesColumns(WeakRetained);

    if (v8)
    {
      if (objc_msgSend((id)a1, "_isCollapsed"))
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_185066000, v19, OS_LOG_TYPE_FAULT, "shouldn't be transitioning display modes in collapsed UISVC", buf, 2u);
          }

        }
        else
        {
          v9 = _updateSplitBehaviorOverridesForTransitionFromDisplayMode_toDisplayMode_shouldResizeIfNecessary____s_category;
          if (!_updateSplitBehaviorOverridesForTransitionFromDisplayMode_toDisplayMode_shouldResizeIfNecessary____s_category)
          {
            v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v9, (unint64_t *)&_updateSplitBehaviorOverridesForTransitionFromDisplayMode_toDisplayMode_shouldResizeIfNecessary____s_category);
          }
          v10 = *(NSObject **)(v9 + 8);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "shouldn't be transitioning display modes in collapsed UISVC", buf, 2u);
          }
        }
LABEL_22:
        *(_QWORD *)(a1 + 288) &= 0xFFFFFFFFFFF3FFFFLL;
        return;
      }
      if (a2 == 1)
      {
        if (a3 == 2)
        {
LABEL_16:
          objc_msgSend(*(id *)(a1 + 424), "view");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "bounds");
          v13 = v12;
          v15 = v14;

          v20 = 0.0;
          *(_QWORD *)buf = 0;
          objc_msgSend((id)a1, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:", buf, &v20, a3, 1, 0, 0, v13, v15);
          if (objc_msgSend((id)a1, "_isSecondaryColumnCompactInTotalWidth:withPrimaryColumnWidth:supplementaryColumnWidth:", v13, *(double *)buf, v20))
          {
            *(_QWORD *)(a1 + 288) = *(_QWORD *)(a1 + 288) & 0xFFFFFFFFFFF3FFFFLL | 0x80000;
            if (a3 == 4)
            {
              objc_msgSend((id)a1, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:", buf, &v20, 2, 1, 0, 0, v13, v15);
              if ((objc_msgSend((id)a1, "_isSecondaryColumnCompactInTotalWidth:withPrimaryColumnWidth:supplementaryColumnWidth:", v13, *(double *)buf, v20) & 1) == 0)*(_QWORD *)(a1 + 288) |= 0xC0000uLL;
            }
            objc_msgSend((id)a1, "allowedDisplayModeForCurrentSplitBehaviorGivenDisplayMode:", a3);
          }
          return;
        }
      }
      else if (a2 != 2)
      {
        goto LABEL_21;
      }
      if (a3 == 4)
        goto LABEL_16;
LABEL_21:
      if ((unint64_t)(a3 - 1) > 1)
        return;
      goto LABEL_22;
    }
  }
}

- (void)_transitionFromDisplayMode:(int64_t)a3 toDisplayMode:(int64_t)a4
{
  -[UISplitViewControllerPanelImpl _transitionFromDisplayMode:toDisplayMode:updateSplitBehaviorOverrides:userGenerated:](self, "_transitionFromDisplayMode:toDisplayMode:updateSplitBehaviorOverrides:userGenerated:", a3, a4, 1, 1);
}

- (void)_transitionFromDisplayMode:(int64_t)a3 toDisplayMode:(int64_t)a4 updateSplitBehaviorOverrides:(BOOL)a5 userGenerated:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  char v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double MatchingState;
  id v25;
  void *v26;
  void *v27;
  NSMutableDictionary **p_perColumnViewControllers;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL8 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD v40[5];
  char v41;
  char v42;
  char v43;
  char v44;
  char v45;
  int v46;

  v6 = a6;
  v7 = a5;
  v12 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v12 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v12);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 5081, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v38);

  }
  if (a3 != a4)
  {
    if (v7)
      -[UISplitViewControllerPanelImpl _updateSplitBehaviorOverridesForTransitionFromDisplayMode:toDisplayMode:shouldResizeIfNecessary:]((uint64_t)self, a3, a4);
    v13 = -[UISplitViewControllerPanelImpl allowedDisplayModeForCurrentSplitBehaviorGivenDisplayMode:](self, "allowedDisplayModeForCurrentSplitBehaviorGivenDisplayMode:", a4);
    if (v13 != a3)
    {
      v14 = v13;
      if (v6)
        -[UISplitViewControllerPanelImpl setUserGeneratedDisplayMode:](self, "setUserGeneratedDisplayMode:", v13);
      v46 = 0;
      -[UISplitViewControllerPanelImpl _getPrimaryShown:supplementaryShown:shouldUseOverlay:dimMainIfNecessary:forDisplayMode:](self, "_getPrimaryShown:supplementaryShown:shouldUseOverlay:dimMainIfNecessary:forDisplayMode:", (char *)&v46 + 3, (char *)&v46 + 2, (char *)&v46 + 1, &v46, v14);
      v15 = BYTE1(v46);
      if (v14 == 1 && !BYTE1(v46))
      {
        v45 = 0;
        -[UISplitViewControllerPanelImpl _getPrimaryShown:supplementaryShown:shouldUseOverlay:dimMainIfNecessary:forDisplayMode:](self, "_getPrimaryShown:supplementaryShown:shouldUseOverlay:dimMainIfNecessary:forDisplayMode:", 0, 0, &v45, 0, a3);
        v15 = v45;
        BYTE1(v46) = v45;
      }
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __118__UISplitViewControllerPanelImpl__transitionFromDisplayMode_toDisplayMode_updateSplitBehaviorOverrides_userGenerated___block_invoke;
      v40[3] = &unk_1E16BFE10;
      v40[4] = self;
      v41 = HIBYTE(v46);
      v42 = BYTE2(v46);
      v43 = v15;
      v44 = v46;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v40);
      v16 = -[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading");
      -[UISplitViewControllerPanelImpl panelController](self, "panelController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "uncachedPossibleStates");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[UISplitViewControllerPanelImpl panelController](self, "panelController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "currentState");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stateRequest");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "setUserInitiated:", v6);
      if (HIBYTE(v46))
      {
        v22 = minNonzeroPrimaryWidthInStates(v18, v16);
        if ((v16 & 1) != 0)
        {
          objc_msgSend(v21, "setLeadingWidth:", v22);
          if (!BYTE2(v46))
            goto LABEL_24;
          goto LABEL_18;
        }
        objc_msgSend(v21, "setTrailingWidth:", v22);
        if (BYTE2(v46))
          goto LABEL_20;
      }
      else
      {
        objc_msgSend(v21, "setLeadingWidth:", 0.0);
        objc_msgSend(v21, "setTrailingWidth:", 0.0);
        if (BYTE2(v46))
        {
          if (v16)
          {
LABEL_18:
            objc_msgSend(v21, "leadingWidth");
LABEL_21:
            v39 = 0;
            MatchingState = minNonzeroSupplementaryWidthInStateWithPrimaryWidthGetMatchingState(v18, v16, &v39, v23);
            v25 = v39;
            v26 = v25;
            if (v25)
            {
              objc_msgSend(v25, "mainWidth");
              objc_msgSend(v21, "setMainWidth:");
            }
            objc_msgSend(v21, "setSupplementaryWidth:", MatchingState);

LABEL_25:
            if (-[UISplitViewControllerPanelImpl _alwaysHideSidebarToggleButton](self, "_alwaysHideSidebarToggleButton"))
            {
              goto LABEL_26;
            }
            if (v12 == 2
              && (p_perColumnViewControllers = &self->_perColumnViewControllers,
                  -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488), v29 = (void *)objc_claimAutoreleasedReturnValue(), v29, v29))
            {
              v30 = &unk_1E1A974B8;
            }
            else
            {
              if (BYTE1(v46))
              {
                v27 = 0;
                goto LABEL_34;
              }
              p_perColumnViewControllers = &self->_perColumnViewControllers;
              v30 = &unk_1E1A97470;
            }
            -[NSMutableDictionary objectForKeyedSubscript:](*p_perColumnViewControllers, "objectForKeyedSubscript:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "navigationController");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "navigationBar");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_34:
            if (!objc_msgSend(v27, "_hasBackButton")
              || !-[UIBarButtonItem _actsAsFakeBackButton](self->_sidebarToggleButtonItem, "_actsAsFakeBackButton"))
            {
              goto LABEL_37;
            }

LABEL_26:
            v27 = 0;
LABEL_37:
            -[UISplitViewControllerPanelImpl panelController](self, "panelController");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setNavigationBarForContentLayoutGuideAnimation:", v27);

            v34 = -[UISplitViewControllerPanelImpl _allowClientAnimationCoordination](self, "_allowClientAnimationCoordination");
            -[UISplitViewControllerPanelImpl panelController](self, "panelController");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setAnimationRequestShouldCoordinate:", v34);

            -[UISplitViewControllerPanelImpl panelController](self, "panelController");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "animateToRequest:", v21);

            return;
          }
LABEL_20:
          objc_msgSend(v21, "trailingWidth");
          goto LABEL_21;
        }
      }
LABEL_24:
      objc_msgSend(v21, "setSupplementaryWidth:", 0.0);
      goto LABEL_25;
    }
  }
}

uint64_t __118__UISplitViewControllerPanelImpl__transitionFromDisplayMode_toDisplayMode_updateSplitBehaviorOverrides_userGenerated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPanelConfigurationWithIsPrimaryShown:isSupplementaryShown:shouldUseOverlay:dimMainIfNecessary:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41), *(unsigned __int8 *)(a1 + 42), *(unsigned __int8 *)(a1 + 43));
}

- (CGSize)_screenSize
{
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v5, "_screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v4;
  else
    v7 = v6;
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (double)_defaultMaximumPrimaryColumnWidthForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  _BOOL4 v14;
  _BOOL4 v15;
  double v16;
  id v17;
  int v18;
  double v19;
  id v20;
  uint64_t v21;
  double v22;
  id WeakRetained;
  uint64_t v25;

  height = a3.height;
  width = a3.width;
  if (-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    -[UISplitViewControllerPanelImpl styleProvider](self, "styleProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "defaultMaximumWidthForColumn:withSize:splitBehavior:", 0, -[UISplitViewControllerPanelImpl splitBehavior](self, "splitBehavior"), width, height);
    v8 = v7;

    return v8;
  }
  else
  {
    -[UISplitViewControllerPanelImpl _screenSize](self, "_screenSize");
    if (v10 >= v11)
      v12 = v10;
    else
      v12 = v11;
    v13 = -[UISplitViewControllerPanelImpl _svcOrientation](self, "_svcOrientation") - 3;
    v14 = v12 <= 1112.0;
    if (v12 > 1210.0)
      v14 = 1;
    if (v14)
      v15 = v12 > 1210.0;
    else
      v15 = v13 < 2;
    if (v15)
      v16 = 375.0;
    else
      v16 = 320.0;
    if (dyld_program_sdk_at_least())
    {
      if (v13 <= 1)
      {
        if (width <= v12 * 0.5)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
          v25 = objc_msgSend(WeakRetained, "displayMode");

          if (v25 == 2)
            return 320.0;
          else
            return 375.0;
        }
        else if (width <= v12 - v16)
        {
          if (v12 <= 1210.0)
            return 320.0;
          else
            return 375.0;
        }
        else
        {
          v17 = objc_loadWeakRetained((id *)&self->_svc);
          v18 = objc_msgSend(v17, "_usesExtraWidePrimaryColumn");

          v19 = 414.0;
          if (!v15)
            v19 = 375.0;
          if (v18)
            return v19;
        }
      }
    }
    else
    {
      v20 = objc_loadWeakRetained((id *)&self->_svc);
      v21 = objc_msgSend(v20, "preferredDisplayMode");

      if (v21 == 2)
      {
        v22 = round(width * 0.38);
        if (width <= v12 * 0.5)
        {
          return v22;
        }
        else if (width > v12 - v16 && v13 < 0xFFFFFFFFFFFFFFFELL)
        {
          return v22;
        }
      }
    }
    return v16;
  }
}

- (double)_defaultMaximumSupplementaryColumnWidthForSize:(CGSize)a3
{
  double height;
  double width;
  int64_t v7;
  void *v8;
  double v9;
  double v10;
  unint64_t v12;
  void *v13;
  void *v14;

  height = a3.height;
  width = a3.width;
  v7 = -[UISplitViewControllerPanelImpl style](self, "style");
  if ((unint64_t)(v7 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v12 = v7;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 5316, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v14);

  }
  -[UISplitViewControllerPanelImpl styleProvider](self, "styleProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultMaximumWidthForColumn:withSize:splitBehavior:", 1, -[UISplitViewControllerPanelImpl splitBehavior](self, "splitBehavior"), width, height);
  v10 = v9;

  return v10;
}

- (double)_primaryColumnWidthForSize:(CGSize)a3 shouldUseOverlay:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  id WeakRetained;
  double v9;
  double v10;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  -[UISplitViewControllerPanelImpl _primaryColumnWidthForSize:isCompact:shouldUseOverlay:](self, "_primaryColumnWidthForSize:isCompact:shouldUseOverlay:", objc_msgSend(WeakRetained, "_horizontalSizeClass") == 1, v4, width, height);
  v10 = v9;

  return v10;
}

- (void)getPrimaryColumnWidth:(double *)a3 supplementaryColumnWidth:(double *)a4 forSize:(CGSize)a5 displayMode:(int64_t)a6 shouldUseOverlay:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  id WeakRetained;

  v7 = a7;
  height = a5.height;
  width = a5.width;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  -[UISplitViewControllerPanelImpl getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:isCompact:shouldUseOverlay:](self, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:isCompact:shouldUseOverlay:", a3, a4, a6, objc_msgSend(WeakRetained, "_horizontalSizeClass") == 1, v7, width, height);

}

- (double)_primaryColumnWidthForSize:(CGSize)a3 isCompact:(BOOL)a4 shouldUseOverlay:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  int64_t v11;
  UISplitViewController **p_svc;
  id WeakRetained;
  double v14;
  _BOOL4 v15;
  id v16;
  double v17;
  double v18;
  int v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  double v26;
  double v28;
  id v29;
  double v30;
  double v31;
  id v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;
  double v40;
  id v41;
  double v42;
  double v43;
  id v44;
  double v45;
  id v46;
  double v47;
  unint64_t v49;
  void *v50;
  void *v51;

  v5 = a5;
  height = a3.height;
  width = a3.width;
  v11 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v11)
  {
    v49 = v11;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 5352, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v51);

    if (a4)
      return width;
  }
  else if (a4)
  {
    return width;
  }
  if (!dyld_program_sdk_at_least())
    return 320.0;
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "preferredPrimaryColumnWidthFraction");
  v15 = v14 != -3.40282347e38;

  v16 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v16, "_preferredPrimaryColumnWidth");
  v18 = v17;

  v19 = v18 != -3.40282347e38 || v15;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "userInterfaceIdiom");

  if ((v21 & 0xFFFFFFFFFFFFFFFBLL) != 1 || !dyld_program_sdk_at_least())
  {
    if (-[UISplitViewControllerPanelImpl _currentInterfaceIdiom](self, "_currentInterfaceIdiom")
      || ((dyld_program_sdk_at_least() ^ 1 | v19) & 1) != 0)
    {
      if (height <= 1210.0 && width <= 1210.0)
        v23 = 320.0;
      else
        v23 = 375.0;
      if (v18 == -3.40282347e38)
      {
        if (v19)
        {
          v29 = objc_loadWeakRetained((id *)&self->_svc);
          objc_msgSend(v29, "preferredPrimaryColumnWidthFraction");
          v31 = v30;

        }
        else
        {
          v31 = 0.4;
        }
        width = ceil(width * v31);
        goto LABEL_37;
      }
      v24 = objc_loadWeakRetained((id *)&self->_svc);
      v25 = v24;
      goto LABEL_23;
    }
    if (v5)
      v23 = 375.0;
    else
      v23 = 320.0;
LABEL_31:
    v32 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v32, "viewIfLoaded");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "safeAreaInsets");
    v35 = v34;
    v37 = v36;

    if (-[UISplitViewControllerPanelImpl _layoutPrimaryOnRight](self, "_layoutPrimaryOnRight"))
      v38 = v37;
    else
      v38 = v35;
    width = v23 + v38;
    v23 = v23 + v38;
    goto LABEL_37;
  }
  -[UISplitViewControllerPanelImpl _defaultMaximumPrimaryColumnWidthForSize:](self, "_defaultMaximumPrimaryColumnWidthForSize:", width, height);
  v23 = v22;
  if (!v19)
  {
    width = v22;
    if (!dyld_program_sdk_at_least())
      goto LABEL_37;
    goto LABEL_31;
  }
  v24 = objc_loadWeakRetained((id *)&self->_svc);
  v25 = v24;
  if (v18 != -3.40282347e38)
  {
LABEL_23:
    objc_msgSend(v24, "_preferredPrimaryColumnWidth");
    width = v28;
    goto LABEL_24;
  }
  objc_msgSend(v24, "preferredPrimaryColumnWidthFraction");
  width = ceil(width * v26);
LABEL_24:

LABEL_37:
  v39 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v39, "minimumPrimaryColumnWidth");
  if (v40 == -3.40282347e38)
  {
    v43 = 0.0;
  }
  else
  {
    v41 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v41, "minimumPrimaryColumnWidth");
    v43 = v42;

  }
  if (v43 >= width)
    width = v43;
  v44 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v44, "maximumPrimaryColumnWidth");
  if (v45 != -3.40282347e38)
  {
    v46 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v46, "maximumPrimaryColumnWidth");
    v23 = v47;

  }
  if (v23 < width)
    return v23;
  return width;
}

- (void)getPrimaryColumnWidth:(double *)a3 supplementaryColumnWidth:(double *)a4 forSize:(CGSize)a5 displayMode:(int64_t)a6 isCompact:(BOOL)a7 shouldUseOverlay:(BOOL)a8
{
  -[UISplitViewControllerPanelImpl getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:](self, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:", a3, a4, a6, -[UISplitViewControllerPanelImpl splitBehavior](self, "splitBehavior"), a7, a8, a5.width, a5.height);
}

- (void)getPrimaryColumnWidth:(double *)a3 supplementaryColumnWidth:(double *)a4 forSize:(CGSize)a5 displayMode:(int64_t)a6 splitBehavior:(int64_t)a7 isCompact:(BOOL)a8 shouldUseOverlay:(BOOL)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  double height;
  CGFloat width;
  unint64_t v19;
  id WeakRetained;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _BOOL4 v28;
  int v29;
  double v30;
  double v31;
  BOOL v32;
  double v33;
  double v34;
  double v35;
  double v36;
  _BOOL4 v37;
  double v38;
  double v39;
  BOOL v40;
  _BOOL4 v41;
  int64_t v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  char v50;
  double v51;
  double v52;
  double v53;
  double v54;
  id v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  int v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  _BOOL4 v79;
  double v80;
  double v81;
  double *v82;
  double v83;
  id v84;
  id v85;
  CGRect v86;

  v9 = a9;
  v10 = a8;
  height = a5.height;
  width = a5.width;
  v19 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v19 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v19);
    v85 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 5444, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v85);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "viewIfLoaded");
  v84 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v84, "safeAreaInsets");
  v22 = v21;
  v24 = v23;
  if (-[UISplitViewControllerPanelImpl _layoutPrimaryOnRight](self, "_layoutPrimaryOnRight"))
    v22 = v24;
  if (v84)
  {
    objc_msgSend(v84, "bounds");
    v25 = CGRectGetWidth(v86);
    if (v10)
      goto LABEL_7;
  }
  else
  {
    v25 = 736.0;
    if (v10)
    {
LABEL_7:
      v26 = 0.0;
      if (v19 == 2)
        v26 = width;
      goto LABEL_111;
    }
  }
  v79 = v9;
  v82 = a4;
  v28 = a6 == 6 || (a6 & 0xFFFFFFFFFFFFFFFELL) == 4;
  v29 = v19 != 2 || v28;
  -[UISplitViewControllerPanelImpl preferredPrimaryColumnWidth](self, "preferredPrimaryColumnWidth");
  v31 = v30;
  v32 = v30 == -3.40282347e38;
  -[UISplitViewControllerPanelImpl preferredPrimaryColumnWidthFraction](self, "preferredPrimaryColumnWidthFraction");
  v34 = v33;
  -[UISplitViewControllerPanelImpl preferredSupplementaryColumnWidth](self, "preferredSupplementaryColumnWidth");
  v36 = v35;
  v37 = v35 == -3.40282347e38;
  -[UISplitViewControllerPanelImpl preferredSupplementaryColumnWidthFraction](self, "preferredSupplementaryColumnWidthFraction");
  v39 = v38;
  v40 = v34 == -3.40282347e38 && v32;
  v41 = v38 == -3.40282347e38 && v37;
  v42 = -[UISplitViewControllerPanelImpl _currentInterfaceIdiom](self, "_currentInterfaceIdiom");
  -[UISplitViewControllerPanelImpl styleProvider](self, "styleProvider");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "defaultMaximumWidthForColumn:withSize:splitBehavior:", 0, a7, width, height);
  v83 = v44;

  -[UISplitViewControllerPanelImpl styleProvider](self, "styleProvider");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "defaultMaximumWidthForColumn:withSize:splitBehavior:", 1, a7, width, height);
  v47 = v46;

  if (v19 == 2 || !v29)
  {
    v49 = v25 - v22;
    if (v19 == 2)
      v50 = v29;
    else
      v50 = 1;
    if ((v50 & 1) != 0)
    {
      if (!v42)
      {
        v48 = 320.0;
        if (v49 + -320.0 + -375.0 <= 50.0)
          v36 = 320.0;
        else
          v36 = 375.0;
        v80 = 320.0;
        v81 = v36;
        goto LABEL_68;
      }
      v51 = ceil(width * v34);
      if (v34 == -3.40282347e38)
        v51 = v83;
      if (v31 == -3.40282347e38)
        v52 = v51;
      else
        v52 = v31;
      v80 = v52;
      v81 = v47;
      if (v41)
      {
        v36 = v47;
LABEL_67:
        v48 = v83;
        goto LABEL_68;
      }
    }
    else
    {
      if (!v42)
      {
        if (v49 + -320.0 + -375.0 <= 50.0)
          v36 = 320.0;
        else
          v36 = 375.0;
        v80 = 0.0;
        v81 = v36;
        goto LABEL_67;
      }
      v81 = v47;
      if (v41)
      {
        if (v40)
        {
          v36 = v47;
        }
        else
        {
          v77 = ceil(width * v34);
          if (v31 == -3.40282347e38)
            v36 = v77;
          else
            v36 = v31;
        }
        v48 = v83;
        v80 = 0.0;
        goto LABEL_68;
      }
      v80 = 0.0;
    }
    v54 = ceil(width * v39);
    if (v36 == -3.40282347e38)
      v36 = v54;
    goto LABEL_67;
  }
  v81 = v47;
  if (!v42 && !-[UISplitViewControllerPanelImpl _usesExtraWidePrimaryColumn](self, "_usesExtraWidePrimaryColumn"))
  {
    if (v79)
      v48 = 375.0;
    else
      v48 = 320.0;
    v36 = 0.0;
    goto LABEL_55;
  }
  v36 = 0.0;
  if (!v40)
  {
    v53 = ceil(width * v34);
    if (v31 != -3.40282347e38)
      v53 = v31;
    v80 = v53;
    goto LABEL_67;
  }
  v48 = v83;
LABEL_55:
  v80 = v48;
LABEL_68:
  v55 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v55, "viewIfLoaded");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "safeAreaInsets");
  v58 = v57;
  v60 = v59;

  if (-[UISplitViewControllerPanelImpl _layoutPrimaryOnRight](self, "_layoutPrimaryOnRight"))
    v61 = v60;
  else
    v61 = v58;
  if (v19 == 2)
    v62 = v29;
  else
    v62 = 1;
  if (v62)
    v63 = -0.0;
  else
    v63 = v61;
  v64 = v36 + v63;
  -[UISplitViewControllerPanelImpl minimumPrimaryColumnWidth](self, "minimumPrimaryColumnWidth");
  v66 = v65;
  -[UISplitViewControllerPanelImpl minimumSupplementaryColumnWidth](self, "minimumSupplementaryColumnWidth");
  if (v67 == -3.40282347e38)
    v67 = 0.0;
  if (v67 < v64 || v19 != 2)
    v69 = v64;
  else
    v69 = v67;
  -[UISplitViewControllerPanelImpl maximumPrimaryColumnWidth](self, "maximumPrimaryColumnWidth");
  v71 = v70;
  -[UISplitViewControllerPanelImpl maximumSupplementaryColumnWidth](self, "maximumSupplementaryColumnWidth");
  if (v26 == -3.40282347e38)
    v26 = v81;
  if (v26 >= v69)
    v26 = v69;
  if (v19 != 2)
    v26 = v69;
  if (v29)
    v72 = v61;
  else
    v72 = -0.0;
  v73 = v80 + v72;
  if (v66 == -3.40282347e38)
    v74 = 0.0;
  else
    v74 = v66;
  if (v74 < v73)
    v74 = v73;
  if (v29)
    v75 = v74;
  else
    v75 = v73;
  if (v71 == -3.40282347e38)
    v76 = v48;
  else
    v76 = v71;
  if (v76 < v75)
    v74 = v76;
  if (v29)
    width = v74;
  else
    width = v73;
  a4 = v82;
LABEL_111:
  if (a3)
    *a3 = width;
  if (a4)
    *a4 = v26;

}

- (id)_hiddenColumnsInCurrentEnvironmentWithConcreteDisplayMode:(int64_t)a3
{
  unint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v6 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 5700, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v15);

  }
  v7 = (id)MEMORY[0x1E0C9AA60];
  if ((unint64_t)(a3 - 4) >= 3)
  {
    if ((unint64_t)(a3 - 2) < 2)
    {
      v8 = &unk_1E1A93218;
      if (v6 != 2)
        v8 = (void *)MEMORY[0x1E0C9AA60];
LABEL_11:
      v7 = v8;
      return v7;
    }
    if (a3 == 1)
    {
      v8 = &unk_1E1A93200;
      if (v6 == 2)
        v8 = &unk_1E1A931E8;
      goto LABEL_11;
    }
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        goto LABEL_18;
      _UISplitViewControllerDisplayModeDescription(a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v12;
      _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Unrecognized UISplitViewControllerDisplayMode, %@, for determining hidden columns", buf, 0xCu);
    }
    else
    {
      v9 = _hiddenColumnsInCurrentEnvironmentWithConcreteDisplayMode____s_category;
      if (!_hiddenColumnsInCurrentEnvironmentWithConcreteDisplayMode____s_category)
      {
        v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v9, (unint64_t *)&_hiddenColumnsInCurrentEnvironmentWithConcreteDisplayMode____s_category);
      }
      v10 = *(NSObject **)(v9 + 8);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      v11 = v10;
      _UISplitViewControllerDisplayModeDescription(a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v12;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Unrecognized UISplitViewControllerDisplayMode, %@, for determining hidden columns", buf, 0xCu);
    }

LABEL_18:
LABEL_19:
    v7 = 0;
  }
  return v7;
}

- (void)_getPrimaryShown:(BOOL *)a3 shouldUseOverlay:(BOOL *)a4
{
  int64_t v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  BOOL v14;
  int64_t v15;
  char v16;
  unint64_t v17;
  void *v18;
  void *v19;

  v8 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v8)
  {
    v17 = v8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 5737, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v19);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  v12 = objc_loadWeakRetained((id *)&self->_svc);
  v13 = objc_msgSend(v12, "preferredDisplayMode");

  switch(v13)
  {
    case 1:
      if (v11 == 1)
        goto LABEL_16;
      if (v11)
        goto LABEL_13;
      goto LABEL_14;
    case 2:
LABEL_13:
      LOBYTE(v11) = 0;
      goto LABEL_16;
    case 3:
      LOBYTE(v11) = 1;
      goto LABEL_16;
  }
  if (!v11)
  {
LABEL_14:
    v14 = -[UISplitViewControllerPanelImpl _iPhoneShouldUseOverlayInCurrentEnvironment](self, "_iPhoneShouldUseOverlayInCurrentEnvironment");
    goto LABEL_15;
  }
  if (v11 != 1)
    goto LABEL_13;
  v14 = -[UISplitViewControllerPanelImpl _iPadShouldUseOverlayInCurrentEnvironment](self, "_iPadShouldUseOverlayInCurrentEnvironment");
LABEL_15:
  LOBYTE(v11) = v14;
LABEL_16:
  v15 = -[UISplitViewControllerPanelImpl _primaryHidingState](self, "_primaryHidingState");
  if (v15 != 2)
  {
    if (v15)
    {
      v16 = 0;
      if (!a3)
        goto LABEL_24;
    }
    else
    {
      v16 = v11 ^ 1;
      if (!a3)
        goto LABEL_24;
    }
LABEL_23:
    *a3 = v16;
    goto LABEL_24;
  }
  v16 = 1;
  if (a3)
    goto LABEL_23;
LABEL_24:
  if (a4)
    *a4 = v11;
}

- (void)_getPrimaryShown:(BOOL *)a3 supplementaryShown:(BOOL *)a4 shouldUseOverlay:(BOOL *)a5 dimMainIfNecessary:(BOOL *)a6 forDisplayMode:(int64_t)a7
{
  unint64_t v14;
  BOOL v15;
  BOOL v16;
  int64_t v17;
  BOOL v19;
  BOOL v20;
  BOOL v22;
  unint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v14 = -[UISplitViewControllerPanelImpl style](self, "style");
  v15 = v14 == 2;
  if (v14 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v14);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 5801, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v28);

  }
  if ((unint64_t)(a7 - 4) < 3)
  {
    v15 = 1;
    v16 = 1;
    if (!a3)
      goto LABEL_9;
    goto LABEL_8;
  }
  if ((unint64_t)(a7 - 2) < 2)
  {
    v16 = v14 != 2;
    if (!a3)
      goto LABEL_9;
LABEL_8:
    *a3 = v16;
    goto LABEL_9;
  }
  if (a7 != 1)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        goto LABEL_42;
      _UISplitViewControllerDisplayModeDescription(a7);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v26;
      _os_log_fault_impl(&dword_185066000, v25, OS_LOG_TYPE_FAULT, "unknown display mode: %@", buf, 0xCu);
LABEL_41:

LABEL_42:
      goto LABEL_43;
    }
    v23 = _getPrimaryShown_supplementaryShown_shouldUseOverlay_dimMainIfNecessary_forDisplayMode____s_category;
    if (!_getPrimaryShown_supplementaryShown_shouldUseOverlay_dimMainIfNecessary_forDisplayMode____s_category)
    {
      v23 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v23, (unint64_t *)&_getPrimaryShown_supplementaryShown_shouldUseOverlay_dimMainIfNecessary_forDisplayMode____s_category);
    }
    v24 = *(NSObject **)(v23 + 8);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = v24;
      _UISplitViewControllerDisplayModeDescription(a7);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v26;
      _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "unknown display mode: %@", buf, 0xCu);
      goto LABEL_41;
    }
  }
LABEL_43:
  v15 = 0;
  v16 = 0;
  if (a3)
    goto LABEL_8;
LABEL_9:
  if (a4)
    *a4 = v15;
  v17 = -[UISplitViewControllerPanelImpl splitBehavior](self, "splitBehavior");
  if (-[UISplitViewControllerPanelImpl presentsWithGesture](self, "presentsWithGesture")
    || !-[UISplitViewControllerPanelImpl _visibleToggleButtonRequiresPresentsWithGesture](self, "_visibleToggleButtonRequiresPresentsWithGesture"))
  {
    v19 = a7 == 3 || v17 == 2;
    v20 = v17 == 3;
  }
  else
  {
    v19 = a7 == 3 || a7 == 5;
    v20 = a7 == 6;
  }
  v22 = v20;
  if (a5)
    *a5 = v19;
  if (a6)
    *a6 = v22;
}

- (void)_getPrimaryShown:(BOOL *)a3 supplementaryShown:(BOOL *)a4 shouldUseOverlay:(BOOL *)a5 dimMainIfNecessary:(BOOL *)a6
{
  int64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;

  v12 = -[UISplitViewControllerPanelImpl style](self, "style");
  if ((unint64_t)(v12 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 5851, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v15);

  }
  -[UISplitViewControllerPanelImpl _getPrimaryShown:supplementaryShown:shouldUseOverlay:dimMainIfNecessary:forDisplayMode:](self, "_getPrimaryShown:supplementaryShown:shouldUseOverlay:dimMainIfNecessary:forDisplayMode:", a3, a4, a5, a6, -[UISplitViewControllerPanelImpl _concreteDisplayModeForCurrentEnvironment](self, "_concreteDisplayModeForCurrentEnvironment"));
}

- (int64_t)validDisplayModeWithAllColumns
{
  int64_t v4;
  unint64_t v5;
  void *v6;
  UISplitViewControllerPanelImpl *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = -[UISplitViewControllerPanelImpl style](self, "style");
  v5 = v4;
  if ((unint64_t)(v4 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 5857, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v10);

LABEL_6:
    v7 = self;
    v8 = 2;
    return -[UISplitViewControllerPanelImpl allowedDisplayModeForCurrentSplitBehaviorGivenDisplayMode:](v7, "allowedDisplayModeForCurrentSplitBehaviorGivenDisplayMode:", v8);
  }
  if (v4 != 2)
    goto LABEL_6;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_6;
  v7 = self;
  v8 = 4;
  return -[UISplitViewControllerPanelImpl allowedDisplayModeForCurrentSplitBehaviorGivenDisplayMode:](v7, "allowedDisplayModeForCurrentSplitBehaviorGivenDisplayMode:", v8);
}

- (double)panelController:(id)a3 expectedWidthForColumnForViewController:(id)a4
{
  id v5;
  double v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  BOOL v10;
  double *v11;
  double *v12;
  id WeakRetained;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  _BOOL8 v20;
  unsigned __int8 v22;
  double v23;

  v5 = a4;
  v23 = 0.0;
  v6 = 0.0;
  if (-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    v7 = -[UISplitViewControllerPanelImpl _columnForViewController:](self, "_columnForViewController:", v5);
    if (v7 <= 1)
    {
      v8 = v7;
      v9 = -[UISplitViewControllerPanelImpl validDisplayModeWithAllColumns](self, "validDisplayModeWithAllColumns");
      v22 = 0;
      -[UISplitViewControllerPanelImpl _getPrimaryShown:supplementaryShown:shouldUseOverlay:dimMainIfNecessary:forDisplayMode:](self, "_getPrimaryShown:supplementaryShown:shouldUseOverlay:dimMainIfNecessary:forDisplayMode:", 0, 0, &v22, 0, v9);
      v10 = v8 == 0;
      if (v8)
        v11 = 0;
      else
        v11 = &v23;
      if (v10)
        v12 = 0;
      else
        v12 = &v23;
      WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(WeakRetained, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bounds");
      v16 = v15;
      v18 = v17;
      v19 = objc_loadWeakRetained((id *)&self->_svc);
      v20 = objc_msgSend(v19, "_horizontalSizeClass") == 1;
      -[UISplitViewControllerPanelImpl getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:isCompact:shouldUseOverlay:](self, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:isCompact:shouldUseOverlay:", v11, v12, v9, v20, v22, v16, v18);

      v6 = v23;
    }
  }

  return v6;
}

- (id)_newBarContentAnimationClippingView
{
  UIView *v2;

  v2 = objc_alloc_init(UIView);
  -[UIView setClipsToBounds:](v2, "setClipsToBounds:", 1);
  return v2;
}

UISlidingBarStateRequest *__60__UISplitViewControllerPanelImpl_panelControllerWillUpdate___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  UISlidingBarStateRequest *v18;
  int v19;
  _BYTE *v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  UISlidingBarStateRequest *v26;
  UISlidingBarStateRequest *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double MatchingState;
  id v37;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v6 + 208))
  {
    v7 = *(void **)(v6 + 144);
    if (v7)
    {
      v8 = v7;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "traitCollection");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    v10 = *(_QWORD *)(a1 + 32);
    if ((*(_BYTE *)(v10 + 289) & 1) != 0)
    {
      v13 = *(double *)(v10 + 160);
      v15 = *(double *)(v10 + 168);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_existingView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      v13 = v12;
      v15 = v14;

      v10 = *(_QWORD *)(a1 + 32);
    }
    if (objc_msgSend(v9, "isEqual:", *(_QWORD *)(v10 + 184)))
    {
      v16 = *(_QWORD *)(a1 + 32);
      if (v13 == *(double *)(v16 + 192) && v15 == *(double *)(v16 + 200))
      {
        if (a3)
        {
          *a3 = 1;
          v16 = *(_QWORD *)(a1 + 32);
        }
        v18 = (UISlidingBarStateRequest *)*(id *)(v16 + 208);
        goto LABEL_62;
      }
    }

  }
  if (a3)
    *a3 = 0;
  v18 = objc_alloc_init(UISlidingBarStateRequest);
  -[UISlidingBarStateRequest setUserInitiated:](v18, "setUserInitiated:", 0);
  if (*(_BYTE *)(a1 + 48) || *(_BYTE *)(a1 + 49) || *(_BYTE *)(a1 + 50) || *(_BYTE *)(a1 + 51))
  {
    v19 = objc_msgSend(*(id *)(a1 + 32), "_isPrimaryLeading");
    if (*(_BYTE *)(a1 + 48) || *(_BYTE *)(a1 + 50))
    {
      v20 = *(_BYTE **)(a1 + 32);
      v21 = 0.0;
      if ((v20[288] & 1) != 0 && !*(_BYTE *)(a1 + 52))
      {
        objc_msgSend(v20, "panelController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "currentState");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
          objc_msgSend(v23, "leadingWidth");
        else
          objc_msgSend(v23, "trailingWidth");
        v25 = v24;
        if (v24 > 0.0 || (v25 = *(double *)(*(_QWORD *)(a1 + 32) + 296), v25 > 0.0))
        {
          if (v25 <= 0.0)
          {
            v21 = v25;
          }
          else
          {
            v26 = objc_alloc_init(UISlidingBarStateRequest);
            v27 = v26;
            if (v19)
            {
              -[UISlidingBarStateRequest setLeadingWidth:](v26, "setLeadingWidth:", v25);
              -[UISlidingBarStateRequest _closestState:](v27, "_closestState:", v5);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "leadingWidth");
            }
            else
            {
              -[UISlidingBarStateRequest setTrailingWidth:](v26, "setTrailingWidth:", v25);
              -[UISlidingBarStateRequest _closestState:](v27, "_closestState:", v5);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "trailingWidth");
            }
            v21 = v29;

          }
        }

      }
      v30 = minNonzeroPrimaryWidthInStates(v5, v19);
      if (v21 >= v30)
        v30 = v21;
      if (v19)
      {
        if (*(_BYTE *)(a1 + 48))
        {
          -[UISlidingBarStateRequest setLeadingWidth:](v18, "setLeadingWidth:", v30);
        }
        else if (*(_BYTE *)(a1 + 52))
        {
          -[UISlidingBarStateRequest setLeadingOffscreenWidth:](v18, "setLeadingOffscreenWidth:", v30);
        }
      }
      else if (*(_BYTE *)(a1 + 48))
      {
        -[UISlidingBarStateRequest setTrailingWidth:](v18, "setTrailingWidth:", v30);
      }
      else if (*(_BYTE *)(a1 + 52))
      {
        -[UISlidingBarStateRequest setTrailingOffscreenWidth:](v18, "setTrailingOffscreenWidth:", v30);
      }
    }
    if (*(_BYTE *)(a1 + 49) || *(_BYTE *)(a1 + 51))
    {
      if (v19)
      {
        -[UISlidingBarStateRequest leadingWidth](v18, "leadingWidth");
        v32 = v31;
        -[UISlidingBarStateRequest leadingOffscreenWidth](v18, "leadingOffscreenWidth");
      }
      else
      {
        -[UISlidingBarStateRequest trailingWidth](v18, "trailingWidth");
        v32 = v34;
        -[UISlidingBarStateRequest trailingOffscreenWidth](v18, "trailingOffscreenWidth");
      }
      if (v32 >= v33)
        v33 = v32;
      v37 = 0;
      MatchingState = minNonzeroSupplementaryWidthInStateWithPrimaryWidthGetMatchingState(v5, v19, &v37, v33);
      v9 = v37;
      if (!*(_BYTE *)(a1 + 49)
        || (-[UISlidingBarStateRequest setSupplementaryWidth:](v18, "setSupplementaryWidth:", MatchingState),
            *(_BYTE *)(a1 + 52))
        && !*(_BYTE *)(a1 + 51))
      {
        -[UISlidingBarStateRequest setSupplementaryOffscreenWidth:](v18, "setSupplementaryOffscreenWidth:", MatchingState);
      }
      objc_msgSend(v9, "mainWidth");
      -[UISlidingBarStateRequest setMainWidth:](v18, "setMainWidth:");
LABEL_62:

    }
  }

  return v18;
}

- (void)callDeprecatedWillHideDelegateCallbackIfNecessary
{
  id WeakRetained;
  void *v4;
  int64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = -[UISplitViewControllerPanelImpl style](self, "style");
    if (v5)
    {
      v6 = v5;
      v7 = callDeprecatedWillHideDelegateCallbackIfNecessary___s_category;
      if (!callDeprecatedWillHideDelegateCallbackIfNecessary___s_category)
      {
        v7 = __UILogCategoryGetNode("UISplitViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&callDeprecatedWillHideDelegateCallbackIfNecessary___s_category);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = v8;
        NSStringFromSelector(sel_splitViewController_willHideViewController_withBarButtonItem_forPopoverController_);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        _UISplitViewControllerStyleDescription(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v10;
        v21 = 2114;
        v22 = v11;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", (uint8_t *)&v19, 0x16u);

      }
    }
    else
    {
      -[UISplitViewControllerPanelImpl displayModeButtonItem](self, "displayModeButtonItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "copy");

      -[UISplitViewControllerPanelImpl _currentPrimaryChildViewController](self, "_currentPrimaryChildViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISplitViewControllerPanelImpl displayModeButtonItem](self, "displayModeButtonItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "splitViewController:willHideViewController:withBarButtonItem:forPopoverController:", WeakRetained, v15, v16, 0);

      -[UISplitViewControllerPanelImpl displayModeButtonItem](self, "displayModeButtonItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "title");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 != v18 && (objc_msgSend(v14, "isEqualToString:", v18) & 1) == 0)
        -[UISplitViewControllerPanelImpl _setDisplayModeButtonItemTitle:](self, "_setDisplayModeButtonItemTitle:", v18);

    }
  }

}

- (void)callDeprecatedWillShowDelegateCallbackIfNecessary
{
  id WeakRetained;
  void *v4;
  int64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = -[UISplitViewControllerPanelImpl style](self, "style");
    if (v5)
    {
      v6 = v5;
      v7 = callDeprecatedWillShowDelegateCallbackIfNecessary___s_category;
      if (!callDeprecatedWillShowDelegateCallbackIfNecessary___s_category)
      {
        v7 = __UILogCategoryGetNode("UISplitViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&callDeprecatedWillShowDelegateCallbackIfNecessary___s_category);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = v8;
        NSStringFromSelector(sel_splitViewController_willShowViewController_invalidatingBarButtonItem_);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        _UISplitViewControllerStyleDescription(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v10;
        v16 = 2114;
        v17 = v11;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", (uint8_t *)&v14, 0x16u);

      }
    }
    else
    {
      -[UISplitViewControllerPanelImpl _currentPrimaryChildViewController](self, "_currentPrimaryChildViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISplitViewControllerPanelImpl displayModeButtonItem](self, "displayModeButtonItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "splitViewController:willShowViewController:invalidatingBarButtonItem:", WeakRetained, v12, v13);

    }
  }

}

- (int64_t)_lastSettledDisplayMode
{
  return self->_lastSettledDisplayMode;
}

- (id)primaryViewControllerForExpandingPanelController:(id)a3
{
  id WeakRetained;
  void *v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = -[UISplitViewControllerPanelImpl style](self, "style");
    if (!v6)
    {
      objc_msgSend(v5, "primaryViewControllerForExpandingSplitViewController:", WeakRetained);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v7 = v6;
    v8 = primaryViewControllerForExpandingPanelController____s_category;
    if (!primaryViewControllerForExpandingPanelController____s_category)
    {
      v8 = __UILogCategoryGetNode("UISplitViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&primaryViewControllerForExpandingPanelController____s_category);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      NSStringFromSelector(sel_primaryViewControllerForExpandingSplitViewController_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _UISplitViewControllerStyleDescription(v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 2114;
      v18 = v12;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", (uint8_t *)&v15, 0x16u);

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (id)panelController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  id v12;
  char v13;
  int64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  _BOOL4 v18;
  $692BA5F601ABB544448C4E0A48A865F8 flags;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v36;
  unint64_t v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  UISplitViewControllerPanelImpl *v45;
  int64_t v46;
  _QWORD v47[4];
  id v48;
  UISplitViewControllerPanelImpl *v49;

  v7 = a3;
  v8 = a4;
  if (-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    v41 = v7;
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = MEMORY[0x1E0C809B0];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __107__UISplitViewControllerPanelImpl_panelController_separateSecondaryViewControllerFromPrimaryViewController___block_invoke;
    v47[3] = &unk_1E16C1B18;
    v12 = v10;
    v48 = v12;
    v49 = self;
    __107__UISplitViewControllerPanelImpl_panelController_separateSecondaryViewControllerFromPrimaryViewController___block_invoke((uint64_t)v47, sel__splitViewControllerIsPrimaryVisible_);
    __107__UISplitViewControllerPanelImpl_panelController_separateSecondaryViewControllerFromPrimaryViewController___block_invoke((uint64_t)v47, sel_splitViewController_separateSecondaryViewControllerFromPrimaryViewController_);
    v13 = objc_opt_respondsToSelector();
    if ((v13 & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    {
      v14 = -[UISplitViewControllerPanelImpl _concreteDisplayModeForCurrentEnvironment](self, "_concreteDisplayModeForCurrentEnvironment");
      v46 = v14;
      *(_QWORD *)&self->_flags |= 0x28000000uLL;
      v15 = objc_loadWeakRetained((id *)&self->_svc);
      if ((v13 & 1) != 0)
      {
        v16 = objc_msgSend(v12, "splitViewController:displayModeForExpandingToProposedDisplayMode:", v15, v14);
        v46 = v16;

      }
      else
      {
        objc_msgSend(v12, "splitViewController:willExpandToProposedDisplayMode:", v15, &v46);

        v16 = v46;
      }
      *(_QWORD *)&self->_flags &= 0xFFFFFFFFD7FFFFFFLL;
      if (v16 != v14)
      {
        if (v16)
        {
          -[UISplitViewControllerPanelImpl setUserGeneratedDisplayMode:](self, "setUserGeneratedDisplayMode:", v16);
          v18 = -[UISplitViewControllerPanelImpl presentsWithGesture](self, "presentsWithGesture");
          flags = self->_flags;
          v20 = 64;
          if (v18 | (*(unint64_t *)&flags >> 20) & 1)
            v20 = 0;
          self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(v20 | *(_QWORD *)&flags & 0xFFFFFFFFFFFFFFBFLL);
        }
      }
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97470);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "navigationControllerWrapper");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v40 = v8;
    if (v22)
    {
      v24 = v22;
    }
    else
    {
      objc_msgSend(v21, "navigationController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v25 = v28;
        objc_msgSend(v25, "_outermostNavigationController");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v25;
        goto LABEL_18;
      }
      objc_msgSend(v21, "viewController");
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v25 = v24;
    objc_msgSend(v24, "navigationController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
LABEL_18:
    v42[0] = v11;
    v42[1] = 3221225472;
    v42[2] = __107__UISplitViewControllerPanelImpl_panelController_separateSecondaryViewControllerFromPrimaryViewController___block_invoke_352;
    v42[3] = &unk_1E16B47A8;
    v29 = v26;
    v43 = v29;
    v30 = v25;
    v44 = v30;
    v45 = self;
    objc_msgSend(v29, "_executeSplitViewControllerActions:", v42);
    if (v30
      && -[UISplitViewControllerPanelImpl _columnForViewController:forceExpandedResult:]((id *)&self->super.isa, v30, 1) != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_loadWeakRetained((id *)&self->_svc);
      v37 = -[UISplitViewControllerPanelImpl _columnForViewController:forceExpandedResult:]((id *)&self->super.isa, v30, 1);
      _UISplitViewControllerColumnDescription(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 6607, CFSTR("Unexpected view controller change when expanding %@. Found %@ in %@ column instead of in secondary column. _perColumnViewControllers are %@"), v36, v30, v38, self->_perColumnViewControllers);

    }
    if (objc_msgSend(v23, "_isTabBarController"))
    {
      objc_msgSend(v23, "selectedViewController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "navigationController");
      v32 = objc_claimAutoreleasedReturnValue();
      if (v31 == (void *)v32)
      {

      }
      else
      {
        v33 = (void *)v32;
        objc_msgSend(v21, "viewController");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31 != v34)
        {
          -[UISplitViewControllerPanelImpl setViewController:forColumn:](self, "setViewController:forColumn:", v23, 2);

LABEL_28:
          v17 = v30;

          v8 = v40;
          v7 = v41;
          goto LABEL_29;
        }
      }

    }
    -[UISplitViewControllerPanelImpl updatePanelControllerForViewControllerChangeInColumn:](self, "updatePanelControllerForViewControllerChangeInColumn:", 2);
    goto LABEL_28;
  }
  -[UISplitViewControllerPanelImpl panelController:unspecifiedStyleSeparateSecondaryViewControllerFromPrimaryViewController:](self, "panelController:unspecifiedStyleSeparateSecondaryViewControllerFromPrimaryViewController:", v7, v8);
  v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

  return v17;
}

void __107__UISplitViewControllerPanelImpl_panelController_separateSecondaryViewControllerFromPrimaryViewController___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "style");
    if (v4)
    {
      v5 = v4;
      v6 = kSplitViewControllerInterfaceOrientationKey_block_invoke_2___s_category;
      if (!kSplitViewControllerInterfaceOrientationKey_block_invoke_2___s_category)
      {
        v6 = __UILogCategoryGetNode("UISplitViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v6, (unint64_t *)&kSplitViewControllerInterfaceOrientationKey_block_invoke_2___s_category);
      }
      v7 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = v7;
        NSStringFromSelector(a2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        _UISplitViewControllerStyleDescription(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543618;
        v12 = v9;
        v13 = 2114;
        v14 = v10;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", (uint8_t *)&v11, 0x16u);

      }
    }
  }
}

void __107__UISplitViewControllerPanelImpl_panelController_separateSecondaryViewControllerFromPrimaryViewController___block_invoke_352(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  id WeakRetained;

  v1 = (void *)a1[4];
  v2 = a1[5];
  WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 16));
  v3 = (id)objc_msgSend(v1, "_separateViewControllersAfterAndIncludingViewController:forSplitViewController:", v2, WeakRetained);

}

- (id)panelController:(id)a3 separateSupplementaryViewControllerFromPrimaryViewController:(id)a4
{
  id v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void *v9;
  void *v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void *v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v32;
  id WeakRetained;
  void *v34;
  id v35;
  void *v36;
  id v37;
  unint64_t v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(_QWORD *);
  void *v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  id v50;
  UISplitViewControllerPanelImpl *v51;
  _BYTE *v52;
  uint8_t v53[4];
  id v54;
  __int16 v55;
  uint64_t v56;
  _BYTE buf[24];
  uint64_t (*v58)(uint64_t, uint64_t);
  __int128 v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (uint64_t (*)(uint64_t, uint64_t))a4;
  if (-[UISplitViewControllerPanelImpl style](self, "style") == 2
    && (-[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewController");
    v11 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "navigationController");
    v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();

    if (v11 != v8 && v13 != v8)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974A0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "viewController");
      v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();

      if (v15 != v8)
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
          {
            NSStringFromSelector(a2);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            *(_QWORD *)&buf[4] = v8;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v42;
            *(_WORD *)&buf[22] = 2112;
            v58 = v11;
            LOWORD(v59) = 2112;
            *(_QWORD *)((char *)&v59 + 2) = v13;
            _os_log_fault_impl(&dword_185066000, v41, OS_LOG_TYPE_FAULT, "Ignoring unexpected UIViewController, %@, passed to %@. Expected %@ or %@. This is an internal UISplitViewController problem.", buf, 0x2Au);

          }
        }
        else
        {
          v16 = qword_1ECD7D570;
          if (!qword_1ECD7D570)
          {
            v16 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v16, (unint64_t *)&qword_1ECD7D570);
          }
          v17 = *(NSObject **)(v16 + 8);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v18 = v17;
            NSStringFromSelector(a2);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            *(_QWORD *)&buf[4] = v8;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v19;
            *(_WORD *)&buf[22] = 2112;
            v58 = v11;
            LOWORD(v59) = 2112;
            *(_QWORD *)((char *)&v59 + 2) = v13;
            _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Ignoring unexpected UIViewController, %@, passed to %@. Expected %@ or %@. This is an internal UISplitViewController problem.", buf, 0x2Au);

          }
        }
      }
    }
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 6631, CFSTR("Lost track of navigation controller for %@ column when expanding %@"), CFSTR("Primary"), WeakRetained);

    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "viewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "navigationController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 6634, CFSTR("Lost track of navigation controller for %@ column when expanding %@"), CFSTR("Supplementary"), v35);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v58 = __Block_byref_object_copy__59;
    *(_QWORD *)&v59 = __Block_byref_object_dispose__59;
    *((_QWORD *)&v59 + 1) = 0;
    v45 = MEMORY[0x1E0C809B0];
    v46 = 3221225472;
    v47 = __111__UISplitViewControllerPanelImpl_panelController_separateSupplementaryViewControllerFromPrimaryViewController___block_invoke;
    v48 = &unk_1E16C1A30;
    v52 = buf;
    v24 = v13;
    v49 = v24;
    v25 = v23;
    v50 = v25;
    v51 = self;
    objc_msgSend(v24, "_executeSplitViewControllerActions:", &v45);
    v26 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    if (!v26)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "navigationController");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v28;

      v26 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    }
    if (-[UISplitViewControllerPanelImpl _columnForViewController:](self, "_columnForViewController:", v26) != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 6645, CFSTR("Unexpected view controller change in %@ column for expanding %@"), CFSTR("Supplementary"), v37, v45, v46, v47, v48, v49);

    }
    -[UISplitViewControllerPanelImpl updatePanelControllerForViewControllerChangeInColumn:](self, "updatePanelControllerForViewControllerChangeInColumn:", 1);
    if (*(id *)(*(_QWORD *)&buf[8] + 40) != v25)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
        {
          v44 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          *(_DWORD *)v53 = 138412546;
          v54 = v25;
          v55 = 2112;
          v56 = v44;
          _os_log_fault_impl(&dword_185066000, v43, OS_LOG_TYPE_FAULT, "Unexpected vc popped when separating supplementary view controller. expected %@; popped %@",
            v53,
            0x16u);
        }

      }
      else
      {
        v38 = qword_1ECD7D578;
        if (!qword_1ECD7D578)
        {
          v38 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v38, (unint64_t *)&qword_1ECD7D578);
        }
        v39 = *(NSObject **)(v38 + 8);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v40 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          *(_DWORD *)v53 = 138412546;
          v54 = v25;
          v55 = 2112;
          v56 = v40;
          _os_log_impl(&dword_185066000, v39, OS_LOG_TYPE_ERROR, "Unexpected vc popped when separating supplementary view controller. expected %@; popped %@",
            v53,
            0x16u);
        }
      }
    }
    v30 = *(id *)(*(_QWORD *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

void __111__UISplitViewControllerPanelImpl_panelController_separateSupplementaryViewControllerFromPrimaryViewController___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;

  v2 = (void *)a1[4];
  v3 = a1[5];
  WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 16));
  objc_msgSend(v2, "_separateViewControllersAfterAndIncludingViewController:forSplitViewController:", v3, WeakRetained);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)panelController:(id)a3 unspecifiedStyleSeparateSecondaryViewControllerFromPrimaryViewController:(id)a4
{
  id v5;
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  id v11;
  char v12;
  id v13;
  void *v14;
  $9BB867E6ECA1797B07F6783540CA8F02 transitioningFlags;
  int v16;
  int v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  _BOOL4 v23;
  BOOL v24;
  int64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id *v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[UISplitViewControllerPanelImpl _stopTransitionsInViewController:](self, "_stopTransitionsInViewController:", v5);
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)&self->_transitioningFlags = *(_BYTE *)&self->_transitioningFlags & 0xFE | objc_opt_respondsToSelector() & 1;

  if ((*(_BYTE *)&self->_transitioningFlags & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v9, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_loadWeakRetained((id *)&self->_svc);
    if (objc_msgSend(v10, "_splitViewControllerIsPrimaryVisible:", v11))
      v12 = 2;
    else
      v12 = 0;
    *(_BYTE *)&self->_transitioningFlags = *(_BYTE *)&self->_transitioningFlags & 0xFD | v12;

  }
  else
  {
    *(_BYTE *)&self->_transitioningFlags &= ~2u;
  }
  v13 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v13, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_suspendedState == 2
    && (transitioningFlags = self->_transitioningFlags, (*(_BYTE *)&transitioningFlags & 1) != 0))
  {
    v16 = (*(unsigned int *)&transitioningFlags >> 1) & 1;
    v17 = 1;
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v19 = 0;
LABEL_16:
    v22 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v5, "separateSecondaryViewControllerForSplitViewController:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  v18 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v18, "splitViewController:separateSecondaryViewControllerFromPrimaryViewController:", v13, v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
    goto LABEL_16;
  objc_msgSend(v19, "parentViewController");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  v21 = v19;
  if (v20 == v5)
    goto LABEL_16;
LABEL_17:
  if (self->_suspendedState == 2)
  {
    v23 = v21 == 0;
    if (v17)
      v23 = v16;
    v24 = !v23;
    v25 = 3;
    if (v24)
      v25 = 4;
    self->_suspendedState = v25;
  }
  if (v21)
    goto LABEL_26;
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "preservedDetailController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21
    || (-[UISplitViewControllerPanelImpl panelController](self, "panelController"),
        v27 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v27, "mainViewController"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v27,
        v21))
  {
LABEL_26:
    v35 = v5;
    v36 = v21;
    v28 = (void *)MEMORY[0x1E0C99D20];
    v29 = &v35;
    v30 = 2;
  }
  else
  {
    v34 = v5;
    v28 = (void *)MEMORY[0x1E0C99D20];
    v29 = &v34;
    v30 = 1;
  }
  objc_msgSend(v28, "arrayWithObjects:count:", v29, v30, v34, v35, v36, v37);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v32, "setViewControllers:", v31);

  return v21;
}

- (void)panelControllerDidExpand:(id)a3
{
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97470);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "topViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_searchControllerIfAllowed");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_updateHasPendingSuggestionMenuRefreshFlagForReason:", 3);
    *(_QWORD *)&self->_flags |= 0x40000000uLL;

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v12, "splitViewControllerDidExpand:", v11);

  }
}

- (CGSize)_predictedDetailSizeForPredictedEndState:(id)a3
{
  id v4;
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGSize result;

  v4 = a3;
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;

  v12 = -[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading");
  if (v12)
  {
    if ((objc_msgSend(v4, "leadingOverlapsMain") & 1) != 0)
      goto LABEL_10;
    objc_msgSend(v4, "leadingWidth");
  }
  else
  {
    if ((objc_msgSend(v4, "trailingOverlapsMain") & 1) != 0)
      goto LABEL_10;
    objc_msgSend(v4, "trailingWidth");
  }
  v14 = v13;
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v17, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "window");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "screen");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scale");
  v22 = v21;

  if (v12)
    objc_msgSend(v16, "leadingBorderWidthForScale:", v22);
  else
    objc_msgSend(v16, "trailingBorderWidthForScale:", v22);
  v9 = v9 - (v14 + v23);

LABEL_10:
  v24 = v9;
  v25 = v11;
  result.height = v25;
  result.width = v24;
  return result;
}

- (id)panelController:(id)a3 willBeginAnimatedTransitionToStateRequest:(id)a4 predictedEndState:(id)a5 predictedDuration:(double)a6
{
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  id v32;
  void *v33;
  int v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = -[UISplitViewControllerPanelImpl style](self, "style");
    if (v13)
    {
      v14 = v13;
      v15 = qword_1ECD7D580;
      if (!qword_1ECD7D580)
      {
        v15 = __UILogCategoryGetNode("UISplitViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v15, (unint64_t *)&qword_1ECD7D580);
      }
      v16 = *(NSObject **)(v15 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = v16;
        NSStringFromSelector(sel__splitViewController_willBeginAnimatedTransitionToStateRequest_);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        _UISplitViewControllerStyleDescription(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138543618;
        v36 = v18;
        v37 = 2114;
        v38 = v19;
        _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", (uint8_t *)&v35, 0x16u);

      }
    }
    else
    {
      objc_msgSend(v12, "_splitViewController:willBeginAnimatedTransitionToStateRequest:", WeakRetained, v9);
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v20 = -[UISplitViewControllerPanelImpl style](self, "style");
    if (v20)
    {
      v21 = v20;
      v22 = qword_1ECD7D588;
      if (!qword_1ECD7D588)
      {
        v22 = __UILogCategoryGetNode("UISplitViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v22, (unint64_t *)&qword_1ECD7D588);
      }
      v23 = *(NSObject **)(v22 + 8);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = v23;
        NSStringFromSelector(sel__splitViewController_willBeginAnimatedTransitionToStateRequest_predictedDetailSize_predictedDuration_);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        _UISplitViewControllerStyleDescription(v21);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138543618;
        v36 = v25;
        v37 = 2114;
        v38 = v26;
        _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", (uint8_t *)&v35, 0x16u);

      }
    }
    else
    {
      -[UISplitViewControllerPanelImpl _predictedDetailSizeForPredictedEndState:](self, "_predictedDetailSizeForPredictedEndState:", v10);
      v28 = v27;
      v30 = v29;
      v31 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v12, "_splitViewController:willBeginAnimatedTransitionToStateRequest:predictedDetailSize:predictedDuration:", v31, v9, v28, v30, a6);

    }
  }
  self->_animatingToDisplayMode = -[UISplitViewControllerPanelImpl _displayModeForState:](self, "_displayModeForState:", v10);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v32 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v12, "_splitViewController:animationControllerForTransitionFromDisplayMode:toDisplayMode:", v32, -[UISplitViewControllerPanelImpl displayMode](self, "displayMode"), -[UISplitViewControllerPanelImpl _displayModeForState:](self, "_displayModeForState:", v10));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (void)panelController:(id)a3 animateTransitionToStateRequest:(id)a4 predictedEndState:(id)a5 predictedDuration:(double)a6
{
  id v8;
  id v9;
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = -[UISplitViewControllerPanelImpl style](self, "style");
    if (v13)
    {
      v14 = v13;
      v15 = panelController_animateTransitionToStateRequest_predictedEndState_predictedDuration____s_category;
      if (!panelController_animateTransitionToStateRequest_predictedEndState_predictedDuration____s_category)
      {
        v15 = __UILogCategoryGetNode("UISplitViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v15, (unint64_t *)&panelController_animateTransitionToStateRequest_predictedEndState_predictedDuration____s_category);
      }
      v16 = *(NSObject **)(v15 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = v16;
        NSStringFromSelector(sel__splitViewController_animateTransitionToStateRequest_detailSize_duration_);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        _UISplitViewControllerStyleDescription(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v18;
        v24 = 2114;
        v25 = v19;
        _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", (uint8_t *)&v22, 0x16u);

      }
    }
    else
    {
      -[UISplitViewControllerPanelImpl _predictedDetailSizeForPredictedEndState:](self, "_predictedDetailSizeForPredictedEndState:", v9);
      objc_msgSend(v12, "_splitViewController:animateTransitionToStateRequest:detailSize:duration:", WeakRetained, v8);
    }
  }
  v20 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v20, "setNeedsStatusBarAppearanceUpdate");

  v21 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v21, "setNeedsUpdateOfScreenEdgesDeferringSystemGestures");

}

- (void)panelController:(id)a3 didEndAnimatedTransitionToStateRequest:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = -[UISplitViewControllerPanelImpl style](self, "style");
    if (v8)
    {
      v9 = v8;
      v10 = panelController_didEndAnimatedTransitionToStateRequest____s_category;
      if (!panelController_didEndAnimatedTransitionToStateRequest____s_category)
      {
        v10 = __UILogCategoryGetNode("UISplitViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v10, (unint64_t *)&panelController_didEndAnimatedTransitionToStateRequest____s_category);
      }
      v11 = *(NSObject **)(v10 + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = v11;
        NSStringFromSelector(sel__splitViewController_didEndAnimatedTransitionToStateRequest_);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        _UISplitViewControllerStyleDescription(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v13;
        v17 = 2114;
        v18 = v14;
        _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", (uint8_t *)&v15, 0x16u);

      }
    }
    else
    {
      objc_msgSend(v7, "_splitViewController:didEndAnimatedTransitionToStateRequest:", WeakRetained, v5);
    }
  }
  self->_animatingToDisplayMode = 0;

}

- (void)panelController:(id)a3 willBeginAnimationToPrimarySize:(CGSize)a4 supplementarySize:(CGSize)a5 secondarySize:(CGSize)a6
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id WeakRetained;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  id v56;

  height = a6.height;
  width = a6.width;
  v8 = a5.height;
  v9 = a5.width;
  v10 = a4.height;
  v11 = a4.width;
  v14 = -[UISplitViewControllerPanelImpl style](self, "style", a3);
  if (v14 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v14);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 6903, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v55);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "navigationControllerWrapper");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v56 = v16;
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "navigationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v56 = v19;
    }
    else
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "viewController");
      v56 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "navigationController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v25 = v23;
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "viewController");
    v25 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97470);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "navigationControllerWrapper");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    v30 = v28;
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97470);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "navigationController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
    {
      v30 = v32;
    }
    else
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97470);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "viewController");
      v30 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  -[UISplitViewControllerPanelImpl transitionCoordinator](self, "transitionCoordinator");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    v37 = v35;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "_definiteTransitionCoordinator");
    v37 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v56, "_existingView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bounds");
  v41 = v40;
  v43 = v42;

  if (v11 != v41 || v10 != v43)
    objc_msgSend(v56, "viewWillTransitionToSize:withTransitionCoordinator:", v37, v11, v10);
  if (v14 == 2)
  {
    objc_msgSend(v25, "_existingView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "bounds");
    v46 = v45;
    v48 = v47;

    if (v9 != v46 || v8 != v48)
      objc_msgSend(v25, "viewWillTransitionToSize:withTransitionCoordinator:", v37, v9, v8);
  }
  objc_msgSend(v30, "_existingView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bounds");
  v51 = v50;
  v53 = v52;

  if (width != v51 || height != v53)
    objc_msgSend(v30, "viewWillTransitionToSize:withTransitionCoordinator:", v37, width, height);

}

- (void)panelController:(id)a3 adjustLeadingViewController:(id)a4 forKeyboardInfo:(id)a5
{
  id v6;
  id v7;

  v7 = a4;
  v6 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "_adjustNonOverlayScrollViewsForKeyboardInfo:", v6);

}

- (void)panelController:(id)a3 adjustTrailingViewController:(id)a4 forKeyboardInfo:(id)a5
{
  id v6;
  id v7;

  v7 = a4;
  v6 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "_adjustNonOverlayScrollViewsForKeyboardInfo:", v6);

}

- (BOOL)_wantsSideBarImageForOneOverSecondary
{
  int64_t v4;
  unint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  _UIFloatableBarButtonItem *sidebarToggleButtonItem;
  void *v12;
  void *v13;

  v4 = -[UISplitViewControllerPanelImpl style](self, "style");
  v5 = v4;
  if ((unint64_t)(v4 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 6947, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v9);

  }
  else if (v4 == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = 0;
LABEL_12:

      return v7;
    }
  }
  if ((*((_BYTE *)&self->_flags + 2) & 2) != 0
    && (sidebarToggleButtonItem = self->_sidebarToggleButtonItem) != 0
    && !-[UIBarButtonItem isHidden](sidebarToggleButtonItem, "isHidden"))
  {
    -[UIBarButtonItem image](self->_sidebarToggleButtonItem, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISplitViewControllerPanelImpl _sidebarToggleSymbolImage](self, "_sidebarToggleSymbolImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v12, "isEqual:", v13);

  }
  else
  {
    v7 = 0;
  }
  if (v5 == 2)
  {
    v6 = 0;
    goto LABEL_12;
  }
  return v7;
}

- (BOOL)_unspecifiedStyleGestureRecognizerShouldBegin:(id)a3
{
  id v5;
  int64_t v6;
  id v7;
  id v8;
  int v9;
  void *WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  _BOOL4 v16;
  uint64_t v17;
  _BOOL4 v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v23;
  void *v24;
  void *v25;

  v5 = a3;
  v6 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v6)
  {
    v23 = v6;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 6997, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v25);

  }
  -[UISplitViewControllerPanelImpl _presentationGestureRecognizer](self, "_presentationGestureRecognizer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v5)
  {
    objc_msgSend(v5, "view");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UISplitViewControllerPanelImpl _isPrimaryShown](self, "_isPrimaryShown"))
    {
      objc_msgSend(v5, "locationInView:", WeakRetained);
      objc_msgSend(WeakRetained, "hitTest:withEvent:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        LOBYTE(v9) = 0;
LABEL_27:

        goto LABEL_28;
      }
      -[UISplitViewControllerPanelImpl _currentPrimaryChildViewController](self, "_currentPrimaryChildViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v11, "isDescendantOfView:", v13) ^ 1;

    }
    else
    {
      objc_msgSend(v5, "translationInView:", WeakRetained);
      v15 = v14;
      v16 = -[UISplitViewControllerPanelImpl _layoutPrimaryOnRight](self, "_layoutPrimaryOnRight");
      if (v16)
        v17 = 8;
      else
        v17 = 2;
      if (v16)
        v18 = v15 < 0.0;
      else
        v18 = v15 > 0.0;
      if (!v18)
      {
        LOBYTE(v9) = 0;
        goto LABEL_28;
      }
      objc_msgSend(v5, "locationInView:", WeakRetained);
      objc_msgSend(WeakRetained, "hitTest:withEvent:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_scroller");
      v19 = objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        LOBYTE(v9) = 1;
        goto LABEL_27;
      }
      v12 = (void *)v19;
      while ((objc_msgSend(v12, "isDecelerating") & 1) == 0
           && (objc_msgSend(v12, "_currentlyAbuttedContentEdges") & v17) != 0)
      {
        objc_msgSend(v12, "superview");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_scroller");
        v21 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v21;
        if (!v21)
        {
          LOBYTE(v9) = 1;
          goto LABEL_26;
        }
      }
      LOBYTE(v9) = 0;
    }
LABEL_26:

    goto LABEL_27;
  }
  -[UISplitViewControllerPanelImpl _menuGestureRecognizer](self, "_menuGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    LOBYTE(v9) = objc_msgSend(WeakRetained, "displayMode") == 1;
LABEL_28:

    goto LABEL_29;
  }
  LOBYTE(v9) = 0;
LABEL_29:

  return v9;
}

- (BOOL)_configurationPermitsFluidOpenGestureWithPrimaryShown:(BOOL)a3 supplementaryShown:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v8;
  void *v9;
  int64_t v11;
  void *v13;
  void *v14;

  v4 = a4;
  v8 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v8 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 7039, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v14);

    if (a3)
      goto LABEL_4;
  }
  else if (a3)
  {
    goto LABEL_4;
  }
  if (!v4)
    return 1;
LABEL_4:
  if (v8 == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      return 1;
  }
  if (-[UISplitViewControllerPanelImpl splitBehavior](self, "splitBehavior") == 2)
    return 1;
  if ((*((_BYTE *)&self->_flags + 2) & 2) == 0)
    return 0;
  v11 = -[UISplitViewControllerPanelImpl userGeneratedDisplayMode](self, "userGeneratedDisplayMode");
  return v11 == 3 || v11 == 5;
}

- (BOOL)_configurationPermitsFluidCloseGestureWithPrimaryShown:(BOOL)a3 supplementaryShown:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  unint64_t v8;
  int64_t v10;
  void *v12;
  void *v13;

  v4 = a4;
  v5 = a3;
  v8 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v8 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 7052, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v13);

    if (!v5)
      goto LABEL_4;
  }
  else if (!v5)
  {
    goto LABEL_4;
  }
  if (v4)
    return 1;
LABEL_4:
  if (!v5 && !v4)
    return 0;
  if (v8 == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);

  }
  if (-[UISplitViewControllerPanelImpl splitBehavior](self, "splitBehavior") == 2)
    return 1;
  if ((*((_BYTE *)&self->_flags + 2) & 2) == 0)
    return 0;
  v10 = -[UISplitViewControllerPanelImpl userGeneratedDisplayMode](self, "userGeneratedDisplayMode");
  return v10 == 3 || v10 == 5;
}

- (int64_t)_columnForView:(id)a3 getIsContent:(BOOL *)a4
{
  void *v6;
  int64_t v7;
  int64_t v8;
  NSMutableDictionary *perColumnViewControllers;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;

  objc_msgSend(a3, "_viewControllerForAncestor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[UISplitViewControllerPanelImpl _columnForViewController:](self, "_columnForViewController:", v6);
    v8 = v7;
    if (a4 && v7 != 999)
    {
      perColumnViewControllers = self->_perColumnViewControllers;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](perColumnViewControllers, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "navigationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v12)
      {
        v17 = 0;
      }
      else
      {
        v13 = self->_perColumnViewControllers;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "navigationControllerWrapper");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v6 != v16;

      }
      goto LABEL_11;
    }
  }
  else
  {
    v8 = 999;
  }
  if (a4)
  {
    v17 = 0;
LABEL_11:
    *a4 = v17;
  }

  return v8;
}

- (BOOL)_fluidGestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  id v6;
  BOOL v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  BOOL v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v21;
  void *v22;
  int64_t v23;
  int64_t v24;
  void *v25;
  id WeakRetained;
  uint64_t v27;
  id v28;
  _BOOL4 v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  uint64_t v37;
  char v38;

  v4 = a3;
  if (!-[UISplitViewControllerPanelImpl _isCollapsed](self, "_isCollapsed"))
  {
    -[UISplitViewControllerPanelImpl _fluidOpenSidebarPresentationGestureRecognizer](self, "_fluidOpenSidebarPresentationGestureRecognizer");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v4)
    {
      v7 = 1;
      goto LABEL_15;
    }
    -[UISplitViewControllerPanelImpl _fluidSidebarPresentationGestureRecognizer](self, "_fluidSidebarPresentationGestureRecognizer");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      v8 = v4;
      objc_msgSend(v8, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "translationInView:", v9);
      if (v10 == 0.0)
        goto LABEL_13;
      v12 = v10;
      if (fabs(v10) <= fabs(v11))
        goto LABEL_13;
      v13 = -[UISplitViewControllerPanelImpl _effectivePrimaryRectEdge](self, "_effectivePrimaryRectEdge");
      if (v13 == 2)
        v14 = v12 < 0.0;
      else
        v14 = v12 > 0.0;
      v15 = -[UISplitViewControllerPanelImpl _isPrimaryShown](self, "_isPrimaryShown");
      -[UISplitViewControllerPanelImpl panelController](self, "panelController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "currentState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isSupplementaryVisible");

      if (v14)
      {
        if (!-[UISplitViewControllerPanelImpl _configurationPermitsFluidCloseGestureWithPrimaryShown:supplementaryShown:](self, "_configurationPermitsFluidCloseGestureWithPrimaryShown:supplementaryShown:", v15, v18))
        {
LABEL_13:
          v19 = 0;
LABEL_14:

          v7 = v19 != 0;
          goto LABEL_15;
        }
      }
      else if (!-[UISplitViewControllerPanelImpl _configurationPermitsFluidOpenGestureWithPrimaryShown:supplementaryShown:](self, "_configurationPermitsFluidOpenGestureWithPrimaryShown:supplementaryShown:", v15, v18))
      {
        goto LABEL_13;
      }
      objc_msgSend(v8, "_activeEventOfType:", 10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v19 = 1;
      }
      else
      {
        objc_msgSend(v8, "locationInView:", v9);
        objc_msgSend(v9, "hitTest:withEvent:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0;
        v23 = -[UISplitViewControllerPanelImpl _columnForView:getIsContent:](self, "_columnForView:getIsContent:", v22, &v38);
        if (!v38)
          goto LABEL_22;
        if ((*((_BYTE *)&self->_flags + 5) & 1) == 0)
          goto LABEL_23;
        v24 = v23;
        -[UISplitViewControllerPanelImpl _columnStyleDelegate](self, "_columnStyleDelegate");
        v34 = v22;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
        LODWORD(v24) = objc_msgSend(v25, "_splitViewController:allowInteractivePresentationGesture:inContentsOfColumn:", WeakRetained, v8, v24);

        v22 = v34;
        if ((_DWORD)v24)
        {
LABEL_22:
          v19 = !-[UISplitViewControllerPanelImpl _scrollViewPreventsGestureForHitView:](self, "_scrollViewPreventsGestureForHitView:", v22);
        }
        else
        {
LABEL_23:
          if (v13 == 2)
            v27 = 8;
          else
            v27 = 2;
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __69__UISplitViewControllerPanelImpl__fluidGestureRecognizerShouldBegin___block_invoke;
          v35[3] = &unk_1E16C1B40;
          v35[4] = self;
          v28 = v8;
          v36 = v28;
          v37 = v27;
          if ((_DWORD)v18)
            v19 = __69__UISplitViewControllerPanelImpl__fluidGestureRecognizerShouldBegin___block_invoke((uint64_t)v35, 1);
          else
            v19 = 0;
          if (v19)
            v29 = 0;
          else
            v29 = v15;
          if (v29)
          {
            v19 = __69__UISplitViewControllerPanelImpl__fluidGestureRecognizerShouldBegin___block_invoke((uint64_t)v35, 0);
            v28 = v36;
          }

        }
        if ((*((_BYTE *)&self->_flags + 5) & 2) != 0)
        {
          -[UISplitViewControllerPanelImpl _columnStyleDelegate](self, "_columnStyleDelegate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_loadWeakRetained((id *)&self->_svc);
          if (v19)
            v32 = 1;
          else
            v32 = 2;
          v33 = objc_msgSend(v30, "_splitViewController:overrideProposedPermission:forInteractivePresentationGesture:inView:", v31, v32, v8, v22);

          if (v33)
            v19 = v33 == 1;
        }

      }
      goto LABEL_14;
    }
  }
  v7 = 0;
LABEL_15:

  return v7;
}

BOOL __69__UISplitViewControllerPanelImpl__fluidGestureRecognizerShouldBegin___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  double MinX;
  _BOOL8 v15;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "locationInView:", v7);
  v9 = v8;
  objc_msgSend(v7, "bounds");
  if (*(_QWORD *)(a1 + 48) == 2)
    MinX = CGRectGetMinX(*(CGRect *)&v10);
  else
    MinX = CGRectGetMaxX(*(CGRect *)&v10);
  v15 = v9 <= MinX + 22.0 && v9 >= MinX + -22.0;

  return v15;
}

- (BOOL)_allowMoveToSecondaryOnlyGetIsInForcedOverlayFromGestureOrRestrictedWidth:(BOOL *)a3
{
  $692BA5F601ABB544448C4E0A48A865F8 flags;
  int64_t v6;
  BOOL v7;
  int64_t v8;
  BOOL result;
  int64_t v10;

  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x20000) == 0 && (*(_QWORD *)&flags & 0xC0000) != 0x80000)
  {
LABEL_5:
    v10 = -[UISplitViewControllerPanelImpl defaultDisplayModeForSplitBehavior:](self, "defaultDisplayModeForSplitBehavior:", -[UISplitViewControllerPanelImpl splitBehavior](self, "splitBehavior"));
    v7 = 0;
    result = v10 == 1;
LABEL_6:
    if (!a3)
      return result;
    goto LABEL_7;
  }
  v6 = -[UISplitViewControllerPanelImpl userGeneratedDisplayMode](self, "userGeneratedDisplayMode");
  v7 = 1;
  if (v6 != 3)
  {
    v8 = v6;
    result = 1;
    if (v8 == 5)
      goto LABEL_6;
    goto LABEL_5;
  }
  result = 1;
  if (!a3)
    return result;
LABEL_7:
  *a3 = v7;
  return result;
}

- (BOOL)_scrollViewPreventsGestureForHitView:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  BOOL v10;

  objc_msgSend(a3, "_scroller");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    return 0;
  v5 = (void *)v4;
  while ((objc_msgSend(v5, "isDecelerating") & 1) == 0)
  {
    v6 = objc_msgSend(v5, "_currentlyAbuttedContentEdges");
    v7 = -[UISplitViewControllerPanelImpl _layoutPrimaryOnRight](self, "_layoutPrimaryOnRight") ? 8 : 2;
    if ((v7 & v6) == 0)
      break;
    objc_msgSend(v5, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_scroller");
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
    if (!v9)
    {
      v10 = 0;
      goto LABEL_11;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  id v6;
  BOOL v7;
  BOOL v8;
  id WeakRetained;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  if (!-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    v7 = -[UISplitViewControllerPanelImpl _unspecifiedStyleGestureRecognizerShouldBegin:](self, "_unspecifiedStyleGestureRecognizerShouldBegin:", v4);
    goto LABEL_7;
  }
  -[UISplitViewControllerPanelImpl _menuGestureRecognizer](self, "_menuGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    v8 = objc_msgSend(WeakRetained, "displayMode") == 1;

    goto LABEL_25;
  }
  -[UISplitViewControllerPanelImpl _sidebarArrowButtonRecognizer](self, "_sidebarArrowButtonRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v8 = 1;
    goto LABEL_25;
  }
  if (!-[UISplitViewControllerPanelImpl _shouldUseFluidSidebarGestures](self, "_shouldUseFluidSidebarGestures"))
  {
    -[UISplitViewControllerPanelImpl _presentationGestureRecognizer](self, "_presentationGestureRecognizer");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 != v4)
    {
      v8 = 0;
      goto LABEL_25;
    }
    objc_msgSend(v4, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "translationInView:", v11);
    if (v12 == 0.0)
      goto LABEL_23;
    v14 = v12;
    if (fabs(v12) <= fabs(v13))
      goto LABEL_23;
    if (-[UISplitViewControllerPanelImpl _layoutPrimaryOnRight](self, "_layoutPrimaryOnRight"))
      v15 = v14 >= 0.0;
    else
      v15 = v14 <= 0.0;
    v16 = -[UISplitViewControllerPanelImpl _isPrimaryShown](self, "_isPrimaryShown");
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isSupplementaryVisible");

    v20 = 0;
    if (!v15 && !v16)
    {
      objc_msgSend(v4, "locationInView:", v11);
      objc_msgSend(v11, "hitTest:withEvent:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = !-[UISplitViewControllerPanelImpl _scrollViewPreventsGestureForHitView:](self, "_scrollViewPreventsGestureForHitView:", v21);

    }
    if ((v15 & (v16 | v19)) != 1)
      goto LABEL_24;
    if (-[UISplitViewControllerPanelImpl _allowMoveToSecondaryOnlyGetIsInForcedOverlayFromGestureOrRestrictedWidth:](self, "_allowMoveToSecondaryOnlyGetIsInForcedOverlayFromGestureOrRestrictedWidth:", 0)|| (v16 & v19) != 0)
    {
      if ((v19 & 1) != 0)
      {
        -[UISplitViewControllerPanelImpl panelController](self, "panelController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "supplementaryViewController");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "view");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[UISplitViewControllerPanelImpl _currentPrimaryChildViewController](self, "_currentPrimaryChildViewController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "view");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }

      if (v25)
      {
        objc_msgSend(v4, "locationInView:", v11);
        objc_msgSend(v11, "hitTest:withEvent:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v26)
          v20 = objc_msgSend(v26, "isDescendantOfView:", v25) ^ 1;
        else
          v20 = 0;

      }
      else
      {
        v20 = 1;
      }

    }
    else
    {
LABEL_23:
      v20 = 0;
    }
LABEL_24:

    v8 = v20 != 0;
    goto LABEL_25;
  }
  v7 = -[UISplitViewControllerPanelImpl _fluidGestureRecognizerShouldBegin:](self, "_fluidGestureRecognizerShouldBegin:", v4);
LABEL_7:
  v8 = v7;
LABEL_25:

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  int v12;

  v6 = a3;
  v7 = a4;
  if (-[UISplitViewControllerPanelImpl _shouldUseFluidSidebarGestures](self, "_shouldUseFluidSidebarGestures"))
  {
    -[UISplitViewControllerPanelImpl _fluidOpenSidebarPresentationGestureRecognizer](self, "_fluidOpenSidebarPresentationGestureRecognizer");
    v8 = objc_claimAutoreleasedReturnValue();
    if ((id)v8 == v6)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[UISplitViewControllerPanelImpl _fluidSidebarPresentationGestureRecognizer](self, "_fluidSidebarPresentationGestureRecognizer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_6;
    }
LABEL_8:
    v12 = objc_msgSend(v7, "_isPointerTouch") ^ 1;
    goto LABEL_9;
  }
  -[UISplitViewControllerPanelImpl _presentationGestureRecognizer](self, "_presentationGestureRecognizer");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v6)
    goto LABEL_8;
LABEL_6:
  LOBYTE(v12) = 1;
LABEL_9:

  return v12;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  char v12;
  uint64_t v13;
  int v14;
  id v15;
  id v16;
  NSUInteger v17;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSMutableDictionary *perColumnViewControllers;
  void *v28;
  void *v29;
  id v30;
  NSRange v32;
  NSRange v33;

  v6 = a3;
  v7 = a4;
  if (-[UISplitViewControllerPanelImpl _shouldUseFluidSidebarGestures](self, "_shouldUseFluidSidebarGestures"))
  {
    -[UISplitViewControllerPanelImpl _fluidSidebarPresentationGestureRecognizer](self, "_fluidSidebarPresentationGestureRecognizer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[UISplitViewControllerPanelImpl _fluidOpenSidebarPresentationGestureRecognizer](self, "_fluidOpenSidebarPresentationGestureRecognizer");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 != v6 || (id)v9 == v7)
    {
      v11 = 0;
      if ((id)v9 != v6 || v8 == v7)
      {
LABEL_25:

        goto LABEL_26;
      }
    }
    v12 = objc_msgSend(v7, "_isGestureType:", 8);

    if ((v12 & 1) != 0)
      goto LABEL_7;
  }
  else
  {
    -[UISplitViewControllerPanelImpl _presentationGestureRecognizer](self, "_presentationGestureRecognizer");
    v13 = objc_claimAutoreleasedReturnValue();
    if ((id)v13 != v6)
    {
      v8 = (id)v13;
      goto LABEL_12;
    }
    v14 = objc_msgSend(v7, "_isGestureType:", 8);

    if (v14)
    {
LABEL_7:
      v8 = v7;
      if (objc_msgSend(v8, "_failsPastHysteresisWithoutMinTouches"))
      {
        if ((unint64_t)objc_msgSend(v8, "minimumNumberOfTouches") < 2)
        {
          v11 = 1;
LABEL_26:

          goto LABEL_27;
        }
      }
      else
      {
        v15 = v6;
        v16 = v8;
        v17 = objc_msgSend(v15, "minimumNumberOfTouches");
        v18 = objc_msgSend(v15, "maximumNumberOfTouches");
        v19 = objc_msgSend(v15, "minimumNumberOfTouches");

        v20 = v18 - v19 + 1;
        v21 = objc_msgSend(v16, "minimumNumberOfTouches");
        v22 = objc_msgSend(v16, "maximumNumberOfTouches");
        v23 = objc_msgSend(v16, "minimumNumberOfTouches");

        v33.length = v22 - v23 + 1;
        v32.location = v17;
        v32.length = v20;
        v33.location = v21;
        if (NSIntersectionRange(v32, v33).length)
        {
          v11 = 1;
          v8 = v16;
          goto LABEL_26;
        }
      }
      if (-[UISplitViewControllerPanelImpl _shouldUseFluidSidebarGestures](self, "_shouldUseFluidSidebarGestures"))
      {
        if (-[UISplitViewControllerPanelImpl _isPrimaryShown](self, "_isPrimaryShown"))
        {
          v24 = 0;
        }
        else
        {
          -[UISplitViewControllerPanelImpl panelController](self, "panelController");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "currentState");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v26, "isSupplementaryVisible"))
            v24 = 1;
          else
            v24 = 2;

        }
        perColumnViewControllers = self->_perColumnViewControllers;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v24);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](perColumnViewControllers, "objectForKeyedSubscript:", v10);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "navigationController");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "_screenEdgePanGestureRecognizer");
        v30 = (id)objc_claimAutoreleasedReturnValue();
        v11 = v30 == v8;

        goto LABEL_25;
      }
LABEL_12:
      v11 = 0;
      goto LABEL_26;
    }
  }
  v11 = 0;
LABEL_27:

  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  char v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  char v30;
  BOOL v31;
  id v32;
  void *v33;
  void *v34;
  char isKindOfClass;
  void *v36;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.UIKit.UIWindowDraggingPan"));

  if (-[UISplitViewControllerPanelImpl _shouldUseFluidSidebarGestures](self, "_shouldUseFluidSidebarGestures"))
  {
    -[UISplitViewControllerPanelImpl _fluidSidebarPresentationGestureRecognizer](self, "_fluidSidebarPresentationGestureRecognizer");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[UISplitViewControllerPanelImpl _fluidOpenSidebarPresentationGestureRecognizer](self, "_fluidOpenSidebarPresentationGestureRecognizer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10 != v6 && v11 != v6)
    {

LABEL_6:
      v14 = 0;
      goto LABEL_7;
    }
    v16 = objc_msgSend(v7, "_isGestureType:", 10);
    if ((v16 & 1) == 0 && v12 != v7 && v10 != v7)
    {
      v17 = objc_msgSend(v7, "_isGestureType:", 8);
      v18 = v17;
      if (v10 == v6)
        v19 = v17;
      else
        v19 = 0;
      v20 = v19 & v9;

      if (v20 == 1)
      {

        v14 = 1;
        goto LABEL_7;
      }

      if (!v18)
        goto LABEL_6;
LABEL_25:
      v32 = v7;
      objc_msgSend(v6, "_activeEventOfType:", 10);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        if ((objc_msgSend(v32, "allowedScrollTypesMask") & 2) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend(v32, "view"),
                v34 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                isKindOfClass = objc_opt_isKindOfClass(),
                v34,
                (isKindOfClass & 1) != 0))
          {
            objc_msgSend(v32, "view");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v36, "_canScrollX");

          }
          else
          {
            v14 = 1;
          }
          goto LABEL_34;
        }
      }
      else if (objc_msgSend(v32, "_failsPastHysteresisWithoutMinTouches"))
      {
        v14 = (unint64_t)objc_msgSend(v32, "minimumNumberOfTouches") > 1;
LABEL_34:

        goto LABEL_7;
      }
      v14 = 0;
      goto LABEL_34;
    }

    if ((v16 & 1) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
  -[UISplitViewControllerPanelImpl _presentationGestureRecognizer](self, "_presentationGestureRecognizer");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 != v6)
    goto LABEL_6;
  if ((objc_msgSend(v7, "_isGestureType:", 10) & 1) != 0)
  {
LABEL_21:
    objc_msgSend(v6, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "convertPoint:toView:", v23, 10.0, 10.0);
    v25 = v24;

    objc_msgSend(v6, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "convertPoint:toView:", v27, 20.0, 10.0);
    v29 = v28;

    v30 = objc_msgSend(v7, "direction");
    v31 = v25 - v29 < 0.0;
    if (v25 - v29 > 0.0)
      v31 = 1;
    v14 = v30 & v31;
    goto LABEL_7;
  }
  v21 = objc_msgSend(v7, "_isGestureType:", 8);
  v14 = v21 & v9;
  if ((v21 & v9 & 1) == 0 && v21)
    goto LABEL_25;
LABEL_7:

  return v14;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[UISplitViewControllerPanelImpl _sidebarArrowButtonRecognizer](self, "_sidebarArrowButtonRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 == v5;
}

- (void)_unspecifiedStylePresentationGestureRecognizerChanged:(id)a3
{
  int64_t v5;
  uint64_t v6;
  void *v7;
  int8x16_t v8;
  int8x16_t v9;
  float64x2_t v10;
  _BOOL4 v12;
  _BOOL4 v13;
  double v14;
  double v15;
  unint64_t v16;
  void *v17;
  void *v18;
  double v19;
  id v20;

  v20 = a3;
  v5 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v5)
  {
    v16 = v5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 7593, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v18);

  }
  v6 = objc_msgSend(v20, "state");
  if ((unint64_t)(v6 - 3) < 2)
  {
    self->_presentationGestureDirection = 0.0;
    goto LABEL_9;
  }
  if ((unint64_t)(v6 - 1) <= 1)
  {
    objc_msgSend(v20, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "velocityInView:", v7);
    if (*(double *)v8.i64 == 0.0)
    {
      self->_presentationGestureDirection = 0.0;
LABEL_7:

      goto LABEL_9;
    }
    v9.i64[0] = 1.0;
    v10.f64[0] = NAN;
    v10.f64[1] = NAN;
    v9.i64[0] = vbslq_s8((int8x16_t)vnegq_f64(v10), v9, v8).i64[0];
    if (*(double *)v9.i64 == 0.0 || *(double *)v9.i64 == self->_presentationGestureDirection)
    {
      *(_QWORD *)&self->_presentationGestureDirection = v9.i64[0];
      if (*(double *)v9.i64 == 0.0)
        goto LABEL_7;
    }
    else
    {
      v19 = *(double *)v9.i64;
      objc_msgSend(v20, "setTranslation:inView:", v7, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
      self->_presentationGestureDirection = v19;
    }
    v12 = -[UISplitViewControllerPanelImpl _isPrimaryShown](self, "_isPrimaryShown");
    v13 = -[UISplitViewControllerPanelImpl _layoutPrimaryOnRight](self, "_layoutPrimaryOnRight");
    v14 = 1.0;
    if (v13)
      v14 = -1.0;
    if (((v12 ^ (self->_presentationGestureDirection != v14)) & 1) == 0)
    {
      objc_msgSend(v20, "translationInView:", v7);
      if (fabs(v15) >= 40.0)
        -[UISplitViewControllerPanelImpl _unspecifiedStyleSetPrimaryShownFromGesture:](self, "_unspecifiedStyleSetPrimaryShownFromGesture:", !v12);
    }
    goto LABEL_7;
  }
LABEL_9:

}

- (void)_notifyFluidPresentationGestureWillBegin
{
  void *v3;
  $692BA5F601ABB544448C4E0A48A865F8 flags;
  void *v5;
  id WeakRetained;

  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentationGestureActive:", 1);

  flags = self->_flags;
  if ((*(_QWORD *)&flags & 0x1000000000) != 0)
  {
    self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(unint64_t *)&flags | 0x8000000);
    -[UISplitViewControllerPanelImpl _columnStyleDelegate](self, "_columnStyleDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v5, "splitViewControllerInteractivePresentationGestureWillBegin:", WeakRetained);
  }
  else
  {
    if ((*(_QWORD *)&flags & 0x2000000000) == 0)
      return;
    self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(unint64_t *)&flags | 0x8000000);
    -[UISplitViewControllerPanelImpl _columnStyleDelegate](self, "_columnStyleDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v5, "_splitViewControllerInteractiveSidebarGestureWillBegin:", WeakRetained);
  }

  *(_QWORD *)&self->_flags &= ~0x8000000uLL;
}

- (void)_notifyFluidPresentationGestureDidEnd
{
  void *v3;
  $692BA5F601ABB544448C4E0A48A865F8 flags;
  void *v5;
  id WeakRetained;

  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentationGestureActive:", 0);

  flags = self->_flags;
  if ((*(_QWORD *)&flags & 0x4000000000) != 0)
  {
    self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(unint64_t *)&flags | 0x8000000);
    -[UISplitViewControllerPanelImpl _columnStyleDelegate](self, "_columnStyleDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v5, "splitViewControllerInteractivePresentationGestureDidEnd:", WeakRetained);
  }
  else
  {
    if ((*(_QWORD *)&flags & 0x8000000000) == 0)
      return;
    self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(unint64_t *)&flags | 0x8000000);
    -[UISplitViewControllerPanelImpl _columnStyleDelegate](self, "_columnStyleDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v5, "_splitViewControllerInteractiveSidebarGestureDidEnd:", WeakRetained);
  }

  *(_QWORD *)&self->_flags &= ~0x8000000uLL;
}

- (void)_fluidPresentationGestureRecognizerChanged:(id)a3
{
  void *v5;
  id WeakRetained;
  void *v7;
  double MaxX;
  _BOOL4 v9;
  double v10;
  BOOL v11;
  _UIHyperpoint *v12;
  double v13;
  int v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  uint64_t *v19;
  void *v20;
  void *v21;
  _UIHyperpoint *v22;
  void *v23;
  void *v24;
  _UIHyperpoint *v25;
  void *v26;
  NSMutableArray *hyperpoints;
  void *v28;
  void *v29;
  _UIHyperrectangle *hyperrectangle;
  uint64_t v31;
  id v32;
  _UIHyperrectangle *v33;
  id v34;
  id v35;
  int64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  BOOL v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _UIHyperInteractor *v51;
  _UIHyperInteractor *interactor;
  uint64_t v53;
  id v54;
  _UIHyperInteractor *v55;
  const double *v56;
  double v57;
  void *v58;
  unint64_t v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  double v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  double v71;
  void *v72;
  uint64_t v73;
  void *v74;
  BOOL v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  unint64_t v82;
  id v83;
  _QWORD v84[4];
  id v85;
  _QWORD v86[4];
  id v87;
  _QWORD v88[7];
  BOOL v89;
  _QWORD v90[4];
  id v91;
  _QWORD v92[4];
  id v93;
  _QWORD v94[5];
  _QWORD v95[5];
  _QWORD v96[6];
  CGRect v97;

  v83 = a3;
  v82 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v82 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v82);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 7663, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v81);

  }
  -[NSMutableArray removeAllObjects](self->_hyperpoints, "removeAllObjects");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  MaxX = CGRectGetMaxX(v97);

  v9 = -[UISplitViewControllerPanelImpl _layoutPrimaryOnRight](self, "_layoutPrimaryOnRight");
  if (v9)
    v10 = MaxX;
  else
    v10 = 0.0;
  v11 = -[UISplitViewControllerPanelImpl _allowMoveToSecondaryOnlyGetIsInForcedOverlayFromGestureOrRestrictedWidth:](self, "_allowMoveToSecondaryOnlyGetIsInForcedOverlayFromGestureOrRestrictedWidth:", 0);
  if (v11 || -[UISplitViewControllerPanelImpl displayMode](self, "displayMode") == 1)
  {
    v12 = -[_UIHyperpoint initWithDimensions:]([_UIHyperpoint alloc], "initWithDimensions:", 1);
    v96[0] = MEMORY[0x1E0C809B0];
    v96[1] = 3221225472;
    v96[2] = __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke;
    v96[3] = &__block_descriptor_40_e9_v16__0_d8l;
    *(double *)&v96[4] = v10;
    -[_UIHyperpoint _mutateValue:](v12, "_mutateValue:", v96);
    -[NSMutableArray addObject:](self->_hyperpoints, "addObject:", v12);
    objc_msgSend(v5, "addObject:", &unk_1E1A974D0);
    if (!v11)
    {
      *(_QWORD *)&self->_flags |= 0x20000uLL;
      -[UISplitViewControllerPanelImpl setUserGeneratedDisplayMode:](self, "setUserGeneratedDisplayMode:", 3);
    }

  }
  if (v9)
    v13 = -1.0;
  else
    v13 = 1.0;
  v14 = -[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading");
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "possibleStates");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = minNonzeroPrimaryWidthInStates(v16, v14);

  if (v82 == 2)
  {
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "possibleStates");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v10 + v13 * minNonzeroSupplementaryWidthInStateWithPrimaryWidthGetMatchingState(v21, v14, 0, v17);

    v22 = -[_UIHyperpoint initWithDimensions:]([_UIHyperpoint alloc], "initWithDimensions:", 1);
    v95[0] = MEMORY[0x1E0C809B0];
    v19 = &qword_186677000;
    v95[1] = 3221225472;
    v95[2] = __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_400;
    v95[3] = &__block_descriptor_40_e9_v16__0_d8l;
    *(double *)&v95[4] = v10;
    -[_UIHyperpoint _mutateValue:](v22, "_mutateValue:", v95);
    -[NSMutableArray addObject:](self->_hyperpoints, "addObject:", v22);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v23);

    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
      goto LABEL_19;
    v18 = 2;
  }
  else
  {
    v18 = 1;
    v19 = &qword_186677000;
  }
  v25 = -[_UIHyperpoint initWithDimensions:]([_UIHyperpoint alloc], "initWithDimensions:", 1);
  v94[0] = MEMORY[0x1E0C809B0];
  v94[1] = v19[481];
  v94[2] = __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_2;
  v94[3] = &__block_descriptor_40_e9_v16__0_d8l;
  *(double *)&v94[4] = v13 * v17 + v10;
  -[_UIHyperpoint _mutateValue:](v25, "_mutateValue:", v94);
  -[NSMutableArray addObject:](self->_hyperpoints, "addObject:", v25);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v26);

LABEL_19:
  -[_UIHyperregionUnion _setRegions:](self->_regionUnion, "_setRegions:", self->_hyperpoints);
  hyperpoints = self->_hyperpoints;
  if (v9)
  {
    -[NSMutableArray lastObject](hyperpoints, "lastObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray firstObject](self->_hyperpoints, "firstObject");
  }
  else
  {
    -[NSMutableArray firstObject](hyperpoints, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray lastObject](self->_hyperpoints, "lastObject");
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  hyperrectangle = self->_hyperrectangle;
  v31 = MEMORY[0x1E0C809B0];
  v92[0] = MEMORY[0x1E0C809B0];
  v92[1] = 3221225472;
  v92[2] = __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_3;
  v92[3] = &unk_1E16B2FB8;
  v32 = v28;
  v93 = v32;
  -[_UIHyperrectangle _mutateMinimumPoint:](hyperrectangle, "_mutateMinimumPoint:", v92);
  v33 = self->_hyperrectangle;
  v90[0] = v31;
  v90[1] = 3221225472;
  v90[2] = __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_4;
  v90[3] = &unk_1E16B2FB8;
  v34 = v29;
  v91 = v34;
  -[_UIHyperrectangle _mutateMaximumPoint:](v33, "_mutateMaximumPoint:", v90);
  v35 = objc_loadWeakRetained((id *)&self->_svc);
  if (_UISplitViewControllerAutoHidesColumns(v35))
  {
    v36 = -[UISplitViewControllerPanelImpl splitBehavior](self, "splitBehavior");

    if (v36 == 1)
    {
      objc_msgSend(v5, "lastObject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "integerValue");

      v39 = -[UISplitViewControllerPanelImpl displayMode](self, "displayMode");
      v40 = 1;
      if (v38 == 1)
        v40 = 2;
      if (v38 == 2)
        v41 = 4;
      else
        v41 = v40;
      -[UISplitViewControllerPanelImpl _updateSplitBehaviorOverridesForTransitionFromDisplayMode:toDisplayMode:shouldResizeIfNecessary:]((uint64_t)self, v39, v41);
    }
  }
  else
  {

  }
  v42 = objc_msgSend(v83, "state");
  if ((unint64_t)(v42 - 3) < 2)
  {
    _UIUpdateRequestRegistryRemoveRecord((uint64_t)&mainRegistry, _fluidPresentationGestureRecognizerChanged__updateRequest, 0x10002Eu);
    -[UISplitViewControllerPanelImpl _notifyFluidPresentationGestureDidEnd](self, "_notifyFluidPresentationGestureDidEnd");
    -[_UIHyperInteractor _commitTranslation](self->_interactor, "_commitTranslation");
    v59 = -[_UIHyperregionUnion _regionIndexForClosestPoint:toPoint:](self->_regionUnion, "_regionIndexForClosestPoint:toPoint:", 0, -[_UIHyperInteractor _projectedPoint](self->_interactor, "_projectedPoint"));
    v60 = *-[_UIHyperInteractor _constrainedVelocity](self->_interactor, "_constrainedVelocity");
    -[NSMutableArray objectAtIndexedSubscript:](self->_hyperpoints, "objectAtIndexedSubscript:", v59);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = *(double *)objc_msgSend(v61, "_value");
    v63 = v62 - *-[_UIHyperInteractor _constrainedPoint](self->_interactor, "_constrainedPoint");

    -[_UIHyperInteractor _setRegion:](self->_interactor, "_setRegion:", self->_regionUnion);
    if (v63 == 0.0 || v60 == 0.0)
      v65 = 0.0;
    else
      v65 = v60 / v63;
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "interactiveStateRequest");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "rubberBandInset");
    v69 = v68;

    if (v65 > 22.5 && v69 == 0.0)
      v71 = 22.5;
    else
      v71 = v65;
    objc_msgSend(v5, "objectAtIndexedSubscript:", v59);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v72, "integerValue");

    -[UISplitViewControllerPanelImpl _setNumberOfSidebarColumnsVisibleFromGesture:withVelocity:](self, "_setNumberOfSidebarColumnsVisibleFromGesture:withVelocity:", v73, v71);
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v73) = objc_msgSend(v74, "isAnimating");

    if ((v73 & 1) == 0)
    {
      v75 = -[UISplitViewControllerPanelImpl _alwaysHideSidebarToggleButton](self, "_alwaysHideSidebarToggleButton");
      if (v82 == 2 && !v75)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        if (v76)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "navigationController");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "navigationBar");
          v79 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v79, "_endAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange");
          objc_msgSend(v79, "_setShouldFadeStaticNavBarButton:", 0);

        }
      }
      -[UISplitViewControllerPanelImpl panelController](self, "panelController");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setNavigationBarForContentLayoutGuideAnimation:", 0);
      goto LABEL_66;
    }
  }
  else
  {
    if (v42 == 2)
    {
LABEL_45:
      interactor = self->_interactor;
      v53 = MEMORY[0x1E0C809B0];
      v86[0] = MEMORY[0x1E0C809B0];
      v86[1] = 3221225472;
      v86[2] = __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_6;
      v86[3] = &unk_1E16B2FB8;
      v54 = v83;
      v87 = v54;
      -[_UIHyperInteractor _mutateTranslation:](interactor, "_mutateTranslation:", v86);
      v55 = self->_interactor;
      v84[0] = v53;
      v84[1] = 3221225472;
      v84[2] = __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_7;
      v84[3] = &unk_1E16B2FB8;
      v85 = v54;
      -[_UIHyperInteractor _mutateVelocity:](v55, "_mutateVelocity:", v84);
      v56 = -[_UIHyperInteractor _constrainedPoint](self->_interactor, "_constrainedPoint");
      v57 = *v56;
      if (v9)
        v57 = MaxX - *v56;
      -[UISplitViewControllerPanelImpl _setInteractiveSidebarWidth:](self, "_setInteractiveSidebarWidth:", v57);

      v58 = v87;
LABEL_66:

      goto LABEL_67;
    }
    if (v42 == 1)
    {
      _UIUpdateRequestRegistryAddRecord((uint64_t)&mainRegistry, _fluidPresentationGestureRecognizerChanged__updateRequest, 0x10002Eu);
      -[UISplitViewControllerPanelImpl _notifyFluidPresentationGestureWillBegin](self, "_notifyFluidPresentationGestureWillBegin");
      -[_UIHyperInteractor _setRegion:](self->_interactor, "_setRegion:", self->_hyperrectangle);
      -[UISplitViewControllerPanelImpl panelController](self, "panelController");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "stopAnimations");

      v44 = -[UISplitViewControllerPanelImpl _alwaysHideSidebarToggleButton](self, "_alwaysHideSidebarToggleButton");
      if (v82 == 2 && !v44)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (v45)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "navigationController");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "navigationBar");
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v48, "_staticNavBarButtonItem");
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v49)
            -[UISplitViewControllerPanelImpl _updateDisplayModeButtonItemForDisplayMode:](self, "_updateDisplayModeButtonItemForDisplayMode:", -[UISplitViewControllerPanelImpl allowedDisplayModeForCurrentSplitBehaviorGivenDisplayMode:](self, "allowedDisplayModeForCurrentSplitBehaviorGivenDisplayMode:", 3));
          if (!-[UIBarButtonItem isHidden](self->_sidebarToggleButtonItem, "isHidden")
            || -[_UIFloatableBarButtonItem _isFloatable](self->_sidebarToggleButtonItem, "_isFloatable")
            || -[UISplitViewControllerPanelImpl displayMode](self, "displayMode") == 6)
          {
            objc_msgSend(v48, "_setShouldFadeStaticNavBarButton:", -[_UIFloatableBarButtonItem _isFloatable](self->_sidebarToggleButtonItem, "_isFloatable") ^ 1);
            -[UISplitViewControllerPanelImpl panelController](self, "panelController");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "setNavigationBarForContentLayoutGuideAnimation:", v48);

          }
        }
      }
      v51 = self->_interactor;
      v88[0] = MEMORY[0x1E0C809B0];
      v88[1] = 3221225472;
      v88[2] = __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_5;
      v88[3] = &unk_1E16C1B68;
      v88[4] = self;
      v89 = !v9;
      *(double *)&v88[5] = v17;
      *(double *)&v88[6] = MaxX;
      -[_UIHyperInteractor _mutateUnconstrainedPoint:](v51, "_mutateUnconstrainedPoint:", v88);
      goto LABEL_45;
    }
  }
LABEL_67:

}

double __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke(uint64_t a1, double *a2)
{
  double result;

  result = *(double *)(a1 + 32);
  *a2 = result;
  return result;
}

double __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_400(uint64_t a1, double *a2)
{
  double result;

  result = *(double *)(a1 + 32);
  *a2 = result;
  return result;
}

double __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_2(uint64_t a1, double *a2)
{
  double result;

  result = *(double *)(a1 + 32);
  *a2 = result;
  return result;
}

double __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_3(uint64_t a1, _QWORD *a2)
{
  double *v3;
  double result;

  v3 = (double *)objc_msgSend(*(id *)(a1 + 32), "_value");
  result = *v3;
  *a2 = *(_QWORD *)v3;
  return result;
}

double __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_4(uint64_t a1, _QWORD *a2)
{
  double *v3;
  double result;

  v3 = (double *)objc_msgSend(*(id *)(a1 + 32), "_value");
  result = *v3;
  *a2 = *(_QWORD *)v3;
  return result;
}

void __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  double v14;

  objc_msgSend(*(id *)(a1 + 32), "panelController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactiveStateRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "_isPrimaryLeading"))
    objc_msgSend(v5, "leadingWidth");
  else
    objc_msgSend(v5, "trailingWidth");
  v7 = v6;
  v8 = 0.0;
  if (v6 > 0.0)
  {
    v9 = *(double *)(a1 + 40);
    v10 = v9 < v7;
    v11 = v9 - v7;
    if (v10)
      v8 = 0.0;
    else
      v8 = v11;
  }
  objc_msgSend(v5, "supplementaryWidth");
  v13 = v7 + v12 - v8;
  v14 = v13;
  if (!*(_BYTE *)(a1 + 56))
    v14 = *(double *)(a1 + 48) - v13;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "_getUnconstrainedPoint:forConstrainedPoint:", a2, &v14);

}

uint64_t __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_6(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(*(id *)(a1 + 32), "translationInView:", 0);
  *a2 = v4;
  return result;
}

uint64_t __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_7(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(*(id *)(a1 + 32), "velocityInView:", 0);
  *a2 = v4;
  return result;
}

- (void)_presentationGestureRecognizerChanged:(id)a3
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  int8x16_t v8;
  int8x16_t v9;
  float64x2_t v10;
  _BOOL4 v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  _BOOL4 v16;
  double v17;
  double presentationGestureDirection;
  uint64_t v19;
  int v21;
  double v22;
  $692BA5F601ABB544448C4E0A48A865F8 flags;
  uint64_t v24;
  double v25;
  id v26;

  v26 = a3;
  if (!-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    -[UISplitViewControllerPanelImpl _unspecifiedStylePresentationGestureRecognizerChanged:](self, "_unspecifiedStylePresentationGestureRecognizerChanged:", v26);
    goto LABEL_11;
  }
  if (-[UISplitViewControllerPanelImpl _shouldUseFluidSidebarGestures](self, "_shouldUseFluidSidebarGestures"))
  {
    -[UISplitViewControllerPanelImpl _fluidPresentationGestureRecognizerChanged:](self, "_fluidPresentationGestureRecognizerChanged:", v26);
LABEL_11:
    v6 = v26;
    goto LABEL_12;
  }
  v4 = objc_msgSend(v26, "state");
  if ((unint64_t)(v4 - 3) < 2)
  {
    *(_QWORD *)&self->_flags &= 0xFFFFFFFFFFFE7FFFLL;
    self->_presentationGestureDirection = 0.0;
    goto LABEL_11;
  }
  v5 = (unint64_t)(v4 - 1) > 1;
  v6 = v26;
  if (!v5)
  {
    objc_msgSend(v26, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "velocityInView:", v7);
    if (*(double *)v8.i64 == 0.0)
    {
      self->_presentationGestureDirection = 0.0;
LABEL_9:

      goto LABEL_11;
    }
    v9.i64[0] = 1.0;
    v10.f64[0] = NAN;
    v10.f64[1] = NAN;
    v9.i64[0] = vbslq_s8((int8x16_t)vnegq_f64(v10), v9, v8).i64[0];
    if (*(double *)v9.i64 == 0.0 || *(double *)v9.i64 == self->_presentationGestureDirection)
    {
      *(_QWORD *)&self->_presentationGestureDirection = v9.i64[0];
      if (*(double *)v9.i64 == 0.0)
        goto LABEL_9;
    }
    else
    {
      v25 = *(double *)v9.i64;
      objc_msgSend(v26, "setTranslation:inView:", v7, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
      self->_presentationGestureDirection = v25;
    }
    v12 = -[UISplitViewControllerPanelImpl _isPrimaryShown](self, "_isPrimaryShown");
    v13 = -[UIPanelController supportsColumnStyle](self->_panelController, "supportsColumnStyle");
    if (v13)
    {
      -[UIPanelController currentState](self->_panelController, "currentState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isSupplementaryVisible");

    }
    else
    {
      v15 = 0;
    }
    v16 = -[UISplitViewControllerPanelImpl _layoutPrimaryOnRight](self, "_layoutPrimaryOnRight");
    v17 = 1.0;
    if (v16)
      v17 = -1.0;
    presentationGestureDirection = self->_presentationGestureDirection;
    v19 = v17 == presentationGestureDirection;
    if (v17 == presentationGestureDirection && v12)
      v19 = v13 & (v15 ^ 1u);
    if (v17 == presentationGestureDirection)
      v21 = 0;
    else
      v21 = v12 | v15;
    if ((v19 | v21) != 1)
      goto LABEL_9;
    objc_msgSend(v26, "translationInView:", v7);
    if (fabs(v22) < 40.0)
      goto LABEL_9;
    if (v13)
    {
      flags = self->_flags;
      if ((*(_QWORD *)&flags & 0x18000) != 0)
        goto LABEL_9;
      if ((v19 ^ 1 | v15) != 1)
      {
        v24 = 0x8000;
        goto LABEL_40;
      }
      if ((v21 & v12) == 1)
      {
        v24 = 0x10000;
LABEL_40:
        self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(v24 | *(_QWORD *)&flags);
      }
    }
    -[UISplitViewControllerPanelImpl _setPrimaryShownFromGesture:hideAll:](self, "_setPrimaryShownFromGesture:hideAll:", v19, 0);
    goto LABEL_9;
  }
LABEL_12:

}

- (void)_setInteractiveSidebarWidth:(double)a3
{
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double MatchingState;
  id v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v6 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v6 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 7924, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v30);

  }
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stateRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading");
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "possibleStates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = minNonzeroPrimaryWidthInStates(v12, v10);
  v14 = v13;
  if (v6 == 2)
  {
    v31 = 0;
    MatchingState = minNonzeroSupplementaryWidthInStateWithPrimaryWidthGetMatchingState(v12, v10, &v31, v13);
    v16 = v31;
    if (v14 + MatchingState <= a3)
      v17 = v14 + MatchingState;
    else
      v17 = a3;
    v18 = a3 - (v14 + MatchingState);
    if (v17 >= MatchingState)
      v19 = MatchingState;
    else
      v19 = v17;
    objc_msgSend(v9, "setSupplementaryWidth:", v19);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0.0;
    if (v20)
    {
      objc_msgSend(v9, "supplementaryWidth");
      v21 = v17 - v22;
    }
    v23 = fmax(v18, 0.0);

  }
  else
  {
    v16 = 0;
    if (v13 <= a3)
      v21 = v13;
    else
      v21 = a3;
    v23 = fmax(a3 - v13, 0.0);
  }
  if (!v10)
  {
    objc_msgSend(v9, "setTrailingWidth:", v21);
    if (!v16)
      goto LABEL_22;
    goto LABEL_21;
  }
  objc_msgSend(v9, "setLeadingWidth:", v21);
  if (v16)
  {
LABEL_21:
    objc_msgSend(v16, "mainWidth");
    objc_msgSend(v9, "setMainWidth:");
  }
LABEL_22:
  objc_msgSend(v9, "setRubberBandInset:", v23);
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "currentState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stateRequest");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v9, "isEqual:", v26);

  if ((v27 & 1) == 0)
  {
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setInteractiveStateRequest:", v9);

  }
}

- (void)_unspecifiedStyleSetPrimaryShownFromGesture:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  int v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v3 = a3;
  v6 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v6)
  {
    v17 = v6;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 7967, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v19);

  }
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stateRequest");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  v9 = -[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading");
  v10 = v9;
  if (!v3)
  {
    v15 = 0.0;
    if (!v9)
    {
      v14 = v20;
LABEL_11:
      objc_msgSend(v14, "setTrailingWidth:", v15);
      goto LABEL_12;
    }
    v14 = v20;
LABEL_9:
    objc_msgSend(v14, "setLeadingWidth:", v15);
LABEL_12:
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "animateToRequest:", v20);

    v14 = v20;
    goto LABEL_13;
  }
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "possibleStates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = minNonzeroPrimaryWidthInStates(v12, v10);

  v14 = v20;
  if (v13 > 0.0)
  {
    v15 = v13;
    if (!v10)
      goto LABEL_11;
    goto LABEL_9;
  }
LABEL_13:

}

- (void)_setNumberOfSidebarColumnsVisibleFromGesture:(unint64_t)a3 withVelocity:(double)a4
{
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double MatchingState;
  id v19;
  double v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  $692BA5F601ABB544448C4E0A48A865F8 *p_flags;
  $692BA5F601ABB544448C4E0A48A865F8 flags;
  void *v26;
  void *v27;
  id v28;

  v8 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v8 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 7997, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v27);

  }
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stateRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading");
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "possibleStates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = minNonzeroPrimaryWidthInStates(v14, v12);

  if (v8 == 2)
  {
    if (a3 <= 1)
      v15 = 0.0;
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "possibleStates");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    MatchingState = minNonzeroSupplementaryWidthInStateWithPrimaryWidthGetMatchingState(v17, v12, &v28, v15);
    v19 = v28;

    if (a3)
      v20 = MatchingState;
    else
      v20 = 0.0;
    objc_msgSend(v11, "setSupplementaryWidth:", v20);
  }
  else
  {
    v19 = 0;
    if (!a3)
      v15 = 0.0;
  }
  if (!v12)
  {
    objc_msgSend(v11, "setTrailingWidth:", v15);
    if (!v19)
      goto LABEL_17;
    goto LABEL_16;
  }
  objc_msgSend(v11, "setLeadingWidth:", v15);
  if (v19)
  {
LABEL_16:
    objc_msgSend(v19, "mainWidth");
    objc_msgSend(v11, "setMainWidth:");
  }
LABEL_17:
  v21 = -[UISplitViewControllerPanelImpl _allowClientAnimationCoordination](self, "_allowClientAnimationCoordination");
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAnimationRequestShouldCoordinate:", v21);

  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "animateToRequest:forceOverlay:withVelocity:", v11, -[UISplitViewControllerPanelImpl _gestureIsForcingOverlay](self, "_gestureIsForcingOverlay"), a4);

  if (a3 == 1)
  {
    flags = self->_flags;
    if ((~*(_DWORD *)&self->_flags & 0xC0000) == 0)
    {
      p_flags = &self->_flags;
      goto LABEL_22;
    }
  }
  else if (!a3)
  {
    p_flags = &self->_flags;
    flags = self->_flags;
LABEL_22:
    *p_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&flags & 0xFFFFFFFFFFF3FFFFLL);
  }

}

- (void)_setPrimaryShownFromGesture:(BOOL)a3 hideAll:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v15;
  int v16;
  void *v17;
  void *v18;
  double v19;
  _BOOL4 v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;

  v4 = a4;
  v5 = a3;
  v8 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v8 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v8);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 8049, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v33);

  }
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stateRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leadingWidth");
  if (v12 == 0.0 && (objc_msgSend(v11, "trailingWidth"), v13 == 0.0))
  {
    objc_msgSend(v11, "supplementaryWidth");
    v15 = v14 == 0.0;
  }
  else
  {
    v15 = 0;
  }
  v16 = -[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading");
  if (!v5)
  {
    v34 = 0;
    v20 = -[UISplitViewControllerPanelImpl _allowMoveToSecondaryOnlyGetIsInForcedOverlayFromGestureOrRestrictedWidth:](self, "_allowMoveToSecondaryOnlyGetIsInForcedOverlayFromGestureOrRestrictedWidth:", &v34);
    v21 = 0;
    if (v8 == 2)
    {
      if (objc_msgSend(v10, "isSupplementaryVisible"))
      {
        if (v16)
          v22 = objc_msgSend(v10, "isLeadingVisible");
        else
          v22 = objc_msgSend(v10, "isTrailingVisible");
        v21 = v22 ^ 1;
        if (!v20)
        {
LABEL_33:
          objc_msgSend(v11, "supplementaryWidth");
          if (v30 > 0.0)
          {
LABEL_34:
            if (v16)
            {
              objc_msgSend(v11, "setLeadingWidth:", 0.0);
              goto LABEL_37;
            }
LABEL_36:
            objc_msgSend(v11, "setTrailingWidth:", 0.0);
          }
LABEL_37:
          -[UISplitViewControllerPanelImpl panelController](self, "panelController");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "animateToRequest:forceOverlay:", v11, v34);

          *(_QWORD *)&self->_flags &= 0xFFFFFFFFFFF3FFFFLL;
          goto LABEL_38;
        }
LABEL_25:
        if ((v4 | v21) != 1)
          goto LABEL_34;
        objc_msgSend(v11, "setSupplementaryWidth:", 0.0);
        if (v4)
        {
          objc_msgSend(v11, "setLeadingWidth:", 0.0);
          goto LABEL_36;
        }
        goto LABEL_37;
      }
      v21 = 0;
    }
    if (!v20)
      goto LABEL_33;
    goto LABEL_25;
  }
  if (v8 == 2 && (objc_msgSend(v10, "isSupplementaryVisible") & 1) == 0)
  {
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "possibleStates");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSupplementaryWidth:", minNonzeroSupplementaryWidthInStateWithPrimaryWidthGetMatchingState(v24, v16, 0, 0.0));

LABEL_19:
    if (v15)
      goto LABEL_20;
LABEL_29:
    *(_QWORD *)&self->_flags &= ~0x20000uLL;
    goto LABEL_30;
  }
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "possibleStates");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = minNonzeroPrimaryWidthInStates(v18, v16);

  if (v19 <= 0.0)
    goto LABEL_19;
  if (!v16)
  {
    objc_msgSend(v11, "setTrailingWidth:", v19);
    if (v15)
      goto LABEL_20;
    goto LABEL_29;
  }
  objc_msgSend(v11, "setLeadingWidth:", v19);
  if (!v15)
    goto LABEL_29;
LABEL_20:
  objc_msgSend(v11, "supplementaryWidth");
  if (v25 != 0.0)
    goto LABEL_29;
  objc_msgSend(v11, "leadingWidth");
  v27 = v26;
  objc_msgSend(v11, "trailingWidth");
  if (v27 + v28 <= 0.0)
    goto LABEL_29;
  *(_QWORD *)&self->_flags |= 0x20000uLL;
  -[UISplitViewControllerPanelImpl setUserGeneratedDisplayMode:](self, "setUserGeneratedDisplayMode:", 3);
LABEL_30:
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "animateToRequest:forceOverlay:", v11, (*(_QWORD *)&self->_flags >> 17) & 1);

LABEL_38:
}

- (void)dimmingViewWasTapped:(id)a3
{
  _BOOL4 v4;
  int64_t v5;
  _BOOL8 v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;

  if (-[UISplitViewControllerPanelImpl style](self, "style", a3))
  {
    v4 = -[UISplitViewControllerPanelImpl _shouldUseFluidSidebarGestures](self, "_shouldUseFluidSidebarGestures");
    v5 = -[UISplitViewControllerPanelImpl splitBehavior](self, "splitBehavior");
    if (v4)
    {
      v6 = v5 == 3;
      v7 = -[UISplitViewControllerPanelImpl style](self, "style");
      if (!-[UISplitViewControllerPanelImpl _alwaysHideSidebarToggleButton](self, "_alwaysHideSidebarToggleButton")
        && v7 == 2)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A974B8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "navigationController");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "navigationBar");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!-[UIBarButtonItem isHidden](self->_sidebarToggleButtonItem, "isHidden")
            || -[_UIFloatableBarButtonItem _isFloatable](self->_sidebarToggleButtonItem, "_isFloatable")
            || -[UISplitViewControllerPanelImpl displayMode](self, "displayMode") == 6)
          {
            -[UISplitViewControllerPanelImpl panelController](self, "panelController");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setNavigationBarForContentLayoutGuideAnimation:", v11);

            objc_msgSend(v11, "_setShouldFadeStaticNavBarButton:", -[_UIFloatableBarButtonItem _isFloatable](self->_sidebarToggleButtonItem, "_isFloatable") ^ 1);
          }

        }
      }
      v13 = -[UISplitViewControllerPanelImpl _allowClientAnimationCoordination](self, "_allowClientAnimationCoordination");
      -[UISplitViewControllerPanelImpl panelController](self, "panelController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAnimationRequestShouldCoordinate:", v13);

      -[UISplitViewControllerPanelImpl _setNumberOfSidebarColumnsVisibleFromGesture:withVelocity:](self, "_setNumberOfSidebarColumnsVisibleFromGesture:withVelocity:", v6, 0.0);
    }
    else
    {
      -[UISplitViewControllerPanelImpl _setPrimaryShownFromGesture:hideAll:](self, "_setPrimaryShownFromGesture:hideAll:", 0, v5 != 3);
    }
  }
  else
  {
    -[UISplitViewControllerPanelImpl _unspecifiedStyleSetPrimaryShownFromGesture:](self, "_unspecifiedStyleSetPrimaryShownFromGesture:", 0);
  }
}

- (BOOL)_allowsFocusBehindDimmingView
{
  return 0;
}

- (int64_t)_nextTargetDisplayModeForDisplayMode:(int64_t)a3 showMoreIfPossible:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  int64_t v18;
  BOOL v19;
  void *v21;
  void *v22;
  void *v23;

  v4 = a4;
  v8 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v8 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 8169, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v22);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "horizontalSizeClass");

  if (v11 == 1)
  {
LABEL_4:
    a3 = 0;
  }
  else if (a3)
  {
    v12 = -[UISplitViewControllerPanelImpl splitBehavior](self, "splitBehavior");
    v13 = v12;
    switch(a3)
    {
      case 1:
        if (v12 == 2)
          a3 = 3;
        else
          a3 = 2;
        break;
      case 2:
        if (v12 == 2)
          a3 = 3;
        else
          a3 = 1;
        if (v8 != 2 || v12 == 2)
          break;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 4;
        if (v13 == 3)
          v15 = 6;
        if (v14 != 0 && v4)
          a3 = v15;
        else
          a3 = 1;
        goto LABEL_30;
      case 3:
        if (v12 == 2)
          a3 = 1;
        else
          a3 = 3;
        if (v8 != 2 || v12 != 2)
          break;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 5;
        if (!v4)
          v16 = 1;
        if (v14)
          a3 = v16;
        else
          a3 = 1;
LABEL_30:

        break;
      case 4:
        v17 = 2;
        v18 = 5;
        if (v12 == 3)
          v18 = 6;
        v19 = v12 == 1;
        goto LABEL_40;
      case 5:
        v17 = 3;
        v18 = 4;
        if (v12 == 3)
          v18 = 6;
        v19 = v12 == 2;
        goto LABEL_40;
      case 6:
        v17 = 2;
        v18 = 4;
        if (v12 != 1)
          v18 = 5;
        v19 = v12 == 3;
LABEL_40:
        if (v19)
          a3 = v17;
        else
          a3 = v18;
        break;
      default:
        goto LABEL_4;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 8181, CFSTR("Unexpected use of UISplitViewControllerDisplayModeAutomatic. This is a UIKit issue."));

    -[UISplitViewControllerPanelImpl splitBehavior](self, "splitBehavior");
  }

  return a3;
}

- (id)_enterFullScreenSymbolImage
{
  void *v2;
  void *v3;

  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.up.left.and.arrow.down.right"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageFlippedForRightToLeftLayoutDirection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_leaveFullScreenSymbolImage
{
  void *v2;
  void *v3;

  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.down.right.and.arrow.up.left"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageFlippedForRightToLeftLayoutDirection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_fullScreenSymbolImageForDisplayMode:(int64_t)a3
{
  if (!a3)
    a3 = -[UISplitViewControllerPanelImpl _concreteDisplayModeForCurrentEnvironment](self, "_concreteDisplayModeForCurrentEnvironment");
  if (a3 == 1)
    -[UISplitViewControllerPanelImpl _leaveFullScreenSymbolImage](self, "_leaveFullScreenSymbolImage");
  else
    -[UISplitViewControllerPanelImpl _enterFullScreenSymbolImage](self, "_enterFullScreenSymbolImage");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_sidebarChevronSymbolImage
{
  const __CFString *v2;

  if (-[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading"))
    v2 = CFSTR("chevron.backward");
  else
    v2 = CFSTR("chevron.forward");
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v2);
}

- (void)_setVisibleToggleButtonRequiresPresentsWithGesture:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (a3)
    v3 = 0;
  self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFEFFFFFLL | v3);
}

void __77__UISplitViewControllerPanelImpl__updateDisplayModeButtonItemForDisplayMode___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  objc_msgSend(a2, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_effectiveBackBarButtonItem");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "title");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[4] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(v21, "_backButtonAlternateTitles");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1[5] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(v21, "image");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  objc_msgSend(v21, "largeContentSizeImage");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1[7] + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  objc_msgSend(v21, "largeContentSizeImageInsets");
  v16 = *(_QWORD **)(a1[8] + 8);
  v16[4] = v17;
  v16[5] = v18;
  v16[6] = v19;
  v16[7] = v20;

}

uint64_t __77__UISplitViewControllerPanelImpl__updateDisplayModeButtonItemForDisplayMode___block_invoke_2(uint64_t result, uint64_t a2, _BYTE *a3)
{
  if (*(_QWORD *)(result + 32) == a2)
  {
    *a3 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)_unspecifiedStyleTriggerDisplayModeAction:(id)a3
{
  int v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = -[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading", a3);
  v5 = -[UISplitViewControllerPanelImpl _effectiveTargetDisplayMode](self, "_effectiveTargetDisplayMode");
  if ((unint64_t)(v5 - 2) < 2)
  {
    -[UISplitViewControllerPanelImpl _setPanelConfigurationWithIsPrimaryShown:shouldUseOverlay:](self, "_setPanelConfigurationWithIsPrimaryShown:shouldUseOverlay:", 1, v5 == 3);
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uncachedPossibleStates");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stateRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = minNonzeroPrimaryWidthInStates(v14, v4);
    if (v4)
      objc_msgSend(v9, "setLeadingWidth:", v10);
    else
      objc_msgSend(v9, "setTrailingWidth:", v10);
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "animateToRequest:", v9);

LABEL_12:
    return;
  }
  if (v5 == 1)
  {
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stateRequest");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v4)
      objc_msgSend(v14, "setLeadingWidth:", 0.0);
    else
      objc_msgSend(v14, "setTrailingWidth:", 0.0);
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "animateToRequest:", v14);
    goto LABEL_12;
  }
}

- (void)_validateTriggerSidebarKeyCommand:(id)a3
{
  $692BA5F601ABB544448C4E0A48A865F8 flags;
  id v4;
  __CFString *v5;
  id v6;

  flags = self->_flags;
  v4 = a3;
  if ((*(_DWORD *)&flags & 0x800000) != 0)
    v5 = CFSTR("Hide Sidebar");
  else
    v5 = CFSTR("Show Sidebar");
  _UINSLocalizedStringWithDefaultValue(v5, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v6);

}

- (BOOL)_allowsTriggeringSidebarKeyCommandAction
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 6) & 1;
}

- (void)_triggerSidebarKeyCommandAction:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;

  v5 = -[UISplitViewControllerPanelImpl style](self, "style", a3);
  if (v5 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 8931, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v10);

  }
  if (!-[UISplitViewControllerPanelImpl _isCollapsedOrCollapsing](self, "_isCollapsedOrCollapsing"))
  {
    v6 = -[UISplitViewControllerPanelImpl displayMode](self, "displayMode");
    if (v5 == 2)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = 1;
        if (v6 > 6)
        {
LABEL_9:
          -[UISplitViewControllerPanelImpl _transitionFromDisplayMode:toDisplayMode:](self, "_transitionFromDisplayMode:toDisplayMode:", v6, v8);
          return;
        }
        if (((1 << v6) & 0x56) == 0)
        {
          if (v6 != 3)
            goto LABEL_9;
          if ((*((_BYTE *)&self->_flags + 2) & 2) != 0)
            -[UISplitViewControllerPanelImpl setUserGeneratedDisplayMode:](self, "setUserGeneratedDisplayMode:", 2, 1);
        }
      }
    }
    v8 = -[UISplitViewControllerPanelImpl _nextTargetDisplayModeForDisplayMode:showMoreIfPossible:](self, "_nextTargetDisplayModeForDisplayMode:showMoreIfPossible:", v6, 1);
    goto LABEL_9;
  }
}

- (void)_triggerSecondaryOnlyShortcutAction:(id)a3
{
  int64_t v4;
  int64_t v5;

  v4 = -[UISplitViewControllerPanelImpl displayMode](self, "displayMode", a3);
  if (v4 == 1)
    v5 = -[UISplitViewControllerPanelImpl _nextTargetDisplayModeForDisplayMode:showMoreIfPossible:](self, "_nextTargetDisplayModeForDisplayMode:showMoreIfPossible:", 1, 1);
  else
    v5 = 1;
  -[UISplitViewControllerPanelImpl _transitionFromDisplayMode:toDisplayMode:updateSplitBehaviorOverrides:userGenerated:](self, "_transitionFromDisplayMode:toDisplayMode:updateSplitBehaviorOverrides:userGenerated:", v4, v5, 0, 1);
}

- (void)_triggerDisplayModeAction:(id)a3
{
  int64_t v4;
  int64_t v5;
  _BOOL8 v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[UISplitViewControllerPanelImpl style](self, "style"))
  {
    v4 = -[UISplitViewControllerPanelImpl displayMode](self, "displayMode");
    v5 = -[UISplitViewControllerPanelImpl _nextTargetDisplayModeForDisplayMode:showMoreIfPossible:](self, "_nextTargetDisplayModeForDisplayMode:showMoreIfPossible:", v4, 1);
    v6 = -[UISplitViewControllerPanelImpl _allowClientAnimationCoordination](self, "_allowClientAnimationCoordination");
    -[UISplitViewControllerPanelImpl panelController](self, "panelController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAnimationRequestShouldCoordinate:", v6);

    if (qword_1ECD7D5A8 != -1)
      dispatch_once(&qword_1ECD7D5A8, &__block_literal_global_1258);
    -[UISplitViewControllerPanelImpl _transitionFromDisplayMode:toDisplayMode:](self, "_transitionFromDisplayMode:toDisplayMode:", v4, v5);
  }
  else
  {
    -[UISplitViewControllerPanelImpl _unspecifiedStyleTriggerDisplayModeAction:](self, "_unspecifiedStyleTriggerDisplayModeAction:", v8);
  }

}

- (id)_childContainingSender:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[UISplitViewControllerPanelImpl panelController](self, "panelController", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allViewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v4, "_isMemberOfViewControllerHierarchy:", v10) & 1) != 0)
          {
            v7 = v10;
            goto LABEL_13;
          }
        }
        v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_pushOverrideOfReportedDisplayMode:(int64_t)a3
{
  NSMutableArray *overrideReportedDisplayModeStack;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  overrideReportedDisplayModeStack = self->_overrideReportedDisplayModeStack;
  if (!overrideReportedDisplayModeStack)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_overrideReportedDisplayModeStack;
    self->_overrideReportedDisplayModeStack = v6;

    overrideReportedDisplayModeStack = self->_overrideReportedDisplayModeStack;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](overrideReportedDisplayModeStack, "addObject:", v8);

}

- (void)_popOverrideOfReportedDisplayMode
{
  int has_internal_diagnostics;
  uint64_t v4;
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v4 = -[NSMutableArray count](self->_overrideReportedDisplayModeStack, "count");
  if (has_internal_diagnostics)
  {
    if (!v4)
    {
      __UIFaultDebugAssertLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "UISVCPanelImpl _popOverrideOfReportedDisplayMode: stack is empty, can't pop", buf, 2u);
      }

    }
  }
  else if (!v4)
  {
    v6 = _popOverrideOfReportedDisplayMode___s_category;
    if (!_popOverrideOfReportedDisplayMode___s_category)
    {
      v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&_popOverrideOfReportedDisplayMode___s_category);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "UISVCPanelImpl _popOverrideOfReportedDisplayMode: stack is empty, can't pop", v8, 2u);
    }
  }
  -[NSMutableArray removeLastObject](self->_overrideReportedDisplayModeStack, "removeLastObject");
}

- (int64_t)_primaryHidingState
{
  return (*(_QWORD *)&self->_flags >> 1) & 3;
}

- (BOOL)_iPadShouldUseOverlayInCurrentEnvironment
{
  id WeakRetained;
  int64_t transitioningToOrientation;
  double width;
  void *v6;
  double v7;
  int64_t v8;
  BOOL v9;
  BOOL v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if ((*(_QWORD *)&self->_flags & 0x100) != 0)
  {
    transitioningToOrientation = self->_transitioningToOrientation;
    goto LABEL_3;
  }
  transitioningToOrientation = -[UISplitViewControllerPanelImpl _svcViewWindowOrientation](self, "_svcViewWindowOrientation");
  if ((*(_QWORD *)&self->_flags & 0x100) != 0)
  {
LABEL_3:
    width = self->_transitioningToSize.width;
    goto LABEL_6;
  }
  objc_msgSend(WeakRetained, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  width = v7;

LABEL_6:
  v8 = -[UISplitViewControllerPanelImpl _fullScreenStateForOrientation:viewWidth:](self, "_fullScreenStateForOrientation:viewWidth:", transitioningToOrientation, width);
  v9 = (unint64_t)(transitioningToOrientation - 1) < 2;
  if (v8 == 2)
    v9 = 0;
  v10 = v8 == 1 || v9;

  return v10;
}

- (BOOL)_iPhoneShouldUseOverlayInCurrentEnvironment
{
  BOOL v3;
  id WeakRetained;
  BOOL v5;

  v3 = -[UISplitViewControllerPanelImpl usesDeviceOverlayPreferences](self, "usesDeviceOverlayPreferences")
    && -[UISplitViewControllerPanelImpl prefersOverlayInRegularWidthPhone](self, "prefersOverlayInRegularWidthPhone")
    || +[UISplitViewController _automaticDisplayModeOnPhoneUsesOverlayInLandscapeDefaultValue](UISplitViewController, "_automaticDisplayModeOnPhoneUsesOverlayInLandscapeDefaultValue");
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v5 = (objc_msgSend(WeakRetained, "presentsWithGesture") & 1) != 0
    || -[UISplitViewControllerDisplayModeBarButtonItem _hasBeenUsed](self->_unspecifiedStyleDisplayModeButtonItem, "_hasBeenUsed");

  return v3 && v5;
}

- (int64_t)_currentInterfaceIdiom
{
  id WeakRetained;
  void *v3;
  int64_t v4;
  void *v6;
  int64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 != -1)
    return v4;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  return v7;
}

- (int64_t)_fullScreenStateForOrientation:(int64_t)a3 viewWidth:(double)a4
{
  void *v7;
  uint64_t v8;
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  double v16;
  double v17;
  int64_t v18;
  double v20;
  unint64_t v21;
  double v22;
  BOOL v23;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 != 1)
    return 0;
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_screen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v12, "_window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_windowHostingScene");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "_sceneSessionRoleIsCarPlayOrNonInteractiveExternal");

  if ((v15 & 1) != 0 || (objc_msgSend(v11, "_boundsForInterfaceOrientation:", a3), v16 <= a4))
  {
    v18 = 0;
  }
  else
  {
    v20 = fmax(v16, v17);
    v21 = a3 - 5;
    v22 = v16 * 0.5;
    if (v20 <= 1210.0 || v21 < 0xFFFFFFFFFFFFFFFELL || (v16 * 0.3 < a4 ? (v23 = v22 < a4) : (v23 = 1), v23))
    {
      if (v21 > 0xFFFFFFFFFFFFFFFDLL && v22 < a4 && v20 <= 1112.0 && v20 <= 1210.0)
        v18 = 1;
      else
        v18 = 2;
    }
    else
    {
      v18 = 1;
    }
  }

  return v18;
}

- (BOOL)_setPanelConfigurationWithIsPrimaryShown:(BOOL)a3 isSupplementaryShown:(BOOL)a4 shouldUseOverlay:(BOOL)a5 dimMainIfNecessary:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  int64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id WeakRetained;
  void *v20;
  id v21;
  void *v22;
  double v23;
  double width;
  double v25;
  double height;
  _BOOL4 v27;
  void *v28;
  int64_t v29;
  void *v30;
  unint64_t v31;
  void *v32;
  unint64_t v33;
  BOOL v34;
  _BOOL4 v35;
  int v36;
  int v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  _BOOL4 v43;
  unsigned int v44;
  uint64_t v45;
  double v46;
  void *v47;
  void *v48;
  _BOOL8 v49;
  _BOOL8 v50;
  void *v51;
  unint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  _BOOL4 v57;
  _BOOL4 v58;
  double v59;
  double v60;
  void *v61;
  _QWORD v62[2];

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v62[1] = *MEMORY[0x1E0C80C00];
  v12 = -[UISplitViewControllerPanelImpl style](self, "style");
  if ((unint64_t)(v12 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v53 = v12;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v53);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 9272, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v55);

  }
  v13 = v9 || v8;
  v14 = v9 && v8;
  v15 = 2;
  if (v9 && v8)
    v15 = 4;
  v16 = 2;
  if (v14)
    v16 = 6;
  if (v6)
    v15 = v16;
  v34 = v14 == 0;
  v17 = 3;
  if (!v34)
    v17 = 5;
  if (!v7)
    v17 = v15;
  if (v13 == 1)
    v18 = v17;
  else
    v18 = 1;
  v59 = 0.0;
  v60 = 0.0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_existingView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v7;
  v58 = v8;
  if (!v20)
  {
    v27 = v6;

LABEL_22:
    v28 = (void *)MEMORY[0x1E0C9AA60];
    v56 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_23;
  }

  if (!v13)
  {
    v27 = v6;
    goto LABEL_22;
  }
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    width = self->_transitioningToSize.width;
    height = self->_transitioningToSize.height;
  }
  else
  {
    v21 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v21, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    width = v23;
    height = v25;

  }
  -[UISplitViewControllerPanelImpl getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:shouldUseOverlay:](self, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:shouldUseOverlay:", &v60, &v59, v18, v7, width, height);
  if (v60 <= 0.0)
  {
    v28 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v60);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v27 = v6;
  if (v59 <= 0.0)
  {
    v56 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v59);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_23:
  v29 = -[UISplitViewControllerPanelImpl _nextTargetDisplayModeForDisplayMode:showMoreIfPossible:](self, "_nextTargetDisplayModeForDisplayMode:showMoreIfPossible:", v18, 0);
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "configuration");
  v31 = v18;
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = v31;
  if (v29)
    v34 = v29 == v31;
  else
    v34 = 1;
  v35 = !v34;
  v36 = !v34 || v57;
  v37 = !v9 | v36;
  v38 = -[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading");
  if (!v9 || !v58)
  {
    if (!v9)
    {
      if (v38)
        objc_msgSend(v32, "leadingWidths");
      else
        objc_msgSend(v32, "trailingWidths");
      v41 = objc_claimAutoreleasedReturnValue();

      v28 = (void *)v41;
    }
    if (!v58)
    {
      objc_msgSend(v32, "supplementaryWidths");
      v42 = objc_claimAutoreleasedReturnValue();

      v56 = (void *)v42;
    }
  }
  -[_UIHyperConstantExtender _maximumDistance](self->_extender, "_maximumDistance");
  objc_msgSend(v32, "setRubberBandExtension:");
  objc_msgSend(v32, "setSupplementaryEdge:", self->_primaryEdge);
  objc_msgSend(v32, "setLeadingMayBeHidden:", v37 & v38);
  objc_msgSend(v32, "setTrailingMayBeHidden:", v37 & !v38);
  v43 = v33 < 4 && v35;
  v44 = v43 || v57;
  if (v58)
    v45 = v44;
  else
    v45 = 1;
  objc_msgSend(v32, "setSupplementaryMayBeHidden:", v45);
  v46 = 0.0;
  if (v57)
    v46 = 1.0;
  objc_msgSend(v32, "setMinimumMainWidthFraction:", v46);
  if (v38)
    v47 = v28;
  else
    v47 = (void *)MEMORY[0x1E0C9AA60];
  if (v38)
    v48 = (void *)MEMORY[0x1E0C9AA60];
  else
    v48 = v28;
  objc_msgSend(v32, "setLeadingWidths:", v47);
  objc_msgSend(v32, "setTrailingWidths:", v48);
  objc_msgSend(v32, "setSupplementaryWidths:", v56);
  objc_msgSend(v32, "setAllowTotalWidthGreaterThanParent:", !v57 & v27);
  v49 = v57 && -[UISplitViewControllerPanelImpl userGeneratedDisplayMode](self, "userGeneratedDisplayMode") == 3;
  objc_msgSend(v32, "setForceOverlay:", v49);
  v50 = (objc_msgSend(v32, "forceOverlay") & 1) != 0
     || -[UISplitViewControllerPanelImpl splitBehavior](self, "splitBehavior") != 1;
  objc_msgSend(v32, "setShouldFadeStaticNavBarButton:", v50);
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setConfiguration:", v32);

  return v35;
}

- (BOOL)_setPanelConfigurationWithIsPrimaryShown:(BOOL)a3 shouldUseOverlay:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  int64_t v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  int64_t v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  BOOL v28;
  int v29;
  int v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v36;
  void *v37;
  void *v38;
  _QWORD v39[2];

  v4 = a4;
  v5 = a3;
  v39[1] = *MEMORY[0x1E0C80C00];
  v8 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v8)
  {
    v36 = v8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 9337, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v38);

  }
  v9 = (void *)MEMORY[0x1E0C9AA60];
  v10 = (void *)MEMORY[0x1E0C9AA60];
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "_existingView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v13, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bounds");
      -[UISplitViewControllerPanelImpl _primaryColumnWidthForSize:shouldUseOverlay:](self, "_primaryColumnWidthForSize:shouldUseOverlay:", v4, v15, v16);
      v18 = v17;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  v20 = 2;
  if (v4)
  {
    v20 = 3;
    v21 = 1.0;
  }
  else
  {
    v21 = 0.0;
  }
  if (v5)
    v22 = v20;
  else
    v22 = 1;
  v23 = -[UISplitViewControllerPanelImpl _effectiveTargetDisplayModeForDisplayMode:](self, "_effectiveTargetDisplayModeForDisplayMode:", v22);
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "configuration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");

  if (v23)
    v27 = v23 == v22;
  else
    v27 = 1;
  v28 = !v27;
  v29 = !v27 || v4;
  v30 = !v5 | v29;
  v31 = -[UISplitViewControllerPanelImpl _isPrimaryLeading](self, "_isPrimaryLeading");
  objc_msgSend(v26, "setLeadingMayBeHidden:", v30 & v31);
  objc_msgSend(v26, "setTrailingMayBeHidden:", v30 & !v31);
  objc_msgSend(v26, "setMinimumMainWidthFraction:", v21);
  if (v31)
    v32 = v10;
  else
    v32 = v9;
  if (v31)
    v33 = v9;
  else
    v33 = v10;
  objc_msgSend(v26, "setLeadingWidths:", v32);
  objc_msgSend(v26, "setTrailingWidths:", v33);
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setConfiguration:", v26);

  return v28;
}

- (void)_stopTransitionsInViewController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_stopTransitionsImmediately");
  objc_msgSend(v4, "childViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[UISplitViewControllerPanelImpl _stopTransitionsInViewController:](self, "_stopTransitionsInViewController:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_tabBarControllerDidChangeSelection:(id)a3
{
  id v4;

  v4 = a3;
  if (-[UISplitViewControllerPanelImpl _columnForViewController:](self, "_columnForViewController:") == 2)
    -[UISplitViewControllerPanelImpl setViewController:forColumn:](self, "setViewController:forColumn:", v4, 2);

}

- (BOOL)_navigationControllerShouldNotAdjustTransitioningSizeForChildContainer:(id)a3
{
  return (unint64_t)-[UISplitViewControllerPanelImpl _columnForMonitoredNavigationController:](self, "_columnForMonitoredNavigationController:", a3) < 3;
}

void __116__UISplitViewControllerPanelImpl__updateDisplayModeButtonItemAndResetForCanceledAnimationWithTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;

  if (objc_msgSend(a2, "isCancelled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_updateDisplayModeButtonItem");

  }
}

- (id)_navigationController:(id)a3 navigationBarAdditionalActionsForBackButtonMenu:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  _BOOL4 v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v21;
  void *v22;
  uint64_t v23;
  BOOL v24;
  _BOOL4 v25;
  void *v26;
  void **v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id (*v34)(uint64_t, unint64_t);
  void *v35;
  UISplitViewControllerPanelImpl *v36;
  void *v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[UISplitViewControllerPanelImpl style](self, "style");
  if (v7 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v7);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 9584, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v31);

  }
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "collapsedState"))
  {

LABEL_16:
    v16 = 0;
    goto LABEL_17;
  }
  v9 = -[UIBarButtonItem _actsAsFakeBackButton](self->_sidebarToggleButtonItem, "_actsAsFakeBackButton");

  if (!v9)
    goto LABEL_16;
  v10 = -[UISplitViewControllerPanelImpl _columnForMonitoredNavigationController:](self, "_columnForMonitoredNavigationController:", v6);
  v11 = -[UISplitViewControllerPanelImpl splitBehavior](self, "splitBehavior");
  v12 = -[UISplitViewControllerPanelImpl displayMode](self, "displayMode");
  v13 = v12;
  if (v10 == 2 && v12 == 1 && v11 == 2)
  {
    v32 = MEMORY[0x1E0C809B0];
    v33 = 3221225472;
    v34 = __104__UISplitViewControllerPanelImpl__navigationController_navigationBarAdditionalActionsForBackButtonMenu___block_invoke;
    v35 = &unk_1E16C1C30;
    v36 = self;
    if (v7 != 2)
    {
LABEL_10:
      __104__UISplitViewControllerPanelImpl__navigationController_navigationBarAdditionalActionsForBackButtonMenu___block_invoke((uint64_t)&v32, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
LABEL_36:
      v24 = v14 != 0;
      v25 = v15 != 0;
      goto LABEL_37;
    }
  }
  else
  {
    v16 = 0;
    if (v7 != 2 || v10 != 1)
      goto LABEL_17;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
      goto LABEL_16;
    if (v13 == 3)
    {

    }
    else
    {

      v16 = 0;
      if (v13 != 2 || v11 != 3)
        goto LABEL_17;
    }
    v32 = MEMORY[0x1E0C809B0];
    v33 = 3221225472;
    v34 = __104__UISplitViewControllerPanelImpl__navigationController_navigationBarAdditionalActionsForBackButtonMenu___block_invoke;
    v35 = &unk_1E16C1C30;
    v36 = self;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    if (v10 == 2)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
        goto LABEL_10;
      __104__UISplitViewControllerPanelImpl__navigationController_navigationBarAdditionalActionsForBackButtonMenu___block_invoke((uint64_t)&v32, 1uLL);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    v14 = 0;
    goto LABEL_36;
  }
  if (v10 == 2)
  {
    __104__UISplitViewControllerPanelImpl__navigationController_navigationBarAdditionalActionsForBackButtonMenu___block_invoke((uint64_t)&v32, 1uLL);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34((uint64_t)&v32, 0);
  }
  else
  {
    v15 = 0;
    __104__UISplitViewControllerPanelImpl__navigationController_navigationBarAdditionalActionsForBackButtonMenu___block_invoke((uint64_t)&v32, 0);
  }
  v23 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v23;
  v24 = v23 != 0;
  v25 = v15 != 0;
  if (v23 && v15)
  {
    v38[0] = v15;
    v38[1] = v23;
    v26 = (void *)MEMORY[0x1E0C99D20];
    v27 = (void **)v38;
    v28 = 2;
LABEL_44:
    objc_msgSend(v26, "arrayWithObjects:count:", v27, v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_45;
  }
LABEL_37:
  if (v24 || v25)
  {
    if (v25)
      v29 = v15;
    else
      v29 = v14;
    v37 = v29;
    v26 = (void *)MEMORY[0x1E0C99D20];
    v27 = &v37;
    v28 = 1;
    goto LABEL_44;
  }
  v16 = 0;
LABEL_45:

LABEL_17:
  if (v16)
    v18 = v16;
  else
    v18 = (void *)MEMORY[0x1E0C9AA60];
  v19 = v18;

  return v19;
}

id __104__UISplitViewControllerPanelImpl__navigationController_navigationBarAdditionalActionsForBackButtonMenu___block_invoke(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  _QWORD v18[6];

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_backButtonTitleAllowingGenericTitles:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  if (objc_msgSend(v9, "length"))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    _UISplitViewControllerColumnDescription(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Show%@<UISplitViewController:%p>"), v13, WeakRetained);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __104__UISplitViewControllerPanelImpl__navigationController_navigationBarAdditionalActionsForBackButtonMenu___block_invoke_2;
    v18[3] = &unk_1E16C1C08;
    v18[4] = *(_QWORD *)(a1 + 32);
    v18[5] = a2;
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v9, 0, v15, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __104__UISplitViewControllerPanelImpl__navigationController_navigationBarAdditionalActionsForBackButtonMenu___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showColumn:", *(_QWORD *)(a1 + 40));
}

- (void)_allowingMutationsInDelegateCallback:(id)a3
{
  $692BA5F601ABB544448C4E0A48A865F8 flags;

  flags = self->_flags;
  self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&flags & 0xFFFFFFFFF7FFFFFFLL);
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&self->_flags & 0xFFFFFFFFF7FFFFFFLL | (((*(unint64_t *)&flags >> 27) & 1) << 27));
}

- (BOOL)_hasDoubleSideBar
{
  int64_t v4;
  unint64_t v5;
  void *v6;
  BOOL v7;
  void *v9;

  v4 = -[UISplitViewControllerPanelImpl style](self, "style");
  v5 = v4;
  if ((unint64_t)(v4 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _UISplitViewControllerStyleDescription(v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 9649, CFSTR("Incorrect code path for UISplitViewControllerStyle %@"), v9);

    v7 = 0;
  }
  else
  {
    if (v4 != 2)
      return 0;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1E1A97488);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;
  }

  return v7;
}

- (UISplitViewController)splitViewController
{
  return (UISplitViewController *)objc_loadWeakRetained((id *)&self->_svc);
}

- (void)_setPrimaryOffscreenGestureMode:(int64_t)a3
{
  self->__primaryOffscreenGestureMode = a3;
}

- (id)_primaryViewControllerFocusPromiseItem
{
  return 0;
}

- (void)_handleArrowPress:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id v7;

  v7 = a3;
  -[UISplitViewControllerPanelImpl _sidebarArrowButtonRecognizer](self, "_sidebarArrowButtonRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4 == v7)
  {
    v6 = objc_msgSend(v7, "state") == 3;
    v5 = v7;
    if (v6 || (v6 = objc_msgSend(v7, "state") == 4, v5 = v7, v6))
      *(_QWORD *)&self->_flags &= ~0x80000000000uLL;
  }

}

- (int64_t)primaryBackgroundStyle
{
  return self->_primaryBackgroundStyle;
}

- (BOOL)_shouldShowNSToolbarSidebarToggle
{
  if (-[UISplitViewControllerPanelImpl style](self, "style"))
    return !-[UISplitViewControllerPanelImpl _alwaysHideSidebarToggleButton](self, "_alwaysHideSidebarToggleButton");
  else
    return 1;
}

- (void)setSupplementaryColumnAdoptsPrimaryBackgroundStyle:(BOOL)a3
{
  $692BA5F601ABB544448C4E0A48A865F8 flags;
  uint64_t v5;
  id WeakRetained;

  flags = self->_flags;
  if (((((*(_QWORD *)&flags & 0x40000000000) == 0) ^ a3) & 1) == 0)
  {
    v5 = 0x40000000000;
    if (!a3)
      v5 = 0;
    self->_flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(_QWORD *)&flags & 0xFFFFFBFFFFFFFFFFLL | v5);
    -[UISplitViewControllerPanelImpl _updateConfigurationBackgroundStyle](self, "_updateConfigurationBackgroundStyle");
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "_updateTraitsIfNecessary");

  }
}

- (BOOL)supplementaryColumnAdoptsPrimaryBackgroundStyle
{
  return (*((unsigned __int8 *)&self->_flags + 5) >> 2) & 1;
}

- (BOOL)_wantsFloatingSidebar
{
  void *v2;
  char v3;

  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wantsFloatingSidebar");

  return v3;
}

- (void)_setWantsFloatingSidebar:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UISplitViewControllerPanelImpl panelController](self, "panelController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWantsFloatingSidebar:", v3);

}

- (int64_t)_primaryOffscreenGestureMode
{
  return self->__primaryOffscreenGestureMode;
}

- (double)preferredPrimaryColumnWidthFraction
{
  return self->_preferredPrimaryColumnWidthFraction;
}

- (double)maximumPrimaryColumnWidth
{
  return self->_maximumPrimaryColumnWidth;
}

- (double)preferredSupplementaryColumnWidth
{
  return self->_preferredSupplementaryColumnWidth;
}

- (double)preferredSupplementaryColumnWidthFraction
{
  return self->_preferredSupplementaryColumnWidthFraction;
}

- (double)minimumSupplementaryColumnWidth
{
  return self->_minimumSupplementaryColumnWidth;
}

- (double)maximumSupplementaryColumnWidth
{
  return self->_maximumSupplementaryColumnWidth;
}

- (UIImage)_fullScreenButtonImage
{
  return self->__fullScreenButtonImage;
}

- (void)_setFullScreenButtonImage:(id)a3
{
  objc_storeStrong((id *)&self->__fullScreenButtonImage, a3);
}

- (UITapGestureRecognizer)_menuGestureRecognizer
{
  return self->_menuGestureRecognizer;
}

- (int64_t)_lastFocusedChildViewControllerColumn
{
  return self->_lastFocusedChildViewControllerColumn;
}

- (UIFocusContainerGuide)_masterFocusContainerGuide
{
  return self->_masterFocusContainerGuide;
}

- (UIFocusContainerGuide)_detailFocusContainerGuide
{
  return self->_detailFocusContainerGuide;
}

- (UILongPressGestureRecognizer)_sidebarArrowButtonRecognizer
{
  return self->_sidebarArrowButtonRecognizer;
}

- (_UITabContainerView)tabBarHostedView
{
  return (_UITabContainerView *)objc_loadWeakRetained((id *)&self->_tabBarHostedView);
}

- (void)setTabBarHostedView:(id)a3
{
  objc_storeWeak((id *)&self->_tabBarHostedView, a3);
}

@end
