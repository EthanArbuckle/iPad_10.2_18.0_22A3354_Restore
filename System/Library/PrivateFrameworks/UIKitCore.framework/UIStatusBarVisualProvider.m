@implementation UIStatusBarVisualProvider

void __66___UIStatusBarVisualProvider_DynamicSplit_leadingItemCutoffWidths__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECD7AF18;
  qword_1ECD7AF18 = (uint64_t)&unk_1E1A946A0;

}

void __67___UIStatusBarVisualProvider_DynamicSplit_trailingItemCutoffWidths__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECD7AF28;
  qword_1ECD7AF28 = (uint64_t)&unk_1E1A946B8;

}

uint64_t __87___UIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toDynamicallyHidden_scale___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  void *v27;
  uint64_t result;
  void *v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  _OWORD v34[3];
  CGAffineTransform v35;
  CGAffineTransform v36;

  v2 = *(unsigned __int8 *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentationLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v9 = v8;
    else
      v9 = &unk_1E1A95D30;
    objc_msgSend(v4, "setFromValue:", v9);
    objc_msgSend(v4, "setToValue:", &unk_1E1A95D40);
    objc_msgSend(v4, "setDuration:", *(double *)(a1 + 40) * 0.35);
    LODWORD(v10) = 1045220557;
    LODWORD(v11) = 0;
    LODWORD(v12) = 1.0;
    LODWORD(v13) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v11, v10, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTimingFunction:", v14);

    objc_msgSend(*(id *)(a1 + 32), "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAnimation:forKey:", v4, CFSTR("blur"));

    objc_msgSend(*(id *)(a1 + 32), "setDynamicHidingAlpha:", 0.0);
    CGAffineTransformMakeScale(&v36, 0.5, 0.5);
    v17 = *(void **)(a1 + 32);
    v35 = v36;
    objc_msgSend(v17, "setDynamicHidingTransform:", &v35);

  }
  else
  {
    objc_msgSend(v3, "setFromValue:", &unk_1E1A95D40);
    objc_msgSend(v4, "setToValue:", &unk_1E1A95D30);
    objc_msgSend(v4, "setDuration:", *(double *)(a1 + 40));
    LODWORD(v18) = 1045220557;
    LODWORD(v19) = 0;
    LODWORD(v20) = 1.0;
    LODWORD(v21) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v19, v18, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTimingFunction:", v22);

    objc_msgSend(*(id *)(a1 + 32), "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addAnimation:forKey:", v4, CFSTR("blur"));

    objc_msgSend(*(id *)(a1 + 32), "setDynamicHidingAlpha:", 1.0);
    v25 = *(void **)(a1 + 32);
    v26 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v34[0] = *MEMORY[0x1E0C9BAA8];
    v34[1] = v26;
    v34[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v25, "setDynamicHidingTransform:", v34);
  }

  CGAffineTransformMakeScale(&v33, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 48));
  v27 = *(void **)(a1 + 32);
  v32 = v33;
  result = objc_msgSend(v27, "setDynamicScaleTransform:", &v32);
  if (!*(_BYTE *)(a1 + 56))
  {
    CGAffineTransformMakeScale(&v31, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 48));
    v29 = *(void **)(a1 + 32);
    v30 = v31;
    return objc_msgSend(v29, "setDynamicScaleTransform:", &v30);
  }
  return result;
}

uint64_t __87___UIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toDynamicallyHidden_scale___block_invoke_81(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setDynamicScaleTransform:", &v4);
}

uint64_t __69___UIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toScale___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setDynamicScaleTransform:", &v4);
}

uint64_t __69___UIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toScale___block_invoke_2(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setDynamicScaleTransform:", &v4);
}

void __104___UIStatusBarVisualProvider_DynamicSplit_avoidanceFrameUpdatedFromFrame_withAnimationSettings_options___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "statusBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[UIView _isInVisibleHierarchy]((uint64_t)v2);

  if (v3)
    objc_msgSend(WeakRetained, "avoidanceFrameUpdatedFromFrame:withAnimationSettings:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 80), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

}

void __104___UIStatusBarVisualProvider_DynamicSplit_avoidanceFrameUpdatedFromFrame_withAnimationSettings_options___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "deferredAvoidanceFrameUpdateBlock");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
    (*(void (**)(uint64_t))(v1 + 16))(v1);

}

void __104___UIStatusBarVisualProvider_DynamicSplit_avoidanceFrameUpdatedFromFrame_withAnimationSettings_options___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "cutoutLayoutGuide");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "owningView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutSubviews");

}

void __104___UIStatusBarVisualProvider_DynamicSplit_avoidanceFrameUpdatedFromFrame_withAnimationSettings_options___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "cutoutLayoutGuide");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "owningView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutSubviews");

}

void __72___UIStatusBarVisualProvider_DynamicSplitMedium_leadingItemCutoffWidths__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECD7AF38;
  qword_1ECD7AF38 = (uint64_t)&unk_1E1A946D0;

}

void __73___UIStatusBarVisualProvider_DynamicSplitMedium_trailingItemCutoffWidths__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECD7AF48;
  qword_1ECD7AF48 = (uint64_t)&unk_1E1A946E8;

}

