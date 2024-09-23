@implementation SKUISimpleContainerViewController

- (void)setContentViewController:(id)a3
{
  UIViewController *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  UIViewController **p_contentViewController;
  UIViewController *contentViewController;
  void *v16;
  UIViewController *v17;
  void *v18;
  void *v19;

  v5 = (UIViewController *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v6)
        -[SKUISimpleContainerViewController setContentViewController:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  p_contentViewController = &self->_contentViewController;
  contentViewController = self->_contentViewController;
  if (contentViewController != v5)
  {
    if (-[UIViewController isViewLoaded](contentViewController, "isViewLoaded"))
    {
      -[UIViewController view](*p_contentViewController, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeFromSuperview");

    }
    -[UIViewController removeFromParentViewController](*p_contentViewController, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_contentViewController, a3);
    if (*p_contentViewController)
    {
      -[SKUISimpleContainerViewController addChildViewController:](self, "addChildViewController:");
      v17 = *p_contentViewController;
      -[SKUISimpleContainerViewController preferredContentSize](self, "preferredContentSize");
      -[UIViewController setPreferredContentSize:](v17, "setPreferredContentSize:");
      if (-[SKUISimpleContainerViewController isViewLoaded](self, "isViewLoaded"))
      {
        -[SKUISimpleContainerViewController view](self, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewController view](*p_contentViewController, "view");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setAutoresizingMask:", 18);
        objc_msgSend(v18, "bounds");
        objc_msgSend(v19, "setFrame:");
        objc_msgSend(v18, "addSubview:", v19);

      }
    }
  }

}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)loadView
{
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)SKUISimpleContainerViewController;
  -[SKUISimpleContainerViewController setPreferredContentSize:](&v6, sel_setPreferredContentSize_);
  -[UIViewController setPreferredContentSize:](self->_contentViewController, "setPreferredContentSize:", width, height);
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

- (void)setContentViewController:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
