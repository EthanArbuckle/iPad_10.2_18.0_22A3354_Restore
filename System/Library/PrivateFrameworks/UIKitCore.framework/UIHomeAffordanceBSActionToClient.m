@implementation UIHomeAffordanceBSActionToClient

uint64_t __63___UIHomeAffordanceBSActionToClient_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  void *v1;
  const __CFString *v2;

  v1 = *(void **)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 40), "actionType"))
    v2 = &stru_1E16EDF20;
  else
    v2 = CFSTR("doubleTapGestureDidSucceed");
  return objc_msgSend(v1, "appendString:withName:", v2, CFSTR("actionType"));
}

@end
