@implementation PXCuratedLibrarySpritePredicate

BOOL __PXCuratedLibrarySpritePredicate_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  v5 = a3;
  v6 = v5;
  if (*(unsigned __int8 *)(a1 + 40) == *(unsigned __int8 *)(a2 + 216))
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(v5, "rootLayout");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 == *(void **)(a1 + 32);

    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
