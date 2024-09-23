@implementation UISystemBackgroundView

void __66___UISystemBackgroundView__transitionFromCustomView_toCustomView___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;

  if (a3)
  {
    v4 = *(void **)(a1 + 48);
    if (v4)
      -[_UISystemBackgroundView _removeInternalSubview:ofType:](*(_BYTE **)(a1 + 40), v4, 4);
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    if (v5)
    {
      -[_UISystemBackgroundView _removeInternalSubview:ofType:](*(_BYTE **)(a1 + 40), v5, 4);
      objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
    }
  }
}

void __70___UISystemBackgroundView__transitionFromHadColorView_toHasColorView___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 416), *(id *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setBackgroundColor:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    -[_UISystemBackgroundView _removeInternalSubview:ofType:](*(_BYTE **)(a1 + 32), *(void **)(a1 + 40), 1);
  }
}

uint64_t __66___UISystemBackgroundView__transitionFromCustomView_toCustomView___block_invoke(uint64_t a1)
{
  -[_UISystemBackgroundView _addInternalSubview:ofType:](*(_BYTE **)(a1 + 32), *(void **)(a1 + 40), (unsigned __int8 *)4);
  -[_UISystemBackgroundView _layoutCustomView](*(unsigned __int8 **)(a1 + 32));
  -[_UISystemBackgroundView _updateCornerMaskingForType:](*(_QWORD *)(a1 + 32), 4);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

void __70___UISystemBackgroundView__transitionFromHadColorView_toHasColorView___block_invoke(uint64_t a1)
{
  UIView *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(UIView);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 416);
  *(_QWORD *)(v3 + 416) = v2;

  +[UIColor clearColor](UIColor, "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setBackgroundColor:", v5);

  -[_UISystemBackgroundView _addInternalSubview:ofType:](*(_BYTE **)(a1 + 32), *(void **)(*(_QWORD *)(a1 + 32) + 416), (unsigned __int8 *)1);
  -[_UISystemBackgroundView _layoutColorView](*(unsigned __int8 **)(a1 + 32));
  -[_UISystemBackgroundView _updateCornerMaskingForType:](*(_QWORD *)(a1 + 32), 1);
}

void __44___UISystemBackgroundView_setConfiguration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 480), *(id *)(a1 + 40));
}

void __136___UISystemBackgroundView__transitionFromVisualEffect_toVisualEffect_oldGroupName_newGroupName_oldblurClippingMode_newblurClippingMode___block_invoke(uint64_t a1)
{
  UIVisualEffectView *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", 0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 424);
  *(_QWORD *)(v3 + 424) = v2;

  +[UIColor clearColor](UIColor, "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  -[_UISystemBackgroundView _addInternalSubview:ofType:](*(_BYTE **)(a1 + 32), *(void **)(*(_QWORD *)(a1 + 32) + 424), (unsigned __int8 *)2);
  -[_UISystemBackgroundView _layoutVisualEffectView](*(unsigned __int8 **)(a1 + 32));
  -[_UISystemBackgroundView _updateCornerMaskingForType:](*(_QWORD *)(a1 + 32), 2);
}

void __136___UISystemBackgroundView__transitionFromVisualEffect_toVisualEffect_oldGroupName_newGroupName_oldblurClippingMode_newblurClippingMode___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 424), *(id *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setEffect:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "_setGroupName:", *(_QWORD *)(a1 + 56));
    v4 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "contentView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

  }
  else
  {
    -[_UISystemBackgroundView _removeInternalSubview:ofType:](*(_BYTE **)(a1 + 32), *(void **)(a1 + 40), 2);
  }
}

uint64_t __56___UISystemBackgroundView__transitionFromImage_toImage___block_invoke(uint64_t a1)
{
  UIImageView *v2;
  uint64_t v3;
  void *v4;

  v2 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 432);
  *(_QWORD *)(v3 + 432) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setContentMode:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "imageContentMode"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "_setAnimatesContents:", 1);
  -[_UISystemBackgroundView _addInternalSubview:ofType:](*(_BYTE **)(a1 + 32), *(void **)(*(_QWORD *)(a1 + 32) + 432), (unsigned __int8 *)3);
  -[_UISystemBackgroundView _layoutImageView](*(unsigned __int8 **)(a1 + 32));
  -[_UISystemBackgroundView _updateCornerMaskingForType:](*(_QWORD *)(a1 + 32), 3);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.0);
}

void __56___UISystemBackgroundView__transitionFromImage_toImage___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 432), *(id *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 1.0);
  }
  else
  {
    -[_UISystemBackgroundView _removeInternalSubview:ofType:](*(_BYTE **)(a1 + 32), *(void **)(a1 + 40), 3);
  }
}

uint64_t __93___UISystemBackgroundView__transitionViewBasedShadowFromShadowProperties_toShadowProperties___block_invoke(uint64_t a1)
{
  UIView *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(UIView);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 448);
  *(_QWORD *)(v3 + 448) = v2;

  -[_UISystemBackgroundView _addInternalSubview:ofType:](*(_BYTE **)(a1 + 32), *(void **)(*(_QWORD *)(a1 + 32) + 448), 0);
  -[_UISystemBackgroundView _layoutShadowView](*(unsigned __int8 **)(a1 + 32));
  -[_UISystemBackgroundView _updateCornerMaskingForType:](*(_QWORD *)(a1 + 32), 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 0.0);
}

void __93___UISystemBackgroundView__transitionViewBasedShadowFromShadowProperties_toShadowProperties___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 448), *(id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
  }
  else
  {
    -[_UISystemBackgroundView _removeInternalSubview:ofType:](*(_BYTE **)(a1 + 32), *(void **)(a1 + 40), 0);
  }
}

void __64___UISystemBackgroundView__transitionFromHadStroke_toHasStroke___block_invoke(uint64_t a1)
{
  _UISystemBackgroundStrokeView *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(_UISystemBackgroundStrokeView);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 440);
  *(_QWORD *)(v3 + 440) = v2;

  -[_UISystemBackgroundView _addInternalSubview:ofType:](*(_BYTE **)(a1 + 32), *(void **)(*(_QWORD *)(a1 + 32) + 440), (unsigned __int8 *)5);
  -[_UISystemBackgroundView _layoutStrokeView](*(id **)(a1 + 32));
  -[_UISystemBackgroundView _updateCornerMaskingForType:](*(_QWORD *)(a1 + 32), 5);
}

void __64___UISystemBackgroundView__transitionFromHadStroke_toHasStroke___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 440), *(id *)(a1 + 40));
  else
    -[_UISystemBackgroundView _removeInternalSubview:ofType:](*(_BYTE **)(a1 + 32), *(void **)(a1 + 40), 5);
}

@end
