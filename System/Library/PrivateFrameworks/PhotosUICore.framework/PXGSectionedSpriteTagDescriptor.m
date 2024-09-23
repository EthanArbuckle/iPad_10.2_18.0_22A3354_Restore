@implementation PXGSectionedSpriteTagDescriptor

uint64_t __PXGSectionedSpriteTagDescriptor_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%llx={ds:%hhu,section:%hu,kind:%hhu}"), a2, BYTE1(a2), WORD1(a2), a2);
}

@end
