@implementation AdaptiveSearchController

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AdaptiveSearchController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "windowScene"));
  v5 = objc_msgSend(v4, "interfaceOrientation");

  return 1 << v5;
}

@end
