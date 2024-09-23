@implementation PXAppleMusicAudioSession

- (PXAppleMusicAudioSession)initWithAsset:(id)a3 volume:(float)a4 startTime:(id *)a5 queue:(id)a6 audioSessionDelegate:(id)a7
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  v8 = *a5;
  return -[PXAppleMusicAudioSession initWithAsset:volume:startTime:queue:audioSessionDelegate:playerController:](self, "initWithAsset:volume:startTime:queue:audioSessionDelegate:playerController:", a3, &v8, a6, a7, 0);
}

- (PXAppleMusicAudioSession)initWithAsset:(id)a3 volume:(float)a4 startTime:(id *)a5 queue:(id)a6 audioSessionDelegate:(id)a7 playerController:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  PXAppleMusicAudioSession *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  OS_dispatch_queue *stateQueue;
  id v26;
  objc_class *v27;
  void *v28;
  uint64_t v29;
  NSString *playerClientIdentifier;
  void *v31;
  id *p_playerController;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSString *v37;
  NSObject *v38;
  void *v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  __int128 v46;
  int64_t var3;
  float v48;
  objc_super v49;
  $3CC8671D27C23BF42ADDB32F2B5E48AE buf;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v49.receiver = self;
  v49.super_class = (Class)PXAppleMusicAudioSession;
  buf = *a5;
  v19 = -[PXAudioSession initWithAsset:volume:startTime:queue:audioSessionDelegate:](&v49, sel_initWithAsset_volume_startTime_queue_audioSessionDelegate_, v15, &buf, v16, v17, COERCE_DOUBLE(__PAIR64__(HIDWORD(buf.var0), LODWORD(a4))));
  if (v19)
  {
    PLAudioPlaybackGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.var0) = 138412546;
      *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v22;
      LOWORD(buf.var2) = 2112;
      *(_QWORD *)((char *)&buf.var2 + 2) = v15;
      _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEFAULT, "Creating %@ instance to play asset %@.", (uint8_t *)&buf, 0x16u);

    }
    if (objc_msgSend(v15, "catalog") != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, v19, CFSTR("PXAppleMusicAudioSession.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset.catalog == PXAudioAssetCatalogAppleMusic"));

    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    px_dispatch_queue_create();
    v24 = objc_claimAutoreleasedReturnValue();
    stateQueue = v19->_stateQueue;
    v19->_stateQueue = (OS_dispatch_queue *)v24;

    -[PXAppleMusicAudioSession _updateContentLoudness](v19, "_updateContentLoudness");
    v26 = objc_alloc(MEMORY[0x1E0CB3940]);
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v26, "initWithFormat:", CFSTR("%@-%p-%@"), v28, v19, v15);
    playerClientIdentifier = v19->_playerClientIdentifier;
    v19->_playerClientIdentifier = (NSString *)v29;

    v31 = v18;
    if (!v18)
    {
      PXDefaultAppleMusicPlayerController();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    p_playerController = (id *)&v19->_playerController;
    objc_storeStrong((id *)&v19->_playerController, v31);
    if (!v18)

    objc_msgSend(v17, "windowSceneID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_playerController, "setWindowSceneID:", v33);

    objc_msgSend(*p_playerController, "setCurrentClientIdentifier:", v19->_playerClientIdentifier);
    objc_msgSend(*p_playerController, "observable");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "registerChangeObserver:context:", v19, PlayerControllerContext);

    objc_msgSend(v15, "identifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_initWeak((id *)&buf, v19);
      v36 = *p_playerController;
      v37 = v19->_playerClientIdentifier;
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __103__PXAppleMusicAudioSession_initWithAsset_volume_startTime_queue_audioSessionDelegate_playerController___block_invoke;
      v43[3] = &unk_1E5126DF8;
      v44 = v35;
      v46 = *(_OWORD *)&a5->var0;
      var3 = a5->var3;
      v48 = a4;
      objc_copyWeak(&v45, (id *)&buf);
      objc_msgSend(v36, "clientIdentifier:performAsyncPlayerTransaction:", v37, v43);
      objc_destroyWeak(&v45);

      objc_destroyWeak((id *)&buf);
    }
    else
    {
      PLAudioPlaybackGetLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.var0) = 138412290;
        *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v15;
        _os_log_impl(&dword_1A6789000, v38, OS_LOG_TYPE_ERROR, "Unable to play asset %@ because it does not have a store ID", (uint8_t *)&buf, 0xCu);
      }

      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __103__PXAppleMusicAudioSession_initWithAsset_volume_startTime_queue_audioSessionDelegate_playerController___block_invoke_10;
      v41[3] = &unk_1E5126E20;
      v42 = v15;
      -[PXAudioSession performInternalChanges:](v19, "performInternalChanges:", v41);

    }
    -[PXAppleMusicAudioSession _updatePlayerVolume](v19, "_updatePlayerVolume");

  }
  return v19;
}

