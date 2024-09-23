@implementation UIBarsExtendContentViewForHostedTabBar

void ___UIBarsExtendContentViewForHostedTabBar_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  _UIMainBundleIdentifier();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("ExtendContentViewForHostedTabBar"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1
    || (_UIKitPreferencesOnce(),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "objectForKey:", CFSTR("ExtendContentViewForHostedTabBar")),
        v1 = (void *)objc_claimAutoreleasedReturnValue(),
        v2,
        v1))
  {
    _UIBarsExtendContentViewForHostedTabBar_extendContentViewForHostedTabBar = objc_msgSend(v1, "BOOLValue");

  }
}

@end
