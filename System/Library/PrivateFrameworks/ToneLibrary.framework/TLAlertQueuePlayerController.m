@implementation TLAlertQueuePlayerController

- (TLAlertQueuePlayerController)init
{
  TLAlertQueuePlayerController *v2;
  uint64_t v3;
  TLAudioQueue *audioQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TLAlertQueuePlayerController;
  v2 = -[TLAlertQueuePlayerController init](&v6, sel_init);
  if (v2)
  {
    +[TLAudioQueue sharedAudioQueue](TLAudioQueue, "sharedAudioQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    audioQueue = v2->_audioQueue;
    v2->_audioQueue = (TLAudioQueue *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)dealloc
{
  TLAudioQueue *audioQueue;
  TLAudioQueue *v4;
  objc_super v5;
  _QWORD v6[5];

  os_unfair_lock_assert_not_owner(&self->_lock);
  audioQueue = self->_audioQueue;
  self->_audioQueue = 0;
  v4 = audioQueue;

  -[TLAudioQueue assertNotRunningOnAudioQueue](v4, "assertNotRunningOnAudioQueue");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__TLAlertQueuePlayerController_dealloc__block_invoke;
  v6[3] = &unk_1E952A748;
  v6[4] = self;
  -[TLAudioQueue performSynchronousTaskWithBlock:](v4, "performSynchronousTaskWithBlock:", v6);

  v5.receiver = self;
  v5.super_class = (Class)TLAlertQueuePlayerController;
  -[TLAlertQueuePlayerController dealloc](&v5, sel_dealloc);
}

void __39__TLAlertQueuePlayerController_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  os_unfair_lock_s *v3;
  id v4;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (os_unfair_lock_s *)(v2 + 16);
  v4 = *(id *)(v2 + 24);
  os_unfair_lock_unlock(v3);
  objc_msgSend(*(id *)(a1 + 32), "_destroyQueuePlayerForStateDescriptor:", v4);

}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  TLAlertQueuePlayerStateDescriptor *stateDescriptor;
  void *v8;
  TLAlertQueuePlayerStateDescriptor *v9;
  objc_class *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  stateDescriptor = self->_stateDescriptor;
  if (stateDescriptor)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = stateDescriptor;
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p>"), v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v6, "appendFormat:", CFSTR("; stateDescriptor = %@"), v12);
  objc_msgSend(v6, "appendString:", CFSTR(">"));

  return (NSString *)v6;
}

- (void)playAlert:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  TLAlertQueuePlayerStateDescriptor *v9;
  TLAlertQueuePlayerStateDescriptor *v10;
  NSObject *v11;
  TLAlertQueuePlayerStateDescriptor *stateDescriptor;
  TLAudioQueue *audioQueue;
  TLAlertQueuePlayerStateDescriptor *v14;
  _QWORD v15[5];
  TLAlertQueuePlayerStateDescriptor *v16;
  TLAlertQueuePlayerStateDescriptor *v17;
  uint8_t buf[4];
  TLAlertQueuePlayerController *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  TLAlertQueuePlayerStateDescriptor *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[TLAlertQueuePlayerStateDescriptor playingAlert](self->_stateDescriptor, "playingAlert");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    os_unfair_lock_unlock(&self->_lock);
    v14 = 0;
    v9 = 0;
  }
  else
  {
    v9 = self->_stateDescriptor;
    v10 = -[TLAlertQueuePlayerStateDescriptor initWithPlayingAlert:completionHandler:previousStateDescriptor:]([TLAlertQueuePlayerStateDescriptor alloc], "initWithPlayingAlert:completionHandler:previousStateDescriptor:", v6, v7, v9);
    objc_storeStrong((id *)&self->_stateDescriptor, v10);
    TLLogPlayback();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      stateDescriptor = self->_stateDescriptor;
      *(_DWORD *)buf = 138543874;
      v19 = self;
      v20 = 2114;
      v21 = v6;
      v22 = 2114;
      v23 = stateDescriptor;
      _os_log_impl(&dword_1D33D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: -playAlert:(%{public}@) …: Updated _stateDescriptor to %{public}@.", buf, 0x20u);
    }

    os_unfair_lock_unlock(&self->_lock);
    if (v10)
    {
      audioQueue = self->_audioQueue;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __64__TLAlertQueuePlayerController_playAlert_withCompletionHandler___block_invoke;
      v15[3] = &unk_1E952AE10;
      v15[4] = self;
      v14 = v10;
      v16 = v14;
      v9 = v9;
      v17 = v9;
      -[TLAudioQueue performTaskWithBlock:](audioQueue, "performTaskWithBlock:", v15);

    }
    else
    {
      v14 = 0;
    }
  }

}

uint64_t __64__TLAlertQueuePlayerController_playAlert_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_playAlertForStateDescriptor:previousStateDescriptor:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (BOOL)stopPlayingAlerts:(id)a3 withOptions:(id)a4 playbackCompletionType:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  TLAlertQueuePlayerStateDescriptor *v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  NSObject *p_super;
  _BOOL4 v29;
  TLAlertQueuePlayerStateDescriptor *v30;
  TLAlertQueuePlayerStateDescriptor *stateDescriptor;
  NSObject *v32;
  void *v33;
  TLAudioQueue *audioQueue;
  int64_t v36;
  void *v37;
  _QWORD v38[5];
  TLAlertQueuePlayerStateDescriptor *v39;
  id v40;
  int64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  TLAlertQueuePlayerController *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  if (a5 == 5)
  {
    TLLogGeneral();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Playback/BackEnds/QueuePlayer/TLAlertQueuePlayerController.m");
      v12 = objc_claimAutoreleasedReturnValue();
      TLLogGeneral();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject lastPathComponent](v12, "lastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136381443;
        v48 = (TLAlertQueuePlayerController *)"-[TLAlertQueuePlayerController stopPlayingAlerts:withOptions:playbackCompletionType:]";
        v49 = 2113;
        v50 = (uint64_t)v14;
        v51 = 2049;
        v52 = 235;
        v53 = 2113;
        v54 = v15;
        _os_log_impl(&dword_1D33D5000, v13, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

        a5 = 5;
      }

    }
    else
    {
      TLLogGeneral();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
    }

    TLLogGeneral();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[TLAlertQueuePlayerController stopPlayingAlerts:withOptions:playbackCompletionType:].cold.1();

  }
  TLLogPlayback();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend(v8, "count");
    NSStringFromTLAlertPlaybackCompletionType(a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v48 = self;
    v49 = 2048;
    v50 = v18;
    v51 = 2114;
    v52 = (uint64_t)v9;
    v53 = 2114;
    v54 = v19;
    _os_log_impl(&dword_1D33D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -stopPlayingAlerts:(<%lu alerts>) options:(%{public}@) playbackCompletionType:(%{public}@).", buf, 0x2Au);

  }
  v36 = a5;
  v37 = v9;

  os_unfair_lock_lock(&self->_lock);
  -[TLAlertQueuePlayerStateDescriptor playingAlert](self->_stateDescriptor, "playingAlert");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v21 = v8;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v22)
  {
    v23 = v22;
    v24 = 0;
    v25 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v43 != v25)
          objc_enumerationMutation(v21);
        v27 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        TLLogPlayback();
        p_super = objc_claimAutoreleasedReturnValue();
        v29 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
        if (v27 == v20)
        {
          if (v29)
          {
            *(_DWORD *)buf = 138543618;
            v48 = self;
            v49 = 2114;
            v50 = (uint64_t)v20;
            _os_log_impl(&dword_1D33D5000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@: -stopPlayingAlerts…: %{public}@ is playing. Interrupting it.", buf, 0x16u);
          }

          p_super = &v24->super;
          v24 = self->_stateDescriptor;
        }
        else if (v29)
        {
          *(_DWORD *)buf = 138543618;
          v48 = self;
          v49 = 2114;
          v50 = (uint64_t)v27;
          _os_log_impl(&dword_1D33D5000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@: -stopPlayingAlerts…: %{public}@ is NOT playing. Skipping it.", buf, 0x16u);
        }

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v23);
  }
  else
  {
    v24 = 0;
  }

  if (v24 == self->_stateDescriptor)
  {
    -[TLAlertQueuePlayerStateDescriptor stateDescriptorForCompletedPlayback](v24, "stateDescriptorForCompletedPlayback");
    v30 = (TLAlertQueuePlayerStateDescriptor *)objc_claimAutoreleasedReturnValue();
    stateDescriptor = self->_stateDescriptor;
    self->_stateDescriptor = v30;

    TLLogPlayback();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      -[TLAlertQueuePlayerStateDescriptor debugDescription](self->_stateDescriptor, "debugDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = self;
      v49 = 2114;
      v50 = (uint64_t)v33;
      _os_log_impl(&dword_1D33D5000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: -stopPlayingAlerts…: Updated _stateDescriptor to %{public}@.", buf, 0x16u);

    }
  }

  os_unfair_lock_unlock(&self->_lock);
  if (v24)
  {
    audioQueue = self->_audioQueue;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __85__TLAlertQueuePlayerController_stopPlayingAlerts_withOptions_playbackCompletionType___block_invoke;
    v38[3] = &unk_1E952B648;
    v38[4] = self;
    v39 = v24;
    v40 = v37;
    v41 = v36;
    -[TLAudioQueue performTaskWithBlock:](audioQueue, "performTaskWithBlock:", v38);

  }
  return v24 != 0;
}

uint64_t __85__TLAlertQueuePlayerController_stopPlayingAlerts_withOptions_playbackCompletionType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopPlayingAlertForStateDescriptor:withOptions:playbackCompletionType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)updateAudioVolumeDynamicallyForAlert:(id)a3 toValue:(float)a4
{
  id v6;
  id v7;
  TLAudioQueue *audioQueue;
  _QWORD v9[5];
  id v10;
  float v11;

  v6 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[TLAlertQueuePlayerStateDescriptor playingAlert](self->_stateDescriptor, "playingAlert");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_lock);
  if (v7 == v6)
  {
    audioQueue = self->_audioQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __77__TLAlertQueuePlayerController_updateAudioVolumeDynamicallyForAlert_toValue___block_invoke;
    v9[3] = &unk_1E952B530;
    v9[4] = self;
    v10 = v6;
    v11 = a4;
    -[TLAudioQueue performTaskWithBlock:](audioQueue, "performTaskWithBlock:", v9);

  }
}

uint64_t __77__TLAlertQueuePlayerController_updateAudioVolumeDynamicallyForAlert_toValue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  TLLogPlayback();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(float *)(a1 + 48);
    v8 = 138543874;
    v9 = v3;
    v10 = 2114;
    v11 = v4;
    v12 = 2048;
    v13 = v5;
    _os_log_impl(&dword_1D33D5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: -updateAudioVolumeDynamicallyForAlert:(%{public}@) toValue:(%f)", (uint8_t *)&v8, 0x20u);
  }

  LODWORD(v6) = *(_DWORD *)(a1 + 48);
  return objc_msgSend(*(id *)(a1 + 32), "_applyAudioVolume:forAlert:", *(_QWORD *)(a1 + 40), v6);
}

- (void)handleActivationAssertionStatusChangeForAlert:(id)a3 updatedStatus:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  TLAlertQueuePlayerStateDescriptor *v7;
  TLAlertQueuePlayerStateDescriptor *v8;
  id v9;
  void *v10;
  id v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  TLAlertQueuePlayerStateDescriptor *stateDescriptor;
  TLAudioQueue *audioQueue;
  id v17;
  TLAlertQueuePlayerStateDescriptor *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  TLAlertQueuePlayerStateDescriptor *v22;
  id v23;
  BOOL v24;
  uint8_t buf[4];
  TLAlertQueuePlayerController *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  TLAlertQueuePlayerStateDescriptor *v32;
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v7 = self->_stateDescriptor;
  v8 = v7;
  if (v4)
  {
    v9 = -[TLAlertQueuePlayerStateDescriptor initForAcquiringActivationAssertionWithAlertForAudioEnvironmentSetup:previousStateDescriptor:]([TLAlertQueuePlayerStateDescriptor alloc], "initForAcquiringActivationAssertionWithAlertForAudioEnvironmentSetup:previousStateDescriptor:", v6, v7);
LABEL_3:
    v10 = v9;
    goto LABEL_9;
  }
  -[TLAlertQueuePlayerStateDescriptor alertForAudioEnvironmentSetup](v7, "alertForAudioEnvironmentSetup");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 == v6)
  {
    v12 = -[TLAlertQueuePlayerStateDescriptor isAlertActivationAssertionAcquired](v8, "isAlertActivationAssertionAcquired");

    if (v12)
    {
      -[TLAlertQueuePlayerStateDescriptor stateDescriptorByRelinquishingActivationAssertion](v8, "stateDescriptorByRelinquishingActivationAssertion");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
  }
  else
  {

  }
  v10 = 0;
LABEL_9:
  objc_storeStrong((id *)&self->_stateDescriptor, v10);
  TLLogPlayback();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "debugDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    stateDescriptor = self->_stateDescriptor;
    *(_DWORD *)buf = 138544130;
    v26 = self;
    v27 = 2114;
    v28 = v14;
    v29 = 1024;
    v30 = v4;
    v31 = 2114;
    v32 = stateDescriptor;
    _os_log_impl(&dword_1D33D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -handleActivationAssertionStatusChangeForAlert:(%{public}@) updatedStatus:(%{BOOL}d): Updated _stateDescriptor to %{public}@.", buf, 0x26u);

  }
  os_unfair_lock_unlock(&self->_lock);
  audioQueue = self->_audioQueue;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __92__TLAlertQueuePlayerController_handleActivationAssertionStatusChangeForAlert_updatedStatus___block_invoke;
  v20[3] = &unk_1E952BB80;
  v20[4] = self;
  v21 = v6;
  v24 = v4;
  v22 = v8;
  v23 = v10;
  v17 = v10;
  v18 = v8;
  v19 = v6;
  -[TLAudioQueue performTaskWithBlock:](audioQueue, "performTaskWithBlock:", v20);

}

uint64_t __92__TLAlertQueuePlayerController_handleActivationAssertionStatusChangeForAlert_updatedStatus___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleActivationAssertionStatusChangeForAlert:updatedStatus:previousStateDescriptor:updatedStateDescriptor:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_playAlertForStateDescriptor:(id)a3 previousStateDescriptor:(id)a4
{
  id v6;
  char *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  int isUsingAuxiliaryAudioSession;
  void *v13;
  NSObject *v14;
  const char *v15;
  AVAudioSession *audioSession;
  void *v17;
  int v18;
  TLAlertQueuePlayerController *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  AVAudioSession *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (char *)a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  objc_msgSend(v6, "playingAlert");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  TLLogPlayback();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138543874;
    v19 = self;
    v20 = 2114;
    v21 = v6;
    v22 = 2114;
    v23 = v7;
    _os_log_impl(&dword_1D33D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: -_playAlertForStateDescriptor:(%{public}@) previousStateDescriptor:(%{public}@).", (uint8_t *)&v18, 0x20u);
  }

  if (self->_audioSession)
  {
    objc_msgSend(v6, "alertForAudioEnvironmentSetup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend((id)objc_opt_class(), "_shouldUseAuxiliaryAudioSessionForAlert:", v10);
    isUsingAuxiliaryAudioSession = self->_isUsingAuxiliaryAudioSession;
    if (isUsingAuxiliaryAudioSession == v11)
    {
      -[TLAlertQueuePlayerController _beginPreventingAudioSessionDeactivation](self, "_beginPreventingAudioSessionDeactivation");
    }
    else
    {
      TLLogPlayback();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = "auxiliary";
        audioSession = self->_audioSession;
        v18 = 138544130;
        if (!isUsingAuxiliaryAudioSession)
          v15 = "shared";
        v19 = self;
        v20 = 2114;
        v21 = v10;
        v22 = 2082;
        v23 = v15;
        v24 = 2114;
        v25 = audioSession;
        _os_log_impl(&dword_1D33D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: -_playAlert: Policy for picking between auxiliary and shared audio session for %{public}@ doesn't match current state. Allowing deactivation of %{public}s audio session %{public}@.", (uint8_t *)&v18, 0x2Au);
      }

    }
    -[TLAlertQueuePlayerController _stopPlaybackForStateDescriptor:](self, "_stopPlaybackForStateDescriptor:", v7);
    objc_msgSend(v7, "invokePlayingAlertCompletionHandlerWithPlaybackCompletionType:error:", 4, 0);
    objc_msgSend(v8, "toneIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLAlertQueuePlayerController _reloadPlaybackForStateDescriptor:withToneIdentifier:](self, "_reloadPlaybackForStateDescriptor:withToneIdentifier:", v6, v17);

    if (isUsingAuxiliaryAudioSession == v11)
      -[TLAlertQueuePlayerController _endPreventingAudioSessionDeactivationForStateDescriptor:](self, "_endPreventingAudioSessionDeactivationForStateDescriptor:", v6);
  }
  else
  {
    -[TLAlertQueuePlayerController _stopPlaybackForStateDescriptor:](self, "_stopPlaybackForStateDescriptor:", v7);
    objc_msgSend(v7, "invokePlayingAlertCompletionHandlerWithPlaybackCompletionType:error:", 4, 0);
    objc_msgSend(v8, "toneIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLAlertQueuePlayerController _reloadPlaybackForStateDescriptor:withToneIdentifier:](self, "_reloadPlaybackForStateDescriptor:withToneIdentifier:", v6, v13);

  }
}

- (void)_stopPlayingAlertForStateDescriptor:(id)a3 withOptions:(id)a4 playbackCompletionType:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  TLAlertQueuePlayerController *v26;
  id v27;
  _BYTE *v28;
  _BYTE buf[24];
  void *UIBackgroundTaskInvalid;
  _QWORD v31[2];
  _BYTE v32[24];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  TLLogPlayback();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromTLAlertPlaybackCompletionType(a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2114;
    UIBackgroundTaskInvalid = v9;
    LOWORD(v31[0]) = 2114;
    *(_QWORD *)((char *)v31 + 2) = v11;
    _os_log_impl(&dword_1D33D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopPlayingAlertForStateDescriptor:(%{public}@) withOptions:(%{public}@) playbackCompletionType:(%{public}@).", buf, 0x2Au);

  }
  *(_QWORD *)v32 = 0;
  *(_QWORD *)&v32[8] = v32;
  *(_QWORD *)&v32[16] = 0x2050000000;
  v12 = (void *)getUIApplicationClass_softClass_0;
  v33 = getUIApplicationClass_softClass_0;
  if (!getUIApplicationClass_softClass_0)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getUIApplicationClass_block_invoke_0;
    UIBackgroundTaskInvalid = &unk_1E952AB10;
    v31[0] = v32;
    __getUIApplicationClass_block_invoke_0((uint64_t)buf);
    v12 = *(void **)(*(_QWORD *)&v32[8] + 24);
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(v32, 8);
  objc_msgSend(v13, "sharedApplication");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    UIBackgroundTaskInvalid = 0;
    UIBackgroundTaskInvalid = (void *)getUIBackgroundTaskInvalid();
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "playingAlert");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Stopping playing alert: %@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __103__TLAlertQueuePlayerController__stopPlayingAlertForStateDescriptor_withOptions_playbackCompletionType___block_invoke_2;
    v24[3] = &unk_1E952BBA8;
    v28 = buf;
    v18 = v14;
    v25 = v18;
    v26 = self;
    v19 = v17;
    v27 = v19;
    v20 = (void *)MEMORY[0x1D824F08C](v24);
    v21 = objc_msgSend(v18, "beginBackgroundTaskWithName:expirationHandler:", v19, v20);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v21;
    TLLogPlayback();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
      *(_DWORD *)v32 = 138543874;
      *(_QWORD *)&v32[4] = self;
      *(_WORD *)&v32[12] = 2114;
      *(_QWORD *)&v32[14] = v19;
      *(_WORD *)&v32[22] = 2048;
      v33 = v23;
      _os_log_impl(&dword_1D33D5000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopPlayingAlertFor…: Began background task with name: \"%{public}@\"; identifier: %lu.",
        v32,
        0x20u);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v20 = &__block_literal_global_15;
  }
  -[TLAlertQueuePlayerController _stopPlaybackForStateDescriptor:withOptions:playerWasAlreadyPausedExternally:](self, "_stopPlaybackForStateDescriptor:withOptions:playerWasAlreadyPausedExternally:", v8, v9, 0);
  objc_msgSend(v8, "invokePlayingAlertCompletionHandlerWithPlaybackCompletionType:error:", a5, 0);
  dispatch_async(MEMORY[0x1E0C80D38], v20);

}

void __103__TLAlertQueuePlayerController__stopPlayingAlertForStateDescriptor_withOptions_playbackCompletionType___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v2 != getUIBackgroundTaskInvalid())
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = getUIBackgroundTaskInvalid();
    objc_msgSend(*(id *)(a1 + 32), "endBackgroundTask:", v3);
    TLLogPlayback();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 48);
      v7 = 138543874;
      v8 = v5;
      v9 = 2114;
      v10 = v6;
      v11 = 2048;
      v12 = v3;
      _os_log_impl(&dword_1D33D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopPlayingAlertFor…: Ended background task with name: \"%{public}@\"; identifier: %lu.",
        (uint8_t *)&v7,
        0x20u);
    }

  }
}

