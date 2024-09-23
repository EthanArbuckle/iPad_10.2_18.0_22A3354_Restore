@implementation WCOnboardingPresenter

+ (void)presentOnboardingFromViewController:(id)a3 withObserver:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "setOnboardingObserver:", v5);

  objc_msgSend(v6, "presentViewController:animated:completion:", v7, 1, 0);
}

+ (void)presentGesturesOverviewFromViewController:(id)a3 withObserver:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  +[WCGesturesOverviewViewController_iOS createGesturesOverviewViewController](WCGesturesOverviewViewController_iOS, "createGesturesOverviewViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOnboardingObserver:", v5);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", v6, 1);
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6E420]), "initWithRootViewController:", v6);
    objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, 0);
  }

}

@end
