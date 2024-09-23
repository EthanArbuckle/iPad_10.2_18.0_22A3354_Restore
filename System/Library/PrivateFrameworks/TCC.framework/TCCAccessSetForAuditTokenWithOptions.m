@implementation TCCAccessSetForAuditTokenWithOptions

uint64_t __TCCAccessSetForAuditTokenWithOptions_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t result;

  result = TCCAccessSetInternal(*(const __CFString **)(a1 + 40), 0, 0, (const void *)(a1 + 56), *(unsigned __int8 *)(a1 + 88), 0, a7, *(CFDictionaryRef *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