- (void)_handleActivationAssertionStatusChangeForAlert:(id)a3 updatedStatus:(BOOL)a4 previousStateDescriptor:(id)a5 updatedStateDescriptor:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  int v22;
  int v23;
  TLAlertQueuePlayerController *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  _BYTE v28[24];
  uint64_t v29;

  v8 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  if (!v12 && v8)
  {
    TLLogGeneral();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Playback/BackEnds/QueuePlayer/TLAlertQueuePlayerController.m");
      v15 = objc_claimAutoreleasedReturnValue();
      TLLogGeneral();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject lastPathComponent](v15, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 136381443;
        v24 = (TLAlertQueuePlayerController *)"-[TLAlertQueuePlayerController _handleActivationAssertionStatusChangeForAl"
                                              "ert:updatedStatus:previousStateDescriptor:updatedStateDescriptor:]";
        v25 = 2113;
        v26 = v17;
        v27 = 2049;
        *(_QWORD *)v28 = 382;
        *(_WORD *)&v28[8] = 2113;
        *(_QWORD *)&v28[10] = v18;
        _os_log_impl(&dword_1D33D5000, v16, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v23, 0x2Au);

      }
    }
    else
    {
      TLLogGeneral();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
    }

    TLLogGeneral();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[TLAlertQueuePlayerController _handleActivationAssertionStatusChangeForAlert:updatedStatus:previousStateDescriptor:updatedStateDescriptor:].cold.1();

  }
  TLLogPlayback();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138544386;
    v24 = self;
    v25 = 2114;
    v26 = v10;
    v27 = 1024;
    *(_DWORD *)v28 = v8;
    *(_WORD *)&v28[4] = 2114;
    *(_QWORD *)&v28[6] = v11;
    *(_WORD *)&v28[14] = 2114;
    *(_QWORD *)&v28[16] = v12;
    _os_log_impl(&dword_1D33D5000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleActivationAssertionStatusChangeForAlert:(%{public}@) updatedStatus:(%{BOOL}d) previousStateDescriptor:(%{public}@) updatedStateDescriptor:(%{public}@).", (uint8_t *)&v23, 0x30u);
  }

  if (v8)
  {
    if (self->_isAudioEnvironmentSetup)
      -[TLAlertQueuePlayerController _restoreAudioEnvironmentForStateDescriptor:](self, "_restoreAudioEnvironmentForStateDescriptor:", v11);
    -[TLAlertQueuePlayerController _prepareAudioEnvironmentForStateDescriptor:](self, "_prepareAudioEnvironmentForStateDescriptor:", v12);
  }
  else
  {
    objc_msgSend(v11, "alertForAudioEnvironmentSetup");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (v21 == v10)
    {
      v22 = objc_msgSend(v11, "isAlertActivationAssertionAcquired");

      if (v22)
        -[TLAlertQueuePlayerController _restoreAudioEnvironmentForStateDescriptor:](self, "_restoreAudioEnvironmentForStateDescriptor:", v11);
    }
    else
    {

    }
  }

}

+ (id)_propertyKeysOfInterestForToneAssets
{
  return &unk_1E9538180;
}

- (BOOL)_canPlayToneAsset:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint8_t v31[128];
  _BYTE buf[24];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  objc_msgSend((id)objc_opt_class(), "_propertyKeysOfInterestForToneAssets");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v26;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v8);
      if (objc_msgSend(v4, "statusOfValueForKey:error:", v9, 0) != 2)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        if (!v6)
          goto LABEL_9;
        goto LABEL_3;
      }
    }
    TLLogPlayback();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v4;
      *(_WORD *)&buf[22] = 2114;
      v33 = v9;
      _os_log_error_impl(&dword_1D33D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@: -_canPlayToneAsset:(%{public}@). Can't play tone asset because property %{public}@ is not loaded.", buf, 0x20u);
    }

    goto LABEL_24;
  }
LABEL_9:

  v23 = 0uLL;
  v24 = 0;
  if (v4)
    objc_msgSend(v4, "duration");
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v10 = getCMTimeMakeSymbolLoc_ptr;
  v33 = getCMTimeMakeSymbolLoc_ptr;
  if (!getCMTimeMakeSymbolLoc_ptr)
  {
    v11 = (void *)CoreMediaLibrary();
    v10 = dlsym(v11, "CMTimeMake");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v10;
    getCMTimeMakeSymbolLoc_ptr = v10;
  }
  _Block_object_dispose(buf, 8);
  if (!v10)
  {
    __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    goto LABEL_31;
  }
  ((void (*)(__int128 *__return_ptr, uint64_t, uint64_t))v10)(&v21, 1, 100);
  v19 = v23;
  v20 = v24;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v12 = getCMTimeCompareSymbolLoc_ptr;
  v33 = getCMTimeCompareSymbolLoc_ptr;
  if (!getCMTimeCompareSymbolLoc_ptr)
  {
    v13 = (void *)CoreMediaLibrary();
    v12 = dlsym(v13, "CMTimeCompare");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v12;
    getCMTimeCompareSymbolLoc_ptr = v12;
  }
  _Block_object_dispose(buf, 8);
  if (!v12)
  {
    __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
LABEL_31:
    __break(1u);
  }
  *(_OWORD *)buf = v19;
  *(_QWORD *)&buf[16] = v20;
  v29 = v21;
  v30 = v22;
  if ((((uint64_t (*)(_BYTE *, __int128 *))v12)(buf, &v29) & 0x80000000) != 0)
  {
    TLLogPlayback();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v4;
      _os_log_impl(&dword_1D33D5000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: -_canPlayToneAsset:(%{public}@). Can't play tone asset because its duration is too short.", buf, 0x16u);
    }

LABEL_24:
    v15 = 0;
    goto LABEL_25;
  }
  TLLogPlayback();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_1D33D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: -_canPlayToneAsset:(%{public}@). Can play!", buf, 0x16u);
  }

  v15 = 1;
LABEL_25:

  return v15;
}

- (void)_reloadPlaybackForStateDescriptor:(id)a3 withToneIdentifier:(id)a4
{
  TLAlertQueuePlayerStateDescriptor *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSString *v10;
  NSString *playingToneIdentifier;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  NSObject *v17;
  TLAlertQueuePlayerStateDescriptor *v18;
  TLAlertQueuePlayerStateDescriptor *stateDescriptor;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  int v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  _QWORD v50[5];
  id v51;
  TLAlertQueuePlayerStateDescriptor *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  _BYTE buf[24];
  void *v58;
  uint64_t *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = (TLAlertQueuePlayerStateDescriptor *)a3;
  v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  TLLogPlayback();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    v58 = v7;
    _os_log_impl(&dword_1D33D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: -_reloadPlaybackForStateDescriptor:(%{public}@) withToneIdentifier:(%{public}@).", buf, 0x20u);
  }

  -[TLAlertQueuePlayerStateDescriptor playingAlert](v6, "playingAlert");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && objc_msgSend(v7, "length"))
  {
    v10 = (NSString *)objc_msgSend(v7, "copy");
    playingToneIdentifier = self->_playingToneIdentifier;
    self->_playingToneIdentifier = v10;

    if (-[AVQueuePlayer status](self->_queuePlayer, "status") == 2)
    {
      TLLogPlayback();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[TLAlertQueuePlayerController _reloadPlaybackForStateDescriptor:withToneIdentifier:].cold.5();

      -[TLAlertQueuePlayerController _destroyQueuePlayerForStateDescriptor:](self, "_destroyQueuePlayerForStateDescriptor:", v6);
    }
    -[TLAlertQueuePlayerController _createQueuePlayerIfNecessaryForStateDescriptor:](self, "_createQueuePlayerIfNecessaryForStateDescriptor:", v6);
    objc_msgSend(v9, "toneIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", self->_playingToneIdentifier);

    if (v14)
    {
      objc_msgSend(v9, "configuration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "externalToneFileURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {

        goto LABEL_43;
      }
      v49 = objc_msgSend(v15, "externalToneMediaLibraryItemIdentifier");
      if (v49)
      {
        v53 = 0;
        v54 = &v53;
        v55 = 0x2050000000;
        v23 = (void *)getMPMediaPropertyPredicateClass_softClass;
        v56 = getMPMediaPropertyPredicateClass_softClass;
        if (!getMPMediaPropertyPredicateClass_softClass)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __getMPMediaPropertyPredicateClass_block_invoke;
          v58 = &unk_1E952AB10;
          v59 = &v53;
          __getMPMediaPropertyPredicateClass_block_invoke((uint64_t)buf);
          v23 = (void *)v54[3];
        }
        v24 = objc_retainAutorelease(v23);
        _Block_object_dispose(&v53, 8);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v49);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v26 = (_QWORD *)getMPMediaItemPropertyPersistentIDSymbolLoc_ptr;
        v58 = (void *)getMPMediaItemPropertyPersistentIDSymbolLoc_ptr;
        if (!getMPMediaItemPropertyPersistentIDSymbolLoc_ptr)
        {
          v27 = (void *)MediaPlayerLibrary();
          v26 = dlsym(v27, "MPMediaItemPropertyPersistentID");
          *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v26;
          getMPMediaItemPropertyPersistentIDSymbolLoc_ptr = (uint64_t)v26;
        }
        _Block_object_dispose(buf, 8);
        if (!v26)
          goto LABEL_50;
        objc_msgSend(v24, "predicateWithValue:forProperty:", v25, *v26);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v53 = 0;
        v54 = &v53;
        v55 = 0x2050000000;
        v28 = (void *)getMPMediaQueryClass_softClass;
        v56 = getMPMediaQueryClass_softClass;
        if (!getMPMediaQueryClass_softClass)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __getMPMediaQueryClass_block_invoke;
          v58 = &unk_1E952AB10;
          v59 = &v53;
          __getMPMediaQueryClass_block_invoke((uint64_t)buf);
          v28 = (void *)v54[3];
        }
        v29 = objc_retainAutorelease(v28);
        _Block_object_dispose(&v53, 8);
        objc_msgSend(v29, "songsQuery");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addFilterPredicate:", v48);
        objc_msgSend(v30, "items");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "lastObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v33 = (id *)getMPMediaItemPropertyFilePathSymbolLoc_ptr;
        v58 = (void *)getMPMediaItemPropertyFilePathSymbolLoc_ptr;
        if (!getMPMediaItemPropertyFilePathSymbolLoc_ptr)
        {
          v34 = (void *)MediaPlayerLibrary();
          v33 = (id *)dlsym(v34, "MPMediaItemPropertyFilePath");
          *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v33;
          getMPMediaItemPropertyFilePathSymbolLoc_ptr = (uint64_t)v33;
        }
        _Block_object_dispose(buf, 8);
        if (!v33)
        {
LABEL_50:
          __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
          __break(1u);
        }
        v35 = *v33;
        objc_msgSend(v32, "valueForProperty:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v36, "length")
          && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
              v37 = (void *)objc_claimAutoreleasedReturnValue(),
              v38 = objc_msgSend(v37, "fileExistsAtPath:", v36),
              v37,
              v38))
        {
          TLLogPlayback();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v36;
            *(_WORD *)&buf[22] = 2048;
            v58 = (void *)v49;
            _os_log_impl(&dword_1D33D5000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: -_reloadPlayback…: found external media library asset at path %{public}@ for identifier %llu.", buf, 0x20u);
          }

          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v36, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = 0;
        }

        if (v16)
          goto LABEL_43;
      }
      else
      {

      }
    }
    if (-[NSString isEqualToString:](self->_playingToneIdentifier, "isEqualToString:", CFSTR("<none>")))
    {
      -[TLAlertQueuePlayerController _startPlaybackForStateDescriptor:usingAssetWithLoadedProperties:shouldConfirmAlertStillPlaying:](self, "_startPlaybackForStateDescriptor:usingAssetWithLoadedProperties:shouldConfirmAlertStillPlaying:", v6, 0, 0);
      goto LABEL_19;
    }
    +[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "filePathForToneIdentifier:", self->_playingToneIdentifier);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v41, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
LABEL_47:
      TLLogPlayback();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        -[TLAlertQueuePlayerController _reloadPlaybackForStateDescriptor:withToneIdentifier:].cold.2();

      -[TLAlertQueuePlayerController _fallbackToneIdentifierForStateDescriptor:](self, "_fallbackToneIdentifierForStateDescriptor:", v6);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLAlertQueuePlayerController _reloadPlaybackForStateDescriptor:withToneIdentifier:](self, "_reloadPlaybackForStateDescriptor:withToneIdentifier:", v6, v47);

      goto LABEL_19;
    }
LABEL_43:
    objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v16);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      TLLogPlayback();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v42;
        _os_log_impl(&dword_1D33D5000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@: -_reloadPlayback…: [toneAsset loadValuesAsynchronouslyForKeys:…] for %{public}@.", buf, 0x16u);
      }

      self->_isWaitingToCompleteReloadPlaybackRequest = 1;
      objc_msgSend((id)objc_opt_class(), "_propertyKeysOfInterestForToneAssets");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __85__TLAlertQueuePlayerController__reloadPlaybackForStateDescriptor_withToneIdentifier___block_invoke;
      v50[3] = &unk_1E952AE10;
      v50[4] = self;
      v51 = v42;
      v52 = v6;
      v45 = v42;
      objc_msgSend(v45, "loadValuesAsynchronouslyForKeys:completionHandler:", v44, v50);

      goto LABEL_19;
    }
    goto LABEL_47;
  }
  TLLogPlayback();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[TLAlertQueuePlayerController _reloadPlaybackForStateDescriptor:withToneIdentifier:].cold.1();

  os_unfair_lock_lock(&self->_lock);
  if (self->_stateDescriptor == v6)
  {
    -[TLAlertQueuePlayerStateDescriptor stateDescriptorForCompletedPlayback](v6, "stateDescriptorForCompletedPlayback");
    v18 = (TLAlertQueuePlayerStateDescriptor *)objc_claimAutoreleasedReturnValue();
    stateDescriptor = self->_stateDescriptor;
    self->_stateDescriptor = v18;

    TLLogPlayback();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      -[TLAlertQueuePlayerStateDescriptor debugDescription](self->_stateDescriptor, "debugDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v21;
      _os_log_impl(&dword_1D33D5000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: -_reloadPlayback…: Updated _stateDescriptor to %{public}@.", buf, 0x16u);

    }
  }
  os_unfair_lock_unlock(&self->_lock);
  -[TLAlertQueuePlayerController _stopPlaybackForStateDescriptor:](self, "_stopPlaybackForStateDescriptor:", v6);
  objc_msgSend(MEMORY[0x1E0CB35C8], "tl_errorWithDomain:description:", CFSTR("TLAlertErrorDomain"), CFSTR("Failed to prepare tone asset for playback."));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLAlertQueuePlayerStateDescriptor invokePlayingAlertCompletionHandlerWithPlaybackCompletionType:error:](v6, "invokePlayingAlertCompletionHandlerWithPlaybackCompletionType:error:", 5, v22);

LABEL_19:
}

void __85__TLAlertQueuePlayerController__reloadPlaybackForStateDescriptor_withToneIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  TLLogPlayback();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v11 = v3;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1D33D5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: -_reloadPlayback…: did finish loading values asynchronously for %{public}@.", buf, 0x16u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__TLAlertQueuePlayerController__reloadPlaybackForStateDescriptor_withToneIdentifier___block_invoke_32;
  v7[3] = &unk_1E952AE10;
  v7[4] = v5;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v6, "performTaskWithBlock:", v7);

}

uint64_t __85__TLAlertQueuePlayerController__reloadPlaybackForStateDescriptor_withToneIdentifier___block_invoke_32(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startPlaybackForStateDescriptor:usingAssetWithLoadedProperties:shouldConfirmAlertStillPlaying:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
}

- (void)_startPlaybackForStateDescriptor:(id)a3 usingAssetWithLoadedProperties:(id)a4 shouldConfirmAlertStillPlaying:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  TLAlertQueuePlayerController *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v5 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  TLLogPlayback();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138544130;
    v15 = self;
    v16 = 2114;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    v20 = 1024;
    v21 = v5;
    _os_log_impl(&dword_1D33D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlaybackForStateDescriptor:(%{public}@) usingAssetWithLoadedProperties:(%{public}@) shouldConfirmAlertStillPlaying:(%{BOOL}d).", (uint8_t *)&v14, 0x26u);
  }

  self->_isWaitingToCompleteReloadPlaybackRequest = 0;
  if (v5)
  {
    os_unfair_lock_lock(&self->_lock);
    -[TLAlertQueuePlayerStateDescriptor playingAlert](self->_stateDescriptor, "playingAlert");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "playingAlert");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(&self->_lock);
    if (v11 != v12)
    {
      TLLogPlayback();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138543618;
        v15 = self;
        v16 = 2114;
        v17 = v8;
        _os_log_impl(&dword_1D33D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… usingAssetWithLoadedProperties…: Playing alert for %{public}@ is no longer actually playing; aborting playback initiation.",
          (uint8_t *)&v14,
          0x16u);
      }
      goto LABEL_11;
    }
  }
  if (v9 && !-[TLAlertQueuePlayerController _canPlayToneAsset:](self, "_canPlayToneAsset:", v9))
  {
    -[TLAlertQueuePlayerController _fallbackToneIdentifierForStateDescriptor:](self, "_fallbackToneIdentifierForStateDescriptor:", v8);
    v13 = objc_claimAutoreleasedReturnValue();
    -[TLAlertQueuePlayerController _reloadPlaybackForStateDescriptor:withToneIdentifier:](self, "_reloadPlaybackForStateDescriptor:withToneIdentifier:", v8, v13);
LABEL_11:

    goto LABEL_12;
  }
  -[TLAlertQueuePlayerController _startPlaybackForStateDescriptor:usingConfirmedPlayableAsset:](self, "_startPlaybackForStateDescriptor:usingConfirmedPlayableAsset:", v8, v9);
LABEL_12:

}

- (void)_startPlaybackForStateDescriptor:(id)a3 usingConfirmedPlayableAsset:(id)a4
{
  AVQueuePlayer *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  AVQueuePlayer *queuePlayer;
  AVAsset *toneAssetForPendingPlayingAlert;
  _BOOL8 v12;
  NSObject *v13;
  int v14;
  TLAlertQueuePlayerController *v15;
  __int16 v16;
  AVQueuePlayer *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (AVQueuePlayer *)a3;
  v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  TLLogPlayback();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543874;
    v15 = self;
    v16 = 2114;
    v17 = v6;
    v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_1D33D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlaybackForStateDescriptor:(%{public}@) usingConfirmedPlayableAsset:(%{public}@).", (uint8_t *)&v14, 0x20u);
  }

  -[TLAlertQueuePlayerController _stopObservingQueuePlayer](self, "_stopObservingQueuePlayer");
  TLLogPlayback();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    queuePlayer = self->_queuePlayer;
    v14 = 138543618;
    v15 = self;
    v16 = 2114;
    v17 = queuePlayer;
    _os_log_impl(&dword_1D33D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… usingConfirmedPlayableAsset…: [_queuePlayer removeAllItems] on %{public}@ before initiating playback.", (uint8_t *)&v14, 0x16u);
  }

  -[AVQueuePlayer removeAllItems](self->_queuePlayer, "removeAllItems");
  objc_storeStrong((id *)&self->_toneAssetForPendingPlayingAlert, a4);
  self->_hasToneAssetForPendingPlayingAlert = 1;
  -[TLAlertQueuePlayerController _willBeginPlayingAlertForStateDescriptor:](self, "_willBeginPlayingAlertForStateDescriptor:", v6);
  if (self->_attentionPollingToken && !self->_isAttentionAwarenessSubsystemFullyInitialized)
  {
    TLLogPlayback();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = self;
      _os_log_impl(&dword_1D33D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… usingConfirmedPlayableAsset…: Currently polling for attention, and attention awareness subsystem not initialized yet. Waiting to see if we already have the user's attention.", (uint8_t *)&v14, 0xCu);
    }

  }
  else
  {
    toneAssetForPendingPlayingAlert = self->_toneAssetForPendingPlayingAlert;
    self->_toneAssetForPendingPlayingAlert = 0;

    self->_hasToneAssetForPendingPlayingAlert = 0;
    v12 = self->_isAttentionAwarenessSubsystemFullyInitialized && self->_lastAttentionPollingEventType == 1;
    -[TLAlertQueuePlayerController _startPlaybackForStateDescriptor:usingConfirmedPlayableAsset:hasAlreadyDetectedUserAttention:](self, "_startPlaybackForStateDescriptor:usingConfirmedPlayableAsset:hasAlreadyDetectedUserAttention:", v6, v7, v12);
  }

}

