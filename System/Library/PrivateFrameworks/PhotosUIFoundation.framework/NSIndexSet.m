@implementation NSIndexSet

uint64_t __58__NSIndexSet_PhotosUIFoundation__px_isSingleRangeWithMax___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(_QWORD *)(v4 + 40))
  {
    a3 = 0;
    *a4 = 1;
    a2 = 0x7FFFFFFFFFFFFFFFLL;
  }
  *(_QWORD *)(v4 + 32) = a2;
  *(_QWORD *)(v4 + 40) = a3;
  return result;
}

uint64_t __61__NSIndexSet_PhotosUIFoundation__px_enumerateMap_usingBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a3)
  {
    v5 = a3;
    v7 = result;
    do
    {
      if (*a4)
        break;
      (*(void (**)(void))(*(_QWORD *)(v7 + 40) + 16))();
      v9 = v8;
      result = (*(uint64_t (**)(void))(*(_QWORD *)(v7 + 48) + 16))();
      a2 += v9;
      v5 -= v9;
    }
    while (v5);
  }
  return result;
}

uint64_t __41__NSIndexSet_PhotosUIFoundation__px_map___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndexesInRange:", a2, a3);
}

uint64_t __60__NSIndexSet_PhotosUIFoundation__px_intersectsWithIndexSet___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "intersectsIndexesInRange:", a2, a3);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __53__NSIndexSet_PhotosUIFoundation__px_shortDescription__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  if (a3 < 2)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), a2, v4);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu-%lu"), a2, a3 + a2 - 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

}

@end
