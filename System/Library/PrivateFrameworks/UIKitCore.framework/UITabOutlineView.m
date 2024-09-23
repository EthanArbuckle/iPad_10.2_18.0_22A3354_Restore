@implementation UITabOutlineView

id __41___UITabOutlineView__createViewHierarchy__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  UICollectionLayoutListConfiguration *v6;
  void *v7;
  uint64_t v8;
  id *WeakRetained;
  id *v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  BOOL v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  id (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[UICollectionLayoutListConfiguration initWithAppearance:]([UICollectionLayoutListConfiguration alloc], "initWithAppearance:", 3);
  +[UIColor clearColor](UIColor, "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionLayoutListConfiguration setBackgroundColor:](v6, "setBackgroundColor:", v7);

  v8 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke_2;
  v31[3] = &unk_1E16EC988;
  objc_copyWeak(&v32, (id *)(a1 + 32));
  -[UICollectionLayoutListConfiguration setLeadingSwipeActionsConfigurationProvider:](v6, "setLeadingSwipeActionsConfigurationProvider:", v31);
  v26 = v8;
  v27 = 3221225472;
  v28 = __41___UITabOutlineView__createViewHierarchy__block_invoke_3;
  v29 = &unk_1E16EC988;
  objc_copyWeak(&v30, (id *)(a1 + 32));
  -[UICollectionLayoutListConfiguration setTrailingSwipeActionsConfigurationProvider:](v6, "setTrailingSwipeActionsConfigurationProvider:", &v26);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
    v11 = WeakRetained[55];
  else
    v11 = 0;
  v12 = v11;
  v13 = objc_msgSend(v12, "isEditing", v26, v27, v28, v29);

  if (a2 >= 1)
    -[UICollectionLayoutListConfiguration setHeaderMode:](v6, "setHeaderMode:", 2);
  if ((v13 & 1) == 0)
  {
    if (a2 || !v10)
    {
      if (!v10)
        goto LABEL_14;
    }
    else
    {
      objc_msgSend(v10, "_headerContentConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14 == 0;

      if (!v15)
        -[UICollectionLayoutListConfiguration setHeaderMode:](v6, "setHeaderMode:", 1);
    }
    objc_msgSend(v10, "_footerContentConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = objc_msgSend(v10[67], "numberOfSections") - 1 == a2;

      if (v17)
        -[UICollectionLayoutListConfiguration setFooterMode:](v6, "setFooterMode:", 1);
    }
  }
LABEL_14:
  objc_msgSend(off_1E16799A0, "sectionWithListConfiguration:layoutEnvironment:", v6, v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v13)
  {
    objc_msgSend(v18, "setInterGroupSpacing:", 2.0);
    if (!a2)
    {
      objc_msgSend(off_1E1679980, "fractionalWidthDimension:", 1.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(off_1E1679980, "estimatedDimension:", 32.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(off_1E1679970, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v22, CFSTR("UITabOutlineView.EditHeader"), 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setBoundarySupplementaryItems:", v24);

    }
  }

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);

  return v19;
}

id __41___UITabOutlineView__createViewHierarchy__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_leadingSwipeActionsConfigurationForItemAtIndexPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __41___UITabOutlineView__createViewHierarchy__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_trailingSwipeActionsConfigurationForItemAtIndexPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __41___UITabOutlineView__createViewHierarchy__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  _BYTE *v7;
  id v8;
  id v9;
  id *v10;
  id WeakRetained;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v7)
      v7[876] &= ~1u;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke_5;
    v12[3] = &unk_1E16EC9B0;
    objc_copyWeak(&v15, v10);
    v13 = v9;
    v14 = v8;
    objc_msgSend(v7, "setConfigurationUpdateHandler:", v12);

    objc_destroyWeak(&v15);
  }

}

void __41___UITabOutlineView__createViewHierarchy__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_updateConfigurationForCell:inState:content:indexPath:", v8, v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

id __41___UITabOutlineView__createViewHierarchy__block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
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
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "contentByIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *(_QWORD *)(a1 + 32), v8, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sectionIdentifierForIndex:", objc_msgSend(v8, "section"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "dataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "snapshotForSection:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "levelOfItem:", v9);
    if (v19 <= 1)
      v20 = 1;
    else
      v20 = v19;
    objc_msgSend(v14, "setIndentationLevel:", v20 - 1);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __41___UITabOutlineView__createViewHierarchy__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("UICollectionElementKindSectionHeader")))
    {
      objc_msgSend(WeakRetained, "_headerContentConfiguration");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("UICollectionElementKindSectionFooter")))
      {
        if (!objc_msgSend(v5, "isEqualToString:", CFSTR("UITabOutlineView.EditHeader")))
          goto LABEL_8;
        +[UIListContentConfiguration cellConfiguration](UIListContentConfiguration, "cellConfiguration");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        _UINSLocalizedStringWithDefaultValue(CFSTR("Drag to customize items in the sidebar or tab bar."), CFSTR("Drag to customize items in the sidebar or tab bar."));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setText:", v9);

        +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "textProperties");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setColor:", v10);

        objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleFootnote"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "textProperties");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setFont:", v12);

        objc_msgSend(v8, "textProperties");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setNumberOfLines:", 0);

        objc_msgSend(v8, "textProperties");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setAdjustsFontSizeToFitWidth:", 0);

        goto LABEL_7;
      }
      objc_msgSend(WeakRetained, "_footerContentConfiguration");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v7;
