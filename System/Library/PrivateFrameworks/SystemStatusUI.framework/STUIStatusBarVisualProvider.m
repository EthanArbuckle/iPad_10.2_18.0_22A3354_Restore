@implementation STUIStatusBarVisualProvider

void __105__STUIStatusBarVisualProvider_DynamicSplit_avoidanceFrameUpdatedFromFrame_withAnimationSettings_options___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "statusBar");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

}

uint64_t __70__STUIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toScale___block_invoke_2(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setDynamicScaleTransform:", &v4);
}

void __65__STUIStatusBarVisualProvider_Split__updateLowerRegionsWithData___block_invoke(uint64_t a1, uint64_t a2)
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

void __105__STUIStatusBarVisualProvider_DynamicSplit_avoidanceFrameUpdatedFromFrame_withAnimationSettings_options___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "cutoutLayoutGuide");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "owningView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutSubviews");

}

void __71__STUIStatusBarVisualProvider_Pad_actionable_highlighted_initialPress___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  if (*(_BYTE *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1E0DC3658];
    v3 = a2;
    objc_msgSend(v2, "colorWithWhite:alpha:", 0.0, 0.3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:");

  }
  else
  {
    v4 = a2;
    objc_msgSend(v4, "setBackgroundColor:", 0);
  }

}

void __71__STUIStatusBarVisualProvider_Pad__updateConstraintsForAvoidanceFrame___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "statusBar");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

}

void __79__STUIStatusBarVisualProvider_LegacyPhone_actionable_highlighted_initialPress___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  if (*(_BYTE *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1E0DC3658];
    v3 = a2;
    objc_msgSend(v2, "colorWithWhite:alpha:", 0.0, 0.3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:");

  }
  else
  {
    v4 = a2;
    objc_msgSend(v4, "setBackgroundColor:", 0);
  }

}

uint64_t __62__STUIStatusBarVisualProvider_LegacyPhone_willUpdateWithData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setOverriddenStyle:", *(_QWORD *)(a1 + 32));
}

void __71__STUIStatusBarVisualProvider_LegacyPhone__updateLowerRegionsWithData___block_invoke(uint64_t a1, void *a2)
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

uint64_t __72__STUIStatusBarVisualProvider_LegacyPhone__updateExpandedTrailingRegion__block_invoke(uint64_t a1)
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
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "constant");
  if (v3 != v10)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setConstant:", v3);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__STUIStatusBarVisualProvider_LegacyPhone__updateExpandedTrailingRegion__block_invoke_2;
    v11[3] = &unk_1E8D62A38;
    v11[4] = *(_QWORD *)(a1 + 32);
    return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v11, 0.25);
  }
  return result;
}

void __72__STUIStatusBarVisualProvider_LegacyPhone__updateExpandedTrailingRegion__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "statusBar");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

uint64_t __55__STUIStatusBarVisualProvider_LegacyPhone_setExpanded___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setOverriddenStyle:", *(_QWORD *)(a1 + 32));
}

void __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void (**v7)(id, uint64_t);
  uint64_t v8;
  uint64_t v9;
  CGFloat MinX;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  void (**v14)(id, uint64_t);
  _QWORD v15[4];
  id v16;
  CGFloat v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
    v20 = *(_OWORD *)(v9 + 40);
    v21 = *(_QWORD *)(v9 + 56);
    MinX = CGRectGetMinX(*(CGRect *)(*(_QWORD *)(v8 + 8) + 32));
    v11 = (void *)MEMORY[0x1E0DC3F10];
    v12 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_2;
    v15[3] = &unk_1E8D62B70;
    v16 = v6;
    v17 = MinX;
    v18 = v20;
    v19 = v21;
    v13[0] = v12;
    v13[1] = 3221225472;
    v13[2] = __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_3;
    v13[3] = &unk_1E8D62B98;
    v14 = v7;
    objc_msgSend(v11, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v15, v13, 100.0, 20.0);

  }
}

uint64_t __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
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

void __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;

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
    v15 = (void *)MEMORY[0x1E0DC3F10];
    v16 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_6;
    v24[3] = &unk_1E8D62AF8;
    v17 = v7;
    v18 = *(_QWORD *)(a1 + 32);
    v25 = v17;
    v26 = v18;
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_7;
    v22[3] = &unk_1E8D62B98;
    v23 = v8;
    objc_msgSend(v15, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v24, v22, 100.0, 20.0);
    v19 = (void *)MEMORY[0x1E0DC3F10];
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_8;
    v20[3] = &unk_1E8D62A38;
    v21 = v17;
    objc_msgSend(v19, "animateWithDuration:delay:options:animations:completion:", 0, v20, 0, 0.2, 0.0);

  }
  else
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }

}

uint64_t __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56));
}

uint64_t __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_9(uint64_t a1, void *a2, void *a3, void *a4)
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
  void *v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CGRect v35;

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
    +[STUIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier](STUIStatusBarFullBackgroundActivityItem, "secondaryIconDisplayIdentifier");
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

    v35.origin.x = v21;
    v35.origin.y = v22;
    v35.size.width = v23;
    v35.size.height = v24;
    if (!CGRectIsNull(v35))
      objc_msgSend(v7, "setAbsoluteFrame:", v21, v22, v23, v24);
    v25 = (void *)MEMORY[0x1E0DC3F10];
    v26 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_10;
    v29[3] = &unk_1E8D62B70;
    v30 = v7;
    v31 = v10;
    v32 = v12;
    v33 = v14;
    v34 = v16;
    v27[0] = v26;
    v27[1] = 3221225472;
    v27[2] = __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_11;
    v27[3] = &unk_1E8D62B98;
    v28 = v8;
    objc_msgSend(v25, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v29, v27, 100.0, 20.0);

  }
  else
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }

}

