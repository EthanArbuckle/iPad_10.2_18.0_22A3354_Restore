@implementation _QLCacheThread

- (NSLock)modeLock
{
  return (NSLock *)objc_getProperty(self, a2, 56, 1);
}

- (QLDiskCacheQueryOperation)currentDiskCacheQueryOperation
{
  return (QLDiskCacheQueryOperation *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)currentMode
{
  return self->_currentMode;
}

- (BOOL)lowDiskSpace
{
  return self->_lowDiskSpace;
}

- (BOOL)addThumbnailRequest:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  NSObject *v6;
  QLMemoryCacheQueryOperation *v7;
  unint64_t currentMode;
  const __CFString *v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  _log_3();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_QLCacheThread addThumbnailRequest:].cold.3();

  -[NSLock lock](self->_modeLock, "lock");
  _log_3();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[_QLCacheThread addThumbnailRequest:].cold.2();

  if (self->_currentMode > 3 || self->_lowDiskSpace)
  {
    _log_3();
    v7 = (QLMemoryCacheQueryOperation *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
    {
      currentMode = self->_currentMode;
      if (currentMode > 5)
        v9 = CFSTR("unknown mode");
      else
        v9 = off_1E99D3A98[currentMode];
      v14 = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1D54AE000, &v7->super.super, OS_LOG_TYPE_INFO, "database is not open (mode: %@), or low disk", (uint8_t *)&v14, 0xCu);
    }
    v10 = 0;
  }
  else
  {
    _log_3();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_impl(&dword_1D54AE000, v13, OS_LOG_TYPE_INFO, "Trying memory cache for %@", (uint8_t *)&v14, 0xCu);
    }

    v7 = -[QLMemoryCacheQueryOperation initWithThumbnailRequest:cacheThread:]([QLMemoryCacheQueryOperation alloc], "initWithThumbnailRequest:cacheThread:", v4, self);
    -[NSOperationQueue addOperation:](self->_memoryCacheQueryOperationQueue, "addOperation:", v7);
    -[_QLCacheThread _updateMode](self, "_updateMode");
    v10 = 1;
  }

  -[NSLock unlock](self->_modeLock, "unlock");
  _log_3();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[_QLCacheThread addThumbnailRequest:].cold.1();

  return v10;
}

- (void)updateMode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "should update mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updateMode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "update mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_setMode:(unint64_t)a3
{
  unint64_t *p_currentMode;
  NSObject *v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;

  p_currentMode = &self->_currentMode;
  if (self->_currentMode != a3)
  {
    _log_3();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[_QLCacheThread _setMode:].cold.4();

    switch(*p_currentMode)
    {
      case 0uLL:
        if (-[_QLCacheThread _shouldQuitWorkingModeForMode:](self, "_shouldQuitWorkingModeForMode:", a3))
          goto LABEL_10;
        goto LABEL_19;
      case 1uLL:
        if (!-[_QLCacheThread _shouldQuitLowSpaceModeForMode:](self, "_shouldQuitLowSpaceModeForMode:", a3))
          goto LABEL_19;
        goto LABEL_10;
      case 2uLL:
        if (-[_QLCacheThread _shouldQuitCleanUpDatabaseModeForMode:](self, "_shouldQuitCleanUpDatabaseModeForMode:", a3))
        {
          goto LABEL_10;
        }
        goto LABEL_19;
      case 3uLL:
        if (!-[_QLCacheThread _shouldQuitPauseModeForMode:](self, "_shouldQuitPauseModeForMode:", a3))
          goto LABEL_19;
        goto LABEL_10;
      case 4uLL:
        if (!-[_QLCacheThread _shouldQuitClosedModeForMode:](self, "_shouldQuitClosedModeForMode:", a3))
          goto LABEL_19;
        goto LABEL_10;
      case 5uLL:
        if (-[_QLCacheThread _shouldQuitResetingModeForMode:](self, "_shouldQuitResetingModeForMode:", a3))
        {
LABEL_10:
          v7 = *p_currentMode;
          *p_currentMode = a3;
          _log_3();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            -[_QLCacheThread _setMode:].cold.2();

          switch(*p_currentMode)
          {
            case 0uLL:
              -[_QLCacheThread _willStartWorkingModeFromMode:](self, "_willStartWorkingModeFromMode:", v7);
              break;
            case 1uLL:
              -[_QLCacheThread _willStartLowSpaceModeFromMode:](self, "_willStartLowSpaceModeFromMode:", v7);
              break;
            case 2uLL:
              -[_QLCacheThread _willStartCleanUpDatabaseModeFromMode:](self, "_willStartCleanUpDatabaseModeFromMode:", v7);
              break;
            case 3uLL:
              -[_QLCacheThread _willStartPauseModeFromMode:](self, "_willStartPauseModeFromMode:", v7);
              break;
            case 4uLL:
              -[_QLCacheThread _willStartClosedModeFromMode:](self, "_willStartClosedModeFromMode:", v7);
              break;
            case 5uLL:
              -[_QLCacheThread _willStartResetingModeFromMode:](self, "_willStartResetingModeFromMode:", v7);
              if (-[QLDiskCache isOpened](self->_diskCache, "isOpened"))
                *p_currentMode = v7;
              break;
            default:
              break;
          }
        }
        else
        {
LABEL_19:
          _log_3();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            -[_QLCacheThread _setMode:].cold.3();

        }
        _log_3();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[_QLCacheThread _setMode:].cold.1();

        break;
      default:
        return;
    }
  }
}