void __78___UIStatusBarVisualProvider_LegacyPhone_actionable_highlighted_initialPress___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  if (*(_BYTE *)(a1 + 32))
  {
    v2 = a2;
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.3);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setBackgroundColor:");

  }
  else
  {
    v3 = a2;
    objc_msgSend(v3, "setBackgroundColor:", 0);
  }

}

uint64_t __61___UIStatusBarVisualProvider_LegacyPhone_willUpdateWithData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setOverriddenStyle:", *(_QWORD *)(a1 + 32));
}

void __70___UIStatusBarVisualProvider_LegacyPhone__updateLowerRegionsWithData___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  char v8;
  void *v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "statusBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "regionWithIdentifier:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v10, "isEnabled");
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(v10, "enableWithToken:", 12);
  else
    objc_msgSend(v10, "disableWithToken:", 12);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v7 + 24))
  {
    v8 = 1;
    v9 = v10;
  }
  else
  {
    v8 = v6 ^ objc_msgSend(v10, "isEnabled");
    v9 = v10;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v7 + 24) = v8;

}

uint64_t __71___UIStatusBarVisualProvider_LegacyPhone__updateExpandedTrailingRegion__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t result;
  double v10;
  _QWORD v11[5];

  objc_msgSend(*(id *)(a1 + 32), "expandedBaselineOffset");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "statusBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "regionWithIdentifier:", CFSTR("expandedLowerLeading"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "dualLineExpandedBaselineOffset");
    v3 = v8;
  }
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "constant");
  if (v3 != v10)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "setConstant:", v3);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71___UIStatusBarVisualProvider_LegacyPhone__updateExpandedTrailingRegion__block_invoke_2;
    v11[3] = &unk_1E16B1B28;
    v11[4] = *(_QWORD *)(a1 + 32);
    return +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v11, 0.25);
  }
  return result;
}

void __71___UIStatusBarVisualProvider_LegacyPhone__updateExpandedTrailingRegion__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "statusBar");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

uint64_t __54___UIStatusBarVisualProvider_LegacyPhone_setExpanded___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setOverriddenStyle:", *(_QWORD *)(a1 + 32));
}

void __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void (**v7)(id, uint64_t);
  uint64_t v8;
  uint64_t v9;
  CGFloat MinX;
  uint64_t v11;
  _QWORD v12[4];
  void (**v13)(id, uint64_t);
  _QWORD v14[4];
  id v15;
  CGFloat v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (CGRectIsNull(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32))
    || CGRectIsNull(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32)))
  {
    v7[2](v7, 1);
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v19 = *(_OWORD *)(v9 + 40);
    v20 = *(_QWORD *)(v9 + 56);
    MinX = CGRectGetMinX(*(CGRect *)(*(_QWORD *)(v8 + 8) + 32));
    v11 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_2;
    v14[3] = &unk_1E16B20D8;
    v15 = v6;
    v16 = MinX;
    v17 = v19;
    v18 = v20;
    v12[0] = v11;
    v12[1] = 3221225472;
    v12[2] = __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_3;
    v12[3] = &unk_1E16C0E38;
    v13 = v7;
    +[UIView _animateUsingSpringWithTension:friction:interactive:animations:completion:](UIView, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v14, v12, 100.0, 20.0);

  }
}

uint64_t __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  CGFloat *v17;
  CGRect v19;

  v4 = a3;
  objc_msgSend(v4, "absoluteFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    v19.origin.x = v6;
    v19.origin.y = v8;
    v19.size.width = v10;
    v19.size.height = v12;
    v16 = CGRectContainsRect(*(CGRect *)(a1 + 40), v19);

    if (v16)
    {
      v17 = *(CGFloat **)(*(_QWORD *)(a1 + 32) + 8);
      v17[4] = v6;
      v17[5] = v8;
      v17[6] = v10;
      v17[7] = v12;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "setFloating:", 1);

  return 1;
}

void __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(a2, "type") == 1
    && (objc_msgSend(v7, "absoluteFrame"),
        v9 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8),
        v9[4] = v10,
        v9[5] = v11,
        v9[6] = v12,
        v9[7] = v13,
        !CGRectIsNull(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32))))
  {
    v14 = *(double **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(v7, "setAbsoluteFrame:", CGRectGetMinX(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32)), v14[5], v14[6], v14[7]);
    objc_msgSend(v7, "setAlpha:", 0.0);
    v15 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_6;
    v22[3] = &unk_1E16BC3A0;
    v16 = v7;
    v17 = *(_QWORD *)(a1 + 32);
    v23 = v16;
    v24 = v17;
    v20[0] = v15;
    v20[1] = 3221225472;
    v20[2] = __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_7;
    v20[3] = &unk_1E16C0E38;
    v21 = v8;
    +[UIView _animateUsingSpringWithTension:friction:interactive:animations:completion:](UIView, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v22, v20, 100.0, 20.0);
    v18[0] = v15;
    v18[1] = 3221225472;
    v18[2] = __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_8;
    v18[3] = &unk_1E16B1B28;
    v19 = v16;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v18, 0, 0.2, 0.0);

  }
  else
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }

}

uint64_t __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56));
}

