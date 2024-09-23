@implementation SBHUDHostViewController

void __79___SBHUDHostViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 976);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "HUDViewController", (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setFrame:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

uint64_t __50___SBHUDHostViewController_knownHUDForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

void __59___SBHUDHostViewController_dismissHUD_animated_completion___block_invoke(uint64_t a1, unsigned int a2)
{
  id WeakRetained;
  int v5;
  uint64_t v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "containsObject:", WeakRetained);
    WeakRetained = v7;
    if (a2)
    {
      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 32), "_executeDismissHUD:animated:completion:", v7, 0, *(_QWORD *)(a1 + 40));
LABEL_7:
        WeakRetained = v7;
        goto LABEL_8;
      }
    }
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, a2, WeakRetained);
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __118___SBHUDHostViewController__buildTransitionContextToPresentHUD_dismissHUD_animated_delegate_containerView_completion___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = result;
  if (a2 == 1)
  {
    objc_msgSend(*(id *)(result + 32), "didMoveToParentViewController:", *(_QWORD *)(result + 48));
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(v2 + 40), "hudViewController:didPresentHUD:", *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56));
  }
  else if (!a2)
  {
    objc_msgSend(*(id *)(result + 32), "removeFromParentViewController");
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(v2 + 40), "hudViewController:didDismissHUD:", *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56));
  }
  return result;
}

uint64_t __118___SBHUDHostViewController__buildTransitionContextToPresentHUD_dismissHUD_animated_delegate_containerView_completion___block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = result;
  if (a2 == 1)
  {
    objc_msgSend(*(id *)(result + 32), "removeFromParentViewController");
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(v2 + 48), "hudViewController:didDismissHUD:", *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 56));
  }
  else if (!a2)
  {
    objc_msgSend(*(id *)(result + 32), "didMoveToParentViewController:", *(_QWORD *)(result + 40));
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(v2 + 48), "hudViewController:didPresentHUD:", *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 56));
  }
  return result;
}

uint64_t __70___SBHUDHostViewController__executePresentNewHUD_animated_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  _BOOL8 v3;
  uint64_t result;

  v3 = a2 != 0;
  if (!a2)
    objc_msgSend(*(id *)(a1[4] + 976), "addObject:", a1[5]);
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _BOOL8))(result + 16))(result, v3);
  return result;
}

void __70___SBHUDHostViewController__executePresentNewHUD_animated_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v2, "setFrame:");

  objc_msgSend(*(id *)(a1 + 40), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

}

uint64_t __67___SBHUDHostViewController__executeDismissHUD_animated_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  _BOOL8 v3;
  uint64_t result;

  v3 = a2 == 0;
  if (!a2)
  {
    objc_msgSend(*(id *)(a1[4] + 976), "removeObject:", a1[5]);
    objc_msgSend(*(id *)(a1[4] + 984), "removeObject:", a1[5]);
  }
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _BOOL8))(result + 16))(result, v3);
  return result;
}

void __67___SBHUDHostViewController__executeDismissHUD_animated_completion___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeFromSuperview");

}

@end