uint64_t __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
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
      +[STUIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier](STUIStatusBarFullBackgroundActivityItem, "secondaryIconDisplayIdentifier");
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

uint64_t __47__STUIStatusBarVisualProvider_iOS_setExpanded___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "disableWithToken:", 10);
}

uint64_t __47__STUIStatusBarVisualProvider_iOS_setExpanded___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enableWithToken:", 10);
}

void __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
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
  void *v53;
  double v54;
  uint64_t v55;
  id v56;
  double v57;
  _QWORD v58[4];
  id v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  CGAffineTransform v63;
  CGAffineTransform v64;
  id v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

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
  v65 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v14 = v65;
  objc_msgSend(v12, "airplaneTravelOffsetInProposedPartWithIdentifier:animationType:", &v65, v13);
  v57 = v15;
  v16 = v65;

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
      v66.origin.x = v27;
      v66.origin.y = v29;
      v66.size.width = v31;
      v66.size.height = v33;
      v39 = MinX - CGRectGetMaxX(v66) - v57;
    }
    else
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v34);
      v68.origin.x = v27;
      v68.origin.y = v29;
      v68.size.width = v31;
      v68.size.height = v33;
      v39 = v57 + MaxX - CGRectGetMinX(v68);
    }
    CGAffineTransformMakeTranslation(&v64, -v39, 0.0);
    v63 = v64;
    objc_msgSend(v6, "setTransform:", &v63);
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
      v67.origin.x = v18;
      v67.origin.y = v20;
      v67.size.width = v22;
      v67.size.height = v24;
      v39 = v44 - CGRectGetMaxX(v67) - v57;
    }
    else
    {
      v47 = CGRectGetMaxX(*(CGRect *)&v40);
      v69.origin.x = v18;
      v69.origin.y = v20;
      v69.size.width = v22;
      v69.size.height = v24;
      v39 = v57 + v47 - CGRectGetMinX(v69);
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
  v53 = (void *)MEMORY[0x1E0DC3F10];
  v54 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_2;
  v58[3] = &unk_1E8D63050;
  v61 = v51;
  v62 = v39;
  v55 = *(_QWORD *)(a1 + 32);
  v59 = v6;
  v60 = v55;
  v56 = v6;
  objc_msgSend(v53, "animateWithDuration:delay:options:animations:completion:", v46, v58, v7, v54, 0.0);

}

uint64_t __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_2(uint64_t a1)
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

uint64_t __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "type");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 2)
    objc_msgSend(v5, "setFloating:", 1);

  return 1;
}

