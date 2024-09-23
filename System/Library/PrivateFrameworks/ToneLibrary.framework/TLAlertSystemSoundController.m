@implementation TLAlertSystemSoundController

- (TLAlertSystemSoundController)init
{
  TLAlertSystemSoundController *v2;
  uint64_t v3;
  TLAudioQueue *audioQueue;
  uint64_t v5;
  NSMapTable *alertSystemSoundContexts;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TLAlertSystemSoundController;
  v2 = -[TLAlertSystemSoundController init](&v8, sel_init);
  if (v2)
  {
    +[TLAudioQueue sharedAudioQueue](TLAudioQueue, "sharedAudioQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    audioQueue = v2->_audioQueue;
    v2->_audioQueue = (TLAudioQueue *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 1);
    alertSystemSoundContexts = v2->_alertSystemSoundContexts;
    v2->_alertSystemSoundContexts = (NSMapTable *)v5;

    v2->_backlightStatus = -1;
  }
  return v2;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  TLAudioQueue *v4;
  TLAudioQueue *audioQueue;
  NSMapTable *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v14;
  objc_super v15;
  _QWORD v16[4];
  id v17;
  TLAlertSystemSoundController *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v4 = self->_audioQueue;
  audioQueue = self->_audioQueue;
  self->_audioQueue = 0;

  -[TLAudioQueue assertNotRunningOnAudioQueue](v4, "assertNotRunningOnAudioQueue");
  os_unfair_lock_lock(p_lock);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_alertSystemSoundContexts;
  v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (!v9)
          v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v9, "addObject:", v12);
      }
      v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  if (objc_msgSend(v9, "count"))
  {
    -[TLAlertSystemSoundController _prepareForStoppingAlerts:withOptions:playbackCompletionType:](self, "_prepareForStoppingAlerts:withOptions:playbackCompletionType:", v9, 0, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  os_unfair_lock_unlock(p_lock);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __39__TLAlertSystemSoundController_dealloc__block_invoke;
  v16[3] = &unk_1E952A6A8;
  v17 = v13;
  v18 = self;
  v14 = v13;
  -[TLAudioQueue performSynchronousTaskWithBlock:](v4, "performSynchronousTaskWithBlock:", v16);

  v15.receiver = self;
  v15.super_class = (Class)TLAlertSystemSoundController;
  -[TLAlertSystemSoundController dealloc](&v15, sel_dealloc);
}

uint64_t __39__TLAlertSystemSoundController_dealloc__block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(result + 40), "_processStopTasksDescriptor:");
  return result;
}

- (void)playAlert:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  TLAlertPlaybackCompletionContext *v8;
  void *v9;
  void *v10;
  void *v11;
  TLAlertSystemSoundContext *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  TLAudioQueue *audioQueue;
  _QWORD v18[5];
  id v19;
  TLAlertSystemSoundContext *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v8 = objc_alloc_init(TLAlertPlaybackCompletionContext);
  -[TLAlertPlaybackCompletionContext setCompletionHandler:](v8, "setCompletionHandler:", v7);

  -[TLAlertPlaybackCompletionContext setPlaybackCompletionType:](v8, "setPlaybackCompletionType:", 0);
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v6, "playbackObserver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_toneIdentifierForDeemphasizingAlert:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_vibrationIdentifierForDeemphasizingAlert:correspondingToneIdentifierForDeemphasizingAlert:", v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(TLAlertSystemSoundContext);
  -[TLAlertSystemSoundContext setToneIdentifierForDeemphasizingAlert:](v12, "setToneIdentifierForDeemphasizingAlert:", v10);
  -[TLAlertSystemSoundContext setVibrationIdentifierForDeemphasizingAlert:](v12, "setVibrationIdentifierForDeemphasizingAlert:", v11);
  -[TLAlertSystemSoundContext setPlaybackCompletionContext:](v12, "setPlaybackCompletionContext:", v8);
  -[TLAlertSystemSoundContext setPlaybackObserver:](v12, "setPlaybackObserver:", v9);
  v13 = -[TLAlertSystemSoundController _considerDeferringPlayingAlertForBacklightStatusResolution:alertSystemSoundContext:](self, "_considerDeferringPlayingAlertForBacklightStatusResolution:alertSystemSoundContext:", v6, v12);
  v15 = v14;
  if ((v14 & 0x100) != 0)
  {
    -[NSMapTable setObject:forKey:](self->_alertSystemSoundContexts, "setObject:forKey:", v12, v6);

    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v16 = v13;
    -[TLAlertSystemSoundContext setLoadingSound:](v12, "setLoadingSound:", 1);
    -[NSMapTable setObject:forKey:](self->_alertSystemSoundContexts, "setObject:forKey:", v12, v6);

    os_unfair_lock_unlock(&self->_lock);
    audioQueue = self->_audioQueue;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __64__TLAlertSystemSoundController_playAlert_withCompletionHandler___block_invoke;
    v18[3] = &unk_1E952B508;
    v18[4] = self;
    v19 = v6;
    v20 = v12;
    v21 = v10;
    v22 = v11;
    v23 = v16;
    v24 = v15;
    -[TLAudioQueue performTaskWithBlock:](audioQueue, "performTaskWithBlock:", v18);

  }
}

uint64_t __64__TLAlertSystemSoundController_playAlert_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_playAlert:alertSystemSoundContext:toneIdentifierForDeemphasizingAlert:vibrationIdentifierForDeemphasizingAlert:backlightStatusResolutionDeferralContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
}

- (void)_playAlert:(id)a3 alertSystemSoundContext:(id)a4 toneIdentifierForDeemphasizingAlert:(id)a5 vibrationIdentifierForDeemphasizingAlert:(id)a6 backlightStatusResolutionDeferralContext:(id)a7
{
  BOOL var1;
  int64_t var0;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  TLAlertSystemSoundController *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  var1 = a7.var1;
  var0 = a7.var0;
  v40 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  v17 = (void *)objc_opt_class();
  v18 = var1 && var0 == 1;
  if (var1 && var0 == 1)
    v19 = v16;
  else
    v19 = 0;
  objc_msgSend(v17, "_soundForAlert:toneIdentifierForDeemphasizingAlert:", v13, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v15;
  if (v18 == 1)
  {
    v21 = v15;
  }
  else
  {
    objc_msgSend(v13, "vibrationIdentifier", v15);
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22 = v21;
  v23 = objc_msgSend(v20, "isValid", v31);
  TLLogPlayback();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (!v23)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v35 = self;
      v36 = 2114;
      v37 = v13;
      v38 = 2114;
      v39 = v20;
      _os_log_error_impl(&dword_1D33D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@: _playAlert:(%{public}@) […]. Failed to begin playback with invalid sound: %{public}@.", buf, 0x20u);
    }

    os_unfair_lock_lock(&self->_lock);
    v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[TLAlertSystemSoundController _removeAlert:alertSystemSoundContext:didFailToPrepareSound:appendingPlaybackCompletionContextToArray:](self, "_removeAlert:alertSystemSoundContext:didFailToPrepareSound:appendingPlaybackCompletionContextToArray:", v13, v14, 1, v27);
    objc_msgSend(v14, "setLoadingSound:", 0);
    v29 = 0;
    v28 = 0;
    goto LABEL_20;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v35 = self;
    v36 = 2114;
    v37 = v13;
    v38 = 2114;
    v39 = v20;
    _os_log_impl(&dword_1D33D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: _playAlert:(%{public}@) […]. Sound: %{public}@.", buf, 0x20u);
  }

  os_unfair_lock_lock(&self->_lock);
  if ((objc_msgSend(v14, "isBeingInterrupted") & 1) == 0)
  {
    objc_msgSend(v14, "setSound:", v20);
    objc_msgSend(v14, "setVibrationIdentifier:", v22);
    objc_msgSend(v14, "setDeemphasized:", v18 & 1);
    objc_msgSend(v14, "setLoadingSound:", 0);
    if (var1)
      -[TLAlertSystemSoundController _beginRequiringBacklightObservationForAlert:alertSystemSoundContext:](self, "_beginRequiringBacklightObservationForAlert:alertSystemSoundContext:", v13, v14);
    -[TLAlertSystemSoundController _prepareForPreemptingAlertsBeforeBeginningPlaybackOfAlert:withSound:playbackCompletionType:](self, "_prepareForPreemptingAlertsBeforeBeginningPlaybackOfAlert:withSound:playbackCompletionType:", v13, v20, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLAlertSystemSoundController _playTaskDescriptorForAlert:withSound:vibrationIdentifier:alertSystemSoundContext:](self, "_playTaskDescriptorForAlert:withSound:vibrationIdentifier:alertSystemSoundContext:", v13, v20, v22, v14);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
LABEL_20:
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_21;
  }
  objc_msgSend(v14, "setLoadingSound:", 0);
  os_unfair_lock_unlock(&self->_lock);
  TLLogPlayback();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v35 = self;
    v36 = 2114;
    v37 = v13;
    _os_log_impl(&dword_1D33D5000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: _playAlert:(%{public}@) […]. Aborting playback because this alert is already being interrupted.", buf, 0x16u);
  }

  v27 = 0;
  v28 = 0;
  v29 = 0;
LABEL_21:
  if (objc_msgSend(v27, "count"))
    -[TLAlertSystemSoundController _processPlaybackCompletionContexts:](self, "_processPlaybackCompletionContexts:", v27);
  if (v29)
    -[TLAlertSystemSoundController _processStopTasksDescriptor:](self, "_processStopTasksDescriptor:", v29);
  if (v28)
  {
    v33 = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLAlertSystemSoundController _processPlayTaskDescriptors:](self, "_processPlayTaskDescriptors:", v30);

  }
}

- ($61DF9F24A7329A1BB61181F7D05C320D)_considerDeferringPlayingAlertForBacklightStatusResolution:(id)a3 alertSystemSoundContext:(id)a4
{
  id v6;
  id v7;
  int64_t backlightStatus;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  int64_t v14;
  int v15;
  TLAlertSystemSoundController *v16;
  __int16 v17;
  id v18;
  uint64_t v19;
  $61DF9F24A7329A1BB61181F7D05C320D result;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  backlightStatus = self->_backlightStatus;
  objc_msgSend(v7, "toneIdentifierForDeemphasizingAlert");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  v11 = 0;
  if (v10 && backlightStatus == -1)
  {
    TLLogPlayback();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v6;
      _os_log_impl(&dword_1D33D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: _considerDeferringPlayingAlertForBacklightStatusResolution:(%{public}@) […]. Deemphasizing this alert is allowed but the backlight status is unknown. Deferring until the backlight status is known.", (uint8_t *)&v15, 0x16u);
    }

    -[TLAlertSystemSoundController _beginRequiringBacklightObservationForAlert:alertSystemSoundContext:](self, "_beginRequiringBacklightObservationForAlert:alertSystemSoundContext:", v6, v7);
    v11 = 256;
  }

  v13 = v11 | (v10 != 0);
  v14 = backlightStatus;
  result.var1 = v13;
  result.var2 = BYTE1(v13);
  result.var0 = v14;
  return result;
}

- (id)_playTaskDescriptorForAlert:(id)a3 withSound:(id)a4 vibrationIdentifier:(id)a5 alertSystemSoundContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  TLAlertSystemSoundPlayTaskDescriptor *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v14 = v10;
  if (objc_msgSend(v10, "hasPlaybackStarted"))
  {
    if (objc_msgSend(v10, "isDeemphasized"))
    {
      if (objc_msgSend(v10, "hasDeemphasizedPlaybackStarted"))
        v14 = 0;
      else
        v14 = v10;
    }
    else
    {
      v14 = 0;
    }
  }
  v15 = -[TLAlertSystemSoundPlayTaskDescriptor initWithAlert:sound:vibrationIdentifier:isDeemphasized:alertSystemSoundContext:]([TLAlertSystemSoundPlayTaskDescriptor alloc], "initWithAlert:sound:vibrationIdentifier:isDeemphasized:alertSystemSoundContext:", v13, v12, v11, objc_msgSend(v10, "isDeemphasized"), v14);

  return v15;
}

