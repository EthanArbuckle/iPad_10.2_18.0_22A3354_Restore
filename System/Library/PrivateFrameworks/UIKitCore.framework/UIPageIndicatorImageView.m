@implementation UIPageIndicatorImageView

uint64_t __38___UIPageIndicatorImageView_setImage___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(*(id *)(a1 + 32), "center");
  v3 = v2;
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "sizeToFit");
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", v3, v5);
}

@end
