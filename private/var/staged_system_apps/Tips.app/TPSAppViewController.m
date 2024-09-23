@implementation TPSAppViewController

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v2, "userInterfaceIdiom"))
    v3 = 30;
  else
    v3 = 2;

  return v3;
}

- (TPSAppViewController)initWithAppController:(id)a3
{
  id v5;
  TPSAppViewController *v6;
  TPSAppViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSAppViewController;
  v6 = -[TPSViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_appController, a3);

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAppViewController;
  -[TPSAppViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  self->_viewWillAppear = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController viewCycleDelegate](self, "viewCycleDelegate"));
  objc_msgSend(v4, "appViewControllerViewWillAppear:", self);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TPSAppViewController;
  -[TPSAppViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  self->_viewDidAppeared = 1;
}

- (TPSAppViewControllerViewCycleDelegate)viewCycleDelegate
{
  return (TPSAppViewControllerViewCycleDelegate *)objc_loadWeakRetained((id *)&self->_viewCycleDelegate);
}

- (void)setViewCycleDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_viewCycleDelegate, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAppViewController;
  -[TPSAppViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  self->_viewWillAppear = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController viewCycleDelegate](self, "viewCycleDelegate"));
  objc_msgSend(v4, "appViewControllerViewWillDisappear:", self);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TPSAppViewController;
  -[TPSAppViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  self->_viewDidAppeared = 0;
}

- (BOOL)viewWillAppear
{
  return self->_viewWillAppear;
}

- (void)setViewWillAppear:(BOOL)a3
{
  self->_viewWillAppear = a3;
}

- (BOOL)viewDidAppeared
{
  return self->_viewDidAppeared;
}

- (void)setViewDidAppeared:(BOOL)a3
{
  self->_viewDidAppeared = a3;
}

- (TPSUIAppController)appController
{
  return self->_appController;
}

- (void)setAppController:(id)a3
{
  objc_storeStrong((id *)&self->_appController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appController, 0);
  objc_destroyWeak((id *)&self->_viewCycleDelegate);
}

@end