- (void)_startPlaybackForStateDescriptor:(id)a3 usingConfirmedPlayableAsset:(id)a4 hasAlreadyDetectedUserAttention:(BOOL)a5
{
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  unint64_t v19;
  NSObject *v20;
  AVQueuePlayer *queuePlayer;
  __int128 v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  NSObject *v38;
  void *v39;
  TLVibrationPattern *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  BOOL v46;
  NSObject *v47;
  _BOOL4 v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  NSObject *v60;
  NSObject *v61;
  AVQueuePlayer *v62;
  NSObject *v63;
  AVQueuePlayer *v64;
  double v65;
  double v66;
  NSObject *v67;
  AVQueuePlayer *v68;
  dispatch_time_t v69;
  NSObject *v70;
  void *v71;
  NSObject *v72;
  __int128 v73;
  _BOOL4 v74;
  void *v75;
  uint64_t v76;
  _BOOL4 v77;
  id v78;
  void *v79;
  _BOOL4 v80;
  id v81;
  _QWORD v82[4];
  id v83;
  id v84;
  _QWORD block[4];
  id v86;
  id v87[2];
  __int128 v88;
  uint64_t v89;
  __int128 v90;
  uint64_t v91;
  _BYTE buf[24];
  uint64_t v93;
  __int16 v94;
  id v95;
  uint64_t v96;

  v77 = a5;
  v96 = *MEMORY[0x1E0C80C00];
  v78 = a3;
  v81 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  TLLogPlayback();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v78;
    *(_WORD *)&buf[22] = 2114;
    v93 = (uint64_t)v81;
    v94 = 1024;
    LODWORD(v95) = v77;
    _os_log_impl(&dword_1D33D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlaybackForStateDescriptor:(%{public}@) usingConfirmedPlayableAsset:(%{public}@) hasAlreadyDetectedUserAttention:(%{BOOL}d).", buf, 0x26u);
  }

  objc_msgSend(v78, "playingAlert");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "_shouldVibrateForAlert:", v79))
  {
    +[TLCapabilitiesManager sharedCapabilitiesManager](TLCapabilitiesManager, "sharedCapabilitiesManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasSynchronizedEmbeddedVibrationsCapability");

    if (v9)
    {
      objc_msgSend(v79, "toneIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "vibrationIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "hasPrefix:", CFSTR("synchronizedvibration:"))
        || (objc_msgSend(v79, "_hasSynchronizedVibrationUnmatchedWithTone") & 1) != 0
        || (objc_msgSend(v10, "hasPrefix:", CFSTR("alarmWakeUp:")) & 1) != 0)
      {
        v12 = 0;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v81, "URL");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "pathExtension");
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v57, "lowercaseString");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v58, "isEqualToString:", CFSTR("caf"));

          if (v59)
          {
            TLLogPlayback();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = self;
              _os_log_impl(&dword_1D33D5000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… hasAlreadyDetected…: Vibrating using embedded haptic track is not supported for .caf audio assets.", buf, 0xCu);
            }

            v12 = 0;
          }
          else
          {
            v12 = 1;
          }

        }
        else
        {
          v12 = 1;
        }
      }
      v74 = v12 == 0;
      TLLogPlayback();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v12;
        _os_log_impl(&dword_1D33D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… hasAlreadyDetected…: Should vibrate using embedded haptic track: %{BOOL}d.", buf, 0x12u);
      }

      v80 = v12 != 0;
    }
    else
    {
      v80 = 0;
      v74 = 1;
    }
  }
  else
  {
    v80 = 0;
    v74 = 0;
  }
  objc_msgSend(v79, "configuration");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v81)
  {
    v18 = 0;
    goto LABEL_58;
  }
  v90 = 0uLL;
  v91 = 0;
  objc_msgSend(v81, "duration");
  v88 = 0uLL;
  v89 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v14 = getCMTimeGetSecondsSymbolLoc_ptr;
  v93 = (uint64_t)getCMTimeGetSecondsSymbolLoc_ptr;
  if (!getCMTimeGetSecondsSymbolLoc_ptr)
  {
    v15 = (void *)CoreMediaLibrary();
    v14 = dlsym(v15, "CMTimeGetSeconds");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v14;
    getCMTimeGetSecondsSymbolLoc_ptr = v14;
  }
  _Block_object_dispose(buf, 8);
  if (!v14)
  {
    __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    __break(1u);
  }
  *(_OWORD *)buf = v88;
  *(_QWORD *)&buf[16] = v89;
  v16 = ((double (*)(_BYTE *))v14)(buf);
  objc_msgSend((id)objc_opt_class(), "_audioVolumeRampingDurationForAlert:externalEnvironmentValues:toneAssetDuration:", v79, *(_WORD *)&self->_externalEnvironmentValues, v16);
  v18 = v17;
  if (objc_msgSend(v75, "shouldRepeat"))
    v19 = llround(1.0 / v16) + 2;
  else
    v19 = 1;
  TLLogPlayback();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    queuePlayer = self->_queuePlayer;
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v19;
    *(_WORD *)&buf[22] = 2114;
    v93 = (uint64_t)queuePlayer;
    v94 = 2114;
    v95 = v81;
    _os_log_impl(&dword_1D33D5000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… hasAlreadyDetected…: inserting %lu player items into %{public}@ for tone asset: %{public}@.", buf, 0x2Au);
  }

  if (self->_attentionPollingToken)
  {
    -[TLAttentionAwarenessEffectCoordinator audioMixForAsset:](self->_effectCoordinator, "audioMixForAsset:", v81);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
      goto LABEL_57;
    goto LABEL_28;
  }
  v23 = 0;
  if (v19)
  {
LABEL_28:
    v24 = 0;
    v76 = *MEMORY[0x1E0C8AC60];
    *(_QWORD *)&v22 = 138543874;
    v73 = v22;
    while (1)
    {
      objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithAsset:", v81, v73);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
        TLLogPlayback();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v73;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v24;
          *(_WORD *)&buf[22] = 2114;
          v93 = (uint64_t)v81;
          _os_log_error_impl(&dword_1D33D5000, v36, OS_LOG_TYPE_ERROR, "%{public}@: -_startPlayback… hasAlreadyDetected…: (iteration #%lu) failed to create AVPlayerItem for tone asset: %{public}@.", buf, 0x20u);
        }

        goto LABEL_56;
      }
      if (v80)
        break;
LABEL_53:
      if (v23)
        objc_msgSend(v25, "setAudioMix:", v23);
      objc_msgSend(v25, "setAudioSpatializationAllowed:", 0);
      -[AVQueuePlayer insertItem:afterItem:](self->_queuePlayer, "insertItem:afterItem:", v25, 0);
LABEL_56:

      if (v19 == ++v24)
        goto LABEL_57;
    }
    TLLogPlayback();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v25;
      _os_log_impl(&dword_1D33D5000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… hasAlreadyDetected…: [playerItem setPlayHapticTracks:YES] on %{public}@.", buf, 0x16u);
    }

    objc_msgSend(v25, "setPlayHapticTracks:", 1);
    objc_msgSend(v25, "setHapticPlaybackLocality:", v76);
    TLLogPlayback();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v25;
      _os_log_impl(&dword_1D33D5000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… hasAlreadyDetected…: [playerItem setHapticPlaybackLocality:AVPlayerItemHapticPlaybackLocalityDefaultWithFullStrength] on %{public}@.", buf, 0x16u);
    }

    objc_msgSend(v25, "tl_hapticTracks");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "attenuatedHapticPlayerItemTrack");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "hapticPlayerItemTrack");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v29)
    {
      if (v77)
      {
        objc_msgSend(v30, "setEnabled:", 0);
        objc_msgSend(v31, "setMutesHaptics:", 1);
        TLLogPlayback();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v31;
          _os_log_impl(&dword_1D33D5000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… hasAlreadyDetected…: [hapticPlayerItemTrack setEnabled:NO] and [hapticPlayerItemTrack setMutesHaptics:YES] on %{public}@.", buf, 0x16u);
        }

        objc_msgSend(v29, "setEnabled:", 1);
        objc_msgSend(v29, "setMutesHaptics:", 0);
        TLLogPlayback();
        v33 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          goto LABEL_52;
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v29;
        v34 = v33;
        v35 = "%{public}@: -_startPlayback… hasAlreadyDetected…: [attenuatedHapticPlayerItemTrack setEnabled:YES] and [at"
              "tenuatedHapticPlayerItemTrack setMutesHaptics:NO] on %{public}@.";
      }
      else
      {
        objc_msgSend(v30, "setEnabled:", 1);
        objc_msgSend(v31, "setMutesHaptics:", 0);
        TLLogPlayback();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v31;
          _os_log_impl(&dword_1D33D5000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… hasAlreadyDetected…: [hapticPlayerItemTrack setEnabled:YES] and [hapticPlayerItemTrack setMutesHaptics:NO] on %{public}@.", buf, 0x16u);
        }

        objc_msgSend(v29, "setEnabled:", 1);
        objc_msgSend(v29, "setMutesHaptics:", 1);
        TLLogPlayback();
        v33 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          goto LABEL_52;
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v29;
        v34 = v33;
        v35 = "%{public}@: -_startPlayback… hasAlreadyDetected…: [attenuatedHapticPlayerItemTrack setEnabled:YES] and [at"
              "tenuatedHapticPlayerItemTrack setMutesHaptics:YES] on %{public}@.";
      }
      v37 = 22;
    }
    else
    {
      objc_msgSend(v30, "setActiveHapticChannelIndex:", v77);
      TLLogPlayback();
      v33 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
LABEL_52:

        goto LABEL_53;
      }
      *(_DWORD *)buf = v73;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v77;
      *(_WORD *)&buf[22] = 2114;
      v93 = (uint64_t)v31;
      v34 = v33;
      v35 = "%{public}@: -_startPlayback… hasAlreadyDetected…: [hapticPlayerItemTrack setActiveHapticChannelIndex:%ld] on %{public}@.";
      v37 = 32;
    }
    _os_log_impl(&dword_1D33D5000, v34, OS_LOG_TYPE_DEFAULT, v35, buf, v37);
    goto LABEL_52;
  }
LABEL_57:

LABEL_58:
  -[TLAlertQueuePlayerController _startObservingQueuePlayer](self, "_startObservingQueuePlayer");
  if (!v74)
    goto LABEL_96;
  objc_msgSend(v75, "externalVibrationPattern");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39
    || (objc_msgSend(v75, "externalVibrationPatternFileURL"), (v44 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v44),
        v39 = (void *)objc_claimAutoreleasedReturnValue(),
        v44,
        v39))
  {
    if ((objc_msgSend(v75, "shouldRepeat") & 1) == 0)
    {
      v43 = v39;
      v39 = v43;
LABEL_92:
      TLLogPlayback();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        v64 = self->_queuePlayer;
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v64;
        _os_log_impl(&dword_1D33D5000, v63, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… hasAlreadyDetected…: [_queuePlayer setVibrationPattern:vibrationPattern] on player %{public}@ with a non-nil pattern.", buf, 0x16u);
      }

      -[AVQueuePlayer setVibrationPattern:](self->_queuePlayer, "setVibrationPattern:", v43);
      goto LABEL_95;
    }
    v40 = -[TLVibrationPattern initWithPropertyListRepresentation:]([TLVibrationPattern alloc], "initWithPropertyListRepresentation:", v39);
    v41 = v40;
    if (v40)
    {
      -[TLVibrationPattern _artificiallyRepeatingPropertyListRepresentation](v40, "_artificiallyRepeatingPropertyListRepresentation");
      v42 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      TLLogPlayback();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        -[TLAlertQueuePlayerController _startPlaybackForStateDescriptor:usingConfirmedPlayableAsset:hasAlreadyDetectedUserAttention:].cold.3();

      v42 = v39;
      v39 = v42;
    }
    v43 = v42;
  }
  else
  {
    objc_msgSend(v79, "vibrationIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v41, "isEqualToString:", CFSTR("<none>")) & 1) != 0)
    {
      -[AVQueuePlayer vibrationPattern](self->_queuePlayer, "vibrationPattern");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v45 == 0;

      if (!v46)
      {
        TLLogGeneral();
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = os_log_type_enabled(v47, OS_LOG_TYPE_INFO);

        if (v48)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Playback/BackEnds/QueuePlayer/TLAlertQueuePlayerController.m");
          v49 = objc_claimAutoreleasedReturnValue();
          TLLogGeneral();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            -[NSObject lastPathComponent](v49, "lastPathComponent");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136381443;
            *(_QWORD *)&buf[4] = "-[TLAlertQueuePlayerController _startPlaybackForStateDescriptor:usingConfirmedPlayableA"
                                 "sset:hasAlreadyDetectedUserAttention:]";
            *(_WORD *)&buf[12] = 2113;
            *(_QWORD *)&buf[14] = v51;
            *(_WORD *)&buf[22] = 2049;
            v93 = 712;
            v94 = 2113;
            v95 = v52;
            _os_log_impl(&dword_1D33D5000, v50, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

          }
        }
        else
        {
          TLLogGeneral();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
        }

        TLLogGeneral();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          -[TLAlertQueuePlayerController _startPlaybackForStateDescriptor:usingConfirmedPlayableAsset:hasAlreadyDetectedUserAttention:].cold.1();

      }
      TLLogPlayback();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v62 = self->_queuePlayer;
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v62;
        *(_WORD *)&buf[22] = 2114;
        v93 = (uint64_t)CFSTR("<none>");
        _os_log_impl(&dword_1D33D5000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… hasAlreadyDetected…:. Leaving [_queuePlayer vibrationPattern] as nil on player %{public}@ because the vibration identifier is %{public}@.", buf, 0x20u);
      }
      v43 = 0;
    }
    else
    {
      v54 = objc_msgSend((id)objc_opt_class(), "_shouldRepeatVibrationForAlert:externalEnvironmentValues:", v79, *(_WORD *)&self->_externalEnvironmentValues);
      +[TLVibrationManager sharedVibrationManager](TLVibrationManager, "sharedVibrationManager");
      v55 = objc_claimAutoreleasedReturnValue();
      -[NSObject patternForVibrationWithIdentifier:repeating:](v55, "patternForVibrationWithIdentifier:repeating:", v41, v54);
      v43 = (id)objc_claimAutoreleasedReturnValue();
    }

    v39 = 0;
  }

  if (v43)
    goto LABEL_92;
LABEL_95:

LABEL_96:
  objc_msgSend((id)objc_opt_class(), "_audioPlaybackInitiationDelayForAlert:externalEnvironmentValues:", v79, *(_WORD *)&self->_externalEnvironmentValues);
  v66 = v65;
  if (v65 <= 0.00000011920929)
  {
    -[TLAlertQueuePlayerController _initiateAudioPlaybackForStateDescriptor:audioVolumeRampingDuration:](self, "_initiateAudioPlaybackForStateDescriptor:audioVolumeRampingDuration:", v78, *(double *)&v18);
  }
  else
  {
    TLLogPlayback();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      v68 = self->_queuePlayer;
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v68;
      *(_WORD *)&buf[22] = 2048;
      v93 = *(_QWORD *)&v66;
      _os_log_impl(&dword_1D33D5000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startPlayback… hasAlreadyDetected…: Skipping play command on %{public}@ because we need to honor a delay of %f seconds for the initiation of audio playback.", buf, 0x20u);
    }

    objc_initWeak((id *)buf, self);
    v69 = dispatch_time(0, (uint64_t)(v66 * 1000000000.0));
    dispatch_get_global_queue(2, 0);
    v70 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __125__TLAlertQueuePlayerController__startPlaybackForStateDescriptor_usingConfirmedPlayableAsset_hasAlreadyDetectedUserAttention___block_invoke;
    block[3] = &unk_1E952BBD0;
    objc_copyWeak(v87, (id *)buf);
    v86 = v78;
    v87[1] = v18;
    dispatch_after(v69, v70, block);

    objc_destroyWeak(v87);
    objc_destroyWeak((id *)buf);
  }
  objc_msgSend(v79, "playbackObserver");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    dispatch_get_global_queue(0, 0);
    v72 = objc_claimAutoreleasedReturnValue();
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __125__TLAlertQueuePlayerController__startPlaybackForStateDescriptor_usingConfirmedPlayableAsset_hasAlreadyDetectedUserAttention___block_invoke_3;
    v82[3] = &unk_1E952A6A8;
    v83 = v71;
    v84 = v79;
    dispatch_async(v72, v82);

  }
}

void __125__TLAlertQueuePlayerController__startPlaybackForStateDescriptor_usingConfirmedPlayableAsset_hasAlreadyDetectedUserAttention___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  uint64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((_QWORD *)WeakRetained + 1);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __125__TLAlertQueuePlayerController__startPlaybackForStateDescriptor_usingConfirmedPlayableAsset_hasAlreadyDetectedUserAttention___block_invoke_2;
    v5[3] = &unk_1E952AD98;
    v5[4] = WeakRetained;
    v6 = *(id *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v4, "performTaskWithBlock:", v5);

  }
}

uint64_t __125__TLAlertQueuePlayerController__startPlaybackForStateDescriptor_usingConfirmedPlayableAsset_hasAlreadyDetectedUserAttention___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performDelayedAudioPlaybackInitiationForStateDescriptor:audioVolumeRampingDuration:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __125__TLAlertQueuePlayerController__startPlaybackForStateDescriptor_usingConfirmedPlayableAsset_hasAlreadyDetectedUserAttention___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "alertDidBeginPlaying:", *(_QWORD *)(a1 + 40));
}

- (void)_initiateAudioPlaybackForStateDescriptor:(id)a3 audioVolumeRampingDuration:(double)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  AVQueuePlayer *v10;
  AVQueuePlayer *v11;
  double v12;
  AVQueuePlayer *queuePlayer;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BYTE v21[24];
  _QWORD v22[2];
  _QWORD v23[2];
  uint8_t buf[4];
  TLAlertQueuePlayerController *v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  TLLogPlayback();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v25 = self;
    v26 = 2114;
    v27 = *(double *)&v6;
    v28 = 2050;
    v29 = a4;
    _os_log_impl(&dword_1D33D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: -_initiateAudioPlaybackForStateDescriptor:(%{public}@) audioVolumeRampingDuration:(%{public}f).", buf, 0x20u);
  }

  TLLogPlayback();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (a4 <= 0.00000011920929)
  {
    if (v9)
    {
      queuePlayer = self->_queuePlayer;
      *(_DWORD *)buf = 138543618;
      v25 = self;
      v26 = 2114;
      v27 = *(double *)&queuePlayer;
      _os_log_impl(&dword_1D33D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: -_initiateAudioPlayback…: [_queuePlayer play] for %{public}@.", buf, 0x16u);
    }

    -[AVQueuePlayer play](self->_queuePlayer, "play");
    objc_msgSend(v6, "playingAlert");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "type") == 13)
    {
      +[TLCapabilitiesManager sharedCapabilitiesManager](TLCapabilitiesManager, "sharedCapabilitiesManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isInternalInstall");

      if (v16)
      {
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDE8C0]), "initWithReporterID:serviceType:", -[AVAudioSession reporterID](self->_audioSession, "reporterID"), 4);
        v22[0] = CFSTR("alertType");
        NSStringFromTLAlertType(0xDuLL);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22[1] = CFSTR("toneIdentifier");
        v23[0] = v18;
        objc_msgSend(v14, "toneIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v23[1] = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "sendMessage:category:type:", v20, 8, 1);
      }
    }

  }
  else
  {
    if (v9)
    {
      v10 = self->_queuePlayer;
      *(_DWORD *)buf = 138543874;
      v25 = self;
      v26 = 2050;
      v27 = a4;
      v28 = 2114;
      v29 = *(double *)&v10;
      _os_log_impl(&dword_1D33D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: -_initiateAudioPlayback…: [_queuePlayer setRate:withVolumeRampDuration:] with %{public}f for %{public}@.", buf, 0x20u);
    }

    v11 = self->_queuePlayer;
    soft_CMTimeMakeWithSeconds(a4);
    LODWORD(v12) = 1.0;
    -[AVQueuePlayer setRate:withVolumeRampDuration:](v11, "setRate:withVolumeRampDuration:", v21, v12);
  }

}

- (void)_performDelayedAudioPlaybackInitiationForStateDescriptor:(id)a3 audioVolumeRampingDuration:(double)a4
{
  id v6;
  NSObject *v7;
  TLAlertQueuePlayerStateDescriptor *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  TLAlertQueuePlayerController *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  TLLogPlayback();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543874;
    v13 = self;
    v14 = 2114;
    v15 = v6;
    v16 = 2050;
    v17 = a4;
    _os_log_impl(&dword_1D33D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: -_performDelayedAudioPlaybackInitiationForStateDescriptor:(%{public}@) audioVolumeRampingDuration:(%{public}f).", (uint8_t *)&v12, 0x20u);
  }

  os_unfair_lock_lock(&self->_lock);
  v8 = self->_stateDescriptor;
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v6, "playingAlert");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLAlertQueuePlayerStateDescriptor playingAlert](v8, "playingAlert");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == v9)
  {
    -[TLAlertQueuePlayerController _initiateAudioPlaybackForStateDescriptor:audioVolumeRampingDuration:](self, "_initiateAudioPlaybackForStateDescriptor:audioVolumeRampingDuration:", v8, a4);
  }
  else
  {
    TLLogPlayback();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543874;
      v13 = self;
      v14 = 2114;
      v15 = v10;
      v16 = 2114;
      v17 = *(double *)&v9;
      _os_log_impl(&dword_1D33D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: -_performDelayedAudioPlaybackInitiation…: playingAlert (%{public}@) doesn't match with alert with delayed audio playback initiation (%{public}@). Aborting.", (uint8_t *)&v12, 0x20u);
    }

  }
}

- (void)_stopPlaybackForStateDescriptor:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  -[TLAlertQueuePlayerController _stopPlaybackForStateDescriptor:withOptions:playerWasAlreadyPausedExternally:](self, "_stopPlaybackForStateDescriptor:withOptions:playerWasAlreadyPausedExternally:", v5, 0, 0);

}

