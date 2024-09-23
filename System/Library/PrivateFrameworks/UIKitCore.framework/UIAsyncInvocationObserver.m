@implementation UIAsyncInvocationObserver

void __52___UIAsyncInvocationObserver__didCompleteInvocation__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 25))
  {
    *(_BYTE *)(v1 + 25) = 1;
    v2 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v2 + 24))
    {
      v3 = *(NSObject **)(v2 + 8);
      if (v3)
        dispatch_resume(v3);
    }
  }
}

void __45___UIAsyncInvocationObserver_whenCompleteDo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  dispatch_queue_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 8))
  {
    v3 = dispatch_queue_create("Async Observer", 0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (!*(_BYTE *)(v2 + 24) && !*(_BYTE *)(v2 + 25))
  {
    *(_BYTE *)(v2 + 24) = 1;
    dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
    v2 = *(_QWORD *)(a1 + 32);
  }
  dispatch_async(*(dispatch_queue_t *)(v2 + 8), *(dispatch_block_t *)(a1 + 40));
}

intptr_t __69___UIAsyncInvocationObserver_whenInvocationsCompleteForObservers_do___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __69___UIAsyncInvocationObserver_whenInvocationsCompleteForObservers_do___block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  id v3;

  v3 = *(id *)(a1 + 32);
  if (objc_msgSend(v3, "count"))
  {
    v2 = 0;
    do
    {
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL);
      ++v2;
    }
    while (objc_msgSend(v3, "count") > v2);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
