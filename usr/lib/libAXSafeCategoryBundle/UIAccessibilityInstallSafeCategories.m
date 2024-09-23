@implementation UIAccessibilityInstallSafeCategories

CFComparisonResult __UIAccessibilityInstallSafeCategories_block_invoke(void **a1, uint64_t a2, uint64_t a3)
{
  const __CFString *v4;
  const __CFString *v7;
  CFComparisonResult result;
  const __CFString *v9;
  const __CFString *v10;

  v4 = *(const __CFString **)(a2 + 32);
  if (!v4)
    return 0xFFFFFFFFLL;
  v7 = *(const __CFString **)(a3 + 32);
  if (v7)
  {
    result = CFStringCompare(v4, v7, 0);
    if (result)
      return result;
    if ((_UIAccessibilitySafeCategoryDependsOnSafeCategory((void **)a2, a3, a1[4], a1[5], a1[6]) & 1) != 0)
      return -1;
    if ((_UIAccessibilitySafeCategoryDependsOnSafeCategory((void **)a3, a2, a1[4], a1[5], a1[6]) & 1) == 0)
    {
      v9 = *(const __CFString **)(a2 + 16);
      if (!v9)
        return -1;
      v10 = *(const __CFString **)(a3 + 16);
      if (v10)
        return CFStringCompare(v9, v10, 0);
    }
  }
  return 1;
}

@end
