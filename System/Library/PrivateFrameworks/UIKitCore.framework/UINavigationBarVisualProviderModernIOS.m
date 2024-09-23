@implementation UINavigationBarVisualProviderModernIOS

uint64_t __94___UINavigationBarVisualProviderModernIOS_navigationItemUpdatedCenterBarButtonItems_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "end");
}

void __67___UINavigationBarVisualProviderModernIOS_setAppearanceAPIVersion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  v3 = a2;
  v4 = *(_BYTE **)(a1 + 32);
  v15 = v3;
  if (v4[232])
  {
    objc_msgSend(v4, "_ensureLayoutsConfiguredForEntry:", v3);
    v3 = v15;
  }
  objc_msgSend(v3, "normalLayout");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (id *)v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    *(_QWORD *)(v5 + 304) = *(_QWORD *)(v7 + 144);
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 232))
      goto LABEL_7;
    v8 = *(void **)(v5 + 176);
    goto LABEL_6;
  }
  if (*(_BYTE *)(v7 + 232))
  {
    v8 = 0;
LABEL_6:
    v9 = v8;
    objc_msgSend(v9, "setLayout:", 0);

  }
LABEL_7:
  -[_UINavigationBarLayout setStandardBackgroundViewLayout:](v6, 0);
  -[_UINavigationBarLayout setCompactBackgroundViewLayout:]((uint64_t)v6, 0);
  objc_msgSend(v15, "searchLayout");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (id *)v10;
  v12 = *(_QWORD *)(a1 + 32);
  if (!v10)
  {
    if (!*(_BYTE *)(v12 + 232))
      goto LABEL_11;
    v13 = 0;
    goto LABEL_10;
  }
  *(_QWORD *)(v10 + 304) = *(_QWORD *)(v12 + 144);
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 232))
  {
    v13 = *(void **)(v10 + 176);
LABEL_10:
    v14 = v13;
    objc_msgSend(v14, "setLayout:", 0);

  }
LABEL_11:
  -[_UINavigationBarLayout setStandardBackgroundViewLayout:](v11, 0);
  -[_UINavigationBarLayout setCompactBackgroundViewLayout:]((uint64_t)v11, 0);

}

void __72___UINavigationBarVisualProviderModernIOS_setForceScrollEdgeAppearance___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  int v4;
  _BYTE *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "item");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "useManualScrollEdgeAppearanceForItem:");
  objc_msgSend(v3, "normalLayout");
  v5 = (_BYTE *)objc_claimAutoreleasedReturnValue();

  if (v5 && v5[111] != v4)
  {
    v5[111] = v4;
    objc_msgSend(v5, "_updateLayoutOutputs");
  }

}

BOOL __50___UINavigationBarVisualProviderModernIOS_prepare__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_updateBackground");

  return v2 != 0;
}

uint64_t __69___UINavigationBarVisualProviderModernIOS__updateTitleViewForLayout___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setInlineTitleViewAlpha:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setAlpha:", *(double *)(a1 + 48));
}

void __54___UINavigationBarVisualProviderModernIOS__popToItem___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "addObject:", v6);
  v7 = *(id *)(a1 + 40);

  if (v7 == v6)
    *a3 = 1;
}

void __58___UINavigationBarVisualProviderModernIOS__backButtonMenu__block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, _QWORD);
  id *WeakRetained;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  id v23;
  void (**v24)(id, _QWORD);
  id obj;
  _QWORD v26[6];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v24 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[2], "topEntry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = WeakRetained[2];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __58___UINavigationBarVisualProviderModernIOS__backButtonMenu__block_invoke_2;
    v31[3] = &unk_1E16B65B0;
    v23 = v6;
    v32 = v23;
    v8 = v5;
    v33 = v8;
    objc_msgSend(v7, "reverseIterateEntries:", v31);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v8;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v14, "_backButtonTitleAllowingGenericTitles:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PopToItem<NavigationItem:%p>"), v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __58___UINavigationBarVisualProviderModernIOS__backButtonMenu__block_invoke_3;
          v26[3] = &unk_1E16B65D8;
          v26[4] = WeakRetained;
          v26[5] = v14;
          +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v15, 0, v16, v26);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v17);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
      }
      while (v11);
    }

    objc_msgSend(WeakRetained, "navigationBar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_effectiveDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    v3 = v24;
    if ((v20 & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_effectiveDelegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_navigationBarAdditionalActionsForBackButtonMenu:", v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v22, "count"))
        objc_msgSend(v9, "addObjectsFromArray:", v22);

    }
    ((void (**)(id, void *))v24)[2](v24, v9);

  }
  else
  {
    v3[2](v3, MEMORY[0x1E0C9AA60]);
  }

}

