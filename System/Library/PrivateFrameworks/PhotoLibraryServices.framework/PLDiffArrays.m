@implementation PLDiffArrays

void __PLDiffArrays_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v3 = 0x7FFFFFFFFFFFFFFFLL;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __PLDiffArrays_block_invoke_2;
  v7[3] = &unk_1E366DC50;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7[6] = a2;
  v7[7] = v6;
  v7[4] = &v8;
  v7[5] = v5;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v7);
  if (v9[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeIndex:");
    v3 = v9[3];
  }
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 56), (const void *)v3);
  _Block_object_dispose(&v8, 8);
}

_QWORD *__PLDiffArrays_block_invoke_2(_QWORD *result, uint64_t a2, _BYTE *a3)
{
  if (*(_QWORD *)(result[5] + 8 * result[6]) == *(_QWORD *)(result[7] + 8 * a2))
  {
    *a3 = 1;
    *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) = a2;
  }
  return result;
}

@end
