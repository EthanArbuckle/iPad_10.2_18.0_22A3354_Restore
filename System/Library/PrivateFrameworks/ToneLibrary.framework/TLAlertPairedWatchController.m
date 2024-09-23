@implementation TLAlertPairedWatchController

- (TLAlertPairedWatchController)init
{
  TLAlertPairedWatchController *v2;
  uint64_t v3;
  TLAudioQueue *audioQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TLAlertPairedWatchController;
  v2 = -[TLAlertPairedWatchController init](&v6, sel_init);
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

  os_unfair_lock_assert_not_owner(&self->_lock);
  audioQueue = self->_audioQueue;
  self->_audioQueue = 0;
  v4 = audioQueue;

  -[TLAudioQueue assertNotRunningOnAudioQueue](v4, "assertNotRunningOnAudioQueue");
  -[TLAudioQueue performSynchronousTaskWithBlock:](v4, "performSynchronousTaskWithBlock:", &__block_literal_global_7);

  v5.receiver = self;
  v5.super_class = (Class)TLAlertPairedWatchController;
  -[TLAlertPairedWatchController dealloc](&v5, sel_dealloc);
}

- (void)playAlert:(id)a3 withCompletionHandler:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  TLAlertPairedWatchPlaybackContext *v9;
  TLAlertPairedWatchPlaybackContext *v10;
  TLAudioQueue *audioQueue;
  TLAlertPairedWatchPlaybackContext *v12;
  TLAlertPairedWatchPlaybackContext *v13;
  _QWORD v14[4];
  TLAlertPairedWatchPlaybackContext *v15;
  TLAlertPairedWatchController *v16;
  TLAlertPairedWatchPlaybackContext *v17;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  v9 = -[TLAlertPairedWatchPlaybackContext initWithAlert:completionHandler:]([TLAlertPairedWatchPlaybackContext alloc], "initWithAlert:completionHandler:", v8, v7);

  os_unfair_lock_lock(p_lock);
  v10 = self->_playbackContext;
  objc_storeStrong((id *)&self->_playbackContext, v9);
  os_unfair_lock_unlock(p_lock);
  audioQueue = self->_audioQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__TLAlertPairedWatchController_playAlert_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E952AE10;
  v15 = v10;
  v16 = self;
  v17 = v9;
  v12 = v9;
  v13 = v10;
  -[TLAudioQueue performTaskWithBlock:](audioQueue, "performTaskWithBlock:", v14);

}

uint64_t __64__TLAlertPairedWatchController_playAlert_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    objc_msgSend(*(id *)(a1 + 40), "_stopPlayingAlertWithContext:withOptions:playbackCompletionType:", v2, 0, 4);
  return objc_msgSend(*(id *)(a1 + 40), "_playAlertWithContext:", *(_QWORD *)(a1 + 48));
}

- (void)_playAlertWithContext:(id)a3
{
  TLAlertPairedWatchPlaybackContext *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  int64_t v16;
  dispatch_time_t v17;
  void *v18;
  _QWORD v19[5];
  TLAlertPairedWatchPlaybackContext *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE buf[24];
  void *v26;
  uint64_t *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (TLAlertPairedWatchPlaybackContext *)a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  -[TLAlertPairedWatchPlaybackContext alert](v4, "alert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");
  objc_msgSend(v5, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  TLLogPlayback();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl(&dword_1D33D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: -_playAlertWithContext: […]: Beginning playback for %{public}@.", buf, 0x16u);
  }

  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v9 = (void *)getNACAlertProxyClass_softClass;
  v24 = getNACAlertProxyClass_softClass;
  if (!getNACAlertProxyClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getNACAlertProxyClass_block_invoke;
    v26 = &unk_1E952AB10;
    v27 = &v21;
    __getNACAlertProxyClass_block_invoke((uint64_t)buf);
    v9 = (void *)v22[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v21, 8);
  objc_msgSend(v10, "alertProxyWithConfiguration:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLAlertPairedWatchPlaybackContext setAlertProxy:](v4, "setAlertProxy:", v11);
  TLLogPlayback();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[TLAlertPairedWatchController _playAlertWithContext:].cold.1((uint64_t)self, v13);

    os_unfair_lock_lock(&self->_lock);
    if (self->_playbackContext == v4)
    {
      self->_playbackContext = 0;

      objc_msgSend(MEMORY[0x1E0CB35C8], "tl_errorWithDomain:description:", CFSTR("TLAlertErrorDomain"), CFSTR("Failed to create alert proxy using NanoAudioControl."));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock(&self->_lock);
      -[TLAlertPairedWatchController _processCompletionForAlertWithContext:playbackCompletionType:error:](self, "_processCompletionForAlertWithContext:playbackCompletionType:error:", v4, 5, v18);

      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_1D33D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -_playAlertWithContext: […]: Created NanoAudioControl alert proxy: %{public}@.", buf, 0x16u);
  }

  os_unfair_lock_lock(&self->_lock);
  if (self->_playbackContext != v4)
  {
LABEL_21:
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_22;
  }
  os_unfair_lock_unlock(&self->_lock);
  TLLogPlayback();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_1D33D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: -_playAlertWithContext: […]: Will call -play on NanoAudioControl alert proxy: %{public}@.", buf, 0x16u);
  }

  objc_msgSend(v11, "play");
  TLLogPlayback();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_1D33D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: -_playAlertWithContext: […]: Did call -play on NanoAudioControl alert proxy: %{public}@.", buf, 0x16u);
  }

  if ((objc_msgSend(v7, "shouldRepeat") & 1) == 0)
  {
    if (v6 == 1)
      v16 = 4000000000;
    else
      v16 = 2000000000;
    v17 = dispatch_time(0, v16);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __54__TLAlertPairedWatchController__playAlertWithContext___block_invoke;
    v19[3] = &unk_1E952A6A8;
    v19[4] = self;
    v20 = v4;
    dispatch_after(v17, MEMORY[0x1E0C80D38], v19);

  }
LABEL_22:

}

uint64_t __54__TLAlertPairedWatchController__playAlertWithContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didCompletePlaybackForAlertWithContext:", *(_QWORD *)(a1 + 40));
}

