@implementation UIFloatingTabBar

void __34___UIFloatingTabBar_sidebarButton__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = a2;
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFloatingTabBarGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentPaletteProvider");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, objc_msgSend(v6, "userInterfaceStyle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inactiveColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBaseForegroundColor:", v8);

  objc_msgSend(v2, "setConfiguration:", v4);
}

void __41___UIFloatingTabBar__createViewHierarchy__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_scrollToSelectedItemIfNeeded");
  objc_msgSend(WeakRetained, "_indexPathForSelectedItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "section");

  if (v2 != 3)
    objc_msgSend(WeakRetained, "_updateSelectionViewFrameAnimated:completion:", 0, 0);
  objc_msgSend(WeakRetained, "_updateContentAlphaForVisibleCells");

}

void __41___UIFloatingTabBar__createViewHierarchy__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  void *v5;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "targetItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_selectItemAtIndexPath:", v5);
}

id __38___UIFloatingTabBar__createDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(v9, "isPlaceholder") & 1) != 0)
  {
    v11 = CFSTR("UIFloatingTabBar.PlaceholderCell");
  }
  else
  {
    objc_msgSend(v9, "contentTab");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v11 = CFSTR("UIFloatingTabBar.Cell");
    }
    else
    {
      objc_msgSend(v9, "children");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v11 = CFSTR("UIFloatingTabBar.GroupCell");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), WeakRetained, CFSTR("_UIFloatingTabBar.m"), 563, CFSTR("Cannot create cells for an unknown list item type"));

        v11 = 0;
      }
    }
  }
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setListItem:", v9);

  return v15;
}

void __57___UIFloatingTabBar__updateDataSourceFromParserAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scrollToTargetPageAnimated:", *(unsigned __int8 *)(a1 + 40));

    WeakRetained = v4;
  }

}

uint64_t __53___UIFloatingTabBar__updateTabBarPaginationAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __41___UIFloatingTabBar_setEditing_animated___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (*(_BYTE *)(a1 + 40))
    v2 = 0.0;
  else
    v2 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "selectionContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

  if (*(_BYTE *)(a1 + 41))
  {
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);

    objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setAutomaticContentOffsetAdjustmentEnabled:", 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "dragController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeDropItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsDropPreviewUpdate");

}

BOOL __45___UIFloatingTabBar__contentTabForRecentTab___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_tabPlacement") != 6;
}

void __44___UIFloatingTabBar__selectItemAtIndexPath___block_invoke(void **a1, int a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (a2)
  {
    v11 = WeakRetained;
    objc_msgSend(WeakRetained, "tabModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectedItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 == a1[4])
    {
      objc_msgSend(a1[5], "parent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "expandedGroupItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 == v9)
        objc_msgSend(v11, "setExpandedGroupItem:", 0);
    }
    else
    {

    }
    objc_msgSend(v11, "pointerInteraction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidate");

    WeakRetained = v11;
  }

}

uint64_t __42___UIFloatingTabBar__indexPathForTabItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a2, "tabForSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v5;
  v8 = v7;
  if (v6 == v7)
  {
    v9 = 1;
  }
  else
  {
    v9 = 0;
    if (v6 && v7)
      v9 = objc_msgSend(v6, "isEqual:", v7);
  }

  return v9;
}

void __66___UIFloatingTabBar__updateSelectionViewFrameAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v2 = *(unsigned __int8 *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "selectionContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHighlighted:", v2);

  v4 = *(double *)(a1 + 40);
  v5 = *(double *)(a1 + 48);
  v6 = *(double *)(a1 + 56);
  v7 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "selectionContainerView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelectionViewFrame:", v4, v5, v6, v7);

}

unint64_t __50___UIFloatingTabBar__pageIndexForItemAtIndexPath___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unint64_t v7;
  unint64_t result;
  unint64_t v9;

  v7 = *(_QWORD *)(a1 + 40);
  result = objc_msgSend(a2, "range");
  if (v7 >= result && v7 - result < v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

void __60___UIFloatingTabBar__updateSelectionViewVisibilityAnimated___block_invoke(uint64_t a1)
{
  double v1;
  void *v2;
  id v3;

  if (*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  else
    v1 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "selectionContainerView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

void __42___UIFloatingTabBar_setExpandedGroupItem___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 624);
  *(_QWORD *)(v2 + 624) = 0;

}

void __49___UIFloatingTabBar_scrollViewWillBeginDragging___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "selectionContainerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __44___UIFloatingTabBar_registerPlatformMetrics__block_invoke()
{
  uint64_t v0;
  id v1;

  +[_UIVisualStyleRegistry defaultRegistry](_UIVisualStyleRegistry, "defaultRegistry");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_opt_class();
  objc_msgSend(v1, "registerVisualStyleClass:forStylableClass:", v0, objc_opt_class());

}

@end
