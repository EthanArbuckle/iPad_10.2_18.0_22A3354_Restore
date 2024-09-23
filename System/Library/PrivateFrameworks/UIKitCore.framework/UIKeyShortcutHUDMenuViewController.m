@implementation UIKeyShortcutHUDMenuViewController

void __63___UIKeyShortcutHUDMenuViewController__configureCollectionView__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a2;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(v8, "configureWithShortcut:", v6);

}

void __63___UIKeyShortcutHUDMenuViewController__configureCollectionView__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "menuSeparatorHorizontalMargin");
    objc_msgSend(v17, "setDirectionalLayoutMargins:", 0.0, v9, 0.0, v9);
    objc_msgSend(v8, "menuSeparatorColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "separatorView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSeparatorColor:", v10);

    objc_msgSend(v8, "menuSeparatorVisualEffect");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "separatorView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setVisualEffect:", v12);

    objc_msgSend(WeakRetained, "collectionViewManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "client:shouldHideSeparatorAtIndexPath:", WeakRetained, v6);
    objc_msgSend(v17, "separatorView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSeparatorHidden:", v15);

  }
}

void __63___UIKeyShortcutHUDMenuViewController__configureCollectionView__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "snapshot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sectionIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "configureWithCategory:", v12);
  }

}

uint64_t __63___UIKeyShortcutHUDMenuViewController__configureCollectionView__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *(_QWORD *)(a1 + 32), a3, a4);
}

id __63___UIKeyShortcutHUDMenuViewController__configureCollectionView__block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  int v9;
  uint64_t v10;
  void *v11;

  v7 = a4;
  v8 = a2;
  v9 = objc_msgSend(a3, "isEqualToString:", CFSTR("UICollectionElementKindSectionHeader"));
  v10 = 40;
  if (v9)
    v10 = 32;
  objc_msgSend(v8, "dequeueConfiguredReusableSupplementaryViewWithRegistration:forIndexPath:", *(_QWORD *)(a1 + v10), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __80___UIKeyShortcutHUDMenuViewController_flashShortcutIfVisible_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + 32;
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(v5 + 8);
  if (v3)
    v6 = objc_msgSend(v3, "section");
  else
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, a2, v6);
}

@end
