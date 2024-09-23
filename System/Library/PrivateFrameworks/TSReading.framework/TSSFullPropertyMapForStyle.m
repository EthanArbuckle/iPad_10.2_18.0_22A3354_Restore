@implementation TSSFullPropertyMapForStyle

uint64_t __TSSFullPropertyMapForStyle_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "boxedValueForProperty:", a2);
  if (result)
    return objc_msgSend(*(id *)(a1 + 40), "setBoxedObject:forProperty:", result, a2);
  return result;
}

@end