void __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  double v64;
  double v65;
  _QWORD v66[4];
  void (**v67)(id, uint64_t);
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  void (**v71)(id, uint64_t);
  _QWORD v72[4];
  id v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  _QWORD v78[4];
  id v79;
  uint64_t v80;
  id v81;
  double v82;
  double v83;
  double v84;
  double v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  double v90;
  double v91;
  _QWORD v92[4];
  id v93;
  CGRect v94;
  CGRect v95;

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
      v14 = (void *)MEMORY[0x1E0DC3F10];
      v15 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) * 0.5;
      v92[0] = MEMORY[0x1E0C809B0];
      v92[1] = 3221225472;
      v92[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_5;
      v92[3] = &unk_1E8D62A38;
      v93 = v8;
      objc_msgSend(v14, "animateWithDuration:animations:completion:", v92, v9, v15);

      goto LABEL_18;
    }
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  if (v13 != 2)
  {
    v44 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(v8, "identifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKeyedSubscript:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      objc_msgSend(v46, "CGRectValue");
      v48 = v47;
      v50 = v49;
      v52 = v51;
      v54 = v53;
      objc_msgSend(v8, "absoluteFrame");
      x = v94.origin.x;
      y = v94.origin.y;
      width = v94.size.width;
      height = v94.size.height;
      v95.origin.x = v48;
      v95.origin.y = v50;
      v95.size.width = v52;
      v95.size.height = v54;
      if (CGRectEqualToRect(v94, v95))
      {
        v9[2](v9, 1);
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(v8, "setAbsoluteFrame:", v48, v50, v52, v54);
      v62 = (void *)MEMORY[0x1E0DC3F10];
      v63 = MEMORY[0x1E0C809B0];
      v72[0] = MEMORY[0x1E0C809B0];
      v72[1] = 3221225472;
      v72[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_11;
      v72[3] = &unk_1E8D62B70;
      v73 = v8;
      v74 = x;
      v75 = y;
      v76 = width;
      v77 = height;
      v70[0] = v63;
      v70[1] = 3221225472;
      v70[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_12;
      v70[3] = &unk_1E8D62B98;
      v71 = v9;
      objc_msgSend(v62, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v72, v70, 100.0, 20.0);

      v61 = v73;
    }
    else
    {
      objc_msgSend(v8, "setAlpha:", 0.0);
      v59 = (void *)MEMORY[0x1E0DC3F10];
      v60 = MEMORY[0x1E0C809B0];
      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_13;
      v68[3] = &unk_1E8D62A38;
      v69 = v8;
      v66[0] = v60;
      v66[1] = 3221225472;
      v66[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_14;
      v66[3] = &unk_1E8D62B98;
      v67 = v9;
      objc_msgSend(v59, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v68, v66, 100.0, 20.0);

      v61 = v69;
    }

    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 32), "statusBar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "regions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "displayItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v21 = v20 / (double)(unint64_t)objc_msgSend(v19, "count");
  v64 = v21 * (double)(unint64_t)(objc_msgSend(v19, "indexOfObject:", v8) + 1);
  v65 = v21 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(v8, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "CGRectValue");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;

  objc_msgSend(v8, "absoluteFrame");
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  if (objc_msgSend(v7, "type") == 3)
    objc_msgSend(v8, "setAbsoluteFrame:", v26, v28, v30, v32);
  v41 = (void *)MEMORY[0x1E0DC3F10];
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_6;
  v78[3] = &unk_1E8D630A0;
  v42 = v7;
  v43 = *(_QWORD *)(a1 + 32);
  v79 = v42;
  v80 = v43;
  v81 = v8;
  v82 = v26;
  v83 = v28;
  v84 = v30;
  v85 = v32;
  v86 = v34;
  v87 = v36;
  v88 = v38;
  v89 = v40;
  v90 = v64;
  v91 = v65;
  objc_msgSend(v41, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v78, v9);

LABEL_18:
}

uint64_t __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  id *v7;
  __int128 v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;

  v2 = objc_msgSend(*(id *)(a1 + 32), "type");
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v4 = MEMORY[0x1E0C809B0];
  if (v2 == 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "airplaneObstacleFadeOutDuration");
    v6 = v5;
    v24[0] = v4;
    v24[1] = 3221225472;
    v24[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_7;
    v24[3] = &unk_1E8D62B70;
    v7 = &v25;
    v25 = *(id *)(a1 + 48);
    v8 = *(_OWORD *)(a1 + 72);
    v26 = *(_OWORD *)(a1 + 56);
    v27 = v8;
    objc_msgSend(v3, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v24, 0.0, v6);
    v9 = (void *)MEMORY[0x1E0DC3F10];
    objc_msgSend(*(id *)(a1 + 40), "airplaneObstacleFadeOutDuration");
    v11 = v10;
    v20[0] = v4;
    v20[1] = 3221225472;
    v20[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_8;
    v20[3] = &unk_1E8D62B70;
    v21 = *(id *)(a1 + 48);
    v22 = *(_OWORD *)(a1 + 88);
    v23 = *(_OWORD *)(a1 + 104);
    objc_msgSend(v9, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v20, v11, 0.0);

  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_9;
    v18[3] = &unk_1E8D62A38;
    v7 = &v19;
    v19 = *(id *)(a1 + 48);
    objc_msgSend(v3, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v18, 0.0, 0.0);
  }

  v12 = (void *)MEMORY[0x1E0DC3F10];
  v13 = *(double *)(a1 + 120) / *(double *)(a1 + 128);
  objc_msgSend(*(id *)(a1 + 40), "airplaneObstacleFadeInDuration");
  v15 = v14;
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_10;
  v16[3] = &unk_1E8D62A38;
  v17 = *(id *)(a1 + 48);
  objc_msgSend(v12, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v16, v13, v15);

}

uint64_t __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_7(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_15(uint64_t a1, void *a2, void *a3)
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

void __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_16(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  id v5;

  v5 = a2;
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarIndicatorAirplaneModeItem, "defaultDisplayIdentifier");
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

void __64__STUIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0DC3F10];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__STUIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_2;
  v8[3] = &unk_1E8D62A38;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "animateWithDuration:delay:options:animations:completion:", 4, v8, a4, 0.333333333, 0.0);

}

uint64_t __64__STUIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __64__STUIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "absoluteFrame");
  UIRectGetCenter();
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeTranslation(&v17, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) - v8, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) - v9);
  v15 = v17;
  CGAffineTransformScale(&v16, &v15, 0.66, 0.66);
  v17 = v16;
  objc_msgSend(v6, "setAlpha:", 0.0);
  v14 = v17;
  objc_msgSend(v6, "setTransform:", &v14);
  v10 = (void *)MEMORY[0x1E0DC3F10];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__STUIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_4;
  v12[3] = &unk_1E8D62A38;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v10, "animateWithDuration:animations:completion:", v12, v7, 0.333333333);

}

uint64_t __64__STUIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_4(uint64_t a1)
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

uint64_t __64__STUIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(v4, "absoluteFrame");
  UIRectGetCenter();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v5 + 32) = v6;
  *(_QWORD *)(v5 + 40) = v7;
  objc_msgSend(v4, "setFloating:", 1);

  return 1;
}

void __67__STUIStatusBarVisualProvider_DynamicSplit_leadingItemCutoffWidths__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1EFC01C70;
  qword_1EFC01C70 = (uint64_t)&unk_1E8D80168;

}

void __68__STUIStatusBarVisualProvider_DynamicSplit_trailingItemCutoffWidths__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1EFC01C80;
  qword_1EFC01C80 = (uint64_t)&unk_1E8D80180;

}

