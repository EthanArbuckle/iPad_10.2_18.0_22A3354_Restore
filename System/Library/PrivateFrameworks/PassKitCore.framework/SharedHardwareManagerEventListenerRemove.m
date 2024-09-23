@implementation SharedHardwareManagerEventListenerRemove

uint64_t __SharedHardwareManagerEventListenerRemove_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObject:", *(_QWORD *)(a1 + 32));
}

@end
