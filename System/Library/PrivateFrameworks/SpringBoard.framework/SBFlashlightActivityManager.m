@implementation SBFlashlightActivityManager

- (void)flashlightAvailabilityDidChange:(BOOL)a3
{
  id v4;

  NSStringFromSelector(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFlashlightActivityManager _updateFlashlightElementsForReason:]((uint64_t)self, v4);

}

- (void)_updateFlashlightElementsForReason:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  int canTurnFlashlight;
  _BOOL4 v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  int v12;
  id WeakRetained;
  int v14;
  NSObject *v15;
  NSObject *v16;
  SBFlashlightActivityElement *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  SBDynamicFlashlightActivityElement *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!a1 || !*(_BYTE *)(a1 + 80))
    goto LABEL_42;
  SBLogFlashlightHUD();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v39 = a1;
    v40 = 2114;
    v41 = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@) Updating flashlight elements for reason: '%{public}@'", buf, 0x16u);
  }

  v5 = *(id *)(a1 + 96);
  v35 = v5;
  if (v5)
    v6 = objc_msgSend(v5, "level");
  else
    v6 = 0;
  canTurnFlashlight = -[SBFlashlightActivityManager _canTurnFlashlightOn](a1);
  v8 = v6 != 0;
  v9 = -[SBSystemActionCompoundPreviewAssertion state](*(_QWORD *)(a1 + 32));
  v10 = v9;
  v11 = v8 | canTurnFlashlight ^ 1;
  v12 = v8 | v11 ^ 1;
  if ((v11 & 1) == 0 && (v9 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    v12 = objc_msgSend(WeakRetained, "shouldRemainActiveWhileFlashlightIsOff");

  }
  v14 = objc_msgSend(*(id *)(a1 + 40), "isValid");
  if (((v12 ^ 1 | v14) & 1) == 0)
  {
    SBLogFlashlightHUD();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v39 = a1;
      v40 = 2114;
      v41 = v3;
      _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "(%{public}@) Creating flashlight activity for reason: '%{public}@'", buf, 0x16u);
    }

    if (*(_BYTE *)(a1 + 81))
    {
      v17 = (SBFlashlightActivityElement *)objc_loadWeakRetained((id *)(a1 + 24));
      if (v17)
      {
        SBLogFlashlightHUD();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[SBFlashlightActivityManager _updateFlashlightElementsForReason:].cold.1(a1, (uint64_t)v17, v18);

      }
      else
      {
        v34 = [SBDynamicFlashlightActivityElement alloc];
        -[SBFlashlightActivityManager _dynamicFlashlightState](a1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(id *)(a1 + 88);
        objc_msgSend(v20, "coverSheetViewController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(*(id *)(a1 + 96), "isBeamWidthSupported");

        v17 = -[SBDynamicFlashlightActivityElement initWithState:coverSheetViewController:fixedWidth:](v34, "initWithState:coverSheetViewController:fixedWidth:", v19, v21, v22 ^ 1u);
        -[SBFlashlightActivityElement setDelegate:](v17, "setDelegate:", a1);
        objc_storeWeak((id *)(a1 + 24), v17);
      }
    }
    else
    {
      v17 = -[SBFlashlightActivityElement initWithFlashlightOn:]([SBFlashlightActivityElement alloc], "initWithFlashlightOn:", v6 != 0);
      -[SBFlashlightActivityElement setDelegate:](v17, "setDelegate:", a1);
      objc_storeWeak((id *)(a1 + 8), v17);
    }
    objc_msgSend(*(id *)(a1 + 88), "systemApertureController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "registerElement:", v17);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v24;

    objc_initWeak((id *)buf, (id)a1);
    v26 = *(void **)(a1 + 40);
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __66__SBFlashlightActivityManager__updateFlashlightElementsForReason___block_invoke;
    v36[3] = &unk_1E8EABB30;
    objc_copyWeak(&v37, (id *)buf);
    objc_msgSend(v26, "addInvalidationBlock:", v36);
    objc_destroyWeak(&v37);
    objc_destroyWeak((id *)buf);

LABEL_27:
    if (!canTurnFlashlight)
      goto LABEL_32;
LABEL_28:
    if (objc_msgSend(*(id *)(a1 + 48), "isValid"))
    {
      SBLogFlashlightHUD();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v39 = a1;
        v40 = 2114;
        v41 = v3;
        _os_log_impl(&dword_1D0540000, v27, OS_LOG_TYPE_DEFAULT, "(%{public}@) Invalidating flashlight-unavailable alert for reason: '%{public}@'", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 48), "invalidateWithReason:", v3);
    }
    goto LABEL_32;
  }
  if (((v12 | v14 ^ 1) & 1) != 0)
    goto LABEL_27;
  SBLogFlashlightHUD();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v39 = a1;
    v40 = 2114;
    v41 = v3;
    _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "(%{public}@) Invalidating flashlight activity for reason: '%{public}@'", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "invalidateWithReason:", v3);
  if ((canTurnFlashlight & 1) != 0)
    goto LABEL_28;
  -[SBFlashlightActivityManager _showFlashlightUnavailableAlertForReason:](a1, v3);
