@implementation PSUISearchController

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  int64_t v3;

  +[PSListController appearance](PSListController, "appearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesDarkTheme");

  return v3;
}

@end
