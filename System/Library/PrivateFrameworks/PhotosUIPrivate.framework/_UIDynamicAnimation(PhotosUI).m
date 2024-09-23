@implementation _UIDynamicAnimation(PhotosUI)

- (uint64_t)pu_setFriction:()PhotosUI
{
  return objc_msgSend(a1, "_setDecelerationFactor:", a3 * -0.025 + 1.0);
}

@end