- (void)_didCompletePlaybackForAlertWithContext:(id)a3
{
  TLAlertPairedWatchPlaybackContext *v4;

  v4 = (TLAlertPairedWatchPlaybackContext *)a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (self->_playbackContext == v4)
  {
    self->_playbackContext = 0;

    os_unfair_lock_unlock(&self->_lock);
    -[TLAlertPairedWatchController _processCompletionForAlertWithContext:playbackCompletionType:error:](self, "_processCompletionForAlertWithContext:playbackCompletionType:error:", v4, 0, 0);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)_processCompletionForAlertWithContext:(id)a3 playbackCompletionType:(int64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  int64_t v22;
  uint8_t buf[4];
  TLAlertPairedWatchController *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  objc_msgSend(v8, "alert");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  TLLogPlayback();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromTLAlertPlaybackCompletionType(a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "tl_nonRedundantDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v24 = self;
      v25 = 2114;
      v26 = v10;
      v27 = 2114;
      v28 = v13;
      v29 = 2114;
      v30 = v14;
      _os_log_error_impl(&dword_1D33D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Processing completion for alert %{public}@ with completion type %{public}@ and error: %{public}@.", buf, 0x2Au);

LABEL_6:
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromTLAlertPlaybackCompletionType(a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v24 = self;
    v25 = 2114;
    v26 = v10;
    v27 = 2114;
    v28 = v13;
    _os_log_impl(&dword_1D33D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Processing completion for alert %{public}@ with completion type %{public}@.", buf, 0x20u);
    goto LABEL_6;
  }

  objc_msgSend(v8, "completionHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__TLAlertPairedWatchController__processCompletionForAlertWithContext_playbackCompletionType_error___block_invoke;
  block[3] = &unk_1E952B620;
  v21 = v15;
  v22 = a4;
  v20 = v9;
  v17 = v9;
  v18 = v15;
  dispatch_async(v16, block);

}

uint64_t __99__TLAlertPairedWatchController__processCompletionForAlertWithContext_playbackCompletionType_error___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (BOOL)stopPlayingAlerts:(id)a3 withOptions:(id)a4 playbackCompletionType:(int64_t)a5
{
  id v7;
  TLAlertPairedWatchPlaybackContext *v8;
  TLAlertPairedWatchPlaybackContext *playbackContext;
  TLAudioQueue *audioQueue;
  _QWORD v12[5];
  TLAlertPairedWatchPlaybackContext *v13;
  id v14;
  int64_t v15;

  v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v8 = self->_playbackContext;
  playbackContext = self->_playbackContext;
  self->_playbackContext = 0;

  os_unfair_lock_unlock(&self->_lock);
  if (v8)
  {
    audioQueue = self->_audioQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __85__TLAlertPairedWatchController_stopPlayingAlerts_withOptions_playbackCompletionType___block_invoke;
    v12[3] = &unk_1E952B648;
    v12[4] = self;
    v13 = v8;
    v14 = v7;
    v15 = a5;
    -[TLAudioQueue performTaskWithBlock:](audioQueue, "performTaskWithBlock:", v12);

  }
  return v8 != 0;
}

uint64_t __85__TLAlertPairedWatchController_stopPlayingAlerts_withOptions_playbackCompletionType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopPlayingAlertWithContext:withOptions:playbackCompletionType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_stopPlayingAlertWithContext:(id)a3 withOptions:(id)a4 playbackCompletionType:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  TLAlertPairedWatchController *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[TLAudioQueue assertRunningOnAudioQueue](self->_audioQueue, "assertRunningOnAudioQueue");
  objc_msgSend(v8, "alertProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  TLLogPlayback();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543618;
    v14 = self;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1D33D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopPlayingAlertWithContext: […]: Will call -stop… on NanoAudioControl alert proxy: %{public}@.", (uint8_t *)&v13, 0x16u);
  }

  objc_msgSend(v10, "stopWithOptions:", v9);
  TLLogPlayback();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543618;
    v14 = self;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1D33D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopPlayingAlertWithContext: […]: Did call -stop… on NanoAudioControl alert proxy: %{public}@.", (uint8_t *)&v13, 0x16u);
  }

  -[TLAlertPairedWatchController _processCompletionForAlertWithContext:playbackCompletionType:error:](self, "_processCompletionForAlertWithContext:playbackCompletionType:error:", v8, a5, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackContext, 0);
  objc_storeStrong((id *)&self->_audioQueue, 0);
}

- (void)_playAlertWithContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D33D5000, a2, OS_LOG_TYPE_ERROR, "%{public}@: -_playAlertWithContext: […]: Failed to create NanoAudioControl alert proxy.", (uint8_t *)&v2, 0xCu);
}

@end
