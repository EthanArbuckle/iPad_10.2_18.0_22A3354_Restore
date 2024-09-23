@implementation UIViewKeyValueAnimationFactory

uint64_t __91___UIViewKeyValueAnimationFactory_animationsTransitioningFromAnimation_toAnimation_onView___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setFromAnimation:", a2);
}

uint64_t __91___UIViewKeyValueAnimationFactory_animationsTransitioningFromAnimation_toAnimation_onView___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setToAnimation:", a2);
}

@end