void __58___UINavigationBarVisualProviderModernIOS__backButtonMenu__block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  if (*(void **)(a1 + 32) != a2)
  {
    objc_msgSend(a2, "item");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    if ((objc_msgSend(v7, "hidesBackButton") & 1) != 0
      || (objc_msgSend(v7, "leftItemsSupplementBackButton") & 1) == 0
      && (objc_msgSend(v7, "leftBarButtonItems"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "count"),
          v5,
          v6))
    {
      *a3 = 1;
    }

  }
}

uint64_t __58___UINavigationBarVisualProviderModernIOS__backButtonMenu__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_popToItem:", *(_QWORD *)(a1 + 40));
}

void __74___UINavigationBarVisualProviderModernIOS__staticNavBarButtonFakeBackMenu__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  void (**v11)(id, id);

  v11 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_effectiveDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_effectiveDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_navigationBarAdditionalActionsForBackButtonMenu:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "count"))
        v10 = v9;
      else
        v10 = (id)MEMORY[0x1E0C9AA60];

    }
    else
    {
      v10 = (id)MEMORY[0x1E0C9AA60];
    }
    v11[2](v11, v10);

  }
  else
  {
    v11[2](v11, (id)MEMORY[0x1E0C9AA60]);
  }

}

void __62___UINavigationBarVisualProviderModernIOS__beginCustomization__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_barCustomizationItemWithBarButtonGroup:", a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v5;
  v6 = 48;
  if (a3)
    v6 = 40;
  objc_msgSend(*(id *)(a1 + v6), "addObject:", v5);

}

void __62___UINavigationBarVisualProviderModernIOS__beginCustomization__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setAlpha:", 0.0);
  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("circle"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overflowItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v5);

}

uint64_t __62___UINavigationBarVisualProviderModernIOS__beginCustomization__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setAlpha:", 1.0);
}

void __62___UINavigationBarVisualProviderModernIOS__beginCustomization__block_invoke_4(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained && WeakRetained[22] == v10)
  {
    WeakRetained[22] = 0;

    objc_msgSend(*(id *)(a1 + 32), "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 0);

    objc_msgSend(v4[23], "removeFromSuperview");
    v6 = v4[23];
    v4[23] = 0;

    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("ellipsis.circle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4[6], "layout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "overflowItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v7);

  }
}

id __79___UINavigationBarVisualProviderModernIOS__sourceViewProviderForBarButtonItem___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    _contentViewFromBarButton(v1);
    v2 = objc_claimAutoreleasedReturnValue();

    v1 = (void *)v2;
  }
  return v1;
}

void __81___UINavigationBarVisualProviderModernIOS_barCustomizer_willEndSession_didReset___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __81___UINavigationBarVisualProviderModernIOS_barCustomizer_willEndSession_didReset___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

id __86___UINavigationBarVisualProviderModernIOS__updateContentForTopItem_backItem_animated___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __86___UINavigationBarVisualProviderModernIOS__updateContentForTopItem_backItem_animated___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __93___UINavigationBarVisualProviderModernIOS__presentOrDismissSearch_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  id *v5;
  void *v6;
  id v7;

  v2 = *(id **)(a1 + 32);
  objc_msgSend(v2[2], "topItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_bottomPalette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_contentMargin");
  objc_msgSend(v2, "_configureMarginsOnContentViewsAndPalette:withContentMargin:", v4);

  v5 = *(id **)(a1 + 32);
  objc_msgSend(v5[2], "topItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "backItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_updateContentForTopItem:backItem:animated:", v7, v6, 0);

}

uint64_t __93___UINavigationBarVisualProviderModernIOS__presentOrDismissSearch_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_sendNavigationBarAnimateTransition");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "animate");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "layoutIfNeeded");
}

void __93___UINavigationBarVisualProviderModernIOS__presentOrDismissSearch_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "complete");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 96);
  *(_QWORD *)(v2 + 96) = 0;

}

uint64_t __93___UINavigationBarVisualProviderModernIOS__presentOrDismissSearch_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __93___UINavigationBarVisualProviderModernIOS__presentOrDismissSearch_withTransitionCoordinator___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  char v5;
  id *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "cancelledTransition");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  if ((v5 & 1) == 0)
  {
    v6 = *(id **)(a1 + 32);
    objc_msgSend(v6[2], "topEntry");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationItemUpdatedLargeTitleDisplayMode:", v7);

  }
}

void __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_2(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  id *v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = *(id **)(a1 + 32);
  objc_msgSend(v2[2], "topItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_topPalette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_contentMargin");
  objc_msgSend(v2, "_configureMarginsOnContentViewsAndPalette:withContentMargin:", v4);

  v5 = *(id **)(a1 + 32);
  objc_msgSend(v5[2], "topItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_bottomPalette");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_contentMargin");
  objc_msgSend(v5, "_configureMarginsOnContentViewsAndPalette:withContentMargin:", v7);

  v8 = *(id **)(a1 + 32);
  objc_msgSend(v8[2], "topItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "backItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_updateContentForTopItem:backItem:", v9, v10);

  if (_UIBarsDesktopNavigationBarEnabled())
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "layout");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutSubviews");

  }
}

