@implementation PKWrapperViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PKWrapperViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[PKWrapperViewController initWithWrappedViewController:type:](self, "initWithWrappedViewController:type:", 0, 0);
}

- (PKWrapperViewController)initWithWrappedViewController:(id)a3 type:(int64_t)a4
{
  id v7;
  PKWrapperViewController *v8;
  PKWrapperViewController *v9;
  uint64_t v10;
  id *p_wrappedViewController;
  void *v12;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKWrapperViewController;
  v8 = -[PKWrapperViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    v8->_type = a4;
    v10 = -[PKWrapperViewController preferredUserInterfaceStyle](v8, "preferredUserInterfaceStyle");
    p_wrappedViewController = (id *)&v9->_wrappedViewController;
    objc_storeStrong((id *)&v9->_wrappedViewController, a3);
    if (v9->_wrappedViewController)
    {
      -[PKWrapperViewController addChildViewController:](v9, "addChildViewController:");
      objc_msgSend(*p_wrappedViewController, "didMoveToParentViewController:", v9);
      -[PKWrapperViewController setNeedsStatusBarAppearanceUpdate](v9, "setNeedsStatusBarAppearanceUpdate");
      if (v10 != -[PKWrapperViewController preferredUserInterfaceStyle](v9, "preferredUserInterfaceStyle"))
        -[PKWrapperViewController setNeedsUserInterfaceAppearanceUpdate](v9, "setNeedsUserInterfaceAppearanceUpdate");
      -[PKWrapperViewController setNeedsUpdateOfHomeIndicatorAutoHidden](v9, "setNeedsUpdateOfHomeIndicatorAutoHidden");
      -[PKWrapperViewController setNeedsUpdateOfScreenEdgesDeferringSystemGestures](v9, "setNeedsUpdateOfScreenEdgesDeferringSystemGestures");
      -[PKWrapperViewController setNeedsWhitePointAdaptivityStyleUpdate](v9, "setNeedsWhitePointAdaptivityStyleUpdate");
      objc_msgSend(*p_wrappedViewController, "navigationItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKWrapperViewController _setExistingNavigationItem:](v9, "_setExistingNavigationItem:", v12);

      -[PKWrapperViewController _updatePreferredContentSize](v9, "_updatePreferredContentSize");
    }
  }

  return v9;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKWrapperViewController;
  -[PKWrapperViewController loadView](&v7, sel_loadView);
  -[PKWrapperViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 0);
  -[UIViewController view](self->_wrappedViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!self->_type)
  {
    objc_msgSend(v4, "setAutoresizingMask:", 0);
    objc_msgSend(v5, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v6);

    objc_msgSend(v3, "setOpaque:", objc_msgSend(v5, "isOpaque"));
  }
  objc_msgSend(v3, "addSubview:", v5);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKWrapperViewController;
  -[PKWrapperViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  if (!self->_type)
  {
    -[UIViewController view](self->_wrappedViewController, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKWrapperViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    objc_msgSend(v3, "setFrame:");

  }
}

- (void)_updatePreferredContentSize
{
  -[UIViewController preferredContentSize](self->_wrappedViewController, "preferredContentSize");
  -[PKWrapperViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  UIViewController *v4;
  UIViewController *wrappedViewController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKWrapperViewController;
  v4 = (UIViewController *)a3;
  -[PKWrapperViewController preferredContentSizeDidChangeForChildContentContainer:](&v6, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  wrappedViewController = self->_wrappedViewController;

  if (wrappedViewController == v4)
    -[PKWrapperViewController _updatePreferredContentSize](self, "_updatePreferredContentSize", v6.receiver, v6.super_class);
}

- (unint64_t)edgesForExtendedLayout
{
  return -[UIViewController edgesForExtendedLayout](self->_wrappedViewController, "edgesForExtendedLayout");
}

- (BOOL)extendedLayoutIncludesOpaqueBars
{
  return -[UIViewController extendedLayoutIncludesOpaqueBars](self->_wrappedViewController, "extendedLayoutIncludesOpaqueBars");
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_wrappedViewController;
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_wrappedViewController;
}

- (int64_t)preferredUserInterfaceStyle
{
  objc_super v3;

  if (self->_wrappedViewController)
    return -[UIViewController preferredUserInterfaceStyle](self->_wrappedViewController, "preferredUserInterfaceStyle");
  v3.receiver = self;
  v3.super_class = (Class)PKWrapperViewController;
  return -[PKWrapperViewController preferredUserInterfaceStyle](&v3, sel_preferredUserInterfaceStyle);
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return self->_wrappedViewController;
}

- (id)childViewControllerForScreenEdgesDeferringSystemGestures
{
  return self->_wrappedViewController;
}

- (id)childViewControllerForWhitePointAdaptivityStyle
{
  return self->_wrappedViewController;
}

- (UIViewController)wrappedViewController
{
  return self->_wrappedViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedViewController, 0);
}

@end
