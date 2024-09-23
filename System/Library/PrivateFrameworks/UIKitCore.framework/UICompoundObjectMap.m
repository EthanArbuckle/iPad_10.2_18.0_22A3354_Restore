@implementation UICompoundObjectMap

void __40___UICompoundObjectMap_performWithEach___block_invoke(uint64_t a1, id *a2)
{
  uint64_t v2;
  id *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    a2 = (id *)a2[1];
  v3 = a2;
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

void __77___UICompoundObjectMap_addEntriesFromCompoundObjectMap_keepingCurrentValues___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (!*(_BYTE *)(a1 + 40)
    || (objc_msgSend(*(id *)(a1 + 32), "valueForObject:andProperty:", v10, v7),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    objc_msgSend(*(id *)(a1 + 32), "setValue:forObject:andProperty:", v8, v10, v7);
  }

}

void __32___UICompoundObjectMap_deepCopy__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v6;
  id v7;
  id v8;
  id v9;

  v6 = *(void **)(a1 + 32);
  v7 = a3;
  v8 = a2;
  v9 = (id)objc_msgSend(a4, "copy");
  objc_msgSend(v6, "setValue:forObject:andProperty:", v9, v8, v7);

}

@end