- (void)_processPlayTaskDescriptors:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  unsigned int v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  void *v27;
  void *v28;
  void *v29;
  char *v30;
  id v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  TLAudioQueue *audioQueue;
  os_unfair_lock_t lock;
  void *v43;
  id obj;
  uint64_t v45;
  id v46;
  TLAlertSystemSoundController *v47;
  void *v48;
  _QWORD v49[5];
  id v50;
  _QWORD block[4];
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t);
  void *v60;
  TLAlertSystemSoundController *v61;
  void *v62;
  unsigned int v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  void *v68;
  uint8_t v69[128];
  uint8_t buf[4];
  TLAlertSystemSoundController *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  uint64_t v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v47 = self;
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
  if (v5)
  {
    v6 = v5;
    v48 = 0;
    v45 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v65 != v45)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        objc_msgSend(v8, "alert");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "sound");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "vibrationIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v8, "isDeemphasized");
        objc_msgSend(v10, "beginRequiringUnderlyingSoundLoaded");
        objc_msgSend(v8, "alertSystemSoundContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = v48;
          if (!v48)
            v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v48 = v14;
          objc_msgSend(v14, "addObject:", v8);
        }
        v15 = objc_msgSend(v10, "soundID");
        objc_msgSend((id)objc_opt_class(), "_optionsForSystemSoundAlert:withSound:vibrationIdentifier:isDeemphasized:", v9, v10, v11, v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        TLLogPlayback();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v71 = v47;
          v72 = 2114;
          v73 = v9;
          v74 = 2048;
          v75 = v15;
          _os_log_impl(&dword_1D33D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: _processPlayTaskDescriptors:(%{public}@). Calling AudioServicesPlaySystemSoundWithOptions for soundID: %lu.", buf, 0x20u);
        }

        v57 = MEMORY[0x1E0C809B0];
        v58 = 3221225472;
        v59 = __60__TLAlertSystemSoundController__processPlayTaskDescriptors___block_invoke;
        v60 = &unk_1E952B530;
        v61 = v47;
        v62 = v9;
        v63 = v15;
        v18 = v9;
        AudioServicesPlaySystemSoundWithOptions();

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
    }
    while (v6);
  }
  else
  {
    v48 = 0;
  }

  v19 = v48;
  if (objc_msgSend(v48, "count"))
  {
    os_unfair_lock_lock(lock);
    v56 = 0u;
    v54 = 0u;
    v55 = 0u;
    v53 = 0u;
    v20 = v48;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
    if (v21)
    {
      v22 = v21;
      v43 = 0;
      v23 = 0;
      v24 = *(_QWORD *)v54;
      do
      {
        v25 = 0;
        v26 = sel_alertDidBeginPlaying_;
        do
        {
          if (*(_QWORD *)v54 != v24)
            objc_enumerationMutation(v20);
          v27 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v25);
          objc_msgSend(v27, "alertSystemSoundContext");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v28, "hasPlaybackStarted") & 1) == 0)
          {
            objc_msgSend(v28, "setHasPlaybackStarted:", 1);
            objc_msgSend(v28, "playbackObserver");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              if (!v23)
                v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v23, "addObject:", v27);
            }

          }
          if (objc_msgSend(v28, "isDeemphasized"))
          {
            if ((objc_msgSend(v28, "hasDeemphasizedPlaybackStarted") & 1) == 0)
            {
              objc_msgSend(v28, "setHasDeemphasizedPlaybackStarted:", 1);
              if (objc_msgSend(v28, "shouldBeInterruptedAfterDeemphasizedPlaybackStarts"))
              {
                v46 = v23;
                v30 = v26;
                v31 = v20;
                objc_msgSend(v27, "alert");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                TLLogPlayback();
                v33 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v71 = v47;
                  v72 = 2114;
                  v73 = v32;
                  _os_log_impl(&dword_1D33D5000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: _processPlayTaskDescriptors:. Preparing for deferred interruption of %{public}@.", buf, 0x16u);
                }

                objc_msgSend(v28, "playbackCompletionContext");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = objc_msgSend(v34, "playbackCompletionType");

                objc_msgSend(v28, "stoppingOptionsForDeferredInterruption");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v68 = v32;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                -[TLAlertSystemSoundController _prepareForStoppingAlerts:withOptions:playbackCompletionType:](v47, "_prepareForStoppingAlerts:withOptions:playbackCompletionType:", v37, v36, v35);
                v38 = (void *)objc_claimAutoreleasedReturnValue();

                if (v38)
                {
                  v39 = v43;
                  v20 = v31;
                  if (!v43)
                    v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  v43 = v39;
                  objc_msgSend(v39, "addObject:", v38);
                }
                else
                {
                  v20 = v31;
                }
                v26 = v30;
                objc_msgSend(v28, "setStoppingOptionsForDeferredInterruption:", 0);
                objc_msgSend(v28, "setShouldBeInterruptedAfterDeemphasizedPlaybackStarts:", 0);

                v23 = v46;
              }
            }
          }

          ++v25;
        }
        while (v22 != v25);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
      }
      while (v22);
    }
    else
    {
      v43 = 0;
      v23 = 0;
    }

    os_unfair_lock_unlock(lock);
    if (objc_msgSend(v23, "count"))
    {
      dispatch_get_global_queue(0, 0);
      v40 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__TLAlertSystemSoundController__processPlayTaskDescriptors___block_invoke_11;
      block[3] = &unk_1E952A748;
      v52 = v23;
      dispatch_async(v40, block);

    }
    if (objc_msgSend(v43, "count"))
    {
      audioQueue = v47->_audioQueue;
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __60__TLAlertSystemSoundController__processPlayTaskDescriptors___block_invoke_2;
      v49[3] = &unk_1E952A6A8;
      v49[4] = v47;
      v50 = v43;
      -[TLAudioQueue performSynchronousTaskWithOptions:block:](audioQueue, "performSynchronousTaskWithOptions:block:", 1, v49);

    }
    v19 = v48;
  }

}

