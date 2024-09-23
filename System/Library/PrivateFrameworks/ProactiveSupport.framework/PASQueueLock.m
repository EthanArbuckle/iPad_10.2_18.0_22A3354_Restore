@implementation PASQueueLock

uint64_t __42___PASQueueLock_runAsyncWithLockAcquired___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

_QWORD *__57___PASQueueLock_runWithLockAcquired_shouldContinueBlock___block_invoke(_QWORD *result)
{
  unsigned __int8 *v1;
  unsigned __int8 v2;

  v1 = (unsigned __int8 *)(*(_QWORD *)(result[5] + 8) + 32);
  do
    v2 = __ldaxr(v1);
  while (__stlxr(1u, v1));
  if ((v2 & 1) == 0)
    return (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)(result[6] + 8) + 40) + 16))(*(_QWORD *)(*(_QWORD *)(result[6] + 8) + 40), *(_QWORD *)(result[4] + 16));
  return result;
}

uint64_t __37___PASQueueLock_runWithLockAcquired___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

void __49___PASQueueLock_initWithGuardedData_serialQueue___block_invoke(uint64_t a1)
{
  dispatch_assert_queue_barrier(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8));
}

@end
