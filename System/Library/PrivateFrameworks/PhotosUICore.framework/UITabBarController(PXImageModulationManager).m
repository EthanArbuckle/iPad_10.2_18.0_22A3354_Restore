@implementation UITabBarController(PXImageModulationManager)

- (uint64_t)px_isImageModulationEnabled
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "selectedViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "px_isImageModulationEnabled");

  return v2;
}

- (double)px_HDRFocus
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "selectedViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "px_HDRFocus");
  v3 = v2;

  return v3;
}

- (double)px_imageModulationIntensity
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "selectedViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "px_imageModulationIntensity");
  v3 = v2;

  return v3;
}

@end
