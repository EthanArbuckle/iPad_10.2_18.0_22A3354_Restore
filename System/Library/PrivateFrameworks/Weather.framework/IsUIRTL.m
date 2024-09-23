@implementation IsUIRTL

uint64_t __IsUIRTL_block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)*MEMORY[0x24BDF74F8], "userInterfaceLayoutDirection");
  IsUIRTL_isUIRTL = result == 1;
  return result;
}

@end
