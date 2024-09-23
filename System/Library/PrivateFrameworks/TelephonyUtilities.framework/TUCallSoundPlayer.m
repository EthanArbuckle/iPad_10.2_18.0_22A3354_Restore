@implementation TUCallSoundPlayer

- (TUCallSoundPlayer)init
{
  TUCallSoundPlayer *v2;
  TUSoundPlayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUCallSoundPlayer;
  v2 = -[TUCallSoundPlayer init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(TUSoundPlayer);
    -[TUCallSoundPlayer setPlayer:](v2, "setPlayer:", v3);

  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "TUCallSoundPlayer dealloc", buf, 2u);
  }

  -[TUCallSoundPlayer stopPlaying](self, "stopPlaying");
  v4.receiver = self;
  v4.super_class = (Class)TUCallSoundPlayer;
  -[TUCallSoundPlayer dealloc](&v4, sel_dealloc);
}

- (BOOL)attemptToPlaySoundType:(int64_t)a3 forCall:(id)a4
{
  return -[TUCallSoundPlayer attemptToPlaySoundType:forCall:completion:](self, "attemptToPlaySoundType:forCall:completion:", a3, a4, 0);
}

- (BOOL)attemptToPlaySoundType:(int64_t)a3 forCall:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  TUCallSoundPlayerDescriptor *v10;
  BOOL v11;
  NSObject *v12;
  int v14;
  int64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = -[TUCallSoundPlayerDescriptor initWithSoundType:call:]([TUCallSoundPlayerDescriptor alloc], "initWithSoundType:call:", a3, v8);
  if (v10)
  {
    v11 = -[TUCallSoundPlayer attemptToPlayDescriptor:completion:](self, "attemptToPlayDescriptor:completion:", v10, v9);
  }
  else
  {
    TUDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134218242;
      v15 = a3;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_19A50D000, v12, OS_LOG_TYPE_DEFAULT, "Not playing sound since no valid sound descriptor was returned for type=%lu call=%@", (uint8_t *)&v14, 0x16u);
    }

    v11 = 0;
  }

  return v11;
}

- (BOOL)attemptToPlayDescriptor:(id)a3
{
  return -[TUCallSoundPlayer attemptToPlayDescriptor:completion:](self, "attemptToPlayDescriptor:completion:", a3, 0);
}

- (BOOL)attemptToPlayDescriptor:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  int v13;
  dispatch_semaphore_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  dispatch_time_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  intptr_t (*v30)(uint64_t);
  void *v31;
  id v32;
  NSObject *v33;
  uint8_t buf[4];
  _DWORD v35[7];

  *(_QWORD *)&v35[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[TUCallSoundPlayer isPlaying](self, "isPlaying")
    && (v8 = objc_msgSend(v6, "soundType"),
        v8 == -[TUCallSoundPlayer currentlyPlayingSoundType](self, "currentlyPlayingSoundType")))
  {
    v9 = 0;
  }
  else
  {
    TUDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v35 = v6;
      _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "Playing %@", buf, 0xCu);
    }

    if (objc_msgSend(v6, "audioPlayingWarmupNeeded"))
    {
      v11 = (void *)CUTWeakLinkClass();
      TUDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_msgSend(v11, "hasActiveAudioSession");
        *(_DWORD *)buf = 67109378;
        v35[0] = v13;
        LOWORD(v35[1]) = 2112;
        *(_QWORD *)((char *)&v35[1] + 2) = v6;
        _os_log_impl(&dword_19A50D000, v12, OS_LOG_TYPE_DEFAULT, "[TUCallSoundPlayer] audio stack ready: %d for %@", buf, 0x12u);
      }

      if ((objc_msgSend(v11, "hasActiveAudioSession") & 1) == 0 && objc_msgSend(v6, "soundType") == 1)
      {
        v14 = dispatch_semaphore_create(0);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = MEMORY[0x1E0C809B0];
        v29 = 3221225472;
        v30 = __56__TUCallSoundPlayer_attemptToPlayDescriptor_completion___block_invoke;
        v31 = &unk_1E38A3548;
        v16 = v6;
        v32 = v16;
        v17 = v14;
        v33 = v17;
        objc_msgSend(v15, "addObserverForName:object:queue:usingBlock:", CFSTR("TUCallAudioStackReadyNotification"), 0, 0, &v28);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        TUDefaultLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v35 = v16;
          _os_log_impl(&dword_19A50D000, v19, OS_LOG_TYPE_DEFAULT, "[TUCallSoundPlayer] waiting for AVAudioClient setup to play %@", buf, 0xCu);
        }

        v20 = dispatch_time(0, 2000000000);
        dispatch_semaphore_wait(v17, v20);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v28, v29, v30, v31);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "removeObserver:", v18);

        TUDefaultLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v35 = v16;
          _os_log_impl(&dword_19A50D000, v22, OS_LOG_TYPE_DEFAULT, "[TUCallSoundPlayer] finished waiting for AVAudioClient setup to play %@", buf, 0xCu);
        }

      }
    }
    -[TUCallSoundPlayer player](self, "player");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sound");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "unsignedIntValue");
    v26 = objc_msgSend(v6, "iterations");
    objc_msgSend(v6, "pauseDuration");
    objc_msgSend(v23, "playSound:iterations:pauseDurationBetweenIterations:completion:", v25, v26, v7);

    -[TUCallSoundPlayer setCurrentlyPlayingSoundType:](self, "setCurrentlyPlayingSoundType:", objc_msgSend(v6, "soundType"));
    v9 = 1;
  }

  return v9;
}

intptr_t __56__TUCallSoundPlayer_attemptToPlayDescriptor_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "[TUCallSoundPlayer] received notification that AVAudioClient setup has completed for %@", (uint8_t *)&v5, 0xCu);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)stopPlaying
{
  void *v3;

  -[TUCallSoundPlayer player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopPlaying");

  -[TUCallSoundPlayer setCurrentlyPlayingSoundType:](self, "setCurrentlyPlayingSoundType:", 0);
}

- (BOOL)isPlaying
{
  void *v2;
  char v3;

  -[TUCallSoundPlayer player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPlaying");

  return v3;
}

- (int64_t)currentlyPlayingSoundType
{
  return self->_currentlyPlayingSoundType;
}

- (void)setCurrentlyPlayingSoundType:(int64_t)a3
{
  self->_currentlyPlayingSoundType = a3;
}

- (TUSoundPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
}

@end
