@implementation SUICInitializeStaticVariables

uint64_t ___SUICInitializeStaticVariables_block_invoke()
{
  _SUICCheckGlyphSpringAnimationFactory *v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  uint64_t v9;

  v0 = objc_alloc_init(_SUICCheckGlyphSpringAnimationFactory);
  v1 = (void *)_SUICDefaultSpringAnimationFactory;
  _SUICDefaultSpringAnimationFactory = (uint64_t)v0;

  v2 = dispatch_queue_create("com.apple.siriuicore.springAnimationFactory", 0);
  v3 = (void *)_SUICDefaultSpringAnimationFactoryQueue;
  _SUICDefaultSpringAnimationFactoryQueue = (uint64_t)v2;

  objc_msgSend((id)_SUICDefaultSpringAnimationFactory, "springAnimationWithKeyPath:", 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_SUICSpringAnimationTimingAnimation;
  _SUICSpringAnimationTimingAnimation = v4;

  objc_msgSend((id)_SUICSpringAnimationTimingAnimation, "timingFunction");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_SUICSpringAnimationTimingFunction;
  _SUICSpringAnimationTimingFunction = v6;

  result = objc_msgSend((id)_SUICDefaultSpringAnimationFactory, "duration");
  _SUICDefaultSpringAnimationDuration = v9;
  return result;
}

@end
