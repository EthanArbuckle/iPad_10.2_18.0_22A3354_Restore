@implementation TVNavigationZoomAnimator

uint64_t __47___TVNavigationZoomAnimator_animateTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

uint64_t __109___TVNavigationZoomAnimator__beginZoomAnimationFromViewController_toViewController_containerView_completion___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;

  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 1.5, 1.5);
  objc_msgSend(v2, "setTransform:", &v4);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __109___TVNavigationZoomAnimator__beginZoomAnimationFromViewController_toViewController_containerView_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  _OWORD v5[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v5[0] = *MEMORY[0x24BDBD8B8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldRasterize:", 0);

}

uint64_t __109___TVNavigationZoomAnimator__beginZoomAnimationFromViewController_toViewController_containerView_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __109___TVNavigationZoomAnimator__beginZoomAnimationFromViewController_toViewController_containerView_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldRasterize:", 0);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
