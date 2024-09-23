@implementation UIAnimatedImageTransitionButtonConfigurationVisualProvider

uint64_t __103___UIAnimatedImageTransitionButtonConfigurationVisualProvider__transitioningImageViewForConfiguration___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;

  v2 = *(double *)(a1 + 88);
  v3 = *(double *)(a1 + 96);
  v4 = *(double *)(a1 + 104);
  v5 = *(double *)(a1 + 112);
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", 0.0, 0.0, v4, v5);
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", v2 + v4 * 0.5, v3 + v5 * 0.5);
}

uint64_t __97___UIAnimatedImageTransitionButtonConfigurationVisualProvider__updateImageViewWithConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  CGAffineTransform v6;
  CGAffineTransform v7;
  _OWORD v8[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8[0] = *MEMORY[0x1E0C9BAA8];
  v8[1] = v3;
  v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v8);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  CGAffineTransformMakeScale(&v7, 0.3, 0.3);
  v4 = *(void **)(a1 + 40);
  v6 = v7;
  objc_msgSend(v4, "setTransform:", &v6);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __97___UIAnimatedImageTransitionButtonConfigurationVisualProvider__updateImageViewWithConfiguration___block_invoke_2(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "removeFromSuperview");
    return objc_msgSend(*(id *)(*(_QWORD *)(v2 + 40) + 256), "setHidden:", 0);
  }
  return result;
}

@end
