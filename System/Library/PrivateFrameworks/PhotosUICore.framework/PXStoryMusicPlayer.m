@implementation PXStoryMusicPlayer

- (PXStoryMusicPlayer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMusicPlayer.m"), 87, CFSTR("%s is not available as initializer"), "-[PXStoryMusicPlayer init]");

  abort();
}

- (PXStoryMusicPlayer)initWithModel:(id)a3
{
  return -[PXStoryMusicPlayer initWithModel:targetDurationMatchesTimeline:](self, "initWithModel:targetDurationMatchesTimeline:", a3, 1);
}

- (PXStoryMusicPlayer)initWithModel:(id)a3 targetDurationMatchesTimeline:(BOOL)a4
{
  id v7;
  PXStoryMusicPlayer *v8;
  PXStoryMusicPlayer *v9;
  PXStoryModel *model;
  uint64_t v11;
  id *v12;
  void *v13;
  PXAudioPlayer *v14;
  id v15;
  objc_class *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  _PXDefaultAudioCueProvider *v27;
  id v28;
  id *v29;
  void (**v30)(void *, const __CFString *);
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  void *v39;
  _QWORD aBlock[4];
  id *v42;
  _QWORD v43[4];
  id *v44;
  _QWORD v45[4];
  id *v46;
  objc_super v47;

  v7 = a3;
  v47.receiver = self;
  v47.super_class = (Class)PXStoryMusicPlayer;
  v8 = -[PXStoryMusicPlayer init](&v47, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PXStoryMusicPlayer copyLogConfigurationFrom:](v8, "copyLogConfigurationFrom:", v7);
    v9->_targetDurationMatchesTimeline = a4;
    objc_storeStrong((id *)&v9->_model, a3);
    -[PXStoryModel registerChangeObserver:context:](v9->_model, "registerChangeObserver:context:", v9, ModelContext_265350);
    model = v9->_model;
    v11 = MEMORY[0x1E0C809B0];
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __66__PXStoryMusicPlayer_initWithModel_targetDurationMatchesTimeline___block_invoke;
    v45[3] = &unk_1E5142E50;
    v12 = v9;
    v46 = v12;
    -[PXStoryModel performChanges:](model, "performChanges:", v45);
    -[PXStoryModel styleManager](v9->_model, "styleManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerChangeObserver:context:", v12, StyleManagerContext_265349);

    v14 = [PXAudioPlayer alloc];
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("%@; %@"), v17, v9->_model);
    v19 = -[PXAudioPlayer initWithName:](v14, "initWithName:", v18);
    v20 = v12[17];
    v12[17] = (id)v19;

    objc_msgSend(v12[17], "copyLogConfigurationFrom:", v12);
    objc_msgSend(v12[17], "registerChangeObserver:context:", v12, PlayerContext);
    v21 = v12[17];
    v43[0] = v11;
    v43[1] = 3221225472;
    v43[2] = __66__PXStoryMusicPlayer_initWithModel_targetDurationMatchesTimeline___block_invoke_2;
    v43[3] = &unk_1E5141BF8;
    v22 = v12;
    v44 = v22;
    objc_msgSend(v21, "performChanges:", v43);
    -[PXStoryModel storyQueue](v9->_model, "storyQueue");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v22[14];
    v22[14] = (id)v23;

    v25 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:", v22);
    v26 = v22[18];
    v22[18] = (id)v25;

    objc_msgSend(v22[18], "addUpdateSelector:needsUpdate:", sel__updateTargetDuration, 1);
    objc_msgSend(v22[18], "addUpdateSelector:needsUpdate:", sel__updateCurrentSongResource, 1);
    objc_msgSend(v22[18], "addUpdateSelector:", sel__updateCurrentAudioAsset);
    objc_msgSend(v22[18], "addUpdateSelector:", sel__updateCueSource);
    objc_msgSend(v22[18], "addUpdateSelector:", sel__updateTouchingBeganDate);
    objc_msgSend(v22[18], "addUpdateSelector:", sel__updateDucked);
    objc_msgSend(v22[18], "addUpdateSelector:needsUpdate:", sel__updateDuckingVolumeAnimator, 1);
    objc_msgSend(v22[18], "addUpdateSelector:needsUpdate:", sel__updateFocusVolumeAnimator, 1);
    objc_msgSend(v22[18], "addUpdateSelector:", sel__updateFadeOutVolumeAnimator);
    objc_msgSend(v22[18], "addUpdateSelector:", sel__updateViewControllerTransitionVolumeAnimator);
    objc_msgSend(v22[18], "addUpdateSelector:needsUpdate:", sel__updatePlayerVolume, 1);
    objc_msgSend(v22[18], "addUpdateSelector:", sel__updatePlayerCurrentAsset);
    objc_msgSend(v22[18], "addUpdateSelector:needsUpdate:", sel__updateDesiredPlayState, 1);
    objc_msgSend(v22[18], "addUpdateSelector:", sel__updatePlaybackTimer);
    objc_msgSend(v22[18], "addUpdateSelector:needsUpdate:", sel__updatePlayerDesiredPlayState, 1);
    objc_msgSend(v22[18], "addUpdateSelector:needsUpdate:", sel__updateError, 1);
    objc_msgSend(v22[18], "addUpdateSelector:", sel__updateReadinessStatus);
    objc_msgSend(v22[18], "addUpdateSelector:", sel__updateModelProperties);
    objc_msgSend(v22[18], "addUpdateSelector:", sel__updateFailedAudioAssets);
    v27 = objc_alloc_init(_PXDefaultAudioCueProvider);
    v28 = v22[36];
    v22[36] = v27;

    aBlock[0] = v11;
    aBlock[1] = 3221225472;
    aBlock[2] = __66__PXStoryMusicPlayer_initWithModel_targetDurationMatchesTimeline___block_invoke_3;
    aBlock[3] = &unk_1E5141C20;
    v29 = v22;
    v42 = v29;
    v30 = (void (**)(void *, const __CFString *))_Block_copy(aBlock);
    v30[2](v30, CFSTR("ducking"));
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v29[20];
    v29[20] = (id)v31;

    v30[2](v30, CFSTR("focus"));
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = v29[21];
    v29[21] = (id)v33;

    v30[2](v30, CFSTR("fadeOut"));
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v29[22];
    v29[22] = (id)v35;

    v30[2](v30, CFSTR("viewControllerTransition"));
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v29[23];
    v29[23] = (id)v37;

    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addDeferredKeyObserver:", v29);

  }
  return v9;
}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    -[PXStoryMusicPlayer signalChange:](self, "signalChange:", 1);
    -[PXStoryMusicPlayer _invalidateDesiredPlayState](self, "_invalidateDesiredPlayState");
    -[PXStoryMusicPlayer _invalidateCurrentAudioAsset](self, "_invalidateCurrentAudioAsset");
  }
}

- (void)setReadinessStatus:(int64_t)a3
{
  int64_t readinessStatus;
  NSObject *v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  uint64_t v9;
  void *v10;
  os_signpost_id_t v11;
  os_signpost_id_t v12;
  void *v13;
  uint64_t v14;
  int64_t v15;
  void *v16;
  objc_class *v17;
  void *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  os_signpost_id_t v21;
  uint64_t v22;
  NSObject *v23;
  os_signpost_id_t v24;
  os_signpost_id_t v25;
  uint64_t v26;
  NSObject *v27;
  os_signpost_id_t v28;
  os_signpost_id_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  int64_t v35;
  __int16 v36;
  int64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  readinessStatus = self->_readinessStatus;
  if (readinessStatus == a3)
    return;
  if (a3 == 1)
  {
    -[PXStoryMusicPlayer setBufferingEvents:](self, "setBufferingEvents:", -[PXStoryMusicPlayer bufferingEvents](self, "bufferingEvents") + 1);
    -[PXStoryMusicPlayer log](self, "log");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_id_make_with_pointer(v6, self);
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v8 = v7;
      if (os_signpost_enabled(v6))
      {
        v9 = -[PXStoryMusicPlayer logContext](self, "logContext");
        -[PXStoryMusicPlayer currentSongResource](self, "currentSongResource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v33 = v9;
        v34 = 2112;
        v35 = (int64_t)v10;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PXStoryMusicPlayer.Buffering", "Context=%{signpost.telemetry:string2}lu %@", buf, 0x16u);

      }
    }
  }
  else
  {
    if (a3 != 3 || readinessStatus != 1)
      goto LABEL_12;
    -[PXStoryMusicPlayer log](self, "log");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v11 = os_signpost_id_make_with_pointer(v6, self);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = v11;
      if (os_signpost_enabled(v6))
      {
        v31 = -[PXStoryMusicPlayer logContext](self, "logContext");
        +[PXNetworkStatusMonitor sharedInstance](PXNetworkStatusMonitor, "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "bestAvailableNetworkType");
        v15 = -[PXStoryMusicPlayer bufferingEvents](self, "bufferingEvents");
        -[PXStoryMusicPlayer currentSongResource](self, "currentSongResource");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v33 = v31;
        v34 = 2050;
        v35 = v14;
        v36 = 2050;
        v37 = v15;
        v38 = 2114;
        v39 = v18;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_END, v12, "PXStoryMusicPlayer.Buffering", "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES networkType=%{signpost.telemetry:number1,public}lu bufferingEvents=%{signpost.telemetry:number2,public}lu assetType=%{signpost.telemetry:string1,public}@ ", buf, 0x2Au);

      }
    }
  }

