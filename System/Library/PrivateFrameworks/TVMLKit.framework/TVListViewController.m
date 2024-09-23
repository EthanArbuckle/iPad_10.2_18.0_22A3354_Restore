@implementation TVListViewController

void __59___TVListViewController_updateWithViewElement_cellMetrics___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a2;
  v8 = v7;
  if (a3)
  {
    v13 = v7;
    v9 = objc_msgSend(v7, "numberOfItems");
    v8 = v13;
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, a3);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      v8 = v13;
      *a4 = 1;
    }
  }

}

void __76___TVListViewController_didUpdateCollectionViewByNeedingReload_focusUpdate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  objc_msgSend(a2, "tv_associatedIKViewElement");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);

}

void __46___TVListViewController__delayedUpdatePreview__block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __46___TVListViewController__delayedUpdatePreview__block_invoke_2;
  v2[3] = &unk_24EB85398;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

  objc_destroyWeak(&v4);
}

void __46___TVListViewController__delayedUpdatePreview__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  int v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v4 = objc_msgSend(WeakRetained[166], "isEqual:", *(_QWORD *)(a1 + 32));
    v3 = v5;
    if (v4)
    {
      objc_msgSend(v5, "_updatedPreviewWithItemAtIndexPath:", *(_QWORD *)(a1 + 32));
      v3 = v5;
    }
  }

}

@end
