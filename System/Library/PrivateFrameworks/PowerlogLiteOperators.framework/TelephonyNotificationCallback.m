@implementation TelephonyNotificationCallback

uint64_t __TelephonyNotificationCallback_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886FB1 = result;
  return result;
}

@end
