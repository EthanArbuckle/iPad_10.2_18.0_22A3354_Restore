@implementation SAUIElementViewController

- (SAUIElementViewController)initWithElementViewProvider:(id)a3
{
  SAUIElementViewController *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SAUIElementViewController;
  result = -[SAUILayoutSpecifyingElementViewController initWithElementViewProvider:](&v9, sel_initWithElementViewProvider_, a3);
  if (result)
  {
    __asm { FMOV            V0.2D, #1.0 }
    result->_leadingViewScale = _Q0;
    result->_trailingViewScale = _Q0;
    result->_minimalViewScale = _Q0;
  }
  return result;
}

- (SAUIElementViewProviding)elementViewProvider
{
  void *v2;
  void *v3;
  SAUIElementViewProviding *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SAUIElementViewController;
  -[SAUILayoutSpecifyingElementViewController elementViewProvider](&v6, sel_elementViewProvider);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (void)viewDidLoad
{
  void *v4;
  void *v5;
  char v6;
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
  objc_super v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)SAUIElementViewController;
  -[SAUILayoutSpecifyingElementViewController viewDidLoad](&v18, sel_viewDidLoad);
  -[SAUIElementViewController _elementView](self, "_elementView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAUIElementViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isDescendantOfView:", v5);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SAUIElementViewController.m"), 84, CFSTR("Element view not added to self view"));

  }
  -[SAUIElementViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x24BDE56E8]);
  objc_msgSend(v9, "setSourceLayer:", v8);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", 0.0, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", 1.0, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v11;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", 1.0, 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v12;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", 0.0, 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSourcePoints:", v14);

  objc_msgSend(v9, "setUsesNormalizedCoordinates:", 1);
  objc_msgSend(v9, "setDuration:", INFINITY);
  objc_msgSend(v9, "setFillMode:", *MEMORY[0x24BDE5970]);
  objc_msgSend(v9, "setRemovedOnCompletion:", 0);
  -[SAUIElementViewController _elementView](self, "_elementView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAnimation:forKey:", v9, CFSTR("SAUIElementViewMatchMoveToSuperview"));

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SAUIElementViewController;
  -[SAUILayoutSpecifyingElementViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[SAUIElementViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");

  WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
  UIRectGetCenter();
  objc_msgSend(WeakRetained, "setCenter:");
  BSRectWithSize();
  objc_msgSend(WeakRetained, "setBounds:");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BOOL4 v12;
  _BOOL4 v13;
  int v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  os_log_t *v18;
  void *v19;
  os_log_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  BOOL v25;
  _BOOL4 v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  BOOL v40;
  unsigned int v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  objc_super v47;
  _BYTE location[12];
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;
  CGSize v54;

  height = a3.height;
  width = a3.width;
  v53 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = -[SAUILayoutSpecifyingElementViewController _previousLayoutMode](self, "_previousLayoutMode");
  v9 = -[SAUILayoutSpecifyingElementViewController layoutMode](self, "layoutMode");
  v10 = v9;
  v11 = 0;
  v12 = v9 == 3 && v8 < 3;
  v13 = v9 < 3 && v8 == 3;
  if (v8 == 3 && v9 == 3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = objc_msgSend(v7, "isPerformingSystemApertureInertTransition");
    else
      v11 = 0;
  }
  v14 = (v12 || v13) | v11;
  v15 = -[SAUILayoutSpecifyingElementViewController isTrackingTransitionWithReason:](self, "isTrackingTransitionWithReason:", CFSTR("com.apple.SystemApertureUI.SAUIElementViewController.expansionTransition"));
  v39 = -[SAUILayoutSpecifyingElementViewController isTrackingTransitionWithReason:](self, "isTrackingTransitionWithReason:", CFSTR("com.apple.SystemApertureUI.SAUIElementViewController.contractionTransition"));
  v40 = v15;
  v16 = v15 | v39;
  v41 = v14;
  if (v10 == 3)
    v17 = v14 | v16;
  else
    v17 = 1;
  if ((_DWORD)v17 == 1 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "setPerformingSystemApertureCustomContentTransition:", 1);
  v18 = (os_log_t *)MEMORY[0x24BEB36B8];
  v19 = (void *)*MEMORY[0x24BEB36B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BEB36B8], OS_LOG_TYPE_DEBUG))
  {
    v32 = v19;
    v54.width = width;
    v54.height = height;
    NSStringFromCGSize(v54);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    SAUIStringFromElementViewLayoutMode(v8);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    SAUIStringFromElementViewLayoutMode(v10);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138543874;
    *(_QWORD *)&location[4] = v38;
    v49 = 2114;
    v50 = v33;
    v51 = 2114;
    v52 = v34;
    _os_log_debug_impl(&dword_247C5B000, v32, OS_LOG_TYPE_DEBUG, "View will transition to size: %{public}@, layoutMode: %{public}@ -> %{public}@", location, 0x20u);

  }
  v20 = *v18;
  if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEBUG))
  {
    v35 = v20;
    MEMORY[0x24958F530](v41);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x24958F530](v16);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x24958F530](v17);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138543874;
    *(_QWORD *)&location[4] = v38;
    v49 = 2114;
    v50 = v36;
    v51 = 2114;
    v52 = v37;
    _os_log_debug_impl(&dword_247C5B000, v35, OS_LOG_TYPE_DEBUG, "View will transition isTransitioning:%{public}@ isInActiveTransition:%{public}@ clientShouldLayoutImmediately:%{public}@", location, 0x20u);

  }
  objc_msgSend(v7, "valueForKey:", CFSTR("__mainContext"), v38);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "valueForKey:", CFSTR("__animator"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "valueForKey:", CFSTR("_fluidBehaviorSettings"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = *v18;
  if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEBUG))
    -[SAUIElementViewController viewWillTransitionToSize:withTransitionCoordinator:].cold.1((uint64_t)v23, v24);
  v47.receiver = self;
  v47.super_class = (Class)SAUIElementViewController;
  -[SAUILayoutSpecifyingElementViewController viewWillTransitionToSize:withTransitionCoordinator:](&v47, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if ((_DWORD)v17)
  {
    if ((_DWORD)v16)
    {
      v25 = v40;
      if (v10 >= 3)
        v25 = 0;
      if (v25)
      {
LABEL_35:
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = CFSTR("com.apple.SystemApertureUI.SAUIElementViewController.expansionTransition");
        if ((v10 < 3) | v11)
          v28 = CFSTR("com.apple.SystemApertureUI.SAUIElementViewController.contractionTransition");
        v29 = v28;
        -[SAUILayoutSpecifyingElementViewController beginTrackingTransitionWithUniqueIdentifier:reason:](self, "beginTrackingTransitionWithUniqueIdentifier:reason:", v27, v29);
        objc_initWeak((id *)location, self);
        v30 = MEMORY[0x24BDAC760];
        v45[0] = MEMORY[0x24BDAC760];
        v45[1] = 3221225472;
        v45[2] = __80__SAUIElementViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
        v45[3] = &unk_25193CE88;
        objc_copyWeak(&v46, (id *)location);
        v42[0] = v30;
        v42[1] = 3221225472;
        v42[2] = __80__SAUIElementViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
        v42[3] = &unk_25193CEB0;
        objc_copyWeak(&v44, (id *)location);
        v31 = v27;
        v43 = v31;
        objc_msgSend(v7, "animateAlongsideTransition:completion:", v45, v42);

        objc_destroyWeak(&v44);
        objc_destroyWeak(&v46);
        objc_destroyWeak((id *)location);

        goto LABEL_38;
      }
      v26 = v39;
      if (v10 <= 2)
        v26 = 0;
    }
    else
    {
      v26 = 0;
    }
    if ((v41 & (v16 ^ 1) & 1) == 0 && !v26)
      goto LABEL_38;
    goto LABEL_35;
  }
LABEL_38:

}