- (void)_stopPlaybackForStateDescriptor:(id)a3 withOptions:(id)a4 playerWasAlreadyPausedExternally:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  AVQueuePlayer *v9;
  NSObject *v10;
  BOOL isStoppingPlayingAlert;
  NSObject *v12;
  AVQueuePlayer *queuePlayer;
  double v14;
  double v15;
  NSObject *v16;
  AVQueuePlayer *v17;
  AVQueuePlayer *v18;
  double v19;
  NSObject *v20;
  AVQueuePlayer *v21;
  NSObject *v22;
  AVQueuePlayer *v23;
  void *v24;
  NSObject *v25;
  AVQueuePlayer *v26;
  AVAsset *toneAssetForPendingPlayingAlert;
  char v28[24];
  uint8_t buf[4];
  TLAlertQueuePlayerController *v30;
  __int16 v31;
  double v32;
  __int16 v33;
  AVQueuePlayer *v34;
  __int16 v35;
  _BOOL4 v36;
  uint64_t v37;

  v5 = a5;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (AVQueuePlayer *)a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  TLLogPlayback();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v30 = self;
    v31 = 2114;
    v32 = *(double *)&v8;
    v33 = 2114;
    v34 = v9;
    v35 = 1024;
    v36 = v5;
    _os_log_impl(&dword_1D33D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopPlaybackForStateDescriptor:(%{public}@) withOptions:(%{public}@) playerWasAlreadyPausedExternally:(%{BOOL}d).", buf, 0x26u);
  }

  isStoppingPlayingAlert = self->_isStoppingPlayingAlert;
  self->_isStoppingPlayingAlert = 1;
  if (self->_queuePlayer)
  {
    if (v5)
    {
      TLLogPlayback();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        queuePlayer = self->_queuePlayer;
        *(_DWORD *)buf = 138543618;
        v30 = self;
        v31 = 2114;
        v32 = *(double *)&queuePlayer;
        _os_log_impl(&dword_1D33D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopPlaybackFor…: playerWasAlreadyPausedExternally = YES for %{public}@.", buf, 0x16u);
      }

    }
    else if (v9 && (-[AVQueuePlayer fadeOutDuration](v9, "fadeOutDuration"), v15 = v14, v14 > 0.00000011920929))
    {
      TLLogPlayback();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = self->_queuePlayer;
        *(_DWORD *)buf = 138543874;
        v30 = self;
        v31 = 2048;
        v32 = v15;
        v33 = 2114;
        v34 = v17;
        _os_log_impl(&dword_1D33D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopPlaybackFor…: [_queuePlayer setRate:withVolumeRampDuration:] with fadeOutDuration %f for %{public}@.", buf, 0x20u);
      }

      v18 = self->_queuePlayer;
      soft_CMTimeMakeWithSeconds(v15);
      LODWORD(v19) = 0;
      -[AVQueuePlayer setRate:withVolumeRampDuration:](v18, "setRate:withVolumeRampDuration:", v28, v19);
    }
    else
    {
      TLLogPlayback();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = self->_queuePlayer;
        *(_DWORD *)buf = 138543618;
        v30 = self;
        v31 = 2114;
        v32 = *(double *)&v21;
        _os_log_impl(&dword_1D33D5000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopPlaybackFor…: [_queuePlayer pause] for %{public}@.", buf, 0x16u);
      }

      -[AVQueuePlayer pause](self->_queuePlayer, "pause");
    }
    -[TLAlertQueuePlayerController _stopObservingQueuePlayer](self, "_stopObservingQueuePlayer");
    TLLogPlayback();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = self->_queuePlayer;
      *(_DWORD *)buf = 138543618;
      v30 = self;
      v31 = 2114;
      v32 = *(double *)&v23;
      _os_log_impl(&dword_1D33D5000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopPlaybackFor…: [_queuePlayer removeAllItems] for %{public}@.", buf, 0x16u);
    }

    -[AVQueuePlayer removeAllItems](self->_queuePlayer, "removeAllItems");
    -[AVQueuePlayer vibrationPattern](self->_queuePlayer, "vibrationPattern");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      TLLogPlayback();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = self->_queuePlayer;
        *(_DWORD *)buf = 138543618;
        v30 = self;
        v31 = 2114;
        v32 = *(double *)&v26;
        _os_log_impl(&dword_1D33D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopPlaybackFor…: [_queuePlayer setVibrationPattern:nil] for %{public}@.", buf, 0x16u);
      }

      -[AVQueuePlayer setVibrationPattern:](self->_queuePlayer, "setVibrationPattern:", 0);
    }
  }
  -[TLAlertQueuePlayerController _didEndPlayingAlertForStateDescriptor:](self, "_didEndPlayingAlertForStateDescriptor:", v8);
  toneAssetForPendingPlayingAlert = self->_toneAssetForPendingPlayingAlert;
  self->_toneAssetForPendingPlayingAlert = 0;

  self->_hasToneAssetForPendingPlayingAlert = 0;
  self->_isStoppingPlayingAlert = isStoppingPlayingAlert;

}

- (void)_willBeginPlayingAlertForStateDescriptor:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  TLAlertQueuePlayerController *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  TLLogPlayback();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_1D33D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: -_willBeginPlayingAlertForStateDescriptor:(%{public}@).", (uint8_t *)&v9, 0x16u);
  }

  if (objc_msgSend(v4, "isAlertActivationAssertionAcquired"))
  {
    TLLogPlayback();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "alertForAudioEnvironmentSetup");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "playingAlert");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543874;
      v10 = self;
      v11 = 2114;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_1D33D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_willBeginPlaying…: Alert activation assertion acquired for %{public}@. Skipping audio environment preparation steps for %{public}@.", (uint8_t *)&v9, 0x20u);

    }
  }
  else
  {
    -[TLAlertQueuePlayerController _prepareAudioEnvironmentForStateDescriptor:](self, "_prepareAudioEnvironmentForStateDescriptor:", v4);
  }

}

- (void)_didEndPlayingAlertForStateDescriptor:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  TLAlertQueuePlayerController *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  TLLogPlayback();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_1D33D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didEndPlayingAlertForStateDescriptor:(%{public}@).", (uint8_t *)&v9, 0x16u);
  }

  if (objc_msgSend(v4, "isAlertActivationAssertionAcquired"))
  {
    TLLogPlayback();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "alertForAudioEnvironmentSetup");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "playingAlert");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543874;
      v10 = self;
      v11 = 2114;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_1D33D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didEndPlaying…: Alert activation assertion acquired for %{public}@. Skipping audio environment restoration steps for playing alert: %{public}@.", (uint8_t *)&v9, 0x20u);

    }
  }
  else
  {
    -[TLAlertQueuePlayerController _restoreAudioEnvironmentForStateDescriptor:](self, "_restoreAudioEnvironmentForStateDescriptor:", v4);
  }

}

- (void)_prepareAudioEnvironmentForStateDescriptor:(id)a3
{
  double v4;
  double v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  AVAudioSession *audioSession;
  NSObject *v10;
  AVAudioSession *v11;
  AVAudioSession *v12;
  NSObject *v13;
  AVAudioSession *v14;
  AVAudioSession *v15;
  AVAudioSession *v16;
  AVAudioSession *v17;
  double v18;
  uint64_t v19;
  void *v20;
  double v21;
  unint64_t v22;
  void *v23;
  void *v24;
  AVAudioSession *v25;
  _BOOL4 v26;
  id v27;
  _BOOL4 v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  AVAudioSession *v32;
  const __CFString *v33;
  void *v34;
  NSObject *v35;
  AVAudioSession *v36;
  BOOL v37;
  NSObject *v38;
  NSObject *v39;
  AVAudioSession *v40;
  AVAudioSession *v41;
  int v42;
  id v43;
  int v44;
  NSObject *v45;
  AVAudioSession *v46;
  void *v47;
  int v48;
  AVAudioSession *v49;
  int v50;
  id v51;
  int v52;
  NSObject *v53;
  AVAudioSession *v54;
  AVAudioSession *v55;
  double v56;
  int v57;
  id v58;
  int v59;
  NSObject *v60;
  AVAudioSession *v61;
  int v62;
  int v63;
  double v64;
  double v65;
  int v66;
  NSCopying *attentionPollingToken;
  void *v68;
  NSCopying *v69;
  NSCopying *v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  NSObject *v75;
  unint64_t v76;
  unsigned int v77;
  TLAttentionAwarenessEffectCoordinator *v78;
  TLAttentionAwarenessEffectCoordinator *effectCoordinator;
  NSObject *v80;
  uint64_t v81;
  const char *v82;
  const __CFString *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  AVAudioSession *v87;
  void *v88;
  AVAudioSession *v89;
  void *v90;
  AVAudioSession *v91;
  void *v92;
  const __CFString *v93;
  AVAudioSession *v94;
  const char *v95;
  AVAudioSession *v96;
  __CFString *v97;
  float v98;
  _QWORD v99[4];
  id v100;
  id v101;
  id location;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  uint8_t buf[4];
  TLAlertQueuePlayerController *v109;
  __int16 v110;
  double v111;
  __int16 v112;
  double v113;
  __int16 v114;
  _BYTE v115[24];
  __int16 v116;
  double v117;
  __int16 v118;
  uint64_t v119;
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v4 = COERCE_DOUBLE(a3);
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  objc_msgSend(*(id *)&v4, "alertForAudioEnvironmentSetup");
  v5 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  TLLogPlayback();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v109 = self;
    v110 = 2114;
    v111 = v4;
    v112 = 2114;
    v113 = v5;
    _os_log_impl(&dword_1D33D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareAudioEnvironmentForStateDescriptor:(%{public}@). alertForAudioEnvironmentSetup = %{public}@", buf, 0x20u);
  }

  self->_externalEnvironmentValues = ($1778A69A063EB5A9373FEA3F0DAED699)objc_msgSend((id)objc_opt_class(), "_externalEnvironmentValuesForAlert:", *(_QWORD *)&v5);
  if (self->_audioSession)
  {
    TLLogPlayback();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(double *)&v8 = COERCE_DOUBLE("auxiliary");
      audioSession = self->_audioSession;
      if (!self->_isUsingAuxiliaryAudioSession)
        *(double *)&v8 = COERCE_DOUBLE("shared");
      *(_DWORD *)buf = 138544130;
      v109 = self;
      v110 = 2082;
      v111 = *(double *)&v8;
      v112 = 2114;
      v113 = *(double *)&audioSession;
      v114 = 2114;
      *(double *)v115 = v5;
      _os_log_impl(&dword_1D33D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareAudioEnvironment. Using previous %{public}s audio session %{public}@ for %{public}@.", buf, 0x2Au);
    }

    TLLogPlayback();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v109 = self;
      _os_log_impl(&dword_1D33D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareAudioEnvironment. We are most likely about to being playing an alert which interrupted one that was already playing, and which was stopped while preventing the deactivation of the audio session.", buf, 0xCu);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (!objc_msgSend((id)objc_opt_class(), "_shouldUseAuxiliaryAudioSessionForAlert:", *(_QWORD *)&v5))
  {
    self->_isUsingAuxiliaryAudioSession = 0;
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v15 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();
    v16 = self->_audioSession;
    self->_audioSession = v15;

    TLLogPlayback();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_audioSession;
      *(_DWORD *)buf = 138543874;
      v109 = self;
      v110 = 2114;
      v111 = *(double *)&v17;
      v112 = 2114;
      v113 = v5;
      _os_log_impl(&dword_1D33D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareAudioEnvironment…: Using shared audio session %{public}@ for %{public}@.", buf, 0x20u);
    }
    goto LABEL_17;
  }
  self->_isUsingAuxiliaryAudioSession = 1;
  objc_msgSend(MEMORY[0x1E0C89AE8], "auxiliarySession");
  v11 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();
  v12 = self->_audioSession;
  self->_audioSession = v11;

  -[AVQueuePlayer setAudioSession:](self->_queuePlayer, "setAudioSession:", self->_audioSession);
  TLLogPlayback();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = self->_audioSession;
    *(_DWORD *)buf = 138543874;
    v109 = self;
    v110 = 2114;
    v111 = *(double *)&v14;
    v112 = 2114;
    v113 = v5;
    _os_log_impl(&dword_1D33D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareAudioEnvironment…: Using auxiliary audio session %{public}@ for %{public}@.", buf, 0x20u);
  }

  -[TLAlertQueuePlayerController _resetFlagsForSwitchingAuxiliaryAudioSession](self, "_resetFlagsForSwitchingAuxiliaryAudioSession");
LABEL_18:
  objc_msgSend((id)objc_opt_class(), "_audioCategoryForAlert:externalEnvironmentValues:", *(_QWORD *)&v5, *(_WORD *)&self->_externalEnvironmentValues);
  v18 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  v19 = objc_msgSend((id)objc_opt_class(), "_audioCategoryOptionsForAlert:externalEnvironmentValues:", *(_QWORD *)&v5, *(_WORD *)&self->_externalEnvironmentValues);
  objc_msgSend((id)objc_opt_class(), "_audioModeForAlert:audioCategory:", *(_QWORD *)&v5, *(_QWORD *)&v18);
  v97 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)&v18, "length"))
  {
    -[AVAudioSession category](self->_audioSession, "category");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = COERCE_DOUBLE(objc_msgSend(v20, "copy"));

    v22 = -[AVAudioSession categoryOptions](self->_audioSession, "categoryOptions");
    -[AVAudioSession mode](self->_audioSession, "mode");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "copy");

    v25 = self->_audioSession;
    v107 = 0;
    v26 = -[AVAudioSession setCategory:mode:options:error:](v25, "setCategory:mode:options:error:", *(_QWORD *)&v18, v97, v19, &v107);
    v27 = v107;
    if (v27)
      v28 = 0;
    else
      v28 = v26;
    if (v28)
    {
      objc_storeStrong((id *)&self->_previousAudioCategory, *(id *)&v21);
      self->_previousAudioCategoryOptions = v22;
      objc_storeStrong((id *)&self->_previousAudioMode, v24);
      TLLogPlayback();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        if (-[__CFString length](v97, "length"))
          v30 = " with mode ";
        else
          v30 = "";
        v31 = -[__CFString length](v97, "length");
        v32 = self->_audioSession;
        v33 = &stru_1E952DE48;
        if (v31)
          v33 = v97;
        *(_DWORD *)buf = 138544898;
        v109 = self;
        v110 = 2114;
        v111 = v18;
        v112 = 2082;
        v113 = *(double *)&v30;
        v114 = 2114;
        *(_QWORD *)v115 = v33;
        *(_WORD *)&v115[8] = 1024;
        *(_DWORD *)&v115[10] = v19;
        *(_WORD *)&v115[14] = 2114;
        *(_QWORD *)&v115[16] = v32;
        v116 = 2114;
        v117 = v5;
        _os_log_impl(&dword_1D33D5000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareAudioEnvironment…: Successfully set audio category to %{public}@%{public}s%{public}@ and options 0x%x on audio session %{public}@ for %{public}@.", buf, 0x44u);
      }
    }
    else
    {
      v34 = v27;
      TLLogPlayback();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v81 = -[__CFString length](v97, "length");
        v82 = " with mode ";
        if (!v81)
          v82 = "";
        v95 = v82;
        if (-[__CFString length](v97, "length"))
          v83 = v97;
        else
          v83 = &stru_1E952DE48;
        v93 = v83;
        v94 = self->_audioSession;
        objc_msgSend(v34, "tl_nonRedundantDescription");
        v84 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138545154;
        v109 = self;
        v110 = 2114;
        v111 = v18;
        v112 = 2082;
        v113 = *(double *)&v95;
        v114 = 2114;
        *(_QWORD *)v115 = v93;
        *(_WORD *)&v115[8] = 1024;
        *(_DWORD *)&v115[10] = v19;
        *(_WORD *)&v115[14] = 2114;
        *(_QWORD *)&v115[16] = v94;
        v116 = 2114;
        v117 = v5;
        v118 = 2114;
        v85 = (void *)v84;
        v119 = v84;
        _os_log_error_impl(&dword_1D33D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@: -_prepareAudioEnvironment…: Failed setting audio category to %{public}@%{public}s%{public}@ and options 0x%x on audio session %{public}@ for %{public}@ with error: %{public}@.", buf, 0x4Eu);

      }
      v36 = self->_audioSession;
      v106 = v34;
      v37 = -[AVAudioSession setCategory:mode:options:error:](v36, "setCategory:mode:options:error:", *(_QWORD *)&v21, v24, v22, &v106);
      v29 = v106;

      if (v29)
        v37 = 0;
      TLLogPlayback();
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v37)
      {
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v40 = self->_audioSession;
          *(_DWORD *)buf = 138544386;
          v109 = self;
          v110 = 2114;
          v111 = v21;
          v112 = 2114;
          v113 = *(double *)&v24;
          v114 = 1024;
          *(_DWORD *)v115 = v22;
          *(_WORD *)&v115[4] = 2114;
          *(_QWORD *)&v115[6] = v40;
          _os_log_impl(&dword_1D33D5000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareAudioEnvironment…: Successfully reverted audio category back to %{public}@ with mode %{public}@ and options 0x%x on audio session %{public}@.", buf, 0x30u);
        }
        v29 = v39;
      }
      else
      {
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v96 = self->_audioSession;
          -[NSObject tl_nonRedundantDescription](v29, "tl_nonRedundantDescription");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v109 = self;
          v110 = 2114;
          v111 = v21;
          v112 = 2114;
          v113 = *(double *)&v24;
          v114 = 1024;
          *(_DWORD *)v115 = v22;
          *(_WORD *)&v115[4] = 2114;
          *(_QWORD *)&v115[6] = v96;
          *(_WORD *)&v115[14] = 2114;
          *(_QWORD *)&v115[16] = v86;
          _os_log_error_impl(&dword_1D33D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@: -_prepareAudioEnvironment…: Failed reverting audio category back to %{public}@ with mode %{public}@ and options 0x%x on audio session %{public}@ with error: %{public}@.", buf, 0x3Au);

        }
      }
    }

  }
  if (objc_msgSend((id)objc_opt_class(), "_shouldBypassRingerSwitchPolicyForAlert:", *(_QWORD *)&v5)
    && !self->_isBypassingRingerSwitchPolicy)
  {
    v41 = self->_audioSession;
    v105 = 0;
    v42 = -[AVAudioSession setBypassRingerSwitchPolicy:error:](v41, "setBypassRingerSwitchPolicy:error:", 1, &v105);
    v43 = v105;
    if (v43)
      v44 = 0;
    else
      v44 = v42;
    if (v44 == 1)
    {
      self->_isBypassingRingerSwitchPolicy = 1;
      TLLogPlayback();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = self->_audioSession;
        *(_DWORD *)buf = 138543874;
        v109 = self;
        v110 = 2114;
        v111 = *(double *)&v46;
        v112 = 2114;
        v113 = v5;
        _os_log_impl(&dword_1D33D5000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareAudioEnvironment…: Successfully bypassed ringer switch policy on audio session %{public}@ for %{public}@.", buf, 0x20u);
      }
    }
    else
    {
      TLLogPlayback();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v87 = self->_audioSession;
        objc_msgSend(v43, "tl_nonRedundantDescription");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v109 = self;
        v110 = 2114;
        v111 = *(double *)&v87;
        v112 = 2114;
        v113 = v5;
        v114 = 2114;
        *(_QWORD *)v115 = v88;
        _os_log_error_impl(&dword_1D33D5000, v45, OS_LOG_TYPE_ERROR, "%{public}@: -_prepareAudioEnvironment…: Failed bypassing ringer switch policy on audio session %{public}@ for %{public}@ with error: %{public}@.", buf, 0x2Au);

      }
    }

  }
  objc_msgSend(*(id *)&v5, "configuration");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "shouldIgnoreAccessibilityDisabledVibrationSetting");

  if (v48 && !self->_isIgnoringAccessibilityDisabledVibrationSetting)
  {
    v49 = self->_audioSession;
    v104 = 0;
    v50 = -[AVAudioSession setPrefersToVibeWhenVibrationsAreDisabled:error:](v49, "setPrefersToVibeWhenVibrationsAreDisabled:error:", 1, &v104);
    v51 = v104;
    if (v51)
      v52 = 0;
    else
      v52 = v50;
    if (v52 == 1)
    {
      self->_isIgnoringAccessibilityDisabledVibrationSetting = 1;
      TLLogPlayback();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v54 = self->_audioSession;
        *(_DWORD *)buf = 138543874;
        v109 = self;
        v110 = 2114;
        v111 = *(double *)&v54;
        v112 = 2114;
        v113 = v5;
        _os_log_impl(&dword_1D33D5000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareAudioEnvironment…: Successfully set prefersToVibeWhenVibrationsAreDisabled to YES on audio session %{public}@ for %{public}@.", buf, 0x20u);
      }
    }
    else
    {
      TLLogPlayback();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        v89 = self->_audioSession;
        objc_msgSend(v51, "tl_nonRedundantDescription");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v109 = self;
        v110 = 2114;
        v111 = *(double *)&v89;
        v112 = 2114;
        v113 = v5;
        v114 = 2114;
        *(_QWORD *)v115 = v90;
        _os_log_error_impl(&dword_1D33D5000, v53, OS_LOG_TYPE_ERROR, "%{public}@: -_prepareAudioEnvironment…: Failed setting prefersToVibeWhenVibrationsAreDisabled to YES on audio session %{public}@ for %{public}@ with error: %{public}@.", buf, 0x2Au);

      }
    }

  }
  if (objc_msgSend((id)objc_opt_class(), "_prefersToPlayDuringWombatForAlert:", *(_QWORD *)&v5)
    && !self->_prefersToPlayDuringWombat)
  {
    v55 = self->_audioSession;
    v56 = *MEMORY[0x1E0D49B80];
    v103 = 0;
    v57 = -[AVAudioSession setMXSessionProperty:value:error:](v55, "setMXSessionProperty:value:error:", *(_QWORD *)&v56, MEMORY[0x1E0C9AAB0], &v103);
    v58 = v103;
    if (v58)
      v59 = 0;
    else
      v59 = v57;
    if (v59 == 1)
    {
      self->_prefersToPlayDuringWombat = 1;
      TLLogPlayback();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = self->_audioSession;
        *(_DWORD *)buf = 138544130;
        v109 = self;
        v110 = 2114;
        v111 = v56;
        v112 = 2114;
        v113 = *(double *)&v61;
        v114 = 2114;
        *(double *)v115 = v5;
        _os_log_impl(&dword_1D33D5000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareAudioEnvironment…: Successfully set MXSessionProperty %{public}@ to YES on audio session %{public}@ for %{public}@.", buf, 0x2Au);
      }
    }
    else
    {
      TLLogPlayback();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        v91 = self->_audioSession;
        objc_msgSend(v58, "tl_nonRedundantDescription");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v109 = self;
        v110 = 2114;
        v111 = v56;
        v112 = 2114;
        v113 = *(double *)&v91;
        v114 = 2114;
        *(double *)v115 = v5;
        *(_WORD *)&v115[8] = 2114;
        *(_QWORD *)&v115[10] = v92;
        _os_log_error_impl(&dword_1D33D5000, v60, OS_LOG_TYPE_ERROR, "%{public}@: -_prepareAudioEnvironment…: Failed setting MXSessionProperty %{public}@ to YES on audio session %{public}@ for %{public}@ with error: %{public}@.", buf, 0x34u);

      }
    }

  }
  -[TLAlertQueuePlayerController _audioVolumeForAlert:audioCategory:](self, "_audioVolumeForAlert:audioCategory:", *(_QWORD *)&v5, *(_QWORD *)&v18);
  v63 = v62;
  if (objc_msgSend((id)objc_opt_class(), "_audioVolumeApplicationPolicyForAlert:externalEnvironmentValues:", *(_QWORD *)&v5, *(_WORD *)&self->_externalEnvironmentValues) == 3)
  {
    -[TLAlertQueuePlayerController _activateAudioSessionIfNeededForStateDescriptor:](self, "_activateAudioSessionIfNeededForStateDescriptor:", *(_QWORD *)&v4);
    LODWORD(v65) = v63;
    -[TLAlertQueuePlayerController _applyAudioVolume:forAlert:](self, "_applyAudioVolume:forAlert:", *(_QWORD *)&v5, v65);
  }
  else
  {
    LODWORD(v64) = v63;
    -[TLAlertQueuePlayerController _applyAudioVolume:forAlert:](self, "_applyAudioVolume:forAlert:", *(_QWORD *)&v5, v64);
    -[TLAlertQueuePlayerController _activateAudioSessionIfNeededForStateDescriptor:](self, "_activateAudioSessionIfNeededForStateDescriptor:", *(_QWORD *)&v4);
  }
  v66 = objc_msgSend((id)objc_opt_class(), "_shouldApplyAttentionAwarenessEffectsForAlert:", *(_QWORD *)&v5);
  attentionPollingToken = self->_attentionPollingToken;
  if (v66)
  {
    if (!attentionPollingToken)
    {
      objc_initWeak(&location, self);
      +[TLAttentionAwarenessObserver sharedAttentionAwarenessObserver](TLAttentionAwarenessObserver, "sharedAttentionAwarenessObserver");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v99[0] = MEMORY[0x1E0C809B0];
      v99[1] = 3221225472;
      v99[2] = __75__TLAlertQueuePlayerController__prepareAudioEnvironmentForStateDescriptor___block_invoke;
      v99[3] = &unk_1E952BBF8;
      objc_copyWeak(&v101, &location);
      v100 = *(id *)&v4;
      objc_msgSend(v68, "pollForAttentionWithEventHandler:", v99);
      v69 = (NSCopying *)objc_claimAutoreleasedReturnValue();
      v70 = self->_attentionPollingToken;
      self->_attentionPollingToken = v69;

      objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAudioSession category](self->_audioSession, "category");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_mediaExperienceAudioCategoryForAudioSessionCategory:", v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = 0.0;
      v74 = objc_msgSend(v71, "getVolume:forCategory:", &v98, v73);
      TLLogPlayback();
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544386;
        v109 = self;
        v110 = 2048;
        v111 = v98;
        v112 = 2114;
        v113 = *(double *)&v73;
        v114 = 2114;
        *(_QWORD *)v115 = v72;
        *(_WORD *)&v115[8] = 1024;
        *(_DWORD *)&v115[10] = v74;
        _os_log_impl(&dword_1D33D5000, v75, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareAudioEnvironment…: Retrieved existing audio volume %f for MediaExperience audio category %{public}@ (active audio session category: %{public}@); did succeed: %{BOOL}d.",
          buf,
          0x30u);
      }

      v76 = TLAttentionAwarenessEffectParametersMake(v98);
      v78 = -[TLAttentionAwarenessEffectCoordinator initWithEffectParameters:audioSession:]([TLAttentionAwarenessEffectCoordinator alloc], "initWithEffectParameters:audioSession:", v76, v77, self->_audioSession);
      effectCoordinator = self->_effectCoordinator;
      self->_effectCoordinator = v78;

      objc_destroyWeak(&v101);
      objc_destroyWeak(&location);
    }
  }
  else if (!attentionPollingToken)
  {
    TLLogPlayback();
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v109 = self;
      v110 = 2114;
      v111 = v5;
      _os_log_impl(&dword_1D33D5000, v80, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareAudioEnvironment…: Skipping attention awareness effects for %{public}@.", buf, 0x16u);
    }

  }
  self->_isAudioEnvironmentSetup = 1;

}

