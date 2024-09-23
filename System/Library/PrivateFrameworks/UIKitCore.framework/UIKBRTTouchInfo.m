@implementation UIKBRTTouchInfo

void __29___UIKBRTTouchInfo_touchDict__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 5, 5, 0);
  v1 = (void *)_MergedGlobals_9_2;
  _MergedGlobals_9_2 = v0;

}

void __56___UIKBRTTouchInfo_setTimerWithTimeInterval_onQueue_do___block_invoke(uint64_t a1)
{
  _UIKBRTTimerBlock *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "invalidate");
  v2 = -[_UIKBRTTimerBlock initWithTimeInterval:onQueue:do:owner:]([_UIKBRTTimerBlock alloc], "initWithTimeInterval:onQueue:do:owner:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(double *)(a1 + 56));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v2;

}

void __35___UIKBRTTouchInfo_invalidateTimer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 80);
  *(_QWORD *)(v2 + 80) = 0;

}

@end
