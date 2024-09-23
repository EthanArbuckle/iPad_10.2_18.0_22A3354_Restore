@implementation SBFLegacyWallpaperWakeAnimator

- (void)setWakeEffectView:(id)a3
{
  id WeakRetained;
  void *v5;
  int64_t wakeState;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_wakeEffectView);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_wakeEffectView, obj);
    v5 = obj;
    wakeState = self->_wakeState;
    if (wakeState)
    {
      self->_wakeState = 0;
      -[SBFLegacyWallpaperWakeAnimator updateWakeEffectsForWake:animated:completion:](self, "updateWakeEffectsForWake:animated:completion:", wakeState == 2, 0, 0);
      v5 = obj;
    }
  }

}

- (void)updateWakeEffectsForWake:(BOOL)a3
{
  -[SBFLegacyWallpaperWakeAnimator updateWakeEffectsForWake:animated:completion:](self, "updateWakeEffectsForWake:animated:completion:", a3, 0, 0);
}

- (void)updateWakeEffectsForWake:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  void (**v8)(id, uint64_t);
  int64_t v9;
  int64_t v10;
  NSObject *v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  void (**v39)(id, uint64_t);
  int64_t v40;
  uint8_t buf[4];
  _BOOL4 v42;
  __int16 v43;
  _BOOL4 v44;
  __int16 v45;
  __CFString *v46;
  __int16 v47;
  __CFString *v48;
  uint64_t v49;

  v5 = a4;
  v6 = a3;
  v49 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, uint64_t))a5;
  v9 = -[SBFLegacyWallpaperWakeAnimator _targetWakeStateForFadeIn:](self, "_targetWakeStateForFadeIn:", v6);
  v10 = -[SBFLegacyWallpaperWakeAnimator wakeState](self, "wakeState");
  SBLogScreenWake();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v27 = CFSTR("unknown");
    if (v10 == 1)
      v27 = CFSTR("sleep");
    if (v10 == 2)
      v27 = CFSTR("awake");
    v28 = v27;
    v29 = CFSTR("unknown");
    if (v9 == 1)
      v29 = CFSTR("sleep");
    if (v9 == 2)
      v29 = CFSTR("awake");
    v30 = v29;
    *(_DWORD *)buf = 67109890;
    v42 = v6;
    v43 = 1024;
    v44 = v5;
    v45 = 2112;
    v46 = v28;
    v47 = 2112;
    v48 = v30;
    _os_log_debug_impl(&dword_18AB69000, v11, OS_LOG_TYPE_DEBUG, "updateWakeEffectsForWake:%{BOOL}d animated:%{BOOL}d (%@ -> %@)", buf, 0x22u);

  }
  if (v9 != v10)
  {
    -[SBFLegacyWallpaperWakeAnimator setWakeState:](self, "setWakeState:", v9);
    WeakRetained = objc_loadWeakRetained((id *)&self->_wakeEffectView);
    if (!v5)
    {
      -[SBFLegacyWallpaperWakeAnimator _wakeEffectsForAnimatingWakeState:](self, "_wakeEffectsForAnimatingWakeState:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setBackgroundEffects:", v13);
      -[SBFLegacyWallpaperWakeAnimator _wakeEffectsForPersistentWakeState:](self, "_wakeEffectsForPersistentWakeState:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setBackgroundEffects:", v17);
      if (v8)
        v8[2](v8, 1);
      goto LABEL_15;
    }
    -[SBFLegacyWallpaperWakeAnimator _wakeEffectsForAnimatingWakeState:](self, "_wakeEffectsForAnimatingWakeState:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFLegacyWallpaperWakeAnimator _wakeEffectsForAnimatingWakeState:](self, "_wakeEffectsForAnimatingWakeState:", v9);
    v14 = objc_claimAutoreleasedReturnValue();
    -[SBFLegacyWallpaperWakeAnimator _wakeEffectsForPersistentWakeState:](self, "_wakeEffectsForPersistentWakeState:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBFWakeAnimationDomain rootSettings](SBFWakeAnimationDomain, "rootSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v32 = (void *)v14;
    if (v9 == 2)
    {
      objc_msgSend(v16, "awakeWallpaperFilterSettings");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v9 != 1)
      {
        v19 = 0;
        goto LABEL_14;
      }
      objc_msgSend(v16, "sleepWallpaperFilterSettings");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v19 = (void *)v18;
LABEL_14:
    objc_msgSend(WeakRetained, "setHidden:", 0);
    objc_msgSend(WeakRetained, "setBackgroundEffects:", v13);
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __79__SBFLegacyWallpaperWakeAnimator_updateWakeEffectsForWake_animated_completion___block_invoke;
    v36[3] = &unk_1E200F5E0;
    v40 = v9;
    v36[4] = self;
    v37 = v15;
    v20 = WeakRetained;
    v38 = v20;
    v39 = v8;
    v31 = v15;
    v21 = (void *)MEMORY[0x18D774178](v36);
    v22 = (void *)MEMORY[0x1E0D01908];
    objc_msgSend(v19, "BSAnimationSettings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "factoryWithSettings:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x1E0D01908];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __79__SBFLegacyWallpaperWakeAnimator_updateWakeEffectsForWake_animated_completion___block_invoke_2;
    v33[3] = &unk_1E200E2A0;
    v34 = v20;
    v35 = v32;
    v26 = v32;
    objc_msgSend(v25, "animateWithFactory:options:actions:completion:", v24, 4, v33, v21);

LABEL_15:
    goto LABEL_16;
  }
  if (v8)
    v8[2](v8, 1);
LABEL_16:

}

uint64_t __79__SBFLegacyWallpaperWakeAnimator_updateWakeEffectsForWake_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "wakeState") == *(_QWORD *)(a1 + 64))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "count"))
      objc_msgSend(*(id *)(a1 + 48), "setBackgroundEffects:", *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(*(id *)(a1 + 48), "setHidden:", objc_msgSend(*(id *)(a1 + 32), "_shouldHideWakeEffectViewAfterUpdate"));
  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __79__SBFLegacyWallpaperWakeAnimator_updateWakeEffectsForWake_animated_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundEffects:", *(_QWORD *)(a1 + 40));
}

