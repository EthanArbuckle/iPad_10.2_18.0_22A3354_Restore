@implementation BasebandResetCallback

uint64_t __BasebandResetCallback_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  byte_1ED883A1A = result;
  return result;
}

uint64_t __BasebandResetCallback_block_invoke_4419(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  byte_1ED883A1B = result;
  return result;
}

@end
