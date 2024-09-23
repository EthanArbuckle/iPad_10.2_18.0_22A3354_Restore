@implementation UIArrayController

void __41___UIArrayController_setSortDescriptors___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 16) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v4;

    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count"))
    {
      v7 = *(id **)(a1 + 32);
      objc_msgSend(v7[6], "array");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "processUpdate:changedObjects:", v8, 0);

    }
  }
}

void __37___UIArrayController_sortDescriptors__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __35___UIArrayController_setPredicate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 24) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v4;

  }
}

void __31___UIArrayController_predicate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __32___UIArrayController_invalidate__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setDelegate:", 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
  return result;
}

void __51___UIArrayController_processUpdate_changedObjects___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
    v4 = v3;
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v11 = v5;
      if (*(_QWORD *)(v6 + 24))
      {
        objc_msgSend(v5, "filterUsingPredicate:");
        v6 = *(_QWORD *)(a1 + 32);
      }
      if (*(_QWORD *)(v6 + 16))
        objc_msgSend(v11, "sortUsingDescriptors:");

      v7 = v11;
    }
    else
    {
      v7 = v3;
    }
    v12 = v7;
    objc_msgSend(*(id *)(a1 + 32), "_computeUpdatesFromOld:toNew:changedItems:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), v7, *(_QWORD *)(a1 + 48));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (*(_BYTE *)(a1 + 56) || v8)
    {
      v10 = (void *)objc_msgSend(v12, "copy");
      objc_msgSend(*(id *)(a1 + 32), "callUpdateHandler:changeDictionary:", v10, v9);

    }
  }
}

@end
