@implementation UINavigationItemProxy

void __57___UINavigationItemProxy_reloadDestinationItemFromSource__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;

  objc_msgSend(*(id *)(a1 + 40), "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setTitle:", v2);

  objc_msgSend(*(id *)(a1 + 40), "titleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setTitleView:", v3);

  objc_msgSend(*(id *)(a1 + 40), "_weeTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_setWeeTitle:", v4);

  v35 = 0;
  v36 = 0;
  objc_msgSend(*(id *)(a1 + 40), "_getLeadingItems:groups:", &v36, &v35);
  if (v36)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
LABEL_3:
    objc_msgSend(v5, "setLeftBarButtonItems:");
    goto LABEL_6;
  }
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v35)
    goto LABEL_5;
  objc_msgSend(v6, "leftBarButtonItems");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    objc_msgSend(*(id *)(a1 + 40), "leftBarButtonItems");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      goto LABEL_3;
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "leadingItemGroups");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "leadingItemGroups");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (!v26)
    {
      v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
LABEL_5:
      objc_msgSend(v6, "setLeadingItemGroups:");
    }
  }
  else
  {

  }
LABEL_6:
  v33 = 0;
  v34 = 0;
  objc_msgSend(*(id *)(a1 + 40), "_getTrailingItems:groups:", &v34, &v33);
  if (v34)
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
LABEL_8:
    objc_msgSend(v7, "setRightBarButtonItems:");
    goto LABEL_11;
  }
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v33)
  {
LABEL_10:
    objc_msgSend(v8, "setTrailingItemGroups:");
    goto LABEL_11;
  }
  objc_msgSend(v8, "rightBarButtonItems");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    objc_msgSend(*(id *)(a1 + 40), "rightBarButtonItems");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
    {
      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      goto LABEL_8;
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "trailingItemGroups");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v30, "count"))
  {

    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 40), "trailingItemGroups");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (!v32)
  {
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    goto LABEL_10;
  }
LABEL_11:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setHidesBackButton:", objc_msgSend(*(id *)(a1 + 40), "hidesBackButton"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setLeftItemsSupplementBackButton:", objc_msgSend(*(id *)(a1 + 40), "leftItemsSupplementBackButton"));
  objc_msgSend(*(id *)(a1 + 40), "backButtonTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setBackButtonTitle:", v9);

  objc_msgSend(*(id *)(a1 + 40), "backBarButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setBackBarButtonItem:", v10);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setLargeTitleDisplayMode:", objc_msgSend(*(id *)(a1 + 40), "largeTitleDisplayMode"));
  objc_msgSend(*(id *)(a1 + 40), "_largeTitleAccessoryView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_setLargeTitleAccessoryView:", v11);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_setLargeTitleTwoLineMode:", objc_msgSend(*(id *)(a1 + 40), "_largeTitleTwoLineMode"));
  objc_msgSend(*(id *)(a1 + 40), "compactAppearance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setCompactAppearance:", v12);

  objc_msgSend(*(id *)(a1 + 40), "standardAppearance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setStandardAppearance:", v13);

  objc_msgSend(*(id *)(a1 + 40), "scrollEdgeAppearance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setScrollEdgeAppearance:", v14);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_setBackgroundHidden:", objc_msgSend(*(id *)(a1 + 40), "_backgroundHidden"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_setManualScrollEdgeAppearanceEnabled:", objc_msgSend(*(id *)(a1 + 40), "_isManualScrollEdgeAppearanceEnabled"));
  objc_msgSend(*(id *)(a1 + 40), "_manualScrollEdgeAppearanceProgress");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_setManualScrollEdgeAppearanceProgress:");
  objc_msgSend(*(id *)(a1 + 40), "prompt");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setPrompt:", v15);

  objc_msgSend(*(id *)(a1 + 40), "searchController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setSearchController:", v16);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setHidesSearchBarWhenScrolling:", objc_msgSend(*(id *)(a1 + 40), "hidesSearchBarWhenScrolling"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setPreferredSearchBarPlacement:", objc_msgSend(*(id *)(a1 + 40), "preferredSearchBarPlacement"));
  objc_msgSend(*(id *)(a1 + 40), "centerItemGroups");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setCenterItemGroups:", v17);

  objc_msgSend(*(id *)(a1 + 40), "additionalOverflowItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setAdditionalOverflowItems:", v18);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_setPreferredNavigationBarVisibility:", objc_msgSend(*(id *)(a1 + 40), "_navigationBarVisibility"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_setNavigationBarHidden:", objc_msgSend(*(id *)(a1 + 40), "_isNavigationBarHidden"));
  objc_msgSend(*(id *)(a1 + 40), "_topPalette");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_setTopPalette:", v19);

  objc_msgSend(*(id *)(a1 + 40), "_bottomPalette");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_setBottomPalette:", v20);

}

@end
