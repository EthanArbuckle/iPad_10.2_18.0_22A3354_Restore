@implementation PRQuickActionEditingViewController

- (PRQuickActionEditingViewController)initWithQuickActionsConfiguration:(id)a3
{
  id v4;
  PRQuickActionEditingViewController *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  CHSWidgetExtensionProvider *extensionProvider;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PRQuickActionEditingViewController;
  v5 = -[PRQuickActionEditingViewController init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "leadingControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "category") == 3)
    {
      v8 = objc_alloc(MEMORY[0x1E0D14828]);
      objc_msgSend(v6, "identity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithIdentity:type:", v9, objc_msgSend(v6, "type"));

    }
    else
    {
      v10 = 0;
    }
    if (objc_msgSend(v7, "category") == 3)
    {
      v11 = objc_alloc(MEMORY[0x1E0D14828]);
      objc_msgSend(v7, "identity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithIdentity:type:", v12, objc_msgSend(v7, "type"));

    }
    else
    {
      v13 = 0;
    }
    -[PRQuickActionEditingViewController setLeadingControl:](v5, "setLeadingControl:", v10);
    -[PRQuickActionEditingViewController setTrailingControl:](v5, "setTrailingControl:", v13);
    PRSharedWidgetExtensionProvider();
    v14 = objc_claimAutoreleasedReturnValue();
    extensionProvider = v5->_extensionProvider;
    v5->_extensionProvider = (CHSWidgetExtensionProvider *)v14;

  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  CSProminentButtonsView *prominentButtonsView;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  id location;
  objc_super v57;
  _QWORD v58[6];

  v58[4] = *MEMORY[0x1E0C80C00];
  v57.receiver = self;
  v57.super_class = (Class)PRQuickActionEditingViewController;
  -[PRQuickActionEditingViewController viewDidLoad](&v57, sel_viewDidLoad);
  if (PRLockPickIsActive())
  {
    v47 = objc_alloc_init(MEMORY[0x1E0D1BC90]);
    objc_msgSend(v47, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v47, "setClickSuppressed:", 1);
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x1E0DC3428];
    v4 = MEMORY[0x1E0C809B0];
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __49__PRQuickActionEditingViewController_viewDidLoad__block_invoke;
    v54[3] = &unk_1E2183D00;
    objc_copyWeak(&v55, &location);
    objc_msgSend(v3, "actionWithHandler:", v54);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addAction:forControlEvents:", v5, 64);

    -[PRQuickActionEditingViewController leadingControl](self, "leadingControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = v6 == 0;

    if ((v5 & 1) != 0)
    {
      objc_msgSend(v47, "setHidden:", 1);
    }
    else
    {
      -[PRQuickActionEditingViewController leadingControl](self, "leadingControl");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRQuickActionEditingViewController _controlViewForControl:](self, "_controlViewForControl:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setGlyphView:", v8);

    }
    v9 = objc_alloc_init(MEMORY[0x1E0D1BC90]);
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "setClickSuppressed:", 1);
    v46 = v9;
    v10 = (void *)MEMORY[0x1E0DC3428];
    v52[0] = v4;
    v52[1] = 3221225472;
    v52[2] = __49__PRQuickActionEditingViewController_viewDidLoad__block_invoke_2;
    v52[3] = &unk_1E2183D00;
    objc_copyWeak(&v53, &location);
    objc_msgSend(v10, "actionWithHandler:", v52);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addAction:forControlEvents:", v11, 64);

    -[PRQuickActionEditingViewController trailingControl](self, "trailingControl");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = v12 == 0;

    if ((v11 & 1) != 0)
    {
      objc_msgSend(v46, "setHidden:", 1);
    }
    else
    {
      -[PRQuickActionEditingViewController trailingControl](self, "trailingControl");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRQuickActionEditingViewController _controlViewForControl:](self, "_controlViewForControl:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setGlyphView:", v14);

    }
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1BC98]), "initWithLeadingButton:trailingButton:", v47, v46);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__leadingActionDidFire);
    -[PRQuickActionEditingViewController _configureEditingReticleViewWithTapGesture:](self, "_configureEditingReticleViewWithTapGesture:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLeadingReticle:", v17);

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__trailingActionDidFire);
    -[PRQuickActionEditingViewController _configureEditingReticleViewWithTapGesture:](self, "_configureEditingReticleViewWithTapGesture:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTrailingReticle:", v19);

    v20 = (void *)MEMORY[0x1E0DC3428];
    v50[0] = v4;
    v50[1] = 3221225472;
    v50[2] = __49__PRQuickActionEditingViewController_viewDidLoad__block_invoke_3;
    v50[3] = &unk_1E2183D00;
    objc_copyWeak(&v51, &location);
    objc_msgSend(v20, "actionWithHandler:", v50);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRQuickActionEditingViewController _configureRemoveButtonWithAction:](self, "_configureRemoveButtonWithAction:", v21);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0DC3428];
    v48[0] = v4;
    v48[1] = 3221225472;
    v48[2] = __49__PRQuickActionEditingViewController_viewDidLoad__block_invoke_4;
    v48[3] = &unk_1E2183D00;
    objc_copyWeak(&v49, &location);
    objc_msgSend(v22, "actionWithHandler:", v48);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRQuickActionEditingViewController _configureRemoveButtonWithAction:](self, "_configureRemoveButtonWithAction:", v23);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setLeadingRemoveButton:", v45);
    objc_msgSend(v15, "setTrailingRemoveButton:", v44);
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRQuickActionEditingViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v15);

    v34 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v15, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRQuickActionEditingViewController view](self, "view");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v40;
    objc_msgSend(v15, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRQuickActionEditingViewController view](self, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v36;
    objc_msgSend(v15, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRQuickActionEditingViewController view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v58[2] = v27;
    objc_msgSend(v15, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRQuickActionEditingViewController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v58[3] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activateConstraints:", v32);

    prominentButtonsView = self->_prominentButtonsView;
    self->_prominentButtonsView = (CSProminentButtonsView *)v15;

    objc_destroyWeak(&v49);
    objc_destroyWeak(&v51);
    objc_destroyWeak(&v53);

    objc_destroyWeak(&v55);
    objc_destroyWeak(&location);

  }
  -[PRQuickActionEditingViewController _updateButtonsVisibility](self, "_updateButtonsVisibility");
}

void __49__PRQuickActionEditingViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_presentWidgetIntentConfigurationForControlWithPosition:", 1);

}

