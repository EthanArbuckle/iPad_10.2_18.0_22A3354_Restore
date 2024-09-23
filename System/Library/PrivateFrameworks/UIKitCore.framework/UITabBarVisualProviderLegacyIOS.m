@implementation UITabBarVisualProviderLegacyIOS

void __101___UITabBarVisualProviderLegacyIOS_changeItemsTo_removingItems_selectedItem_oldSelectedItem_animate___block_invoke_2(uint64_t a1)
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

void __101___UITabBarVisualProviderLegacyIOS_changeItemsTo_removingItems_selectedItem_oldSelectedItem_animate___block_invoke(id *a1)
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

void __54___UITabBarVisualProviderLegacyIOS__layoutTabBarItems__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id *v33;

  v3 = a2;
  v33 = v3;
  if (*(_BYTE *)(a1 + 112))
  {
    -[UITabBarItem _tabBarButton](v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBarItem _tabBarButton](v33);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    objc_msgSend(v4, "sizeThatFits:", v6, v7);
    v9 = v8;

    v3 = v33;
    if (v9 > 0.0)
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v9 + *(double *)(a1 + 80);
  }
  -[UITabBarItem _tabBarButton](v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setItemAppearanceData:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v10, "setItemVibrantEffect:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 112))
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v12 = *(double *)(v11 + 24);
    v13 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v14 = *(double *)(a1 + 88);
    *(double *)(v11 + 24) = v12 + v13;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(double *)(a1 + 96)
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 24);
  }
  else
  {
    v15 = (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v13 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v14 = *(double *)(a1 + 88);
    v12 = *(double *)(a1 + 104) + v13 * v15 + *(double *)(a1 + 96) * v15;
  }
  v16 = round(v12) - v12;
  v17 = v16;
  v18 = v12 + v17;
  v19 = v13 - v17;
  v20 = 0.0;
  *(float *)&v17 = round(v18 + v19) - (v18 + v19);
  v21 = *(float *)&v17;
  v22 = v19 + v21;
  if (*(_BYTE *)(a1 + 113))
  {
    v23 = v14;
    v24 = v19 + v21;
    v25 = v18;
  }
  else
  {
    if (*(_BYTE *)(a1 + 114))
      v26 = 0.0;
    else
      v26 = 2.0;
    if (v22 < v26 + v26 || v14 < 5.0)
    {
      v25 = v18 + v26;
      v24 = *MEMORY[0x1E0C9D820];
      v23 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v20 = 3.0;
    }
    else
    {
      v28 = v18;
      v29 = v22;
      v30 = v14;
      *(CGRect *)&v25 = CGRectInset(*(CGRect *)(&v20 - 1), v26, 0.0);
      v20 = v31 + 1.0;
      v23 = v32 + -1.0;
    }
  }
  objc_msgSend(v10, "setFrame:", v25, v20, v24, v23);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "convertRect:toView:", v10, v18, 0.0, v22, v14);
    objc_msgSend(v10, "_setTabBarHitRect:");
  }
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);

}

BOOL __43___UITabBarVisualProviderLegacyIOS_prepare__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (!+[_UIBarBackgroundLayoutPrototyping prototypingEnabled](_UIBarBackgroundLayoutPrototyping, "prototypingEnabled"))
    {
      v2 = (void *)WeakRetained[4];
      WeakRetained[4] = 0;

    }
    objc_msgSend(WeakRetained, "_updateBackgroundAnimated:", 0);
  }

  return WeakRetained != 0;
}

void __80___UITabBarVisualProviderLegacyIOS_traitCollectionForChild_baseTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v3, "setUserInterfaceStyle:");
    v3 = v4;
  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v4, "setPreferredContentSizeCategory:");
    v3 = v4;
  }

}

@end
