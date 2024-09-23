@implementation TVCollectionWrappingView

uint64_t __50___TVCollectionWrappingView_reevaluateFooterFrame__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  float v7;
  float v8;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anchorPoint");
  v4 = v3;
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "setBounds:", 0.0, 0.0, *(double *)(a1 + 56), *(double *)(a1 + 64));
  v7 = *(double *)(a1 + 40) + *(double *)(a1 + 56) * v4;
  v8 = *(double *)(a1 + 48) + *(double *)(a1 + 64) * v6;
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", roundf(v7), roundf(v8));
}

uint64_t __50___TVCollectionWrappingView_reevaluateHeaderFrame__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  float v7;
  float v8;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anchorPoint");
  v4 = v3;
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "setBounds:", 0.0, 0.0, *(double *)(a1 + 56), *(double *)(a1 + 64));
  v7 = *(double *)(a1 + 40) + *(double *)(a1 + 56) * v4;
  v8 = *(double *)(a1 + 48) + *(double *)(a1 + 64) * v6;
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", roundf(v7), roundf(v8));
}

uint64_t __78___TVCollectionWrappingView_didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reevaluateHeaderFrame");
}

uint64_t __78___TVCollectionWrappingView_didUpdateFocusInContext_withAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reevaluateHeaderFrame");
}

uint64_t __49___TVCollectionWrappingView__updateGradientLayer__block_invoke(uint64_t a1, id a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(objc_retainAutorelease(a2), "CGColor"));
}

@end
