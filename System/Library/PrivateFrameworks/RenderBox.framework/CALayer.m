@implementation CALayer

- (void)scheduleAnimation:(double)a3 atTime:(float)a4 maxVelocityInPixels:
{
  _anonymous_namespace_::AnimationTimer *v7;
  uint64_t v8;

  if (a1)
  {
    v7 = (_anonymous_namespace_::AnimationTimer *)objc_msgSend(a1, "screen");
  }
}

+ (void)cancelAnimation:(uint64_t)a1
{
  _anonymous_namespace_::AnimationTimer *v3;
  uint64_t v4;

  v3 = (_anonymous_namespace_::AnimationTimer *)objc_opt_self();
}

@end