- (void)desiredPlayerVolumeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAppleMusicAudioSession;
  -[PXAudioSession desiredPlayerVolumeDidChange](&v3, sel_desiredPlayerVolumeDidChange);
  -[PXAppleMusicAudioSession _updatePlayerVolume](self, "_updatePlayerVolume");
}

- (void)prepareToPlay
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[PXAppleMusicAudioSession stateQueue](self, "stateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__PXAppleMusicAudioSession_prepareToPlay__block_invoke;
  v4[3] = &unk_1E5148D30;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)pause
{
  NSObject *v3;
  _QWORD block[5];

  -[PXAppleMusicAudioSession stateQueue](self, "stateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PXAppleMusicAudioSession_pause__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)play
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[PXAppleMusicAudioSession stateQueue](self, "stateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__PXAppleMusicAudioSession_play__block_invoke;
  v4[3] = &unk_1E5148D30;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)playFromTime:(id *)a3
{
  NSObject *v5;
  _QWORD block[4];
  id v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;
  id location;

  objc_initWeak(&location, self);
  -[PXAppleMusicAudioSession stateQueue](self, "stateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PXAppleMusicAudioSession_playFromTime___block_invoke;
  block[3] = &unk_1E5142558;
  objc_copyWeak(&v7, &location);
  v8 = *a3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_stateQueue_playFromTime:(id *)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  -[PXAppleMusicAudioSession playerController](self, "playerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAppleMusicAudioSession playerClientIdentifier](self, "playerClientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__PXAppleMusicAudioSession__stateQueue_playFromTime___block_invoke;
  v7[3] = &unk_1E5126E48;
  v7[4] = self;
  v8 = *a3;
  objc_msgSend(v5, "clientIdentifier:performAsyncPlayerTransaction:", v6, v7);

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v6;
  __int128 v7;
  int64_t v8;
  __int128 v9;
  int64_t v10;
  __int128 v11;
  int64_t v12;

  v11 = *MEMORY[0x1E0CA2E18];
  v12 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  result = -[PXAudioSession status](self, "status");
  if (result != ($3CC8671D27C23BF42ADDB32F2B5E48AE *)4)
  {
    if (self->_stateQueue_hasSeekedOrPlayed)
    {
      -[PXAppleMusicAudioSession playerController](self, "playerController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fetchCurrentTime");
      v11 = v7;
      v12 = v8;

    }
    else
    {
      result = -[PXAudioSession startTime](self, "startTime");
      v11 = v9;
      v12 = v10;
    }
  }
  *(_OWORD *)&retstr->var0 = v11;
  retstr->var3 = v12;
  return result;
}

- (void)errorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAppleMusicAudioSession;
  -[PXAudioSession errorDidChange](&v3, sel_errorDidChange);
  -[PXAppleMusicAudioSession _updateStatus](self, "_updateStatus");
}

- (void)performFinalCleanup
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXAppleMusicAudioSession;
  -[PXAudioSession performFinalCleanup](&v5, sel_performFinalCleanup);
  -[PXAppleMusicAudioSession playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAppleMusicAudioSession playerClientIdentifier](self, "playerClientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientIdentifier:performAsyncPlayerTransaction:", v4, &__block_literal_global_106272);

  -[PXAppleMusicAudioSession setPlayerController:](self, "setPlayerController:", 0);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[6];

  if ((a4 & 1) != 0 && (void *)PlayerControllerContext == a5)
  {
    -[PXAppleMusicAudioSession playerController](self, "playerController", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "playbackState");

    -[PXAppleMusicAudioSession stateQueue](self, "stateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__PXAppleMusicAudioSession_observable_didChange_context___block_invoke;
    v9[3] = &unk_1E5144EB8;
    v9[4] = self;
    v9[5] = v7;
    dispatch_async(v8, v9);

  }
}

- (void)_updateContentLoudness
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PXAudioSession asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;

    if (v4)
    {
      PLAudioPlaybackGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "loudnessMainValue");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "loudnessMainPeak");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v11 = v4;
        v12 = 2114;
        v13 = v6;
        v14 = 2114;
        v15 = v7;
        _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Applying content loudness for %{public}@:\n\tLoudness: %{public}@\n\tPeak: %{public}@", buf, 0x20u);

      }
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __50__PXAppleMusicAudioSession__updateContentLoudness__block_invoke;
      v8[3] = &unk_1E5126E20;
      v4 = v4;
      v9 = v4;
      -[PXAudioSession performInternalChanges:](self, "performInternalChanges:", v8);

    }
  }
  else
  {

    v4 = 0;
  }

}