LABEL_32:
  v28 = objc_loadWeakRetained((id *)(a1 + 8));
  v29 = v28;
  if (v28)
  {
    objc_msgSend(v28, "setFlashlightOn:", v6 != 0);
    objc_msgSend(v29, "setPreviewing:", v10 & 1);
    objc_msgSend(v29, "setUrgent:", HIBYTE(v10) & 1);
    objc_msgSend(v29, "setExpanding:", (v10 >> 8) & 1);
    objc_msgSend(v29, "setProminent:", HIWORD(v10) & 1);
  }
  v30 = objc_loadWeakRetained((id *)(a1 + 16));
  v31 = v30;
  if (v30)
    objc_msgSend(v30, "setProminent:", HIWORD(v10) & 1);
  v32 = objc_loadWeakRetained((id *)(a1 + 24));
  if (v32)
  {
    -[SBFlashlightActivityManager _dynamicFlashlightState](a1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFlashlightState:", v33);
    objc_msgSend(v32, "setPreviewing:", v10 & 1);
    objc_msgSend(v32, "setUrgent:", HIBYTE(v10) & 1);
    objc_msgSend(v32, "setExpanding:", (v10 >> 8) & 1);
    objc_msgSend(v32, "setProminent:", HIWORD(v10) & 1);
    if (objc_msgSend(v33, "isOn") && !*(_BYTE *)(a1 + 64))
      objc_msgSend(v32, "takeAlertingAssertionWithReason:", CFSTR("SBFlashlightActivityManager: state -> on"));
    *(_BYTE *)(a1 + 64) = objc_msgSend(v33, "isOn");

  }
LABEL_42:

}

- (uint64_t)_canTurnFlashlightOn
{
  id v1;
  void *v2;
  uint64_t v3;

  if (!a1)
    return 0;
  v1 = *(id *)(a1 + 96);
  v2 = v1;
  if (v1 && objc_msgSend(v1, "isAvailable"))
    v3 = objc_msgSend(v2, "isOverheated") ^ 1;
  else
    v3 = 0;

  return v3;
}

