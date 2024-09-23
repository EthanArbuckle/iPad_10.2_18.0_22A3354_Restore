@implementation UIWindow(SelfHosting)

- (id)sb_hostWrapperForUseInWindow:()SelfHosting hostRequester:
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "sb_hostWrapperForUseInOrientation:hostRequester:", objc_msgSend(a3, "interfaceOrientation"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sb_hostWrapperForUseInOrientation:()SelfHosting hostRequester:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  objc_msgSend(a1, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_FBSScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBWindowSelfHostWrapper wrapperForWindow:orientation:hostRequester:sceneIdentifier:](SBWindowSelfHostWrapper, "wrapperForWindow:orientation:hostRequester:sceneIdentifier:", a1, a3, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
