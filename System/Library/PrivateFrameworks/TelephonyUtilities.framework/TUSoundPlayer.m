@implementation TUSoundPlayer

- (TUSoundPlayer)init
{
  TUSoundPlayer *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  TURepeatingActor *v6;
  TURepeatingActor *repeatingActor;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TUSoundPlayer;
  v2 = -[TUSoundPlayer init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.telephonyutilities.tusoundplayer", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(TURepeatingActor);
    repeatingActor = v2->_repeatingActor;
    v2->_repeatingActor = v6;

  }
  return v2;
}

- (unsigned)soundID
{
  NSObject *v3;

  -[TUSoundPlayer queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_soundID;
}

- (void)setSoundID:(unsigned int)a3
{
  NSObject *v5;

  -[TUSoundPlayer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  self->_soundID = a3;
}

- (BOOL)isCurrentPlaying
{
  NSObject *v3;

  -[TUSoundPlayer queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_currentPlaying;
}

- (void)setIsCurrentPlaying:(BOOL)a3
{
  NSObject *v5;

  -[TUSoundPlayer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  self->_currentPlaying = a3;
}

- (void)playSound:(unsigned int)a3
{
  -[TUSoundPlayer playSound:iterations:pauseDurationBetweenIterations:](self, "playSound:iterations:pauseDurationBetweenIterations:", *(_QWORD *)&a3, 1, 0.0);
}

- (void)playSoundIndefinitely:(unsigned int)a3 pauseDurationBetweenIterations:(double)a4
{
  -[TUSoundPlayer playSound:iterations:pauseDurationBetweenIterations:](self, "playSound:iterations:pauseDurationBetweenIterations:", *(_QWORD *)&a3, -1, a4);
}

- (void)playSound:(unsigned int)a3 iterations:(unint64_t)a4 pauseDurationBetweenIterations:(double)a5
{
  -[TUSoundPlayer playSound:iterations:pauseDurationBetweenIterations:completion:](self, "playSound:iterations:pauseDurationBetweenIterations:completion:", *(_QWORD *)&a3, a4, 0, a5);
}

- (void)playSound:(unsigned int)a3 iterations:(unint64_t)a4 pauseDurationBetweenIterations:(double)a5 completion:(id)a6
{
  id v11;
  NSObject *v12;
  __CFString *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[8];
  _QWORD block[5];
  unsigned int v20;
  uint8_t buf[4];
  unsigned int v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  TUDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (a4 == -1)
    {
      v13 = CFSTR("Infinite");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 67109634;
    v22 = a3;
    v23 = 2112;
    v24 = v13;
    v25 = 2048;
    v26 = a5;
    _os_log_impl(&dword_19A50D000, v12, OS_LOG_TYPE_DEFAULT, "Asked to play sound with soundID: %d iterations: %@ pauseDurationBetweenIterations: %f", buf, 0x1Cu);
    if (a4 != -1)

  }
  -[TUSoundPlayer stopPlaying](self, "stopPlaying");
  -[TUSoundPlayer queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__TUSoundPlayer_playSound_iterations_pauseDurationBetweenIterations_completion___block_invoke;
  block[3] = &unk_1E38A2178;
  block[4] = self;
  v20 = a3;
  dispatch_async(v14, block);

  v18[0] = v15;
  v18[1] = 3221225472;
  v18[2] = __80__TUSoundPlayer_playSound_iterations_pauseDurationBetweenIterations_completion___block_invoke_4;
  v18[3] = &unk_1E38A21C8;
  v18[4] = self;
  v18[5] = a2;
  v18[6] = a4;
  *(double *)&v18[7] = a5;
  v16 = _Block_copy(v18);
  -[TUSoundPlayer repeatingActor](self, "repeatingActor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "beginRepeatingAction:iterations:pauseDurationBetweenIterations:completion:", v16, a4, v11, a5);

}

void __80__TUSoundPlayer_playSound_iterations_pauseDurationBetweenIterations_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setSoundID:", *(unsigned int *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setIsCurrentPlaying:", 1);
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "soundID");
    v4 = objc_msgSend(*(id *)(a1 + 32), "isCurrentPlaying");
    v5[0] = 67109376;
    v5[1] = v3;
    v6 = 1024;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Started to play current soundID: %d, isCurrentPlaying: %d", (uint8_t *)v5, 0xEu);
  }

}

void __80__TUSoundPlayer_playSound_iterations_pauseDurationBetweenIterations_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __80__TUSoundPlayer_playSound_iterations_pauseDurationBetweenIterations_completion___block_invoke_2;
  block[3] = &unk_1E38A21A0;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = v6;
  block[1] = 3221225472;
  v12 = *(_QWORD *)(a1 + 56);
  block[4] = v5;
  v9 = v3;
  v7 = v3;
  dispatch_async(v4, block);

}

void __80__TUSoundPlayer_playSound_iterations_pauseDurationBetweenIterations_completion___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  NSObject *v4;
  int v5;
  _BOOL8 v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isCurrentPlaying") & 1) != 0)
  {
    if (!TUSoundPlayerInfiniteIterations_block_invoke__kAudioServicesPlaySystemSoundOptionLoopKey)
    {
      v2 = (_QWORD *)CUTWeakLinkSymbol();
      v3 = v2 ? (void *)*v2 : 0;
      objc_storeStrong((id *)&TUSoundPlayerInfiniteIterations_block_invoke__kAudioServicesPlaySystemSoundOptionLoopKey, v3);
      if (!TUSoundPlayerInfiniteIterations_block_invoke__kAudioServicesPlaySystemSoundOptionLoopKey)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TUSoundPlayer.m"), 75, CFSTR("Failed to weak link string named %s"), "kAudioServicesPlaySystemSoundOptionLoopKey");

      }
    }
    if (TUSoundPlayerInfiniteIterations_block_invoke__pred_AudioServicesPlaySystemSoundWithOptionsAudioToolbox != -1)
      dispatch_once(&TUSoundPlayerInfiniteIterations_block_invoke__pred_AudioServicesPlaySystemSoundWithOptionsAudioToolbox, &__block_literal_global_14);
    v6 = *(_QWORD *)(a1 + 56) == -1 && *(double *)(a1 + 64) == 0.0;
    v15 = TUSoundPlayerInfiniteIterations_block_invoke__kAudioServicesPlaySystemSoundOptionLoopKey;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v4 = objc_claimAutoreleasedReturnValue();

    TUDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "soundID");
      *(_DWORD *)buf = 67109378;
      v12 = v9;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Calling AudioServicesPlaySystemSoundWithCompletion with soundID: %d options: %@", buf, 0x12u);
    }

    ((void (*)(uint64_t, NSObject *, _QWORD))TUSoundPlayerInfiniteIterations_block_invoke__AudioServicesPlaySystemSoundWithOptions)(objc_msgSend(*(id *)(a1 + 32), "soundID"), v4, *(_QWORD *)(a1 + 40));
  }
  else
  {
    TUDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "soundID");
      *(_DWORD *)buf = 67109120;
      v12 = v5;
      _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "soundID: %d is stopped, don't play", buf, 8u);
    }
  }

}

