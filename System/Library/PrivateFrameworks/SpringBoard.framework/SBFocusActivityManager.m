@implementation SBFocusActivityManager

- (id)initWithBannerPoster:(void *)a3 systemApertureElementRegistrar:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  SBFocusActivityBannerAuthority *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  _QWORD block[4];
  id v21;
  objc_super v22;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)SBFocusActivityManager;
    a1 = objc_msgSendSuper2(&v22, sel_init);
    if (a1)
    {
      objc_msgSend(MEMORY[0x1E0D22390], "managerWithBannerPoster:systemApertureElementRegistrar:", v5, v6);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)*((_QWORD *)a1 + 6);
      *((_QWORD *)a1 + 6) = v7;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = objc_alloc_init(SBFocusActivityBannerAuthority);
        v10 = (void *)*((_QWORD *)a1 + 12);
        *((_QWORD *)a1 + 12) = v9;

        v11 = *((_QWORD *)a1 + 12);
        +[SBFocusActivityBannerAuthority requesterIdentifier](SBFocusActivityBannerAuthority, "requesterIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "registerAuthority:forRequesterIdentifier:", v11, v12);

      }
      *((_DWORD *)a1 + 6) = 0;
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = dispatch_queue_create("com.apple.springboard.focus-activity-manager.fetch", v13);
      v15 = (void *)*((_QWORD *)a1 + 4);
      *((_QWORD *)a1 + 4) = v14;

      objc_msgSend(MEMORY[0x1E0D1D6B0], "serviceForClientIdentifier:", CFSTR("com.apple.private.SpringBoard.focus.intents"));
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)*((_QWORD *)a1 + 1);
      *((_QWORD *)a1 + 1) = v16;

      objc_msgSend(*((id *)a1 + 1), "addListener:withCompletionHandler:", a1, 0);
      v18 = *((_QWORD *)a1 + 4);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __78__SBFocusActivityManager_initWithBannerPoster_systemApertureElementRegistrar___block_invoke;
      block[3] = &unk_1E8E9DED8;
      a1 = a1;
      v21 = a1;
      dispatch_async(v18, block);

    }
  }

  return a1;
}

void __78__SBFocusActivityManager_initWithBannerPoster_systemApertureElementRegistrar___block_invoke(uint64_t a1)
{
  -[SBFocusActivityManager _availableModesFetchQueue_fetchAvailableModes](*(_QWORD *)(a1 + 32));
}

- (void)_availableModesFetchQueue_fetchAvailableModes
{
  uint64_t v2;
  void *v3;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 8), "availableModesWithError:", 0);
    v2 = objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    v3 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v2;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  }
}

- (BOOL)setFocusWithModeIdentifier:(uint64_t)a1 active:(void *)a2 withReason:(int)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  char v16;
  NSObject *v17;
  _BOOL4 v18;
  id v20;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "activeModeAssertionWithError:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "details");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "modeIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", v5);

    }
    else
    {
      v10 = 0;
    }
    v11 = 0;
    if ((v10 & 1) == 0 && ((a3 ^ 1) & 1) == 0)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0D1D6F8]);
      objc_msgSend(v11, "setIdentifier:", CFSTR("com.apple.private.SpringBoard.focus.intents"));
      objc_msgSend(v11, "setModeIdentifier:", v5);
      objc_msgSend(v11, "setReason:", 1);
      objc_msgSend(MEMORY[0x1E0D1D630], "lifetimeUntilEndOfScheduleWithIdentifier:", *MEMORY[0x1E0D1D3C8]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(v11, "setLifetime:", v12);

    }
    if (v11)
      v13 = a3 ^ 1;
    else
      v13 = 1;
    if ((v10 ^ 1 | a3) == 1 && (v13 & 1) != 0)
    {
      v14 = 0;
    }
    else
    {
      v15 = *(void **)(a1 + 8);
      v20 = 0;
      v16 = objc_msgSend(v15, "activateModeWithDetails:error:", v11, &v20);
      v14 = v20;
      if ((v16 & 1) == 0)
      {
        SBLogFocusModes();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
        if (a3)
        {
          if (v18)
            -[SBFocusActivityManager setFocusWithModeIdentifier:active:withReason:].cold.1();
        }
        else if (v18)
        {
          -[SBFocusActivityManager setFocusWithModeIdentifier:active:withReason:].cold.2();
        }

      }
    }

  }
  return a1 != 0;
}

