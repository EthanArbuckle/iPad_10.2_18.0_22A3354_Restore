@implementation TLAlertController

+ (TLAlertController)sharedAlertController
{
  if (sharedAlertController__TLAlertControllerSharedInstanceOnceToken != -1)
    dispatch_once(&sharedAlertController__TLAlertControllerSharedInstanceOnceToken, &__block_literal_global_14);
  return (TLAlertController *)(id)sharedAlertController__TLAlertControllerSharedInstance;
}

void __42__TLAlertController_sharedAlertController__block_invoke()
{
  TLAlertController *v0;
  void *v1;

  v0 = objc_alloc_init(TLAlertController);
  v1 = (void *)sharedAlertController__TLAlertControllerSharedInstance;
  sharedAlertController__TLAlertControllerSharedInstance = (uint64_t)v0;

}

- (TLAlertController)init
{
  TLAlertController *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *accessQueueLabel;
  dispatch_queue_t v12;
  OS_dispatch_queue *accessQueue;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)TLAlertController;
  v2 = -[TLAlertController init](&v21, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@-%@-%@"), v6, v7, CFSTR("AccessQueue"), v9);
    v10 = objc_claimAutoreleasedReturnValue();
    accessQueueLabel = v2->_accessQueueLabel;
    v2->_accessQueueLabel = (NSString *)v10;

    v12 = dispatch_queue_create(-[NSString UTF8String](v2->_accessQueueLabel, "UTF8String"), 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v12;

    +[TLSystemApplication defaultSystemApplication](TLSystemApplication, "defaultSystemApplication");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_4;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqualToString:", v17);

    if ((v18 & 1) == 0)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObserver:selector:name:object:", v2, sel__handleUserInterruptionNotification_, CFSTR("_TLAlertControllerUserInterruptionNotification"), 0);

    }
  }
  return v2;
}

- (void)dealloc
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *accessQueue;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  objc_super v11;
  _QWORD block[5];

  v3 = self->_accessQueue;
  accessQueue = self->_accessQueue;
  self->_accessQueue = 0;

  +[TLSystemApplication defaultSystemApplication](TLSystemApplication, "defaultSystemApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObserver:name:object:", self, CFSTR("_TLAlertControllerUserInterruptionNotification"), 0);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__TLAlertController_dealloc__block_invoke;
  block[3] = &unk_1E952A748;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)v3, block);

  v11.receiver = self;
  v11.super_class = (Class)TLAlertController;
  -[TLAlertController dealloc](&v11, sel_dealloc);
}

void __28__TLAlertController_dealloc__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_stopAllAlertsInCurrentProcessWithUserInterruptionDate:", v2);

}

- (void)_performBlockOnAccessQueue:(id)a3
{
  NSObject *accessQueue;

  accessQueue = self->_accessQueue;
  if (accessQueue)
    dispatch_sync(accessQueue, a3);
}

- (void)_assertRunningOnAccessQueue
{
  NSObject *accessQueue;
  const char *label;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  accessQueue = self->_accessQueue;
  if (accessQueue)
  {
    dispatch_assert_queue_V2(accessQueue);
  }
  else
  {
    label = dispatch_queue_get_label(0);
    if (strcmp(label, -[NSString UTF8String](self->_accessQueueLabel, "UTF8String")))
    {
      TLLogGeneral();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Playback/TLAlertController.m");
        v7 = objc_claimAutoreleasedReturnValue();
        TLLogGeneral();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject lastPathComponent](v7, "lastPathComponent");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 136381443;
          v27 = "-[TLAlertController _assertRunningOnAccessQueue]";
          v28 = 2113;
          v29 = v9;
          v30 = 2049;
          v31 = 117;
          v32 = 2113;
          v33 = v10;
          _os_log_impl(&dword_1D33D5000, v8, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v26, 0x2Au);

        }
      }
      else
      {
        TLLogGeneral();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[TLToneStoreDownloadStoreServicesController _assertRunningOnAccessQueue].cold.2(v7, v11, v12, v13, v14, v15, v16, v17);
      }

      TLLogGeneral();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[TLToneStoreDownloadStoreServicesController _assertRunningOnAccessQueue].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);

    }
  }
}

