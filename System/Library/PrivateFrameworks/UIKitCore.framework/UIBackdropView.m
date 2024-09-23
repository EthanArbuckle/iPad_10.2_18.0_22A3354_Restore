@implementation UIBackdropView

void __33___UIBackdropView_applySettings___block_invoke_5(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "backdropEffectView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __52___UIBackdropView_adjustTintImplementationIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (*(_BYTE *)(a1 + 48))
  {
    if (*(_BYTE *)(a1 + 49))
    {
      objc_msgSend(*(id *)(a1 + 32), "setTintFilter:", 0);
      objc_msgSend(*(id *)(a1 + 32), "_updateFilters");
      objc_msgSend(*(id *)(a1 + 32), "grayscaleTintView");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setHidden:", 0);

      objc_msgSend(*(id *)(a1 + 32), "colorTintView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setHidden:", 0);

      objc_msgSend(*(id *)(a1 + 32), "setBackdropVisible:", objc_msgSend(*(id *)(a1 + 40), "isBackdropVisible"));
    }
  }
  else if (*(_BYTE *)(a1 + 50) && !*(_BYTE *)(a1 + 49))
  {
    objc_msgSend(*(id *)(a1 + 32), "setBackdropVisible:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setTintFilterForSettings:", *(_QWORD *)(a1 + 40));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 824) = 0xBFF0000000000000;
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "blurRadius");
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 40), "blurQuality");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBlurFilterWithRadius:blurQuality:", v7, v6);

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 832) = 0xC059000000000000;
    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "saturationDeltaFactor");
    objc_msgSend(v8, "setSaturationDeltaFactor:");
    objc_msgSend(*(id *)(a1 + 32), "grayscaleTintView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 1);

    objc_msgSend(*(id *)(a1 + 32), "colorTintView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 1);

  }
}

uint64_t __33___UIBackdropView_applySettings___block_invoke_6(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "backdropEffectView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "setBackdropVisible:", objc_msgSend(*(id *)(a1 + 40), "isBackdropVisible"));
  return objc_msgSend(*(id *)(a1 + 32), "_applyCornerRadiusToSubviews");
}

uint64_t __50___UIBackdropView_prepareForTransitionToSettings___block_invoke(uint64_t a1)
{
  void *v2;
  _BYTE *v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(*(id *)(a1 + 32), "inputSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "inputSettings");
    v3 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    v4 = v3[76] != 0;

  }
  else
  {
    v4 = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "setInputSettings:", *(_QWORD *)(a1 + 40));
  +[_UIBackdropViewSettings settingsForStyle:](_UIBackdropViewSettings, "settingsForStyle:", objc_msgSend(*(id *)(a1 + 40), "style"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setOutputSettings:", v5);

  objc_msgSend(*(id *)(a1 + 32), "outputSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "copyAdditionalSettingsFromSettings:", *(_QWORD *)(a1 + 40));

  v7 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(*(_QWORD *)(v7 + 488) + 76))
    v8 = 1;
  else
    v8 = v4;
  *(_BYTE *)(v7 + 443) = v8;
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v9, "inputSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateSubviewHierarchyIfNeededForSettings:", v10);

  objc_msgSend(*(id *)(a1 + 32), "inputSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v11, "isBackdropVisible");

  if ((_DWORD)v10)
    objc_msgSend(*(id *)(a1 + 32), "setBackdropVisible:", 1);
  v12 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v12 + 443))
  {
    objc_msgSend(*(id *)(v12 + 512), "backdropLayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShouldRasterize:", 1);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "backdropLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setScale:", 0.5);
LABEL_14:

    return objc_msgSend(*(id *)(a1 + 32), "setStyle:", objc_msgSend(*(id *)(a1 + 40), "style"));
  }
  if (*(_BYTE *)(a1 + 48) || *(_BYTE *)(a1 + 49))
  {
    objc_msgSend((id)v12, "backdropEffectView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "backdropLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setScale:", 1.0);

    goto LABEL_14;
  }
  return objc_msgSend(*(id *)(a1 + 32), "setStyle:", objc_msgSend(*(id *)(a1 + 40), "style"));
}

uint64_t __55___UIBackdropView_computeAndApplySettingsForTransition__block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "transitionComplete");
  return result;
}

void __35___UIBackdropView_allBackdropViews__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  _AllBackdropViews();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __53___UIBackdropView_applySettingsWithBuiltInAnimation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applySettings:", *(_QWORD *)(a1 + 40));
}

void __53___UIBackdropView_applySettingsWithBuiltInAnimation___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "outputSettings");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "adjustTintImplementationIfNeeded:", v2);

}

uint64_t __33___UIBackdropView_applySettings___block_invoke(double *a1)
{
  double v1;
  double v2;
  _QWORD v4[5];

  v1 = a1[5];
  v2 = a1[6];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33___UIBackdropView_applySettings___block_invoke_2;
  v4[3] = &unk_1E16B1B28;
  *(double *)&v4[4] = a1[4];
  return +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v4, v1, v2);
}

void __33___UIBackdropView_applySettings___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "backdropEffectView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __33___UIBackdropView_applySettings___block_invoke_3(uint64_t a1)
{
  double v1;
  _QWORD v3[5];

  v1 = 1.0 - *(double *)(a1 + 40) - *(double *)(a1 + 48);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33___UIBackdropView_applySettings___block_invoke_4;
  v3[3] = &unk_1E16B1B28;
  v3[4] = *(_QWORD *)(a1 + 32);
  return +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v3, v1);
}

void __33___UIBackdropView_applySettings___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "backdropEffectView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

@end