LABEL_12:
  self->_readinessStatus = a3;
  -[PXStoryMusicPlayer signalChange:](self, "signalChange:", 2);
  -[PXStoryMusicPlayer log](self, "log");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = os_signpost_id_make_with_pointer(v19, self);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v21 = v20;
    if (os_signpost_enabled(v19))
    {
      v22 = -[PXStoryMusicPlayer logContext](self, "logContext");
      *(_DWORD *)buf = 134217984;
      v33 = v22;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v19, OS_SIGNPOST_INTERVAL_END, v21, "PXStoryMusicPlayerChangedReadinessStatus", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
    }
  }

  v23 = v19;
  v24 = os_signpost_id_make_with_pointer(v23, self);
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v25 = v24;
    if (os_signpost_enabled(v23))
    {
      v26 = -[PXStoryMusicPlayer logContext](self, "logContext");
      *(_DWORD *)buf = 134218240;
      v33 = v26;
      v34 = 2048;
      v35 = a3;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v23, OS_SIGNPOST_EVENT, v25, "PXStoryMusicPlayerChangedReadinessStatus", "Context=%{signpost.telemetry:string2}lu %ld", buf, 0x16u);
    }
  }

  v27 = v23;
  v28 = os_signpost_id_make_with_pointer(v27, self);
  if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v29 = v28;
    if (os_signpost_enabled(v27))
    {
      v30 = -[PXStoryMusicPlayer logContext](self, "logContext");
      *(_DWORD *)buf = 134218240;
      v33 = v30;
      v34 = 2048;
      v35 = a3;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v29, "PXStoryMusicPlayerChangedReadinessStatus", "Context=%{signpost.telemetry:string2}lu %ld", buf, 0x16u);
    }
  }

  -[PXStoryMusicPlayer _invalidateModelProperties](self, "_invalidateModelProperties");
}

- (void)setCurrentSongResource:(id)a3
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  NSObject *v9;
  os_signpost_id_t v10;
  os_signpost_id_t v11;
  uint64_t v12;
  NSObject *v13;
  os_signpost_id_t v14;
  os_signpost_id_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_currentSongResource, a3);
  -[PXStoryMusicPlayer log](self, "log");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_make_with_pointer(v6, self);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v6))
    {
      v17 = 134217984;
      v18 = -[PXStoryMusicPlayer logContext](self, "logContext");
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_END, v8, "PXStoryMusicPlayer.currentSongResource", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v17, 0xCu);
    }
  }

  v9 = v6;
  v10 = os_signpost_id_make_with_pointer(v9, self);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = v10;
    if (os_signpost_enabled(v9))
    {
      v12 = -[PXStoryMusicPlayer logContext](self, "logContext");
      v17 = 134218242;
      v18 = v12;
      v19 = 2114;
      v20 = v5;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v9, OS_SIGNPOST_EVENT, v11, "PXStoryMusicPlayer.currentSongResource", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&v17, 0x16u);
    }
  }

  v13 = v9;
  v14 = os_signpost_id_make_with_pointer(v13, self);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v15 = v14;
    if (os_signpost_enabled(v13))
    {
      v16 = -[PXStoryMusicPlayer logContext](self, "logContext");
      v17 = 134218242;
      v18 = v16;
      v19 = 2114;
      v20 = v5;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PXStoryMusicPlayer.currentSongResource", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&v17, 0x16u);
    }
  }

  -[PXStoryMusicPlayer setCuesVersion:](self, "setCuesVersion:", -[PXStoryMusicPlayer cuesVersion](self, "cuesVersion") + 1);
  -[PXStoryMusicPlayer _invalidateCurrentAudioAsset](self, "_invalidateCurrentAudioAsset");
  -[PXStoryMusicPlayer _invalidateReadinessStatus](self, "_invalidateReadinessStatus");
  -[PXStoryMusicPlayer _invalidateDesiredPlayState](self, "_invalidateDesiredPlayState");

}

- (void)setCurrentAudioAsset:(id)a3
{
  PXAudioAsset *v5;
  char v6;
  PXAudioAsset *v7;

  v7 = (PXAudioAsset *)a3;
  v5 = self->_currentAudioAsset;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXAudioAsset isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentAudioAsset, a3);
      -[PXStoryMusicPlayer _invalidatePlayerCurrentAsset](self, "_invalidatePlayerCurrentAsset");
      -[PXStoryMusicPlayer _invalidateCueSource](self, "_invalidateCueSource");
      -[PXStoryMusicPlayer _invalidatePlayerVolume](self, "_invalidatePlayerVolume");
    }
  }

}

- (void)setTargetDuration:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_targetDuration;
  __int128 v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  CMTimeValue v10;
  NSObject *v11;
  os_signpost_id_t v12;
  os_signpost_id_t v13;
  CMTimeValue v14;
  void *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  os_signpost_id_t v18;
  CMTimeValue v19;
  void *v20;
  $95D729B680665BEAEFA1D6FCA8238556 targetDuration;
  CMTime time1;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_targetDuration = &self->_targetDuration;
  time1 = *(CMTime *)a3;
  targetDuration = self->_targetDuration;
  if (CMTimeCompare(&time1, (CMTime *)&targetDuration))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_targetDuration->epoch = a3->var3;
    *(_OWORD *)&p_targetDuration->value = v6;
    -[PXStoryMusicPlayer log](self, "log");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_make_with_pointer(v7, self);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v9 = v8;
      if (os_signpost_enabled(v7))
      {
        v10 = -[PXStoryMusicPlayer logContext](self, "logContext");
        LODWORD(time1.value) = 134217984;
        *(CMTimeValue *)((char *)&time1.value + 4) = v10;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_END, v9, "PXStoryMusicPlayer.targetDuration", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&time1, 0xCu);
      }
    }

    v11 = v7;
    v12 = os_signpost_id_make_with_pointer(v11, self);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v13 = v12;
      if (os_signpost_enabled(v11))
      {
        v14 = -[PXStoryMusicPlayer logContext](self, "logContext");
        time1 = (CMTime)*a3;
        PXStoryTimeDescription(&time1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(time1.value) = 134218242;
        *(CMTimeValue *)((char *)&time1.value + 4) = v14;
        LOWORD(time1.flags) = 2114;
        *(_QWORD *)((char *)&time1.flags + 2) = v15;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_EVENT, v13, "PXStoryMusicPlayer.targetDuration", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&time1, 0x16u);

      }
    }

    v16 = v11;
    v17 = os_signpost_id_make_with_pointer(v16, self);
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v18 = v17;
      if (os_signpost_enabled(v16))
      {
        v19 = -[PXStoryMusicPlayer logContext](self, "logContext");
        time1 = (CMTime)*a3;
        PXStoryTimeDescription(&time1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(time1.value) = 134218242;
        *(CMTimeValue *)((char *)&time1.value + 4) = v19;
        LOWORD(time1.flags) = 2114;
        *(_QWORD *)((char *)&time1.flags + 2) = v20;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PXStoryMusicPlayer.targetDuration", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&time1, 0x16u);

      }
    }

    -[PXStoryMusicPlayer _invalidateCurrentSongResource](self, "_invalidateCurrentSongResource");
  }
}

