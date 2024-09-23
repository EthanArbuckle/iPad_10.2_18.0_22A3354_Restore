@implementation UIViewController(ProxCardKitAdditions)

- (id)presentProxCardFlowWithDelegate:()ProxCardKitAdditions initialViewController:
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[PRXFlowConfiguration defaultConfiguration](PRXFlowConfiguration, "defaultConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "presentProxCardFlowWithDelegate:initialViewController:configuration:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)presentProxCardFlowWithDelegate:()ProxCardKitAdditions initialViewController:configuration:
{
  id v8;
  id v9;
  id v10;
  PRXCardContainerViewController *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[PRXCardContainerViewController initWithConfiguration:]([PRXCardContainerViewController alloc], "initWithConfiguration:", v8);

  -[PRXCardContainerViewController setFlowDelegate:](v11, "setFlowDelegate:", v10);
  -[PRXCardContainerViewController mainNavigationController](v11, "mainNavigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pushViewController:animated:", v9, 0);

  objc_msgSend(a1, "presentViewController:animated:completion:", v11, 1, 0);
  -[PRXCardContainerViewController mainNavigationController](v11, "mainNavigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