- (void)_updatePlayerVolume
{
  int v3;
  int v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  int v8;

  -[PXAudioSession desiredPlayerVolume](self, "desiredPlayerVolume");
  v4 = v3;
  -[PXAppleMusicAudioSession playerController](self, "playerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAppleMusicAudioSession playerClientIdentifier](self, "playerClientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__PXAppleMusicAudioSession__updatePlayerVolume__block_invoke;
  v7[3] = &__block_descriptor_36_e62_v28__0___PXMutableAppleMusicPlayerController__8B16__NSError_20l;
  v8 = v4;
  objc_msgSend(v5, "clientIdentifier:performAsyncPlayerTransaction:", v6, v7);

}

- (void)_ensureCurrentPlayerClient
{
  void *v3;
  id v4;

  -[PXAppleMusicAudioSession playerClientIdentifier](self, "playerClientIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXAppleMusicAudioSession playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentClientIdentifier:", v4);

}

- (void)setPlayerController:(id)a3
{
  PXAppleMusicPlayerController *v5;
  PXAppleMusicPlayerController **p_playerController;
  PXAppleMusicPlayerController *playerController;
  void *v8;
  void *v9;
  void *v10;
  PXAppleMusicPlayerController *v11;

  v5 = (PXAppleMusicPlayerController *)a3;
  p_playerController = &self->_playerController;
  playerController = self->_playerController;
  if (playerController != v5)
  {
    v11 = v5;
    -[PXAppleMusicPlayerController observable](playerController, "observable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unregisterChangeObserver:context:", self, PlayerControllerContext);

    objc_storeStrong((id *)&self->_playerController, a3);
    -[PXAppleMusicAudioSession playerClientIdentifier](self, "playerClientIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAppleMusicPlayerController setCurrentClientIdentifier:](*p_playerController, "setCurrentClientIdentifier:", v9);

    -[PXAppleMusicPlayerController observable](*p_playerController, "observable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerChangeObserver:context:", self, PlayerControllerContext);

    -[PXAppleMusicAudioSession _updatePlayerVolume](self, "_updatePlayerVolume");
    v5 = v11;
  }

}

- (void)_stateQueue_play
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, char, void *);
  void *v15;
  id v16;
  int v17;
  uint8_t buf[4];
  PXAppleMusicAudioSession *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = -[PXAppleMusicAudioSession stateQueue_isPreparingToPlay](self, "stateQueue_isPreparingToPlay");
  PLAudioPlaybackGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      -[PXAudioSession asset](self, "asset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = self;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "%@ will begin playback of %@ when preparation finishes.", buf, 0x16u);

    }
    -[PXAppleMusicAudioSession setStateQueue_shouldPlayWhenPrepared:](self, "setStateQueue_shouldPlayWhenPrepared:", 1);
  }
  else
  {
    if (v5)
    {
      -[PXAudioSession asset](self, "asset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = self;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "%@ will begin playback of %@.", buf, 0x16u);

    }
    -[PXAudioSession desiredPlayerVolume](self, "desiredPlayerVolume");
    v9 = v8;
    objc_initWeak((id *)buf, self);
    -[PXAppleMusicAudioSession playerController](self, "playerController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAppleMusicAudioSession playerClientIdentifier](self, "playerClientIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __44__PXAppleMusicAudioSession__stateQueue_play__block_invoke;
    v15 = &unk_1E5126ED0;
    v17 = v9;
    objc_copyWeak(&v16, (id *)buf);
    objc_msgSend(v10, "clientIdentifier:becomeCurrentClientIfNeeded:performAsyncPlayerTransaction:", v11, 1, &v12);

    -[PXAppleMusicAudioSession setStateQueue_hasSeekedOrPlayed:](self, "setStateQueue_hasSeekedOrPlayed:", 1, v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_stateQueue_pause
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  PXAppleMusicAudioSession *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[PXAppleMusicAudioSession stateQueue_isPreparingToPlay](self, "stateQueue_isPreparingToPlay");
  PLAudioPlaybackGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      -[PXAudioSession asset](self, "asset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = self;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "%@ cancelling playback of %@ when preparation finishes.", (uint8_t *)&v10, 0x16u);

    }
    -[PXAppleMusicAudioSession setStateQueue_shouldPlayWhenPrepared:](self, "setStateQueue_shouldPlayWhenPrepared:", 0);
  }
  else
  {
    if (v5)
    {
      -[PXAudioSession asset](self, "asset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = self;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "%@ will pause playback of %@.", (uint8_t *)&v10, 0x16u);

    }
    -[PXAppleMusicAudioSession playerController](self, "playerController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAppleMusicAudioSession playerClientIdentifier](self, "playerClientIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientIdentifier:performAsyncPlayerTransaction:", v9, &__block_literal_global_24_106264);

  }
}

- (void)_stateQueue_prepareToPlayIfNeeded
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;
  uint8_t buf[4];
  PXAppleMusicAudioSession *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!-[PXAppleMusicAudioSession stateQueue_isPreparingToPlay](self, "stateQueue_isPreparingToPlay"))
  {
    PLAudioPlaybackGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[PXAudioSession asset](self, "asset");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = self;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "%@ will begin preparing to play %@.", buf, 0x16u);

    }
    objc_initWeak(&location, self);
    -[PXAppleMusicAudioSession setStateQueue_isPreparingToPlay:](self, "setStateQueue_isPreparingToPlay:", 1);
    -[PXAppleMusicAudioSession log](self, "log");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        v8 = -[PXAppleMusicAudioSession logContext](self, "logContext");
        *(_DWORD *)buf = 134217984;
        v15 = (PXAppleMusicAudioSession *)v8;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "StoryAppleMusicSessionPrepareToPlay", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
      }
    }

    -[PXAppleMusicAudioSession playerController](self, "playerController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAppleMusicAudioSession playerClientIdentifier](self, "playerClientIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__PXAppleMusicAudioSession__stateQueue_prepareToPlayIfNeeded__block_invoke;
    v11[3] = &unk_1E5126F18;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v9, "clientIdentifier:performAsyncPlayerTransaction:", v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)setStateQueue_isPreparingToPlay:(BOOL)a3
{
  if (self->_stateQueue_isPreparingToPlay != a3)
  {
    self->_stateQueue_isPreparingToPlay = a3;
    -[PXAppleMusicAudioSession _updateStatus](self, "_updateStatus");
  }
}

