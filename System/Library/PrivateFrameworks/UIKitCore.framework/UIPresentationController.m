@implementation UIPresentationController

- (Class)_appearanceGuideClass
{
  return 0;
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 0;
}

- (UIViewController)presentedViewController
{
  UIViewController *WeakRetained;

  if (self->__presentedViewControllerStoredWeakly)
    WeakRetained = (UIViewController *)objc_loadWeakRetained((id *)&self->_weakPresentedViewController);
  else
    WeakRetained = self->_presentedViewController;
  return WeakRetained;
}

- (UITraitCollection)traitCollection
{
  _BYTE *TraitCollectionTSD;
  char v4;
  void *v5;
  uint64_t v6;
  id v7;
  _UITraitOverrides *traitOverrides;
  void *v9;

  TraitCollectionTSD = GetTraitCollectionTSD();
  v4 = TraitCollectionTSD[9];
  TraitCollectionTSD[9] = 1;
  -[UIPresentationController _parentTraitCollection](self, "_parentTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIPresentationController _inheritsPresentingViewControllerThemeLevel](self, "_inheritsPresentingViewControllerThemeLevel"))
  {
    -[UITraitCollection _traitCollectionWithIncrementedBackgroundLevel](v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  v7 = v5;
  traitOverrides = self->_traitOverrides;
  v9 = v7;
  if (traitOverrides)
  {
    -[_UITraitOverrides _traitCollectionByApplyingOverridesToTraitCollection:]((void **)&traitOverrides->super.isa, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  *((_BYTE *)GetTraitCollectionTSD() + 9) = v4;
  _UITraitEnvironmentGeneratedTraitCollection((uint64_t)self, (unint64_t)v9);

  return (UITraitCollection *)v9;
}

- (id)_parentTraitCollection
{
  void *v3;
  void *v4;
  UITraitCollection *v5;
  UITraitCollection *v6;

  -[UIPresentationController _parentTraitEnvironment](self, "_parentTraitEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "traitCollection");
    v5 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  }
  else if (dyld_program_sdk_at_least())
  {
    v5 = self->_lastNotifiedTraitCollection;
  }
  else
  {
    +[UITraitCollection _defaultTraitCollection]();
    v5 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)_parentTraitEnvironment
{
  if (_UIPresentationControllersInheritTraitsFromViewHierarchy())
    -[UIPresentationController containerView](self, "containerView");
  else
    -[UIPresentationController _compatibleParentTraitEnvironment](self, "_compatibleParentTraitEnvironment");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_inheritsPresentingViewControllerThemeLevel
{
  return 1;
}

+ (UIEdgeInsets)_statusBarOverlapAndMarginInfoForView:(id)a3 inWindow:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  double v9;
  char v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  double v22;
  double v23;
  double MinY;
  double MaxY;
  void *v26;
  double v27;
  double v28;
  void *v29;
  char v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  UIEdgeInsets result;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v6)
  {
    v9 = *(double *)&__SplashBoardOverrideStatusBarHeight;
    if (*(double *)&__SplashBoardOverrideStatusBarHeight != 1.79769313e308)
      goto LABEL_24;
  }
  else
  {
    v10 = objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle");
    if (*(double *)&__SplashBoardOverrideStatusBarHeight == 1.79769313e308)
      v9 = 0.0;
    else
      v9 = *(double *)&__SplashBoardOverrideStatusBarHeight;
    if (*(double *)&__SplashBoardOverrideStatusBarHeight != 1.79769313e308 || (v10 & 1) != 0)
      goto LABEL_24;
  }
  v9 = 0.0;
  if ((objc_msgSend((id)UIApp, "_isStatusBarEffectivelyHiddenForContentOverlayInsetsForWindow:", v6) & 1) == 0
    && v8 != 3)
  {
    -[UIView __viewDelegate]((id *)v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "_viewFrameInWindowForContentOverlayInsetsCalculation");
    }
    else
    {
      objc_msgSend(v5, "bounds");
      objc_msgSend(v5, "convertRect:toView:", v6);
    }
    v17 = v13;
    v18 = v14;
    v19 = v15;
    v20 = v16;
    if (_UIViewControllerModernContentOverlayInsetsPropagation())
    {
      __UIStatusBarManagerForWindow(v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "statusBarHeight");
      v23 = v22;

      v42.origin.x = v17;
      v42.origin.y = v18;
      v42.size.width = v19;
      v42.size.height = v20;
      v9 = fmax(fmin(v23 - CGRectGetMinY(v42), v23), 0.0);
    }
    else
    {
      v43.origin.x = v17;
      v43.origin.y = v18;
      v43.size.width = v19;
      v43.size.height = v20;
      MinY = CGRectGetMinY(v43);
      objc_msgSend(v6, "bounds");
      if (MinY >= CGRectGetMinY(v44))
      {
        v45.origin.x = v17;
        v45.origin.y = v18;
        v45.size.width = v19;
        v45.size.height = v20;
        MaxY = CGRectGetMaxY(v45);
        objc_msgSend(v6, "bounds");
        if (MaxY <= CGRectGetMaxY(v46))
        {
          __UIStatusBarManagerForWindow(v6);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "defaultStatusBarHeightInOrientation:", 1);
          v28 = v27;

          __UIStatusBarManagerForWindow(v6);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "isStatusBarHidden");

          v31 = 0.0;
          if ((v30 & 1) == 0)
          {
            __UIStatusBarManagerForWindow(v6);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "statusBarHeight");
            v34 = v33;

            v31 = v34 - v28;
          }
          v47.origin.x = v17;
          v47.origin.y = v18;
          v47.size.width = v19;
          v47.size.height = v20;
          v35 = v28 - (CGRectGetMinY(v47) - v31);
          if (v35 >= 0.0)
            v9 = v35;
          else
            v9 = 0.0;
        }
      }
    }

  }
LABEL_24:
  +[UIViewController _horizontalContentMarginForView:](UIViewController, "_horizontalContentMarginForView:", v5);
  v37 = v36;

  v38 = 0.0;
  v39 = v9;
  v40 = v37;
  v41 = v37;
  result.right = v41;
  result.bottom = v38;
  result.left = v40;
  result.top = v39;
  return result;
}

- (_UITraitOverrides)_internalTraitOverrides
{
  _UITraitOverrides *traitOverrides;
  _UITraitOverrides *v4;
  _UITraitOverrides *v5;

  traitOverrides = self->_traitOverrides;
  if (!traitOverrides)
  {
    v4 = (_UITraitOverrides *)-[_UITraitOverrides initWithDelegate:]([_UITraitOverrides alloc], self);
    v5 = self->_traitOverrides;
    self->_traitOverrides = v4;

    traitOverrides = self->_traitOverrides;
  }
  return (_UITraitOverrides *)-[_UITraitOverrides _overridesAppliedBefore](traitOverrides);
}

- (void)_containerViewWillLayoutSubviews
{
  void *v3;

  if (!-[UIPresentationController dismissing](self, "dismissing")
    && !-[UIPresentationController _transitioningFrom](self, "_transitioningFrom"))
  {
    if (!self->_didUpdateLayoutForStatusBarAndInterfaceOrientation)
    {
      self->_didUpdateLayoutForStatusBarAndInterfaceOrientation = 1;
      -[UIPresentationController presentedViewController](self, "presentedViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_updateLayoutForStatusBarAndInterfaceOrientation");

    }
    -[UIPresentationController containerViewWillLayoutSubviews](self, "containerViewWillLayoutSubviews");
  }
}

- (BOOL)_transitioningFrom
{
  return self->_state == 4;
}

- (BOOL)_isPresentedInFullScreen
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[UIPresentationController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 == v6;

  return v7;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (UIPresentationController)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController
{
  UIViewController *v6;
  UIViewController *v7;
  UIPresentationController *v8;
  UIPresentationController *v9;
  void *v10;
  uint64_t v11;
  _UIPresentationControllerVisualStyle *visualStyle;
  uint64_t v13;
  UIPresentationController *v14;
  objc_super v16;

  v6 = presentedViewController;
  v7 = presentingViewController;
  v16.receiver = self;
  v16.super_class = (Class)UIPresentationController;
  v8 = -[UIPresentationController init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    -[UIPresentationController _populateInitialTraitCollection](v8, "_populateInitialTraitCollection");
    -[UIPresentationController _setPresentingViewController:](v9, "_setPresentingViewController:", v7);
    -[UIPresentationController _setPresentedViewController:](v9, "_setPresentedViewController:", v6);
    +[_UIPresentationControllerDefaultVisualStyleProvider sharedInstance](_UIPresentationControllerDefaultVisualStyleProvider, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController _createVisualStyleForProvider:](v9, "_createVisualStyleForProvider:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    visualStyle = v9->_visualStyle;
    v9->_visualStyle = (_UIPresentationControllerVisualStyle *)v11;

    v9->_isDisconnectedRoot = 0;
    v13 = __systemLayoutFittingSizeCallbackIMP;
    if (!__systemLayoutFittingSizeCallbackIMP)
    {
      v13 = +[UIPresentationController instanceMethodForSelector:](UIPresentationController, "instanceMethodForSelector:", sel_systemLayoutFittingSizeDidChangeForChildContentContainer_);
      __systemLayoutFittingSizeCallbackIMP = v13;
    }
    if (v13 != objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", sel_systemLayoutFittingSizeDidChangeForChildContentContainer_))v9->_monitorsSystemLayoutFittingSize = 1;
    v14 = v9;
  }

  return v9;
}

- (void)_setPresentingViewController:(id)a3
{
  UIViewController *v5;
  UIViewController *v6;

  v5 = (UIViewController *)a3;
  if (self->_presentingViewController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_presentingViewController, a3);
    -[UIPresentationController _updateTraitsIfNecessary](self, "_updateTraitsIfNecessary");
    v5 = v6;
  }

}

- (void)_setPresentedViewController:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  v6 = v5;
  if (self->__presentedViewControllerStoredWeakly)
    objc_storeWeak((id *)&self->_weakPresentedViewController, v5);
  else
    objc_storeStrong((id *)&self->_presentedViewController, a3);

}

- (void)_populateInitialTraitCollection
{
  UITraitCollection *v3;
  UITraitCollection *lastNotifiedTraitCollection;

  if (dyld_program_sdk_at_least())
  {
    +[UITraitCollection _fallbackTraitCollection]();
    v3 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
    lastNotifiedTraitCollection = self->_lastNotifiedTraitCollection;
    self->_lastNotifiedTraitCollection = v3;

  }
  self->_traitInitializationComplete = 1;
}

- (BOOL)_transitioningTo
{
  return self->_state == 5;
}

- (id)_parentPresentationController
{
  return -[UIPresentationController _parentPresentationControllerImmediate:](self, "_parentPresentationControllerImmediate:", 0);
}

- (id)_parentPresentationControllerImmediate:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_existingPresentationControllerImmediate:effective:includesRoot:", v3, 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_traitOverridesDidChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (self->_traitInitializationComplete)
  {
    v5 = v4;
    if (_UIPresentationControllersInheritTraitsFromViewHierarchy())
      -[UIPresentationController _updateTraitsIfNecessary](self, "_updateTraitsIfNecessary");
    else
      -[UIPresentationController _compatibleUpdateTraitsIfNecessary](self, "_compatibleUpdateTraitsIfNecessary");
    v4 = v5;
  }

}

- (void)_updateTraitsIfNecessaryInitiatingPropagation:(BOOL)a3
{
  _BOOL4 v3;
  UITraitCollection **p_lastNotifiedTraitCollection;
  UITraitCollection *v6;
  UITraitCollection *v7;
  UITraitCollection *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  _OWORD v27[2];
  _BYTE v28[10];
  __int16 v29;
  UITraitCollection *v30;
  uint64_t v31;

  v3 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  p_lastNotifiedTraitCollection = &self->_lastNotifiedTraitCollection;
  v6 = self->_lastNotifiedTraitCollection;
  -[UIPresentationController traitCollection](self, "traitCollection");
  v7 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 != v7 && !-[UITraitCollection isEqual:](v7, "isEqual:", v6))
  {
    objc_storeStrong((id *)p_lastNotifiedTraitCollection, v8);
    v9 = (void *)_UISetCurrentFallbackEnvironment(self);
    +[UITraitCollection _currentTraitCollectionIfExists]();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v8);
    if (v6)
    {
      *(_QWORD *)v28 = 0;
      memset(v27, 0, sizeof(v27));
      -[UITraitCollection _createTraitTokenSetForChangesFromTraitCollection:]((uint64_t)v6, (uint64_t)v8, (uint64_t)v27);
      -[_UITraitChangeRegistry traitsDidChange:forTraitEnvironment:withPreviousTraitCollection:]((uint64_t)self->_traitChangeRegistry, (uint64_t *)v27, self, v6);
      if (*(_QWORD *)&v27[0])

    }
    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = _UIShouldLogTraitCollectionChangeForInstanceAndMethod(v11, (uint64_t)self, (uint64_t)sel_traitCollectionDidChange_);

    if (v12)
    {
      v22 = _updateTraitsIfNecessaryInitiatingPropagation____s_category;
      if (!_updateTraitsIfNecessaryInitiatingPropagation____s_category)
      {
        v22 = __UILogCategoryGetNode("TraitCollectionChange", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v22, (unint64_t *)&_updateTraitsIfNecessaryInitiatingPropagation____s_category);
      }
      v23 = *(NSObject **)(v22 + 8);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = v23;
        NSStringFromSelector(sel_traitCollectionDidChange_);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[UITraitCollection _descriptionForChangeFromTraitCollection:toTraitCollection:](UITraitCollection, "_descriptionForChangeFromTraitCollection:toTraitCollection:", v6, v8);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v27[0]) = 138413314;
        *(_QWORD *)((char *)v27 + 4) = v25;
        WORD6(v27[0]) = 2112;
        *(_QWORD *)((char *)v27 + 14) = self;
        WORD3(v27[1]) = 2112;
        *((_QWORD *)&v27[1] + 1) = v26;
        *(_WORD *)v28 = 2112;
        *(_QWORD *)&v28[2] = v6;
        v29 = 2112;
        v30 = v8;
        _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "Sending -%@ to %@\n\t► trait changes: %@\n\t► previous: %@\n\t► current: %@", (uint8_t *)v27, 0x34u);

      }
    }
    -[UIPresentationController traitCollectionDidChange:](self, "traitCollectionDidChange:", v6);
    +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v10);
    _UIRestorePreviousFallbackEnvironment(v9);
    if (!_UIPresentationControllersInheritTraitsFromViewHierarchy())
      goto LABEL_27;
    -[UIPresentationController _presentedViewForOverrideTraits](self, "_presentedViewForOverrideTraits");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      _UIViewInvalidateTraitCollectionAndSchedulePropagation(v13, 0);
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_existingView");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
    {
      v18 = !v3;
      if (!v14)
        v18 = 0;
      if ((void *)v16 == v14)
        v19 = 0;
      else
        v19 = v18;
      _UIViewInvalidateTraitCollectionAndSchedulePropagation(v16, v19);
      if (!v3)
        goto LABEL_26;
    }
    else
    {
      -[UIViewController _updateTraitsIfNecessarySchedulingPropagation:]((uint64_t)v15, 0);
      if (!v3)
      {
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
    }
    if (v14)
    {
      objc_msgSend(v14, "_window");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        -[UIView _updateTraitsIfNeededWithBehavior:]((uint64_t)v14, 0);
    }
    if (v17)
    {
      if (v17 != v14)
      {
        objc_msgSend(v17, "_window");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
          -[UIView _updateTraitsIfNeededWithBehavior:]((uint64_t)v17, 0);
      }
    }
    goto LABEL_26;
  }
LABEL_28:

}

- (UIView)_presentedViewForOverrideTraits
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  if (dyld_program_sdk_at_least())
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewIfLoaded");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[UIPresentationController presentedView](self, "presentedView");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      if ((void *)v5 == v4)
        v7 = 0;
      else
        v7 = (void *)v5;
      v8 = v7;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  return (UIView *)v8;
}

- (void)_updateTraitsIfNecessary
{
  -[UIPresentationController _updateTraitsIfNecessaryInitiatingPropagation:](self, "_updateTraitsIfNecessaryInitiatingPropagation:", 1);
}

+ (void)initialize
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() != a1)
  {
    objc_opt_self();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "instanceMethodForSelector:", sel_traitCollection);
    v4 = dyld_image_header_containing_address();
    objc_msgSend(a1, "instanceMethodForSelector:", sel_traitCollection);
    v5 = dyld_image_header_containing_address();

    if (v4 != v5)
    {
      v6 = initialize___s_category_0;
      if (!initialize___s_category_0)
      {
        v6 = __UILogCategoryGetNode("TraitCollection", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v6, (unint64_t *)&initialize___s_category_0);
      }
      v7 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = v7;
        NSStringFromClass((Class)a1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v9;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Class %@ overrides the -traitCollection getter, which is not supported. If you're trying to override traits, you must use the appropriate API.", (uint8_t *)&v10, 0xCu);

      }
    }
  }
}

- (UIViewControllerInteractiveTransitioning)_currentInteractionController
{
  return self->_currentInteractionController;
}

- (BOOL)_shouldDisableInteractionDuringTransitions
{
  objc_opt_self();
  return (fluidPresentationTransitionsEnabled & 1) == 0;
}

- (void)transitionDidFinish:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD);
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  void (**v25)(_QWORD);
  void *v26;
  void *v27;
  unint64_t v28;
  NSObject *v29;
  os_signpost_id_t v30;
  os_signpost_id_t v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v35;
  _QWORD block[4];
  void (**v37)(_QWORD);
  char v38;
  _QWORD aBlock[5];
  id v40;
  id v41;
  id v42;
  id v43;
  BOOL v44;
  BOOL v45;
  uint8_t buf[4];
  UIPresentationController *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v3 = a3;
  v52 = *MEMORY[0x1E0C80C00];
  v5 = -[UIPresentationController presenting](self, "presenting");
  v6 = -[UIPresentationController dismissing](self, "dismissing");
  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v5)
    v9 = (void *)v8;
  else
    v9 = v7;
  v35 = (void *)v8;
  if (v5)
    v10 = v7;
  else
    v10 = (void *)v8;
  v11 = v9;
  v12 = v10;
  -[UIPresentationController _transitionContext](self, "_transitionContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController _currentTransitionDidComplete](self, "_currentTransitionDidComplete");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
  {
    (*(void (**)(uint64_t, _BOOL8))(v14 + 16))(v14, v3);
    if (!v3)
      goto LABEL_20;
    goto LABEL_16;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v47 = self;
      v48 = 2112;
      v49 = v35;
      v50 = 2112;
      v51 = v7;
      _os_log_fault_impl(&dword_185066000, v32, OS_LOG_TYPE_FAULT, "self._currentTransitionDidComplete is nil! for self: %@; presentedViewController: %@; presentingViewController: %@",
        buf,
        0x20u);
    }

    if (v3)
      goto LABEL_16;
  }
  else
  {
    v16 = _MergedGlobals_998;
    if (!_MergedGlobals_998)
    {
      v16 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v16, (unint64_t *)&_MergedGlobals_998);
    }
    v17 = *(NSObject **)(v16 + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v47 = self;
      v48 = 2112;
      v49 = v35;
      v50 = 2112;
      v51 = v7;
      _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "self._currentTransitionDidComplete is nil! for self: %@; presentedViewController: %@; presentingViewController: %@",
        buf,
        0x20u);
    }
    if (v3)
    {
LABEL_16:
      if (v5)
      {
        objc_msgSend(v35, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "superview");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPresentationController _setPresentationView:](self, "_setPresentationView:", v19);

      }
      else if (v6)
      {
        -[UIPresentationController _setPresentationView:](self, "_setPresentationView:", 0);
      }
    }
  }