void __80__SAUIElementViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_containerView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x24BDF6F90];
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __80__SAUIElementViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v6[3] = &unk_25193CC18;
    v7 = v2;
    v4 = v2;
    objc_msgSend(v3, "performWithoutAnimation:", v6);

    WeakRetained = v5;
  }

}

uint64_t __80__SAUIElementViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_removeAllRetargetableAnimations:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __80__SAUIElementViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "endTrackingTransitionWithUniqueIdentifier:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (id)_contentView
{
  void *v2;
  void *v3;

  -[SAUIElementViewController _elementView](self, "_elementView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)handleElementTap:(id)a3
{
  id v4;
  void *v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  int64_t v14;
  objc_super v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  -[SAUIElementViewController elementViewProvider](self, "elementViewProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_14;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __46__SAUIElementViewController_handleElementTap___block_invoke;
  v17[3] = &unk_25193CED8;
  v17[4] = self;
  v18 = v4;
  v6 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x24958F7F4](v17);
  if (-[SAUILayoutSpecifyingElementViewController layoutMode](self, "layoutMode") == 1
    && (objc_msgSend(v5, "minimalView"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = ((uint64_t (**)(_QWORD, void *))v6)[2](v6, v7),
        v7,
        (v8 & 1) != 0))
  {
    v9 = 3;
  }
  else
  {
    objc_msgSend(v5, "leadingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = ((uint64_t (**)(_QWORD, void *))v6)[2](v6, v10);

    if ((v11 & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v5, "trailingView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = ((uint64_t (**)(_QWORD, void *))v6)[2](v6, v12);

      if (!v13)
      {
        v14 = 0;
        goto LABEL_13;
      }
      v9 = 2;
    }
  }
  if (objc_msgSend(v5, "handleElementViewEvent:", v9))
    v14 = 2;
  else
    v14 = 0;
LABEL_13:

  if (!v14)
  {
LABEL_14:
    v16.receiver = self;
    v16.super_class = (Class)SAUIElementViewController;
    v14 = -[SAUILayoutSpecifyingElementViewController handleElementTap:](&v16, sel_handleElementTap_, v4);
  }

  return v14;
}

uint64_t __46__SAUIElementViewController_handleElementTap___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "alpha");
  if (v4 <= 0.0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v3, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "locationInView:", v3);
      v7 = objc_msgSend(v3, "pointInside:withEvent:", 0);
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (unint64_t)layoutAxis
{
  void *v3;
  unint64_t v4;

  if (!-[SAUIElementViewController isViewLoaded](self, "isViewLoaded"))
    return 1;
  -[SAUIElementViewController _elementView](self, "_elementView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutAxis");

  return v4;
}

- (void)setLayoutAxis:(unint64_t)a3
{
  id v5;

  -[SAUIElementViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[SAUIElementViewController _elementView](self, "_elementView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutAxis:", a3);

}

- (int64_t)maximumSupportedLayoutModeForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  _BOOL4 v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SAUIElementViewController elementViewProvider](self, "elementViewProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25.receiver = self;
  v25.super_class = (Class)SAUIElementViewController;
  v8 = -[SAUILayoutSpecifyingElementViewController maximumSupportedLayoutModeForTargetWithOverrider:isDefaultValue:](&v25, sel_maximumSupportedLayoutModeForTargetWithOverrider_isDefaultValue_, v6, a4);

  v9 = *a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "leadingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 != 0;

  }
  else
  {
    v11 = 0;
  }
  v12 = v11;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "minimalView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      v12 = 1;
    else
      v12 = v11;

  }
  if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "trailingView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = 2;
    else
      v15 = 1;

  }
  else
  {
    v15 = 1;
  }
  if (v12)
    v16 = v15;
  else
    v16 = 0;
  if (v9 || v8 > 2)
  {
    if (v9)
      v18 = v16;
    else
      v18 = v8;
  }
  else
  {
    objc_msgSend(v7, "element");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 >= v16)
      v18 = v16;
    else
      v18 = v8;
    if (v8 <= v16)
    {
      v18 = v8;
    }
    else
    {
      v19 = (void *)SAUILogElementViewControlling;
      if (os_log_type_enabled((os_log_t)SAUILogElementViewControlling, OS_LOG_TYPE_ERROR))
      {
        v20 = v19;
        MEMORY[0x24958F5B4](v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        SAUIStringFromElementViewLayoutMode(v8);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        SAUIStringFromElementViewLayoutMode(v16);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v27 = v21;
        v28 = 2114;
        v29 = v22;
        v30 = 2114;
        v31 = v23;
        _os_log_error_impl(&dword_247C5B000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Client claims a max supported layout mode of '%{public}@', but doesn't implement the required properties – restricting to '%{public}@'", buf, 0x20u);

      }
    }

  }
  return v18;
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5 forTargetWithOverrider:(id)a6 isDefaultValue:(BOOL *)a7
{
  double trailing;
  double bottom;
  double leading;
  double top;
  double v12;
  double v13;
  double v14;
  double v15;
  id v18;
  id WeakRetained;
  void *v20;
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
  objc_super v33;
  NSDirectionalEdgeInsets result;

  trailing = a5.trailing;
  bottom = a5.bottom;
  leading = a5.leading;
  top = a5.top;
  v12 = a4.trailing;
  v13 = a4.bottom;
  v14 = a4.leading;
  v15 = a4.top;
  v18 = a6;
  if (a3 < 1)
  {
    v15 = *MEMORY[0x24BDF65E8];
    v14 = *(double *)(MEMORY[0x24BDF65E8] + 8);
    v13 = *(double *)(MEMORY[0x24BDF65E8] + 16);
    v12 = *(double *)(MEMORY[0x24BDF65E8] + 24);
  }
  else
  {
    -[SAUIElementViewController loadViewIfNeeded](self, "loadViewIfNeeded");
    WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    -[SAUIElementViewController elementViewProvider](self, "elementViewProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (SAUIDirectionEdgeInsetsAnyComponentIsZero())
    {
      objc_msgSend(WeakRetained, "suggestedOutsetsForLayoutMode:maximumOutsets:", a3, top, leading, bottom, trailing);
      v15 = SAUIDirectionEdgeInsetsComponentWiseMinimum(v15, v14, v13, v12, v21);
      v14 = v22;
      v13 = v23;
      v12 = v24;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v33.receiver = self;
      v33.super_class = (Class)SAUIElementViewController;
      -[SAUILayoutSpecifyingElementViewController preferredEdgeOutsetsForLayoutMode:suggestedOutsets:maximumOutsets:forTargetWithOverrider:isDefaultValue:](&v33, sel_preferredEdgeOutsetsForLayoutMode_suggestedOutsets_maximumOutsets_forTargetWithOverrider_isDefaultValue_, a3, v18, a7, v15, v14, v13, v12, top, leading, bottom, trailing);
      v15 = v25;
      v14 = v26;
      v13 = v27;
      v12 = v28;
    }

  }
  v29 = v15;
  v30 = v14;
  v31 = v13;
  v32 = v12;
  result.trailing = v32;
  result.bottom = v31;
  result.leading = v30;
  result.top = v29;
  return result;
}

- (BOOL)elementViewShouldCenterProvidedContent:(id)a3
{
  return !-[SAUILayoutSpecifyingElementViewController _isObstructedBySensorRegion](self, "_isObstructedBySensorRegion", a3);
}

- (CGSize)maximumSizeOfMinimalViewForElementView:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v4 = *MEMORY[0x24BDBF148];
  v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  -[SAUILayoutSpecifyingElementViewController layoutHost](self, "layoutHost", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SAUIElementViewController elementViewProvider](self, "elementViewProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAUIElementViewController elementViewProvider](self, "elementViewProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "maximumAvailableSizeForProvidedMinimalView:fromViewProvider:", v10, v11);
    v8 = v12;
    v7 = v13;

  }
  if (v8 == v4 && v7 == v5)
  {
    -[SAUILayoutSpecifyingElementViewController _obstructedRegionSize](self, "_obstructedRegionSize");
    v7 = v15;
    v8 = 1.79769313e308;
  }

  v16 = v8;
  v17 = v7;
  result.height = v17;
  result.width = v16;
  return result;
}

- (CGSize)maximumSizeOfLeadingViewForElementView:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v4 = *MEMORY[0x24BDBF148];
  v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  -[SAUILayoutSpecifyingElementViewController layoutHost](self, "layoutHost", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SAUIElementViewController elementViewProvider](self, "elementViewProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAUIElementViewController elementViewProvider](self, "elementViewProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "maximumAvailableSizeForProvidedLeadingView:fromViewProvider:", v10, v11);
    v8 = v12;
    v7 = v13;

  }
  if (v8 == v4 && v7 == v5)
  {
    -[SAUILayoutSpecifyingElementViewController _obstructedRegionSize](self, "_obstructedRegionSize");
    v7 = v15;
    v8 = 1.79769313e308;
  }

  v16 = v8;
  v17 = v7;
  result.height = v17;
  result.width = v16;
  return result;
}