- (void)_handlePlayerPreparedToPlay:(BOOL)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  -[PXAppleMusicAudioSession stateQueue](self, "stateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__PXAppleMusicAudioSession__handlePlayerPreparedToPlay_error___block_invoke;
  v9[3] = &unk_1E5144F48;
  objc_copyWeak(&v11, &location);
  v12 = a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_stateQueue_handlePlayerPreparedToPlay:(BOOL)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  _BOOL8 v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  char v27;
  uint8_t buf[4];
  PXAppleMusicAudioSession *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PXAppleMusicAudioSession log](self, "log");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, self);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_DWORD *)buf = 134217984;
      v29 = (PXAppleMusicAudioSession *)-[PXAppleMusicAudioSession logContext](self, "logContext");
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_END, v9, "StoryAppleMusicSessionPrepareToPlay", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
    }
  }

  -[PXAppleMusicAudioSession setStateQueue_isPreparingToPlay:](self, "setStateQueue_isPreparingToPlay:", 0);
  v10 = -[PXAppleMusicAudioSession stateQueue_shouldPlayWhenPrepared](self, "stateQueue_shouldPlayWhenPrepared");
  if (objc_msgSend(v6, "px_isDomain:code:", CFSTR("PXAppleMusicPlayerControllerErrorDomain"), 2))
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = CFSTR("Apple Music player timed out while preparing to play.");
    v13 = 5;
    goto LABEL_17;
  }
  if (!a3)
  {
    v18 = objc_msgSend(v6, "px_isDomain:code:", CFSTR("PXAppleMusicPlayerControllerErrorDomain"), 3);
    PLAudioPlaybackGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if ((v18 & 1) != 0)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v29 = self;
        v30 = 2112;
        v31 = v6;
        _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEFAULT, "%@ player was cancelled while preparing to play: %@", buf, 0x16u);
      }

      v16 = 0;
      goto LABEL_18;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v29 = self;
      v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "%@ player encountered error while preparing to play: %@", buf, 0x16u);
    }

    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = CFSTR("Apple Music encountered an error while preparing to play");
    v13 = 1;
