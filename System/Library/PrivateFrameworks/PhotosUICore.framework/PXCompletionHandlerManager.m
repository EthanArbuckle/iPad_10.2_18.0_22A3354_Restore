@implementation PXCompletionHandlerManager

void __53___PXCompletionHandlerManager_callCompletionHandlers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void (**aBlock)(void);

  aBlock = a2;
  v3 = (void *)objc_opt_class();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = _Block_copy(aBlock);
  objc_msgSend(v3, "cancelPreviousPerformRequestsWithTarget:selector:object:", v4, sel__handleTimeoutOfCompletionHandler_, v5);

  aBlock[2]();
}

@end
