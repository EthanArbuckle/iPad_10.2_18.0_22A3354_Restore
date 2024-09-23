@implementation SKUIViewControllerContainerView

- (SKUIViewControllerContainerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIViewControllerContainerView *v8;
  SKUIViewControllerContainerView *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIViewControllerContainerView initWithFrame:].cold.1();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIViewControllerContainerView;
  v8 = -[SKUIViewControllerContainerView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
    -[SKUIViewControllerContainerView setPreservesSuperviewLayoutMargins:](v8, "setPreservesSuperviewLayoutMargins:", 1);
  return v9;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKUIViewControllerContainerView;
  -[SKUIViewControllerContainerView layoutSubviews](&v3, sel_layoutSubviews);
  -[SKUIViewControllerContainerView _updateLayoutOfViewControllerView](self, "_updateLayoutOfViewControllerView");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIViewControllerContainerView;
  -[SKUIViewControllerContainerView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SKUIViewControllerContainerView _updateLayoutOfViewControllerView](self, "_updateLayoutOfViewControllerView");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIViewControllerContainerView;
  -[SKUIViewControllerContainerView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SKUIViewControllerContainerView _updateLayoutOfViewControllerView](self, "_updateLayoutOfViewControllerView");
}

- (void)setViewController:(id)a3
{
  UIViewController *v5;
  UIViewController *viewController;
  UIViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  UIViewController *v11;

  v5 = (UIViewController *)a3;
  viewController = self->_viewController;
  v7 = v5;
  v11 = v5;
  if (viewController != v5)
  {
    if (viewController)
    {
      -[UIViewController view](viewController, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isDescendantOfView:", self))
        objc_msgSend(v8, "removeFromSuperview");

    }
    objc_storeStrong((id *)&self->_viewController, a3);
    v7 = self->_viewController;
  }
  if (v7)
  {
    -[UIViewController view](v7, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && (objc_msgSend(v9, "isDescendantOfView:", self) & 1) == 0)
    {
      objc_msgSend(v10, "removeFromSuperview");
      -[SKUIViewControllerContainerView addSubview:](self, "addSubview:", v10);
      -[SKUIViewControllerContainerView setNeedsLayout](self, "setNeedsLayout");
    }

  }
}

- (void)_updateLayoutOfViewControllerView
{
  id v3;

  -[UIViewController view](self->_viewController, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIViewControllerContainerView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIViewControllerContainerView initWithFrame:]";
}

@end
