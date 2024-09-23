@implementation DPCQuestionGetSubscriber

BOOL ___DPCQuestionGetSubscriber_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 40) == *(_DWORD *)(*(_QWORD *)(a2 + 56) + 96))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

@end
