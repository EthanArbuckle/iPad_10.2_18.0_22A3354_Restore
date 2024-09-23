@implementation TVProductTemplateController

void __46___TVProductTemplateController_viewDidAppear___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("filters.blurFilter.inputRadius"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setToValue:", &unk_24EBCD538);
  objc_msgSend(v3, "setDuration:", 0.4);
  objc_msgSend(v3, "setFillMode:", *MEMORY[0x24BDE5978]);
  objc_msgSend(v3, "setRemovedOnCompletion:", 0);
  objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimingFunction:", v2);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "addAnimation:forKey:", v3, CFSTR("blurRadiusAnimation"));
}

void __61___TVProductTemplateController_configureAppearanceTransition__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  if (*(_BYTE *)(a1 + 49))
    v6 = 0.0;
  else
    v6 = 1.0;
  objc_msgSend(v5, "_setBackgroundOpacity:", v6);
  if (*(_BYTE *)(a1 + 49))
    v7 = 0.0;
  else
    v7 = 1.0;
  objc_msgSend(v5, "_setTitleOpacity:", v7);
  v8 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 49))
  {
    objc_msgSend(*(id *)(a1 + 32), "setTitle:", 0);
  }
  else
  {
    v9 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v9, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v11);

  }
  if (*(_BYTE *)(a1 + 49))
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "tvmlkit_keyColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v12);

}

void __61___TVProductTemplateController_configureAppearanceTransition__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  if (*(_BYTE *)(a1 + 49))
    v6 = 0.0;
  else
    v6 = 1.0;
  objc_msgSend(v5, "_setBackgroundOpacity:", v6);
  if (*(_BYTE *)(a1 + 49))
    v7 = 0.0;
  else
    v7 = 1.0;
  objc_msgSend(v5, "_setTitleOpacity:", v7);
  v8 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 49))
  {
    objc_msgSend(*(id *)(a1 + 32), "setTitle:", 0);
  }
  else
  {
    v9 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v9, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v11);

  }
  if (*(_BYTE *)(a1 + 49))
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "tvmlkit_keyColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v12);

  v13 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v13, "setNeedsStatusBarAppearanceUpdate");

}

uint64_t __83___TVProductTemplateController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "collectionViewLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateLayout");

  return objc_msgSend(*(id *)(a1 + 32), "configureAppearanceTransition");
}

void __52___TVProductTemplateController_scrollViewDidScroll___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "performSelector:", sel__cancelImpressionsUpdate);

}

uint64_t __62___TVProductTemplateController__updateTopHeroImageVisibility___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setTitleOpacity:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setTitle:", *(_QWORD *)(a1 + 48));
}

uint64_t __62___TVProductTemplateController__updateTopHeroImageVisibility___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setTitleOpacity:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setTitle:", 0);
}

void __78___TVProductTemplateController__spacingMetricsForViewControllers_contentSize___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  objc_msgSend(a2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_2557B2468))
  {
    objc_msgSend(v3, "rowMetricsForExpectedWidth:firstItemRowIndex:", 0, *(double *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    TVRowMetricsMakeWithList(v4, &v10);
    v6 = *((double *)&v10 + 1);
    v5 = v10;
    v15 = v11;
    v16 = v12;
    v17 = v13;
    v18 = v14;

  }
  else
  {
    objc_msgSend(v3, "tv_sizeThatFits:", *(double *)(a1 + 48), 0.0);
    v6 = v7;
    v5 = 0;
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v6
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 40);
  v8 = *(void **)(a1 + 32);
  *(_QWORD *)&v10 = v5;
  *((double *)&v10 + 1) = v6;
  v11 = v15;
  v12 = v16;
  v13 = v17;
  v14 = v18;
  objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithRowMetrics:", &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

}

@end
