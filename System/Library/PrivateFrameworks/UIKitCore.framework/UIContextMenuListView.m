@implementation UIContextMenuListView

void __40___UIContextMenuListView_initWithFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  int IsAccessibilityCategory;
  void *v9;
  id v10;

  v10 = a2;
  v4 = a3;
  objc_msgSend(v10, "_updateContentMargins");
  objc_msgSend(v10, "setHasValidContentSize:", 0);
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = UIContentSizeCategoryIsAccessibilityCategory(v5);
  objc_msgSend(v10, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  if ((_DWORD)v4 != IsAccessibilityCategory)
  {
    objc_msgSend(v10, "updateTraitsIfNeeded");
    objc_msgSend(v10, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadData");

  }
}

void __41___UIContextMenuListView_setShadowAlpha___block_invoke(uint64_t a1)
{
  _UICutoutShadowView *v2;
  void *v3;
  _UICutoutShadowView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  objc_msgSend(*(id *)(a1 + 32), "setClipsToBounds:", 0);
  v2 = [_UICutoutShadowView alloc];
  objc_msgSend(*(id *)(a1 + 32), "_platformMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "menuCornerRadius");
  v4 = -[_UIRoundedRectShadowView initWithCornerRadius:](v2, "initWithCornerRadius:");
  objc_msgSend(*(id *)(a1 + 32), "setShadowView:", v4);

  objc_msgSend(*(id *)(a1 + 32), "shadowView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);

  objc_msgSend(*(id *)(a1 + 32), "shadowView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsHitTesting:", 0);

  objc_msgSend(*(id *)(a1 + 32), "shadowView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clippingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  objc_msgSend(v8, "frameWithContentWithFrame:");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(*(id *)(a1 + 32), "shadowView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  objc_msgSend(*(id *)(a1 + 32), "shadowView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "shadowView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layoutIfNeeded");

  v21 = *(void **)(a1 + 32);
  objc_msgSend(v21, "shadowView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "insertSubview:atIndex:", v22, 0);

}

uint64_t __114___UIContextMenuListView_setSubmenuTitleViewExpanded_withMaterialGroupName_associatedCellContentView_highlighted___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;

  if (*(_BYTE *)(a1 + 72))
    objc_msgSend(*(id *)(a1 + 32), "highlightItemAtIndexPath:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 73))
  {
    objc_msgSend(*(id *)(a1 + 48), "contentView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_inheritRelevantPropertiesFromContentView:", *(_QWORD *)(a1 + 56));

  }
  objc_msgSend(*(id *)(a1 + 48), "addObscuringMaterialViewWithGroupName:", *(_QWORD *)(a1 + 64));
  if (*(_BYTE *)(a1 + 73))
    v3 = 1.0;
  else
    v3 = 0.0;
  objc_msgSend(*(id *)(a1 + 48), "obscuringMaterialView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

  if (*(_BYTE *)(a1 + 73))
  {
    objc_msgSend(*(id *)(a1 + 48), "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "options");

    v7 = v6 & 0xFFFFFFFFFFFFFFBFLL;
    objc_msgSend(*(id *)(a1 + 48), "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOptions:", v7);

  }
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __66___UIContextMenuListView_preferredContentSizeWithinContainerSize___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  v2 = *(double *)(a1 + 56);
  v3 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "frame");
  v13.origin.x = 0.0;
  v13.origin.y = 0.0;
  v13.size.width = v2;
  v13.size.height = v3;
  if (!CGRectEqualToRect(v11, v13))
    objc_msgSend(*(id *)(a1 + 32), "setFrame:", 0.0, 0.0, v2, v3);
  objc_msgSend(*(id *)(a1 + 32), "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateLayout");

  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "contentSize");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  *(_QWORD *)(v5 + 32) = v6;
  *(_QWORD *)(v5 + 40) = v7;
  v8 = *(double *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  v9 = v8 - CGRectGetWidth(v12);
  if (v9 < 0.0)
    v9 = -v9;
  if (v9 < 0.00000011920929)
    objc_msgSend(*(id *)(a1 + 40), "_sizeClippingAndCollectionViews");
  return objc_msgSend(*(id *)(a1 + 40), "setHasValidContentSize:", 1);
}

id __55___UIContextMenuListView__dataSourceForCollectionView___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  unint64_t v19;
  unint64_t v20;
  const __CFString *v21;
  void *v22;
  id v23;
  const __CFString *v24;
  void *v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v7, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "snapshot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_customContentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "cellSizeGivenTraits:", v16);

  if (objc_msgSend(v14, "layout") == 1)
  {
    v17 = objc_msgSend(v14, "preferredCellSize");
    v18 = CFSTR("kContextMenuSmallCell");
    if (!v15)
      goto LABEL_17;
LABEL_15:
    objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kContextMenuCustomViewCell"), v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCustomContentView:", v15);
    v23 = v22;
    objc_msgSend(WeakRetained, "contentMargins");
    objc_msgSend(v23, "setDirectionalLayoutMargins:");

    goto LABEL_21;
  }
  v19 = objc_msgSend(v8, "item");
  v20 = 3;
  if (v17 != 1)
    v20 = 0;
  if (!v17)
    v20 = 4;
  if (v19 < v20)
  {
    v21 = CFSTR("kContextMenuLargeCell");
    if (!v17)
      v21 = CFSTR("kContextMenuSmallCell");
    if (v17 == 1)
      v18 = CFSTR("kContextMenuMediumCell");
    else
      v18 = v21;
    if (!v15)
      goto LABEL_17;
    goto LABEL_15;
  }
  v18 = CFSTR("kContextMenuLargeCell");
  v17 = 2;
  if (v15)
    goto LABEL_15;
LABEL_17:
  if (objc_msgSend(v9, "_isLoadingPlaceholder"))
  {
    v24 = CFSTR("kContextMenuLoadingCell");
    v25 = v7;
  }
  else
  {
    v25 = v7;
    v24 = v18;
  }
  objc_msgSend(v25, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v24, v8);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "contentMargins");
  objc_msgSend(v23, "setDirectionalLayoutMargins:");
  objc_msgSend(WeakRetained, "_configureCell:inCollectionView:atIndexPath:forElement:section:size:", v23, v7, v8, v9, v14, v17);
LABEL_21:

  return v23;
}

id __55___UIContextMenuListView__dataSourceForCollectionView___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v7, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v8, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "displayedMenu");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSource");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "snapshot");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sectionIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v9, "section"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("kContextMenuHeader")))
  {
    v16 = v11;
    v39 = v11;
    v40 = v15;
    if (v15 && (objc_msgSend(v9, "length") != 1 || objc_msgSend(v9, "section")))
    {
      objc_msgSend(v15, "title");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "headerMargins");
      objc_msgSend(v16, "setUnscaledLayoutMargins:");
      objc_msgSend(v16, "setIsMenuTitle:", 0);
      v18 = 1;
      goto LABEL_28;
    }
    objc_msgSend(v12, "title");
    v18 = (uint64_t)v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "headerView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
LABEL_26:
      objc_msgSend(WeakRetained, "menuTitleMargins");
      objc_msgSend(v16, "setUnscaledLayoutMargins:");
      objc_msgSend(v16, "setIsMenuTitle:", 1);
      if (v38)
      {
        objc_msgSend(v16, "setContentView:", v38);

LABEL_29:
        objc_msgSend(v16, "setSeparatorStyle:", v18);
        objc_msgSend(WeakRetained, "backgroundMaterialGroupName");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setBackgroundMaterialGroupName:", v34);

        v11 = v39;
        goto LABEL_30;
      }
LABEL_28:
      objc_msgSend(v16, "setTitle:", v17);
      goto LABEL_29;
    }
    objc_msgSend(v12, "children");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "_platformMetrics");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v33, "menuTitleAlwaysShowsSeparator") & 1) != 0 || v38)
    {

    }
    else
    {
      if ((objc_msgSend(v32, "_isInlineGroup") & 1) == 0)
      {

LABEL_24:
        v18 = 1;
        goto LABEL_25;
      }
      objc_msgSend(v32, "title");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "length");

      if (!v37)
        goto LABEL_24;
    }
    v18 = 2;
