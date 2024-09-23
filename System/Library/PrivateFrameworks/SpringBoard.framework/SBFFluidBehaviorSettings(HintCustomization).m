@implementation SBFFluidBehaviorSettings(HintCustomization)

- (uint64_t)_setDefaultButtonHintGeometryFastValues
{
  CAFrameRateRange v3;

  objc_msgSend(a1, "setBehaviorType:", 2);
  objc_msgSend(a1, "setDampingRatio:", 0.7);
  objc_msgSend(a1, "setResponse:", 0.3);
  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return objc_msgSend(a1, "setFrameRateRange:highFrameRateReason:", 1114149, *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

@end
