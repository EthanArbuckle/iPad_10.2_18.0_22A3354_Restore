@implementation PXGridInlinePlaybackController

- (BOOL)shouldPlayOnHover
{
  return 0;
}

- (void)setAutoplaySettingEnabled:(BOOL)a3
{
  if (self->_autoplaySettingEnabled != a3)
  {
    self->_autoplaySettingEnabled = a3;
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateCanCreateRecords);
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updatePlaybackEnabled);
  }
}

- (void)preferencesDidChange
{
  -[PXGridInlinePlaybackController setAutoplaySettingEnabled:](self, "setAutoplaySettingEnabled:", PXPreferencesIsVideoAutoplayEnabled());
}

uint64_t __48__PXGridInlinePlaybackController_setNeedsUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "updateIfNeeded");
}

- (PXGridInlinePlaybackController)init
{
  PXGridInlinePlaybackController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *recordsQueue;
  uint64_t v5;
  NSMapTable *lookupLock_recordsByDisplayAsset;
  NSMutableArray *v7;
  NSMutableArray *currentlyPlayingRecords;
  NSMutableArray *v9;
  NSMutableArray *visibleRecords;
  int AppBooleanValue;
  BOOL v12;
  char v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  PXEventCoalescer *playingRecordsEventCoalescer;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  uint64_t v24;
  PXUpdater *updater;
  void *v26;
  objc_super v28;
  Boolean keyExistsAndHasValidFormat;

  v28.receiver = self;
  v28.super_class = (Class)PXGridInlinePlaybackController;
  v2 = -[PXGridInlinePlaybackController init](&v28, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.photos.cl-playback-controller.records", 0);
    recordsQueue = v2->_recordsQueue;
    v2->_recordsQueue = (OS_dispatch_queue *)v3;

    v2->_lookupLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    lookupLock_recordsByDisplayAsset = v2->_lookupLock_recordsByDisplayAsset;
    v2->_lookupLock_recordsByDisplayAsset = (NSMapTable *)v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    currentlyPlayingRecords = v2->_currentlyPlayingRecords;
    v2->_currentlyPlayingRecords = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    visibleRecords = v2->_visibleRecords;
    v2->_visibleRecords = v9;

    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("enableCoalescedPlayingRecordsUpdates"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v12 = AppBooleanValue == 0;
    else
      v12 = 0;
    v13 = !v12;
    v2->_shouldCoalescePlayingRecordsUpdates = v13;
    if (-[PXGridInlinePlaybackController shouldCoalescePlayingRecordsUpdates](v2, "shouldCoalescePlayingRecordsUpdates"))
    {
      +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "playingRecordsUpdateRateLimit");
      v16 = v15;

      objc_msgSend(off_1E50B23F8, "rateLimitingCoalescerWithRate:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      playingRecordsEventCoalescer = v2->_playingRecordsEventCoalescer;
      v2->_playingRecordsEventCoalescer = (PXEventCoalescer *)v17;

      -[PXEventCoalescer registerObserver:](v2->_playingRecordsEventCoalescer, "registerObserver:", v2);
    }
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "playbackVisibleRectEdgeInset");

    PXEdgeInsetsMake();
    v2->_criticallyVisibleEdgeInsets.top = v20;
    v2->_criticallyVisibleEdgeInsets.left = v21;
    v2->_criticallyVisibleEdgeInsets.bottom = v22;
    v2->_criticallyVisibleEdgeInsets.right = v23;
    v24 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v2, sel_setNeedsUpdate);
    updater = v2->_updater;
    v2->_updater = (PXUpdater *)v24;

    -[PXUpdater addUpdateSelector:needsUpdate:](v2->_updater, "addUpdateSelector:needsUpdate:", sel__updateActive, 1);
    -[PXUpdater addUpdateSelector:needsUpdate:](v2->_updater, "addUpdateSelector:needsUpdate:", sel__updateLowPowerModeEnabled, 1);
    -[PXUpdater addUpdateSelector:needsUpdate:](v2->_updater, "addUpdateSelector:needsUpdate:", sel__updateCanCreateRecords, 1);
    -[PXUpdater addUpdateSelector:needsUpdate:](v2->_updater, "addUpdateSelector:needsUpdate:", sel__updatePlaybackEnabled, 1);
    -[PXUpdater addUpdateSelector:needsUpdate:](v2->_updater, "addUpdateSelector:needsUpdate:", sel__updatePlayingRecords, 1);
    -[PXUpdater addUpdateSelector:needsUpdate:](v2->_updater, "addUpdateSelector:needsUpdate:", sel__updateVisibilityOfRecords, 1);
    -[PXGridInlinePlaybackController setActive:](v2, "setActive:", 1);
    -[PXGridInlinePlaybackController setApplicationActive:](v2, "setApplicationActive:", 1);
    -[PXGridInlinePlaybackController setAutoplaySettingEnabled:](v2, "setAutoplaySettingEnabled:", PXPreferencesIsVideoAutoplayEnabled());
    -[PXGridInlinePlaybackController _updateLowPowerModeEnabled](v2, "_updateLowPowerModeEnabled");
    -[PXGridInlinePlaybackController _updatePlaybackEnabled](v2, "_updatePlaybackEnabled");
    -[PXGridInlinePlaybackController _updateCanCreateRecords](v2, "_updateCanCreateRecords");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v2, sel__processInfoPowerStateDidChange_, *MEMORY[0x1E0CB3048], 0);
    objc_msgSend(v26, "addObserver:selector:name:object:", v2, sel__applicationDidResignActive_, *MEMORY[0x1E0DC4868], 0);
    objc_msgSend(v26, "addObserver:selector:name:object:", v2, sel__applicationDidBecomeActive_, *MEMORY[0x1E0DC4750], 0);
    PXRegisterPreferencesObserver(v2);

  }
  return v2;
}

