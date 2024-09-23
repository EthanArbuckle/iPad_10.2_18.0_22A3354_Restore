@implementation SharedHardwareManagerEventListenerAdd

uint64_t __SharedHardwareManagerEventListenerAdd_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObject:", *(_QWORD *)(a1 + 32));
}

@end
