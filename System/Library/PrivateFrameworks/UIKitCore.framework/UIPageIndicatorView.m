@implementation UIPageIndicatorView

void __31___UIPageIndicatorView_prepare__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateIndicatorExpandProgress");
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

@end
