@implementation SBRingerControl

- (id)initWithBannerManager:(void *)a3 soundController:
{
  id v5;
  id v6;
  void *v7;
  id *v8;
  uint64_t v9;
  id v10;
  void *v12;
  void *v13;
  objc_super v14;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!a1)
    goto LABEL_6;
  if (v5)
  {
    if (v6)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithBannerManager_soundController_, a1, CFSTR("SBRingerControl.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bannerManager"));

    if (v7)
      goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithBannerManager_soundController_, a1, CFSTR("SBRingerControl.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("soundController"));

LABEL_4:
  v14.receiver = a1;
  v14.super_class = (Class)SBRingerControl;
  v8 = (id *)objc_msgSendSuper2(&v14, sel_init);
  a1 = v8;
  if (v8)
  {
    objc_storeWeak(v8 + 4, v5);
    objc_storeStrong(a1 + 5, a3);
    +[SBAVSystemControllerCache sharedInstance](SBAVSystemControllerCache, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = a1[1];
    a1[1] = (id)v9;

    objc_msgSend(a1[1], "addObserver:", a1);
    *((_BYTE *)a1 + 24) = 1;
  }
LABEL_6:

  return a1;
}

- (void)completeSetupWithRingerMuted:(BOOL)a3
{
  self->_ringerMuted = !a3;
  -[SBRingerControl _setRingerMuted:]((uint64_t)self, a3);
}

- (void)_setRingerMuted:(uint64_t)a1
{
  NSObject *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1 && *(unsigned __int8 *)(a1 + 24) != (_DWORD)a2)
  {
    SBLogRingerHUD();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(unsigned __int8 *)(a1 + 24);
      v10[0] = 67109376;
      v10[1] = v5;
      v11 = 1024;
      v12 = a2;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "SBRingerControl _setRingerMuted: %{BOOL}u -> %{BOOL}u", (uint8_t *)v10, 0xEu);
    }

    *(_BYTE *)(a1 + 24) = a2;
    v6 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithObject:forKey:", v7, CFSTR("SBRingerChangedRingerMutedUserInfoKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("SBRingerChangedNotification"), 0, v8);

  }
}

- (void)setRingerMuted:(uint64_t)a3 reason:
{
  if (a1)
    return (void *)objc_msgSend(a1, "setRingerMuted:withFeedback:reason:clientType:", a2, 1, a3, 1);
  return a1;
}

- (void)setRingerMuted:(BOOL)a3 withFeedback:(BOOL)a4 reason:(id)a5 clientType:(unsigned int)a6
{
  _BOOL4 v7;
  _BOOL8 v8;
  id v10;

  v7 = a4;
  v8 = a3;
  v10 = a5;
  if (v7)
    -[SBRingerControl _playSoundForRingerMuted:](self, v8);
  -[SBRingerControl _avsc_setRingerMuted:reason:clientType:]((id *)&self->super.isa, v8, v10, a6);

}

- (void)_playSoundForRingerMuted:(_QWORD *)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  if (a1)
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() == 2)
        return;
      goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if (v6 != 1)
    {
LABEL_4:
      v4 = (void *)a1[5];
      objc_msgSend(a1, "soundForRingerMuted:", a2);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "playSoundWithDefaultEnvironment:", v7);

    }
  }
}

- (void)_avsc_setRingerMuted:(void *)a3 reason:(int)a4 clientType:
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD block[4];
  id v12;
  int v13;
  char v14;

  v7 = a3;
  v8 = v7;
  if (a1)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__avsc_setRingerMuted_reason_clientType_, a1, CFSTR("SBRingerControl.m"), 423, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    }
    -[SBRingerControl _avscOperationsQueue](a1);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__SBRingerControl__avsc_setRingerMuted_reason_clientType___block_invoke;
    block[3] = &unk_1E8EA17D0;
    v14 = a2;
    v12 = v8;
    v13 = a4;
    dispatch_async(v9, block);

  }
}

- (uint64_t)isRingerMuted
{
  if (result)
    return objc_msgSend(*(id *)(result + 8), "isRingerMuted");
  return result;
}

- (uint64_t)isRingerHUDVisible
{
  uint64_t v1;
  unint64_t WeakRetained;

  v1 = a1;
  if (a1)
  {
    WeakRetained = (unint64_t)objc_loadWeakRetained((id *)(a1 + 48));
    v1 = (WeakRetained | *(_QWORD *)(v1 + 64)) != 0;

  }
  return v1;
}

