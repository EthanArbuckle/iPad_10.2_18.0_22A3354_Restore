@implementation TVStackingPosterView

void __58___TVStackingPosterView_setComponents_mainImageComponent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  if (a3)
  {
    objc_msgSend(v12, "highlightedTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)objc_msgSend(v6, "mutableCopy");
      v9 = *MEMORY[0x24BDF6600];
      objc_msgSend(v12, "highlightedTextColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAttribute:value:range:", v9, v10, 0, objc_msgSend(v8, "length"));

      v11 = objc_msgSend(v8, "copy");
      v6 = (void *)v11;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

void __54___TVStackingPosterView_setNeedsUpdateComponentLayout__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  if (a3)
  {
    objc_msgSend(v12, "highlightedTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)objc_msgSend(v6, "mutableCopy");
      v9 = *MEMORY[0x24BDF6600];
      objc_msgSend(v12, "highlightedTextColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAttribute:value:range:", v9, v10, 0, objc_msgSend(v8, "length"));

      v11 = objc_msgSend(v8, "copy");
      v6 = (void *)v11;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

void __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "filteredComponents", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if (v7 != *(void **)(*(_QWORD *)(a1 + 32) + 536))
          objc_msgSend(v7, "setHighlighted:animated:withAnimationCoordinator:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

uint64_t __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke_2(uint64_t result)
{
  void *v1;
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  CGFloat v21;
  __int128 v22;
  double v23;
  double v24;
  void *v25;
  int v26;
  double v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  int v33;
  double v34;
  uint64_t v35;
  double v36;
  int v37;
  _BYTE *v38;
  uint64_t v39;
  void *v40;
  double v41;
  double v42;
  _QWORD v43[5];
  char v44;
  CGAffineTransform v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;

  v1 = *(void **)(result + 32);
  if (!v1)
    return result;
  v2 = result;
  objc_msgSend(*(id *)(result + 32), "size");
  objc_msgSend(v1, "selectionMarginsForSize:");
  v4 = v3;
  v41 = v6;
  v42 = v5;
  v8 = v7;
  objc_msgSend(*(id *)(v2 + 40), "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasBeenCommitted");

  objc_msgSend(*(id *)(v2 + 40), "bounds");
  v12 = v11;
  v14 = v13;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v46 = 0u;
  v15 = *(void **)(v2 + 40);
  if (v15)
  {
    objc_msgSend(v15, "cellMetrics");
    v17 = *((double *)&v47 + 1);
    v16 = *(double *)&v47;
    v18 = *((double *)&v48 + 1);
    v19 = *(double *)&v48;
    v15 = *(void **)(v2 + 40);
  }
  else
  {
    v19 = 0.0;
    v16 = 0.0;
    v18 = 0.0;
    v17 = 0.0;
  }
  objc_msgSend(v15, "overlayView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(v2 + 48))
  {
    v21 = fmin((v41 + v42 + v12 - (v17 + v18)) / (v12 - (v17 + v18)), (v8 + v4 + v14 - (v16 + v19)) / (v14 - (v16 + v19)));
    CGAffineTransformMakeScale(&v45, v21, v21);
  }
  else
  {
    v22 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v45.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v45.c = v22;
    *(_OWORD *)&v45.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  }
  objc_msgSend(v20, "setTransform:", &v45);

  if (*(_BYTE *)(v2 + 48))
    v23 = v4;
  else
    v23 = -0.0;
  objc_msgSend(*(id *)(*(_QWORD *)(v2 + 40) + 424), "setConstant:", *(double *)(*(_QWORD *)(v2 + 40) + 456) + v23);
  if (*(_BYTE *)(v2 + 48))
    v24 = v8;
  else
    v24 = -0.0;
  objc_msgSend(*(id *)(*(_QWORD *)(v2 + 40) + 432), "setConstant:", *(double *)(*(_QWORD *)(v2 + 40) + 464) + v24);
  objc_msgSend(*(id *)(v2 + 32), "valueForTVViewStyle:", CFSTR("tv-focus-align"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("bottom"));

  if (v26)
  {
    if (*(_BYTE *)(v2 + 48))
      v27 = v8;
    else
      v27 = 0.0;
    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 40) + 440), "setConstant:", *(double *)(*(_QWORD *)(v2 + 40) + 472) - v27);
    v28 = *(_QWORD *)(v2 + 40);
    v29 = *(void **)(v28 + 448);
    if (*(_BYTE *)(v2 + 48))
      v30 = v8;
    else
      v30 = 0.0;
    v31 = *(double *)(v28 + 480) - v30;
LABEL_30:
    objc_msgSend(v29, "setConstant:", v31);
    goto LABEL_31;
  }
  objc_msgSend(*(id *)(v2 + 32), "valueForTVViewStyle:", CFSTR("tv-focus-align"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("top"));

  if (v33)
  {
    if (*(_BYTE *)(v2 + 48))
      v34 = v8;
    else
      v34 = -0.0;
    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 40) + 440), "setConstant:", *(double *)(*(_QWORD *)(v2 + 40) + 472) + v34);
    v35 = *(_QWORD *)(v2 + 40);
    v29 = *(void **)(v35 + 448);
    if (*(_BYTE *)(v2 + 48))
      v36 = v8;
    else
      v36 = -0.0;
    v31 = *(double *)(v35 + 480) + v36;
    goto LABEL_30;
  }
LABEL_31:
  if (*(_BYTE *)(v2 + 49))
    v37 = v10;
  else
    v37 = 0;
  v38 = *(_BYTE **)(v2 + 40);
  if (v37 == 1)
  {
    objc_msgSend(v38, "layoutIfNeeded");
  }
  else if (v38[416])
  {
    objc_msgSend(v38, "_configureSubviews");
    *(_BYTE *)(*(_QWORD *)(v2 + 40) + 416) = 0;
  }
  v39 = *(_QWORD *)(v2 + 40);
  v40 = *(void **)(v39 + 496);
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke_3;
  v43[3] = &unk_24EB868D0;
  v43[4] = v39;
  v44 = *(_BYTE *)(v2 + 48);
  return objc_msgSend(v40, "enumerateObjectsUsingBlock:", v43);
}

void __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  double *v5;
  double v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  id v11;

  v5 = *(double **)(a1 + 32);
  v6 = v5[61];
  v7 = a2;
  objc_msgSend(v5, "visibleLabelWidths");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = 0.0;
  if (*(_BYTE *)(a1 + 40))
    v10 = v6;
  objc_msgSend(v7, "setConstant:", v9 + v10);

}

void __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  double v11;
  double v12;
  int v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "filteredComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "layer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "hasBeenCommitted");

        if (v7 != *(void **)(*(_QWORD *)(a1 + 32) + 536))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v7, "valueForTVViewStyle:", CFSTR("tv-text-highlight-style"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v7, "tv_showOnHighlight"))
            {
              if (*(_BYTE *)(a1 + 48))
              {
                v11 = 1.0;
                goto LABEL_23;
              }
              if (*(_BYTE *)(a1 + 49))
                v13 = v9;
              else
                v13 = 0;
              if (v13 == 1)
              {
                v16[0] = MEMORY[0x24BDAC760];
                v16[1] = 3221225472;
                v16[2] = __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke_5;
                v16[3] = &unk_24EB85440;
                v16[4] = v7;
                objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 2084, v16, 0, 0.2, 0.0);
              }
              else
              {
                v11 = 0.0;
LABEL_23:
                objc_msgSend(v7, "setAlpha:", v11);
              }
            }
            else
            {
              objc_msgSend(*(id *)(a1 + 32), "_updateShadowForLabel:inFocus:", v7, *(unsigned __int8 *)(a1 + 48));
              objc_msgSend(v7, "setHighlighted:", *(unsigned __int8 *)(a1 + 48));
            }
            if (objc_msgSend(v7, "tv_marqueeOnHighlight"))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if (*(_BYTE *)(a1 + 48))
                {
                  v14 = v7;
                  v15 = 1;
                  goto LABEL_31;
                }
                if (objc_msgSend(v10, "isEqualToString:", CFSTR("marquee-and-show-on-highlight")))
                {
                  objc_msgSend(v7, "stopAnimatingWithoutResetWithDuration:", *(double *)(a1 + 40));
                }
                else
                {
                  v15 = *(unsigned __int8 *)(a1 + 48);
                  v14 = v7;
LABEL_31:
                  objc_msgSend(v14, "setAnimating:", v15);
                }
              }
            }

            continue;
          }
          if (objc_msgSend(v7, "tv_showOnHighlight"))
          {
            if (*(_BYTE *)(a1 + 48))
              v12 = 1.0;
            else
              v12 = 0.0;
            objc_msgSend(v7, "setAlpha:", v12);
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

}

