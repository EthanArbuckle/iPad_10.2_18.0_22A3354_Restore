@implementation SVVideoAdViewControllerProvider

- (SVVideoAdViewControllerProvider)initWithViewControllerProvider:(id)a3
{
  id v4;
  SVVideoAdViewControllerProvider *v5;
  SVVideoAdViewControllerProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SVVideoAdViewControllerProvider;
  v5 = -[SVVideoAdViewControllerProvider init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_viewControllerProvider, v4);

  return v6;
}

- (UIViewController)viewControllerForModalPresentation
{
  void *v2;
  void *v3;

  -[SVVideoAdViewControllerProvider viewControllerProvider](self, "viewControllerProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllerForModalPresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v3;
}

- (SVVideoAdViewControllerProviding)viewControllerProvider
{
  return (SVVideoAdViewControllerProviding *)objc_loadWeakRetained((id *)&self->_viewControllerProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewControllerProvider);
}

@end
