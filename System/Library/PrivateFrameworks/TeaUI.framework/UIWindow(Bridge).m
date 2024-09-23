@implementation UIWindow(Bridge)

- (void)ts_installDebugMenuHandler:()Bridge
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "windowScene");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statusBarManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDebugMenuHandler:", v4);

}

@end