- (void)activateRingerHUDForMuteChange:(uint64_t)a1
{
  if (a1)
    -[SBRingerControl activateRingerHUD:withInitialVolume:fromSource:forPreviewing:](a1, a2 ^ 1u, 0, 0, -1.0);
}

- (void)activateRingerHUDForMuteChange:(uint64_t)a3 forPreviewing:
{
  if (a1)
    -[SBRingerControl activateRingerHUD:withInitialVolume:fromSource:forPreviewing:](a1, a2 ^ 1u, 0, a3, -1.0);
}

- (void)activateRingerHUD:(uint64_t)a3 withInitialVolume:(uint64_t)a4 fromSource:(float)a5 forPreviewing:
{
  NSObject *v10;
  const __CFString *v11;
  BOOL v12;
  __CFString *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  void *v16;
  NSObject *v17;
  void *v18;
  char v19;
  void *v20;
  BOOL v21;
  uint64_t v22;
  SBRingerAlertElement *v23;
  SBRingerAlertElement *WeakRetained;
  unsigned int v25;
  double v26;
  uint64_t v27;
  __CFString *v28;
  const __CFString *v29;
  void *v30;
  uint8_t buf[4];
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    SBLogRingerHUD();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CFSTR("tone");
      if (!(_DWORD)a2)
        v11 = CFSTR("silent");
      *(_DWORD *)buf = 138543362;
      v32 = v11;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "SBRingerControl activateRingerHUD: %{public}@", buf, 0xCu);
    }

    v28 = 0;
    v12 = -[SBRingerControl _isRingerUIDisplayableWithReason:]((void *)a1, (const __CFString **)&v28);
    v13 = v28;
    if (!v12)
    {
      SBLogRingerHUD();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v32 = v13;
        _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "SBRingerControl HUD is not displayable; %{public}@",
          buf,
          0xCu);
      }

      -[SBRingerControl dismissRingerHUD](a1);
      goto LABEL_52;
    }
    v14 = +[SBSoundPreferences vibrateWhenSilent](SBSoundPreferences, "vibrateWhenSilent");
    v15 = +[SBSoundPreferences vibrateWhenRinging](SBSoundPreferences, "vibrateWhenRinging");
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() == 2)
      {
        if ((objc_msgSend(v16, "isUILocked") & 1) == 0)
          goto LABEL_22;
        goto LABEL_20;
      }
      if (!v14 && !v15 && objc_msgSend(v16, "isUILocked"))
      {
LABEL_20:
        v29 = CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "unlockUIFromSource:withOptions:", 16, v20);

LABEL_21:
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "userInterfaceIdiom") != 1 && (v14 || v15))
        goto LABEL_21;
      v19 = objc_msgSend(v16, "isUILocked");

      if ((v19 & 1) != 0)
        goto LABEL_20;
    }
LABEL_22:
    v21 = 1;
    v22 = SBFEffectiveArtworkSubtype();
    if (v22 > 2795)
    {
      if (v22 != 2868 && v22 != 2796)
        goto LABEL_32;
    }
    else if (v22 != 2556 && v22 != 2622)
    {
      goto LABEL_32;
    }
    v23 = (SBRingerAlertElement *)*(id *)(a1 + 64);
    v21 = v23 != 0;
    if (v23)
    {
      WeakRetained = v23;
      if (-[SBRingerAlertElement source](v23, "source") != a3)
      {
        -[SBRingerControl _dismissRingerAlertElement:forReason:](a1, WeakRetained, CFSTR("Ringer source has changed"));
        -[SBRingerControl activateRingerHUD:withInitialVolume:fromSource:forPreviewing:](a1, a2, a3, a4, a5);
LABEL_51:

LABEL_52:
        return;
      }
      goto LABEL_34;
    }
    WeakRetained = -[SBRingerAlertElement initWithSource:ringerSilent:forPreviewing:]([SBRingerAlertElement alloc], "initWithSource:ringerSilent:forPreviewing:", a3, (_DWORD)a2 == 0, a4);
    objc_storeStrong((id *)(a1 + 64), WeakRetained);
    -[SBRingerAlertElement setDelegate:](WeakRetained, "setDelegate:", a1);
    if (WeakRetained)
      goto LABEL_35;
