@implementation UIStickerItemProviderWithMetadata

uint64_t ___UIStickerItemProviderWithMetadata_block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  UIImage *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v3 = *(UIImage **)(a1 + 32);
  v4 = a2;
  UIImagePNGRepresentation(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))a2)[2](v4, v5, 0);

  return 0;
}

uint64_t ___UIStickerItemProviderWithMetadata_block_invoke_2(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
  return 0;
}

uint64_t ___UIStickerItemProviderWithMetadata_block_invoke_3(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))a2)[2](v4, v5, 0);

  return 0;
}

uint64_t ___UIStickerItemProviderWithMetadata_block_invoke_4(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99D50];
  v4 = a2;
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))a2)[2](v4, v5, 0);

  return 0;
}

@end
