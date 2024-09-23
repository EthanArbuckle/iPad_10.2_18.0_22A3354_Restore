@implementation SBSAInterfaceElementInertCompensatingTransitionSettings

- (void)_setDefaultValuesForBehaviorSettings:(id)a3
{
  id v3;
  CAFrameRateRange v4;

  v3 = a3;
  objc_msgSend(v3, "setDefaultValues");
  objc_msgSend(v3, "setBehaviorType:", 1);
  objc_msgSend(v3, "setDampingRatio:", 0.816);
  objc_msgSend(v3, "setResponse:", 0.513);
  objc_msgSend(v3, "setRetargetImpulse:", 0.008);
  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v3, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);

}

@end
