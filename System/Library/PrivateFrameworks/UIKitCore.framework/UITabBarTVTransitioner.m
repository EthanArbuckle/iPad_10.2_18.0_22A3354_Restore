@implementation UITabBarTVTransitioner

uint64_t __45___UITabBarTVTransitioner_animateTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __45___UITabBarTVTransitioner_animateTransition___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __45___UITabBarTVTransitioner_animateTransition___block_invoke_3(uint64_t a1)
{
  void *v2;
  CGRect v4;
  CGRect v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "frame");
  v5 = CGRectOffset(v4, dbl_18667A1E0[*(_BYTE *)(a1 + 80) == 0], 0.0);
  objc_msgSend(v2, "setFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
  return objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __45___UITabBarTVTransitioner_animateTransition___block_invoke_4(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "finishTransition");
  return result;
}

uint64_t __45___UITabBarTVTransitioner_animateTransition___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

uint64_t __45___UITabBarTVTransitioner_animateTransition___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishTransition");
}

@end