- (void)setIsDucked:(BOOL)a3
{
  if (self->_isDucked != a3)
  {
    self->_isDucked = a3;
    -[PXStoryMusicPlayer _invalidateDuckingVolumeAnimator](self, "_invalidateDuckingVolumeAnimator");
  }
}

- (void)setDuckedVolume:(float)a3
{
  if (self->_duckedVolume != a3)
  {
    self->_duckedVolume = a3;
    -[PXStoryMusicPlayer _invalidateDuckingVolumeAnimator](self, "_invalidateDuckingVolumeAnimator");
  }
}

- (id)diagnosticTextForHUDType:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  CMTime v8;
  CMTime v9;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PXStoryMusicPlayer currentTime](self, "currentTime");
  v9 = v8;
  PXStoryTimeDescription(&v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("Music Time: %@"), v5);

  return v6;
}

- (void)replay
{
  void *v3;
  void *v4;
  void *v5;
  Float64 v6;
  void *v7;
  _QWORD v8[4];
  CMTime v9;
  CMTime v10;

  -[PXStoryMusicPlayer player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  memset(&v10, 0, sizeof(v10));
  PXAudioAssetDefaultEntryPoint(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "time");
  CMTimeMakeWithSeconds(&v10, v6, 600);

  -[PXStoryMusicPlayer player](self, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__PXStoryMusicPlayer_replay__block_invoke;
  v8[3] = &__block_descriptor_56_e32_v16__0___PXMutableAudioPlayer__8l;
  v9 = v10;
  objc_msgSend(v7, "performChanges:", v8);

}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryMusicPlayer model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; Model: %@>"), v5, self, v6);

  return (NSString *)v7;
}

- (void)_invalidateTargetDuration
{
  id v2;

  -[PXStoryMusicPlayer updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateTargetDuration);

}

- (void)_updateTargetDuration
{
  void *v3;
  void *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  _OWORD v9[2];

  if (-[PXStoryMusicPlayer targetDurationMatchesTimeline](self, "targetDurationMatchesTimeline"))
  {
    -[PXStoryMusicPlayer model](self, "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeline");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "timeRange");
    }
    else
    {
      memset(v9, 0, sizeof(v9));
      v8 = 0u;
    }
    v6 = *(_OWORD *)((char *)v9 + 8);
    v7 = *((_QWORD *)&v9[1] + 1);
    -[PXStoryMusicPlayer setTargetDuration:](self, "setTargetDuration:", &v6);

  }
}

- (void)_invalidateCurrentSongResource
{
  id v2;

  -[PXStoryMusicPlayer updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentSongResource);

}

- (void)_updateCurrentSongResource
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  _BYTE v14[48];

  -[PXStoryMusicPlayer model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeSongResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "px_storyResourceSongAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "catalog") == 4)
  {
    -[PXStoryMusicPlayer targetDuration](self, "targetDuration");
    if ((v14[36] & 0x1D) == 1)
    {
      v7 = v6;
      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
LABEL_5:
          -[PXStoryMusicPlayer targetDuration](self, "targetDuration");
          objc_msgSend(v7, "assetWithTargetDuration:", v14);
          v8 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v8;
          goto LABEL_6;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "px_descriptionForAssertionMessage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMusicPlayer.m"), 268, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("asset"), v11, v13);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMusicPlayer.m"), 268, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("asset"), v11);
      }

      goto LABEL_5;
    }
  }
LABEL_6:
  -[PXStoryMusicPlayer setCurrentSongResource:](self, "setCurrentSongResource:", v5);

}

- (void)_invalidateCurrentAudioAsset
{
  id v2;

  -[PXStoryMusicPlayer updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentAudioAsset);

}