LABEL_17:
    objc_msgSend(v11, "px_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("PXAudioSessionErrorDomain"), v13, v6, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
    v17 = 0;
    goto LABEL_19;
  }
  PLAudioPlaybackGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v29 = self;
    v30 = 2112;
    v31 = v15;
    _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEBUG, "%@ player finished preparing to play. Will begin playback: %@", buf, 0x16u);

  }
  v16 = 0;
  v17 = 1;
LABEL_19:
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __73__PXAppleMusicAudioSession__stateQueue_handlePlayerPreparedToPlay_error___block_invoke;
  v25 = &unk_1E5126F40;
  v27 = v17;
  v21 = v16;
  v26 = v21;
  -[PXAudioSession performInternalChanges:](self, "performInternalChanges:", &v22);
  if (v10 & v17)
    -[PXAppleMusicAudioSession _stateQueue_play](self, "_stateQueue_play", v22, v23, v24, v25);

}

- (void)_updateStatus
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[PXAudioSession error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXAudioSession performInternalChanges:](self, "performInternalChanges:", &__block_literal_global_31_106246);
  }
  else
  {
    objc_initWeak(&location, self);
    -[PXAppleMusicAudioSession stateQueue](self, "stateQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __41__PXAppleMusicAudioSession__updateStatus__block_invoke_2;
    v5[3] = &unk_1E5148D30;
    objc_copyWeak(&v6, &location);
    dispatch_async(v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)setStateQueue_playerPlaybackState:(int64_t)a3
{
  if (self->_stateQueue_playerPlaybackState != a3)
  {
    self->_stateQueue_playerPlaybackState = a3;
    -[PXAppleMusicAudioSession _stateQueue_updateState](self, "_stateQueue_updateState");
  }
}

- (void)_stateQueue_updateState
{
  uint64_t v3;
  _QWORD block[4];
  id v5[2];
  id location;

  if (-[PXAppleMusicAudioSession stateQueue_playerPlaybackState](self, "stateQueue_playerPlaybackState") == 2)
  {
    v3 = 3;
  }
  else if (-[PXAppleMusicAudioSession stateQueue_isPreparingToPlay](self, "stateQueue_isPreparingToPlay"))
  {
    v3 = 1;
  }
  else
  {
    v3 = 2;
  }
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PXAppleMusicAudioSession__stateQueue_updateState__block_invoke;
  block[3] = &unk_1E51447A0;
  objc_copyWeak(v5, &location);
  v5[1] = (id)v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

- (void)_handlePlayerTransactionDeclinedWithError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__PXAppleMusicAudioSession__handlePlayerTransactionDeclinedWithError___block_invoke;
  v6[3] = &unk_1E5126E20;
  v7 = v4;
  v5 = v4;
  -[PXAudioSession performInternalChanges:](self, "performInternalChanges:", v6);

}

- (NSString)playerClientIdentifier
{
  return self->_playerClientIdentifier;
}

- (PXAppleMusicPlayerController)playerController
{
  return self->_playerController;
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (BOOL)stateQueue_isPreparingToPlay
{
  return self->_stateQueue_isPreparingToPlay;
}

- (BOOL)stateQueue_hasSeekedOrPlayed
{
  return self->_stateQueue_hasSeekedOrPlayed;
}

- (void)setStateQueue_hasSeekedOrPlayed:(BOOL)a3
{
  self->_stateQueue_hasSeekedOrPlayed = a3;
}

- (BOOL)stateQueue_shouldPlayWhenPrepared
{
  return self->_stateQueue_shouldPlayWhenPrepared;
}

- (void)setStateQueue_shouldPlayWhenPrepared:(BOOL)a3
{
  self->_stateQueue_shouldPlayWhenPrepared = a3;
}

- (int64_t)stateQueue_playerPlaybackState
{
  return self->_stateQueue_playerPlaybackState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_playerClientIdentifier, 0);
}

uint64_t __70__PXAppleMusicAudioSession__handlePlayerTransactionDeclinedWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setError:", *(_QWORD *)(a1 + 32));
}

void __51__PXAppleMusicAudioSession__stateQueue_updateState__block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__PXAppleMusicAudioSession__stateQueue_updateState__block_invoke_2;
  v3[3] = &__block_descriptor_40_e41_v16__0___PXInternalMutableAudioSession__8l;
  v3[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(WeakRetained, "performInternalChanges:", v3);

}

void __51__PXAppleMusicAudioSession__stateQueue_updateState__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = 4;
  else
    v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "setStatus:", v4);

}