uint64_t __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_9(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CGRect v34;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(a2, "type") == 3)
  {
    objc_msgSend(v7, "absoluteFrame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(v7, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier](_UIStatusBarFullBackgroundActivityItem, "secondaryIconDisplayIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 == v18)
      v19 = *(_QWORD *)(a1 + 32);
    else
      v19 = *(_QWORD *)(a1 + 40);
    v20 = *(double **)(v19 + 8);
    v21 = v20[4];
    v22 = v20[5];
    v23 = v20[6];
    v24 = v20[7];

    v34.origin.x = v21;
    v34.origin.y = v22;
    v34.size.width = v23;
    v34.size.height = v24;
    if (!CGRectIsNull(v34))
      objc_msgSend(v7, "setAbsoluteFrame:", v21, v22, v23, v24);
    v25 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_10;
    v28[3] = &unk_1E16B20D8;
    v29 = v7;
    v30 = v10;
    v31 = v12;
    v32 = v14;
    v33 = v16;
    v26[0] = v25;
    v26[1] = 3221225472;
    v26[2] = __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_11;
    v26[3] = &unk_1E16C0E38;
    v27 = v8;
    +[UIView _animateUsingSpringWithTension:friction:interactive:animations:completion:](UIView, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v28, v26, 100.0, 20.0);

  }
  else
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }

}

uint64_t __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  CGFloat *v20;
  CGRect v22;

  v4 = a3;
  objc_msgSend(v4, "absoluteFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    v22.origin.x = v6;
    v22.origin.y = v8;
    v22.size.width = v10;
    v22.size.height = v12;
    v16 = CGRectContainsRect(*(CGRect *)(a1 + 48), v22);

    if (v16)
    {
      objc_msgSend(v4, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier](_UIStatusBarFullBackgroundActivityItem, "secondaryIconDisplayIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 == v18)
        v19 = *(_QWORD *)(a1 + 32);
      else
        v19 = *(_QWORD *)(a1 + 40);
      v20 = *(CGFloat **)(v19 + 8);
      v20[4] = v6;
      v20[5] = v8;
      v20[6] = v10;
      v20[7] = v12;
    }
  }
  else
  {

  }
  return 1;
}

void __70___UIStatusBarVisualProvider_Pad_actionable_highlighted_initialPress___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  if (*(_BYTE *)(a1 + 32))
  {
    v2 = a2;
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.3);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setBackgroundColor:");

  }
  else
  {
    v3 = a2;
    objc_msgSend(v3, "setBackgroundColor:", 0);
  }

}

void __70___UIStatusBarVisualProvider_Pad__updateConstraintsForAvoidanceFrame___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "statusBar");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

}

id __87___UIStatusBarVisualProvider_Split_visualProviderSubclassForScreen_visualProviderInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id result;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  result = (id)objc_msgSend(a2, "nativeDisplayWidth");
  if (vabdd_f64(v8, *(double *)(a1 + 48)) <= 0.0001)
  {
    objc_msgSend(*(id *)(a1 + 32), "_nativeScale");
    v10 = v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(a2, "referenceScreenScale");
    else
      objc_msgSend(*(id *)(a1 + 32), "_scale");
    v12 = v10 / v11;
    v13 = *(double *)(a1 + 64);
    v14 = *(double *)(a1 + 56) * v12;
    result = (id)objc_msgSend(a2, "notchSize");
    if (vabdd_f64(v16, v14) <= 0.0001 && vabdd_f64(v15, v12 * v13) <= 0.0001)
    {
      result = _UIStatusBarGetVisualProviderSubclassForScreenWithVisualProviderInfo(a2, *(void **)(a1 + 32), 0);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
      *a4 = 1;
    }
  }
  return result;
}

void __65___UIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "absoluteFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v6, "setAbsoluteFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56));
  v19 = v7;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __65___UIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke_2;
  v20[3] = &unk_1E16B20D8;
  v21 = v6;
  v22 = v9;
  v23 = v11;
  v24 = v13;
  v25 = v15;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65___UIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke_3;
  v18[3] = &unk_1E16C0E38;
  v16 = v7;
  v17 = v6;
  +[UIView _animateUsingSpringWithTension:friction:interactive:animations:completion:](UIView, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v20, v18, 100.0, 20.0);

}

uint64_t __65___UIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __65___UIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65___UIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a3, "absoluteFrame");
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return 1;
}

void __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  _OWORD v21[3];
  __int128 v22;
  __int128 v23;
  __int128 v24;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 32);
  if (v10)
  {
    objc_msgSend(v10, "_collapseChargingBoltTransformForDisplayItem:", v8);
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v22 = 0u;
  }
  v21[0] = v22;
  v21[1] = v23;
  v21[2] = v24;
  objc_msgSend(v8, "setTransform:", v21);
  objc_msgSend(v8, "setAlpha:", 0.0);
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_2;
  v18[3] = &unk_1E16B1B50;
  v12 = *(_QWORD *)(a1 + 32);
  v19 = v8;
  v20 = v12;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_3;
  v16[3] = &unk_1E16BC218;
  v16[4] = v12;
  v17 = v9;
  v13 = v9;
  v14 = v8;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v18, v16, 0.3);
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_5;
  v15[3] = &unk_1E16B1B28;
  v15[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "addTimeout:withHandler:", v15, 0.6);

}

uint64_t __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _OWORD v5[3];
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v2, "_expandedChargingBoltTransformForDisplayItem:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v7 = 0u;
    v8 = 0u;
    v6 = 0u;
  }
  v3 = *(void **)(a1 + 32);
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = v8;
  objc_msgSend(v3, "setTransform:", v5);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_3(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  if (a2)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v3 = (void *)MEMORY[0x1E0C99E88];
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_4;
    v9 = &unk_1E16B26E0;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v6, 3.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setBatteryExpansionTimer:", v4, v6, v7, v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_collapseBattery");
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_collapseBattery");

}

