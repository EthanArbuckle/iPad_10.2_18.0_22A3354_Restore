@implementation UIView

uint64_t __88__UIView_SBHAdditions__scaleAndBlurForDuration_initiallyHidden_visibleAlpha_completion___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;

  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.001, 0.001);
  objc_msgSend(v2, "setTransform:", &v4);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __88__UIView_SBHAdditions__scaleAndBlurForDuration_initiallyHidden_visibleAlpha_completion___block_invoke_2(uint64_t a1)
{
  double v2;
  CGFloat v3;
  CGFloat v4;
  void *v5;
  CGAffineTransform v7;
  CGAffineTransform v8;

  if (*(_BYTE *)(a1 + 48))
  {
    v2 = *(double *)(a1 + 40);
    memset(&v8, 0, sizeof(v8));
    v3 = 1.0;
    v4 = 1.0;
  }
  else
  {
    memset(&v8, 0, sizeof(v8));
    v2 = 0.001;
    v3 = 0.001;
    v4 = 0.001;
  }
  CGAffineTransformMakeScale(&v8, v3, v4);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v2);
  v5 = *(void **)(a1 + 32);
  v7 = v8;
  return objc_msgSend(v5, "setTransform:", &v7);
}

uint64_t __88__UIView_SBHAdditions__scaleAndBlurForDuration_initiallyHidden_visibleAlpha_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