uint64_t __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke_6(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDF6F90];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke_7;
  v3[3] = &unk_24EB86920;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "tv_performByPreventingAdditiveAnimations:", v3);

}

uint64_t __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke_7(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __63___TVStackingPosterView__updateSubviewHeirarchyWithComponents___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    objc_msgSend(*(id *)(a1 + 40), "sendSubviewToBack:", v3);
  }
  else
  {
    objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*(id *)(a1 + 40), "insertSubview:atIndex:", v3, 0);
  }

}

uint64_t __43___TVStackingPosterView__configureSubviews__block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a2, "constant");
  return objc_msgSend(v2, "numberWithDouble:");
}

id __52___TVStackingPosterView__updateComponentConstraints__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = *(id *)(a1 + 32);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v10)
    goto LABEL_15;
  v11 = v10;
  v12 = *(_QWORD *)v22;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v22 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v13);
      objc_msgSend(v14, "firstItem", (_QWORD)v21);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (v15 != v7)
        goto LABEL_9;
      objc_msgSend(v14, "secondItem");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (v16 != v8)
      {

        v15 = v7;
LABEL_9:

        goto LABEL_10;
      }
      v17 = objc_msgSend(v14, "firstAttribute");

      if (v17 == a4)
      {
        v19 = v14;
        goto LABEL_16;
      }