LABEL_32:
    WeakRetained = (SBRingerAlertElement *)objc_loadWeakRetained((id *)(a1 + 48));
    if (!WeakRetained)
    {
      WeakRetained = objc_alloc_init(SBRingerHUDViewController);
      objc_storeWeak((id *)(a1 + 48), WeakRetained);
      -[SBRingerAlertElement setDelegate:](WeakRetained, "setDelegate:", a1);
      v21 = 0;
    }
LABEL_34:
    -[SBRingerAlertElement setActivatedForPreviewing:](WeakRetained, "setActivatedForPreviewing:", a4);
LABEL_35:
    if (-[SBRingerAlertElement isPresented](WeakRetained, "isPresented"))
    {
      if (!-[SBRingerAlertElement isPresented](WeakRetained, "isPresented"))
      {
LABEL_42:
        if (a5 <= 0.0)
          a5 = *(float *)(a1 + 28);
        -[SBRingerAlertElement setRingerSilent:](WeakRetained, "setRingerSilent:", (_DWORD)a2 == 0);
        if (!v21)
        {
          *(float *)&v26 = a5;
          -[SBRingerAlertElement setVolume:animated:forKeyPress:](WeakRetained, "setVolume:animated:forKeyPress:", 0, a3 == 1, v26);
        }
        if (a3)
          v27 = 0;
        else
          v27 = a4 ^ 1;
        -[SBRingerAlertElement presentForMuteChange:](WeakRetained, "presentForMuteChange:", v27);
        goto LABEL_51;
      }
      v25 = ((_DWORD)a2 == 0) ^ -[SBRingerAlertElement isRingerSilent](WeakRetained, "isRingerSilent") ^ 1;
    }
    else
    {
      LOBYTE(v25) = 0;
    }
    if (a3 == 1 && (v25 & 1) == 0)
      -[SBRingerControl _playSoundForRingerMuted:]((_QWORD *)a1, (_DWORD)a2 == 0);
    goto LABEL_42;
  }
}

- (void)activateRingerHUDForVolumeChangeWithInitialVolume:(uint64_t)a1
{
  if (a1)
    -[SBRingerControl activateRingerHUD:withInitialVolume:fromSource:forPreviewing:](a1, objc_msgSend(*(id *)(a1 + 8), "isRingerMuted") ^ 1, 1, 0, a2);
}

- (BOOL)_isRingerUIDisplayableWithReason:(void *)a1
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _BOOL8 v7;

  if (!a1)
    return 0;
  objc_msgSend(a1, "controlCenterController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "isPresented"))
  {
    objc_msgSend(v4, "viewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "includesVisiblyUnobscuredModuleWithIdentifier:", CFSTR("com.apple.control-center.MuteModule")))v6 = CFSTR("Control Center with visible Mute Module presented");
    else
      v6 = 0;

    if (!a2)
      goto LABEL_11;
    goto LABEL_10;
  }
  v6 = 0;
  if (a2)
LABEL_10:
    *a2 = v6;
LABEL_11:
  v7 = v6 == 0;

  return v7;
}

- (void)dismissRingerHUD
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  id v6;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v6 = WeakRetained;
    if (WeakRetained)
    {
      -[SBRingerControl _dismissRingerHUDViewController:forReason:](a1, WeakRetained, CFSTR("SBRingerControlBannerRevocationReasonDismiss"));
      WeakRetained = v6;
    }
    v3 = *(void **)(a1 + 64);
    if (v3)
    {
      v4 = v3;
      NSStringFromSelector(sel_dismissRingerHUD);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBRingerControl _dismissRingerAlertElement:forReason:](a1, v4, v5);

      WeakRetained = v6;
    }

  }
}

- (void)_dismissRingerAlertElement:(void *)a3 forReason:
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(v5, "assertion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isValid"))
    {
      SBLogRingerHUD();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = v6;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "SBRingerControl dismiss ringer alert element, reason: %@", (uint8_t *)&v10, 0xCu);
      }

      objc_msgSend(v7, "invalidateWithReason:", v6);
    }
    v9 = *(id *)(a1 + 64);
    if (v9 == v5)
    {
      *(_QWORD *)(a1 + 64) = 0;

    }
  }

}

- (void)nudgeUp:(id *)a1
{
  id v3;

  if (a1)
  {
    -[SBRingerControl _ringerUICoordinator](a1);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nudgeUp:", a2);

  }
}

- (id)_ringerUICoordinator
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = a1;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    v3 = WeakRetained;
    if (!WeakRetained)
      v3 = v1[8];
    v1 = (id *)v3;

  }
  return v1;
}

