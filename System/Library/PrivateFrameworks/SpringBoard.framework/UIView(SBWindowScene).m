@implementation UIView(SBWindowScene)

- (id)_sbWindowScene
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_sbWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_sbDisplayConfiguration
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_sbWindowScene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_sbDisplayConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
