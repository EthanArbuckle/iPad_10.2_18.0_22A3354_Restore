@implementation PBUIWallpaperWindowSceneSettingsDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  __int16 v38;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a5;
  v18 = a4;
  v19 = objc_opt_class();
  v20 = v14;
  if (v19)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
  }
  else
  {
    v21 = 0;
  }
  v22 = v21;

  objc_msgSend(v18, "settings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_opt_class();
  v25 = v23;
  if (v24)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;
  }
  else
  {
    v26 = 0;
  }
  v27 = v26;

  v28 = objc_opt_class();
  v29 = v15;
  if (v28)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v30 = v29;
    else
      v30 = 0;
  }
  else
  {
    v30 = 0;
  }
  v31 = v30;

  if (v22)
  {
    if (v27)
      goto LABEL_18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBUIWallpaperWindowSceneSettingsDiffAction.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("windowScene"));

    if (v27)
      goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBUIWallpaperWindowSceneSettingsDiffAction.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("windowSceneSettings"));

LABEL_18:
  v38 = 0;
  -[PBUIWallpaperWindowSceneSettingsDiffAction _wallpaperSceneSettingsDiffInspector](self, "_wallpaperSceneSettingsDiffInspector");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "inspectDiff:withContext:", v17, &v38);

  if (v38)
  {
    v35 = v22;
    v36 = v27;
    v37 = v31;
    _UISceneSettingsDiffActionPerformChangesWithTransitionContext();

  }
}

void __156__PBUIWallpaperWindowSceneSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t a1)
{
  __int16 v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = *(_WORD *)(a1 + 56);
  if ((v2 & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "lockscreenWallpaperContentsRect");
    objc_msgSend(v3, "_updateLockscreenWallpaperContentsRect:");
    v2 = *(_WORD *)(a1 + 56);
    if ((v2 & 2) == 0)
    {
LABEL_3:
      if ((v2 & 4) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((v2 & 2) == 0)
  {
    goto LABEL_3;
  }
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "lockscreenWallpaperAlpha");
  objc_msgSend(v4, "_updateLockscreenWallpaperAlpha:");
  v2 = *(_WORD *)(a1 + 56);
  if ((v2 & 4) == 0)
  {
LABEL_4:
    if ((v2 & 8) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "homescreenWallpaperAlpha");
  objc_msgSend(v5, "_updateHomescreenWallpaperAlpha:");
  v2 = *(_WORD *)(a1 + 56);
  if ((v2 & 8) == 0)
  {
LABEL_5:
    if ((v2 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "lockscreenOnlyWallpaperAlpha");
  objc_msgSend(v6, "_updateLockscreenOnlyWallpaperAlpha:");
  v2 = *(_WORD *)(a1 + 56);
  if ((v2 & 0x10) == 0)
  {
LABEL_6:
    if ((v2 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(*(id *)(a1 + 32), "_updateDisallowRasterizationForHomescreen:lockscreen:", objc_msgSend(*(id *)(a1 + 40), "disallowHomescreenRasterization"), objc_msgSend(*(id *)(a1 + 40), "disallowLockscreenRasterization"));
  v2 = *(_WORD *)(a1 + 56);
  if ((v2 & 0x20) == 0)
  {
LABEL_7:
    if ((v2 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(*(id *)(a1 + 32), "_updateWallpaperHiddenForHomescreen:lockscreen:", objc_msgSend(*(id *)(a1 + 40), "homescreenWallpaperHidden"), objc_msgSend(*(id *)(a1 + 40), "lockscreenWallpaperHidden"));
  v2 = *(_WORD *)(a1 + 56);
  if ((v2 & 0x40) == 0)
  {
LABEL_8:
    if ((v2 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(*(id *)(a1 + 32), "_updateWallpaperAnimationSuspended:", objc_msgSend(*(id *)(a1 + 40), "wallpaperAnimationSuspended"));
  v2 = *(_WORD *)(a1 + 56);
  if ((v2 & 0x80) == 0)
  {
LABEL_9:
    if ((v2 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(*(id *)(a1 + 32), "_updateWallpaperRequired:", objc_msgSend(*(id *)(a1 + 40), "wallpaperRequired"));
  v2 = *(_WORD *)(a1 + 56);
  if ((v2 & 0x100) == 0)
  {
LABEL_10:
    if ((v2 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(*(id *)(a1 + 32), "_updateHomescreenStyleChangesDelayed:", objc_msgSend(*(id *)(a1 + 40), "homescreenStyleChangesDelayed"));
  v2 = *(_WORD *)(a1 + 56);
  if ((v2 & 0x200) == 0)
  {
LABEL_11:
    if ((v2 & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "homescreenStyleTransitionState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "homescreenStyleTransitionState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_updateHomescreenStyleTransitionStateTo:from:", v8, v9);

  v2 = *(_WORD *)(a1 + 56);
  if ((v2 & 0x400) == 0)
  {
LABEL_12:
    if ((v2 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_26;
  }
LABEL_25:
  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "lockscreenStyleTransitionState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "lockscreenStyleTransitionState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_updateHomescreenStyleTransitionStateTo:from:", v11, v12);

  v2 = *(_WORD *)(a1 + 56);
  if ((v2 & 0x800) == 0)
  {
LABEL_13:
    if ((v2 & 0x1000) == 0)
      return;
LABEL_27:
    objc_msgSend(*(id *)(a1 + 32), "_updateLiveWallpaperInteractive:", objc_msgSend(*(id *)(a1 + 40), "liveWallpaperInteractive"));
    return;
  }
LABEL_26:
  objc_msgSend(*(id *)(a1 + 32), "_updateLiveWallpaperTouchActive:", objc_msgSend(*(id *)(a1 + 40), "liveWallpaperTouchActive"));
  if ((*(_WORD *)(a1 + 56) & 0x1000) != 0)
    goto LABEL_27;
}

- (id)_wallpaperSceneSettingsDiffInspector
{
  PBUIWallpaperWindowSceneSettingsDiffInspector *wallpaperSceneSettingsDiffInspector;
  PBUIWallpaperWindowSceneSettingsDiffInspector *v4;
  PBUIWallpaperWindowSceneSettingsDiffInspector *v5;

  wallpaperSceneSettingsDiffInspector = self->_wallpaperSceneSettingsDiffInspector;
  if (!wallpaperSceneSettingsDiffInspector)
  {
    v4 = objc_alloc_init(PBUIWallpaperWindowSceneSettingsDiffInspector);
    v5 = self->_wallpaperSceneSettingsDiffInspector;
    self->_wallpaperSceneSettingsDiffInspector = v4;

    -[PBUIWallpaperWindowSceneSettingsDiffInspector observeLockscreenWallpaperContentsRectWithBlock:](self->_wallpaperSceneSettingsDiffInspector, "observeLockscreenWallpaperContentsRectWithBlock:", &__block_literal_global_11);
    -[PBUIWallpaperWindowSceneSettingsDiffInspector observeLockscreenWallpaperAlphaWithBlock:](self->_wallpaperSceneSettingsDiffInspector, "observeLockscreenWallpaperAlphaWithBlock:", &__block_literal_global_12_0);
    -[PBUIWallpaperWindowSceneSettingsDiffInspector observeHomescreenWallpaperAlphaWithBlock:](self->_wallpaperSceneSettingsDiffInspector, "observeHomescreenWallpaperAlphaWithBlock:", &__block_literal_global_13);
    -[PBUIWallpaperWindowSceneSettingsDiffInspector observeLockscreenOnlyWallpaperAlphaWithBlock:](self->_wallpaperSceneSettingsDiffInspector, "observeLockscreenOnlyWallpaperAlphaWithBlock:", &__block_literal_global_14_0);
    -[PBUIWallpaperWindowSceneSettingsDiffInspector observeDisallowHomescreenRasterizationWithBlock:](self->_wallpaperSceneSettingsDiffInspector, "observeDisallowHomescreenRasterizationWithBlock:", &__block_literal_global_15);
    -[PBUIWallpaperWindowSceneSettingsDiffInspector observeDisallowLockscreenRasterizationWithBlock:](self->_wallpaperSceneSettingsDiffInspector, "observeDisallowLockscreenRasterizationWithBlock:", &__block_literal_global_16);
    -[PBUIWallpaperWindowSceneSettingsDiffInspector observeHomescreenWallpaperHiddenWithBlock:](self->_wallpaperSceneSettingsDiffInspector, "observeHomescreenWallpaperHiddenWithBlock:", &__block_literal_global_17);
    -[PBUIWallpaperWindowSceneSettingsDiffInspector observeLockscreenWallpaperHiddenWithBlock:](self->_wallpaperSceneSettingsDiffInspector, "observeLockscreenWallpaperHiddenWithBlock:", &__block_literal_global_18);
    -[PBUIWallpaperWindowSceneSettingsDiffInspector observeWallpaperAnimationSuspendedWithBlock:](self->_wallpaperSceneSettingsDiffInspector, "observeWallpaperAnimationSuspendedWithBlock:", &__block_literal_global_19);
    -[PBUIWallpaperWindowSceneSettingsDiffInspector observeWallpaperRequiredWithBlock:](self->_wallpaperSceneSettingsDiffInspector, "observeWallpaperRequiredWithBlock:", &__block_literal_global_20);
    -[PBUIWallpaperWindowSceneSettingsDiffInspector observeHomescreenStyleChangesDelayedWithBlock:](self->_wallpaperSceneSettingsDiffInspector, "observeHomescreenStyleChangesDelayedWithBlock:", &__block_literal_global_21);
    -[PBUIWallpaperWindowSceneSettingsDiffInspector observeHomescreenStyleTransitionStateWithBlock:](self->_wallpaperSceneSettingsDiffInspector, "observeHomescreenStyleTransitionStateWithBlock:", &__block_literal_global_22);
    -[PBUIWallpaperWindowSceneSettingsDiffInspector observeLockscreenStyleTransitionStateWithBlock:](self->_wallpaperSceneSettingsDiffInspector, "observeLockscreenStyleTransitionStateWithBlock:", &__block_literal_global_23);
    -[PBUIWallpaperWindowSceneSettingsDiffInspector observeLiveWallpaperTouchActiveWithBlock:](self->_wallpaperSceneSettingsDiffInspector, "observeLiveWallpaperTouchActiveWithBlock:", &__block_literal_global_24);
    -[PBUIWallpaperWindowSceneSettingsDiffInspector observeLiveWallpaperInteractiveWithBlock:](self->_wallpaperSceneSettingsDiffInspector, "observeLiveWallpaperInteractiveWithBlock:", &__block_literal_global_25);
    wallpaperSceneSettingsDiffInspector = self->_wallpaperSceneSettingsDiffInspector;
  }
  return wallpaperSceneSettingsDiffInspector;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke(uint64_t a1, _WORD *a2)
{
  *a2 |= 1u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_2(uint64_t a1, _WORD *a2)
{
  *a2 |= 2u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_3(uint64_t a1, _WORD *a2)
{
  *a2 |= 4u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_4(uint64_t a1, _WORD *a2)
{
  *a2 |= 8u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_5(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x10u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_6(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x10u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_7(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x20u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_8(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x20u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_9(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x40u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_10(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x80u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_11(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x100u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_12(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x200u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_13(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x400u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_14(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x800u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_15(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x1000u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperSceneSettingsDiffInspector, 0);
}

@end
