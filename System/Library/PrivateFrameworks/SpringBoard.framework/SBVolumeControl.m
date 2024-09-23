@implementation SBVolumeControl

- (void)zStackParticipantWithIdentifier:(int64_t)a3 settingsDidChange:(id)a4
{
  -[SBVolumeControl _processZStackParticipantSettings:](self, "_processZStackParticipantSettings:", a4);
}

- (void)_effectiveVolumeChanged:(id)a3
{
  id v4;
  void *v5;
  double v6;
  NSObject *v7;
  NSObject *v8;
  unsigned int v9;
  int v10;
  char v11;
  int v12;
  void *v13;
  float v14;
  float v15;
  unint64_t mode;
  NSString *v17;
  unint64_t v18;
  char v19;
  double v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  NSString *lastEventCategory;
  NSObject *v26;
  _BOOL4 v27;
  double v28;
  NSObject *v29;
  void *v30;
  int v31;
  NSObject *v32;
  NSString *v33;
  NSString *v34;
  double v35;
  void *v36;
  _BOOL4 v37;
  NSString *v38;
  NSString *lastDisplayedCategory;
  double v40;
  unsigned int v41;
  double v42;
  int v43;
  double v44;
  id v45;
  uint8_t buf[4];
  double v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D47F78]);
  v6 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  if (-[SBVolumeControl _displaysVolumeForCategory:](self, "_displaysVolumeForCategory:", *(_QWORD *)&v6))
  {
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D47F90]);
    v7 = objc_claimAutoreleasedReturnValue();
    SBLogAudioControl();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v47 = v6;
      v48 = 2114;
      v49 = (uint64_t)v7;
      v50 = 2048;
      v51 = v4;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "_effectiveVolumeChanged for '%{public}@' for reason: %{public}@/%p", buf, 0x20u);
    }

    v9 = -[NSObject isEqualToString:](v7, "isEqualToString:", CFSTR("ExplicitVolumeChange"));
    if ((v9 & 1) != 0)
      v10 = 1;
    else
      v10 = -[NSObject isEqualToString:](v7, "isEqualToString:", CFSTR("FullMuteChange"));
    v11 = -[NSObject isEqualToString:](v7, "isEqualToString:", CFSTR("RouteChange"));
    v12 = -[NSObject isEqualToString:](v7, "isEqualToString:", CFSTR("CategoryChange"));
    if ((v10 & 1) != 0 || (v11 & 1) != 0 || v12)
    {
      v41 = v9;
      objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D47F88]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      v15 = v14;

      v44 = COERCE_DOUBLE(-[NSString copy](self->_lastEventCategory, "copy"));
      mode = self->_mode;
      objc_storeStrong((id *)&self->_lastEventCategory, *(id *)&v6);
      v17 = self->_lastEventCategory;
      if (-[NSString isEqualToString:](v17, "isEqualToString:", CFSTR("Audio/Video")))
      {
        v18 = 1;
      }
      else if (-[NSString isEqualToString:](v17, "isEqualToString:", CFSTR("PhoneCall")))
      {
        v18 = 2;
      }
      else if (-[NSString isEqualToString:](v17, "isEqualToString:", CFSTR("Ringtone")))
      {
        v18 = 3;
      }
      else if (-[NSString isEqualToString:](v17, "isEqualToString:", CFSTR("RingtonePreview")))
      {
        v18 = 3;
      }
      else
      {
        v18 = 4;
      }

      self->_mode = v18;
      v19 = BSEqualObjects();
      if (mode != self->_mode)
      {
        SBLogAudioControl();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSBVolumeMode(mode);
          v42 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          NSStringFromSBVolumeMode(self->_mode);
          v22 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v47 = v42;
          v48 = 2114;
          v49 = v22;
          v23 = (void *)v22;
          _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "Updating Mode from '%{public}@' -> '%{public}@'", buf, 0x16u);

        }
      }
      if ((v19 & 1) == 0)
      {
        SBLogAudioControl();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          lastEventCategory = self->_lastEventCategory;
          *(_DWORD *)buf = 138543618;
          v47 = v44;
          v48 = 2114;
          v49 = (uint64_t)lastEventCategory;
          _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "Updating Last Event category from '%{public}@' -> '%{public}@'", buf, 0x16u);
        }

      }
      *(float *)&v20 = v15;
      -[SBVolumeControl _updateEffectiveVolume:](self, "_updateEffectiveVolume:", v20);
      SBLogAudioControl();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v47 = v15;
        _os_log_impl(&dword_1D0540000, v26, OS_LOG_TYPE_DEFAULT, "Caching newEffectiveVolume: %f from AVSystemController", buf, 0xCu);
      }
      v43 = v10;

      v45 = 0;
      v27 = -[SBVolumeControl _isHUDDisplayableWithReason:](self, "_isHUDDisplayableWithReason:", &v45);
      v28 = COERCE_DOUBLE(v45);
      if (!v27)
      {
        SBLogAudioControl();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v47 = v28;
          _os_log_impl(&dword_1D0540000, v29, OS_LOG_TYPE_DEFAULT, "HUD is not displayable; %{public}@", buf, 0xCu);
        }

      }
      objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D47F80]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "BOOLValue");

      if ((v43 & v31) == 1)
      {
        SBLogAudioControl();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v32, OS_LOG_TYPE_DEFAULT, "Volume change is explicitly suppressing HUD presentation", buf, 2u);
        }

      }
      if (((v43 ^ 1 | v31) & 1) != 0 || !v27)
      {
        -[SBVolumeControl presentedVolumeHUDViewController](self, "presentedVolumeHUDViewController");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
          v37 = v27;
        else
          v37 = 0;
        if (v37)
        {
          v38 = (NSString *)-[NSString copy](self->_lastEventCategory, "copy");
          lastDisplayedCategory = self->_lastDisplayedCategory;
          self->_lastDisplayedCategory = v38;

          *(float *)&v40 = v15;
          objc_msgSend(v36, "noteValueDidChange:", v40);
        }

      }
      else
      {
        v33 = (NSString *)-[NSString copy](self->_lastEventCategory, "copy");
        v34 = self->_lastDisplayedCategory;
        self->_lastDisplayedCategory = v33;

        *(float *)&v35 = v15;
        -[SBVolumeControl _presentVolumeHUDWithVolume:](self, "_presentVolumeHUDWithVolume:", v35);
      }
      if (v43 && self->_mode == 3)
      {
        if (v27)
          -[SBRingerControl activateRingerHUDForVolumeChangeWithInitialVolume:]((uint64_t)self->_ringerControl, v15);
        -[SBRingerControl setVolume:forKeyPress:]((uint64_t)self->_ringerControl, v41, v15);
      }

    }
  }
  else
  {
    SBLogAudioControl();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v47 = v6;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "_effectiveVolumeChanged for '%{public}@' but volume category is not displayed by SBVolumeControl", buf, 0xCu);
    }
  }

}