- (uint64_t)initWithWindowScene:(void *)a3 flashlightController:
{
  id v6;
  id v7;
  id *v8;
  char v9;
  uint64_t v10;
  uint64_t result;
  void *v12;
  objc_super v13;

  v6 = a2;
  v7 = a3;
  if (!a1)
    goto LABEL_15;
  if (v6)
  {
    v13.receiver = (id)a1;
    v13.super_class = (Class)SBFlashlightActivityManager;
    v8 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = (uint64_t)v8;
    if (v8)
    {
      objc_storeStrong(v8 + 11, a2);
      objc_storeStrong((id *)(a1 + 96), a3);
      v9 = 1;
      v10 = SBFEffectiveArtworkSubtype();
      if (v10 > 2795)
      {
        if (v10 == 2796 || v10 == 2868)
          goto LABEL_11;
      }
      else if (v10 == 2556 || v10 == 2622)
      {
        goto LABEL_11;
      }
      v9 = 0;
LABEL_11:
      *(_BYTE *)(a1 + 80) = v9;
      *(_BYTE *)(a1 + 81) = objc_msgSend(v7, "deviceSupportsDynamicFlashlightInterface");
      if (v7)
      {
        if (*(_BYTE *)(a1 + 80))
          objc_msgSend(v7, "addObserver:", a1);
      }
      -[SBFlashlightActivityManager _updateFlashlightElementsForReason:](a1, CFSTR("Initialization"));
    }
LABEL_15:

    return a1;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("windowScene != ((void *)0)"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SBFlashlightActivityManager initWithWindowScene:flashlightController:].cold.1(sel_initWithWindowScene_flashlightController_);
  objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BOOL)shouldShowUIForFlashlightLevel
{
  if (result)
    return *(_BYTE *)(result + 80) != 0;
  return result;
}

- (BOOL)isFlashlightOn
{
  if (result)
    return objc_msgSend(*(id *)(result + 96), "level") != 0;
  return result;
}

- (id)previewFlashlightActivityForReason:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  SBSystemActionCompoundPreviewAssertion *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id result;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  v3 = a2;
  v4 = v3;
  if (!a1)
  {
LABEL_8:

    return (id)a1;
  }
  if (v3)
  {
    if (*(_BYTE *)(a1 + 80))
    {
      objc_initWeak(&location, (id)a1);
      v5 = *(_QWORD *)(a1 + 32);
      if (!v5)
      {
        v6 = [SBSystemActionCompoundPreviewAssertion alloc];
        v7 = MEMORY[0x1E0C809B0];
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __66__SBFlashlightActivityManager_previewFlashlightActivityForReason___block_invoke;
        v14[3] = &unk_1E8EABB58;
        objc_copyWeak(&v15, &location);
        v12[0] = v7;
        v12[1] = 3221225472;
        v12[2] = __66__SBFlashlightActivityManager_previewFlashlightActivityForReason___block_invoke_2;
        v12[3] = &unk_1E8EA6158;
        objc_copyWeak(&v13, &location);
        v8 = -[SBSystemActionCompoundPreviewAssertion initWithIdentifier:stateDidChangeBlock:eventHandlingBlock:](v6, CFSTR("FlashlightActivity"), v14, v12);
        v9 = *(void **)(a1 + 32);
        *(_QWORD *)(a1 + 32) = v8;

        objc_destroyWeak(&v13);
        objc_destroyWeak(&v15);
        v5 = *(_QWORD *)(a1 + 32);
      }
      -[SBSystemActionCompoundPreviewAssertion acquireForReason:](v5, v4);
      a1 = objc_claimAutoreleasedReturnValue();
      objc_destroyWeak(&location);
    }
    else
    {
      a1 = 0;
    }
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("reason != ((void *)0)"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SBFlashlightActivityManager previewFlashlightActivityForReason:].cold.1(sel_previewFlashlightActivityForReason_);
  objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

void __66__SBFlashlightActivityManager_previewFlashlightActivityForReason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBFlashlightActivityManager _updateFlashlightPreviewForReason:]((uint64_t)WeakRetained, CFSTR("Preview state changed"));

}

- (void)_updateFlashlightPreviewForReason:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  if (a1)
  {
    v5 = v3;
    v4 = SBFEffectiveArtworkSubtype();
    if (v4 > 2795)
    {
      if (v4 != 2796 && v4 != 2868)
        goto LABEL_11;
    }
    else if (v4 != 2556 && v4 != 2622)
    {
LABEL_11:
      if ((-[SBSystemActionCompoundPreviewAssertion state](*(_QWORD *)(a1 + 32)) & 1) != 0)
        -[SBFlashlightActivityManager _presentBanner](a1);
      else
        -[SBFlashlightActivityManager _dismissBanner]((id *)a1);
      goto LABEL_9;
    }
    -[SBFlashlightActivityManager _updateFlashlightElementsForReason:](a1, v5);
LABEL_9:
    v3 = v5;
  }

}

void __66__SBFlashlightActivityManager_previewFlashlightActivityForReason___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  -[SBFlashlightActivityManager _handleFlashlightElementsEvent:](WeakRetained, a3);

}

- (void)_handleFlashlightElementsEvent:(id *)a1
{
  id WeakRetained;
  id v4;
  id v5;

  if (a1)
  {
    if (!a2)
    {
      WeakRetained = objc_loadWeakRetained(a1 + 1);
      objc_msgSend(WeakRetained, "pop");

      v4 = objc_loadWeakRetained(a1 + 2);
      objc_msgSend(v4, "pop");

      v5 = objc_loadWeakRetained(a1 + 3);
      objc_msgSend(v5, "pop");

    }
  }
}