uint64_t __60__TLAlertSystemSoundController__processPlayTaskDescriptors___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  TLLogPlayback();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(unsigned int *)(a1 + 48);
    v7 = 138543874;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    v11 = 2048;
    v12 = v5;
    _os_log_impl(&dword_1D33D5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: _processPlayTaskDescriptors:(%{public}@). Running completion block for AudioServicesPlaySystemSoundWithOptions for soundID: %lu.", (uint8_t *)&v7, 0x20u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_didCompletePlaybackForAlert:", *(_QWORD *)(a1 + 40));
}

void __60__TLAlertSystemSoundController__processPlayTaskDescriptors___block_invoke_11(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v6, "alert", (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "alertSystemSoundContext");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "playbackObserver");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "alertDidBeginPlaying:", v7);

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }

}

void __60__TLAlertSystemSoundController__processPlayTaskDescriptors___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t v13[128];
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  TLLogPlayback();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v15 = v3;
    _os_log_impl(&dword_1D33D5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: _processPlayTaskDescriptors:. Processing deferred interruptions.", buf, 0xCu);
  }

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 32), "_processStopTasksDescriptor:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)stopPlayingAlerts:(id)a3 withOptions:(id)a4 playbackCompletionType:(int64_t)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  TLAudioQueue *audioQueue;
  _QWORD v16[5];
  id v17;

  p_lock = &self->_lock;
  v9 = a4;
  v10 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  -[TLAlertSystemSoundController _prepareForStoppingAlerts:withOptions:playbackCompletionType:](self, "_prepareForStoppingAlerts:withOptions:playbackCompletionType:", v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v11, "interruptedAlertsToSound");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v11)
  {
    audioQueue = self->_audioQueue;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __85__TLAlertSystemSoundController_stopPlayingAlerts_withOptions_playbackCompletionType___block_invoke;
    v16[3] = &unk_1E952A6A8;
    v16[4] = self;
    v17 = v11;
    -[TLAudioQueue performTaskWithBlock:](audioQueue, "performTaskWithBlock:", v16);

  }
  return v13 != 0;
}

uint64_t __85__TLAlertSystemSoundController_stopPlayingAlerts_withOptions_playbackCompletionType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processStopTasksDescriptor:", *(_QWORD *)(a1 + 40));
}

- (id)_prepareForStoppingAlerts:(id)a3 withOptions:(id)a4 playbackCompletionType:(int64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  TLAlertSystemSoundStopTasksDescriptor *v28;
  void *v29;
  int64_t v31;
  void *v32;
  void *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  TLAlertSystemSoundController *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  v10 = objc_msgSend(v8, "count");
  TLLogPlayback();
  v11 = objc_claimAutoreleasedReturnValue();
  v31 = a5;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v10 == 1)
      v12 = "";
    else
      v12 = "s";
    NSStringFromTLAlertPlaybackCompletionType(v31);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v41 = self;
    v42 = 2048;
    v43 = v10;
    v44 = 2082;
    v45 = (void *)v12;
    a5 = v31;
    v46 = 2114;
    v47 = v9;
    v48 = 2112;
    v49 = v13;
    _os_log_impl(&dword_1D33D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: _prepareForStoppingAlerts:([%lu alert%{public}s]) withOptions:(%{public}@) playbackCompletionType:(%@)", buf, 0x34u);

  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v8;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v14)
  {
    v15 = v14;
    v32 = 0;
    v33 = 0;
    v16 = *(_QWORD *)v36;
    while (1)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v36 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_alertSystemSoundContexts, "objectForKey:", v18, v31);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          if (objc_msgSend(v19, "isDeemphasized")
            && !objc_msgSend(v20, "hasDeemphasizedPlaybackStarted"))
          {
            objc_msgSend(v20, "playbackCompletionContext");
            v21 = objc_claimAutoreleasedReturnValue();
            -[NSObject setPlaybackCompletionType:](v21, "setPlaybackCompletionType:", a5);
            objc_msgSend(v20, "setStoppingOptionsForDeferredInterruption:", v9);
            objc_msgSend(v20, "setShouldBeInterruptedAfterDeemphasizedPlaybackStarts:", 1);
            TLLogPlayback();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              v41 = self;
              v42 = 2114;
              v43 = v18;
              v44 = 2114;
              v45 = v20;
              _os_log_impl(&dword_1D33D5000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: _prepareForStoppingAlerts…: Deferring stop request for %{public}@ with system sound context: %{public}@. Will process stop request after deemphasized playback starts.", buf, 0x20u);
            }
            goto LABEL_34;
          }
          if (!objc_msgSend(v20, "isBeingInterrupted"))
            goto LABEL_17;
          if (objc_msgSend(v20, "isBeingDeemphasized"))
          {
            objc_msgSend(v20, "setBeingDeemphasized:", 0);
LABEL_17:
            objc_msgSend(v20, "playbackCompletionContext");
            v21 = objc_claimAutoreleasedReturnValue();
            -[NSObject setPlaybackCompletionType:](v21, "setPlaybackCompletionType:", a5);
            objc_msgSend(v20, "setBeingInterrupted:", 1);
            TLLogPlayback();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              v41 = self;
              v42 = 2114;
              v43 = v18;
              v44 = 2114;
              v45 = v20;
              _os_log_impl(&dword_1D33D5000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: _prepareForStoppingAlerts…: Beginning interruption of %{public}@ with system sound context: %{public}@.", buf, 0x20u);
            }

            objc_msgSend(v20, "sound");
            v23 = objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              v24 = v33;
              if (!v33)
                v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 1);
              v33 = v24;
              objc_msgSend(v24, "setObject:forKey:", v23, v18);
            }
            else
            {
              v25 = v9;
              TLLogPlayback();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543874;
                v41 = self;
                v42 = 2114;
                v43 = v18;
                v44 = 2114;
                v45 = v21;
                _os_log_impl(&dword_1D33D5000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: _prepareForStoppingAlerts…: %{public}@ didn't even get a chance to begin playing. Merely processing playback completion context: %{public}@.", buf, 0x20u);
              }

              v9 = v25;
              if (v21)
              {
                v27 = v32;
                if (!v32)
                  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                v32 = v27;
                -[TLAlertSystemSoundController _removeAlert:alertSystemSoundContext:didFailToPrepareSound:appendingPlaybackCompletionContextToArray:](self, "_removeAlert:alertSystemSoundContext:didFailToPrepareSound:appendingPlaybackCompletionContextToArray:", v18, v20, 0, v27);
              }
              a5 = v31;
            }
LABEL_34:

            goto LABEL_35;
          }
        }
        TLLogPlayback();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v41 = self;
          v42 = 2114;
          v43 = v18;
          v44 = 2114;
          v45 = v20;
          _os_log_impl(&dword_1D33D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: _prepareForStoppingAlerts…: Ignoring stop request for %{public}@ with system sound context: %{public}@.", buf, 0x20u);
        }
LABEL_35:

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (!v15)
        goto LABEL_39;
    }
  }
  v32 = 0;
  v33 = 0;
LABEL_39:

  if (objc_msgSend(v33, "count") || objc_msgSend(v32, "count"))
  {
    v28 = objc_alloc_init(TLAlertSystemSoundStopTasksDescriptor);
    -[TLAlertSystemSoundStopTasksDescriptor setInterruptedAlertsToSound:](v28, "setInterruptedAlertsToSound:", v33);
    v29 = v32;
    -[TLAlertSystemSoundStopTasksDescriptor setPlaybackCompletionContextsToProcess:](v28, "setPlaybackCompletionContextsToProcess:", v32);
    -[TLAlertSystemSoundStopTasksDescriptor setOptions:](v28, "setOptions:", v9);
    -[TLAlertSystemSoundStopTasksDescriptor setPlaybackCompletionType:](v28, "setPlaybackCompletionType:", a5);
  }
  else
  {
    v28 = 0;
    v29 = v32;
  }

  return v28;
}

- (void)_processStopTasksDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  int v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  TLAlertSystemSoundController *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  TLAlertSystemSoundController *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  int v34;
  __int16 v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v21 = self;
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  objc_msgSend(v4, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v4, "playbackCompletionType");
  v18 = v4;
  objc_msgSend(v4, "interruptedAlertsToSound");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v22 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
  if (v22)
  {
    v7 = *(_QWORD *)v24;
    v19 = v6;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v6);
        v9 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "soundID");
        if (v5)
          v12 = objc_msgSend(v5, "shouldWaitUntilEndOfCurrentRepetition");
        else
          v12 = 0;
        TLLogPlayback();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromTLAlertPlaybackCompletionType(v20);
          v14 = v5;
          v15 = v7;
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v28 = v21;
          v29 = 2114;
          v30 = v16;
          v31 = 2048;
          v32 = v11;
          v33 = 1024;
          v34 = v12 ^ 1;
          v35 = 2114;
          v36 = v9;
          _os_log_impl(&dword_1D33D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: _processStopTasksDescriptor:. playbackCompletionType: %{public}@. Calling AudioServicesStopSystemSound for soundID: %lu with inStopNow = %{BOOL}d for alert %{public}@.", buf, 0x30u);

          v7 = v15;
          v5 = v14;
          v6 = v19;
        }

        AudioServicesStopSystemSound();
      }
      v22 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
    }
    while (v22);
  }
  objc_msgSend(v18, "playbackCompletionContextsToProcess");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLAlertSystemSoundController _processPlaybackCompletionContexts:](v21, "_processPlaybackCompletionContexts:", v17);

}