- (void)removeAllWakeEffects
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_wakeEffectView);
  objc_msgSend(WeakRetained, "setBackgroundEffects:", MEMORY[0x1E0C9AA60]);

}

- (int64_t)_targetWakeStateForFadeIn:(BOOL)a3
{
  if (a3)
    return 2;
  else
    return 1;
}

- (id)_wakeEffectsForAnimatingWakeState:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  +[SBFWakeAnimationDomain rootSettings](SBFWakeAnimationDomain, "rootSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
  {
    if (a3 == 2)
    {
      v6 = (void *)MEMORY[0x1E0CEA480];
      objc_msgSend(v4, "awakeColorBrightness");
    }
    else
    {
      if (a3 != 1)
      {
        v8 = 0;
        goto LABEL_9;
      }
      v6 = (void *)MEMORY[0x1E0CEA480];
      objc_msgSend(v4, "sleepColorBrightness");
    }
    objc_msgSend(v6, "colorEffectBrightness:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v10[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v7 = (void *)MEMORY[0x1E0C9AA60];
LABEL_10:

  return v7;
}

- (id)_wakeEffectsForPersistentWakeState:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  +[SBFWakeAnimationDomain rootSettings](SBFWakeAnimationDomain, "rootSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 == 1
    && (v6 = (void *)MEMORY[0x1E0CEA480],
        objc_msgSend(v4, "sleepColorBrightness"),
        objc_msgSend(v6, "colorEffectBrightness:"),
        (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = (void *)v7;
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (BOOL)_shouldHideWakeEffectViewAfterUpdate
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (int64_t)wakeState
{
  return self->_wakeState;
}

- (void)setWakeState:(int64_t)a3
{
  self->_wakeState = a3;
}

- (UIVisualEffectView)wakeEffectView
{
  return (UIVisualEffectView *)objc_loadWeakRetained((id *)&self->_wakeEffectView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_wakeEffectView);
}

@end
