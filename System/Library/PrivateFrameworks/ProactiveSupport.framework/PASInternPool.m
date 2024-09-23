@implementation PASInternPool

void __36___PASInternPool__intern_copyInput___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "member:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = *(unsigned __int8 *)(a1 + 56);
    if (*(_BYTE *)(a1 + 56))
    {
      (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "allocationZone"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(void **)(a1 + 32);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);
    if (v4)

    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v6 != *(_QWORD *)(a1 + 32))
    {
      if (!malloc_size(*(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)))
        goto LABEL_12;
      v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    objc_msgSend(v7, "addObject:", v6);
    goto LABEL_12;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v3);
LABEL_12:

}

id __48___PASInternPool_initWithBehavior_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copyWithZone:");
}

uint64_t __23___PASInternPool_clear__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllObjects");
}

uint64_t __25___PASInternPool_isEmpty__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result == 0;
  return result;
}

uint64_t __29___PASInternPool_isInterned___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "containsObject:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
