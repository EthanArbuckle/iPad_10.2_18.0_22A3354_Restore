@implementation PXAVPlayerAudioSession

- (PXAVPlayerAudioSession)initWithAsset:(id)a3 volume:(float)a4 startTime:(id *)a5 queue:(id)a6 audioSessionDelegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  PXAVPlayerAudioSession *v15;
  void *v16;
  uint64_t v17;
  OS_dispatch_queue *playerQueue;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  AVQueuePlayer *playerQueue_player;
  void *v26;
  uint64_t v27;
  PXUpdater *updater;
  _QWORD v30[4];
  id v31;
  CMTime v32;
  _QWORD v33[4];
  id v34;
  $3CC8671D27C23BF42ADDB32F2B5E48AE location;
  objc_super v36;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v36.receiver = self;
  v36.super_class = (Class)PXAVPlayerAudioSession;
  location = *a5;
  v15 = -[PXAudioSession initWithAsset:volume:startTime:queue:audioSessionDelegate:](&v36, sel_initWithAsset_volume_startTime_queue_audioSessionDelegate_, v12, &location, v13, v14, COERCE_DOUBLE(__PAIR64__(HIDWORD(location.var0), LODWORD(a4))));
  if (v15)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    px_dispatch_queue_create();
    v17 = objc_claimAutoreleasedReturnValue();
    playerQueue = v15->_playerQueue;
    v15->_playerQueue = (OS_dispatch_queue *)v17;

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B350]), "initWithDispatchQueue:", v15->_playerQueue);
    objc_msgSend(v19, "setSourceClock:", objc_msgSend((id)objc_opt_class(), "sourceClock"));
    objc_msgSend(v19, "setAutomaticallyWaitsToMinimizeStalling:", 0);
    objc_msgSend(v19, "setActionAtItemEnd:", 0);
    NSStringFromSelector(sel_currentItem);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:forKeyPath:options:context:", v15, v20, 2, 0);

    objc_storeStrong((id *)&v15->_playerQueue_player, v19);
    -[PXAudioSession audioSessionDelegate](v15, "audioSessionDelegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "AVAudioSessionForAudioSession:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      objc_msgSend((id)objc_opt_class(), "_audioSession");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v23 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __84__PXAVPlayerAudioSession_initWithAsset_volume_startTime_queue_audioSessionDelegate___block_invoke;
    v33[3] = &unk_1E5143B58;
    v24 = v22;
    v34 = v24;
    -[PXAVPlayerAudioSession _performPlayerTransaction:](v15, "_performPlayerTransaction:", v33);
    objc_initWeak((id *)&location, v15);
    playerQueue_player = v15->_playerQueue_player;
    CMTimeMake(&v32, 1, 60);
    v30[0] = v23;
    v30[1] = 3221225472;
    v30[2] = __84__PXAVPlayerAudioSession_initWithAsset_volume_startTime_queue_audioSessionDelegate___block_invoke_2;
    v30[3] = &unk_1E5143B80;
    objc_copyWeak(&v31, (id *)&location);
    -[AVQueuePlayer addPeriodicTimeObserverForInterval:queue:usingBlock:](playerQueue_player, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v32, v13, v30);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAVPlayerAudioSession setPlayerTimeObserver:](v15, "setPlayerTimeObserver:", v26);

    v27 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:", v15);
    updater = v15->_updater;
    v15->_updater = (PXUpdater *)v27;

    -[PXUpdater addUpdateSelector:needsUpdate:](v15->_updater, "addUpdateSelector:needsUpdate:", sel__updatePlayerVolume, 1);
    -[PXUpdater addUpdateSelector:](v15->_updater, "addUpdateSelector:", sel__updatePlayerRate);
    -[PXUpdater addUpdateSelector:](v15->_updater, "addUpdateSelector:", sel__updateStatus);
    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)&location);

  }
  return v15;
}

