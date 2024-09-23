@implementation WCOnboardingViewController_iOS

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WCOnboardingViewController_iOS;
  -[OBNavigationController viewDidLoad](&v15, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x24BE6E458]);
  WCLocalizedString(CFSTR("watch.control.onboarding.title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WCLocalizedString(CFSTR("watch.control.onboarding.message"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithTitle:detailText:icon:", v4, v5, 0);

  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WCLocalizedString(CFSTR("watch.control.onboarding.button.try.it.out"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v8, 0);

  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__tryItOut, 64);
  objc_msgSend(v6, "buttonTray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addButton:", v7);

  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WCLocalizedString(CFSTR("watch.control.onboarding.button.turn.on"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:forState:", v11, 0);

  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel__turnOn, 64);
  objc_msgSend(v6, "buttonTray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addButton:", v10);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelOnboarding);
  objc_msgSend(v6, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLeftBarButtonItem:", v13);

  -[OBNavigationController pushViewController:animated:](self, "pushViewController:animated:", v6, 1);
}

- (void)_tryItOut
{
  void *v3;
  id v4;

  +[WCGesturesOverviewViewController_iOS createGesturesOverviewViewController](WCGesturesOverviewViewController_iOS, "createGesturesOverviewViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WCOnboardingViewController_iOS onboardingObserver](self, "onboardingObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOnboardingObserver:", v3);

  -[OBNavigationController pushViewController:animated:](self, "pushViewController:animated:", v4, 1);
}

- (void)_turnOn
{
  void *v3;

  -[WCOnboardingViewController_iOS onboardingObserver](self, "onboardingObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didConfirmFromOnboarding");

  -[WCOnboardingViewController_iOS dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_cancelOnboarding
{
  void *v3;

  -[WCOnboardingViewController_iOS onboardingObserver](self, "onboardingObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didCancelOnboarding");

  -[WCOnboardingViewController_iOS dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (WCOnboardingObserver)onboardingObserver
{
  return (WCOnboardingObserver *)objc_loadWeakRetained((id *)&self->_onboardingObserver);
}

- (void)setOnboardingObserver:(id)a3
{
  objc_storeWeak((id *)&self->_onboardingObserver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_onboardingObserver);
}

@end