- (void)setNeedsUpdate
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PXGridInlinePlaybackController_setNeedsUpdate__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)setCanCreateRecords:(BOOL)a3
{
  self->_canCreateRecords = a3;
}

- (void)setApplicationActive:(BOOL)a3
{
  if (self->_applicationActive != a3)
  {
    self->_applicationActive = a3;
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updatePlaybackEnabled);
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updatePlayingRecords);
  }
}

- (void)_updateLowPowerModeEnabled
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXGridInlinePlaybackController setLowPowerModeEnabled:](self, "setLowPowerModeEnabled:", objc_msgSend(v3, "isLowPowerModeEnabled"));

}

- (void)setLowPowerModeEnabled:(BOOL)a3
{
  if (self->_lowPowerModeEnabled != a3)
  {
    self->_lowPowerModeEnabled = a3;
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateCanCreateRecords);
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updatePlaybackEnabled);
  }
}

- (void)_updateCanCreateRecords
{
  uint64_t v3;

  if (-[PXGridInlinePlaybackController autoplaySettingEnabled](self, "autoplaySettingEnabled"))
    v3 = -[PXGridInlinePlaybackController lowPowerModeEnabled](self, "lowPowerModeEnabled") ^ 1;
  else
    v3 = 0;
  -[PXGridInlinePlaybackController setCanCreateRecords:](self, "setCanCreateRecords:", v3);
}

- (BOOL)lowPowerModeEnabled
{
  return self->_lowPowerModeEnabled;
}

- (void)_updateVisibilityOfRecords
{
  os_unfair_lock_s *p_lookupLock;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_lookupLock = &self->_lookupLock;
  os_unfair_lock_lock(&self->_lookupLock);
  if (-[PXGridInlinePlaybackController isContentViewVisible](self, "isContentViewVisible"))
  {
    v19 = 0uLL;
    v20 = 0uLL;
    v17 = 0uLL;
    v18 = 0uLL;
    -[NSMapTable objectEnumerator](self->_lookupLock_recordsByDisplayAsset, "objectEnumerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "prepareForVisible");
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v6);
    }
  }
  else
  {
    v15 = 0uLL;
    v16 = 0uLL;
    v13 = 0uLL;
    v14 = 0uLL;
    -[NSMapTable objectEnumerator](self->_lookupLock_recordsByDisplayAsset, "objectEnumerator", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (j = 0; j != v10; ++j)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * j), "prepareForInvisible");
        }
        v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      }
      while (v10);
    }
  }

  os_unfair_lock_unlock(p_lookupLock);
}

