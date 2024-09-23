@implementation SKUITabBarController

- (SKUITabBarController)init
{
  SKUITabBarController *v3;
  SKUITabBarController *v4;
  void *v5;
  objc_super v7;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUITabBarController init].cold.1();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUITabBarController;
  v3 = -[SKUITabBarController init](&v7, sel_init);
  v4 = v3;
  if (v3)
  {
    -[SKUITabBarController tabBar](v3, "tabBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSemanticContentAttribute:", storeSemanticContentAttribute());

  }
  return v4;
}

- (BOOL)containsTransientViewControllerOnly
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[SKUITabBarController transientViewController](self, "transientViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SKUITabBarController viewControllers](self, "viewControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count") == 1)
    {
      -[SKUITabBarController viewControllers](self, "viewControllers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 == v3;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setFloatingOverlayViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  UIViewController *v7;
  UIViewController *v8;
  UIViewController **p_floatingOverlayViewController;
  UIViewController *floatingOverlayViewController;
  SKUIFloatingOverlayView *floatingOverlayView;
  void *v12;
  SKUIFloatingOverlayView *v13;
  SKUIFloatingOverlayView *v14;
  SKUIFloatingOverlayView *v15;
  void *v16;
  void *v17;
  SKUIFloatingOverlayView *v18;
  void *v19;
  void *v20;
  SKUIFloatingOverlayView *v21;
  SKUIFloatingOverlayView *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[4];
  SKUIFloatingOverlayView *v30;
  _QWORD v31[4];
  SKUIFloatingOverlayView *v32;

  v4 = a4;
  v7 = (UIViewController *)a3;
  v8 = v7;
  p_floatingOverlayViewController = &self->_floatingOverlayViewController;
  floatingOverlayViewController = self->_floatingOverlayViewController;
  if (floatingOverlayViewController != v7)
  {
    if (v7 && floatingOverlayViewController)
    {
      objc_storeStrong((id *)&self->_floatingOverlayViewController, a3);
      floatingOverlayView = self->_floatingOverlayView;
      -[UIViewController view](*p_floatingOverlayViewController, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIFloatingOverlayView setContentView:](floatingOverlayView, "setContentView:", v12);

      -[SKUITabBarController _layoutFloatingOverlayView](self, "_layoutFloatingOverlayView");
    }
    else if (v7)
    {
      objc_storeStrong((id *)&self->_floatingOverlayViewController, a3);
      v13 = objc_alloc_init(SKUIFloatingOverlayView);
      v14 = self->_floatingOverlayView;
      self->_floatingOverlayView = v13;

      -[SKUIFloatingOverlayView setContentInset:](self->_floatingOverlayView, "setContentInset:", 6.0, 0.0, 6.0, 0.0);
      v15 = self->_floatingOverlayView;
      -[UIViewController view](*p_floatingOverlayViewController, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIFloatingOverlayView setContentView:](v15, "setContentView:", v16);

      -[SKUITabBarController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addSubview:", self->_floatingOverlayView);

      -[SKUITabBarController _layoutFloatingOverlayView](self, "_layoutFloatingOverlayView");
      if (v4)
      {
        -[SKUIFloatingOverlayView setAlpha:](self->_floatingOverlayView, "setAlpha:", 0.0);
        v18 = self->_floatingOverlayView;
        objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "colorWithAlphaComponent:", 0.8);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIFloatingOverlayView setBackgroundColor:](v18, "setBackgroundColor:", v20);

        v27[4] = self;
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __66__SKUITabBarController_setFloatingOverlayViewController_animated___block_invoke_3;
        v28[3] = &unk_1E739FD38;
        v28[4] = self;
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __66__SKUITabBarController_setFloatingOverlayViewController_animated___block_invoke_4;
        v27[3] = &unk_1E73A0108;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v28, v27, 0.3);
      }
    }
    else
    {
      *p_floatingOverlayViewController = 0;

      v21 = self->_floatingOverlayView;
      v22 = self->_floatingOverlayView;
      self->_floatingOverlayView = 0;

      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "colorWithAlphaComponent:", 0.8);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIFloatingOverlayView setBackgroundColor:](v21, "setBackgroundColor:", v24);

        v25 = (void *)MEMORY[0x1E0DC3F10];
        v26 = MEMORY[0x1E0C809B0];
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __66__SKUITabBarController_setFloatingOverlayViewController_animated___block_invoke;
        v31[3] = &unk_1E739FD38;
        v32 = v21;
        v29[0] = v26;
        v29[1] = 3221225472;
        v29[2] = __66__SKUITabBarController_setFloatingOverlayViewController_animated___block_invoke_2;
        v29[3] = &unk_1E73A0108;
        v30 = v32;
        objc_msgSend(v25, "animateWithDuration:animations:completion:", v31, v29, 0.3);

      }
      else
      {
        -[SKUIFloatingOverlayView removeFromSuperview](v21, "removeFromSuperview");
      }

    }
  }

}

uint64_t __66__SKUITabBarController_setFloatingOverlayViewController_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __66__SKUITabBarController_setFloatingOverlayViewController_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __66__SKUITabBarController_setFloatingOverlayViewController_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1208), "setAlpha:", 1.0);
}

