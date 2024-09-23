@implementation CALayer(_UIHDRAnimations)

- (void)_ui_configureForHDRHeadroomUsageEnabled:()_UIHDRAnimations
{
  double v5;
  id v6;

  +[_UIHDRUsageCoordinator sharedInstance]();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v5 = 0.0;
    if (a3)
      v5 = 1.0;
    objc_msgSend(a1, "setContentsEDRStrength:", v5);
  }

}

- (id)_ui_animationForHDRHeadroomUsageEnabled:()_UIHDRAnimations
{
  void *v5;
  void *v6;

  +[_UIHDRUsageCoordinator sharedInstance]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHDRUsageCoordinator animationForHDRHeadroomUsage:layer:]((uint64_t)v5, a3, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
