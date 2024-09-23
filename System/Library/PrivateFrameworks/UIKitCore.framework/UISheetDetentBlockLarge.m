@implementation UISheetDetentBlockLarge

uint64_t _UISheetDetentBlockLarge_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "maximumDetentValue");
}

@end