- (CGSize)maximumSizeOfTrailingViewForElementView:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v4 = *MEMORY[0x24BDBF148];
  v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  -[SAUILayoutSpecifyingElementViewController layoutHost](self, "layoutHost", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SAUIElementViewController elementViewProvider](self, "elementViewProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAUIElementViewController elementViewProvider](self, "elementViewProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "maximumAvailableSizeForProvidedTrailingView:fromViewProvider:", v10, v11);
    v8 = v12;
    v7 = v13;

  }
  if (v8 == v4 && v7 == v5)
  {
    -[SAUILayoutSpecifyingElementViewController _obstructedRegionSize](self, "_obstructedRegionSize");
    v7 = v15;
    v8 = 1.79769313e308;
  }

  v16 = v8;
  v17 = v7;
  result.height = v17;
  result.width = v16;
  return result;
}

- (BOOL)isMinimalViewIsolatedForElementView:(id)a3
{
  return !-[SAUILayoutSpecifyingElementViewController _isObstructedBySensorRegion](self, "_isObstructedBySensorRegion", a3);
}

- (void)elementView:(id)a3 didConfigureLeadingTransformView:(id)a4
{
  double leadingViewBlurProgress;
  double leadingViewAlpha;
  double leadingViewSquishProgress;
  id v8;
  void *v9;
  id v10;

  leadingViewBlurProgress = self->_leadingViewBlurProgress;
  leadingViewAlpha = self->_leadingViewAlpha;
  leadingViewSquishProgress = self->_leadingViewSquishProgress;
  v8 = a4;
  -[SAUIElementViewController elementViewProvider](self, "elementViewProvider");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAUIElementViewController _synchronizeBlurProgress:alpha:squishProgress:isLeading:isMinimal:ofTransformView:providedView:](self, "_synchronizeBlurProgress:alpha:squishProgress:isLeading:isMinimal:ofTransformView:providedView:", 1, 0, v8, v9, leadingViewBlurProgress, leadingViewAlpha, leadingViewSquishProgress);

}

