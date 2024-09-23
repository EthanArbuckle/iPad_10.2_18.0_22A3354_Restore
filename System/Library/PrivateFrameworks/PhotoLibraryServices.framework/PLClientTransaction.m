@implementation PLClientTransaction

uint64_t __49___PLClientTransaction_persistTransactionScopes___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 64);
  if ((result & 0x80000000) == 0)
  {
    pwrite(result, (const void *)(a1 + 40), 8uLL, 0);
    return fsync(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 64));
  }
  return result;
}

void __43___PLClientTransaction_completeTransaction__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  id WeakRetained;
  NSObject *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 64);
  if ((v3 & 0x80000000) == 0)
  {
    flock(*(_DWORD *)(v2 + 64), 8);
    close(v3);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 64) = -1;
    v2 = *(_QWORD *)(a1 + 32);
  }
  WeakRetained = objc_loadWeakRetained((id *)(v2 + 80));

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
    dispatch_semaphore_signal(v5);

    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 80), 0);
  }
}

void __31___PLClientTransaction_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  id WeakRetained;
  NSObject *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 64);
  if ((v3 & 0x80000000) == 0)
  {
    flock(*(_DWORD *)(v2 + 64), 8);
    close(v3);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 64) = -1;
    v2 = *(_QWORD *)(a1 + 32);
  }
  WeakRetained = objc_loadWeakRetained((id *)(v2 + 80));

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
    dispatch_semaphore_signal(v5);

    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 80), 0);
  }
}

void __44___PLClientTransaction__fdResourceSemaphore__block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;

  if ((PLIsAssetsd() & 1) == 0)
  {
    v0 = dispatch_semaphore_create(16);
    v1 = (void *)_fdResourceSemaphore_fdResourceSem;
    _fdResourceSemaphore_fdResourceSem = (uint64_t)v0;

  }
}

void __41___PLClientTransaction__fdIsolationQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("PLClientServerTransactions.fdIsolationQueue", 0);
  v1 = (void *)_fdIsolationQueue_sQueue;
  _fdIsolationQueue_sQueue = (uint64_t)v0;

}

@end
