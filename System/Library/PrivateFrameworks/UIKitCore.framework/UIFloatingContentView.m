@implementation UIFloatingContentView

uint64_t __40___UIFloatingContentView_initWithFrame___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", 0);
  v2 = *(void **)(a1 + 32);
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:forState:", v3, 8);

  v4 = *(void **)(a1 + 32);
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:forState:", v5, 1);

  v6 = *(void **)(a1 + 32);
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:forState:", v7, 4);

  objc_msgSend(*(id *)(a1 + 32), "setRoundContentWhenDeselected:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setFocusScaleAnchorPoint:", 0.5, 0.5);
  objc_msgSend(*(id *)(a1 + 32), "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
  objc_msgSend(*(id *)(a1 + 32), "setCornerRadius:", 4.5);
  v8 = *(void **)(a1 + 32);
  objc_msgSend((id)objc_opt_class(), "_defaultFocusAnimationConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFocusAnimationConfiguration:", v9);

  objc_msgSend(*(id *)(a1 + 32), "setVisualEffectContainerViewScaleFactor:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "setUseShadowImage:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setClipsContentToBounds:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setShadowContentsCenter:", 0.5, 0.5, 0.0, 0.0);
  objc_msgSend(*(id *)(a1 + 32), "setFocusedSizeIncrease:", 30.0);
  objc_msgSend(*(id *)(a1 + 32), "setShadowRadius:", 20.0);
  objc_msgSend(*(id *)(a1 + 32), "setShadowVerticalOffset:", 25.0);
  objc_msgSend(*(id *)(a1 + 32), "setShadowOpacity:forUserInterfaceStyle:", 1, 0.2);
  objc_msgSend(*(id *)(a1 + 32), "setShadowOpacity:forUserInterfaceStyle:", 2, 0.5);
  objc_msgSend(*(id *)(a1 + 32), "setUnfocusedShadowOpacity:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "setUnfocusedShadowRadius:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "setUnfocusedShadowVerticalOffset:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "setUnfocusedShadowExpansion:", 0.0, 0.0);
  objc_msgSend(*(id *)(a1 + 32), "setShadowExpansion:", 35.0, 35.0);
  return objc_msgSend(*(id *)(a1 + 32), "setShadowEnabled:", 1);
}

void __52___UIFloatingContentView__shadowPathForSize_radius___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  v1 = (void *)_MergedGlobals_11_2;
  _MergedGlobals_11_2 = v0;

}

void __68___UIFloatingContentView__setControlState_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "floatingContentDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "floatingContentDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "floatingContentView:didFinishTransitioningToState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 672));

  }
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "_updateContainerLayerQualityForPrimaryState:", objc_msgSend(*(id *)(a1 + 32), "_primaryStateForState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 672)));
}

uint64_t __68___UIFloatingContentView__setControlState_withAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[6];

  objc_msgSend(*(id *)(a1 + 32), "_layoutShadow");
  objc_msgSend(*(id *)(a1 + 32), "_updateTransformForPrimaryState:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateShadowContentsScaleForPrimaryState:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateHighContrastFocusIndicatorForPrimaryState:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCornerCurve:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 696));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "_shouldApplyCornerRadiusForPrimaryState:", *(_QWORD *)(a1 + 40));
  v5 = 0.0;
  if (v4)
    v5 = *(double *)(*(_QWORD *)(a1 + 32) + 600);
  objc_msgSend(v3, "setCornerRadius:", v5);

  if (*(_BYTE *)(a1 + 64))
  {
    +[UIView inheritedAnimationDuration](UIView, "inheritedAnimationDuration");
    v7 = v6 * *(double *)(a1 + 48);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68___UIFloatingContentView__setControlState_withAnimationCoordinator___block_invoke_3;
    v12[3] = &unk_1E16B1888;
    v8 = *(_QWORD *)(a1 + 40);
    v12[4] = *(_QWORD *)(a1 + 32);
    v12[5] = v8;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 32, v12, 0, v7, 0.0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateHighlightViewForPrimaryState:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_updateShadowOpacityForPrimaryState:", *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 32), "floatingContentDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatingContentView:isTransitioningFromState:toState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 672));

  v10 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40) == 8)
    return objc_msgSend(v10, "_installContentMotionEffects");
  else
    return objc_msgSend(v10, "_uninstallContentMotionEffects");
}

uint64_t __68___UIFloatingContentView__setControlState_withAnimationCoordinator___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateHighlightViewForPrimaryState:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateShadowOpacityForPrimaryState:", *(_QWORD *)(a1 + 40));
}

_QWORD *__65___UIFloatingContentView_setShadowOpacity_forUserInterfaceStyle___block_invoke(_QWORD *result)
{
  uint64_t v1;

  v1 = 31;
  if (result[5] == 2)
    v1 = 30;
  *(_QWORD *)(result[4] + OBJC_IVAR____UIFloatingContentView__backgroundColorsByState[v1]) = result[6];
  return result;
}

void __49___UIFloatingContentView__setShadowImageIfNeeded__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  _UIStretchableShadow *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "shadowRadius");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "cornerRadius");
  v5 = +[_UIStretchableShadow shadowWithRadius:cornerRadius:isContinuousCorner:white:](_UIStretchableShadow, "shadowWithRadius:cornerRadius:isContinuousCorner:white:", objc_msgSend(*(id *)(a1 + 32), "isContinuousCornerEnabled"), v3, v4, 0.0);
  v6 = *(void **)(a1 + 32);
  +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShadowImage:", v7);

}

@end
