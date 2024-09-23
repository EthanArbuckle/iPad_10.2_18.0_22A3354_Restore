@implementation SBSAInterfaceElementInertCollapsingTransitionSettings

- (void)_setDefaultValuesForBehaviorSettings:(id)a3
{
  id v3;
  objc_super v4;
  CAFrameRateRange v5;

  v4.receiver = self;
  v4.super_class = (Class)SBSAInterfaceElementInertCollapsingTransitionSettings;
  v3 = a3;
  -[SBSystemApertureTransitionSettings _setDefaultValuesForBehaviorSettings:](&v4, sel__setDefaultValuesForBehaviorSettings_, v3);
  objc_msgSend(v3, "setBehaviorType:", 1, v4.receiver, v4.super_class);
  objc_msgSend(v3, "setDampingRatio:", 0.816);
  objc_msgSend(v3, "setResponse:", 0.513);
  objc_msgSend(v3, "setRetargetImpulse:", 0.008);
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v3, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);

}

@end
