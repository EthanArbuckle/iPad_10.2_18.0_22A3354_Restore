@implementation HKSPImmediateScheduler

uint64_t __51___HKSPImmediateScheduler_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performOnMainThreadIfNecessary:", *(_QWORD *)(a1 + 40));
}

uint64_t __40___HKSPImmediateScheduler_performBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performOnMainThreadIfNecessary:", *(_QWORD *)(a1 + 40));
}

void __50___HKSPImmediateScheduler_performCancelableBlock___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50___HKSPImmediateScheduler_performCancelableBlock___block_invoke_2;
  v2[3] = &unk_1E4E3CD48;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_performOnMainThreadIfNecessary:", v2);

}

void __50___HKSPImmediateScheduler_performCancelableBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_alloc_init(MEMORY[0x1E0D51990]);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

@end
