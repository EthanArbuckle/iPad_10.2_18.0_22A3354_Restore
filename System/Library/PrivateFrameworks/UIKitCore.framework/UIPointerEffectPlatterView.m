@implementation UIPointerEffectPlatterView

void __46___UIPointerEffectPlatterView_setShadowAlpha___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newShadowView");
  objc_msgSend(*(id *)(a1 + 32), "setShadowView:", v2);

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "shadowView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentSourceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertSubview:aboveSubview:", v5, v4);

}

void __43___UIPointerEffectPlatterView_setTintMode___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[55];
  if ((unint64_t)(v3 - 1) >= 2)
  {
    if (!v3)
    {
      objc_msgSend(v2, "tintView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeFromSuperview");

      objc_msgSend(*(id *)(a1 + 32), "setTintView:", 0);
      objc_msgSend(*(id *)(a1 + 32), "lumaTrackingView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeFromSuperview");

      objc_msgSend(*(id *)(a1 + 32), "setLumaTrackingView:", 0);
    }
  }
  else
  {
    v4 = (void *)objc_msgSend(v2, "_newTintView");
    objc_msgSend(*(id *)(a1 + 32), "setTintView:", v4);

    objc_msgSend(*(id *)(a1 + 32), "_layoutTintView");
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "tintView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v6);

    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "tintView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "_newLumaTrackingViewForTintView:", v8);
    objc_msgSend(*(id *)(a1 + 32), "setLumaTrackingView:", v9);

    v10 = *(void **)(a1 + 32);
    objc_msgSend(v10, "lumaTrackingView");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v13);

  }
}

void __52___UIPointerEffectPlatterView_setSpecularHighlight___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[58];
  objc_msgSend(v2, "specularOverlayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "specularOverlayView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeFromSuperview");

      objc_msgSend(*(id *)(a1 + 32), "setSpecularOverlayView:", 0);
    }
    objc_msgSend(*(id *)(a1 + 32), "_specularOverlayView:withOptions:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464), objc_msgSend(*(id *)(a1 + 32), "specularOptions"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSpecularOverlayView:", v7);

    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "specularOverlayView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

  }
  else
  {
    objc_msgSend(v4, "removeFromSuperview");

    objc_msgSend(*(id *)(a1 + 32), "setSpecularOverlayView:", 0);
  }
}

@end
