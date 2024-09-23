@implementation SubcompletionGenerator

id ___SubcompletionGenerator_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  __int128 v5;
  int8x16_t v6;
  id v7;
  void *v8;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  __int128 v15;
  int8x16_t v16;
  id v17[2];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "SBC2GroupCompletionAnimationDidBegin:", v3);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SBC2CompletionGenerator _SubcompletionGenerator(__strong SBC2CompletionBlock, SBC2GroupCompletionOptions, __strong id<SBC2GroupCompletionDelegate>)_block_invoke");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("UIView+SBFFluidBehaviorSettings.m"), 120, CFSTR("Final completion already fired! Did you capture subcompletionGenerator and invoke it later? Don't, call it immediately and capture the subcompletion it generates. (It's marked NS_NOESCAPE, but ObjC doesn't flag capturing no capture blocks yet, <rdar://problem/19886775>.)"));

  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ___SubcompletionGenerator_block_invoke_2;
  v12[3] = &unk_1E200F6E8;
  objc_copyWeak(v17, (id *)(a1 + 72));
  v13 = v3;
  v5 = *(_OWORD *)(a1 + 56);
  v17[1] = *(id *)(a1 + 80);
  v6 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  v15 = v5;
  v16 = v6;
  v14 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = (void *)MEMORY[0x18D774178](v12);

  objc_destroyWeak(v17);
  return v8;
}

void ___SubcompletionGenerator_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  void *v11;
  __CFRunLoop *v12;
  const void *v13;
  _QWORD block[4];
  id v15;
  __int128 v16;
  __int128 v17;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(WeakRetained, "SBC2GroupCompletionAnimationDidComplete:finished:retargeted:", *(_QWORD *)(a1 + 32), a2, a3);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v7 + 24))
    v8 = a2;
  else
    v8 = 0;
  *(_BYTE *)(v7 + 24) = v8;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(v9 + 24))
    v10 = 1;
  else
    v10 = a3;
  *(_BYTE *)(v9 + 24) = v10;
  if (!--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    if ((*(_BYTE *)(a1 + 88) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (__CFRunLoop *)objc_msgSend(v11, "getCFRunLoop");

      v13 = (const void *)*MEMORY[0x1E0C9B280];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = ___SubcompletionGenerator_block_invoke_3;
      block[3] = &unk_1E200F6C0;
      v16 = *(_OWORD *)(a1 + 64);
      v15 = *(id *)(a1 + 40);
      v17 = *(_OWORD *)(a1 + 48);
      CFRunLoopPerformBlock(v12, v13, block);

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }

}

_QWORD *___SubcompletionGenerator_block_invoke_3(_QWORD *result)
{
  if (!*(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = 1;
    return (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(result[4] + 16))(result[4], *(unsigned __int8 *)(*(_QWORD *)(result[7] + 8) + 24), *(unsigned __int8 *)(*(_QWORD *)(result[8] + 8) + 24));
  }
  return result;
}

@end
