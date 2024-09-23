@implementation TFBetaAppLaunchScreenProvider

+ (id)createBetaAppLaunchViewControllerForIdentifier:(id)a3 hostedIn:(id)a4 withSidepackLaunchInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  TFBetaAppLaunchPresenter *v14;
  void *v15;
  ASDTFBetaAppLaunchDataProvider *v16;
  TFBetaAppLaunchPresenter *v17;
  TFBetaAppLaunchScreenViewController *v18;
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    +[TFLaunchScreenBuilder buildLaunchScreenFromBetaAppLaunchInfo:](TFLaunchScreenBuilder, "buildLaunchScreenFromBetaAppLaunchInfo:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v21 = 0;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v7, 0, &v21);
  v12 = v21;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Missing app record for passed bundle identifier"), 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
  }
  v13 = v12;
  v14 = [TFBetaAppLaunchPresenter alloc];
  objc_msgSend(v11, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(ASDTFBetaAppLaunchDataProvider);
  v17 = -[TFBetaAppLaunchPresenter initWithBundleURL:launchDataProvider:launchScreenSidepack:](v14, "initWithBundleURL:launchDataProvider:launchScreenSidepack:", v15, v16, v10);

  v18 = -[TFBetaAppLaunchScreenViewController initWithPresenter:]([TFBetaAppLaunchScreenViewController alloc], "initWithPresenter:", v17);
  -[TFBetaAppLaunchPresenter setPresenterView:](v17, "setPresenterView:", v18);
  -[TFBetaAppLaunchScreenViewController setLaunchScreenHost:](v18, "setLaunchScreenHost:", v8);

  return v18;
}

@end
