@implementation SBVolumeHardwareButtonActions

- (void)volumeIncreasePressDownWithModifiers:(int64_t)a3
{
  self->_volumeIncreaseIsDown = 1;
  -[SBVolumeHardwareButtonActions _handleVolumeButtonDownForIncrease:modifiers:](self, "_handleVolumeButtonDownForIncrease:modifiers:", 1, a3);
}

- (void)volumeIncreasePressUp
{
  if (self->_volumeIncreaseIsDown)
  {
    self->_volumeIncreaseIsDown = 0;
    -[SBVolumeHardwareButtonActions _handleVolumeButtonUpForIncrease:](self, "_handleVolumeButtonUpForIncrease:", 1);
  }
}

- (void)volumeDecreasePressDownWithModifiers:(int64_t)a3
{
  self->_volumeDecreaseIsDown = 1;
  -[SBVolumeHardwareButtonActions _handleVolumeButtonDownForIncrease:modifiers:](self, "_handleVolumeButtonDownForIncrease:modifiers:", 0, a3);
}

- (void)volumeDecreasePressUp
{
  if (self->_volumeDecreaseIsDown)
  {
    self->_volumeDecreaseIsDown = 0;
    -[SBVolumeHardwareButtonActions _handleVolumeButtonUpForIncrease:](self, "_handleVolumeButtonUpForIncrease:", 0);
  }
}

- (void)cancelVolumePress
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogButtonsVolume();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "canceling volume button presses", v4, 2u);
  }

  -[SBVolumeHardwareButtonActions volumeIncreasePressUp](self, "volumeIncreasePressUp");
  -[SBVolumeHardwareButtonActions volumeDecreasePressUp](self, "volumeDecreasePressUp");
}

- (void)addVolumePressBandit:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSHashTable *volumePressBandits;
  NSHashTable *v8;
  NSHashTable *v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogButtonsVolume();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v10 = 138543362;
    *(_QWORD *)&v10[4] = objc_opt_class();
    v6 = *(id *)&v10[4];
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "bandit added: %{public}@", v10, 0xCu);

  }
  volumePressBandits = self->_volumePressBandits;
  if (!volumePressBandits)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_volumePressBandits;
    self->_volumePressBandits = v8;

    volumePressBandits = self->_volumePressBandits;
  }
  -[NSHashTable addObject:](volumePressBandits, "addObject:", v4, *(_OWORD *)v10);

}

- (void)removeVolumePressBandit:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogButtonsVolume();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = (id)objc_opt_class();
    v6 = v8;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "bandit removed: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  -[NSHashTable removeObject:](self->_volumePressBandits, "removeObject:", v4);

}

- (void)_sendBanditsVolumeIncreased
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[NSHashTable copy](self->_volumePressBandits, "copy");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        SBLogButtonsVolume();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v17 = v10;
          v11 = v10;
          _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "sending volume increase to bandit: %{public}@", buf, 0xCu);

        }
        objc_msgSend(v8, "handleVolumeIncrease");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v5);
  }

}

- (void)_sendBanditsVolumeDecreased
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[NSHashTable copy](self->_volumePressBandits, "copy");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        SBLogButtonsVolume();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v17 = v10;
          v11 = v10;
          _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "sending volume decrease to bandit: %{public}@", buf, 0xCu);

        }
        objc_msgSend(v8, "handleVolumeDecrease");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v5);
  }

}

- (BOOL)_sendVolumeButtonToSBUIControllerForIncrease:(BOOL)a3 down:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a4;
  v5 = a3;
  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    v8 = 102;
  else
    v8 = 103;
  objc_msgSend(v6, "handleVolumeButtonWithType:down:", v8, v4);

  return 1;
}

- (BOOL)_handleVolumeIncreaseUp
{
  void (**volumeIncreaseUpEventBlock)(id, SEL);
  id v4;

  volumeIncreaseUpEventBlock = (void (**)(id, SEL))self->_volumeIncreaseUpEventBlock;
  if (volumeIncreaseUpEventBlock)
  {
    volumeIncreaseUpEventBlock[2](self->_volumeIncreaseUpEventBlock, a2);
    v4 = self->_volumeIncreaseUpEventBlock;
    self->_volumeIncreaseUpEventBlock = 0;

  }
  return volumeIncreaseUpEventBlock != 0;
}