LABEL_7:
    objc_msgSend(v16, "setContentConfiguration:", v8);

  }
LABEL_8:

}

id __41___UITabOutlineView__createViewHierarchy__block_invoke_8(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("UICollectionElementKindSectionHeader")))
  {
    v10 = a1 + 4;
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("UICollectionElementKindSectionFooter")))
  {
    v10 = a1 + 5;
  }
  else
  {
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("UITabOutlineView.EditHeader")))
    {
      v11 = 0;
      goto LABEL_8;
    }
    v10 = a1 + 6;
  }
  objc_msgSend(v7, "dequeueConfiguredReusableSupplementaryViewWithRegistration:forIndexPath:", *v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v11;
}

uint64_t __41___UITabOutlineView__createViewHierarchy__block_invoke_9(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "contentByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "tab");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (!WeakRetained ? (v8 = 0) : (v8 = (void *)WeakRetained[55]), objc_msgSend(v8, "isEditing")))
    v9 = objc_msgSend(v7, "_canBeReordered");
  else
    v9 = 0;

  return v9;
}

void __41___UITabOutlineView__createViewHierarchy__block_invoke_10(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "activeTransaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (WeakRetained)
    v3 = (void *)WeakRetained[55];
  else
    v3 = 0;
  if (objc_msgSend(v3, "isEditing") && !v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (WeakRetained)
      v6 = WeakRetained[55];
    else
      v6 = 0;
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), v6);

    goto LABEL_6;
  }
  if (!v2)
LABEL_6:
    objc_msgSend(WeakRetained, "_activateNewSidebarTransaction");

}

void __41___UITabOutlineView__createViewHierarchy__block_invoke_11(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "activeTransaction");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v11;
  v6 = (void *)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (WeakRetained)
      v10 = WeakRetained[55];
    else
      v10 = 0;
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), WeakRetained, CFSTR("_UITabOutlineView.m"), 488, CFSTR("UIKit internal error: UITabBarController sidebar received a did reorder callback, but we don't have an active transaction. Tab model: %@"), v10);

    v5 = v11;
  }
  objc_msgSend(v6, "updateUsingTransaction:", v5);
  if (WeakRetained)
    v7 = (void *)WeakRetained[55];
  else
    v7 = 0;
  if ((objc_msgSend(v7, "isEditing") & 1) == 0)
    objc_msgSend(WeakRetained, "_commitCurrentSidebarTransaction");

}

void __41___UITabOutlineView__createViewHierarchy__block_invoke_12(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD block[5];

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "editingCollapsedSectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v3);

  objc_msgSend(WeakRetained, "collapsedSectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v3);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke_13;
  block[3] = &unk_1E16B1B28;
  block[4] = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __41___UITabOutlineView__createViewHierarchy__block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSelectedItemAnimated:", 1);
}

void __41___UITabOutlineView__createViewHierarchy__block_invoke_14(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "editingCollapsedSectionIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v3);

  objc_msgSend(WeakRetained, "collapsedSectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v3);

}

uint64_t __55___UITabOutlineView__reloadDataSourceSnapshotAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "complete");
}

uint64_t __55___UITabOutlineView__reloadDataSourceSnapshotAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "complete");
}

uint64_t __55___UITabOutlineView__reloadDataSourceSnapshotAnimated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "complete");
}

uint64_t __67___UITabOutlineView__reconfigureItemsInDataSourceForTabs_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "complete");
}