- (float)volumeStepUp
{
  float result;

  -[SBElasticHUDSettings volumeStepDelta](self->_elasticHUDSettings, "volumeStepDelta");
  return result;
}

- (id)presentedVolumeHUDViewController
{
  void *v2;
  void *v3;

  -[SBHUDController presentedHUDControllerForIdentifier:](self->_hudController, "presentedHUDControllerForIdentifier:", *MEMORY[0x1E0DAB7E0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "HUDViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateEffectiveVolume:(float)a3
{
  os_unfair_lock_s *p_effectiveVolumeLock;

  p_effectiveVolumeLock = &self->_effectiveVolumeLock;
  os_unfair_lock_lock(&self->_effectiveVolumeLock);
  self->_effectiveVolume = a3;
  os_unfair_lock_unlock(p_effectiveVolumeLock);
}

- (BOOL)_displaysVolumeForCategory:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend((id)objc_opt_class(), "_isVolumeManagedForCategory:", v3);

  return v4;
}

+ (BOOL)_isVolumeManagedForCategory:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Audio/Video")) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("Alarm")) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("Ringtone")) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("PhoneCall")) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("VoiceCommand"));
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_isHUDDisplayableWithReason:(id *)a3
{
  void *v5;
  int v6;
  char v7;
  __CFString *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  -[SBVolumeControl controlCenterController](self, "controlCenterController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isVisible");
  v7 = v6;
  if (v6)
    v8 = CFSTR("Control Center is visible");
  else
    v8 = 0;
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v7 & 1) == 0)
  {
    if (objc_msgSend(v9, "isUILocked"))
    {
      objc_msgSend(v10, "lockScreenEnvironment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "backlightController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "backlightLuminance");

      if (!v14)
      {
        v8 = CFSTR("UI Locked and backlight is fully off");
        goto LABEL_5;
      }
      objc_msgSend(v10, "lockScreenEnvironment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "mediaControlsPresenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "isShowingMediaControls");

      if (!-[SBTelephonyManager inCall](self->_telephonyManager, "inCall"))
        -[SBConferenceManager inFaceTime](self->_conferenceManager, "inFaceTime");
    }
    v11 = -[SBVolumeControl _isHUDDisplayableForLastEventCategoryWithReason:](self, "_isHUDDisplayableForLastEventCategoryWithReason:", a3);
    goto LABEL_12;
  }
LABEL_5:
  v11 = 0;
  if (a3)
    *a3 = v8;
LABEL_12:

  return v11;
}

- (SBControlCenterController)controlCenterController
{
  return (SBControlCenterController *)objc_loadWeakRetained((id *)&self->_controlCenterController);
}

- (BOOL)_isHUDDisplayableForLastEventCategoryWithReason:(id *)a3
{
  NSString *lastEventCategory;

  lastEventCategory = self->_lastEventCategory;
  return !lastEventCategory
      || -[SBVolumeControl _isHUDDisplayableForCategory:outReason:](self, "_isHUDDisplayableForCategory:outReason:", lastEventCategory, a3);
}

- (BOOL)_isHUDDisplayableForCategory:(id)a3 outReason:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;

  v6 = a3;
  if (!SBFAudioCategoriesDisablingVolumeHUDIncludesCategory()
    || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Z-stack participant is suppressing the HUD for category '%@'"), v6), (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[SBAssistantController sharedInstanceIfExists](SBAssistantController, "sharedInstanceIfExists");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8
      && objc_msgSend(v8, "isVisible")
      && !objc_msgSend(v9, "shouldShowSystemVolumeHUDForCategory:", v6))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Siri is visible and is suppressing the HUD for category '%@'"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        goto LABEL_13;
    }
    else
    {

    }
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inCallPresentationManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "disablesSystemVolumeHUDForCategory:", v6);

    if (!v12
      || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBInCallPresentationManager is suppressing the HUD for category '%@'"), v6), (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (-[SBVolumeControl _isCategoryAlwaysHidden:](self, "_isCategoryAlwaysHidden:", v6))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("category '%@' is always hidden"), v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
    }
  }
LABEL_13:
  if (a4)
    *a4 = objc_retainAutorelease(v7);

  return v7 == 0;
}

- (BOOL)_isCategoryAlwaysHidden:(id)a3
{
  if ((-[NSMutableSet containsObject:](self->_alwaysHiddenCategories, "containsObject:", a3) & 1) != 0)
    return 1;
  else
    return -[NSMutableSet containsObject:](self->_alwaysHiddenCategories, "containsObject:", CFSTR("com.apple.springboard.volumeControl.HUDCategories.all"));
}