uint64_t __88__STUIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toDynamicallyHidden_scale___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CGAffineTransform *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  void *v28;
  uint64_t result;
  void *v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  _OWORD v35[3];
  CGAffineTransform v36;
  CGAffineTransform v37;

  v2 = *(unsigned __int8 *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentationLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    if (v7)
      v8 = v7;
    else
      v8 = &unk_1E8D80520;
    objc_msgSend(v3, "setFromValue:", v8);
    objc_msgSend(v3, "setToValue:", &unk_1E8D80530);
    objc_msgSend(v3, "setDuration:", *(double *)(a1 + 40) * 0.35);
    LODWORD(v9) = 1045220557;
    LODWORD(v10) = 0;
    LODWORD(v11) = 1.0;
    LODWORD(v12) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v10, v9, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTimingFunction:", v13);

    objc_msgSend(*(id *)(a1 + 32), "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAnimation:forKey:", v3, CFSTR("blur"));

    objc_msgSend(*(id *)(a1 + 32), "setDynamicHidingAlpha:", 0.0);
    CGAffineTransformMakeScale(&v37, 0.5, 0.5);
    v16 = *(void **)(a1 + 32);
    v36 = v37;
    v17 = &v36;
  }
  else
  {
    if (v7)
    {
      objc_msgSend(v7, "doubleValue");
      if (v18 == 0.0)
        v19 = &unk_1E8D80530;
      else
        v19 = v7;
    }
    else
    {
      v19 = &unk_1E8D80530;
    }
    objc_msgSend(v3, "setFromValue:", v19);
    objc_msgSend(v3, "setToValue:", &unk_1E8D80520);
    objc_msgSend(v3, "setDuration:", *(double *)(a1 + 40));
    LODWORD(v20) = 1045220557;
    LODWORD(v21) = 0;
    LODWORD(v22) = 1.0;
    LODWORD(v23) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v21, v20, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTimingFunction:", v24);

    objc_msgSend(*(id *)(a1 + 32), "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addAnimation:forKey:", v3, CFSTR("blur"));

    objc_msgSend(*(id *)(a1 + 32), "setDynamicHidingAlpha:", 1.0);
    v16 = *(void **)(a1 + 32);
    v27 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v35[0] = *MEMORY[0x1E0C9BAA8];
    v35[1] = v27;
    v35[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v17 = (CGAffineTransform *)v35;
  }
  objc_msgSend(v16, "setDynamicHidingTransform:", v17);

  CGAffineTransformMakeScale(&v34, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 48));
  v28 = *(void **)(a1 + 32);
  v33 = v34;
  result = objc_msgSend(v28, "setDynamicScaleTransform:", &v33);
  if (!*(_BYTE *)(a1 + 56))
  {
    CGAffineTransformMakeScale(&v32, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 48));
    v30 = *(void **)(a1 + 32);
    v31 = v32;
    return objc_msgSend(v30, "setDynamicScaleTransform:", &v31);
  }
  return result;
}

uint64_t __88__STUIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toDynamicallyHidden_scale___block_invoke_86(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setDynamicScaleTransform:", &v4);
}

uint64_t __70__STUIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toScale___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setDynamicScaleTransform:", &v4);
}

void __105__STUIStatusBarVisualProvider_DynamicSplit_avoidanceFrameUpdatedFromFrame_withAnimationSettings_options___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "cutoutLayoutGuide");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "owningView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutSubviews");

}

void __73__STUIStatusBarVisualProvider_DynamicSplitMedium_leadingItemCutoffWidths__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1EFC01C90;
  qword_1EFC01C90 = (uint64_t)&unk_1E8D80198;

}

void __74__STUIStatusBarVisualProvider_DynamicSplitMedium_trailingItemCutoffWidths__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1EFC01CA0;
  qword_1EFC01CA0 = (uint64_t)&unk_1E8D801B0;

}

void __110__STUIStatusBarVisualProvider_PillRegionCoordinator__updateBackgroundActivityWithEntry_timeEntry_needsUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_hideActivityDetailAndUpdate:", 1);

}

void __104__STUIStatusBarVisualProvider_PillRegionCoordinator_updateRegion_highlighted_initialPress_cornerRadius___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  if (*(_BYTE *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1E0DC3658];
    v3 = a2;
    objc_msgSend(v2, "colorWithWhite:alpha:", 0.0, 0.3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:");

  }
  else
  {
    v4 = a2;
    objc_msgSend(v4, "setBackgroundColor:", 0);
  }

}

id __88__STUIStatusBarVisualProvider_Split_visualProviderSubclassForScreen_visualProviderInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
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
      result = STUIStatusBarGetVisualProviderSubclassForScreenWithVisualProviderInfo(a2, *(void **)(a1 + 32), 0);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
      *a4 = 1;
    }
  }
  return result;
}

void __66__STUIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
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
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "absoluteFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v6, "setAbsoluteFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56));
  v16 = (void *)MEMORY[0x1E0DC3F10];
  v20 = v7;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __66__STUIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke_2;
  v21[3] = &unk_1E8D62B70;
  v22 = v6;
  v23 = v9;
  v24 = v11;
  v25 = v13;
  v26 = v15;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __66__STUIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke_3;
  v19[3] = &unk_1E8D62B98;
  v17 = v7;
  v18 = v6;
  objc_msgSend(v16, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v21, v19, 100.0, 20.0);

}

uint64_t __66__STUIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __66__STUIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__STUIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
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

