@implementation UISystemAppearanceManager

uint64_t __70___UISystemAppearanceManager_updateScreenEdgesDeferringSystemGestures__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setScreenEdgesDeferringSystemGestures:", *(_QWORD *)(a1 + 32));
}

uint64_t __59___UISystemAppearanceManager_updateHomeIndicatorAutoHidden__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHomeIndicatorAutoHidden:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __106___UISystemAppearanceManager_window_didUpdateSupportedOrientations_preferredOrientation_prefersAnimation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(a1 + 80))
  {
    if (*(_BYTE *)(a1 + 81))
      objc_msgSend(v5, "setSupportedInterfaceOrientations:", *(_QWORD *)(a1 + 48));
    if (*(_BYTE *)(a1 + 82))
      objc_msgSend(v5, "_setDebugValidationOrientationMask:", *(_QWORD *)(a1 + 48));
  }
  if (*(_BYTE *)(a1 + 83) && *(_BYTE *)(a1 + 81))
    objc_msgSend(v5, "setPreferredInterfaceOrientation:", *(_QWORD *)(a1 + 56));
  if (*(_BYTE *)(a1 + 84))
  {
    +[UIView _currentAnimationSettings](UIView, "_currentAnimationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAnimationSettings:", v7);

    objc_msgSend(v6, "animationSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_14;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0D016B0];
    objc_msgSend(*(id *)(a1 + 32), "_rotationDuration");
    objc_msgSend(v10, "settingsWithDuration:timingFunction:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAnimationSettings:", v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAnimationSettings:", v9);
  }

LABEL_14:
  if (*(_BYTE *)(a1 + 81))
  {
    v12 = *(void **)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 64);
    v14 = *(_QWORD *)(a1 + 72);
    v16 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v6, "animationSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_logOrientationPreferencesChangeWithOldSupportedOrientations:newSupportedOrientations:oldPreferredOrientation:newPreferredOrientation:animationSettings:fenced:", v15, v13, v14, v16, v17, *(unsigned __int8 *)(a1 + 85));

  }
  v18 = *(unsigned __int8 *)(a1 + 85);

  return v18;
}

uint64_t __61___UISystemAppearanceManager_updateWhitePointAdaptivityStyle__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setWhitePointAdaptivityStyle:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  return 0;
}

id __40___UISystemAppearanceManager__setScene___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_orientationDebugDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __66___UISystemAppearanceManager_updateMultitaskingDragExclusionRects__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setMultitaskingDragExclusionRects:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
}

@end
