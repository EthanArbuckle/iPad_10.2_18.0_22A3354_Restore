@implementation AFCProcessFileRefSetFileSizePacket

uint64_t __AFCProcessFileRefSetFileSizePacket_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = ftruncate(*(_DWORD *)(*(_QWORD *)(a1 + 40) + 40 * *(unsigned int *)(a1 + 56) + 80), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