- (id)_prepareForPreemptingAlertsBeforeBeginningPlaybackOfAlert:(id)a3 withSound:(id)a4 playbackCompletionType:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  int v16;
  uint64_t i;
  id v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  char v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v29;
  void *v30;
  NSMapTable *obj;
  char v33;
  int v34;
  TLAlertSystemSoundController *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(v7, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldRepeat");
  v29 = v9;
  v11 = objc_msgSend(v9, "isForPreview");
  v30 = v8;
  v34 = objc_msgSend(v8, "soundID");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v35 = self;
  obj = self->_alertSystemSoundContexts;
  v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v37;
    v33 = v10 ^ 1;
    v16 = v11 ^ 1;
    while (1)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v37 != v15)
          objc_enumerationMutation(obj);
        v18 = *(id *)(*((_QWORD *)&v36 + 1) + 8 * i);
        if (v18 != v7)
        {
          -[NSMapTable objectForKey:](v35->_alertSystemSoundContexts, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "sound");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "soundID");

          v22 = v21 == v34;
          if (v21 == v34)
            v23 = 1;
          else
            v23 = v33;
          if ((v23 & 1) == 0)
          {
            objc_msgSend(v18, "configuration");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v24, "shouldRepeat");

          }
          if (((v22 | v16) & 1) != 0)
          {
            if (!v22)
              goto LABEL_19;
          }
          else
          {
            objc_msgSend(v18, "configuration");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "isForPreview");

            if ((v26 & 1) == 0)
            {
LABEL_19:

              continue;
            }
          }
          if (!v14)
            v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v14, "addObject:", v18);
          goto LABEL_19;
        }
      }
      v13 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (!v13)
        goto LABEL_24;
    }
  }
  v14 = 0;
LABEL_24:

  -[TLAlertSystemSoundController _prepareForStoppingAlerts:withOptions:playbackCompletionType:](v35, "_prepareForStoppingAlerts:withOptions:playbackCompletionType:", v14, 0, a5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (void)preheatForAlert:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  int64_t backlightStatus;
  TLAudioQueue *audioQueue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int64_t v15;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  backlightStatus = self->_backlightStatus;
  os_unfair_lock_unlock(&self->_lock);
  audioQueue = self->_audioQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__TLAlertSystemSoundController_preheatForAlert_completionHandler___block_invoke;
  v12[3] = &unk_1E952B558;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = backlightStatus;
  v10 = v7;
  v11 = v6;
  -[TLAudioQueue performTaskWithBlock:](audioQueue, "performTaskWithBlock:", v12);

}

uint64_t __66__TLAlertSystemSoundController_preheatForAlert_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_preheatForAlert:backlightStatus:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_preheatForAlert:(id)a3 backlightStatus:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  unsigned int v16;
  char v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  _QWORD block[4];
  id v23;
  id v24;
  BOOL v25;
  uint8_t buf[4];
  TLAlertSystemSoundController *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  objc_msgSend((id)objc_opt_class(), "_toneIdentifierForDeemphasizingAlert:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");
  v12 = (void *)objc_opt_class();
  if (v11)
    v13 = a4 == 1;
  else
    v13 = 0;
  if (v13)
    v14 = v10;
  else
    v14 = 0;
  objc_msgSend(v12, "_soundForAlert:toneIdentifierForDeemphasizingAlert:", v8, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "soundID");
  v17 = objc_msgSend(v15, "isValid");
  TLLogPlayback();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if ((v17 & 1) != 0)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v27 = self;
      v28 = 2114;
      v29 = v8;
      v30 = 2114;
      v31 = v15;
      v32 = 2048;
      v33 = v16;
      _os_log_impl(&dword_1D33D5000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: _preheatForAlert:(%{public}@). Pre-heating succeeded with sound: %{public}@ and soundID: %lu.", buf, 0x2Au);
    }

    v20 = 0;
    if (!v9)
      goto LABEL_16;
