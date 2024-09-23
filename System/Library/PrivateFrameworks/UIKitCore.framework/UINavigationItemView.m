@implementation UINavigationItemView

uint64_t __49___UINavigationItemView__crossFadeHiddingButton___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 1.0);
}

@end