LABEL_20:
  objc_msgSend(v13, "_setContainerView:", 0);
  -[UIPresentationController _setCurrentInteractionController:](self, "_setCurrentInteractionController:", 0);
  objc_msgSend(v7, "_completionBlock");
  v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v3)
    {
      if (v5)
        objc_msgSend(v7, "_didFinishPresentTransition");
      else
        objc_msgSend(v7, "_didFinishDismissTransition");
    }
    else if (v5)
    {
      objc_msgSend(v7, "_didCancelPresentTransition:", v13);
    }
    else
    {
      objc_msgSend(v7, "_didCancelDismissTransition:", v13);
    }
  }
  v21 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__UIPresentationController_transitionDidFinish___block_invoke;
  aBlock[3] = &unk_1E16BF9A8;
  aBlock[4] = self;
  v22 = v11;
  v40 = v22;
  v33 = v7;
  v41 = v33;
  v23 = v13;
  v42 = v23;
  v44 = v3;
  v24 = v12;
  v43 = v24;
  v45 = v5;
  v25 = (void (**)(_QWORD))_Block_copy(aBlock);
  if ((objc_msgSend((id)objc_opt_class(), "_allowsDeferredTransitions") & 1) != 0
    || !+[UIApplication _isCertainCheckpointInAppLaunchReached](UIApplication, "_isCertainCheckpointInAppLaunchReached", v33))
  {
    v25[2](v25);
    if (!v20)
      goto LABEL_34;
    goto LABEL_33;
  }
  block[0] = v21;
  block[1] = 3221225472;
  block[2] = __48__UIPresentationController_transitionDidFinish___block_invoke_2;
  block[3] = &unk_1E16BFB78;
  v38 = dyld_program_sdk_at_least() ^ 1;
  v37 = v25;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  if (v20)
LABEL_33:
    v20[2](v20, v3);
LABEL_34:
  -[UIPresentationController executeTransitionCompletionBlock](self, "executeTransitionCompletionBlock", v33);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v26 = 0;
    if (-[UIPresentationController dismissing](self, "dismissing") && v3)
      goto LABEL_45;
LABEL_40:
    if (!-[UIPresentationController presenting](self, "presenting") || v3)
      goto LABEL_45;
    goto LABEL_42;
  }
  -[UIPresentationController forcePresentationControllerDelegate](self, "forcePresentationControllerDelegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[UIPresentationController dismissing](self, "dismissing") || !v3)
    goto LABEL_40;
LABEL_42:
  if (v26 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v26, "forcePresentationControllerDidDismiss:", self);
LABEL_45:
  -[UIPresentationController _setCurrentTransitionController:](self, "_setCurrentTransitionController:", 0);
  if (-[UIPresentationController dismissing](self, "dismissing") && v3
    || -[UIPresentationController presenting](self, "presenting") && !v3)
  {
    v27 = v15;
    -[UIPresentationController _cleanup](self, "_cleanup");
  }
  else
  {
    v27 = v15;
    self->_state = 2;
    objc_msgSend(v24, "setNeedsFocusUpdate");
    -[UIPresentationController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }
  v28 = qword_1ECD7D3A0;
  if (!qword_1ECD7D3A0)
  {
    v28 = __UILogCategoryGetNode("UIPresentationController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v28, (unint64_t *)&qword_1ECD7D3A0);
  }
  v29 = *(id *)(v28 + 8);
  v30 = os_signpost_id_make_with_pointer(*(os_log_t *)(v28 + 8), self);
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v31 = v30;
    if (os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v29, OS_SIGNPOST_INTERVAL_END, v31, "ModalTransition", " enableTelemetry=YES ", buf, 2u);
    }
  }

}

- (BOOL)presenting
{
  return self->_state == 1;
}

- (BOOL)dismissing
{
  return self->_state == 3;
}

- (void)_setCurrentTransitionController:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransitionController, a3);
}

- (void)_setCurrentInteractionController:(id)a3
{
  objc_storeStrong((id *)&self->_currentInteractionController, a3);
}

- (void)_setPresentationView:(id)a3
{
  objc_storeStrong((id *)&self->_presentationView, a3);
}

- (void)setIsCurrentStateCancelled:(BOOL)a3
{
  self->_isCurrentStateCancelled = a3;
}

- (BOOL)_shouldAnimateReenablingOfAutorotation
{
  return 1;
}

- (id)_currentTransitionDidComplete
{
  return self->__currentTransitionDidComplete;
}

+ (void)_scheduleTransition:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if (objc_msgSend(a1, "_shouldDeferTransitions"))
    +[UIViewController _scheduleTransition:](UIViewController, "_scheduleTransition:", v4);
  else
    v4[2]();

}

- (void)setNeedsFocusUpdate
{
  id v3;

  +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", self);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestFocusUpdateToEnvironment:", self);

}

- (BOOL)_shouldRestoreFirstResponder
{
  return 1;
}

+ (BOOL)_allowsDeferredTransitions
{
  return 1;
}

- (void)_setContainerIgnoresDirectTouchEvents:(BOOL)a3
{
  if (self->_containerIgnoresDirectTouchEvents != a3)
  {
    self->_containerIgnoresDirectTouchEvents = a3;
    if (self->_containerView)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[UIView setIgnoreDirectTouchEvents:](self->_containerView, "setIgnoreDirectTouchEvents:", self->_containerIgnoresDirectTouchEvents);
    }
  }
}

- (id)_transitionViewForCurrentTransition
{
  return self->__transitionViewForCurrentTransition;
}

- (id)_toViewForCurrentTransition
{
  return self->__toViewForCurrentTransition;
}

- (id)_fromViewForCurrentTransition
{
  return self->__fromViewForCurrentTransition;
}

- (BOOL)_shouldGrabPresentersView
{
  char v3;
  void *v4;
  void *v5;
  int v6;

  v3 = -[UIPresentationController shouldRemovePresentersView](self, "shouldRemovePresentersView");
  if (dyld_program_sdk_at_least())
  {
    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_existingPresentationControllerImmediate:effective:includesRoot:", 1, 1, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && -[UIPresentationController shouldPresentInFullscreen](self, "shouldPresentInFullscreen"))
    {
      v6 = objc_msgSend(v5, "_mayChildGrabPresentedViewControllerView");
      if (v6)
        LOBYTE(v6) = objc_msgSend(v5, "shouldPresentInFullscreen");
      v3 &= v6;
    }

  }
  return v3;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (BOOL)_shouldDisablePresentersAppearanceCallbacks
{
  return !-[UIPresentationController shouldRemovePresentersView](self, "shouldRemovePresentersView");
}

- (BOOL)shouldRemovePresentersView
{
  return 0;
}

- (UIViewControllerAnimatedTransitioning)_currentTransitionController
{
  return self->_currentTransitionController;
}

id __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(WeakRetained, "dismissing"))
  {
    if (objc_msgSend(WeakRetained, "_shouldGrabPresentersView"))
      v3 = *(void **)(a1 + 32);
    else
      v3 = 0;
    v4 = v3;
  }
  else
  {
    objc_msgSend(WeakRetained, "presentedView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

id __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(WeakRetained, "presenting"))
  {
    if (objc_msgSend(WeakRetained, "_shouldGrabPresentersView"))
      v3 = *(void **)(a1 + 32);
    else
      v3 = 0;
    v4 = v3;
  }
  else
  {
    objc_msgSend(WeakRetained, "presentedView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

void __48__UIPresentationController_transitionDidFinish___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  _UIQOSExcludeCommitFromGlitchTrackingIfUnmanaged();
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldCallAppearanceCallbacksFor:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(void **)(a1 + 40);
    if (v2 == *(void **)(a1 + 48))
    {
      objc_msgSend(v2, "setInAnimatedVCTransition:", objc_msgSend(*(id *)(a1 + 56), "isAnimated"));
      v2 = *(void **)(a1 + 40);
    }
    objc_msgSend(v2, "setFinishingModalTransition:", 1);
    v3 = *(void **)(a1 + 40);
    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(v3, "endAppearanceTransition");
      objc_msgSend(*(id *)(a1 + 40), "setAppearanceTransitionsAreDisabled:", 0);
    }
    else
    {
      objc_msgSend(v3, "cancelBeginAppearanceTransition");
    }
    objc_msgSend(*(id *)(a1 + 40), "setFinishingModalTransition:", 0);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldCallAppearanceCallbacksFor:", *(_QWORD *)(a1 + 64)))
  {
    v4 = *(void **)(a1 + 64);
    if (v4 == *(void **)(a1 + 48))
    {
      objc_msgSend(v4, "setInAnimatedVCTransition:", objc_msgSend(*(id *)(a1 + 56), "isAnimated"));
      v4 = *(void **)(a1 + 64);
    }
    if (*(_BYTE *)(a1 + 72))
      objc_msgSend(v4, "endAppearanceTransition");
    else
      objc_msgSend(v4, "cancelBeginAppearanceTransition");
  }
  objc_msgSend(*(id *)(a1 + 64), "setPerformingModalTransition:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setPerformingModalTransition:", 0);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128))
  {
    if (*(_BYTE *)(a1 + 73))
    {
      v5 = *(void **)(a1 + 40);
      if (*(_BYTE *)(a1 + 72))
      {
        objc_msgSend(v5, "_presentingViewControllerDidChange:", *(_QWORD *)(a1 + 64));
        -[UIViewController _modalPreservedFirstResponder](*(id **)(a1 + 64));
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_becomeFirstResponderWhenPossible");

        return;
      }
      objc_msgSend(v5, "_presentingViewControllerWillChange:", 0);
      v6 = *(void **)(a1 + 40);
    }
    else
    {
      v6 = *(void **)(a1 + 64);
      if (!*(_BYTE *)(a1 + 72))
      {
        objc_msgSend(v6, "_presentingViewControllerWillChange:", *(_QWORD *)(a1 + 40));
        v6 = *(void **)(a1 + 64);
        v7 = *(_QWORD *)(a1 + 40);
LABEL_23:
        objc_msgSend(v6, "_presentingViewControllerDidChange:", v7);
        return;
      }
    }
    v7 = 0;
    goto LABEL_23;
  }
}

double __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  double v20;
  void *v22;
  void *v23;
  double v24;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(WeakRetained, "presenting") & 1) == 0
    && !objc_msgSend(WeakRetained, "_transitioningTo"))
  {
    if (((objc_msgSend(WeakRetained, "dismissing") & 1) != 0
       || objc_msgSend(WeakRetained, "_transitioningFrom"))
      && objc_msgSend(WeakRetained, "_shouldGrabPresentersView"))
    {
      objc_msgSend(WeakRetained, "_parentPresentationControllerImmediate:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        goto LABEL_10;
      objc_msgSend(WeakRetained, "presentingViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "parentViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        goto LABEL_10;
      objc_msgSend(WeakRetained, "presentingViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_popoverController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_managingSplitViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
LABEL_10:
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(WeakRetained, "presentingViewController");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "_frameForChildContentContainer:", v10);
          v12 = v11;
          v14 = v13;
          v16 = v15;
          v18 = v17;

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v6, "_presentationView");
            v19 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v19 = v3;
          }
          v22 = v19;
          objc_msgSend(WeakRetained, "containerView");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "convertRect:toView:", v23, v12, v14, v16, v18);
          v5 = v24;

          goto LABEL_15;
        }
      }

    }
    objc_msgSend(WeakRetained, "containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v5 = v20;
LABEL_15:

    goto LABEL_16;
  }
  objc_msgSend(WeakRetained, "frameOfPresentedViewInContainerView");
  v5 = v4;
LABEL_16:

  return v5;
}

- (BOOL)_keyboardShouldAnimateAlongsideForInteractiveTransitions
{
  return 1;
}

- (id)_computeToEndFrameForCurrentTransition
{
  return self->__computeToEndFrameForCurrentTransition;
}

uint64_t __55__UIPresentationController__beginOcclusionIfNecessary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enableOcclusion:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_shouldDisableAppearanceCallbacksForPresentedViewController
{
  return 0;
}

uint64_t __48__UIPresentationController_transitionDidFinish___block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)UIApp, "_performAfterCATransactionCommitsWithLegacyRunloopObserverBasedTiming:block:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_presentationControllerForTraitCollection:(id)a3
{
  id v4;
  UIModalPresentationStyle v5;
  uint64_t v6;
  UIPresentationController *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __objc2_class *v12;
  id v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _UIFormSheetPresentationController *v22;
  void *v23;

  v4 = a3;
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    v5 = -[UIPresentationController adaptivePresentationStyleForTraitCollection:](self, "adaptivePresentationStyleForTraitCollection:", v4);

  }
  else
  {
    v6 = objc_msgSend(v4, "horizontalSizeClass");

    if (v6 != 1)
    {
LABEL_25:
      v7 = self;
      return v7;
    }
    v5 = -[UIPresentationController adaptivePresentationStyle](self, "adaptivePresentationStyle");
  }
  if (v5 == UIModalPresentationNone
    || -[UIPresentationController presentationStyle](self, "presentationStyle") == UIModalPresentationFullScreen
    || -[UIPresentationController presentationStyle](self, "presentationStyle") == UIModalPresentationOverFullScreen
    || -[UIPresentationController presentationStyle](self, "presentationStyle") == 17)
  {
    goto LABEL_25;
  }
  v7 = 0;
  if (v5 > UIModalPresentationCustom)
  {
    if (v5 != UIModalPresentationOverFullScreen && v5 != 17)
      goto LABEL_24;
    v12 = _UIOverFullscreenPresentationController;
    goto LABEL_18;
  }
  if (v5 == UIModalPresentationFullScreen)
  {
    v12 = _UIFullscreenPresentationController;
LABEL_18:
    v13 = [v12 alloc];
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UIPresentationController *)objc_msgSend(v13, "initWithPresentedViewController:presentingViewController:", v14, v15);
    goto LABEL_19;
  }
  if (v5 != UIModalPresentationFormSheet)
    goto LABEL_24;
  -[UIPresentationController _adaptiveFormSheetPresentationController](self, "_adaptiveFormSheetPresentationController");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v22 = [_UIFormSheetPresentationController alloc];
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[UISheetPresentationController initWithPresentedViewController:presentingViewController:](v22, "initWithPresentedViewController:presentingViewController:", v15, v23);

    v14 = 0;
LABEL_19:

    if (v7)
      goto LABEL_20;
LABEL_24:

    goto LABEL_25;
  }
  v9 = (void *)v8;
  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setPresentingViewController:", v10);

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setPresentedViewController:", v11);

  v7 = v9;
LABEL_20:
  v16 = -[UIPresentationController shouldPresentInFullscreen](self, "shouldPresentInFullscreen");
  if (v16 != -[UIPresentationController shouldPresentInFullscreen](v7, "shouldPresentInFullscreen"))
    goto LABEL_24;
  v17 = objc_opt_class();
  if (v17 == objc_opt_class())
    goto LABEL_24;
  -[UIPresentationController _sourceViewController](self, "_sourceViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController _setSourceViewController:](v7, "_setSourceViewController:", v18);

  -[UIPresentationController delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController setDelegate:](v7, "setDelegate:", v19);
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_presentationController:prepareAdaptivePresentationController:", self, v7);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v19, "presentationController:prepareAdaptivePresentationController:", self, v7);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v19, "_presentationController:prepareAdaptivePresentationController:", self, v7);
  }

  return v7;
}

- (UIModalPresentationStyle)adaptivePresentationStyleForTraitCollection:(UITraitCollection *)traitCollection
{
  UITraitCollection *v4;
  void *v5;
  unint64_t v6;
  UIModalPresentationStyle v7;
  uint64_t v8;

  v4 = traitCollection;
  -[UIPresentationController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "adaptivePresentationStyleForPresentationController:traitCollection:", self, v4) + 1;
    if (v6 < 7 && ((0x4Bu >> v6) & 1) != 0)
    {
      v7 = qword_18667A0C8[v6];
      goto LABEL_10;
    }
LABEL_9:
    v7 = -[UIPresentationController _defaultPresentationStyleForTraitCollection:](self, "_defaultPresentationStyleForTraitCollection:", v4);
    goto LABEL_10;
  }
  if (-[UITraitCollection horizontalSizeClass](v4, "horizontalSizeClass") != UIUserInterfaceSizeClassCompact)
    goto LABEL_9;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_9;
  v8 = objc_msgSend(v5, "adaptivePresentationStyleForPresentationController:", self);
  if ((unint64_t)(v8 + 1) > 6)
    goto LABEL_9;
  v7 = v8;
  if (((1 << (v8 + 1)) & 0x43) == 0)
    goto LABEL_9;
LABEL_10:

  return v7;
}

- (int64_t)_defaultPresentationStyleForTraitCollection:(id)a3
{
  return -1;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

+ (BOOL)_shouldDeferTransitions
{
  int v3;

  v3 = +[UIViewController _shouldDeferTransitions](UIViewController, "_shouldDeferTransitions");
  if (v3)
    LOBYTE(v3) = objc_msgSend(a1, "_allowsDeferredTransitions");
  return v3;
}

- (BOOL)presented
{
  return self->_state == 2;
}

uint64_t __95__UIPresentationController__adaptiveWillTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t *a1)
{
  void *v2;
  _BOOL4 v3;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _UIShouldLogTraitCollectionChangeForInstanceAndMethod(v2, a1[4], (uint64_t)sel_willTransitionToTraitCollection_withTransitionCoordinator_);

  if (v3)
  {
    v5 = _UIInternalPreference_PresentationControllersInheritTraitsFromViewHierarchy_block_invoke_3___s_category;
    if (!_UIInternalPreference_PresentationControllersInheritTraitsFromViewHierarchy_block_invoke_3___s_category)
    {
      v5 = __UILogCategoryGetNode("TraitCollectionChange", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&_UIInternalPreference_PresentationControllersInheritTraitsFromViewHierarchy_block_invoke_3___s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      NSStringFromSelector(sel_willTransitionToTraitCollection_withTransitionCoordinator_);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = a1[4];
      +[UITraitCollection _descriptionForChangeFromTraitCollection:toTraitCollection:](UITraitCollection, "_descriptionForChangeFromTraitCollection:toTraitCollection:", a1[5], a1[6]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = a1[5];
      v12 = a1[6];
      v13 = 138413314;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Sending -%@ to %@\n\t► trait changes: %@\n\t► current: %@\n\t► new: %@", (uint8_t *)&v13, 0x34u);

    }
  }
  return objc_msgSend((id)a1[4], "willTransitionToTraitCollection:withTransitionCoordinator:", a1[6], a1[7]);
}

- (UIEdgeInsets)_baseContentInsetsWithLeftMargin:(double *)a3 rightMargin:(double *)a4
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
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
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  UIEdgeInsets result;

  -[UIPresentationController _rootPresentingViewControllerForNestedPresentation](self, "_rootPresentingViewControllerForNestedPresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "_providesCustomBasePresentationInsets"))
  {
    v8 = v7;
  }
  else
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  -[UIPresentationController presentedView](self, "presentedView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_window");
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  v15 = _UIPresentationControllerBaseContentInsetsForControllersAndViewInWindow(self, v9, v10, v13, a3, a4);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  if (-[UIPresentationController _ignoresLeftAndRightSafeAreaInsets](self, "_ignoresLeftAndRightSafeAreaInsets"))
  {
    v17 = 0.0;
    v21 = 0.0;
  }
  -[UIPresentationController _additionalSafeAreaInsets](self, "_additionalSafeAreaInsets");
  v23 = v15 + v22;
  v25 = v17 + v24;
  v27 = v19 + v26;
  v29 = v21 + v28;

  v30 = v23;
  v31 = v25;
  v32 = v27;
  v33 = v29;
  result.right = v33;
  result.bottom = v32;
  result.left = v31;
  result.top = v30;
  return result;
}

- (id)_rootPresentingViewControllerForNestedPresentation
{
  UIViewController *v3;
  uint64_t v4;
  void *v5;
  UIViewController *v6;
  uint64_t v7;

  v3 = self->_presentingViewController;
  -[UIViewController _existingPresentationControllerImmediate:effective:](self->_presentingViewController, "_existingPresentationControllerImmediate:effective:", 0, 1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      objc_msgSend(v5, "presentingViewController");
      v6 = (UIViewController *)objc_claimAutoreleasedReturnValue();

      -[UIViewController _existingPresentationControllerImmediate:effective:](v6, "_existingPresentationControllerImmediate:effective:", 0, 1);
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
      v3 = v6;
    }
    while (v7);
  }
  else
  {
    v6 = v3;
  }
  return v6;
}

- (UIEdgeInsets)_additionalSafeAreaInsets
{
  void *v3;
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
  UIEdgeInsets result;

  -[UIPresentationController _parentPresentationController](self, "_parentPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  if (v3)
  {
    v5 = 0.0;
    v6 = 0.0;
    v7 = 0.0;
    if (!-[UIPresentationController shouldPresentInFullscreen](self, "shouldPresentInFullscreen"))
    {
      objc_msgSend(v3, "_additionalSafeAreaInsets");
      v7 = v8;
      v6 = v9;
      v5 = v10;
      v4 = v11;
    }
  }
  else
  {
    v5 = 0.0;
    v6 = 0.0;
    v7 = 0.0;
  }

  v12 = v7;
  v13 = v6;
  v14 = v5;
  v15 = v4;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)dealloc
{
  UIWindowScene **p_windowSceneIgnoringEvents;
  id WeakRetained;
  objc_class *v5;
  const char *Name;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  id v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_windowSceneIgnoringEvents = &self->_windowSceneIgnoringEvents;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneIgnoringEvents);

  if (WeakRetained)
  {
    v5 = (objc_class *)objc_opt_class();
    Name = class_getName(v5);
    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    class_getName(v8);

    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    class_getName(v10);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid state: deallocating presentation controller while still ignoring interaction events: <%s: %p>"), Name, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = dealloc___s_category_3;
    if (!dealloc___s_category_3)
    {
      v12 = __UILogCategoryGetNode("Presentation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&dealloc___s_category_3);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    v14 = objc_loadWeakRetained((id *)p_windowSceneIgnoringEvents);
    objc_msgSend(v14, "_endIgnoringInteractionEventsForReason:", v11);

    objc_storeWeak((id *)p_windowSceneIgnoringEvents, 0);
  }
  -[UIPresentationController _releaseSnapshot](self, "_releaseSnapshot");
  -[UIPresentationController _setPendingFocusEnvironmentUnlock:](self, "_setPendingFocusEnvironmentUnlock:", 0);
  v15.receiver = self;
  v15.super_class = (Class)UIPresentationController;
  -[UIPresentationController dealloc](&v15, sel_dealloc);
}

- (void)_cleanup
{
  self->_state = 0;
  -[UIPresentationController _setCurrentPresentationSuperview:](self, "_setCurrentPresentationSuperview:", 0);
  -[UIPresentationController _setPresentationView:](self, "_setPresentationView:", 0);
  -[UIPresentationController set_transitionViewForCurrentTransition:](self, "set_transitionViewForCurrentTransition:", 0);
  -[UIPresentationController _setPendingFocusEnvironmentUnlock:](self, "_setPendingFocusEnvironmentUnlock:", 0);
  -[UIPresentationController set_computeToEndFrameForCurrentTransition:](self, "set_computeToEndFrameForCurrentTransition:", 0);
  -[UIPresentationController set_currentTransitionDidComplete:](self, "set_currentTransitionDidComplete:", 0);
  -[UIPresentationController set_fromViewForCurrentTransition:](self, "set_fromViewForCurrentTransition:", 0);
  -[UIPresentationController set_toViewForCurrentTransition:](self, "set_toViewForCurrentTransition:", 0);
  -[UIPresentationController set_customFromViewForCurrentTransition:](self, "set_customFromViewForCurrentTransition:", 0);
  -[UIPresentationController set_customToViewForCurrentTransition:](self, "set_customToViewForCurrentTransition:", 0);
  -[UIPresentationController _setAdaptiveTransitionContext:](self, "_setAdaptiveTransitionContext:", 0);
  -[UIPresentationController _setAdaptiveTransitionCoordinator:](self, "_setAdaptiveTransitionCoordinator:", 0);
  self->_didUpdateLayoutForStatusBarAndInterfaceOrientation = 0;
}

- (void)set_customToViewForCurrentTransition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void)set_customFromViewForCurrentTransition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void)_setAdaptiveTransitionCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_adaptiveTransitionCoordinator, a3);
}

