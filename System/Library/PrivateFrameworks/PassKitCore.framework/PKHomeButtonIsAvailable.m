@implementation PKHomeButtonIsAvailable

uint64_t __PKHomeButtonIsAvailable_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  byte_1ECF21C7F = (_DWORD)result != 2;
  return result;
}

@end