- (void)_updateCurrentAudioAsset
{
  void *v3;
  id v4;

  -[PXStoryMusicPlayer currentSongResource](self, "currentSongResource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_storyResourceSongAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryMusicPlayer setCurrentAudioAsset:](self, "setCurrentAudioAsset:", v3);

}

- (void)_invalidateCueSource
{
  id v3;

  -[PXStoryMusicPlayer setCueSource:](self, "setCueSource:", 0);
  -[PXStoryMusicPlayer updater](self, "updater");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdateOf:", sel__updateCueSource);

}

- (void)_updateCueSource
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10[2];
  id location;

  -[PXStoryMusicPlayer currentAudioAsset](self, "currentAudioAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[PXStoryMusicPlayer setCueRequestID:](self, "setCueRequestID:", -[PXStoryMusicPlayer cueRequestID](self, "cueRequestID") + 1);
  v4 = -[PXStoryMusicPlayer cueRequestID](self, "cueRequestID");
  -[PXStoryMusicPlayer cueProvider](self, "cueProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__PXStoryMusicPlayer__updateCueSource__block_invoke;
  v8[3] = &unk_1E5141C68;
  objc_copyWeak(v10, &location);
  v6 = v3;
  v9 = v6;
  v10[1] = v4;
  v7 = (id)objc_msgSend(v5, "requestCuesForAudioAsset:resultHandler:", v6, v8);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

}

- (void)_handleAudioCues:(id)a3 asset:(id)a4 error:(id)a5 requestID:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  int64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[PXStoryMusicPlayer storyQueue](self, "storyQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PXStoryMusicPlayer__handleAudioCues_asset_error_requestID___block_invoke;
  block[3] = &unk_1E5141C90;
  v20 = v12;
  v21 = a6;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

- (void)_invalidatePlayerCurrentAsset
{
  id v2;

  -[PXStoryMusicPlayer updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePlayerCurrentAsset);

}

- (void)_updatePlayerCurrentAsset
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  -[PXStoryMusicPlayer currentAudioAsset](self, "currentAudioAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0uLL;
  v11 = 0;
  -[PXStoryMusicPlayer playbackStartTimeForIncomingSong:](self, "playbackStartTimeForIncomingSong:", v3);
  -[PXStoryMusicPlayer player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__PXStoryMusicPlayer__updatePlayerCurrentAsset__block_invoke;
  v6[3] = &unk_1E5141CB8;
  v7 = v3;
  v8 = v10;
  v9 = v11;
  v5 = v3;
  objc_msgSend(v4, "performChanges:", v6);

}

- (void)_invalidateDesiredPlayState
{
  id v2;

  -[PXStoryMusicPlayer updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDesiredPlayState);

}

- (void)_updateDesiredPlayState
{
  void *v4;
  unint64_t v5;
  char v6;
  id v7;
  unsigned int (**v8)(void);
  void *v9;
  _QWORD aBlock[4];
  id v11;
  PXStoryMusicPlayer *v12;
  char v13;

  -[PXStoryMusicPlayer model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "viewMode");
  v6 = 0;
  if (v5 <= 5)
  {
    if (((1 << v5) & 0x36) != 0)
    {
      v6 = 1;
    }
    else if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMusicPlayer.m"), 333, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__PXStoryMusicPlayer__updateDesiredPlayState__block_invoke;
  aBlock[3] = &unk_1E5141CE0;
  v11 = v4;
  v12 = self;
  v13 = v6;
  v7 = v4;
  v8 = (unsigned int (**)(void))_Block_copy(aBlock);
  -[PXStoryMusicPlayer setAudioDesiredPlayState:](self, "setAudioDesiredPlayState:", v8[2]() ^ 1);

}

- (void)_invalidatePlayerDesiredPlayState
{
  id v2;

  -[PXStoryMusicPlayer updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePlayerDesiredPlayState);

}

- (void)_updatePlayerDesiredPlayState
{
  int64_t v3;
  void *v4;
  _QWORD v5[6];

  v3 = -[PXStoryMusicPlayer audioDesiredPlayState](self, "audioDesiredPlayState");
  -[PXStoryMusicPlayer player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "state") != 5)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __51__PXStoryMusicPlayer__updatePlayerDesiredPlayState__block_invoke;
    v5[3] = &unk_1E5141D08;
    v5[4] = self;
    v5[5] = v3;
    objc_msgSend(v4, "performChanges:", v5);
  }

}

- (void)_invalidatePlaybackTimer
{
  id v2;

  -[PXStoryMusicPlayer updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePlaybackTimer);

}

- (void)_updatePlaybackTimer
{
  int64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = -[PXStoryMusicPlayer audioDesiredPlayState](self, "audioDesiredPlayState");
  -[PXStoryMusicPlayer playbackTimer](self, "playbackTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 == 1)
  {

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "px_scheduledTimerWithTimeInterval:weakTarget:selector:userInfo:repeats:", self, sel__handlePlaybackTimerFired_, 0, 1, 0.0333333333);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryMusicPlayer setPlaybackTimer:](self, "setPlaybackTimer:", v6);

    }
  }
  else
  {
    objc_msgSend(v4, "invalidate");

    -[PXStoryMusicPlayer setPlaybackTimer:](self, "setPlaybackTimer:", 0);
  }
}

- (void)_invalidateReadinessStatus
{
  id v2;

  -[PXStoryMusicPlayer updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateReadinessStatus);

}

- (void)_updateReadinessStatus
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  -[PXStoryMusicPlayer currentSongResource](self, "currentSongResource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((PXStorySongResourceIsNullResource(v6) & 1) != 0)
  {
    v3 = 3;
  }
  else
  {
    -[PXStoryMusicPlayer player](self, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "state");

    if ((unint64_t)(v5 - 2) > 3)
      v3 = 0;
    else
      v3 = qword_1A7C0B758[v5 - 2];
  }
  -[PXStoryMusicPlayer setReadinessStatus:](self, "setReadinessStatus:", v3);

}

- (void)_invalidateModelProperties
{
  id v2;

  -[PXStoryMusicPlayer updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateModelProperties);

}

- (void)_updateModelProperties
{
  int64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  int64_t v9;

  v3 = -[PXStoryMusicPlayer readinessStatus](self, "readinessStatus");
  -[PXStoryMusicPlayer model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__PXStoryMusicPlayer__updateModelProperties__block_invoke;
  v7[3] = &unk_1E5144EB8;
  v8 = v4;
  v9 = v3;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_invalidatePlayerVolume
{
  id v2;

  -[PXStoryMusicPlayer updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePlayerVolume);

}

- (void)_updatePlayerVolume
{
  void *v3;
  double v4;
  float v5;
  void *v6;
  double v7;
  float v8;
  void *v9;
  double v10;
  float v11;
  float v12;
  float v13;
  void *v14;
  float v15;
  void *v16;
  void *v17;
  float v18;
  double Seconds;
  void *v20;
  void *v21;
  double v22;
  float v23;
  void *v24;
  double v25;
  float v26;
  void *v27;
  double v28;
  float v29;
  void *v30;
  _QWORD v31[4];
  float v32;
  CMTime time;
  CMTime v34;

  -[PXStoryMusicPlayer duckingVolumeAnimator](self, "duckingVolumeAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationValue");
  v5 = v4;

  -[PXStoryMusicPlayer focusVolumeAnimator](self, "focusVolumeAnimator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentationValue");
  v8 = v7;

  -[PXStoryMusicPlayer fadeOutVolumeAnimator](self, "fadeOutVolumeAnimator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentationValue");
  v11 = v10;

  if (v5 >= v11)
    v12 = v11;
  else
    v12 = v5;
  v13 = v12 * v8;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (float)objc_msgSend(v14, "musicDemoVolumeAdjustment");

  memset(&v34, 0, sizeof(v34));
  -[PXStoryMusicPlayer player](self, "player");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
    objc_msgSend(v16, "currentTime");
  else
    memset(&v34, 0, sizeof(v34));
  v18 = v13 * v15;

  if ((v34.flags & 0x1D) == 1)
  {
    time = v34;
    Seconds = CMTimeGetSeconds(&time);
    -[PXStoryMusicPlayer currentAudioAsset](self, "currentAudioAsset");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PXAudioAssetDefaultEntryPoint(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v21, "time");
      objc_msgSend(v21, "fadeInGainAtOffset:", Seconds - v22);
      v18 = v18 * v23;
    }

  }
  -[PXStoryMusicPlayer viewControllerTransitionVolumeAnimator](self, "viewControllerTransitionVolumeAnimator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "presentationValue");
  v26 = v25 * v18;

  -[PXStoryMusicPlayer model](self, "model");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "volume");
  v29 = v28 * v26;

  self->_volume = v29;
  -[PXStoryMusicPlayer player](self, "player");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __41__PXStoryMusicPlayer__updatePlayerVolume__block_invoke;
  v31[3] = &__block_descriptor_36_e32_v16__0___PXMutableAudioPlayer__8l;
  v32 = v29;
  objc_msgSend(v30, "performChanges:", v31);

}

- (void)_invalidateTouchingBeganDate
{
  id v2;

  -[PXStoryMusicPlayer updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateTouchingBeganDate);

}

- (void)_updateTouchingBeganDate
{
  void *v3;
  id v4;

  -[PXStoryMusicPlayer model](self, "model");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isTouching") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryMusicPlayer setTouchingBeganDate:](self, "setTouchingBeganDate:", v3);

  }
  else
  {
    -[PXStoryMusicPlayer setTouchingBeganDate:](self, "setTouchingBeganDate:", 0);
  }

}

- (void)_invalidateDucked
{
  id v2;

  -[PXStoryMusicPlayer updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDucked);

}

- (void)_updateDucked
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  float v7;
  float v8;
  const __CFString *v9;
  float v10;
  float v11;
  float v12;
  uint64_t v13;
  double v14;
  id v15;

  -[PXStoryMusicPlayer model](self, "model");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v15, "viewMode");
  -[PXStoryMusicPlayer model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAtPlaybackEnd");

  if (v5)
  {
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "musicFadeOutVolume");
    v8 = v7;
    v9 = CFSTR("Story Played To End");
  }
  else if (v3 == 1 || v3 == 4)
  {
    if (-[PXStoryMusicPlayer shouldDuckForCurrentTouch](self, "shouldDuckForCurrentTouch") && v3 == 1)
    {
      +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "musicBackgroundVolume");
      v8 = v10;
      v9 = CFSTR("Touching Fullsize Player");
    }
    else
    {
      if (!objc_msgSend(v15, "wantsMusicDucked"))
      {
        v13 = 0;
        v9 = 0;
        v8 = 1.0;
        goto LABEL_12;
      }
      +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "musicDuckedVolume");
      v8 = v12;
      v9 = CFSTR("Model");
    }
  }
  else
  {
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "musicBackgroundVolume");
    v8 = v11;
    v9 = CFSTR("View Mode");
  }

  v13 = 1;
LABEL_12:
  -[PXStoryMusicPlayer setIsDucked:](self, "setIsDucked:", v13);
  *(float *)&v14 = v8;
  -[PXStoryMusicPlayer setDuckedVolume:](self, "setDuckedVolume:", v14);
  -[PXStoryMusicPlayer setDuckingReason:](self, "setDuckingReason:", v9);

}

- (void)_invalidateFadeOutVolumeAnimator
{
  id v2;

  -[PXStoryMusicPlayer updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateFadeOutVolumeAnimator);

}