uint64_t __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t *v5;
  void *v6;
  void *v7;
  int v8;
  id *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  uint64_t v20;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_sendNavigationBarAnimateTransition");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "previousTopItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_weeTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length") && *(_QWORD *)(a1 + 48) == 1)
  {
    v4 = *(unsigned __int8 *)(a1 + 56);

    if (v4)
    {
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_4;
      v19 = &unk_1E16B1B28;
      v20 = *(_QWORD *)(a1 + 32);
      v5 = &v16;
LABEL_10:
      +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v5, 0, 0.0, 0.0, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20);
      goto LABEL_12;
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "topItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_weeTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length") || *(_QWORD *)(a1 + 48) != 2)
  {

    goto LABEL_12;
  }
  v8 = *(unsigned __int8 *)(a1 + 57);

  if (v8)
  {
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_6;
    v14 = &unk_1E16B1B28;
    v15 = *(_QWORD *)(a1 + 32);
    v5 = &v11;
    goto LABEL_10;
  }
LABEL_12:
  objc_msgSend(*(id *)(a1 + 32), "_updatePromptViewAndActuallyHide:", 0);
  v9 = *(id **)(a1 + 32);
  objc_msgSend(v9[1], "bounds");
  objc_msgSend(v9, "_layoutInBounds:");
  objc_msgSend(*(id *)(a1 + 32), "_updateTitleViewForLayout:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "updateBarVisibilityForTopItem");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "applyBarBackground:alpha:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(double *)(*(_QWORD *)(a1 + 32) + 120));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "animate");
}

uint64_t __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_4(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_5;
  v2[3] = &unk_1E16B1B28;
  v2[4] = *(_QWORD *)(a1 + 32);
  return +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v2, 0.0, 0.2);
}

uint64_t __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setAlpha:", 0.0);
}

uint64_t __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_6(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_7;
  v2[3] = &unk_1E16B1B28;
  v2[4] = *(_QWORD *)(a1 + 32);
  return +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v2, 0.93, 0.07);
}

uint64_t __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setAlpha:", 1.0);
}

uint64_t __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "_endTransitionCompleted:", objc_msgSend(*(id *)(a1 + 32), "cancelledTransition") ^ 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setNeedsLayout");
}

void __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (**v6)(id, uint64_t);

  v6 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    if (v6)
      v6[2](v6, 1);
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "allowsUserInteractionDuringTransitions"))
      v5 = 393826;
    else
      v5 = 393824;
    objc_msgSend(*(id *)(a1 + 40), "duration");
    +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), v6);
  }

}

uint64_t __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __96___UINavigationBarVisualProviderModernIOS__performAnimationWithTransitionCompletion_transition___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[5];
  _QWORD v5[5];

  v2 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_2;
  v5[3] = &unk_1E16B1B28;
  v5[4] = *(_QWORD *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.0, 0.333333333);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_3;
  v4[3] = &unk_1E16B1B28;
  v4[4] = *(_QWORD *)(a1 + 32);
  return +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v4, 0.333333333, 0.333333333);
}

uint64_t __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setAlpha:", 0.0);
}

uint64_t __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setAlpha:", 0.0);
}

uint64_t __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setAlpha:", *(double *)(a1 + 40));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setAlpha:", *(double *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 225) = 0;
  return result;
}

uint64_t __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_5(_QWORD *a1)
{
  uint64_t v2;
  _QWORD v4[6];
  _QWORD v5[6];

  v2 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_6;
  v5[3] = &unk_1E16B1888;
  v5[4] = a1[4];
  v5[5] = a1[5];
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.666666667, 0.333333333);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_7;
  v4[3] = &unk_1E16B1888;
  v4[4] = a1[4];
  v4[5] = a1[6];
  return +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v4, 0.333333333, 0.333333333);
}

uint64_t __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __72___UINavigationBarVisualProviderModernIOS_animateForSearchPresentation___block_invoke_8(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 225) = 0;
  return result;
}

uint64_t __61___UINavigationBarVisualProviderModernIOS_barDidMoveToWindow__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "end");
}

uint64_t __101___UINavigationBarVisualProviderModernIOS_navigationItemUpdatedSearchController_oldSearchController___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setActive:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "setSearchActive:", 0);
}

uint64_t __78___UINavigationBarVisualProviderModernIOS__immediatelyFinishRunningTransition__block_invoke(uint64_t a1)
{
  uint64_t result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