void __75__TLAlertQueuePlayerController__prepareAudioEnvironmentForStateDescriptor___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((_QWORD *)WeakRetained + 1);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __75__TLAlertQueuePlayerController__prepareAudioEnvironmentForStateDescriptor___block_invoke_2;
    v7[3] = &unk_1E952AD98;
    v7[4] = WeakRetained;
    v9 = a2;
    v8 = *(id *)(a1 + 32);
    objc_msgSend(v6, "performTaskWithBlock:", v7);

  }
}

uint64_t __75__TLAlertQueuePlayerController__prepareAudioEnvironmentForStateDescriptor___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveAttentionPollingEventOfType:stateDescriptor:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_restoreAudioEnvironmentForStateDescriptor:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSCopying *v7;
  NSCopying *attentionPollingToken;
  void *v9;
  TLAttentionAwarenessEffectCoordinator *effectCoordinator;
  _BOOL4 isAudioSessionActive;
  _BOOL4 v12;
  AVQueuePlayer *queuePlayer;
  double v14;
  NSObject *v15;
  AVQueuePlayer *v16;
  AVAudioSession *audioSession;
  void *v18;
  int v19;
  id v20;
  void *v21;
  NSObject *v22;
  AVAudioSession *v23;
  AVAudioSession *v24;
  int v25;
  id v26;
  void *v27;
  NSObject *v28;
  AVAudioSession *v29;
  AVAudioSession *v30;
  int v31;
  id v32;
  void *v33;
  NSObject *v34;
  AVAudioSession *v35;
  NSCopying *v36;
  void *v37;
  _BOOL4 v38;
  NSString *v39;
  unint64_t previousAudioCategoryOptions;
  NSString *v41;
  AVAudioSession *v42;
  _BOOL4 v43;
  id v44;
  NSString *previousAudioCategory;
  NSString *previousAudioMode;
  NSObject *v47;
  NSObject *v48;
  AVAudioSession *v49;
  AVAudioSession *v50;
  const char *v51;
  AVAudioSession *v52;
  _BOOL4 isUsingAuxiliaryAudioSession;
  AVAudioSession *v54;
  NSObject *v55;
  const char *v56;
  NSObject *v57;
  AVAudioSession *v58;
  void *v59;
  AVAudioSession *v60;
  void *v61;
  AVAudioSession *v62;
  void *v63;
  void *v64;
  AVAudioSession *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  uint8_t buf[4];
  TLAlertQueuePlayerController *v72;
  __int16 v73;
  id v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  _BYTE v78[24];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  objc_msgSend(v4, "alertForAudioEnvironmentSetup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TLLogPlayback();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v72 = self;
    v73 = 2114;
    v74 = v4;
    _os_log_impl(&dword_1D33D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_restoreAudioEnvironmentForStateDescriptor:(%{public}@).", buf, 0x16u);
  }

  self->_isAudioEnvironmentSetup = 0;
  v7 = self->_attentionPollingToken;
  attentionPollingToken = self->_attentionPollingToken;
  self->_attentionPollingToken = 0;

  if (v7)
  {
    +[TLAttentionAwarenessObserver sharedAttentionAwarenessObserver](TLAttentionAwarenessObserver, "sharedAttentionAwarenessObserver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cancelPollForAttentionWithToken:", v7);

  }
  self->_isAttentionAwarenessSubsystemFullyInitialized = 0;
  self->_lastAttentionPollingEventType = 0;
  effectCoordinator = self->_effectCoordinator;
  self->_effectCoordinator = 0;

  isAudioSessionActive = self->_isAudioSessionActive;
  -[TLAlertQueuePlayerController _deactivateAudioSessionIfNeededForStateDescriptor:](self, "_deactivateAudioSessionIfNeededForStateDescriptor:", v4);
  v12 = isAudioSessionActive && !self->_isAudioSessionActive;
  queuePlayer = self->_queuePlayer;
  if (queuePlayer)
  {
    -[AVQueuePlayer volume](queuePlayer, "volume");
    if (fabsf(*(float *)&v14 + -1.0) > 0.00000011921)
    {
      LODWORD(v14) = 1.0;
      -[AVQueuePlayer setVolume:](self->_queuePlayer, "setVolume:", v14);
      TLLogPlayback();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = self->_queuePlayer;
        *(_DWORD *)buf = 138544130;
        v72 = self;
        v73 = 2114;
        v74 = v16;
        v75 = 2048;
        v76 = 0x3FF0000000000000;
        v77 = 2114;
        *(_QWORD *)v78 = v5;
        _os_log_impl(&dword_1D33D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: -_restoreAudioEnvironment…: Reverted volume of %{public}@ to %f for %{public}@.", buf, 0x2Au);
      }

    }
  }
  if (self->_prefersToPlayDuringWombat)
  {
    audioSession = self->_audioSession;
    v18 = (void *)*MEMORY[0x1E0D49B80];
    v70 = 0;
    v19 = -[AVAudioSession setMXSessionProperty:value:error:](audioSession, "setMXSessionProperty:value:error:", v18, MEMORY[0x1E0C9AAA0], &v70);
    v20 = v70;
    v21 = v20;
    if (!v19 || v20)
    {
      TLLogPlayback();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v58 = self->_audioSession;
        objc_msgSend(v21, "tl_nonRedundantDescription");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v72 = self;
        v73 = 2114;
        v74 = v18;
        v75 = 2114;
        v76 = (uint64_t)v58;
        v77 = 2114;
        *(_QWORD *)v78 = v5;
        *(_WORD *)&v78[8] = 2114;
        *(_QWORD *)&v78[10] = v59;
        _os_log_error_impl(&dword_1D33D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@: -_restoreAudioEnvironment…: Failed setting MXSessionProperty %{public}@ to YES on audio session %{public}@ for %{public}@ with error: %{public}@.", buf, 0x34u);

      }
    }
    else
    {
      self->_prefersToPlayDuringWombat = 0;
      TLLogPlayback();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = self->_audioSession;
        *(_DWORD *)buf = 138544130;
        v72 = self;
        v73 = 2114;
        v74 = v18;
        v75 = 2114;
        v76 = (uint64_t)v23;
        v77 = 2114;
        *(_QWORD *)v78 = v5;
        _os_log_impl(&dword_1D33D5000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: -_restoreAudioEnvironment…: Successfully set MXSessionProperty %{public}@ to NO on audio session %{public}@ for %{public}@.", buf, 0x2Au);
      }
    }

  }
  if (self->_isIgnoringAccessibilityDisabledVibrationSetting)
  {
    v24 = self->_audioSession;
    v69 = 0;
    v25 = -[AVAudioSession setPrefersToVibeWhenVibrationsAreDisabled:error:](v24, "setPrefersToVibeWhenVibrationsAreDisabled:error:", 0, &v69);
    v26 = v69;
    v27 = v26;
    if (!v25 || v26)
    {
      TLLogPlayback();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v60 = self->_audioSession;
        objc_msgSend(v27, "tl_nonRedundantDescription");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v72 = self;
        v73 = 2114;
        v74 = v60;
        v75 = 2114;
        v76 = (uint64_t)v5;
        v77 = 2114;
        *(_QWORD *)v78 = v61;
        _os_log_error_impl(&dword_1D33D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@: -_restoreAudioEnvironment…: Failed setting prefersToVibeWhenVibrationsAreDisabled to NO on audio session %{public}@ for %{public}@ with error: %{public}@.", buf, 0x2Au);

      }
    }
    else
    {
      self->_isIgnoringAccessibilityDisabledVibrationSetting = 0;
      TLLogPlayback();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = self->_audioSession;
        *(_DWORD *)buf = 138543874;
        v72 = self;
        v73 = 2114;
        v74 = v29;
        v75 = 2114;
        v76 = (uint64_t)v5;
        _os_log_impl(&dword_1D33D5000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: -_restoreAudioEnvironment…: Successfully set prefersToVibeWhenVibrationsAreDisabled to NO on audio session %{public}@ for %{public}@.", buf, 0x20u);
      }
    }

  }
  if (self->_isBypassingRingerSwitchPolicy)
  {
    v30 = self->_audioSession;
    v68 = 0;
    v31 = -[AVAudioSession setBypassRingerSwitchPolicy:error:](v30, "setBypassRingerSwitchPolicy:error:", 0, &v68);
    v32 = v68;
    v33 = v32;
    if (!v31 || v32)
    {
      TLLogPlayback();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v62 = self->_audioSession;
        objc_msgSend(v33, "tl_nonRedundantDescription");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v72 = self;
        v73 = 2114;
        v74 = v62;
        v75 = 2114;
        v76 = (uint64_t)v5;
        v77 = 2114;
        *(_QWORD *)v78 = v63;
        _os_log_error_impl(&dword_1D33D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@: -_restoreAudioEnvironment…: Failed to stop bypassing ringer switch policy on audio session %{public}@ for %{public}@ with error: %{public}@.", buf, 0x2Au);

      }
    }
    else
    {
      self->_isBypassingRingerSwitchPolicy = 0;
      TLLogPlayback();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = self->_audioSession;
        *(_DWORD *)buf = 138543874;
        v72 = self;
        v73 = 2114;
        v74 = v35;
        v75 = 2114;
        v76 = (uint64_t)v5;
        _os_log_impl(&dword_1D33D5000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: -_restoreAudioEnvironment…: Successfully stopped bypassing ringer switch policy on audio session %{public}@ for %{public}@.", buf, 0x20u);
      }
    }

  }
  if (-[NSString length](self->_previousAudioCategory, "length"))
  {
    v66 = v4;
    v36 = v7;
    v37 = v5;
    v38 = v12;
    v39 = self->_previousAudioCategory;
    previousAudioCategoryOptions = self->_previousAudioCategoryOptions;
    v41 = self->_previousAudioMode;
    v42 = self->_audioSession;
    v67 = 0;
    v43 = -[AVAudioSession setCategory:mode:options:error:](v42, "setCategory:mode:options:error:", v39, v41, previousAudioCategoryOptions, &v67);
    v44 = v67;
    previousAudioCategory = self->_previousAudioCategory;
    self->_previousAudioCategory = 0;

    previousAudioMode = self->_previousAudioMode;
    self->_previousAudioCategoryOptions = 0;
    self->_previousAudioMode = 0;

    TLLogPlayback();
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (!v43 || v44)
    {
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v65 = self->_audioSession;
        objc_msgSend(v44, "tl_nonRedundantDescription");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v72 = self;
        v73 = 2114;
        v74 = v39;
        v75 = 2114;
        v76 = (uint64_t)v41;
        v77 = 1024;
        *(_DWORD *)v78 = previousAudioCategoryOptions;
        *(_WORD *)&v78[4] = 2114;
        *(_QWORD *)&v78[6] = v65;
        *(_WORD *)&v78[14] = 2114;
        *(_QWORD *)&v78[16] = v64;
        _os_log_error_impl(&dword_1D33D5000, v48, OS_LOG_TYPE_ERROR, "%{public}@: -_restoreAudioEnvironment…: Failed reverting audio category back to %{public}@ with mode %{public}@ and options 0x%x on audio session %{public}@ with error: %{public}@.", buf, 0x3Au);

      }
    }
    else if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v49 = self->_audioSession;
      *(_DWORD *)buf = 138544386;
      v72 = self;
      v73 = 2114;
      v74 = v39;
      v75 = 2114;
      v76 = (uint64_t)v41;
      v77 = 1024;
      *(_DWORD *)v78 = previousAudioCategoryOptions;
      *(_WORD *)&v78[4] = 2114;
      *(_QWORD *)&v78[6] = v49;
      _os_log_impl(&dword_1D33D5000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@: -_restoreAudioEnvironment…: Successfully reverted audio category back to %{public}@ with mode %{public}@ and options 0x%x on audio session %{public}@.", buf, 0x30u);
    }

    v12 = v38;
    v5 = v37;
    v7 = v36;
    v4 = v66;
  }
  if (self->_audioSession)
  {
    if (-[TLAlertQueuePlayerController _isPreventingAudioSessionDeactivation](self, "_isPreventingAudioSessionDeactivation"))
    {
      TLLogPlayback();
      v50 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v50->super, OS_LOG_TYPE_DEFAULT))
      {
        v51 = "auxiliary";
        v52 = self->_audioSession;
        if (!self->_isUsingAuxiliaryAudioSession)
          v51 = "shared";
        *(_DWORD *)buf = 138543874;
        v72 = self;
        v73 = 2082;
        v74 = (id)v51;
        v75 = 2114;
        v76 = (uint64_t)v52;
        _os_log_impl(&dword_1D33D5000, &v50->super, OS_LOG_TYPE_DEFAULT, "%{public}@: -_restoreAudioEnvironment…: Currently preventing audio session deactivation. Hence, not clearing %{public}s audio session %{public}@.", buf, 0x20u);
      }
    }
    else
    {
      isUsingAuxiliaryAudioSession = self->_isUsingAuxiliaryAudioSession;
      v50 = self->_audioSession;
      if (self->_isUsingAuxiliaryAudioSession)
      {
        -[TLAlertQueuePlayerController _resetFlagsForSwitchingAuxiliaryAudioSession](self, "_resetFlagsForSwitchingAuxiliaryAudioSession");
        -[TLAlertQueuePlayerController _destroyQueuePlayerForStateDescriptor:](self, "_destroyQueuePlayerForStateDescriptor:", v4);
        self->_isUsingAuxiliaryAudioSession = 0;
      }
      v54 = self->_audioSession;
      self->_audioSession = 0;

      TLLogPlayback();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v56 = "auxiliary";
        *(_DWORD *)buf = 138543874;
        v72 = self;
        if (!isUsingAuxiliaryAudioSession)
          v56 = "shared";
        v73 = 2082;
        v74 = (id)v56;
        v75 = 2114;
        v76 = (uint64_t)v50;
        _os_log_impl(&dword_1D33D5000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@: -_restoreAudioEnvironment…: Cleared %{public}s audio session %{public}@.", buf, 0x20u);
      }

    }
  }
  self->_externalEnvironmentValues = 0;
  if (v12)
  {
    -[TLAlertQueuePlayerController _resetClientPriorityForStateDescriptor:](self, "_resetClientPriorityForStateDescriptor:", v4);
  }
  else
  {
    TLLogPlayback();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v72 = self;
      _os_log_impl(&dword_1D33D5000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@: -_restoreAudioEnvironment…: Skipping reset client priority because the audio session was not just deactivated.", buf, 0xCu);
    }

  }
  -[TLAlertQueuePlayerController _destroyQueuePlayerForStateDescriptor:](self, "_destroyQueuePlayerForStateDescriptor:", v4);

}

- (void)_resetClientPriorityForStateDescriptor:(id)a3
{
  id v4;
  AVQueuePlayer *queuePlayer;
  NSObject *v6;
  AVQueuePlayer *v7;
  void *v8;
  int v9;
  TLAlertQueuePlayerController *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  AVQueuePlayer *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  queuePlayer = self->_queuePlayer;
  if (queuePlayer)
  {
    -[AVQueuePlayer _setClientPriority:](queuePlayer, "_setClientPriority:", 0);
    TLLogPlayback();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = self->_queuePlayer;
      objc_msgSend(v4, "alertForAudioEnvironmentSetup");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138544386;
      v10 = self;
      v11 = 2114;
      v12 = v4;
      v13 = 2048;
      v14 = 0;
      v15 = 2114;
      v16 = v7;
      v17 = 2114;
      v18 = v8;
      _os_log_impl(&dword_1D33D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_resetClientPriorityForStateDescriptor:(%{public}@). Reset client priority to %ld on %{public}@ for %{public}@.", (uint8_t *)&v9, 0x34u);

    }
  }

}

- (void)_resetFlagsForSwitchingAuxiliaryAudioSession
{
  _BOOL4 isBypassingRingerSwitchPolicy;
  BOOL *p_isAudioSessionActive;
  _BOOL4 isAudioSessionActive;
  NSObject *v6;
  AVAudioSession *audioSession;
  int v8;
  TLAlertQueuePlayerController *v9;
  __int16 v10;
  AVAudioSession *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  isBypassingRingerSwitchPolicy = self->_isBypassingRingerSwitchPolicy;
  if (self->_isBypassingRingerSwitchPolicy)
    self->_isBypassingRingerSwitchPolicy = 0;
  if (self->_isIgnoringAccessibilityDisabledVibrationSetting)
  {
    p_isAudioSessionActive = &self->_isAudioSessionActive;
    isAudioSessionActive = self->_isAudioSessionActive;
    self->_isIgnoringAccessibilityDisabledVibrationSetting = 0;
    if (!isAudioSessionActive)
      goto LABEL_8;
  }
  else
  {
    p_isAudioSessionActive = &self->_isAudioSessionActive;
    if (!self->_isAudioSessionActive)
    {
      if (!isBypassingRingerSwitchPolicy)
        return;
      goto LABEL_8;
    }
  }
  *p_isAudioSessionActive = 0;
LABEL_8:
  TLLogPlayback();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    audioSession = self->_audioSession;
    v8 = 138543618;
    v9 = self;
    v10 = 2114;
    v11 = audioSession;
    _os_log_impl(&dword_1D33D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_resetFlagsForSwitchingAuxiliaryAudioSession. Did reset internal flags related to auxiliary audio session %{public}@.", (uint8_t *)&v8, 0x16u);
  }

}

