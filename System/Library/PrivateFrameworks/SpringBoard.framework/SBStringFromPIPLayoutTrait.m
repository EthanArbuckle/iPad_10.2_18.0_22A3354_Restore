@implementation SBStringFromPIPLayoutTrait

uint64_t __SBStringFromPIPLayoutTrait_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  const __CFString *v5;

  result = objc_msgSend(*(id *)(a1 + 32), "length");
  if (result)
    result = objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("+"));
  switch(a2)
  {
    case 1:
      v5 = CFSTR("Position");
      break;
    case 2:
      v5 = CFSTR("Size");
      break;
    case 4:
      v5 = CFSTR("Rotation");
      break;
    default:
      return result;
  }
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);
}

@end