- (void)_setAdaptiveTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_adaptiveTransitionContext, a3);
}

- (id)_appearanceContainer
{
  void *v3;
  void *v4;

  if (-[UIPresentationController shouldPresentInFullscreen](self, "shouldPresentInFullscreen"))
  {
    -[UIPresentationController containerView](self, "containerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)shouldPresentInFullscreen
{
  return 1;
}

- (void)_setCurrentPresentationSuperview:(id)a3
{
  objc_storeWeak((id *)&self->__currentPresentationSuperview, a3);
}

- (BOOL)_shouldRespectDefinesPresentationContext
{
  int v3;

  v3 = dyld_program_sdk_at_least();
  if (v3)
    LOBYTE(v3) = !-[UIPresentationController shouldPresentInFullscreen](self, "shouldPresentInFullscreen");
  return v3;
}

- (void)_initViewHierarchyForPresentationSuperview:(id)a3 inWindow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UITransitionView *v12;
  UITransitionView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UITransitionView *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  UITransitionView *v27;
  id v28;
  id v29;
  id v30;
  id v31[2];
  id v32;
  id from;
  id location[2];

  v6 = a3;
  v7 = a4;
  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subviews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v11, "indexOfObjectIdenticalTo:", v9);

  v12 = [UITransitionView alloc];
  v24 = v6;
  -[UIPresentationController _frameForTransitionViewInPresentationSuperview:inWindow:](self, "_frameForTransitionViewInPresentationSuperview:inWindow:", v6, v7);
  v13 = -[UITransitionView initWithFrame:](v12, "initWithFrame:");
  -[UITransitionView setDelegate:](v13, "setDelegate:", self);
  -[UIView setAutoresizingMask:](v13, "setAutoresizingMask:", 18);
  -[UITransitionView setIgnoreDirectTouchEvents:](v13, "setIgnoreDirectTouchEvents:", -[UIPresentationController _containerIgnoresDirectTouchEvents](self, "_containerIgnoresDirectTouchEvents"));
  -[UIView setClipsToBounds:](v13, "setClipsToBounds:", 0);
  -[UIView _setCanBeParentTraitEnvironment:](v13, "_setCanBeParentTraitEnvironment:", 0);
  v23 = v7;
  objc_initWeak(location, v7);
  objc_initWeak(&from, self);
  objc_initWeak(&v32, v10);
  v14 = (void *)MEMORY[0x1E0CB3940];
  -[UIPresentationController description](self, "description");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "description");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "description");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("presentationController : %@ presentedViewController : %@ presentingViewController : %@"), v15, v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke;
  v26[3] = &unk_1E16BFB30;
  objc_copyWeak(&v29, &from);
  objc_copyWeak(&v30, &v32);
  v21 = v13;
  v27 = v21;
  v22 = v20;
  v28 = v22;
  v31[1] = v25;
  objc_copyWeak(v31, location);
  -[UIPresentationController set_transitionViewForCurrentTransition:](self, "set_transitionViewForCurrentTransition:", v26);
  objc_destroyWeak(v31);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v29);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);

}

id __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  id WeakRetained;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  id v12;
  int v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double (**v18)(void);
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id *v56;
  id *v57;
  void *v58;
  BOOL v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  id *v83;
  id *v84;
  id v85;
  void *v86;
  void *v87;
  id *v88;
  id *v89;
  id v90;
  void *v91;
  void *v92;
  id *v93;
  _QWORD v94[4];
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100[2];
  _QWORD v101[4];
  id *v102;
  id v103;
  id v104;
  id location;
  _QWORD v106[4];
  id v107;
  id v108;
  _QWORD v109[4];
  id v110;
  id v111;
  _QWORD v112[4];
  id v113;
  id v114;
  _QWORD v115[4];
  id v116;
  id v117;
  id v118;

  v1 = a1;
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = (id *)(v1 + 56);
  v90 = objc_loadWeakRetained((id *)(v1 + 56));
  objc_msgSend(WeakRetained, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = (id *)v6;
  if ((objc_msgSend(WeakRetained, "presenting") & 1) != 0)
  {
    v9 = 1;
    v10 = v6;
    v6 = v5;
  }
  else
  {
    v11 = objc_msgSend(WeakRetained, "_transitioningTo");
    v9 = v11;
    if (v11)
      v10 = v6;
    else
      v10 = v5;
    if (v11)
      v6 = v5;
  }
  v12 = v10;
  v85 = v6;
  objc_msgSend(v85, "view");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v12;
  objc_msgSend(v12, "view");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_setContainerView:", *(_QWORD *)(v1 + 32));
  if (objc_msgSend(WeakRetained, "dismissing")
    && objc_msgSend(WeakRetained, "shouldRemovePresentersView"))
  {
    v13 = objc_msgSend(WeakRetained, "_shouldGrabPresentersView") ^ 1;
  }
  else
  {
    v13 = 0;
  }
  v14 = objc_msgSend(WeakRetained, "_transitioningFrom");
  v15 = MEMORY[0x1E0C809B0];
  if ((v14 & 1) != 0 || v13)
  {
    objc_msgSend(WeakRetained, "_parentPresentationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_computeToEndFrameForCurrentTransition");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[UIPresentationController _initViewHierarchyForPresentationSuperview:inWindow:]_block_invoke");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "handleFailureInFunction:file:lineNumber:description:", v79, CFSTR("UIPresentationController.m"), 1745, CFSTR("The _computeToEndFrameForCurrentTransition block is nil inside the _transitionViewForCurrentTransition block, value of outerStrongSelf currently : %@. This most likely indicates that an adaptation is happening after a transtion cleared out _computeToEndFrameForCurrentTransition. Captured debug information outside block: %@"), WeakRetained, *(_QWORD *)(v1 + 40));

      v4 = (id *)(v1 + 56);
    }
    objc_msgSend(WeakRetained, "_computeToEndFrameForCurrentTransition");
    v18 = (double (**)(void))objc_claimAutoreleasedReturnValue();
    v19 = v18[2]();
    _setFrameIgnoringLayerTransformOnOrAfterYukon(v7, v19, v20, v21, v22);

    if (v16)
    {
      objc_msgSend(v16, "_presentationView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_transplantView:toSuperview:", v7, v23);

      objc_msgSend(v16, "_frameOfPresentedViewControllerViewInSuperview");
      _setFrameIgnoringLayerTransformOnOrAfterYukon(v7, v24, v25, v26, v27);
    }
    else
    {
      objc_msgSend(WeakRetained, "_transplantView:toSuperview:atIndex:", v7, v90, *(_QWORD *)(v1 + 72));
    }
    v15 = MEMORY[0x1E0C809B0];
    if (objc_msgSend(WeakRetained, "_transitioningFrom"))
    {
      v88 = (id *)v5;
      v84 = v4;
      objc_msgSend(WeakRetained, "_childPresentationController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = v8;
      if (v28)
      {
        objc_msgSend(WeakRetained, "_childPresentationController");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "containerView");
        v30 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v30 = v8;
      }

      objc_msgSend(WeakRetained, "_presentationView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "snapshotViewAfterScreenUpdates:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v115[0] = MEMORY[0x1E0C809B0];
      v115[1] = 3221225472;
      v115[2] = __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke_2;
      v115[3] = &unk_1E16B47A8;
      v33 = v32;
      v116 = v33;
      v117 = v30;
      v118 = v31;
      v34 = v31;
      v35 = v30;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v115);
      v87 = v33;
      objc_msgSend(v34, "addSubview:", v33);

      v15 = MEMORY[0x1E0C809B0];
      v4 = v84;
      v8 = v80;
      v5 = v88;
    }
    else
    {
      v87 = 0;
    }

  }
  else
  {
    v87 = 0;
  }
  v36 = v93;
  if (v9)
  {
    objc_msgSend(WeakRetained, "containerView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "_setPresentationControllerToNotifyOnLayoutSubviews:", WeakRetained);

    objc_msgSend(WeakRetained, "_currentPresentationSuperview");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v1 + 32), "superview");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v39)
    {
      v40 = objc_loadWeakRetained((id *)(v1 + 64));
      objc_msgSend(WeakRetained, "_frameForTransitionViewInPresentationSuperview:inWindow:", v38, v40);
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v48 = v47;

      _setFrameIgnoringLayerTransformOnOrAfterYukon(*(void **)(v1 + 32), v42, v44, v46, v48);
    }
    objc_msgSend(v7, "superview");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49 == v38)
    {
      objc_msgSend(v38, "insertSubview:aboveSubview:", *(_QWORD *)(v1 + 32), v7);
    }
    else
    {
      objc_msgSend(WeakRetained, "_childPresentationController");
      v50 = objc_claimAutoreleasedReturnValue();
      if (!v50)
        goto LABEL_33;
      v51 = (void *)v50;
      objc_msgSend(WeakRetained, "_childPresentationController");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "containerView");
      v81 = v8;
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "superview");
      v89 = (id *)v5;
      v54 = v1;
      v55 = v7;
      v56 = v2;
      v57 = v4;
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v81;
      v15 = MEMORY[0x1E0C809B0];

      v59 = v58 == v38;
      v4 = v57;
      v2 = v56;
      v7 = v55;
      v1 = v54;
      v5 = v89;
      if (v59)
      {
        v60 = *(_QWORD *)(v1 + 32);
        objc_msgSend(WeakRetained, "_childPresentationController");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "containerView");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "insertSubview:belowSubview:", v60, v62);

        v8 = v81;
        v15 = MEMORY[0x1E0C809B0];
      }
      else
      {
LABEL_33:
        objc_msgSend(v38, "addSubview:", *(_QWORD *)(v1 + 32));
      }
    }
    v36 = v93;
    if (objc_msgSend(WeakRetained, "presenting")
      && objc_msgSend(WeakRetained, "_shouldGrabPresentersView"))
    {
      objc_msgSend(WeakRetained, "_transplantView:toSuperview:", v7, *(_QWORD *)(v1 + 32));
    }

  }
  v112[0] = v15;
  v112[1] = 3221225472;
  v112[2] = __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke_3;
  v112[3] = &unk_1E16BFA90;
  objc_copyWeak(&v113, v2);
  objc_copyWeak(&v114, v4);
  objc_msgSend(WeakRetained, "set_computeToEndFrameForCurrentTransition:", v112);
  objc_msgSend(WeakRetained, "_customFromViewForCurrentTransition");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
  {
    objc_msgSend(WeakRetained, "_customFromViewForCurrentTransition");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "set_fromViewForCurrentTransition:", v64);

  }
  else
  {
    v109[0] = v15;
    v109[1] = 3221225472;
    v109[2] = __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke_4;
    v109[3] = &unk_1E16BFAB8;
    objc_copyWeak(&v111, v2);
    v110 = v92;
    objc_msgSend(WeakRetained, "set_fromViewForCurrentTransition:", v109);

    objc_destroyWeak(&v111);
  }
  objc_msgSend(WeakRetained, "_customToViewForCurrentTransition");
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (v65)
  {
    objc_msgSend(WeakRetained, "_customToViewForCurrentTransition");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "set_toViewForCurrentTransition:", v66);

  }
  else
  {
    v106[0] = v15;
    v106[1] = 3221225472;
    v106[2] = __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke_5;
    v106[3] = &unk_1E16BFAB8;
    objc_copyWeak(&v108, v2);
    v107 = v91;
    objc_msgSend(WeakRetained, "set_toViewForCurrentTransition:", v106);

    objc_destroyWeak(&v108);
  }
  objc_msgSend(v5, "_focusSystem");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "_lockEnvironment:", v36);
  objc_msgSend(v67, "_lockEnvironment:", v5);
  objc_initWeak(&location, v67);
  v101[0] = v15;
  v101[1] = 3221225472;
  v101[2] = __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke_6;
  v101[3] = &unk_1E16BFAE0;
  objc_copyWeak(&v104, &location);
  v83 = v36;
  v102 = v83;
  v82 = v5;
  v103 = v82;
  objc_msgSend(WeakRetained, "_setPendingFocusEnvironmentUnlock:", v101);
  v94[0] = v15;
  v94[1] = 3221225472;
  v94[2] = __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke_7;
  v94[3] = &unk_1E16BFB08;
  objc_copyWeak(&v99, v2);
  objc_copyWeak(v100, v4);
  v68 = v87;
  v95 = v68;
  v69 = v8;
  v96 = v69;
  v70 = v7;
  v71 = *(void **)(v1 + 72);
  v97 = v70;
  v100[1] = v71;
  v98 = *(id *)(v1 + 32);
  objc_msgSend(WeakRetained, "set_currentTransitionDidComplete:", v94);
  if (!objc_msgSend(WeakRetained, "presenting"))
  {
    if (objc_msgSend(WeakRetained, "dismissing"))
    {
      objc_msgSend(WeakRetained, "dismissalTransitionWillBegin");
      objc_msgSend(WeakRetained, "_sendPresentationControllerNotification:userInfo:", CFSTR("UIPresentationControllerDismissalTransitionWillBeginNotification"), 0);
    }
    else
    {
      if (!objc_msgSend(WeakRetained, "_transitioningFrom"))
      {
        if (!objc_msgSend(WeakRetained, "_transitioningTo"))
          goto LABEL_55;
        objc_msgSend(WeakRetained, "_transitionToWillBegin");
        goto LABEL_48;
      }
      objc_msgSend(WeakRetained, "_transitionFromWillBegin");
    }
    v72 = 0;
    goto LABEL_54;
  }
  objc_msgSend(WeakRetained, "presentationTransitionWillBegin");
  objc_msgSend(WeakRetained, "_sendPresentationControllerNotification:userInfo:", CFSTR("UIPresentationControllerPresentationTransitionWillBeginNotification"), 0);
LABEL_48:
  v72 = 1;
LABEL_54:
  objc_msgSend(WeakRetained, "_beginOcclusionIfNecessary:", v72);
LABEL_55:
  if (objc_msgSend(WeakRetained, "_shouldContinueTouchesOnTargetViewController")
    && objc_msgSend(WeakRetained, "presenting"))
  {
    objc_msgSend(WeakRetained, "_customViewForTouchContinuation");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "window");
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (v74)
    {
      objc_msgSend((id)UIApp, "_gestureEnvironment");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIGestureEnvironment _performTouchContinuationWithOverrideHitTestedView:]((uint64_t)v75, v73);

    }
  }
  v76 = *(id *)(v1 + 32);

  objc_destroyWeak(v100);
  objc_destroyWeak(&v99);

  objc_destroyWeak(&v104);
  objc_destroyWeak(&location);

  objc_destroyWeak(&v114);
  objc_destroyWeak(&v113);

  return v76;
}

- (void)_sendPresentationControllerNotification:(id)a3 userInfo:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0CB37D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:userInfo:", v8, v9, v7);

}

- (CGRect)_frameForTransitionViewInPresentationSuperview:(id)a3 inWindow:(id)a4
{
  id v6;
  id v7;
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
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "_preferredStatusBarVisibility") != 1)
  {
    v17 = v7;
    if (!v7)
    {
      objc_msgSend(v6, "window");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    __UIStatusBarManagerForWindow(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "isStatusBarHidden");

    if (!v7)
  }

  v19 = v7;
  v20 = v9;
  v21 = v11;
  v22 = v13;
  v23 = v15;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)set_currentTransitionDidComplete:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void)set_computeToEndFrameForCurrentTransition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void)set_toViewForCurrentTransition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void)set_fromViewForCurrentTransition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void)_setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (BOOL)_shouldContinueTouchesOnTargetViewController
{
  return self->_shouldContinueTouchesOnTargetViewController;
}

- (void)_beginOcclusionIfNecessary:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  BOOL v10;
  _QWORD v11[5];
  BOOL v12;

  v3 = a3;
  if (-[UIPresentationController _shouldOccludeDuringPresentation](self, "_shouldOccludeDuringPresentation"))
  {
    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_transitionCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[UIPresentationController presentingViewController](self, "presentingViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __55__UIPresentationController__beginOcclusionIfNecessary___block_invoke;
      v11[3] = &unk_1E16BF900;
      v11[4] = self;
      v12 = v3;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __55__UIPresentationController__beginOcclusionIfNecessary___block_invoke_2;
      v9[3] = &unk_1E16BF900;
      v9[4] = self;
      v10 = v3;
      objc_msgSend(v6, "animateAlongsideTransitionInView:animation:completion:", v8, v11, v9);

    }
    else
    {
      -[UIPresentationController _enableOcclusion:](self, "_enableOcclusion:", v3);
    }

  }
}