uint64_t __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_collapseBattery");
}

void __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  double v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  CGAffineTransform v24;
  uint64_t v25;
  uint64_t v26;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v29;
  CGAffineTransform v30;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "center");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v8, "setCenter:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  objc_msgSend(v8, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShouldRasterize:", 0);

  memset(&v30, 0, sizeof(v30));
  CGAffineTransformMakeScale(&v30, 1.4, 1.4);
  v15 = objc_msgSend(v8, "_shouldReverseLayoutDirection");
  v16 = -6.0;
  if (v15)
    v16 = 6.0;
  t1 = v30;
  CGAffineTransformTranslate(&v29, &t1, v16, -1.0);
  v30 = v29;
  if (v8)
    objc_msgSend(v8, "transform");
  else
    memset(&t2, 0, sizeof(t2));
  t1 = v30;
  CGAffineTransformConcat(&v29, &t1, &t2);
  v30 = v29;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_7;
  v20[3] = &unk_1E16E1610;
  v24 = v29;
  v21 = v6;
  v22 = v8;
  v25 = v11;
  v26 = v13;
  v23 = v9;
  v17 = v9;
  v18 = v8;
  v19 = v6;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v20, v7, 0.3);

}

uint64_t __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_7(uint64_t a1)
{
  __int128 v2;
  _OWORD v4[3];

  v2 = *(_OWORD *)(a1 + 72);
  v4[0] = *(_OWORD *)(a1 + 56);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 88);
  objc_msgSend(*(id *)(a1 + 32), "setTransform:", v4);
  objc_msgSend(*(id *)(a1 + 40), "setCenter:", *(double *)(a1 + 104), *(double *)(a1 + 112));
  return objc_msgSend(*(id *)(a1 + 48), "setHighlighted:", 1);
}

uint64_t __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "center");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v5 + 32) = v6;
  *(_QWORD *)(v5 + 40) = v7;

  return 1;
}

void __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_9(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_10;
  v13[3] = &unk_1E16B1B28;
  v14 = v5;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_11;
  v10[3] = &unk_1E16BC218;
  v11 = v14;
  v12 = v6;
  v8 = v6;
  v9 = v14;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v13, v10, 0.1);

}

uint64_t __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_11(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFloating:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  objc_msgSend(a3, "setFloating:", 1);
  return 1;
}

void __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  double *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;

  v7 = a3;
  v8 = a4;
  v9 = *(double **)(*(_QWORD *)(a1 + 40) + 8);
  v10 = v9[4];
  v11 = v9[5];
  v12 = v9[6];
  v13 = v9[7];
  v14 = a2;
  objc_msgSend(v7, "setAbsoluteFrame:", v10, v11, v12, v13);
  v15 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_2;
  v22[3] = &unk_1E16B1B50;
  v16 = *(_QWORD *)(a1 + 32);
  v23 = v7;
  v24 = v16;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_3;
  v20[3] = &unk_1E16BC218;
  v20[4] = v16;
  v21 = v8;
  v17 = v8;
  v18 = v7;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v22, v20, 0.3);
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_4;
  v19[3] = &unk_1E16B1B28;
  v19[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v14, "addTimeout:withHandler:", v19, 0.6);

}

uint64_t __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _OWORD v5[3];
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v2, "_collapseChargingBoltTransformForDisplayItem:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v7 = 0u;
    v8 = 0u;
    v6 = 0u;
  }
  v3 = *(void **)(a1 + 32);
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = v8;
  objc_msgSend(v3, "setTransform:", v5);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_3(uint64_t a1)
{
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "isEnabled"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setEnabled:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "isEnabled");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setEnabled:", 0);
    return objc_msgSend(*(id *)(a1 + 32), "_resetBattery");
  }
  return result;
}

uint64_t __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "absoluteFrame");
  v5 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v5[4] = v6;
  v5[5] = v7;
  v5[6] = v8;
  v5[7] = v9;
  objc_msgSend(v4, "setFloating:", 1);

  return 1;
}

void __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "center");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v8, "setCenter:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_7;
  v24[3] = &unk_1E16C1C58;
  v25 = v6;
  v28 = v11;
  v29 = v13;
  v26 = v8;
  v27 = v9;
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_8;
  v20[3] = &unk_1E16C9138;
  v15 = *(_QWORD *)(a1 + 32);
  v21 = v26;
  v22 = v15;
  v23 = v7;
  v16 = v7;
  v17 = v26;
  v18 = v9;
  v19 = v6;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v24, v20, 0.3);

}

uint64_t __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_7(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  objc_msgSend(*(id *)(a1 + 40), "setCenter:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 48), "setHighlighted:", 0);
}

uint64_t __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_8(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldRasterize:", 1);

  objc_msgSend(*(id *)(a1 + 40), "_resetBattery");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "center");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v5 + 32) = v6;
  *(_QWORD *)(v5 + 40) = v7;

  return 1;
}

void __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_10(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "setAlpha:", 0.0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_11;
  v8[3] = &unk_1E16B1B28;
  v9 = v5;
  v7 = v5;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v8, v6, 0.15, 0.2);

}

