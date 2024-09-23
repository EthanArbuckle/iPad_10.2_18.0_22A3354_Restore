@implementation SILanguageModelIsContentTokenInString

uint64_t __SILanguageModelIsContentTokenInString_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v9;
  uint64_t v10;

  if (a4[5] >= 1)
  {
    v9 = result;
    v10 = 0;
    while (1)
    {
      result = IsContentToken(*(_QWORD *)(v9 + 40), *(const __CFLocale **)(v9 + 48), a4, v10, 0, *(_DWORD **)(v9 + 56));
      if ((_DWORD)result)
        break;
      if (++v10 >= a4[5])
        goto LABEL_7;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v9 + 32) + 8) + 24) = 1;
  }
LABEL_7:
  *a7 = 1;
  return result;
}

@end
