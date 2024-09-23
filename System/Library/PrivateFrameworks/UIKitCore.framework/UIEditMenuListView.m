@implementation UIEditMenuListView

id __40___UIEditMenuListView__createDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  double *WeakRetained;
  void *v11;
  uint64_t v12;
  double v13;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = (double *)objc_loadWeakRetained(v6);
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("_UIEditMenuListViewCell"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(WeakRetained, "axis");
  v13 = 0.0;
  if (!v12)
    v13 = WeakRetained[53];
  objc_msgSend(v11, "setMaximumContentWidth:", v13);
  objc_msgSend(v11, "setItem:", v7);

  return v11;
}

id __40___UIEditMenuListView__createDataSource__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _BOOL8 v10;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("_UIEditMenuListViewSeparator")))
  {
    objc_msgSend(v6, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v7, CFSTR("_UIEditMenuListViewSeparator"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "section"))
      v10 = 0;
    else
      v10 = objc_msgSend(v8, "item") == 0;
    objc_msgSend(v9, "setHidden:", v10);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __43___UIEditMenuListView__reloadMenuAnimated___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFromValue:", a2);
  objc_msgSend(v3, "setDuration:", 0.25);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimingFunction:", v4);

  objc_msgSend(v3, "setRemovedOnCompletion:", 1);
  return v3;
}

uint64_t __43___UIEditMenuListView__reloadMenuAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

@end