void __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke_7(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v5 = objc_loadWeakRetained((id *)(a1 + 72));
  if (objc_msgSend(WeakRetained, "presenting"))
  {
    objc_msgSend(WeakRetained, "presentationTransitionDidEnd:", a2);
    v32 = CFSTR("UIPresentationControllerPresentationTransitionDidEndCompletedKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("UIPresentationControllerPresentationTransitionDidEndNotification");
LABEL_5:
    objc_msgSend(WeakRetained, "_sendPresentationControllerNotification:userInfo:", v8, v7);

    goto LABEL_6;
  }
  if (objc_msgSend(WeakRetained, "dismissing"))
  {
    objc_msgSend(WeakRetained, "dismissalTransitionDidEnd:", a2);
    v30 = CFSTR("UIPresentationControllerDismissalTransitionDidEndCompletedKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("UIPresentationControllerDismissalTransitionDidEndNotification");
    goto LABEL_5;
  }
  if (objc_msgSend(WeakRetained, "_transitioningTo"))
  {
    objc_msgSend(WeakRetained, "_transitionToDidEnd");
  }
  else if (objc_msgSend(WeakRetained, "_transitioningFrom"))
  {
    objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
    objc_msgSend(WeakRetained, "_transitionFromDidEnd");
  }
LABEL_6:
  objc_msgSend(WeakRetained, "_setPendingFocusEnvironmentUnlock:", 0);
  if (objc_msgSend(WeakRetained, "dismissing") && (a2 & 1) != 0
    || objc_msgSend(WeakRetained, "presenting") && (a2 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setPresentationControllerToNotifyOnLayoutSubviews:", 0);

    objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
    if (objc_msgSend(WeakRetained, "_shouldGrabPresentersView"))
    {
      objc_msgSend(WeakRetained, "_parentPresentationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10
        && (objc_msgSend(WeakRetained, "presentingViewController"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v10, "presentedViewController"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v12,
            v11,
            v11 == v12))
      {
        v17 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v10, "_presentationView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "_transplantView:toSuperview:", v17, v18);

        v19 = objc_opt_respondsToSelector();
        v20 = *(void **)(a1 + 48);
        if ((v19 & 1) != 0)
        {
          objc_msgSend(WeakRetained, "presentingViewController");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_frameForChildContentContainer:", v21);
          _setFrameIgnoringLayerTransformOnOrAfterYukon(v20, v22, v23, v24, v25);

        }
        else
        {
          objc_msgSend(v10, "_frameOfPresentedViewControllerViewInSuperview");
          _setFrameIgnoringLayerTransformOnOrAfterYukon(v20, v26, v27, v28, v29);
        }
      }
      else
      {
        objc_msgSend(WeakRetained, "_transplantView:toSuperview:atIndex:", *(_QWORD *)(a1 + 48), v5, *(_QWORD *)(a1 + 80));
      }

    }
    objc_msgSend(WeakRetained, "_releaseSnapshot");
    objc_msgSend(*(id *)(a1 + 56), "removeFromSuperview");
    objc_msgSend(WeakRetained[23], "removeFromSuperview");
    objc_msgSend(WeakRetained, "containerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setPresentationControllerToNotifyOnLayoutSubviews:", 0);

    objc_msgSend(WeakRetained, "_setContainerView:", 0);
    objc_msgSend(WeakRetained[17], "removeFromSuperview");
    objc_msgSend(WeakRetained, "set_computeToEndFrameForCurrentTransition:", 0);
    objc_msgSend(WeakRetained, "set_currentTransitionDidComplete:", 0);
    goto LABEL_16;
  }
  if ((objc_msgSend(WeakRetained, "presenting") & 1) != 0)
  {
    if (!(_DWORD)a2)
      goto LABEL_28;
LABEL_26:
    if (objc_msgSend(WeakRetained, "shouldRemovePresentersView"))
    {
      objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
      goto LABEL_16;
    }
    goto LABEL_28;
  }
  if (objc_msgSend(WeakRetained, "_transitioningTo") && (a2 & 1) != 0)
    goto LABEL_26;
LABEL_28:
  if (objc_msgSend(WeakRetained, "_transitioningFrom"))
  {
    objc_msgSend(WeakRetained, "_presentationView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(a1 + 40);

    if (v14 != v15)
      objc_msgSend(WeakRetained[23], "removeFromSuperview");
    objc_msgSend(WeakRetained, "containerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_setPresentationControllerToNotifyOnLayoutSubviews:", 0);

    objc_msgSend(WeakRetained[17], "removeFromSuperview");
    objc_msgSend(WeakRetained, "_setContainerView:", 0);
  }
LABEL_16:

}

- (void)_setPendingFocusEnvironmentUnlock:(id)a3
{
  void (**pendingFocusEnvironmentUnlock)(void);
  void *v5;
  id v6;
  id aBlock;

  aBlock = a3;
  pendingFocusEnvironmentUnlock = (void (**)(void))self->__pendingFocusEnvironmentUnlock;
  if (pendingFocusEnvironmentUnlock)
    pendingFocusEnvironmentUnlock[2]();
  v5 = _Block_copy(aBlock);
  v6 = self->__pendingFocusEnvironmentUnlock;
  self->__pendingFocusEnvironmentUnlock = v5;

}

void __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_unlockEnvironment:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "_unlockEnvironment:", *(_QWORD *)(a1 + 40));

}

- (id)_customToViewForCurrentTransition
{
  return self->__customToViewForCurrentTransition;
}

- (id)_customFromViewForCurrentTransition
{
  return self->__customFromViewForCurrentTransition;
}

- (void)set_transitionViewForCurrentTransition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (UIView)_currentPresentationSuperview
{
  return (UIView *)objc_loadWeakRetained((id *)&self->__currentPresentationSuperview);
}

- (BOOL)_containerIgnoresDirectTouchEvents
{
  return self->_containerIgnoresDirectTouchEvents;
}

- (id)_childPresentationController
{
  void *v2;
  void *v3;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_presentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_releaseSnapshot
{
  UIView *snapshotOverlayView;

  -[UIView removeFromSuperview](self->_snapshotOverlayView, "removeFromSuperview");
  snapshotOverlayView = self->_snapshotOverlayView;
  self->_snapshotOverlayView = 0;

}

- (id)_fullscreenPresentationSuperview
{
  void *v3;
  void (**v4)(void);
  void *v5;
  void *v6;
  void *v7;

  -[UIPresentationController _containerSuperviewForCurrentTransition](self, "_containerSuperviewForCurrentTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3
    || (-[UIPresentationController _containerSuperviewForCurrentTransition](self, "_containerSuperviewForCurrentTransition"), v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(), v4[2](), v5 = (void *)objc_claimAutoreleasedReturnValue(), v4, !v5))
  {
    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_containerSuperviewForCurrentTransition
{
  return self->__containerSuperviewForCurrentTransition;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_parent:willTransitionToTraitCollection:withTransitionCoordinator:", self, v7, v6);

}

- (void)_window:(id)a3 willTransitionToTraitCollection:(id)a4 withTransitionCoordinator:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  if (-[UIPresentationController _shouldPerformWillTransitionToTraitCollectionForParent:](self, "_shouldPerformWillTransitionToTraitCollectionForParent:", v10))
  {
    -[UIPresentationController _adaptiveWillTransitionToTraitCollection:withTransitionCoordinator:](self, "_adaptiveWillTransitionToTraitCollection:withTransitionCoordinator:", v9, v8);
  }
  else
  {
    -[UIPresentationController _childPresentationController](self, "_childPresentationController");
  }
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_window:willTransitionToTraitCollection:withTransitionCoordinator:", v10, v9, v8);

}

- (BOOL)_shouldPerformWillTransitionToTraitCollectionForParent:(id)a3
{
  id v4;
  id v5;
  id v6;
  BOOL v7;

  v4 = a3;
  -[UIPresentationController _parentTraitEnvironment](self, "_parentTraitEnvironment");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v7 = 1;
  }
  else if (_UIPresentationControllersInheritTraitsFromViewHierarchy())
  {
    -[UIPresentationController _compatibleParentTraitEnvironment](self, "_compatibleParentTraitEnvironment");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v6 == v4;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_adaptiveWillTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  UIPresentationController *v10;
  UIPresentationController *v11;
  void ***v12;
  id v13;
  _UITraitOverrides *traitOverrides;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t *);
  void *v21;
  void ***v22;
  id v23;
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  -[UIPresentationController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_adaptedPresentationControllerForTraitCollection:withTransitionCoordinator:", v6, v7);
  v10 = (UIPresentationController *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = v10;
  else
    v11 = self;
  v12 = v11;
  v13 = v6;
  traitOverrides = self->_traitOverrides;
  v15 = v13;
  if (traitOverrides)
  {
    -[_UITraitOverrides _traitCollectionByApplyingOverridesToTraitCollection:](v12[3], v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v15 != v8 && (objc_msgSend(v8, "isEqual:", v15) & 1) == 0)
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __95__UIPresentationController__adaptiveWillTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
    v21 = &unk_1E16B51E8;
    v22 = v12;
    v23 = v8;
    v24 = v15;
    v25 = v7;
    +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", &v18);

  }
  objc_msgSend(v12, "presentedViewController", v18, v19, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)_enableOcclusion:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPresentationController _parentPresentationController](self, "_parentPresentationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "setTintAdjustmentMode:", !v3);
    +[_UIHDRUsageCoordinator sharedInstance]();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIHDRUsageCoordinator enableHDRSuppression:inViewHierarchy:]((uint64_t)v11, v3, v8);

  }
  else if (v3)
  {
    objc_msgSend(v8, "_beginOcclusion:", self);
  }
  else
  {
    objc_msgSend(v8, "_endOcclusion:", self);
  }
  objc_msgSend(v6, "setTintAdjustmentMode:", v3);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[UIPresentationController _passthroughViews](self, "_passthroughViews", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "setTintAdjustmentMode:", v3);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (void)transitionDidStart
{
  id v3;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (-[UIPresentationController _shouldMakePresentedViewControllerFirstResponder](self, "_shouldMakePresentedViewControllerFirstResponder")&& (objc_msgSend(v3, "_containsFirstResponder") & 1) == 0)
  {
    objc_msgSend(v3, "becomeFirstResponder");
  }

}

- (BOOL)_shouldMakePresentedViewControllerFirstResponder
{
  return 1;
}

- (id)_createVisualStyleForProvider:(id)a3
{
  return (id)objc_msgSend(a3, "defaultStyleForPresentationController:", self);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)__sizeClassPair
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rootViewController");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v3 != (void *)v6)
    {
      v7 = (void *)v6;
      v8 = objc_msgSend(v5, "__sizeClassPair");
      v10 = v9;
LABEL_5:

      goto LABEL_6;
    }
  }
  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v11, "__sizeClassPair");
  v10 = v12;

  v7 = v3;
  if (v5)
    goto LABEL_5;
LABEL_6:

  v13 = v8;
  v14 = v10;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (void)_setPresentedViewControllerStoredWeakly:(BOOL)a3
{
  UIViewController *presentedViewController;
  UIViewController *WeakRetained;
  UIViewController *v6;

  if (self->__presentedViewControllerStoredWeakly != a3)
  {
    self->__presentedViewControllerStoredWeakly = a3;
    if (a3)
    {
      objc_storeWeak((id *)&self->_weakPresentedViewController, self->_presentedViewController);
      presentedViewController = self->_presentedViewController;
      self->_presentedViewController = 0;

    }
    else
    {
      WeakRetained = (UIViewController *)objc_loadWeakRetained((id *)&self->_weakPresentedViewController);
      v6 = self->_presentedViewController;
      self->_presentedViewController = WeakRetained;

      objc_storeWeak((id *)&self->_weakPresentedViewController, 0);
    }
  }
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (_UIPresentationControllerVisualStyle)_visualStyle
{
  return self->_visualStyle;
}

- (BOOL)_shouldConvertToScene
{
  return 0;
}

- (void)_setSourceViewController:(id)a3
{
  objc_storeWeak((id *)&self->__sourceViewController, a3);
}

- (void)_sendDelegateWillPresentWithAdaptiveStyle:(int64_t)a3 transitionCoordinator:(id)a4
{
  id WeakRetained;
  id v7;

  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "presentationController:willPresentWithAdaptiveStyle:transitionCoordinator:", self, a3, v7);

}

- (id)_preferredAnimationControllerForPresentation
{
  void *v2;
  void *v3;

  -[UIPresentationController _visualStyle](self, "_visualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredAnimationControllerForPresentation:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_initialPresentationViewControllerForViewController:(id)a3
{
  return a3;
}

- (BOOL)_forcesPreferredAnimationControllers
{
  return 0;
}

- (void)_containedViewControllerModalStateChanged
{
  id v2;

  -[UIPresentationController _parentPresentationController](self, "_parentPresentationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_containedViewControllerModalStateChanged");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customViewForTouchContinuation, 0);
  objc_destroyWeak((id *)&self->__viewForRemoteTextEffectsWindowMatchAnimation);
  objc_storeStrong(&self->__currentTransitionDidComplete, 0);
  objc_storeStrong(&self->__computeToEndFrameForCurrentTransition, 0);
  objc_storeStrong(&self->__customToViewForCurrentTransition, 0);
  objc_storeStrong(&self->__customFromViewForCurrentTransition, 0);
  objc_storeStrong(&self->__toViewForCurrentTransition, 0);
  objc_storeStrong(&self->__fromViewForCurrentTransition, 0);
  objc_storeStrong(&self->__containerSuperviewForCurrentTransition, 0);
  objc_storeStrong(&self->__transitionViewForCurrentTransition, 0);
  objc_storeStrong((id *)&self->_adaptiveTransitionContext, 0);
  objc_storeStrong((id *)&self->_adaptiveTransitionCoordinator, 0);
  objc_destroyWeak((id *)&self->__currentPresentationSuperview);
  objc_storeStrong((id *)&self->_presentationView, 0);
  objc_destroyWeak((id *)&self->__sourceViewController);
  objc_storeStrong((id *)&self->_currentInteractionController, 0);
  objc_storeStrong((id *)&self->_currentTransitionController, 0);
  objc_storeStrong(&self->__pendingFocusEnvironmentUnlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_destroyWeak((id *)&self->_windowSceneIgnoringEvents);
  objc_destroyWeak((id *)&self->_weakPresentedViewController);
  objc_storeStrong((id *)&self->_observedRealSourceView, 0);
  objc_storeStrong((id *)&self->_currentRunningAnimationsUUID, 0);
  objc_storeStrong((id *)&self->_backGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_snapshotOverlayView, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistry, 0);
  objc_storeStrong((id *)&self->_traitOverrides, 0);
  objc_storeStrong((id *)&self->_lastNotifiedTraitCollection, 0);
}

uint64_t __55__UIPresentationController__beginOcclusionIfNecessary___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_enableOcclusion:", *(_BYTE *)(a1 + 40) == 0);
  return result;
}

- (void)_containerViewWillLayoutSubviewsWithObservationTracking
{
  UIPresentationController *v2;

  v2 = self;
  sub_185728C14();

}

- (void)_containerViewDidLayoutSubviewsWithObservationTracking
{
  UIPresentationController *v2;

  v2 = self;
  sub_185729074();

}

- (void)_ui_setObservationTrackingDictionary:(id)a3
{
  objc_super v3;

  self->_hasObservationTrackingDictionary = a3 != 0;
  v3.receiver = self;
  v3.super_class = (Class)UIPresentationController;
  -[NSObject _ui_setObservationTrackingDictionary:](&v3, sel__ui_setObservationTrackingDictionary_);
}

- (id)_ui_observationTrackingDictionary
{
  void *v2;
  objc_super v4;

  if (self->_hasObservationTrackingDictionary)
  {
    v4.receiver = self;
    v4.super_class = (Class)UIPresentationController;
    -[NSObject _ui_observationTrackingDictionary](&v4, sel__ui_observationTrackingDictionary);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (_UIViewControllerTransitionContext)_transitionContext
{
  void *v2;
  void *v3;

  -[UIPresentationController _currentTransitionController](self, "_currentTransitionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:](_UIViewControllerTransitionContext, "_associatedTransitionContextForAnimationController:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (_UIViewControllerTransitionContext *)v3;
}

- (UIViewControllerTransitionCoordinator)_transitionCoordinator
{
  void *v2;
  void *v3;

  -[UIPresentationController _transitionContext](self, "_transitionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_transitionCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewControllerTransitionCoordinator *)v3;
}

- (UIViewControllerTransitionCoordinator)_definiteTransitionCoordinator
{
  _UIViewControllerImmediateAnimationTransitionCoordinator *v3;
  _UIViewControllerImmediateAnimationTransitionCoordinator *v4;
  void *v5;

  -[UIPresentationController _transitionCoordinator](self, "_transitionCoordinator");
  v3 = (_UIViewControllerImmediateAnimationTransitionCoordinator *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [_UIViewControllerImmediateAnimationTransitionCoordinator alloc];
    -[UIPresentationController containerView](self, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[_UIViewControllerImmediateAnimationTransitionCoordinator initWithContainerView:](v4, "initWithContainerView:", v5);

  }
  return (UIViewControllerTransitionCoordinator *)v3;
}

- (void)setSourceView:(id)a3
{
  UIView *v6;
  char isKindOfClass;
  void *v8;
  UIView *v9;

  v6 = (UIView *)a3;
  v9 = v6;
  if (v6)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v6 = v9;
    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPresentationController.m"), 187, CFSTR("Tried to set %@ as sourceView of %@, even though it is not a kind of UIView."), v9, self);

      v6 = v9;
    }
  }
  if (self->_sourceView != v6)
  {
    objc_storeStrong((id *)&self->_sourceView, a3);
    -[UIPresentationController _updateRealSourceView](self, "_updateRealSourceView");
    v6 = v9;
  }

}

- (void)setSourceItem:(id)a3
{
  id v5;
  void *v6;
  UIPopoverPresentationControllerSourceItem *v7;
  void *v8;
  uint64_t v9;
  UIPopoverPresentationControllerSourceItem *v10;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    _UIPopoverPresentationControllerSourceItemUpCast(v5);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (UIPopoverPresentationControllerSourceItem *)v9;
    if (v9)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPresentationController.m"), 202, CFSTR("Tried to set %@ as sourceItem of %@, which is not a supported class"), 0, self);

  }
  v7 = 0;
LABEL_5:
  if (self->_sourceItem != v7)
  {
    v10 = v7;
    objc_storeStrong((id *)&self->_sourceItem, v7);
    -[UIPresentationController _updateRealSourceView](self, "_updateRealSourceView");
    v7 = v10;
  }

}

- (UIBarButtonItem)barButtonItem
{
  void *v2;
  id v3;

  -[UIPresentationController sourceItem](self, "sourceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (UIBarButtonItem *)v3;
}

- (void)_updateRealSourceView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  unint64_t v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[UIPresentationController sourceItem](self, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIPopoverPresentationControllerSourceItemUpCast(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIPresentationController containerView](self, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "_sourceViewForPresentationInWindow:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (os_variant_has_internal_diagnostics())
      {
        if (!v7)
        {
          __UIFaultDebugAssertLog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
          {
            v11 = 138412290;
            v12 = v4;
            _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Assuming %@'s view exists", (uint8_t *)&v11, 0xCu);
          }

        }
      }
      else if (!v7)
      {
        v9 = _updateRealSourceView___s_category;
        if (!_updateRealSourceView___s_category)
        {
          v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v9, (unint64_t *)&_updateRealSourceView___s_category);
        }
        v10 = *(NSObject **)(v9 + 8);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = 138412290;
          v12 = v4;
          _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Assuming %@'s view exists", (uint8_t *)&v11, 0xCu);
        }
      }
    }

  }
  else
  {
    -[UIPresentationController sourceView](self, "sourceView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[UIPresentationController _setRealSourceView:](self, "_setRealSourceView:", v7);

}

- (void)_setRealSourceView:(id)a3
{
  UIView *v5;
  UIView *observedRealSourceView;
  UIView **p_observedRealSourceView;
  UIView *v8;
  UIView *v9;
  UIView *v10;

  v5 = (UIView *)a3;
  p_observedRealSourceView = &self->_observedRealSourceView;
  observedRealSourceView = self->_observedRealSourceView;
  if (observedRealSourceView != v5)
  {
    v10 = v5;
    v8 = observedRealSourceView;
    objc_storeStrong((id *)&self->_observedRealSourceView, a3);
    if (v8)
      -[UIView _removeGeometryChangeObserver:](v8, self);
    if (*p_observedRealSourceView)
    {
      -[UIView _addGeometryChangeObserver:](*p_observedRealSourceView, self);
      v9 = self->_observedRealSourceView;
    }
    else
    {
      v9 = 0;
    }
    -[UIPresentationController _realSourceViewDidChangeFromView:toView:](self, "_realSourceViewDidChangeFromView:toView:", v8, v9);

    v5 = v10;
  }

}

- (UIView)_realSourceView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIView *v7;
  UIView *v8;

  -[UIPresentationController sourceItem](self, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIPopoverPresentationControllerSourceItemUpCast(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIPresentationController containerView](self, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_sourceViewForPresentationInWindow:", v6);
    v7 = (UIView *)objc_claimAutoreleasedReturnValue();

    if (v7 != self->_observedRealSourceView)
      -[UIPresentationController _updateRealSourceView](self, "_updateRealSourceView");

  }
  v8 = self->_observedRealSourceView;

  return v8;
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  void *v5;

  -[UIPresentationController containerView](self, "containerView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

  -[UIPresentationController _realSourceViewGeometryDidChange](self, "_realSourceViewGeometryDidChange");
}

- (UIPresentationController)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[UIPresentationController init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Don't call %@."), v5);

  return 0;
}

- (void)_transplantView:(id)a3 toSuperview:(id)a4 atIndex:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  unint64_t v16;

  v7 = a3;
  v8 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__UIPresentationController__transplantView_toSuperview_atIndex___block_invoke;
  v13[3] = &unk_1E16BF958;
  v14 = v7;
  v15 = v8;
  v16 = a5;
  v9 = v8;
  v12 = v7;
  objc_msgSend(v12, "_window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "windowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIView _performBlockDelayingTriggeringResponderEvents:forScene:]((uint64_t)UIView, v13, v11);

}

uint64_t __64__UIPresentationController__transplantView_toSuperview_atIndex___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v2 = _frameIgnoringLayerTransformOnOrAfterYukon(*(void **)(a1 + 32));
  v4 = v3;
  v6 = v5;
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertPoint:toView:", *(_QWORD *)(a1 + 40), v2, v4);
  v11 = v10;
  v13 = v12;

  _setFrameIgnoringLayerTransformOnOrAfterYukon(*(void **)(a1 + 32), v11, v13, v6, v8);
  objc_msgSend(*(id *)(a1 + 40), "insertSubview:atIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  return 0;
}

- (void)_transplantView:(id)a3 toSuperview:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__UIPresentationController__transplantView_toSuperview___block_invoke;
  v11[3] = &unk_1E16BF980;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v10 = v5;
  objc_msgSend(v10, "_window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIView _performBlockDelayingTriggeringResponderEvents:forScene:]((uint64_t)UIView, v11, v9);

}

uint64_t __56__UIPresentationController__transplantView_toSuperview___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v2 = _frameIgnoringLayerTransformOnOrAfterYukon(*(void **)(a1 + 32));
  v4 = v3;
  v6 = v5;
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertPoint:toView:", *(_QWORD *)(a1 + 40), v2, v4);
  v11 = v10;
  v13 = v12;

  _setFrameIgnoringLayerTransformOnOrAfterYukon(*(void **)(a1 + 32), v11, v13, v6, v8);
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", *(_QWORD *)(a1 + 32));
  return 0;
}

- (BOOL)dismissed
{
  return self->_state == 0;
}

- (BOOL)_presentingOrPresented
{
  return -[UIPresentationController presenting](self, "presenting")
      || -[UIPresentationController presented](self, "presented");
}

- (BOOL)_isAdapted
{
  UIPresentationController *v2;
  void *v3;
  UIPresentationController *v4;

  v2 = self;
  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_presentationController");
  v4 = (UIPresentationController *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != v2;

  return (char)v2;
}

- (id)_activePresentationController
{
  void *v2;
  void *v3;

  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_presentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_shouldPresentedViewControllerControlStatusBarAppearance
{
  void *v3;
  void *v4;
  char v5;

  if (-[UIPresentationController shouldPresentInFullscreen](self, "shouldPresentInFullscreen"))
    return -[UIPresentationController shouldRemovePresentersView](self, "shouldRemovePresentersView");
  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_existingPresentationControllerImmediate:effective:includesRoot:", 0, 1, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return -[UIPresentationController shouldRemovePresentersView](self, "shouldRemovePresentersView");
  v5 = objc_msgSend(v4, "_shouldPresentedViewControllerControlStatusBarAppearance");

  return v5;
}

- (BOOL)_shouldPresentedViewControllerServeAsBaseForScrollToTop
{
  return 1;
}

- (BOOL)_shouldDismissWithNavigationPop
{
  return 0;
}

- (BOOL)_shouldPreserveFirstResponder
{
  return 1;
}

- (BOOL)_shouldKeepCurrentFirstResponder
{
  return 1;
}

- (BOOL)_preserveResponderAcrossWindows
{
  return 1;
}

- (BOOL)_wantsAutomaticFirstResponderWhenPresentingRemoteViewController
{
  return 1;
}

- (void)_prepareForWindowDeallocRecursively:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _DWORD *v9;

  v3 = a3;
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v9 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v9, "_prepareForWindowDealloc");
  if (v9 && ((v9[92] >> 1) & 3u) - 1 <= 1)
  {
    objc_msgSend(v9, "beginAppearanceTransition:animated:", 0, 0);
    objc_msgSend(v9, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    objc_msgSend(v9, "endAppearanceTransition");
  }
  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_originalPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setPresentingViewController:", 0);

  -[UIPresentationController _setPresentingViewController:](self, "_setPresentingViewController:", 0);
}

- (BOOL)_presentationPotentiallyUnderlapsStatusBar
{
  return 1;
}

- (void)_presentWithAnimationController:(id)a3 inWindow:(id)a4 interactionController:(id)a5 animated:(BOOL)a6 handoffData:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  id v32;
  void *v33;
  _BOOL4 v34;
  uint8_t buf[4];
  UIPresentationController *v36;
  uint64_t v37;

  v34 = a6;
  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v32 = a4;
  v13 = a5;
  v14 = a7;
  v15 = objc_opt_class();
  if (v15 == objc_opt_class())
    objc_msgSend(v12, "setDelegate:", self);
  -[UIPresentationController _setCurrentTransitionController:](self, "_setCurrentTransitionController:", v12, v32);
  -[UIPresentationController _setCurrentInteractionController:](self, "_setCurrentInteractionController:", v13);
  if (self->_state)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v36 = self;
        _os_log_fault_impl(&dword_185066000, v31, OS_LOG_TYPE_FAULT, "Trying to present the presentation controller while transitioning already. (%@)", buf, 0xCu);
      }

    }
    else
    {
      v28 = _presentWithAnimationController_inWindow_interactionController_animated_handoffData____s_category;
      if (!_presentWithAnimationController_inWindow_interactionController_animated_handoffData____s_category)
      {
        v28 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v28, (unint64_t *)&_presentWithAnimationController_inWindow_interactionController_animated_handoffData____s_category);
      }
      v29 = *(NSObject **)(v28 + 8);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = self;
        _os_log_impl(&dword_185066000, v29, OS_LOG_TYPE_ERROR, "Trying to present the presentation controller while transitioning already. (%@)", buf, 0xCu);
      }
    }
  }
  self->_state = 1;
  if (-[UIPresentationController shouldPresentInFullscreen](self, "shouldPresentInFullscreen"))
    -[UIPresentationController _fullscreenPresentationSuperview](self, "_fullscreenPresentationSuperview");
  else
    -[UIPresentationController _currentContextPresentationSuperview](self, "_currentContextPresentationSuperview");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIPresentationController _shouldRespectDefinesPresentationContext](self, "_shouldRespectDefinesPresentationContext"))
  {
    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      do
      {
        if ((objc_msgSend(v17, "definesPresentationContext") & 1) != 0)
          break;
        objc_msgSend(v17, "parentViewController");
        v18 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v18;
      }
      while (v18);
    }
    if (objc_msgSend(v17, "definesPresentationContext"))
    {
      objc_msgSend(v17, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "superview");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPresentationController.m"), 801, CFSTR("The view defining presentation context doesn't have a superview"));

      }
      objc_msgSend(v17, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "superview");
      v22 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v22;
    }

  }
  -[UIPresentationController _setCurrentPresentationSuperview:](self, "_setCurrentPresentationSuperview:", v16);
  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_existingView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "window");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController _adjustOrientationIfNecessaryInWindow:forViewController:preservingViewController:](self, "_adjustOrientationIfNecessaryInWindow:forViewController:preservingViewController:", v25, v26, v27);

  -[UIPresentationController _initViewHierarchyForPresentationSuperview:inWindow:](self, "_initViewHierarchyForPresentationSuperview:inWindow:", v16, v33);
  -[UIPresentationController runTransitionForCurrentStateAnimated:handoffData:](self, "runTransitionForCurrentStateAnimated:handoffData:", v34, v14);

}

