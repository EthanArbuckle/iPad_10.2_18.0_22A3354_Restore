@implementation SKUIMoreNavigationController

+ (Class)_moreListControllerClass
{
  return (Class)objc_opt_class();
}

- (id)displayedViewController
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  UINavigationController *displayedViewController;
  UINavigationController *v12;
  objc_super v14;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIMoreNavigationController displayedViewController].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  displayedViewController = self->_displayedViewController;
  if (displayedViewController)
  {
    v12 = displayedViewController;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SKUIMoreNavigationController;
    -[UIMoreNavigationController displayedViewController](&v14, sel_displayedViewController);
    v12 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (void)setDisplayedViewController:(id)a3
{
  UINavigationController *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  UINavigationController *v13;
  UINavigationController *displayedViewController;
  void *v15;
  uint64_t v16;
  UINavigationController *v17;
  UINavigationController *v18;
  objc_super v19;

  v4 = (UINavigationController *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIMoreNavigationController setDisplayedViewController:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIMoreNavigationController displayedViewController](self, "displayedViewController");
  v13 = (UINavigationController *)objc_claimAutoreleasedReturnValue();

  if (v13 != v4)
  {
    displayedViewController = self->_displayedViewController;
    self->_displayedViewController = 0;

    v4 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UINavigationController viewControllers](v4, "viewControllers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v16)
      {
LABEL_11:
        v19.receiver = self;
        v19.super_class = (Class)SKUIMoreNavigationController;
        -[UIMoreNavigationController setDisplayedViewController:](&v19, sel_setDisplayedViewController_, v4);
        goto LABEL_12;
      }
      v17 = 0;
      v18 = self->_displayedViewController;
      self->_displayedViewController = v4;
      v4 = v18;
    }
    else
    {
      v17 = v4;
    }

    v4 = v17;
    goto LABEL_11;
  }
LABEL_12:

}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  UINavigationController *displayedViewController;
  void *v17;
  UIViewController *firstActualViewController;
  UINavigationController *v19;
  objc_super v20;
  _QWORD v21[2];

  v4 = a4;
  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUIMoreNavigationController didShowViewController:animated:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  -[UIMoreNavigationController moreListController](self, "moreListController");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15 == v6)
  {
    if (self->_firstActualViewController)
    {
      displayedViewController = self->_displayedViewController;
      v21[0] = self->_firstActualViewController;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationController setViewControllers:animated:](displayedViewController, "setViewControllers:animated:", v17, 0);

      firstActualViewController = self->_firstActualViewController;
      self->_firstActualViewController = 0;

    }
    v19 = self->_displayedViewController;
    self->_displayedViewController = 0;

  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIMoreNavigationController;
  -[UIMoreNavigationController didShowViewController:animated:](&v20, sel_didShowViewController_animated_, v6, v4);

}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  UIViewController *v19;
  UIViewController *firstActualViewController;
  UIViewController *v21;
  objc_super v22;

  v4 = a4;
  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUIMoreNavigationController pushViewController:animated:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v15 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "viewControllers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (!v17)
    {
      -[SKUIMoreNavigationController setDisplayedViewController:](self, "setDisplayedViewController:", v15);
      goto LABEL_16;
    }
  }
  else
  {

  }
  if (!self->_firstActualViewController && self->_displayedViewController)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "viewControllers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v19 = (UIViewController *)objc_claimAutoreleasedReturnValue();
      firstActualViewController = self->_firstActualViewController;
      self->_firstActualViewController = v19;

    }
    else
    {
      v21 = (UIViewController *)v15;
      v18 = self->_firstActualViewController;
      self->_firstActualViewController = v21;
    }

  }
  v22.receiver = self;
  v22.super_class = (Class)SKUIMoreNavigationController;
  -[UIMoreNavigationController pushViewController:animated:](&v22, sel_pushViewController_animated_, v15, v4);
LABEL_16:

}

- (unint64_t)supportedInterfaceOrientations
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIMoreNavigationController supportedInterfaceOrientations].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUIMoreNavigationController topViewController](self, "topViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "supportedInterfaceOrientations");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "userInterfaceIdiom");

    if (v15 == 1)
    {
      v13 = 30;
    }
    else if (SKUIAllowsLandscapePhone())
    {
      v13 = 26;
    }
    else
    {
      v13 = 2;
    }
  }

  return v13;
}

- (SKUIMoreNavigationControllerDelegate)storeKitDelegate
{
  return (SKUIMoreNavigationControllerDelegate *)objc_loadWeakRetained((id *)&self->_storeKitDelegate);
}

- (void)setStoreKitDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_storeKitDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_storeKitDelegate);
  objc_storeStrong((id *)&self->_firstActualViewController, 0);
  objc_storeStrong((id *)&self->_displayedViewController, 0);
}

- (void)displayedViewController
{
  OUTLINED_FUNCTION_1();
}

- (void)setDisplayedViewController:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)didShowViewController:(uint64_t)a3 animated:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)pushViewController:(uint64_t)a3 animated:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)supportedInterfaceOrientations
{
  OUTLINED_FUNCTION_1();
}

@end
