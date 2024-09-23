@implementation TCCAccessSetForAuditToken

uint64_t __TCCAccessSetForAuditToken_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t result;

  result = TCCAccessSetInternal(*(const __CFString **)(a1 + 40), 0, 0, (const void *)(a1 + 48), *(unsigned __int8 *)(a1 + 80), 0, a7, 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
