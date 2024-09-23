@implementation PXGCreateDictionaryWithTransforms

void __PXGCreateDictionaryWithTransforms_block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  id v7;
  void *v8;
  id v9;

  v5 = a1[4];
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = a3;
  v6(v5, a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[5] + 16))();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setObject:forKey:", v8, v9);
}

@end