- (void)_applyAudioVolume:(float)a3 forAlert:(id)a4
{
  double v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  NSObject *v10;
  AVQueuePlayer *queuePlayer;
  double v12;
  NSObject *v13;
  AVQueuePlayer *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  double v18;
  int v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  double v24;
  double v25;
  int v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  AVQueuePlayer *v31;
  float v32;
  uint8_t buf[4];
  TLAlertQueuePlayerController *v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = COERCE_DOUBLE(a4);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  v7 = objc_msgSend((id)objc_opt_class(), "_audioVolumeApplicationPolicyForAlert:externalEnvironmentValues:", *(_QWORD *)&v6, *(_WORD *)&self->_externalEnvironmentValues);
  v8 = v7;
  if (v7 > 3)
    v9 = 0.0;
  else
    v9 = *((double *)&off_1E952BC88 + v7);
  TLLogPlayback();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v34 = self;
    v35 = 2048;
    v36 = a3;
    v37 = 2114;
    v38 = v6;
    v39 = 2114;
    v40 = v9;
    _os_log_impl(&dword_1D33D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -_applyAudioVolume:(%f) forAlert:(%{public}@): Policy for applying audio volume: %{public}@.", buf, 0x2Au);
  }

  switch(v8)
  {
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
      *(double *)&v13 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v32 = 0.0;
      if (-[NSObject getActiveCategoryVolume:andName:](v13, "getActiveCategoryVolume:andName:", &v32, 0)&& vabds_f32(v32, a3) <= 0.00000011921)
      {
        TLLogPlayback();
        *(double *)&v20 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          v34 = self;
          v35 = 2114;
          v36 = *(double *)&v13;
          v37 = 2048;
          v38 = a3;
          v39 = 2114;
          v40 = v6;
          v21 = "%{public}@: -_applyAudioVolume…: Existing volume on %{public}@ for active audio category matches request"
                "ed volume %f for %{public}@.";
          v22 = v20;
          v23 = 42;
          goto LABEL_26;
        }
      }
      else
      {
        *(float *)&v18 = a3;
        v19 = -[NSObject setActiveCategoryVolumeTo:](v13, "setActiveCategoryVolumeTo:", v18);
        TLLogPlayback();
        *(double *)&v20 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544386;
          v34 = self;
          v35 = 2114;
          v36 = *(double *)&v13;
          v37 = 2048;
          v38 = a3;
          v39 = 2114;
          v40 = v6;
          v41 = 1024;
          LODWORD(v42) = v19;
          v21 = "%{public}@: -_applyAudioVolume…: Adjusted volume on %{public}@ for active audio category to %f for %{pub"
                "lic}@; did succeed: %{BOOL}d.";
          v22 = v20;
          v23 = 48;
LABEL_26:
          _os_log_impl(&dword_1D33D5000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
        }
      }
LABEL_31:

      goto LABEL_32;
    case 2uLL:
      objc_msgSend((id)objc_opt_class(), "_audioCategoryForAlert:externalEnvironmentValues:", *(_QWORD *)&v6, *(_WORD *)&self->_externalEnvironmentValues);
      *(double *)&v13 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      objc_msgSend((id)objc_opt_class(), "_mediaExperienceAudioCategoryForAudioSessionCategory:", v13);
      *(double *)&v20 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
      v24 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v32 = 0.0;
      if (objc_msgSend(*(id *)&v24, "getVolume:forCategory:", &v32, v20)
        && vabds_f32(v32, a3) <= 0.00000011921)
      {
        TLLogPlayback();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544386;
          v34 = self;
          v35 = 2114;
          v36 = v24;
          v37 = 2114;
          v38 = *(double *)&v20;
          v39 = 2048;
          v40 = a3;
          v41 = 2114;
          v42 = v6;
          v28 = "%{public}@: -_applyAudioVolume…: Existing volume on %{public}@ for MediaExperience audio category %{publ"
                "ic}@ matches requested volume %f for %{public}@.";
          v29 = v27;
          v30 = 52;
          goto LABEL_29;
        }
      }
      else
      {
        *(float *)&v25 = a3;
        v26 = objc_msgSend(*(id *)&v24, "setVolumeTo:forCategory:", v20, v25);
        TLLogPlayback();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544642;
          v34 = self;
          v35 = 2114;
          v36 = v24;
          v37 = 2114;
          v38 = *(double *)&v20;
          v39 = 2048;
          v40 = a3;
          v41 = 2114;
          v42 = v6;
          v43 = 1024;
          v44 = v26;
          v28 = "%{public}@: -_applyAudioVolume…: Adjusted volume on %{public}@ for MediaExperience audio category %{publ"
                "ic}@ to %f for %{public}@; did succeed: %{BOOL}d.";
          v29 = v27;
          v30 = 58;
LABEL_29:
          _os_log_impl(&dword_1D33D5000, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
        }
      }

      goto LABEL_31;
    case 1uLL:
      queuePlayer = self->_queuePlayer;
      if (queuePlayer)
      {
        -[AVQueuePlayer volume](queuePlayer, "volume");
        if (vabds_f32(*(float *)&v12, a3) <= 0.00000011921)
        {
          TLLogPlayback();
          *(double *)&v13 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v31 = self->_queuePlayer;
            *(_DWORD *)buf = 138543874;
            v34 = self;
            v35 = 2114;
            v36 = *(double *)&v31;
            v37 = 2048;
            v38 = a3;
            v15 = "%{public}@: -_applyAudioVolume…: Existing volume of %{public}@ is already set to %f.";
            v16 = v13;
            v17 = 32;
            goto LABEL_23;
          }
        }
        else
        {
          *(float *)&v12 = a3;
          -[AVQueuePlayer setVolume:](self->_queuePlayer, "setVolume:", v12);
          TLLogPlayback();
          *(double *)&v13 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = self->_queuePlayer;
            *(_DWORD *)buf = 138544130;
            v34 = self;
            v35 = 2114;
            v36 = *(double *)&v14;
            v37 = 2048;
            v38 = a3;
            v39 = 2114;
            v40 = v6;
            v15 = "%{public}@: -_applyAudioVolume…: Adjusted volume of %{public}@ to %f for %{public}@.";
            v16 = v13;
            v17 = 42;
LABEL_23:
            _os_log_impl(&dword_1D33D5000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
          }
        }
LABEL_32:

      }
      break;
  }

}

- (void)_didReceiveAttentionPollingEventOfType:(int64_t)a3 stateDescriptor:(id)a4
{
  id v6;
  int v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  AVAsset *v11;
  _BOOL4 hasToneAssetForPendingPlayingAlert;
  AVAsset *toneAssetForPendingPlayingAlert;
  TLAlertQueuePlayerStateDescriptor *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSCopying *attentionPollingToken;
  TLAlertQueuePlayerController *v19;
  TLAlertQueuePlayerStateDescriptor *v20;
  AVAsset *v21;
  uint64_t v22;
  uint64_t v23;
  TLAttentionAwarenessEffectCoordinator *effectCoordinator;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  const char *v38;
  uint32_t v39;
  void *v40;
  TLAlertQueuePlayerStateDescriptor *v41;
  AVAsset *v42;
  int v43;
  id v44;
  const __CFString *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  TLAlertQueuePlayerController *v52;
  __int16 v53;
  const __CFString *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  if (a3 == 1)
  {
    v45 = CFSTR("attention detected");
    v7 = 1;
  }
  else
  {
    v7 = 0;
    if (a3)
      v45 = 0;
    else
      v45 = CFSTR("initialized");
  }
  TLLogPlayback();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v52 = self;
    v53 = 2114;
    v54 = v45;
    v55 = 2114;
    v56 = (uint64_t)v10;
    v57 = 2048;
    v58 = v6;
    _os_log_impl(&dword_1D33D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didReceiveAttentionPollingEventOfType:(%{public}@) stateDescriptor:(<%{public}@: %p>).", buf, 0x2Au);

  }
  self->_isAttentionAwarenessSubsystemFullyInitialized = 1;
  self->_lastAttentionPollingEventType = a3;
  v11 = self->_toneAssetForPendingPlayingAlert;
  hasToneAssetForPendingPlayingAlert = self->_hasToneAssetForPendingPlayingAlert;
  toneAssetForPendingPlayingAlert = self->_toneAssetForPendingPlayingAlert;
  self->_toneAssetForPendingPlayingAlert = 0;

  self->_hasToneAssetForPendingPlayingAlert = 0;
  os_unfair_lock_lock(&self->_lock);
  v14 = self->_stateDescriptor;
  os_unfair_lock_unlock(&self->_lock);
  -[TLAlertQueuePlayerStateDescriptor alertForAudioEnvironmentSetup](v14, "alertForAudioEnvironmentSetup");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertForAudioEnvironmentSetup");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 == v16)
  {
    if (a3 != 1)
    {
      if (a3 || !hasToneAssetForPendingPlayingAlert)
        goto LABEL_12;
      v19 = self;
      v20 = v14;
      v21 = v11;
      v22 = 0;
LABEL_21:
      -[TLAlertQueuePlayerController _startPlaybackForStateDescriptor:usingConfirmedPlayableAsset:hasAlreadyDetectedUserAttention:](v19, "_startPlaybackForStateDescriptor:usingConfirmedPlayableAsset:hasAlreadyDetectedUserAttention:", v20, v21, v22);
      goto LABEL_12;
    }
    v23 = -[TLAttentionAwarenessEffectCoordinator effectParameters](self->_effectCoordinator, "effectParameters");
    effectCoordinator = self->_effectCoordinator;
    if (hasToneAssetForPendingPlayingAlert)
    {
      -[TLAttentionAwarenessEffectCoordinator setEffectParameters:](effectCoordinator, "setEffectParameters:", v23, 1065353216);
      v19 = self;
      v20 = v14;
      v21 = v11;
      v22 = 1;
      goto LABEL_21;
    }
    v40 = v15;
    v41 = v14;
    v42 = v11;
    v43 = v7;
    v44 = v6;
    -[TLAttentionAwarenessEffectCoordinator setEffectParameters:effectMixFadeDuration:](effectCoordinator, "setEffectParameters:effectMixFadeDuration:", v23, 1065353216, 0.75);
    -[AVQueuePlayer items](self->_queuePlayer, "items");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (!v26)
      goto LABEL_39;
    v27 = v26;
    v28 = *(_QWORD *)v47;
LABEL_24:
    v29 = 0;
    while (1)
    {
      if (*(_QWORD *)v47 != v28)
        objc_enumerationMutation(v25);
      v30 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v29);
      if (!objc_msgSend(v30, "playHapticTracks"))
        goto LABEL_37;
      objc_msgSend(v30, "tl_hapticTracks");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "attenuatedHapticPlayerItemTrack");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "hapticPlayerItemTrack");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v32)
        break;
      objc_msgSend(v33, "setActiveHapticChannelIndex:", 1);
      TLLogPlayback();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        v52 = self;
        v53 = 2114;
        v54 = v45;
        v55 = 2048;
        v56 = 1;
        v57 = 2114;
        v58 = v34;
        v37 = v36;
        v38 = "%{public}@: -_didReceiveAttentionPollingEventOfType:(%{public}@) […]: [hapticPlayerItemTrack setActiveHapt"
              "icChannelIndex:%ld] on %{public}@.";
        v39 = 42;
LABEL_35:
        _os_log_impl(&dword_1D33D5000, v37, OS_LOG_TYPE_DEFAULT, v38, buf, v39);
      }
LABEL_36:

LABEL_37:
      if (v27 == ++v29)
      {
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
        if (!v27)
        {
LABEL_39:

          v6 = v44;
          v7 = v43;
          v14 = v41;
          v11 = v42;
          v15 = v40;
          goto LABEL_12;
        }
        goto LABEL_24;
      }
    }
    objc_msgSend(v33, "setMutesHaptics:", 1);
    TLLogPlayback();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v52 = self;
      v53 = 2114;
      v54 = v45;
      v55 = 2114;
      v56 = (uint64_t)v34;
      _os_log_impl(&dword_1D33D5000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didReceiveAttentionPollingEventOfType:(%{public}@) […]: [hapticPlayerItemTrack setMutesHaptics:YES] on %{public}@.", buf, 0x20u);
    }

    objc_msgSend(v32, "setMutesHaptics:", 0);
    TLLogPlayback();
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      goto LABEL_36;
    *(_DWORD *)buf = 138543874;
    v52 = self;
    v53 = 2114;
    v54 = v45;
    v55 = 2114;
    v56 = (uint64_t)v32;
    v37 = v36;
    v38 = "%{public}@: -_didReceiveAttentionPollingEventOfType:(%{public}@) […]: [attenuatedHapticPlayerItemTrack setMute"
          "sHaptics:NO] on %{public}@.";
    v39 = 32;
    goto LABEL_35;
  }
  TLLogPlayback();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v52 = self;
    v53 = 2114;
    v54 = v45;
    v55 = 2114;
    v56 = (uint64_t)v15;
    _os_log_impl(&dword_1D33D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didReceiveAttentionPollingEventOfType:(%{public}@) […]: alertForAudioEnvironmentSetup argument doesn't match with activeAlertForAudioEnvironmentSetup: %{public}@. Aborting logic to affect current playback state.", buf, 0x20u);
  }

LABEL_12:
  if (v7)
  {
    attentionPollingToken = self->_attentionPollingToken;
    self->_attentionPollingToken = 0;

  }
}

- (void)_createQueuePlayerIfNecessaryForStateDescriptor:(id)a3
{
  AVQueuePlayer *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  NSObject *v10;
  AVQueuePlayer *queuePlayer;
  AVQueuePlayer *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  BOOL v16;
  NSObject *v17;
  AVQueuePlayer *v18;
  AVQueuePlayer *v19;
  id v20;
  void *v21;
  AVQueuePlayer *v22;
  AVQueuePlayer *v23;
  NSObject *v24;
  AVQueuePlayer *v25;
  AVQueuePlayer *v26;
  int v27;
  uint64_t v28;
  uint8_t buf[4];
  TLAlertQueuePlayerController *v30;
  __int16 v31;
  AVQueuePlayer *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  _BYTE v36[10];
  int v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = (AVQueuePlayer *)a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  -[AVQueuePlayer playingAlert](v4, "playingAlert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "_clientNameForAlert:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend((id)objc_opt_class(), "_clientPriorityForAlert:", v5);
    v8 = objc_msgSend((id)objc_opt_class(), "_shouldEnsureActiveAudioSessionWhenStartingPlaybackForAlert:", v5);
    v9 = objc_msgSend((id)objc_opt_class(), "_shouldUseAuxiliaryAudioSessionForAlert:", v5);
    TLLogPlayback();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544642;
      v30 = self;
      v31 = 2114;
      v32 = v4;
      v33 = 2114;
      v34 = (uint64_t)v6;
      v35 = 2048;
      *(_QWORD *)v36 = v7;
      *(_WORD *)&v36[8] = 1024;
      v37 = v8;
      v38 = 1024;
      v39 = v9;
      _os_log_impl(&dword_1D33D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -_createQueuePlayerIfNecessaryForStateDescriptor:(%{public}@). clientName = %{public}@. clientPriority = %ld. shouldEnsureActiveAudioSessionWhenStartingPlayback = %{BOOL}d. shouldUseAuxiliaryAudioSession = %{BOOL}d.", buf, 0x36u);
    }

    queuePlayer = self->_queuePlayer;
    if (!queuePlayer)
      goto LABEL_18;
    v27 = v8;
    v28 = v7;
    -[AVQueuePlayer _clientName](queuePlayer, "_clientName");
    v12 = (AVQueuePlayer *)objc_claimAutoreleasedReturnValue();
    v13 = -[AVQueuePlayer _clientPriority](self->_queuePlayer, "_clientPriority");
    v8 = -[AVQueuePlayer _ensuresActiveAudioSessionWhenStartingPlayback](self->_queuePlayer, "_ensuresActiveAudioSessionWhenStartingPlayback");
    -[AVQueuePlayer audioSession](self->_queuePlayer, "audioSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    TLLogPlayback();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544386;
      v30 = self;
      v31 = 2114;
      v32 = v12;
      v33 = 2048;
      v34 = v13;
      v35 = 1024;
      *(_DWORD *)v36 = v8;
      *(_WORD *)&v36[4] = 1024;
      *(_DWORD *)&v36[6] = v14 != 0;
      _os_log_impl(&dword_1D33D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: -_createQueuePlayerIfNecessary…: Existing player is configured with clientName = %{public}@. clientPriority = %ld. ensuresActiveAudioSessionWhenStartingPlayback = %{BOOL}d. isUsingAuxiliaryAudioSession = %{BOOL}d.", buf, 0x2Cu);
    }

    if (-[AVQueuePlayer isEqualToString:](v12, "isEqualToString:", v6) && v13 == v28)
    {
      v16 = v27 == v8;
      LOBYTE(v8) = v27;
      if (v16)
      {
        v7 = v28;
        if (v9 == (v14 != 0))
        {
LABEL_17:

          if (self->_queuePlayer)
          {
LABEL_25:

            goto LABEL_26;
          }
LABEL_18:
          v20 = objc_alloc(MEMORY[0x1E0C8B350]);
          -[TLAudioQueue _underlyingSerialQueue](self->_audioQueue, "_underlyingSerialQueue");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (AVQueuePlayer *)objc_msgSend(v20, "initWithDispatchQueue:", v21);
          v23 = self->_queuePlayer;
          self->_queuePlayer = v22;

          -[AVQueuePlayer setAllowsExternalPlayback:](self->_queuePlayer, "setAllowsExternalPlayback:", 0);
          -[AVQueuePlayer _setClientPriority:](self->_queuePlayer, "_setClientPriority:", v7);
          -[AVQueuePlayer _setClientName:](self->_queuePlayer, "_setClientName:", v6);
          if ((v8 & 1) == 0)
            -[AVQueuePlayer _setEnsuresActiveAudioSessionWhenStartingPlayback:](self->_queuePlayer, "_setEnsuresActiveAudioSessionWhenStartingPlayback:", 0);
          if (self->_isUsingAuxiliaryAudioSession)
            -[AVQueuePlayer setAudioSession:](self->_queuePlayer, "setAudioSession:", self->_audioSession);
          TLLogPlayback();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = self->_queuePlayer;
            *(_DWORD *)buf = 138543618;
            v30 = self;
            v31 = 2114;
            v32 = v25;
            _os_log_impl(&dword_1D33D5000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: -_createQueuePlayerIfNecessary…: Created queue player: %{public}@.", buf, 0x16u);
          }

          goto LABEL_25;
        }
        TLLogPlayback();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v26 = self->_queuePlayer;
          *(_DWORD *)buf = 138543618;
          v30 = self;
          v31 = 2114;
          v32 = v26;
          _os_log_impl(&dword_1D33D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -_createQueuePlayerIfNecessary…: Policy for picking between auxiliary and shared audio session doesn't match that of %{public}@. Destroying it.", buf, 0x16u);
        }
      }
      else
      {
        TLLogPlayback();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = self->_queuePlayer;
          *(_DWORD *)buf = 138543618;
          v30 = self;
          v31 = 2114;
          v32 = v18;
          _os_log_impl(&dword_1D33D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -_createQueuePlayerIfNecessary…: Policy for ensuring active audio session when starting playback doesn't match that of %{public}@. Destroying it.", buf, 0x16u);
        }
        v7 = v28;
      }
    }
    else
    {
      TLLogPlayback();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v19 = self->_queuePlayer;
        *(_DWORD *)buf = 138543618;
        v30 = self;
        v31 = 2114;
        v32 = v19;
        _os_log_impl(&dword_1D33D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -_createQueuePlayerIfNecessary…: Client name or priority don't match those of %{public}@. Destroying it.", buf, 0x16u);
      }
      v7 = v28;
      LOBYTE(v8) = v27;
    }

    -[TLAlertQueuePlayerController _destroyQueuePlayerForStateDescriptor:](self, "_destroyQueuePlayerForStateDescriptor:", v4);
    goto LABEL_17;
  }
LABEL_26:

}

- (void)_destroyQueuePlayerForStateDescriptor:(id)a3
{
  AVQueuePlayer *v4;
  NSObject *v5;
  AVQueuePlayer *queuePlayer;
  NSObject *v7;
  AVQueuePlayer *v8;
  AVQueuePlayer *v9;
  int v10;
  TLAlertQueuePlayerController *v11;
  __int16 v12;
  AVQueuePlayer *v13;
  __int16 v14;
  AVQueuePlayer *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (AVQueuePlayer *)a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  if (self->_queuePlayer)
  {
    TLLogPlayback();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      queuePlayer = self->_queuePlayer;
      v10 = 138543874;
      v11 = self;
      v12 = 2114;
      v13 = v4;
      v14 = 2114;
      v15 = queuePlayer;
      _os_log_impl(&dword_1D33D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: -_destroyQueuePlayerForStateDescriptor:(%{public}@). _queuePlayer = %{public}@.", (uint8_t *)&v10, 0x20u);
    }

    if (!self->_isStoppingPlayingAlert)
      -[TLAlertQueuePlayerController _stopPlaybackForStateDescriptor:](self, "_stopPlaybackForStateDescriptor:", v4);
    TLLogPlayback();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_queuePlayer;
      v10 = 138543618;
      v11 = self;
      v12 = 2114;
      v13 = v8;
      _os_log_impl(&dword_1D33D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: -_destroyQueuePlayer…: Tossing queue player: %{public}@.", (uint8_t *)&v10, 0x16u);
    }

    v9 = self->_queuePlayer;
    self->_queuePlayer = 0;

  }
}

- (void)_startObservingQueuePlayer
{
  NSObject *v3;
  AVQueuePlayer *queuePlayer;
  int v5;
  TLAlertQueuePlayerController *v6;
  __int16 v7;
  AVQueuePlayer *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  if (!self->_isObservingQueuePlayer && self->_queuePlayer)
  {
    TLLogPlayback();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      queuePlayer = self->_queuePlayer;
      v5 = 138543618;
      v6 = self;
      v7 = 2114;
      v8 = queuePlayer;
      _os_log_impl(&dword_1D33D5000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startObservingQueuePlayer: %{public}@.", (uint8_t *)&v5, 0x16u);
    }

    -[AVQueuePlayer addObserver:forKeyPath:options:context:](self->_queuePlayer, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem"), 2, _TLAlertQueuePlayerCurrentItemObservationContext);
    -[AVQueuePlayer addObserver:forKeyPath:options:context:](self->_queuePlayer, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem.status"), 1, _TLAlertQueuePlayerCurrentItemStatusObservationContext);
    self->_isObservingQueuePlayer = 1;
  }
}

- (void)_stopObservingQueuePlayer
{
  NSObject *v3;
  AVQueuePlayer *queuePlayer;
  int v5;
  TLAlertQueuePlayerController *v6;
  __int16 v7;
  AVQueuePlayer *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  if (self->_isObservingQueuePlayer)
  {
    TLLogPlayback();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      queuePlayer = self->_queuePlayer;
      v5 = 138543618;
      v6 = self;
      v7 = 2114;
      v8 = queuePlayer;
      _os_log_impl(&dword_1D33D5000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopObservingQueuePlayer: %{public}@.", (uint8_t *)&v5, 0x16u);
    }

    -[AVQueuePlayer removeObserver:forKeyPath:context:](self->_queuePlayer, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem"), _TLAlertQueuePlayerCurrentItemObservationContext);
    -[AVQueuePlayer removeObserver:forKeyPath:context:](self->_queuePlayer, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem.status"), _TLAlertQueuePlayerCurrentItemStatusObservationContext);
    self->_isObservingQueuePlayer = 0;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  TLAudioQueue *audioQueue;
  id v15;
  void *v16;
  void *v17;
  TLAudioQueue *v18;
  objc_super v19;
  _QWORD v20[4];
  void *v21;
  id v22;
  TLAlertQueuePlayerController *v23;
  _QWORD v24[4];
  void *v25;
  id v26;
  TLAlertQueuePlayerController *v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)_TLAlertQueuePlayerCurrentItemObservationContext == a6
    && objc_msgSend(v10, "isEqualToString:", CFSTR("currentItem")))
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB2CC8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    audioQueue = self->_audioQueue;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __79__TLAlertQueuePlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v24[3] = &unk_1E952AE10;
    v25 = v13;
    v26 = v11;
    v27 = self;
    v15 = v13;
    -[TLAudioQueue performTaskWithBlock:](audioQueue, "performTaskWithBlock:", v24);

    v16 = v25;
  }
  else
  {
    if ((void *)_TLAlertQueuePlayerCurrentItemStatusObservationContext != a6
      || !objc_msgSend(v10, "isEqualToString:", CFSTR("currentItem.status")))
    {
      v19.receiver = self;
      v19.super_class = (Class)TLAlertQueuePlayerController;
      -[TLAlertQueuePlayerController observeValueForKeyPath:ofObject:change:context:](&v19, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
      goto LABEL_9;
    }
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = self->_audioQueue;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __79__TLAlertQueuePlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    v20[3] = &unk_1E952AE10;
    v21 = v17;
    v22 = v11;
    v23 = self;
    v15 = v17;
    -[TLAudioQueue performTaskWithBlock:](v18, "performTaskWithBlock:", v20);

    v16 = v21;
  }

LABEL_9:
}

void __79__TLAlertQueuePlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = (void *)a1[4];
      v3 = a1[5];
      v4 = (void *)a1[6];
      v5 = v2;
      objc_msgSend(v4, "_queuePlayer:currentItemWasUpdatedFromValue:", v3, v5);

    }
  }
}

uint64_t __79__TLAlertQueuePlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    objc_opt_class();
    result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(a1 + 48), "_queuePlayer:currentItemStatusWasUpdatedToValue:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "integerValue"));
  }
  return result;
}

