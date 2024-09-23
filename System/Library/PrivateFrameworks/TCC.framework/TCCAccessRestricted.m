@implementation TCCAccessRestricted

uint64_t __TCCAccessRestricted_block_invoke(uint64_t result, uint64_t a2, int a3)
{
  if (a3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

@end