LABEL_15:
    dispatch_get_global_queue(0, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__TLAlertSystemSoundController__preheatForAlert_backlightStatus_completionHandler___block_invoke;
    block[3] = &unk_1E952B580;
    v24 = v9;
    v25 = v20 == 0;
    v23 = v20;
    dispatch_async(v21, block);

    goto LABEL_16;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138544130;
    v27 = self;
    v28 = 2114;
    v29 = v8;
    v30 = 2114;
    v31 = v15;
    v32 = 2048;
    v33 = v16;
    _os_log_error_impl(&dword_1D33D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@: _preheatForAlert:(%{public}@). Pre-heating failed with sound: %{public}@ and soundID: %lu.", buf, 0x2Au);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "tl_errorWithDomain:description:", CFSTR("TLAlertErrorDomain"), CFSTR("Failed to pre-heat alert %@."), v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    goto LABEL_15;
LABEL_16:

}

uint64_t __83__TLAlertSystemSoundController__preheatForAlert_backlightStatus_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

+ (id)_soundForAlert:(id)a3 toneIdentifierForDeemphasizingAlert:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  TLSystemSound *v9;
  TLSystemSound *v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  int v18;
  void *v19;
  TLSystemSound *v20;
  void *v22;
  char v23;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "externalToneFileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v5, "toneIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      v12 = v6;

      v11 = v12;
    }
    v13 = objc_msgSend(v7, "isForPreview");
    +[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
      objc_msgSend(v14, "_previewSoundForToneIdentifier:", v11);
    else
      objc_msgSend(v14, "_soundForToneIdentifier:", v11);
    v10 = (TLSystemSound *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v16 = -[TLSystemSound soundID](v10, "soundID");
      if (v16 != kSystemSoundID_NoneTone)
        goto LABEL_15;
    }
    +[TLCapabilitiesManager sharedCapabilitiesManager](TLCapabilitiesManager, "sharedCapabilitiesManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "hasVibratorCapability");

    if (!v18)
      goto LABEL_15;
    objc_msgSend(v7, "externalVibrationPattern");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19
      || (objc_msgSend(v7, "externalVibrationPatternFileURL"), (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      objc_msgSend(v5, "vibrationIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("<none>"));

      if ((v23 & 1) != 0)
        goto LABEL_15;
    }
    v20 = -[TLSystemSound initWithSoundFileURL:soundID:requiresLongFormPlayback:]([TLSystemSound alloc], "initWithSoundFileURL:soundID:requiresLongFormPlayback:", 0, 4095, 0);

    v10 = v20;
LABEL_15:

    goto LABEL_16;
  }
  v9 = [TLSystemSound alloc];
  v10 = -[TLSystemSound initWithSoundFileURL:soundID:requiresLongFormPlayback:](v9, "initWithSoundFileURL:soundID:requiresLongFormPlayback:", v8, kSystemSoundID_InvalidTone, 0);
LABEL_16:

  return v10;
}

+ (id)_toneIdentifierForDeemphasizingAlert:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isForPreview") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    +[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "type");
    objc_msgSend(v4, "topic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "toneIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_toneIdentifierForDeemphasizingAlertWithType:topic:regularToneIdentifier:", v7, v8, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)_vibrationIdentifierForDeemphasizingAlert:(id)a3 correspondingToneIdentifierForDeemphasizingAlert:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  if (a4)
  {
    v5 = a4;
    v6 = a3;
    objc_msgSend(v6, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[TLVibrationManager sharedVibrationManager](TLVibrationManager, "sharedVibrationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "vibrationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "type");

    objc_msgSend(v7, "topic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_sanitizeVibrationIdentifier:forAlertType:topic:targetDevice:correspondingToneIdentifier:didFallbackToCurrentVibrationIdentifier:", v9, v10, v11, objc_msgSend(v7, "targetDevice"), v5, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

+ (unsigned)_soundBehaviorForAlert:(id)a3 withSound:(id)a4 isDeemphasized:(BOOL)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  void *v11;
  int v12;

  v6 = a4;
  objc_msgSend(a3, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "type");
  if (objc_msgSend(v7, "isForPreview"))
  {
    if ((unint64_t)(v8 - 4) >= 9)
    {
      v10 = 1307;
LABEL_7:
      if (v8 == 13)
      {
        if (objc_msgSend(v6, "requiresLongFormPlayback"))
          v9 = 1403;
        else
          v9 = v10;
      }
      else
      {
        v9 = v10;
      }
    }
    else
    {
      v9 = dword_1D341A8EC[v8 - 4];
    }
  }
  else
  {
    v10 = 1;
    v9 = 0;
    switch(v8)
    {
      case 1:
      case 28:
        break;
      case 2:
        objc_msgSend(v7, "topic");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("TLAlertTopicTextMessageInConversation"));

        if (v12)
          v9 = 1003;
        else
          v9 = 1007;
        break;
      case 3:
        v9 = 1003;
        break;
      case 5:
        v9 = 1000;
        break;
      case 6:
      case 7:
      case 8:
      case 9:
        v9 = 1001;
        break;
      case 10:
        v9 = 1005;
        break;
      case 11:
        v9 = 1017;
        break;
      case 12:
        v9 = 1007;
        break;
      default:
        goto LABEL_7;
    }
  }

  return v9;
}

+ (id)_vibrationPatternForAlert:(id)a3 withSound:(id)a4 vibrationIdentifier:(id)a5
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  TLVibrationPattern *v14;
  uint64_t v15;
  void *v16;

  v6 = a3;
  v7 = a5;
  +[TLCapabilitiesManager sharedCapabilitiesManager](TLCapabilitiesManager, "sharedCapabilitiesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasVibratorCapability");

  if (v9)
  {
    objc_msgSend(v6, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "externalVibrationPattern");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(v10, "externalVibrationPatternFileURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }

    }
    v13 = +[TLAlertPlaybackPolicy shouldRepeatVibrationForAlert:withPlaybackBackend:](TLAlertPlaybackPolicy, "shouldRepeatVibrationForAlert:withPlaybackBackend:", v6, 1);
    if (v13 && v11)
    {
      v14 = -[TLVibrationPattern initWithPropertyListRepresentation:]([TLVibrationPattern alloc], "initWithPropertyListRepresentation:", v11);
      -[TLVibrationPattern _artificiallyRepeatingPropertyListRepresentation](v14, "_artificiallyRepeatingPropertyListRepresentation");
      v15 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v15;
    }
    if (!v11)
    {
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Built-In-System-Sound-ID-Vibration")) & 1) != 0)
      {
        v11 = 0;
      }
      else
      {
        +[TLVibrationManager sharedVibrationManager](TLVibrationManager, "sharedVibrationManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "patternForVibrationWithIdentifier:repeating:", v7, v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (unsigned)_componentSuppressionFlagsForAlert:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "toneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("<none>"));

  objc_msgSend(v3, "vibrationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = objc_msgSend(v6, "isEqualToString:", CFSTR("<none>"));
  if ((_DWORD)v3)
    return v5 | 2;
  else
    return v5;
}

+ (id)_descriptionForAlertComponentsSuppressionFlags:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;

  if ((a3 & 1) != 0)
  {
    v5 = CFSTR("kAudioServicesFlag_SuppressAudio");
    if ((a3 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ | %@"), CFSTR("kAudioServicesFlag_SuppressAudio"), CFSTR("kAudioServicesFlag_SuppressVibe"), v3, v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if ((a3 & 2) != 0)
      return CFSTR("kAudioServicesFlag_SuppressVibe");
    v5 = 0;
  }
  return v5;
}

+ (id)_optionsForSystemSoundAlert:(id)a3 withSound:(id)a4 vibrationIdentifier:(id)a5 isDeemphasized:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  float v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  int v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  double v48;
  uint64_t v49;

  v6 = a6;
  v49 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v10, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend((id)objc_opt_class(), "_soundBehaviorForAlert:withSound:isDeemphasized:", v10, v11, v6);
  if ((_DWORD)v15)
  {
    v16 = v15;
    TLLogPlayback();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v41 = 138544130;
      v42 = a1;
      v43 = 2114;
      v44 = v10;
      v45 = 2114;
      v46 = v11;
      v47 = 2048;
      *(_QWORD *)&v48 = v16;
      _os_log_impl(&dword_1D33D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: +_optionsForSystemSoundAlert:(%{public}@) withSound:(%{public}@). kAudioServicesPlaySystemSoundOptionBehaviorKey => %lu.", (uint8_t *)&v41, 0x2Au);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v18, *MEMORY[0x1E0C92518]);

  }
  v19 = objc_msgSend((id)objc_opt_class(), "_componentSuppressionFlagsForAlert:", v10);
  if (!(_DWORD)v19)
    goto LABEL_9;
  v20 = v19;
  TLLogPlayback();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "_descriptionForAlertComponentsSuppressionFlags:", v20);
    v22 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    v41 = 138544130;
    v42 = a1;
    v43 = 2114;
    v44 = v10;
    v45 = 2114;
    v46 = v11;
    v47 = 2114;
    v48 = v22;
    _os_log_impl(&dword_1D33D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: +_optionsForSystemSoundAlert:(%{public}@) withSound:(%{public}@). kAudioServicesPlaySystemSoundOptionFlagsKey => %{public}@.", (uint8_t *)&v41, 0x2Au);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v23, *MEMORY[0x1E0C92520]);

  if ((v20 & 2) == 0)
  {
LABEL_9:
    objc_msgSend((id)objc_opt_class(), "_vibrationPatternForAlert:withSound:vibrationIdentifier:", v10, v11, v12);
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = (void *)v24;
      TLLogPlayback();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v41 = 138543874;
        v42 = a1;
        v43 = 2114;
        v44 = v10;
        v45 = 2114;
        v46 = v11;
        _os_log_impl(&dword_1D33D5000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: +_optionsForSystemSoundAlert:(%{public}@) withSound:(%{public}@). kAudioServicesPlaySystemSoundOptionVibrationPatternKey => non-nil.", (uint8_t *)&v41, 0x20u);
      }

      objc_msgSend(v13, "setObject:forKey:", v25, *MEMORY[0x1E0C92548]);
    }
  }
  if (objc_msgSend(v14, "shouldRepeat"))
  {
    TLLogPlayback();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v41 = 138543874;
      v42 = a1;
      v43 = 2114;
      v44 = v10;
      v45 = 2114;
      v46 = v11;
      _os_log_impl(&dword_1D33D5000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: +_optionsForSystemSoundAlert:(%{public}@) withSound:(%{public}@). kAudioServicesPlaySystemSoundOptionLoopKey => true.", (uint8_t *)&v41, 0x20u);
    }

    objc_msgSend(v13, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C92530]);
  }
  +[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "toneIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_unduckTimeForToneIdentifier:", v29);
  v31 = v30;

  if (llround(v31 * 8388608.0) != llround(0.0))
  {
    TLLogPlayback();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v41 = 138544130;
      v42 = a1;
      v43 = 2114;
      v44 = v10;
      v45 = 2114;
      v46 = v11;
      v47 = 2048;
      v48 = v31;
      _os_log_impl(&dword_1D33D5000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: +_optionsForSystemSoundAlert:(%{public}@) withSound:(%{public}@). kAudioServicesPlaySystemSoundOptionUnduckTimeKey => %.3f.", (uint8_t *)&v41, 0x2Au);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v33, *MEMORY[0x1E0C92540]);

  }
  if (objc_msgSend(v14, "_hasCustomAudioVolume"))
  {
    TLLogPlayback();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "audioVolume");
      v41 = 138544130;
      v42 = a1;
      v43 = 2114;
      v44 = v10;
      v45 = 2114;
      v46 = v11;
      v47 = 2048;
      v48 = v35;
      _os_log_impl(&dword_1D33D5000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: +_optionsForSystemSoundAlert:(%{public}@) withSound:(%{public}@). kAudioServicesPlaySystemSoundOptionVolumeKey => %f.", (uint8_t *)&v41, 0x2Au);
    }

    v36 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v14, "audioVolume");
    objc_msgSend(v36, "numberWithFloat:");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v37, *MEMORY[0x1E0C92550]);

  }
  if ((objc_msgSend(v14, "shouldIgnoreRingerSwitch") & 1) != 0 || objc_msgSend(v14, "isForPreview"))
  {
    TLLogPlayback();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v41 = 138543874;
      v42 = a1;
      v43 = 2114;
      v44 = v10;
      v45 = 2114;
      v46 = v11;
      _os_log_impl(&dword_1D33D5000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: +_optionsForSystemSoundAlert:(%{public}@) withSound:(%{public}@). kAudioServicesPlaySystemSoundOptionIgnoreRingerSwitchKey => true.", (uint8_t *)&v41, 0x20u);
    }

    objc_msgSend(v13, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C92528]);
  }
  if (objc_msgSend(v14, "prefersToDisallowExternalPlayback"))
  {
    TLLogPlayback();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v41 = 138543874;
      v42 = a1;
      v43 = 2114;
      v44 = v10;
      v45 = 2114;
      v46 = v11;
      _os_log_impl(&dword_1D33D5000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: +_optionsForSystemSoundAlert:(%{public}@) withSound:(%{public}@). kAudioServicesPlaySystemSoundOptionPrefersToDisallowExternalPlaybackKey => true.", (uint8_t *)&v41, 0x20u);
    }

    objc_msgSend(v13, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C92538]);
  }

  return v13;
}

- (void)_didCompletePlaybackForAlert:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  TLAudioQueue *audioQueue;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  os_unfair_lock_s *p_lock;
  NSObject *v20;
  void *v21;
  TLAudioQueue *v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  TLAlertSystemSoundController *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  _BYTE *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint8_t v45[4];
  TLAlertSystemSoundController *v46;
  __int16 v47;
  void *v48;
  _BYTE buf[24];
  uint64_t (*v50)(uint64_t, uint64_t);
  __int128 v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_alertSystemSoundContexts, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sound");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSound:", 0);
  objc_msgSend(v6, "setVibrationIdentifier:", 0);
  TLLogPlayback();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "debugDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2114;
    v50 = (uint64_t (*)(uint64_t, uint64_t))v7;
    LOWORD(v51) = 2114;
    *(_QWORD *)((char *)&v51 + 2) = v6;
    _os_log_impl(&dword_1D33D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: _didCompletePlaybackForAlert:(%{public}@). Removed sound %{public}@ from %{public}@.", buf, 0x2Au);

  }
  objc_msgSend(v6, "playbackCompletionContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v6, "toneIdentifierForDeemphasizingAlert");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "vibrationIdentifierForDeemphasizingAlert");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length") && objc_msgSend(v6, "isBeingDeemphasized"))
    {
      objc_msgSend(v6, "setLoadingSound:", 1);
      v13 = 1;
      goto LABEL_10;
    }
    -[TLAlertSystemSoundController _removeAlert:alertSystemSoundContext:didFailToPrepareSound:appendingPlaybackCompletionContextToArray:](self, "_removeAlert:alertSystemSoundContext:didFailToPrepareSound:appendingPlaybackCompletionContextToArray:", v4, v6, 0, v5);
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }
  v13 = 0;
