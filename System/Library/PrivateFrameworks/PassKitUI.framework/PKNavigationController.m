@implementation PKNavigationController

- (PKNavigationController)init
{
  PKNavigationController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKNavigationController;
  v2 = -[PKNavigationController initWithNibName:bundle:](&v4, sel_initWithNibName_bundle_, 0, 0);
  if (v2)
  {
    -[PKNavigationController setNavigationBarClass:](v2, "setNavigationBarClass:", objc_opt_class());
    -[PKNavigationController setDelegate:](v2, "setDelegate:", v2);
  }
  return v2;
}

- (PKNavigationController)initWithRootViewController:(id)a3
{
  id v4;
  PKNavigationController *v5;
  PKNavigationController *v6;

  v4 = a3;
  v5 = -[PKNavigationController init](self, "init");
  v6 = v5;
  if (v5)
    -[PKNavigationController pushViewController:animated:](v5, "pushViewController:animated:", v4, 0);

  return v6;
}

- (PKNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{

  return 0;
}

- (PKNavigationController)initWithCoder:(id)a3
{

  return 0;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKNavigationController;
  -[PKNavigationController dealloc](&v2, sel_dealloc);
}

- (BOOL)_canShowWhileLocked
{
  return -[PKNavigationController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class());
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKNavigationController;
  -[PKNavigationController viewDidLoad](&v5, sel_viewDidLoad);
  if (self->_backgroundView)
  {
    -[PKNavigationController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "insertSubview:atIndex:", self->_backgroundView, 0);

  }
  -[PKNavigationController topViewController](self, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKNavigationController _updateBarAppearanceForViewController:animated:](self, "_updateBarAppearanceForViewController:animated:", v4, 0);

}

- (void)viewWillLayoutSubviews
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKNavigationController;
  -[PKNavigationController viewWillLayoutSubviews](&v12, sel_viewWillLayoutSubviews);
  -[PKNavigationController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  -[UIView bounds](self->_backgroundView, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIVisualEffectView setFrame:](self->_blurView, "setFrame:");
  -[UIImageView setFrame:](self->_wallpaperView, "setFrame:", v5, v7, v9, v11);

}

- (int64_t)preferredStatusBarStyle
{
  objc_super v3;

  if (self->_hasStatusBarStyleOverride)
    return self->_statusBarStyleOverride;
  v3.receiver = self;
  v3.super_class = (Class)PKNavigationController;
  return -[PKNavigationController preferredStatusBarStyle](&v3, sel_preferredStatusBarStyle);
}

- (void)_updateBarAppearanceForViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  char v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a4;
  v14 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(v14, "pkui_navigationStatusBarStyleDescriptor");
    v8 = v7;
    v9 = v6 & 1;
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = objc_msgSend(v14, "pkui_navigationBarHidden");
  else
    v10 = 0;
  if (v8 > 3 || v8 == 2 || !v9)
  {
    if (!self->_hasStatusBarStyleOverride)
      goto LABEL_22;
    self->_hasStatusBarStyleOverride = 0;
LABEL_15:
    if (v8 == 3)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v8 != 1)
      {
        v12 = 0;
        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v11;
LABEL_21:
    -[PKNavigationController navigationBar](self, "navigationBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTintColor:", v12);

    -[PKNavigationController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
    goto LABEL_22;
  }
  if (!self->_hasStatusBarStyleOverride || self->_statusBarStyleOverride != v8)
  {
    self->_hasStatusBarStyleOverride = 1;
    self->_statusBarStyleOverride = v8;
    goto LABEL_15;
  }
LABEL_22:
  if ((_DWORD)v10 != -[PKNavigationController isNavigationBarHidden](self, "isNavigationBarHidden"))
    -[PKNavigationController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", v10, v4);

}

- (void)promptAppStoreReviewForTrigger:(unint64_t)a3
{
  PKStoreKitReviewPromptHelper *v5;
  PKStoreKitReviewPromptHelper *reviewPromptHelper;
  void *v7;
  void *v8;
  id v9;

  if (!self->_reviewPromptHelper)
  {
    v5 = objc_alloc_init(PKStoreKitReviewPromptHelper);
    reviewPromptHelper = self->_reviewPromptHelper;
    self->_reviewPromptHelper = v5;

  }
  -[PKNavigationController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowScene");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PKStoreKitReviewPromptHelper requestReviewInSceneIfEligible:trigger:](self->_reviewPromptHelper, "requestReviewInSceneIfEligible:trigger:", v9, a3);
}

- (void)setupBackgroundViewWithBlurEffect:(int64_t)a3
{
  UIView *v5;
  UIView *backgroundView;
  id v7;
  void *v8;
  UIVisualEffectView *v9;
  UIVisualEffectView *blurView;
  void *v11;
  id v12;

  if (!self->_backgroundView && !self->_blurView)
  {
    -[PKNavigationController _setBuiltinTransitionStyle:](self, "_setBuiltinTransitionStyle:", 1);
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    backgroundView = self->_backgroundView;
    self->_backgroundView = v5;

    v7 = objc_alloc(MEMORY[0x1E0DC3F58]);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (UIVisualEffectView *)objc_msgSend(v7, "initWithEffect:", v8);
    blurView = self->_blurView;
    self->_blurView = v9;

    -[UIView addSubview:](self->_backgroundView, "addSubview:", self->_blurView);
    -[PKNavigationController viewIfLoaded](self, "viewIfLoaded");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = v11;
      objc_msgSend(v11, "insertSubview:atIndex:", self->_backgroundView, 0);
      objc_msgSend(v12, "setNeedsLayout");
      v11 = v12;
    }

  }
}

- (void)setupWallpaper
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  if (!self->_wallpaperView)
  {
    -[PKNavigationController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", 0, 0.2);
    v3 = objc_alloc_init(MEMORY[0x1E0DAB078]);
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __40__PKNavigationController_setupWallpaper__block_invoke;
    v5[3] = &unk_1E3E6A3E0;
    v4 = v3;
    v6 = v4;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v4, "fetchThumbnailForVariant:completionHandler:", 1, v5);
    objc_destroyWeak(&v7);

    objc_destroyWeak(&location);
  }
}

void __40__PKNavigationController_setupWallpaper__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__PKNavigationController_setupWallpaper__block_invoke_2;
  v6[3] = &unk_1E3E61B68;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(&v8);
}

