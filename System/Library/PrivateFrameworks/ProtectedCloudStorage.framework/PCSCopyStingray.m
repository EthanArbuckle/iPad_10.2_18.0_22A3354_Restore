@implementation PCSCopyStingray

intptr_t ____PCSCopyStingray_block_invoke(uint64_t a1, CFTypeRef cf, uint64_t a3)
{
  if (a3)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    CFRetain(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  }
  else if (cf)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = CFRetain(cf);
  }
  else
  {
    _PCSError((const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 44, CFSTR("SecureBackup didn't return identity nor error"));
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
