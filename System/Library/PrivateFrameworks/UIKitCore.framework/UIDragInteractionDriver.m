@implementation UIDragInteractionDriver

uint64_t *__52___UIDragInteractionDriver_didTransitionToPreparing__block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t *result;

  v2 = *(_QWORD *)(a1 + 32);
  if (!a2)
    return (uint64_t *)objc_msgSend(*(id *)(a1 + 32), "cancel");
  result = (uint64_t *)(v2 + 8);
  if (*(_QWORD *)(v2 + 8) == 3)
    return _UIDragInteractionDriverStateMachineHandleEvent(result, v2, 6);
  return result;
}

@end
