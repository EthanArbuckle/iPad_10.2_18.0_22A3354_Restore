@implementation UIKeyShortcutHUDSearchButton

void __57___UIKeyShortcutHUDSearchButton__configureCollectionView__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *v10;
  id WeakRetained;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    v13 = objc_msgSend(WeakRetained, "isSearching");
    +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
      objc_msgSend(v14, "searchHUDTextColor");
    else
      objc_msgSend(v14, "standardHUDTextColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSearchIconColor:", v16);

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __57___UIKeyShortcutHUDSearchButton__configureCollectionView__block_invoke_2;
    v17[3] = &unk_1E16E6260;
    objc_copyWeak(&v18, v10);
    objc_msgSend(v7, "setConfigurationUpdateHandler:", v17);
    objc_destroyWeak(&v18);
  }

}

void __57___UIKeyShortcutHUDSearchButton__configureCollectionView__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "toolbarVC");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "updateScrollingSeparatorViewVisibility");

    WeakRetained = v3;
  }

}

uint64_t __57___UIKeyShortcutHUDSearchButton__configureCollectionView__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *(_QWORD *)(a1 + 32), a3, a4);
}

@end
