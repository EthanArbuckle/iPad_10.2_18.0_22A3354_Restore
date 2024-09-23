@implementation UITabBarControllerVisualStyle

uint64_t __89___UITabBarControllerVisualStyle_TV__updateOffscreenState_withFocusAnimationCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __89___UITabBarControllerVisualStyle_TV__updateOffscreenState_withFocusAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setHiddenAwaitingFocus:", *(unsigned __int8 *)(a1 + 48));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "setEnabled:", *(unsigned __int8 *)(a1 + 48));
}

uint64_t __89___UITabBarControllerVisualStyle_TV__updateOffscreenState_withFocusAnimationCoordinator___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "_setShadowAlpha:", *(double *)(a1 + 88));
  if (*(_BYTE *)(a1 + 96))
    objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 88));
  return objc_msgSend(*(id *)(a1 + 40), "_layoutViewController:", *(_QWORD *)(a1 + 48));
}

uint64_t __89___UITabBarControllerVisualStyle_TV__updateOffscreenState_withFocusAnimationCoordinator___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setHidesShadow:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_setHiddenAwaitingFocus:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setHidden:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __56___UITabBarControllerVisualStyle_Pad_updateTabBarLayout__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  _BOOL4 v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;

  v2 = *(double *)(a1 + 56);
  v3 = *(double *)(a1 + 64);
  if (v2 <= v3)
    v4 = 1194.0;
  else
    v4 = 1024.0;
  v5 = v2 > v4;
  v6 = *(double *)(a1 + 88);
  if (v6 <= *(double *)(a1 + 96))
    v7 = 1194.0;
  else
    v7 = 1024.0;
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  result = CGRectEqualToRect(*(CGRect *)(&v2 - 2), *MEMORY[0x1E0C9D648]);
  if (((v5 ^ (v6 > v7)) & 1) != 0 || (_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "sidebar");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11 && (*(_BYTE *)(v11 + 16) & 2) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "sidebar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v14, "isHidden") ^ 1;

    }
    else
    {
      v13 = 1;
    }

    objc_msgSend(*(id *)(a1 + 32), "sidebar");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v6 <= v7)
      v17 = 1;
    else
      v17 = v13 ^ 1;
    -[UITabBarControllerSidebar _setHidden:userInitiated:](v15, v17, 0);

    return objc_msgSend(*(id *)(a1 + 32), "_setNeedsContentLayout");
  }
  return result;
}

void __71___UITabBarControllerVisualStyle_Pad__canDisplayTabBarAlongsideSidebar__block_invoke()
{
  id v0;

  _UIMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_1320 = objc_msgSend(&unk_1E1A95270, "containsObject:", v0);

}

uint64_t __86___UITabBarControllerVisualStyle_Pad__updateContentLayoutForSidebarAppearanceIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateSidebarResolvedLayout");
  objc_msgSend(*(id *)(a1 + 40), "setNeedsStatusBarAppearanceUpdate");
  if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_existingView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "layoutIfNeeded");

  }
  result = objc_msgSend(*(id *)(a1 + 40), "_updateLayoutForStatusBarAndInterfaceOrientation");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  return result;
}

@end