- (void)_updateFadeOutVolumeAnimator
{
  void *v3;
  double v4;
  float v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  float v12;
  float v13;
  _QWORD v14[4];
  float v15;

  -[PXStoryMusicPlayer model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outroFractionCompleted");
  v5 = v4;

  -[PXStoryMusicPlayer fadeOutVolumeAnimator](self, "fadeOutVolumeAnimator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 <= 0.0)
  {
    objc_msgSend(v6, "performChangesWithDuration:curve:changes:", 4, &__block_literal_global_265367, 0.3);
  }
  else
  {
    -[PXStoryMusicPlayer model](self, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0.0;
    if ((objc_msgSend(v9, "isPresentedForAirPlay") & 1) == 0)
    {
      +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "musicFadeOutVolume");
      v10 = v12;

    }
    v13 = PXStoryVolumeForFadeOutFractionCompleted(v5);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __50__PXStoryMusicPlayer__updateFadeOutVolumeAnimator__block_invoke;
    v14[3] = &__block_descriptor_36_e35_v16__0___PXMutableNumberAnimator__8l;
    v15 = v10 + (float)(v13 * (float)(1.0 - v10));
    objc_msgSend(v7, "performChangesUsingDefaultSpringAnimationWithInitialVelocity:changes:", v14, 0.0);
  }

}

- (void)_invalidateDuckingVolumeAnimator
{
  id v2;

  -[PXStoryMusicPlayer updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDuckingVolumeAnimator);

}

- (void)_updateDuckingVolumeAnimator
{
  float v3;
  float v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  float v8;

  v3 = 1.0;
  if (-[PXStoryMusicPlayer isDucked](self, "isDucked"))
  {
    -[PXStoryMusicPlayer duckedVolume](self, "duckedVolume");
    v3 = v4;
  }
  -[PXStoryMusicPlayer duckingVolumeAnimator](self, "duckingVolumeAnimator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "duckingFadeDuration");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__PXStoryMusicPlayer__updateDuckingVolumeAnimator__block_invoke;
  v7[3] = &__block_descriptor_36_e35_v16__0___PXMutableNumberAnimator__8l;
  v8 = v3;
  objc_msgSend(v5, "performChangesWithDuration:curve:changes:", 4, v7);

}

- (void)_invalidateFocusVolumeAnimator
{
  id v2;

  -[PXStoryMusicPlayer updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateFocusVolumeAnimator);

}

- (void)_updateFocusVolumeAnimator
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  float v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  float v15;
  _QWORD v16[4];
  float v17;

  -[PXStoryMusicPlayer model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "styleManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionFocus");
  v6 = v5;

  v7 = vabdd_f64(v6, round(v6)) * -2.0 + 1.0;
  -[PXStoryMusicPlayer focusVolumeAnimator](self, "focusVolumeAnimator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v10 = v9;

  -[PXStoryMusicPlayer focusVolumeAnimator](self, "focusVolumeAnimator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 >= v7)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __48__PXStoryMusicPlayer__updateFocusVolumeAnimator__block_invoke_2;
    v14[3] = &__block_descriptor_36_e35_v16__0___PXMutableNumberAnimator__8l;
    v15 = v7;
    objc_msgSend(v11, "performChangesWithoutAnimation:", v14);
  }
  else
  {
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "focusChangeFadeDuration");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __48__PXStoryMusicPlayer__updateFocusVolumeAnimator__block_invoke;
    v16[3] = &__block_descriptor_36_e35_v16__0___PXMutableNumberAnimator__8l;
    v17 = v7;
    objc_msgSend(v12, "performChangesWithDuration:curve:changes:", 4, v16);

  }
}

- (void)_invalidateViewControllerTransitionVolumeAnimator
{
  id v2;

  -[PXStoryMusicPlayer updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateViewControllerTransitionVolumeAnimator);

}

- (void)_updateViewControllerTransitionVolumeAnimator
{
  void *v3;
  float v4;
  float v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  _QWORD v10[5];

  -[PXStoryMusicPlayer model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "volumeDuringViewControllerTransition");
  v5 = v4;

  if (v5 >= 0.0)
    v6 = v5;
  else
    v6 = 0.0;
  -[PXStoryMusicPlayer viewControllerTransitionVolumeAnimator](self, "viewControllerTransitionVolumeAnimator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  if (v6 != v8)
  {
    objc_msgSend(v7, "presentationValue");
    v10[1] = 3221225472;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[2] = __67__PXStoryMusicPlayer__updateViewControllerTransitionVolumeAnimator__block_invoke;
    v10[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
    *(double *)&v10[4] = v6;
    objc_msgSend(v7, "performChangesWithDuration:curve:changes:", 1, v10, vabdd_f64(v6, v9) / 3.33333333);
  }

}

- (void)_invalidateError
{
  id v2;

  -[PXStoryMusicPlayer updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateError);

}

- (void)_updateError
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  -[PXStoryMusicPlayer player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(6, v4, CFSTR("Music playback failed."), v5, v6, v7, v8, v9, v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[PXStoryMusicPlayer model](self, "model");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reportNetworkRelatedPlaybackFailure");

  }
  else
  {
    v14 = 0;
  }
  -[PXStoryMusicPlayer model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorReporter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setError:forComponent:", v14, CFSTR("MusicPlayback"));

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v7;
  uint64_t v8;
  void *v9;

  -[PXStoryMusicPlayer currentSongResource](self, "currentSongResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PXStoryMusicPlayer player](self, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v9 = v7;
      objc_msgSend(v7, "currentTime");
      v7 = v9;
    }
    else
    {
      retstr->var0 = 0;
      *(_QWORD *)&retstr->var1 = 0;
      retstr->var3 = 0;
    }

  }
  else
  {
    v8 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
    retstr->var3 = *(_QWORD *)(v8 + 16);
  }
  return result;
}

- (id)diagnosticCueStringForSize:(CGSize)a3 withIndicatorTime:(id *)a4 rangeIndicatorTimeRange:(id *)a5
{
  void *v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  int64_t var3;
  CMTime start;
  CMTimeRange v19;
  CMTime v20;

  memset(&v20, 0, sizeof(v20));
  CMTimeMake(&v20, 3, 1);
  -[PXStoryMusicPlayer cueSource](self, "cueSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryMusicPlayer currentTime](self, "currentTime");
  v13 = *(_OWORD *)&v20.value;
  *(_QWORD *)&v14 = v20.epoch;
  CMTimeRangeMake(&v19, &start, (CMTime *)&v13);
  v9 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v10 = *(_OWORD *)&a5->var0.var3;
  v13 = *(_OWORD *)&a5->var0.var0;
  v14 = v10;
  v15 = *(_OWORD *)&a5->var1.var1;
  v16 = v9;
  objc_msgSend(v8, "diagnosticStringForTimeRange:indicatorTime:rangeIndicatorTimeRange:stringLength:", &v19, &v16, &v13, 45);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryMusicPlayer;
  -[PXStoryMusicPlayer performChanges:](&v3, sel_performChanges_, a3);
}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryMusicPlayer;
  -[PXStoryMusicPlayer didPerformChanges](&v4, sel_didPerformChanges);
  -[PXStoryMusicPlayer updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  _QWORD v5[8];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__PXStoryMusicPlayer_observable_didChange_context___block_invoke;
  v5[3] = &unk_1E5141D90;
  v5[4] = self;
  v5[5] = a5;
  v5[6] = a4;
  v5[7] = a2;
  -[PXStoryMusicPlayer performChanges:](self, "performChanges:", v5);
}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  double height;
  double width;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  double v24;
  id v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  float v40;
  __CFString *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __int128 v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _OWORD v55[3];
  __int128 v56;
  uint64_t v57;
  CMTime duration;
  CMTime start;
  CMTimeRange v60;

  height = a4.height;
  width = a4.width;
  v8 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[PXStoryMusicPlayer player](self, "player");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "desiredPlayState");
  if (a3 == 2)
  {
    v11 = v10;
    -[PXStoryMusicPlayer currentSongResource](self, "currentSongResource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("Song Resource: %@\n"), v12);

    -[PXStoryMusicPlayer currentSongResource](self, "currentSongResource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "px_storyResourceSongAsset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PXAudioAssetDefaultEntryPoint(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "time");
    objc_msgSend(v8, "appendFormat:", CFSTR("   Start Time: %.0f\n"), v16);

    -[PXStoryMusicPlayer model](self, "model");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appleMusicStatusProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "statusForCapability:", 1);
    if ((unint64_t)(v20 - 1) > 2)
      v21 = CFSTR("Unknown");
    else
      v21 = off_1E5143FE8[v20 - 1];
    v22 = v21;
    objc_msgSend(v8, "appendFormat:", CFSTR("Music Status: %@\n"), v22);

    -[PXStoryMusicPlayer duckingVolumeAnimator](self, "duckingVolumeAnimator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "presentationValue");
    if (v24 >= 1.0)
    {
      objc_msgSend(v8, "appendFormat:", CFSTR("      Ducking: %@\n"), CFSTR("Not Ducked"));
    }
    else
    {
      v25 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[PXStoryMusicPlayer duckingReason](self, "duckingReason");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      if (v26)
        v28 = (const __CFString *)v26;
      else
        v28 = CFSTR("Not Ducked");
      -[PXStoryMusicPlayer duckingVolumeAnimator](self, "duckingVolumeAnimator");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "presentationValue");
      v31 = (void *)objc_msgSend(v25, "initWithFormat:", CFSTR("%@ (%.2f)"), v28, v30);
      objc_msgSend(v8, "appendFormat:", CFSTR("      Ducking: %@\n"), v31);

    }
    -[PXStoryMusicPlayer fadeOutVolumeAnimator](self, "fadeOutVolumeAnimator");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "presentationValue");
    if (v33 >= 1.0)
    {
      objc_msgSend(v8, "appendFormat:", CFSTR("       Fading: %@\n"), CFSTR("Not Fading"));
    }
    else
    {
      v34 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[PXStoryMusicPlayer fadeOutVolumeAnimator](self, "fadeOutVolumeAnimator");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "presentationValue");
      v37 = (void *)objc_msgSend(v34, "initWithFormat:", CFSTR("Fading Out (%.2f)"), v36);
      objc_msgSend(v8, "appendFormat:", CFSTR("       Fading: %@\n"), v37);

    }
    -[PXStoryMusicPlayer viewControllerTransitionVolumeAnimator](self, "viewControllerTransitionVolumeAnimator");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "presentationValue");
    objc_msgSend(v8, "appendFormat:", CFSTR(" VCTransition: %0.2f\n"), v39);

    objc_msgSend(v9, "volume");
    objc_msgSend(v8, "appendFormat:", CFSTR("       Volume: %.1f\n"), v40);
    v41 = CFSTR("Paused");
    if (v11 == 1)
      v41 = CFSTR("Playing");
    v42 = v41;
    objc_msgSend(v8, "appendFormat:", CFSTR("Desired State: %@"), v42);

    -[PXStoryMusicPlayer failedAudioAssets](self, "failedAudioAssets");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v43, "count"))
    {
      -[PXStoryMusicPlayer failedAudioAssets](self, "failedAudioAssets");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      PXMap();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "componentsJoinedByString:", CFSTR("; "));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendFormat:", CFSTR("\nFailed Assets: %@"), v46);

    }
    if (!v11)
    {
      -[PXStoryMusicPlayer pauseReason](self, "pauseReason");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendFormat:", CFSTR("(%@)"), v47);

    }
    -[PXStoryMusicPlayer cueSource](self, "cueSource");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      -[PXStoryMusicPlayer currentTime](self, "currentTime");
      CMTimeMake(&duration, 3, 1);
      CMTimeRangeMake(&v60, &start, &duration);
      v56 = *MEMORY[0x1E0CA2E18];
      v57 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      v49 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
      v55[0] = *MEMORY[0x1E0CA2E40];
      v55[1] = v49;
      v55[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
      objc_msgSend(v48, "diagnosticStringForTimeRange:indicatorTime:rangeIndicatorTimeRange:stringLength:", &v60, &v56, v55, 50);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendFormat:", CFSTR("\nCues: \n%@"), v50);

    }
    else
    {
      objc_msgSend(v8, "appendString:", CFSTR("\nCues: None"));
    }

  }
  objc_msgSend(v8, "appendString:", CFSTR("\n\nPXAudioPlayer\n"));
  -[PXStoryMusicPlayer player](self, "player");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "lcdStringForSize:", width, height);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v52);

  v53 = (void *)objc_msgSend(v8, "copy");
  return v53;
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  -[PXStoryMusicPlayer player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("MusicPlayback"));

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5;
  int v6;
  void *v7;
  id v8;

  v8 = a4;
  NSStringFromSelector(sel_musicTargetLoudnessLKFS);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v8)
  {

  }
  else
  {
    v6 = objc_msgSend(v8, "isEqualToString:", v5);

    if (!v6)
      goto LABEL_6;
  }
  -[PXStoryMusicPlayer player](self, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performChanges:", &__block_literal_global_152_265304);

LABEL_6:
}