- (void)dealloc
{
  AVQueuePlayer *playerQueue_player;
  void *v4;
  objc_super v5;

  playerQueue_player = self->_playerQueue_player;
  NSStringFromSelector(sel_currentItem);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVQueuePlayer removeObserver:forKeyPath:](playerQueue_player, "removeObserver:forKeyPath:", self, v4);

  v5.receiver = self;
  v5.super_class = (Class)PXAVPlayerAudioSession;
  -[PXAVPlayerAudioSession dealloc](&v5, sel_dealloc);
}

- (void)performFinalCleanup
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXAVPlayerAudioSession;
  -[PXAudioSession performFinalCleanup](&v4, sel_performFinalCleanup);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__PXAVPlayerAudioSession_performFinalCleanup__block_invoke;
  v3[3] = &unk_1E5143B58;
  v3[4] = self;
  -[PXAVPlayerAudioSession _performPlayerTransaction:](self, "_performPlayerTransaction:", v3);
}

- (void)prepareToPlay
{
  NSObject *v3;

  -[PXAudioSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[PXAVPlayerAudioSession _prepareToPlayIfNeeded](self, "_prepareToPlayIfNeeded");
}

- (void)pause
{
  NSObject *v3;
  _QWORD v4[5];

  -[PXAudioSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__PXAVPlayerAudioSession_pause__block_invoke;
  v4[3] = &unk_1E5144758;
  v4[4] = self;
  -[PXAudioSession performChanges:](self, "performChanges:", v4);
  -[PXAVPlayerAudioSession _performPlayerTransaction:](self, "_performPlayerTransaction:", &__block_literal_global_19_274366);
}

- (void)play
{
  NSObject *v3;
  _QWORD v4[5];

  -[PXAudioSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__PXAVPlayerAudioSession_play__block_invoke;
  v4[3] = &unk_1E5144758;
  v4[4] = self;
  -[PXAudioSession performChanges:](self, "performChanges:", v4);
  -[PXAVPlayerAudioSession _prepareToPlayIfNeeded](self, "_prepareToPlayIfNeeded");
}

- (void)playFromTime:(id *)a3
{
  _QWORD v3[4];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__PXAVPlayerAudioSession_playFromTime___block_invoke;
  v3[3] = &__block_descriptor_56_e18_v16__0__AVPlayer_8l;
  v4 = *a3;
  -[PXAVPlayerAudioSession _performPlayerTransaction:](self, "_performPlayerTransaction:", v3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  if (-[PXAVPlayerAudioSession playerTimeHasChangedSinceSeeking](self, "playerTimeHasChangedSinceSeeking"))
    return -[PXAVPlayerAudioSession playerTime](self, "playerTime");
  else
    return -[PXAudioSession startTime](self, "startTime");
}

- (void)desiredPlayerVolumeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAVPlayerAudioSession;
  -[PXAudioSession desiredPlayerVolumeDidChange](&v3, sel_desiredPlayerVolumeDidChange);
  -[PXAVPlayerAudioSession _invalidatePlayerVolume](self, "_invalidatePlayerVolume");
}

- (void)errorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAVPlayerAudioSession;
  -[PXAudioSession errorDidChange](&v3, sel_errorDidChange);
  -[PXAVPlayerAudioSession _invalidateStatus](self, "_invalidateStatus");
}

- (void)performInternalChanges:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;

  v6[1] = 3221225472;
  v6[2] = __49__PXAVPlayerAudioSession_performInternalChanges___block_invoke;
  v6[3] = &unk_1E5143C08;
  v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PXAVPlayerAudioSession;
  v6[0] = MEMORY[0x1E0C809B0];
  v4 = v7;
  -[PXAudioSession performInternalChanges:](&v5, sel_performInternalChanges_, v6);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  Float64 v11;
  _QWORD v12[4];
  id v13;
  CMTime v14;
  CMTime v15;

  objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8], a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v8)
    {
      memset(&v15, 0, sizeof(v15));
      -[PXAudioSession asset](self, "asset");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PXAudioAssetDefaultEntryPoint(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "time");
      CMTimeMakeWithSeconds(&v15, v11, 600);

      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __73__PXAVPlayerAudioSession_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v12[3] = &unk_1E5143C30;
      v13 = v7;
      v14 = v15;
      -[PXAVPlayerAudioSession _performPlayerTransaction:](self, "_performPlayerTransaction:", v12);

    }
  }

}

