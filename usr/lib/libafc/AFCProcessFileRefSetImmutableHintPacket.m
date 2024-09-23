@implementation AFCProcessFileRefSetImmutableHintPacket

uint64_t __AFCProcessFileRefSetImmutableHintPacket_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = fcntl(*(_DWORD *)(a1 + 40), 68, *(unsigned int *)(a1 + 44));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