- (void)elementView:(id)a3 didConfigureTrailingTransformView:(id)a4
{
  double trailingViewBlurProgress;
  double trailingViewAlpha;
  double trailingViewSquishProgress;
  id v8;
  void *v9;
  id v10;

  trailingViewBlurProgress = self->_trailingViewBlurProgress;
  trailingViewAlpha = self->_trailingViewAlpha;
  trailingViewSquishProgress = self->_trailingViewSquishProgress;
  v8 = a4;
  -[SAUIElementViewController elementViewProvider](self, "elementViewProvider");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAUIElementViewController _synchronizeBlurProgress:alpha:squishProgress:isLeading:isMinimal:ofTransformView:providedView:](self, "_synchronizeBlurProgress:alpha:squishProgress:isLeading:isMinimal:ofTransformView:providedView:", 0, 0, v8, v9, trailingViewBlurProgress, trailingViewAlpha, trailingViewSquishProgress);

}

- (void)elementView:(id)a3 didConfigureMinimalTransformView:(id)a4
{
  double minimalViewBlurProgress;
  double minimalViewAlpha;
  double minimalViewSquishProgress;
  id v8;
  id v9;

  minimalViewBlurProgress = self->_minimalViewBlurProgress;
  minimalViewAlpha = self->_minimalViewAlpha;
  minimalViewSquishProgress = self->_minimalViewSquishProgress;
  v8 = a4;
  -[SAUIElementViewController _effectiveProvidedMinimalView](self, "_effectiveProvidedMinimalView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SAUIElementViewController _synchronizeBlurProgress:alpha:squishProgress:isLeading:isMinimal:ofTransformView:providedView:](self, "_synchronizeBlurProgress:alpha:squishProgress:isLeading:isMinimal:ofTransformView:providedView:", 1, 1, v8, v9, minimalViewBlurProgress, minimalViewAlpha, minimalViewSquishProgress);

}

- (void)elementView:(id)a3 didLayoutResizedLeadingTransformView:(id)a4
{
  double leadingViewSquishProgress;
  CGSize *p_leadingViewScale;
  id v7;
  void *v8;
  id v9;

  leadingViewSquishProgress = self->_leadingViewSquishProgress;
  p_leadingViewScale = &self->_leadingViewScale;
  v7 = a4;
  -[SAUIElementViewController elementViewProvider](self, "elementViewProvider");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leadingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAUIElementViewController _setSquishProgress:additionalScale:forProvidedView:transformView:isLeading:isMinimal:](self, "_setSquishProgress:additionalScale:forProvidedView:transformView:isLeading:isMinimal:", v8, v7, 1, 0, leadingViewSquishProgress, p_leadingViewScale->width, p_leadingViewScale->height);

}