void __68___UITabOutlineView__dataSourceUpdateGroupCompletionCreateIfNeeded___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[72];
    WeakRetained[72] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

void __40___UITabOutlineView_updateBottomBarView__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _BOOL4 v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "setNeedsLayout");
    v3 = +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled");
    v2 = v4;
    if (v3)
    {
      objc_msgSend(v4, "layoutIfNeeded");
      v2 = v4;
    }
  }

}

void __51___UITabOutlineView__tabModel_tabContentDidChange___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "updatedTabsDuringApplySnapshot");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)v4[73];
    v4[73] = 0;

    if (objc_msgSend(v2, "count"))
      objc_msgSend(v4, "_reconfigureItemsInDataSourceForTabs:animated:", v2, 1);

    WeakRetained = v4;
  }

}

uint64_t __57___UITabOutlineView__tabModel_didReplaceOldItem_newItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "complete");
}

uint64_t __57___UITabOutlineView__tabModel_didReplaceOldItem_newItem___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "complete");
}

void __45___UITabOutlineView__updateEditBarButtonItem__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (!*((_BYTE *)WeakRetained + 419))
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[55], "setEditing:", *(_BYTE *)(a1 + 40) == 0);
    WeakRetained = v3;
  }

}

void __45___UITabOutlineView__updateEditBarButtonItem__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "navigationBar");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

void __41___UITabOutlineView_setEditing_animated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEditing:", v2);

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySnapshot:animatingDifferences:", v5, 1);

}

void __41___UITabOutlineView_setEditing_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEditing:", v2);

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySnapshot:animatingDifferences:", v5, 0);

}

void __53___UITabOutlineView__commitCurrentSidebarTransaction__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "activeTransaction");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "commit");

}

void __38___UITabOutlineView__tabsByIdentifier__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v5, "tab");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "tab");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
}

void __61___UITabOutlineView_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  id WeakRetained;
  uint64_t v13;
  void *v14;
  id v15;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 440);
  else
    v3 = 0;
  if ((objc_msgSend(v3, "isEditing") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "activeTransaction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("_UITabOutlineView.m"), 1641, CFSTR("Cannot edit an item without an active transaction"));

    }
    objc_msgSend(*(id *)(a1 + 32), "activeTransaction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateTab:toHidden:", *(_QWORD *)(a1 + 40), 0);

    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      v7 = *(void **)(v6 + 440);
    else
      v7 = 0;
    objc_msgSend(v7, "visibilityDidChangeForTab:editing:", *(_QWORD *)(a1 + 40), 1);
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      v9 = *(void **)(v8 + 440);
    else
      v9 = 0;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v9, "selectElement:notifyOnReselection:", v10, 1);
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v11 + 432));
      v13 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v13 = 0;
      WeakRetained = 0;
    }
    v15 = WeakRetained;
    objc_msgSend(WeakRetained, "outlineView:didSelectTab:", v13, v10);

  }
}

uint64_t __63___UITabOutlineView_collectionView_didDeselectItemAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "activeTransaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateTab:toHidden:", *(_QWORD *)(a1 + 40), 1);

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(void **)(v3 + 440);
  else
    v4 = 0;
  return objc_msgSend(v4, "visibilityDidChangeForTab:editing:", *(_QWORD *)(a1 + 40), 1);
}

uint64_t __94___UITabOutlineView_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectItemAtIndexPath:animated:scrollPosition:", *(_QWORD *)(a1 + 40), 1, 0);

  return objc_msgSend(*(id *)(a1 + 32), "collectionView:didSelectItemAtIndexPath:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __71___UITabOutlineView_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(_QWORD *)(v4 + 456);
  else
    v5 = 0;
  v13 = v3;
  -[UITabBarControllerSidebar _willDisplayTab:](v5, v3);
  v6 = *(_BYTE **)(a1 + 32);
  if (v6[427]
    || (objc_msgSend(v6, "updatedTabsDuringApplySnapshot"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "containsObject:", v13),
        v7,
        v8))
  {
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      *(_BYTE *)(v9 + 876) &= ~1u;
    objc_msgSend(*(id *)(a1 + 48), "configurationState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UITabSidebarContent contentForTab:](_UITabSidebarContent, "contentForTab:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_updateConfigurationForCell:inState:content:indexPath:", *(_QWORD *)(a1 + 40), v10, v11, *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "updatedTabsDuringApplySnapshot");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v13);

  }
}

@end
