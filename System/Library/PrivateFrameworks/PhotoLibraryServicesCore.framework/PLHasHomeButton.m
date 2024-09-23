@implementation PLHasHomeButton

uint64_t __PLHasHomeButton_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  PLHasHomeButton_hasHomeButton = (_DWORD)result != 2;
  return result;
}

@end