- (id)AVAudioSessionForPlayer:(id)a3
{
  void *v3;
  void *v4;

  -[PXStoryMusicPlayer model](self, "model", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "audioSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)windowSceneID
{
  void *v2;
  void *v3;

  -[PXStoryMusicPlayer model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowSceneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackStartTimeForIncomingSong:(SEL)a3
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  Float64 v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTime v13;
  __int128 v14;
  int64_t v15;

  v6 = a4;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  retstr->var0 = 0;
  -[PXStoryMusicPlayer model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0uLL;
  v15 = 0;
  -[PXStoryMusicPlayer player](self, "player");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "currentTime");
  }
  else
  {
    v14 = 0uLL;
    v15 = 0;
  }

  if (objc_msgSend(v7, "viewMode") == 4
    && (objc_msgSend(v7, "isPresentingMusicEditor") & 1) == 0
    && (BYTE12(v14) & 0x1D) == 1)
  {
    *(_OWORD *)&retstr->var0 = v14;
    retstr->var3 = v15;
  }
  else
  {
    PXAudioAssetDefaultEntryPoint(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "time");
    CMTimeMakeWithSeconds(&v13, v11, 600);
    *(CMTime *)retstr = v13;

  }
  return result;
}

- (void)setTouchingBeganDate:(id)a3
{
  NSDate *v5;
  NSDate *v6;
  NSDate *v7;
  char v8;
  void *v9;
  double v10;
  double v11;
  dispatch_time_t v12;
  NSObject *v13;
  _QWORD v14[5];
  _QWORD block[4];
  NSDate *v16;
  id v17;
  id location;

  v5 = (NSDate *)a3;
  v6 = self->_touchingBeganDate;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[NSDate isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_touchingBeganDate, a3);
      if (v5)
      {
        +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "musicTouchDuckingDelay");
        v11 = v10;

        objc_initWeak(&location, self);
        v12 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
        -[PXStoryMusicPlayer storyQueue](self, "storyQueue");
        v13 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __43__PXStoryMusicPlayer_setTouchingBeganDate___block_invoke;
        block[3] = &unk_1E5147280;
        objc_copyWeak(&v17, &location);
        v16 = v5;
        dispatch_after(v12, v13, block);

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }
      else
      {
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __43__PXStoryMusicPlayer_setTouchingBeganDate___block_invoke_2;
        v14[3] = &unk_1E5141E38;
        v14[4] = self;
        -[PXStoryMusicPlayer performChanges:](self, "performChanges:", v14);
      }
    }
  }

}

- (void)_handleDuckingDelayPassedForTouchingBeganDate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  _QWORD v7[5];

  v4 = a3;
  -[PXStoryMusicPlayer touchingBeganDate](self, "touchingBeganDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToDate:", v5);

  if (v6)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__PXStoryMusicPlayer__handleDuckingDelayPassedForTouchingBeganDate___block_invoke;
    v7[3] = &unk_1E5141E38;
    v7[4] = self;
    -[PXStoryMusicPlayer performChanges:](self, "performChanges:", v7);
  }
}

- (void)setShouldDuckForCurrentTouch:(BOOL)a3
{
  if (self->_shouldDuckForCurrentTouch != a3)
  {
    self->_shouldDuckForCurrentTouch = a3;
    -[PXStoryMusicPlayer _invalidateDucked](self, "_invalidateDucked");
  }
}

- (void)_handlePlaybackFailureIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  -[PXStoryMusicPlayer player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  if (v4 == 5)
  {
    v5 = (void *)MEMORY[0x1E0D09910];
    v16[0] = *MEMORY[0x1E0D09830];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = CFSTR("interactiveMemoryMusicCatalog");
    v17[0] = v7;
    -[PXStoryMusicPlayer currentAudioAsset](self, "currentAudioAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "catalog");
    if (v9 > 4)
      v10 = CFSTR("Mock");
    else
      v10 = off_1E5133A28[v9];
    v11 = v10;
    v17[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryMusicPlayer player](self, "player");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_dictionaryBySettingObject:forKey:", v14, *MEMORY[0x1E0D09838]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendEvent:withPayload:", CFSTR("com.apple.photos.memory.interactiveMemoryMusicFailed"), v15);

    -[PXStoryMusicPlayer _invalidateError](self, "_invalidateError");
  }
}

- (void)setAudioDesiredPlayState:(int64_t)a3
{
  if (self->_audioDesiredPlayState != a3)
  {
    self->_audioDesiredPlayState = a3;
    -[PXStoryMusicPlayer _invalidatePlayerDesiredPlayState](self, "_invalidatePlayerDesiredPlayState");
    -[PXStoryMusicPlayer _invalidatePlaybackTimer](self, "_invalidatePlaybackTimer");
  }
}

- (void)_handlePlaybackTimerFired:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__PXStoryMusicPlayer__handlePlaybackTimerFired___block_invoke;
  v3[3] = &unk_1E5141E38;
  v3[4] = self;
  -[PXStoryMusicPlayer performChanges:](self, "performChanges:", v3);
}

