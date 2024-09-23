@implementation UIScrollViewGradientMaskView

void __107___UIScrollViewGradientMaskView_updateWithFrame_gradientStartInsets_gradientEndInsets_gradientIntensities___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v2 = objc_msgSend(*(id *)(a1 + 32), "gradientDirection");
  objc_msgSend(*(id *)(a1 + 32), "gradientLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    objc_msgSend(v3, "setStartPoint:", 0.0, 0.5);

    objc_msgSend(*(id *)(a1 + 32), "gradientLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 1.0;
    v8 = 0.5;
  }
  else
  {
    objc_msgSend(v3, "setStartPoint:", 0.5, 0.0);

    objc_msgSend(*(id *)(a1 + 32), "gradientLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0.5;
    v8 = 1.0;
  }
  objc_msgSend(v5, "setEndPoint:", v7, v8);

  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "gradientLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setColors:", v9);

  v11 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "gradientLayer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLocations:", v11);

}

@end
