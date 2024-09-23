@implementation SILanguageModelCopyLocaleInString

uint64_t __SILanguageModelCopyLocaleInString_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t result;

  result = SILanguageModelCopyLocale(*(_QWORD *)(a1 + 40), a4, *(const __CFLocale **)(a1 + 48), 1);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a7 = 1;
  return result;
}

@end
