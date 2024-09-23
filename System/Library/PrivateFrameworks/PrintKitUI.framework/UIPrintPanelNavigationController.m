@implementation UIPrintPanelNavigationController

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (void)_presentationControllerDidDismiss:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  objc_msgSend(WeakRetained, "printNavigationConrollerDidDismiss");

}

- (UIPrintPanelNavigationController)initWithPrintOptionsTableViewController:(id)a3 rootViewController:(id)a4
{
  id v6;
  UIPrintPanelNavigationController *v7;
  UIPrintPanelNavigationController *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIPrintPanelNavigationController;
  v7 = -[UIPrintPanelNavigationController initWithRootViewController:](&v10, sel_initWithRootViewController_, a4);
  v8 = v7;
  if (v7)
    -[UIPrintPanelNavigationController setPrintOptionsTableViewController:](v7, "setPrintOptionsTableViewController:", v6);

  return v8;
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = a3;
  -[UIPrintPanelNavigationController topViewController](self, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPanelNavigationController printOptionsTableViewController](self, "printOptionsTableViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIPrintPanelNavigationController;
    -[UIPrintPanelNavigationController popViewControllerAnimated:](&v9, sel_popViewControllerAnimated_, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a4;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[UIPrintPanelNavigationController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endEditing:", 1);

  }
  v9.receiver = self;
  v9.super_class = (Class)UIPrintPanelNavigationController;
  -[UIPrintPanelNavigationController pushViewController:animated:](&v9, sel_pushViewController_animated_, v6, v4);

}

- (UIPrintPanelAppearanceDelegate)appearanceDelegate
{
  return (UIPrintPanelAppearanceDelegate *)objc_loadWeakRetained((id *)&self->_appearanceDelegate);
}

- (void)setAppearanceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_appearanceDelegate, a3);
}

- (UIPrintOptionsTableViewController)printOptionsTableViewController
{
  return (UIPrintOptionsTableViewController *)objc_loadWeakRetained((id *)&self->_printOptionsTableViewController);
}

- (void)setPrintOptionsTableViewController:(id)a3
{
  objc_storeWeak((id *)&self->_printOptionsTableViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_printOptionsTableViewController);
  objc_destroyWeak((id *)&self->_appearanceDelegate);
}

@end
