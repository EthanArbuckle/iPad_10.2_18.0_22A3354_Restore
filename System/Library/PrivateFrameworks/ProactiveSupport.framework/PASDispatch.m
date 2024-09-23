@implementation PASDispatch

uint64_t __54___PASDispatch_notifyGroup_onQueue_withTimeout_block___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  }
  return result;
}

void __54___PASDispatch_notifyGroup_onQueue_withTimeout_block___block_invoke_5(_QWORD *a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  id obj;

  obj = *(id *)(*(_QWORD *)(a1[4] + 8) + 40);
  objc_sync_enter(obj);
  v2 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  if (v2)
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1[6] + 8) + 40));
  v4 = WeakRetained;
  if (WeakRetained)
    dispatch_block_cancel(WeakRetained);

  objc_sync_exit(obj);
}

void __54___PASDispatch_notifyGroup_onQueue_withTimeout_block___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id obj;

  obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_sync_enter(obj);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  dispatch_block_cancel(*(dispatch_block_t *)(a1 + 32));
  objc_sync_exit(obj);

}

@end
