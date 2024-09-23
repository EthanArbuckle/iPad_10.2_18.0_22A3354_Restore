@implementation UINavigationBarVisualProviderLegacyIOS

double __72___UINavigationBarVisualProviderLegacyIOS__preferredContentSizeForItem___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 40);
}

void __75___UINavigationBarVisualProviderLegacyIOS__layoutInBounds_withVisualStyle___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v6;
  id v7;

  if (*(_QWORD *)(a1 + 56) > a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if ((_barItemHidden(v7) & 1) != 0)
    {
      objc_msgSend(v7, "removeFromSuperview");
    }
    else
    {
      objc_msgSend(a2, "CGRectValue");
      objc_msgSend(v7, "setFrame:");
      objc_msgSend(v7, "superview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        objc_msgSend(v7, "setAlpha:", 1.0);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "addSubview:", v7);
      }
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;

  }
}

void __75___UINavigationBarVisualProviderLegacyIOS__layoutInBounds_withVisualStyle___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  void *v6;
  id v7;

  if (*(_QWORD *)(a1 + 56) > a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if ((_barItemHidden(v7) & 1) != 0)
    {
      objc_msgSend(v7, "removeFromSuperview");
    }
    else
    {
      objc_msgSend(a2, "CGRectValue");
      objc_msgSend(v7, "setFrame:");
      objc_msgSend(v7, "superview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        objc_msgSend(v7, "setAlpha:", 1.0);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "addSubview:", v7);
      }
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;

  }
}

uint64_t __73___UINavigationBarVisualProviderLegacyIOS_setBackButtonVisible_animated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;

  if (*(_BYTE *)(a1 + 48))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v2);
  if (*(_BYTE *)(a1 + 48))
    v3 = 1.0;
  else
    v3 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "setAlpha:", v3);
}

void __71___UINavigationBarVisualProviderLegacyIOS__effectiveBackIndicatorImage__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("UINavigationBarBackIndicatorDefault"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageFlippedForRightToLeftLayoutDirection");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_29_0;
  _MergedGlobals_29_0 = v0;

}

void __85___UINavigationBarVisualProviderLegacyIOS__effectiveBackIndicatorTransitionMaskImage__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("UINavigationBarTitleTransitionBackIndicatorMask"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageFlippedForRightToLeftLayoutDirection");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7A218;
  qword_1ECD7A218 = v0;

}

void __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "objectAtIndex:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGPointValue");
  objc_msgSend(v5, "setCenter:");

}

uint64_t __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  char v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  __int128 v19;
  void *v20;
  CGAffineTransform v22;
  CGAffineTransform v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v3 = 0.0;
  if (!*(_BYTE *)(a1 + 104))
    v3 = 1.0;
  objc_msgSend(v2, "setAlpha:", v3);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "setAlpha:", 0.0);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v6);
  }

  v9 = objc_msgSend(*(id *)(a1 + 48), "shouldCrossfade");
  v10 = MEMORY[0x1E0C809B0];
  if ((v9 & 1) == 0)
  {
    v11 = *(void **)(a1 + 40);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_3;
    v30[3] = &unk_1E16B24A0;
    v31 = *(id *)(a1 + 56);
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v30);

  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = *(id *)(a1 + 64);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "setAlpha:", 1.0);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v14);
  }

  if ((objc_msgSend(*(id *)(a1 + 48), "shouldCrossfade") & 1) == 0)
  {
    v24[0] = v10;
    v24[1] = 3221225472;
    v24[2] = __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_4;
    v24[3] = &unk_1E16B24A0;
    v17 = *(void **)(a1 + 64);
    v25 = *(id *)(a1 + 72);
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v24);

  }
  if (*(_BYTE *)(a1 + 105))
  {
    v18 = *(void **)(a1 + 80);
    v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v23.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v23.c = v19;
    *(_OWORD *)&v23.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v18, "setTransform:", &v23);
    memset(&v23, 0, sizeof(v23));
    CGAffineTransformMakeScale(&v23, *(CGFloat *)(a1 + 96), 1.0);
    v20 = *(void **)(a1 + 88);
    v22 = v23;
    objc_msgSend(v20, "setTransform:", &v22);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateBackground");
}

void __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "objectAtIndex:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGPointValue");
  objc_msgSend(v5, "setCenter:");

}

void __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "objectAtIndex:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGPointValue");
  objc_msgSend(v5, "setCenter:");

}

uint64_t __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_completeNavigationTransitionWithIncomingViews:outgoingViews:transitionAssistant:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
  return objc_msgSend(*(id *)(a1 + 64), "_setAbbreviatedTitleIndex:", 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "objectAtIndex:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGPointValue");
  objc_msgSend(v5, "setCenter:");

}

uint64_t __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  char v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  __int128 v19;
  void *v20;
  CGAffineTransform v22;
  _OWORD v23[3];
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v3 = 0.0;
  if (!*(_BYTE *)(a1 + 104))
    v3 = 1.0;
  objc_msgSend(v2, "setAlpha:", v3);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "setAlpha:", 0.0);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v6);
  }

  v9 = objc_msgSend(*(id *)(a1 + 48), "shouldCrossfade");
  v10 = MEMORY[0x1E0C809B0];
  if ((v9 & 1) == 0)
  {
    v11 = *(void **)(a1 + 40);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_3;
    v30[3] = &unk_1E16B24A0;
    v31 = *(id *)(a1 + 56);
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v30);

  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = *(id *)(a1 + 64);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "setAlpha:", 1.0);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v14);
  }

  if ((objc_msgSend(*(id *)(a1 + 48), "shouldCrossfade") & 1) == 0)
  {
    v24[0] = v10;
    v24[1] = 3221225472;
    v24[2] = __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_4;
    v24[3] = &unk_1E16B24A0;
    v17 = *(void **)(a1 + 64);
    v25 = *(id *)(a1 + 72);
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v24);

  }
  if (*(_BYTE *)(a1 + 105))
  {
    v18 = *(void **)(a1 + 80);
    v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v23[0] = *MEMORY[0x1E0C9BAA8];
    v23[1] = v19;
    v23[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v18, "setTransform:", v23);
    v20 = *(void **)(a1 + 88);
    CGAffineTransformMakeScale(&v22, 1.0 / *(double *)(a1 + 96), 1.0);
    objc_msgSend(v20, "setTransform:", &v22);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateBackground");
}

