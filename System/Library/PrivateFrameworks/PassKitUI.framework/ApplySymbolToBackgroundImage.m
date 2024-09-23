@implementation ApplySymbolToBackgroundImage

uint64_t __ApplySymbolToBackgroundImage_block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 40), "size");
  objc_msgSend(*(id *)(a1 + 40), "size");
  PKRectCenteredIntegralRect();
  return objc_msgSend(*(id *)(a1 + 40), "drawInRect:");
}

@end
