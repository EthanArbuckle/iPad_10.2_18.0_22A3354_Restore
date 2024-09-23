@implementation PCSServiceItemsCountByFlags

uint64_t __PCSServiceItemsCountByFlags_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if ((*(_DWORD *)(a3 + 80) & *(_DWORD *)(result + 40)) != 0)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

@end
