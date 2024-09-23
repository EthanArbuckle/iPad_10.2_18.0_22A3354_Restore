@implementation UIWindowScene(FBSDisplayConfiguration)

- (id)_fbsDisplayIdentity
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "screen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_fbsDisplayConfiguration
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "screen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
