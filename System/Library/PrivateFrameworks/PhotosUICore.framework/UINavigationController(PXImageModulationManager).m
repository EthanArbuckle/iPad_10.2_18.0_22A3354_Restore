@implementation UINavigationController(PXImageModulationManager)

- (uint64_t)px_isImageModulationEnabled
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "px_topViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "px_isImageModulationEnabled");

  return v2;
}

- (double)px_HDRFocus
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "px_topViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "px_HDRFocus");
  v3 = v2;

  return v3;
}

- (double)px_imageModulationIntensity
{
  void *v2;
  double v3;
  double v4;
  double result;

  objc_msgSend(a1, "px_topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_imageModulationIntensity");
  v4 = v3;

  if (px_imageModulationIntensity_onceToken != -1)
    dispatch_once(&px_imageModulationIntensity_onceToken, &__block_literal_global_305_147942);
  if (!px_imageModulationIntensity_hookExists)
    return v4;
  objc_msgSend(a1, "px_imageModulationIntensityWithProposedValue:", v4);
  return result;
}

@end
