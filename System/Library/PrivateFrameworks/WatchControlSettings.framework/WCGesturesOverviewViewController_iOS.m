@implementation WCGesturesOverviewViewController_iOS

+ (id)createGesturesOverviewViewController
{
  WCGesturesOverviewViewController_iOS *v2;
  void *v3;
  WCGesturesOverviewViewController_iOS *v4;

  v2 = [WCGesturesOverviewViewController_iOS alloc];
  WCLocalizedString(CFSTR("grey.onboarding.title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WCGesturesOverviewViewController_iOS initWithTitle:detailText:icon:](v2, "initWithTitle:detailText:icon:", v3, 0, 0);

  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)WCGesturesOverviewViewController_iOS;
  -[OBBaseWelcomeController viewDidLoad](&v24, sel_viewDidLoad);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  WCAvailableGreyEvents();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v7), "integerValue", (_QWORD)v20);
        WCNameForGreyEvent(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        WCOnboardingDescriptionForGreyEvent(v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        WCOnboardingImageForGreyEvent(v8, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[WCGesturesOverviewViewController_iOS addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v9, v10, v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  WCLocalizedString(CFSTR("grey.onboarding.try.it.out.on.watch.action"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:forState:", v13, 0);

  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel__tryItOutOnAppleWatch, 64);
  -[WCGesturesOverviewViewController_iOS buttonTray](self, "buttonTray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addButton:", v12);

  -[WCGesturesOverviewViewController_iOS navigationController](self, "navigationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "viewControllers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17 == 1)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismissOnboarding);
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setLeftBarButtonItem:", v18);

  }
}

- (void)dismissOnboarding
{
  -[WCGesturesOverviewViewController_iOS dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_tryItOutOnAppleWatch
{
  id v2;

  +[WatchControlSettings sharedInstance](WatchControlSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRequestToShowPracticeGrey:", 1);

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
