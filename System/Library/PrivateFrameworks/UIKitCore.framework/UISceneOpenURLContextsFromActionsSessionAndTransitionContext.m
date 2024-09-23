@implementation UISceneOpenURLContextsFromActionsSessionAndTransitionContext

BOOL ___UISceneOpenURLContextsFromActionsSessionAndTransitionContext_block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  _BOOL8 result;

  result = objc_msgSend(a2, "UIActionType") == 1;
  *a3 = result;
  return result;
}

@end
