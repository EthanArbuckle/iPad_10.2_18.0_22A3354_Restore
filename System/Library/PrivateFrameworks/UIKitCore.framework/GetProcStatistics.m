@implementation GetProcStatistics

uint64_t __GetProcStatistics_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x186DC9268]();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
