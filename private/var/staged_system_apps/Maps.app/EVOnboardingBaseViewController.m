@implementation EVOnboardingBaseViewController

- (EVOnboardingBaseViewController)initWithDelegate:(id)a3
{
  id v4;
  EVOnboardingBaseViewController *v5;
  EVOnboardingBaseViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EVOnboardingBaseViewController;
  v5 = -[EVOnboardingBaseViewController init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)EVOnboardingBaseViewController;
  -[EVOnboardingBaseViewController viewDidLoad](&v12, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EVOnboardingBaseViewController obViewController](self, "obViewController"));
  -[EVOnboardingBaseViewController addChildViewController:](self, "addChildViewController:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EVOnboardingBaseViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  objc_msgSend(v4, "addSubview:", v5);

  objc_msgSend(v3, "didMoveToParentViewController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[EVOnboardingBaseViewController view](self, "view"));
  LODWORD(v9) = 1148846080;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_maps_constraintsEqualToEdgesOfView:priority:", v8, v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v11);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EVOnboardingBaseViewController;
  -[EVOnboardingBaseViewController viewWillAppear:](&v9, "viewWillAppear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EVOnboardingBaseViewController traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v7, "setLockedOrientations:", 2);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    objc_msgSend(v8, "setOrientation:animated:", 1, v3);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  id WeakRetained;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EVOnboardingBaseViewController;
  -[EVOnboardingBaseViewController viewWillDisappear:](&v8, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EVOnboardingBaseViewController traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v6, "setLockedOrientations:", 0);

  }
  if (-[EVOnboardingBaseViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "onboardingViewControllerWillMoveFromParentViewController:", self);

  }
}

- (OBBaseWelcomeController)obViewController
{
  -[EVOnboardingBaseViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return self->_obViewController;
}

- (void)setObViewController:(id)a3
{
  objc_storeStrong((id *)&self->_obViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
