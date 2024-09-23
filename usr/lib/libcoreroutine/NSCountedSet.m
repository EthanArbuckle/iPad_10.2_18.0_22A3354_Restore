@implementation NSCountedSet

uint64_t __56__NSCountedSet_RTExtensions__arrayOrderedByHighestCount__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(v5, "countForObject:", a2);
  v8 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v6);

  if (v7 <= v8)
    v9 = 0;
  else
    v9 = -1;
  if (v7 < v8)
    return 1;
  else
    return v9;
}

@end
