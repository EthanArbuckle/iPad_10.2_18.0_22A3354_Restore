@implementation SKUIScrollingTabNavigationController

- (SKUIScrollingTabNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  SKUIScrollingTabNavigationController *v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIScrollingTabNavigationController initWithNibName:bundle:].cold.1();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIScrollingTabNavigationController;
  v8 = -[SUNavigationController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, v6, v7);
  if (v8)
    -[SKUIScrollingTabNavigationController setNavigationBarClass:](v8, "setNavigationBarClass:", objc_opt_class());

  return v8;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v5;
  objc_super v6;
  _QWORD v7[4];
  SKUIScrollingTabNavigationController *v8;
  id v9;

  v4 = a3;
  v7[1] = 3221225472;
  v7[2] = __81__SKUIScrollingTabNavigationController_dismissViewControllerAnimated_completion___block_invoke;
  v7[3] = &unk_1E73A17D0;
  v8 = self;
  v9 = a4;
  v6.receiver = v8;
  v6.super_class = (Class)SKUIScrollingTabNavigationController;
  v7[0] = MEMORY[0x1E0C809B0];
  v5 = v9;
  -[SKUIScrollingTabNavigationController dismissViewControllerAnimated:completion:](&v6, sel_dismissViewControllerAnimated_completion_, v4, v7);

}

uint64_t __81__SKUIScrollingTabNavigationController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_observedNavigationStackDidChange");
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKUIScrollingTabNavigationController;
  -[SKUIScrollingTabNavigationController presentViewController:animated:completion:](&v6, sel_presentViewController_animated_completion_, a3, a4, a5);
  -[SKUIScrollingTabNavigationController _observedNavigationStackDidChange](self, "_observedNavigationStackDidChange");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIScrollingTabNavigationController;
  -[SKUIScrollingTabNavigationController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[SKUIScrollingTabNavigationController _observedNavigationStackDidChange](self, "_observedNavigationStackDidChange");
}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUIScrollingTabNavigationController;
  -[SKUINavigationController didShowViewController:animated:](&v5, sel_didShowViewController_animated_, a3, a4);
  -[SKUIScrollingTabNavigationController _observedNavigationStackDidChange](self, "_observedNavigationStackDidChange");
}

- (double)_scrollViewBottomContentInsetForViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  objc_super v10;

  v4 = a3;
  -[UIViewController scrollingTabBarController](self, "scrollingTabBarController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "contentViewControllerBottomInsetAdjustment");
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SKUIScrollingTabNavigationController;
    -[SKUIScrollingTabNavigationController _scrollViewBottomContentInsetForViewController:](&v10, sel__scrollViewBottomContentInsetForViewController_, v4);
  }
  v8 = v7;

  return v8;
}

- (BOOL)isShowingNavigationStackRootContent
{
  void *v3;
  unint64_t v4;
  void *v5;
  BOOL v6;

  -[SKUIScrollingTabNavigationController viewControllers](self, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 > 1)
    return 0;
  -[SKUIScrollingTabNavigationController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == 0;

  return v6;
}

- (void)popToNavigationStackRootContentAnimated:(BOOL)a3 withBehavior:(int64_t)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  id v9;
  SKUIScrollingTabNavigationController *v10;
  _BOOL8 v11;
  _QWORD *v12;
  SKUIScrollingTabNavigationController *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[5];

  v5 = a3;
  -[SKUIScrollingTabNavigationController presentedViewController](self, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v10 = self;
    v11 = v5;
    goto LABEL_13;
  }
  if (a4 == 1)
  {
    if (v5)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __93__SKUIScrollingTabNavigationController_popToNavigationStackRootContentAnimated_withBehavior___block_invoke;
      v16[3] = &unk_1E739FD38;
      v16[4] = self;
      v12 = v16;
      v13 = self;
      v14 = 1;
LABEL_11:
      -[SKUIScrollingTabNavigationController dismissViewControllerAnimated:completion:](v13, "dismissViewControllerAnimated:completion:", v14, v12);
      goto LABEL_14;
    }
    -[SKUIScrollingTabNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
    v10 = self;
    v11 = 0;
LABEL_13:
    v15 = -[SKUINavigationController popToRootViewControllerAnimated:](v10, "popToRootViewControllerAnimated:", v11);
    goto LABEL_14;
  }
  if (a4)
    goto LABEL_14;
  if (!objc_msgSend(v7, "conformsToProtocol:", &unk_1EF4AAE30))
  {
    v13 = self;
    v14 = v5;
    v12 = 0;
    goto LABEL_11;
  }
  v9 = v8;
  if ((objc_msgSend(v9, "isShowingNavigationStackRootContent") & 1) != 0)
    -[SKUIScrollingTabNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v5, 0);
  else
    objc_msgSend(v9, "popToNavigationStackRootContentAnimated:withBehavior:", v5, 0);

LABEL_14:
}

id __93__SKUIScrollingTabNavigationController_popToNavigationStackRootContentAnimated_withBehavior___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "popToRootViewControllerAnimated:", 1);
}

- (void)scrollingTabBarBottomInsetAdjustmentDidChange
{
  void *v3;
  id v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SKUIScrollingTabNavigationController topViewController](self, "topViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIScrollingTabNavigationController _computeAndApplyScrollContentInsetDeltaForViewController:](self, "_computeAndApplyScrollContentInsetDeltaForViewController:", v3);

  }
  if (-[SKUIScrollingTabNavigationController isViewLoaded](self, "isViewLoaded"))
  {
    -[SKUIScrollingTabNavigationController view](self, "view");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

  }
}

- (void)_observedNavigationStackDidChange
{
  id v3;

  -[SKUIScrollingTabNavigationController navigationStackObserver](self, "navigationStackObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "observedNavigationStackDidChange:", self);

}

- (SKUINavigationStackObserver)navigationStackObserver
{
  return (SKUINavigationStackObserver *)objc_loadWeakRetained((id *)&self->_navigationStackObserver);
}

- (void)setNavigationStackObserver:(id)a3
{
  objc_storeWeak((id *)&self->_navigationStackObserver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationStackObserver);
}

- (void)initWithNibName:bundle:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIScrollingTabNavigationController initWithNibName:bundle:]";
}

@end
