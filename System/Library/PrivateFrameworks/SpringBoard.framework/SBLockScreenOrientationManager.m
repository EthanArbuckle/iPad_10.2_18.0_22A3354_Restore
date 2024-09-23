@implementation SBLockScreenOrientationManager

- (SBLockScreenOrientationManager)init
{
  SBLockScreenOrientationManager *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBLockScreenOrientationManager;
  v2 = -[SBLockScreenOrientationManager init](&v8, sel_init);
  if (v2)
  {
    +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:", v2);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
        goto LABEL_8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "userInterfaceIdiom");

      if (v6)
      {
LABEL_8:

        return v2;
      }
    }
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__lockStateChanged_, CFSTR("SBAggregateLockStateDidChangeNotification"), 0);
    goto LABEL_8;
  }
  return v2;
}

- (void)assistantDidAppear:(id)a3 windowScene:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleCoverSheet")) & 1) == 0)
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lockScreenEnvironment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "bs_isAppearingOrAppeared"))
    {
      objc_msgSend(v10, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "interfaceOrientation");

      -[SBLockScreenOrientationManager updateInterfaceOrientationWithRequestedOrientation:animated:](self, "updateInterfaceOrientationWithRequestedOrientation:animated:", v9, 1);
    }

  }
}

- (void)updateInterfaceOrientationWithRequestedOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v4 = a4;
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleCoverSheet")) & 1) == 0)
  {
    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "coverSheetViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[SBOrientationLockManager sharedInstance](SBOrientationLockManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActiveInterfaceOrientationLocked:", 0);
    if (objc_msgSend(v9, "isUserLocked"))
      a3 = objc_msgSend(v9, "userLockOrientation");
    if ((unint64_t)(a3 - 1) >= 4)
    {
      if (__sb__runningInSpringBoard())
      {
        if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
          goto LABEL_8;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "userInterfaceIdiom");

        if (!v11)
        {
LABEL_8:
          a3 = 1;
          -[SBLockScreenOrientationManager _updateDeviceOrientationIfNeededForPhoneUnlockToOrientation:](self, "_updateDeviceOrientationIfNeededForPhoneUnlockToOrientation:", 1);
          goto LABEL_11;
        }
      }
      a3 = objc_msgSend((id)SBApp, "interfaceOrientationForCurrentDeviceOrientation:", 0);
    }
LABEL_11:
    objc_msgSend((id)SBApp, "pushTransientActiveInterfaceOrientation:forReason:", a3, CFSTR("SBLockScreenTransientActiveInterfaceOrientationForUndimReason"));
    objc_msgSend((id)SBApp, "updateNativeOrientationWithOrientation:updateMirroredDisplays:animated:logMessage:", a3, 1, v4, CFSTR("LockScreen updated interface orientation"));
    objc_msgSend((id)SBApp, "popTransientActiveInterfaceOrientationForReason:", CFSTR("SBLockScreenTransientActiveInterfaceOrientationForUndimReason"));
    +[SBUIController sharedInstance](SBUIController, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nudgeIconInterfaceOrientation:duration:", a3, 0.0);

    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() != 2)
        goto LABEL_16;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "userInterfaceIdiom");

      if (v14 != 1)
      {
LABEL_16:
        v18 = objc_msgSend((id)SBApp, "activeInterfaceOrientation");
        objc_msgSend(v19, "updateInterfaceOrientationToMatchOrientation:", v18);
        objc_msgSend(v8, "setEffectiveInterfaceOrientationOverride:", v18);
        objc_msgSend(v19, "setActiveInterfaceOrientationLocked:", 1);

        return;
      }
    }
    objc_msgSend((id)SBApp, "setStatusBarOrientation:forEmbeddedDisplayAnimated:", a3, 0);
    +[SBUIController sharedInstance](SBUIController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "rootViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setInterfaceOrientation:", a3);

    goto LABEL_16;
  }
}

- (void)_lockStateChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  _BOOL8 v8;
  NSDate *v9;
  NSObject *v10;
  NSDate *v11;
  NSDate *updateForAmbiguousOrientationsAfterDate;
  uint64_t v13;

  v4 = a3;
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleCoverSheet")) & 1) == 0)
  {
    objc_msgSend(v4, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SBAggregateLockStateKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

    v8 = v7 & 1;
    if (self->_wasUILocked != v8)
    {
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 480.0);
        v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
        updateForAmbiguousOrientationsAfterDate = self->_updateForAmbiguousOrientationsAfterDate;
        self->_updateForAmbiguousOrientationsAfterDate = v11;

        BKLogOrientationDevice();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[SBLockScreenOrientationManager _lockStateChanged:].cold.2((uint64_t *)&self->_updateForAmbiguousOrientationsAfterDate, v10, v13);
      }
      else
      {
        v9 = self->_updateForAmbiguousOrientationsAfterDate;
        self->_updateForAmbiguousOrientationsAfterDate = 0;

        BKLogOrientationDevice();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[SBLockScreenOrientationManager _lockStateChanged:].cold.1(v10);
      }

      self->_wasUILocked = v8;
    }
  }

}

- (void)_updateDeviceOrientationIfNeededForPhoneUnlockToOrientation:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  uint8_t v12[16];

  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleCoverSheet")) & 1) == 0)
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
        return;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "userInterfaceIdiom");

      if (v6)
        return;
    }
    v7 = objc_msgSend((id)SBApp, "deviceOrientationForDeferredUpdateIfAny");
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "orientation");

    }
    if ((unint64_t)(v7 - 1) >= 4)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isAfterDate:", self->_updateForAmbiguousOrientationsAfterDate);

      if (v11)
      {
        objc_msgSend((id)SBApp, "_setDeviceOrientation:animated:logMessage:", a3, 0, CFSTR("Forcibly updating SpringBoard's device orientation for unlock in an ambiguous orientation"));
        return;
      }
      BKLogOrientationDevice();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Not updating SpringBoard's device orientation for unlock in an ambiguous orientation as we locked too recently", v12, 2u);
      }
    }
    else
    {
      BKLogOrientationDevice();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[SBLockScreenOrientationManager _updateDeviceOrientationIfNeededForPhoneUnlockToOrientation:].cold.1(v7, v9);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateForAmbiguousOrientationsAfterDate, 0);
}

- (void)_lockStateChanged:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEBUG, "We are no longer UI locked. Clearing the grace period for unlocks in ambiguous orientations.", v1, 2u);
}

- (void)_lockStateChanged:(uint64_t)a3 .cold.2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, a3, "We are now UI locked. Will update device orientation for unlocks in ambiguous orientations after %@", (uint8_t *)&v4);
}

- (void)_updateDeviceOrientationIfNeededForPhoneUnlockToOrientation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  BSDeviceOrientationDescription();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, v4, "Not updating SpringBoard's device orientation for unlock because our orientation isn't ambiguous, it's: %@", (uint8_t *)&v5);

}

@end
