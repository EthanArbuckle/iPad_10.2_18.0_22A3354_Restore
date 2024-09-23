@implementation PCSCopyStingrayInfo

intptr_t ____PCSCopyStingrayInfo_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  if (a3)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    v4 = *(_QWORD *)(a1 + 40);
LABEL_5:
    CFRetain(*(CFTypeRef *)(*(_QWORD *)(v4 + 8) + 24));
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  if (a2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
    v4 = *(_QWORD *)(a1 + 48);
    goto LABEL_5;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
