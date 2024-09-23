@implementation UIProgressiveBlurPresentationController

void __81___UIProgressiveBlurPresentationController__animateWithCoordinator_isPresenting___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setEffect:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.5, *(double *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

}

uint64_t __81___UIProgressiveBlurPresentationController__animateWithCoordinator_isPresenting___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81___UIProgressiveBlurPresentationController__animateWithCoordinator_isPresenting___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