uint64_t __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  void *v33;
  double MaxX;
  double v35;
  double MinX;
  double v37;
  double v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  _QWORD v44[5];
  _QWORD v45[5];
  id v46;
  uint64_t v47;
  _QWORD v48[4];
  id v49;
  uint64_t v50;
  double v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "statusBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "regions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("systemUpdates"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v7, "type");
  objc_msgSend(v10, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(*(id *)(a1 + 32), "statusBar");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "containerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertRect:toView:", v24, v16, v18, v20, v22);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;

  if (*(_BYTE *)(a1 + 48) == (v14 == 1))
  {
    objc_msgSend(v13, "layoutItem");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_ui_frame");
    MaxX = CGRectGetMaxX(v54);
    v55.origin.x = v26;
    v55.origin.y = v28;
    v55.size.width = v30;
    v55.size.height = v32;
    v35 = MaxX - CGRectGetMaxX(v55);
  }
  else
  {
    v56.origin.x = v26;
    v56.origin.y = v28;
    v56.size.width = v30;
    v56.size.height = v32;
    MinX = CGRectGetMinX(v56);
    objc_msgSend(v13, "layoutItem");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_ui_frame");
    v35 = MinX - CGRectGetMinX(v57);
  }

  if (*(_BYTE *)(a1 + 48))
    v37 = -v35;
  else
    v37 = v35;
  if (v14 == 1)
  {
    objc_msgSend(v8, "setAlpha:", 0.0);
    CGAffineTransformMakeTranslation(&v53, -v37, 0.0);
    v52 = v53;
    objc_msgSend(v8, "setTransform:", &v52);
    v38 = (double)(unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") * 0.25;
    v39 = 0x20000;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "systemUpdatesTimer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "invalidate");

    objc_msgSend(*(id *)(a1 + 32), "setSystemUpdatesTimer:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_resumeSystemUpdateData");
    v38 = 0.0;
    v39 = 0x10000;
  }
  v41 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_2;
  v48[3] = &unk_1E16B4E70;
  v49 = v8;
  v50 = v14;
  v51 = v37;
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_3;
  v45[3] = &unk_1E16C31E8;
  v46 = v9;
  v47 = v14;
  v45[4] = *(_QWORD *)(a1 + 32);
  v42 = v9;
  v43 = v8;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v39, v48, v45, 0.66, v38);
  v44[0] = v41;
  v44[1] = 3221225472;
  v44[2] = __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_6;
  v44[3] = &unk_1E16B1B28;
  v44[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "addTimeout:withHandler:", v44, 2.0);

}

uint64_t __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_2(uint64_t a1)
{
  __int128 v2;
  void *v3;
  double v4;
  CGAffineTransform v6;
  CGAffineTransform v7;

  if (*(_QWORD *)(a1 + 40) == 1)
  {
    v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v7.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v7.c = v2;
    *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  else
  {
    CGAffineTransformMakeTranslation(&v7, *(CGFloat *)(a1 + 48), 0.0);
  }
  v3 = *(void **)(a1 + 32);
  v6 = v7;
  objc_msgSend(v3, "setTransform:", &v6);
  v4 = 0.0;
  if (*(_QWORD *)(a1 + 40) == 1)
    v4 = 1.0;
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v4);
}

uint64_t __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_3(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;
  id location;

  if (a2)
  {
    if (*(_QWORD *)(a1 + 48) == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "_delaySystemUpdateData");
      objc_initWeak(&location, *(id *)(a1 + 32));
      v3 = (void *)MEMORY[0x1E0C99E88];
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_4;
      v7[3] = &unk_1E16B26E0;
      objc_copyWeak(&v8, &location);
      objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, v7, 2.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setSystemUpdatesTimer:", v4);

      objc_msgSend(*(id *)(a1 + 32), "_collapseBattery");
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_disableSystemUpdates");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_5;
    v6[3] = &unk_1E16B1B28;
    v6[4] = *(_QWORD *)(a1 + 32);
    return +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v6);
  }
}

void __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_disableSystemUpdates");
    objc_msgSend(v3, "statusBar");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

    objc_msgSend(v3, "_resumeSystemUpdateData");
    WeakRetained = v3;
  }

}

uint64_t __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_5(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "statusBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

  return objc_msgSend(*(id *)(a1 + 32), "_resumeSystemUpdateData");
}

uint64_t __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_6(uint64_t a1)
{
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "_disableSystemUpdates");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_7;
  v3[3] = &unk_1E16B1B28;
  v3[4] = *(_QWORD *)(a1 + 32);
  return +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);
}

uint64_t __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_7(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "statusBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

  return objc_msgSend(*(id *)(a1 + 32), "_resumeSystemUpdateData");
}

uint64_t __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(a2, "type") == 2)
    objc_msgSend(v4, "setFloating:", 1);

  return 1;
}

void __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_9(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void (**v8)(id, uint64_t);
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(a2, "type");
  if ((unint64_t)(v9 - 1) > 1)
  {
    v8[2](v8, 1);
  }
  else
  {
    v10 = v9;
    if (v9 == 2)
    {
      v11 = *(void **)(a1 + 32);
      objc_msgSend(v7, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "integerValue");

    }
    else
    {
      objc_msgSend(v7, "region");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "displayItems");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v16, "indexOfObject:", v7);

      objc_msgSend(v7, "setAlpha:", 0.0);
    }
    v17 = 0.0;
    if (v10 == 1)
      v17 = 0.5;
    v18 = v17 + (double)v14 * 0.2;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_10;
    v19[3] = &unk_1E16B1888;
    v20 = v7;
    v21 = v10;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v19, v8, 0.25, v18);

  }
}