void __49__PRQuickActionEditingViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_presentWidgetIntentConfigurationForControlWithPosition:", 2);

}

void __49__PRQuickActionEditingViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleRemoveButtonActionForQuickActionPosition:", 1);

}

void __49__PRQuickActionEditingViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleRemoveButtonActionForQuickActionPosition:", 2);

}

- (void)validateControls
{
  void *v3;
  id v4;

  -[PRQuickActionEditingViewController _validateControl:](self, "_validateControl:", self->_leadingControl);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PRQuickActionEditingViewController _validateControl:](self, "_validateControl:", self->_trailingControl);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualObjects() & 1) == 0)
    -[PRQuickActionEditingViewController setLeadingControl:](self, "setLeadingControl:", v4);
  if ((BSEqualObjects() & 1) == 0)
    -[PRQuickActionEditingViewController setTrailingControl:](self, "setTrailingControl:", v3);

}

- (id)_validateControl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v11 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extensionIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF9688], "applicationWithBundleIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isLocked") & 1) != 0 || objc_msgSend(v9, "isHidden"))
  {
    PRLogEditing();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v19 = v5;
      v20 = 2114;
      v21 = v8;
      _os_log_impl(&dword_18B634000, v10, OS_LOG_TYPE_DEFAULT, "[Quick Action] removing control %{public}@ with containerBundleIdentifier %{public}@ because app was hidden or locked", buf, 0x16u);
    }
    v11 = 0;
    goto LABEL_7;
  }
  -[CHSWidgetExtensionProvider controlDescriptorForControl:](self->_extensionProvider, "controlDescriptorForControl:", v6);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v17 = 0;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v8, 1, &v17);
    v14 = v17;
    if (v14)
    {
      PRLogEditing();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[PRQuickActionEditingViewController _validateControl:].cold.2();
    }
    else
    {
      PRLogEditing();
      v16 = objc_claimAutoreleasedReturnValue();
      v15 = v16;
      if (v13)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[PRQuickActionEditingViewController _validateControl:].cold.1();

        v11 = v5;
        goto LABEL_20;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v19 = v5;
        _os_log_impl(&dword_18B634000, v15, OS_LOG_TYPE_DEFAULT, "[Quick Action] removing button for %{public}@ because application was not found", buf, 0xCu);
      }
    }

    v11 = 0;
