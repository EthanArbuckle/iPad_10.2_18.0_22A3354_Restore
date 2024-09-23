@implementation UIIdleModeController

uint64_t __51___UIIdleModeController__enterIdleModeWithOptions___block_invoke(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 40) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_postWillEnterNotification");
  return objc_msgSend(*(id *)(a1 + 32), "_animatePresentation");
}

uint64_t __50___UIIdleModeController__exitIdleModeWithOptions___block_invoke(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 40) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_postWillExitNotification");
  return objc_msgSend(*(id *)(a1 + 32), "_animateDismissal");
}

void __50___UIIdleModeController__exitIdleModeWithOptions___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *(_QWORD *)(a1 + 40) == WeakRetained[2])
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_completeDismissal");
    WeakRetained = v3;
  }

}

uint64_t __66___UIIdleModeController__applyPresentationLayoutAttributesToViews__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2048, a2, a3, 0.0, 0.0);
}

void __66___UIIdleModeController__applyPresentationLayoutAttributesToViews__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
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
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "keyEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_applyLayoutAttributes:toView:", v8, v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

uint64_t __63___UIIdleModeController__applyDismissalLayoutAttributesToViews__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2048, a2, a3, 0.0, 0.0);
}

void __63___UIIdleModeController__applyDismissalLayoutAttributesToViews__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
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
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "keyEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_applyLayoutAttributes:toView:", v8, v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

uint64_t __63___UIIdleModeController__recordLayoutAttributesStartingAtView___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v3 = a2;
  objc_msgSend(v3, "_idleModeLayoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKey:", v4, v3);
    v5 = *(_QWORD **)(a1 + 32);
    v6 = (void *)v5[9];
    objc_msgSend(v5, "_originalAttributesForView:comparedToIdleModeAttributes:", v3, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, v3);

    if (*(id *)(a1 + 40) == v3 || objc_msgSend(v3, "containsView:"))
    {
      objc_msgSend(v4, "wantsDimmingOverlay");
    }
    else
    {
      v10 = objc_msgSend(*(id *)(a1 + 40), "containsView:", v3);
      if (objc_msgSend(v4, "wantsDimmingOverlay") && (v10 & 1) == 0)
      {
        objc_msgSend(v3, "layer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "filters");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = v12;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D20], "array");
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        v15 = v14;

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKey:", v15, v3);
      }
    }
    v8 = *(id *)(a1 + 40);
    if (v8 == v3 || objc_msgSend(v8, "containsView:", v3))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

  return 1;
}

@end
