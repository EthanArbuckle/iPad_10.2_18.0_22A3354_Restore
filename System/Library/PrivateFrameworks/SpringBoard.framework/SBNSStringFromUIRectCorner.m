@implementation SBNSStringFromUIRectCorner

uint64_t __SBNSStringFromUIRectCorner_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = objc_msgSend(*(id *)(a1 + 32), "length");
  if (result)
    result = objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("|"));
  v5 = a2 - 1;
  if ((unint64_t)(a2 - 1) <= 7 && ((0x8Bu >> v5) & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "appendString:", off_1E8EB6988[v5]);
  return result;
}

@end
