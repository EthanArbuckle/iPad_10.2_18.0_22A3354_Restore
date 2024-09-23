@implementation NCNotificationListSupplementaryHostingViewController

- (NCNotificationListSupplementaryHostingViewController)initWithHostedViewController:(id)a3 sectionIdentifier:(id)a4
{
  id v7;
  id v8;
  NCNotificationListSupplementaryHostingViewController *v9;
  NCNotificationListSupplementaryHostingViewController *v10;
  NSString *materialGroupNameBase;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NCNotificationListSupplementaryHostingViewController;
  v9 = -[NCNotificationListSupplementaryHostingViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    materialGroupNameBase = v9->_materialGroupNameBase;
    v9->_materialGroupNameBase = 0;

    objc_storeStrong((id *)&v10->_hostedViewController, a3);
    -[NCNotificationListSupplementaryHostingViewController addChildViewController:](v10, "addChildViewController:", v10->_hostedViewController);
    -[UIViewController didMoveToParentViewController:](v10->_hostedViewController, "didMoveToParentViewController:", v10);
    objc_storeStrong((id *)&v10->_sectionIdentifier, a4);
  }

  return v10;
}

- (NSString)debugDescription
{
  return (NSString *)-[NCNotificationListSupplementaryHostingViewController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[NCNotificationListSupplementaryHostingViewController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  NCNotificationListSupplementaryHostingViewController *v12;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __94__NCNotificationListSupplementaryHostingViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E8D1B3A0;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

void __94__NCNotificationListSupplementaryHostingViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:skipIfNil:", v3, CFSTR("configuration"), 1);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "hostedViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "appendObject:withName:", v7, CFSTR("hostedViewController"));

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[NCNotificationListSupplementaryHostingViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListSupplementaryHostingViewController configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v4, CFSTR("configuration"), 1);

  -[NCNotificationListSupplementaryHostingViewController hostedViewController](self, "hostedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("hostedViewController"));

  return v3;
}

- (void)setHostedViewControllerUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NCNotificationListSupplementaryHostingViewController _hostingView](self, "_hostingView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHostedViewUserInteractionEnabled:", v3);

}

- (BOOL)isHostedViewControllerUserInteractionEnabled
{
  void *v2;
  char v3;

  -[NCNotificationListSupplementaryHostingViewController _hostingView](self, "_hostingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHostedViewUserInteractionEnabled");

  return v3;
}

- (void)setConfiguration:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NCNotificationListSupplementaryViewConfiguration *v7;
  NCNotificationListSupplementaryViewConfiguration *configuration;
  void *v9;
  UIColor *materialTintColor;
  UIColor *v11;
  UIColor *textColor;
  UIColor *v13;
  UIColor *auxiliaryOptionsBackgroundColor;
  UIColor *v15;
  UIColor *v16;
  UIColor *v17;
  id *v18;
  UIColor *v19;
  NSString *v20;
  NSString *auxiliaryOptionsBackgroundCompositingFilter;
  void *v22;
  void *v23;
  void *v24;
  UIColor *v25;
  UIColor *v26;
  uint64_t v27;
  UIColor *v28;
  id WeakRetained;
  uint64_t v30;
  double v31;
  double v32;
  double v33;

  v4 = a4;
  v6 = a3;
  v7 = (NCNotificationListSupplementaryViewConfiguration *)objc_msgSend(v6, "copy");
  configuration = self->_configuration;
  self->_configuration = v7;

  objc_msgSend(v6, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NCNotificationListSupplementaryHostingViewController _useDefaultLookForColor:materialRecipe:containsUnmanagedContent:](self, "_useDefaultLookForColor:materialRecipe:containsUnmanagedContent:", v9, objc_msgSend(v6, "materialRecipe"), objc_msgSend(v6, "containsUnmanagedContent")))
  {
    materialTintColor = self->_materialTintColor;
    self->_materialTintColor = 0;

    -[NCNotificationListSupplementaryHostingViewController _defaultTextColor](self, "_defaultTextColor");
    v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
    textColor = self->_textColor;
    self->_textColor = v11;

    self->_materialRecipe = 1;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
    v13 = (UIColor *)objc_claimAutoreleasedReturnValue();
    auxiliaryOptionsBackgroundColor = self->_auxiliaryOptionsBackgroundColor;
    self->_auxiliaryOptionsBackgroundColor = v13;

    objc_storeStrong((id *)&self->_auxiliaryOptionsBackgroundCompositingFilter, (id)*MEMORY[0x1E0CD2E98]);
    goto LABEL_19;
  }
  self->_materialRecipe = -[NCNotificationListSupplementaryViewConfiguration materialRecipe](self->_configuration, "materialRecipe");
  objc_storeStrong((id *)&self->_materialTintColor, v9);
  v32 = 0.0;
  v33 = 0.0;
  v15 = self->_materialTintColor;
  if (!v15)
  {
    v33 = 0.0;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
    v19 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v17 = self->_auxiliaryOptionsBackgroundColor;
    self->_auxiliaryOptionsBackgroundColor = v19;
    v18 = (id *)MEMORY[0x1E0CD2E98];
    goto LABEL_9;
  }
  -[UIColor getWhite:alpha:](v15, "getWhite:alpha:", &v33, &v32);
  if (v33 > 0.2 || v32 > 0.4)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0);
  v16 = (UIColor *)objc_claimAutoreleasedReturnValue();
  v17 = self->_auxiliaryOptionsBackgroundColor;
  self->_auxiliaryOptionsBackgroundColor = v16;
  v18 = (id *)MEMORY[0x1E0CD2EA0];
