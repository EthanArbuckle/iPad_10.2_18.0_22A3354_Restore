@implementation UITapticEngine

uint64_t __40___UITapticEngine_prepareUsingFeedback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepareUsingFeedback:", *(_QWORD *)(a1 + 40));
}

uint64_t __36___UITapticEngine_endUsingFeedback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endUsingFeedback:", *(_QWORD *)(a1 + 40));
}

uint64_t __35___UITapticEngine_actuateFeedback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "actuateFeedback:", *(_QWORD *)(a1 + 40));
}

uint64_t __35___UITapticEngine_actuateFeedback___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "transitionToState:ended:", *(_QWORD *)(a1 + 40), 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "deactivate");
}

@end
