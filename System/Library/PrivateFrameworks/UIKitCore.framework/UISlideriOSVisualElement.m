@implementation UISlideriOSVisualElement

uint64_t __40___UISlideriOSVisualElement__initImages__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "setMinimumTrackImage:forState:", *(_QWORD *)(a1 + 40), 0);
}

void __76___UISlideriOSVisualElement__modernThumbImageWithTraitCollection_tintColor___block_invoke_2(_QWORD *a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)a1[4];
  if (v2)
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(objc_retainAutorelease(v2), "CGColor");
  }
  else
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v3, "CGColor");

  }
  +[UIColor _controlShadowColor](UIColor, "_controlShadowColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v4, "CGColor");

}

void __67___UISlideriOSVisualElement__updateMaxTrackColorForInitialization___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  double v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "slider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMaximumTrackImage:forStates:", 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "slider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaximumTrackImage:forStates:", 0, 7);

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 544));
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(WeakRetained, "trackRectForBounds:");
  +[UIProgressView _tintedImageWithTraitCollection:forHeight:andColors:](UIProgressView, "_tintedImageWithTraitCollection:forHeight:andColors:", v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520), v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = dyld_program_sdk_at_least();
  objc_msgSend(*(id *)(a1 + 32), "slider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((_DWORD)v3)
    objc_msgSend(v7, "setMaximumTrackImage:forStates:", v9, 0);
  else
    objc_msgSend(v7, "setMaximumTrackImage:forState:", v9, 0);

}

void __63___UISlideriOSVisualElement__traitCollectionDidChangeInternal___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
  {
    os_variant_has_internal_diagnostics();
    +[UITraitCollection _currentTraitCollectionIfExists]();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "traitCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v2);

    v3 = (void *)_UISetCurrentFallbackEnvironment(v1);
    objc_msgSend(v1, "slider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "minimumTrackTintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v1, "_updateMinimumTrackTintColor");
    objc_msgSend(v1, "slider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "maximumTrackTintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)v1[65];
      v1[65] = 0;

      objc_msgSend(v1, "_updateMaxTrackColorForInitialization:", 0);
    }
    objc_msgSend(v1, "_rebuildControlThumb:track:", 1, 1);
    _UIRestorePreviousFallbackEnvironment(v3);
    +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v9);
    objc_msgSend(v1, "_layoutSubviewsForBoundsChange:", 0);

  }
}

void __54___UISlideriOSVisualElement_drawingMetricsForPlatform__block_invoke()
{
  void *v0;
  uint64_t v1;
  double v2;
  int32x2_t v3;
  int64x2_t v4;
  int8x16_t v5;
  int8x16_t v11;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  v2 = 31.0;
  v3 = vdup_n_s32(v1 == 5);
  if (v1 == 5)
    v2 = 20.0;
  v4.i64[0] = v3.u32[0];
  v4.i64[1] = v3.u32[1];
  v5 = (int8x16_t)vcltzq_s64(vshlq_n_s64(v4, 0x3FuLL));
  __asm { FMOV            V3.2D, #2.0 }
  xmmword_1ECD7B510 = (__int128)vbslq_s8(v5, _Q3, (int8x16_t)xmmword_1866818A0);
  v11 = vbslq_s8(v5, (int8x16_t)xmmword_1866818C0, (int8x16_t)xmmword_1866818B0);
  qword_1ECD7B520 = v11.i64[0];
  *(int8x16_t *)algn_1ECD7B528 = v11;
  __asm { FMOV            V3.2D, #24.0 }
  *(__int128 *)((char *)&xmmword_1ECD7B530 + 8) = (__int128)vbslq_s8(v5, _Q3, (int8x16_t)xmmword_1866818D0);
  qword_1ECD7B548 = *(_QWORD *)&v2;
}

void __76___UISlideriOSVisualElement__modernThumbImageWithTraitCollection_tintColor___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  CGContext *v5;
  uint64_t v6;
  double v7;
  CGFloat v8;
  void *v9;
  CGContext *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize v15;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "userInterfaceIdiom");
  v5 = (CGContext *)objc_msgSend(v3, "CGContext");
  v6 = 0;
  if (v4 == 5)
  {
    v7 = 0.0;
    v8 = 1.0;
  }
  else
  {
    v7 = 6.0;
    v8 = 13.0;
  }
  CGContextSetShadowWithColor(v5, *(CGSize *)&v6, v8, *(CGColorRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  CGContextSetFillColorWithColor((CGContextRef)objc_msgSend(v3, "CGContext"), *(CGColorRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  +[_UISlideriOSVisualElement drawingMetricsForPlatform](_UISlideriOSVisualElement, "drawingMetricsForPlatform");
  +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fill");
  CGContextSetStrokeColorWithColor((CGContextRef)objc_msgSend(v3, "CGContext"), *(CGColorRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  if (objc_msgSend(*(id *)(a1 + 32), "userInterfaceIdiom") == 5)
  {
    objc_msgSend(v9, "stroke");
  }
  else
  {
    v10 = (CGContext *)objc_msgSend(v3, "CGContext");
    v15.width = 0.0;
    v15.height = 0.5;
    CGContextSetShadowWithColor(v10, v15, 4.0, *(CGColorRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    objc_msgSend(v9, "fill");
  }

}

void __76___UISlideriOSVisualElement__modernThumbImageWithTraitCollection_tintColor___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_MergedGlobals_19_3;
  _MergedGlobals_19_3 = (uint64_t)v0;

}

uint64_t __47___UISlideriOSVisualElement_setValue_animated___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_setValue:andSendAction:", 0, a2);
}

uint64_t __47___UISlideriOSVisualElement_setValue_animated___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sliderAnimationDidStop:", a2);
}

uint64_t __70___UISlideriOSVisualElement_didChangeMinimumTrackVisibleWithDuration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, a2, a3, *(double *)(a1 + 32), 0.0);
}

uint64_t __70___UISlideriOSVisualElement_didChangeMinimumTrackVisibleWithDuration___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 448);
  if (*(_BYTE *)(a1 + 40))
    v3 = 1.0;
  else
    v3 = 0.0;
  objc_msgSend(v2, "setAlpha:", v3);
  if (*(_BYTE *)(a1 + 40))
    v4 = 1.0;
  else
    v4 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", v4);
}

@end
