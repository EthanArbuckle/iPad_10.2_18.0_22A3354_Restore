@implementation AFCProcessFileRefLockPacket

uint64_t __AFCProcessFileRefLockPacket_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = flock(*(_DWORD *)(*(_QWORD *)(a1 + 40) + 40 * *(unsigned int *)(a1 + 48) + 80), *(_DWORD *)(a1 + 52));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