- (BOOL)_handleVolumeDecreaseUp
{
  void (**volumeDecreaseUpEventBlock)(id, SEL);
  id v4;

  volumeDecreaseUpEventBlock = (void (**)(id, SEL))self->_volumeDecreaseUpEventBlock;
  if (volumeDecreaseUpEventBlock)
  {
    volumeDecreaseUpEventBlock[2](self->_volumeDecreaseUpEventBlock, a2);
    v4 = self->_volumeDecreaseUpEventBlock;
    self->_volumeDecreaseUpEventBlock = 0;

  }
  return volumeDecreaseUpEventBlock != 0;
}

- (BOOL)_handleVolumeButtonUpForIncrease:(BOOL)a3
{
  NSObject *v5;

  if (a3)
  {
    if (-[SBVolumeHardwareButtonActions _handleVolumeIncreaseUp](self, "_handleVolumeIncreaseUp"))
      return 1;
  }
  else if (-[SBVolumeHardwareButtonActions _handleVolumeDecreaseUp](self, "_handleVolumeDecreaseUp"))
  {
    return 1;
  }
  SBLogButtonsVolume();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[SBVolumeHardwareButtonActions _handleVolumeButtonUpForIncrease:].cold.1(a3, v5);

  return 0;
}

- (id)_sendVolumeButtonDownToSpringBoardInternalUIForIncrease:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = a3;
  objc_msgSend((id)SBApp, "windowSceneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeDisplayWindowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transientOverlayPresentationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transientOverlayPresenterForWindowScene:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v3)
  {
    if ((objc_msgSend(v9, "handleVolumeUpButtonPress") & 1) == 0)
    {
LABEL_3:
      v11 = 0;
      v12 = 0;
      goto LABEL_6;
    }
  }
  else if (!objc_msgSend(v9, "handleVolumeDownButtonPress"))
  {
    goto LABEL_3;
  }
  v12 = CFSTR("SystemApertureController");
  v11 = 1;
LABEL_6:
  objc_msgSend((id)SBApp, "bannerManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((v11 & 1) == 0)
  {
    objc_msgSend(v13, "bannerWindowInWindowScene:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "windowLevel");
    v16 = objc_msgSend(v8, "hasPresentationAboveWindowLevel:");

    if ((v16 & 1) != 0)
    {
      if ((objc_msgSend(v8, "canHandleButtonEvents") & 1) == 0)
        goto LABEL_21;
      if (!v3)
      {
LABEL_19:
        if ((objc_msgSend(v8, "handleVolumeDownButtonPress") & 1) != 0)
          goto LABEL_20;
        goto LABEL_21;
      }
LABEL_14:
      if ((objc_msgSend(v8, "handleVolumeUpButtonPress") & 1) != 0)
      {
LABEL_20:
        v12 = CFSTR("TransientOverlayPresenter");
        goto LABEL_29;
      }
LABEL_21:
      +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lockScreenEnvironment");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "buttonEventsHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        if ((objc_msgSend(v19, "handleVolumeUpButtonPress") & 1) != 0)
        {
LABEL_23:
          v12 = CFSTR("LockScreenEnvironment");
LABEL_28:

          goto LABEL_29;
        }
      }
      else if ((objc_msgSend(v19, "handleVolumeDownButtonPress") & 1) != 0)
      {
        goto LABEL_23;
      }

      +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v20;
      if (v3)
      {
        if ((objc_msgSend(v20, "handleVolumeUpButtonPress") & 1) != 0)
        {
LABEL_27:
          v12 = CFSTR("Switcher");
          goto LABEL_28;
        }
      }
      else if ((objc_msgSend(v20, "handleVolumeDownButtonPress") & 1) != 0)
      {
        goto LABEL_27;
      }

      v21 = 0;
      goto LABEL_30;
    }
    if (v3)
    {
      if ((objc_msgSend(v14, "handleVolumeUpButtonPress") & 1) == 0)
      {
        if ((objc_msgSend(v8, "canHandleButtonEvents") & 1) == 0)
          goto LABEL_21;
        goto LABEL_14;
      }
    }
    else if ((objc_msgSend(v14, "handleVolumeDownButtonPress") & 1) == 0)
    {
      if ((objc_msgSend(v8, "canHandleButtonEvents") & 1) == 0)
        goto LABEL_21;
      goto LABEL_19;
    }
    v12 = CFSTR("BannerManager");
  }
LABEL_29:
  objc_msgSend(CFSTR("SpringBoard Internal UI: "), "stringByAppendingString:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:

  return v21;
}

- (id)_sendVolumeButtonDownToLegacyRegisteredClientsForIncrease:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  id *v16;
  void *v17;
  id volumeIncreaseUpEventBlock;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)SBApp, "appsRegisteredForVolumeEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && SBWorkspaceHasApplicationSceneInLockedOrUnlockedEnvironmentLayoutStateMatchingApplication(v6))
  {
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("Legacy Registered Client: "), "stringByAppendingString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "processState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "pid");
    if (v3)
      v12 = 102;
    else
      v12 = 103;
    SBSendFakeButtonPressEventToApplication(v9, v11, v12, 1);

    SBLogButtonsVolume();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v14)
      {
        objc_msgSend(v6, "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v15;
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "sent volume increase down to %{public}@", buf, 0xCu);

      }
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __91__SBVolumeHardwareButtonActions__sendVolumeButtonDownToLegacyRegisteredClientsForIncrease___block_invoke;
      v24[3] = &unk_1E8E9DED8;
      v16 = &v25;
      v25 = v6;
      v17 = (void *)objc_msgSend(v24, "copy");
      volumeIncreaseUpEventBlock = self->_volumeIncreaseUpEventBlock;
      self->_volumeIncreaseUpEventBlock = v17;
    }
    else
    {
      if (v14)
      {
        objc_msgSend(v6, "bundleIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v19;
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "sent volume decrease down to %{public}@", buf, 0xCu);

      }
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __91__SBVolumeHardwareButtonActions__sendVolumeButtonDownToLegacyRegisteredClientsForIncrease___block_invoke_26;
      v22[3] = &unk_1E8E9DED8;
      v16 = &v23;
      v23 = v6;
      v20 = (void *)objc_msgSend(v22, "copy");
      volumeIncreaseUpEventBlock = self->_volumeDecreaseUpEventBlock;
      self->_volumeDecreaseUpEventBlock = v20;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __91__SBVolumeHardwareButtonActions__sendVolumeButtonDownToLegacyRegisteredClientsForIncrease___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogButtonsVolume();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = v2;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "sending volume increase up to previous down receipient: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "processState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBSendFakeButtonPressEventToApplication(v2, objc_msgSend(v4, "pid"), 102, 0);

}