- (void)requestMediaWithResultHandler:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAVPlayerAudioSession.m"), 209, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAVPlayerAudioSession requestMediaWithResultHandler:]", v8);

  abort();
}

- (void)cancelMediaRequest
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAVPlayerAudioSession.m"), 213, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAVPlayerAudioSession cancelMediaRequest]", v6);

  abort();
}

- (void)didPerformChanges
{
  NSObject *v3;
  objc_super v4;

  -[PXAudioSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4.receiver = self;
  v4.super_class = (Class)PXAVPlayerAudioSession;
  -[PXAudioSession didPerformChanges](&v4, sel_didPerformChanges);
  -[PXUpdater updateIfNeeded](self->_updater, "updateIfNeeded");
}

- (void)_invalidateStatus
{
  id v2;

  -[PXAVPlayerAudioSession updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateStatus);

}

- (void)_updateStatus
{
  void *v3;
  uint64_t v4;
  float v5;
  _QWORD v6[5];

  -[PXAudioSession error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = 4;
  }
  else if (-[PXAVPlayerAudioSession isPreparingToPlay](self, "isPreparingToPlay"))
  {
    v4 = 1;
  }
  else
  {
    -[PXAVPlayerAudioSession playerRate](self, "playerRate");
    v4 = 2;
    if (v5 > 0.0)
      v4 = 3;
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__PXAVPlayerAudioSession__updateStatus__block_invoke;
  v6[3] = &__block_descriptor_40_e49_v16__0___PXInternalMutableAVPlayerAudioSession__8l;
  v6[4] = v4;
  -[PXAVPlayerAudioSession performInternalChanges:](self, "performInternalChanges:", v6);
}

- (void)_invalidatePlayerVolume
{
  id v2;

  -[PXAVPlayerAudioSession updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePlayerVolume);

}

- (void)_updatePlayerVolume
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __45__PXAVPlayerAudioSession__updatePlayerVolume__block_invoke;
  v2[3] = &unk_1E5143B58;
  v2[4] = self;
  -[PXAVPlayerAudioSession _performPlayerTransaction:](self, "_performPlayerTransaction:", v2);
}

- (void)_invalidatePlayerRate
{
  id v2;

  -[PXAVPlayerAudioSession updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePlayerRate);

}

- (void)_updatePlayerRate
{
  unsigned int v3;
  _QWORD v4[5];
  float v5;

  v3 = -[PXAVPlayerAudioSession isPlaybackDesired](self, "isPlaybackDesired");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__PXAVPlayerAudioSession__updatePlayerRate__block_invoke;
  v4[3] = &unk_1E5143C78;
  v4[4] = self;
  v5 = (float)v3;
  -[PXAudioSession performChanges:](self, "performChanges:", v4);
}

- (void)setPlayerRate:(float)a3
{
  NSObject *v5;
  _QWORD v6[4];
  float v7;

  -[PXAudioSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->_playerRate != a3)
  {
    self->_playerRate = a3;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__PXAVPlayerAudioSession_setPlayerRate___block_invoke;
    v6[3] = &__block_descriptor_36_e18_v16__0__AVPlayer_8l;
    v7 = a3;
    -[PXAVPlayerAudioSession _performPlayerTransaction:](self, "_performPlayerTransaction:", v6);
    -[PXAVPlayerAudioSession _invalidateStatus](self, "_invalidateStatus");
  }
}

- (void)_performPlayerTransaction:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[PXAVPlayerAudioSession playerQueue](self, "playerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PXAVPlayerAudioSession__performPlayerTransaction___block_invoke;
  block[3] = &unk_1E5146480;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_playerQueue_performPlayerTransaction:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[PXAVPlayerAudioSession playerQueue_player](self, "playerQueue_player");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (void)_handlePlayerTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v4 = *a3;
  -[PXAVPlayerAudioSession setPlayerTime:](self, "setPlayerTime:", &v4);
  -[PXAVPlayerAudioSession setPlayerTimeHasChangedSinceSeeking:](self, "setPlayerTimeHasChangedSinceSeeking:", 1);
}

- (void)_prepareToPlayIfNeeded
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id location;
  _QWORD v7[5];

  if (-[PXAudioSession status](self, "status") <= 0)
  {
    v3 = MEMORY[0x1E0C809B0];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__PXAVPlayerAudioSession__prepareToPlayIfNeeded__block_invoke;
    v7[3] = &unk_1E5144758;
    v7[4] = self;
    -[PXAudioSession performChanges:](self, "performChanges:", v7);
    objc_initWeak(&location, self);
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __48__PXAVPlayerAudioSession__prepareToPlayIfNeeded__block_invoke_2;
    v4[3] = &unk_1E5143CC0;
    objc_copyWeak(&v5, &location);
    -[PXAVPlayerAudioSession requestMediaWithResultHandler:](self, "requestMediaWithResultHandler:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)setIsPreparingToPlay:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;

  v3 = a3;
  -[PXAudioSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->_isPreparingToPlay != v3)
  {
    self->_isPreparingToPlay = v3;
    -[PXAVPlayerAudioSession _invalidateStatus](self, "_invalidateStatus");
    -[PXAVPlayerAudioSession _invalidatePlayerRate](self, "_invalidatePlayerRate");
  }
}

- (void)setIsPlaybackDesired:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;

  v3 = a3;
  -[PXAudioSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->_isPlaybackDesired != v3)
  {
    self->_isPlaybackDesired = v3;
    -[PXAVPlayerAudioSession _invalidatePlayerRate](self, "_invalidatePlayerRate");
  }
}

- (void)_handleAVAsset:(id)a3 audioMix:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _BYTE v22[24];
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B300]), "initWithAsset:", v8);
    objc_msgSend(v12, "setAudioMix:", v9);
    PLAudioPlaybackGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[PXAudioSession asset](self, "asset");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ProgramLoudnessLKFS"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PeakdBFS"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v14;
      v29 = 2114;
      v30 = v15;
      v31 = 2114;
      v32 = v16;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "Applying content loudness for %{public}@:\n\tLoudness: %{public}@\n\tPeak: %{public}@", buf, 0x20u);

    }
    v17 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __55__PXAVPlayerAudioSession__handleAVAsset_audioMix_info___block_invoke_47;
    v23[3] = &unk_1E5143D28;
    v24 = v11;
    -[PXAVPlayerAudioSession performInternalChanges:](self, "performInternalChanges:", v23);
    -[PXAVPlayerAudioSession _loadDurationFromAsset:](self, "_loadDurationFromAsset:", v8);
    objc_initWeak((id *)buf, self);
    -[PXAudioSession startTime](self, "startTime");
    v19[0] = v17;
    v19[1] = 3221225472;
    v19[2] = __55__PXAVPlayerAudioSession__handleAVAsset_audioMix_info___block_invoke_2;
    v19[3] = &unk_1E5147388;
    objc_copyWeak(&v21, (id *)buf);
    v18 = v12;
    v20 = v18;
    objc_msgSend(v18, "seekToTime:completionHandler:", v22, v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __55__PXAVPlayerAudioSession__handleAVAsset_audioMix_info___block_invoke;
    v25[3] = &unk_1E5143CF0;
    v25[4] = self;
    v26 = v10;
    -[PXAVPlayerAudioSession performInternalChanges:](self, "performInternalChanges:", v25);

  }
}

