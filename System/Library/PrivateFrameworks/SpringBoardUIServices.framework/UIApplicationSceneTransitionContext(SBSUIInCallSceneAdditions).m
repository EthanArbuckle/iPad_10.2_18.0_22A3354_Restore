@implementation UIApplicationSceneTransitionContext(SBSUIInCallSceneAdditions)

- (id)SBSUI_inCallAnalyticsSource
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 34567876);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)SBSUI_setInCallAnalyticsSource:()SBSUIInCallSceneAdditions
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "otherSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v6, "setObject:forSetting:", v5, 34567876);
}

@end