- (void)_updatePlaybackEnabled
{
  _BOOL8 v3;
  NSObject *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  _DWORD v13[2];
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = -[PXGridInlinePlaybackController autoplaySettingEnabled](self, "autoplaySettingEnabled")
    && -[PXGridInlinePlaybackController isContentViewVisible](self, "isContentViewVisible")
    && !-[PXGridInlinePlaybackController isContextMenuInteractionActive](self, "isContextMenuInteractionActive")
    && !-[PXGridInlinePlaybackController isDragSessionActive](self, "isDragSessionActive")
    && -[PXGridInlinePlaybackController applicationActive](self, "applicationActive")
    && !-[PXGridInlinePlaybackController lowPowerModeEnabled](self, "lowPowerModeEnabled")
    && -[PXGridInlinePlaybackController shouldEnablePlayback](self, "shouldEnablePlayback");
  -[PXGridInlinePlaybackController setPlaybackEnabled:](self, "setPlaybackEnabled:", v3);
  PLGridInlinePlaybackGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = -[PXGridInlinePlaybackController autoplaySettingEnabled](self, "autoplaySettingEnabled");
    v6 = -[PXGridInlinePlaybackController isContentViewVisible](self, "isContentViewVisible");
    v7 = -[PXGridInlinePlaybackController isContextMenuInteractionActive](self, "isContextMenuInteractionActive");
    v8 = -[PXGridInlinePlaybackController isDragSessionActive](self, "isDragSessionActive");
    v9 = -[PXGridInlinePlaybackController applicationActive](self, "applicationActive");
    v10 = -[PXGridInlinePlaybackController lowPowerModeEnabled](self, "lowPowerModeEnabled");
    v11 = -[PXGridInlinePlaybackController shouldEnablePlayback](self, "shouldEnablePlayback");
    -[PXGridInlinePlaybackController debugDescription](self, "debugDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = 67111170;
    v13[1] = v3;
    v14 = 1024;
    v15 = v5;
    v16 = 1024;
    v17 = v6;
    v18 = 1024;
    v19 = v7;
    v20 = 1024;
    v21 = v8;
    v22 = 1024;
    v23 = v9;
    v24 = 1024;
    v25 = v10;
    v26 = 1024;
    v27 = v11;
    v28 = 2112;
    v29 = v12;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "Playback enabled = %d (autoplaySettingEnabled=%d, isContentViewVisible=%d, isContextMenuInteractionActive=%d, isDragSessionActive=%d, applicationActive=%d, lowPowerModeEnabled=%d, shouldEnablePlayback=%d) for %@", (uint8_t *)v13, 0x3Cu);

  }
}

- (BOOL)isContentViewVisible
{
  return self->_isContentViewVisible;
}

- (BOOL)autoplaySettingEnabled
{
  return self->_autoplaySettingEnabled;
}

- (void)setPlaybackEnabled:(BOOL)a3
{
  if (self->_playbackEnabled != a3)
  {
    self->_playbackEnabled = a3;
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updatePlayingRecords);
  }
}

- (BOOL)shouldCoalescePlayingRecordsUpdates
{
  return self->_shouldCoalescePlayingRecordsUpdates;
}

- (BOOL)isDragSessionActive
{
  return self->_isDragSessionActive;
}

- (BOOL)isContextMenuInteractionActive
{
  return self->_isContextMenuInteractionActive;
}

- (BOOL)applicationActive
{
  return self->_applicationActive;
}

- (void)setIsOneUpVisible:(BOOL)a3
{
  if (self->_isOneUpVisible != a3)
  {
    self->_isOneUpVisible = a3;
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateActive);
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateVisibilityOfRecords);
  }
}