- (BOOL)_shouldQuitWorkingModeForMode:(unint64_t)a3
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  uint64_t v11;
  unint64_t currentMode;
  __CFString *v14;
  const __CFString *v15;
  __CFString *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  _QWORD block[5];
  _BYTE buf[24];
  const __CFString *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    -[NSOperationQueue operations](self->_diskCacheQueryOperationQueue, "operations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v6 = 0;
    }
    else
    {
      -[NSOperationQueue operations](self->_memoryCacheQueryOperationQueue, "operations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "count") == 0;

    }
    _log_3();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      currentMode = self->_currentMode;
      v14 = CFSTR("unknown mode");
      v15 = CFSTR("unknown mode");
      if (currentMode <= 5)
        v15 = off_1E99D3A98[currentMode];
      if (a3 == 2)
        v14 = CFSTR("QLCacheModeCleanUpDatabase");
      if (a3 == 3)
        v14 = CFSTR("QLCacheModePause");
      v16 = v14;
      if (v6)
        v17 = CFSTR("accepted");
      else
        v17 = CFSTR("denied");
      -[NSOperationQueue operations](self->_diskCacheQueryOperationQueue, "operations");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");
      -[NSOperationQueue operations](self->_memoryCacheQueryOperationQueue, "operations");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2112;
      v24 = v17;
      v25 = 2048;
      v26 = v19;
      v27 = 2048;
      v28 = objc_msgSend(v20, "count");
      _os_log_debug_impl(&dword_1D54AE000, v8, OS_LOG_TYPE_DEBUG, "changing from %@ to %@: %@ (_diskCacheQueryOperationQueue %lu, _memoryCacheQueryOperationQueue %lu)", buf, 0x34u);

    }
    if (!v6)
      return 0;
  }
  v9 = dispatch_queue_create("quicklookd.operationssafeguard", 0);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v24) = 0;
  v10 = dispatch_time(0, 10000000000);
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48___QLCacheThread__shouldQuitWorkingModeForMode___block_invoke;
  block[3] = &unk_1E99D2E80;
  block[4] = buf;
  dispatch_after(v10, v9, block);
  -[NSOperationQueue cancelAllOperations](self->_diskCacheQueryOperationQueue, "cancelAllOperations");
  -[NSOperationQueue cancelAllOperations](self->_memoryCacheQueryOperationQueue, "cancelAllOperations");
  -[NSOperationQueue waitUntilAllOperationsAreFinished](self->_diskCacheQueryOperationQueue, "waitUntilAllOperationsAreFinished");
  -[NSOperationQueue waitUntilAllOperationsAreFinished](self->_memoryCacheQueryOperationQueue, "waitUntilAllOperationsAreFinished");
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __48___QLCacheThread__shouldQuitWorkingModeForMode___block_invoke_2;
  v21[3] = &unk_1E99D2E80;
  v21[4] = buf;
  dispatch_async(v9, v21);
  _Block_object_dispose(buf, 8);

  return 1;
}

- (void)setHitCount:(unint64_t)a3
{
  self->_hitCount = a3;
}

- (unint64_t)hitCount
{
  return self->_hitCount;
}

- (void)_sendThumbnailData:(id)a3 forThumbnailRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  float v17;
  __CFString *v18;
  float v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *WeakRetained;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v33[5];
  uint8_t buf[4];
  id v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  __CFString *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "hasData");
  _log_3();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      objc_msgSend(v8, "size");
      v13 = v12;
      objc_msgSend(v8, "size");
      v15 = v14;
      objc_msgSend(v8, "maximumPixelSize");
      v17 = v16;
      objc_msgSend(v6, "size");
      v18 = &stru_1E99D4E38;
      if (v17 == v19)
        v20 = &stru_1E99D4E38;
      else
        v20 = CFSTR("Low quality returned");
      if (objc_msgSend(v6, "iconMode"))
        v21 = CFSTR("Icon mode");
      else
        v21 = &stru_1E99D4E38;
      objc_msgSend(v6, "bitmapData");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v6, "badgeType");
      if (v23)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v6, "badgeType"));
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138413826;
      v35 = v8;
      v36 = 2048;
      v37 = v13;
      v38 = 2048;
      v39 = v15;
      v40 = 2112;
      v41 = v20;
      v42 = 2112;
      v43 = v21;
      v44 = 2048;
      v45 = v22;
      v46 = 2112;
      v47 = v18;
      _os_log_impl(&dword_1D54AE000, v10, OS_LOG_TYPE_INFO, "cache : hit thumbnail for %@ @ %.1fx%.1f %@ %@ %p %@", buf, 0x48u);
      if (v23)

    }
    _log_3();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v7;
      _os_log_impl(&dword_1D54AE000, v24, OS_LOG_TYPE_INFO, "completing thumbnail request %@ after cache hit", buf, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_serverThread);
    objc_msgSend(WeakRetained, "completeThumbnailRequest:thumbnailData:updatedMetadata:", v7, v6, 0);
  }
  else
  {
    if (v11)
    {
      objc_msgSend(v8, "size");
      v27 = v26;
      objc_msgSend(v8, "size");
      *(_DWORD *)buf = 138412802;
      v35 = v8;
      v36 = 2048;
      v37 = v27;
      v38 = 2048;
      v39 = v28;
      _os_log_impl(&dword_1D54AE000, v10, OS_LOG_TYPE_INFO, "cache : hit with no thumbnail for %@ @ %.1fx%.1f", buf, 0x20u);
    }

    v29 = (void *)MEMORY[0x1E0CD32D0];
    objc_msgSend(v7, "request");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithCode:request:additionalUserInfo:", 2, v30, 0);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    v31 = objc_loadWeakRetained((id *)&self->_serverThread);
    objc_msgSend(v31, "failedToCompleteThumbnailRequest:error:", v7, WeakRetained);

  }
  -[QLCacheCleanUpDatabaseThread addHitWithThumbnailData:](self->_cleanUpDatabaseThread, "addHitWithThumbnailData:", v6);
  v32 = objc_loadWeakRetained((id *)&self->_serverThread);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __66___QLCacheThread_Private___sendThumbnailData_forThumbnailRequest___block_invoke;
  v33[3] = &unk_1E99D2B88;
  v33[4] = self;
  objc_msgSend(v32, "perform:", v33);

}

- (void)_cleanUpDatabaseDone
{
  NSObject *v3;
  id WeakRetained;
  _QWORD v5[5];

  _log_3();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[_QLCacheThread(Private) _cleanUpDatabaseDone].cold.1();

  WeakRetained = objc_loadWeakRetained((id *)&self->_serverThread);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47___QLCacheThread_Private___cleanUpDatabaseDone__block_invoke;
  v5[3] = &unk_1E99D2B88;
  v5[4] = self;
  objc_msgSend(WeakRetained, "perform:", v5);

}

- (QLServerThread)serverThread
{
  return (QLServerThread *)objc_loadWeakRetained((id *)&self->_serverThread);
}

