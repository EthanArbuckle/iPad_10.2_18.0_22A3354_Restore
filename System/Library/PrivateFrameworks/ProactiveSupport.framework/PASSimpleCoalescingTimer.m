@implementation PASSimpleCoalescingTimer

uint64_t __67___PASSimpleCoalescingTimer_initWithQueue_leewaySeconds_operation___block_invoke()
{
  return 0;
}

uint64_t __67___PASSimpleCoalescingTimer_initWithQueue_leewaySeconds_operation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_PASSimpleCoalescingTimer initWithQueue:leewaySeconds:operation:]_block_invoke_2");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("_PASCoalescingTimer.m"), 234, CFSTR("accumulatedData unexpectedly non-nil"));

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
