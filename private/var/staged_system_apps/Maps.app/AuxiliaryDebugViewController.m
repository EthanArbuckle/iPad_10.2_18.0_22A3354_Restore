@implementation AuxiliaryDebugViewController

+ (id)navigationDestinationTitle
{
  return 0;
}

- (AuxiliaryDebugViewController)init
{
  AuxiliaryDebugViewController *v2;
  AuxiliaryDebugViewController *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AuxiliaryDebugViewController;
  v2 = -[AuxiliaryDebugViewController initWithStyle:](&v9, "initWithStyle:", 1);
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend((id)objc_opt_class(v2), "navigationDestinationTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    -[AuxiliaryDebugViewController setTitle:](v3, "setTitle:", v5);

    v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, v3, "_done");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AuxiliaryDebugViewController navigationItem](v3, "navigationItem"));
    objc_msgSend(v7, "setRightBarButtonItem:", v6);

  }
  return v3;
}

+ (BOOL)isSearchable
{
  return 0;
}

- (void)segueToViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AuxiliaryDebugViewController willNavigateToSubsequentController:](self, "willNavigateToSubsequentController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AuxiliaryDebugViewController navigationDelegate](self, "navigationDelegate"));

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[AuxiliaryDebugViewController navigationDelegate](self, "navigationDelegate"));
    objc_msgSend(v6, "debugViewController:segueToViewController:", self, v4);
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[AuxiliaryDebugViewController navigationController](self, "navigationController"));
    objc_msgSend(v6, "pushViewController:animated:", v4, 1);
  }

}

- (void)willNavigateToSubsequentController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[AuxiliaryDebugViewController delegate](self, "delegate"));
  objc_msgSend(v4, "setDelegate:", v5);

}

- (void)_done
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[AuxiliaryDebugViewController delegate](self, "delegate"));
  objc_msgSend(v3, "debugControllerDidFinish:", self);

}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)navigationDelegate
{
  return objc_loadWeakRetained((id *)&self->_navigationDelegate);
}

- (void)setNavigationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navigationDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
