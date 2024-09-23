@implementation UITabBarControllerWantsNavigationBarExtensionForFloatingTabBar

void ___UITabBarControllerWantsNavigationBarExtensionForFloatingTabBar_block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  id v3;

  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("FloatingTabBarExtendBarHeight"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
    _UITabBarControllerWantsNavigationBarExtensionForFloatingTabBar_wantsNavigationBarExtensionForFloatingTabBar = objc_msgSend(v3, "BOOLValue");
  _UIMainBundleIdentifier();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.DocumentManagerUICore.Service"));

  if (v2)
    _UITabBarControllerWantsNavigationBarExtensionForFloatingTabBar_wantsNavigationBarExtensionForFloatingTabBar = _UIDocumentViewControllerWantsUIPDocumentLanding();

}

@end