- (uint64_t)toggleFocusWithModeIdentifier:(void *)a3 withReason:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  int v12;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "activeModeAssertionWithError:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v12 = 1;
    if (v7)
    {
      objc_msgSend(v7, "details");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "modeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", v5);

      if ((v11 & 1) != 0)
        v12 = 0;
    }
    a1 = -[SBFocusActivityManager setFocusWithModeIdentifier:active:withReason:](a1, v5, v12);

  }
  return a1;
}

- (uint64_t)toggleActivityPickerPresentation
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  SBFocusActivityPickerTransientOverlayViewController *v5;
  void *v6;
  _QWORD v8[5];

  v1 = a1;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = *(_QWORD *)(v1 + 40);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __58__SBFocusActivityManager_toggleActivityPickerPresentation__block_invoke;
      v8[3] = &unk_1E8E9DED8;
      v8[4] = v1;
      v4 = objc_msgSend(v2, "dismissTransientOverlayViewController:animated:completion:", v3, 1, v8);
    }
    else
    {
      v5 = objc_alloc_init(SBFocusActivityPickerTransientOverlayViewController);
      v6 = *(void **)(v1 + 40);
      *(_QWORD *)(v1 + 40) = v5;

      objc_msgSend(*(id *)(v1 + 40), "setDelegate:", v1);
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v2, "presentTransientOverlayViewController:animated:completion:", *(_QWORD *)(v1 + 40), 1, 0);
    }
    v1 = v4;

  }
  return v1;
}

void __58__SBFocusActivityManager_toggleActivityPickerPresentation__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (void)focusActivityPickerTransientOverlayViewController:(id)a3 didDismiss:(BOOL)a4
{
  SBFocusActivityPickerTransientOverlayViewController *transientOverlay;

  transientOverlay = self->_transientOverlay;
  self->_transientOverlay = 0;

}

- (id)previewFocusWithModeIdentifier:(void *)a3 withReason:
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  SBSystemActionCompoundPreviewAssertion *v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  id result;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id location;

  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (!a1)
  {
LABEL_20:

    return (id)a1;
  }
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    if (WeakRetained)
    {
      v10 = v6;
      v11 = *MEMORY[0x1E0DAACD0];
      v12 = v10;
      if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DAACD0]))
      {
        v12 = v10;
        if (objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 80)))
        {
          os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
          v13 = *(id *)(a1 + 88);
          os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
          if (v13)
          {
            v12 = v13;
            v14 = v10;
          }
          else
          {
            if ((objc_msgSend(WeakRetained, "isActivityEnabled") & 1) != 0)
            {
              objc_msgSend(WeakRetained, "activityDescription");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "activityIdentifier");
              v12 = (id)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              objc_msgSend(MEMORY[0x1E0D22368], "sharedActivityManager");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "defaultActivity");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "activityIdentifier");
              v12 = (id)objc_claimAutoreleasedReturnValue();

            }
            v14 = v15;
            v13 = 0;
          }

        }
      }
      v16 = objc_msgSend(*(id *)(a1 + 80), "isEqualToString:", v11);
      if (v16 != objc_msgSend(v10, "isEqualToString:", v11)
        || (objc_msgSend(WeakRetained, "activityDescription"),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v17, "activityIdentifier"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = objc_msgSend(v18, "isEqualToString:", v12),
            v18,
            v17,
            (v19 & 1) == 0))
      {
        objc_msgSend(*(id *)(a1 + 64), "invalidateWithReason:", CFSTR("Previewing activity changed"));
        objc_storeWeak((id *)(a1 + 72), 0);
      }

    }
    objc_storeStrong((id *)(a1 + 80), a2);
    objc_initWeak(&location, (id)a1);
    v20 = *(_QWORD *)(a1 + 56);
    if (!v20)
    {
      v21 = [SBSystemActionCompoundPreviewAssertion alloc];
      v22 = MEMORY[0x1E0C809B0];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __68__SBFocusActivityManager_previewFocusWithModeIdentifier_withReason___block_invoke;
      v30[3] = &unk_1E8EABB58;
      objc_copyWeak(&v31, &location);
      v28[0] = v22;
      v28[1] = 3221225472;
      v28[2] = __68__SBFocusActivityManager_previewFocusWithModeIdentifier_withReason___block_invoke_2;
      v28[3] = &unk_1E8EA6158;
      objc_copyWeak(&v29, &location);
      v23 = -[SBSystemActionCompoundPreviewAssertion initWithIdentifier:stateDidChangeBlock:eventHandlingBlock:](v21, CFSTR("FocusActivity"), v30, v28);
      v24 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v23;

      objc_destroyWeak(&v29);
      objc_destroyWeak(&v31);
      v20 = *(_QWORD *)(a1 + 56);
    }
    -[SBSystemActionCompoundPreviewAssertion acquireForReason:](v20, v8);
    a1 = objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&location);

    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("reason != ((void *)0)"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SBFocusActivityManager previewFocusWithModeIdentifier:withReason:].cold.1(sel_previewFocusWithModeIdentifier_withReason_, a1, (uint64_t)v26);
  objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

