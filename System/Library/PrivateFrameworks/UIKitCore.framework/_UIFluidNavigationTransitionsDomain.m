@implementation _UIFluidNavigationTransitionsDomain

+ (_UIFluidParallaxTransitionSettings)parallaxSettings
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parallaxSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIFluidParallaxTransitionSettings *)v3;
}

+ (id)domainName
{
  return CFSTR("Fluid Navigation Transitions");
}

+ (id)domainGroupName
{
  return CFSTR("UIKit");
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end