LABEL_10:
      ++v13;
    }
    while (v11 != v13);
    v18 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    v11 = v18;
  }
  while (v18);
LABEL_15:
  v19 = 0;
LABEL_16:

  return v19;
}

void __48___TVStackingPosterView__cellMetricsForMaxSize___block_invoke(uint64_t a1, void *a2, uint64_t a3, char *a4)
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  char v27;
  id v28;

  v28 = a2;
  objc_msgSend(v28, "tv_margin");
  v8 = v7;
  objc_msgSend(v28, "tv_alignmentInsetsForExpectedWidth:", *(double *)(a1 + 72) - (v9 + v10));
  v12 = v11;
  if (!a3)
  {
    objc_msgSend(v28, "tv_margin");
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v15 = v12 + v13 + *(double *)(v14 + 32);
    *(double *)(v14 + 32) = v15;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = v15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && *(_QWORD *)(a1 + 32)
    && objc_msgSend(v28, "tv_showOnHighlight"))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3 + 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "tv_margin");
    v18 = v17;
    objc_msgSend(v16, "tv_alignmentInsetsForExpectedWidth:", *(double *)(a1 + 72) - (v19 + v20));
    v22 = v21;
    v23 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 32)
                                                                + v22
                                                                + fmax(v8, v18)
                                                                + v26
                                                                - v12;

    v27 = 0;
  }
  else
  {
    v27 = 1;
  }
  *a4 = v27;

}

void __48___TVStackingPosterView__cellMetricsForMaxSize___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, char *a4)
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  char v27;
  id v28;

  v28 = a2;
  objc_msgSend(v28, "tv_margin");
  v8 = v7;
  objc_msgSend(v28, "tv_alignmentInsetsForExpectedWidth:", *(double *)(a1 + 72) - (v9 + v10));
  v12 = v11;
  if (objc_msgSend(*(id *)(a1 + 32), "count") - 1 == a3)
  {
    objc_msgSend(v28, "tv_margin");
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v15 = v12 + v13 + *(double *)(v14 + 48);
    *(double *)(v14 + 48) = v15;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48) = v15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && *(_QWORD *)(a1 + 40)
    && objc_msgSend(v28, "tv_showOnHighlight"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3 - 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "tv_margin");
    v18 = v17;
    objc_msgSend(v16, "tv_alignmentInsetsForExpectedWidth:", *(double *)(a1 + 72) - (v19 + v20));
    v22 = v21;
    v23 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 48)
                                                                + v22
                                                                + fmax(v8, v18)
                                                                + v26
                                                                - v12;

    v27 = 0;
  }
  else
  {
    v27 = 1;
  }
  *a4 = v27;

}

@end