- (BOOL)stopAllAlerts
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  BOOL v17;
  _QWORD v19[5];
  id v20;
  __int128 *p_buf;
  const __CFString *v22;
  id v23;
  uint8_t v24[4];
  TLAlertController *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  id v29;
  __int128 buf;
  uint64_t v31;
  char v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  TLLogPlayback();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1D33D5000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: -stopAllAlerts was called.", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x2020000000;
  v32 = 0;
  +[TLSystemApplication defaultSystemApplication](TLSystemApplication, "defaultSystemApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __34__TLAlertController_stopAllAlerts__block_invoke;
    v19[3] = &unk_1E952A770;
    p_buf = &buf;
    v19[4] = self;
    v10 = v4;
    v20 = v10;
    -[TLAlertController _performBlockOnAccessQueue:](self, "_performBlockOnAccessQueue:", v19);
    TLLogPlayback();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v24 = 138543874;
      v25 = self;
      v26 = 2114;
      v27 = CFSTR("_TLAlertControllerUserInterruptionNotification");
      v28 = 2114;
      v29 = v10;
      _os_log_impl(&dword_1D33D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Will post %{public}@ notification with user interruption date: %{public}@.", v24, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = CFSTR("userInterruptionDate");
    v23 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("_TLAlertControllerUserInterruptionNotification"), 0, v13);

    TLLogPlayback();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v24 = 138543874;
      v25 = self;
      v26 = 2114;
      v27 = CFSTR("_TLAlertControllerUserInterruptionNotification");
      v28 = 2114;
      v29 = v10;
      _os_log_impl(&dword_1D33D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Did post %{public}@ notification with user interruption date: %{public}@.", v24, 0x20u);
    }

  }
  else
  {
LABEL_10:
    v15 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(v5, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The method +[TLAlert _stopAllAlerts] should not be called from anywere except the %@ process."), v16);

  }
  v17 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v17;
}

uint64_t __34__TLAlertController_stopAllAlerts__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_stopAllAlertsInCurrentProcessWithUserInterruptionDate:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)playAlert:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__8;
  v23 = __Block_byref_object_dispose__8;
  v24 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __53__TLAlertController_playAlert_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E952A770;
  v18 = &v19;
  v16[4] = self;
  v9 = v6;
  v17 = v9;
  -[TLAlertController _performBlockOnAccessQueue:](self, "_performBlockOnAccessQueue:", v16);
  v10 = (void *)v20[5];
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __53__TLAlertController_playAlert_withCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E952BB30;
  v13[4] = self;
  v11 = v9;
  v14 = v11;
  v12 = v7;
  v15 = v12;
  objc_msgSend(v10, "playAlert:withCompletionHandler:", v11, v13);

  _Block_object_dispose(&v19, 8);
}

void __53__TLAlertController_playAlert_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_prepareForPlayingAlert:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __53__TLAlertController_playAlert_withCompletionHandler___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v7 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__TLAlertController_playAlert_withCompletionHandler___block_invoke_3;
  v8[3] = &unk_1E952A6A8;
  v5 = (void *)a1[5];
  v9 = (id)a1[4];
  v10 = v5;
  objc_msgSend(v9, "_performBlockOnAccessQueue:", v8);
  v6 = a1[6];
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);

}

uint64_t __53__TLAlertController_playAlert_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didCompletePlaybackOfAlert:", *(_QWORD *)(a1 + 40));
}

- (BOOL)stopPlayingAlerts:(id)a3 withOptions:(id)a4 playbackCompletionType:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  int64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a3;
  v9 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__TLAlertController_stopPlayingAlerts_withOptions_playbackCompletionType___block_invoke;
  v13[3] = &unk_1E952BB58;
  v16 = &v18;
  v13[4] = self;
  v10 = v8;
  v14 = v10;
  v11 = v9;
  v15 = v11;
  v17 = a5;
  -[TLAlertController _performBlockOnAccessQueue:](self, "_performBlockOnAccessQueue:", v13);
  LOBYTE(a5) = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return a5;
}