- (void)buttonReleased
{
  id v1;

  if (a1)
  {
    -[SBRingerControl _ringerUICoordinator](a1);
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "buttonReleased");

  }
}

- (void)_dismissRingerHUDViewController:(void *)a3 forReason:
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    v6 = a2;
    SBLogRingerHUD();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "SBRingerControl _dismissRingerHUDViewController; reason: %@",
        (uint8_t *)&v11,
        0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(MEMORY[0x1E0D010A0], "uniqueIdentificationForPresentable:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (id)objc_msgSend(WeakRetained, "revokePresentablesWithIdentification:reason:options:userInfo:error:", v9, v5, 0, 0, 0);
  }

}

- (void)setVolume:(float)a3 forKeyPress:
{
  NSObject *v6;
  void *v7;
  double v8;
  int v9;
  double v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    SBLogRingerHUD();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 1024;
      v12 = a2;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "SBRingerControl setVolume:%.2f forKeyPress:%{BOOL}d", (uint8_t *)&v9, 0x12u);
    }

    *(float *)(a1 + 28) = a3;
    -[SBRingerControl _ringerUICoordinator]((id *)a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = *(_DWORD *)(a1 + 28);
    objc_msgSend(v7, "setVolume:animated:forKeyPress:", 1, a2, v8);

  }
}

- (void)cache:(id)a3 didUpdateRingerMuted:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  char v7;
  _DWORD v8[2];
  uint64_t v9;

  v4 = a4;
  v9 = *MEMORY[0x1E0C80C00];
  SBLogRingerHUD();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v4;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "SBRingerControl cache:didUpdateRingerMuted:%{BOOL}u", (uint8_t *)v8, 8u);
  }

  -[SBRingerControl _setRingerMuted:]((uint64_t)self, v4);
  if ((SBUIHasHIDRingerSwitch() & 1) != 0)
  {
    if (!self)
      return;
LABEL_8:
    -[SBRingerControl activateRingerHUD:withInitialVolume:fromSource:forPreviewing:]((uint64_t)self, v4 ^ 1, 0, 0, -1.0);
    return;
  }
  v7 = -[SBRingerControl isRingerHUDVisible]((uint64_t)self);
  if (self && (v7 & 1) != 0)
    goto LABEL_8;
}

- (void)controlCenterWillPresent
{
  if (-[SBRingerControl isRingerHUDVisible]((uint64_t)self))
  {
    if (!-[SBRingerControl _isRingerUIDisplayableWithReason:](self, 0))
      -[SBRingerControl dismissRingerHUD]((uint64_t)self);
  }
}

- (void)ringerHUDViewControllerWantsToBePresented:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isActivatedForPreviewing"))
  {
    v11 = *MEMORY[0x1E0DACA18];
    v12[0] = &unk_1E91D0AB8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_bannerManager);
  v10 = 0;
  v7 = objc_msgSend(WeakRetained, "postPresentable:withOptions:userInfo:error:", v4, 0, v5, &v10);

  v8 = v10;
  if ((v7 & 1) == 0)
  {
    SBLogRingerHUD();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SBRingerControl ringerHUDViewControllerWantsToBePresented:].cold.1(v8, v9);

  }
}

- (void)ringerHUDViewControllerWantsToBeDismissed:(id)a3
{
  -[SBRingerControl _dismissRingerHUDViewController:forReason:]((uint64_t)self, a3, CFSTR("SBRingerControlBannerRevocationReasonTimer"));
}

- (void)ringerAlertElementWantsToBePresented:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v4 = a3;
  objc_msgSend(v4, "assertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isValid");

  if ((v6 & 1) == 0)
  {
    objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerElement:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __56__SBRingerControl_ringerAlertElementWantsToBePresented___block_invoke;
    v12 = &unk_1E8EABB30;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v8, "addInvalidationBlock:", &v9);
    objc_msgSend(v4, "setAssertion:", v8, v9, v10, v11, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
}

void __56__SBRingerControl_ringerAlertElementWantsToBePresented___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBCameraHardwareButton setForegroundPendingRemovalCameraShutterButtonPIDs:]((uint64_t)WeakRetained, 0);

}

- (void)ringerAlertElementWantsToBeDismissed:(id)a3 forReason:(id)a4
{
  -[SBRingerControl _dismissRingerAlertElement:forReason:]((uint64_t)self, a3, a4);
}

