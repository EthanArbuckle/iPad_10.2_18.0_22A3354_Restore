@implementation UIViewDeferredKeyframeAnimation

uint64_t __45___UIViewDeferredKeyframeAnimation__finalize__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareStartTimes:");
}

uint64_t __67___UIViewDeferredKeyframeAnimation_animateFrameAtIndex_animations___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
