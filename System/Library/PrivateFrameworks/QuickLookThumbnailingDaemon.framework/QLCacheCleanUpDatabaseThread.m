@implementation QLCacheCleanUpDatabaseThread

- (void)addHitWithThumbnailData:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  QLCachedThumbnailDescriptor *v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  QLCachedThumbnailDescriptor *v13;
  NSObject *v14;
  void *v15;
  NSMutableDictionary *thumbnailsHit;
  void *v17;
  id v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_thumbnailsHit;
  objc_sync_enter(v5);
  v6 = [QLCachedThumbnailDescriptor alloc];
  objc_msgSend(v4, "size");
  v8 = v7;
  v9 = objc_msgSend(v4, "iconMode");
  v10 = objc_msgSend(v4, "badgeType");
  v11 = objc_msgSend(v4, "externalGeneratorDataHash");
  LODWORD(v12) = v8;
  v13 = -[QLCachedThumbnailDescriptor initWithSize:iconMode:badgeType:externalGeneratorDataHash:](v6, "initWithSize:iconMode:badgeType:externalGeneratorDataHash:", v9, v10, v11, v12);
  _dbLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "fileIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLCacheCleanUpDatabaseThread addHitWithThumbnailData:].cold.1(v15, (uint64_t)v25, v14);
  }

  thumbnailsHit = self->_thumbnailsHit;
  objc_msgSend(v4, "fileIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](thumbnailsHit, "objectForKey:", v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v19 = self->_thumbnailsHit;
    objc_msgSend(v4, "fileIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v18, v20);

  }
  objc_msgSend(v18, "objectForKey:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
    v23 = objc_msgSend(v21, "unsignedIntValue") + 1;
  else
    v23 = 1;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v23);

  objc_msgSend(v18, "setObject:forKey:", v24, v13);
  objc_sync_exit(v5);

}

- (void)pause
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "pause thread", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_stopWriteAndCleanUpThreadRunLoop
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "stopping runloop", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)startCleanUp
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "calling to stop the runloop", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (unint64_t)hitToSaveCount
{
  NSMutableDictionary *v3;
  unint64_t v4;

  v3 = self->_thumbnailsHit;
  objc_sync_enter(v3);
  v4 = -[NSMutableDictionary count](self->_thumbnailsHit, "count");
  objc_sync_exit(v3);

  return v4;
}

- (void)_threadMain
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "getting runloop", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

uint64_t __48__QLCacheCleanUpDatabaseThread__writeAndCleanUp__block_invoke(uint64_t a1)
{
  NSObject *v2;
  __int128 v3;
  uint64_t v4;
  NSObject *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  _dbLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __48__QLCacheCleanUpDatabaseThread__writeAndCleanUp__block_invoke_cold_2();

  if (objc_msgSend(*(id *)(a1 + 32), "currentMode") == 1
    && (objc_msgSend(*(id *)(a1 + 32), "diskCacheCleanupDone") & 1) == 0)
  {
    *(_QWORD *)&v3 = 134218242;
    v25 = v3;
    do
    {
      v7 = (void *)MEMORY[0x1D82731C0]();
      objc_msgSend(*(id *)(a1 + 32), "cacheThread");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "memoryCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "thumbnailDataToSaveWithBatch:", 20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      _dbLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = objc_msgSend(v10, "count");
        objc_msgSend(*(id *)(a1 + 32), "cacheThread");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "memoryCache");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v25;
        v27 = v12;
        v28 = 2112;
        v29 = v14;
        _os_log_impl(&dword_1D54AE000, v11, OS_LOG_TYPE_INFO, "Writing %lu thumbnails from %@", buf, 0x16u);

      }
      v15 = *(void **)(a1 + 32);
      if (v10)
      {
        objc_msgSend(v15, "cacheThread");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "diskCache");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "writeThumbnailDataBatch:", v10);

        objc_msgSend(*(id *)(a1 + 32), "cacheThread");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "memoryCache");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "thumbnailDataBatchSaved:", v10);

        v4 = 1;
      }
      else
      {
        LODWORD(v4) = objc_msgSend(v15, "_updateHitCount");
        objc_msgSend(*(id *)(a1 + 32), "cacheThread");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "diskCache");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "cleanup");

        if (v22)
          v4 = 1;
        else
          v4 = v4;
        if (objc_msgSend(*(id *)(a1 + 32), "shouldRemoveThumbnailsForDeletedFiles", v25))
        {
          objc_msgSend(*(id *)(a1 + 32), "cacheThread");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "diskCache");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "cleanupDeletedFiles"))
            v4 = 1;
          else
            v4 = v4;

        }
        objc_msgSend(*(id *)(a1 + 32), "setDiskCacheCleanupDone:", 1);
        objc_msgSend(*(id *)(a1 + 32), "cacheThread");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_cleanUpDatabaseDone");
      }

      objc_autoreleasePoolPop(v7);
    }
    while (objc_msgSend(*(id *)(a1 + 32), "currentMode") == 1
         && (objc_msgSend(*(id *)(a1 + 32), "diskCacheCleanupDone") & 1) == 0);
  }
  else
  {
    v4 = 0;
  }
  _dbLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __48__QLCacheCleanUpDatabaseThread__writeAndCleanUp__block_invoke_cold_1();

  return v4;
}

