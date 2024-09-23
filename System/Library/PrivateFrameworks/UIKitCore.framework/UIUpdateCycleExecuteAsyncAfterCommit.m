@implementation UIUpdateCycleExecuteAsyncAfterCommit

void ___UIUpdateCycleExecuteAsyncAfterCommit_block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  if (objc_msgSend(MEMORY[0x1E0CD28B0], "currentState"))
  {
    v2 = (void *)UIApp;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = ___UIUpdateCycleExecuteAsyncAfterCommit_block_invoke_2;
    v3[3] = &unk_1E16B1D18;
    v4 = *(id *)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    objc_msgSend(v2, "_performBlockAfterCATransactionCommits:", v3);

  }
  else
  {
    dispatch_async(*(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(a1 + 40));
  }
}

void ___UIUpdateCycleExecuteAsyncAfterCommit_block_invoke_2(uint64_t a1)
{
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(a1 + 40));
}

@end