void __40__PKNavigationController_setupWallpaper__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    if (*(_QWORD *)(a1 + 32))
      objc_msgSend(WeakRetained, "_updateWithWallpaperImage:");
    objc_msgSend(v3, "_endDelayingPresentation");
    WeakRetained = v3;
  }

}

- (void)setNeedsNavigationBarUpdate
{
  void *v3;
  void *v4;

  -[PKNavigationController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[PKNavigationController _updateBarAppearanceForViewController:animated:](self, "_updateBarAppearanceForViewController:animated:", v3, 0);
    v3 = v4;
  }

}

- (void)setCustomFormSheetPresentationStyleForiPad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    -[PKNavigationController setModalPresentationStyle:](self, "setModalPresentationStyle:", 16);
    -[PKNavigationController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMasksToBounds:", 1);

    -[PKNavigationController view](self, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", 6.0);

  }
}

- (void)setPageSheetPresentation
{
  -[PKNavigationController setModalPresentationStyle:](self, "setModalPresentationStyle:", 1);
  -[PKNavigationController setModalTransitionStyle:](self, "setModalTransitionStyle:", 0);
}

- (void)_updateWithWallpaperImage:(id)a3
{
  UIImageView *wallpaperView;
  id v5;
  objc_class *v6;
  id v7;
  UIImageView *v8;
  UIImageView *v9;
  id v10;

  wallpaperView = self->_wallpaperView;
  if (wallpaperView)
  {
    v5 = a3;
    -[UIImageView setImage:](wallpaperView, "setImage:", v5);

  }
  else
  {
    v6 = (objc_class *)MEMORY[0x1E0DC3890];
    v7 = a3;
    v8 = (UIImageView *)objc_msgSend([v6 alloc], "initWithImage:", v7);

    v9 = self->_wallpaperView;
    self->_wallpaperView = v8;

    -[UIView insertSubview:belowSubview:](self->_backgroundView, "insertSubview:belowSubview:", self->_wallpaperView, self->_blurView);
  }
  -[PKNavigationController view](self, "view");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsLayout");

}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  unint64_t explicitlyDefinedSupportedInterfaceOrientations;

  if (!self->_hasExplicitlyDefinedSupportedInterfaceOrientations)
  {
    self->_hasExplicitlyDefinedSupportedInterfaceOrientations = 1;
    self->_explicitlyDefinedSupportedInterfaceOrientations = a3;
    goto LABEL_5;
  }
  explicitlyDefinedSupportedInterfaceOrientations = self->_explicitlyDefinedSupportedInterfaceOrientations;
  self->_hasExplicitlyDefinedSupportedInterfaceOrientations = 1;
  self->_explicitlyDefinedSupportedInterfaceOrientations = a3;
  if (explicitlyDefinedSupportedInterfaceOrientations != a3)