void __41__PXAppleMusicAudioSession__updateStatus__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_stateQueue_updateState");

}

uint64_t __41__PXAppleMusicAudioSession__updateStatus__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStatus:", 4);
}

void __73__PXAppleMusicAudioSession__stateQueue_handlePlayerPreparedToPlay_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setIsReadyToPlay:", v3);
  objc_msgSend(v4, "setError:", *(_QWORD *)(a1 + 32));

}

void __62__PXAppleMusicAudioSession__handlePlayerPreparedToPlay_error___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_stateQueue_handlePlayerPreparedToPlay:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

void __61__PXAppleMusicAudioSession__stateQueue_prepareToPlayIfNeeded__block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  _QWORD v10[4];
  id v11;

  v7 = a2;
  v8 = a4;
  if (a3)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__PXAppleMusicAudioSession__stateQueue_prepareToPlayIfNeeded__block_invoke_2;
    v10[3] = &unk_1E5144F70;
    objc_copyWeak(&v11, (id *)(a1 + 32));
    objc_msgSend(v7, "prepareToPlayWithCompletionHandler:", v10);
    objc_destroyWeak(&v11);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_handlePlayerPreparedToPlay:error:", 0, v8);

  }
}

void __61__PXAppleMusicAudioSession__stateQueue_prepareToPlayIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handlePlayerPreparedToPlay:error:", a2, v5);

}

uint64_t __45__PXAppleMusicAudioSession__stateQueue_pause__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pause");
}

void __44__PXAppleMusicAudioSession__stateQueue_play__block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  double v7;
  id v8;
  id WeakRetained;
  id v10;

  v10 = a4;
  v7 = *(float *)(a1 + 40);
  v8 = a2;
  objc_msgSend(v8, "setVolume:", v7);
  objc_msgSend(v8, "play");

  if ((a3 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_handlePlayerTransactionDeclinedWithError:", v10);

  }
}

uint64_t __47__PXAppleMusicAudioSession__updatePlayerVolume__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setVolume:", *(float *)(a1 + 32));
}

void __50__PXAppleMusicAudioSession__updateContentLoudness__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "loudnessMainPeak");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentPeakDecibels:", v5);

  objc_msgSend(*(id *)(a1 + 32), "loudnessMainValue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentLoudnessInLKFS:", v6);

}

uint64_t __57__PXAppleMusicAudioSession_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStateQueue_playerPlaybackState:", *(_QWORD *)(a1 + 40));
}

uint64_t __47__PXAppleMusicAudioSession_performFinalCleanup__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pause");
}

void __53__PXAppleMusicAudioSession__stateQueue_playFromTime___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v4, "setItemWithStoreID:startTime:", v6, &v7);

  objc_msgSend(v4, "play");
}

void __41__PXAppleMusicAudioSession_playFromTime___block_invoke(uint64_t a1)
{
  id WeakRetained;
  __int128 v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = *(_OWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  objc_msgSend(WeakRetained, "_stateQueue_playFromTime:", &v3);

}

void __32__PXAppleMusicAudioSession_play__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_stateQueue_play");

}

uint64_t __33__PXAppleMusicAudioSession_pause__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stateQueue_pause");
}

void __41__PXAppleMusicAudioSession_prepareToPlay__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_stateQueue_prepareToPlayIfNeeded");

}

void __103__PXAppleMusicAudioSession_initWithAsset_volume_startTime_queue_audioSessionDelegate_playerController___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id WeakRetained;
  __int128 v11;
  uint64_t v12;

  v7 = a2;
  v8 = a4;
  if (a3)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v11 = *(_OWORD *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v7, "setItemWithStoreID:startTime:", v9, &v11);
    objc_msgSend(v7, "setVolume:", *(float *)(a1 + 72));
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_handlePlayerTransactionDeclinedWithError:", v8);

  }
}

void __103__PXAppleMusicAudioSession_initWithAsset_volume_startTime_queue_audioSessionDelegate_playerController___block_invoke_10(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("Unable to play asset %@ because it does not have a store ID"), *(_QWORD *)(a1 + 32));
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2938];
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "px_audioSessionErrorWithCode:userInfo:", 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setError:", v8);

}

@end