- (void)setIsContentViewVisible:(BOOL)a3
{
  if (self->_isContentViewVisible != a3)
  {
    self->_isContentViewVisible = a3;
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updatePlaybackEnabled);
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateVisibilityOfRecords);
  }
}

- (void)visibleRectDidChange
{
  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updatePlayingRecords);
}

- (void)_updatePlayingRecords
{
  id v3;

  if (-[PXGridInlinePlaybackController canUpdatePlayingRecords](self, "canUpdatePlayingRecords")
    && (-[PXGridInlinePlaybackController _hasAnyPlaybackRecords](self, "_hasAnyPlaybackRecords")
     || -[NSMutableArray count](self->_currentlyPlayingRecords, "count"))
    && -[PXGridInlinePlaybackController canProvideGeometriesForRecords](self, "canProvideGeometriesForRecords")
    && -[PXGridInlinePlaybackController active](self, "active"))
  {
    if (-[PXGridInlinePlaybackController playbackEnabled](self, "playbackEnabled"))
    {
      if (-[PXGridInlinePlaybackController shouldCoalescePlayingRecordsUpdates](self, "shouldCoalescePlayingRecordsUpdates"))
      {
        -[PXGridInlinePlaybackController playingRecordsEventCoalescer](self, "playingRecordsEventCoalescer");
        v3 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "inputEvent");

      }
      else
      {
        -[PXGridInlinePlaybackController _updatePlayingRecordsImmediately](self, "_updatePlayingRecordsImmediately");
      }
    }
    else
    {
      -[PXGridInlinePlaybackController _stopPlaybackForRecords:](self, "_stopPlaybackForRecords:", self->_currentlyPlayingRecords);
      -[NSMutableArray removeAllObjects](self->_currentlyPlayingRecords, "removeAllObjects");
    }
  }
}

- (BOOL)_hasAnyPlaybackRecords
{
  PXGridInlinePlaybackController *v2;
  os_unfair_lock_s *p_lookupLock;

  v2 = self;
  p_lookupLock = &self->_lookupLock;
  os_unfair_lock_lock(&self->_lookupLock);
  LOBYTE(v2) = -[NSMapTable count](v2->_lookupLock_recordsByDisplayAsset, "count") != 0;
  os_unfair_lock_unlock(p_lookupLock);
  return (char)v2;
}

- (void)_applicationDidBecomeActive:(id)a3
{
  -[PXGridInlinePlaybackController setApplicationActive:](self, "setApplicationActive:", 1);
}

- (void)_updateActive
{
  -[PXGridInlinePlaybackController setActive:](self, "setActive:", -[PXGridInlinePlaybackController isOneUpVisible](self, "isOneUpVisible") ^ 1);
}

- (BOOL)isOneUpVisible
{
  return self->_isOneUpVisible;
}

- (void)dealloc
{
  objc_super v3;

  PXUnregisterPreferencesObserver(self);
  v3.receiver = self;
  v3.super_class = (Class)PXGridInlinePlaybackController;
  -[PXGridInlinePlaybackController dealloc](&v3, sel_dealloc);
}

- (id)checkOutPlaybackRecordForDisplayAsset:(id)a3 mediaProvider:(id)a4 geometryReference:(id)a5
{
  return -[PXGridInlinePlaybackController checkOutPlaybackRecordForDisplayAsset:mediaProvider:geometryReference:configurationBlock:](self, "checkOutPlaybackRecordForDisplayAsset:mediaProvider:geometryReference:configurationBlock:", a3, a4, a5, 0);
}

