@implementation SBDashBoardHostedAppStatusBarStateProxy

void __72___SBDashBoardHostedAppStatusBarStateProxy__suppressInheritedPartStyles__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isMedusaCapable") & 1) != 0)
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "appSwitcherDefaults");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    _suppressInheritedPartStyles_sAllowSplitView = objc_msgSend(v1, "medusaMultitaskingEnabled");

  }
  else
  {
    _suppressInheritedPartStyles_sAllowSplitView = 0;
  }

}

@end
