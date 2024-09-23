@implementation UIOShowTouchAction

uint64_t __55___UIOShowTouchAction_TestingOnly__removeIndicatorView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setAlpha:", 0.0);
}

uint64_t __55___UIOShowTouchAction_TestingOnly__removeIndicatorView__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeFromSuperview");
}

uint64_t __63___UIOShowTouchAction_TestingOnly_performActionFromConnection___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setAlpha:", 1.0);
}

uint64_t __63___UIOShowTouchAction_TestingOnly_performActionFromConnection___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeIndicatorView");
}

@end
