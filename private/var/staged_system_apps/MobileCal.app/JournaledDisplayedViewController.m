@implementation JournaledDisplayedViewController

- (id)description
{
  id v3;
  void *v4;
  UIViewController *viewController;
  id WeakRetained;
  void *v7;
  id v8;
  objc_super v10;
  objc_super v11;

  if (self->_displayType)
  {
    v10.receiver = self;
    v10.super_class = (Class)JournaledDisplayedViewController;
    v3 = -[JournaledDisplayedViewController description](&v10, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    viewController = self->_viewController;
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ Recorded PRESENTATION of %@ by %@ "), v4, viewController, WeakRetained));

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)JournaledDisplayedViewController;
    v8 = -[JournaledDisplayedViewController description](&v11, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ Recorded PUSH of %@"), v4, self->_viewController));
  }

  return v7;
}

- (unint64_t)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(unint64_t)a3
{
  self->_displayType = a3;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