void __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "objectAtIndex:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGPointValue");
  objc_msgSend(v5, "setCenter:");

}

void __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "objectAtIndex:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGPointValue");
  objc_msgSend(v5, "setCenter:");

}

uint64_t __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setFadingInFromCustomAlpha:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_completeNavigationTransitionWithIncomingViews:outgoingViews:transitionAssistant:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80));
  return objc_msgSend(*(id *)(a1 + 72), "_setAbbreviatedTitleIndex:", 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __135___UINavigationBarVisualProviderLegacyIOS__completeNavigationTransitionWithIncomingViews_outgoingViews_transitionAssistant_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "topItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "topItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pendingTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setTitle:animated:matchBarButtonItemAnimationDuration:", v3, 1, 1);

}

void __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  CGRect v20;
  CGRect v21;

  v19 = a2;
  if (*(_BYTE *)(a1 + 56) && *(_QWORD *)(a1 + 32))
    ++a3;
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CGRectValue");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v20.origin.x = v9;
  v20.origin.y = v11;
  v20.size.width = v13;
  v20.size.height = v15;
  if (CGRectIsEmpty(v20))
  {
    objc_msgSend(v19, "frame");
    if (!CGRectIsEmpty(v21))
    {
      v16 = *(void **)(a1 + 40);
      v17 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend(v19, "frame");
      objc_msgSend(v17, "valueWithCGRect:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "replaceObjectAtIndex:withObject:", a3, v18);

    }
  }
  if (a3 == *(_QWORD *)(a1 + 48) - 1)
    *a4 = 1;

}

void __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  CGRect v20;
  CGRect v21;

  v19 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CGRectValue");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v20.origin.x = v9;
  v20.origin.y = v11;
  v20.size.width = v13;
  v20.size.height = v15;
  if (CGRectIsEmpty(v20))
  {
    objc_msgSend(v19, "frame");
    if (!CGRectIsEmpty(v21))
    {
      v16 = *(void **)(a1 + 32);
      v17 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend(v19, "frame");
      objc_msgSend(v17, "valueWithCGRect:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "replaceObjectAtIndex:withObject:", a3, v18);

    }
  }
  if (*(_QWORD *)(a1 + 40) - 1 == a3)
    *a4 = 1;

}

void __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_3(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  if (*(_BYTE *)(a1 + 40))
    v3 = 1.0;
  else
    v3 = 0.0;
  v4 = a2;
  objc_msgSend(v4, "setAlpha:", v3);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_4(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  if (*(_BYTE *)(a1 + 40))
    v3 = 1.0;
  else
    v3 = 0.0;
  v4 = a2;
  objc_msgSend(v4, "setAlpha:", v3);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_titleView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

void __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_6(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v6++), "setAlpha:", 0.0);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v4);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *(id *)(a1 + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setAlpha:", 1.0, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v9);
  }

}

void __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_7(_QWORD *a1)
{
  id *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v1 = (id *)a1[4];
  v2 = a1[5];
  v3 = a1[6];
  v4 = a1[7];
  v5 = a1[8];
  v6 = a1[9];
  objc_msgSend(v1[2], "transitionAssistant");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_completeTopItemTransitionWithIncomingViews:outgoingViews:previousLeftViews:previousRightViews:enableUserInteraction:transitionAssistant:", v2, v3, v4, v5, v6, v7);

}

uint64_t __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72___UINavigationBarVisualProviderLegacyIOS__shim_setPromptText_animated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  int v14;
  double MaxY;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  CGRect v23;
  CGRect v24;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "frame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidateIntrinsicContentSize");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "intrinsicContentSize");
  v11 = v10;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "window");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_delegateWantsNavigationBarHidden");

    if (v14)
    {
      v23.origin.x = v3;
      v23.origin.y = v5;
      v23.size.width = v7;
      v23.size.height = v9;
      MaxY = CGRectGetMaxY(v23);
      v24.origin.x = v3;
      v24.origin.y = v5;
      v24.size.width = v7;
      v24.size.height = v11;
      v5 = v5 + MaxY - CGRectGetMaxY(v24);
    }
  }
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD **)(v16 + 8);
  if ((~v17[13] & 0x420000000000000) == 0)
  {
    objc_msgSend(v17, "layoutIfNeeded");
    v16 = *(_QWORD *)(a1 + 32);
  }
  if (v9 != v11)
  {
    v18 = *(_QWORD **)(v16 + 8);
    if ((~v18[13] & 0x420000000000000) != 0)
    {
      objc_msgSend(v18, "setFrame:", v3, v5, v7, v11);
      v18 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
    }
    objc_msgSend(v18, "_sendResizeForPromptChange");
    v16 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v16 + 8), "window");
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19 || (v20 = (void *)v19, (*(_QWORD *)(v19 + 104) & 0x400000000000000) == 0))
    v20 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v22 = (id)v19;
  v21 = v20;
  objc_msgSend(v21, "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setAlpha:", 1.0);

}

uint64_t __72___UINavigationBarVisualProviderLegacyIOS__shim_setPromptText_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

@end
