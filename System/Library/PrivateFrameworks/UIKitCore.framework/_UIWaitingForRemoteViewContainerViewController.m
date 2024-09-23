@implementation _UIWaitingForRemoteViewContainerViewController

- (_UIWaitingForRemoteViewContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  _UIWaitingForRemoteViewContainerViewController *v4;
  UIActivityIndicatorView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIWaitingForRemoteViewContainerViewController;
  v4 = -[UIViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]([UIActivityIndicatorView alloc], "initWithActivityIndicatorStyle:", 100);
    -[_UIWaitingForRemoteViewContainerViewController setLoadingSpinner:](v4, "setLoadingSpinner:", v5);

    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](v4, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

    -[UIViewController view](v4, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIWaitingForRemoteViewContainerViewController loadingSpinner](v4, "loadingSpinner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    -[_UIWaitingForRemoteViewContainerViewController loadingSpinner](v4, "loadingSpinner");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startAnimating");

    -[UIViewController setPreferredContentSize:](v4, "setPreferredContentSize:", 0.0, 50.0);
  }
  return v4;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIWaitingForRemoteViewContainerViewController;
  -[UIViewController viewWillLayoutSubviews](&v8, sel_viewWillLayoutSubviews);
  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4 * 0.5;
  -[UIViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  -[UIView setCenter:](self->_loadingSpinner, "setCenter:", v5, v7 * 0.5);

}

- (void)stopSpinner
{
  id v2;

  -[_UIWaitingForRemoteViewContainerViewController loadingSpinner](self, "loadingSpinner");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopAnimating");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIActivityIndicatorView)loadingSpinner
{
  return self->_loadingSpinner;
}

- (void)setLoadingSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_loadingSpinner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingSpinner, 0);
}

@end
