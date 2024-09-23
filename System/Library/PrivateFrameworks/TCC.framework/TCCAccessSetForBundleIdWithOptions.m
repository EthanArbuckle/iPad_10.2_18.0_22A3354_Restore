@implementation TCCAccessSetForBundleIdWithOptions

uint64_t __TCCAccessSetForBundleIdWithOptions_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t result;

  result = TCCAccessSetInternal(*(const __CFString **)(a1 + 40), "bundle", *(const char **)(a1 + 48), 0, *(unsigned __int8 *)(a1 + 64), 0, a7, *(CFDictionaryRef *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
