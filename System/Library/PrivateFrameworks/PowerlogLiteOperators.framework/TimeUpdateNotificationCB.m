@implementation TimeUpdateNotificationCB

uint64_t __TimeUpdateNotificationCB_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883A1E = result;
  return result;
}

@end