void __91__SBVolumeHardwareButtonActions__sendVolumeButtonDownToLegacyRegisteredClientsForIncrease___block_invoke_26(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogButtonsVolume();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = v2;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "sending volume decrease up to previous down receipient: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "processState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBSendFakeButtonPressEventToApplication(v2, objc_msgSend(v4, "pid"), 103, 0);

}

- (id)_sendVolumeButtonDownToSoundControllerForIncrease:(BOOL)a3
{
  void *v3;
  int v4;

  +[SBSoundController sharedInstance](SBSoundController, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "handleVolumeButtonDownEvent");

  if (v4)
    return CFSTR("SBSoundController");
  else
    return 0;
}

- (id)_sendVolumeButtonDownToSBUIControllerForIncrease:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  id volumeIncreaseUpEventBlock;
  void *v9;
  id volumeDecreaseUpEventBlock;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  SBLogButtonsVolume();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "decrease";
    if (v3)
      v6 = "increase";
    *(_DWORD *)buf = 136446210;
    v17 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SBUIController will process %{public}s down event", buf, 0xCu);
  }

  -[SBVolumeHardwareButtonActions _sendVolumeButtonToSBUIControllerForIncrease:down:](self, "_sendVolumeButtonToSBUIControllerForIncrease:down:", v3, 1);
  objc_initWeak((id *)buf, self);
  if (v3)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __82__SBVolumeHardwareButtonActions__sendVolumeButtonDownToSBUIControllerForIncrease___block_invoke;
    v14[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v15, (id *)buf);
    v7 = (void *)objc_msgSend(v14, "copy");
    volumeIncreaseUpEventBlock = self->_volumeIncreaseUpEventBlock;
    self->_volumeIncreaseUpEventBlock = v7;

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __82__SBVolumeHardwareButtonActions__sendVolumeButtonDownToSBUIControllerForIncrease___block_invoke_32;
    v12[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v13, (id *)buf);
    v9 = (void *)objc_msgSend(v12, "copy");
    volumeDecreaseUpEventBlock = self->_volumeDecreaseUpEventBlock;
    self->_volumeDecreaseUpEventBlock = v9;

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  return CFSTR("SBUIController");
}

