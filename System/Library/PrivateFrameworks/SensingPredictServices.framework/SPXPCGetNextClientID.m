@implementation SPXPCGetNextClientID

uint64_t __SPXPCGetNextClientID_block_invoke()
{
  uint64_t result;

  result = RandomBytes();
  SPXPCGetNextClientID_sNext = (unsigned __int16)word_25751489A << 16;
  return result;
}

@end
