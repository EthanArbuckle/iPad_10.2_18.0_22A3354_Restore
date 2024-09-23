@implementation UINavigationController(IC)

- (uint64_t)_canShowWhileLocked
{
  return 1;
}

- (void)ic_configureBarsHideBackground:()IC hideHairlines:prefersLargeTitles:blurEffectMatchesBackground:
{
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  objc_msgSend(a1, "navigationBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPrefersLargeTitles:", a5);

  v12 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  v20 = v12;
  if (!a3)
  {
    objc_msgSend(v12, "configureWithDefaultBackground");
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v12, "configureWithTransparentBackground");
  if (a4)
  {
LABEL_5:
    objc_msgSend(v20, "setShadowColor:", 0);
    objc_msgSend(v20, "setShadowImage:", 0);
  }
LABEL_6:
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBackgroundEffect:", v13);

  }
  objc_msgSend(a1, "navigationBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setStandardAppearance:", v20);

  if ((a5 & 1) == 0)
  {
    objc_msgSend(a1, "navigationBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setScrollEdgeAppearance:", v20);

  }
  v16 = objc_alloc_init(MEMORY[0x1E0DC3E70]);
  v17 = v16;
  if (!a3)
  {
    objc_msgSend(v16, "configureWithDefaultBackground");
    if (!a4)
      goto LABEL_15;
    goto LABEL_14;
  }
  objc_msgSend(v16, "configureWithTransparentBackground");
  if (a4)
  {
LABEL_14:
    objc_msgSend(v17, "setShadowColor:", 0);
    objc_msgSend(v17, "setShadowImage:", 0);
  }
LABEL_15:
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBackgroundEffect:", v18);

  }
  objc_msgSend(a1, "toolbar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setStandardAppearance:", v17);

}

- (uint64_t)ic_configureBarsHideBackground:()IC hideHairlines:prefersLargeTitles:
{
  return objc_msgSend(a1, "ic_configureBarsHideBackground:hideHairlines:prefersLargeTitles:blurEffectMatchesBackground:", a3, a4, a5, 0);
}

- (void)ic_hideHairlines:()IC
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  objc_msgSend(a1, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_hidesShadow");

  if (v6 != (_DWORD)a3)
  {
    objc_msgSend(a1, "navigationBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setHidesShadow:", a3);

  }
  objc_msgSend(a1, "toolbar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_hidesShadow");

  if (v9 != (_DWORD)a3)
  {
    objc_msgSend(a1, "toolbar");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setHidesShadow:", a3);

  }
}

- (void)ic_hideBackground:()IC
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a1, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (a3)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v7, "setBackgroundImage:forBarMetrics:", v6, 0);

    objc_msgSend(a1, "navigationBar");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBarTintColor:", 0);
  }
  else
  {
    objc_msgSend(v5, "setBackgroundImage:forBarMetrics:", 0, 0);
  }

}

- (void)ic_useSingleLineA
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "navigationBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0DC1138];
  v3 = v15;
  objc_msgSend(a1, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_defaultTitleFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_fontWithSingleLineA");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitleTextAttributes:", v7);

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B48], 2, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v8, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v3;
  objc_msgSend(v9, "ic_fontWithSingleLineA");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLargeTitleTextAttributes:", v12);

}

- (void)ic_pushViewControllerAfterActiveTransition:()IC animated:
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  char v11;

  v6 = a3;
  objc_msgSend(a1, "transitionCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a1, "transitionCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __82__UINavigationController_IC__ic_pushViewControllerAfterActiveTransition_animated___block_invoke;
    v9[3] = &unk_1E5C225F8;
    v9[4] = a1;
    v10 = v6;
    v11 = a4;
    objc_msgSend(v8, "animateAlongsideTransition:completion:", 0, v9);

  }
  else
  {
    objc_msgSend(a1, "pushViewController:animated:", v6, a4);
  }

}

@end
