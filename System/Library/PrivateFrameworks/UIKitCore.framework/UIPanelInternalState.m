@implementation UIPanelInternalState

void __84___UIPanelInternalState_computePossibleStatesGivenParentView_withSize_forceOverlay___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, UISlidingBarState *);
  void *v4;
  void *v5;
  UISlidingBarState *v6;

  v3 = a2;
  v6 = objc_alloc_init(UISlidingBarState);
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  -[UISlidingBarState setConfiguration:](v6, "setConfiguration:", v5);

  -[UISlidingBarState _setCollapsedState:](v6, "_setCollapsedState:", objc_msgSend(*(id *)(a1 + 32), "collapsedState"));
  v3[2](v3, v6);

  if (-[UISlidingBarState leadingOverlapsMain](v6, "leadingOverlapsMain")
    && UIKeyboardAutomaticIsOnScreen())
  {
    objc_msgSend(*(id *)(a1 + 32), "keyboardAdjustment");
    -[UISlidingBarState set_keyboardAdjustment:](v6, "set_keyboardAdjustment:");
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

id __84___UIPanelInternalState_computePossibleStatesGivenParentView_withSize_forceOverlay___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (a2)
  {
    v8 = (void *)objc_opt_new();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v13), "doubleValue", (_QWORD)v19);
          UIRoundToViewScale(*(void **)(a1 + 32));
          if (v14 > 0.0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v15);

          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

    if (a4)
    {
      objc_msgSend(&unk_1E1A93140, "arrayByAddingObjectsFromArray:", v8);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = v8;
    }
    v17 = v16;

  }
  else
  {
    v17 = &unk_1E1A93128;
  }

  return v17;
}

uint64_t __84___UIPanelInternalState_computePossibleStatesGivenParentView_withSize_forceOverlay___block_invoke_198(uint64_t result, double a2, double a3)
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = result;
  if (a2 > 0.0)
  {
    v5 = *(void **)(result + 32);
    objc_msgSend(*(id *)(result + 40), "_currentScreenScale");
    result = objc_msgSend(v5, "leadingBorderWidthForScale:");
  }
  if (a3 > 0.0)
  {
    v6 = *(void **)(v4 + 32);
    objc_msgSend(*(id *)(v4 + 40), "_currentScreenScale");
    return objc_msgSend(v6, "trailingBorderWidthForScale:");
  }
  return result;
}

double __84___UIPanelInternalState_computePossibleStatesGivenParentView_withSize_forceOverlay___block_invoke_2_200(void *a1)
{
  id v1;
  uint64_t v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  double v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  v3 = 0.0;
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "doubleValue", (_QWORD)v9);
        if (v7 > 0.0)
        {
          v3 = v7;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

void __84___UIPanelInternalState_computePossibleStatesGivenParentView_withSize_forceOverlay___block_invoke_204(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setLeadingWidth:", *(double *)(a1 + 32));
  objc_msgSend(v3, "setTrailingWidth:", *(double *)(a1 + 40));
  objc_msgSend(v3, "setSupplementaryWidth:", *(double *)(a1 + 48));
  objc_msgSend(v3, "setMainWidth:", *(double *)(a1 + 56));
  if (!*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(v3, "_setLeadingOverlayWidth:", *(double *)(a1 + 32) - *(double *)(a1 + 64));
    objc_msgSend(v3, "_setTrailingOverlayWidth:", *(double *)(a1 + 40) - *(double *)(a1 + 72));
    objc_msgSend(v3, "_setSupplementaryOverlayWidth:", *(double *)(a1 + 48) - *(double *)(a1 + 80));
  }

}

@end
