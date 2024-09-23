@implementation UICursorAccessoryView

void __51___UICursorAccessoryView__reloadAccessoryItemViews__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 592);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "objectForKey:", v7, (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 584));
        objc_msgSend(WeakRetained, "configureItemView:forAccessoryIdentifier:", v8, v7);

        objc_msgSend(v8, "layoutIfNeeded");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void __59___UICursorAccessoryView_setAccessoryIdentifiers_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v3 = a2;
  v4 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "grayscaleLuminance:", v5);
  v7 = v6;

  v8 = 1.0;
  if (v7 > 0.75)
    v8 = 0.0;
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v8, 0.2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v9);

}

uint64_t __59___UICursorAccessoryView_setAccessoryIdentifiers_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __59___UICursorAccessoryView_setAccessoryIdentifiers_animated___block_invoke_3(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_scheduleRemovedItemViewCleanup");
  return result;
}

void __60___UICursorAccessoryView__layoutDisplayedAccessoryItemViews__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  CGRect v27;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "objectForKey:", a2);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_displayedItemViewAtIndex:", a3 - 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_displayedItemViewAtIndex:", a3 + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v26;
  if (a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "objectAtIndex:", a3 - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "isActive")
      && (objc_msgSend(v26, "collapsed") & 1) == 0
      && objc_msgSend(v5, "isActive")
      && (objc_msgSend(v5, "collapsed") & 1) == 0)
    {
      objc_msgSend(v8, "setHidden:", 0);
      if (*(_BYTE *)(a1 + 80))
        v25 = *(double *)(a1 + 64) - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + -1.0;
      else
        v25 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      objc_msgSend(v8, "setFrame:", v25, 0.0, 1.0, *(double *)(a1 + 72));
    }
    else
    {
      objc_msgSend(v8, "setHidden:", 1);
    }

    v7 = v26;
  }
  if (objc_msgSend(v7, "isActive"))
  {
    if (objc_msgSend(v5, "isActive"))
      v9 = 0;
    else
      v9 = 2;
    if (objc_msgSend(v6, "isActive"))
      v10 = v9;
    else
      v10 = v9 | 8;
    objc_msgSend(v26, "setRoundedEdges:", v10);
  }
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  if (v12 == 6)
  {
    v13 = *(double *)(a1 + 72);
    v14 = objc_msgSend(v26, "collapsed");
    v15 = 1.0;
    if (v14)
    {
      v15 = 0.0;
      v16 = 0.0;
    }
    else
    {
      v16 = 72.0;
    }
  }
  else
  {
    objc_msgSend(v26, "sizeThatFits:", *(double *)(a1 + 64), *(double *)(a1 + 72));
    v18 = v17;
    v13 = *(double *)(a1 + 72);
    objc_msgSend(v26, "horizontalPadding");
    v20 = v19;
    v21 = objc_msgSend(v26, "collapsed");
    v15 = 1.0;
    if (v21)
    {
      v15 = 0.0;
      v16 = 0.0;
    }
    else
    {
      v16 = v18 + v20 + v20;
    }
  }
  objc_msgSend(v26, "setAlpha:", v15);
  if (*(_BYTE *)(a1 + 80))
    v22 = *(double *)(a1 + 64) - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) - v16;
  else
    v22 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v23 = round(*(double *)(a1 + 56) + (*(double *)(a1 + 72) - v13) * 0.5);
  objc_msgSend(*(id *)(a1 + 32), "contentScaleFactor");
  objc_msgSend(v26, "setFrame:", UIRectIntegralWithScale(v22, v23, v16, v13, v24));
  objc_msgSend(v26, "layoutIfNeeded");
  v27.origin.x = v22;
  v27.origin.y = v23;
  v27.size.width = v16;
  v27.size.height = v13;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CGRectGetWidth(v27)
                                                               + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                           + 24);

}

void __69___UICursorAccessoryView__didRecognizeAccessoryTapGestureRecognizer___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v7, "convertPoint:fromView:", WeakRetained, *(double *)(a1 + 56), *(double *)(a1 + 64));
  if (objc_msgSend(v7, "pointInside:withEvent:", 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "didTapToActivateAccessoryWithIdentifier:", v11);
    objc_msgSend(WeakRetained, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    if (v10 == 6)
      objc_msgSend(v7, "setSelected:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 576));
    *a4 = 1;
  }

}

void __38___UICursorAccessoryView_baseFontSize__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("UICTContentSizeCategoryXL");
  v2[1] = CFSTR("UICTContentSizeCategoryXXL");
  v3[0] = &unk_1E1A9A188;
  v3[1] = &unk_1E1A9A1A0;
  v2[2] = CFSTR("UICTContentSizeCategoryXXXL");
  v2[3] = CFSTR("UICTContentSizeCategoryAccessibilityM");
  v3[2] = &unk_1E1A9A1B8;
  v3[3] = &unk_1E1A95ED0;
  v2[4] = CFSTR("UICTContentSizeCategoryAccessibilityL");
  v2[5] = CFSTR("UICTContentSizeCategoryAccessibilityXL");
  v3[4] = &unk_1E1A95ED0;
  v3[5] = &unk_1E1A95ED0;
  v2[6] = CFSTR("UICTContentSizeCategoryAccessibilityXXL");
  v2[7] = CFSTR("UICTContentSizeCategoryAccessibilityXXXL");
  v3[6] = &unk_1E1A95ED0;
  v3[7] = &unk_1E1A95ED0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_7_9;
  _MergedGlobals_7_9 = v0;

}