- (void)_loadDurationFromAsset:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  NSStringFromSelector(sel_duration);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v6 = objc_msgSend(v4, "statusOfValueForKey:error:", v5, &v16);
  v7 = v16;

  if (v6 == 3)
  {
    PLAudioPlaybackGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v4;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Failed to load duration from %@. Error: %@", buf, 0x16u);
    }

  }
  else if (v6 == 2)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __49__PXAVPlayerAudioSession__loadDurationFromAsset___block_invoke;
    v14[3] = &unk_1E5143D28;
    v15 = v4;
    -[PXAVPlayerAudioSession performInternalChanges:](self, "performInternalChanges:", v14);

  }
  else
  {
    objc_initWeak((id *)buf, self);
    NSStringFromSelector(sel_duration);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49__PXAVPlayerAudioSession__loadDurationFromAsset___block_invoke_51;
    v11[3] = &unk_1E5147280;
    objc_copyWeak(&v13, (id *)buf);
    v12 = v4;
    objc_msgSend(v12, "loadValuesAsynchronouslyForKeys:completionHandler:", v10, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }

}

- (void)_handlePlayerItemFinishedSeekingForPlayback:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__PXAVPlayerAudioSession__handlePlayerItemFinishedSeekingForPlayback___block_invoke;
  v6[3] = &unk_1E5143D50;
  v7 = v4;
  v5 = v4;
  -[PXAVPlayerAudioSession _performPlayerTransaction:](self, "_performPlayerTransaction:", v6);
  -[PXAVPlayerAudioSession performInternalChanges:](self, "performInternalChanges:", &__block_literal_global_52_274331);

}

