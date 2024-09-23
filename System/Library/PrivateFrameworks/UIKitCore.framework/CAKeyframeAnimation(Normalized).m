@implementation CAKeyframeAnimation(Normalized)

+ (id)normalizedKeyframeAnimationWithKeyPath:()Normalized
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setBeginTime:", 1.0e-100);
  objc_msgSend(v0, "setDuration:", 1.0);
  objc_msgSend(v0, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v0, "setRemovedOnCompletion:", 0);
  return v0;
}

@end
