@implementation SAProcName

uint64_t __SAProcName_block_invoke()
{
  uint64_t result;

  getpid();
  result = sandbox_check();
  if ((result + 1) <= 2)
    _MergedGlobals_3 = (((_BYTE)result + 1) & 7) == 2;
  return result;
}

@end
