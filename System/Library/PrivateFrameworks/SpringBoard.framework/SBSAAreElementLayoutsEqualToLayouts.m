@implementation SBSAAreElementLayoutsEqualToLayouts

void __SBSAAreElementLayoutsEqualToLayouts_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = SBSAIsElementLayoutEqualToLayout(v8, v9);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v7;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;
}

@end