uint64_t __74__TLAlertController_stopPlayingAlerts_withOptions_playbackCompletionType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_stopPlayingAlerts:withOptions:playbackCompletionType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (void)updateAudioVolumeDynamicallyForAlert:(id)a3 toValue:(float)a4
{
  id v6;
  id v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  TLAlertController *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__8;
  v20 = __Block_byref_object_dispose__8;
  v21 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __66__TLAlertController_updateAudioVolumeDynamicallyForAlert_toValue___block_invoke;
  v12 = &unk_1E952A888;
  v13 = self;
  v7 = v6;
  v14 = v7;
  v15 = &v16;
  -[TLAlertController _performBlockOnAccessQueue:](self, "_performBlockOnAccessQueue:", &v9);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *(float *)&v8 = a4;
    objc_msgSend((id)v17[5], "updateAudioVolumeDynamicallyForAlert:toValue:", v7, v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Updating the audio volume of %@ is not supported. Please refer to TLAlert_Private.h for more details on the limitations of the audio volume dynamic update API."), v7, v9, v10, v11, v12, v13);
  }

  _Block_object_dispose(&v16, 8);
}

void __66__TLAlertController_updateAudioVolumeDynamicallyForAlert_toValue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_controllerForPlaybackBackEnd:", objc_msgSend((id)objc_opt_class(), "_playbackBackEndForAlert:", *(_QWORD *)(a1 + 40)));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)handleActivationAssertionStatusChangeForAlert:(id)a3 updatedStatus:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  TLAlertController *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a4;
  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__8;
  v19 = __Block_byref_object_dispose__8;
  v20 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __81__TLAlertController_handleActivationAssertionStatusChangeForAlert_updatedStatus___block_invoke;
  v11 = &unk_1E952A888;
  v12 = self;
  v7 = v6;
  v13 = v7;
  v14 = &v15;
  -[TLAlertController _performBlockOnAccessQueue:](self, "_performBlockOnAccessQueue:", &v8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)v16[5], "handleActivationAssertionStatusChangeForAlert:updatedStatus:", v7, v4);
  else
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Setting up an activation assertion for %@ is not supported."), v7, v8, v9, v10, v11, v12);

  _Block_object_dispose(&v15, 8);
}

void __81__TLAlertController_handleActivationAssertionStatusChangeForAlert_updatedStatus___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_controllerForPlaybackBackEnd:", objc_msgSend((id)objc_opt_class(), "_playbackBackEndForAlert:", *(_QWORD *)(a1 + 40)));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_prepareForPlayingAlert:(id)a3
{
  id v4;
  uint64_t v5;
  TLAlertContext *v6;
  void *v7;
  NSMapTable *alertContexts;
  NSMapTable *v9;
  NSMapTable *v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  dispatch_time_t v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  TLAlertController *v22;
  id v23;

  v4 = a3;
  -[TLAlertController _assertRunningOnAccessQueue](self, "_assertRunningOnAccessQueue");
  v5 = objc_msgSend((id)objc_opt_class(), "_playbackBackEndForAlert:", v4);
  v6 = objc_alloc_init(TLAlertContext);
  -[TLAlertContext setPlaybackBackEnd:](v6, "setPlaybackBackEnd:", v5);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLAlertContext setPlaybackStartDate:](v6, "setPlaybackStartDate:", v7);

  alertContexts = self->_alertContexts;
  if (!alertContexts)
  {
    v9 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 1);
    v10 = self->_alertContexts;
    self->_alertContexts = v9;

    alertContexts = self->_alertContexts;
  }
  -[NSMapTable setObject:forKey:](alertContexts, "setObject:forKey:", v6, v4);
  objc_msgSend(v4, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "maximumDuration");
  v13 = v12;

  if (v13 > 0.00000011920929)
  {
    v14 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_accessQueue);
    v15 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
    dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __45__TLAlertController__prepareForPlayingAlert___block_invoke;
    v21 = &unk_1E952A6A8;
    v22 = self;
    v23 = v4;
    dispatch_source_set_event_handler(v14, &v18);
    -[TLAlertContext setTimeoutTimerSource:](v6, "setTimeoutTimerSource:", v14, v18, v19, v20, v21, v22);
    dispatch_resume(v14);

  }
  -[TLAlertController _controllerForPlaybackBackEnd:](self, "_controllerForPlaybackBackEnd:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __45__TLAlertController__prepareForPlayingAlert___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReachTimeoutForAlert:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_stopPlayingAlerts:(id)a3 withOptions:(id)a4 playbackCompletionType:(int64_t)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  id v35;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  TLAlertController *v48;
  __int16 v49;
  uint64_t v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v35 = a4;
  -[TLAlertController _assertRunningOnAccessQueue](self, "_assertRunningOnAccessQueue");
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (!v8)
  {
    v10 = 0;
    goto LABEL_23;
  }
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v43;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v43 != v11)
        objc_enumerationMutation(obj);
      v13 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
      -[NSMapTable objectForKey:](self->_alertContexts, "objectForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v14)
      {
        TLLogPlayback();
        v16 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          goto LABEL_19;
        *(_DWORD *)buf = 138543618;
        v48 = self;
        v49 = 2114;
        v50 = v13;
        v17 = v16;
        v18 = "%{public}@: No alert context could be found for %{public}@. This alert is not playing; ignoring stop request.";
        goto LABEL_12;
      }
      if (objc_msgSend(v14, "isBeingInterrupted"))
      {
        TLLogPlayback();
        v16 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          goto LABEL_19;
        *(_DWORD *)buf = 138543618;
        v48 = self;
        v49 = 2114;
        v50 = v13;
        v17 = v16;
        v18 = "%{public}@: %{public}@ is already being interrupted; ignoring stop request.";
LABEL_12:
        _os_log_impl(&dword_1D33D5000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0x16u);
        goto LABEL_19;
      }
      objc_msgSend(v15, "setBeingInterrupted:", 1);
      v19 = objc_msgSend(v15, "playbackBackEnd");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v16);
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = (id)v20;
      }
      else
      {
        v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (!v10)
          v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v10, "setObject:forKey:", v21, v16);
      }
      objc_msgSend(v21, "addObject:", v13);