- (void)elementView:(id)a3 didLayoutResizedTrailingTransformView:(id)a4
{
  double trailingViewSquishProgress;
  CGSize *p_trailingViewScale;
  id v7;
  void *v8;
  id v9;

  trailingViewSquishProgress = self->_trailingViewSquishProgress;
  p_trailingViewScale = &self->_trailingViewScale;
  v7 = a4;
  -[SAUIElementViewController elementViewProvider](self, "elementViewProvider");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trailingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAUIElementViewController _setSquishProgress:additionalScale:forProvidedView:transformView:isLeading:isMinimal:](self, "_setSquishProgress:additionalScale:forProvidedView:transformView:isLeading:isMinimal:", v8, v7, 0, 0, trailingViewSquishProgress, p_trailingViewScale->width, p_trailingViewScale->height);

}

- (void)elementView:(id)a3 didLayoutResizedMinimalTransformView:(id)a4
{
  double minimalViewSquishProgress;
  CGSize *p_minimalViewScale;
  id v7;
  id v8;

  minimalViewSquishProgress = self->_minimalViewSquishProgress;
  p_minimalViewScale = &self->_minimalViewScale;
  v7 = a4;
  -[SAUIElementViewController _effectiveProvidedMinimalView](self, "_effectiveProvidedMinimalView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SAUIElementViewController _setSquishProgress:additionalScale:forProvidedView:transformView:isLeading:isMinimal:](self, "_setSquishProgress:additionalScale:forProvidedView:transformView:isLeading:isMinimal:", v8, v7, 1, 1, minimalViewSquishProgress, p_minimalViewScale->width, p_minimalViewScale->height);

}

- (id)snapshotView
{
  return self->_snapshotView;
}

- (id)beginRequiringSnapshotForReason:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  char v7;
  UIView *v8;
  _SAUIElementViewControllerSnapshotAssertion *v9;
  void *v10;
  void *v11;
  _SAUIElementViewControllerSnapshotAssertion *v12;
  UIView *v13;
  _QWORD v15[4];
  UIView *v16;
  id v17;
  id location;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotViewAssertion);
  objc_msgSend(WeakRetained, "snapshotReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();

  if ((v7 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "invalidateWithReason:", CFSTR("different reason requested"));
    -[SAUIElementViewController _insertContentSnapshotView](self, "_insertContentSnapshotView");
    v8 = self->_snapshotView;
    v9 = [_SAUIElementViewControllerSnapshotAssertion alloc];
    -[SAUIElementViewController elementViewProvider](self, "elementViewProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "element");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[_SAUIElementViewControllerSnapshotAssertion initWithElement:snapshotReason:](v9, "initWithElement:snapshotReason:", v11, v4);

    objc_storeWeak((id *)&self->_snapshotViewAssertion, v12);
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __61__SAUIElementViewController_beginRequiringSnapshotForReason___block_invoke;
    v15[3] = &unk_25193CF00;
    v13 = v8;
    v16 = v13;
    objc_copyWeak(&v17, &location);
    -[SAAssertion addInvalidationBlock:](v12, "addInvalidationBlock:", v15);
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
    WeakRetained = v12;
  }

  return WeakRetained;
}

void __61__SAUIElementViewController_beginRequiringSnapshotForReason___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  int v3;
  void *v4;
  _QWORD *v5;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = BSEqualObjects();
    WeakRetained = v5;
    if (v3)
    {
      v4 = (void *)v5[137];
      v5[137] = 0;

      WeakRetained = v5;
    }
  }

}