- (void)_invalidateFailedAudioAssets
{
  id v2;

  -[PXStoryMusicPlayer updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateFailedAudioAssets);

}

- (void)_updateFailedAudioAssets
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSMutableSet *v6;
  NSMutableSet *internalFailedAudioAssets;
  void *v8;
  char v9;
  void *v10;
  id v11;

  -[PXStoryMusicPlayer player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  if (v4 == 5)
  {
    -[PXStoryMusicPlayer player](self, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentAsset");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (!self->_internalFailedAudioAssets)
    {
      v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      internalFailedAudioAssets = self->_internalFailedAudioAssets;
      self->_internalFailedAudioAssets = v6;

    }
    -[PXStoryMusicPlayer internalFailedAudioAssets](self, "internalFailedAudioAssets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v11);

    if ((v9 & 1) == 0)
    {
      -[PXStoryMusicPlayer internalFailedAudioAssets](self, "internalFailedAudioAssets");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

      -[PXStoryMusicPlayer signalChange:](self, "signalChange:", 4);
    }

  }
}

- (NSSet)failedAudioAssets
{
  void *v2;
  void *v3;

  -[PXStoryMusicPlayer internalFailedAudioAssets](self, "internalFailedAudioAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSSet *)v3;
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (PXStoryModel)model
{
  return self->_model;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (int64_t)readinessStatus
{
  return self->_readinessStatus;
}

- (PXAudioPlayer)player
{
  return self->_player;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (int64_t)cueRequestID
{
  return self->_cueRequestID;
}

- (void)setCueRequestID:(int64_t)a3
{
  self->_cueRequestID = a3;
}

- (PXNumberAnimator)duckingVolumeAnimator
{
  return self->_duckingVolumeAnimator;
}

- (PXNumberAnimator)focusVolumeAnimator
{
  return self->_focusVolumeAnimator;
}

- (PXNumberAnimator)fadeOutVolumeAnimator
{
  return self->_fadeOutVolumeAnimator;
}

- (PXNumberAnimator)viewControllerTransitionVolumeAnimator
{
  return self->_viewControllerTransitionVolumeAnimator;
}

- (PXAudioAsset)currentAudioAsset
{
  return self->_currentAudioAsset;
}

- (PXAudioCueSource)cueSource
{
  return self->_cueSource;
}

- (void)setCueSource:(id)a3
{
  objc_storeStrong((id *)&self->_cueSource, a3);
}

- (int64_t)desiredPlayState
{
  return self->_desiredPlayState;
}

- (void)setDesiredPlayState:(int64_t)a3
{
  self->_desiredPlayState = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 296);
  return self;
}

- (int64_t)cuesVersion
{
  return self->_cuesVersion;
}

- (void)setCuesVersion:(int64_t)a3
{
  self->_cuesVersion = a3;
}

- (NSString)pauseReason
{
  return self->_pauseReason;
}

- (void)setPauseReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSString)duckingReason
{
  return self->_duckingReason;
}

- (void)setDuckingReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSDate)touchingBeganDate
{
  return self->_touchingBeganDate;
}

- (BOOL)shouldDuckForCurrentTouch
{
  return self->_shouldDuckForCurrentTouch;
}

- (int64_t)bufferingEvents
{
  return self->_bufferingEvents;
}

- (void)setBufferingEvents:(int64_t)a3
{
  self->_bufferingEvents = a3;
}

- (NSTimer)playbackTimer
{
  return self->_playbackTimer;
}

- (void)setPlaybackTimer:(id)a3
{
  objc_storeStrong((id *)&self->_playbackTimer, a3);
}

- (NSMutableSet)internalFailedAudioAssets
{
  return self->_internalFailedAudioAssets;
}

- (BOOL)targetDurationMatchesTimeline
{
  return self->_targetDurationMatchesTimeline;
}

- (float)volume
{
  return self->_volume;
}

- (BOOL)isDucked
{
  return self->_isDucked;
}

- (float)duckedVolume
{
  return self->_duckedVolume;
}

- (PXStorySongResource)currentSongResource
{
  return self->_currentSongResource;
}

- (int64_t)audioDesiredPlayState
{
  return self->_audioDesiredPlayState;
}

- (PXAudioCueProvider)cueProvider
{
  return self->_cueProvider;
}

- (void)setCueProvider:(id)a3
{
  objc_storeStrong((id *)&self->_cueProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cueProvider, 0);
  objc_storeStrong((id *)&self->_currentSongResource, 0);
  objc_storeStrong((id *)&self->_internalFailedAudioAssets, 0);
  objc_storeStrong((id *)&self->_playbackTimer, 0);
  objc_storeStrong((id *)&self->_touchingBeganDate, 0);
  objc_storeStrong((id *)&self->_duckingReason, 0);
  objc_storeStrong((id *)&self->_pauseReason, 0);
  objc_storeStrong((id *)&self->_cueSource, 0);
  objc_storeStrong((id *)&self->_currentAudioAsset, 0);
  objc_storeStrong((id *)&self->_viewControllerTransitionVolumeAnimator, 0);
  objc_storeStrong((id *)&self->_fadeOutVolumeAnimator, 0);
  objc_storeStrong((id *)&self->_focusVolumeAnimator, 0);
  objc_storeStrong((id *)&self->_duckingVolumeAnimator, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
}

uint64_t __48__PXStoryMusicPlayer__handlePlaybackTimerFired___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidatePlayerVolume");
}

uint64_t __68__PXStoryMusicPlayer__handleDuckingDelayPassedForTouchingBeganDate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShouldDuckForCurrentTouch:", 1);
}

void __43__PXStoryMusicPlayer_setTouchingBeganDate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleDuckingDelayPassedForTouchingBeganDate:", *(_QWORD *)(a1 + 32));

}

uint64_t __43__PXStoryMusicPlayer_setTouchingBeganDate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShouldDuckForCurrentTouch:", 0);
}

void __50__PXStoryMusicPlayer_settings_changedValueForKey___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "musicTargetLoudnessLKFS");
  objc_msgSend(v2, "setTargetLoudnessInLKFS:");

}

id __59__PXStoryMusicPlayer_diagnosticTextForHUDType_displaySize___block_invoke(uint64_t a1, void *a2)
{
  return PXAudioAssetShortDescription(a2);
}