void *__80__TUSoundPlayer_playSound_iterations_pauseDurationBetweenIterations_completion___block_invoke_13()
{
  void *result;

  result = (void *)CUTWeakLinkSymbol();
  TUSoundPlayerInfiniteIterations_block_invoke__AudioServicesPlaySystemSoundWithOptions = result;
  return result;
}

- (void)stopPlaying
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[5];
  _QWORD block[5];
  uint8_t buf[16];

  v3 = -[TUSoundPlayer isRepeatingActorPlaying](self, "isRepeatingActorPlaying");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    -[TUSoundPlayer repeatingActor](self, "repeatingActor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stop");

    TUDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "TUSoundPlayer: stop playing", buf, 2u);
    }

    -[TUSoundPlayer queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __28__TUSoundPlayer_stopPlaying__block_invoke;
    block[3] = &unk_1E38A1360;
    block[4] = self;
    dispatch_async(v7, block);

  }
  -[TUSoundPlayer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __28__TUSoundPlayer_stopPlaying__block_invoke_19;
  v9[3] = &unk_1E38A1360;
  v9[4] = self;
  dispatch_async(v8, v9);

}

uint64_t __28__TUSoundPlayer_stopPlaying__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (TUSoundPlayerInfiniteIterations_block_invoke_2__pred_AudioServicesStopSystemSoundAudioToolbox != -1)
    dispatch_once(&TUSoundPlayerInfiniteIterations_block_invoke_2__pred_AudioServicesStopSystemSoundAudioToolbox, &__block_literal_global_17);
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "soundID");
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Calling AudioServicesStopSystemSound with soundID=%d", (uint8_t *)v5, 8u);
  }

  return ((uint64_t (*)(uint64_t, uint64_t))TUSoundPlayerInfiniteIterations_block_invoke_2__AudioServicesStopSystemSound)(objc_msgSend(*(id *)(a1 + 32), "soundID"), 1);
}

void *__28__TUSoundPlayer_stopPlaying__block_invoke_2()
{
  void *result;

  result = (void *)CUTWeakLinkSymbol();
  TUSoundPlayerInfiniteIterations_block_invoke_2__AudioServicesStopSystemSound = result;
  return result;
}

uint64_t __28__TUSoundPlayer_stopPlaying__block_invoke_19(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  int v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "isCurrentPlaying");
  if ((_DWORD)result)
  {
    TUDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "soundID");
      v5[0] = 67109120;
      v5[1] = v4;
      _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Stop playing current soundID: %d", (uint8_t *)v5, 8u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "setIsCurrentPlaying:", 0);
  }
  return result;
}

- (BOOL)isRepeatingActorPlaying
{
  void *v2;
  char v3;

  -[TUSoundPlayer repeatingActor](self, "repeatingActor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunning");

  return v3;
}

- (BOOL)currentPlaying
{
  return self->_currentPlaying;
}

- (void)setCurrentPlaying:(BOOL)a3
{
  self->_currentPlaying = a3;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (TURepeatingActor)repeatingActor
{
  return self->_repeatingActor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repeatingActor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
