@implementation TVLoadingView

uint64_t __30___TVLoadingView__showSpinner__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "startAnimating");
}

@end