- (void)_addThumbnailRequestIntoDiskCacheQueryQueue:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id WeakRetained;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  _log_3();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_QLCacheThread(Private) _addThumbnailRequestIntoDiskCacheQueryQueue:].cold.1();

  objc_msgSend(v4, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_serverThread);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71___QLCacheThread_Private___addThumbnailRequestIntoDiskCacheQueryQueue___block_invoke;
  v10[3] = &unk_1E99D2D70;
  v10[4] = self;
  v11 = v6;
  v12 = v4;
  v8 = v4;
  v9 = v6;
  objc_msgSend(WeakRetained, "perform:", v10);

}

- (void)setCurrentDiskCacheQueryOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSOperationQueue)diskCacheQueryOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)_shouldQuitPauseModeForMode:(unint64_t)a3
{
  return 1;
}

- (void)serverIsIdle
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "serverIsIdle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (BOOL)_shouldQuitCleanUpDatabaseModeForMode:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 3uLL:
      -[QLCacheCleanUpDatabaseThread pause](self->_cleanUpDatabaseThread, "pause");
      break;
    case 1uLL:
    case 4uLL:
      -[QLCacheCleanUpDatabaseThread stop](self->_cleanUpDatabaseThread, "stop");
      break;
    default:
      return 1;
  }
  return 1;
}

- (void)stopWriting
{
  OS_os_transaction *writeTransaction;

  writeTransaction = self->_writeTransaction;
  self->_writeTransaction = 0;

}

- (void)startWriting
{
  OS_os_transaction *v3;
  OS_os_transaction *writeTransaction;

  v3 = (OS_os_transaction *)os_transaction_create();
  writeTransaction = self->_writeTransaction;
  self->_writeTransaction = v3;

}

- (void)_willStartCleanUpDatabaseModeFromMode:(unint64_t)a3
{
  NSObject *v4;

  _log_3();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[_QLCacheThread _willStartCleanUpDatabaseModeFromMode:].cold.1();

  -[QLCacheCleanUpDatabaseThread startCleanUp](self->_cleanUpDatabaseThread, "startCleanUp");
}

- (unint64_t)thumbnailInMemoryToSaveCount
{
  return -[QLMemoryCache thumbnailToSaveCount](self->_memoryCache, "thumbnailToSaveCount");
}

- (unint64_t)hitToSaveCount
{
  return -[QLCacheCleanUpDatabaseThread hitToSaveCount](self->_cleanUpDatabaseThread, "hitToSaveCount");
}

- (QLCacheCleanUpDatabaseThread)cleanUpDatabaseThread
{
  return (QLCacheCleanUpDatabaseThread *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)waitingForCleanup
{
  return self->_waitingForCleanup;
}

- (QLMemoryCache)memoryCache
{
  return (QLMemoryCache *)objc_getProperty(self, a2, 48, 1);
}

- (QLDiskCache)diskCache
{
  return (QLDiskCache *)objc_getProperty(self, a2, 40, 1);
}

- (void)setServerThreadIsIdle:(BOOL)a3
{
  self->_serverThreadIsIdle = a3;
}

- (void)_drainPendingBlocksNow
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "Draining pending blocks (forced)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_unscheduleBlockDrain
{
  NSObject *drainTimer;
  dispatch_time_t v3;

  drainTimer = self->_drainTimer;
  if (drainTimer)
  {
    v3 = dispatch_time(0, 1000000000000000);
    dispatch_source_set_timer(drainTimer, v3, 0x38D7EA4C68000uLL, 0);
  }
}

- (void)_drainPendingBlocks
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "-_drainPendingBlocks taking _modeLock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)serverIsWorking
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "serverIsWorking", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_dispatchThumbnailRequestInServerThread:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  _QWORD v7[4];
  id v8;
  _QLCacheThread *v9;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_serverThread);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67___QLCacheThread_Private___dispatchThumbnailRequestInServerThread___block_invoke;
  v7[3] = &unk_1E99D2CD0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(WeakRetained, "perform:", v7);

}

- (void)setMissedCount:(unint64_t)a3
{
  self->_missedCount = a3;
}

- (unint64_t)missedCount
{
  return self->_missedCount;
}

- (BOOL)itemIsMissingRemoteThumbnail:(id)a3
{
  id v4;
  QLDiskCache *diskCache;
  id v6;
  _QWORD v8[5];
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
  diskCache = self->_diskCache;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47___QLCacheThread_itemIsMissingRemoteThumbnail___block_invoke;
  v8[3] = &unk_1E99D3968;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  -[QLDiskCache doReading:](diskCache, "doReading:", v8);
  LOBYTE(diskCache) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)diskCache;
}

- (int64_t)purgeableSpaceOnMountPoint:(id)a3 withUrgency:(int)a4 beforeDate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  int64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v7 = a3;
  v8 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  -[_QLCacheThread diskCache](self, "diskCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __81___QLCacheThread_CacheDelete__purgeableSpaceOnMountPoint_withUrgency_beforeDate___block_invoke;
  v21[3] = &unk_1E99D3968;
  v23 = &v24;
  v21[4] = self;
  v10 = v8;
  v22 = v10;
  LOBYTE(v8) = objc_msgSend(v9, "doReading:", v21);

  if ((v8 & 1) != 0)
  {
    v11 = v25[3];
  }
  else
  {
    _log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_QLCacheThread(CacheDelete) purgeableSpaceOnMountPoint:withUrgency:beforeDate:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    v11 = 0;
  }

  _Block_object_dispose(&v24, 8);
  return v11;
}

- (int64_t)purgeOnMountPoint:(id)a3 withUrgency:(int)a4 beforeDate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  int64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v7 = a3;
  v8 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  -[_QLCacheThread diskCache](self, "diskCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __72___QLCacheThread_CacheDelete__purgeOnMountPoint_withUrgency_beforeDate___block_invoke;
  v21[3] = &unk_1E99D39E0;
  v23 = &v24;
  v21[4] = self;
  v10 = v8;
  v22 = v10;
  LOBYTE(v8) = objc_msgSend(v9, "doWriting:", v21);

  if ((v8 & 1) != 0)
  {
    v11 = v25[3];
  }
  else
  {
    _log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_QLCacheThread(CacheDelete) purgeOnMountPoint:withUrgency:beforeDate:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    v11 = 0;
  }

  _Block_object_dispose(&v24, 8);
  return v11;
}

