@implementation NSMutableAttributedString

uint64_t __78__NSMutableAttributedString_UIKitAdditions___ui_restoreOriginalFontAttributes__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *(_QWORD *)off_1E1678D90, a2, a3, a4);
  return objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *(_QWORD *)off_1E1678F78, a3, a4);
}

@end