void __51__PXStoryMusicPlayer_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = *(_QWORD *)(a1 + 40);
  if (v3 == StyleManagerContext_265349)
  {
    if ((*(_BYTE *)(a1 + 49) & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "_invalidateFocusVolumeAnimator");
    goto LABEL_39;
  }
  if (v3 == ModelContext_265350)
  {
    v4 = *(_QWORD *)(a1 + 48);
    if ((v4 & 0x18000210002) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_invalidateDesiredPlayState");
      v4 = *(_QWORD *)(a1 + 48);
    }
    if ((v4 & 0x8000000000) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentAudioAsset");
      v4 = *(_QWORD *)(a1 + 48);
      if ((v4 & 0x800000000000) == 0)
      {
LABEL_13:
        if ((v4 & 0x400) == 0)
          goto LABEL_14;
        goto LABEL_31;
      }
    }
    else if ((v4 & 0x800000000000) == 0)
    {
      goto LABEL_13;
    }
    objc_msgSend(*(id *)(a1 + 32), "_invalidateDesiredPlayState");
    v4 = *(_QWORD *)(a1 + 48);
    if ((v4 & 0x400) == 0)
    {
LABEL_14:
      if ((v4 & 0x40000000000) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
LABEL_31:
    objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentSongResource");
    v4 = *(_QWORD *)(a1 + 48);
    if ((v4 & 0x40000000000) == 0)
    {
LABEL_16:
      if ((v4 & 0x10100) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "_invalidateDucked");
        v4 = *(_QWORD *)(a1 + 48);
      }
      if ((v4 & 0x4000000) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "_invalidateTouchingBeganDate");
        v4 = *(_QWORD *)(a1 + 48);
        if ((v4 & 0x10) == 0)
        {
LABEL_20:
          if ((v4 & 0x400000000000) == 0)
            goto LABEL_21;
          goto LABEL_35;
        }
      }
      else if ((v4 & 0x10) == 0)
      {
        goto LABEL_20;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateTargetDuration");
      v4 = *(_QWORD *)(a1 + 48);
      if ((v4 & 0x400000000000) == 0)
      {
LABEL_21:
        if ((v4 & 0x200000000000000) == 0)
          goto LABEL_22;
        goto LABEL_36;
      }
LABEL_35:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateFadeOutVolumeAnimator");
      v4 = *(_QWORD *)(a1 + 48);
      if ((v4 & 0x200000000000000) == 0)
      {
LABEL_22:
        if ((v4 & 0x10000) == 0)
          goto LABEL_23;
        goto LABEL_37;
      }
LABEL_36:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateViewControllerTransitionVolumeAnimator");
      v4 = *(_QWORD *)(a1 + 48);
      if ((v4 & 0x10000) == 0)
      {
LABEL_23:
        if ((v4 & 0x200000000000000) == 0)
          goto LABEL_39;
        goto LABEL_38;
      }
LABEL_37:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentSongResource");
      if ((*(_QWORD *)(a1 + 48) & 0x200000000000000) == 0)
        goto LABEL_39;
      goto LABEL_38;
    }
LABEL_15:
    objc_msgSend(*(id *)(a1 + 32), "_invalidateDucked");
    v4 = *(_QWORD *)(a1 + 48);
    goto LABEL_16;
  }
  if (v3 != PlayerContext)
  {
    if (v3 != VolumeAnimatorContext)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PXStoryMusicPlayer.m"), 704, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((*(_BYTE *)(a1 + 48) & 2) == 0)
      goto LABEL_39;
LABEL_38:
    objc_msgSend(*(id *)(a1 + 32), "_invalidatePlayerVolume");
    goto LABEL_39;
  }
  v5 = *(_QWORD *)(a1 + 48);
  if ((v5 & 4) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidateReadinessStatus");
    objc_msgSend(*(id *)(a1 + 32), "_invalidatePlayerDesiredPlayState");
    objc_msgSend(*(id *)(a1 + 32), "_invalidateFailedAudioAssets");
    objc_msgSend(*(id *)(a1 + 32), "_handlePlaybackFailureIfNeeded");
    v5 = *(_QWORD *)(a1 + 48);
  }
  if ((v5 & 0x20) != 0)
    objc_msgSend(*(id *)(a1 + 32), "_invalidateError");
LABEL_39:

}

uint64_t __67__PXStoryMusicPlayer__updateViewControllerTransitionVolumeAnimator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(double *)(a1 + 32));
}

uint64_t __48__PXStoryMusicPlayer__updateFocusVolumeAnimator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(float *)(a1 + 32));
}

uint64_t __48__PXStoryMusicPlayer__updateFocusVolumeAnimator__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(float *)(a1 + 32));
}

uint64_t __50__PXStoryMusicPlayer__updateDuckingVolumeAnimator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(float *)(a1 + 32));
}

uint64_t __50__PXStoryMusicPlayer__updateFadeOutVolumeAnimator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(float *)(a1 + 32));
}

uint64_t __50__PXStoryMusicPlayer__updateFadeOutVolumeAnimator__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", 1.0);
}

uint64_t __41__PXStoryMusicPlayer__updatePlayerVolume__block_invoke(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return objc_msgSend(a2, "setVolume:", a3);
}

uint64_t __44__PXStoryMusicPlayer__updateModelProperties__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__PXStoryMusicPlayer__updateModelProperties__block_invoke_2;
  v3[3] = &__block_descriptor_40_e31_v16__0___PXStoryMutableModel__8l;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "performChanges:", v3);
}

uint64_t __44__PXStoryMusicPlayer__updateModelProperties__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setMusicReadinessStatus:", *(_QWORD *)(a1 + 32));
}

void __51__PXStoryMusicPlayer__updatePlayerDesiredPlayState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  Float64 v10;
  CMTime v11[2];
  CMTime lhs;
  CMTime v13;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    if (v5 == 1 && objc_msgSend(v3, "desiredPlayState") != 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "model");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
        objc_msgSend(v6, "nominalPlaybackTime");
      else
        memset(&v11[1], 0, sizeof(CMTime));
      lhs = v11[1];
      objc_msgSend(v4, "currentAsset");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PXAudioAssetDefaultEntryPoint(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "time");
      CMTimeMakeWithSeconds(v11, v10, PXAudioDefaultCMTimeScale);
      CMTimeAdd(&v13, &lhs, v11);
      objc_msgSend(v4, "playFromStartTime:", &v13);

    }
  }
  else
  {
    objc_msgSend(v3, "setDesiredPlayState:", 0);
  }

}

uint64_t __45__PXStoryMusicPlayer__updateDesiredPlayState__block_invoke(uint64_t a1)
{
  void *v2;
  const char *v3;
  void *v4;
  int IsNullResource;
  void *v6;

  if ((objc_msgSend(*(id *)(a1 + 32), "isPresentingMusicEditor") & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "desiredPlayState") != 1)
    {
      v2 = (void *)MEMORY[0x1E0CB3940];
      v3 = "model.desiredPlayState != PXStoryDesiredPlayStatePlaying";
      goto LABEL_15;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "viewMode") != 4 && objc_msgSend(*(id *)(a1 + 32), "readinessStatus") != 3)
    {
      v2 = (void *)MEMORY[0x1E0CB3940];
      v3 = "model.readinessStatus != PXStoryPlaybackReadinessStatusReadyToPlay";
      goto LABEL_15;
    }
  }
  if (!*(_BYTE *)(a1 + 48))
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    v3 = "!canPlayInCurrentViewMode";
    goto LABEL_15;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "isActive") & 1) == 0)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    v3 = "!self.isActive";
    goto LABEL_15;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isPresentingColorGradeEditor"))
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    v3 = "model.isPresentingColorGradeEditor";
LABEL_15:
    objc_msgSend(v2, "stringWithUTF8String:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setPauseReason:", v6);

    return 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "currentSongResource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IsNullResource = PXStorySongResourceIsNullResource(v4);

  if (IsNullResource)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    v3 = "songResourceIsNull";
    goto LABEL_15;
  }
  objc_msgSend(*(id *)(a1 + 40), "setPauseReason:", 0);
  return 0;
}

uint64_t __47__PXStoryMusicPlayer__updatePlayerCurrentAsset__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  __int128 v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  return objc_msgSend(a2, "setCurrentAsset:startTime:", v2, &v4);
}

uint64_t __61__PXStoryMusicPlayer__handleAudioCues_asset_error_requestID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 64);
  result = objc_msgSend(*(id *)(a1 + 32), "cueRequestID");
  if (v2 == result)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (!v4)
    {
      PLAudioPlaybackGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = *(_QWORD *)(a1 + 48);
        v7 = *(_QWORD *)(a1 + 56);
        v8 = 138412546;
        v9 = v6;
        v10 = 2112;
        v11 = v7;
        _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Failed to retrieve audio cues for asset %@. Error: %@", (uint8_t *)&v8, 0x16u);
      }

      v4 = *(_QWORD *)(a1 + 40);
    }
    return objc_msgSend(*(id *)(a1 + 32), "setCueSource:", v4);
  }
  return result;
}

void __38__PXStoryMusicPlayer__updateCueSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleAudioCues:asset:error:requestID:", v7, *(_QWORD *)(a1 + 32), v6, *(_QWORD *)(a1 + 48));

}

uint64_t __28__PXStoryMusicPlayer_replay__block_invoke(uint64_t a1, void *a2)
{
  __int128 v3;
  uint64_t v4;

  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  return objc_msgSend(a2, "replayFromTime:", &v3);
}

uint64_t __66__PXStoryMusicPlayer_initWithModel_targetDurationMatchesTimeline___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDiagnosticHUDContentProvider:forType:", *(_QWORD *)(a1 + 32), 2);
}

void __66__PXStoryMusicPlayer_initWithModel_targetDurationMatchesTimeline___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "musicTargetLoudnessLKFS");
  objc_msgSend(v4, "setTargetLoudnessInLKFS:");

  objc_msgSend(v4, "setAudioSessionDelegate:", *(_QWORD *)(a1 + 32));
}

id __66__PXStoryMusicPlayer_initWithModel_targetDurationMatchesTimeline___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:", 1.0);
  objc_msgSend(v4, "registerChangeObserver:context:", *(_QWORD *)(a1 + 32), VolumeAnimatorContext);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("-%@"), v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setLabel:", v7);
  return v4;
}

@end