LABEL_9:

  v20 = (NSString *)*v18;
  auxiliaryOptionsBackgroundCompositingFilter = self->_auxiliaryOptionsBackgroundCompositingFilter;
  self->_auxiliaryOptionsBackgroundCompositingFilter = v20;

  objc_msgSend(v6, "textColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListSupplementaryHostingViewController _sanitizedColorFromDeveloperProvidedColor:](self, "_sanitizedColorFromDeveloperProvidedColor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v25 = v23;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v25 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v26 = v25;

  v30 = 0;
  v31 = 0.0;
  -[UIColor getWhite:alpha:](v26, "getWhite:alpha:", &v31, &v30);
  if (vabdd_f64(v31, v33) < 0.25 && v32 > 0.5)
  {
    if (v33 < 0.5)
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor", v33, 0.5, v32);
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor", v33, 0.5, v32);
    v27 = objc_claimAutoreleasedReturnValue();

    v26 = (UIColor *)v27;
  }
  v28 = self->_textColor;
  self->_textColor = v26;

LABEL_19:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "supplementaryHostingViewControllerPreferredContentSizeChanged:", self);
  -[NCNotificationListSupplementaryHostingViewController _configureHostingViewAnimated:](self, "_configureHostingViewAnimated:", v4);

}

- (PLPlatterView)platterView
{
  void *v2;
  void *v3;

  -[NCNotificationListSupplementaryHostingViewController _hostingView](self, "_hostingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PLPlatterView *)v3;
}

- (void)setContentVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  UIViewController *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_contentVisible != a3)
  {
    v3 = a3;
    v5 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      -[NCNotificationListSupplementaryHostingViewController _logDescription](self, "_logDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v8;
      _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting content visible %{public}@", (uint8_t *)&v10, 0x16u);

    }
    self->_contentVisible = v3;
    v9 = self->_hostedViewController;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIViewController notificationListSupplementaryViewPresentableContentWillBecomeVisible:](v9, "notificationListSupplementaryViewPresentableContentWillBecomeVisible:", v3);

  }
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UIViewController preferredContentSize](self->_hostedViewController, "preferredContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3
{
  id WeakRetained;
  void *v5;
  char v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "supplementaryHostingViewControllerPreferredContentSizeChanged:", self);
      v5 = v7;
    }
  }

}

- (int64_t)overrideUserInterfaceStyle
{
  return -[UIViewController overrideUserInterfaceStyle](self->_hostedViewController, "overrideUserInterfaceStyle");
}

- (void)loadView
{
  void *v3;
  NCNotificationListSupplementaryHostingView *v4;

  v4 = objc_alloc_init(NCNotificationListSupplementaryHostingView);
  -[NCNotificationListSupplementaryHostingViewController setView:](self, "setView:", v4);
  -[NCNotificationListSupplementaryHostingView setDelegate:](v4, "setDelegate:", self);
  -[UIViewController view](self->_hostedViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListSupplementaryHostingView setHostedView:](v4, "setHostedView:", v3);

  -[NCNotificationListSupplementaryHostingViewController _configureHostingViewAnimated:](self, "_configureHostingViewAnimated:", 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)supplementaryHostingViewWasTapped:(id)a3
{
  id WeakRetained;
  void *v5;
  char v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "supplementaryHostingViewControllerWasTapped:", self);
      v5 = v7;
    }
  }

}

