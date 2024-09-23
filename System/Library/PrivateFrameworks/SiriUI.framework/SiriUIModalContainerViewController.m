@implementation SiriUIModalContainerViewController

- (SiriUIModalContainerViewController)initWithContentViewController:(id)a3
{
  id v5;
  SiriUIModalContainerViewController *v6;
  SiriUIModalContainerViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriUIModalContainerViewController;
  v6 = -[SiriUIModalContainerViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentViewController, a3);
    -[SiriUIModalContainerViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 4);
  }

  return v7;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SiriUIModalContainerViewController;
  -[SiriUIModalContainerViewController loadView](&v5, sel_loadView);
  -[SiriUIModalContainerViewController addChildViewController:](self, "addChildViewController:", self->_contentViewController);
  -[SiriUIModalContainerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self->_contentViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[UIViewController didMoveToParentViewController:](self->_contentViewController, "didMoveToParentViewController:", self);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SiriUIModalContainerViewController;
  -[SiriUIModalContainerViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  -[UIViewController view](self->_contentViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIModalContainerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriUIModalContainerViewController;
  -[SiriUIModalContainerViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  -[SiriUIModalContainerViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SiriUIModalContainerViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modalContainerViewControllerViewWillDisappear:", self);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriUIModalContainerViewController;
  -[SiriUIModalContainerViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  -[SiriUIModalContainerViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SiriUIModalContainerViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modalContainerViewControllerViewDidDisappear:", self);

  }
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_contentViewController;
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_contentViewController;
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return self->_contentViewController;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (SiriUIModalContainerViewControllerDelegate)delegate
{
  return (SiriUIModalContainerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
