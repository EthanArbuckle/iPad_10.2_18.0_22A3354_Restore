@implementation UILoadingHandlerImageLoader

void __50___UILoadingHandlerImageLoader__really_loadImage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  if ((objc_msgSend(*(id *)(a1 + 32), "_isCancelled") & 1) == 0)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v4 = *(_QWORD *)(v2 + 56);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[2] = __50___UILoadingHandlerImageLoader__really_loadImage___block_invoke_2;
    v9[3] = &unk_1E16B7848;
    v9[1] = 3221225472;
    v9[4] = v2;
    v10 = v3;
    (*(void (**)(uint64_t, _QWORD *))(v4 + 16))(v4, v9);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = 0;

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 48);
    *(_QWORD *)(v7 + 48) = 0;

  }
}

void __50___UILoadingHandlerImageLoader__really_loadImage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  id v9;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
  v6 = a2;
  v7 = a3;
  v9 = v7;
  if (v6)
    v8 = 0;
  else
    v8 = v7;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