- (PXUpdater)updater
{
  return self->_updater;
}

- (BOOL)isPreparingToPlay
{
  return self->_isPreparingToPlay;
}

- (BOOL)isPlaybackDesired
{
  return self->_isPlaybackDesired;
}

- (float)playerRate
{
  return self->_playerRate;
}

- (BOOL)playerTimeHasChangedSinceSeeking
{
  return self->_playerTimeHasChangedSinceSeeking;
}

- (void)setPlayerTimeHasChangedSinceSeeking:(BOOL)a3
{
  self->_playerTimeHasChangedSinceSeeking = a3;
}

- (id)playerTimeObserver
{
  return self->_playerTimeObserver;
}

- (void)setPlayerTimeObserver:(id)a3
{
  objc_storeStrong(&self->_playerTimeObserver, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playerTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[11];
  return self;
}

- (void)setPlayerTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_playerTime.value = *(_OWORD *)&a3->var0;
  self->_playerTime.epoch = var3;
}

- (OS_dispatch_queue)playerQueue
{
  return self->_playerQueue;
}

- (AVQueuePlayer)playerQueue_player
{
  return self->_playerQueue_player;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerQueue_player, 0);
  objc_storeStrong((id *)&self->_playerQueue, 0);
  objc_storeStrong(&self->_playerTimeObserver, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

uint64_t __70__PXAVPlayerAudioSession__handlePlayerItemFinishedSeekingForPlayback___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "replaceCurrentItemWithPlayerItem:", *(_QWORD *)(a1 + 32));
}

void __70__PXAVPlayerAudioSession__handlePlayerItemFinishedSeekingForPlayback___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setIsReadyToPlay:", 1);
  objc_msgSend(v2, "setIsPreparingToPlay:", 0);

}

void __49__PXAVPlayerAudioSession__loadDurationFromAsset___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v4, "duration");
  }
  else
  {
    v7 = 0uLL;
    v8 = 0;
  }
  v5 = v7;
  v6 = v8;
  objc_msgSend(v3, "setDuration:", &v5);

}

void __49__PXAVPlayerAudioSession__loadDurationFromAsset___block_invoke_51(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_loadDurationFromAsset:", *(_QWORD *)(a1 + 32));

}

void __55__PXAVPlayerAudioSession__handleAVAsset_audioMix_info___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setStatus:", 4);
  v10 = *MEMORY[0x1E0CB2938];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ failed to fetch media for this song."), *(_QWORD *)(a1 + 32), v10);
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Error"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB3388]);
    v8 = objc_msgSend(v7, "copy");

    v5 = (void *)v8;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "px_audioSessionErrorWithCode:userInfo:", 1, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setError:", v9);

}

void __55__PXAVPlayerAudioSession__handleAVAsset_audioMix_info___block_invoke_47(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PeakdBFS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentPeakDecibels:", v5);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ProgramLoudnessLKFS"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentLoudnessInLKFS:", v6);

}

