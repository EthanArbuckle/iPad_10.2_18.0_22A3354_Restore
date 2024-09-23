@implementation UIKBRTTimerBlock

void __28___UIKBRTTimerBlock_fireNow__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "fire");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("_UIKBRTTouchInfo.m"), 582, CFSTR("Timer should be nil!"));

  }
}

void __31___UIKBRTTimerBlock_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = 0;

}

void __32___UIKBRTTimerBlock_timerFired___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v1 = (void *)a1[4];
  v2 = a1[5];
  if (v1 == *(void **)(v2 + 16))
  {
    *(_QWORD *)(v2 + 16) = 0;

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[5] + 24));
    v4 = _Block_copy(*(const void **)(a1[5] + 32));
    v5 = *(_QWORD *)(a1[7] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), *(id *)(a1[5] + 40));
    v7 = a1[5];
    v8 = *(void **)(v7 + 24);
    *(_QWORD *)(v7 + 24) = 0;

    v9 = a1[5];
    v10 = *(void **)(v9 + 32);
    *(_QWORD *)(v9 + 32) = 0;

    v11 = a1[5];
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

  }
}

uint64_t __32___UIKBRTTimerBlock_timerFired___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16))();
}

@end
