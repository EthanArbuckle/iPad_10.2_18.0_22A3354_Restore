@implementation SSScreenshotsWindowRootViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (UIViewController)managedViewController
{
  return self->_managedViewController;
}

- (SSScreenshotsWindowRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SSScreenshotsWindowRootViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSScreenshotsWindowRootViewController;
  v4 = -[SSScreenshotsWindowRootViewController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, a3, a4);
  -[SSScreenshotsWindowRootViewController _setIgnoreAppSupportedOrientations:](v4, "_setIgnoreAppSupportedOrientations:", 1);
  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSScreenshotsWindowRootViewController;
  -[SSScreenshotsWindowRootViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[SSScreenshotsWindowRootViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  a3->var6 = 0;
}

- (void)setManagedViewController:(id)a3
{
  UIViewController **p_managedViewController;
  void *v6;
  UIViewController *managedViewController;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  p_managedViewController = &self->_managedViewController;
  -[UIViewController willMoveToParentViewController:](self->_managedViewController, "willMoveToParentViewController:", 0);
  -[UIViewController view](self->_managedViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[UIViewController removeFromParentViewController](self->_managedViewController, "removeFromParentViewController");
  managedViewController = self->_managedViewController;
  self->_managedViewController = 0;

  objc_storeStrong((id *)&self->_managedViewController, a3);
  if (self->_managedViewController)
  {
    -[SSScreenshotsWindowRootViewController addChildViewController:](self, "addChildViewController:");
    -[SSScreenshotsWindowRootViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](*p_managedViewController, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    -[UIViewController didMoveToParentViewController:](*p_managedViewController, "didMoveToParentViewController:", self);
    -[UIViewController view](*p_managedViewController, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSScreenshotsWindowRootViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    objc_msgSend(v10, "setFrame:");

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedViewController, 0);
}

@end