- (id)checkOutPlaybackRecordForDisplayAsset:(id)a3 mediaProvider:(id)a4 geometryReference:(id)a5 configurationBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *recordsQueue;
  id v15;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[PXGridInlinePlaybackController canCreateRecords](self, "canCreateRecords")
    && -[PXGridInlinePlaybackController canPlayAsset:](self, "canPlayAsset:", v10)
    && -[PXGridInlinePlaybackController isDisplayAssetEligibleForAutoPlayback:](self, "isDisplayAssetEligibleForAutoPlayback:", v10))
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__197905;
    v27 = __Block_byref_object_dispose__197906;
    v28 = 0;
    recordsQueue = self->_recordsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __123__PXGridInlinePlaybackController_checkOutPlaybackRecordForDisplayAsset_mediaProvider_geometryReference_configurationBlock___block_invoke;
    block[3] = &unk_1E51349D0;
    block[4] = self;
    v22 = &v23;
    v18 = v10;
    v19 = v11;
    v20 = v12;
    v21 = v13;
    dispatch_sync(recordsQueue, block);
    px_dispatch_on_main_queue();
    v15 = (id)v24[5];

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)willCheckInPlaybackRecordForDisplayAsset:(id)a3
{
  id v5;
  NSObject *recordsQueue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGridInlinePlaybackController.m"), 160, CFSTR("%s must be called on the main thread"), "-[PXGridInlinePlaybackController willCheckInPlaybackRecordForDisplayAsset:]");

  }
  recordsQueue = self->_recordsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PXGridInlinePlaybackController_willCheckInPlaybackRecordForDisplayAsset___block_invoke;
  block[3] = &unk_1E5148D08;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(recordsQueue, block);

}

- (void)checkInPlaybackRecordForDisplayAsset:(id)a3
{
  id v4;
  NSObject *recordsQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  recordsQueue = self->_recordsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PXGridInlinePlaybackController_checkInPlaybackRecordForDisplayAsset___block_invoke;
  block[3] = &unk_1E5148D08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(recordsQueue, block);

}

- (void)checkInPlaybackRecordForDisplayAssets:(id)a3
{
  id v4;
  NSObject *recordsQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  recordsQueue = self->_recordsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PXGridInlinePlaybackController_checkInPlaybackRecordForDisplayAssets___block_invoke;
  block[3] = &unk_1E5148D08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(recordsQueue, block);

}

- (BOOL)isPlayingDisplayAsset:(id)a3
{
  id v4;
  NSObject *recordsQueue;
  char v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (-[PXGridInlinePlaybackController canPlayAsset:](self, "canPlayAsset:", v4))
  {
    recordsQueue = self->_recordsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__PXGridInlinePlaybackController_isPlayingDisplayAsset___block_invoke;
    block[3] = &unk_1E513FD98;
    block[4] = self;
    v9 = v4;
    v10 = &v11;
    dispatch_sync(recordsQueue, block);

  }
  v6 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)createPlaybackRecordForDisplayAsset:(id)a3 mediaProvider:(id)a4 geometryReference:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGridInlinePlaybackController.m"), 213, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGridInlinePlaybackController createPlaybackRecordForDisplayAsset:mediaProvider:geometryReference:]", v14);

  abort();
}

- (CGRect)currentVisibleRect
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGridInlinePlaybackController.m"), 217, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGridInlinePlaybackController currentVisibleRect]", v6);

  abort();
}

- (PXDisplayAsset)currentHoveredDisplayAsset
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGridInlinePlaybackController.m"), 221, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGridInlinePlaybackController currentHoveredDisplayAsset]", v6);

  abort();
}

- (CGRect)frameForPlaybackRecord:(id)a3 minPlayableSize:(CGSize *)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGridInlinePlaybackController.m"), 225, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGridInlinePlaybackController frameForPlaybackRecord:minPlayableSize:]", v9);

  abort();
}

- (BOOL)canProvideGeometriesForRecords
{
  return 1;
}

- (BOOL)shouldEnablePlayback
{
  return 1;
}

- (void)invalidatePlaybackEnabled
{
  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updatePlaybackEnabled);
}

- (BOOL)canPlayAsset:(id)a3
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
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGridInlinePlaybackController.m"), 245, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGridInlinePlaybackController canPlayAsset:]", v8);

  abort();
}

- (BOOL)canUpdatePlayingRecords
{
  return 1;
}

- (void)invalidatePlayingRecords
{
  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updatePlayingRecords);
}

- (id)filterSortedRecordsToPlay:(id)a3
{
  return a3;
}

