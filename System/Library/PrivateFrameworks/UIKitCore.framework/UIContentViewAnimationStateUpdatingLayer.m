@implementation UIContentViewAnimationStateUpdatingLayer

void __94___UIContentViewAnimationStateUpdatingLayer_layerForView_withUpdateHandler_completionHandler___block_invoke(uint64_t a1, int a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  char v6;
  uint64_t v8;
  id v9;
  __int128 v10;
  _QWORD block[4];
  id v12;
  __int128 v13;
  char v14;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3 <= 0.5;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (*(_QWORD *)(v3 + 24) != v4 || a2 != 0)
  {
    v6 = a2;
    v8 = MEMORY[0x1E0C809B0];
    *(_QWORD *)(v3 + 24) = v4;
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __94___UIContentViewAnimationStateUpdatingLayer_layerForView_withUpdateHandler_completionHandler___block_invoke_2;
    block[3] = &unk_1E16EA010;
    v12 = *(id *)(a1 + 32);
    v14 = v6;
    v10 = *(_OWORD *)(a1 + 40);
    v9 = (id)v10;
    v13 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __94___UIContentViewAnimationStateUpdatingLayer_layerForView_withUpdateHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*(_BYTE *)(a1 + 56))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

@end
