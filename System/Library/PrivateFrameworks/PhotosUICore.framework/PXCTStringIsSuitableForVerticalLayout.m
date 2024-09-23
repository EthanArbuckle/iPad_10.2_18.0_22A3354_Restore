@implementation PXCTStringIsSuitableForVerticalLayout

void ___PXCTStringIsSuitableForVerticalLayout_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  void *v9;

  objc_msgSend((id)_PXCTStringIsSuitableForVerticalLayout_forbiddenCharactersRegex, "firstMatchInString:options:range:", *(_QWORD *)(a1 + 32), 0, a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    *a7 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
}

void ___PXCTStringIsSuitableForVerticalLayout_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("[  \\p{Hang}]+"), 2, 0);
  v1 = (void *)_PXCTStringIsSuitableForVerticalLayout_forbiddenCharactersRegex;
  _PXCTStringIsSuitableForVerticalLayout_forbiddenCharactersRegex = v0;

}

@end