- (void)setLeadingViewBlurProgress:(double)a3
{
  void *v5;
  id WeakRetained;

  if (self->_leadingViewBlurProgress != a3)
  {
    self->_leadingViewBlurProgress = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    objc_msgSend(WeakRetained, "leadingTransformView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAUILayoutSpecifyingElementViewController _setBlurProgress:forView:](self, "_setBlurProgress:forView:", v5, a3);

  }
}

- (void)setLeadingViewAlpha:(double)a3
{
  void *v4;
  id WeakRetained;

  if (self->_leadingViewAlpha != a3)
  {
    self->_leadingViewAlpha = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    objc_msgSend(WeakRetained, "leadingTransformView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", self->_leadingViewAlpha);

  }
}

- (void)setLeadingViewSquishProgress:(double)a3
{
  CGSize *p_leadingViewScale;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;

  if (self->_leadingViewSquishProgress != a3)
  {
    self->_leadingViewSquishProgress = a3;
    p_leadingViewScale = &self->_leadingViewScale;
    -[SAUIElementViewController elementViewProvider](self, "elementViewProvider");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    objc_msgSend(WeakRetained, "leadingTransformView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAUIElementViewController _setSquishProgress:additionalScale:forProvidedView:transformView:isLeading:isMinimal:](self, "_setSquishProgress:additionalScale:forProvidedView:transformView:isLeading:isMinimal:", v6, v8, 1, 0, a3, p_leadingViewScale->width, p_leadingViewScale->height);

  }
}

- (void)setLeadingViewScale:(CGSize)a3
{
  CGSize *p_leadingViewScale;
  double leadingViewSquishProgress;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;

  p_leadingViewScale = &self->_leadingViewScale;
  if (a3.width != self->_leadingViewScale.width || a3.height != self->_leadingViewScale.height)
  {
    p_leadingViewScale->width = a3.width;
    self->_leadingViewScale.height = a3.height;
    leadingViewSquishProgress = self->_leadingViewSquishProgress;
    -[SAUIElementViewController elementViewProvider](self, "elementViewProvider");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leadingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    objc_msgSend(WeakRetained, "leadingTransformView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAUIElementViewController _setSquishProgress:additionalScale:forProvidedView:transformView:isLeading:isMinimal:](self, "_setSquishProgress:additionalScale:forProvidedView:transformView:isLeading:isMinimal:", v7, v9, 1, 0, leadingViewSquishProgress, p_leadingViewScale->width, p_leadingViewScale->height);

  }
}

- (void)setTrailingViewBlurProgress:(double)a3
{
  void *v5;
  id WeakRetained;

  if (self->_trailingViewBlurProgress != a3)
  {
    self->_trailingViewBlurProgress = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    objc_msgSend(WeakRetained, "trailingTransformView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAUILayoutSpecifyingElementViewController _setBlurProgress:forView:](self, "_setBlurProgress:forView:", v5, a3);

  }
}

- (void)setTrailingViewAlpha:(double)a3
{
  void *v4;
  id WeakRetained;

  if (self->_trailingViewAlpha != a3)
  {
    self->_trailingViewAlpha = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    objc_msgSend(WeakRetained, "trailingTransformView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", self->_trailingViewAlpha);

  }
}

- (void)setTrailingViewSquishProgress:(double)a3
{
  CGSize *p_trailingViewScale;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;

  if (self->_trailingViewSquishProgress != a3)
  {
    self->_trailingViewSquishProgress = a3;
    p_trailingViewScale = &self->_trailingViewScale;
    -[SAUIElementViewController elementViewProvider](self, "elementViewProvider");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trailingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    objc_msgSend(WeakRetained, "trailingTransformView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAUIElementViewController _setSquishProgress:additionalScale:forProvidedView:transformView:isLeading:isMinimal:](self, "_setSquishProgress:additionalScale:forProvidedView:transformView:isLeading:isMinimal:", v6, v8, 0, 0, a3, p_trailingViewScale->width, p_trailingViewScale->height);

  }
}

- (void)setTrailingViewScale:(CGSize)a3
{
  CGSize *p_trailingViewScale;
  double trailingViewSquishProgress;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;

  p_trailingViewScale = &self->_trailingViewScale;
  if (a3.width != self->_trailingViewScale.width || a3.height != self->_trailingViewScale.height)
  {
    p_trailingViewScale->width = a3.width;
    self->_trailingViewScale.height = a3.height;
    trailingViewSquishProgress = self->_trailingViewSquishProgress;
    -[SAUIElementViewController elementViewProvider](self, "elementViewProvider");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trailingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    objc_msgSend(WeakRetained, "trailingTransformView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAUIElementViewController _setSquishProgress:additionalScale:forProvidedView:transformView:isLeading:isMinimal:](self, "_setSquishProgress:additionalScale:forProvidedView:transformView:isLeading:isMinimal:", v7, v9, 0, 0, trailingViewSquishProgress, p_trailingViewScale->width, p_trailingViewScale->height);

  }
}

- (void)setMinimalViewBlurProgress:(double)a3
{
  void *v5;
  id WeakRetained;

  if (self->_minimalViewBlurProgress != a3)
  {
    self->_minimalViewBlurProgress = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    objc_msgSend(WeakRetained, "minimalTransformView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAUILayoutSpecifyingElementViewController _setBlurProgress:forView:](self, "_setBlurProgress:forView:", v5, a3);

  }
}

- (void)setMinimalViewAlpha:(double)a3
{
  void *v4;
  id WeakRetained;

  if (self->_minimalViewAlpha != a3)
  {
    self->_minimalViewAlpha = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    objc_msgSend(WeakRetained, "minimalTransformView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", self->_minimalViewAlpha);

  }
}

- (void)setMinimalViewSquishProgress:(double)a3
{
  CGSize *p_minimalViewScale;
  id WeakRetained;
  void *v7;
  id v8;

  if (self->_minimalViewSquishProgress != a3)
  {
    self->_minimalViewSquishProgress = a3;
    p_minimalViewScale = &self->_minimalViewScale;
    -[SAUIElementViewController _effectiveProvidedMinimalView](self, "_effectiveProvidedMinimalView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    objc_msgSend(WeakRetained, "minimalTransformView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAUIElementViewController _setSquishProgress:additionalScale:forProvidedView:transformView:isLeading:isMinimal:](self, "_setSquishProgress:additionalScale:forProvidedView:transformView:isLeading:isMinimal:", v8, v7, 1, 1, a3, p_minimalViewScale->width, p_minimalViewScale->height);

  }
}

- (void)setMinimalViewScale:(CGSize)a3
{
  CGSize *p_minimalViewScale;
  double minimalViewSquishProgress;
  id WeakRetained;
  void *v8;
  id v9;

  p_minimalViewScale = &self->_minimalViewScale;
  if (a3.width != self->_minimalViewScale.width || a3.height != self->_minimalViewScale.height)
  {
    p_minimalViewScale->width = a3.width;
    self->_minimalViewScale.height = a3.height;
    minimalViewSquishProgress = self->_minimalViewSquishProgress;
    -[SAUIElementViewController _effectiveProvidedMinimalView](self, "_effectiveProvidedMinimalView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    objc_msgSend(WeakRetained, "minimalTransformView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAUIElementViewController _setSquishProgress:additionalScale:forProvidedView:transformView:isLeading:isMinimal:](self, "_setSquishProgress:additionalScale:forProvidedView:transformView:isLeading:isMinimal:", v9, v8, 1, 1, minimalViewSquishProgress, p_minimalViewScale->width, p_minimalViewScale->height);

  }
}

- (void)setCustomContentBlurProgress:(double)a3
{
  void *v5;
  id WeakRetained;

  if (self->_customContentBlurProgress != a3)
  {
    self->_customContentBlurProgress = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    objc_msgSend(WeakRetained, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAUILayoutSpecifyingElementViewController _setBlurProgress:forView:](self, "_setBlurProgress:forView:", v5, a3);

  }
}

- (double)customContentAlpha
{
  id WeakRetained;
  void *v3;
  double v4;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
  objc_msgSend(WeakRetained, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alpha");
  v5 = v4;

  return v5;
}

- (void)setCustomContentAlpha:(double)a3
{
  double v5;
  void *v6;
  id WeakRetained;

  -[SAUIElementViewController customContentAlpha](self, "customContentAlpha");
  if (v5 != a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    objc_msgSend(WeakRetained, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", a3);

  }
}

- (void)setSnapshotViewBlurProgress:(double)a3
{
  if (self->_snapshotViewBlurProgress != a3)
  {
    self->_snapshotViewBlurProgress = a3;
    -[SAUILayoutSpecifyingElementViewController _setBlurProgress:forView:](self, "_setBlurProgress:forView:", self->_snapshotView);
  }
}

- (double)snapshotViewAlpha
{
  double result;

  -[UIView alpha](self->_snapshotView, "alpha");
  return result;
}

- (void)setSnapshotViewAlpha:(double)a3
{
  double v5;

  -[SAUIElementViewController snapshotViewAlpha](self, "snapshotViewAlpha");
  if (v5 != a3)
    -[UIView setAlpha:](self->_snapshotView, "setAlpha:", a3);
}

- (id)_elementView
{
  SAUIElementView **p_elementView;
  SAUIElementView *WeakRetained;
  SAUIElementView *v5;
  void *v6;

  p_elementView = &self->_elementView;
  WeakRetained = (SAUIElementView *)objc_loadWeakRetained((id *)&self->_elementView);
  if (!WeakRetained)
  {
    v5 = [SAUIElementView alloc];
    -[SAUIElementViewController elementViewProvider](self, "elementViewProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = -[SAUIElementView initWithElementViewProvider:](v5, "initWithElementViewProvider:", v6);

    objc_storeWeak((id *)p_elementView, WeakRetained);
    -[SAUIElementView setDelegate:](WeakRetained, "setDelegate:", self);
  }
  return WeakRetained;
}

- (void)_setSquishProgress:(double)a3 additionalScale:(CGSize)a4 forProvidedView:(id)a5 transformView:(id)a6 isLeading:(BOOL)a7 isMinimal:(BOOL)a8
{
  _BOOL4 v8;
  CGFloat height;
  CGFloat width;
  id v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v35;
  CGRect v36;

  v8 = a7;
  height = a4.height;
  width = a4.width;
  v14 = a6;
  v15 = v14;
  if (a5 && v14)
  {
    v16 = a5;
    -[SAUIElementViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "_shouldReverseLayoutDirection");

    v19 = -1.0;
    if (v8)
      v19 = 1.0;
    v20 = height;
    if (v18)
      v21 = v19;
    else
      v21 = -v19;
    objc_msgSend(v16, "bounds");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    v36.origin.x = v23;
    v36.origin.y = v25;
    v36.size.width = v27;
    v36.size.height = v29;
    v30 = CGRectGetWidth(v36);
    memset(&v35, 0, sizeof(v35));
    CGAffineTransformMakeScale(&t1, 1.0 - a3, 1.0);
    CGAffineTransformMakeTranslation(&t2, v21 * a3 * v30 * 0.5, 0.0);
    CGAffineTransformConcat(&v35, &t1, &t2);
    if (!BSFloatIsOne() || (BSFloatIsOne() & 1) == 0)
    {
      v31 = v35;
      CGAffineTransformScale(&v32, &v31, width, v20);
      v35 = v32;
    }
    v32 = v35;
    objc_msgSend(v15, "setTransform:", &v32);
  }

}

- (void)_synchronizeBlurProgress:(double)a3 alpha:(double)a4 squishProgress:(double)a5 isLeading:(BOOL)a6 isMinimal:(BOOL)a7 ofTransformView:(id)a8 providedView:(id)a9
{
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  double v24;
  double v25;
  double v26;
  BOOL v27;
  BOOL v28;

  v16 = a8;
  v17 = a9;
  v18 = (void *)MEMORY[0x24BDF6F90];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __124__SAUIElementViewController__synchronizeBlurProgress_alpha_squishProgress_isLeading_isMinimal_ofTransformView_providedView___block_invoke;
  v21[3] = &unk_25193CF28;
  v21[4] = self;
  v22 = v16;
  v24 = a3;
  v25 = a4;
  v27 = a7;
  v28 = a6;
  v26 = a5;
  v23 = v17;
  v19 = v17;
  v20 = v16;
  objc_msgSend(v18, "performWithoutAnimation:", v21);

}

uint64_t __124__SAUIElementViewController__synchronizeBlurProgress_alpha_squishProgress_isLeading_isMinimal_ofTransformView_providedView___block_invoke(uint64_t a1)
{
  double *v2;
  double *v3;
  _BOOL8 v4;

  objc_msgSend(*(id *)(a1 + 32), "_setBlurProgress:forView:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", *(double *)(a1 + 64));
  if (*(_BYTE *)(a1 + 80))
  {
    v2 = *(double **)(a1 + 32);
    v3 = v2 + 155;
    v4 = *(_BYTE *)(a1 + 81) != 0;
  }
  else
  {
    v2 = *(double **)(a1 + 32);
    if (*(_BYTE *)(a1 + 81))
    {
      v3 = v2 + 151;
      v4 = 1;
    }
    else
    {
      v4 = 0;
      v3 = v2 + 153;
    }
  }
  return objc_msgSend(v2, "_setSquishProgress:additionalScale:forProvidedView:transformView:isLeading:isMinimal:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v4, *(unsigned __int8 *)(a1 + 80) != 0, *(double *)(a1 + 72), *v3, v3[1]);
}

- (id)_effectiveProvidedMinimalView
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SAUIElementViewController elementViewProvider](self, "elementViewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimalView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "leadingView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)_insertContentSnapshotView
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __55__SAUIElementViewController__insertContentSnapshotView__block_invoke;
  v2[3] = &unk_25193CC18;
  v2[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v2);
}

void __55__SAUIElementViewController__insertContentSnapshotView__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "snapshotViewAfterScreenUpdates:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1096);
  *(_QWORD *)(v3 + 1096) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_insertSnapshotView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1096));
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1096);
  objc_msgSend(v6, "bounds");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setContentMode:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setAutoresizingMask:", 18);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setUserInteractionEnabled:", 0);

}

- (double)leadingViewBlurProgress
{
  return self->_leadingViewBlurProgress;
}

- (double)leadingViewAlpha
{
  return self->_leadingViewAlpha;
}

- (double)leadingViewSquishProgress
{
  return self->_leadingViewSquishProgress;
}

- (CGSize)leadingViewScale
{
  double width;
  double height;
  CGSize result;

  width = self->_leadingViewScale.width;
  height = self->_leadingViewScale.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)trailingViewBlurProgress
{
  return self->_trailingViewBlurProgress;
}

- (double)trailingViewAlpha
{
  return self->_trailingViewAlpha;
}

- (double)trailingViewSquishProgress
{
  return self->_trailingViewSquishProgress;
}

- (CGSize)trailingViewScale
{
  double width;
  double height;
  CGSize result;

  width = self->_trailingViewScale.width;
  height = self->_trailingViewScale.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)minimalViewBlurProgress
{
  return self->_minimalViewBlurProgress;
}

- (double)minimalViewAlpha
{
  return self->_minimalViewAlpha;
}

- (double)minimalViewSquishProgress
{
  return self->_minimalViewSquishProgress;
}

- (CGSize)minimalViewScale
{
  double width;
  double height;
  CGSize result;

  width = self->_minimalViewScale.width;
  height = self->_minimalViewScale.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)customContentBlurProgress
{
  return self->_customContentBlurProgress;
}

- (double)snapshotViewBlurProgress
{
  return self->_snapshotViewBlurProgress;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_snapshotViewAssertion);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_destroyWeak((id *)&self->_elementView);
}

- (void)viewWillTransitionToSize:(uint64_t)a1 withTransitionCoordinator:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_247C5B000, a2, OS_LOG_TYPE_DEBUG, "View will transition with settings: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
