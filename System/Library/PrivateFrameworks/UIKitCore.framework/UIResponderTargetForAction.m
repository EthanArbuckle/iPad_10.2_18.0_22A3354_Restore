@implementation UIResponderTargetForAction

uint64_t ___UIResponderTargetForAction_Recursive_block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  char v8;
  char v9;

  v6 = a4;
  v7 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = objc_msgSend(v7, "canPerformAction:withSender:", a3, v6);
  else
    v8 = objc_opt_respondsToSelector();
  v9 = v8;

  return v9 & 1;
}

@end
