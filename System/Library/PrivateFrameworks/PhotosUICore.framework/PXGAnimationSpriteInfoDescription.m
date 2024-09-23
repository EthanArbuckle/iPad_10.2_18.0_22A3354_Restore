@implementation PXGAnimationSpriteInfoDescription

uint64_t __PXGAnimationSpriteInfoDescription_block_invoke(uint64_t result, unsigned __int8 a2)
{
  if ((*(_BYTE *)(result + 346) & a2) != 0)
    return objc_msgSend(*(id *)(result + 32), "addObject:");
  return result;
}

@end