- (void)_dismissWithAnimationController:(id)a3 interactionController:(id)a4 animated:(BOOL)a5 handoffData:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  UIPresentationController *v24;
  uint64_t v25;

  v7 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIPresentationController forcePresentationControllerDelegate](self, "forcePresentationControllerDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v13, "forcePresentationControllerWillDismiss:", self);
  }
  else
  {
    v13 = 0;
  }
  v14 = objc_opt_class();
  if (v14 == objc_opt_class())
    objc_msgSend(v10, "setDelegate:", self);
  -[UIPresentationController _setCurrentTransitionController:](self, "_setCurrentTransitionController:", v10);
  -[UIPresentationController _setCurrentInteractionController:](self, "_setCurrentInteractionController:", v12);

  if (self->_state != 2)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        v23 = 138412290;
        v24 = self;
        _os_log_fault_impl(&dword_185066000, v22, OS_LOG_TYPE_FAULT, "Trying to dismiss the presentation controller while transitioning already. (%@)", (uint8_t *)&v23, 0xCu);
      }

    }
    else
    {
      v20 = _dismissWithAnimationController_interactionController_animated_handoffData____s_category;
      if (!_dismissWithAnimationController_interactionController_animated_handoffData____s_category)
      {
        v20 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v20, (unint64_t *)&_dismissWithAnimationController_interactionController_animated_handoffData____s_category);
      }
      v21 = *(NSObject **)(v20 + 8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v23 = 138412290;
        v24 = self;
        _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "Trying to dismiss the presentation controller while transitioning already. (%@)", (uint8_t *)&v23, 0xCu);
      }
    }
  }
  self->_state = 3;
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_existingView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController _adjustOrientationIfNecessaryInWindow:forViewController:preservingViewController:](self, "_adjustOrientationIfNecessaryInWindow:forViewController:preservingViewController:", v17, v18, v19);

  -[UIPresentationController runTransitionForCurrentStateAnimated:handoffData:](self, "runTransitionForCurrentStateAnimated:handoffData:", v7, v11);
}

- (UIView)_presentationView
{
  return self->_presentationView;
}

- (void)_transitionToPresentationController:(id)a3 withTransitionCoordinator:(id)a4
{
  void *v4;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  char v17;
  BOOL v18;
  BOOL v19;
  void *v20;
  char isKindOfClass;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  char v32;
  char v33;
  void *v34;
  int has_internal_diagnostics;
  void *v36;
  void *v37;
  uint64_t (**v38)(void);
  id v39;
  void *v40;
  char v41;
  uint64_t v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  NSObject *v47;
  unint64_t v48;
  NSObject *v49;
  char v50;
  char v51;
  _BOOL4 v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  UIPresentationController *v56;
  BOOL v57;
  char v58;
  char v59;
  char v60;
  BOOL v61;
  _QWORD v62[4];
  id v63;
  id v64;
  UIPresentationController *v65;
  _QWORD v66[4];
  id v67;
  id v68;
  UIPresentationController *v69;
  BOOL v70;
  BOOL v71;
  uint8_t buf[4];
  UIPresentationController *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[UIPresentationController completeCurrentTransitionImmediately](self, "completeCurrentTransitionImmediately");
  if (!self->_state)
    goto LABEL_47;
  v53 = v8;
  self->_state = 4;
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[UIPresentationController _changedPresentingViewControllerDuringAdaptation](self, "_changedPresentingViewControllerDuringAdaptation");
  -[UIPresentationController _setChangedPresentingViewControllerDuringAdaptation:](self, "_setChangedPresentingViewControllerDuringAdaptation:", 0);
  if ((_DWORD)v11)
  {
    if ((objc_msgSend(v7, "shouldRemovePresentersView") & 1) == 0)
    {
      -[UIPresentationController presentingViewController](self, "presentingViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (uint64_t)v12;
      v13 = 1;
LABEL_7:
      objc_msgSend(v12, "beginAppearanceTransition:animated:", v13, 1);

      v51 = 1;
      goto LABEL_9;
    }
  }
  else
  {
    v11 = -[UIPresentationController shouldRemovePresentersView](self, "shouldRemovePresentersView");
    if ((_DWORD)v11 != objc_msgSend(v7, "shouldRemovePresentersView"))
    {
      -[UIPresentationController presentingViewController](self, "presentingViewController");
      v11 = objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v7, "shouldRemovePresentersView") ^ 1;
      v12 = (void *)v11;
      goto LABEL_7;
    }
  }
  v51 = 0;
LABEL_9:
  if (v9 == v10)
  {
    LOBYTE(v52) = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    goto LABEL_38;
  }
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topViewController");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentedViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v11 == (_QWORD)v15;

  }
  else
  {
    v16 = 0;
  }

  objc_msgSend(v7, "presentedViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v52 = v16;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "presentedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topViewController");
    v11 = objc_claimAutoreleasedReturnValue();
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v11 == v22)
    {

      goto LABEL_27;
    }
    v4 = (void *)v22;
  }
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    if ((isKindOfClass & 1) != 0)
    {

    }
    v17 = 0;
LABEL_28:

    if (!v16)
      goto LABEL_30;
    goto LABEL_29;
  }
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if ((isKindOfClass & 1) != 0)
  {

  }
  if (!v25)
  {
LABEL_27:
    objc_msgSend(v7, "presentedViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 1;
    objc_msgSend(v20, "_setIsWrappingDuringAdaptation:", 1);
    v16 = v52;
    goto LABEL_28;
  }
  v17 = 0;
  LOBYTE(v16) = v52;
  if (v52)
  {
LABEL_29:
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_setIsWrappingDuringAdaptation:", 1);

  }
LABEL_30:
  -[UIPresentationController _childPresentationController](self, "_childPresentationController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v27 != 0;
  if (v27)
  {
    -[UIPresentationController _childPresentationController](self, "_childPresentationController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_setChangedPresentingViewControllerDuringAdaptation:", 1);
LABEL_35:
    v19 = v27 == 0;

    goto LABEL_36;
  }
  if (!v16)
  {
    objc_msgSend(v7, "presentedViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "beginAppearanceTransition:animated:", 1, 1);
    goto LABEL_35;
  }
  v19 = 0;
LABEL_36:
  -[UIPresentationController _childPresentationController](self, "_childPresentationController");
  v29 = objc_claimAutoreleasedReturnValue();
  if (!v29
    || (v30 = (void *)v29,
        -[UIPresentationController _childPresentationController](self, "_childPresentationController"),
        v31 = (void *)objc_claimAutoreleasedReturnValue(),
        v32 = objc_msgSend(v31, "shouldRemovePresentersView"),
        v31,
        v30,
        (v32 & 1) == 0))
  {
    if ((v17 & 1) != 0)
    {
      v33 = 0;
      v17 = 1;
    }
    else
    {
      -[UIPresentationController presentedViewController](self, "presentedViewController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 1;
      objc_msgSend(v34, "beginAppearanceTransition:animated:", 0, 1);

      v17 = 0;
    }
    goto LABEL_42;
  }
LABEL_38:
  v33 = 0;
LABEL_42:
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  -[UIPresentationController _transitionViewForCurrentTransition](self, "_transitionViewForCurrentTransition");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (has_internal_diagnostics)
  {
    if (!v36)
    {
      __UIFaultDebugAssertLog();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v73 = self;
        _os_log_fault_impl(&dword_185066000, v47, OS_LOG_TYPE_FAULT, "transitionViewForCurrentTransition is not set! (%@)", buf, 0xCu);
      }

    }
  }
  else if (!v36)
  {
    v48 = _transitionToPresentationController_withTransitionCoordinator____s_category;
    if (!_transitionToPresentationController_withTransitionCoordinator____s_category)
    {
      v48 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v48, (unint64_t *)&_transitionToPresentationController_withTransitionCoordinator____s_category);
    }
    v49 = *(NSObject **)(v48 + 8);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v73 = self;
      _os_log_impl(&dword_185066000, v49, OS_LOG_TYPE_ERROR, "transitionViewForCurrentTransition is not set! (%@)", buf, 0xCu);
    }
  }
  -[UIPresentationController _transitionViewForCurrentTransition](self, "_transitionViewForCurrentTransition");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    -[UIPresentationController _transitionViewForCurrentTransition](self, "_transitionViewForCurrentTransition");
    v38 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v39 = (id)v38[2]();

    objc_msgSend(v7, "setState:", 5);
    -[UIPresentationController _currentPresentationSuperview](self, "_currentPresentationSuperview");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setCurrentPresentationSuperview:", v40);
    v50 = v17;
    v41 = v33;
    v42 = MEMORY[0x1E0C809B0];
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __90__UIPresentationController__transitionToPresentationController_withTransitionCoordinator___block_invoke;
    v66[3] = &unk_1E16B2950;
    v43 = v7;
    v67 = v43;
    v44 = v40;
    v70 = v18;
    v71 = v52;
    v68 = v44;
    v69 = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v66);
    v8 = v53;
    -[_UIPresentationControllerVisualStyle runAlongsideTransitionToPresentationController:transitionCoordinator:](self->_visualStyle, "runAlongsideTransitionToPresentationController:transitionCoordinator:", v43, v53);
    objc_msgSend(v43, "_visualStyle");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "runAlongsideTransitionFromPresentationController:transitionCoordinator:", self, v53);

    v62[0] = v42;
    v62[1] = 3221225472;
    v62[2] = __90__UIPresentationController__transitionToPresentationController_withTransitionCoordinator___block_invoke_2;
    v62[3] = &unk_1E16BF9D0;
    v63 = v43;
    v64 = v44;
    v65 = self;
    v54[0] = v42;
    v54[1] = 3221225472;
    v54[2] = __90__UIPresentationController__transitionToPresentationController_withTransitionCoordinator___block_invoke_4;
    v54[3] = &unk_1E16BF9F8;
    v55 = v63;
    v56 = self;
    v57 = v19;
    v58 = v41;
    v59 = v51;
    v60 = v50;
    v61 = v52;
    v46 = v44;
    objc_msgSend(v53, "_animateAlongsideTransitionInView:systemAnimation:systemCompletion:animation:completion:", 0, 0, 1, v62, v54);

  }
  else
  {
    NSLog(CFSTR("Null transitionViewForCurrentTransition block, aborting %s"), "-[UIPresentationController _transitionToPresentationController:withTransitionCoordinator:]");
    v8 = v53;
  }
LABEL_47:

}

void __90__UIPresentationController__transitionToPresentationController_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t (**v2)(void);
  id v3;
  void (**v4)(void);
  double (**v5)(void);
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  objc_msgSend(*(id *)(a1 + 32), "_initViewHierarchyForPresentationSuperview:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_transitionViewForCurrentTransition");
  v2 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v3 = (id)v2[2]();

  objc_msgSend(*(id *)(a1 + 32), "_toViewForCurrentTransition");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();
  v30 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_computeToEndFrameForCurrentTransition");
  v5 = (double (**)(void))objc_claimAutoreleasedReturnValue();
  v6 = v5[2]();
  v8 = v7;
  v10 = v9;
  v12 = v11;

  _setFrameIgnoringLayerTransformOnOrAfterYukon(v30, v6, v8, v10, v12);
  if (*(_BYTE *)(a1 + 56) || *(_BYTE *)(a1 + 57))
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPerformingModalTransition:", 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v30);

  objc_msgSend(*(id *)(a1 + 48), "_childPresentationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(void **)(a1 + 32);
  objc_msgSend(v16, "presentedViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "superview");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_setPresentationView:", v19);

  if (v15 && (objc_msgSend(v15, "shouldPresentInFullscreen") & 1) == 0)
  {
    objc_msgSend(v15, "containerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_presentationView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    _setFrameIgnoringLayerTransformOnOrAfterYukon(v20, v22, v23, v24, v25);

    objc_msgSend(*(id *)(a1 + 32), "_presentationView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "containerView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v27);

  }
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setPerformingModalTransition:", 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAlpha:", 0.0);

}

void __90__UIPresentationController__transitionToPresentationController_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  objc_msgSend(*(id *)(a1 + 32), "_frameForTransitionViewInPresentationSuperview:", *(_QWORD *)(a1 + 40));
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __90__UIPresentationController__transitionToPresentationController_withTransitionCoordinator___block_invoke_3;
  v12[3] = &unk_1E16B20D8;
  v13 = *(id *)(a1 + 32);
  v14 = v3;
  v15 = v5;
  v16 = v7;
  v17 = v9;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v12);
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 48), "containerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", 0.0);

}

void __90__UIPresentationController__transitionToPresentationController_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v5 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutBelowIfNeeded");

}

