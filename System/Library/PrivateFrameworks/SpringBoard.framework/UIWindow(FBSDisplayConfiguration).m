@implementation UIWindow(FBSDisplayConfiguration)

- (id)_fbsDisplayIdentity
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "windowScene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_fbsDisplayConfiguration
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "windowScene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
