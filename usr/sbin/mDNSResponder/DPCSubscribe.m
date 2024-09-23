@implementation DPCSubscribe

void ___DPCSubscribe_block_invoke(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v4, v5, v6, v7, v8, v9, v10, v11);
  if (a2 == 1)
  {
    _Querier_HandleSubscriberInvalidation(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
    os_release(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  }
  else if (a2 == 2)
  {
    _Querier_ApplyUpdate(*(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  }
  KQueueUnlock((uint64_t)"Subscriber event handler", v12, v13, v14, v15, v16, v17, v18);
}

@end