void __90__UIPresentationController__transitionToPresentationController_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_currentTransitionDidComplete");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    goto LABEL_2;
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      goto LABEL_23;
    v29 = *(_QWORD *)(a1 + 32);
    v28 = *(void **)(a1 + 40);
    objc_msgSend(v28, "presentedViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "presentingViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138413058;
    v33 = v29;
    v34 = 2112;
    v35 = v28;
    v36 = 2112;
    v37 = v19;
    v38 = 2112;
    v39 = v20;
    _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "toPresentationController._currentTransitionDidComplete is nil! for toPresentationController : %@, self : %@, presentedViewController : %@, presentingViewController : %@", (uint8_t *)&v32, 0x2Au);
LABEL_22:

LABEL_23:
    goto LABEL_2;
  }
  v14 = qword_1ECD7D3A8;
  if (!qword_1ECD7D3A8)
  {
    v14 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v14, (unint64_t *)&qword_1ECD7D3A8);
  }
  v15 = *(NSObject **)(v14 + 8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v17 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(a1 + 40);
    v18 = v15;
    objc_msgSend(v16, "presentedViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "presentingViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138413058;
    v33 = v17;
    v34 = 2112;
    v35 = v16;
    v36 = 2112;
    v37 = v19;
    v38 = 2112;
    v39 = v20;
    _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "toPresentationController._currentTransitionDidComplete is nil! for toPresentationController : %@, self : %@, presentedViewController : %@, presentingViewController : %@", (uint8_t *)&v32, 0x2Au);
    goto LABEL_22;
  }
LABEL_2:
  objc_msgSend(*(id *)(a1 + 40), "_currentTransitionDidComplete");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    goto LABEL_3;
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      goto LABEL_30;
    v31 = *(_QWORD *)(a1 + 32);
    v30 = *(void **)(a1 + 40);
    objc_msgSend(v30, "presentedViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "presentingViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138413058;
    v33 = v31;
    v34 = 2112;
    v35 = v30;
    v36 = 2112;
    v37 = v26;
    v38 = 2112;
    v39 = v27;
    _os_log_fault_impl(&dword_185066000, v25, OS_LOG_TYPE_FAULT, "self._currentTransitionDidComplete is nil! for toPresentationController : %@, self : %@ presentedViewController : %@, presentingViewController : %@", (uint8_t *)&v32, 0x2Au);
LABEL_29:

LABEL_30:
    goto LABEL_3;
  }
  v21 = qword_1ECD7D3B0;
  if (!qword_1ECD7D3B0)
  {
    v21 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v21, (unint64_t *)&qword_1ECD7D3B0);
  }
  v22 = *(NSObject **)(v21 + 8);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v24 = *(_QWORD *)(a1 + 32);
    v23 = *(void **)(a1 + 40);
    v25 = v22;
    objc_msgSend(v23, "presentedViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "presentingViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138413058;
    v33 = v24;
    v34 = 2112;
    v35 = v23;
    v36 = 2112;
    v37 = v26;
    v38 = 2112;
    v39 = v27;
    _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "self._currentTransitionDidComplete is nil! for toPresentationController : %@, self : %@ presentedViewController : %@, presentingViewController : %@", (uint8_t *)&v32, 0x2Au);
    goto LABEL_29;
  }
LABEL_3:
  objc_msgSend(*(id *)(a1 + 32), "_currentTransitionDidComplete");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "_currentTransitionDidComplete");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "_currentTransitionDidComplete");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v6[2](v6, 1);

      objc_msgSend(*(id *)(a1 + 40), "_currentTransitionDidComplete");
      v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v7[2](v7, 1);

      if (*(_BYTE *)(a1 + 48))
      {
        objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "endAppearanceTransition");

      }
      if (*(_BYTE *)(a1 + 49))
      {
        objc_msgSend(*(id *)(a1 + 40), "presentedViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "endAppearanceTransition");

      }
      if (*(_BYTE *)(a1 + 50))
      {
        objc_msgSend(*(id *)(a1 + 40), "presentingViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "endAppearanceTransition");

      }
      if (*(_BYTE *)(a1 + 51))
      {
        objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_setIsWrappingDuringAdaptation:", 0);

      }
      if (*(_BYTE *)(a1 + 52))
      {
        objc_msgSend(*(id *)(a1 + 40), "presentedViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_setIsWrappingDuringAdaptation:", 0);

      }
      objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPerformingModalTransition:", 0);

      objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
      objc_msgSend(*(id *)(a1 + 40), "_cleanup");
      objc_msgSend(*(id *)(a1 + 32), "_setAdaptiveTransitionCoordinator:", 0);
      objc_msgSend(*(id *)(a1 + 32), "_setAdaptiveTransitionContext:", 0);
    }
  }
}

- (id)_firstCurrentContextChildInWindow
{
  return 0;
}

- (BOOL)_presentedViewControllerProvidesContentScrollView
{
  void *v3;
  char v4;
  int v5;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isTVSearchControllerContainer");

  if ((v4 & 1) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = _UIBarsApplyChromelessEverywhere();
    if (v5)
      LOBYTE(v5) = !-[UIPresentationController shouldPresentInFullscreen](self, "shouldPresentInFullscreen")
                && -[UIPresentationController _shouldRespectDefinesPresentationContext](self, "_shouldRespectDefinesPresentationContext");
  }
  return v5;
}

- (BOOL)_mayChildGrabPresentedViewControllerView
{
  return 0;
}

- (void)_windowSceneDidUpdateEffectiveGeometry:(id)a3
{
  void *v4;
  char isKindOfClass;
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
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v6 = v18;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v18, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isViewLoaded") & 1) != 0)
    {
      -[UIPresentationController presentingViewController](self, "presentingViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_window");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "windowScene");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v7)
        -[UIPresentationController _presentingViewControllerWindowSceneDidUpdateEffectiveGeometry:](self, "_presentingViewControllerWindowSceneDidUpdateEffectiveGeometry:", v7);
    }
    else
    {

    }
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isViewLoaded") & 1) != 0)
    {
      -[UIPresentationController presentedViewController](self, "presentedViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_window");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "windowScene");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 == v7)
        -[UIPresentationController _presentedViewControllerWindowSceneDidUpdateEffectiveGeometry:](self, "_presentedViewControllerWindowSceneDidUpdateEffectiveGeometry:", v7);
    }
    else
    {

    }
    v6 = v18;
  }

}

- (id)_currentContextPresentationSuperview
{
  void *v3;
  void *v4;
  void *v5;

  -[UIPresentationController _parentPresentationController](self, "_parentPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "_presentationView");
  else
    -[UIPresentationController _fullscreenPresentationSuperview](self, "_fullscreenPresentationSuperview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_viewToIgnoreLayerTransformForViewFrameInWindowContentOverlayInsetsCalculation
{
  return 0;
}

- (BOOL)_wantsContentOverlayInsetsUpdatesWhileDismissing
{
  return 0;
}

- (BOOL)_ignoresLeftAndRightSafeAreaInsets
{
  return 0;
}

- (void)runTransitionForCurrentStateAnimated:(BOOL)a3 handoffData:(id)a4
{
  _BOOL8 v4;
  int64_t state;
  UIViewController *presentingViewController;
  unint64_t v8;
  NSObject *v9;
  os_signpost_id_t v10;
  os_signpost_id_t v11;
  objc_class *v12;
  const char *Name;
  objc_class *v14;
  const char *v15;
  void *v16;
  void *v17;
  BOOL *p_isDisconnectedRoot;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  char isKindOfClass;
  void *v23;
  BOOL v24;
  _QWORD *v25;
  _UIViewControllerOneToOneTransitionContext *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  objc_class *v30;
  id v31;
  void *v32;
  objc_class *v33;
  const char *v34;
  objc_class *v35;
  const char *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  id WeakRetained;
  void *v44;
  void *v45;
  _BOOL4 v46;
  uint64_t v47;
  void (**v48)(_QWORD);
  void *v49;
  void *v50;
  _UIViewControllerOneToOneTransitionContext *v51;
  id v52;
  UIViewController *v53;
  UIViewController *v54;
  id v55;
  id v56;
  unint64_t v57;
  NSObject *v58;
  NSObject *v59;
  BOOL v60;
  id v61;
  const char *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  UIViewController *v66;
  uint64_t v67;
  UIViewController *v68;
  _QWORD v69[5];
  _UIViewControllerOneToOneTransitionContext *v70;
  id v71;
  UIViewController *v72;
  UIViewController *v73;
  id v74;
  id v75;
  id v76[2];
  BOOL v77;
  BOOL v78;
  BOOL v79;
  _QWORD v80[4];
  _UIViewControllerOneToOneTransitionContext *v81;
  void (**v82)(_QWORD);
  _QWORD aBlock[5];
  UIViewController *v84;
  uint8_t buf[4];
  _BYTE v86[14];
  __int16 v87;
  const char *v88;
  uint64_t v89;

  v4 = a3;
  v89 = *MEMORY[0x1E0C80C00];
  v61 = a4;
  if ((self->_state & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v86 = self;
        _os_log_fault_impl(&dword_185066000, v59, OS_LOG_TYPE_FAULT, "Presentation controller state was changed while the transition was in progress. (%@)", buf, 0xCu);
      }

    }
    else
    {
      v57 = qword_1ECD7D3B8;
      if (!qword_1ECD7D3B8)
      {
        v57 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v57, (unint64_t *)&qword_1ECD7D3B8);
      }
      v58 = *(NSObject **)(v57 + 8);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v86 = self;
        _os_log_impl(&dword_185066000, v58, OS_LOG_TYPE_ERROR, "Presentation controller state was changed while the transition was in progress. (%@)", buf, 0xCu);
      }
    }
  }
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v67 = objc_claimAutoreleasedReturnValue();
  state = self->_state;
  v60 = state == 1;
  if (state == 1)
  {
    v66 = (UIViewController *)(id)v67;
    presentingViewController = self->_presentingViewController;
  }
  else
  {
    v66 = self->_presentingViewController;
    presentingViewController = (UIViewController *)v67;
  }
  v68 = presentingViewController;
  v8 = qword_1ECD7D3C0;
  if (!qword_1ECD7D3C0)
  {
    v8 = __UILogCategoryGetNode("UIPresentationController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&qword_1ECD7D3C0);
  }
  v9 = *(id *)(v8 + 8);
  v10 = os_signpost_id_make_with_pointer(*(os_log_t *)(v8 + 8), self);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = v10;
    if (os_signpost_enabled(v9))
    {
      v12 = (objc_class *)objc_opt_class();
      Name = class_getName(v12);
      v14 = (objc_class *)objc_opt_class();
      v15 = class_getName(v14);
      *(_DWORD *)buf = 67240706;
      *(_DWORD *)v86 = 1;
      *(_WORD *)&v86[4] = 2082;
      *(_QWORD *)&v86[6] = Name;
      v87 = 2082;
      v88 = v15;
      _os_signpost_emit_with_name_impl(&dword_185066000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "ModalTransition", " enableTelemetry=YES  isAnimation=YES custom=%{signpost.telemetry:number1,signpost.description:attribute,public}u, from=%{signpost.telemetry:string1,public}s to=%{signpost.telemetry:string2,public}s", buf, 0x1Cu);
    }
  }

  v65 = objc_opt_class();
  v64 = objc_opt_class();
  if (v65 == v64)
    -[UIViewControllerAnimatedTransitioning setDelegate:](self->_currentTransitionController, "setDelegate:", self);
  -[UIViewController _window](v68, "_window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_delegateViewController");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (state == 1)
  {
    -[UIViewController presentingViewController](self->_presentingViewController, "presentingViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      self->_isDisconnectedRoot = 0;
      p_isDisconnectedRoot = &self->_isDisconnectedRoot;
    }
    else
    {
      -[UIViewController _rootAncestorViewController](self->_presentingViewController, "_rootAncestorViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v63 == v21)
      {
        isKindOfClass = 0;
      }
      else
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
      }
      self->_isDisconnectedRoot = isKindOfClass & 1;
      p_isDisconnectedRoot = &self->_isDisconnectedRoot;

    }
    if (*p_isDisconnectedRoot)
    {
      objc_msgSend((id)v67, "splitViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23 == 0;

      if (v24)
      {
        if (*p_isDisconnectedRoot)
        {
          v25 = v63;
          objc_msgSend(v16, "_addRotationViewController:", v25);
          if (v67)
            objc_storeWeak((id *)(v67 + 128), v25);
          objc_msgSend(v16, "_setDelegateViewController:");
          v25[46] &= ~0x100uLL;

          *(_QWORD *)(v67 + 368) |= 0x100uLL;
        }
      }
      else
      {
        *p_isDisconnectedRoot = 0;
      }
    }
  }
  else if (self->_isDisconnectedRoot)
  {
    v19 = v67;
    if (v63 == (void *)v67)
    {
      -[UIViewController _previousRootViewController]((id *)v67);
      v20 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_removeRotationViewController:", v20);
      objc_msgSend(v16, "_setDelegateViewController:", v20);
      v20[46] |= 0x100uLL;

      v19 = v67;
    }
    if (v19)
    {
      objc_storeWeak((id *)(v19 + 128), 0);
      v19 = v67;
    }
    *(_QWORD *)(v19 + 368) &= ~0x100uLL;
  }
  v26 = objc_alloc_init(_UIViewControllerOneToOneTransitionContext);
  -[_UIViewControllerTransitionContext _setAnimator:](v26, "_setAnimator:", self->_currentTransitionController);
  -[_UIViewControllerTransitionContext _setIsAnimated:](v26, "_setIsAnimated:", v4);
  -[_UIViewControllerOneToOneTransitionContext _setFromViewController:](v26, "_setFromViewController:", v68);
  -[_UIViewControllerOneToOneTransitionContext _setToViewController:](v26, "_setToViewController:", v66);
  -[UIPresentationController _currentInteractionController](self, "_currentInteractionController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIViewControllerTransitionContext _setInteractor:](v26, "_setInteractor:", v27);

  -[_UIViewControllerTransitionContext _setPresentationStyle:](v26, "_setPresentationStyle:", -[UIPresentationController presentationStyle](self, "presentationStyle"));
  -[_UIViewControllerOneToOneTransitionContext _setIsDeferred:](v26, "_setIsDeferred:", objc_msgSend((id)objc_opt_class(), "_shouldDeferTransitions"));
  -[UIPresentationController _currentInteractionController](self, "_currentInteractionController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28 != 0;

  v30 = (objc_class *)objc_opt_class();
  v62 = class_getName(v30);
  if (!-[UIPresentationController _shouldDisableInteractionDuringTransitions](self, "_shouldDisableInteractionDuringTransitions")|| v29)
  {
    v31 = 0;
  }
  else
  {
    objc_msgSend(v16, "windowScene");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_windowSceneIgnoringEvents, v32);

    v33 = (objc_class *)objc_opt_class();
    v34 = class_getName(v33);
    v35 = (objc_class *)objc_opt_class();
    v36 = class_getName(v35);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%s: %p> beginning transition for presentation"), v62, self);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("from: <%s: %p>; to: <%s: %p>"), v34, v68, v36, v66);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)MEMORY[0x1E0CB3940];
    v40 = objc_retainAutorelease(v37);
    v41 = objc_msgSend(v40, "UTF8String");
    v31 = objc_retainAutorelease(v38);
    objc_msgSend(v39, "stringWithFormat:", CFSTR("%s %s"), v41, objc_msgSend(v31, "UTF8String"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneIgnoringEvents);
    objc_msgSend(WeakRetained, "_beginIgnoringInteractionEventsForReason:", v42);

  }
  objc_msgSend(v16, "beginDisablingInterfaceAutorotation");
  objc_msgSend(v16, "windowScene");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextEffectsWindow activeTextEffectsWindowForWindowScene:](UITextEffectsWindow, "activeTextEffectsWindowForWindowScene:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v45, "beginDisablingInterfaceAutorotation");
  objc_initWeak((id *)buf, v45);
  -[UIPresentationController _willRunTransitionForCurrentStateDeferred:](self, "_willRunTransitionForCurrentStateDeferred:", -[_UIViewControllerOneToOneTransitionContext _isDeferred](v26, "_isDeferred"));
  v46 = -[UIPresentationController dismissing](self, "dismissing");
  v47 = MEMORY[0x1E0C809B0];
  if (v46 && -[UIPresentationController _shouldRestoreFirstResponder](self, "_shouldRestoreFirstResponder"))
  {
    aBlock[0] = v47;
    aBlock[1] = 3221225472;
    aBlock[2] = __77__UIPresentationController_runTransitionForCurrentStateAnimated_handoffData___block_invoke;
    aBlock[3] = &unk_1E16B1B50;
    aBlock[4] = self;
    v84 = v68;
    v48 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (-[_UIViewControllerTransitionContext isInteractive](v26, "isInteractive"))
    {
      -[_UIViewControllerTransitionContext _transitionCoordinator](v26, "_transitionCoordinator");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v80[0] = v47;
      v80[1] = 3221225472;
      v80[2] = __77__UIPresentationController_runTransitionForCurrentStateAnimated_handoffData___block_invoke_2;
      v80[3] = &unk_1E16BF798;
      v81 = v26;
      v82 = v48;
      objc_msgSend(v49, "notifyWhenInteractionChangesUsingBlock:", v80);

    }
    else
    {
      v48[2](v48);
    }

  }
  v50 = (void *)objc_opt_class();
  v69[0] = v47;
  v69[1] = 3221225472;
  v69[2] = __77__UIPresentationController_runTransitionForCurrentStateAnimated_handoffData___block_invoke_3;
  v69[3] = &unk_1E16BFA68;
  v69[4] = self;
  v51 = v26;
  v70 = v51;
  v52 = v16;
  v71 = v52;
  v53 = v68;
  v72 = v53;
  v54 = v66;
  v77 = v65 != v64;
  v78 = v29;
  v73 = v54;
  v76[1] = (id)v62;
  v55 = v31;
  v74 = v55;
  objc_copyWeak(v76, (id *)buf);
  v79 = v60;
  v56 = v61;
  v75 = v56;
  objc_msgSend(v50, "_scheduleTransition:", v69);

  objc_destroyWeak(v76);
  objc_destroyWeak((id *)buf);

}

void __77__UIPresentationController_runTransitionForCurrentStateAnimated_handoffData___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_restoreInputViewsForPresentation");

  objc_msgSend(*(id *)(a1 + 40), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEditing:", 1);

}

uint64_t __77__UIPresentationController_runTransitionForCurrentStateAnimated_handoffData___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled");
  if ((result & 1) == 0)
    return objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", *(_QWORD *)(a1 + 40));
  return result;
}

void __77__UIPresentationController_runTransitionForCurrentStateAnimated_handoffData___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  int has_internal_diagnostics;
  void *v10;
  void (**v11)(void);
  void *v12;
  void *v13;
  void (**v14)(void);
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(void);
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  int v44;
  double *v45;
  int v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  id v52;
  void *v53;
  _BOOL4 v54;
  id v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  double (**v62)(void);
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  int v71;
  void *v72;
  void *v73;
  int v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  _UIViewControllerTransitionRequest *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  _UIViewControllerTransitionRequest *v84;
  uint64_t v85;
  void *v86;
  BOOL v87;
  void *v88;
  char v89;
  void *v90;
  char isKindOfClass;
  void *v92;
  NSObject *v93;
  unint64_t v94;
  NSObject *v95;
  uint64_t v96;
  NSObject *v97;
  NSObject *v98;
  unint64_t v99;
  NSObject *v100;
  unint64_t v101;
  NSObject *v102;
  uint64_t v103;
  id v104;
  void *v105;
  id v106;
  void *v107;
  void *v108;
  _QWORD v109[5];
  id v110;
  id v111;
  id v112;
  id v113;
  id v114[2];
  char v115;
  uint8_t buf[4];
  uint64_t v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_transitionViewForCurrentTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    NSLog(CFSTR("Null transitionViewForCurrentTransition block, aborting _scheduleTransition:"));
    return;
  }
  v105 = (void *)_UISetCurrentFallbackEnvironment(*(void **)(a1 + 32));
  v4 = objc_msgSend(*(id *)(a1 + 32), "presenting");
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeDidChangeForChildContentContainer:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_parentPresentationController");
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v6 = v7;
    if (v7 && !v7[5])
    {
      objc_msgSend(v7, "presentedViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredContentSizeDidChangeForChildContentContainer:", v8);

    }
  }

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  objc_msgSend(*(id *)(a1 + 32), "_transitionViewForCurrentTransition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (has_internal_diagnostics)
  {
    if (!v10)
    {
      __UIFaultDebugAssertLog();
      v93 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_FAULT))
      {
        v103 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v117 = v103;
        _os_log_fault_impl(&dword_185066000, v93, OS_LOG_TYPE_FAULT, "transitionViewForCurrentTransition is not set, presentation controller was dismissed during the presentation? (%@)", buf, 0xCu);
      }

    }
  }
  else if (!v10)
  {
    v94 = qword_1ECD7D3C8;
    if (!qword_1ECD7D3C8)
    {
      v94 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v94, (unint64_t *)&qword_1ECD7D3C8);
    }
    v95 = *(NSObject **)(v94 + 8);
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
    {
      v96 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v117 = v96;
      _os_log_impl(&dword_185066000, v95, OS_LOG_TYPE_ERROR, "transitionViewForCurrentTransition is not set, presentation controller was dismissed during the presentation? (%@)", buf, 0xCu);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_transitionViewForCurrentTransition");
  v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v11[2]();
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_fromViewForCurrentTransition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_fromViewForCurrentTransition");
    v14 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v14[2]();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setFromView:", v15);

  }
  objc_msgSend(*(id *)(a1 + 32), "_toViewForCurrentTransition");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_toViewForCurrentTransition");
    v18 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v18[2]();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_setToView:", v19);

  }
  objc_msgSend(*(id *)(a1 + 48), "windowScene");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "keyboardSceneDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    +[_UIViewControllerKeyboardAnimationStyle animationStyleWithContext:useCustomTransition:](_UIViewControllerKeyboardAnimationStyle, "animationStyleWithContext:useCustomTransition:", *(_QWORD *)(a1 + 40), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pushAnimationStyle:", v21);
  }
  else
  {
    v21 = 0;
  }
  if (dyld_program_sdk_at_least())
    v22 = objc_msgSend(*(id *)(a1 + 40), "isAnimated");
  else
    v22 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  v23 = v22;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldCallAppearanceCallbacksFor:", *(_QWORD *)(a1 + 56)))
    objc_msgSend(*(id *)(a1 + 56), "beginAppearanceTransition:animated:", 0, v23);
  objc_msgSend(*(id *)(a1 + 64), "_popoverController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(*(id *)(a1 + 64), "_popoverController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "_isDismissing");

  }
  else
  {
    v26 = 0;
  }

  objc_msgSend(*(id *)(a1 + 64), "setAppearanceTransitionsAreDisabled:", v26);
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldCallAppearanceCallbacksFor:", *(_QWORD *)(a1 + 64)))
  {
    objc_msgSend(v108, "window");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "_setExpectedWindow:", v27);
    objc_msgSend(*(id *)(a1 + 64), "beginAppearanceTransition:animated:", 1, v23);
    objc_msgSend(*(id *)(a1 + 64), "_setExpectedWindow:", 0);

  }
  if (!*(_BYTE *)(a1 + 104))
    objc_msgSend(*(id *)(a1 + 40), "_setCompletionCurve:", 7);
  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = _UISheetPresentationControllerStylesSheetsAsCards(v28);

  if (v29)
  {
    objc_msgSend(*(id *)(a1 + 32), "frameOfPresentedViewInContainerView");
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "frame");
    v31 = v39;
    v33 = v40;
    v35 = v41;
    v37 = v42;

  }
  objc_msgSend(*(id *)(a1 + 40), "_setContainerView:", v108);
  objc_msgSend(*(id *)(a1 + 40), "_setFromStartFrame:", v31, v33, v35, v37);
  v43 = *(void **)(a1 + 40);
  v44 = objc_msgSend(*(id *)(a1 + 32), "_shouldGrabPresentersView");
  v45 = (double *)MEMORY[0x1E0C9D648];
  if (v44 && objc_msgSend(*(id *)(a1 + 32), "presenting"))
  {
    v46 = 0;
    v47 = *v45;
    v48 = v45[1];
    v49 = v45[2];
    v50 = v45[3];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "view");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "frame");
    v46 = 1;
  }
  objc_msgSend(v43, "_setFromEndFrame:", v47, v48, v49, v50);
  if (v46)

  v109[0] = MEMORY[0x1E0C809B0];
  v109[1] = 3221225472;
  v109[2] = __77__UIPresentationController_runTransitionForCurrentStateAnimated_handoffData___block_invoke_89;
  v109[3] = &unk_1E16BFA20;
  v51 = *(void **)(a1 + 40);
  v109[4] = *(_QWORD *)(a1 + 32);
  v106 = v21;
  v110 = v106;
  v52 = v20;
  v115 = *(_BYTE *)(a1 + 105);
  v53 = *(void **)(a1 + 96);
  v104 = v52;
  v111 = v52;
  v114[1] = v53;
  v112 = *(id *)(a1 + 72);
  v113 = *(id *)(a1 + 48);
  objc_copyWeak(v114, (id *)(a1 + 88));
  objc_msgSend(v51, "_setCompletionHandler:", v109);
  if (+[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators](UIViewPropertyAnimator, "_canEnableTrackingAnimationsWithAnimators"))
  {
    v54 = +[UIViewPropertyAnimator _trackingAnimationsCurrentlyEnabled](UIViewPropertyAnimator, "_trackingAnimationsCurrentlyEnabled");
    if (!v54)
      v55 = +[UIViewPropertyAnimator _startTrackingAnimations](UIViewPropertyAnimator, "_startTrackingAnimations");
    +[UIViewPropertyAnimator _currentTrackedAnimationsUUID](UIViewPropertyAnimator, "_currentTrackedAnimationsUUID");
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = !v54;
    v58 = *(_QWORD *)(a1 + 32);
    v59 = *(void **)(v58 + 56);
    *(_QWORD *)(v58 + 56) = v56;
  }
  else
  {
    +[UIView _startAnimationTracking](UIView, "_startAnimationTracking");
    v60 = objc_claimAutoreleasedReturnValue();
    v61 = *(_QWORD *)(a1 + 32);
    v59 = *(void **)(v61 + 56);
    *(_QWORD *)(v61 + 56) = v60;
    v57 = 1;
  }

  objc_msgSend(*(id *)(a1 + 32), "_computeToEndFrameForCurrentTransition");
  v62 = (double (**)(void))objc_claimAutoreleasedReturnValue();
  v63 = v62[2]();
  v65 = v64;
  v67 = v66;
  v69 = v68;

  objc_msgSend(*(id *)(a1 + 40), "_setToEndFrame:", v63, v65, v67, v69);
  objc_msgSend(*(id *)(a1 + 40), "_setToStartFrame:", *v45, v45[1], v45[2], v45[3]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "transitionDuration:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "_setDuration:");
  if (*(_BYTE *)(a1 + 104))
    objc_msgSend(*(id *)(a1 + 32), "transitionDidStart");
  v70 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  v71 = *(unsigned __int8 *)(a1 + 106);
  objc_msgSend(*(id *)(a1 + 40), "_transitionCoordinator");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "runAlongsidePresentation:transitionCoordinator:", v71 != 0, v72);

  v73 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  v74 = *(unsigned __int8 *)(a1 + 106);
  objc_msgSend(*(id *)(a1 + 40), "_transitionCoordinator");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "fromViewController");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "_window");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "toViewController");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "_window");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "runAlongsidePresentation:transitionCoordinator:fromViewControllerWindow:toViewControllerWindow:", v74 != 0, v75, v77, v79);

  v80 = [_UIViewControllerTransitionRequest alloc];
  v81 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_currentTransitionController");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_currentInteractionController");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = -[_UIViewControllerTransitionRequest initWithTransitionContext:animator:interactor:interactiveUpdateHandler:keyboardShouldAnimateAlongsideForInteractiveTransitions:keyboardAnimationStyle:pinningInputViewsResponder:extraPinningInputViewsBlock:handoffData:](v80, "initWithTransitionContext:animator:interactor:interactiveUpdateHandler:keyboardShouldAnimateAlongsideForInteractiveTransitions:keyboardAnimationStyle:pinningInputViewsResponder:extraPinningInputViewsBlock:handoffData:", v81, v82, v83, &__block_literal_global_123, objc_msgSend(*(id *)(a1 + 32), "_keyboardShouldAnimateAlongsideForInteractiveTransitions"), v106, *(_QWORD *)(a1 + 64), 0, *(_QWORD *)(a1 + 80));

  _UIViewControllerTransitioningRunCustomTransitionWithRequest(v84);
  if (v57)
  {
    if (+[UIViewPropertyAnimator _trackingAnimationsCurrentlyEnabled](UIViewPropertyAnimator, "_trackingAnimationsCurrentlyEnabled"))
    {
      +[UIViewPropertyAnimator _finishTrackingAnimations](UIViewPropertyAnimator, "_finishTrackingAnimations");
    }
    else
    {
      +[UIView _finishAnimationTracking](UIView, "_finishAnimationTracking");
    }
  }
  v85 = objc_msgSend(*(id *)(a1 + 40), "_state");
  objc_msgSend(*(id *)(a1 + 40), "_animator");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v86 == 0;

  if (!v87)
    objc_msgSend(*(id *)(a1 + 40), "_setTransitionIsInFlight:", 1);
  if (v85 == 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_interactor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_variant_has_internal_diagnostics())
    {
      if (!v88)
      {
        __UIFaultDebugAssertLog();
        v98 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v98, OS_LOG_TYPE_FAULT, "Got a deferred interactive finish when we don't have an interactor", buf, 2u);
        }

      }
    }
    else if (!v88)
    {
      v101 = qword_1ECD7D3D8;
      if (!qword_1ECD7D3D8)
      {
        v101 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v101, (unint64_t *)&qword_1ECD7D3D8);
      }
      v102 = *(NSObject **)(v101 + 8);
      if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v102, OS_LOG_TYPE_ERROR, "Got a deferred interactive finish when we don't have an interactor", buf, 2u);
      }
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v92 = v88;
    if ((isKindOfClass & 1) == 0)
      v92 = *(void **)(a1 + 40);
    objc_msgSend(v92, "finishInteractiveTransition");
    goto LABEL_63;
  }
  if (v85 == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_interactor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_variant_has_internal_diagnostics())
    {
      if (!v88)
      {
        __UIFaultDebugAssertLog();
        v97 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v97, OS_LOG_TYPE_FAULT, "Got a deferred interactive cancellation when we don't have an interactor", buf, 2u);
        }

      }
    }
    else if (!v88)
    {
      v99 = qword_1ECD7D3D0;
      if (!qword_1ECD7D3D0)
      {
        v99 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v99, (unint64_t *)&qword_1ECD7D3D0);
      }
      v100 = *(NSObject **)(v99 + 8);
      if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v100, OS_LOG_TYPE_ERROR, "Got a deferred interactive cancellation when we don't have an interactor", buf, 2u);
      }
    }
    objc_opt_class();
    v89 = objc_opt_isKindOfClass();
    v90 = v88;
    if ((v89 & 1) == 0)
      v90 = *(void **)(a1 + 40);
    objc_msgSend(v90, "cancelInteractiveTransition");
