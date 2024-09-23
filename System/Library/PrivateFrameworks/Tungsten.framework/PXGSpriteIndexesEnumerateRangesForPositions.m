@implementation PXGSpriteIndexesEnumerateRangesForPositions

void __PXGSpriteIndexesEnumerateRangesForPositions_block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  unint64_t v10;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40) + 4 * a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __PXGSpriteIndexesEnumerateRangesForPositions_block_invoke_2;
  v7[3] = &unk_251A6E480;
  v8 = v5;
  v9 = a2;
  v10 = a3;
  PXGSpriteIndexesEnumerateRanges(v6, a3, (uint64_t)v7);

}

uint64_t __PXGSpriteIndexesEnumerateRangesForPositions_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40) + a3);
}

@end
