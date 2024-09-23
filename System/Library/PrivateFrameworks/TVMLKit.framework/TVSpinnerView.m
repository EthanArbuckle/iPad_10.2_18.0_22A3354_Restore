@implementation TVSpinnerView

uint64_t __32___TVSpinnerView__addAnimations__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __35___TVSpinnerView__removeAnimations__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __35___TVSpinnerView__removeAnimations__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "layer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAnimationForKey:", CFSTR("repeatingGroupAnimation"));

}

@end
