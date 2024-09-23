@implementation PKVirtualCard

void __62__PKVirtualCard_PassSnapshot__cardArtworkWithSize_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;

  if (a2)
  {
    v4 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__PKVirtualCard_PassSnapshot__cardArtworkWithSize_completion___block_invoke_2;
    v10[3] = &unk_1E3E6A1E0;
    v5 = &v11;
    v6 = *(id *)(a1 + 48);
    v10[4] = *(_QWORD *)(a1 + 40);
    v11 = v6;
    objc_msgSend(v4, "snapshotWithPass:size:suppressedContent:completion:", a2, 4087, v10, *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__PKVirtualCard_PassSnapshot__cardArtworkWithSize_completion___block_invoke_4;
    v8[3] = &unk_1E3E618A0;
    v5 = &v9;
    v7 = *(id *)(a1 + 48);
    v8[4] = *(_QWORD *)(a1 + 40);
    v9 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v8);
  }

}

void __62__PKVirtualCard_PassSnapshot__cardArtworkWithSize_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PKVirtualCard_PassSnapshot__cardArtworkWithSize_completion___block_invoke_3;
  block[3] = &unk_1E3E61450;
  v7 = v3;
  v4 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __62__PKVirtualCard_PassSnapshot__cardArtworkWithSize_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(_QWORD))(v1 + 16))(*(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_genericCardIcon");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

void __62__PKVirtualCard_PassSnapshot__cardArtworkWithSize_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_genericCardIcon");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

@end