LABEL_10:

  os_unfair_lock_unlock(&self->_lock);
  if (v13)
  {
    v23 = v7;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v50 = __Block_byref_object_copy__3;
    *(_QWORD *)&v51 = __Block_byref_object_dispose__3;
    *((_QWORD *)&v51 + 1) = 0;
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 0;
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__3;
    v39 = __Block_byref_object_dispose__3;
    v40 = 0;
    audioQueue = self->_audioQueue;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __61__TLAlertSystemSoundController__didCompletePlaybackForAlert___block_invoke;
    v28[3] = &unk_1E952B5A8;
    v32 = buf;
    v28[4] = self;
    v15 = v4;
    v29 = v15;
    v30 = v11;
    v33 = &v41;
    v34 = &v35;
    v31 = v12;
    -[TLAudioQueue performSynchronousTaskWithOptions:block:](audioQueue, "performSynchronousTaskWithOptions:block:", 1, v28);
    os_unfair_lock_lock(&self->_lock);
    -[NSMapTable objectForKey:](self->_alertSystemSoundContexts, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      if (*((_BYTE *)v42 + 24))
      {
        objc_msgSend(v16, "setSound:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        objc_msgSend(v17, "setVibrationIdentifier:", v36[5]);
        objc_msgSend(v17, "setLoadingSound:", 0);
        objc_msgSend(v17, "setBeingDeemphasized:", 0);
        objc_msgSend(v17, "setBeingInterrupted:", 0);
        objc_msgSend(v17, "setDeemphasized:", 1);
        -[TLAlertSystemSoundController _playTaskDescriptorForAlert:withSound:vibrationIdentifier:alertSystemSoundContext:](self, "_playTaskDescriptorForAlert:withSound:vibrationIdentifier:alertSystemSoundContext:", v15, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v36[5], v17);
        v18 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[TLAlertSystemSoundController _removeAlert:alertSystemSoundContext:didFailToPrepareSound:appendingPlaybackCompletionContextToArray:](self, "_removeAlert:alertSystemSoundContext:didFailToPrepareSound:appendingPlaybackCompletionContextToArray:", v15, v16, 1, v5);
        objc_msgSend(v17, "setLoadingSound:", 0);
        v18 = 0;
      }
      p_lock = &self->_lock;
    }
    else
    {
      TLLogPlayback();
      p_lock = &self->_lock;
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v15, "debugDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v45 = 138543618;
        v46 = self;
        v47 = 2114;
        v48 = v21;
        _os_log_impl(&dword_1D33D5000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: _didCompletePlaybackForAlert:(%{public}@). System sound context for this alert has already been removed. This likely indicates that the alert was stopped programmatically around the time we were trying to load the deemphasized sound. Aborting deemphasizing process immediately.", v45, 0x16u);

      }
      v18 = 0;
    }

    os_unfair_lock_unlock(p_lock);
    _Block_object_dispose(&v35, 8);

    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v18 = 0;
  }
  if (v7 | v18)
  {
    v22 = self->_audioQueue;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __61__TLAlertSystemSoundController__didCompletePlaybackForAlert___block_invoke_35;
    v24[3] = &unk_1E952AE10;
    v25 = (id)v7;
    v26 = (id)v18;
    v27 = self;
    -[TLAudioQueue performSynchronousTaskWithOptions:block:](v22, "performSynchronousTaskWithOptions:block:", 1, v24);

  }
  if (objc_msgSend(v5, "count", v23))
    -[TLAlertSystemSoundController _processPlaybackCompletionContexts:](self, "_processPlaybackCompletionContexts:", v5);

}

void __61__TLAlertSystemSoundController__didCompletePlaybackForAlert___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_soundForAlert:toneIdentifierForDeemphasizingAlert:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "isValid");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(id *)(a1 + 56));
  TLLogPlayback();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "debugDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v10 = 138544130;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_1D33D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: _didCompletePlaybackForAlert:(%{public}@). About to begin playing deemphasized sound: %{public}@ and vibration identifier: %{public}@.", (uint8_t *)&v10, 0x2Au);

  }
}

void __61__TLAlertSystemSoundController__didCompletePlaybackForAlert___block_invoke_35(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  if (v2)
    objc_msgSend(v2, "endRequiringUnderlyingSoundLoaded");
  v3 = a1[5];
  if (v3)
  {
    v4 = (void *)a1[6];
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_processPlayTaskDescriptors:", v5);

  }
}

- (void)_processPlaybackCompletionContexts:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  if (objc_msgSend(v4, "count"))
  {
    -[TLAlertSystemSoundController description](self, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__TLAlertSystemSoundController__processPlaybackCompletionContexts___block_invoke;
    v8[3] = &unk_1E952A6A8;
    v9 = v4;
    v10 = v5;
    v7 = v5;
    dispatch_async(v6, v8);

  }
}

void __67__TLAlertSystemSoundController__processPlaybackCompletionContexts___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v2 = *(id *)(a1 + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v14 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          TLLogPlayback();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            v9 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138543618;
            v18 = v9;
            v19 = 2114;
            v20 = v7;
            _os_log_impl(&dword_1D33D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: -_processPlaybackCompletionContexts: […]: Processing %{public}@.", buf, 0x16u);
          }

          v10 = objc_msgSend(v7, "playbackCompletionType");
          objc_msgSend(v7, "error");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "completionHandler");
          v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v7, "setCompletionHandler:", 0);
            ((void (**)(_QWORD, uint64_t, void *))v12)[2](v12, v10, v11);
          }

        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      }
      while (v4);
    }

  }
}

- (void)_removeAlert:(id)a3 alertSystemSoundContext:(id)a4 didFailToPrepareSound:(BOOL)a5 appendingPlaybackCompletionContextToArray:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  TLAlertSystemSoundController *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v7 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(v11, "playbackCompletionContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v7)
  {
    objc_msgSend(v13, "setPlaybackCompletionType:", 5);
    objc_msgSend(MEMORY[0x1E0CB35C8], "tl_errorWithDomain:description:", CFSTR("TLAlertErrorDomain"), CFSTR("Failed to prepare tone sound ID for playback."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setError:", v15);

  }
  TLLogPlayback();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138544130;
    v18 = self;
    v19 = 2114;
    v20 = v10;
    v21 = 2114;
    v22 = v11;
    v23 = 1024;
    v24 = v7;
    _os_log_impl(&dword_1D33D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: _removeAlert:(%{public}@) alertSystemSoundContext:(%{public}@) didFailToPrepareSound:(%{BOOL}u)…", (uint8_t *)&v17, 0x26u);
  }

  -[TLAlertSystemSoundController _endRequiringBacklightObservationForAlert:alertSystemSoundContext:](self, "_endRequiringBacklightObservationForAlert:alertSystemSoundContext:", v10, v11);
  -[NSMapTable removeObjectForKey:](self->_alertSystemSoundContexts, "removeObjectForKey:", v10);
  if (v14)
  {
    objc_msgSend(v11, "setPlaybackCompletionContext:", 0);
    objc_msgSend(v12, "addObject:", v14);
  }

}

- (void)_beginRequiringBacklightObservationForAlert:(id)a3 alertSystemSoundContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  unint64_t backlightObservationRequestsCount;
  NSObject *v23;
  unint64_t v24;
  void *v25;
  int v26;
  TLAlertSystemSoundController *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  if (objc_msgSend(v7, "isRequiringBacklightObservation"))
  {
    TLLogGeneral();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Playback/BackEnds/SystemSound/TLAlertSystemSoundController.m");
      v10 = objc_claimAutoreleasedReturnValue();
      TLLogGeneral();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject lastPathComponent](v10, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 136381443;
        v27 = (TLAlertSystemSoundController *)"-[TLAlertSystemSoundController _beginRequiringBacklightObservationForAlert"
                                              ":alertSystemSoundContext:]";
        v28 = 2113;
        v29 = v12;
        v30 = 2049;
        v31 = 1233;
        v32 = 2113;
        v33 = (unint64_t)v13;
        _os_log_impl(&dword_1D33D5000, v11, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v26, 0x2Au);

      }
    }
    else
    {
      TLLogGeneral();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[TLToneManager _migrateLegacyToneSettings].cold.2(v10, v14, v15, v16, v17, v18, v19, v20);
    }

    TLLogGeneral();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[TLAlertSystemSoundController _beginRequiringBacklightObservationForAlert:alertSystemSoundContext:].cold.1((uint64_t)v6, (uint64_t)v7, v21);

  }
  objc_msgSend(v7, "setRequiringBacklightObservation:", 1);
  backlightObservationRequestsCount = self->_backlightObservationRequestsCount;
  self->_backlightObservationRequestsCount = backlightObservationRequestsCount + 1;
  TLLogPlayback();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = self->_backlightObservationRequestsCount;
    v26 = 138544386;
    v27 = self;
    v28 = 2114;
    v29 = v6;
    v30 = 2114;
    v31 = (uint64_t)v7;
    v32 = 2048;
    v33 = backlightObservationRequestsCount;
    v34 = 2048;
    v35 = v24;
    _os_log_impl(&dword_1D33D5000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: -_beginRequiringBacklightObservationForAlert:(%{public}@) alertSystemSoundContext:(%{public}@); reques"
      "ts count incremented from %lu to %lu.",
      (uint8_t *)&v26,
      0x34u);
  }

  if (self->_backlightObservationRequestsCount == 1)
  {
    +[TLBacklight sharedBacklight](TLBacklight, "sharedBacklight");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:", self);

  }
}