void __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  CGAffineTransform v22;
  CGAffineTransform v23;

  v7 = a3;
  v8 = a4;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = a2;
  -[STUIStatusBarVisualProvider_Split _collapseChargingBoltTransformForDisplayItem:](&v23, v9, v7);
  v22 = v23;
  objc_msgSend(v7, "setTransform:", &v22);
  objc_msgSend(v7, "setAlpha:", 0.0);
  v11 = MEMORY[0x1E0C809B0];
  v12 = (void *)MEMORY[0x1E0DC3F10];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_2;
  v19[3] = &unk_1E8D62C88;
  v13 = *(_QWORD *)(a1 + 32);
  v20 = v7;
  v21 = v13;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_3;
  v17[3] = &unk_1E8D64080;
  v17[4] = v13;
  v18 = v8;
  v14 = v8;
  v15 = v7;
  objc_msgSend(v12, "animateWithDuration:animations:completion:", v19, v17, 0.3);
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_5;
  v16[3] = &unk_1E8D62A38;
  v16[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v10, "addTimeout:withHandler:", v16, 0.6);

}

uint64_t __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;
  CGAffineTransform v7;
  CGAffineTransform v8;

  v3 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  if (*(_QWORD *)(v3 + 8))
  {
    objc_msgSend(v2, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "_shouldReverseLayoutDirection"))
      v5 = 7.0;
    else
      v5 = -7.0;

    CGAffineTransformMakeTranslation(&v8, v5, -1.66666667);
    v2 = *(void **)(a1 + 32);
  }
  else
  {
    memset(&v8, 0, sizeof(v8));
  }
  v7 = v8;
  objc_msgSend(v2, "setTransform:", &v7);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_3(uint64_t a1, int a2)
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
    v8 = __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_4;
    v9 = &unk_1E8D62CB0;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v6, 3.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setBatteryExpansionTimer:", v4, v6, v7, v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    -[STUIStatusBarVisualProvider_Split _collapseBattery](*(id **)(a1 + 32));
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_4(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  -[STUIStatusBarVisualProvider_Split _collapseBattery](WeakRetained);

}

void __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_5(uint64_t a1)
{
  -[STUIStatusBarVisualProvider_Split _collapseBattery](*(id **)(a1 + 32));
}

void __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
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
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  CGAffineTransform v25;
  uint64_t v26;
  uint64_t v27;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v30;
  CGAffineTransform v31;

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

  memset(&v31, 0, sizeof(v31));
  CGAffineTransformMakeScale(&v31, 1.4, 1.4);
  v15 = objc_msgSend(v8, "_shouldReverseLayoutDirection");
  v16 = -6.0;
  if (v15)
    v16 = 6.0;
  t1 = v31;
  CGAffineTransformTranslate(&v30, &t1, v16, -1.0);
  v31 = v30;
  if (v8)
    objc_msgSend(v8, "transform");
  else
    memset(&t2, 0, sizeof(t2));
  t1 = v31;
  CGAffineTransformConcat(&v30, &t1, &t2);
  v31 = v30;
  v17 = (void *)MEMORY[0x1E0DC3F10];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_7;
  v21[3] = &unk_1E8D640A8;
  v25 = v30;
  v22 = v6;
  v23 = v8;
  v26 = v11;
  v27 = v13;
  v24 = v9;
  v18 = v9;
  v19 = v8;
  v20 = v6;
  objc_msgSend(v17, "animateWithDuration:animations:completion:", v21, v7, 0.3);

}

uint64_t __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_7(uint64_t a1)
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

uint64_t __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
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

void __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_9(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_10;
  v14[3] = &unk_1E8D62A38;
  v15 = v5;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_11;
  v11[3] = &unk_1E8D64080;
  v12 = v15;
  v13 = v6;
  v9 = v6;
  v10 = v15;
  objc_msgSend(v7, "animateWithDuration:animations:completion:", v14, v11, 0.1);

}

uint64_t __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_11(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFloating:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  objc_msgSend(a3, "setFloating:", 1);
  return 1;
}

void __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD v20[5];
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;

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
  v16 = (void *)MEMORY[0x1E0DC3F10];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_2;
  v23[3] = &unk_1E8D62C88;
  v17 = *(_QWORD *)(a1 + 32);
  v24 = v7;
  v25 = v17;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_3;
  v21[3] = &unk_1E8D64080;
  v21[4] = v17;
  v22 = v8;
  v18 = v8;
  v19 = v7;
  objc_msgSend(v16, "animateWithDuration:animations:completion:", v23, v21, 0.3);
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_4;
  v20[3] = &unk_1E8D62A38;
  v20[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v14, "addTimeout:withHandler:", v20, 0.6);

}

