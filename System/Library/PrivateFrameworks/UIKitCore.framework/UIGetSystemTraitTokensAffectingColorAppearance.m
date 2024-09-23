@implementation UIGetSystemTraitTokensAffectingColorAppearance

uint64_t ___UIGetSystemTraitTokensAffectingColorAppearance_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2));
}

@end