void __68__SBFocusActivityManager_previewFocusWithModeIdentifier_withReason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBFocusActivityManager _updateFocusElementWithReason:]((uint64_t)WeakRetained, CFSTR("Preview state changed"));

}

- (void)_updateFocusElementWithReason:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  unsigned int v5;
  id v6;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    SBLogFocusModes();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v18 = a1;
      v19 = 2114;
      v20 = v3;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@) Updating focus element for reason: '%{public}@'", buf, 0x16u);
    }

    v5 = -[SBSystemActionCompoundPreviewAssertion state](*(_QWORD *)(a1 + 56));
    v6 = *(id *)(a1 + 64);
    v7 = objc_msgSend(v6, "isValid");
    if (!(v5 & 1) | v7 & 1)
    {
      if ((v5 & 1) == 0 && ((v7 ^ 1) & 1) == 0)
        objc_msgSend(v6, "invalidateWithReason:", v3);
    }
    else
    {
      v8 = objc_msgSend(*(id *)(a1 + 80), "isEqualToString:", *MEMORY[0x1E0DAACD0]);
      v9 = *(void **)(a1 + 48);
      if (v8)
        objc_msgSend(v9, "postPersistentActivityPickerWithSystemApertureElementProvider:", a1);
      else
        objc_msgSend(v9, "postPersistentActivityWithModeIdentifier:systemApertureElementProvider:", *(_QWORD *)(a1 + 80), a1);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v10;

      objc_initWeak((id *)buf, (id)a1);
      v12 = *(void **)(a1 + 64);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __56__SBFocusActivityManager__updateFocusElementWithReason___block_invoke;
      v15[3] = &unk_1E8EABB30;
      objc_copyWeak(&v16, (id *)buf);
      objc_msgSend(v12, "addInvalidationBlock:", v15);
      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    v14 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "setPreviewing:", v5 & 1);
      objc_msgSend(v14, "setUrgent:", HIBYTE(v5) & 1);
      objc_msgSend(v14, "setExpanding:", (v5 >> 8) & 1);
      objc_msgSend(v14, "setProminent:", HIWORD(v5) & 1);
    }

  }
}

void __68__SBFocusActivityManager_previewFocusWithModeIdentifier_withReason___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBFocusActivityManager _handleFocusElementEvent:]((uint64_t)WeakRetained, a3);

}

- (void)_handleFocusElementEvent:(uint64_t)a1
{
  id WeakRetained;

  if (a1)
  {
    if (!a2)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      objc_msgSend(WeakRetained, "pop");

    }
  }
}