uint64_t __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_2(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  -[STUIStatusBarVisualProvider_Split _collapseChargingBoltTransformForDisplayItem:](&v5, *(_QWORD *)(a1 + 40), *(void **)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  objc_msgSend(v2, "setTransform:", &v4);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_3(uint64_t a1)
{
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "isEnabled"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setEnabled:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_4(uint64_t a1)
{
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "isEnabled"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setEnabled:", 0);
    -[STUIStatusBarVisualProvider_Split _resetBattery](*(void **)(a1 + 32));
  }
}

uint64_t __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
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

void __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
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
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;

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
  v15 = (void *)MEMORY[0x1E0DC3F10];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_7;
  v25[3] = &unk_1E8D64158;
  v26 = v6;
  v29 = v11;
  v30 = v13;
  v27 = v8;
  v28 = v9;
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_8;
  v21[3] = &unk_1E8D64180;
  v16 = *(_QWORD *)(a1 + 32);
  v22 = v27;
  v23 = v16;
  v24 = v7;
  v17 = v7;
  v18 = v27;
  v19 = v9;
  v20 = v6;
  objc_msgSend(v15, "animateWithDuration:animations:completion:", v25, v21, 0.3);

}

uint64_t __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_7(uint64_t a1)
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

uint64_t __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_8(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldRasterize:", 1);

  -[STUIStatusBarVisualProvider_Split _resetBattery](*(void **)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
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

void __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_10(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "setAlpha:", 0.0);
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_11;
  v9[3] = &unk_1E8D62A38;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 0, v9, v6, 0.15, 0.2);

}

uint64_t __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __67__STUIStatusBarVisualProvider_Split__controlCenterGrabberAnimation__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  CGAffineTransform v21;
  CGAffineTransform v22;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a2, "type");
  objc_msgSend((id)objc_opt_class(), "height");
  if (v8 == 1)
  {
    v10 = v9;
    objc_msgSend(v6, "setAlpha:", 0.0);
    CGAffineTransformMakeTranslation(&v22, 0.0, v10 * -0.5);
    v21 = v22;
    objc_msgSend(v6, "setTransform:", &v21);
    v11 = 0.25;
    v12 = 0x20000;
  }
  else
  {
    v11 = 0.0;
    v12 = 0x10000;
  }
  v13 = (void *)MEMORY[0x1E0DC3F10];
  v17 = v7;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__STUIStatusBarVisualProvider_Split__controlCenterGrabberAnimation__block_invoke_2;
  v18[3] = &unk_1E8D63248;
  v19 = v6;
  v20 = v8;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__STUIStatusBarVisualProvider_Split__controlCenterGrabberAnimation__block_invoke_3;
  v16[3] = &unk_1E8D63638;
  v14 = v7;
  v15 = v6;
  objc_msgSend(v13, "animateWithDuration:delay:options:animations:completion:", v12, v18, v16, 0.66, v11);

}

uint64_t __67__STUIStatusBarVisualProvider_Split__controlCenterGrabberAnimation__block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  double v4;
  _OWORD v6[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v6[0] = *MEMORY[0x1E0C9BAA8];
  v6[1] = v3;
  v6[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v6);
  v4 = 0.0;
  if (*(_QWORD *)(a1 + 40) == 1)
    v4 = 1.0;
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v4);
}

uint64_t __67__STUIStatusBarVisualProvider_Split__controlCenterGrabberAnimation__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__STUIStatusBarVisualProvider_Split__controlCenterGrabberAnimation__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(a2, "type") == 2)
    objc_msgSend(v4, "setFloating:", 1);

  return 1;
}

void __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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
  double v33;
  double v34;
  id v35;
  void *v36;
  double MaxX;
  double MinX;
  double v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  dispatch_time_t v44;
  id *v45;
  void *v46;
  void *v47;
  dispatch_time_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  _QWORD v57[5];
  _QWORD v58[5];
  id v59;
  BOOL v60;
  _QWORD v61[4];
  id v62;
  id v63;
  double v64;
  BOOL v65;
  char v66;
  _QWORD v67[4];
  id v68;
  _QWORD block[4];
  id v70;
  id location;
  CGAffineTransform v72;
  CGAffineTransform v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

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

  v56 = v7;
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

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v10, "bounds");
    v34 = v33;
    v35 = v10;
  }
  else
  {
    if (*(_BYTE *)(a1 + 49) == (v14 == 1))
    {
      objc_msgSend(v13, "layoutItem");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "_ui_frame");
      MaxX = CGRectGetMaxX(v74);
      v75.origin.x = v26;
      v75.origin.y = v28;
      v75.size.width = v30;
      v75.size.height = v32;
      v34 = MaxX - CGRectGetMaxX(v75);
    }
    else
    {
      v76.origin.x = v26;
      v76.origin.y = v28;
      v76.size.width = v30;
      v76.size.height = v32;
      MinX = CGRectGetMinX(v76);
      objc_msgSend(v13, "layoutItem");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "_ui_frame");
      v34 = MinX - CGRectGetMinX(v77);
    }

    v35 = 0;
    if (*(_BYTE *)(a1 + 49))
      v34 = -v34;
  }
  if (v14 == 1)
  {
    v39 = 0.25;
    if (*(_BYTE *)(a1 + 48)
      || (v39 = (double)(unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") * 0.25, *(_BYTE *)(a1 + 48)))
    {
      objc_msgSend(v35, "setHideWithWipe:", 1);
    }
    else
    {
      objc_msgSend(v8, "setAlpha:", 0.0);
      CGAffineTransformMakeTranslation(&v73, -v34, 0.0);
      v72 = v73;
      objc_msgSend(v8, "setTransform:", &v72);
    }
    v40 = *(_BYTE *)(a1 + 48);
    if (v40)
    {
      v55 = v13;
      objc_initWeak(&location, v35);
      objc_msgSend(MEMORY[0x1E0CE86D8], "disappearUpEffect");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "effectWithByLayer");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CE86E8], "optionsWithNonRepeating");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addSymbolEffect:options:animated:", v42, v43, 0);

      v44 = dispatch_time(0, (uint64_t)((v39 + 0.165) * 1000000000.0));
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_2;
      block[3] = &unk_1E8D64228;
      v45 = &v70;
      objc_copyWeak(&v70, &location);
      dispatch_after(v44, MEMORY[0x1E0C80D38], block);
      v46 = v55;
LABEL_16:
      objc_destroyWeak(v45);
      objc_destroyWeak(&location);
      v40 = *(_BYTE *)(a1 + 48);
      goto LABEL_19;
    }
    v46 = v13;
  }
  else
  {
    v46 = v13;
    objc_msgSend(*(id *)(a1 + 32), "systemUpdatesTimer");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "invalidate");

    objc_msgSend(*(id *)(a1 + 32), "setSystemUpdatesTimer:", 0);
    -[STUIStatusBarVisualProvider_Split _resumeSystemUpdateData](*(void **)(a1 + 32));
    v40 = *(_BYTE *)(a1 + 48);
    if (v40)
    {
      objc_initWeak(&location, v35);
      v48 = dispatch_time(0, 217800000);
      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_4;
      v67[3] = &unk_1E8D64228;
      v45 = &v68;
      objc_copyWeak(&v68, &location);
      dispatch_after(v48, MEMORY[0x1E0C80D38], v67);
      v39 = 0.0;
      goto LABEL_16;
    }
    v39 = 0.0;
  }