- (uint64_t)toggleFlashlightForReason:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t result;
  void *v7;

  v3 = a2;
  v4 = v3;
  if (!a1)
  {
LABEL_9:

    return a1;
  }
  if (v3)
  {
    if ((-[SBFlashlightActivityManager _canTurnFlashlightOn](a1) & 1) != 0)
    {
      v5 = *(id *)(a1 + 96);
      if (objc_msgSend(v5, "level"))
        objc_msgSend(v5, "turnFlashlightOffForReason:withCoolDown:", v4, 1);
      else
        objc_msgSend(v5, "turnFlashlightOnForReason:", v4);

      a1 = 1;
    }
    else
    {
      -[SBFlashlightActivityManager _showFlashlightUnavailableAlertForReason:](a1, v4);
      a1 = 0;
    }
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("reason != ((void *)0)"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SBFlashlightActivityManager toggleFlashlightForReason:].cold.1(sel_toggleFlashlightForReason_);
  objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)_showFlashlightUnavailableAlertForReason:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1 && *(_BYTE *)(a1 + 80))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    objc_msgSend(WeakRetained, "alertHost");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertAssertion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v5) = objc_msgSend(v6, "isValid");
    SBLogFlashlightHUD();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v5)
    {
      if (v8)
      {
        *(_DWORD *)buf = 138543618;
        v17 = a1;
        v18 = 2114;
        v19 = v3;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@) Resetting invalidation timer for flashlight-unavailable alert for reason: '%{public}@'", buf, 0x16u);
      }

      objc_msgSend(v6, "resetAutomaticInvalidationTimer");
    }
    else
    {
      if (v8)
      {
        *(_DWORD *)buf = 138543618;
        v17 = a1;
        v18 = 2114;
        v19 = v3;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@) Showing flashlight-unavailable alert for reason: '%{public}@'", buf, 0x16u);
      }

      +[SBFlashlightAlertElement flashlightUnavailableAlert](SBFlashlightAlertElement, "flashlightUnavailableAlert");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)(a1 + 16), v9);
      objc_msgSend(*(id *)(a1 + 88), "systemApertureController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "registerElement:", v9);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v11;

      objc_initWeak((id *)buf, (id)a1);
      v13 = *(void **)(a1 + 48);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __72__SBFlashlightActivityManager__showFlashlightUnavailableAlertForReason___block_invoke;
      v14[3] = &unk_1E8EABB30;
      objc_copyWeak(&v15, (id *)buf);
      objc_msgSend(v13, "addInvalidationBlock:", v14);
      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);

    }
  }

}

- (void)flashlightLevelDidChange:(unint64_t)a3
{
  id v4;

  NSStringFromSelector(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFlashlightActivityManager _updateFlashlightElementsForReason:]((uint64_t)self, v4);

}

- (void)flashlightOverheatedDidChange:(BOOL)a3
{
  id v4;

  NSStringFromSelector(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFlashlightActivityManager _updateFlashlightElementsForReason:]((uint64_t)self, v4);

}

- (void)flashlightActivityElementRequestsTogglingFlashlight:(id)a3
{
  -[SBFlashlightActivityManager toggleFlashlightForReason:]((uint64_t)self, CFSTR("Element requested"));
}

- (void)dynamicFlashlightActivityElementDidChangeIntensity:(double)a3 width:(double)a4 animated:(BOOL)a5
{
  if (self)
    self = (SBFlashlightActivityManager *)self->_flashlightController;
  -[SBFlashlightActivityManager setIntensity:width:animated:](self, "setIntensity:width:animated:", a5, a3, a4);
}

- (void)dynamicFlashlightActivityElementRequestsTogglingFlashlight
{
  -[SBFlashlightActivityManager toggleFlashlightForReason:]((uint64_t)self, CFSTR("Dynamic element requested"));
}

- (void)dynamicFlashlightActivityElementDidCollapse
{
  -[SBFlashlightActivityManager _updateFlashlightElementsForReason:]((uint64_t)self, CFSTR("Dynamic element collapse"));
}

- (void)dynamicFlashlightActivityElementDidUpdatePersistedIntensity:(double)a3 width:(double)a4
{
  if (self)
    self = (SBFlashlightActivityManager *)self->_flashlightController;
  *(float *)&a3 = a3;
  *(float *)&a4 = a4;
  -[SBFlashlightActivityManager storeFlashlightIntensity:width:](self, "storeFlashlightIntensity:width:", a3, a4);
}

