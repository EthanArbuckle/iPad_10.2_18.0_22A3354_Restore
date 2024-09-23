@implementation UITabBarVisualProviderLegacyTVOS

void __102___UITabBarVisualProviderLegacyTVOS_changeItemsTo_removingItems_selectedItem_oldSelectedItem_animate___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  double v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(v2);
        -[UITabBarItem _tabBarButton](*(id **)(*((_QWORD *)&v20 + 1) + 8 * i));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setAlpha:", 0.0);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v4);
  }

  objc_msgSend(a1[5], "_layoutTabBarItems");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = a1[6];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * j);
        if (objc_msgSend(v13, "isEnabled", (_QWORD)v16))
          v14 = 1.0;
        else
          v14 = 0.25;
        -[UITabBarItem _tabBarButton]((id *)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setAlpha:", v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v10);
  }

}

void __102___UITabBarVisualProviderLegacyTVOS_changeItemsTo_removingItems_selectedItem_oldSelectedItem_animate___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        -[UITabBarItem _tabBarButton](*(id **)(*((_QWORD *)&v7 + 1) + 8 * v5));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeFromSuperview", (_QWORD)v7);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __55___UITabBarVisualProviderLegacyTVOS__layoutTabBarItems__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  float v15;
  double v16;
  uint64_t v17;
  float v18;
  double v19;
  float v20;
  double v21;
  double v22;
  double v23;
  double v24;
  float v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id *v36;

  v3 = a2;
  v36 = v3;
  if (*(_BYTE *)(a1 + 96))
  {
    -[UITabBarItem _tabBarButton](v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBarItem _tabBarButton](v36);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    objc_msgSend(v4, "sizeThatFits:", v6, v7);
    v9 = v8;

    v3 = v36;
    v10 = v9 * *(double *)(a1 + 56);
    if (v10 > 0.0)
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v10 + *(double *)(a1 + 64);
  }
  -[UITabBarItem _tabBarButton](v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 96))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(float *)(v12 + 24);
    v14 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v15 = v14 + v13;
    *(float *)(v12 + 24) = v15;
    v16 = *(double *)(a1 + 72);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = *(double *)(a1 + 80) + *(float *)(v17 + 24);
    *(float *)(v17 + 24) = v18;
  }
  else
  {
    v19 = (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v14 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v16 = *(double *)(a1 + 72);
    v13 = *(double *)(a1 + 88) + v14 * v19 + *(double *)(a1 + 80) * v19;
  }
  v20 = round(v13) - v13;
  v21 = v20;
  v22 = v13 + v21;
  v23 = v14 - v21;
  v24 = 0.0;
  v25 = round(v22 + v23) - (v22 + v23);
  v26 = v23 + v25;
  if (*(_BYTE *)(a1 + 97))
  {
    v27 = v16;
    v28 = v26;
  }
  else
  {
    if (*(_BYTE *)(a1 + 98))
      v29 = 0.0;
    else
      v29 = 2.0;
    if (v26 < v29 + v29 || v16 < 5.0)
    {
      v22 = v22 + v29;
      v28 = *MEMORY[0x1E0C9D820];
      v27 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v24 = 3.0;
    }
    else
    {
      v31 = 0;
      v32 = v23 + v25;
      v33 = v16;
      *(CGRect *)&v22 = CGRectInset(*(CGRect *)&v22, v29, 0.0);
      v24 = v34 + 1.0;
      v27 = v35 + -1.0;
    }
  }
  objc_msgSend(v11, "setFrame:", v22, v24, v28, v27);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "_setTabBarHitRect:", 0.0, 0.0, v26, v16);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

}

uint64_t __70___UITabBarVisualProviderLegacyTVOS__setFocusedItemHightlightVisible___block_invoke(uint64_t a1)
{
  UIImageView *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  UIInterpolatingMotionEffect *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v2 = [UIImageView alloc];
  _UIImageWithName(CFSTR("UITabBarFocusedItemHighlight"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIImageView initWithImage:](v2, "initWithImage:", v3);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setAlpha:", 0.0);
  v7 = -[UIInterpolatingMotionEffect initWithKeyPath:type:]([UIInterpolatingMotionEffect alloc], "initWithKeyPath:type:", CFSTR("center.x"), 0);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 64);
  *(_QWORD *)(v8 + 64) = v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addMotionEffect:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  objc_msgSend(*(id *)(a1 + 32), "_parentViewForItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertSubview:atIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), 0);

  return objc_msgSend(*(id *)(a1 + 32), "_updateFocusedItemHighlightFrame");
}

uint64_t __86___UITabBarVisualProviderLegacyTVOS_didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setFocusedItemHightlightVisible:", 1);
}

uint64_t __86___UITabBarVisualProviderLegacyTVOS_didUpdateFocusInContext_withAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateFocusedItemHighlightFrame");
  return objc_msgSend(*(id *)(a1 + 32), "_updateHighlightMotionEffect");
}

uint64_t __86___UITabBarVisualProviderLegacyTVOS_didUpdateFocusInContext_withAnimationCoordinator___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setFocusedItemHightlightVisible:", 0);
}

uint64_t __73___UITabBarVisualProviderLegacyTVOS__shim_updateFocusHighlightVisibility__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setFocusedItemHightlightVisible:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __73___UITabBarVisualProviderLegacyTVOS__shim_updateFocusHighlightVisibility__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setFocusedItemHightlightVisible:", *(unsigned __int8 *)(a1 + 40));
}

@end