+ (int64_t)defaultCacheSize
{
  if (QLCacheInDebugMode_onceToken != -1)
    dispatch_once(&QLCacheInDebugMode_onceToken, &__block_literal_global_7);
  if (QLCacheInDebugMode__cacheIsInDebugMode)
    return 52428800;
  else
    return 524288000;
}

- (_QLCacheThread)initWithServerThread:(id)a3 cacheSize:(int64_t)a4 location:(id)a5
{
  id v8;
  id v9;
  _QLCacheThread *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *writeQueue;
  dispatch_queue_t v13;
  OS_dispatch_queue *writeCoalesceQueue;
  NSOperationQueue *v15;
  NSOperationQueue *memoryCacheQueryOperationQueue;
  NSOperationQueue *v17;
  NSOperationQueue *diskCacheQueryOperationQueue;
  QLDiskCache *v19;
  QLDiskCache *diskCache;
  QLMemoryCache *v21;
  QLMemoryCache *memoryCache;
  QLCacheCleanUpDatabaseThread *v23;
  QLCacheCleanUpDatabaseThread *cleanUpDatabaseThread;
  NSLock *v25;
  NSLock *modeLock;
  uint64_t v27;
  NSURL *diskCacheURL;
  _QLCacheThread *v29;
  objc_super v31;

  v8 = a3;
  v9 = a5;
  v31.receiver = self;
  v31.super_class = (Class)_QLCacheThread;
  v10 = -[_QLCacheThread init](&v31, sel_init);
  if (v10)
  {
    if (!v9)
    {
      v29 = 0;
      goto LABEL_6;
    }
    v11 = dispatch_queue_create("com.apple.quicklook.ThumbnailsAgent.QLCacheThread.writequeue", 0);
    writeQueue = v10->_writeQueue;
    v10->_writeQueue = (OS_dispatch_queue *)v11;

    v13 = dispatch_queue_create("quicklookd.cachecoalescer", 0);
    writeCoalesceQueue = v10->_writeCoalesceQueue;
    v10->_writeCoalesceQueue = (OS_dispatch_queue *)v13;

    v10->_serverThreadIsIdle = 1;
    v15 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    memoryCacheQueryOperationQueue = v10->_memoryCacheQueryOperationQueue;
    v10->_memoryCacheQueryOperationQueue = v15;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v10->_memoryCacheQueryOperationQueue, "setMaxConcurrentOperationCount:", 1);
    v17 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    diskCacheQueryOperationQueue = v10->_diskCacheQueryOperationQueue;
    v10->_diskCacheQueryOperationQueue = v17;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v10->_diskCacheQueryOperationQueue, "setMaxConcurrentOperationCount:", 1);
    v19 = -[QLDiskCache initWithPathLocation:cacheSize:cacheThread:]([QLDiskCache alloc], "initWithPathLocation:cacheSize:cacheThread:", v9, a4, v10);
    diskCache = v10->_diskCache;
    v10->_diskCache = v19;

    -[QLDiskCache setDelegate:](v10->_diskCache, "setDelegate:", v10);
    v21 = -[QLMemoryCache initWithCacheThread:]([QLMemoryCache alloc], "initWithCacheThread:", v10);
    memoryCache = v10->_memoryCache;
    v10->_memoryCache = v21;

    v23 = -[QLCacheCleanUpDatabaseThread initWithCacheThread:]([QLCacheCleanUpDatabaseThread alloc], "initWithCacheThread:", v10);
    cleanUpDatabaseThread = v10->_cleanUpDatabaseThread;
    v10->_cleanUpDatabaseThread = v23;

    v10->_currentMode = 4;
    v25 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    modeLock = v10->_modeLock;
    v10->_modeLock = v25;

    objc_storeWeak((id *)&v10->_serverThread, v8);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
    v27 = objc_claimAutoreleasedReturnValue();
    diskCacheURL = v10->_diskCacheURL;
    v10->_diskCacheURL = (NSURL *)v27;

  }
  v29 = v10;
LABEL_6:

  return v29;
}

- (void)databaseCorruptionDetected
{
  id WeakRetained;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_serverThread);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44___QLCacheThread_databaseCorruptionDetected__block_invoke;
  v4[3] = &unk_1E99D2B88;
  v4[4] = self;
  objc_msgSend(WeakRetained, "perform:", v4);

}

- (void)_scheduledDrainPendingBlocks
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "Draining pending blocks (scheduled)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleBlockDrain
{
  NSObject *drainTimer;
  dispatch_time_t v3;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD handler[5];

  drainTimer = self->_drainTimer;
  if (drainTimer)
  {
    v3 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer(drainTimer, v3, 0x38D7EA4C68000uLL, 0);
  }
  else
  {
    v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_writeCoalesceQueue);
    v6 = self->_drainTimer;
    self->_drainTimer = v5;

    v7 = self->_drainTimer;
    v8 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer(v7, v8, 0x38D7EA4C68000uLL, 0);
    v9 = self->_drainTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __37___QLCacheThread__scheduleBlockDrain__block_invoke;
    handler[3] = &unk_1E99D2B88;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_resume((dispatch_object_t)self->_drainTimer);
  }
}

- (void)_destroyDrainTimer
{
  NSObject *drainTimer;
  OS_dispatch_source *v4;

  drainTimer = self->_drainTimer;
  if (drainTimer)
  {
    dispatch_source_cancel(drainTimer);
    v4 = self->_drainTimer;
    self->_drainTimer = 0;

  }
}

- (void)enqueueWriting:(id)a3
{
  id v4;
  NSObject *writeCoalesceQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  writeCoalesceQueue = self->_writeCoalesceQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33___QLCacheThread_enqueueWriting___block_invoke;
  v7[3] = &unk_1E99D3010;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(writeCoalesceQueue, v7);

}

- (BOOL)addNoThumbnailIntoCache:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  QLCacheThumbnailData *v11;
  int v12;
  int v13;
  uint64_t v14;
  double v15;
  QLCacheThumbnailData *v16;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _log_3();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "fileIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "size");
    v9 = v8;
    objc_msgSend(v5, "size");
    v18 = 138412802;
    v19 = v7;
    v20 = 2048;
    v21 = v9;
    v22 = 2048;
    v23 = v10;
    _os_log_impl(&dword_1D54AE000, v6, OS_LOG_TYPE_INFO, "adding no thumbnail for %@ @ %.1f %.1f", (uint8_t *)&v18, 0x20u);

  }
  v11 = [QLCacheThumbnailData alloc];
  objc_msgSend(v5, "maximumPixelSize");
  v13 = v12;
  v14 = objc_msgSend(v4, "badgeType");

  LODWORD(v15) = v13;
  v16 = -[QLCacheThumbnailData initWithCacheId:thumbnailRequest:size:badgeType:](v11, "initWithCacheId:thumbnailRequest:size:badgeType:", 0, v5, v14, v15);
  -[QLMemoryCache addThumbnailData:](self->_memoryCache, "addThumbnailData:", v16);

  return 1;
}