uint64_t __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_10(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  double v3;

  v2 = a1 + 32;
  v1 = *(void **)(a1 + 32);
  v3 = 0.0;
  if (*(_QWORD *)(v2 + 8) == 1)
    v3 = 1.0;
  return objc_msgSend(v1, "setAlpha:", v3);
}

uint64_t __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  if (objc_msgSend(a2, "type") == 2)
  {
    objc_msgSend(v5, "setFloating:", 1);
    objc_msgSend(v5, "region");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "indexOfObject:", v5);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v5, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

  }
  return 1;
}

void __64___UIStatusBarVisualProvider_Split__updateLowerRegionsWithData___block_invoke(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  char v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "regionWithIdentifier:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v7, "isEnabled");
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(v7, "enableWithToken:", 12);
  else
    objc_msgSend(v7, "disableWithToken:", 12);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v4 + 24))
  {
    v5 = 1;
    v6 = v7;
  }
  else
  {
    v5 = v3 ^ objc_msgSend(v7, "isEnabled");
    v6 = v7;
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v4 + 24) = v5;

}

void __65___UIStatusBarVisualProvider_Split__updateExpandedTrailingRegion__block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  _QWORD v17[4];
  id v18;

  v2 = objc_msgSend(*(id *)(a1 + 32), "orientation") - 1;
  objc_msgSend(*(id *)(a1 + 40), "expandedPillPlacement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", v2 > 1);

  objc_msgSend(*(id *)(a1 + 32), "currentAggregatedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondaryCellularEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "isEnabled") ^ 1;
    if (v2 > 1)
      v7 = 1;
    else
      v7 = v6;
  }
  else
  {
    v7 = 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "regionWithIdentifier:", CFSTR("expandedLeading"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  objc_msgSend(*(id *)(a1 + 32), "regionWithIdentifier:", CFSTR("expandedLowerTrailing"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v10 || v13 || (v14 = 0.0, v7))
  {
    objc_msgSend(*(id *)(a1 + 40), "lowerExpandedBaselineOffset");
    v14 = v15;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "constant");
  if (v14 != v16)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "setConstant:", v14);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __65___UIStatusBarVisualProvider_Split__updateExpandedTrailingRegion__block_invoke_2;
    v17[3] = &unk_1E16B1B28;
    v18 = *(id *)(a1 + 32);
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v17, 0.25);

  }
}

uint64_t __65___UIStatusBarVisualProvider_Split__updateExpandedTrailingRegion__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __48___UIStatusBarVisualProvider_Split_setExpanded___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_collapseBattery");
}

BOOL __70___UIStatusBarVisualProvider_FixedSplit__orderedDisplayItemPlacements__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarBatteryItem iconDisplayIdentifier](_UIStatusBarBatteryItem, "iconDisplayIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2 == v3;

  return v4;
}

BOOL __70___UIStatusBarVisualProvider_FixedSplit__orderedDisplayItemPlacements__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarCellularItem signalStrengthDisplayIdentifier](_UIStatusBarCellularCondensedItem, "signalStrengthDisplayIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2 == v3;

  return v4;
}

BOOL __70___UIStatusBarVisualProvider_FixedSplit__orderedDisplayItemPlacements__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarCellularCondensedItem dualSignalStrengthDisplayIdentifier](_UIStatusBarCellularCondensedItem, "dualSignalStrengthDisplayIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2 == v3;

  return v4;
}

BOOL __70___UIStatusBarVisualProvider_FixedSplit__orderedDisplayItemPlacements__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarThermalItem, "defaultDisplayIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2 == v3;

  return v4;
}

void __73___UIStatusBarVisualProvider_FixedSplit__updateSystemNavigationWithData___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "statusBar");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

}

uint64_t __46___UIStatusBarVisualProvider_iOS_setExpanded___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "disableWithToken:", 10);
}

uint64_t __46___UIStatusBarVisualProvider_iOS_setExpanded___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enableWithToken:", 10);
}

