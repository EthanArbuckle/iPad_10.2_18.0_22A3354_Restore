@implementation PXStoryScrubberClipView

uint64_t __42___PXStoryScrubberClipView_layoutSubviews__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  unint64_t v4;

  v2 = 0.0;
  v3 = 0.0;
  if (*(_BYTE *)(a1 + 48))
  {
    LOBYTE(v3) = *(_BYTE *)(a1 + 49);
    v3 = (double)*(unint64_t *)&v3;
  }
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v3);
  if (!*(_BYTE *)(a1 + 48))
  {
    LOBYTE(v4) = *(_BYTE *)(a1 + 49);
    v2 = (double)v4;
  }
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", v2);
}

@end
