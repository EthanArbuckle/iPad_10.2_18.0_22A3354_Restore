@implementation UITextFieldPasscodeCutoutBackground

uint64_t __51___UITextFieldPasscodeCutoutBackground__updatePath__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "animationForKey:", CFSTR("path"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fromValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPath:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "removeAnimationForKey:", CFSTR("path"));
}

uint64_t __60___UITextFieldPasscodeCutoutBackground_setEnabled_animated___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;

  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[432])
  {
    objc_msgSend(v2, "_strokeColor:", *(unsigned __int8 *)(a1 + 40));
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = objc_msgSend(v3, "CGColor");
    objc_msgSend(*(id *)(a1 + 32), "_shapeLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStrokeColor:", v4);

    v2 = *(_BYTE **)(a1 + 32);
  }
  if (!v2[433])
  {
    objc_msgSend(v2, "_fillColor:", *(unsigned __int8 *)(a1 + 40));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "CGColor");
    objc_msgSend(*(id *)(a1 + 32), "_shapeLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFillColor:", v7);

    v2 = *(_BYTE **)(a1 + 32);
  }
  return objc_msgSend(v2, "_updatePath");
}

@end
