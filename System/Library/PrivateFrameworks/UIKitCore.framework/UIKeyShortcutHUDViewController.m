@implementation UIKeyShortcutHUDViewController

void __86___UIKeyShortcutHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;
  CGSize v14;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "isCompletelyPresented"))
  {
    _UIKeyShortcutHUDLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "size");
      NSStringFromCGSize(v14);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCGSize(*(CGSize *)(a1 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v6;
      v11 = 2114;
      v12 = v7;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "Dismissing HUD due to VC resize: oldSize=%{public}@, newSize=%{public}@", (uint8_t *)&v9, 0x16u);

    }
    objc_msgSend(v3, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "keyShortcutHUDViewControllerDidRequestDismissal:", v3);

  }
}

void __63___UIKeyShortcutHUDViewController_setHidden_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  __int128 *v4;
  __int128 v5;
  void *v6;
  double v7;
  void *v8;
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 40))
      v4 = &_UIKeyShortcutHUDAnimationShrunkTransform;
    else
      v4 = (__int128 *)MEMORY[0x1E0C9BAA8];
    v5 = v4[1];
    v10 = *v4;
    v11 = v5;
    v12 = v4[2];
    objc_msgSend(WeakRetained, "hudContainerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v10;
    v9[1] = v11;
    v9[2] = v12;
    objc_msgSend(v6, "setTransform:", v9);

    if (*(_BYTE *)(a1 + 40))
      v7 = 0.0;
    else
      v7 = 1.0;
    objc_msgSend(v3, "hudContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", v7);

  }
}

void __63___UIKeyShortcutHUDViewController_setHidden_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (!*(_BYTE *)(a1 + 48))
      *((_BYTE *)WeakRetained + 970) = 1;
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      v5 = v3;
      (*(void (**)(void))(v4 + 16))();
      v3 = v5;
    }
  }

}

void __57___UIKeyShortcutHUDViewController_handleModelKeyCommand___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  _QWORD *v4;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = *(_QWORD **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v4, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keyShortcutHUDViewController:didSelectShortcut:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    v6 = (void *)v4[129];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57___UIKeyShortcutHUDViewController_handleModelKeyCommand___block_invoke_2;
    v8[3] = &unk_1E16B2218;
    v8[4] = v4;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v6, "flashCategoryAtIndex:completionHandler:", a3, v8);

  }
}

void __57___UIKeyShortcutHUDViewController_handleModelKeyCommand___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyShortcutHUDViewController:didSelectShortcut:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __66___UIKeyShortcutHUDViewController__focusTopSearchResultWithDelay___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "isSearching"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setNextFocusUpdatePrefersTopSearchResult:", 1);
    objc_msgSend(*(id *)(a1 + 32), "toolbarVC");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchBar");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "searchTextField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsFocusUpdate");

  }
}

uint64_t __66___UIKeyShortcutHUDViewController__focusTopSearchResultWithDelay___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      if (*(_BYTE *)(a1 + 41))
        v3 = 1.0;
      else
        v3 = 0.0;
    }
    else
    {
      v3 = 1.0;
    }
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "menuVC");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", v3);

    WeakRetained = v6;
  }

}

void __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  char v9;
  char v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layoutIfNeeded");

    if (!*(_BYTE *)(a1 + 56))
      goto LABEL_11;
    if (*(_BYTE *)(a1 + 57))
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_3;
      v7[3] = &unk_1E16B4E20;
      v7[4] = v6;
      v9 = 1;
      v8 = *(id *)(a1 + 32);
      v10 = *(_BYTE *)(a1 + 58);
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v7);
      objc_msgSend(*(id *)(a1 + 40), "_focusTopSearchResultWithDelay:", 1);

      if (!*(_BYTE *)(a1 + 56))
      {
LABEL_11:
        if (*(_BYTE *)(a1 + 59))
        {
          objc_msgSend(v6, "menuVC");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setSearching:", *(unsigned __int8 *)(a1 + 56));

          objc_msgSend(v6, "_updateDisplayedMenuForCurrentHeldModifierFlagsAnimated:", *(unsigned __int8 *)(a1 + 58));
        }
      }
    }
    objc_msgSend(v6, "toolbarVC");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSearching:", *(unsigned __int8 *)(a1 + 56));

    WeakRetained = v6;
  }

}

uint64_t __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "menuVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSearching:", *(unsigned __int8 *)(a1 + 48));

  return objc_msgSend(*(id *)(a1 + 32), "_setDisplayedMenu:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 49));
}

void __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *(_BYTE *)(a1 + 40) && !*(_BYTE *)(a1 + 41))
  {
    v7 = WeakRetained;
    if (!a2)
    {
      objc_msgSend(WeakRetained, "metrics");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "hiddenMenuPanelHeight");
      objc_msgSend(v7, "_setMenuHeight:");

    }
    objc_msgSend(v7, "menuVC");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSearching:", *(unsigned __int8 *)(a1 + 40));

    WeakRetained = v7;
  }

}

void __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "menuVC");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "didCompleteSearchTransition");

    objc_msgSend(v4, "toolbarVC");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didCompleteSearchTransition");

    WeakRetained = v4;
  }

}

uint64_t __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77___UIKeyShortcutHUDViewController_toolbarViewController_didUpdateSearchText___block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 40))
      v3 = 1.0;
    else
      v3 = 0.0;
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "menuVC");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", v3);

    WeakRetained = v6;
  }

}

void __77___UIKeyShortcutHUDViewController_toolbarViewController_didUpdateSearchText___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!a2 && WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_setMenuHeight:", *(double *)(a1 + 48));
    objc_msgSend(v5, "_setMenuWidth:", *(double *)(a1 + 56));
    objc_msgSend(v5, "_setDisplayedMenu:animated:", *(_QWORD *)(a1 + 32), 0);
    WeakRetained = v5;
  }

}

@end
