@implementation UIActivityItemsGetUTIs

uint64_t ___UIActivityItemsGetUTIs_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  *a4 = 1;
  return result;
}

@end
