@implementation SKUIBackdropContentViewController

- (SKUIBackdropContentViewController)initWithContentViewController:(id)a3
{
  id v4;
  SKUIBackdropContentViewController *v5;
  SKUIBackdropContentViewController *v6;
  objc_super v8;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIBackdropContentViewController initWithContentViewController:].cold.1();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUIBackdropContentViewController;
  v5 = -[SKUIBackdropContentViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    v5->_backdropViewPrivateStyle = 10060;
    -[SKUIBackdropContentViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 17);
    -[SKUIBackdropContentViewController setContentViewController:](v6, "setContentViewController:", v4);
  }

  return v6;
}

- (void)loadView
{
  void *v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKUIBackdropContentViewController;
  -[SKUIBackdropContentViewController loadView](&v6, sel_loadView);
  -[SKUIBackdropContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DC4028]);
  objc_msgSend(v3, "bounds");
  v5 = (void *)objc_msgSend(v4, "initWithFrame:privateStyle:", self->_backdropViewPrivateStyle);
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", v5);

}

- (void)setBackdropViewPrivateStyle:(int64_t)a3
{
  id v5;

  if (self->_backdropViewPrivateStyle != a3)
  {
    self->_backdropViewPrivateStyle = a3;
    if (-[SKUIBackdropContentViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SKUIBackdropContentViewController view](self, "view");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "transitionToPrivateStyle:", a3);

    }
  }
}

- (void)setContentViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_contentViewController;
  SKUIBackdropContentViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  UIViewController *v11;

  v5 = (UIViewController *)a3;
  p_contentViewController = &self->_contentViewController;
  if (self->_contentViewController != v5)
  {
    v11 = v5;
    -[UIViewController parentViewController](v5, "parentViewController");
    v7 = (SKUIBackdropContentViewController *)objc_claimAutoreleasedReturnValue();

    if (v7 == self)
    {
      -[UIViewController willMoveToParentViewController:](v11, "willMoveToParentViewController:", 0);
      -[UIViewController view](v11, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

      -[UIViewController removeFromParentViewController](v11, "removeFromParentViewController");
    }
    objc_storeStrong((id *)&self->_contentViewController, a3);
    v5 = v11;
    if (*p_contentViewController)
    {
      -[SKUIBackdropContentViewController addChildViewController:](self, "addChildViewController:");
      -[SKUIBackdropContentViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](*p_contentViewController, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      objc_msgSend(v10, "setFrame:");
      objc_msgSend(v10, "setAutoresizingMask:", 18);
      objc_msgSend(v9, "addSubview:", v10);
      -[UIViewController didMoveToParentViewController:](*p_contentViewController, "didMoveToParentViewController:", self);

      v5 = v11;
    }
  }

}

- (int64_t)backdropViewPrivateStyle
{
  return self->_backdropViewPrivateStyle;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

- (void)initWithContentViewController:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIBackdropContentViewController initWithContentViewController:]";
}

@end