- (void)ringerAlertElementWantsToResetAutomaticInvalidationTimer:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "alertHost");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertAssertion");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "resetAutomaticInvalidationTimer");
}

- (void)setControlCenterController:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controlCenterController);
  if (WeakRetained != obj)
  {
    objc_msgSend(WeakRetained, "removeObserver:", self);
    objc_storeWeak((id *)&self->_controlCenterController, obj);
    objc_msgSend(obj, "addObserver:", self);
  }

}

- (id)soundForRingerMuted:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 1004;
  else
    v3 = 1005;
  return (id)objc_msgSend(MEMORY[0x1E0DAC2A0], "soundWithFeedbackEventType:", v3);
}

- (id)previewRingerStateForReason:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  SBSystemActionCompoundPreviewAssertion *v9;
  uint64_t v10;
  SBSystemActionCompoundPreviewAssertion *v11;
  SBSystemActionCompoundPreviewAssertion *compoundPreviewAssertion;
  id result;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = SBFEffectiveArtworkSubtype();
    if (v8 > 2795)
    {
      if (v8 != 2868 && v8 != 2796)
        goto LABEL_11;
    }
    else if (v8 != 2556 && v8 != 2622)
    {
LABEL_11:

      return v7;
    }
    objc_initWeak(&location, self);
    if (!self->_compoundPreviewAssertion)
    {
      v9 = [SBSystemActionCompoundPreviewAssertion alloc];
      v10 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __47__SBRingerControl_previewRingerStateForReason___block_invoke;
      v17[3] = &unk_1E8EABB58;
      objc_copyWeak(&v18, &location);
      v15[0] = v10;
      v15[1] = 3221225472;
      v15[2] = __47__SBRingerControl_previewRingerStateForReason___block_invoke_2;
      v15[3] = &unk_1E8EA6158;
      objc_copyWeak(&v16, &location);
      v11 = (SBSystemActionCompoundPreviewAssertion *)-[SBSystemActionCompoundPreviewAssertion initWithIdentifier:stateDidChangeBlock:eventHandlingBlock:](v9, CFSTR("RingerControl"), v17, v15);
      compoundPreviewAssertion = self->_compoundPreviewAssertion;
      self->_compoundPreviewAssertion = v11;

      objc_destroyWeak(&v16);
      objc_destroyWeak(&v18);
    }
    -[SBRingerControl activateRingerHUD:withInitialVolume:fromSource:forPreviewing:]((uint64_t)self, -[SBAVSystemControllerCache isRingerMuted](self->_avCache, "isRingerMuted") ^ 1, 0, 1, -1.0);
    -[SBSystemActionCompoundPreviewAssertion acquireForReason:]((uint64_t)self->_compoundPreviewAssertion, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&location);
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("reason != ((void *)0)"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SBRingerControl previewRingerStateForReason:].cold.1(a2, (uint64_t)self, (uint64_t)v14);
  objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

void __47__SBRingerControl_previewRingerStateForReason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBRingerControl _updateRingerAlertPreviewingState]((uint64_t)WeakRetained);

}

- (void)_updateRingerAlertPreviewingState
{
  id v2;
  void *v3;
  void *v4;
  unsigned int v5;
  objc_class *v6;
  void *v7;
  id v8;

  if (a1)
  {
    v2 = *(id *)(a1 + 64);
    if (v2)
    {
      v8 = v2;
      objc_msgSend(v2, "alertHost");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "alertAssertion");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = -[SBSystemActionCompoundPreviewAssertion state](*(_QWORD *)(a1 + 56));
      if ((v5 & 1) != 0)
      {
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setAutomaticallyInvalidatable:lockingWithKey:reason:", 0, v7, CFSTR("Previewing"));

      }
      else
      {
        objc_msgSend(v4, "invalidateWithReason:", CFSTR("Stop previewing"));
      }
      objc_msgSend(v8, "setPreviewing:", v5 & 1);
      objc_msgSend(v8, "setUrgent:", HIBYTE(v5) & 1);
      objc_msgSend(v8, "setExpanding:", (v5 >> 8) & 1);
      objc_msgSend(v8, "setProminent:", HIWORD(v5) & 1);

      v2 = v8;
    }

  }
}

void __47__SBRingerControl_previewRingerStateForReason___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id *WeakRetained;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !a3)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained[8], "pop");
    WeakRetained = v5;
  }

}

