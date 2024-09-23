@implementation UIViewController(PhotosUI)

- (uint64_t)pu_wantsToolbarVisible
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "px_barAppearance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "isEnabled"))
    v2 = objc_msgSend(v1, "prefersToolbarVisible");
  else
    v2 = 0;

  return v2;
}

- (uint64_t)pu_wantsNavigationBarVisible
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "px_barAppearance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "isEnabled"))
    v2 = objc_msgSend(v1, "prefersNavigationBarVisible");
  else
    v2 = 1;

  return v2;
}

- (uint64_t)pu_wantsTabBarVisible
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "px_barAppearance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "isEnabled"))
    v2 = objc_msgSend(v1, "prefersTabBarVisible");
  else
    v2 = 1;

  return v2;
}

- (uint64_t)pu_navigationBarTintColor
{
  return 0;
}

- (void)pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:()PhotosUI
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(a1, "pu_navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewController:willSetupInitialBarsVisibilityOnViewWillAppearAnimated:", a1, a3);

  objc_msgSend(a1, "transitionCoordinator");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isCancelled"))
  {
    objc_msgSend(a1, "pu_navigationBarTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_pu_setNavigationBarTintColor:withAnimationSettings:", v6, 0, 0);
  }
  else
  {
    if ((_DWORD)a3)
    {
      objc_msgSend(v13, "transitionDuration");
      v8 = v7;
      v9 = 1;
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isStatusBarHidden");

    objc_msgSend(a1, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pu_currentNavigationTransition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v11 = objc_msgSend(v6, "wasStatusBarHiddenBeforeTransition");
    objc_msgSend(a1, "_pu_performBarsVisibilityUpdatesWithAnimationSettings:isStatusBarHidden:", v9, v8, v11);
  }

}

- (uint64_t)pu_preferredStatusBarUpdateAnimation
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("PUPreferredStatusBarUpdateAnimationAssociationKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (void)pu_performBarsVisibilityUpdatesWithAnimationSettings:()PhotosUI
{
  int v7;
  void *v8;
  BOOL v9;
  int v10;
  void *v11;
  uint64_t v12;
  id v13;

  v7 = objc_msgSend(a1, "px_isVisible");
  objc_msgSend(a1, "navigationController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v9 = v8 == a1;
  else
    v9 = 1;
  v10 = v9;
  if (v7 && v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isStatusBarHidden");

    objc_msgSend(a1, "_pu_performBarsVisibilityUpdatesWithAnimationSettings:isStatusBarHidden:", a3, a4, v12);
  }

}

- (void)_pu_performBarsVisibilityUpdatesWithAnimationSettings:()PhotosUI isStatusBarHidden:
{
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  unsigned int v16;
  id v17;

  v9 = objc_msgSend(a1, "prefersStatusBarHidden");
  v10 = objc_msgSend(a1, "pu_wantsNavigationBarVisible");
  v16 = objc_msgSend(a1, "pu_wantsToolbarVisible");
  if (objc_msgSend(a1, "pu_wantsTabBarVisible"))
  {
    objc_msgSend(a1, "tabBarController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "px_hidesTabBarForCurrentHorizontalSizeClass") ^ 1;

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(a1, "pu_navigationBarTintColor");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isNavigationBarHidden");
  v15 = objc_msgSend(v13, "_useStandardStatusBarHeight");
  if (v9 != a5 && v10 == v14 && v9 != v10)
    objc_msgSend(v13, "_setUseStandardStatusBarHeight:", 1);
  if (v9)
  {
    objc_msgSend(a1, "_pu_updateStatusBarVisibilityWithAnimationSettings:", a3, a4);
    objc_msgSend(a1, "_pu_setNavigationBarVisible:withAnimationSettings:", v10, a3, a4);
    objc_msgSend(a1, "_pu_setNavigationBarTintColor:withAnimationSettings:", v17, a3, a4);
    objc_msgSend(a1, "_pu_setTabBarVisible:withAnimationSettings:", v12, a3, a4);
    objc_msgSend(a1, "_pu_setToolbarVisible:withAnimationSettings:", v16, a3, a4);
  }
  else
  {
    objc_msgSend(a1, "_pu_setNavigationBarVisible:withAnimationSettings:", v10, a3, a4);
    objc_msgSend(a1, "_pu_setNavigationBarTintColor:withAnimationSettings:", v17, a3, a4);
    objc_msgSend(a1, "_pu_setTabBarVisible:withAnimationSettings:", v12, a3, a4);
    objc_msgSend(a1, "_pu_setToolbarVisible:withAnimationSettings:", v16, a3, a4);
    objc_msgSend(a1, "_pu_updateStatusBarVisibilityWithAnimationSettings:", a3, a4);
  }
  objc_msgSend(v13, "_setUseStandardStatusBarHeight:", v15);

}

- (uint64_t)_pu_updateStatusBarVisibilityWithAnimationSettings:()PhotosUI
{
  uint64_t v5;
  uint64_t v6;
  _QWORD v9[5];

  v5 = 1;
  if (a3 == 2)
    v5 = 2;
  if (a3)
    v6 = v5;
  else
    v6 = 0;
  objc_msgSend(a1, "_pu_setPreferredStatusBarUpdateAnimation:", v6);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__UIViewController_PhotosUI___pu_updateStatusBarVisibilityWithAnimationSettings___block_invoke;
  v9[3] = &unk_1E58ABD10;
  v9[4] = a1;
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v9, *(double *)&a4);
}

- (void)_pu_setNavigationBarVisible:()PhotosUI withAnimationSettings:
{
  BOOL v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  objc_msgSend(a1, "navigationController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v12, "isNavigationBarHidden") == a3;
  v9 = v12;
  if (v8)
  {
    if (a4 == 2)
    {
      v10 = a3 ^ 1u;
      v11 = 1;
    }
    else
    {
      if (a4 != 1)
      {
        if (a4)
          goto LABEL_11;
        objc_msgSend(v12, "setNavigationBarHidden:animated:", a3 ^ 1u, 0, *(double *)&a5);
LABEL_10:
        v9 = v12;
        goto LABEL_11;
      }
      v10 = a3 ^ 1u;
      v11 = 15;
    }
    objc_msgSend(v12, "_setNavigationBarHidden:edge:duration:", v10, v11, *(double *)&a5);
    goto LABEL_10;
  }
LABEL_11:

}

- (void)_pu_setNavigationBarTintColor:()PhotosUI withAnimationSettings:
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v8 = a3;
  objc_msgSend(a1, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "tintColor");
  v11 = objc_claimAutoreleasedReturnValue();
  if ((id)v11 == v8)
  {

  }
  else
  {
    v12 = (void *)v11;
    objc_msgSend(v10, "tintColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", v8);

    if ((v14 & 1) == 0)
    {
      if (a4)
      {
        v15 = *(double *)&a5;
        v16 = (void *)MEMORY[0x1E0DC3F10];
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __82__UIViewController_PhotosUI___pu_setNavigationBarTintColor_withAnimationSettings___block_invoke;
        v19[3] = &unk_1E58ABCA8;
        v20 = v10;
        v21 = v8;
        objc_msgSend(v16, "animateWithDuration:animations:", v19, v15);

      }
      else if (v8)
      {
        objc_msgSend(v10, "setTintColor:", v8);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3A28], "appearance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "tintColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setTintColor:", v18);

      }
    }
  }

}

- (void)_pu_setToolbarVisible:()PhotosUI withAnimationSettings:
{
  BOOL v8;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;

  objc_msgSend(a1, "navigationController");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v16, "isToolbarHidden") == a3;
  v9 = v16;
  if (v8)
  {
    v10 = *(double *)&a5;
    objc_msgSend(v16, "contentScrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "_isAutomaticContentOffsetAdjustmentEnabled");
    objc_msgSend(v11, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
    if (a4 == 2)
    {
      v13 = a3 ^ 1u;
      v14 = v16;
      v15 = 4;
    }
    else
    {
      if (a4 != 1)
      {
        if (!a4)
          objc_msgSend(v16, "setToolbarHidden:animated:", a3 ^ 1u, 0);
        goto LABEL_10;
      }
      v13 = a3 ^ 1u;
      v14 = v16;
      v15 = 15;
    }
    objc_msgSend(v14, "_setToolbarHidden:edge:duration:", v13, v15, v10);
LABEL_10:
    objc_msgSend(v11, "_setAutomaticContentOffsetAdjustmentEnabled:", v12);

    v9 = v16;
  }

}

- (void)_pu_setTabBarVisible:()PhotosUI withAnimationSettings:
{
  unsigned int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  if (a4 == 1)
    v7 = 6;
  else
    v7 = 0;
  if (a4 == 2)
    v8 = 7;
  else
    v8 = v7;
  objc_msgSend(a1, "tabBarController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentScrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_isAutomaticContentOffsetAdjustmentEnabled");
  objc_msgSend(v9, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
  if (a3)
    objc_msgSend(v11, "showBarWithTransition:duration:", v8, *(double *)&a5);
  else
    objc_msgSend(v11, "hideBarWithTransition:duration:", v8, *(double *)&a5);
  objc_msgSend(v9, "_setAutomaticContentOffsetAdjustmentEnabled:", v10);

}

- (void)_pu_setPreferredStatusBarUpdateAnimation:()PhotosUI
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, CFSTR("PUPreferredStatusBarUpdateAnimationAssociationKey"), v2, (void *)1);

}

- (BOOL)pu_isPresenting
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "presentedViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

+ (id)pu_currentViewControllerStack
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (pu_currentViewControllerStack_onceToken != -1)
    dispatch_once(&pu_currentViewControllerStack_onceToken, &__block_literal_global_106208);
  objc_msgSend((id)pu_currentViewControllerStack_window, "rootViewController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "px_topmostPresentedViewController");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
    v3 = (void *)v1;
  else
    v3 = v0;
  v4 = v3;

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v19 = v5;
      do
      {
        objc_msgSend(v6, "firstObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeObjectAtIndex:", 0);
        objc_msgSend(v5, "insertObject:atIndex:", v7, 0);
        objc_msgSend(v7, "childViewControllers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "addObjectsFromArray:", v8);
        }
        else
        {
          v22 = 0u;
          v23 = 0u;
          v20 = 0u;
          v21 = 0u;
          v9 = v8;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v21;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v21 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
                if (objc_msgSend(v14, "isViewLoaded"))
                {
                  objc_msgSend(v14, "view");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "window");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v16 && (objc_msgSend(v16, "isHidden") & 1) == 0)
                    objc_msgSend(v6, "addObject:", v14);

                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
            }
            while (v11);
          }

          v5 = v19;
        }

      }
      while (objc_msgSend(v6, "count"));
    }

    v4 = v18;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
