@implementation DPCGetRegisteredSubscriber

BOOL ___DPCGetRegisteredSubscriber_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int16 *)(a2 + 128) == *(unsigned __int16 *)(a1 + 48)
    && *(unsigned __int16 *)(a2 + 130) == *(unsigned __int16 *)(a1 + 50)
    && DomainNameEqual(*(unsigned __int8 **)(*(_QWORD *)(a2 + 80) + 24), *(unsigned __int8 **)(a1 + 40)))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  }
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

@end