- (int64_t)maxNumberOfPlayingItems
{
  void *v2;
  int64_t v3;

  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maxNumberOfPlayingItems");

  return v3;
}

- (void)setIsContextMenuInteractionActive:(BOOL)a3
{
  if (self->_isContextMenuInteractionActive != a3)
  {
    self->_isContextMenuInteractionActive = a3;
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updatePlaybackEnabled);
  }
}

- (void)setIsDragSessionActive:(BOOL)a3
{
  if (self->_isDragSessionActive != a3)
  {
    self->_isDragSessionActive = a3;
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updatePlaybackEnabled);
  }
}

- (void)_processInfoPowerStateDidChange:(id)a3
{
  px_dispatch_on_main_queue();
}

- (void)_applicationDidResignActive:(id)a3
{
  -[PXGridInlinePlaybackController setApplicationActive:](self, "setApplicationActive:", 0);
}

- (void)_updatePlayingRecordsImmediately
{
  void *v3;
  void *v4;
  NSMapTable *lookupLock_recordsByDisplayAsset;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  const __CFString *v23;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  BOOL IsNull;
  int v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  NSMutableArray *currentlyPlayingRecords;
  void *v36;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  os_unfair_lock_t lock;
  NSMutableArray *v54;
  void *v55;
  PXGridInlinePlaybackController *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE buf[22];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  v73 = *MEMORY[0x1E0C80C00];
  if (_updatePlayingRecordsImmediately_onceToken != -1)
    dispatch_once(&_updatePlayingRecordsImmediately_onceToken, &__block_literal_global_197772);
  lock = &self->_lookupLock;
  os_unfair_lock_lock(&self->_lookupLock);
  v54 = self->_visibleRecords;
  -[NSMutableArray removeAllObjects](v54, "removeAllObjects");
  v56 = self;
  if (-[PXGridInlinePlaybackController shouldPlayOnHover](self, "shouldPlayOnHover"))
  {
    -[PXGridInlinePlaybackController currentHoveredDisplayAsset](self, "currentHoveredDisplayAsset");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      lookupLock_recordsByDisplayAsset = self->_lookupLock_recordsByDisplayAsset;
      objc_msgSend(v3, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable objectForKey:](lookupLock_recordsByDisplayAsset, "objectForKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[NSMutableArray addObject:](v54, "addObject:", v7);

      }
    }

  }
  else
  {
    -[PXGridInlinePlaybackController currentVisibleRect](self, "currentVisibleRect");
    PXRectGetCenter();
    -[PXGridInlinePlaybackController criticallyVisibleEdgeInsets](self, "criticallyVisibleEdgeInsets");
    PXEdgeInsetsInsetRect();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    -[NSMapTable objectEnumerator](self->_lookupLock_recordsByDisplayAsset, "objectEnumerator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v66 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          if (objc_msgSend(v21, "isInvalid"))
          {
            v22 = v21;
            v23 = CFSTR("Record has been invalidated");
          }
          else
          {
            *(_OWORD *)buf = *(_OWORD *)off_1E50B8810;
            -[PXGridInlinePlaybackController frameForPlaybackRecord:minPlayableSize:](self, "frameForPlaybackRecord:minPlayableSize:", v21, buf);
            x = v74.origin.x;
            y = v74.origin.y;
            width = v74.size.width;
            height = v74.size.height;
            IsNull = CGRectIsNull(v74);
            v23 = CFSTR("Cell size is too small");
            if (!IsNull)
            {
              if ((PXSizeIsNull() & 1) != 0
                || (v29 = PXSizeApproximatelyEqualOrBiggerThanSizeWithTolerance(),
                    v23 = CFSTR("Cell size is too small"),
                    v29))
              {
                v75.origin.x = x;
                v75.origin.y = y;
                v75.size.width = width;
                v75.size.height = height;
                v77.origin.x = v9;
                v77.origin.y = v11;
                v77.size.width = v13;
                v77.size.height = v15;
                v30 = CGRectIntersectsRect(v75, v77);
                v52 = 0x3F847AE147AE147BLL;
                if (PXRectContainsRectWithTolerance())
                  v30 |= 2uLL;
                v76.origin.x = v9;
                v76.origin.y = v11;
                v76.size.width = v13;
                v76.size.height = v15;
                v78.origin.x = x;
                v78.origin.y = y;
                v78.size.width = width;
                v78.size.height = height;
                if (CGRectContainsRect(v76, v78))
                  v31 = v30 | 4;
                else
                  v31 = v30;
                if (v31)
                {
                  objc_msgSend(v21, "setVisibilityScore:", 0x3F847AE147AE147BLL);
                  PXRectGetCenter();
                  PXDistanceBetweenPoints();
                  objc_msgSend(v21, "setDistanceToCenterScore:");
                  objc_msgSend(v21, "setCellSizeScore:", width * height);
                  -[NSMutableArray addObject:](v54, "addObject:", v21);
                  v23 = CFSTR("Scores are too low");
                }
                else
                {
                  v23 = CFSTR("Cell is not visible");
                }
              }
            }
            v22 = v21;
          }
          objc_msgSend(v22, "setDiagnosticLog:", v23, v52);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
      }
      while (v18);
    }

  }
  -[NSMutableArray sortUsingDescriptors:](v54, "sortUsingDescriptors:", _updatePlayingRecordsImmediately_recordSortDescriptors);
  -[PXGridInlinePlaybackController filterSortedRecordsToPlay:](self, "filterSortedRecordsToPlay:", v54);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeAllObjects](self->_currentlyPlayingRecords, "removeAllObjects");
  v33 = -[PXGridInlinePlaybackController maxNumberOfPlayingItems](self, "maxNumberOfPlayingItems");
  if (objc_msgSend(v32, "count") && v33 >= 1)
  {
    v34 = 1;
    do
    {
      currentlyPlayingRecords = self->_currentlyPlayingRecords;
      objc_msgSend(v32, "objectAtIndexedSubscript:", v34 - 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](currentlyPlayingRecords, "addObject:", v36);

      if (v34 >= objc_msgSend(v32, "count"))
        break;
    }
    while ((uint64_t)v34++ < v33);
  }
  v55 = v32;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  -[NSMapTable objectEnumerator](self->_lookupLock_recordsByDisplayAsset, "objectEnumerator");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v62;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v62 != v41)
          objc_enumerationMutation(v38);
        v43 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
        if ((-[NSMutableArray containsObject:](self->_currentlyPlayingRecords, "containsObject:", v43) & 1) == 0
          && (objc_msgSend(v43, "isInvalid") & 1) == 0)
        {
          objc_msgSend(v43, "setDesiredPlayState:", 0);
        }
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
    }
    while (v40);
  }

  -[PXGridInlinePlaybackController _startPlaybackForRecords:](self, "_startPlaybackForRecords:", self->_currentlyPlayingRecords);
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  -[NSMapTable objectEnumerator](self->_lookupLock_recordsByDisplayAsset, "objectEnumerator");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v58;
    do
    {
      for (k = 0; k != v46; ++k)
      {
        if (*(_QWORD *)v58 != v47)
          objc_enumerationMutation(v44);
        v49 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * k);
        PLGridInlinePlaybackGetLog();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v49, "diagnosticLog");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v51;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v49;
          _os_log_impl(&dword_1A6789000, v50, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);

        }
      }
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
    }
    while (v46);
  }

  -[NSMutableArray removeAllObjects](v54, "removeAllObjects");
  os_unfair_lock_unlock(lock);
  -[PXGridInlinePlaybackController didUpdatePlayingRecords](v56, "didUpdatePlayingRecords");

}