- (void)_processZStackParticipantSettings:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  SBVolumeControl *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "audioCategoriesDisablingVolumeHUD");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualSets() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, v4);
    -[SBVolumeControl lastDisplayedCategory](self, "lastDisplayedCategory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (SBFAudioCategoriesDisablingVolumeHUDIncludesCategory())
    {
      SBLogAudioControl();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 138412802;
        v8 = self;
        v9 = 2114;
        v10 = v5;
        v11 = 2114;
        v12 = v4;
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%@ Hiding Volume HUD if visible; lastDisplayedCategory='%{public}@', audioCategoriesDisablingVolumeHUD=%{public}@",
          (uint8_t *)&v7,
          0x20u);
      }

      -[SBVolumeControl hideVolumeHUDIfVisible](self, "hideVolumeHUDIfVisible");
    }

  }
}

- (NSString)lastDisplayedCategory
{
  return self->_lastDisplayedCategory;
}

- (SBVolumeControl)initWithHUDController:(id)a3 ringerControl:(id)a4 telephonyManager:(id)a5 conferenceManager:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  SBVolumeControl *v16;
  uint64_t v17;
  SBElasticHUDSettings *elasticHUDSettings;
  uint64_t v19;
  SBAVSystemControllerCache *avCache;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBVolumeControl.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("HUDController"));

    if (v13)
    {
LABEL_3:
      if (v14)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBVolumeControl.m"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("telephonyManager"));

      if (v15)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBVolumeControl.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ringerControl"));

  if (!v14)
    goto LABEL_10;
LABEL_4:
  if (v15)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBVolumeControl.m"), 118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("conferenceManager"));

LABEL_5:
  v27.receiver = self;
  v27.super_class = (Class)SBVolumeControl;
  v16 = -[SBVolumeControl init](&v27, sel_init);
  if (v16)
  {
    +[SBElasticHUDDomain rootSettings](SBElasticHUDDomain, "rootSettings");
    v17 = objc_claimAutoreleasedReturnValue();
    elasticHUDSettings = v16->_elasticHUDSettings;
    v16->_elasticHUDSettings = (SBElasticHUDSettings *)v17;

    -[PTSettings addKeyObserver:](v16->_elasticHUDSettings, "addKeyObserver:", v16);
    objc_storeStrong((id *)&v16->_hudController, a3);
    objc_storeStrong((id *)&v16->_ringerControl, a4);
    objc_storeStrong((id *)&v16->_telephonyManager, a5);
    objc_storeStrong((id *)&v16->_conferenceManager, a6);
    v16->_mode = 0;
    +[SBAVSystemControllerCache sharedInstance](SBAVSystemControllerCache, "sharedInstance");
    v19 = objc_claimAutoreleasedReturnValue();
    avCache = v16->_avCache;
    v16->_avCache = (SBAVSystemControllerCache *)v19;

    *(_WORD *)&v16->_volumeDownButtonIsDown = 0;
    -[SBVolumeControl _resetMediaServerConnection](v16, "_resetMediaServerConnection");
    v16->_effectiveVolumeLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v16, sel__effectiveVolumeChanged_, *MEMORY[0x1E0D47F68], 0);
    objc_msgSend(v21, "addObserver:selector:name:object:", v16, sel__serverConnectionDied_, *MEMORY[0x1E0D48200], 0);
    objc_msgSend(v21, "addObserver:selector:name:object:", v16, sel__someSceneWillConnect_, *MEMORY[0x1E0CEBB60], 0);

  }
  return v16;
}

- (float)volumeStepDown
{
  float result;

  -[SBElasticHUDSettings volumeStepDelta](self->_elasticHUDSettings, "volumeStepDelta");
  return result;
}

- (BOOL)canChangeVolumeForActiveCategory:(id)a3 isAudioSessionPlaying:(BOOL)a4
{
  id v5;
  char v6;

  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("FindMyPhone")))
    v6 = !a4;
  else
    v6 = objc_msgSend((id)objc_opt_class(), "_isVolumeManagedForCategory:", v5);

  return v6;
}

- (void)addAlwaysHiddenCategory:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  NSMutableSet *alwaysHiddenCategories;
  NSMutableSet *v8;
  NSMutableSet *v9;
  __CFString *v10;
  __CFString *v11;

  v4 = (__CFString *)a3;
  v5 = v4;
  if (!v4 || (v10 = v4, v6 = -[__CFString length](v4, "length"), v5 = v10, !v6))
  {

    v5 = CFSTR("com.apple.springboard.volumeControl.HUDCategories.all");
  }
  alwaysHiddenCategories = self->_alwaysHiddenCategories;
  v11 = v5;
  if (!alwaysHiddenCategories)
  {
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v9 = self->_alwaysHiddenCategories;
    self->_alwaysHiddenCategories = v8;

    v5 = v11;
    alwaysHiddenCategories = self->_alwaysHiddenCategories;
  }
  -[NSMutableSet addObject:](alwaysHiddenCategories, "addObject:", v5);

}

- (void)toggleMute
{
  BOOL v3;
  int v4;
  _QWORD v5[4];
  BOOL v6;

  if (MGGetBoolAnswer())
  {
    MGGetBoolAnswer();
LABEL_3:
    v3 = -[SBAVSystemControllerCache isFullyMuted](self->_avCache, "isFullyMuted");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __29__SBVolumeControl_toggleMute__block_invoke;
    v5[3] = &__block_descriptor_33_e28_v16__0__AVSystemController_8l;
    v6 = !v3;
    -[SBVolumeControl _dispatchAVSystemControllerAsync:](self, "_dispatchAVSystemControllerAsync:", v5);
    return;
  }
  v4 = MGGetBoolAnswer();
  if (!MGGetBoolAnswer() || v4)
    goto LABEL_3;
}