- (void)_endRequiringBacklightObservationForAlert:(id)a3 alertSystemSoundContext:(id)a4
{
  id v6;
  id v7;
  unint64_t backlightObservationRequestsCount;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  unint64_t v31;
  void *v32;
  int v33;
  TLAlertSystemSoundController *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  unint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  if (objc_msgSend(v7, "isRequiringBacklightObservation"))
  {
    objc_msgSend(v7, "setRequiringBacklightObservation:", 0);
    backlightObservationRequestsCount = self->_backlightObservationRequestsCount;
    if (!backlightObservationRequestsCount)
    {
      TLLogGeneral();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Playback/BackEnds/SystemSound/TLAlertSystemSoundController.m");
        v11 = objc_claimAutoreleasedReturnValue();
        TLLogGeneral();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject lastPathComponent](v11, "lastPathComponent");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 136381443;
          v34 = (TLAlertSystemSoundController *)"-[TLAlertSystemSoundController _endRequiringBacklightObservationForAlert"
                                                ":alertSystemSoundContext:]";
          v35 = 2113;
          v36 = v13;
          v37 = 2049;
          v38 = 1251;
          v39 = 2113;
          v40 = (unint64_t)v14;
          _os_log_impl(&dword_1D33D5000, v12, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v33, 0x2Au);

        }
      }
      else
      {
        TLLogGeneral();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          +[TLToneManager _migrateLegacyToneSettings].cold.2(v11, v15, v16, v17, v18, v19, v20, v21);
      }

      TLLogGeneral();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[TLAlertSystemSoundController _endRequiringBacklightObservationForAlert:alertSystemSoundContext:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

      backlightObservationRequestsCount = self->_backlightObservationRequestsCount;
    }
    self->_backlightObservationRequestsCount = backlightObservationRequestsCount - 1;
    TLLogPlayback();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = self->_backlightObservationRequestsCount;
      v33 = 138544386;
      v34 = self;
      v35 = 2114;
      v36 = v6;
      v37 = 2114;
      v38 = (uint64_t)v7;
      v39 = 2048;
      v40 = backlightObservationRequestsCount;
      v41 = 2048;
      v42 = v31;
      _os_log_impl(&dword_1D33D5000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: -_endRequiringBacklightObservationForAlert:(%{public}@) alertSystemSoundContext:(%{public}@); reques"
        "ts count incremented from %lu to %lu.",
        (uint8_t *)&v33,
        0x34u);
    }

    if (!self->_backlightObservationRequestsCount)
    {
      +[TLBacklight sharedBacklight](TLBacklight, "sharedBacklight");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "removeObserver:", self);

      self->_backlightStatus = -1;
    }
  }

}

