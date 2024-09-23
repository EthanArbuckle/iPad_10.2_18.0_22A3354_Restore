@implementation UIKeyShortcutHUDToolbarViewController

void __66___UIKeyShortcutHUDToolbarViewController__configureCollectionView__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *v10;
  id WeakRetained;
  void *v12;
  _QWORD v13[4];
  id v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v7, "configureForDisplayingInHUDWithCategory:", v9);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66___UIKeyShortcutHUDToolbarViewController__configureCollectionView__block_invoke_2;
    v13[3] = &unk_1E16E6260;
    objc_copyWeak(&v14, v10);
    objc_msgSend(v7, "setConfigurationUpdateHandler:", v13);
    objc_msgSend(WeakRetained, "collectionViewManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCategoryVisible:", objc_msgSend(v12, "client:isCategoryVisibleForCellAtIndexPath:", WeakRetained, v8));

    objc_destroyWeak(&v14);
  }

}

void __66___UIKeyShortcutHUDToolbarViewController__configureCollectionView__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "updateScrollingSeparatorViewVisibility");
    WeakRetained = v2;
  }

}

void __66___UIKeyShortcutHUDToolbarViewController__configureCollectionView__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v12, "separatorView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_configureSeparatorViewAppearance:", v8);

    objc_msgSend(WeakRetained, "collectionViewManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "client:shouldHideSeparatorAtIndexPath:", WeakRetained, v6);
    objc_msgSend(v12, "separatorView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSeparatorHidden:", v10);

  }
}

uint64_t __66___UIKeyShortcutHUDToolbarViewController__configureCollectionView__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *(_QWORD *)(a1 + 32), a3, a4);
}

uint64_t __66___UIKeyShortcutHUDToolbarViewController__configureCollectionView__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dequeueConfiguredReusableSupplementaryViewWithRegistration:forIndexPath:", *(_QWORD *)(a1 + 32));
}

id __63___UIKeyShortcutHUDToolbarViewController__collectionViewLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  id v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "menu");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "children");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    objc_msgSend(v4, "container");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentSize");
    v11 = (double)v9;
    v13 = v12 / (double)v9;

    objc_msgSend(v6, "metrics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "widestToolbarCategoryCellWidth");
    v16 = v15;

    if (v13 >= v16)
      v16 = v13;
    v43 = v4;
    objc_msgSend(v6, "metrics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "separatorWidth");
    objc_msgSend(off_1E1679980, "absoluteDimension:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E1679980, "fractionalHeightDimension:", 1.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIKeyShortcutHUDUtilities separatorElementKind]();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E1679968, "layoutAnchorWithEdges:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E16799B8, "supplementaryItemWithLayoutSize:elementKind:containerAnchor:", v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(off_1E1679980, "fractionalWidthDimension:", 1.0 / v11);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E1679980, "fractionalHeightDimension:", 1.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v44[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E1679998, "itemWithLayoutSize:supplementaryItems:", v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(off_1E1679980, "absoluteDimension:", v16 * v11);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E1679980, "fractionalHeightDimension:", 1.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(off_1E1679990, "horizontalGroupWithLayoutSize:repeatingSubitem:count:", v31, v28, v9);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "metrics");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "toolbarContentInset");
    v35 = v34;
    objc_msgSend(v6, "metrics");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "toolbarContentInset");
    v38 = v37;
    objc_msgSend(v6, "metrics");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "toolbarContentInset");
    objc_msgSend(v32, "setContentInsets:", v35, 0.0, v38, v40);

    v4 = v43;
    objc_msgSend(off_1E16799A0, "sectionWithGroup:", v32);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v41 = 0;
  }

  return v41;
}

void __69___UIKeyShortcutHUDToolbarViewController_didCompleteSearchTransition__block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isSearching"))
  {
    objc_msgSend(*(id *)(a1 + 32), "searchBar");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "becomeFirstResponder");

  }
}

uint64_t __81___UIKeyShortcutHUDToolbarViewController_flashCategoryAtIndex_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