void __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  double v15;
  id v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double MinX;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  double MaxX;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  double v52;
  double v53;
  uint64_t v54;
  id v55;
  double v56;
  _QWORD v57[4];
  id v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  CGAffineTransform v62;
  CGAffineTransform v63;
  id v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "region");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  v12 = *(void **)(a1 + 32);
  v64 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v14 = v64;
  objc_msgSend(v12, "airplaneTravelOffsetInProposedPartWithIdentifier:animationType:", &v64, v13);
  v56 = v15;
  v16 = v64;

  objc_msgSend(v6, "absoluteFrame");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(*(id *)(a1 + 32), "statusBar");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frameForPartWithIdentifier:includeInternalItems:", v16, 1);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 1)
  {
    v34 = v18;
    v35 = v20;
    v36 = v22;
    v37 = v24;
    if (*(_BYTE *)(a1 + 64))
    {
      MinX = CGRectGetMinX(*(CGRect *)&v34);
      v65.origin.x = v27;
      v65.origin.y = v29;
      v65.size.width = v31;
      v65.size.height = v33;
      v39 = MinX - CGRectGetMaxX(v65) - v56;
    }
    else
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v34);
      v67.origin.x = v27;
      v67.origin.y = v29;
      v67.size.width = v31;
      v67.size.height = v33;
      v39 = v56 + MaxX - CGRectGetMinX(v67);
    }
    CGAffineTransformMakeTranslation(&v63, -v39, 0.0);
    v62 = v63;
    objc_msgSend(v6, "setTransform:", &v62);
    v46 = 0x20000;
  }
  else
  {
    v40 = v27;
    v41 = v29;
    v42 = v31;
    v43 = v33;
    if (*(_BYTE *)(a1 + 64))
    {
      v44 = CGRectGetMinX(*(CGRect *)&v40);
      v66.origin.x = v18;
      v66.origin.y = v20;
      v66.size.width = v22;
      v66.size.height = v24;
      v39 = v44 - CGRectGetMaxX(v66) - v56;
    }
    else
    {
      v47 = CGRectGetMaxX(*(CGRect *)&v40);
      v68.origin.x = v18;
      v68.origin.y = v20;
      v68.size.width = v22;
      v68.size.height = v24;
      v39 = v56 + v47 - CGRectGetMinX(v68);
    }
    v46 = 0x10000;
  }
  objc_msgSend(*(id *)(a1 + 32), "airplaneSpeedForAnimationType:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v49 = 1.0 / v48;
  v50 = -v39;
  if (v39 >= 0.0)
    v50 = v39;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v50 * v49;
  objc_msgSend(*(id *)(a1 + 32), "airplaneShouldFadeForAnimationType:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v51 = *(_QWORD *)(a1 + 48);
  if (v52 != 0.0 && *(_QWORD *)(*(_QWORD *)(v51 + 8) + 24) == 1)
  {
    objc_msgSend(v6, "setAlpha:", 0.0);
    v51 = *(_QWORD *)(a1 + 48);
  }
  v53 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_2;
  v57[3] = &unk_1E16E1778;
  v60 = v51;
  v61 = v39;
  v54 = *(_QWORD *)(a1 + 32);
  v58 = v6;
  v59 = v54;
  v55 = v6;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v46, v57, v7, v53, 0.0);

}

uint64_t __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_2(uint64_t a1)
{
  __int128 v2;
  void *v3;
  uint64_t result;
  double v5;
  double v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 1)
  {
    v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v8.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v8.c = v2;
    *(_OWORD *)&v8.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  else
  {
    CGAffineTransformMakeTranslation(&v8, *(CGFloat *)(a1 + 56), 0.0);
  }
  v3 = *(void **)(a1 + 32);
  v7 = v8;
  objc_msgSend(v3, "setTransform:", &v7);
  result = objc_msgSend(*(id *)(a1 + 40), "airplaneShouldFadeForAnimationType:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  if (v5 != 0.0)
  {
    v6 = 1.0;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 2)
      v6 = 0.0;
    return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v6);
  }
  return result;
}

uint64_t __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "type");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 2)
    objc_msgSend(v5, "setFloating:", 1);

  return 1;
}

