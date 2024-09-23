@implementation SFOpenCoreSpotlightItemCommand(SearchUICommandClass)

- (id)_searchUICommandHandlerClass
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "applicationBundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[SearchUIUtilities isAppInstalledWithBundleId:](SearchUIUtilities, "isAppInstalledWithBundleId:", v1))
  {
    v2 = (void *)objc_opt_class();
  }
  else
  {
    v2 = 0;
  }
  v3 = v2;

  return v3;
}

@end
