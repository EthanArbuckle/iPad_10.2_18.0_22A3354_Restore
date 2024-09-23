@implementation WBSDispatchAsyncAndReleaseOnMainQueue

void __WBSDispatchAsyncAndReleaseOnMainQueue_block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD);
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void (**)(_QWORD))_Block_copy(*(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v5 = v2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  v2[2](v2);
  WBSReleaseOnMainQueueImpl((const void **)&v5);

}

@end
