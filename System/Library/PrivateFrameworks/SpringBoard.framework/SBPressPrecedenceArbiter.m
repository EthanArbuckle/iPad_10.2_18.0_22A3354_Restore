@implementation SBPressPrecedenceArbiter

- (SBPressPrecedenceArbiter)initWithHomeButtonType:(int64_t)a3
{
  SBPressPrecedenceArbiter *v4;
  SBPressPrecedenceArbiter *v5;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint8_t v11[16];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBPressPrecedenceArbiter;
  v4 = -[SBPressPrecedenceArbiter init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_volumeAndLockButtonPriority = -1;
    v4->_homeButtonType = a3;
    v6 = -[SBPressPrecedenceArbiter _shouldArbitrateLockAndVolumeHardwareButtonPriorities](v4, "_shouldArbitrateLockAndVolumeHardwareButtonPriorities");
    SBLogButtonsCombo();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "volume/lock precedence arbitration is enabled on this device", v11, 2u);
      }

      +[SBAVSystemControllerCache sharedInstance](SBAVSystemControllerCache, "sharedInstance");
      v7 = objc_claimAutoreleasedReturnValue();
      -[NSObject addObserver:](v7, "addObserver:", v5);
      v5->_isAudioPlayingSomewhere = -[NSObject isAudioSessionPlaying](v7, "isAudioSessionPlaying");
      -[SBPressPrecedenceArbiter _updateButtonPrioritiesForNotification:](v5, "_updateButtonPrioritiesForNotification:", 0);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", v5, sel__updateButtonPrioritiesForNotification_, *MEMORY[0x1E0DAC318], 0);
      objc_msgSend(v9, "addObserver:selector:name:object:", v5, sel__updateButtonPrioritiesForNotification_, CFSTR("SBFrontmostDisplayChangedNotification"), 0);
      objc_msgSend(v9, "addObserver:selector:name:object:", v5, sel__updateButtonPrioritiesForNotification_, *MEMORY[0x1E0DAC2F8], 0);
      objc_msgSend(v9, "addObserver:selector:name:object:", v5, sel__updateButtonPrioritiesForNotification_, *MEMORY[0x1E0DAC2F0], 0);
      objc_msgSend(v9, "addObserver:selector:name:object:", v5, sel__updateButtonPrioritiesForNotification_, CFSTR("SBApplicationsRegisteredForVolumeButtonEventsChangedNotification"), 0);
      objc_msgSend(v9, "addObserver:selector:name:object:", v5, sel__updateButtonPrioritiesForNotification_, CFSTR("SBApplicationsRegisteredForLockButtonEventsChangedNotification"), 0);

    }
    else if (v8)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "volume/lock precedence arbitration is disabled on this device", v11, 2u);
    }

  }
  return v5;
}

- (void)setHardwareButtons:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareButtons, a3);
  -[SBPressPrecedenceArbiter _applyButtonPriority:](self, "_applyButtonPriority:", self->_volumeAndLockButtonPriority);
}

- (BOOL)_shouldArbitrateLockAndVolumeHardwareButtonPriorities
{
  if (self->_homeButtonType == 2)
    return 0;
  else
    return MGGetBoolAnswer();
}

- (void)_updateButtonPriority
{
  unint64_t v3;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = -[SBPressPrecedenceArbiter _currentButtonPriority](self, "_currentButtonPriority");
  SBLogButtonsCombo();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (v3 > 2)
      v5 = CFSTR("<unknown>");
    else
      v5 = off_1E8EA5F20[v3];
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "lock/volume priority is:%{public}@", (uint8_t *)&v6, 0xCu);
  }

  if (v3 != self->_volumeAndLockButtonPriority)
    -[SBPressPrecedenceArbiter _applyButtonPriority:](self, "_applyButtonPriority:", v3);
}

- (void)_updateButtonPrioritiesForNotification:(id)a3
{
  BSDispatchMain();
}

uint64_t __67__SBPressPrecedenceArbiter__updateButtonPrioritiesForNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateButtonPriority");
}

- (void)_applyButtonPriority:(unint64_t)a3
{
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t volumeAndLockButtonPriority;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  self->_volumeAndLockButtonPriority = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_hardwareButtons;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "preemptablePressGestureRecognizers", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  volumeAndLockButtonPriority = self->_volumeAndLockButtonPriority;
  v12 = &unk_1E91CE428;
  if (volumeAndLockButtonPriority != 2)
    v12 = 0;
  if (volumeAndLockButtonPriority == 1)
    v13 = &unk_1E91CE410;
  else
    v13 = v12;
  objc_msgSend(v4, "makeObjectsPerformSelector:withObject:", sel_setPressTypesWithPrecedence_, v13, (_QWORD)v14);

}

- (unint64_t)_currentButtonPriority
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  BOOL v17;

  +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUILocked");

  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "screenIsOn");

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transientOverlayPresentationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasActivePresentation");

  if (v4)
  {
    v10 = 1;
    if (!(v6 | v9))
      v10 = 2;
    if (self->_isAudioPlayingSomewhere)
      return v10;
    else
      return 2;
  }
  else
  {
    objc_msgSend((id)SBApp, "appsRegisteredForLockButtonEvents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)SBApp, "appsRegisteredForVolumeEvents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = SBWorkspaceUnlockedEnvironmentLayoutStateHasMatchingApplication(v13) ^ 1;
    if (v13)
      v17 = v13 == v15;
    else
      v17 = 0;
    if (v17)
      v11 = v16;
    else
      v11 = 1;

  }
  return v11;
}

- (void)cache:(id)a3 didUpdateAudioSessionPlaying:(BOOL)a4
{
  self->_isAudioPlayingSomewhere = a4;
  -[SBPressPrecedenceArbiter _updateButtonPriority](self, "_updateButtonPriority", a3);
}

- (NSArray)hardwareButtons
{
  return self->_hardwareButtons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareButtons, 0);
}

@end
