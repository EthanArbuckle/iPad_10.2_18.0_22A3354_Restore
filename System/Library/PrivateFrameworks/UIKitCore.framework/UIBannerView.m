@implementation UIBannerView

uint64_t __45___UIBannerView_setHighlighted_initialPress___block_invoke(uint64_t a1)
{
  int v1;
  void *v2;
  double v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 440);
  v3 = 0.3;
  if (!v1)
    v3 = 0.0;
  return objc_msgSend(v2, "setAlpha:", v3);
}

@end