void __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  double v60;
  double v61;
  _QWORD v62[4];
  void (**v63)(id, uint64_t);
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  void (**v67)(id, uint64_t);
  _QWORD v68[4];
  id v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  _QWORD v74[4];
  id v75;
  uint64_t v76;
  id v77;
  double v78;
  double v79;
  double v80;
  double v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  double v87;
  _QWORD v88[4];
  id v89;
  CGRect v90;
  CGRect v91;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "region");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  if (!v12)
  {
    v9[2](v9, 1);
    goto LABEL_18;
  }
  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v13 == 1)
  {
    if (objc_msgSend(v7, "type") == 2)
    {
      v14 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) * 0.5;
      v88[0] = MEMORY[0x1E0C809B0];
      v88[1] = 3221225472;
      v88[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_5;
      v88[3] = &unk_1E16B1B28;
      v89 = v8;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v88, v9, v14);

      goto LABEL_18;
    }
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  if (v13 != 2)
  {
    v42 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(v8, "identifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKeyedSubscript:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend(v44, "CGRectValue");
      v46 = v45;
      v48 = v47;
      v50 = v49;
      v52 = v51;
      objc_msgSend(v8, "absoluteFrame");
      x = v90.origin.x;
      y = v90.origin.y;
      width = v90.size.width;
      height = v90.size.height;
      v91.origin.x = v46;
      v91.origin.y = v48;
      v91.size.width = v50;
      v91.size.height = v52;
      if (CGRectEqualToRect(v90, v91))
      {
        v9[2](v9, 1);
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(v8, "setAbsoluteFrame:", v46, v48, v50, v52);
      v59 = MEMORY[0x1E0C809B0];
      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_11;
      v68[3] = &unk_1E16B20D8;
      v69 = v8;
      v70 = x;
      v71 = y;
      v72 = width;
      v73 = height;
      v66[0] = v59;
      v66[1] = 3221225472;
      v66[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_12;
      v66[3] = &unk_1E16C0E38;
      v67 = v9;
      +[UIView _animateUsingSpringWithTension:friction:interactive:animations:completion:](UIView, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v68, v66, 100.0, 20.0);

      v58 = v69;
    }
    else
    {
      objc_msgSend(v8, "setAlpha:", 0.0);
      v57 = MEMORY[0x1E0C809B0];
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_13;
      v64[3] = &unk_1E16B1B28;
      v65 = v8;
      v62[0] = v57;
      v62[1] = 3221225472;
      v62[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_14;
      v62[3] = &unk_1E16C0E38;
      v63 = v9;
      +[UIView _animateUsingSpringWithTension:friction:interactive:animations:completion:](UIView, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v64, v62, 100.0, 20.0);

      v58 = v65;
    }

    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 32), "statusBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "regions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "displayItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v20 = v19 / (double)(unint64_t)objc_msgSend(v18, "count");
  v60 = v20 * (double)(unint64_t)(objc_msgSend(v18, "indexOfObject:", v8) + 1);
  v61 = v20 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(v8, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "CGRectValue");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  objc_msgSend(v8, "absoluteFrame");
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  if (objc_msgSend(v7, "type") == 3)
    objc_msgSend(v8, "setAbsoluteFrame:", v25, v27, v29, v31);
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_6;
  v74[3] = &unk_1E16E17C8;
  v40 = v7;
  v41 = *(_QWORD *)(a1 + 32);
  v75 = v40;
  v76 = v41;
  v77 = v8;
  v78 = v25;
  v79 = v27;
  v80 = v29;
  v81 = v31;
  v82 = v33;
  v83 = v35;
  v84 = v37;
  v85 = v39;
  v86 = v60;
  v87 = v61;
  +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v74, v9);

LABEL_18:
}

uint64_t __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  id *v6;
  __int128 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;

  v2 = objc_msgSend(*(id *)(a1 + 32), "type");
  v3 = MEMORY[0x1E0C809B0];
  if (v2 == 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "airplaneObstacleFadeOutDuration");
    v5 = v4;
    v21[0] = v3;
    v21[1] = 3221225472;
    v21[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_7;
    v21[3] = &unk_1E16B20D8;
    v6 = &v22;
    v22 = *(id *)(a1 + 48);
    v7 = *(_OWORD *)(a1 + 72);
    v23 = *(_OWORD *)(a1 + 56);
    v24 = v7;
    +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v21, 0.0, v5);
    objc_msgSend(*(id *)(a1 + 40), "airplaneObstacleFadeOutDuration");
    v9 = v8;
    v17[0] = v3;
    v17[1] = 3221225472;
    v17[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_8;
    v17[3] = &unk_1E16B20D8;
    v18 = *(id *)(a1 + 48);
    v19 = *(_OWORD *)(a1 + 88);
    v20 = *(_OWORD *)(a1 + 104);
    +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v17, v9, 0.0);

  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_9;
    v15[3] = &unk_1E16B1B28;
    v6 = &v16;
    v16 = *(id *)(a1 + 48);
    +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v15, 0.0, 0.0);
  }

  v10 = *(double *)(a1 + 120) / *(double *)(a1 + 128);
  objc_msgSend(*(id *)(a1 + 40), "airplaneObstacleFadeInDuration");
  v12 = v11;
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_10;
  v13[3] = &unk_1E16B1B28;
  v14 = *(id *)(a1 + 48);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v13, v10, v12);

}

uint64_t __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_7(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "displayItemAbsoluteFrames");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = objc_msgSend(v7, "type");
  if (v11 == 2)
    objc_msgSend(v5, "setFloating:", 1);

  return 1;
}

void __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_16(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  id v5;

  v5 = a2;
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v3) & 1) != 0)
  {

  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5);

    if ((v4 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "addSubAnimation:forDisplayItemWithIdentifier:", *(_QWORD *)(a1 + 48), v5);
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    }
  }

}

void __63___UIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63___UIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_2;
  v7[3] = &unk_1E16B1B28;
  v8 = v5;
  v6 = v5;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v7, a4, 0.333333333, 0.0);

}

uint64_t __63___UIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __63___UIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  _QWORD v13[4];
  id v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "absoluteFrame");
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeTranslation(&v18, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) - (v9 + v8 * 0.5), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) - (v11 + v10 * 0.5));
  v16 = v18;
  CGAffineTransformScale(&v17, &v16, 0.66, 0.66);
  v18 = v17;
  objc_msgSend(v6, "setAlpha:", 0.0);
  v15 = v18;
  objc_msgSend(v6, "setTransform:", &v15);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63___UIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_4;
  v13[3] = &unk_1E16B1B28;
  v14 = v6;
  v12 = v6;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v13, v7, 0.333333333);

}

uint64_t __63___UIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_4(uint64_t a1)
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
  return objc_msgSend(v2, "setTransform:", v5);
}

uint64_t __63___UIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;

  v4 = a3;
  objc_msgSend(v4, "absoluteFrame");
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(double *)(v8 + 32) = v6 + v5 * 0.5;
  *(double *)(v8 + 40) = v9 + v7 * 0.5;
  objc_msgSend(v4, "setFloating:", 1);

  return 1;
}

void __109___UIStatusBarVisualProvider_PillRegionCoordinator__updateBackgroundActivityWithEntry_timeEntry_needsUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_hideActivityDetailAndUpdate:", 1);

}

void __103___UIStatusBarVisualProvider_PillRegionCoordinator_updateRegion_highlighted_initialPress_cornerRadius___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  if (*(_BYTE *)(a1 + 32))
  {
    v2 = a2;
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.3);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setBackgroundColor:");

  }
  else
  {
    v3 = a2;
    objc_msgSend(v3, "setBackgroundColor:", 0);
  }

}

@end
