@implementation PLIsPadMini

uint64_t __PLIsPadMini_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  if ((_DWORD)result == 28)
    PLIsPadMini_isIpadMini = 1;
  return result;
}

@end