void __55__PXAVPlayerAudioSession__handleAVAsset_audioMix_info___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handlePlayerItemFinishedSeekingForPlayback:", *(_QWORD *)(a1 + 32));

}

uint64_t __48__PXAVPlayerAudioSession__prepareToPlayIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsPreparingToPlay:", 1);
}

void __48__PXAVPlayerAudioSession__prepareToPlayIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_handleAVAsset:audioMix:info:", v9, v8, v7);

}

void __52__PXAVPlayerAudioSession__performPlayerTransaction___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_playerQueue_performPlayerTransaction:", *(_QWORD *)(a1 + 32));

}

uint64_t __40__PXAVPlayerAudioSession_setPlayerRate___block_invoke(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return objc_msgSend(a2, "setRate:", a3);
}

uint64_t __43__PXAVPlayerAudioSession__updatePlayerRate__block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "setPlayerRate:", a2);
}

void __45__PXAVPlayerAudioSession__updatePlayerVolume__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "desiredPlayerVolume");
  objc_msgSend(v3, "setVolume:");

}

uint64_t __39__PXAVPlayerAudioSession__updateStatus__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStatus:", *(_QWORD *)(a1 + 32));
}

void __73__PXAVPlayerAudioSession_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  __int128 v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__PXAVPlayerAudioSession_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
  v8[3] = &unk_1E5144558;
  v9 = v3;
  v10 = v4;
  v6 = *(_OWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 56);
  v5 = v3;
  objc_msgSend(v10, "seekToTime:completionHandler:", &v6, v8);

}

uint64_t __73__PXAVPlayerAudioSession_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertItem:afterItem:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __49__PXAVPlayerAudioSession_performInternalChanges___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __39__PXAVPlayerAudioSession_playFromTime___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  __int128 v3;
  uint64_t v4;

  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v2 = a2;
  objc_msgSend(v2, "seekToTime:", &v3);
  objc_msgSend(v2, "play", v3, v4);

}

uint64_t __30__PXAVPlayerAudioSession_play__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsPlaybackDesired:", 1);
}

uint64_t __31__PXAVPlayerAudioSession_pause__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsPlaybackDesired:", 0);
}

uint64_t __31__PXAVPlayerAudioSession_pause__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pause");
}

uint64_t __45__PXAVPlayerAudioSession_performFinalCleanup__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeTimeObserver:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240));
}

uint64_t __84__PXAVPlayerAudioSession_initWithAsset_volume_startTime_queue_audioSessionDelegate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAudioSession:", *(_QWORD *)(a1 + 32));
}

void __84__PXAVPlayerAudioSession_initWithAsset_volume_startTime_queue_audioSessionDelegate___block_invoke_2(uint64_t a1, __int128 *a2)
{
  id WeakRetained;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = *a2;
  v5 = *((_QWORD *)a2 + 2);
  objc_msgSend(WeakRetained, "_handlePlayerTime:", &v4);

}

+ (OpaqueCMClock)sourceClock
{
  if (sourceClock_onceToken != -1)
    dispatch_once(&sourceClock_onceToken, &__block_literal_global_274382);
  return (OpaqueCMClock *)sourceClock_clock;
}

+ (id)_audioSession
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PXAVPlayerAudioSession__audioSession__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_audioSession_onceToken != -1)
    dispatch_once(&_audioSession_onceToken, block);
  return (id)_audioSession_session;
}

void __39__PXAVPlayerAudioSession__audioSession__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  char v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C89AE8], "auxiliarySession");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_audioSession_session;
  _audioSession_session = v2;

  v4 = *MEMORY[0x1E0C89690];
  v9 = 0;
  v5 = objc_msgSend((id)_audioSession_session, "setCategory:withOptions:error:", v4, 1, &v9);
  v6 = v9;
  if ((v5 & 1) == 0)
  {
    PLStoryGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Failed to initialize shared audio session category for %@. Error: %@", buf, 0x16u);
    }

  }
}

uint64_t __37__PXAVPlayerAudioSession_sourceClock__block_invoke()
{
  return CMAudioClockCreate(0, (CMClockRef *)&sourceClock_clock);
}

@end
