@implementation UIForceClickInteractionDriver

uint64_t __59___UIForceClickInteractionDriver__handleGestureRecognizer___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 == 2)
    return objc_msgSend(*(id *)(result + 32), "cancelInteraction");
  if (!a2)
    return handleEvent(stateMachineSpec_8, *(_QWORD *)(*(_QWORD *)(result + 32) + 8), 0, *(_QWORD *)(result + 32), (uint64_t *)(*(_QWORD *)(result + 32) + 8));
  return result;
}

@end