- (BOOL)addThumbnailIntoCache:(id)a3 bitmapFormat:(id)a4 bitmapData:(id)a5 metadata:(id)a6 flavor:(int)a7 contentRect:(CGRect)a8 badgeType:(unint64_t)a9 externalGeneratorDataHash:(unint64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  QLCacheThumbnailData *v28;
  QLCacheThumbnailData *v29;
  BOOL v30;
  NSObject *v31;
  void *v32;
  uint64_t v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  _log_3();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v16, "fileIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "size");
    v23 = v22;
    objc_msgSend(v16, "size");
    *(_DWORD *)buf = 138413314;
    v36 = v21;
    v37 = 2048;
    v38 = v23;
    v39 = 2048;
    v40 = v24;
    v41 = 2048;
    v42 = objc_msgSend(v17, "width");
    v43 = 2048;
    v44 = objc_msgSend(v17, "height");
    _os_log_impl(&dword_1D54AE000, v20, OS_LOG_TYPE_INFO, "adding thumbnail for %@ @ {%.1f, %.1f} (actual size %zd %zd)", buf, 0x34u);

  }
  -[QLDiskCache reserveBufferForData:](self->_diskCache, "reserveBufferForData:", v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    if (!objc_msgSend(v18, "length"))
    {
      v25 = 0;
      if (v19)
        goto LABEL_7;
      goto LABEL_11;
    }
    -[QLDiskCache freeDiskSpaceForNewThumbnails](self->_diskCache, "freeDiskSpaceForNewThumbnails");
    -[QLDiskCache reserveBufferForData:](self->_diskCache, "reserveBufferForData:", v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v19)
  {
LABEL_7:
    -[QLDiskCache reserveBufferForData:](self->_diskCache, "reserveBufferForData:", v19);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v25 && v26)
      goto LABEL_9;
    goto LABEL_12;
  }
LABEL_11:
  v27 = 0;
  if (v25)
  {
LABEL_9:
    v28 = [QLCacheThumbnailData alloc];
    objc_msgSend(v16, "maximumPixelSize");
    LODWORD(v34) = a7;
    v29 = -[QLCacheThumbnailData initWithUnsavedDataForThumbnailRequest:size:bitmapFormat:bitmapData:reservationInfo:metadata:reservationInfo:flavor:contentRect:badgeType:](v28, "initWithUnsavedDataForThumbnailRequest:size:bitmapFormat:bitmapData:reservationInfo:metadata:reservationInfo:flavor:contentRect:badgeType:", v16, v17, v18, v25, v19, v27, v34, a9);
    v30 = -[QLMemoryCache addThumbnailData:](self->_memoryCache, "addThumbnailData:", v29);

    goto LABEL_18;
  }
LABEL_12:
  _log_3();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v16, "fileIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v36 = v32;
    _os_log_impl(&dword_1D54AE000, v31, OS_LOG_TYPE_INFO, "addThumbnailIntoCache: failed, discarding buffers for %@", buf, 0xCu);

  }
  if (v25)
    -[QLDiskCache discardReservedBuffer:](self->_diskCache, "discardReservedBuffer:", v25);
  if (!v27)
  {
    v30 = 0;
    goto LABEL_19;
  }
  -[QLDiskCache discardReservedBuffer:](self->_diskCache, "discardReservedBuffer:", v27);
  v30 = 0;
LABEL_18:

LABEL_19:
  return v30;
}

- (void)_updateLowDisk
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[QLDiskStore diskStoreForURL:](QLDiskStore, "diskStoreForURL:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[_QLCacheThread _setLowDiskSpace:](self, "_setLowDiskSpace:", (unint64_t)objc_msgSend(v4, "availableDiskSpace") < 0xC800001);
}

- (void)_registerMachPortForLowDiskSpaceNotification
{
  id WeakRetained;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_serverThread);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62___QLCacheThread__registerMachPortForLowDiskSpaceNotification__block_invoke;
  v4[3] = &unk_1E99D2B88;
  v4[4] = self;
  objc_msgSend(WeakRetained, "perform:", v4);

}

- (void)_unregisterMachPortForLowDiskSpaceNotification
{
  id WeakRetained;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_serverThread);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64___QLCacheThread__unregisterMachPortForLowDiskSpaceNotification__block_invoke;
  v4[3] = &unk_1E99D2B88;
  v4[4] = self;
  objc_msgSend(WeakRetained, "perform:", v4);

}

- (void)reset
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "-reset taking _modeLock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)openCache
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "-openCache taking _modeLock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)closeCache
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "-closeCache taking _modeLock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (BOOL)isCacheOpened
{
  return (self->_currentMode > 5) | (0xDu >> self->_currentMode) & 1;
}

- (void)forceCommitAndClose
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "Force cache commit", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)forceCommit
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "Starting database clean-up", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (BOOL)isIdle
{
  unsigned int v3;
  NSObject *v4;
  unint64_t currentMode;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  const __CFString *v14;
  int v15;
  const __CFString *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (self->_currentMode < 5) & (0x1Au >> self->_currentMode);
  _log_3();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    currentMode = self->_currentMode;
    if (currentMode > 5)
      v7 = CFSTR("unknown mode");
    else
      v7 = off_1E99D3A98[currentMode];
    -[NSOperationQueue operations](self->_diskCacheQueryOperationQueue, "operations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    -[NSOperationQueue operations](self->_memoryCacheQueryOperationQueue, "operations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    v12 = -[QLMemoryCache thumbnailToSaveCount](self->_memoryCache, "thumbnailToSaveCount");
    v13 = -[_QLCacheThread hitToSaveCount](self, "hitToSaveCount");
    v14 = CFSTR("is not idle");
    v15 = 138413570;
    v16 = v7;
    v17 = 2048;
    if (v3)
      v14 = CFSTR("is idle");
    v18 = v9;
    v19 = 2048;
    v20 = v11;
    v21 = 2048;
    v22 = v12;
    v23 = 2048;
    v24 = v13;
    v25 = 2112;
    v26 = v14;
    _os_log_debug_impl(&dword_1D54AE000, v4, OS_LOG_TYPE_DEBUG, "current mode %@, disk cache queries: %lu, memory cache queries: %lu, thumbnail left to write: %lu, hit count left to save: %lu, result %@", (uint8_t *)&v15, 0x3Eu);

  }
  return v3;
}