- (void)_startPlaybackForRecords:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "setDesiredPlayState:", 1);
        objc_msgSend(v8, "setDiagnosticLog:", CFSTR("▶ Playing"));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_stopPlaybackForRecords:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setDesiredPlayState:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (BOOL)isDisplayAssetEligibleForAutoPlayback:(id)a3
{
  id v3;
  void *v4;
  double v5;
  char v6;

  v3 = a3;
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "forcePlayback") & 1) != 0 || (objc_msgSend(v4, "minAutoplaySuggestionScore"), v5 == 0.0))
    v6 = 1;
  else
    v6 = objc_msgSend(v3, "isEligibleForAutoPlayback");

  return v6;
}

- (NSArray)currentRecords
{
  os_unfair_lock_s *p_lookupLock;
  void *v4;
  void *v5;

  p_lookupLock = &self->_lookupLock;
  os_unfair_lock_lock(&self->_lookupLock);
  -[NSMapTable objectEnumerator](self->_lookupLock_recordsByDisplayAsset, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lookupLock);
  return (NSArray *)v5;
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)canCreateRecords
{
  return self->_canCreateRecords;
}

- (BOOL)playbackEnabled
{
  return self->_playbackEnabled;
}

- (PXEventCoalescer)playingRecordsEventCoalescer
{
  return self->_playingRecordsEventCoalescer;
}