- (uint64_t)_handleRingerAlertPreviewingEvent:(uint64_t)result
{
  if (result)
  {
    if (!a2)
      return objc_msgSend(*(id *)(result + 64), "pop");
  }
  return result;
}

- (id)observeRingerMutedWithBlock:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBRingerControl.m"), 399, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __47__SBRingerControl_observeRingerMutedWithBlock___block_invoke;
  v18[3] = &unk_1E8EABB80;
  v19 = v5;
  v9 = v5;
  objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", CFSTR("SBRingerChangedNotification"), 0, v7, v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0D01868]);
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __47__SBRingerControl_observeRingerMutedWithBlock___block_invoke_2;
  v16[3] = &unk_1E8E9DCD8;
  v17 = v10;
  v12 = v10;
  v13 = (void *)objc_msgSend(v11, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("RingerMuteObservation"), CFSTR("ObserverToken"), v16);

  return v13;
}

uint64_t __47__SBRingerControl_observeRingerMutedWithBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("SBRingerChangedRingerMutedUserInfoKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "BOOLValue");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__SBRingerControl_observeRingerMutedWithBlock___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(a1 + 32));

}

- (id)_avscOperationsQueue
{
  id *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v10;

  if (a1)
  {
    v1 = a1;
    v2 = a1[2];
    if (!v2)
    {
      objc_msgSend(a1[1], "avscOperationsWorkloop");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__avscOperationsQueue, v1, CFSTR("SBRingerControl.m"), 415, CFSTR("Must use the AVSC cache's target workloop"));

      }
      objc_msgSend(MEMORY[0x1E0D01760], "serial");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "serviceClass:relativePriority:", 25, 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "targetQueue:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = BSDispatchQueueCreate();
      v8 = v1[2];
      v1[2] = (id)v7;

      v2 = v1[2];
    }
    a1 = (id *)v2;
  }
  return a1;
}

void __58__SBRingerControl__avsc_setRingerMuted_reason_clientType___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D48560], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "setSilentMode:untilTime:reason:clientType:", *(unsigned __int8 *)(a1 + 44), 0, *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
  SBLogRingerHUD();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(unsigned __int8 *)(a1 + 44);
      v7 = *(_DWORD *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 32);
      v12 = 67109634;
      v13 = v6;
      v14 = 1024;
      v15 = v7;
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Set ringer muted=%{BOOL}u for client '%u' with reason: '%{public}@'", (uint8_t *)&v12, 0x18u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v9 = *(unsigned __int8 *)(a1 + 44);
    v10 = *(_DWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = 67109634;
    v13 = v9;
    v14 = 1024;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    _os_log_fault_impl(&dword_1D0540000, v5, OS_LOG_TYPE_FAULT, "Failed to set ringer muted=%{BOOL}u for client '%u' with reason: '%{public}@'", (uint8_t *)&v12, 0x18u);
  }

}

- (id)bannerManager
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 4);
  return WeakRetained;
}

- (float)volume
{
  if (a1)
    return *(float *)(a1 + 28);
  else
    return 0.0;
}

- (uint64_t)setVolume:(uint64_t)result
{
  if (result)
    *(float *)(result + 28) = a2;
  return result;
}

- (SBControlCenterController)controlCenterController
{
  return (SBControlCenterController *)objc_loadWeakRetained((id *)&self->_controlCenterController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controlCenterController);
  objc_storeStrong((id *)&self->_ringerAlertElement, 0);
  objc_storeStrong((id *)&self->_compoundPreviewAssertion, 0);
  objc_destroyWeak((id *)&self->_ringerHUDViewController);
  objc_storeStrong((id *)&self->_soundController, 0);
  objc_destroyWeak((id *)&self->_bannerManager);
  objc_storeStrong((id *)&self->_avscOperationsQueue, 0);
  objc_storeStrong((id *)&self->_avCache, 0);
}

- (BOOL)_accessibilityIsRingerMuted
{
  if (self)
    LOBYTE(self) = -[SBAVSystemControllerCache isRingerMuted](self->_avCache, "isRingerMuted");
  return (char)self;
}

- (void)ringerHUDViewControllerWantsToBePresented:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Failed to post Ringer HUD: %@", (uint8_t *)&v4, 0xCu);

}

- (void)previewRingerStateForReason:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
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
  v15 = CFSTR("SBRingerControl.m");
  v16 = 1024;
  v17 = 373;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
