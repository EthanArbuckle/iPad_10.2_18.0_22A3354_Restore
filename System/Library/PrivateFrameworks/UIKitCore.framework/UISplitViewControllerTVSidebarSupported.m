@implementation UISplitViewControllerTVSidebarSupported

void ___UISplitViewControllerTVSidebarSupported_block_invoke()
{
  void *v0;
  id v1;

  _UIMainBundleIdentifier();
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.TVWatchList")) & 1) == 0)
  {
    _UIKitUserDefaults();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "BOOLForKey:", CFSTR("ForceSupportTVSidebar"));

  }
}

@end