- (_QLCacheThread)cacheThread
{
  return (_QLCacheThread *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)diskCacheCleanupDone
{
  return self->_diskCacheCleanupDone;
}

- (int)currentMode
{
  return self->_currentMode;
}

- (BOOL)shouldRemoveThumbnailsForDeletedFiles
{
  return self->_shouldRemoveThumbnailsForDeletedFiles;
}

- (void)setDiskCacheCleanupDone:(BOOL)a3
{
  self->_diskCacheCleanupDone = a3;
}

- (void)_writeAndCleanUp
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1D54AE000, v0, OS_LOG_TYPE_ERROR, "Unable to write memory cache on disk", v1, 2u);
  OUTLINED_FUNCTION_2();
}

- (BOOL)_updateHitCount
{
  NSMutableDictionary *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = self->_thumbnailsHit;
  objc_sync_enter(v3);
  -[NSMutableDictionary allKeys](self->_thumbnailsHit, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_QLCacheThread diskCache](self->_cacheThread, "diskCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_thumbnailsHit, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateHitCount:forFileIdentifier:", v8, v6);

    -[NSMutableDictionary removeObjectForKey:](self->_thumbnailsHit, "removeObjectForKey:", v6);
  }

  objc_sync_exit(v3);
  return v5 != 0;
}

- (QLCacheCleanUpDatabaseThread)initWithCacheThread:(id)a3
{
  id v5;
  QLCacheCleanUpDatabaseThread *v6;
  QLCacheCleanUpDatabaseThread *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *thumbnailsHit;
  uint64_t v10;
  NSConditionLock *threadLock;

  v5 = a3;
  v6 = -[QLCacheCleanUpDatabaseThread init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cacheThread, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    thumbnailsHit = v7->_thumbnailsHit;
    v7->_thumbnailsHit = v8;

    v7->_currentMode = 0;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
    threadLock = v7->_threadLock;
    v7->_threadLock = (NSConditionLock *)v10;

  }
  return v7;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "dealloc QLCacheCleanUpDatabaseThread", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)stop
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "stop Writing thumbnails", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)cleanUpForReset
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[NSConditionLock lockWhenCondition:](self->_threadLock, "lockWhenCondition:", 0);
  -[_QLCacheThread diskCache](self->_cacheThread, "diskCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__QLCacheCleanUpDatabaseThread_cleanUpForReset__block_invoke;
  v8[3] = &unk_1E99D3668;
  v8[4] = self;
  v4 = objc_msgSend(v3, "doWriting:", v8);

  if ((v4 & 1) == 0)
  {
    -[_QLCacheThread memoryCache](self->_cacheThread, "memoryCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reset");

    -[QLCacheCleanUpDatabaseThread thumbnailsHit](self, "thumbnailsHit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v6);
    -[QLCacheCleanUpDatabaseThread thumbnailsHit](self, "thumbnailsHit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeAllObjects");

    objc_sync_exit(v6);
  }
  -[NSConditionLock unlock](self->_threadLock, "unlock");
}

BOOL __47__QLCacheCleanUpDatabaseThread_cleanUpForReset__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  _dbLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __47__QLCacheCleanUpDatabaseThread_cleanUpForReset__block_invoke_cold_3();

  objc_msgSend(*(id *)(a1 + 32), "cacheThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "memoryCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbnailDataToSaveWithBatch:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _dbLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __47__QLCacheCleanUpDatabaseThread_cleanUpForReset__block_invoke_cold_2(v5, v6);

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "cacheThread");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diskCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "discardThumbnailDataBatchForReset:", v5);

    objc_msgSend(*(id *)(a1 + 32), "cacheThread");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "memoryCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "thumbnailDataBatchSaved:", v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "thumbnailsHit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v11);
  objc_msgSend(*(id *)(a1 + 32), "thumbnailsHit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  objc_sync_exit(v11);
  _dbLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    __47__QLCacheCleanUpDatabaseThread_cleanUpForReset__block_invoke_cold_1();

  return v5 != 0;
}

- (void)setShouldRemoveThumbnailsForDeletedFiles:(BOOL)a3
{
  self->_shouldRemoveThumbnailsForDeletedFiles = a3;
}

- (void)setCacheThread:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)thumbnailsHit
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setThumbnailsHit:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thread, 0);
  objc_storeStrong((id *)&self->_threadLock, 0);
  objc_storeStrong((id *)&self->_cacheThread, 0);
  objc_storeStrong((id *)&self->_thumbnailsHit, 0);
}

- (void)addHitWithThumbnailData:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5_1(&dword_1D54AE000, a3, (uint64_t)a3, "add hit for %@", (uint8_t *)a2);

}

void __48__QLCacheCleanUpDatabaseThread__writeAndCleanUp__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "End writing and clean up", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __48__QLCacheCleanUpDatabaseThread__writeAndCleanUp__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "Start Writing and clean up", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47__QLCacheCleanUpDatabaseThread_cleanUpForReset__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "End cleaning up for reset", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47__QLCacheCleanUpDatabaseThread_cleanUpForReset__block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 134217984;
  v5 = objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_5_1(&dword_1D54AE000, a2, v3, "Discarding %lu thumbnails", (uint8_t *)&v4);
}

void __47__QLCacheCleanUpDatabaseThread_cleanUpForReset__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "Start cleaning up for reset", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