void __29__SBVolumeControl_toggleMute__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(unsigned __int8 *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "numberWithBool:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttribute:forKey:error:", v5, *MEMORY[0x1E0D47FA8], 0);

}

- (float)_effectiveVolume
{
  os_unfair_lock_s *p_effectiveVolumeLock;
  float effectiveVolume;

  p_effectiveVolumeLock = &self->_effectiveVolumeLock;
  os_unfair_lock_lock(&self->_effectiveVolumeLock);
  effectiveVolume = self->_effectiveVolume;
  os_unfair_lock_unlock(p_effectiveVolumeLock);
  return effectiveVolume;
}

- (void)setVolume:(float)a3 forCategory:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  float v12;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBVolumeControl.m"), 225, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("category"));

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__SBVolumeControl_setVolume_forCategory___block_invoke;
  v10[3] = &unk_1E8EA1B20;
  v12 = a3;
  v11 = v7;
  v8 = v7;
  -[SBVolumeControl _dispatchAVSystemControllerAsync:](self, "_dispatchAVSystemControllerAsync:", v10);

}

uint64_t __41__SBVolumeControl_setVolume_forCategory___block_invoke(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(a2, "setVolumeTo:forCategory:", *(_QWORD *)(a1 + 32), a3);
}

- (void)increaseVolume
{
  float v3;
  float v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[SBVolumeControl _buttonRepeatDelay](self, "_buttonRepeatDelay");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_increaseVolume, 0);
  -[SBVolumeControl volumeStepUp](self, "volumeStepUp");
  -[SBVolumeControl changeVolumeByDelta:](self, "changeVolumeByDelta:");
  v6[0] = *MEMORY[0x1E0C99860];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBVolumeControl performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel_increaseVolume, 0, v5, v4);

  self->_debounce = 0;
}

- (void)decreaseVolume
{
  float v3;
  float v4;
  float v5;
  double v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[SBVolumeControl _buttonRepeatDelay](self, "_buttonRepeatDelay");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_decreaseVolume, 0);
  -[SBVolumeControl volumeStepDown](self, "volumeStepDown");
  *(float *)&v6 = -v5;
  -[SBVolumeControl changeVolumeByDelta:](self, "changeVolumeByDelta:", v6);
  v8[0] = *MEMORY[0x1E0C99860];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBVolumeControl performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel_decreaseVolume, 0, v7, v4);

  self->_debounce = 0;
}

- (void)handleVolumeButtonWithType:(int64_t)a3 down:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  char *v15;
  _BOOL8 volumeUpButtonIsDown;
  _BOOL8 volumeDownButtonIsDown;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isUILocked");
  -[SBVolumeControl presentedVolumeHUDViewController](self, "presentedVolumeHUDViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 103)
  {
    SBLogButtonsVolume();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = "up";
      if (v4)
        v13 = "down";
      *(_DWORD *)buf = 136446210;
      v27 = v13;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "SBVolumeControl -- volume decrement -- button state: %{public}s", buf, 0xCu);
    }

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_increaseVolume, 0);
      self->_volumeDownButtonIsDown = 1;
      self->_debounce = 1;
      -[SBVolumeControl decreaseVolume](self, "decreaseVolume");
    }
    else
    {
      self->_volumeDownButtonIsDown = 0;
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_decreaseVolume, 0);
    }
    if (self->_volumeDownButtonIsDown)
    {
      if (!-[SBVolumeControl _isHUDDisplayableForLastEventCategoryWithReason:](self, "_isHUDDisplayableForLastEventCategoryWithReason:", 0))goto LABEL_29;
      volumeDownButtonIsDown = self->_volumeDownButtonIsDown;
    }
    else
    {
      volumeDownButtonIsDown = 0;
    }
    objc_msgSend(v9, "noteButtonDownWasHit:", volumeDownButtonIsDown);
    if (!v8)
      goto LABEL_34;
    goto LABEL_30;
  }
  if (a3 == 102)
  {
    SBLogButtonsVolume();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = "up";
      if (v4)
        v11 = "down";
      *(_DWORD *)buf = 136446210;
      v27 = v11;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "SBVolumeControl -- volume increment -- button state: %{public}s", buf, 0xCu);
    }

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_decreaseVolume, 0);
      self->_volumeUpButtonIsDown = 1;
      self->_debounce = 1;
      -[SBVolumeControl increaseVolume](self, "increaseVolume");
    }
    else
    {
      self->_volumeUpButtonIsDown = 0;
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_increaseVolume, 0);
    }
    if (self->_volumeUpButtonIsDown)
    {
      if (!-[SBVolumeControl _isHUDDisplayableForLastEventCategoryWithReason:](self, "_isHUDDisplayableForLastEventCategoryWithReason:", 0))goto LABEL_29;
      volumeUpButtonIsDown = self->_volumeUpButtonIsDown;
    }
    else
    {
      volumeUpButtonIsDown = 0;
    }
    objc_msgSend(v9, "noteButtonUpWasHit:", volumeUpButtonIsDown);
LABEL_29:
    if (!v8)
      goto LABEL_34;
    goto LABEL_30;
  }
  SBLogButtonsVolume();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    SB_NSStringFromUIPressType();
    v15 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v15;
    _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "SBVolumeControl -- unknown volume press: %{public}@", buf, 0xCu);

  }
  if (v8)
  {
LABEL_30:
    objc_msgSend(v7, "lockScreenEnvironment");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "backlightController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isInScreenOffMode");

    if ((v20 & 1) == 0)
    {
      +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0CB3940];
      SB_NSStringFromUIPressType();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("SBVolumeButton:%@"), v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "resetIdleTimerForReason:", v24);

    }
  }