- (void)prepareToExit
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "prepareToExit", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (id)contentDescriptionForURL:(__CFURL *)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  float v13;
  uint64_t v14;
  void *v15;
  id v17;

  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v17 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD3270]), "initWithFileURL:error:", a3, &v17);
  v8 = v17;
  if (v7)
  {
    -[QLDiskCache enumeratorForAllThumbnailsWithFileIdentifier:](self->_diskCache, "enumeratorForAllThumbnailsWithFileIdentifier:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject nextThumbnailData](v9, "nextThumbnailData");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      while (!objc_msgSend(v11, "iconMode"))
      {
        v12 = v5;
        if (objc_msgSend(v5, "length"))
          goto LABEL_8;
LABEL_9:
        objc_msgSend(v11, "size");
        objc_msgSend(v12, "appendFormat:", CFSTR("%.1f"), v13);
        -[NSObject nextThumbnailData](v9, "nextThumbnailData");
        v14 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v14;
        if (!v14)
          goto LABEL_10;
      }
      v12 = v6;
      if (!objc_msgSend(v6, "length"))
        goto LABEL_9;
LABEL_8:
      objc_msgSend(v12, "appendString:", CFSTR(", "));
      goto LABEL_9;
    }
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("thumbnail sizes: %@ - icon sizes: %@"), v5, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _log_3();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_QLCacheThread contentDescriptionForURL:].cold.1();
    v15 = 0;
  }

  return v15;
}

- (NSString)modeDescription
{
  NSString *result;

  switch(self->_currentMode)
  {
    case 0uLL:
      result = (NSString *)CFSTR("working");
      break;
    case 1uLL:
      result = (NSString *)CFSTR("low disk space");
      break;
    case 2uLL:
      result = (NSString *)CFSTR("clean up");
      break;
    case 3uLL:
      result = (NSString *)CFSTR("pause");
      break;
    case 4uLL:
      if (self->_lowDiskSpace)
        result = (NSString *)CFSTR("closed (low disk space)");
      else
        result = (NSString *)CFSTR("closed");
      break;
    case 5uLL:
      result = (NSString *)CFSTR("reseting");
      break;
    default:
      result = (NSString *)CFSTR("unknown");
      break;
  }
  return result;
}

- (BOOL)_shouldQuitLowSpaceModeForMode:(unint64_t)a3
{
  BOOL v3;
  BOOL v4;
  NSObject *v5;

  v3 = a3 == 4 || !self->_lowDiskSpace;
  v4 = v3;
  if (!v3)
  {
    _log_3();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[_QLCacheThread _shouldQuitLowSpaceModeForMode:].cold.1();

  }
  return v4;
}

- (BOOL)_shouldQuitClosedModeForMode:(unint64_t)a3
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v8;

  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    if (a3 != 5)
    {
      _log_3();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[_QLCacheThread _shouldQuitClosedModeForMode:].cold.4();

      return 0;
    }
    return 1;
  }
  -[_QLCacheThread _registerMachPortForLowDiskSpaceNotification](self, "_registerMachPortForLowDiskSpaceNotification");
  _log_3();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[_QLCacheThread _shouldQuitClosedModeForMode:].cold.3((uint64_t)self, v4);

  if (-[QLDiskCache open](self->_diskCache, "open"))
    return 1;
  _log_3();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_QLCacheThread _shouldQuitClosedModeForMode:].cold.2();

  _log_3();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[_QLCacheThread _shouldQuitClosedModeForMode:].cold.1();

  -[_QLCacheThread _unregisterMachPortForLowDiskSpaceNotification](self, "_unregisterMachPortForLowDiskSpaceNotification");
  return 0;
}

- (BOOL)_shouldQuitResetingModeForMode:(unint64_t)a3
{
  return 1;
}

- (void)_willStartClosedModeFromMode:(unint64_t)a3
{
  NSObject *v4;
  NSObject *writeCoalesceQueue;
  NSObject *v6;
  _QWORD block[5];

  self->_missedCount = 0;
  self->_hitCount = 0;
  if (a3 != 5)
  {
    _log_3();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[_QLCacheThread _willStartClosedModeFromMode:].cold.2();

    writeCoalesceQueue = self->_writeCoalesceQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47___QLCacheThread__willStartClosedModeFromMode___block_invoke;
    block[3] = &unk_1E99D2B88;
    block[4] = self;
    dispatch_async(writeCoalesceQueue, block);
    -[QLDiskCache close](self->_diskCache, "close");
    if (-[QLDiskCache isOpened](self->_diskCache, "isOpened"))
    {
      _log_3();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[_QLCacheThread _willStartClosedModeFromMode:].cold.1();

    }
    else
    {
      -[_QLCacheThread _unregisterMachPortForLowDiskSpaceNotification](self, "_unregisterMachPortForLowDiskSpaceNotification");
    }
  }
}

- (void)_willStartResetingModeFromMode:(unint64_t)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _log_3();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D54AE000, v4, OS_LOG_TYPE_INFO, "reset database", v5, 2u);
  }

  -[QLMemoryCache reset](self->_memoryCache, "reset");
  -[QLDiskCache reset](self->_diskCache, "reset");
}

- (void)_waitForEndOfDatabaseCleanup
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1D54AE000, log, OS_LOG_TYPE_DEBUG, "Loop waiting for clean-up end", buf, 2u);
}