LABEL_63:

  }
  _UIRestorePreviousFallbackEnvironment(v105);

  objc_destroyWeak(v114);
}

void __77__UIPresentationController_runTransitionForCurrentStateAnimated_handoffData___block_invoke_89(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void (**v16)(void);
  id v17;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setIsCurrentStateCancelled:", a3 ^ 1);
  objc_msgSend(*(id *)(a1 + 40), "setContext:", 0);
  objc_msgSend(*(id *)(a1 + 48), "popAnimationStyle");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  if (WeakRetained && objc_msgSend(*(id *)(a1 + 32), "_shouldDisableInteractionDuringTransitions"))
  {
    v7 = *(unsigned __int8 *)(a1 + 88);

    if (v7)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%s: %p> completing transition for presentation"), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    WeakRetained = objc_retainAutorelease(v8);
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%s %s"), objc_msgSend(WeakRetained, "UTF8String"), objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 56)), "UTF8String"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
    objc_msgSend(v11, "_endIgnoringInteractionEventsForReason:", v10);

    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 80), 0);
  }

LABEL_6:
  v12 = objc_msgSend(*(id *)(a1 + 32), "_shouldAnimateReenablingOfAutorotation");
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(*(id *)(a1 + 64), "endDisablingInterfaceAutorotationAnimated:", v12);
    v13 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v13, "endDisablingInterfaceAutorotationAnimated:", v12);

    objc_msgSend(*(id *)(a1 + 32), "transitionDidFinish:", a3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "transitionDidFinish:", a3);
    objc_msgSend(*(id *)(a1 + 64), "endDisablingInterfaceAutorotationAnimated:", v12);
    v14 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v14, "endDisablingInterfaceAutorotationAnimated:", v12);

  }
  v17 = v5;
  objc_msgSend(v17, "_postInteractiveCompletionHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v17, "_postInteractiveCompletionHandler");
    v16 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v16[2]();

    objc_msgSend(v17, "_setPostInteractiveCompletionHandler:", 0);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "animationEnded:", a3);
  objc_msgSend(v17, "_setTransitionIsInFlight:", 0);
  objc_msgSend(v17, "_setInteractor:", 0);
  objc_msgSend(v17, "_setAnimator:", 0);

}

- (BOOL)_shouldCallAppearanceCallbacksFor:(id)a3
{
  id v4;
  id v5;
  id v6;
  BOOL v7;
  BOOL v8;

  v4 = a3;
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v8 = -[UIPresentationController _shouldDisableAppearanceCallbacksForPresentedViewController](self, "_shouldDisableAppearanceCallbacksForPresentedViewController");
LABEL_6:
    v7 = !v8;
    goto LABEL_7;
  }
  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v8 = -[UIPresentationController _shouldDisablePresentersAppearanceCallbacks](self, "_shouldDisablePresentersAppearanceCallbacks");
    goto LABEL_6;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

- (void)completeCurrentTransitionImmediately
{
  _BOOL4 v3;
  NSUUID *currentRunningAnimationsUUID;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  if (-[UIPresentationController presenting](self, "presenting")
    || -[UIPresentationController dismissing](self, "dismissing"))
  {
    v3 = +[UIViewPropertyAnimator _containsAnimatorForTrackedAnimationsUUID:](UIViewPropertyAnimator, "_containsAnimatorForTrackedAnimationsUUID:", self->_currentRunningAnimationsUUID);
    currentRunningAnimationsUUID = self->_currentRunningAnimationsUUID;
    if (v3)
    {
      +[UIViewPropertyAnimator _animatorForTrackedAnimationsUUID:](UIViewPropertyAnimator, "_animatorForTrackedAnimationsUUID:", currentRunningAnimationsUUID);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stopAnimation:", 0);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __64__UIPresentationController_completeCurrentTransitionImmediately__block_invoke;
      v7[3] = &unk_1E16B1B28;
      v8 = v5;
      v6 = v5;
      +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v7);

    }
    else
    {
      +[UIView _stopAnimationWithUUID:](UIView, "_stopAnimationWithUUID:", currentRunningAnimationsUUID);
      +[UIView _finalizeStoppedAnimationWithUUID:reverseAnimation:state:performCompletionsImmediately:](UIView, "_finalizeStoppedAnimationWithUUID:reverseAnimation:state:performCompletionsImmediately:", self->_currentRunningAnimationsUUID, 0, 0, 1);
    }
  }
}

uint64_t __64__UIPresentationController_completeCurrentTransitionImmediately__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishAnimationAtPosition:", 0);
}

- (id)_descriptionForPrintingViewControllerHierarchy
{
  void *v2;
  void *v3;
  UIPresentationController *v4;
  objc_class *v5;
  void *v6;
  __CFString *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0CB37A0];
  if (self)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = self;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>"), v6, v4);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("(nil)");
  }
  objc_msgSend(v2, "stringWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_shouldOccludeDuringPresentation
{
  return 0;
}

- (id)_passthroughViews
{
  return 0;
}

- (void)_coverWithSnapshot
{
  void *v3;
  UIView *v4;
  UIView *snapshotOverlayView;
  id v6;

  -[UIPresentationController _presentationView](self, "_presentationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshotViewAfterScreenUpdates:", 0);
  v4 = (UIView *)objc_claimAutoreleasedReturnValue();
  snapshotOverlayView = self->_snapshotOverlayView;
  self->_snapshotOverlayView = v4;

  -[UIPresentationController _presentationView](self, "_presentationView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_snapshotOverlayView);

}

- (CGRect)_frameForTransitionViewInPresentationSuperview:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UIPresentationController _frameForTransitionViewInPresentationSuperview:inWindow:](self, "_frameForTransitionViewInPresentationSuperview:inWindow:", a3, 0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_initViewHierarchyForPresentationSuperview:(id)a3
{
  -[UIPresentationController _initViewHierarchyForPresentationSuperview:inWindow:](self, "_initViewHierarchyForPresentationSuperview:inWindow:", a3, 0);
}

uint64_t __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "bounds");
  objc_msgSend(v2, "convertRect:toView:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:");
}

