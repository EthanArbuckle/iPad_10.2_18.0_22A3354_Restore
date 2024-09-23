@implementation TSSPropertyStoreDiffPropertyNames

uint64_t __TSSPropertyStoreDiffPropertyNames_block_invoke(uint64_t a1, uint64_t a2)
{
  size_t *v4;
  uint64_t result;
  size_t *v6;
  size_t *v7;
  double v8;
  id *v9;

  v4 = p_TSSPropertyStoreSearch(*(size_t **)(a1 + 56), a2);
  result = (uint64_t)p_TSSPropertyStoreSearch(*(size_t **)(a1 + 64), a2);
  if (v4)
  {
    if (!result)
    {
      v9 = (id *)(a1 + 40);
      return objc_msgSend(*v9, "addProperty:", a2);
    }
    v6 = p_TSSPropertyStoreSearch(*(size_t **)(a1 + 56), a2);
    v7 = p_TSSPropertyStoreSearch(*(size_t **)(a1 + 64), a2);
    result = String((uint64_t)v6, (uint64_t)v7, v8);
    if ((result & 1) == 0)
    {
      v9 = (id *)(a1 + 32);
      return objc_msgSend(*v9, "addProperty:", a2);
    }
  }
  else if (result)
  {
    v9 = (id *)(a1 + 48);
    return objc_msgSend(*v9, "addProperty:", a2);
  }
  return result;
}

@end