- (BOOL)adjustsFontForContentSizeCategory
{
  void *v2;
  char v3;

  -[NCNotificationListSupplementaryHostingViewController _hostingView](self, "_hostingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "adjustsFontForContentSizeCategory");

  return v3;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NCNotificationListSupplementaryHostingViewController _hostingView](self, "_hostingView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdjustsFontForContentSizeCategory:", v3);

}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v2;

  -[NCNotificationListSupplementaryHostingViewController _hostingView](self, "_hostingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "adjustForContentSizeCategoryChange");

  return 1;
}

- (void)setMaterialRecipe:(int64_t)a3
{
  id v4;

  self->_materialRecipe = a3;
  -[NCNotificationListSupplementaryHostingViewController _hostingView](self, "_hostingView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaterialRecipe:", self->_materialRecipe);

}

- (void)setMaterialTintColor:(id)a3
{
  UIColor **p_materialTintColor;
  id v6;
  id v7;

  p_materialTintColor = &self->_materialTintColor;
  objc_storeStrong((id *)&self->_materialTintColor, a3);
  v6 = a3;
  -[NCNotificationListSupplementaryHostingViewController _hostingView](self, "_hostingView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaterialTintColor:", *p_materialTintColor);

}

- (void)setMaterialGroupNameBase:(id)a3
{
  NSString **p_materialGroupNameBase;
  id v6;
  id v7;

  p_materialGroupNameBase = &self->_materialGroupNameBase;
  objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
  v6 = a3;
  -[NCNotificationListSupplementaryHostingViewController _hostingView](self, "_hostingView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaterialGroupNameBase:", *p_materialGroupNameBase);

}

- (void)configureStackDimmingForTransform:(CGAffineTransform *)a3
{
  void *v4;
  __int128 v5;
  _OWORD v6[3];

  -[NCNotificationListSupplementaryHostingViewController _hostingView](self, "_hostingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)&a3->c;
  v6[0] = *(_OWORD *)&a3->a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a3->tx;
  objc_msgSend(v4, "configureStackDimmingForTransform:", v6);

}

- (void)_configureHostingViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_configuration)
  {
    v3 = a3;
    -[NCNotificationListSupplementaryHostingViewController _hostingView](self, "_hostingView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMaterialRecipe:", self->_materialRecipe);
    objc_msgSend(v5, "setMaterialTintColor:", self->_materialTintColor);
    objc_msgSend(v5, "setMaterialGroupNameBase:", self->_materialGroupNameBase);
    objc_msgSend(v5, "setClipsToBounds:", -[NCNotificationListSupplementaryViewConfiguration containsUnmanagedContent](self->_configuration, "containsUnmanagedContent"));
    -[NCNotificationListSupplementaryHostingViewController _configureAuxiliaryViewAnimated:](self, "_configureAuxiliaryViewAnimated:", v3);

  }
}

- (void)_configureAuxiliaryViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  int v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  BOOL v16;
  id WeakRetained;
  void *v18;
  BOOL v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  char v25;
  BOOL v26;
  _QWORD v27[4];
  id v28;
  char v29;

  v3 = a3;
  -[NCNotificationListSupplementaryHostingViewController _hostingView](self, "_hostingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListSupplementaryViewConfiguration auxiliaryOptionActions](self->_configuration, "auxiliaryOptionActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = v6 != 0;

  objc_msgSend(v5, "auxiliaryOptionActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  v10 = v7 ^ v9;
  -[NCNotificationListSupplementaryViewConfiguration auxiliaryOptionActions](self->_configuration, "auxiliaryOptionActions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "auxiliaryOptionActions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v5;
  if (BSEqualArrays())
  {

  }
  else
  {
    -[NCNotificationListSupplementaryViewConfiguration auxiliaryOptionsSummaryText](self->_configuration, "auxiliaryOptionsSummaryText");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "auxiliaryOptionsSummaryText");
    v13 = v3;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = BSEqualStrings();

    v3 = v13;
    LOBYTE(v7) = v6 != 0;

    if (v10)
      v16 = v15 == 0;
    else
      v16 = 0;
    if (v16)
      goto LABEL_11;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "supplementaryHostingViewControllerPreferredContentSizeChanged:", self);

LABEL_11:
  if (((!v3 | v10) & 1) != 0)
  {
    -[NCNotificationListSupplementaryHostingViewController _showAuxiliaryOptionsView:](self, "_showAuxiliaryOptionsView:", v6 != 0);
    v18 = v22;
  }
  else
  {
    v19 = -[NCNotificationListSupplementaryViewConfiguration containsUnmanagedContent](self->_configuration, "containsUnmanagedContent");
    v18 = v22;
    objc_msgSend(v22, "setClipsToBounds:", 1);
    if (v6)
      -[NCNotificationListSupplementaryHostingViewController _showAuxiliaryOptionsView:](self, "_showAuxiliaryOptionsView:", 1);
    v20 = (void *)MEMORY[0x1E0DC3F10];
    v21 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __88__NCNotificationListSupplementaryHostingViewController__configureAuxiliaryViewAnimated___block_invoke;
    v27[3] = &unk_1E8D1E878;
    v28 = v22;
    v29 = v7;
    v23[0] = v21;
    v23[1] = 3221225472;
    v23[2] = __88__NCNotificationListSupplementaryHostingViewController__configureAuxiliaryViewAnimated___block_invoke_2;
    v23[3] = &unk_1E8D1F120;
    v25 = v7;
    v23[4] = self;
    v24 = v28;
    v26 = v19;
    objc_msgSend(v20, "animateWithDuration:animations:completion:", v27, v23, 0.25);

  }
}

uint64_t __88__NCNotificationListSupplementaryHostingViewController__configureAuxiliaryViewAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAuxiliaryOptionsVisible:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __88__NCNotificationListSupplementaryHostingViewController__configureAuxiliaryViewAnimated___block_invoke_2(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    if (!*(_BYTE *)(result + 48))
    {
      objc_msgSend(*(id *)(result + 32), "_showAuxiliaryOptionsView:", 0);
      return objc_msgSend(*(id *)(v2 + 40), "setClipsToBounds:", *(unsigned __int8 *)(v2 + 49));
    }
  }
  return result;
}

