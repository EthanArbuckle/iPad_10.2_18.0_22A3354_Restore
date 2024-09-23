@implementation TCCAccessPreflight

uint64_t __TCCAccessPreflight_block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  return result;
}

uint64_t __TCCAccessPreflight_block_invoke(uint64_t result, int a2)
{
  if (a2)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 2;
  return result;
}

@end