LABEL_19:
    }
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  }
  while (v9);
LABEL_23:

  if (objc_msgSend(v10, "count"))
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v22 = v10;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    v24 = v35;
    if (v23)
    {
      v25 = v23;
      v26 = 0;
      v27 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v39 != v27)
            objc_enumerationMutation(v22);
          v29 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
          objc_msgSend(v22, "objectForKey:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[TLAlertController _controllerForPlaybackBackEnd:](self, "_controllerForPlaybackBackEnd:", objc_msgSend(v29, "integerValue"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v31;
          if (v31)
            v26 = (v26 | objc_msgSend(v31, "stopPlayingAlerts:withOptions:playbackCompletionType:", v30, v35, a5)) & 1;

        }
        v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v25);
    }
    else
    {
      LOBYTE(v26) = 0;
    }

    v33 = v26 & 1;
  }
  else
  {
    v33 = 0;
    v24 = v35;
  }

  return v33;
}

- (void)_didReachTimeoutForAlert:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TLAlertController _assertRunningOnAccessQueue](self, "_assertRunningOnAccessQueue");
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TLAlertController _stopPlayingAlerts:withOptions:playbackCompletionType:](self, "_stopPlayingAlerts:withOptions:playbackCompletionType:", v5, 0, 1);
}

- (void)_didCompletePlaybackOfAlert:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;

  v8 = a3;
  -[TLAlertController _assertRunningOnAccessQueue](self, "_assertRunningOnAccessQueue");
  -[NSMapTable objectForKey:](self->_alertContexts, "objectForKey:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "timeoutTimerSource");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      dispatch_source_cancel(v6);
    -[NSMapTable removeObjectForKey:](self->_alertContexts, "removeObjectForKey:", v8);

  }
}

- (void)preheatForAlert:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  TLAlertController *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__8;
  v20 = __Block_byref_object_dispose__8;
  v21 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __55__TLAlertController_preheatForAlert_completionHandler___block_invoke;
  v12 = &unk_1E952A888;
  v13 = self;
  v8 = v6;
  v14 = v8;
  v15 = &v16;
  -[TLAlertController _performBlockOnAccessQueue:](self, "_performBlockOnAccessQueue:", &v9);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)v17[5], "preheatForAlert:completionHandler:", v8, v7);
  else
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Pre-heating for %@ is not supported."), v8, v9, v10, v11, v12, v13);

  _Block_object_dispose(&v16, 8);
}

void __55__TLAlertController_preheatForAlert_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_controllerForPlaybackBackEnd:", objc_msgSend((id)objc_opt_class(), "_playbackBackEndForAlert:", *(_QWORD *)(a1 + 40)));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (int64_t)_playbackBackEndForAlert:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int64_t v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "topic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "_playbackBackEndForAlertType:topic:", v5, v7);
  if (objc_msgSend(v6, "targetDevice") == 1)
    v8 = 2;

  return v8;
}