LABEL_34:
  if (!v4)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __51__SBVolumeControl_handleVolumeButtonWithType_down___block_invoke;
    v25[3] = &unk_1E8EA1B48;
    v25[4] = self;
    -[SBVolumeControl _dispatchAVSystemControllerAsync:](self, "_dispatchAVSystemControllerAsync:", v25);
  }

}

void __51__SBVolumeControl_handleVolumeButtonWithType_down___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SBVolumeControl_handleVolumeButtonWithType_down___block_invoke_2;
  block[3] = &unk_1E8E9DED8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __51__SBVolumeControl_handleVolumeButtonWithType_down___block_invoke_2(uint64_t a1)
{
  -[SBRingerControl buttonReleased](*(id **)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)cancelVolumeEvent
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_increaseVolume, 0);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_decreaseVolume, 0);
}

- (void)removeAlwaysHiddenCategory:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;

  v4 = (__CFString *)a3;
  v5 = v4;
  if (!v4 || (v7 = v4, v6 = -[__CFString length](v4, "length"), v5 = v7, !v6))
  {

    v5 = CFSTR("com.apple.springboard.volumeControl.HUDCategories.all");
  }
  v8 = v5;
  -[NSMutableSet removeObject:](self->_alwaysHiddenCategories, "removeObject:", v5);

}

- (void)clearAlwaysHiddenCategories
{
  -[NSMutableSet removeAllObjects](self->_alwaysHiddenCategories, "removeAllObjects");
}

- (id)existingVolumeHUDViewController
{
  void *v2;
  void *v3;

  -[SBHUDController knownHUDControllerForIdentifier:](self->_hudController, "knownHUDControllerForIdentifier:", *MEMORY[0x1E0DAB7E0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "HUDViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)hideVolumeHUDIfVisible
{
  id v2;

  -[SBHUDController presentedHUDControllerForIdentifier:](self->_hudController, "presentedHUDControllerForIdentifier:", *MEMORY[0x1E0DAB7E0]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismiss");

}

- (id)acquireVolumeHUDHiddenAssertionForReason:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SBVolumeControl cancelVolumeEvent](self, "cancelVolumeEvent");
  -[SBHUDController acquireHUDHiddenAssertionForIdentifier:withReason:](self->_hudController, "acquireHUDHiddenAssertionForIdentifier:withReason:", *MEMORY[0x1E0DAB7E0], v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setActiveCategoryVolume:(float)a3
{
  _QWORD v3[4];
  float v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__SBVolumeControl_setActiveCategoryVolume___block_invoke;
  v3[3] = &__block_descriptor_36_e28_v16__0__AVSystemController_8l;
  v4 = a3;
  -[SBVolumeControl _dispatchAVSystemControllerAsync:](self, "_dispatchAVSystemControllerAsync:", v3);
}

uint64_t __43__SBVolumeControl_setActiveCategoryVolume___block_invoke(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return objc_msgSend(a2, "setActiveCategoryVolumeTo:", a3);
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

- (void)_setMediaVolumeForIAP:(float)a3
{
  _QWORD v3[4];
  float v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__SBVolumeControl__setMediaVolumeForIAP___block_invoke;
  v3[3] = &__block_descriptor_36_e28_v16__0__AVSystemController_8l;
  v4 = a3;
  -[SBVolumeControl _dispatchAVSystemControllerAsync:](self, "_dispatchAVSystemControllerAsync:", v3);
}

void __41__SBVolumeControl__setMediaVolumeForIAP___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "volumeCategoryForAudioCategory:", CFSTR("MediaPlayback"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = *(_DWORD *)(a1 + 32);
  objc_msgSend(v3, "setVolumeTo:forCategory:", v5, v4);

}

- (float)_getMediaVolumeForIAP
{
  float v2;
  _QWORD v4[5];
  uint64_t v5;
  float *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = (float *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__SBVolumeControl__getMediaVolumeForIAP__block_invoke;
  v4[3] = &unk_1E8EA1B90;
  v4[4] = &v5;
  -[SBVolumeControl _dispatchAVSystemControllerSync:](self, "_dispatchAVSystemControllerSync:", v4);
  v2 = v6[6];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __40__SBVolumeControl__getMediaVolumeForIAP__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "volumeCategoryForAudioCategory:", CFSTR("MediaPlayback"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getVolume:forCategory:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24, v4);

}

+ (BOOL)_isVolumeChangeAllowedForState:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!v6)
    goto LABEL_13;
  if (objc_msgSend(v6, "isLocked")
    && (objc_msgSend(v7, "isHostingAppOnLockScreen") & 1) == 0
    && (objc_msgSend(v7, "isAudioPlayingSomewhere") & 1) == 0
    && (objc_msgSend(v7, "isCallOrFaceTimeActive") & 1) == 0
    && (objc_msgSend(v7, "isShowingLockScreenMediaControls") & 1) == 0)
  {
    if (!a4)
      goto LABEL_13;
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2D50];
    v20[0] = CFSTR("state");
    v20[1] = v17;
    v21[0] = v7;
    v21[1] = CFSTR("SpringBoard can't change the volume because the device is locked, no app is being hosted on the lock screen, and no audio is playing anywhere.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v16;
    v14 = 1;
LABEL_12:
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.springboard.volumeControl.state"), v14, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  if ((objc_msgSend(v7, "currentRouteHasVolumeControl") & 1) != 0)
  {
    v8 = 1;
    goto LABEL_14;
  }
  v9 = objc_msgSend(v7, "isFullyMuted");
  v8 = v9;
  if (a4 && (v9 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2D50];
    v18[0] = CFSTR("state");
    v18[1] = v11;
    v19[0] = a1;
    v19[1] = CFSTR("SpringBoard can change the volume only if the current route has volume control, or if we're fully muted..");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v10;
    v14 = 2;
    goto LABEL_12;
  }
LABEL_14:

  return v8;
}

- (void)changeVolumeByDelta:(float)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  double v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  BOOL v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  float v26;
  BOOL v27;
  char v28;
  char v29;
  char v30;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBVolumeControl changeVolumeByDelta:]");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("SBVolumeControl.m"), 538, CFSTR("this call must be made on the main thread"));

  }
  ++changeVolumeByDelta__volumeChangeSessionId;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)SBApp, "authenticationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBVolumeControl _effectiveVolume](self, "_effectiveVolume");
    if (!self->_debounce)
    {
      v11 = v10;
      if ((BSFloatLessThanOrEqualToFloat() & 1) == 0 && (BSFloatGreaterThanOrEqualToFloat() & 1) == 0)
      {
        -[SBVolumeControl presentedVolumeHUDViewController](self, "presentedVolumeHUDViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v13 = fminf(fmaxf(v11 + a3, 0.0), 1.0);
        objc_msgSend(v12, "noteValueWillDeltaStepToValue:", v13);

      }
    }
    if (objc_msgSend(v7, "isUILocked"))
    {
      if (!objc_msgSend(v9, "isAuthenticated"))
      {
        v14 = 1;
        goto LABEL_16;
      }
      if ((objc_msgSend(v9, "hasPasscodeSet") & 1) == 0)
      {
        v14 = -[NSObject hasBeenDismissedSinceKeybagLock](v8, "hasBeenDismissedSinceKeybagLock") ^ 1;
        goto LABEL_16;
      }
    }
    v14 = 0;
LABEL_16:
    objc_msgSend(v7, "lockScreenEnvironment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "applicationHoster");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isHostingAnApp");

    objc_msgSend(v7, "lockScreenEnvironment");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "mediaControlsPresenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isShowingMediaControls");

    v21 = -[SBTelephonyManager inCall](self->_telephonyManager, "inCall")
       || -[SBConferenceManager inFaceTime](self->_conferenceManager, "inFaceTime");
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __39__SBVolumeControl_changeVolumeByDelta___block_invoke;
    v24[3] = &unk_1E8EA1BE0;
    v24[4] = self;
    v25 = v6;
    v26 = a3;
    v27 = v21;
    v28 = v14;
    v29 = v17;
    v30 = v20;
    -[SBVolumeControl _dispatchAVSystemControllerAsync:](self, "_dispatchAVSystemControllerAsync:", v24);

    goto LABEL_20;
  }
  SBLogAudioControl();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[SBVolumeControl changeVolumeByDelta:].cold.1((uint64_t)v6, v8, a3);
LABEL_20:

}

