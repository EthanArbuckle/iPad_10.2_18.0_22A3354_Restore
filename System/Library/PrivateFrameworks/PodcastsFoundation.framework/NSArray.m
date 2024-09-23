@implementation NSArray

void __62__NSArray_MTStride__concurrentMapWithStrideSize_on_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1AF4138F4]();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "subarrayForStrideIndex:withStrideSize:", a2, *(_QWORD *)(a1 + 48), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_autoreleasePoolPop(v4);
}

uint64_t __50__NSArray_MTAdditions__mt_firstObjectPassingTest___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return (*(uint64_t (**)(void))(v1 + 16))();
  else
    return 1;
}

uint64_t __50__NSArray_MTAdditions__mt_firstObjectPassingTest___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *a4 = result;
  return result;
}

void __40__NSArray_MTAdditions__mt_uniqueOrdered__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  id v5;

  v3 = a2;
  if (v3)
  {
    v5 = v3;
    v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);
    v3 = v5;
    if ((v4 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
      v3 = v5;
    }
  }

}

@end
