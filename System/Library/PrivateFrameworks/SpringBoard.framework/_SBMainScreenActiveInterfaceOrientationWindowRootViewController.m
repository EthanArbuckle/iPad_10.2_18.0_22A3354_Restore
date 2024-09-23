@implementation _SBMainScreenActiveInterfaceOrientationWindowRootViewController

- (BOOL)shouldAutorotate
{
  return 1;
}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  if (self->_supportedInterfaceOrientations != a3)
  {
    self->_supportedInterfaceOrientations = a3;
    -[UIViewController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t supportedInterfaceOrientations;

  -[_SBMainScreenActiveInterfaceOrientationWindowRootViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  -[_SBMainScreenActiveInterfaceOrientationWindowRootViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_roleHint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = SBTraitsArbiterOrientationActuationEnabledForRole(v6);

  if (v7)
    supportedInterfaceOrientations = objc_msgSend(v3, "supportedInterfaceOrientations");
  else
LABEL_4:
    supportedInterfaceOrientations = self->_supportedInterfaceOrientations;

  return supportedInterfaceOrientations;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIViewController)contentViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_contentViewController);
}

- (void)setContentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_contentViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentViewController);
}

@end