void __39__SBVolumeControl_changeVolumeByDelta___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  SBVolumeControlState *v7;
  char v8;
  SBVolumeControlState *v9;
  id v10;
  uint64_t v11;
  double v12;
  SBVolumeControlState *v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  double v24;
  _QWORD block[5];
  int v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  double v31;
  __int16 v32;
  SBVolumeControlState *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(v4, "activeCategoryName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isAudioSessionPlaying");
  if ((objc_msgSend(*(id *)(a1 + 32), "canChangeVolumeForActiveCategory:isAudioSessionPlaying:", v5, v6) & 1) != 0)
  {
    v7 = objc_alloc_init(SBVolumeControlState);
    -[SBVolumeControlState setAudioPlayingSomewhere:](v7, "setAudioPlayingSomewhere:", v6);
    -[SBVolumeControlState setCallOrFaceTimeActive:](v7, "setCallOrFaceTimeActive:", *(unsigned __int8 *)(a1 + 52));
    -[SBVolumeControlState setFullyMuted:](v7, "setFullyMuted:", objc_msgSend(v4, "isFullyMuted"));
    -[SBVolumeControlState setRingerMuted:](v7, "setRingerMuted:", -[SBRingerControl isRingerMuted](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24)));
    -[SBVolumeControlState setCurrentRouteHasVolumeControl:](v7, "setCurrentRouteHasVolumeControl:", objc_msgSend(v3, "currentRouteHasVolumeControl"));
    -[SBVolumeControlState setActiveVolumeCategoryName:](v7, "setActiveVolumeCategoryName:", v5);
    -[SBVolumeControlState setLocked:](v7, "setLocked:", *(unsigned __int8 *)(a1 + 53));
    -[SBVolumeControlState setHostingAppOnLockScreen:](v7, "setHostingAppOnLockScreen:", *(unsigned __int8 *)(a1 + 54));
    -[SBVolumeControlState setShowingLockScreenMediaControls:](v7, "setShowingLockScreenMediaControls:", *(unsigned __int8 *)(a1 + 55));
    v27 = 0;
    v8 = objc_msgSend((id)objc_opt_class(), "_isVolumeChangeAllowedForState:error:", v7, &v27);
    v9 = (SBVolumeControlState *)v27;
    v10 = v5;
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Audio/Video")) & 1) != 0
      || (objc_msgSend(v10, "isEqualToString:", CFSTR("PhoneCall")) & 1) != 0
      || (objc_msgSend(v10, "isEqualToString:", CFSTR("Ringtone")) & 1) == 0
      && (objc_msgSend(v10, "isEqualToString:", CFSTR("RingtonePreview")) & 1) == 0)
    {

    }
    else
    {

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __39__SBVolumeControl_changeVolumeByDelta___block_invoke_93;
      block[3] = &unk_1E8EA1BB8;
      block[4] = *(_QWORD *)(a1 + 32);
      v26 = *(_DWORD *)(a1 + 48);
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    SBLogAudioControl();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if ((v8 & 1) != 0)
    {
      if (v15)
      {
        v16 = *(_QWORD *)(a1 + 40);
        v17 = *(float *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        v29 = v16;
        v30 = 2048;
        v31 = v17;
        v32 = 2114;
        v33 = v7;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@) Attempting to change volume by delta %f for state '%{public}@'", buf, 0x20u);
      }

      if ((objc_msgSend(v3, "changeActiveCategoryVolume:", *(float *)(a1 + 48) > 0.0) & 1) == 0)
      {
        SBLogAudioControl();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          __39__SBVolumeControl_changeVolumeByDelta___block_invoke_cold_1(a1, (float *)(a1 + 48), v14);
        goto LABEL_22;
      }
      SBLogAudioControl();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v23 = *(_QWORD *)(a1 + 40);
        v24 = *(float *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        v29 = v23;
        v30 = 2048;
        v31 = v24;
        v20 = "(%{public}@)Volume Change by delta '%f' was Accepted";
        v21 = v14;
        v22 = 22;
        goto LABEL_19;
      }
    }
    else if (v15)
    {
      v18 = *(_QWORD *)(a1 + 40);
      v19 = *(float *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v29 = v18;
      v30 = 2048;
      v31 = v19;
      v32 = 2114;
      v33 = v9;
      v20 = "(%{public}@)Volume Change by delta '%f' was Denied; reason: %{public}@";
      v21 = v14;
      v22 = 32;
LABEL_19:
      _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
    }
LABEL_22:

    goto LABEL_23;
  }
  SBLogAudioControl();
  v7 = (SBVolumeControlState *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(float *)(a1 + 48);
    v13 = (SBVolumeControlState *)objc_msgSend(v5, "copy");
    *(_DWORD *)buf = 138543874;
    v29 = v11;
    v30 = 2048;
    v31 = v12;
    v32 = 2114;
    v33 = v13;
    _os_log_impl(&dword_1D0540000, &v7->super, OS_LOG_TYPE_DEFAULT, "(%{public}@)Volume Change by delta '%f' was Denied; reason: active category '%{public}@' is not managed by SBVolumeControl",
      buf,
      0x20u);

  }
LABEL_23:

}

