@implementation SBCallDescriptionBlockForEachVisibleAppLayoutByIndex

void ___SBCallDescriptionBlockForEachVisibleAppLayoutByIndex_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "succinctDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%lu %@ --> %@"), a3, v8, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

  }
}

@end
