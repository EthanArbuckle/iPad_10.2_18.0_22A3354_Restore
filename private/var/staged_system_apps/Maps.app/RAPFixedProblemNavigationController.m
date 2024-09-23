@implementation RAPFixedProblemNavigationController

+ (id)fixedProblemNavigationControllerWithProblemStatusResponse:(id)a3
{
  id v3;
  RAPFixedProblemViewController *v4;
  RAPFixedProblemNavigationController *v5;

  v3 = a3;
  v4 = objc_alloc_init(RAPFixedProblemViewController);
  -[RAPFixedProblemViewController setProblemStatusResponse:](v4, "setProblemStatusResponse:", v3);

  v5 = -[RAPFixedProblemNavigationController initWithRootViewController:]([RAPFixedProblemNavigationController alloc], "initWithRootViewController:", v4);
  -[RAPFixedProblemNavigationController setFixedProblemViewController:](v5, "setFixedProblemViewController:", v4);

  return v5;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)handleDone:(id)a3
{
  void (**v3)(void);

  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[RAPFixedProblemNavigationController doneHandler](self, "doneHandler", a3));
  v3[2]();

}

- (id)doneHandler
{
  return self->_doneHandler;
}

- (void)setDoneHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (RAPFixedProblemViewController)fixedProblemViewController
{
  return self->_fixedProblemViewController;
}

- (void)setFixedProblemViewController:(id)a3
{
  objc_storeStrong((id *)&self->_fixedProblemViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_doneHandler, 0);
  objc_storeStrong((id *)&self->_fixedProblemViewController, 0);
  objc_storeStrong(&self->doneHandler, 0);
}

@end
