@implementation NSArray

uint64_t __58__NSArray_TSUAdditions__tsu_arrayByTransformingWithBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (result)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", result);
  return result;
}

uint64_t __46__NSArray_TSUAdditions__tsu_arrayByFlattening__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(a2);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16))();
        else
          objc_msgSend(a3, "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v7 = result;
    }
    while (result);
  }
  return result;
}

@end