void __82__SBVolumeHardwareButtonActions__sendVolumeButtonDownToSBUIControllerForIncrease___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  SBLogButtonsVolume();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "SBUIController will process increase up event", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_sendVolumeButtonToSBUIControllerForIncrease:down:", 1, 0);

}

void __82__SBVolumeHardwareButtonActions__sendVolumeButtonDownToSBUIControllerForIncrease___block_invoke_32(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  SBLogButtonsVolume();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "SBUIController will process decrease up event", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_sendVolumeButtonToSBUIControllerForIncrease:down:", 0, 0);

}

- (void)_launchVolumeSettings
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  SBLogButtonsVolume();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "launching volume prefs", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=Sounds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBWorkspaceActivateApplicationFromURL(v3, 0, 0);

}

- (id)_sendVolumeButtonDownToOverridingSceneForIncrease:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  objc_class *v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  BOOL v22;
  id location;
  _QWORD v24[4];
  id v25;
  char v26;

  v3 = a3;
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "physicalButtonSceneOverrideManager");
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  -[SBPhysicalButtonSceneOverrideManager sendVolumeButtonDownForIncrease:shouldAlsoChangeVolume:](v6, v3, &v26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __83__SBVolumeHardwareButtonActions__sendVolumeButtonDownToOverridingSceneForIncrease___block_invoke;
    v24[3] = &unk_1E8E9DED8;
    v25 = v8;
    v11 = (void *)objc_msgSend(v24, "copy");
    if (v26)
    {
      -[SBVolumeHardwareButtonActions _sendVolumeButtonToSBUIControllerForIncrease:down:](self, "_sendVolumeButtonToSBUIControllerForIncrease:down:", v3, 1);
      objc_msgSend(v9, "stringByAppendingString:", CFSTR(" + SBUIController"));
      v12 = objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      v19[0] = v10;
      v19[1] = 3221225472;
      v19[2] = __83__SBVolumeHardwareButtonActions__sendVolumeButtonDownToOverridingSceneForIncrease___block_invoke_2;
      v19[3] = &unk_1E8EBDEE8;
      v13 = (id)objc_msgSend(v11, "copy");
      v20 = v13;
      objc_copyWeak(&v21, &location);
      v22 = v3;
      v14 = objc_msgSend(v19, "copy");

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
      v11 = (void *)v14;
      v9 = (void *)v12;
    }

  }
  else
  {
    v11 = 0;
    v9 = 0;
  }
  v15 = (objc_class *)MEMORY[0x1D17E5550](v11);
  v16 = 32;
  if (v3)
    v16 = 24;
  v17 = *(Class *)((char *)&self->super.isa + v16);
  *(Class *)((char *)&self->super.isa + v16) = v15;

  return v9;
}

uint64_t __83__SBVolumeHardwareButtonActions__sendVolumeButtonDownToOverridingSceneForIncrease___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeWithResult:", 0);
}

void __83__SBVolumeHardwareButtonActions__sendVolumeButtonDownToOverridingSceneForIncrease___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_sendVolumeButtonToSBUIControllerForIncrease:down:", *(unsigned __int8 *)(a1 + 48), 0);

}

