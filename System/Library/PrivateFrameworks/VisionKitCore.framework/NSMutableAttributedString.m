@implementation NSMutableAttributedString

uint64_t __95__NSMutableAttributedString_VK__vk_replaceCharactersInRange_withAttributedSubstring_fromRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", a2, a3 - *(_QWORD *)(a1 + 40) + *(_QWORD *)(a1 + 56), a4);
}

@end
