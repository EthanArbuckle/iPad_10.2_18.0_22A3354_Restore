@implementation UIBarCustomizer

void __37___UIBarCustomizer_beginWithSession___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isActive"))
  {
    objc_msgSend(WeakRetained, "_reflow");
    objc_msgSend(WeakRetained, "reservoir");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "invalidateLayoutAndForceUpdate:", 1);

  }
}

void __37___UIBarCustomizer_beginWithSession___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setWasReset:", 1);
  objc_msgSend(WeakRetained, "_setActive:", 0);
  objc_msgSend(WeakRetained, "setWasReset:", 0);

}

void __37___UIBarCustomizer_beginWithSession___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setActive:", 0);

}

void __37___UIBarCustomizer_beginWithSession___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_reflow");
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

void __31___UIBarCustomizer__setActive___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a2, "_mutableVisibleItems", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "_chiclet");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "anchorView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeFromSuperview");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(WeakRetained, "isActive") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "containerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromSuperview");

  }
}

uint64_t __31___UIBarCustomizer__setActive___block_invoke_2(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "dimmingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "_mutableVisibleItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (!*(_BYTE *)(a1 + 56))
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "_chiclet");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "updateItemCenterPoints");

        }
        objc_msgSend(v9, "_chiclet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "anchorView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = *(unsigned __int8 *)(a1 + 56);
        objc_msgSend(v12, "chiclet");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setPlatterVisible:", v13);

        objc_msgSend(v12, "setNeedsLayout");
        objc_msgSend(v12, "layoutIfNeeded");
        objc_msgSend(v12, "setJiggling:", *(unsigned __int8 *)(a1 + 56));

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v6);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "ellipsisDotViews", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "setAlpha:", 0.0);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v17);
  }

  objc_msgSend(*(id *)(a1 + 32), "_reflow");
  return objc_msgSend(*(id *)(a1 + 48), "performAllAnimations");
}

uint64_t __31___UIBarCustomizer__setActive___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performAllCompletionsWithSession:", *(_QWORD *)(a1 + 40));
}

void __27___UIBarCustomizer__reflow__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double MidX;
  CGFloat v6;
  id v7;
  CGRect v8;
  CGRect v9;

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "_activeSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "barCustomizer:customizationAreaBoundsForSession:", v3, v4);
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");

  objc_msgSend(*(id *)(a1 + 32), "frame");
  MidX = CGRectGetMidX(v8);
  objc_msgSend(*(id *)(a1 + 32), "frame");
  v6 = CGRectGetMaxY(v9) + -15.0;
  objc_msgSend(*(id *)(a1 + 40), "reservoir");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCenter:", MidX, v6);

}

void __27___UIBarCustomizer__reflow__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  double Width;
  id v7;
  CGRect v8;

  objc_msgSend(a2, "_chiclet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anchorView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!*(_BYTE *)(a1 + 56) && objc_msgSend(*(id *)(a1 + 32), "_dropIndex") == a3)
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24)
                                                                + 40.0;
  objc_msgSend(v7, "setContentPadding:", 16.0);
  objc_msgSend(v7, "bounds");
  Width = CGRectGetWidth(v8);
  objc_msgSend(v7, "setCenter:", Width * 0.5 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(double *)(a1 + 48));
  if (*(_BYTE *)(a1 + 56) && objc_msgSend(*(id *)(a1 + 32), "_dropIndex") == a3)
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24)
                                                                + 40.0;
  if (objc_msgSend(v7, "state") != 1)
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = Width
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);

}

void __27___UIBarCustomizer__reflow__block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "chiclet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMinimized:", 0);

  objc_msgSend(*(id *)(a1 + 32), "chiclet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

uint64_t __27___UIBarCustomizer__reflow__block_invoke_4(uint64_t a1)
{
  double v2;
  double v3;

  objc_msgSend(*(id *)(a1 + 32), "center");
  v3 = v2 + *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "center");
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", v3);
}

void __27___UIBarCustomizer__reflow__block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "chiclet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMinimized:", 1);

  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "chiclet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

uint64_t __27___UIBarCustomizer__reflow__block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "_setCornerRadius:", *(double *)(a1 + 40) * 0.5);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __56___UIBarCustomizer__reflowAnimatedWithAlongsideActions___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_reflow");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __53___UIBarCustomizer_dragInteraction_sessionWillBegin___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_chiclet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "representedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCollapsed:", 0);

  objc_msgSend(*(id *)(a1 + 32), "_chiclet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeToFit");

  objc_msgSend(*(id *)(a1 + 32), "_chiclet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

}

uint64_t __53___UIBarCustomizer_dropInteraction_sessionDidUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDebugUI");
}

uint64_t __66___UIBarCustomizer__animateDropOrCancelForItem_animator_isCancel___block_invoke(uint64_t a1)
{
  uint64_t result;
  double v3;

  result = objc_msgSend(*(id *)(a1 + 32), "jiggling");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "presentationValue");
    if (v3 < 10.0)
      return objc_msgSend(*(id *)(a1 + 32), "setJiggling:", 1);
  }
  return result;
}

uint64_t __66___UIBarCustomizer__animateDropOrCancelForItem_animator_isCancel___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCollapsed:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "setChicletSize:", *(_BYTE *)(a1 + 48) == 0);
  objc_msgSend(*(id *)(a1 + 40), "setLabelVisible:", *(_BYTE *)(a1 + 48) == 0);
  objc_msgSend(*(id *)(a1 + 40), "sizeToFit");
  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

void __66___UIBarCustomizer__animateDropOrCancelForItem_animator_isCancel___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_reflow");
  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(WeakRetained, "reservoir");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sizeToFit");

    objc_msgSend(WeakRetained, "reservoir");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layoutIfNeeded");

    objc_msgSend(*(id *)(a1 + 32), "setValue:", 0.0);
  }

}

void __34___UIBarCustomizer__updateDebugUI__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  +[UIColor blueColor](UIColor, "blueColor");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v2, "CGColor");
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderColor:", v3);

  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBorderWidth:", 2.0);

  +[UIColor systemGreenColor](UIColor, "systemGreenColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "CGColor");
  objc_msgSend(*(id *)(a1 + 32), "visibleItemScrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBorderColor:", v9);

  objc_msgSend(*(id *)(a1 + 32), "visibleItemScrollView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBorderWidth:", 3.0);

}

void __34___UIBarCustomizer__updateDebugUI__block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double MinX;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  id v21;
  CGRect v22;
  CGRect v23;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_dropIndex");
  if (v2 < objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "_dropIndex"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_chiclet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anchorView");
    v21 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "layoutDirection");

    objc_msgSend(v21, "frame");
    if (v7)
      goto LABEL_3;
LABEL_8:
    MinX = CGRectGetMinX(*(CGRect *)&v8);
    v15 = *(double *)(a1 + 48);
    v16 = -0.5;
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 40), "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_chiclet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "anchorView");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "state") == 1)
  {
    objc_msgSend(v21, "frame");
    MinX = CGRectGetMinX(v22);
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "layoutDirection");

  objc_msgSend(v21, "frame");
  if (v19)
    goto LABEL_8;
LABEL_3:
  MinX = CGRectGetMaxX(*(CGRect *)&v8);
LABEL_6:
  v15 = *(double *)(a1 + 48);
  v16 = 0.5;
LABEL_9:
  v20 = MinX + v15 * v16;
  objc_msgSend(v21, "frame");
  objc_msgSend((id)qword_1ECD7DBE8, "setCenter:", v20, CGRectGetMidY(v23));

}

@end