+ (int64_t)_playbackBackEndForAlertType:(int64_t)a3 topic:(id)a4
{
  id v5;
  unsigned int v6;
  __CFString **v7;
  int64_t v8;

  v5 = a4;
  v6 = 1;
  switch(a3)
  {
    case 13:
      v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("TLAlertTopicAlarmGoToSleep"));
      break;
    case 14:
    case 18:
    case 28:
      goto LABEL_2;
    case 15:
    case 19:
    case 20:
    case 21:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
      break;
    case 16:
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("TLAlertTopicSystemNotificationFindMyDevice")) & 1) == 0
        && !objc_msgSend(v5, "isEqualToString:", CFSTR("TLAlertTopicSystemNotificationGeneric")))
      {
        goto LABEL_10;
      }
      goto LABEL_2;
    case 17:
      v7 = TLAlertTopicAppNotificationCriticalAlert;
      goto LABEL_13;
    case 22:
      v7 = TLAlertTopicSOSCountdownTick;
LABEL_13:
      v6 = objc_msgSend(v5, "isEqualToString:", *v7) ^ 1;
      break;
    default:
      if (a3 == 1)
      {
        if ((objc_msgSend(v5, "isEqualToString:", CFSTR("TLAlertTopicIncomingCallFaceTimeGroupInvitation")) & 1) != 0
          || (objc_msgSend(v5, "isEqualToString:", CFSTR("TLAlertTopicIncomingCallFaceTimeParticipantJoined")) & 1) != 0)
        {
LABEL_10:
          v6 = 1;
        }
        else
        {
LABEL_2:
          v6 = 0;
        }
      }
      break;
  }
  v8 = v6;

  return v8;
}

+ (BOOL)_shouldStopAlertForUserInterruption:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  int v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isForPreview");
  v6 = objc_msgSend(v3, "type");

  if (v6 == 28 || v6 == 22)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    v7 = v5 ^ 1;
    if (v6 == 1)
    {
      objc_msgSend(v4, "topic");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicIncomingCallFaceTimeGroupInvitation")) & 1) == 0
        && (objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicIncomingCallFaceTimeParticipantJoined")) & 1) == 0)
      {
        v7 &= objc_msgSend(v8, "isEqualToString:", CFSTR("TLAlertTopicIncomingCallAppNotification"));
      }

    }
  }

  return v7;
}

