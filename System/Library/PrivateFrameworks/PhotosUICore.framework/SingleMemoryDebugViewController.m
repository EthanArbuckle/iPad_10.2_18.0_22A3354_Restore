@implementation SingleMemoryDebugViewController

void __58___SingleMemoryDebugViewController_viewWillLayoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setSpecSet:", v3);
  objc_msgSend(v4, "setVariant:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setLayoutMargins:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

}

void __47___SingleMemoryDebugViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "localizedDateText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocalizedDateText:", v5);

  objc_msgSend(*(id *)(a1 + 32), "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocalizedTitle:", v6);

  objc_msgSend(*(id *)(a1 + 32), "keyAssetFetchResult");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeyAsset:", v7);

}

@end
