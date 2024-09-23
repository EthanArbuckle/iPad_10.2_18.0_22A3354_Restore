@implementation PBUIWallpaperWindowSceneVariantSettingsDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;

  v13 = a3;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = objc_opt_class();
  v18 = v13;
  if (v17)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
  }
  else
  {
    v19 = 0;
  }
  v20 = v19;

  objc_msgSend(v16, "settings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_opt_class();
  v23 = v21;
  if (v22)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;
  }
  else
  {
    v24 = 0;
  }
  v25 = v24;

  if (v20)
  {
    if (v25)
      goto LABEL_13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBUIWallpaperWindowSceneVariantSettingsDiffAction.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("windowScene"));

    if (v25)
      goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBUIWallpaperWindowSceneVariantSettingsDiffAction.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("windowSceneSettings"));

LABEL_13:
  v36 = 0;
  -[PBUIWallpaperWindowSceneVariantSettingsDiffAction _wallpaperVariantSceneSettingsDiffInspector](self, "_wallpaperVariantSceneSettingsDiffInspector");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "inspectDiff:withContext:", v15, &v36);

  if ((v36 & 1) != 0)
  {
    objc_msgSend(v14, "animationFence");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_synchronizeDrawingWithFence:", v27);

    v28 = objc_opt_class();
    v29 = v14;
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

    if (v31)
    {
      objc_msgSend(v31, "inAnimationSettings");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "outAnimationSettings");
    }
    else
    {
      objc_msgSend(v29, "animationSettings");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "animationSettings");
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "_updateWallpaperVariant:inAnimationSettings:outAnimationSettings:", objc_msgSend(v25, "wallpaperVariant"), v32, v33);
  }

}

- (id)_wallpaperVariantSceneSettingsDiffInspector
{
  PBUIWallpaperWindowSceneSettingsDiffInspector *wallpaperVariantSceneSettingsDiffInspector;
  PBUIWallpaperWindowSceneSettingsDiffInspector *v4;
  PBUIWallpaperWindowSceneSettingsDiffInspector *v5;

  wallpaperVariantSceneSettingsDiffInspector = self->_wallpaperVariantSceneSettingsDiffInspector;
  if (!wallpaperVariantSceneSettingsDiffInspector)
  {
    v4 = objc_alloc_init(PBUIWallpaperWindowSceneSettingsDiffInspector);
    v5 = self->_wallpaperVariantSceneSettingsDiffInspector;
    self->_wallpaperVariantSceneSettingsDiffInspector = v4;

    -[PBUIWallpaperWindowSceneSettingsDiffInspector observeWallpaperVariantWithBlock:](self->_wallpaperVariantSceneSettingsDiffInspector, "observeWallpaperVariantWithBlock:", &__block_literal_global_8);
    wallpaperVariantSceneSettingsDiffInspector = self->_wallpaperVariantSceneSettingsDiffInspector;
  }
  return wallpaperVariantSceneSettingsDiffInspector;
}

void __96__PBUIWallpaperWindowSceneVariantSettingsDiffAction__wallpaperVariantSceneSettingsDiffInspector__block_invoke(uint64_t a1, _BYTE *a2)
{
  *a2 |= 1u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperVariantSceneSettingsDiffInspector, 0);
}

@end
