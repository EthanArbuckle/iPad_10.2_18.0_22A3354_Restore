@implementation TVShelfViewController

uint64_t __60___TVShelfViewController_updateWithViewElement_cellMetrics___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("prominent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

void __77___TVShelfViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "indexPathForSnappedContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((v2 & 1) == 0)
  {
    v4 = (void *)MEMORY[0x24BDF6F90];
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __77___TVShelfViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v5[3] = &unk_24EB848C0;
    v6 = *(id *)(a1 + 40);
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v4, "performWithoutAnimation:", v5);

  }
}

uint64_t __77___TVShelfViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "snapContentToIndexPath:", *(_QWORD *)(a1 + 40));
}

void __72___TVShelfViewController_updateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __72___TVShelfViewController_updateFocusInContext_withAnimationCoordinator___block_invoke_2;
  v2[3] = &unk_24EB85398;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

  objc_destroyWeak(&v4);
}

void __72___TVShelfViewController_updateFocusInContext_withAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "nextFocusedIndexPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_didSettleOnItemAtIndexPath:", v2);

}

uint64_t __44___TVShelfViewController_setSpeedBumpEdges___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setSpeedBumpEdges:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1320));
}

void __47___TVShelfViewController__delayedUpdatePreview__block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __47___TVShelfViewController__delayedUpdatePreview__block_invoke_2;
  v2[3] = &unk_24EB85398;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

  objc_destroyWeak(&v4);
}

void __47___TVShelfViewController__delayedUpdatePreview__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didSettleOnItemAtIndexPath:", *(_QWORD *)(a1 + 32));

}

@end