- (BOOL)_containerViewShouldIgnoreDirectTouchEvents
{
  void *v3;
  void *v4;
  int v5;

  -[UIPresentationController _transitionContext](self, "_transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_animator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v4, "prefersPreemptionEnabledForPresentations")
    && -[UIPresentationController dismissing](self, "dismissing")
    && (objc_msgSend(v3, "isInteractive") & 1) == 0)
  {
    v5 = objc_msgSend(v3, "transitionWasCancelled") ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_transitionToDidEnd
{
  -[UIPresentationController presentationTransitionDidEnd:](self, "presentationTransitionDidEnd:", 1);
}

- (void)_transitionFromDidEnd
{
  -[UIPresentationController dismissalTransitionDidEnd:](self, "dismissalTransitionDidEnd:", 1);
}

- (CGRect)frameOfPresentedViewInContainerView
{
  void *v2;
  double v3;
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
  CGRect result;

  -[UIPresentationController containerView](self, "containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)_frameOfPresentedViewControllerViewInSuperview
{
  void *v2;
  double v3;
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
  CGRect result;

  -[UIPresentationController _presentationView](self, "_presentationView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (UIView)presentedView
{
  void *v2;
  void *v3;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (id)_preferredAnimationControllerForDismissal
{
  void *v2;
  void *v3;

  -[UIPresentationController _visualStyle](self, "_visualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredAnimationControllerForPresentation:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_preferredInteractionControllerForPresentation:(id)a3
{
  return 0;
}

- (id)_preferredInteractionControllerForDismissal:(id)a3
{
  return 0;
}

- (UIModalPresentationStyle)presentationStyle
{
  void *v2;
  void *v3;
  UIModalPresentationStyle v4;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "modalPresentationStyle");
  else
    v4 = UIModalPresentationNone;

  return v4;
}

- (UIModalPresentationStyle)adaptivePresentationStyle
{
  void *v3;
  UIModalPresentationStyle v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[UIPresentationController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ((v4 = objc_msgSend(v3, "adaptivePresentationStyleForPresentationController:", self),
         (unint64_t)(v4 + 1) <= 6)
      ? (v5 = ((1 << (v4 + 1)) & 0x43) == 0)
      : (v5 = 1),
        v5))
  {
    -[UIPresentationController traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "traitCollectionByModifyingTraits:", &__block_literal_global_125);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = -[UIPresentationController _defaultPresentationStyleForTraitCollection:](self, "_defaultPresentationStyleForTraitCollection:", v7);
  }

  return v4;
}

void __53__UIPresentationController_adaptivePresentationStyle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setHorizontalSizeClass:", 1);
  objc_msgSend(v2, "setVerticalSizeClass:", 2);

}

- (BOOL)_shouldAdaptFromTraitCollection:(id)a3 toTraitCollection:(id)a4
{
  id v6;
  id v7;
  UIModalPresentationStyle v8;
  BOOL v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (dyld_program_sdk_at_least())
  {
    v8 = -[UIPresentationController adaptivePresentationStyleForTraitCollection:](self, "adaptivePresentationStyleForTraitCollection:", v7);
    if ((((v8 != UIModalPresentationNone) ^ -[UIPresentationController _isAdapted](self, "_isAdapted")) & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      -[UIPresentationController _activePresentationController](self, "_activePresentationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8 != objc_msgSend(v11, "presentationStyle");

    }
  }
  else
  {
    v10 = objc_msgSend(v6, "horizontalSizeClass");
    v9 = v10 != objc_msgSend(v7, "horizontalSizeClass");
  }

  return v9;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  uint64_t v7;
  _QWORD *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v19;
  CGAffineTransform v20;

  height = a3.height;
  width = a3.width;
  v19 = a4;
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (_QWORD *)v7;
  if ((*(_QWORD *)(v7 + 368) & 0x40000000000000) != 0)
  {
    objc_msgSend((id)v7, "_existingView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v9 = v12;
    v10 = v13;

  }
  else
  {
    v9 = *(double *)(v7 + 432);
    v10 = *(double *)(v7 + 440);
  }
  -[UIPresentationController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", v8, width, height);
  v16 = v15;
  v17 = v14;
  if (v9 != v15 || v10 != v14)
    goto LABEL_13;
  if (v19)
    objc_msgSend(v19, "targetTransform");
  else
    memset(&v20, 0, sizeof(v20));
  if (!CGAffineTransformIsIdentity(&v20))
  {
LABEL_13:
    objc_msgSend(v8, "viewWillTransitionToSize:withTransitionCoordinator:", v19, v16, v17);
    *((double *)v8 + 54) = v16;
    *((double *)v8 + 55) = v17;
  }

}

- (void)_setPreferredContentSize:(CGSize)a3
{
  void *v5;
  BOOL v6;
  void *v7;

  if (self->_preferredContentSize.width != a3.width || self->_preferredContentSize.height != a3.height)
  {
    self->_preferredContentSize = a3;
    -[UIPresentationController _parentPresentationController](self, "_parentPresentationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v7 = v5;
      v6 = -[UIPresentationController shouldPresentInFullscreen](self, "shouldPresentInFullscreen");
      v5 = v7;
      if (!v6)
      {
        objc_msgSend(v7, "preferredContentSizeDidChangeForChildContentContainer:", self);
        v5 = v7;
      }
    }

  }
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  -[UIPresentationController presentedContentContainer](self, "presentedContentContainer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSize");
  v6 = v5;
  v8 = v7;

  if (!-[UIPresentationController shouldRemovePresentersView](self, "shouldRemovePresentersView"))
  {
    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferredContentSize");
    v11 = v10;
    v13 = v12;

    if (v11 == *MEMORY[0x1E0C9D820] && v13 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      -[UIPresentationController presentingViewController](self, "presentingViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bounds");
      v18 = v17;
      v20 = v19;

      -[UIPresentationController _additionalSafeAreaInsets](self, "_additionalSafeAreaInsets");
      v13 = v20 - (v22 + v21);
      v11 = v18 - (v23 + v24);
    }
    if (v6 < v11)
      v6 = v11;
    if (v8 < v13)
      v8 = v13;
  }
  -[UIPresentationController _setPreferredContentSize:](self, "_setPreferredContentSize:", v6, v8);
}

- (id)presentedContentContainer
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[UIPresentationController _childPresentationController](self, "_childPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (CGSize)preferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredContentSize.width;
  height = self->_preferredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)_monitorsSystemLayoutFittingSize
{
  return self->_monitorsSystemLayoutFittingSize;
}

- (_UIFormSheetPresentationController)_adaptiveFormSheetPresentationController
{
  return 0;
}

- (id)_presentedViewControllerForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(WeakRetained, "presentationController:viewControllerForAdaptivePresentationStyle:", self, objc_msgSend(v5, "presentationStyle")), (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_traitTrace:(id)a3
{
  return _UITraitTraceForTraitEnvironmentAndQueryString(self, a3);
}

- (id)_traitTrace
{
  return -[UIPresentationController _traitTrace:](self, "_traitTrace:", 0);
}

- (void)_collectExistingTraitCollectionsForTraitTracking:(id)a3
{
  if (self->_lastNotifiedTraitCollection)
    (*((void (**)(id))a3 + 2))(a3);
}

- (id)_compatibleParentTraitEnvironment
{
  void *v3;
  void *v4;

  if (-[UIPresentationController shouldPresentInFullscreen](self, "shouldPresentInFullscreen"))
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)traitOverrides
{
  _UITraitOverrides *traitOverrides;
  _UITraitOverrides *v4;
  _UITraitOverrides *v5;

  traitOverrides = self->_traitOverrides;
  if (!traitOverrides)
  {
    v4 = (_UITraitOverrides *)-[_UITraitOverrides initWithDelegate:]([_UITraitOverrides alloc], self);
    v5 = self->_traitOverrides;
    self->_traitOverrides = v4;

    traitOverrides = self->_traitOverrides;
  }
  return traitOverrides;
}

- (void)_recordTraitUsage:(unint64_t)a3 insideMethod:(const char *)a4 withInvalidationAction:
{
  _UITraitChangeRegistry *v8;
  void *v9;

  if (a1)
  {
    if (!a1[4])
    {
      if (_UITraitTokenSetCount(a2))
      {
        v8 = objc_alloc_init(_UITraitChangeRegistry);
        v9 = (void *)a1[4];
        a1[4] = (uint64_t)v8;

      }
    }
    -[_UITraitChangeRegistry recordTraitUsage:forTraitEnvironment:insideMethod:withInvalidationAction:](a1[4], a2, a1, a3, a4);
  }
}

- (void)_invalidateContainerViewLayout
{
  -[UIView setNeedsLayout](self->_containerView, "setNeedsLayout");
}

- (id)registerForTraitChanges:(id)a3 withHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[UITraitCollection _traitTokensIncludingPlaceholdersForTraits:]((uint64_t)UITraitCollection, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController _registerForTraitTokenChanges:withHandler:](self, "_registerForTraitTokenChanges:withHandler:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)registerForTraitChanges:(id)a3 withTarget:(id)a4 action:(SEL)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  +[UITraitCollection _traitTokensIncludingPlaceholdersForTraits:]((uint64_t)UITraitCollection, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController _registerForTraitTokenChanges:withTarget:action:](self, "_registerForTraitTokenChanges:withTarget:action:", v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)registerForTraitChanges:(id)a3 withAction:(SEL)a4
{
  void *v6;
  void *v7;

  +[UITraitCollection _traitTokensIncludingPlaceholdersForTraits:]((uint64_t)UITraitCollection, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController _registerForTraitTokenChanges:withTarget:action:](self, "_registerForTraitTokenChanges:withTarget:action:", v6, self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_registerForTraitTokenChanges:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  _UITraitChangeRegistry *traitChangeRegistry;
  _UITraitChangeRegistry *v9;
  _UITraitChangeRegistry *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  traitChangeRegistry = self->_traitChangeRegistry;
  if (!traitChangeRegistry)
  {
    v9 = objc_alloc_init(_UITraitChangeRegistry);
    v10 = self->_traitChangeRegistry;
    self->_traitChangeRegistry = v9;

    traitChangeRegistry = self->_traitChangeRegistry;
  }
  -[_UITraitChangeRegistry registerForTraitTokenChanges:withHandler:]((uint64_t)traitChangeRegistry, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_registerForTraitTokenChanges:(id)a3 withTarget:(id)a4 action:(SEL)a5
{
  id v8;
  UIPresentationController *v9;
  _UITraitChangeRegistry *traitChangeRegistry;
  _UITraitChangeRegistry *v11;
  _UITraitChangeRegistry *v12;
  void *v13;

  v8 = a3;
  v9 = (UIPresentationController *)a4;
  traitChangeRegistry = self->_traitChangeRegistry;
  if (!traitChangeRegistry)
  {
    v11 = objc_alloc_init(_UITraitChangeRegistry);
    v12 = self->_traitChangeRegistry;
    self->_traitChangeRegistry = v11;

    traitChangeRegistry = self->_traitChangeRegistry;
  }
  -[_UITraitChangeRegistry registerForTraitTokenChanges:withTarget:action:targetIsSender:]((uint64_t)traitChangeRegistry, v8, v9, a5, v9 == self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)unregisterForTraitChanges:(id)a3
{
  -[_UITraitChangeRegistry unregisterForTraitChanges:]((uint64_t)self->_traitChangeRegistry, a3);
}

- (void)_registerAuxiliaryChildEnvironmentForTraitInvalidations:(id)a3
{
  id v4;
  _UITraitChangeRegistry *traitChangeRegistry;
  _UITraitChangeRegistry *v6;
  _UITraitChangeRegistry *v7;
  id v8;

  v4 = a3;
  traitChangeRegistry = self->_traitChangeRegistry;
  v8 = v4;
  if (!traitChangeRegistry)
  {
    v6 = objc_alloc_init(_UITraitChangeRegistry);
    v7 = self->_traitChangeRegistry;
    self->_traitChangeRegistry = v6;

    v4 = v8;
    traitChangeRegistry = self->_traitChangeRegistry;
  }
  -[_UITraitChangeRegistry registerAuxiliaryChildEnvironmentForTraitInvalidations:]((uint64_t)traitChangeRegistry, v4);

}

- (void)_unregisterAuxiliaryChildEnvironmentForTraitInvalidations:(id)a3
{
  -[_UITraitChangeRegistry unregisterAuxiliaryChildEnvironmentForTraitInvalidations:]((uint64_t)self->_traitChangeRegistry, a3);
}

- (void)_updateAuxiliaryChildTraitEnvironmentsIfNeeded
{
  -[_UITraitChangeRegistry updateAuxiliaryChildrenTraitsIfNeeded]((uint64_t)self->_traitChangeRegistry);
}

- (void)_compatibleUpdateTraitsIfNecessary
{
  void *v3;
  UIPresentationController *v4;
  UIPresentationController *v5;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v5 = (UIPresentationController *)objc_claimAutoreleasedReturnValue();
  if (v5 && dyld_program_sdk_at_least())
  {
    -[UIPresentationController _presentedViewForOverrideTraits](self, "_presentedViewForOverrideTraits");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView _invalidateTraitCollectionAsRoot]((uint64_t)v3);

    v4 = v5;
  }
  else
  {
    v4 = self;
  }
  -[UIPresentationController _updateTraitsIfNecessary](v4, "_updateTraitsIfNecessary");

}

- (void)setOverrideTraitCollection:(UITraitCollection *)overrideTraitCollection
{
  UITraitCollection *v4;
  _UITraitOverrides *traitOverrides;
  _UITraitOverrides *v6;
  _UITraitOverrides *v7;
  UITraitCollection *v8;

  v4 = overrideTraitCollection;
  traitOverrides = self->_traitOverrides;
  v8 = v4;
  if (v4)
  {
    if (!traitOverrides)
    {
      v6 = (_UITraitOverrides *)-[_UITraitOverrides initWithDelegate:]([_UITraitOverrides alloc], self);
      v7 = self->_traitOverrides;
      self->_traitOverrides = v6;

      traitOverrides = self->_traitOverrides;
    }
    goto LABEL_5;
  }
  if (traitOverrides)
  {
LABEL_5:
    -[_UITraitOverrides _replaceOverrideTraitCollection:]((uint64_t)traitOverrides, v8);
    v4 = v8;
  }

}

- (UITraitCollection)overrideTraitCollection
{
  return (UITraitCollection *)-[UIBarButtonItemGroup _items]((id *)&self->_traitOverrides->super.isa);
}

- (void)_setInternalOverrideTraitCollection:(id)a3
{
  id v4;
  _UITraitOverrides *traitOverrides;
  _UITraitOverrides *v6;
  _UITraitOverrides *v7;
  void *v8;
  id v9;

  v4 = a3;
  traitOverrides = self->_traitOverrides;
  v9 = v4;
  if (v4)
  {
    if (!traitOverrides)
    {
      v6 = (_UITraitOverrides *)-[_UITraitOverrides initWithDelegate:]([_UITraitOverrides alloc], self);
      v7 = self->_traitOverrides;
      self->_traitOverrides = v6;

      traitOverrides = self->_traitOverrides;
    }
    goto LABEL_5;
  }
  if (traitOverrides)
  {
LABEL_5:
    -[_UITraitOverrides _overridesAppliedBefore](traitOverrides);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITraitOverrides _replaceOverrideTraitCollection:]((uint64_t)v8, v9);

  }
}

- (UITraitCollection)_internalOverrideTraitCollection
{
  id *v2;
  void *v3;

  -[_UITraitOverrides _overridesAppliedBefore](&self->_traitOverrides->super.isa);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItemGroup _items](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITraitCollection *)v3;
}

- (void)_parent:(id)a3 willTransitionToTraitCollection:(id)a4 withTransitionCoordinator:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a4;
  v8 = a5;
  if (-[UIPresentationController _shouldPerformWillTransitionToTraitCollectionForParent:](self, "_shouldPerformWillTransitionToTraitCollectionForParent:", a3))
  {
    v9 = -[UIPresentationController _adaptiveWillTransitionToTraitCollection:withTransitionCoordinator:](self, "_adaptiveWillTransitionToTraitCollection:withTransitionCoordinator:", v10, v8);
  }

}

- (id)_viewsParticipatingInNavigationControllerTransition
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_animatorForContainmentTransition
{
  return 0;
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  void *v2;
  void *v3;

  -[UIPresentationController containerView](self, "containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFocusEnvironment *)v3;
}

- (UIFocusItemContainer)focusItemContainer
{
  void *v2;
  void *v3;

  -[UIPresentationController containerView](self, "containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFocusItemContainer *)v3;
}

- (UIView)preferredFocusedView
{
  void *v2;
  void *v3;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFocusedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (int64_t)_subclassPreferredFocusedViewPrioritizationType
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  BOOL v7;

  if (!qword_1ECD7D3E0)
  {
    qword_1ECD7D3E0 = +[UIPresentationController instanceMethodForSelector:](UIPresentationController, "instanceMethodForSelector:", sel_preferredFocusedView);
    qword_1ECD7D3E8 = +[UIPresentationController instanceMethodForSelector:](UIPresentationController, "instanceMethodForSelector:", sel_preferredFocusEnvironments);
  }
  v3 = -[UIPresentationController methodForSelector:](self, "methodForSelector:", sel_preferredFocusedView);
  v4 = -[UIPresentationController methodForSelector:](self, "methodForSelector:", sel_preferredFocusEnvironments);
  if (v3)
    v5 = v3 == qword_1ECD7D3E0;
  else
    v5 = 1;
  if (v5)
    return 0;
  if (v4)
    v7 = v4 == qword_1ECD7D3E8;
  else
    v7 = 1;
  if (v7)
    return 1;
  else
    return 2;
}

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  _UIFocusEnvironmentCombinedPreferredFocusEnvironments(self, v5, -[UIPresentationController _subclassPreferredFocusedViewPrioritizationType](self, "_subclassPreferredFocusedViewPrioritizationType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (void)updateFocusIfNeeded
{
  id v2;

  +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", self);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateFocusIfNeeded");

}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (BOOL)_gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  UITapGestureRecognizer *v6;
  id v7;
  void *v8;
  BOOL v9;

  v6 = (UITapGestureRecognizer *)a3;
  v7 = a4;
  v8 = v7;
  v9 = self->_backGestureRecognizer == v6 && (objc_msgSend(v7, "_isGestureType:", 8) & 1) != 0;

  return v9;
}

- (BOOL)_gestureRecognizerShouldBegin:(id)a3
{
  return self->_backGestureRecognizer != a3 || -[UIPresentationController presented](self, "presented");
}

- (void)_performBackGesture:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[UIPresentationController containerView](self, "containerView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_focusResponder");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v6, "_containsResponder:", v8);

  if ((_DWORD)v5)
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)_disableMenuPressForBackGesture
{
  void *v3;
  UITapGestureRecognizer *backGestureRecognizer;

  -[UIGestureRecognizer view](self->_backGestureRecognizer, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", self->_backGestureRecognizer);

  backGestureRecognizer = self->_backGestureRecognizer;
  self->_backGestureRecognizer = 0;

}

- (BOOL)_isModal
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[UIPresentationController _childPresentationController](self, "_childPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || !objc_msgSend(v3, "_presentingOrPresented"))
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v7 = v6;
    v5 = objc_msgSend(v6, "isModalInPresentation");

    goto LABEL_7;
  }
  if ((objc_msgSend(v4, "_isModal") & 1) == 0)
  {
    if (-[UIPresentationController shouldRemovePresentersView](self, "shouldRemovePresentersView"))
    {
      v5 = 0;
      goto LABEL_7;
    }
    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v5 = 1;
LABEL_7:

  return v5;
}

- (void)_sendDismissalsAsNeeded
{
  void *v3;
  _QWORD v4[5];

  -[UIPresentationController _sendWillDismiss](self, "_sendWillDismiss");
  -[UIPresentationController _definiteTransitionCoordinator](self, "_definiteTransitionCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__UIPresentationController__sendDismissalsAsNeeded__block_invoke;
  v4[3] = &unk_1E16B2150;
  v4[4] = self;
  objc_msgSend(v3, "animateAlongsideTransition:completion:", 0, v4);

}

uint64_t __51__UIPresentationController__sendDismissalsAsNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_sendDidDismiss");
  return result;
}

- (BOOL)_shouldDismiss
{
  void *v4;
  char v5;
  void *v6;
  char v7;

  if (-[UIPresentationController _isModal](self, "_isModal"))
    return 0;
  -[UIPresentationController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return -[UIPresentationController _fallbackShouldDismiss](self, "_fallbackShouldDismiss");
  -[UIPresentationController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "presentationControllerShouldDismiss:", self);

  return v7;
}

- (void)_sendWillDismiss
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_presentationControllerWillDismiss:", self);

  -[UIPresentationController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[UIPresentationController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentationControllerWillDismiss:", self);

  }
  else
  {
    -[UIPresentationController _sendFallbackWillDismiss](self, "_sendFallbackWillDismiss");
  }
}

- (void)_sendDidDismiss
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_presentationControllerDidDismiss:", self);

  -[UIPresentationController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[UIPresentationController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentationControllerDidDismiss:", self);

  }
  else
  {
    -[UIPresentationController _sendFallbackDidDismiss](self, "_sendFallbackDidDismiss");
  }
}

- (void)_sendDidAttemptToDismiss
{
  void *v3;
  char v4;
  id v5;

  -[UIPresentationController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[UIPresentationController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentationControllerDidAttemptToDismiss:", self);

  }
}

- (BOOL)_fallbackShouldDismiss
{
  return 1;
}

- (BOOL)_shouldSavePresentedViewControllerForStateRestoration
{
  return 1;
}

- (BOOL)_requiresDeferralToCoordinateWithNavigationTransitionAnimated:(BOOL)a3
{
  return 0;
}

- (BOOL)_canPresentInSeparateScene
{
  if ((_UIApplicationIsExtension() & 1) != 0)
    return 0;
  else
    return !-[UIPresentationController _forcePresentationInPresenterScene](self, "_forcePresentationInPresenterScene");
}

- (BOOL)_handlesKeyboardAvoidance
{
  return 0;
}

- (BOOL)_allowsFocusInPresentingViewController
{
  return 0;
}

- (int64_t)_preferredContainerBackgroundStyle
{
  return 2;
}

- (CGSize)_preferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredContentSize.width;
  height = self->_preferredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIPopoverPresentationControllerSourceItem)sourceItem
{
  return self->_sourceItem;
}

- (BOOL)_forcePresentationInPresenterScene
{
  return self->_forcePresentationInPresenterScene;
}

- (void)_setForcePresentationInPresenterScene:(BOOL)a3
{
  self->_forcePresentationInPresenterScene = a3;
}

- (id)_pendingFocusEnvironmentUnlock
{
  return self->__pendingFocusEnvironmentUnlock;
}

- (UIViewController)_sourceViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->__sourceViewController);
}

- (BOOL)_isPresentedViewControllerStoredWeakly
{
  return self->__presentedViewControllerStoredWeakly;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (UIViewControllerTransitionCoordinator)_adaptiveTransitionCoordinator
{
  return self->_adaptiveTransitionCoordinator;
}

- (UIViewControllerTransitionCoordinatorContext)_adaptiveTransitionContext
{
  return self->_adaptiveTransitionContext;
}

- (BOOL)_changedPresentingViewControllerDuringAdaptation
{
  return self->_changedPresentingViewControllerDuringAdaptation;
}

- (void)_setChangedPresentingViewControllerDuringAdaptation:(BOOL)a3
{
  self->_changedPresentingViewControllerDuringAdaptation = a3;
}

- (void)set_containerSuperviewForCurrentTransition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (UIView)_viewForRemoteTextEffectsWindowMatchAnimation
{
  return (UIView *)objc_loadWeakRetained((id *)&self->__viewForRemoteTextEffectsWindowMatchAnimation);
}

- (void)_setShouldContinueTouchesOnTargetViewController:(BOOL)a3
{
  self->_shouldContinueTouchesOnTargetViewController = a3;
}

- (UIView)_customViewForTouchContinuation
{
  return self->_customViewForTouchContinuation;
}

- (void)_setCustomViewForTouchContinuation:(id)a3
{
  objc_storeStrong((id *)&self->_customViewForTouchContinuation, a3);
}

- (BOOL)isCurrentStateCancelled
{
  return self->_isCurrentStateCancelled;
}

@end
