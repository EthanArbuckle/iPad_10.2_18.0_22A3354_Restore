@implementation UISearchAtomBackgroundView

void __70___UISearchAtomBackgroundView__transitionFromBlurEffect_toBlurEffect___block_invoke(uint64_t a1)
{
  UIVisualEffectView *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  id v13;

  v2 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", 0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 416);
  *(_QWORD *)(v3 + 416) = v2;

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416));
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setFrame:");
  v5 = *(_QWORD **)(a1 + 32);
  v6 = (void *)v5[52];
  objc_msgSend(v5, "layer");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cornerRadius");
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cornerCurve");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == (void *)*MEMORY[0x1E0CD2A68];
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setCornerRadius:continuous:maskedCorners:", v11, objc_msgSend(v12, "maskedCorners"), v8);

}

uint64_t __70___UISearchAtomBackgroundView__transitionFromBlurEffect_toBlurEffect___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "removeFromSuperview");
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 416), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setEffect:", *(_QWORD *)(a1 + 48));
}

@end