LABEL_5:
    -[PKNavigationController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
}

- (unint64_t)supportedInterfaceOrientations
{
  objc_super v3;

  if (self->_hasExplicitlyDefinedSupportedInterfaceOrientations)
    return self->_explicitlyDefinedSupportedInterfaceOrientations;
  v3.receiver = self;
  v3.super_class = (Class)PKNavigationController;
  return -[PKNavigationController supportedInterfaceOrientations](&v3, sel_supportedInterfaceOrientations);
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  PKNavigationController *v14;
  PKNavigationController *v15;
  uint64_t v16;
  id *v17;
  id *v18;
  void *v19;
  unint64_t v20;
  _QWORD v21[4];
  PKNavigationController *v22;
  id v23;
  char v24;
  _QWORD v25[4];
  PKNavigationController *v26;
  id v27;
  BOOL v28;
  _QWORD v29[4];
  id v30;
  id v31;
  BOOL v32;
  id location;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "transitionCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v9, "transitionCoordinator");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  objc_msgSend(v13, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
  v14 = (PKNavigationController *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14 != self)
  {
    if (v13 && v14)
    {
      objc_initWeak(&location, self);
      if (v5)
      {
        v16 = MEMORY[0x1E0C809B0];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __79__PKNavigationController_navigationController_willShowViewController_animated___block_invoke;
        v29[3] = &unk_1E3E6A408;
        v17 = &v31;
        objc_copyWeak(&v31, &location);
        v30 = v9;
        v32 = v5;
        v25[0] = v16;
        v25[1] = 3221225472;
        v25[2] = __79__PKNavigationController_navigationController_willShowViewController_animated___block_invoke_2;
        v25[3] = &unk_1E3E6A408;
        objc_copyWeak(&v27, &location);
        v26 = v15;
        v28 = v5;
        objc_msgSend(v13, "animateAlongsideTransition:completion:", v29, v25);
        v18 = &v30;

        objc_destroyWeak(&v27);
      }
      else
      {
        -[PKNavigationController _updateBarAppearanceForViewController:animated:](self, "_updateBarAppearanceForViewController:animated:", v9, 0);
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __79__PKNavigationController_navigationController_willShowViewController_animated___block_invoke_3;
        v21[3] = &unk_1E3E6A408;
        v17 = &v23;
        objc_copyWeak(&v23, &location);
        v22 = v15;
        v24 = 0;
        objc_msgSend(v13, "notifyWhenInteractionChangesUsingBlock:", v21);
        v18 = (id *)&v22;
      }

      objc_destroyWeak(v17);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(v8, "interactivePopGestureRecognizer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "state");

      if (v20 <= 5 && ((1 << v20) & 0x31) != 0)
        -[PKNavigationController _updateBarAppearanceForViewController:animated:](self, "_updateBarAppearanceForViewController:animated:", v9, v5);
    }
  }

}

void __79__PKNavigationController_navigationController_willShowViewController_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateBarAppearanceForViewController:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

void __79__PKNavigationController_navigationController_willShowViewController_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  LODWORD(v3) = objc_msgSend(v4, "isCancelled");

  if ((_DWORD)v3)
    objc_msgSend(WeakRetained, "_updateBarAppearanceForViewController:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

void __79__PKNavigationController_navigationController_willShowViewController_animated___block_invoke_3(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  LODWORD(v3) = objc_msgSend(v4, "isCancelled");

  if ((_DWORD)v3)
    objc_msgSend(WeakRetained, "_updateBarAppearanceForViewController:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  char v12;

  v5 = a5;
  v7 = a4;
  v8 = v7;
  if (v5)
  {
    v9 = (void *)MEMORY[0x1E0DC3F10];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __78__PKNavigationController_navigationController_didShowViewController_animated___block_invoke;
    v10[3] = &unk_1E3E64908;
    v10[4] = self;
    v11 = v7;
    v12 = 1;
    objc_msgSend(v9, "animateWithDuration:delay:options:animations:completion:", 4, v10, 0, 0.25, 0.0);

  }
  else
  {
    -[PKNavigationController _updateBarAppearanceForViewController:animated:](self, "_updateBarAppearanceForViewController:animated:", v7, 0);
  }

}

uint64_t __78__PKNavigationController_navigationController_didShowViewController_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBarAppearanceForViewController:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reviewPromptHelper, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_wallpaperView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
