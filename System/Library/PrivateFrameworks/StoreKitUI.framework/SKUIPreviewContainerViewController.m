@implementation SKUIPreviewContainerViewController

- (void)setChildViewController:(id)a3
{
  UIViewController *childViewController;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  childViewController = self->_childViewController;
  if (childViewController)
  {
    -[UIViewController removeFromParentViewController](childViewController, "removeFromParentViewController");
    -[UIViewController view](self->_childViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[SKUIPreviewContainerViewController _setExistingNavigationItem:](self, "_setExistingNavigationItem:", 0);
  }
  objc_storeStrong((id *)&self->_childViewController, a3);
  v7 = v12;
  if (v12)
  {
    -[SKUIPreviewContainerViewController addChildViewController:](self, "addChildViewController:", v12);
    objc_msgSend(v12, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAutoresizingMask:", 18);

    -[SKUIPreviewContainerViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

    objc_msgSend(v12, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIPreviewContainerViewController _setExistingNavigationItem:](self, "_setExistingNavigationItem:", v11);

    v7 = v12;
  }

}

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childViewController, 0);
}

@end
