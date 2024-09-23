@implementation NSMutableAttributedString

uint64_t __91__NSMutableAttributedString_IC_UI__ic_addForegroundColorInRangesWhereNoColorAlreadyExists___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "addIndexesInRange:");
  return result;
}

uint64_t __91__NSMutableAttributedString_IC_UI__ic_addForegroundColorInRangesWhereNoColorAlreadyExists___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E0DC1140], *(_QWORD *)(a1 + 40), a2, a3);
}

void __85__NSMutableAttributedString_ICTableAdditions__ic_convertParagraphStyleToBodyInRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  char isKindOfClass;
  _QWORD *v9;
  id v10;

  v7 = a2;
  if (v7)
  {
    v10 = v7;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = v10;
    if ((isKindOfClass & 1) != 0)
    {
      v9 = (_QWORD *)MEMORY[0x1E0D63928];
      objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E0D63928], a3, a4);
      objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *v9, *(_QWORD *)(a1 + 40), a3, a4);
      v7 = v10;
    }
  }

}

@end
