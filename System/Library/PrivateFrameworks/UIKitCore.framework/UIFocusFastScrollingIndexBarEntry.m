@implementation UIFocusFastScrollingIndexBarEntry

double __76___UIFocusFastScrollingIndexBarEntry_placeholderEntryWithEntryBefore_after___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(*(id *)(a1 + 32), "contentOffset");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 40), "contentOffset");
  return (v3 + v4) * 0.5;
}

@end