LABEL_19:
  v49 = (void *)MEMORY[0x1E0DC3F10];
  v50 = MEMORY[0x1E0C809B0];
  v61[0] = MEMORY[0x1E0C809B0];
  if (v14 == 1)
    v51 = 0x20000;
  else
    v51 = 0x10000;
  v61[1] = 3221225472;
  v61[2] = __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_5;
  v61[3] = &unk_1E8D64250;
  v65 = v14 == 1;
  v66 = v40;
  v62 = v35;
  v63 = v8;
  v64 = v34;
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_6;
  v58[3] = &unk_1E8D64278;
  v60 = v14 == 1;
  v58[4] = *(_QWORD *)(a1 + 32);
  v59 = v9;
  v52 = v9;
  v53 = v8;
  v54 = v35;
  objc_msgSend(v49, "animateWithDuration:delay:options:animations:completion:", v51, v61, v58, 0.66, v39);
  v57[0] = v50;
  v57[1] = 3221225472;
  v57[2] = __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_9;
  v57[3] = &unk_1E8D62A38;
  v57[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v56, "addTimeout:withHandler:", v57, 2.0);

}

void __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CE86B8], "appearUpEffect");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "effectWithByLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CE86E8], "optionsWithNonRepeating");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "addSymbolEffect:options:animated:completion:", v2, v3, 1, &__block_literal_global_128);

}

void __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CE86D8], "disappearDownEffect");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "effectWithByLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CE86E8], "optionsWithNonRepeating");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "addSymbolEffect:options:animated:", v2, v3, 1);

}

uint64_t __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_5(uint64_t a1)
{
  void *v3;
  __int128 v4;
  void *v5;
  double v6;
  void *v7;
  CGAffineTransform v8;
  CGAffineTransform v9;
  _OWORD v10[3];

  if (*(_BYTE *)(a1 + 56))
  {
    if (*(_BYTE *)(a1 + 57))
      return objc_msgSend(*(id *)(a1 + 32), "setHideWithWipe:", 0);
    v3 = *(void **)(a1 + 40);
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v10[0] = *MEMORY[0x1E0C9BAA8];
    v10[1] = v4;
    v10[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v3, "setTransform:", v10);
    v5 = *(void **)(a1 + 40);
    v6 = 1.0;
  }
  else
  {
    if (*(_BYTE *)(a1 + 57))
    {
      objc_msgSend(*(id *)(a1 + 32), "setHideWithWipe:", 0);
      return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.99);
    }
    CGAffineTransformMakeTranslation(&v9, *(CGFloat *)(a1 + 48), 0.0);
    v7 = *(void **)(a1 + 40);
    v8 = v9;
    objc_msgSend(v7, "setTransform:", &v8);
    v5 = *(void **)(a1 + 40);
    v6 = 0.0;
  }
  return objc_msgSend(v5, "setAlpha:", v6);
}

uint64_t __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_6(uint64_t a1, int a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  id obj;
  _QWORD v26[5];
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id location[18];

  v2 = a1;
  location[16] = *(id *)MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      v3 = *(void **)(a1 + 32);
      if (v3)
      {
        +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "visualProviderSettings");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "showVPNDisconnect");

        if (v6)
        {
          objc_msgSend(v3, "delayedSystemUpdateDataToken");
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v7)
          {
            objc_msgSend(v3, "statusBar");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "dataAggregator");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = 0u;
            v32 = 0u;
            v29 = 0u;
            v30 = 0u;
            objc_msgSend(v3, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("systemUpdates"));
            obj = (id)objc_claimAutoreleasedReturnValue();
            v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, location, 16);
            if (v9)
            {
              v10 = *(_QWORD *)v30;
              do
              {
                v11 = 0;
                do
                {
                  if (*(_QWORD *)v30 != v10)
                    objc_enumerationMutation(obj);
                  v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v11);
                  objc_msgSend(v3, "statusBar");
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "identifier");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:](STUIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:", v14);
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "itemWithIdentifier:", v15);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v16, "dependentEntryKeys");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "unionSet:", v17);

                  ++v11;
                }
                while (v9 != v11);
                v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, location, 16);
              }
              while (v9);
            }

            objc_msgSend(v22, "beginDelayingUpdatesForEntryKeys:", v8);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setDelayedSystemUpdateDataToken:", v18);

          }
        }
      }
      objc_initWeak(location, *(id *)(a1 + 32));
      v19 = (void *)MEMORY[0x1E0C99E88];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_7;
      v27[3] = &unk_1E8D62CB0;
      objc_copyWeak(&v28, location);
      objc_msgSend(v19, "scheduledTimerWithTimeInterval:repeats:block:", 0, v27, 2.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setSystemUpdatesTimer:", v20);

      -[STUIStatusBarVisualProvider_Split _collapseBattery](*(id **)(a1 + 32));
      objc_destroyWeak(&v28);
      objc_destroyWeak(location);
      v2 = a1;
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 40) + 16))();
  }
  else
  {
    -[STUIStatusBarVisualProvider_Split _disableSystemUpdates](*(void **)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(v2 + 40) + 16))();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_8;
    v26[3] = &unk_1E8D62A38;
    v26[4] = *(_QWORD *)(v2 + 32);
    return objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v26);
  }
}

