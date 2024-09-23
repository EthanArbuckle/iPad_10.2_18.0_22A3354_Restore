@implementation SBFFluidBehaviorSettings(SBSAAdditions)

- (uint64_t)isUnanimated
{
  objc_msgSend(a1, "deceleration");
  if (!BSFloatIsZero())
    return 0;
  objc_msgSend(a1, "dampingRatio");
  if (!BSFloatIsZero())
    return 0;
  objc_msgSend(a1, "response");
  if (!BSFloatIsZero())
    return 0;
  objc_msgSend(a1, "trackingDampingRatio");
  if (!BSFloatIsZero())
    return 0;
  objc_msgSend(a1, "trackingResponse");
  if (!BSFloatIsZero())
    return 0;
  objc_msgSend(a1, "retargetImpulse");
  if (!BSFloatIsZero())
    return 0;
  objc_msgSend(a1, "trackingRetargetImpulse");
  if (!BSFloatIsZero())
    return 0;
  objc_msgSend(a1, "dampingRatioSmoothing");
  if (!BSFloatIsZero())
    return 0;
  objc_msgSend(a1, "responseSmoothing");
  if (!BSFloatIsZero())
    return 0;
  objc_msgSend(a1, "trackingDampingRatioSmoothing");
  if (!BSFloatIsZero())
    return 0;
  objc_msgSend(a1, "trackingResponseSmoothing");
  return BSFloatIsZero();
}

+ (id)unanimatedBehaviorSettings
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x1E0DA9E08]);
  objc_msgSend(v0, "setName:", CFSTR("Unanimated"));
  objc_msgSend(v0, "setDefaultValues");
  objc_msgSend(v0, "setDeceleration:", 0.0);
  objc_msgSend(v0, "setDampingRatio:", 0.0);
  objc_msgSend(v0, "setResponse:", 0.0);
  objc_msgSend(v0, "setTrackingDampingRatio:", 0.0);
  objc_msgSend(v0, "setTrackingResponse:", 0.0);
  objc_msgSend(v0, "setRetargetImpulse:", 0.0);
  objc_msgSend(v0, "setTrackingRetargetImpulse:", 0.0);
  objc_msgSend(v0, "setDampingRatioSmoothing:", 0.0);
  objc_msgSend(v0, "setResponseSmoothing:", 0.0);
  objc_msgSend(v0, "setTrackingDampingRatioSmoothing:", 0.0);
  objc_msgSend(v0, "setTrackingResponseSmoothing:", 0.0);
  return v0;
}

@end