- (id)cacheInfo
{
  QLDiskCache *diskCache;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  diskCache = self->_diskCache;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27___QLCacheThread_cacheInfo__block_invoke;
  v5[3] = &unk_1E99D3098;
  v5[4] = self;
  v5[5] = &v6;
  -[QLDiskCache doReading:](diskCache, "doReading:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)allThumbnailsInfo
{
  QLDiskCache *diskCache;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  diskCache = self->_diskCache;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35___QLCacheThread_allThumbnailsInfo__block_invoke;
  v5[3] = &unk_1E99D3098;
  v5[4] = self;
  v5[5] = &v6;
  -[QLDiskCache doReading:](diskCache, "doReading:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_allThumbnailsEnumerateWithEnumerator:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v35;
  id v36;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v36 = (id)objc_opt_new();
  objc_msgSend(v35, "nextFileInfo");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    while (1)
    {
      objc_msgSend(v4, "fileIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fileIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "fileIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "version");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v4, "fileIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "version");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "description");
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = CFSTR("cannot read the version");
      }
      v12 = objc_alloc(MEMORY[0x1E0C99E08]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "cacheId"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "thumbnailCount"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "minSize");
      objc_msgSend(v15, "numberWithFloat:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "maxSize");
      objc_msgSend(v17, "numberWithFloat:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "totalDataLength"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v12, "initWithObjectsAndKeys:", v13, CFSTR("cacheid"), v11, CFSTR("versiondescription"), v14, CFSTR("thumbnailcount"), v16, CFSTR("minsize"), v18, CFSTR("maxsize"), v19, CFSTR("datalength"), 0);

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "itemID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "providerDomainID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v32, CFSTR("fpid"));

        objc_msgSend(v6, "itemID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v20;
        v29 = v27;
        v30 = CFSTR("itemid");
        goto LABEL_10;
      }
LABEL_11:
      objc_msgSend(v36, "addObject:", v20);

      objc_msgSend(v35, "nextFileInfo");
      v33 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v33;
      if (!v33)
        goto LABEL_12;
    }
    v21 = objc_msgSend(v6, "fsid");
    v22 = HIDWORD(v21);
    v23 = objc_msgSend(v6, "fileId");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v24;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "setObject:forKeyedSubscript:", v26, CFSTR("fsid"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v20;
    v29 = v27;
    v30 = CFSTR("ino");
LABEL_10:
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, v30);

    goto LABEL_11;
  }
LABEL_12:

  return v36;
}

- (id)allThumbnailsForIno:(unint64_t)a3 fsid:(fsid)a4
{
  void *v5;
  void *v6;
  NSObject *v7;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD3270]), "initWithFileId:fsid:", a3, a4);
  if (v5)
  {
    -[_QLCacheThread allThumbnailsForFileIdentifier:](self, "allThumbnailsForFileIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _log_3();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_QLCacheThread allThumbnailsForIno:fsid:].cold.1();

    v6 = 0;
  }

  return v6;
}

- (id)allThumbnailsForFPItemID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD3280]), "initWithItemID:", v4);
  if (v5)
  {
    -[_QLCacheThread allThumbnailsForFileIdentifier:](self, "allThumbnailsForFileIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _log_3();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_QLCacheThread allThumbnailsForFPItemID:].cold.1();

    v6 = 0;
  }

  return v6;
}

- (id)allThumbnailsForFileIdentifier:(id)a3
{
  id v4;
  QLDiskCache *diskCache;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  diskCache = self->_diskCache;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49___QLCacheThread_allThumbnailsForFileIdentifier___block_invoke;
  v9[3] = &unk_1E99D3968;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  -[QLDiskCache doReading:](diskCache, "doReading:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)locked_removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[_QLCacheThread diskCache](self, "diskCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:", v4);

  -[QLMemoryCache removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:](self->_memoryCache, "removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:", v4);
  return v6;
}

- (BOOL)locked_removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[_QLCacheThread diskCache](self, "diskCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers:", v4);

  -[QLMemoryCache removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers:](self->_memoryCache, "removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers:", v4);
  return v6;
}

- (BOOL)setLastHitDateOfAllCachedThumbnailsToDate:(id)a3
{
  id v4;
  QLDiskCache *diskCache;
  id v6;
  _QWORD v8[5];
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
  diskCache = self->_diskCache;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60___QLCacheThread_setLastHitDateOfAllCachedThumbnailsToDate___block_invoke;
  v8[3] = &unk_1E99D39E0;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  -[QLDiskCache doWriting:](diskCache, "doWriting:", v8);
  LOBYTE(diskCache) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)diskCache;
}

- (void)noteRemoteThumbnailMissingForItems:(id)a3
{
  id v4;
  QLDiskCache *diskCache;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  diskCache = self->_diskCache;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53___QLCacheThread_noteRemoteThumbnailMissingForItems___block_invoke;
  v7[3] = &unk_1E99D3A50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[QLDiskCache doWriting:](diskCache, "doWriting:", v7);

}

- (void)noteRemoteThumbnailPresentForItems:(id)a3
{
  id v4;
  QLDiskCache *diskCache;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  diskCache = self->_diskCache;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53___QLCacheThread_noteRemoteThumbnailPresentForItems___block_invoke;
  v7[3] = &unk_1E99D3A50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[QLDiskCache doWriting:](diskCache, "doWriting:", v7);

}

- (id)itemsAfterFilteringOutItemsWithMissingThumbnails:(id)a3
{
  id v4;
  QLDiskCache *diskCache;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  diskCache = self->_diskCache;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67___QLCacheThread_itemsAfterFilteringOutItemsWithMissingThumbnails___block_invoke;
  v9[3] = &unk_1E99D3968;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  -[QLDiskCache doReading:](diskCache, "doReading:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)shouldRemoveThumbnailsForDeletedFiles
{
  return -[QLCacheCleanUpDatabaseThread shouldRemoveThumbnailsForDeletedFiles](self->_cleanUpDatabaseThread, "shouldRemoveThumbnailsForDeletedFiles");
}

- (void)setShouldRemoveThumbnailsForDeletedFiles:(BOOL)a3
{
  -[QLCacheCleanUpDatabaseThread setShouldRemoveThumbnailsForDeletedFiles:](self->_cleanUpDatabaseThread, "setShouldRemoveThumbnailsForDeletedFiles:", a3);
}

- (void)setServerThread:(id)a3
{
  objc_storeWeak((id *)&self->_serverThread, a3);
}

- (NSURL)diskCacheURL
{
  return (NSURL *)objc_getProperty(self, a2, 320, 1);
}

- (void)setDiskCacheURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (OS_dispatch_source)lowDiskSpaceSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLowDiskSpaceSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (OS_dispatch_queue)lowDiskSpaceSourceQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLowDiskSpaceSourceQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void)setModeLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setDiskCacheQueryOperationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)serverThreadIsIdle
{
  return self->_serverThreadIsIdle;
}

