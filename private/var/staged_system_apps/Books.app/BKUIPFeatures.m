@implementation BKUIPFeatures

+ (BOOL)uipFluidTransitionsEnabled
{
  return _os_feature_enabled_impl("UIKit", "uip_fluid_transitions");
}

+ (BOOL)useUIPFluidBookOpenTransition
{
  return _objc_msgSend(a1, "uipFluidTransitionsEnabled");
}

@end
