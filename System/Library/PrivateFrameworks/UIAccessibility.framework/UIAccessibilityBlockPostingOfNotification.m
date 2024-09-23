@implementation UIAccessibilityBlockPostingOfNotification

void ___UIAccessibilityBlockPostingOfNotification_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v1 = (void *)_BlockNotificationsLock;
  _BlockNotificationsLock = (uint64_t)v0;

}

@end