- (UIEdgeInsets)criticallyVisibleEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_criticallyVisibleEdgeInsets.top;
  left = self->_criticallyVisibleEdgeInsets.left;
  bottom = self->_criticallyVisibleEdgeInsets.bottom;
  right = self->_criticallyVisibleEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playingRecordsEventCoalescer, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_visibleRecords, 0);
  objc_storeStrong((id *)&self->_currentlyPlayingRecords, 0);
  objc_storeStrong((id *)&self->_lookupLock_recordsByDisplayAsset, 0);
  objc_storeStrong((id *)&self->_recordsQueue, 0);
}

void __66__PXGridInlinePlaybackController__updatePlayingRecordsImmediately__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_visibilityScore);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sortDescriptorWithKey:ascending:", v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_cellSizeScore);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortDescriptorWithKey:ascending:", v4, 0, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v5;
  v6 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_distanceToCenterScore);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortDescriptorWithKey:ascending:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v8;
  v9 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_videoScore);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortDescriptorWithKey:ascending:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v11;
  v12 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_curationScore);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortDescriptorWithKey:ascending:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 5);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)_updatePlayingRecordsImmediately_recordSortDescriptors;
  _updatePlayingRecordsImmediately_recordSortDescriptors = v15;

}

uint64_t __66__PXGridInlinePlaybackController__processInfoPowerStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setNeedsUpdateOf:", sel__updateLowPowerModeEnabled);
}

void __56__PXGridInlinePlaybackController_isPlayingDisplayAsset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "isPlaying");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));

}

void __72__PXGridInlinePlaybackController_checkInPlaybackRecordForDisplayAssets___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "uuid", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeObjectForKey:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
}

void __71__PXGridInlinePlaybackController_checkInPlaybackRecordForDisplayAsset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
}

void __75__PXGridInlinePlaybackController_willCheckInPlaybackRecordForDisplayAsset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  PXGridInlinePlaybackRecord *v4;
  void *v5;
  void *v6;
  id v7;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "setIsInvalid:", 1);
  }
  else
  {
    v4 = -[PXGridInlinePlaybackRecord initWithDisplayAsset:mediaProvider:geometryReference:]([PXGridInlinePlaybackRecord alloc], "initWithDisplayAsset:mediaProvider:geometryReference:", 0, 0, 0);
    -[PXGridInlinePlaybackRecord setIsInvalid:](v4, "setIsInvalid:", 1);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, v6);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));

}

void __123__PXGridInlinePlaybackController_checkOutPlaybackRecordForDisplayAsset_mediaProvider_geometryReference_configurationBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "createPlaybackRecordForDisplayAsset:mediaProvider:geometryReference:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = *(_QWORD *)(a1 + 64);
    if (v10)
      (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, v13);

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  }
}

uint64_t __123__PXGridInlinePlaybackController_checkOutPlaybackRecordForDisplayAsset_mediaProvider_geometryReference_configurationBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setNeedsUpdateOf:", sel__updatePlayingRecords);
}

@end