void __41___UICursorAccessoryView_defaultItemSize__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[8];
  _QWORD v5[8];
  _QWORD v6[8];
  _QWORD v7[10];

  v7[8] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("UICTContentSizeCategoryXL");
  v6[1] = CFSTR("UICTContentSizeCategoryXXL");
  v7[0] = &unk_1E1A95EE0;
  v7[1] = &unk_1E1A95EF0;
  v6[2] = CFSTR("UICTContentSizeCategoryXXXL");
  v6[3] = CFSTR("UICTContentSizeCategoryAccessibilityM");
  v7[2] = &unk_1E1A95F00;
  v7[3] = &unk_1E1A95F10;
  v6[4] = CFSTR("UICTContentSizeCategoryAccessibilityL");
  v6[5] = CFSTR("UICTContentSizeCategoryAccessibilityXL");
  v7[4] = &unk_1E1A95F20;
  v7[5] = &unk_1E1A95F20;
  v6[6] = CFSTR("UICTContentSizeCategoryAccessibilityXXL");
  v6[7] = CFSTR("UICTContentSizeCategoryAccessibilityXXXL");
  v7[6] = &unk_1E1A95F20;
  v7[7] = &unk_1E1A95F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7B2A0;
  qword_1ECD7B2A0 = v0;

  v4[0] = CFSTR("UICTContentSizeCategoryXL");
  v4[1] = CFSTR("UICTContentSizeCategoryXXL");
  v5[0] = &unk_1E1A95EE0;
  v5[1] = &unk_1E1A95EF0;
  v4[2] = CFSTR("UICTContentSizeCategoryXXXL");
  v4[3] = CFSTR("UICTContentSizeCategoryAccessibilityM");
  v5[2] = &unk_1E1A95F00;
  v5[3] = &unk_1E1A95F30;
  v4[4] = CFSTR("UICTContentSizeCategoryAccessibilityL");
  v4[5] = CFSTR("UICTContentSizeCategoryAccessibilityXL");
  v5[4] = &unk_1E1A95F30;
  v5[5] = &unk_1E1A95F30;
  v4[6] = CFSTR("UICTContentSizeCategoryAccessibilityXXL");
  v4[7] = CFSTR("UICTContentSizeCategoryAccessibilityXXXL");
  v5[6] = &unk_1E1A95F30;
  v5[7] = &unk_1E1A95F30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 8);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECD7B2A8;
  qword_1ECD7B2A8 = v2;

}

void __39___UICursorAccessoryView_largeItemSize__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("UICTContentSizeCategoryXXXL");
  v6[1] = CFSTR("UICTContentSizeCategoryAccessibilityM");
  v7[0] = &unk_1E1A9A1A0;
  v7[1] = &unk_1E1A95F40;
  v6[2] = CFSTR("UICTContentSizeCategoryAccessibilityL");
  v6[3] = CFSTR("UICTContentSizeCategoryAccessibilityXL");
  v7[2] = &unk_1E1A95F40;
  v7[3] = &unk_1E1A95F40;
  v6[4] = CFSTR("UICTContentSizeCategoryAccessibilityXXL");
  v6[5] = CFSTR("UICTContentSizeCategoryAccessibilityXXXL");
  v7[4] = &unk_1E1A95F40;
  v7[5] = &unk_1E1A95F40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7B2B8;
  qword_1ECD7B2B8 = v0;

  v4[0] = CFSTR("UICTContentSizeCategoryXXXL");
  v4[1] = CFSTR("UICTContentSizeCategoryAccessibilityM");
  v5[0] = &unk_1E1A9A1A0;
  v5[1] = &unk_1E1A95F10;
  v4[2] = CFSTR("UICTContentSizeCategoryAccessibilityL");
  v4[3] = CFSTR("UICTContentSizeCategoryAccessibilityXL");
  v5[2] = &unk_1E1A95F10;
  v5[3] = &unk_1E1A95F10;
  v4[4] = CFSTR("UICTContentSizeCategoryAccessibilityXXL");
  v4[5] = CFSTR("UICTContentSizeCategoryAccessibilityXXXL");
  v5[4] = &unk_1E1A95F10;
  v5[5] = &unk_1E1A95F10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 6);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECD7B2C0;
  qword_1ECD7B2C0 = v2;

}

@end