- (void)setWaitingForCleanup:(BOOL)a3
{
  self->_waitingForCleanup = a3;
}

- (void)setCleanUpDatabaseThread:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;

  objc_storeStrong((id *)&self->_diskCacheURL, 0);
  objc_destroyWeak((id *)&self->_serverThread);
  objc_storeStrong((id *)&self->_writeTransaction, 0);
  objc_storeStrong((id *)&self->_drainTimer, 0);
  for (i = 0; i != -10; --i)
    objc_storeStrong(&self->_cleanupBlocks[i + 9], 0);
  for (j = 208; j != 128; j -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + j), 0);
  objc_storeStrong((id *)&self->_writeCoalesceQueue, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_lowDiskSpaceSourceQueue, 0);
  objc_storeStrong((id *)&self->_lowDiskSpaceSource, 0);
  objc_storeStrong((id *)&self->_modeLock, 0);
  objc_storeStrong((id *)&self->_memoryCache, 0);
  objc_storeStrong((id *)&self->_diskCache, 0);
  objc_storeStrong((id *)&self->_currentDiskCacheQueryOperation, 0);
  objc_storeStrong((id *)&self->_memoryCacheQueryOperationQueue, 0);
  objc_storeStrong((id *)&self->_diskCacheQueryOperationQueue, 0);
  objc_storeStrong((id *)&self->_cleanUpDatabaseThread, 0);
}

- (void)_setLowDiskSpace:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint8_t v8[16];
  uint8_t buf[16];

  if (self->_lowDiskSpace != a3)
  {
    v3 = a3;
    -[_QLCacheThread willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("lowDiskSpace"));
    -[NSLock lock](self->_modeLock, "lock");
    self->_lowDiskSpace = v3;
    _log_3();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D54AE000, v5, OS_LOG_TYPE_INFO, "QLCacheThread is now running on low disk space mode.", buf, 2u);
      }

      v7 = 1;
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1D54AE000, v5, OS_LOG_TYPE_INFO, "QLCacheThread is not longer running on low disk space.", v8, 2u);
      }

      if (self->_currentMode > 3)
      {
        v7 = 4;
      }
      else
      {
        -[_QLCacheThread _setMode:](self, "_setMode:", 3);
        if (!self->_serverThreadIsIdle)
        {
LABEL_13:
          -[NSLock unlock](self->_modeLock, "unlock");
          -[_QLCacheThread didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("lowDiskSpace"));
          return;
        }
        v7 = 2;
      }
    }
    -[_QLCacheThread _setMode:](self, "_setMode:", v7);
    goto LABEL_13;
  }
}

- (void)_thumbnailHasBeenCancelled:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  id v15;
  _QWORD v16[5];
  uint8_t buf[4];
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _log_3();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");
    v8 = v7;
    objc_msgSend(v4, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "size");
    *(_DWORD *)buf = 138412802;
    v18 = v4;
    v19 = 2048;
    v20 = v8;
    v21 = 2048;
    v22 = v10;
    _os_log_impl(&dword_1D54AE000, v5, OS_LOG_TYPE_INFO, "cache : thumbnail for %@ has been cancelled @ %.1fx%.1f", buf, 0x20u);

  }
  v11 = (void *)MEMORY[0x1E0CD32D0];
  objc_msgSend(v4, "request");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithCode:request:additionalUserInfo:", 5, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_serverThread);
  objc_msgSend(WeakRetained, "failedToCompleteThumbnailRequest:error:", v4, v13);

  v15 = objc_loadWeakRetained((id *)&self->_serverThread);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __54___QLCacheThread_Private___thumbnailHasBeenCancelled___block_invoke;
  v16[3] = &unk_1E99D2B88;
  v16[4] = self;
  objc_msgSend(v15, "perform:", v16);

}

- (void)addThumbnailRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "addThumbnailRequest relinquishing _modeLock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addThumbnailRequest:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "addThumbnailRequest has _modeLock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addThumbnailRequest:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "addThumbnailRequest waiting for _modeLock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)contentDescriptionForURL:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_2();
  v3 = v0;
  OUTLINED_FUNCTION_0_1(&dword_1D54AE000, v1, (uint64_t)v1, "Could not identify file at URL %@: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_shouldQuitLowSpaceModeForMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "Still low disk space, so we will stay in that mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_shouldQuitClosedModeForMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D54AE000, v0, v1, "Problem to open the cache, unregistering for low disk space notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_shouldQuitClosedModeForMode:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D54AE000, v0, v1, "Problem to open the cache, so we disabled it", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_shouldQuitClosedModeForMode:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 48), "thumbnailToSaveCount");
  OUTLINED_FUNCTION_6_0();
  _os_log_debug_impl(&dword_1D54AE000, a2, OS_LOG_TYPE_DEBUG, "opening databases (thumbnails in memory %lu)", v3, 0xCu);
}

- (void)_shouldQuitClosedModeForMode:.cold.4()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_2();
  _os_log_error_impl(&dword_1D54AE000, v0, OS_LOG_TYPE_ERROR, "Can not switch from closed mode to %@", v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

- (void)_willStartClosedModeFromMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D54AE000, v0, v1, "Can't close the cache right now", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_willStartClosedModeFromMode:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "close database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_willStartCleanUpDatabaseModeFromMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "start Writing thumbnails", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_setMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "current mode %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_setMode:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "changing to %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_setMode:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "change mode denied", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_setMode:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_2();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_1D54AE000, v1, OS_LOG_TYPE_DEBUG, "try to change mode from %@ to %@", v2, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)allThumbnailsForIno:fsid:.cold.1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  v3 = 1024;
  v4 = v0;
  v5 = 2112;
  v6 = 0;
  _os_log_error_impl(&dword_1D54AE000, v1, OS_LOG_TYPE_ERROR, "Could not identify file at ino %llu fsid %d: %@", v2, 0x1Cu);
}

- (void)allThumbnailsForFPItemID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_2();
  v3 = 0;
  OUTLINED_FUNCTION_0_1(&dword_1D54AE000, v0, v1, "Could not identify file with file provider item %@ : %@", v2);
  OUTLINED_FUNCTION_5();
}

@end