- (BOOL)_handleVolumeButtonDownForIncrease:(BOOL)a3 modifiers:(int64_t)a4
{
  _BOOL8 v4;
  id volumeIncreaseUpEventBlock;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  id volumeDecreaseUpEventBlock;
  void *v23;
  NSObject *v24;
  const __CFString *v25;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  const __CFString *v30;
  __int16 v31;
  __CFString *v32;
  uint64_t v33;

  v4 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  if (a4 == 0x80000)
  {
    -[SBVolumeHardwareButtonActions _launchVolumeSettings](self, "_launchVolumeSettings");
    if (v4)
    {
      volumeIncreaseUpEventBlock = self->_volumeIncreaseUpEventBlock;
      self->_volumeIncreaseUpEventBlock = &__block_literal_global_360;
    }
    else
    {
      volumeIncreaseUpEventBlock = self->_volumeDecreaseUpEventBlock;
      self->_volumeDecreaseUpEventBlock = &__block_literal_global_39_3;
    }

    v7 = CFSTR("Volume Settings");
  }
  else
  {
    if (!-[NSHashTable count](self->_volumePressBandits, "count"))
      goto LABEL_11;
    if (v4)
      -[SBVolumeHardwareButtonActions _sendBanditsVolumeIncreased](self, "_sendBanditsVolumeIncreased");
    else
      -[SBVolumeHardwareButtonActions _sendBanditsVolumeDecreased](self, "_sendBanditsVolumeDecreased");
    -[NSHashTable allObjects](self->_volumePressBandits, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bs_map:", &__block_literal_global_43_1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("bandit(s): "), "stringByAppendingString:", v10);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
LABEL_11:
      +[SBPrototypeController sharedInstance](SBPrototypeController, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v4)
        v13 = objc_msgSend(v11, "handleVolumeIncreaseEvent");
      else
        v13 = objc_msgSend(v11, "handleVolumeDecreaseEvent");
      v14 = v13;

      if ((v14 & 1) != 0)
      {
        v7 = CFSTR("SBPrototypeController");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "postNotificationName:object:", *MEMORY[0x1E0DAC400], 0);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "postNotificationName:object:", *MEMORY[0x1E0DAC3F8], 0);

        -[SBVolumeHardwareButtonActions _sendVolumeButtonDownToSpringBoardInternalUIForIncrease:](self, "_sendVolumeButtonDownToSpringBoardInternalUIForIncrease:", v4);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          +[SBHardwareButtonService sharedInstance](SBHardwareButtonService, "sharedInstance");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v4)
          {
            v28 = 0;
            v19 = objc_msgSend(v17, "consumeVolumeIncreaseButtonSinglePressDownWithPriority:continuation:", 0, &v28);
            v20 = (void *)MEMORY[0x1D17E5550](v28);

            v21 = (void *)MEMORY[0x1D17E5550](v20);
            volumeDecreaseUpEventBlock = self->_volumeIncreaseUpEventBlock;
            self->_volumeIncreaseUpEventBlock = v21;
          }
          else
          {
            v27 = 0;
            v19 = objc_msgSend(v17, "consumeVolumeDecreaseButtonSinglePressDownWithPriority:continuation:", 0, &v27);
            v20 = (void *)MEMORY[0x1D17E5550](v27);

            v23 = (void *)MEMORY[0x1D17E5550](v20);
            volumeDecreaseUpEventBlock = self->_volumeDecreaseUpEventBlock;
            self->_volumeDecreaseUpEventBlock = v23;
          }

          if ((v19 & 1) != 0)
          {
            v7 = CFSTR("SBHardwareButtonService");
          }
          else
          {
            -[SBVolumeHardwareButtonActions _sendVolumeButtonDownToSoundControllerForIncrease:](self, "_sendVolumeButtonDownToSoundControllerForIncrease:", v4);
            v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (!v7)
            {
              -[SBVolumeHardwareButtonActions _sendVolumeButtonDownToOverridingSceneForIncrease:](self, "_sendVolumeButtonDownToOverridingSceneForIncrease:", v4);
              v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (!v7)
              {
                -[SBVolumeHardwareButtonActions _sendVolumeButtonDownToLegacyRegisteredClientsForIncrease:](self, "_sendVolumeButtonDownToLegacyRegisteredClientsForIncrease:", v4);
                v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
                if (!v7)
                {
                  -[SBVolumeHardwareButtonActions _sendVolumeButtonDownToSBUIControllerForIncrease:](self, "_sendVolumeButtonDownToSBUIControllerForIncrease:", v4);
                  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
              }
            }
          }
        }
      }
    }
  }
  SBLogButtonsVolume();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = CFSTR("decrease");
    if (v4)
      v25 = CFSTR("increase");
    *(_DWORD *)buf = 138543618;
    v30 = v25;
    v31 = 2114;
    v32 = v7;
    _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "Hardware Volume %{public}@ press handled by %{public}@", buf, 0x16u);
  }

  return v7 != 0;
}

uint64_t __78__SBVolumeHardwareButtonActions__handleVolumeButtonDownForIncrease_modifiers___block_invoke_3()
{
  return objc_msgSend((id)objc_opt_class(), "description");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_volumeDecreaseUpEventBlock, 0);
  objc_storeStrong(&self->_volumeIncreaseUpEventBlock, 0);
  objc_storeStrong((id *)&self->_volumePressBandits, 0);
}

- (void)_handleVolumeButtonUpForIncrease:(char)a1 .cold.1(char a1, NSObject *a2)
{
  const char *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = "decrease";
  if ((a1 & 1) != 0)
    v2 = "increase";
  v3 = 136446210;
  v4 = v2;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "ignoring %{public}s up event", (uint8_t *)&v3, 0xCu);
}

@end
