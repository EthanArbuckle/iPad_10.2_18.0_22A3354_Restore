@implementation UIViewController(UIViewController_SpringBoard)

- (uint64_t)sb_beginAppearanceTransitionIfNecessary:()UIViewController_SpringBoard animated:
{
  uint64_t result;
  int v8;

  result = objc_msgSend(a1, "isViewLoaded");
  if ((_DWORD)result)
  {
    v8 = objc_msgSend(a1, "_appearState");
    if ((_DWORD)a3)
    {
      if (!v8 || v8 == 3)
        goto LABEL_5;
    }
    else if ((v8 - 1) <= 1)
    {
LABEL_5:
      objc_msgSend(a1, "beginAppearanceTransition:animated:", a3, a4);
      return 1;
    }
    return 0;
  }
  return result;
}

- (uint64_t)sb_endAppearanceTransitionIfNecessary
{
  uint64_t result;

  result = objc_msgSend(a1, "isViewLoaded");
  if ((_DWORD)result)
  {
    if ((objc_msgSend(a1, "_appearState") & 0xFFFFFFFD) == 1)
    {
      objc_msgSend(a1, "endAppearanceTransition");
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

+ (id)sb_firstDescendantOfViewControllers:()UIViewController_SpringBoard passingTest:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "bs_firstObjectPassingTest:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v15, "childViewControllers", (_QWORD)v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObjectsFromArray:", v16);

          objc_msgSend(v15, "presentedViewController");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "_sb_safeAddObject:", v17);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(a1, "sb_firstDescendantOfViewControllers:passingTest:", v9, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)sb_firstDescendantPassingTest:()UIViewController_SpringBoard
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_class();
  v9[0] = a1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sb_firstDescendantOfViewControllers:passingTest:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sb_firstDescendantOfClass:()UIViewController_SpringBoard
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__UIViewController_UIViewController_SpringBoard__sb_firstDescendantOfClass___block_invoke;
  v4[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v4[4] = a3;
  objc_msgSend(a1, "sb_firstDescendantPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)sb_firstDescendantOfClassNamed:()UIViewController_SpringBoard
{
  return objc_msgSend(a1, "sb_firstDescendantOfClass:", NSClassFromString(aClassName));
}

- (SBMutableStatusBarSettings)sb_childOrPresentedViewControllerStatusBarSettings
{
  void *v2;
  uint64_t v3;
  void *v4;
  SBMutableStatusBarSettings *v5;
  int v6;
  uint64_t v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(a1, "_effectiveStatusBarStyleViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_effectiveStatusBarHiddenViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2 == a1 && (void *)v3 == a1)
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_alloc_init(SBMutableStatusBarSettings);
    v6 = objc_msgSend(v4, "_preferredStatusBarVisibility");
    v7 = objc_msgSend(v2, "preferredStatusBarStyle");
    if (v6)
    {
      v8 = 1.0;
      if (v6 == 1)
        v8 = 0.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBMutableStatusBarSettings setAlpha:](v5, "setAlpha:", v9);

    }
    if (v7 != -1)
    {
      if (v7)
        v10 = 1;
      else
        v10 = 2;
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEADE8]), "initWithStyle:", v10);
      -[SBMutableStatusBarSettings setLegibilitySettings:](v5, "setLegibilitySettings:", v11);

    }
  }

  return v5;
}

@end
