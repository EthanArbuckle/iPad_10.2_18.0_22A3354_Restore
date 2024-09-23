@implementation PCSDisableStingrayIdentity

intptr_t ____PCSDisableStingrayIdentity_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    CFRetain(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
