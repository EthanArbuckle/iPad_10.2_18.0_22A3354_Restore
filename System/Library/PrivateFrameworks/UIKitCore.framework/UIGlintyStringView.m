@implementation UIGlintyStringView

uint64_t __43___UIGlintyStringView_fadeOutWithDuration___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "hide");
  return objc_msgSend(*(id *)(a1 + 32), "hideBlur");
}

uint64_t __43___UIGlintyStringView_fadeOutWithDuration___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "glintyFadeOutAnimationDidStop");
  objc_msgSend(*(id *)(a1 + 32), "setShowing:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setFading:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "stopAnimating");
}

uint64_t __42___UIGlintyStringView_fadeInWithDuration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "show");
}

uint64_t __42___UIGlintyStringView_fadeInWithDuration___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "glintyFadeInAnimationDidStop");
  objc_msgSend(*(id *)(a1 + 32), "setFading:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "updateBlurForHiddenRequesters");
}

uint64_t __37___UIGlintyStringView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateText");
}

@end
