@implementation UINavigationItem

uint64_t __48__UINavigationItem_SUAdditions__fadeInTitleView__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationCurve:", 1);
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_titleView"), "setAlpha:", 1.0);
}

uint64_t __49__UINavigationItem_SUAdditions__fadeOutTitleView__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationCurve:", 2);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __49__UINavigationItem_SUAdditions__fadeOutTitleView__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

@end
