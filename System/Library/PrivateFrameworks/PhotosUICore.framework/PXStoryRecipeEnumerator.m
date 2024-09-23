@implementation PXStoryRecipeEnumerator

id __34___PXStoryRecipeEnumerator__flush__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = a1 + 40;
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(v10 + 8);
    objc_msgSend(v4, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v9, v8, CFSTR("PFStoryRecipe+PXStory+PhotoKit.m"), 280, CFSTR("Error mapping cloud identifier (%@) to local identifier: %@"), v3, v11);

  }
  return v5;
}

void __34___PXStoryRecipeEnumerator__flush__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v11;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v7, "localIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKeyedSubscript:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "block");
  v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, id, uint64_t))v10)[2](v10, v9, v7, a4);

}

id __34___PXStoryRecipeEnumerator__flush__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CD14B0];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithStringValue:", v3);

  return v4;
}

@end