- (void)_showAuxiliaryOptionsView:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[NCNotificationListSupplementaryHostingViewController _hostingView](self, "_hostingView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListSupplementaryViewConfiguration auxiliaryOptionActions](self->_configuration, "auxiliaryOptionActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAuxiliaryOptionActions:", v5);

  -[NCNotificationListSupplementaryViewConfiguration auxiliaryOptionsSummaryText](self->_configuration, "auxiliaryOptionsSummaryText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAuxiliaryOptionsSummaryText:", v6);

  objc_msgSend(v7, "setAuxiliaryOptionsVisible:", v3);
  objc_msgSend(v7, "setAuxiliaryOptionsTextColor:", self->_textColor);
  objc_msgSend(v7, "setMaterialTintColor:", self->_materialTintColor);
  objc_msgSend(v7, "setAuxiliaryOptionsBackgroundColor:", self->_auxiliaryOptionsBackgroundColor);
  objc_msgSend(v7, "setAuxiliaryOptionsBackgroundCompositingFilter:", self->_auxiliaryOptionsBackgroundCompositingFilter);
  objc_msgSend(v7, "setMaterialRecipe:", self->_materialRecipe);
  objc_msgSend(v7, "setMaterialGroupNameBase:", self->_materialGroupNameBase);

}

- (BOOL)_useDefaultLookForColor:(id)a3 materialRecipe:(int64_t)a4 containsUnmanagedContent:(BOOL)a5
{
  void *v6;
  id v7;
  void *v8;
  char v9;
  BOOL v10;
  char v11;
  BOOL v12;

  if (!a5)
    return 0;
  v6 = (void *)MEMORY[0x1E0DC3658];
  v7 = a3;
  objc_msgSend(v6, "systemBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v7)
    v10 = 1;
  else
    v10 = (unint64_t)a4 >= 2;
  v11 = !v10;
  if ((v9 & 1) != 0)
    v12 = 1;
  else
    v12 = v11;

  return v12;
}

- (id)_sanitizedColorFromDeveloperProvidedColor:(id)a3
{
  void *v3;
  double v5;
  double v6;
  double v7;

  v3 = a3;
  if (a3)
  {
    v7 = 0.0;
    v5 = 0.0;
    v6 = 0.0;
    objc_msgSend(a3, "getRed:green:blue:alpha:", &v7, &v6, &v5, 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v7, v6, v5, 1.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_logDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;

  -[NCNotificationListSupplementaryHostingViewController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupingIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("<Group w/ No ID>");
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ (addr:%p) [%@: %@]"), v10, self, self->_sectionIdentifier, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_defaultTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (UIViewController)hostedViewController
{
  return self->_hostedViewController;
}

- (int64_t)materialRecipe
{
  return self->_materialRecipe;
}

- (UIColor)materialTintColor
{
  return self->_materialTintColor;
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (NCNotificationListSupplementaryViewConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NCNotificationListSupplementaryHostingViewControllerDelegate)delegate
{
  return (NCNotificationListSupplementaryHostingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (BOOL)isContentVisible
{
  return self->_contentVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_materialTintColor, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionsBackgroundCompositingFilter, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionsBackgroundColor, 0);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong((id *)&self->_hostedViewController, 0);
}

@end