void __66__SKUITabBarController_setFloatingOverlayViewController_animated___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 1208);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBackgroundColor:", v2);

}

- (void)cancelTransientViewController:(id)a3
{
  -[SKUITabBarController setTransientViewController:animated:](self, "setTransientViewController:animated:", 0, 0);
}

+ (Class)_moreNavigationControllerClass
{
  return (Class)objc_opt_class();
}

- (id)moreNavigationController
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKUITabBarController;
  -[SKUITabBarController moreNavigationController](&v8, sel_moreNavigationController);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStoreKitDelegate:", self);
  v4 = storeSemanticContentAttribute();
  objc_msgSend(v3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSemanticContentAttribute:", v4);

  objc_msgSend(v3, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSemanticContentAttribute:", v4);

  return v3;
}

- (void)_setSelectedViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[SKUITabBarController selectedViewController](self, "selectedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)SKUITabBarController;
  -[SKUITabBarController _setSelectedViewController:](&v8, sel__setSelectedViewController_, v4);

  -[SKUITabBarController selectedViewController](self, "selectedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    -[SKUITabBarController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[SKUITabBarController sizeTransitionInProgress](self, "sizeTransitionInProgress")
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "tabBarController:didReselectViewController:", self, v5);
    }

  }
}

- (void)setTransientViewController:(id)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUITabBarController;
  -[SKUITabBarController setTransientViewController:animated:](&v4, sel_setTransientViewController_animated_, a3, 0);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  if (self->_floatingOverlayView)
    -[SKUITabBarController _layoutFloatingOverlayView](self, "_layoutFloatingOverlayView");
  v3.receiver = self;
  v3.super_class = (Class)SKUITabBarController;
  -[SKUITabBarController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[SKUITabBarController setSizeTransitionInProgress:](self, "setSizeTransitionInProgress:", 1);
  -[SKUITabBarController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "tabBarController:willTransitionToSize:withTransitionCoordinator:", self, v7, width, height);
  v9.receiver = self;
  v9.super_class = (Class)SKUITabBarController;
  -[SKUITabBarController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[SKUITabBarController setSizeTransitionInProgress:](self, "setSizeTransitionInProgress:", 0);

}

- (id)traitCollection
{
  void *v3;
  void *v4;
  double Width;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v12;
  _QWORD v13[3];
  CGRect v14;

  v13[2] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)SKUITabBarController;
  -[SKUITabBarController traitCollection](&v12, sel_traitCollection);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUITabBarController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  Width = CGRectGetWidth(v14);
  v6 = SKUICompactThreshold();

  if (Width <= v6)
  {
    v10 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithHorizontalSizeClass:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0DC3E88];
    v13[0] = v3;
    v13[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "traitCollectionWithTraitsFromCollections:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (void)moreNavigationController:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  void *v5;
  id v6;

  -[SKUITabBarController delegate](self, "delegate", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SKUITabBarController selectedViewController](self, "selectedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tabBarController:didSelectViewController:", self, v5);

  }
}

- (void)_layoutFloatingOverlayView
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double Width;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  id v29;
  CGRect v30;
  CGRect v31;

  -[SKUITabBarController view](self, "view");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SKUIFloatingOverlayView sizeThatFits:](self->_floatingOverlayView, "sizeThatFits:", 320.0, 1.79769313e308);
  v12 = v11;
  v14 = v13;
  v30.origin.x = v4;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  Width = CGRectGetWidth(v30);
  SKUITabBarControllerGetActiveNavigationController(self);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "navigationBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "bounds");
    objc_msgSend(v18, "convertRect:toView:", v29);
    v20 = v19;
    v22 = v21;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "defaultSizeForOrientation:", objc_msgSend(v23, "statusBarOrientation"));
    v25 = v24;
    v27 = v26;

    v31.origin.x = v20;
    v31.origin.y = v22;
    v31.size.width = v25;
    v31.size.height = v27;
    v28 = CGRectGetMaxY(v31) + 15.0;
  }
  else
  {
    v28 = 35.0;
  }
  -[SKUIFloatingOverlayView setFrame:](self->_floatingOverlayView, "setFrame:", Width - v12 + -15.0, v28, v12, v14);
  objc_msgSend(v29, "bringSubviewToFront:", self->_floatingOverlayView);

}

- (id)floatingOverlayViewController
{
  return self->_floatingOverlayViewController;
}

- (int64_t)forcedUserInterfaceStyle
{
  return self->_forcedUserInterfaceStyle;
}

- (void)setForcedUserInterfaceStyle:(int64_t)a3
{
  self->_forcedUserInterfaceStyle = a3;
}

- (BOOL)sizeTransitionInProgress
{
  return self->_sizeTransitionInProgress;
}

- (void)setSizeTransitionInProgress:(BOOL)a3
{
  self->_sizeTransitionInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingOverlayViewController, 0);
  objc_storeStrong((id *)&self->_floatingOverlayView, 0);
}

- (void)init
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUITabBarController init]";
}

@end
