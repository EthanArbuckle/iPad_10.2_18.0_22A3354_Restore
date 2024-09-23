@implementation VUIPlaybackPositionController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_23);
  return (id)sharedInstance_sharedInstance_1;
}

void __47__VUIPlaybackPositionController_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VUIPlaybackPositionController _init]([VUIPlaybackPositionController alloc], "_init");
  v1 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v0;

}

- (VUIPlaybackPositionController)init
{

  return 0;
}

- (void)beginCapturingEvents
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__VUIPlaybackPositionController_beginCapturingEvents__block_invoke;
  block[3] = &unk_1E9F98DF0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __53__VUIPlaybackPositionController_beginCapturingEvents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_beginCapturingEvents");
}

- (void)endCapturingEvents
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__VUIPlaybackPositionController_endCapturingEvents__block_invoke;
  block[3] = &unk_1E9F98DF0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __51__VUIPlaybackPositionController_endCapturingEvents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_endCapturingEvents");
}

- (void)persistPlaybackPositionInfo:(id)a3 forTrack:(id)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__VUIPlaybackPositionController_persistPlaybackPositionInfo_forTrack___block_invoke;
  block[3] = &unk_1E9F99840;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

uint64_t __70__VUIPlaybackPositionController_persistPlaybackPositionInfo_forTrack___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateEntityWithPlaybackPositionInfo:forTrack:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)_init
{
  VUIPlaybackPositionController *v2;
  os_log_t v3;
  OS_os_log *logObject;
  void *v5;
  void *v6;
  uint64_t v7;
  SBCPlaybackPositionSyncService *syncService;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VUIPlaybackPositionController;
  v2 = -[VUIPlaybackPositionController init](&v12, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.tv", "PlaybackPosition");
    logObject = v2->_logObject;
    v2->_logObject = (OS_os_log *)v3;

    objc_msgSend(MEMORY[0x1E0D51270], "autoupdatingSharedLibraryPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DAF440], "domainForSyncingMusicLibraryWithLibraryPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DAF458], "serviceForSyncDomain:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    syncService = v2->_syncService;
    v2->_syncService = (SBCPlaybackPositionSyncService *)v7;

    v9 = dispatch_queue_create("com.apple.tv.playbackPosition", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

  }
  return v2;
}

- (void)_onQueue_beginCapturingEvents
{
  OUTLINED_FUNCTION_0_11(&dword_1D96EE000, a1, a3, "Beginning capturing events", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_14();
}

- (void)_onQueue_endCapturingEvents
{
  OUTLINED_FUNCTION_0_11(&dword_1D96EE000, a1, a3, "End capturing events", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_14();
}

- (void)_onQueue_updateEntityWithPlaybackPositionInfo:(id)a3 forTrack:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  dispatch_semaphore_t v23;
  SBCPlaybackPositionSyncService *syncService;
  NSObject *v25;
  dispatch_time_t v26;
  _QWORD v27[4];
  NSObject *v28;
  id v29;
  id location;

  v6 = a3;
  v7 = a4;
  if (!-[VUIPlaybackPositionController isRunning](self, "isRunning"))
    -[VUIPlaybackPositionController _onQueue_beginCapturingEvents](self, "_onQueue_beginCapturingEvents");
  objc_msgSend(v7, "valueForProperty:", *MEMORY[0x1E0D51078]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0DAF448]);
  -[SBCPlaybackPositionSyncService playbackPositionDomain](self->_syncService, "playbackPositionDomain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithPlaybackPositionDomain:ubiquitousIdentifier:foreignDatabaseEntityID:", v10, v8, objc_msgSend(v7, "persistentID"));

  objc_msgSend(v6, "bookmarkTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "bookmarkTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;
  }
  else
  {
    objc_msgSend(v7, "valueForProperty:", *MEMORY[0x1E0D50C18]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v16 / 1000.0;
  }

  objc_msgSend(v6, "playCount");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(v6, "playCount");
  else
    objc_msgSend(v7, "valueForProperty:", *MEMORY[0x1E0D50F50]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntegerValue");

  objc_msgSend(v6, "hasBeenPlayed");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    objc_msgSend(v6, "hasBeenPlayed");
  else
    objc_msgSend(v7, "valueForProperty:", *MEMORY[0x1E0D50DF8]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "BOOLValue");

  objc_msgSend(v11, "setBookmarkTime:", v15);
  objc_msgSend(v11, "setUserPlayCount:", v19);
  objc_msgSend(v11, "setHasBeenPlayed:", v22);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v11, "setBookmarkTimestamp:");
  v23 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  syncService = self->_syncService;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __88__VUIPlaybackPositionController__onQueue_updateEntityWithPlaybackPositionInfo_forTrack___block_invoke;
  v27[3] = &unk_1E9F9B058;
  objc_copyWeak(&v29, &location);
  v25 = v23;
  v28 = v25;
  -[SBCPlaybackPositionSyncService persistPlaybackPositionEntity:isCheckpoint:completionBlock:](syncService, "persistPlaybackPositionEntity:isCheckpoint:completionBlock:", v11, 0, v27);
  v26 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(v25, v26);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

void __88__VUIPlaybackPositionController__onQueue_updateEntityWithPlaybackPositionInfo_forTrack___block_invoke(uint64_t a1, char a2)
{
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[1];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __88__VUIPlaybackPositionController__onQueue_updateEntityWithPlaybackPositionInfo_forTrack___block_invoke_cold_1(a2, v6);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncService, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_logObject, 0);
}

void __88__VUIPlaybackPositionController__onQueue_updateEntityWithPlaybackPositionInfo_forTrack___block_invoke_cold_1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1D96EE000, a2, OS_LOG_TYPE_DEBUG, "Updated bookmark: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_2_14();
}

@end
