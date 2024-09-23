@implementation SILanguageModelEnumerateKeyPhrasesInString

uint64_t __SILanguageModelEnumerateKeyPhrasesInString_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFLocale *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[9];

  if (a4[5])
  {
    v8 = result;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 0x40000000;
    v14[2] = __SILanguageModelEnumerateKeyPhrasesInString_block_invoke_2;
    v14[3] = &unk_1E6E3EEF8;
    v14[6] = a4;
    v14[7] = a2;
    v14[8] = a3;
    v9 = *(_QWORD *)(result + 32);
    v12 = result + 56;
    v10 = *(_QWORD *)(result + 56);
    v11 = *(const __CFLocale **)(v12 + 8);
    v13 = *(_QWORD *)(v8 + 48);
    v14[4] = v9;
    v14[5] = v13;
    result = EnumerateKeyPhrases(v10, v11, a4, (uint64_t)v14);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v8 + 40) + 8) + 24) = result;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v8 + 48) + 8) + 24)
      || !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v8 + 40) + 8) + 24))
    {
      *a7 = 1;
    }
  }
  return result;
}

uint64_t __SILanguageModelEnumerateKeyPhrasesInString_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a5 = 1;
  return result;
}

@end
