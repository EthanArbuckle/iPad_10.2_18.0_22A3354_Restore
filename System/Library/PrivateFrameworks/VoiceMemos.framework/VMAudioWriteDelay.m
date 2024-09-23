@implementation VMAudioWriteDelay

uint64_t __VMAudioWriteDelay_block_invoke()
{
  uint64_t result;
  double v1;

  result = MGGetBoolAnswer();
  v1 = 0.0;
  if ((_DWORD)result)
    v1 = 0.75;
  VMAudioWriteDelay_writeDelay = *(_QWORD *)&v1;
  return result;
}

@end