LABEL_20:

    goto LABEL_7;
  }
  v11 = v5;
LABEL_7:

LABEL_9:
  return v11;
}

- (void)setLeadingControl:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_leadingControl, a3);
    if (v9)
    {
      -[PRQuickActionEditingViewController prominentButtonsView](self, "prominentButtonsView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "leadingButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRQuickActionEditingViewController _controlViewForControl:](self, "_controlViewForControl:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setGlyphView:", v7);

      -[PRQuickActionEditingViewController _updateActiveReticleForPosition:](self, "_updateActiveReticleForPosition:", 0);
    }
    -[PRQuickActionEditingViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "quickActionEditingViewController:didSetControl:forPosition:", self, v9, 1);

    -[PRQuickActionEditingViewController _updateButtonsVisibility](self, "_updateButtonsVisibility");
  }

}

- (void)setTrailingControl:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_trailingControl, a3);
    if (v9)
    {
      -[PRQuickActionEditingViewController prominentButtonsView](self, "prominentButtonsView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trailingButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRQuickActionEditingViewController _controlViewForControl:](self, "_controlViewForControl:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setGlyphView:", v7);

      -[PRQuickActionEditingViewController _updateActiveReticleForPosition:](self, "_updateActiveReticleForPosition:", 0);
    }
    -[PRQuickActionEditingViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "quickActionEditingViewController:didSetControl:forPosition:", self, v9, 2);

    -[PRQuickActionEditingViewController _updateButtonsVisibility](self, "_updateButtonsVisibility");
  }

}

