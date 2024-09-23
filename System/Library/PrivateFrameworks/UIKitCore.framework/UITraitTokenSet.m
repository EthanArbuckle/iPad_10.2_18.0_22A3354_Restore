@implementation UITraitTokenSet

_UITraitTokenSet *__28___UITraitTokenSet_emptySet__block_invoke()
{
  _UITraitTokenSet *result;

  result = objc_alloc_init(_UITraitTokenSet);
  qword_1ECD81BD8 = (uint64_t)result;
  return result;
}

uint64_t __34___UITraitTokenSet_allTraitTokens__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2));
}

@end
