@implementation UIFindNavigatorHarness

uint64_t __54___UIFindNavigatorHarness_beginHoistingFindNavigator___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "_findNavigatorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);

  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "_adjustHostViewScrollOffsetToTopIfSupported");
  return objc_msgSend(*(id *)(a1 + 32), "_sendPlacementUpdate");
}

void __72___UIFindNavigatorHarness_endHoistingFindNavigator_endingActiveSession___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id WeakRetained;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_findNavigatorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));

  if (v3 == WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "_findNavigatorView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

  }
  v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(v6, "_setSystemInsetAdjustment:forAdjustmentTypeIdentifier:", CFSTR("findadj"), 0.0);

}

uint64_t __72___UIFindNavigatorHarness_endHoistingFindNavigator_endingActiveSession___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  id WeakRetained;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  id v12;
  CGAffineTransform v14;
  CGAffineTransform v15;

  objc_msgSend(*(id *)(a1 + 32), "_findNavigatorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;

  CGAffineTransformMakeTranslation(&v15, 0.0, -v4);
  objc_msgSend(*(id *)(a1 + 32), "_findNavigatorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v15;
  objc_msgSend(v5, "setTransform:", &v14);

  if (*(_BYTE *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(WeakRetained, "contentOffset");
    v8 = v7;
    v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(v9, "contentOffset");
    v11 = v4 + v10;
    v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(v12, "setContentOffset:", v8, v11);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_sendPlacementUpdate");
}

uint64_t __72___UIFindNavigatorHarness_endHoistingFindNavigator_endingActiveSession___block_invoke_3(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "_findNavigatorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
