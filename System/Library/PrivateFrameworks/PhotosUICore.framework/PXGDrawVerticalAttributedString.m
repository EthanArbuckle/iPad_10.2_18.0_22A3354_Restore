@implementation PXGDrawVerticalAttributedString

uint64_t ___PXGDrawVerticalAttributedString_block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "drawAtPoint:inContext:", *(_QWORD *)(a1 + 64), *(double *)(a1 + 40), *(double *)(a1 + 32));
  return 1;
}

@end