- (void)_queuePlayer:(id)a3 currentItemWasUpdatedFromValue:(id)a4
{
  AVQueuePlayer *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD *v10;
  void *v11;
  __int128 v12;
  void *v13;
  uint64_t v14;
  TLAlertQueuePlayerStateDescriptor *v15;
  void *v16;
  void *v17;
  int v18;
  _BOOL4 v19;
  NSObject *v20;
  NSObject *v21;
  TLAlertQueuePlayerStateDescriptor *v22;
  TLAlertQueuePlayerStateDescriptor *stateDescriptor;
  NSObject *v24;
  void *v25;
  _BOOL4 v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  void *v30;
  __int128 v31;
  uint64_t v32;
  _BYTE buf[24];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = (AVQueuePlayer *)a3;
  v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  if (self->_queuePlayer == v6)
  {
    TLLogPlayback();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2114;
      v34 = (uint64_t)v6;
      _os_log_impl(&dword_1D33D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: currentItemWasUpdatedFromValue:(%{public}@) for %{public}@.", buf, 0x20u);
    }

    TLLogPlayback();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_1D33D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: currentItemWasUpdated…: Calling [removedItem seekToTime:kCMTimeZero completionHandler:NULL] on %{public}@.", buf, 0x16u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v10 = (_QWORD *)getkCMTimeZeroSymbolLoc_ptr;
    v34 = getkCMTimeZeroSymbolLoc_ptr;
    if (!getkCMTimeZeroSymbolLoc_ptr)
    {
      v11 = (void *)CoreMediaLibrary();
      v10 = dlsym(v11, "kCMTimeZero");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v10;
      getkCMTimeZeroSymbolLoc_ptr = (uint64_t)v10;
    }
    _Block_object_dispose(buf, 8);
    if (!v10)
    {
      __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
      __break(1u);
    }
    v12 = *(_OWORD *)v10;
    v32 = v10[2];
    v31 = v12;
    objc_msgSend(v7, "seekToTime:completionHandler:", &v31, 0);
    -[AVQueuePlayer items](self->_queuePlayer, "items");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    os_unfair_lock_lock(&self->_lock);
    v15 = self->_stateDescriptor;
    -[TLAlertQueuePlayerStateDescriptor playingAlert](v15, "playingAlert");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "shouldRepeat");

    if ((v14 != 0) | v18 & 1)
    {
      os_unfair_lock_unlock(&self->_lock);
      if (v14)
      {
        -[TLAlertQueuePlayerController _stopObservingQueuePlayer](self, "_stopObservingQueuePlayer");
        v19 = -[AVQueuePlayer status](self->_queuePlayer, "status") == 2;
        TLLogPlayback();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v19)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            -[TLAlertQueuePlayerController _queuePlayer:currentItemWasUpdatedFromValue:].cold.2();

        }
        else
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v7;
            _os_log_impl(&dword_1D33D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: currentItemWasUpdated…: Re-inserting that same item again: %{public}@.", buf, 0x16u);
          }

          -[AVQueuePlayer insertItem:afterItem:](self->_queuePlayer, "insertItem:afterItem:", v7, 0);
        }
        -[TLAlertQueuePlayerController _startObservingQueuePlayer](self, "_startObservingQueuePlayer");
LABEL_33:

        goto LABEL_34;
      }
    }
    else
    {
      -[TLAlertQueuePlayerStateDescriptor stateDescriptorForCompletedPlayback](self->_stateDescriptor, "stateDescriptorForCompletedPlayback");
      v22 = (TLAlertQueuePlayerStateDescriptor *)objc_claimAutoreleasedReturnValue();
      stateDescriptor = self->_stateDescriptor;
      self->_stateDescriptor = v22;

      TLLogPlayback();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        -[TLAlertQueuePlayerStateDescriptor debugDescription](self->_stateDescriptor, "debugDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v25;
        _os_log_impl(&dword_1D33D5000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: currentItemWasUpdated…: Updated _stateDescriptor to %{public}@.", buf, 0x16u);

      }
      os_unfair_lock_unlock(&self->_lock);
    }
    if (v18)
    {
      v26 = !self->_isWaitingToCompleteReloadPlaybackRequest;
      TLLogPlayback();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      if (v26)
      {
        if (v28)
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = self;
          _os_log_impl(&dword_1D33D5000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: currentItemWasUpdated…: The queue was exhausted prematurely; this can happen if the ringtone ass"
            "et contains corrupted audio data. Start over with default tone.",
            buf,
            0xCu);
        }

        -[TLAlertQueuePlayerController _stopObservingQueuePlayer](self, "_stopObservingQueuePlayer");
        -[TLAlertQueuePlayerController _fallbackToneIdentifierForStateDescriptor:](self, "_fallbackToneIdentifierForStateDescriptor:", v15);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[TLAlertQueuePlayerController _reloadPlaybackForStateDescriptor:withToneIdentifier:](self, "_reloadPlaybackForStateDescriptor:withToneIdentifier:", v15, v30);

      }
      else
      {
        if (v28)
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = self;
          _os_log_impl(&dword_1D33D5000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: currentItemWasUpdated…: The queue was exhausted prematurely, but we are already waiting for a fallback tone to begin playing. Doing nothing.", buf, 0xCu);
        }

      }
    }
    else
    {
      TLLogPlayback();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl(&dword_1D33D5000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: currentItemWasUpdated…: Playback of non repeating tone completed by playing to end.", buf, 0xCu);
      }

      -[TLAlertQueuePlayerController _stopPlaybackForStateDescriptor:](self, "_stopPlaybackForStateDescriptor:", v15);
      -[TLAlertQueuePlayerStateDescriptor invokePlayingAlertCompletionHandlerWithPlaybackCompletionType:error:](v15, "invokePlayingAlertCompletionHandlerWithPlaybackCompletionType:error:", 0, 0);
    }
    goto LABEL_33;
  }
LABEL_34:

}

- (void)_queuePlayer:(id)a3 currentItemStatusWasUpdatedToValue:(int64_t)a4
{
  AVQueuePlayer *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 isWaitingToCompleteReloadPlaybackRequest;
  NSObject *v12;
  NSObject *v13;
  TLAlertQueuePlayerStateDescriptor *v14;
  int v15;
  TLAlertQueuePlayerController *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  AVQueuePlayer *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = (AVQueuePlayer *)a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  if (a4 == 2 && self->_queuePlayer == v6)
  {
    -[AVQueuePlayer currentItem](v6, "currentItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "code");

    TLLogPlayback();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v15 = 138544130;
      v16 = self;
      v17 = 2048;
      v18 = 2;
      v19 = 2114;
      v20 = v6;
      v21 = 2048;
      v22 = v9;
      _os_log_error_impl(&dword_1D33D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@: currentItemStatusWasUpdatedToValue:(%ld) for %{public}@. itemStatus == AVPlayerItemStatusFailed. currentItemErrorCode: %ld.", (uint8_t *)&v15, 0x2Au);
    }

    if (v9 != -11819)
    {
      isWaitingToCompleteReloadPlaybackRequest = self->_isWaitingToCompleteReloadPlaybackRequest;
      TLLogPlayback();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (isWaitingToCompleteReloadPlaybackRequest)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v15 = 138543874;
          v16 = self;
          v17 = 2048;
          v18 = 2;
          v19 = 2114;
          v20 = v6;
          _os_log_impl(&dword_1D33D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: currentItemStatusWasUpdatedToValue:(%ld) for %{public}@. Tone could not be prepared for playback, but we are already waiting for a fallback tone to begin playing. Doing nothing.", (uint8_t *)&v15, 0x20u);
        }
      }
      else
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[TLAlertQueuePlayerController _queuePlayer:currentItemStatusWasUpdatedToValue:].cold.1();

        -[TLAlertQueuePlayerController _stopObservingQueuePlayer](self, "_stopObservingQueuePlayer");
        os_unfair_lock_lock(&self->_lock);
        v14 = self->_stateDescriptor;
        os_unfair_lock_unlock(&self->_lock);
        -[TLAlertQueuePlayerController _fallbackToneIdentifierForStateDescriptor:](self, "_fallbackToneIdentifierForStateDescriptor:", v14);
        v13 = objc_claimAutoreleasedReturnValue();
        -[TLAlertQueuePlayerController _reloadPlaybackForStateDescriptor:withToneIdentifier:](self, "_reloadPlaybackForStateDescriptor:withToneIdentifier:", v14, v13);

      }
    }
  }

}

+ (id)_clientNameForAlert:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;

  v3 = a3;
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "type");

  objc_msgSend(v4, "topic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isForPreview") & 1) != 0 || v5 == 1)
  {
    v7 = CFSTR("Phone");
  }
  else if (v5 == 16
         && (objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicSystemNotificationFindMyDevice")) & 1) != 0)
  {
    v7 = CFSTR("LocatePhone");
  }
  else
  {
    v7 = CFSTR("ToneLibrary");
  }

  return (id)v7;
}

+ (int64_t)_clientPriorityForAlert:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isForPreview") & 1) != 0)
  {
    v5 = 0;
  }
  else if (objc_msgSend(v3, "type") == 1)
  {
    v5 = 10;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)_shouldEnsureActiveAudioSessionWhenStartingPlaybackForAlert:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isForPreview") & 1) != 0)
    LOBYTE(v6) = 1;
  else
    v6 = objc_msgSend(a1, "_shouldHandleAudioSessionActivationForAlert:", v4) ^ 1;

  return v6;
}

+ (id)_audioCategoryForAlert:(id)a3 externalEnvironmentValues:(id)a4
{
  BOOL var0;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id *v10;
  id *v11;
  void *v12;
  void *v13;
  char v14;
  int v15;
  id v16;
  id v17;

  var0 = a4.var0;
  v5 = a3;
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "type");

  objc_msgSend(v6, "topic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "audioCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "length"))
  {
    if (objc_msgSend(v6, "isForPreview"))
    {
      v10 = (id *)MEMORY[0x1E0C896B0];
      if (v7 == 13)
        v10 = (id *)MEMORY[0x1E0C89658];
    }
    else
    {
      switch(v7)
      {
        case 16:
          if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicSystemNotificationFindMyDevice")) & 1) == 0)
            goto LABEL_25;
          goto LABEL_8;
        case 17:
          if (!objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicAppNotificationCriticalAlert")))
            goto LABEL_25;
          v11 = (id *)MEMORY[0x1E0C89690];
          if (!var0)
            v11 = (id *)MEMORY[0x1E0C89668];
          goto LABEL_24;
        case 18:
          if ((objc_msgSend(v6, "shouldForcePlayingAtUserSelectedAudioVolume") & 1) != 0)
          {
            v11 = (id *)MEMORY[0x1E0C89658];
          }
          else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicEmergencyNonInterrupting")) & 1) != 0)
          {
            v11 = (id *)MEMORY[0x1E0C89690];
          }
          else
          {
            v15 = objc_msgSend(v6, "shouldIgnoreRingerSwitch");
            v11 = (id *)MEMORY[0x1E0C89670];
            if (v15)
              v11 = (id *)MEMORY[0x1E0C89668];
          }
          goto LABEL_24;
        case 19:
        case 20:
        case 21:
          goto LABEL_25;
        case 22:
LABEL_8:
          v11 = (id *)MEMORY[0x1E0C89678];
          goto LABEL_24;
        default:
          if (v7 == 28)
            goto LABEL_13;
          if (v7 != 1)
            goto LABEL_25;
          if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicIncomingCallAppNotification")) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "processName");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("tlutil"));

            if ((v14 & 1) == 0)
              goto LABEL_28;
          }
LABEL_13:
          v11 = (id *)MEMORY[0x1E0C896A8];
LABEL_24:
          v16 = *v11;

          v9 = v16;
LABEL_25:
          if (objc_msgSend(v9, "length"))
            goto LABEL_28;
          v10 = (id *)MEMORY[0x1E0C89658];
          break;
      }
    }
    v17 = *v10;

    v9 = v17;
  }
LABEL_28:

  return v9;
}

+ (unint64_t)_audioCategoryOptionsForAlert:(id)a3 externalEnvironmentValues:(id)a4
{
  int v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unint64_t v10;

  v4 = *(_DWORD *)&a4.var0;
  v5 = a3;
  v6 = objc_msgSend(v5, "type");
  objc_msgSend(v5, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "topic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == 18)
  {
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicEmergencyNonInterrupting"));
  }
  else if (v6 == 17)
  {
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicAppNotificationCriticalAlert")) & v4;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  return v10;
}

+ (id)_audioModeForAlert:(id)a3 audioCategory:(id)a4
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v5 = a3;
  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0C89668])
    && (objc_msgSend(v5, "configuration"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "_hasCustomAudioVolume"),
        v6,
        v7))
  {
    v8 = (id)*MEMORY[0x1E0C89750];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_mediaExperienceAudioCategoryForAudioSessionCategory:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C89658]) & 1) != 0)
  {
    v4 = CFSTR("Alarm");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C896A8]) & 1) != 0)
  {
    v4 = CFSTR("Ringtone");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C896B0]) & 1) != 0)
  {
    v4 = CFSTR("RingtonePreview");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C89678]) & 1) != 0)
  {
    v4 = CFSTR("FindMyPhone");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C89668]) & 1) != 0)
  {
    v4 = CFSTR("EmergencyAlert");
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C89670]))
  {
    v4 = CFSTR("EmergencyAlert_Muteable");
  }
  else
  {
    v4 = 0;
  }

  return (id)v4;
}

- (float)_audioVolumeForAlert:(id)a3 audioCategory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  float v16;
  uint8_t buf[4];
  TLAlertQueuePlayerController *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  objc_msgSend(v6, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "audioVolume");
  v10 = v9;
  if ((objc_msgSend(v8, "_hasCustomAudioVolume") & 1) == 0
    && objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C89658]))
  {
    v16 = 1.0;
    objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "getVolume:forCategory:", &v16, CFSTR("Ringtone"));
    TLLogPlayback();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v18 = self;
        v19 = 2114;
        v20 = v6;
        v21 = 2048;
        v22 = v16;
        _os_log_impl(&dword_1D33D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: -_audioVolumeFor…: Did retrieve ringer volume successfully for fallback volume value for alert %{public}@: %f.", buf, 0x20u);
      }

      v10 = v16;
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v18 = self;
        v19 = 2114;
        v20 = v6;
        v21 = 2048;
        v22 = v10;
        _os_log_error_impl(&dword_1D33D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@: -_audioVolumeFor…: Failed to retrieve ringer volume for fallback volume value for alert %{public}@. Using default value instead: %f.", buf, 0x20u);
      }

    }
  }

  return v10;
}

+ (BOOL)_shouldBypassRingerSwitchPolicyForAlert:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isForPreview") & 1) != 0
    || objc_msgSend(v3, "type") == 18 && !objc_msgSend(v4, "shouldForcePlayingAtUserSelectedAudioVolume"))
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(v4, "shouldIgnoreRingerSwitch");
  }

  return v5;
}

+ (BOOL)_prefersToPlayDuringWombatForAlert:(id)a3
{
  return objc_msgSend(a3, "type") == 18;
}

+ (BOOL)_shouldUseAuxiliaryAudioSessionForAlert:(id)a3
{
  return objc_msgSend(a3, "type") != 1;
}

+ (BOOL)_shouldHandleAudioSessionActivationForAlert:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "type");
  objc_msgSend(v3, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "topic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != 1
    || (objc_msgSend(v4, "isForPreview") & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("TLAlertTopicIncomingCallAppNotification")) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "processName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v11, "isEqualToString:", CFSTR("tlutil"));

  }
  return v8;
}