- (id)_controlViewForControl:(id)a3
{
  id v3;
  PRQuickActionControlView *v4;
  void *v5;
  uint64_t v6;
  PRQuickActionControlView *v7;

  if (a3)
  {
    v3 = a3;
    v4 = [PRQuickActionControlView alloc];
    objc_msgSend(v3, "identity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "type");

    v7 = -[PRQuickActionControlView initWithControl:type:](v4, "initWithControl:type:", v5, v6);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_leadingActionDidFire
{
  void *v3;
  void *v4;
  id v5;

  -[PRQuickActionEditingViewController prominentButtonsView](self, "prominentButtonsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelected:", 0);

  -[PRQuickActionEditingViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quickActionEditingViewController:didTapAddForPosition:", self, 1);

}

- (void)_trailingActionDidFire
{
  void *v3;
  void *v4;
  id v5;

  -[PRQuickActionEditingViewController prominentButtonsView](self, "prominentButtonsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelected:", 0);

  -[PRQuickActionEditingViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quickActionEditingViewController:didTapAddForPosition:", self, 2);

}

- (void)_presentWidgetIntentConfigurationForControlWithPosition:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  id v7;

  if (!-[PRQuickActionEditingViewController isGalleryPresented](self, "isGalleryPresented") && a3)
  {
    if (a3 == 2)
    {
      -[PRQuickActionEditingViewController trailingControl](self, "trailingControl");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 != 1)
      {
        v7 = 0;
        goto LABEL_10;
      }
      -[PRQuickActionEditingViewController leadingControl](self, "leadingControl");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (id)v5;
LABEL_10:
    -[PRQuickActionEditingViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "quickActionEditingViewController:didRequestIntentConfigurationForControl:withPosition:", self, v7, a3);

  }
}

- (void)_handleRemoveButtonActionForQuickActionPosition:(int64_t)a3
{
  if (a3 == 2)
  {
    -[PRQuickActionEditingViewController setTrailingControl:](self, "setTrailingControl:", 0);
  }
  else if (a3 == 1)
  {
    -[PRQuickActionEditingViewController setLeadingControl:](self, "setLeadingControl:", 0);
  }
}

- (id)_configureEditingReticleViewWithTapGesture:(id)a3
{
  id v3;
  PRQuickActionsEditingReticleView *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(PRQuickActionsEditingReticleView);
  -[PRQuickActionsEditingReticleView layer](v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHitTestsAsOpaque:", 1);

  -[PRQuickActionsEditingReticleView addGestureRecognizer:](v4, "addGestureRecognizer:", v3);
  return v4;
}

- (id)_configureRemoveButtonWithAction:(id)a3
{
  id v3;
  PREditingMinusCloseBoxButton *v4;
  PREditingMinusCloseBoxButton *v5;
  void *v6;

  v3 = a3;
  v4 = [PREditingMinusCloseBoxButton alloc];
  v5 = -[PREditingButton initWithStyle:frame:primaryAction:](v4, "initWithStyle:frame:primaryAction:", 0, v3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  -[PREditingMinusCloseBoxButton configuration](v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
  -[PREditingMinusCloseBoxButton setConfiguration:](v5, "setConfiguration:", v6);

  return v5;
}

- (void)_updateActiveReticleForPosition:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  -[PRQuickActionEditingViewController prominentButtonsView](self, "prominentButtonsView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingReticle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", a3 == 1);

  objc_msgSend(v6, "trailingReticle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", a3 == 2);

}

- (void)_updateButtonsVisibility
{
  _BOOL8 v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[PRQuickActionEditingViewController prominentButtonsView](self, "prominentButtonsView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v3 = self->_leadingControl == 0;
  v4 = self->_trailingControl == 0;
  objc_msgSend(v11, "leadingButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

  objc_msgSend(v11, "trailingButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v4);

  objc_msgSend(v11, "leadingRemoveButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v3);

  objc_msgSend(v11, "leadingReticle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShowsEmptyView:", v3);

  objc_msgSend(v11, "trailingRemoveButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", v4);

  objc_msgSend(v11, "trailingReticle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShowsEmptyView:", v4);

}

- (PRQuickActionEditingViewControllerDelegate)delegate
{
  return (PRQuickActionEditingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isGalleryPresented
{
  return self->_galleryPresented;
}

- (void)setGalleryPresented:(BOOL)a3
{
  self->_galleryPresented = a3;
}

- (CCUISConfiguredControl)leadingControl
{
  return self->_leadingControl;
}

- (CCUISConfiguredControl)trailingControl
{
  return self->_trailingControl;
}

- (CSProminentButtonsView)prominentButtonsView
{
  return self->_prominentButtonsView;
}

- (void)setProminentButtonsView:(id)a3
{
  objc_storeStrong((id *)&self->_prominentButtonsView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prominentButtonsView, 0);
  objc_storeStrong((id *)&self->_trailingControl, 0);
  objc_storeStrong((id *)&self->_leadingControl, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_extensionProvider, 0);
}

- (void)_validateControl:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_18B634000, v0, v1, "[Quick Action] keeping control %{public}@ with nil control descriptor because found application with containerBundleIdentifier %{public}@");
}

- (void)_validateControl:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_18B634000, v0, v1, "[Quick Action] removing control %{public}@ because failed to look up application record with error %{public}@");
}

@end