void __39__SBVolumeControl_changeVolumeByDelta___block_invoke_93(uint64_t a1)
{
  -[SBRingerControl nudgeUp:](*(id **)(*(_QWORD *)(a1 + 32) + 24), *(float *)(a1 + 40) > 0.0);
}

- (float)_buttonRepeatDelay
{
  return flt_1D0E88630[!self->_debounce];
}

- (void)_presentVolumeHUDWithVolume:(float)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SBElasticHUDViewController *v10;
  double v11;
  id v12;
  id v13;

  if (self->_mode != 3)
  {
    v5 = *MEMORY[0x1E0DAB7E0];
    -[SBHUDController knownHUDControllerForIdentifier:](self->_hudController, "knownHUDControllerForIdentifier:", *MEMORY[0x1E0DAB7E0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "HUDViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      +[SBElasticValueViewControllerFactory factoryWithVolumeDataSource:](SBElasticValueViewControllerFactory, "factoryWithVolumeDataSource:", self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SBElasticHUDViewController initWithFactory:]([SBElasticHUDViewController alloc], "initWithFactory:", v9);

      -[SBElasticHUDViewController setDelegate:](v10, "setDelegate:", self);
      -[SBHUDController HUDSessionForViewController:identifier:](self->_hudController, "HUDSessionForViewController:identifier:", v10, v5);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      v8 = v12;
      v7 = v10;
    }
    v13 = v8;
    objc_msgSend(v8, "presentWithDismissalInterval:animated:", 0, 60.0);
    *(float *)&v11 = a3;
    objc_msgSend(v7, "noteValueDidChange:", v11);
    if (v6)
      goto LABEL_12;
    if (self->_volumeUpButtonIsDown)
    {
      if (!self->_volumeDownButtonIsDown)
        goto LABEL_11;
    }
    else if (!self->_volumeDownButtonIsDown)
    {
      goto LABEL_12;
    }
    objc_msgSend(v7, "noteButtonDownWasHit:", 1);
    if (self->_volumeUpButtonIsDown)
LABEL_11:
      objc_msgSend(v7, "noteButtonUpWasHit:", 1);
LABEL_12:

  }
}

- (BOOL)_isVolumeHUDVisible
{
  void *v2;
  void *v3;
  char v4;

  -[SBHUDController knownHUDControllerForIdentifier:](self->_hudController, "knownHUDControllerForIdentifier:", *MEMORY[0x1E0DAB7E0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isVisible");
  else
    v4 = 0;

  return v4;
}

- (void)_someSceneWillConnect:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHUDController windowScene](self->_hudController, "windowScene");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v5 || v5 != (void *)v6)
    goto LABEL_5;
  objc_msgSend(v5, "zStackResolver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "addObserver:ofParticipantWithIdentifier:", self, 30);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBVolumeControl _processZStackParticipantSettings:](self, "_processZStackParticipantSettings:", v10);

LABEL_5:
    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The connected window scene should have a zStackResolver"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SBVolumeControl _someSceneWillConnect:].cold.1(a2, (uint64_t)self, (uint64_t)v11);
  objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)_resetMediaServerConnection
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__SBVolumeControl__resetMediaServerConnection__block_invoke;
  v2[3] = &unk_1E8EA1B48;
  v2[4] = self;
  -[SBVolumeControl _dispatchAVSystemControllerAsync:](self, "_dispatchAVSystemControllerAsync:", v2);
}

