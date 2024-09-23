@implementation SBHRootSidebarController

- (void)viewDidLoad
{
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *widgetViewControllerConstraints;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHRootSidebarController;
  -[SBHRootSidebarController viewDidLoad](&v6, sel_viewDidLoad);
  -[SBHRootSidebarController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInsetsLayoutMarginsFromSafeArea:", 0);
  v4 = (NSMutableArray *)objc_opt_new();
  widgetViewControllerConstraints = self->_widgetViewControllerConstraints;
  self->_widgetViewControllerConstraints = v4;

  -[SBHRootSidebarController _configureAvocadoViewController](self, "_configureAvocadoViewController");
}

- (void)viewWillAppear:(BOOL)a3
{
  NSObject *v3;
  uint8_t v4[16];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHRootSidebarController;
  -[SBHRootSidebarController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_DEFAULT, "Sidebar viewWillAppear:", v4, 2u);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)SBHRootSidebarController;
  -[SBHRootSidebarController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  -[SBHRootSidebarController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    SBHStringFromUIInterfaceOrientation(objc_msgSend(v5, "interfaceOrientation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_DEFAULT, "[Overlay Position] Root side bar viewDidAppear:, orientation: %{public}@", buf, 0xCu);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v3;
  uint8_t v4[16];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHRootSidebarController;
  -[SBHRootSidebarController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_DEFAULT, "Sidebar viewWillDisappear:", v4, 2u);
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  NSObject *v3;
  uint8_t v4[16];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHRootSidebarController;
  -[SBHRootSidebarController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_DEFAULT, "Sidebar viewDidDisappear:", v4, 2u);
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setSidebarVisualConfiguration:(id)a3
{
  SBHSidebarVisualConfiguration *v5;
  SBHSidebarVisualConfiguration *v6;

  v5 = (SBHSidebarVisualConfiguration *)a3;
  if (self->_sidebarVisualConfiguration != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_sidebarVisualConfiguration, a3);
    -[SBHRootSidebarController _configureLayoutMargins](self, "_configureLayoutMargins");
    v5 = v6;
  }

}

- (void)setLayoutInsetsIgnoredEdges:(unint64_t)a3
{
  if (self->_layoutInsetsIgnoredEdges != a3)
  {
    self->_layoutInsetsIgnoredEdges = a3;
    -[SBHRootSidebarController _configureLayoutMargins](self, "_configureLayoutMargins");
  }
}

- (void)setEditingIcons:(BOOL)a3
{
  -[UIViewController setEditing:](self->_avocadoViewController, "setEditing:", a3);
}

- (void)setAvocadoViewController:(id)a3
{
  UIViewController *v5;
  void *v6;
  UIViewController *v7;

  v5 = (UIViewController *)a3;
  if (self->_avocadoViewController != v5)
  {
    v7 = v5;
    -[SBHRootSidebarController bs_removeChildViewController:](self, "bs_removeChildViewController:");
    -[SBHRootSidebarController widgetViewControllerConstraints](self, "widgetViewControllerConstraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllObjects");

    objc_storeStrong((id *)&self->_avocadoViewController, a3);
    -[SBHRootSidebarController _configureAvocadoViewController](self, "_configureAvocadoViewController");
    v5 = v7;
  }

}

- (void)setLegibilitySettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_legibilitySettings) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIViewController setLegibilitySettings:](self->_avocadoViewController, "setLegibilitySettings:", v5);
  }

}

- (void)_setupConstraintsForViewController:(id)a3
{
  id v4;
  void *v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBHRootSidebarController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHRootSidebarController widgetViewControllerConstraints](self, "widgetViewControllerConstraints");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v9;
  v23[1] = v12;
  v23[2] = v15;
  v23[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObjectsFromArray:", v20);

  v21 = (void *)MEMORY[0x1E0CB3718];
  -[SBHRootSidebarController widgetViewControllerConstraints](self, "widgetViewControllerConstraints");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v22);

}

- (void)_configureAvocadoViewController
{
  id v3;

  -[SBHRootSidebarController avocadoViewController](self, "avocadoViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (-[SBHRootSidebarController isViewLoaded](self, "isViewLoaded") && v3)
  {
    -[SBHRootSidebarController bs_addChildViewController:](self, "bs_addChildViewController:", v3);
    -[SBHRootSidebarController _setupConstraintsForViewController:](self, "_setupConstraintsForViewController:", v3);
  }

}

- (void)_configureLayoutMargins
{
  void *v3;
  void *v4;
  SBHSidebarVisualConfiguration *v5;
  char v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  SBHSidebarVisualConfiguration *v15;

  -[SBHRootSidebarController sidebarVisualConfiguration](self, "sidebarVisualConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = objc_alloc_init(SBHSidebarVisualConfiguration);
  v15 = v5;

  v6 = -[SBHRootSidebarController layoutInsetsIgnoredEdges](self, "layoutInsetsIgnoredEdges");
  -[SBHSidebarVisualConfiguration insets](v15, "insets");
  v7 = SBHDirectionalEdgeInsetsByClearingEdges(v6);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[SBHRootSidebarController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDirectionalLayoutMargins:", v7, v9, v11, v13);

}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (SBHSidebarVisualConfiguration)sidebarVisualConfiguration
{
  return self->_sidebarVisualConfiguration;
}

- (unint64_t)layoutInsetsIgnoredEdges
{
  return self->_layoutInsetsIgnoredEdges;
}

- (SBHSidebarProviderDelegate)delegate
{
  return (SBHSidebarProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)avocadoViewController
{
  return self->_avocadoViewController;
}

- (NSMutableArray)widgetViewControllerConstraints
{
  return self->_widgetViewControllerConstraints;
}

- (void)setWidgetViewControllerConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_widgetViewControllerConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetViewControllerConstraints, 0);
  objc_storeStrong((id *)&self->_avocadoViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sidebarVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end
