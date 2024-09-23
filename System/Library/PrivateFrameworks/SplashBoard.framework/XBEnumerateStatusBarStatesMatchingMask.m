@implementation XBEnumerateStatusBarStatesMatchingMask

uint64_t __XBEnumerateStatusBarStatesMatchingMask_block_invoke(uint64_t result, char a2)
{
  if ((*(_QWORD *)(result + 40) & (1 << a2)) != 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

@end
