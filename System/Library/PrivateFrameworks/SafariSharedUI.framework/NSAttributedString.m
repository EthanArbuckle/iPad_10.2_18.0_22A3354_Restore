@implementation NSAttributedString

uint64_t __107__NSAttributedString_SafariSharedUIExtras__safari_attributedStringByReplacingAttributeName_withAttributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *(_QWORD *)(a1 + 40), a3, a4);
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", *(_QWORD *)(a1 + 48), a3, a4);
  return result;
}

@end
