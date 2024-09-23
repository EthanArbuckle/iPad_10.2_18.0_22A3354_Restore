@implementation CALayer(Bridge)

- (uint64_t)ts_setContinuousCorners:()Bridge
{
  return objc_msgSend(a1, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
}

@end