- (void)_activateAudioSessionIfNeededForStateDescriptor:(id)a3
{
  id v4;
  void *v5;
  AVAudioSession *audioSession;
  _BOOL4 v7;
  id v8;
  void *v9;
  NSObject *v10;
  AVAudioSession *v11;
  NSObject *v12;
  AVAudioSession *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  TLAlertQueuePlayerController *v17;
  __int16 v18;
  AVAudioSession *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  objc_msgSend(v4, "alertForAudioEnvironmentSetup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_isAudioSessionActive
    && objc_msgSend((id)objc_opt_class(), "_shouldHandleAudioSessionActivationForAlert:", v5))
  {
    audioSession = self->_audioSession;
    v15 = 0;
    v7 = -[AVAudioSession setActive:error:](audioSession, "setActive:error:", 1, &v15);
    v8 = v15;
    v9 = v8;
    if (!v7 || v8)
    {
      TLLogPlayback();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = self->_audioSession;
        objc_msgSend(v9, "tl_nonRedundantDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v17 = self;
        v18 = 2114;
        v19 = v13;
        v20 = 2114;
        v21 = v5;
        v22 = 2114;
        v23 = v14;
        _os_log_error_impl(&dword_1D33D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@: -_activateAudioSession…: Failed activating audio session %{public}@ for %{public}@ with error: %{public}@.", buf, 0x2Au);

      }
    }
    else
    {
      self->_isAudioSessionActive = 1;
      TLLogPlayback();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_audioSession;
        *(_DWORD *)buf = 138543874;
        v17 = self;
        v18 = 2114;
        v19 = v11;
        v20 = 2114;
        v21 = v5;
        _os_log_impl(&dword_1D33D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -_activateAudioSession…: Successfully activated audio session %{public}@ for %{public}@.", buf, 0x20u);
      }

      -[TLAlertQueuePlayerController _startObservingAudioSessionInterruptionNotificationsForStateDescriptor:](self, "_startObservingAudioSessionInterruptionNotificationsForStateDescriptor:", v4);
    }

  }
}

- (void)_deactivateAudioSessionIfNeededForStateDescriptor:(id)a3
{
  AVAudioSession *v4;
  NSObject *v5;
  _BOOL4 isAudioSessionActive;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  AVAudioSession *audioSession;
  AVAudioSession *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  AVAudioSession *v15;
  NSObject *v16;
  AVAudioSession *v17;
  AVAudioSession *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  TLAlertQueuePlayerController *v22;
  __int16 v23;
  AVAudioSession *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (AVAudioSession *)a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  TLLogPlayback();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    isAudioSessionActive = self->_isAudioSessionActive;
    *(_DWORD *)buf = 138543874;
    v22 = self;
    v23 = 2114;
    v24 = v4;
    v25 = 1024;
    LODWORD(v26) = isAudioSessionActive;
    _os_log_impl(&dword_1D33D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: -_deactivateAudioSessionIfNeededForStateDescriptor:(%{public}@): _isAudioSessionActive = %{BOOL}d.", buf, 0x1Cu);
  }

  -[AVAudioSession alertForAudioEnvironmentSetup](v4, "alertForAudioEnvironmentSetup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isAudioSessionActive)
  {
    if (-[TLAlertQueuePlayerController _isPreventingAudioSessionDeactivation](self, "_isPreventingAudioSessionDeactivation"))
    {
      TLLogPlayback();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v22 = self;
        _os_log_impl(&dword_1D33D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: -_deactivateAudioSession…: Skipping audio session deactivation because it is currently being prevented.", buf, 0xCu);
      }
    }
    else
    {
      -[TLAlertQueuePlayerController _stopObservingAudioSessionInterruptionNotificationsForStateDescriptor:](self, "_stopObservingAudioSessionInterruptionNotificationsForStateDescriptor:", v4);
      TLLogPlayback();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        audioSession = self->_audioSession;
        *(_DWORD *)buf = 138543874;
        v22 = self;
        v23 = 2114;
        v24 = audioSession;
        v25 = 2114;
        v26 = v7;
        _os_log_impl(&dword_1D33D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: -_deactivateAudioSession…: About to deactivate audio session %{public}@ for %{public}@.", buf, 0x20u);
      }

      v11 = self->_audioSession;
      v20 = 0;
      v12 = -[AVAudioSession setActive:withOptions:error:](v11, "setActive:withOptions:error:", 0, 1, &v20);
      v13 = v20;
      v8 = v13;
      if (!v12 || v13)
      {
        if (-[NSObject code](v13, "code") != 560030580)
        {
          TLLogPlayback();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v18 = self->_audioSession;
            -[NSObject tl_nonRedundantDescription](v8, "tl_nonRedundantDescription");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v22 = self;
            v23 = 2114;
            v24 = v18;
            v25 = 2114;
            v26 = v7;
            v27 = 2114;
            v28 = v19;
            _os_log_error_impl(&dword_1D33D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@: -_deactivateAudioSession…: Failed to deactivate audio session %{public}@ for %{public}@ with error: %{public}@.", buf, 0x2Au);

          }
          -[TLAlertQueuePlayerController _startObservingAudioSessionInterruptionNotificationsForStateDescriptor:](self, "_startObservingAudioSessionInterruptionNotificationsForStateDescriptor:", v4);
          goto LABEL_20;
        }
        self->_isAudioSessionActive = 0;
        TLLogPlayback();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v17 = self->_audioSession;
          *(_DWORD *)buf = 138543874;
          v22 = self;
          v23 = 2114;
          v24 = v17;
          v25 = 2114;
          v26 = v7;
          _os_log_error_impl(&dword_1D33D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@: -_deactivateAudioSession…: Failed to deactivate audio session %{public}@ for %{public}@ with error code AVAudioSessionErrorCodeIsBusy. Treating that as a successful audio session deactivation.", buf, 0x20u);
        }
      }
      else
      {
        self->_isAudioSessionActive = 0;
        TLLogPlayback();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = self->_audioSession;
          *(_DWORD *)buf = 138543874;
          v22 = self;
          v23 = 2114;
          v24 = v15;
          v25 = 2114;
          v26 = v7;
          _os_log_impl(&dword_1D33D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: -_deactivateAudioSession…: Successfully deactivated audio session %{public}@ for %{public}@.", buf, 0x20u);
        }
      }

    }
LABEL_20:

  }
}

- (void)_startObservingAudioSessionInterruptionNotificationsForStateDescriptor:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  TLAlertQueuePlayerController *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  if (!self->_isObservingAudioSessionInterruptionNotification)
  {
    self->_isObservingAudioSessionInterruptionNotification = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleAudioSessionInterruptionNotification_, *MEMORY[0x1E0C896F0], self->_audioSession);

    TLLogPlayback();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "playingAlert");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = self;
      v10 = 2114;
      v11 = v7;
      _os_log_impl(&dword_1D33D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_startObservingAudioSessionInterruptionNotifications…: Started observing interruptions for %{public}@.", (uint8_t *)&v8, 0x16u);

    }
  }

}

- (void)_stopObservingAudioSessionInterruptionNotificationsForStateDescriptor:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  TLAlertQueuePlayerController *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  if (self->_isObservingAudioSessionInterruptionNotification)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0C896F0], self->_audioSession);

    self->_isObservingAudioSessionInterruptionNotification = 0;
    TLLogPlayback();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "playingAlert");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = self;
      v10 = 2114;
      v11 = v7;
      _os_log_impl(&dword_1D33D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopObservingAudioSessionInterruptionNotifications…: Stopped observing interruptions for %{public}@.", (uint8_t *)&v8, 0x16u);

    }
  }

}

- (void)_handleAudioSessionInterruptionNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  TLAudioQueue *audioQueue;
  _QWORD v12[7];

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C89718]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0C89700]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  audioQueue = self->_audioQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__TLAlertQueuePlayerController__handleAudioSessionInterruptionNotification___block_invoke;
  v12[3] = &unk_1E952BC20;
  v12[4] = self;
  v12[5] = v7;
  v12[6] = v10;
  -[TLAudioQueue performTaskWithBlock:](audioQueue, "performTaskWithBlock:", v12);
}

uint64_t __76__TLAlertQueuePlayerController__handleAudioSessionInterruptionNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAudioSessionInterruptionOfType:withOptions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_handleAudioSessionInterruptionOfType:(unint64_t)a3 withOptions:(unint64_t)a4
{
  os_unfair_lock_s *p_lock;
  NSObject *v7;
  TLAlertQueuePlayerStateDescriptor *v8;
  TLAlertQueuePlayerStateDescriptor *v9;
  TLAlertQueuePlayerStateDescriptor *stateDescriptor;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  TLAlertQueuePlayerController *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  if (a3 == 1)
  {
    TLLogPlayback();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = self;
      _os_log_impl(&dword_1D33D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleAudioSessionInterruption…: Handling interruption of type AVAudioSessionInterruptionTypeBegan.", (uint8_t *)&v15, 0xCu);
    }

    os_unfair_lock_lock(p_lock);
    v8 = self->_stateDescriptor;
    -[TLAlertQueuePlayerStateDescriptor stateDescriptorForCompletedPlayback](self->_stateDescriptor, "stateDescriptorForCompletedPlayback");
    v9 = (TLAlertQueuePlayerStateDescriptor *)objc_claimAutoreleasedReturnValue();
    stateDescriptor = self->_stateDescriptor;
    self->_stateDescriptor = v9;

    TLLogPlayback();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[TLAlertQueuePlayerStateDescriptor debugDescription](self->_stateDescriptor, "debugDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v12;
      _os_log_impl(&dword_1D33D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleAudioSessionInterruption…: Updated _stateDescriptor to %{public}@.", (uint8_t *)&v15, 0x16u);

    }
    os_unfair_lock_unlock(p_lock);
    TLLogPlayback();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[TLAlertQueuePlayerStateDescriptor playingAlert](v8, "playingAlert");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v14;
      _os_log_impl(&dword_1D33D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleAudioSessionInterruption…: Resetting state and marking %{public}@ as interrupted by the system.", (uint8_t *)&v15, 0x16u);

    }
    self->_isAudioSessionActive = 0;
    -[TLAlertQueuePlayerController _stopObservingAudioSessionInterruptionNotificationsForStateDescriptor:](self, "_stopObservingAudioSessionInterruptionNotificationsForStateDescriptor:", v8);
    -[TLAlertQueuePlayerController _stopPlaybackForStateDescriptor:withOptions:playerWasAlreadyPausedExternally:](self, "_stopPlaybackForStateDescriptor:withOptions:playerWasAlreadyPausedExternally:", v8, 0, 1);
    -[TLAlertQueuePlayerStateDescriptor invokePlayingAlertCompletionHandlerWithPlaybackCompletionType:error:](v8, "invokePlayingAlertCompletionHandlerWithPlaybackCompletionType:error:", 4, 0);

  }
}

- (BOOL)_isPreventingAudioSessionDeactivation
{
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  return self->_audioSessionDeactivationPreventionRequestsCount != 0;
}

- (void)_beginPreventingAudioSessionDeactivation
{
  NSObject *v3;
  int v4;
  TLAlertQueuePlayerController *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  ++self->_audioSessionDeactivationPreventionRequestsCount;
  TLLogPlayback();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_1D33D5000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: -_beginPreventingAudioSessionDeactivation.", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_endPreventingAudioSessionDeactivationForStateDescriptor:(id)a3
{
  id v4;
  unint64_t audioSessionDeactivationPreventionRequestsCount;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 isAudioSessionActive;
  NSObject *v17;
  int v18;
  TLAlertQueuePlayerController *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  audioSessionDeactivationPreventionRequestsCount = self->_audioSessionDeactivationPreventionRequestsCount;
  if (!audioSessionDeactivationPreventionRequestsCount)
  {
    TLLogGeneral();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Playback/BackEnds/QueuePlayer/TLAlertQueuePlayerController.m");
      v8 = objc_claimAutoreleasedReturnValue();
      TLLogGeneral();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject lastPathComponent](v8, "lastPathComponent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 136381443;
        v19 = (TLAlertQueuePlayerController *)"-[TLAlertQueuePlayerController _endPreventingAudioSessionDeactivationForStateDescriptor:]";
        v20 = 2113;
        v21 = v10;
        v22 = 2049;
        v23 = 2069;
        v24 = 2113;
        v25 = v11;
        _os_log_impl(&dword_1D33D5000, v9, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v18, 0x2Au);

      }
    }
    else
    {
      TLLogGeneral();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
    }

    TLLogGeneral();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[TLAlertQueuePlayerController _endPreventingAudioSessionDeactivationForStateDescriptor:].cold.1();

    audioSessionDeactivationPreventionRequestsCount = self->_audioSessionDeactivationPreventionRequestsCount;
  }
  self->_audioSessionDeactivationPreventionRequestsCount = audioSessionDeactivationPreventionRequestsCount - 1;
  TLLogPlayback();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138543618;
    v19 = self;
    v20 = 2114;
    v21 = v4;
    _os_log_impl(&dword_1D33D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -_endPreventingAudioSessionDeactivationForStateDescriptor:(%{public}@).", (uint8_t *)&v18, 0x16u);
  }

  if (!self->_audioSessionDeactivationPreventionRequestsCount)
  {
    objc_msgSend(v4, "playingAlert");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      TLLogPlayback();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138543362;
        v19 = self;
        _os_log_impl(&dword_1D33D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: -_endPreventingAudioSessionDeactivation…: No alert was playing, calling -_deactivateAudioSessionIfNeeded…", (uint8_t *)&v18, 0xCu);
      }

      isAudioSessionActive = self->_isAudioSessionActive;
      -[TLAlertQueuePlayerController _deactivateAudioSessionIfNeededForStateDescriptor:](self, "_deactivateAudioSessionIfNeededForStateDescriptor:", v4);
      if (isAudioSessionActive && !self->_isAudioSessionActive)
      {
        -[TLAlertQueuePlayerController _resetClientPriorityForStateDescriptor:](self, "_resetClientPriorityForStateDescriptor:", v4);
      }
      else
      {
        TLLogPlayback();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138543362;
          v19 = self;
          _os_log_impl(&dword_1D33D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -_endPreventingAudioSessionDeactivation…: Skipping reset client priority because the audio session was NOT just deactivated.", (uint8_t *)&v18, 0xCu);
        }

      }
    }
  }

}

+ (BOOL)_shouldVibrateForAlert:(id)a3
{
  id v3;
  void *v4;
  char v5;
  char v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "type") == 18
    && (objc_msgSend(v3, "configuration"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "shouldIgnoreRingerSwitch"),
        v4,
        (v5 & 1) != 0))
  {
    v6 = 1;
  }
  else
  {
    +[TLVibrationManager sharedVibrationManager](TLVibrationManager, "sharedVibrationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "shouldVibrateForCurrentRingerSwitchState");

  }
  return v6;
}

+ (BOOL)_shouldRepeatVibrationForAlert:(id)a3 externalEnvironmentValues:(id)a4
{
  id v6;
  char v7;

  v6 = a3;
  if (+[TLAlertPlaybackPolicy shouldRepeatVibrationForAlert:withPlaybackBackend:](TLAlertPlaybackPolicy, "shouldRepeatVibrationForAlert:withPlaybackBackend:", v6, 0))
  {
    v7 = 1;
  }
  else
  {
    v7 = objc_msgSend(a1, "_shouldApplyStandardDelayAndAudioVolumeRampForAlert:externalEnvironmentValues:", v6, *(unsigned __int16 *)&a4);
  }

  return v7;
}

+ (BOOL)_shouldApplyAttentionAwarenessEffectsForAlert:(id)a3
{
  id v3;
  void *v4;
  char v5;
  BOOL v6;
  unint64_t v7;

  v3 = a3;
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isForPreview");

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_msgSend(v3, "type");
    v6 = 0;
    if (v7 <= 0x1C && ((1 << v7) & 0x10006002) != 0)
      v6 = +[TLAttentionAwarenessObserver supportsAttenuatingTonesForAttentionDetected](TLAttentionAwarenessObserver, "supportsAttenuatingTonesForAttentionDetected");
  }

  return v6;
}

+ (int64_t)_audioVolumeApplicationPolicyForAlert:(id)a3 externalEnvironmentValues:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_audioCategoryForAlert:externalEnvironmentValues:", v6, *(unsigned __int16 *)&a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C89658]))
  {
    +[TLCapabilitiesManager sharedCapabilitiesManager](TLCapabilitiesManager, "sharedCapabilitiesManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isHomePod");

    if (v9)
      v10 = 1;
    else
      v10 = 2;
  }
  else
  {
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C89668]))
    {
      objc_msgSend(a1, "_audioModeForAlert:audioCategory:", v6, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C89750]))
        v10 = 3;
      else
        v10 = 1;
    }
    else
    {
      v12 = objc_msgSend(v6, "type");
      objc_msgSend(v6, "configuration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "topic");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == 17)
      {
        v14 = objc_msgSend(v11, "isEqualToString:", CFSTR("TLAlertTopicAppNotificationCriticalAlert")) ^ 1;
        if (a4.var0)
          v10 = v14;
        else
          v10 = 1;
      }
      else
      {
        v10 = 1;
      }
    }

  }
  return v10;
}

+ (double)_audioPlaybackInitiationDelayForAlert:(id)a3 externalEnvironmentValues:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;

  v6 = a3;
  objc_msgSend(v6, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_audioPlaybackInitiationDelay");
  v9 = v8;
  if (v8 <= 0.00000011920929
    && objc_msgSend(a1, "_shouldApplyStandardDelayAndAudioVolumeRampForAlert:externalEnvironmentValues:", v6, *(unsigned __int16 *)&a4))
  {
    v9 = 3.0;
  }

  return v9;
}

+ (double)_audioVolumeRampingDurationForAlert:(id)a3 externalEnvironmentValues:(id)a4 toneAssetDuration:(double)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  int v12;
  double v13;

  v8 = a3;
  objc_msgSend(v8, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_audioVolumeRampingDuration");
  v11 = v10;
  if (v10 <= 0.00000011920929)
  {
    v12 = objc_msgSend(a1, "_shouldApplyStandardDelayAndAudioVolumeRampForAlert:externalEnvironmentValues:", v8, *(unsigned __int16 *)&a4);
    v13 = fmin(a5 * 0.5, 2.0);
    if (v12)
      v11 = v13;
  }

  return v11;
}

+ (BOOL)_shouldApplyStandardDelayAndAudioVolumeRampForAlert:(id)a3 externalEnvironmentValues:(id)a4
{
  unint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _BOOL4 v9;

  v4 = *(_QWORD *)&a4.var0;
  v5 = a3;
  v6 = objc_msgSend(v5, "type");
  objc_msgSend(v5, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "topic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == 17)
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicAppNotificationCriticalAlert")) & (v4 >> 8) & 1;
  else
    LOBYTE(v9) = 0;

  return v9;
}

- (id)_fallbackToneIdentifierForStateDescriptor:(id)a3
{
  TLAudioQueue *audioQueue;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;

  audioQueue = self->_audioQueue;
  v5 = a3;
  -[TLAudioQueue assertRunningOnAudioQueue](audioQueue, "assertRunningOnAudioQueue");
  objc_msgSend(v5, "playingAlert");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "type");
    +[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultToneIdentifierForAlertType:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentToneIdentifierForAlertType:topic:", v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NSString isEqualToString:](self->_playingToneIdentifier, "isEqualToString:", v9))
    {
      TLLogPlayback();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[TLAlertQueuePlayerController _fallbackToneIdentifierForStateDescriptor:].cold.1((uint64_t)self, v7, v13);

      v14 = 0;
    }
    else
    {
      if (-[NSString isEqualToString:](self->_playingToneIdentifier, "isEqualToString:", v12)
        && (objc_msgSend(v12, "isEqualToString:", v9) & 1) == 0)
      {
        v15 = v9;
      }
      else
      {
        v15 = v12;
      }
      v14 = v15;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ ($96EE1C12479E9B303E9C2794B92A11A2)_externalEnvironmentValuesForAlert:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  __int16 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == 17 && objc_msgSend(v7, "isEqualToString:", CFSTR("TLAlertTopicAppNotificationCriticalAlert")))
  {
    TLLogPlayback();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138543618;
      v20 = a1;
      v21 = 2114;
      v22 = v4;
      _os_log_impl(&dword_1D33D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: _externalEnvironmentValuesForAlert:(%{public}@).", (uint8_t *)&v19, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attributeForKey:", *MEMORY[0x1E0D47EE8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v10, "BOOLValue"))
      v11 = objc_msgSend(v10, "BOOLValue");
    else
      v11 = 0;
    TLLogPlayback();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138543874;
      v20 = a1;
      v21 = 2114;
      v22 = v4;
      v23 = 1024;
      LODWORD(v24) = v11;
      _os_log_impl(&dword_1D33D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: _externalEnvironmentValuesForAlert:(%{public}@): isIncomingCallActive = %{BOOL}d.", (uint8_t *)&v19, 0x1Cu);
    }

    objc_msgSend(MEMORY[0x1E0C8B2A8], "sharedSystemAudioContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "outputDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "deviceSubType");

    v12 = v16 == 4;
    TLLogPlayback();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138544130;
      v20 = a1;
      v21 = 2114;
      v22 = v4;
      v23 = 2048;
      v24 = v16;
      v25 = 1024;
      v26 = v16 == 4;
      _os_log_impl(&dword_1D33D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: _externalEnvironmentValuesForAlert:(%{public}@): outputDeviceSubType = %lld; usesReceiverRoute = %{BOOL}d.",
        (uint8_t *)&v19,
        0x26u);
    }

  }
  else
  {
    v12 = 0;
    LOWORD(v11) = 0;
  }

  return ($96EE1C12479E9B303E9C2794B92A11A2)(v11 | (v12 << 8));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectCoordinator, 0);
  objc_storeStrong((id *)&self->_attentionPollingToken, 0);
  objc_storeStrong((id *)&self->_previousAudioMode, 0);
  objc_storeStrong((id *)&self->_previousAudioCategory, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_queuePlayer, 0);
  objc_storeStrong((id *)&self->_toneAssetForPendingPlayingAlert, 0);
  objc_storeStrong((id *)&self->_playingToneIdentifier, 0);
  objc_storeStrong((id *)&self->_stateDescriptor, 0);
  objc_storeStrong((id *)&self->_audioQueue, 0);
}

- (void)stopPlayingAlerts:withOptions:playbackCompletionType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1D33D5000, v0, v1, "API misuse.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)_handleActivationAssertionStatusChangeForAlert:updatedStatus:previousStateDescriptor:updatedStateDescriptor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1D33D5000, v0, v1, "SPI misuse.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)_reloadPlaybackForStateDescriptor:withToneIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1D33D5000, v0, v1, "%{public}@: -_reloadPlayback…: Failed to prepare tone asset for playback. Aborting.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_reloadPlaybackForStateDescriptor:withToneIdentifier:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D33D5000, v0, v1, "%{public}@: -_reloadPlayback…: Failed to instantiate an AVURLAsset with URL: %{public}@.");
  OUTLINED_FUNCTION_7();
}

- (void)_reloadPlaybackForStateDescriptor:withToneIdentifier:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1D33D5000, v0, v1, "%{public}@: -_reloadPlayback…: [_queuePlayer status] == AVPlayerStatusFailed for %{public}@. Destroying player.");
  OUTLINED_FUNCTION_7();
}

- (void)_startPlaybackForStateDescriptor:usingConfirmedPlayableAsset:hasAlreadyDetectedUserAttention:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1D33D5000, v0, v1, "Vibration pattern on the _queuePlayer was expected to be nil at this point.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)_startPlaybackForStateDescriptor:usingConfirmedPlayableAsset:hasAlreadyDetectedUserAttention:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1D33D5000, v0, v1, "%{public}@: -_startPlayback… hasAlreadyDetected…: Failed to wrap external vibration pattern as an instance of TLVibrationPattern. Falling back to passing the external vibration pattern through.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_queuePlayer:currentItemWasUpdatedFromValue:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D33D5000, v0, v1, "%{public}@: currentItemWasUpdated…: [_queuePlayer status] == AVPlayerStatusFailed for %{public}@.");
  OUTLINED_FUNCTION_7();
}

- (void)_queuePlayer:currentItemStatusWasUpdatedToValue:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = 2048;
  v4 = 2;
  v5 = 2114;
  v6 = v0;
  _os_log_error_impl(&dword_1D33D5000, v1, OS_LOG_TYPE_ERROR, "%{public}@: currentItemStatusWasUpdatedToValue:(%ld) for %{public}@. Tone could not be prepared for playback. Start over with fallback tone.", v2, 0x20u);
}

- (void)_endPreventingAudioSessionDeactivationForStateDescriptor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1D33D5000, v0, v1, "Unbalanced calls to -_beginPreventingAudioSessionDeactivation… and -_endPreventingAudioSessionDeactivation….", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)_fallbackToneIdentifierForStateDescriptor:(NSObject *)a3 .cold.1(uint64_t a1, unint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromTLAlertType(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1D33D5000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Failed to prepare default tone for alert type %{public}@ for playback. All possible fallback cases have been exhausted. Bailing.", (uint8_t *)&v6, 0x16u);

}

@end
