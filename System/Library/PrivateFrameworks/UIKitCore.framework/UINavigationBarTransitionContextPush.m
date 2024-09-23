@implementation UINavigationBarTransitionContextPush

uint64_t __64___UINavigationBarTransitionContextPush__animateScaleTransition__block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[5];
  _QWORD v5[5];

  v2 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64___UINavigationBarTransitionContextPush__animateScaleTransition__block_invoke_2;
  v5[3] = &unk_1E16B1B28;
  v5[4] = *(_QWORD *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.0, 0.6);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __64___UINavigationBarTransitionContextPush__animateScaleTransition__block_invoke_3;
  v4[3] = &unk_1E16B1B28;
  v4[4] = *(_QWORD *)(a1 + 32);
  return +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v4, 0.5, 0.5);
}

uint64_t __64___UINavigationBarTransitionContextPush__animateScaleTransition__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setContentAlpha:", 0.0);
}

void __64___UINavigationBarTransitionContextPush__animateScaleTransition__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "backButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visualProvider");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

}

void __64___UINavigationBarTransitionContextPush__animateScaleTransition__block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64___UINavigationBarTransitionContextPush__animateScaleTransition__block_invoke_5;
  v4[3] = &unk_1E16B1B50;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v4, 0.9, 0.1);

}

uint64_t __64___UINavigationBarTransitionContextPush__animateScaleTransition__block_invoke_5(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(*(_QWORD *)(a1 + 40) + 264), *(double *)(*(_QWORD *)(a1 + 40) + 272), *(double *)(*(_QWORD *)(a1 + 40) + 280), *(double *)(*(_QWORD *)(a1 + 40) + 288));
}

_QWORD *__60___UINavigationBarTransitionContextPush__animateContentView__block_invoke(uint64_t a1, double a2)
{
  void *v4;
  double v5;
  float v6;
  double v7;
  uint64_t v8;
  double v9;
  _QWORD *result;
  _QWORD v11[5];

  +[_UINavigationBarTransitionContext fadeOutFunction](_UINavigationBarTransitionContext, "fadeOutFunction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a2;
  objc_msgSend(v4, "_solveForInput:", v5);
  v7 = 1.0 - v6;

  v8 = *(_QWORD *)(a1 + 32);
  if ((*(_WORD *)(v8 + 160) & 0x20) != 0)
    v9 = 0.0;
  else
    v9 = v7;
  objc_msgSend(*(id *)(v8 + 88), "setBackButtonAlpha:titleLabelAlpha:titleViewAlpha:barsAlpha:", v7, v9, v7, v7);
  result = *(_QWORD **)(a1 + 32);
  if (result[12])
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60___UINavigationBarTransitionContextPush__animateContentView__block_invoke_2;
    v11[3] = &unk_1E16B63F0;
    v11[4] = result;
    return (_QWORD *)objc_msgSend(result, "_animateInProcessAsTwoPartsWithOverlapIfNecessaryWithKeyframeID:fractionComplete:partOne:partTwo:", CFSTR("contentViewAlpha"), 0, v11, a2);
  }
  return result;
}

