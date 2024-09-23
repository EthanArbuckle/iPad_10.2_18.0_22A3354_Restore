@implementation RCRegisterForFirstUnlockSinceBootCallback

uint64_t __RCRegisterForFirstUnlockSinceBootCallback_block_invoke(uint64_t a1, int a2)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return notify_cancel(a2);
}

@end