LABEL_25:

    goto LABEL_26;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("kContextMenuSubmenuTitleHeader")))
  {
    v40 = v15;
    v16 = v11;
    objc_msgSend(WeakRetained, "contentMargins");
    objc_msgSend(v16, "setDirectionalLayoutMargins:");
    objc_msgSend(v16, "setAllowsFocus:", objc_msgSend(WeakRetained, "allowsFocus"));
    objc_msgSend(v16, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "title");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTitle:", v20);

    objc_msgSend(v16, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "subtitle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSubtitle:", v22);

    objc_msgSend(v16, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "image");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setImage:", v24);

    objc_msgSend(WeakRetained, "backgroundMaterialGroupName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundMaterialGroupName:", v25);

    v26 = objc_msgSend(v12, "options") & 2;
    v27 = objc_msgSend(v12, "_shouldShowSelectionState");
    v28 = 80;
    if (v27)
      v28 = 84;
    v29 = v28 | v26;
    objc_msgSend(v16, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setOptions:", v29);
    goto LABEL_30;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("kContextMenuSectionSeparator")))
  {
    v40 = v15;
    objc_msgSend(v7, "traitCollection");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    _UIContextMenuGetPlatformMetrics(objc_msgSend(v16, "userInterfaceIdiom"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "sectionSeparatorColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setBackgroundColor:", v17);
LABEL_30:

    v15 = v40;
  }

  return v11;
}

void __94___UIContextMenuListView__configureCell_inCollectionView_atIndexPath_forElement_section_size___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC5BE8], "variantForSelector:", objc_msgSend(a2, "action"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __94___UIContextMenuListView__configureCell_inCollectionView_atIndexPath_forElement_section_size___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0DC5BE8];
  objc_msgSend(a2, "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "variantForActionIdentifier:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

@end
