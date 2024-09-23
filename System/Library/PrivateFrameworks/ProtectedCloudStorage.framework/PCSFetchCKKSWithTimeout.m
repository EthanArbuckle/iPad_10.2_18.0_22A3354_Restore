@implementation PCSFetchCKKSWithTimeout

void __PCSFetchCKKSWithTimeout_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3 == 0;
  v4 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
