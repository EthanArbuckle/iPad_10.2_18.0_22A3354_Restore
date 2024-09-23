@implementation UITableViewPrefetchContext

void __74___UITableViewPrefetchContext_computeIndexesToCancelForVisibleIndexRange___block_invoke(_QWORD *a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = a1[5];
  v4 = a2 >= v2;
  v3 = a2 - v2;
  v4 = !v4 || v3 >= a1[6];
  if (v4)
  {
    v7 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
    if (!v7)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v9 = *(_QWORD *)(a1[4] + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v7 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v11);

  }
}

uint64_t __74___UITableViewPrefetchContext_computeIndexesToCancelForVisibleIndexRange___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeIndex:", objc_msgSend(a2, "unsignedIntegerValue"));
}

void __101___UITableViewPrefetchContext_computeIndexesToRefreshForVisibleIndexRange_effectiveRefreshDirection___block_invoke(_QWORD *a1, unint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  if (a1[6] <= a2)
  {
    v3 = (void *)a1[5];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:");
  }
  else
  {
    v2 = (void *)a1[4];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "insertObject:atIndex:");
  }

}

uint64_t __72___UITableViewPrefetchContext_schedulePrefetchRequestAfterNextCACommit___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 8))
  {
    v2 = result;
    result = *(_QWORD *)(v1 + 16);
    if (result)
    {
      result = (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(v2 + 40));
      v1 = *(_QWORD *)(v2 + 32);
    }
    *(_BYTE *)(v1 + 8) = 0;
  }
  return result;
}

void __53___UITableViewPrefetchContext_cancelWithNewMaxIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
