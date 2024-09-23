@implementation AppleTCONUpdaterCreate

uint64_t __AppleTCONUpdaterCreate_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  AppleTCONUpdaterTypeID = result;
  return result;
}

@end
