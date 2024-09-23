@implementation UINavigationBarContentView

BOOL __78___UINavigationBarContentView__updateNavItemContentLayoutGuideEdgeConstraints__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  _BOOL8 v9;
  _QWORD *v10;

  v5 = a2;
  v6 = v5;
  if (!v5)
    goto LABEL_9;
  v7 = (id)objc_msgSend(v5, "secondItem");
  v8 = *(_QWORD *)(a1 + 32);
  if (*(unsigned __int8 *)(v8 + 565) != a3)
  {
    if (v7 == (_QWORD *)v8)
    {
      if (!*(_BYTE *)(a1 + 40))
      {
        v10 = (_QWORD *)v7[59];
        goto LABEL_12;
      }
    }
    else if (v7 == *(_QWORD **)(v8 + 472))
    {
      v10 = v7;
      if (*(_BYTE *)(a1 + 40))
      {
        v9 = 0;
        goto LABEL_10;
      }
LABEL_12:
      v9 = v7 == v10;
      goto LABEL_10;
    }
LABEL_9:
    v9 = 1;
    goto LABEL_10;
  }
  v9 = v7 != (_QWORD *)v8;
LABEL_10:

  return v9;
}

uint64_t __58___UINavigationBarContentView__runAllScheduledAnimations___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 552);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v7 = _Block_copy(*(const void **)(*((_QWORD *)&v12 + 1) + 8 * v9));

        (*((void (**)(void *, uint64_t))v7 + 2))(v7, a2);
        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 736), "setKeepsSnapshotsInHierarchy:", 0, (_QWORD)v12);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 736), "removeAllSnapshots");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "removeAllObjects");
}

uint64_t __58___UINavigationBarContentView__runAllScheduledAnimations___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void (**v5)(_QWORD);
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 544);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      v8 = v5;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v5 = (void (**)(_QWORD))_Block_copy(*(const void **)(*((_QWORD *)&v10 + 1) + 8 * v7));

        v5[2](v5);
        ++v7;
        v8 = v5;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "removeAllObjects", (_QWORD)v10);
}

void __52___UINavigationBarContentView_setHostedTabBarFrame___block_invoke(double *a1, void *a2)
{
  double v3;
  id v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  id v11;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", v3);

  v6 = a1[5];
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", v6);

  v8 = a1[6];
  objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setConstant:", v8);

  v10 = a1[7];
  objc_msgSend(v4, "objectAtIndexedSubscript:", 3);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setConstant:", v10);
}

void __64___UINavigationBarContentView__setupStaticNavBarButtonAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_triggerActionForEvent:", 0);

}

void __64___UINavigationBarContentView__setupStaticNavBarButtonAnimated___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_triggerActionForEvent:", 0);

}

void __54___UINavigationBarContentView_resolvedHeightDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 576));
  objc_msgSend(WeakRetained, "navigationBarContentViewDidChangeDesiredHeight:", *(_QWORD *)(a1 + 32));

  *(_WORD *)(*(_QWORD *)(a1 + 32) + 560) &= ~2u;
}

@end