- (id)_controllerForPlaybackBackEnd:(int64_t)a3
{
  void *v5;

  -[TLAlertController _assertRunningOnAccessQueue](self, "_assertRunningOnAccessQueue");
  if (a3 == 2)
  {
    -[TLAlertController _pairedWatchController](self, "_pairedWatchController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    -[TLAlertController _systemSoundController](self, "_systemSoundController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v5 = 0;
  }
  else
  {
    -[TLAlertController _queuePlayerController](self, "_queuePlayerController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_queuePlayerController
{
  TLAlertQueuePlayerController *queuePlayerController;
  TLAlertQueuePlayerController *v4;
  TLAlertQueuePlayerController *v5;

  -[TLAlertController _assertRunningOnAccessQueue](self, "_assertRunningOnAccessQueue");
  queuePlayerController = self->_queuePlayerController;
  if (!queuePlayerController)
  {
    v4 = objc_alloc_init(TLAlertQueuePlayerController);
    v5 = self->_queuePlayerController;
    self->_queuePlayerController = v4;

    queuePlayerController = self->_queuePlayerController;
  }
  return queuePlayerController;
}

- (id)_systemSoundController
{
  TLAlertSystemSoundController *systemSoundController;
  TLAlertSystemSoundController *v4;
  TLAlertSystemSoundController *v5;

  -[TLAlertController _assertRunningOnAccessQueue](self, "_assertRunningOnAccessQueue");
  systemSoundController = self->_systemSoundController;
  if (!systemSoundController)
  {
    v4 = objc_alloc_init(TLAlertSystemSoundController);
    v5 = self->_systemSoundController;
    self->_systemSoundController = v4;

    systemSoundController = self->_systemSoundController;
  }
  return systemSoundController;
}

- (id)_pairedWatchController
{
  TLAlertPairedWatchController *pairedWatchController;
  TLAlertPairedWatchController *v4;
  TLAlertPairedWatchController *v5;

  -[TLAlertController _assertRunningOnAccessQueue](self, "_assertRunningOnAccessQueue");
  pairedWatchController = self->_pairedWatchController;
  if (!pairedWatchController)
  {
    v4 = objc_alloc_init(TLAlertPairedWatchController);
    v5 = self->_pairedWatchController;
    self->_pairedWatchController = v4;

    pairedWatchController = self->_pairedWatchController;
  }
  return pairedWatchController;
}

- (BOOL)_stopAllAlertsInCurrentProcessWithUserInterruptionDate:(id)a3
{
  NSObject *v4;
  NSMapTable *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  id v17;
  _BOOL4 v18;
  NSObject *v19;
  __int128 v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  TLAlertController *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  -[TLAlertController _assertRunningOnAccessQueue](self, "_assertRunningOnAccessQueue");
  TLLogPlayback();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v29 = self;
    v30 = 2114;
    v31 = v23;
    _os_log_impl(&dword_1D33D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopAllAlertsInCurrentProcessWithUserInterruptionDate:(%{public}@) was called.", buf, 0x16u);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = self->_alertContexts;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v6)
  {
    v8 = v6;
    v22 = 0;
    v9 = *(_QWORD *)v25;
    *(_QWORD *)&v7 = 138543874;
    v21 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend((id)objc_opt_class(), "_shouldStopAlertForUserInterruption:", v11))
        {
          -[NSMapTable objectForKey:](self->_alertContexts, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "playbackStartDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "compare:", v23);
          TLLogPlayback();
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
          if (v14 == -1)
          {
            if (v16)
            {
              *(_DWORD *)buf = v21;
              v29 = self;
              v30 = 2114;
              v31 = v13;
              v32 = 2114;
              v33 = v11;
              _os_log_impl(&dword_1D33D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopAllAlertsInCurrentProcess…: Playback started at %{public}@, i.e. before user interruption, for %{public}@. Scheduling this alert to be interrupted.", buf, 0x20u);
            }

            v17 = v22;
            if (!v22)
              v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v22 = v17;
            objc_msgSend(v17, "addObject:", v11, v21);
          }
          else
          {
            if (v16)
            {
              *(_DWORD *)buf = v21;
              v29 = self;
              v30 = 2114;
              v31 = v13;
              v32 = 2114;
              v33 = v11;
              _os_log_impl(&dword_1D33D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopAllAlertsInCurrentProcess…: Playback started at %{public}@, i.e. after user interruption, for %{public}@. Leaving this alert playing.", buf, 0x20u);
            }

          }
        }
      }
      v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v8);
  }
  else
  {
    v22 = 0;
  }

  v18 = -[TLAlertController _stopPlayingAlerts:withOptions:playbackCompletionType:](self, "_stopPlayingAlerts:withOptions:playbackCompletionType:", v22, 0, 3);
  TLLogPlayback();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v29 = self;
    v30 = 1024;
    LODWORD(v31) = v18;
    _os_log_impl(&dword_1D33D5000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: -_stopAllAlertsInCurrentProcess…: Returning willStopAnyAlert = %{BOOL}u.", buf, 0x12u);
  }

  return v18;
}

- (void)_handleUserInterruptionNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  TLAlertController *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TLLogPlayback();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v4;
    _os_log_impl(&dword_1D33D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleUserInterruptionNotification:(%{public}@).", buf, 0x16u);
  }

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("userInterruptionDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  TLLogPlayback();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_1D33D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleUserInterruption…: User interruption date: %{public}@.", buf, 0x16u);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__TLAlertController__handleUserInterruptionNotification___block_invoke;
  v10[3] = &unk_1E952A6A8;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  -[TLAlertController _performBlockOnAccessQueue:](self, "_performBlockOnAccessQueue:", v10);

}

uint64_t __57__TLAlertController__handleUserInterruptionNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopAllAlertsInCurrentProcessWithUserInterruptionDate:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertContexts, 0);
  objc_storeStrong((id *)&self->_pairedWatchController, 0);
  objc_storeStrong((id *)&self->_systemSoundController, 0);
  objc_storeStrong((id *)&self->_queuePlayerController, 0);
  objc_storeStrong((id *)&self->_accessQueueLabel, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
