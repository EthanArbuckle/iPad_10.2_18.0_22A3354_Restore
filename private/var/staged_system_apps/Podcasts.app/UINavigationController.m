@implementation UINavigationController

- (void)mt_popToRootViewController
{
  id v2;

  v2 = -[UINavigationController popToRootViewControllerAnimated:](self, "popToRootViewControllerAnimated:", 0);
}

- (void)mt_popToRootViewControllerAnimated:(BOOL)a3
{
  id v3;

  v3 = -[UINavigationController popToRootViewControllerAnimated:](self, "popToRootViewControllerAnimated:", a3);
}

- (void)mt_popToRootViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  void (**v8)(void);

  if (a3)
  {
    v5 = a4;
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v5);

    v6 = -[UINavigationController popToRootViewControllerAnimated:](self, "popToRootViewControllerAnimated:", 1);
    +[CATransaction commit](CATransaction, "commit");
  }
  else
  {
    v8 = (void (**)(void))a4;
    v7 = -[UINavigationController popToRootViewControllerAnimated:](self, "popToRootViewControllerAnimated:", 0);
    v8[2]();

  }
}

- (void)mt_hideNavigationBarOnFirstScreen
{
  void *v3;
  _BOOL8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController viewControllers](self, "viewControllers"));
  v4 = (unint64_t)objc_msgSend(v3, "count") < 2;

  -[UINavigationController setNavigationBarHidden:](self, "setNavigationBarHidden:", v4);
}

@end