uint64_t __60___UINavigationBarTransitionContextPush__animateContentView__block_invoke_2(uint64_t a1, double a2)
{
  void *v4;
  double v5;
  float v6;
  double v7;
  uint64_t v8;
  double v9;

  +[_UINavigationBarTransitionContext fadeInFunction](_UINavigationBarTransitionContext, "fadeInFunction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a2;
  objc_msgSend(v4, "_solveForInput:", v5);
  v7 = v6;

  v8 = *(_QWORD *)(a1 + 32);
  if ((*(_WORD *)(v8 + 160) & 0x40) != 0)
    v9 = 0.0;
  else
    v9 = v7;
  return objc_msgSend(*(id *)(v8 + 96), "setBackButtonAlpha:titleLabelAlpha:titleViewAlpha:barsAlpha:", v7, v9, v7, v7);
}

uint64_t __60___UINavigationBarTransitionContextPush__animateContentView__block_invoke_3(uint64_t a1, double a2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  double v8;

  v3 = *(double *)(a1 + 48);
  v2 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  v5 = *(double *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v8 = *(double *)(v7 + 296);
  if ((*(_WORD *)(v7 + 160) & 2) != 0)
    v8 = -v8;
  return objc_msgSend(v6, "setFrame:", v3 - v8 * a2, v2, v4, v5);
}

uint64_t __60___UINavigationBarTransitionContextPush__animateContentView__block_invoke_4(uint64_t a1, double a2)
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double MinX;
  double Width;
  double v12;
  double Height;
  double MinY;
  double v17;
  double v18;
  CGFloat rect;
  CGFloat v20;
  CGFloat v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v22.size.width = *(CGFloat *)(a1 + 64);
  v5 = *(double *)(a1 + 72);
  v6 = *(double *)(*(_QWORD *)(a1 + 40) + 200);
  v7 = *(double *)(*(_QWORD *)(a1 + 40) + 208);
  rect = v22.size.width;
  v8 = *(double *)(*(_QWORD *)(a1 + 40) + 216);
  v9 = *(double *)(*(_QWORD *)(a1 + 40) + 224);
  v20 = v6;
  v21 = v9;
  v22.origin.x = v3;
  v22.origin.y = v4;
  v22.size.height = v5;
  MinX = CGRectGetMinX(v22);
  v23.origin.x = v6;
  v23.origin.y = v7;
  v23.size.width = v8;
  v23.size.height = v9;
  v18 = (1.0 - a2) * MinX + CGRectGetMinX(v23) * a2;
  v24.origin.x = v3;
  v24.origin.y = v4;
  v24.size.width = rect;
  v24.size.height = v5;
  MinY = CGRectGetMinY(v24);
  v25.origin.x = v6;
  v25.origin.y = v7;
  v25.size.width = v8;
  v25.size.height = v9;
  v17 = (1.0 - a2) * MinY + CGRectGetMinY(v25) * a2;
  v26.origin.x = v3;
  v26.origin.y = v4;
  v26.size.width = rect;
  v26.size.height = v5;
  Width = CGRectGetWidth(v26);
  v27.origin.x = v6;
  v27.origin.y = v7;
  v27.size.width = v8;
  v27.size.height = v9;
  v12 = (1.0 - a2) * Width + CGRectGetWidth(v27) * a2;
  v28.origin.x = v3;
  v28.origin.y = v4;
  v28.size.width = rect;
  v28.size.height = v5;
  Height = CGRectGetHeight(v28);
  v29.origin.y = v7;
  v29.origin.x = v20;
  v29.size.width = v8;
  v29.size.height = v21;
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", v18, v17, v12, (1.0 - a2) * Height + CGRectGetHeight(v29) * a2);
}

uint64_t __63___UINavigationBarTransitionContextPush__animateLargeTitleView__block_invoke(uint64_t a1, double a2)
{
  void *v4;
  double v5;
  float v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[5];

  +[_UINavigationBarTransitionContext fadeOutFunction](_UINavigationBarTransitionContext, "fadeOutFunction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a2;
  objc_msgSend(v4, "_solveForInput:", v5);
  v7 = 1.0 - v6;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(v8 + 144);
  if (v9 != 1)
  {
    if (v9)
      goto LABEL_10;
    v10 = *(void **)(v8 + 104);
    if ((*(_WORD *)(v8 + 160) & 0x20) != 0)
    {
      objc_msgSend(v10, "layoutViewsWithOffset:useRestingTitleHeight:", 1, (1.0 - a2) * 0.0 + *(double *)(a1 + 40) * a2, 0.0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "accessoryView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAlpha:", v7);

      goto LABEL_10;
    }
    goto LABEL_6;
  }
  v10 = *(void **)(v8 + 104);
  if ((*(_WORD *)(v8 + 160) & 0x20) == 0)
  {
LABEL_6:
    objc_msgSend(v10, "setContentAlpha:", 0.0);
    goto LABEL_10;
  }
  if ((_textDiffersBetweenLargeTitleAndBackButtonLayouts(v10, *(void **)(v8 + 96)) & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setContentAlpha:", v7);
  _updateLargeTitleSpacingForLayout(*(void **)(*(_QWORD *)(a1 + 32) + 104), *(double *)(a1 + 48), *(double *)(a1 + 56), -(*(double *)(*(_QWORD *)(a1 + 32) + 296) * a2), -(*(double *)(*(_QWORD *)(a1 + 32) + 304) * a2));
LABEL_10:
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 112);
  if ((*(_WORD *)(v12 + 160) & 0x40) == 0)
    return objc_msgSend(v13, "setContentAlpha:", 0.0);
  objc_msgSend(v13, "layoutViewsWithOffset:useRestingTitleHeight:", 1, a2 * 0.0 + (1.0 - a2) * *(double *)(a1 + 40), 0.0);
  v15 = objc_msgSend(*(id *)(a1 + 32), "_animationOptions");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63___UINavigationBarTransitionContextPush__animateLargeTitleView__block_invoke_2;
  v16[3] = &unk_1E16B1B28;
  v16[4] = *(_QWORD *)(a1 + 32);
  return +[UIView _animateInProcessKeyframesAlongsideTransitionWithOptions:animations:](UIView, "_animateInProcessKeyframesAlongsideTransitionWithOptions:animations:", v15, v16);
}

uint64_t __63___UINavigationBarTransitionContextPush__animateLargeTitleView__block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __63___UINavigationBarTransitionContextPush__animateLargeTitleView__block_invoke_3;
  v2[3] = &unk_1E16B63F0;
  v2[4] = *(_QWORD *)(a1 + 32);
  return +[UIView _animateKeyframeWithID:relativeStartTime:relativeDuration:animations:](UIView, "_animateKeyframeWithID:relativeStartTime:relativeDuration:animations:", CFSTR("largeTitlePush"), v2, 0.0, 0.5);
}

uint64_t __63___UINavigationBarTransitionContextPush__animateLargeTitleView__block_invoke_3(uint64_t a1, double a2)
{
  void *v4;
  double v5;
  float v6;
  double v7;

  +[_UINavigationBarTransitionContext fadeInFunction](_UINavigationBarTransitionContext, "fadeInFunction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a2;
  objc_msgSend(v4, "_solveForInput:", v5);
  v7 = v6;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setContentAlpha:", v7);
}

uint64_t __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke(uint64_t a1, double a2)
{
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  uint64_t *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  double Width;
  CGFloat v16;
  CGFloat v17;
  double MinX;
  double v19;
  double v20;
  double Height;
  CGFloat v23;
  double rect_16;
  double rect_16a;
  double rect_24;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v3 = -[_UINavigationBarLayout searchBarLayoutFrame](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  v5 = v4;
  v30 = v7;
  v31 = v6;
  v8 = *(uint64_t **)(a1 + 32);
  v9 = v8[10];
  if (v9 && *(_BYTE *)(v9 + 115))
  {
    v10 = -[_UINavigationBarLayout searchBarLayoutFrame](v8[9]);
  }
  else
  {
    v14 = objc_msgSend(v8, "isRTL");
    v32.origin.x = v3;
    v32.origin.y = v5;
    v32.size.width = v31;
    v32.size.height = v30;
    Width = CGRectGetWidth(v32);
    if (v14)
      Width = -Width;
    v10 = v3 + Width;
    v13 = v30;
    v12 = v31;
    v11 = v5;
  }
  v16 = v10;
  v28 = v13;
  v29 = v11;
  v17 = v12;
  MinX = CGRectGetMinX(*(CGRect *)&v10);
  v33.origin.x = v3;
  v33.origin.y = v5;
  v33.size.height = v30;
  v33.size.width = v31;
  v23 = v5;
  rect_24 = (1.0 - a2) * MinX + CGRectGetMinX(v33) * a2;
  v34.origin.x = v16;
  v34.origin.y = v29;
  v34.size.width = v17;
  v34.size.height = v28;
  rect_16 = CGRectGetMinY(v34);
  v35.origin.x = v3;
  v35.origin.y = v5;
  v35.size.width = v31;
  v35.size.height = v30;
  rect_16a = (1.0 - a2) * rect_16 + CGRectGetMinY(v35) * a2;
  v36.origin.x = v16;
  v36.origin.y = v29;
  v36.size.width = v17;
  v36.size.height = v28;
  v19 = CGRectGetWidth(v36);
  v37.origin.x = v3;
  v37.origin.y = v23;
  v37.size.width = v31;
  v37.size.height = v30;
  v20 = (1.0 - a2) * v19 + CGRectGetWidth(v37) * a2;
  v38.origin.x = v16;
  v38.size.height = v28;
  v38.origin.y = v29;
  v38.size.width = v17;
  Height = CGRectGetHeight(v38);
  v39.origin.x = v3;
  v39.origin.y = v23;
  v39.size.width = v31;
  v39.size.height = v30;
  return objc_msgSend(*(id *)(a1 + 40), "setFrame:", rect_24, rect_16a, v20, (1.0 - a2) * Height + CGRectGetHeight(v39) * a2);
}

uint64_t __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  if ((_searchBarHasAlphaTransitionForSlideTransitionLayouts(*(void **)(*(_QWORD *)(a1 + 32) + 72), *(void **)(*(_QWORD *)(a1 + 32) + 80), 1, 1) & 1) != 0)return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  result = objc_msgSend(*(id *)(a1 + 32), "shouldSlideBarBackground");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  return result;
}

uint64_t __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_scopeBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_scopeBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  if (v2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke_5;
    v7[3] = &unk_1E16B1B28;
    v8 = v2;
    +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v7, 0.0, 0.15);

  }
  if (v3)
  {
    v5[0] = v4;
    v5[1] = 3221225472;
    v5[2] = __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke_6;
    v5[3] = &unk_1E16B1B28;
    v6 = v3;
    +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.97, 0.03);

  }
}

uint64_t __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke_7(uint64_t a1, double a2)
{
  void *v4;
  char v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  double Width;
  CGRect v15;

  objc_msgSend(*(id *)(a1 + 32), "_searchController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActive");

  if ((v5 & 1) == 0)
  {
    v6 = -[_UINavigationBarLayout searchBarLayoutFrame](*(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = objc_msgSend(*(id *)(a1 + 40), "isRTL");
    v15.origin.x = v6;
    v15.origin.y = v8;
    v15.size.width = v10;
    v15.size.height = v12;
    Width = CGRectGetWidth(v15);
    if (!v13)
      Width = -Width;
    objc_msgSend(*(id *)(a1 + 32), "setFrame:", v6 + Width * a2, v8, v10, v12);
  }
}

uint64_t __103___UINavigationBarTransitionContextPush__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __103___UINavigationBarTransitionContextPush__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

@end
