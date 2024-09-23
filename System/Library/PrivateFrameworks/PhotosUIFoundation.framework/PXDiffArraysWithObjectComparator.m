@implementation PXDiffArraysWithObjectComparator

uint64_t __PXDiffArraysWithObjectComparator_block_invoke_2(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  if (*a2 > *a3)
    return 1;
  else
    return ((uint64_t)(*a2 - *a3) >> 63);
}

uint64_t __PXDiffArraysWithObjectComparator_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __PXDiffArraysWithObjectComparator_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v3 = 0x7FFFFFFFFFFFFFFFLL;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * a2);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __PXDiffArraysWithObjectComparator_block_invoke_4;
  v8[3] = &unk_2514CFE30;
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8[4] = v5;
  v8[5] = v7;
  v8[6] = &v9;
  v8[7] = v4;
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", v8);
  if (v10[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeIndex:");
    v3 = v10[3];
  }
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 64), (const void *)v3);
  _Block_object_dispose(&v9, 8);
}

uint64_t __PXDiffArraysWithObjectComparator_block_invoke_4(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (!(_DWORD)result)
  {
    *a3 = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  }
  return result;
}

@end