void __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    -[STUIStatusBarVisualProvider_Split _disableSystemUpdates](WeakRetained);
    objc_msgSend(v3, "statusBar");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

    -[STUIStatusBarVisualProvider_Split _resumeSystemUpdateData](v3);
    WeakRetained = v3;
  }

}

void __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_8(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "statusBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

  -[STUIStatusBarVisualProvider_Split _resumeSystemUpdateData](*(void **)(a1 + 32));
}

uint64_t __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_9(uint64_t a1)
{
  _QWORD v3[5];

  -[STUIStatusBarVisualProvider_Split _disableSystemUpdates](*(void **)(a1 + 32));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_10;
  v3[3] = &unk_1E8D62A38;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
}

void __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_10(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "statusBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

  -[STUIStatusBarVisualProvider_Split _resumeSystemUpdateData](*(void **)(a1 + 32));
}

uint64_t __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(a2, "type") == 2)
    objc_msgSend(v4, "setFloating:", 1);

  return 1;
}

void __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_12(uint64_t a1, void *a2, void *a3, void *a4)
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
  void *v19;
  double v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;

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
    v17 = (double)v14 * 0.2;
    v18 = 0.0;
    if (*(_BYTE *)(a1 + 40))
      v17 = 0.0;
    v19 = (void *)MEMORY[0x1E0DC3F10];
    if (v10 == 1)
      v18 = 0.5;
    v20 = v18 + v17;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_13;
    v21[3] = &unk_1E8D63248;
    v22 = v7;
    v23 = v10;
    objc_msgSend(v19, "animateWithDuration:delay:options:animations:completion:", 0, v21, v8, 0.25, v20);

  }
}

uint64_t __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_13(uint64_t a1)
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

uint64_t __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_14(uint64_t a1, void *a2, void *a3)
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

void __66__STUIStatusBarVisualProvider_Split__updateExpandedTrailingRegion__block_invoke(uint64_t a1)
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
  void *v17;
  _QWORD v18[4];
  id v19;

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
    v17 = (void *)MEMORY[0x1E0DC3F10];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __66__STUIStatusBarVisualProvider_Split__updateExpandedTrailingRegion__block_invoke_2;
    v18[3] = &unk_1E8D62A38;
    v19 = *(id *)(a1 + 32);
    objc_msgSend(v17, "animateWithDuration:animations:", v18, 0.25);

  }
}

uint64_t __66__STUIStatusBarVisualProvider_Split__updateExpandedTrailingRegion__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __49__STUIStatusBarVisualProvider_Split_setExpanded___block_invoke(uint64_t a1)
{
  -[STUIStatusBarVisualProvider_Split _collapseBattery](*(id **)(a1 + 32));
}

BOOL __71__STUIStatusBarVisualProvider_FixedSplit__orderedDisplayItemPlacements__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v2 = a2;
  v3 = objc_msgSend((id)objc_opt_class(), "showsLargeBatteryChargingAnimation");
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    +[STUIStatusBarBatteryItem iconDisplayIdentifier](STUIStatusBarBatteryItem, "iconDisplayIdentifier");
  else
    +[STUIStatusBarBatteryItem staticIconDisplayIdentifier](STUIStatusBarBatteryItem, "staticIconDisplayIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 == v5;

  return v6;
}

BOOL __71__STUIStatusBarVisualProvider_FixedSplit__orderedDisplayItemPlacements__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarCellularItem signalStrengthDisplayIdentifier](STUIStatusBarCellularCondensedItem, "signalStrengthDisplayIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2 == v3;

  return v4;
}

BOOL __71__STUIStatusBarVisualProvider_FixedSplit__orderedDisplayItemPlacements__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarCellularCondensedItem dualSignalStrengthDisplayIdentifier](STUIStatusBarCellularCondensedItem, "dualSignalStrengthDisplayIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2 == v3;

  return v4;
}

BOOL __71__STUIStatusBarVisualProvider_FixedSplit__orderedDisplayItemPlacements__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarThermalItem, "defaultDisplayIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2 == v3;

  return v4;
}

void __74__STUIStatusBarVisualProvider_FixedSplit__updateSystemNavigationWithData___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "statusBar");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateWithAnimations:", MEMORY[0x1E0C9AA60]);

}

@end
