@implementation SBDynamicFlashlightState

+ (id)onStateWithInitialIntensity:(double)a3 width:(double)a4
{
  return -[SBDynamicFlashlightStateOn initWithInitialIntensity:width:]([SBDynamicFlashlightStateOn alloc], "initWithInitialIntensity:width:", a3, a4);
}

+ (id)offState
{
  return objc_alloc_init(SBDynamicFlashlightStateOff);
}

+ (id)unavailableState
{
  return objc_alloc_init(SBDynamicFlashlightStateUnavailable);
}

@end