- (id)_dynamicFlashlightState
{
  id v1;
  float v2;
  double v3;
  float v4;
  void *v5;

  if (a1)
  {
    v1 = *(id *)(a1 + 96);
    objc_msgSend(v1, "intensity");
    v3 = v2;
    if (BSFloatIsZero())
    {
      +[SBDynamicFlashlightState offState](SBDynamicFlashlightState, "offState");
    }
    else
    {
      objc_msgSend(v1, "width");
      +[SBDynamicFlashlightState onStateWithInitialIntensity:width:](SBDynamicFlashlightState, "onStateWithInitialIntensity:width:", v3, v4);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_presentBanner
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id *v7;
  SBFlashlightPreviewPresentableViewController *WeakRetained;
  SBFlashlightPreviewPresentableViewController *v9;
  _BOOL4 v10;
  SBFlashlightPreviewPresentableViewController *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)SBApp, "bannerManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!*(_QWORD *)(a1 + 72))
    {
      v3 = objc_opt_new();
      v4 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v3;

      v5 = *(_QWORD *)(a1 + 72);
      +[SBFlashlightPreviewPresentableViewController requesterIdentifier](SBFlashlightPreviewPresentableViewController, "requesterIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "registerAuthority:forRequesterIdentifier:", v5, v6);

    }
    v7 = (id *)(a1 + 56);
    WeakRetained = (SBFlashlightPreviewPresentableViewController *)objc_loadWeakRetained((id *)(a1 + 56));
    v9 = WeakRetained;
    if (!WeakRetained
      || (v10 = -[SBFlashlightPreviewPresentableViewController isFlashlightOn](WeakRetained, "isFlashlightOn"),
          v10 != (objc_msgSend(*(id *)(a1 + 96), "level") != 0)))
    {
      v11 = -[SBFlashlightPreviewPresentableViewController initWithFlashlightOn:]([SBFlashlightPreviewPresentableViewController alloc], "initWithFlashlightOn:", objc_msgSend(*(id *)(a1 + 96), "level") != 0);

      objc_storeWeak(v7, v11);
      v13 = *MEMORY[0x1E0DACA18];
      v14[0] = &unk_1E91D1718;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "postPresentable:withOptions:userInfo:error:", v11, 1, v12, 0);

      v9 = v11;
    }

  }
}

- (id)_dismissBanner
{
  id *v1;
  void *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;

  if (result)
  {
    v1 = result;
    objc_msgSend((id)SBApp, "bannerManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0D010A0];
    v1 += 7;
    WeakRetained = objc_loadWeakRetained(v1);
    objc_msgSend(v3, "uniqueIdentificationForPresentable:", WeakRetained);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v2, "revokePresentablesWithIdentification:reason:options:userInfo:error:", v5, CFSTR("action preview banner dismissed"), 0, 0, 0);

    return (id *)objc_storeWeak(v1, 0);
  }
  return result;
}

void __66__SBFlashlightActivityManager__updateFlashlightElementsForReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *WeakRetained;
  id *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained && WeakRetained[5] == v8)
  {
    WeakRetained[5] = 0;

    objc_msgSend(v7[12], "turnFlashlightOffForReason:withCoolDown:", v5, 1);
  }

}

void __72__SBFlashlightActivityManager__showFlashlightUnavailableAlertForReason___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[6];
    WeakRetained[6] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

- (BOOL)shouldShowDynamicFlashlightUI
{
  if (result)
    return *(_BYTE *)(result + 81) != 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flashlightController, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_bannerAuthority, 0);
  objc_destroyWeak((id *)&self->_flashlightPreviewPresentableViewController);
  objc_storeStrong((id *)&self->_flashlightUnavailableAlertAssertion, 0);
  objc_storeStrong((id *)&self->_flashlightActivityAssertion, 0);
  objc_storeStrong((id *)&self->_compoundPreviewAssertion, 0);
  objc_destroyWeak((id *)&self->_dynamicFlashlightActivityElement);
  objc_destroyWeak((id *)&self->_flashlightUnavailableAlertElement);
  objc_destroyWeak((id *)&self->_flashlightActivityElement);
}

- (void)initWithWindowScene:(const char *)a1 flashlightController:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_updateFlashlightElementsForReason:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_debug_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEBUG, "(%{public}@) Recycling existing flashlight activity %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)previewFlashlightActivityForReason:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)toggleFlashlightForReason:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
