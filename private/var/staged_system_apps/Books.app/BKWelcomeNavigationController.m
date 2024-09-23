@implementation BKWelcomeNavigationController

- (id)im_childViewControllerForTabBarVisibility
{
  return 0;
}

- (BOOL)im_tabBarVisible
{
  return 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKWelcomeNavigationController;
  -[BKWelcomeNavigationController viewDidAppear:](&v3, "viewDidAppear:", a3);
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeNavigationController topViewController](self, "topViewController"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeNavigationController topViewController](self, "topViewController"));
    v5 = (unint64_t)objc_msgSend(v4, "supportedInterfaceOrientations");

  }
  else
  {
    v5 = 30;
  }

  return v5;
}

- (BOOL)shouldAutorotate
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeNavigationController topViewController](self, "topViewController"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeNavigationController topViewController](self, "topViewController"));
    v5 = objc_msgSend(v4, "shouldAutorotate");

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BKWelcomeNavigationController;
    v5 = -[BKWelcomeNavigationController shouldAutorotate](&v7, "shouldAutorotate");
  }

  return v5;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeNavigationController topViewController](self, "topViewController"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeNavigationController topViewController](self, "topViewController"));
    v5 = objc_msgSend(v4, "preferredInterfaceOrientationForPresentation");

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BKWelcomeNavigationController;
    v5 = -[BKWelcomeNavigationController preferredInterfaceOrientationForPresentation](&v7, "preferredInterfaceOrientationForPresentation");
  }

  return (int64_t)v5;
}

- (BKWelcomeNavigationControllerDelegate)bkDelegate
{
  return (BKWelcomeNavigationControllerDelegate *)objc_loadWeakRetained((id *)&self->_bkDelegate);
}

- (void)setBkDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_bkDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bkDelegate);
}

@end