- (BOOL)shouldPreviewSystemAction:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  BOOL v9;
  os_unfair_lock_s *p_modesLock;
  NSSet *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  objc_msgSend(a3, "configuredAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasSuffix:", *MEMORY[0x1E0DAACB8]);

  if (v6)
  {
    objc_msgSend(v4, "sb_configuredIntentAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFConfiguredStaccatoIntentAction sb_focusModeIdentifier](v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0DAACD0]) & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      p_modesLock = &self->_modesLock;
      os_unfair_lock_lock(&self->_modesLock);
      v11 = self->_availableModes;
      os_unfair_lock_unlock(p_modesLock);
      if (v11)
      {
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __52__SBFocusActivityManager_shouldPreviewSystemAction___block_invoke;
        v14[3] = &unk_1E8EBAB68;
        v15 = v8;
        -[NSSet bs_firstObjectPassingTest:](v11, "bs_firstObjectPassingTest:", v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v12 != 0;

      }
      else
      {
        v9 = 1;
      }

    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

uint64_t __52__SBFocusActivityManager_shouldPreviewSystemAction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "modeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)createPersistentFocusElementForActivityDescription:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  SBFocusEnablementIndicatorSystemApertureActivityElement *v7;

  v4 = a4;
  v6 = a3;
  v7 = -[SBFocusEnablementIndicatorSystemApertureActivityElement initWithActivityDescription:enabled:]([SBFocusEnablementIndicatorSystemApertureActivityElement alloc], "initWithActivityDescription:enabled:", v6, v4);

  objc_storeWeak((id *)&self->_focusElement, v7);
  return v7;
}

- (id)createPersistentFocusPickerElementForActivityDescription:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  v7 = -[FCUIFocusEnablementIndicatorSystemApertureElement initForPickerWithActivityDescription:enabled:]([SBFocusEnablementIndicatorSystemApertureActivityElement alloc], "initForPickerWithActivityDescription:enabled:", v6, v4);

  objc_storeWeak((id *)&self->_focusElement, v7);
  return v7;
}

- (void)modeSelectionService:(id)a3 didReceiveAvailableModesUpdate:(id)a4
{
  os_unfair_lock_s *p_modesLock;
  id v6;
  NSSet *v7;
  NSSet *availableModes;

  p_modesLock = &self->_modesLock;
  v6 = a4;
  os_unfair_lock_lock(p_modesLock);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v7 = (NSSet *)objc_claimAutoreleasedReturnValue();

  availableModes = self->_availableModes;
  self->_availableModes = v7;

  os_unfair_lock_unlock(p_modesLock);
}

- (void)modeSelectionService:(id)a3 didReceiveUpdatedActiveModeAssertion:(id)a4 stateUpdate:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *activeModeIdentifier;
  id v12;

  v12 = a4;
  v7 = a5;
  os_unfair_lock_lock(&self->_modesLock);
  objc_msgSend(v7, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isActive") & 1) != 0)
  {
    objc_msgSend(v12, "details");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "modeIdentifier");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    activeModeIdentifier = self->_activeModeIdentifier;
    self->_activeModeIdentifier = v10;

  }
  else
  {
    v9 = self->_activeModeIdentifier;
    self->_activeModeIdentifier = 0;
  }

  os_unfair_lock_unlock(&self->_modesLock);
}

void __56__SBFocusActivityManager__updateFocusElementWithReason___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 8) == v5)
  {
    *((_QWORD *)WeakRetained + 8) = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusBannerAuthority, 0);
  objc_storeStrong((id *)&self->_activeModeIdentifier, 0);
  objc_storeStrong((id *)&self->_previewingModeIdentifier, 0);
  objc_destroyWeak((id *)&self->_focusElement);
  objc_storeStrong((id *)&self->_focusElementAssertion, 0);
  objc_storeStrong((id *)&self->_compoundPreviewAssertion, 0);
  objc_storeStrong((id *)&self->_focusEnablementIndicatorManager, 0);
  objc_storeStrong((id *)&self->_transientOverlay, 0);
  objc_storeStrong((id *)&self->_availableModesFetchQueue, 0);
  objc_storeStrong((id *)&self->_availableModes, 0);
  objc_storeStrong((id *)&self->_modeSelectionService, 0);
}

- (void)setFocusWithModeIdentifier:active:withReason:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_8(&dword_1D0540000, v0, v1, "Failed to activate Focus: %{public}@; error: %{public}@");
}

- (void)setFocusWithModeIdentifier:active:withReason:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_8(&dword_1D0540000, v0, v1, "Failed to deactivate Focus: %{public}@; error: %{public}@");
}

- (void)previewFocusWithModeIdentifier:(uint64_t)a3 withReason:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBFocusActivityManager.m");
  v16 = 1024;
  v17 = 417;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