- (void)backlightStatusDidChange:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  int64_t backlightStatus;
  NSMapTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  TLDeemphasizableAlertSystemSoundBeginPlayingContext *v22;
  id v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  uint64_t v28;
  id v29;
  TLAlertStoppingOptions *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  TLAudioQueue *audioQueue;
  void *v38;
  id v39;
  int64_t v40;
  os_unfair_lock_s *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  char v45;
  id v46;
  int64_t v47;
  _QWORD v48[5];
  id v49;
  id v50;
  int64_t v51;
  char v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  TLAlertSystemSoundController *v63;
  __int16 v64;
  const __CFString *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  backlightStatus = self->_backlightStatus;
  v47 = a3;
  if (backlightStatus == a3 || (self->_backlightStatus = a3, a3 == -1))
  {
    os_unfair_lock_unlock(p_lock);
    v25 = 0;
    v26 = 0;
    goto LABEL_34;
  }
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v7 = self->_alertSystemSoundContexts;
  v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
  if (v8)
  {
    v9 = v8;
    v40 = backlightStatus;
    v41 = p_lock;
    v43 = 0;
    v45 = 0;
    v46 = 0;
    v10 = *(_QWORD *)v58;
    if (v47 == 1)
      v11 = CFSTR("on");
    else
      v11 = CFSTR("off");
    v44 = v11;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v58 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_alertSystemSoundContexts, "objectForKey:", v13, v40);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "toneIdentifierForDeemphasizingAlert");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "vibrationIdentifierForDeemphasizingAlert");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "length"))
        {
          objc_msgSend(v14, "sound");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            if (v47 == 1
              && (objc_msgSend(v14, "isBeingDeemphasized") & 1) == 0
              && (objc_msgSend(v14, "isDeemphasized") & 1) == 0
              && (objc_msgSend(v14, "isBeingInterrupted") & 1) == 0)
            {
              TLLogPlayback();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v13, "debugDescription");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v63 = self;
                v64 = 2114;
                v65 = CFSTR("on");
                v66 = 2114;
                v67 = v42;
                _os_log_impl(&dword_1D33D5000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: backlightStatusDidChange:(%{public}@). Backlight was turned on. Deemphasizing: %{public}@.", buf, 0x20u);

              }
              objc_msgSend(v14, "setBeingDeemphasized:", 1);
              v19 = v43;
              if (!v43)
                v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v43 = v19;
              objc_msgSend(v19, "addObject:", v13);
            }
          }
          else if (objc_msgSend(v14, "isLoadingSound"))
          {
            TLLogPlayback();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v13, "debugDescription");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v63 = self;
              v64 = 2114;
              v65 = v44;
              v66 = 2114;
              v67 = v21;
              v68 = 2114;
              v69 = v14;
              _os_log_impl(&dword_1D33D5000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: backlightStatusDidChange:(%{public}@). Backlight was turned on, but we are still loading the regular sound for %{public}@ with context %{public}@. Deferring application of updated backlight status.", buf, 0x2Au);

            }
            v45 = 1;
          }
          else
          {
            objc_msgSend(v14, "setLoadingSound:", 1);
            v22 = -[TLDeemphasizableAlertSystemSoundBeginPlayingContext initWithAlert:alertSystemSoundContext:toneIdentifierForDeemphasizingAlert:vibrationIdentifierForDeemphasizingAlert:]([TLDeemphasizableAlertSystemSoundBeginPlayingContext alloc], "initWithAlert:alertSystemSoundContext:toneIdentifierForDeemphasizingAlert:vibrationIdentifierForDeemphasizingAlert:", v13, v14, v15, v16);
            v23 = v46;
            if (!v46)
              v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v46 = v23;
            objc_msgSend(v23, "addObject:", v22);

          }
        }

      }
      v9 = -[NSMapTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
    }
    while (v9);

    if ((v45 & 1) != 0)
    {
      self->_backlightStatus = v40;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v30 = v43;
      v32 = -[TLAlertStoppingOptions countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v54;
        do
        {
          for (j = 0; j != v33; ++j)
          {
            if (*(_QWORD *)v54 != v34)
              objc_enumerationMutation(v30);
            -[NSMapTable objectForKey:](self->_alertSystemSoundContexts, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setBeingDeemphasized:", 0);

          }
          v33 = -[TLAlertStoppingOptions countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
        }
        while (v33);
      }

      -[TLAlertStoppingOptions removeAllObjects](v30, "removeAllObjects");
      v31 = 0;
      v29 = 0;
      v26 = 1;
      p_lock = v41;
      goto LABEL_48;
    }
    p_lock = v41;
    v24 = v43;
  }
  else
  {

    v46 = 0;
    v24 = 0;
  }
  if (objc_msgSend(v24, "count"))
  {
    v30 = objc_alloc_init(TLAlertStoppingOptions);
    -[TLAlertStoppingOptions setShouldWaitUntilEndOfCurrentRepetition:](v30, "setShouldWaitUntilEndOfCurrentRepetition:", 1);
    v31 = v24;
    -[TLAlertSystemSoundController _prepareForStoppingAlerts:withOptions:playbackCompletionType:](self, "_prepareForStoppingAlerts:withOptions:playbackCompletionType:", v24, v30, 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v26 = 0;
LABEL_48:

    goto LABEL_50;
  }
  v31 = v24;
  v26 = 0;
  v29 = 0;
LABEL_50:

  os_unfair_lock_unlock(p_lock);
  v25 = v46;
  if (v29)
  {
LABEL_51:
    audioQueue = self->_audioQueue;
    v38 = v25;
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __57__TLAlertSystemSoundController_backlightStatusDidChange___block_invoke;
    v48[3] = &unk_1E952B5D0;
    v48[4] = self;
    v51 = v47;
    v29 = v29;
    v49 = v29;
    v39 = v38;
    v50 = v39;
    v52 = v26;
    -[TLAudioQueue performTaskWithBlock:](audioQueue, "performTaskWithBlock:", v48);

    v25 = v39;
    goto LABEL_52;
  }
LABEL_34:
  v27 = v25;
  v28 = objc_msgSend(v25, "count");
  v29 = 0;
  v25 = v27;
  if ((v26 & 1) != 0 || v28)
    goto LABEL_51;
LABEL_52:

}

uint64_t __57__TLAlertSystemSoundController_backlightStatusDidChange___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  const __CFString *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "_processDeemphasizableAlertChangesForBackglightStatus:stopTasksDescriptorForDeemphasizedAlerts:deemphasizableAlertBeginPlayingContexts:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (*(_BYTE *)(a1 + 64))
  {
    TLLogPlayback();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = CFSTR("off");
      if (*(_QWORD *)(a1 + 56) == 1)
        v5 = CFSTR("on");
      v6 = 138543618;
      v7 = v4;
      v8 = 2114;
      v9 = v5;
      _os_log_impl(&dword_1D33D5000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: backlightStatusDidChange:(%{public}@). Triggering delayed application of updated backlight status.", (uint8_t *)&v6, 0x16u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "backlightStatusDidChange:", *(_QWORD *)(a1 + 56));
  }
  return result;
}

- (void)_processDeemphasizableAlertChangesForBackglightStatus:(int64_t)a3 stopTasksDescriptorForDeemphasizedAlerts:(id)a4 deemphasizableAlertBeginPlayingContexts:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  id v50;
  id v51;
  os_unfair_lock_t lock;
  id v53;
  void *v54;
  id v55;
  const __CFString *v56;
  void *v57;
  id obj;
  id obja;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t v73[128];
  uint8_t buf[4];
  TLAlertSystemSoundController *v75;
  __int16 v76;
  const __CFString *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v7)
  {
    objc_msgSend(v7, "playbackCompletionContextsToProcess");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v9, "addObjectsFromArray:", v10);
      objc_msgSend(v7, "setPlaybackCompletionContextsToProcess:", 0);
    }
    -[TLAlertSystemSoundController _processStopTasksDescriptor:](self, "_processStopTasksDescriptor:", v7);

  }
  v11 = (void *)objc_msgSend(v8, "count");
  if (!v11)
  {
    v57 = 0;
    goto LABEL_52;
  }
  v54 = v9;
  v50 = v8;
  v51 = v7;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v8;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v70 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        objc_msgSend(v16, "alert");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "toneIdentifierForDeemphasizingAlert");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "vibrationIdentifierForDeemphasizingAlert");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_opt_class();
        if (a3 == 1)
          v21 = v18;
        else
          v21 = 0;
        objc_msgSend(v20, "_soundForAlert:toneIdentifierForDeemphasizingAlert:", v17, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (a3 == 1)
        {
          v23 = v19;
        }
        else
        {
          objc_msgSend(v17, "vibrationIdentifier");
          v23 = (id)objc_claimAutoreleasedReturnValue();
        }
        v24 = v23;
        if (objc_msgSend(v22, "isValid"))
        {
          objc_msgSend(v16, "setSound:", v22);
          objc_msgSend(v16, "setVibrationIdentifier:", v24);
        }

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
    }
    while (v13);
  }

  os_unfair_lock_lock(lock);
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v55 = obj;
  v25 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v65, v84, 16);
  if (!v25)
  {
    v57 = 0;
    v53 = 0;
    goto LABEL_51;
  }
  v26 = v25;
  v53 = 0;
  v57 = 0;
  obja = *(id *)v66;
  v27 = CFSTR("off");
  if (a3 == 1)
    v27 = CFSTR("on");
  v56 = v27;
  do
  {
    for (j = 0; j != v26; ++j)
    {
      if (*(id *)v66 != obja)
        objc_enumerationMutation(v55);
      v29 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
      objc_msgSend(v29, "alert");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "alertSystemSoundContext");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "sound");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "vibrationIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      TLLogPlayback();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v30, "debugDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v75 = self;
        v76 = 2114;
        v77 = v56;
        v78 = 2114;
        v79 = v35;
        v80 = 2114;
        v81 = v32;
        v82 = 2114;
        v83 = v33;
        _os_log_impl(&dword_1D33D5000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: _processDeemphasizableAlertChanges…:(%{public}@). About to begin playing alert %{public}@ with sound: %{public}@ and vibration identifier: %{public}@.", buf, 0x34u);

      }
      if (!v32)
      {
        -[TLAlertSystemSoundController _removeAlert:alertSystemSoundContext:didFailToPrepareSound:appendingPlaybackCompletionContextToArray:](self, "_removeAlert:alertSystemSoundContext:didFailToPrepareSound:appendingPlaybackCompletionContextToArray:", v30, v31, 1, v54);
LABEL_45:
        objc_msgSend(v31, "setLoadingSound:", 0);
        goto LABEL_46;
      }
      -[NSMapTable objectForKey:](self->_alertSystemSoundContexts, "objectForKey:", v30);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v36)
      {
        TLLogPlayback();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          v75 = self;
          v76 = 2114;
          v77 = v56;
          v78 = 2114;
          v79 = v30;
          v80 = 2114;
          v81 = v31;
          _os_log_impl(&dword_1D33D5000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@: _processDeemphasizableAlertChanges…:(%{public}@). Alert %{public}@ for %{public}@ has already been removed. Aborting.", buf, 0x2Au);
        }

        goto LABEL_45;
      }
      objc_msgSend(v31, "setSound:", v32);
      objc_msgSend(v31, "setVibrationIdentifier:", v33);
      objc_msgSend(v31, "setLoadingSound:", 0);
      objc_msgSend(v31, "setDeemphasized:", a3 == 1);
      -[TLAlertSystemSoundController _prepareForPreemptingAlertsBeforeBeginningPlaybackOfAlert:withSound:playbackCompletionType:](self, "_prepareForPreemptingAlertsBeforeBeginningPlaybackOfAlert:withSound:playbackCompletionType:", v30, v32, 4);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v37)
      {
        objc_msgSend(v37, "playbackCompletionContextsToProcess");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v39, "count"))
        {
          objc_msgSend(v54, "addObjectsFromArray:", v39);
          objc_msgSend(v38, "setPlaybackCompletionContextsToProcess:", 0);
        }
        v40 = v53;
        if (!v53)
          v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v53 = v40;
        objc_msgSend(v40, "addObject:", v38);

      }
      -[TLAlertSystemSoundController _playTaskDescriptorForAlert:withSound:vibrationIdentifier:alertSystemSoundContext:](self, "_playTaskDescriptorForAlert:withSound:vibrationIdentifier:alertSystemSoundContext:", v30, v32, v33, v31);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v57;
      if (!v57)
        v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v57 = v42;
      objc_msgSend(v42, "addObject:", v41);

LABEL_46:
    }
    v26 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v65, v84, 16);
  }
  while (v26);
LABEL_51:

  os_unfair_lock_unlock(lock);
  v8 = v50;
  v7 = v51;
  v11 = v53;
  v9 = v54;
LABEL_52:
  v44 = v11;
  if (objc_msgSend(v11, "count"))
  {
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v45 = v44;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v62;
      do
      {
        for (k = 0; k != v47; ++k)
        {
          if (*(_QWORD *)v62 != v48)
            objc_enumerationMutation(v45);
          -[TLAlertSystemSoundController _processStopTasksDescriptor:](self, "_processStopTasksDescriptor:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * k));
        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
      }
      while (v47);
    }

  }
  if (objc_msgSend(v9, "count"))
    -[TLAlertSystemSoundController _processPlaybackCompletionContexts:](self, "_processPlaybackCompletionContexts:", v9);
  if (objc_msgSend(v57, "count"))
    -[TLAlertSystemSoundController _processPlayTaskDescriptors:](self, "_processPlayTaskDescriptors:", v57);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertSystemSoundContexts, 0);
  objc_storeStrong((id *)&self->_audioQueue, 0);
}

- (void)_beginRequiringBacklightObservationForAlert:(os_log_t)log alertSystemSoundContext:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_1D33D5000, log, OS_LOG_TYPE_ERROR, "Already requiring backlight observation for %{public}@ with context %{public}@.", (uint8_t *)&v3, 0x16u);
}

- (void)_endRequiringBacklightObservationForAlert:(uint64_t)a3 alertSystemSoundContext:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D33D5000, a1, a3, "Unbalanced calls to -_beginRequiringBacklightObservation… and -_endRequiringBacklightObservation….", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_10();
}

@end