void __46__SBVolumeControl__resetMediaServerConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  _QWORD block[5];
  int v6;
  int v7;
  int v8;

  v8 = 0;
  v3 = a2;
  objc_msgSend(v3, "getActiveCategoryVolume:andName:", &v8, 0);
  LODWORD(v4) = v8;
  objc_msgSend(*(id *)(a1 + 32), "_updateEffectiveVolume:", v4);
  v7 = 0;
  objc_msgSend(v3, "getVolume:forCategory:", &v7, CFSTR("Ringtone"));

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SBVolumeControl__resetMediaServerConnection__block_invoke_2;
  block[3] = &unk_1E8EA1BB8;
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __46__SBVolumeControl__resetMediaServerConnection__block_invoke_2(uint64_t a1)
{
  -[SBRingerControl setVolume:forKeyPress:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 0, *(float *)(a1 + 40));
}

- (id)_avscOperationsQueue
{
  OS_dispatch_queue *avscOperationsQueue;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *v10;
  void *v12;

  avscOperationsQueue = self->_avscOperationsQueue;
  if (!avscOperationsQueue)
  {
    -[SBAVSystemControllerCache avscOperationsWorkloop](self->_avCache, "avscOperationsWorkloop");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBVolumeControl.m"), 825, CFSTR("Must use the AVSC cache's target workloop"));

    }
    objc_msgSend(MEMORY[0x1E0D01760], "serial");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serviceClass:relativePriority:", 25, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "targetQueue:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (OS_dispatch_queue *)BSDispatchQueueCreate();
    v10 = self->_avscOperationsQueue;
    self->_avscOperationsQueue = v9;

    avscOperationsQueue = self->_avscOperationsQueue;
  }
  return avscOperationsQueue;
}

- (void)_dispatchAVSystemControllerAsync:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD block[4];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBVolumeControl.m"), 833, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  -[SBVolumeControl _avscOperationsQueue](self, "_avscOperationsQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SBVolumeControl__dispatchAVSystemControllerAsync___block_invoke;
  block[3] = &unk_1E8E9E8D0;
  v10 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

void __52__SBVolumeControl__dispatchAVSystemControllerAsync___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)_dispatchAVSystemControllerSync:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBVolumeControl.m"), 840, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  -[SBVolumeControl _avscOperationsQueue](self, "_avscOperationsQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SBVolumeControl__dispatchAVSystemControllerSync___block_invoke;
  block[3] = &unk_1E8E9E8D0;
  v10 = v5;
  v8 = v5;
  dispatch_async_and_wait(v6, block);

}

void __51__SBVolumeControl__dispatchAVSystemControllerSync___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)controlCenterWillPresent
{
  id v2;

  -[SBHUDController knownHUDControllerForIdentifier:](self->_hudController, "knownHUDControllerForIdentifier:", *MEMORY[0x1E0DAB7E0]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismiss");

}

- (BOOL)elasticValueViewController:(id)a3 updateCurrentValue:(float)a4
{
  -[SBVolumeControl setActiveCategoryVolume:](self, "setActiveCategoryVolume:", a3);
  return 1;
}

- (BOOL)elasticHUDViewControllerCanBePresented:(id)a3 withReason:(id *)a4
{
  return -[SBVolumeControl _isHUDDisplayableWithReason:](self, "_isHUDDisplayableWithReason:", a4);
}

- (void)elasticHUDViewControllerRequestsDismissal:(id)a3
{
  id v3;

  -[SBHUDController presentedHUDControllerForIdentifier:](self->_hudController, "presentedHUDControllerForIdentifier:", *MEMORY[0x1E0DAB7E0]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissAnimated:", 0);

}

- (void)zStackParticipantWithIdentifier:(int64_t)a3 wasAcquiredWithSettings:(id)a4
{
  -[SBVolumeControl _processZStackParticipantSettings:](self, "_processZStackParticipantSettings:", a4);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controlCenterController);
  objc_storeStrong((id *)&self->_lastDisplayedCategory, 0);
  objc_storeStrong((id *)&self->_avCache, 0);
  objc_storeStrong((id *)&self->_avscOperationsQueue, 0);
  objc_storeStrong((id *)&self->_lastEventCategory, 0);
  objc_storeStrong((id *)&self->_alwaysHiddenCategories, 0);
  objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, 0);
  objc_storeStrong((id *)&self->_conferenceManager, 0);
  objc_storeStrong((id *)&self->_telephonyManager, 0);
  objc_storeStrong((id *)&self->_ringerControl, 0);
  objc_storeStrong((id *)&self->_elasticHUDSettings, 0);
  objc_storeStrong((id *)&self->_hudController, 0);
}

- (void)changeVolumeByDelta:(float)a3 .cold.1(uint64_t a1, NSObject *a2, float a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2048;
  v6 = a3;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "(%{public}@)Volume Change by delta '%f' was Denied; reason: SBLockScreenManager not initialized",
    (uint8_t *)&v3,
    0x16u);
}

double __39__SBVolumeControl_changeVolumeByDelta___block_invoke_cold_1(uint64_t a1, float *a2, os_log_t log)
{
  uint64_t v3;
  double v4;
  double result;
  int v6;
  uint64_t v7;
  __int16 v8;
  double v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *a2;
  v6 = 138543874;
  v7 = v3;
  v8 = 2048;
  v9 = v4;
  v10 = 2114;
  v11 = CFSTR("Active Category volume change came back false.");
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "(%{public}@)Volume Change by delta '%f' was Denied; reason: %{public}@",
    (uint8_t *)&v6,
    0x20u);
  return result;
}

- (void)_someSceneWillConnect:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
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
  v15 = CFSTR("SBVolumeControl.m");
  v16 = 1024;
  v17 = 706;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
