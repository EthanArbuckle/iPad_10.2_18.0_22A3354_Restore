@implementation UIBlendingHighlightView

uint64_t __42___UIBlendingHighlightView_layoutSubviews__block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

void __42___UIBlendingHighlightView_layoutSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  double v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_currentScreenScale");
  UIRoundToViewScale(*(void **)(a1 + 32));
  v6 = v5;
  objc_msgSend(v4, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setBorderWidth:", v6);
}

void __44___UIBlendingHighlightView_setCornerRadius___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCornerRadius:", *(double *)(a1 + 32));

}

uint64_t __55___UIBlendingHighlightView__setContinuousCornerRadius___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setContinuousCornerRadius:", *(double *)(a1 + 32));
}

void __53___UIBlendingHighlightView_setRoundedCornerPosition___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaskedCorners:", *(_QWORD *)(a1 + 32));

}

@end
