@implementation QLThumbnailAdditionIndex

- (int64_t)purgeableSpaceOnMountPoint:(id)a3 withUrgency:(int)a4 beforeDate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  QLThumbnailAdditionIndex *v25;
  id v26;
  NSObject *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v7 = a3;
  v8 = a5;
  if (self->_db || (-[QLThumbnailAdditionIndex open](self, "open"), self->_db))
  {
    -[QLThumbnailAdditionIndex volumeRestrictionForMountPoint:](self, "volumeRestrictionForMountPoint:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__4;
    v33 = __Block_byref_object_dispose__4;
    v34 = 0;
    -[PQLConnection serialQueue](self->_db, "serialQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __91__QLThumbnailAdditionIndex_CacheDelete__purgeableSpaceOnMountPoint_withUrgency_beforeDate___block_invoke;
    v24 = &unk_1E99D3940;
    v28 = &v29;
    v25 = self;
    v26 = v8;
    v11 = v9;
    v27 = v11;
    dispatch_sync(v10, &v21);

    v12 = objc_msgSend((id)v30[5], "longLongValue", v21, v22, v23, v24, v25);
    _Block_object_dispose(&v29, 8);

  }
  else
  {
    _log_2();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[QLThumbnailAdditionIndex(CacheDelete) purgeableSpaceOnMountPoint:withUrgency:beforeDate:].cold.1(v11, v14, v15, v16, v17, v18, v19, v20);
    v12 = 0;
  }

  return v12;
}

- (id)volumeRestrictionForMountPoint:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  v6[1] = 0;
  v3 = 0;
  if (objc_msgSend(a3, "qlt_getVolumeUUID:", v6))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v6, 16);
    objc_msgSend(MEMORY[0x1E0DE81D0], "formatInjection:", CFSTR("AND vol_uuid = %@"), v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

void __91__QLThumbnailAdditionIndex_CacheDelete__purgeableSpaceOnMountPoint_withUrgency_beforeDate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("SELECT SUM(size) FROM thumbnails WHERE last_hit_date < %@ %@"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (PQLConnection)db
{
  return (PQLConnection *)objc_getProperty(self, a2, 16, 1);
}

+ (void)registerCleanupXPCActivity
{
  void *v2;
  _QWORD handler[5];

  v2 = (void *)*MEMORY[0x1E0C80748];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __54__QLThumbnailAdditionIndex_registerCleanupXPCActivity__block_invoke;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = a1;
  xpc_activity_register("com.apple.quicklook.cloudThumbnailDatabaseCleanup", v2, handler);
}

void __54__QLThumbnailAdditionIndex_registerCleanupXPCActivity__block_invoke(uint64_t a1, xpc_activity_t activity)
{
  id v3;

  if (xpc_activity_get_state(activity) == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "performDatabaseMaintenance");

  }
}

+ (void)setUpCleanupXPCActivitySynchronously:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__QLThumbnailAdditionIndex_setUpCleanupXPCActivitySynchronously___block_invoke;
  v3[3] = &__block_descriptor_41_e5_v8__0l;
  v4 = a3;
  v3[4] = a1;
  if (setUpCleanupXPCActivitySynchronously__once != -1)
    dispatch_once(&setUpCleanupXPCActivitySynchronously__once, v3);
}

void __65__QLThumbnailAdditionIndex_setUpCleanupXPCActivitySynchronously___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "registerCleanupXPCActivity");
  }
  else
  {
    dispatch_get_global_queue(9, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__QLThumbnailAdditionIndex_setUpCleanupXPCActivitySynchronously___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v2, block);

  }
}

uint64_t __65__QLThumbnailAdditionIndex_setUpCleanupXPCActivitySynchronously___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerCleanupXPCActivity");
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__QLThumbnailAdditionIndex_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once_0 != -1)
    dispatch_once(&sharedInstance_once_0, block);
  return (id)sSharedInstance;
}

uint64_t __42__QLThumbnailAdditionIndex_sharedInstance__block_invoke(uint64_t result)
{
  uint64_t v1;
  id v2;
  void *v3;

  if (!sSharedInstance)
  {
    v1 = result;
    v2 = objc_alloc_init(*(Class *)(result + 32));
    v3 = (void *)sSharedInstance;
    sSharedInstance = (uint64_t)v2;

    return objc_msgSend(*(id *)(v1 + 32), "setUpCleanupXPCActivitySynchronously:", 0);
  }
  return result;
}

- (QLThumbnailAdditionIndex)initWithURL:(id)a3
{
  id v5;
  QLThumbnailAdditionIndex *v6;
  QLThumbnailAdditionIndex *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLThumbnailAdditionIndex;
  v6 = -[QLThumbnailAdditionIndex init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v7->_exitsOnCorruption = 1;
  }

  return v7;
}

- (BOOL)open
{
  QLThumbnailAdditionIndex *v2;
  NSObject *v3;
  NSURL *url;
  void *v5;
  id v7;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_db)
  {
    _log_2();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[QLThumbnailAdditionIndex open].cold.1();
  }
  else
  {
    url = v2->_url;
    v7 = 0;
    -[QLThumbnailAdditionIndex openDatabaseAtURL:error:](v2, "openDatabaseAtURL:error:", url, &v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v7;
    if (v5)
      objc_storeStrong((id *)&v2->_db, v5);

  }
  objc_sync_exit(v2);

  return 1;
}

- (void)_cleanUpAfterClose
{
  NSObject *dbWatcher;
  OS_dispatch_source *v4;

  dbWatcher = self->_dbWatcher;
  if (dbWatcher)
  {
    dispatch_source_cancel(dbWatcher);
    v4 = self->_dbWatcher;
    self->_dbWatcher = 0;

  }
}

- (void)_closeDatabaseOnItsQueue:(id)a3
{
  PQLConnection *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;

  v4 = (PQLConnection *)a3;
  v8 = 0;
  v5 = -[PQLConnection close:](v4, "close:", &v8);
  v6 = v8;
  if ((v5 & 1) == 0)
  {
    _log_2();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[QLThumbnailAdditionIndex _closeDatabaseOnItsQueue:].cold.1();

  }
  if (self->_db == v4)
  {
    self->_db = 0;

  }
}

- (BOOL)dispatchSyncOnDatabaseQueue:(id)a3
{
  void (**v4)(_QWORD);
  PQLConnection *v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  _QWORD v10[4];
  PQLConnection *v11;
  QLThumbnailAdditionIndex *v12;
  void (**v13)(_QWORD);
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = (void (**)(_QWORD))a3;
  v5 = self->_db;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  -[PQLConnection serialQueue](v5, "serialQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PQLConnection serialQueue](v5, "serialQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__QLThumbnailAdditionIndex_dispatchSyncOnDatabaseQueue___block_invoke;
    v10[3] = &unk_1E99D3760;
    v11 = v5;
    v12 = self;
    v14 = &v15;
    v13 = v4;
    dispatch_sync(v7, v10);

    v8 = *((_BYTE *)v16 + 24) != 0;
  }
  else
  {
    v4[2](v4);
    v8 = 1;
  }
  _Block_object_dispose(&v15, 8);

  return v8;
}

_QWORD *__56__QLThumbnailAdditionIndex_dispatchSyncOnDatabaseQueue___block_invoke(_QWORD *result)
{
  if (result[4] == *(_QWORD *)(result[5] + 16))
    return (_QWORD *)(*(uint64_t (**)(void))(result[6] + 16))();
  *(_BYTE *)(*(_QWORD *)(result[7] + 8) + 24) = 0;
  return result;
}

- (void)close
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__QLThumbnailAdditionIndex_close__block_invoke;
  v3[3] = &unk_1E99D2B88;
  v3[4] = self;
  -[QLThumbnailAdditionIndex dispatchSyncOnDatabaseQueue:](self, "dispatchSyncOnDatabaseQueue:", v3);
  -[QLThumbnailAdditionIndex _cleanUpAfterClose](self, "_cleanUpAfterClose");
}

void __33__QLThumbnailAdditionIndex_close__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "db");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_closeDatabaseOnItsQueue:", v2);

}

- (void)flush
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __33__QLThumbnailAdditionIndex_flush__block_invoke;
  v2[3] = &unk_1E99D2B88;
  v2[4] = self;
  -[QLThumbnailAdditionIndex dispatchSyncOnDatabaseQueue:](self, "dispatchSyncOnDatabaseQueue:", v2);
}

void __33__QLThumbnailAdditionIndex_flush__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "flush");

}

- (void)setUpDatabase:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  NSObject *dbWatcher;
  OS_dispatch_source *v9;
  id v10;
  const char *v11;
  OS_dispatch_source *v12;
  OS_dispatch_source *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  _QWORD v17[4];
  int v18;
  _QWORD handler[4];
  id v20;
  id v21;
  id location;
  _QWORD block[4];
  id v24;

  v4 = a3;
  objc_msgSend(v4, "useSerialQueue");
  objc_msgSend(v4, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__QLThumbnailAdditionIndex_setUpDatabase___block_invoke;
  block[3] = &unk_1E99D2B88;
  v7 = v4;
  v24 = v7;
  dispatch_sync(v5, block);

  dbWatcher = self->_dbWatcher;
  if (dbWatcher)
  {
    dispatch_source_cancel(dbWatcher);
    v9 = self->_dbWatcher;
    self->_dbWatcher = 0;

  }
  objc_msgSend(v7, "url");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (const char *)objc_msgSend(v10, "fileSystemRepresentation");

  LODWORD(v10) = open(v11, 32772);
  v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DE8], (int)v10, 1uLL, 0);
  v13 = self->_dbWatcher;
  self->_dbWatcher = v12;

  objc_initWeak(&location, self);
  v14 = self->_dbWatcher;
  handler[0] = v6;
  handler[1] = 3221225472;
  handler[2] = __42__QLThumbnailAdditionIndex_setUpDatabase___block_invoke_2;
  handler[3] = &unk_1E99D3788;
  objc_copyWeak(&v21, &location);
  v20 = v7;
  v15 = v7;
  dispatch_source_set_event_handler(v14, handler);
  v16 = self->_dbWatcher;
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __42__QLThumbnailAdditionIndex_setUpDatabase___block_invoke_2_6;
  v17[3] = &__block_descriptor_36_e5_v8__0l;
  v18 = (int)v10;
  dispatch_source_set_cancel_handler(v16, v17);
  dispatch_resume((dispatch_object_t)self->_dbWatcher);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

uint64_t __42__QLThumbnailAdditionIndex_setUpDatabase___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "useBatchingWithDelay:changeCount:", 500, 2.0);
}

void __42__QLThumbnailAdditionIndex_setUpDatabase___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  id v6;

  _log_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __42__QLThumbnailAdditionIndex_setUpDatabase___block_invoke_2_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__QLThumbnailAdditionIndex_setUpDatabase___block_invoke_5;
  v4[3] = &unk_1E99D3788;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v5 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "dispatchSyncOnDatabaseQueue:", v4);

  objc_destroyWeak(&v6);
}

void __42__QLThumbnailAdditionIndex_setUpDatabase___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_resetDatabaseOnItsQueue:", *(_QWORD *)(a1 + 32));

}

uint64_t __42__QLThumbnailAdditionIndex_setUpDatabase___block_invoke_2_6(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (id)upgradeDatabaseIfNeeded:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  __int128 v9;
  NSObject *v10;
  char v11;
  void *v12;
  unsigned int v13;
  char v14;
  void *v15;
  NSObject *v16;
  NSObject *v18;
  void *v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  char v23;
  unsigned int v24;
  void *v25;
  int v26;
  __int128 v27;
  void *v28;
  _QWORD v29[5];
  unsigned int v30;
  uint8_t v31[4];
  int v32;
  __int16 v33;
  unsigned int v34;
  uint8_t buf[8];
  uint8_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _log_2();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[QLThumbnailAdditionIndex upgradeDatabaseIfNeeded:error:].cold.4();

  objc_msgSend(v5, "userVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v7;
  if (v7)
  {
    v8 = objc_msgSend(v7, "unsignedIntValue");
    if (v8 <= 2)
    {
      *(_QWORD *)&v9 = 67109376;
      v27 = v9;
      do
      {
        _log_2();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v27;
          if (v8)
            v24 = v8 + 1;
          else
            v24 = 0;
          *(_DWORD *)&buf[4] = v8;
          LOWORD(v36) = 1024;
          *(_DWORD *)((char *)&v36 + 2) = v24;
          _os_log_debug_impl(&dword_1D54AE000, v18, OS_LOG_TYPE_DEBUG, "migrating database from version %d to %d", buf, 0xEu);
        }

        *(_QWORD *)buf = 0;
        v36 = buf;
        v37 = 0x3032000000;
        v38 = __Block_byref_object_copy__3;
        v39 = __Block_byref_object_dispose__3;
        v40 = 0;
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __58__QLThumbnailAdditionIndex_upgradeDatabaseIfNeeded_error___block_invoke;
        v29[3] = &unk_1E99D37E8;
        v30 = v8;
        v29[4] = buf;
        v11 = objc_msgSend(v5, "performWithFlags:action:", 10, v29);
        if (a4)
        {
          v19 = (void *)*((_QWORD *)v36 + 5);
          if (v19)
            *a4 = objc_retainAutorelease(v19);
        }
        objc_msgSend(v5, "userVersion", v27);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v8 + 1 == objc_msgSend(v20, "unsignedIntValue");

        if (!v21)
        {
          _log_2();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v5, "userVersion");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "unsignedIntValue");
            *(_DWORD *)v31 = v27;
            v32 = v26;
            v33 = 1024;
            v34 = v8 + 1;
            _os_log_error_impl(&dword_1D54AE000, v22, OS_LOG_TYPE_ERROR, "database is at version %u instead of %d", v31, 0xEu);

          }
        }
        _Block_object_dispose(buf, 8);

        if (v8 < 2)
          v23 = v11;
        else
          v23 = 0;
        ++v8;
      }
      while ((v23 & 1) != 0);
    }
    else
    {
      _log_2();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[QLThumbnailAdditionIndex upgradeDatabaseIfNeeded:error:].cold.3(v8, v10);

      v11 = 1;
    }
    objc_msgSend(v5, "userVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntValue");
    v14 = v11 ^ 1;
    if (v13 > 2)
      v14 = 1;
    if ((v14 & 1) == 0)
      -[QLThumbnailAdditionIndex upgradeDatabaseIfNeeded:error:].cold.2();

    if ((v11 & 1) == 0)
    {
      objc_msgSend(v5, "close:", 0);

      v5 = 0;
    }
    v5 = v5;
    v15 = v5;
  }
  else
  {
    if (a4)
    {
      objc_msgSend(v5, "lastError");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    _log_2();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[QLThumbnailAdditionIndex upgradeDatabaseIfNeeded:error:].cold.1(v5, v16);

    objc_msgSend(v5, "close:", 0);
    v15 = 0;
  }

  return v15;
}

uint64_t __58__QLThumbnailAdditionIndex_upgradeDatabaseIfNeeded_error___block_invoke(uint64_t a1, uint64_t a2)
{
  int *v2;
  uint64_t (*v3)();
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id obj;

  v2 = (int *)(a1 + 40);
  v3 = upgradeDatabaseIfNeeded_error__migration_functions[*(unsigned int *)(a1 + 40)];
  v4 = a1 + 32;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v5 + 40);
  v6 = ((uint64_t (*)(uint64_t, id *))v3)(a2, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  if ((v6 & 1) == 0)
  {
    _log_2();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __58__QLThumbnailAdditionIndex_upgradeDatabaseIfNeeded_error___block_invoke_cold_1(v2, v4, v7);

  }
  return v6;
}

- (void)logError:(id)a3 onDB:(id)a4 statement:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  _log_2();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v9)
  {
    if (v11)
    {
      v12 = 138412802;
      v13 = v9;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v7;
      _os_log_error_impl(&dword_1D54AE000, v10, OS_LOG_TYPE_ERROR, "Sqlite request %@ failed on %@ with error [%@]", (uint8_t *)&v12, 0x20u);
    }
  }
  else if (v11)
  {
    -[QLThumbnailAdditionIndex logError:onDB:statement:].cold.1();
  }

}

- (id)makeDatabaseAtURL:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v17;
  NSObject *v18;
  _QWORD v19[5];
  _QWORD v20[6];
  _QWORD v21[4];

  v6 = a3;
  _log_2();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[QLThumbnailAdditionIndex makeDatabaseAtURL:error:].cold.4();

  if ((objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
  {
LABEL_7:
    v8 = objc_alloc_init(MEMORY[0x1E0DE81C8]);
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v21[3] = 0;
    v11 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __52__QLThumbnailAdditionIndex_makeDatabaseAtURL_error___block_invoke;
    v20[3] = &unk_1E99D3810;
    v20[4] = self;
    v20[5] = v21;
    objc_msgSend(v8, "setSqliteErrorHandler:", v20);
    objc_msgSend(v8, "setLabel:", CFSTR("Quick Look cloud thumbnails cache"));
    if ((objc_msgSend(v8, "openAtURL:sharedCache:error:", v6, 0, a4) & 1) == 0)
    {
      _log_2();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[QLThumbnailAdditionIndex makeDatabaseAtURL:error:].cold.2();

      goto LABEL_18;
    }
    if ((objc_msgSend(v8, "setupPragmas") & 1) != 0)
    {
      objc_msgSend(v8, "setSynchronousMode:", 1);
      objc_msgSend(v8, "lastError");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v19[0] = v11;
        v19[1] = 3221225472;
        v19[2] = __52__QLThumbnailAdditionIndex_makeDatabaseAtURL_error___block_invoke_15;
        v19[3] = &unk_1E99D3838;
        v19[4] = self;
        objc_msgSend(v8, "setSqliteErrorHandler:", v19);
        _log_2();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[QLThumbnailAdditionIndex makeDatabaseAtURL:error:].cold.1();

        v15 = v8;
        goto LABEL_19;
      }
      if (!a4)
      {
LABEL_18:
        objc_msgSend(v8, "close:", 0);
        v15 = 0;
LABEL_19:
        _Block_object_dispose(v21, 8);
        goto LABEL_20;
      }
    }
    else
    {
      objc_msgSend(v8, "lastError");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!a4 || !v14)
        goto LABEL_18;
    }
    objc_msgSend(v8, "lastError");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  objc_msgSend(v6, "URLByDeletingLastPathComponent");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 0, 0, a4),
        v9,
        (v10 & 1) != 0))
  {

    goto LABEL_7;
  }
  _log_2();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[QLThumbnailAdditionIndex makeDatabaseAtURL:error:].cold.3();

  v15 = 0;
LABEL_20:

  return v15;
}

void __52__QLThumbnailAdditionIndex_makeDatabaseAtURL_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v7;
  id v8;
  uint64_t v9;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  objc_msgSend(v7, "logError:onDB:statement:", v8, a2, a3);
  v9 = objc_msgSend(v8, "code");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;
}

uint64_t __52__QLThumbnailAdditionIndex_makeDatabaseAtURL_error___block_invoke_15(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "logError:onDB:statement:", a4, a2, a3);
}

- (BOOL)removeDatabaseAtURL:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;

  v5 = (void *)MEMORY[0x1E0C99E98];
  v6 = a3;
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("-wal"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v6, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingString:", CFSTR("-shm"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fileURLWithPath:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v6, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingString:", CFSTR("-journal"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fileURLWithPath:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "removeItemAtURL:error:", v6, a4);

  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeItemAtURL:error:", v9, 0);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeItemAtURL:error:", v13, 0);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeItemAtURL:error:", v17, 0);

  }
  return v19;
}

- (id)openDatabaseAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  unsigned int v12;
  NSObject *v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v23;
  _QWORD v24[4];
  id v25;
  id location;
  id v27;
  id v28;
  id v29;

  v6 = a3;
  v29 = 0;
  -[QLThumbnailAdditionIndex makeDatabaseAtURL:error:](self, "makeDatabaseAtURL:error:", v6, &v29);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v29;
  v9 = v8;
  if (v7)
  {
    v10 = v8;
  }
  else
  {
    _log_2();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[QLThumbnailAdditionIndex openDatabaseAtURL:error:].cold.5();

    v12 = objc_msgSend(v9, "code");
    if (v12 > 0x1A || ((1 << v12) & 0x5000800) == 0)
      goto LABEL_26;
    _log_2();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[QLThumbnailAdditionIndex openDatabaseAtURL:error:].cold.4();

    v28 = v9;
    v15 = -[QLThumbnailAdditionIndex removeDatabaseAtURL:error:](self, "removeDatabaseAtURL:error:", v6, &v28);
    v16 = v28;

    if (!v15)
    {
      _log_2();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[QLThumbnailAdditionIndex openDatabaseAtURL:error:].cold.3();

    }
    v27 = v16;
    -[QLThumbnailAdditionIndex makeDatabaseAtURL:error:](self, "makeDatabaseAtURL:error:", v6, &v27);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v27;

    v10 = v9;
    if (!v7)
    {
LABEL_26:
      if (a4)
      {
        v9 = objc_retainAutorelease(v9);
        v18 = 0;
        *a4 = v9;
      }
      else
      {
        v18 = 0;
      }
      goto LABEL_25;
    }
  }
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __52__QLThumbnailAdditionIndex_openDatabaseAtURL_error___block_invoke;
  v24[3] = &unk_1E99D3860;
  objc_copyWeak(&v25, &location);
  objc_msgSend(v7, "setAutoRollbackHandler:", v24);
  v23 = v10;
  -[QLThumbnailAdditionIndex upgradeDatabaseIfNeeded:error:](self, "upgradeDatabaseIfNeeded:error:", v7, &v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v23;

  if (v18)
  {
    _log_2();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[QLThumbnailAdditionIndex openDatabaseAtURL:error:].cold.2();

    -[QLThumbnailAdditionIndex setUpDatabase:](self, "setUpDatabase:", v18);
    v20 = v18;
  }
  else
  {
    _log_2();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[QLThumbnailAdditionIndex openDatabaseAtURL:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

LABEL_25:
  return v18;
}

void __52__QLThumbnailAdditionIndex_openDatabaseAtURL_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *v10;
  id WeakRetained;
  _BYTE *v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD block[4];
  id v19;
  _BYTE *v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v10);

  if (WeakRetained)
  {
    v12 = objc_loadWeakRetained(v10);
    objc_msgSend(v9, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DE81E8]);

    if (v14)
    {
      if (objc_msgSend(v9, "code") == 13)
      {
        _log_2();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          __52__QLThumbnailAdditionIndex_openDatabaseAtURL_error___block_invoke_cold_1();

        if (v12[32])
          exit(1);
        goto LABEL_13;
      }
      if (objc_msgSend(v9, "code") == 11)
      {
        _log_2();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          __52__QLThumbnailAdditionIndex_openDatabaseAtURL_error___block_invoke_cold_2();

        objc_msgSend(v12, "_neuterAutoRollbackHandler");
        objc_msgSend(v7, "serialQueue");
        v17 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __52__QLThumbnailAdditionIndex_openDatabaseAtURL_error___block_invoke_23;
        block[3] = &unk_1E99D2CD0;
        v19 = v7;
        v20 = v12;
        dispatch_async(v17, block);

        goto LABEL_13;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Sqlite rollbacked transaction [%@] because of unrecoverable error [%@], aborting."), v8, v9);
LABEL_13:

  }
}

uint64_t __52__QLThumbnailAdditionIndex_openDatabaseAtURL_error___block_invoke_23(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "flush");
  result = objc_msgSend(*(id *)(a1 + 40), "_resetDatabaseOnItsQueue:", *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 32))
    exit(1);
  return result;
}

- (void)_neuterAutoRollbackHandler
{
  -[PQLConnection setAutoRollbackHandler:](self->_db, "setAutoRollbackHandler:", &__block_literal_global_6);
}

void __54__QLThumbnailAdditionIndex__neuterAutoRollbackHandler__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a4;
  _log_2();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __54__QLThumbnailAdditionIndex__neuterAutoRollbackHandler__block_invoke_cold_1();

}

- (void)_resetDatabaseOnItsQueue:(id)a3
{
  id v4;
  QLThumbnailAdditionIndex *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSURL *url;
  int v12;
  NSURL *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  _log_2();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[QLThumbnailAdditionIndex _resetDatabaseOnItsQueue:].cold.2();

  objc_msgSend(v4, "dbHandle");
  v7 = _sqlite3_db_truncate();
  if (v7)
  {
    _log_2();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      url = v5->_url;
      v12 = 138412802;
      v13 = url;
      v14 = 1024;
      v15 = v7;
      v16 = 2080;
      v17 = sqlite3_errmsg((sqlite3 *)objc_msgSend(v4, "dbHandle"));
      _os_log_error_impl(&dword_1D54AE000, v8, OS_LOG_TYPE_ERROR, "Failed to truncate database at %@: %d (%s)", (uint8_t *)&v12, 0x1Cu);
    }

  }
  -[QLThumbnailAdditionIndex _neuterAutoRollbackHandler](v5, "_neuterAutoRollbackHandler");
  -[QLThumbnailAdditionIndex _closeDatabaseOnItsQueue:](v5, "_closeDatabaseOnItsQueue:", v4);
  -[QLThumbnailAdditionIndex _cleanUpAfterClose](v5, "_cleanUpAfterClose");
  _log_2();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[QLThumbnailAdditionIndex _resetDatabaseOnItsQueue:].cold.1();

  -[QLThumbnailAdditionIndex openDatabaseAtURL:error:](v5, "openDatabaseAtURL:error:", v5->_url, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_storeStrong((id *)&v5->_db, v10);
  objc_sync_exit(v5);

}

- (id)initForTesting
{
  void *v3;
  void *v4;
  id v5;
  char *v6;
  char *v7;
  int v8;
  void *v9;
  QLThumbnailAdditionIndex *v10;

  NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("cloudthumbnails.XXXXXX.db"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_retainAutorelease(v4);
  v6 = strdup((const char *)objc_msgSend(v5, "fileSystemRepresentation"));
  if (!v6)
    goto LABEL_5;
  v7 = v6;
  v8 = mkstemps(v6, 3);
  if (v8 < 1)
  {
    free(v7);
LABEL_5:

    v10 = 0;
    goto LABEL_6;
  }
  close(v8);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v7, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[QLThumbnailAdditionIndex initWithURL:](self, "initWithURL:", v9);

  v10->_exitsOnCorruption = 0;
  free(v7);
LABEL_6:
  objc_storeStrong((id *)&sSharedInstance, v10);

  return v10;
}

- (QLThumbnailAdditionIndex)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  QLThumbnailAdditionIndex *v9;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  QLTGetDefaultCacheLocation();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("cloudthumbnails.db"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "fileExistsAtPath:", v5) & 1) == 0)
  {
    objc_msgSend(v3, "URLForDirectory:inDomain:appropriateForURL:create:error:", 14, 1, 0, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("Quick Look/cloudthumbnails.db"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "moveItemAtURL:toURL:error:", v8, v6, 0);

  }
  v9 = -[QLThumbnailAdditionIndex initWithURL:](self, "initWithURL:", v6);

  return v9;
}

- (id)whereClauseForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v7 = 0;
  v8[0] = 0;
  v8[1] = 0;
  v4 = 0;
  if (objc_msgSend(v3, "qlt_getDocumentIdentifier:", &v7))
  {
    if (objc_msgSend(v3, "qlt_getVolumeUUID:", v8))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v8, 16);
      objc_msgSend(MEMORY[0x1E0DE81D0], "formatInjection:", CFSTR("docid = %u AND vol_uuid = %@"), v7, v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (BOOL)hasThumbnailForURL:(id)a3 updateLastHitDate:(BOOL)a4 andSize:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  BOOL v12;
  _QWORD v14[5];
  NSObject *v15;
  id v16;
  __int128 *p_buf;
  unint64_t v18;
  BOOL v19;
  __int128 buf;
  uint64_t v21;
  char v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!self->_db)
  {
    -[QLThumbnailAdditionIndex open](self, "open");
    if (!self->_db)
    {
      _log_2();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[QLThumbnailAdditionIndex hasThumbnailForURL:updateLastHitDate:andSize:].cold.1();
      goto LABEL_9;
    }
  }
  _log_2();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1D54AE000, v9, OS_LOG_TYPE_INFO, "Looking for thumbnail for URL %@", (uint8_t *)&buf, 0xCu);
  }

  -[QLThumbnailAdditionIndex whereClauseForURL:](self, "whereClauseForURL:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v21 = 0x2020000000;
  v22 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__QLThumbnailAdditionIndex_hasThumbnailForURL_updateLastHitDate_andSize___block_invoke;
  v14[3] = &unk_1E99D38F0;
  v14[4] = self;
  v11 = v10;
  v15 = v11;
  p_buf = &buf;
  v18 = a5;
  v19 = a4;
  v16 = v8;
  -[QLThumbnailAdditionIndex dispatchSyncOnDatabaseQueue:](self, "dispatchSyncOnDatabaseQueue:", v14);
  v12 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
LABEL_10:

  return v12;
}

void __73__QLThumbnailAdditionIndex_hasThumbnailForURL_updateLastHitDate_andSize___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint64_t v13;
  char v14;

  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("SELECT COUNT(*) FROM thumbnails WHERE %@"), *(_QWORD *)(v2 + 8));

  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (int)objc_msgSend(v4, "intValue") > 0;
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (*(_BYTE *)(v5 + 24) && (*(_BYTE *)(a1 + 72) || *(_QWORD *)(a1 + 64)))
    {
      objc_msgSend(*(id *)(a1 + 32), "db");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "serialQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __73__QLThumbnailAdditionIndex_hasThumbnailForURL_updateLastHitDate_andSize___block_invoke_2;
      block[3] = &unk_1E99D38C8;
      v14 = *(_BYTE *)(a1 + 72);
      v8 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 64);
      block[4] = v8;
      v11 = *(id *)(a1 + 48);
      v12 = *(id *)(a1 + 40);
      dispatch_async(v7, block);

    }
    else
    {
      *(_BYTE *)(v5 + 24) = 0;
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    _log_2();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __73__QLThumbnailAdditionIndex_hasThumbnailForURL_updateLastHitDate_andSize___block_invoke_cold_1((id *)v2, v9);

  }
}

void __73__QLThumbnailAdditionIndex_hasThumbnailForURL_updateLastHitDate_andSize___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (*(_BYTE *)(a1 + 64))
  {
    v2 = (void *)MEMORY[0x1E0DE81D0];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "formatInjection:", CFSTR(", last_hit_date = %@"), v3);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", ", 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (*(_QWORD *)(a1 + 56))
    objc_msgSend(MEMORY[0x1E0DE81D0], "formatInjection:", CFSTR(", size=%llu"), *(_QWORD *)(a1 + 56));
  else
    objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", ", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "execute:", CFSTR("UPDATE thumbnails SET last_seen_path=%@ %@ %@ WHERE %@"), v6, v7, v4, *(_QWORD *)(a1 + 48));

}

- (BOOL)updateFileSize:(unint64_t)a3 ofThumbnailForURL:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  BOOL v10;
  _QWORD v12[5];
  NSObject *v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a4;
  if (!self->_db)
  {
    -[QLThumbnailAdditionIndex open](self, "open");
    if (!self->_db)
    {
      _log_2();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[QLThumbnailAdditionIndex hasThumbnailForURL:updateLastHitDate:andSize:].cold.1();
      goto LABEL_9;
    }
  }
  _log_2();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[QLThumbnailAdditionIndex updateFileSize:ofThumbnailForURL:].cold.2();

  -[QLThumbnailAdditionIndex whereClauseForURL:](self, "whereClauseForURL:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__QLThumbnailAdditionIndex_updateFileSize_ofThumbnailForURL___block_invoke;
  v12[3] = &unk_1E99D3918;
  v14 = &v16;
  v15 = a3;
  v12[4] = self;
  v9 = v8;
  v13 = v9;
  -[QLThumbnailAdditionIndex dispatchSyncOnDatabaseQueue:](self, "dispatchSyncOnDatabaseQueue:", v12);
  v10 = *((_BYTE *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
LABEL_10:

  return v10;
}

void __61__QLThumbnailAdditionIndex_updateFileSize_ofThumbnailForURL___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "execute:", CFSTR("UPDATE thumbnails SET size=%llu WHERE %@"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

- (BOOL)updateLastHitDate:(id)a3 ofThumbnailForURL:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  BOOL v10;
  _QWORD v12[5];
  id v13;
  NSObject *v14;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v17;
  char v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!self->_db)
  {
    -[QLThumbnailAdditionIndex open](self, "open");
    if (!self->_db)
    {
      _log_2();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[QLThumbnailAdditionIndex hasThumbnailForURL:updateLastHitDate:andSize:].cold.1();
      goto LABEL_9;
    }
  }
  _log_2();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1D54AE000, v8, OS_LOG_TYPE_INFO, "Updating file size for thumbnail for URL %@", (uint8_t *)&buf, 0xCu);
  }

  -[QLThumbnailAdditionIndex whereClauseForURL:](self, "whereClauseForURL:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v17 = 0x2020000000;
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__QLThumbnailAdditionIndex_updateLastHitDate_ofThumbnailForURL___block_invoke;
  v12[3] = &unk_1E99D3940;
  p_buf = &buf;
  v12[4] = self;
  v13 = v6;
  v9 = v9;
  v14 = v9;
  -[QLThumbnailAdditionIndex dispatchSyncOnDatabaseQueue:](self, "dispatchSyncOnDatabaseQueue:", v12);
  v10 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
LABEL_10:

  return v10;
}

void __64__QLThumbnailAdditionIndex_updateLastHitDate_ofThumbnailForURL___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v2, "execute:", CFSTR("UPDATE thumbnails SET last_hit_date=%@ WHERE %@"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "db");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v7, "changes");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = v3 == 1 && *(_BYTE *)(v4 + 24) != 0;
  *(_BYTE *)(v4 + 24) = v6;

}

- (BOOL)removeThumbnailForURL:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  BOOL v8;
  _QWORD v10[5];
  NSObject *v11;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_db)
  {
    -[QLThumbnailAdditionIndex open](self, "open");
    if (!self->_db)
    {
      _log_2();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[QLThumbnailAdditionIndex hasThumbnailForURL:updateLastHitDate:andSize:].cold.1();
      goto LABEL_9;
    }
  }
  _log_2();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1D54AE000, v5, OS_LOG_TYPE_INFO, "Removing thumbnail for URL %@", (uint8_t *)&buf, 0xCu);
  }

  -[QLThumbnailAdditionIndex whereClauseForURL:](self, "whereClauseForURL:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x2020000000;
  v15 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__QLThumbnailAdditionIndex_removeThumbnailForURL___block_invoke;
  v10[3] = &unk_1E99D3968;
  p_buf = &buf;
  v10[4] = self;
  v7 = v6;
  v11 = v7;
  -[QLThumbnailAdditionIndex dispatchSyncOnDatabaseQueue:](self, "dispatchSyncOnDatabaseQueue:", v10);
  v8 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
LABEL_10:

  return v8;
}

void __50__QLThumbnailAdditionIndex_removeThumbnailForURL___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "execute:", CFSTR("DELETE FROM thumbnails WHERE %@"), *(_QWORD *)(a1 + 40));

}

- (BOOL)addThumbnailForURL:(id)a3 lastHitDate:(id)a4 size:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  NSObject *v16;
  _QWORD v17[5];
  NSObject *v18;
  id v19;
  id v20;
  uint64_t *v21;
  unint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  int v28;
  stat buf;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (self->_db || (-[QLThumbnailAdditionIndex open](self, "open"), self->_db))
  {
    _log_2();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      buf.st_dev = 138412290;
      *(_QWORD *)&buf.st_mode = v8;
      _os_log_impl(&dword_1D54AE000, v10, OS_LOG_TYPE_INFO, "Adding thumbnail for URL %@", (uint8_t *)&buf, 0xCu);
    }

    v28 = 0;
    v30[0] = 0;
    v30[1] = 0;
    if ((objc_msgSend(v8, "qlt_getDocumentIdentifier:", &v28) & 1) != 0)
    {
      if ((objc_msgSend(v8, "qlt_getVolumeUUID:", v30) & 1) != 0)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v30, 16, 0);
        memset(&buf, 0, sizeof(buf));
        v12 = objc_retainAutorelease(v8);
        stat((const char *)objc_msgSend(v12, "fileSystemRepresentation"), &buf);
        v24 = 0;
        v25 = &v24;
        v26 = 0x2020000000;
        v27 = 0;
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __64__QLThumbnailAdditionIndex_addThumbnailForURL_lastHitDate_size___block_invoke;
        v17[3] = &unk_1E99D3990;
        v21 = &v24;
        v17[4] = self;
        v23 = v28;
        v13 = v11;
        v18 = v13;
        v19 = v9;
        v20 = v12;
        v22 = a5;
        -[QLThumbnailAdditionIndex dispatchSyncOnDatabaseQueue:](self, "dispatchSyncOnDatabaseQueue:", v17);
        v14 = *((_BYTE *)v25 + 24) != 0;

        _Block_object_dispose(&v24, 8);
LABEL_13:

        goto LABEL_14;
      }
      _log_2();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[QLThumbnailAdditionIndex addThumbnailForURL:lastHitDate:size:].cold.2();
    }
    else
    {
      _log_2();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[QLThumbnailAdditionIndex addThumbnailForURL:lastHitDate:size:].cold.3();
    }
    v14 = 0;
    goto LABEL_13;
  }
  _log_2();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[QLThumbnailAdditionIndex hasThumbnailForURL:updateLastHitDate:andSize:].cold.1();

  v14 = 0;
LABEL_14:

  return v14;
}

void __64__QLThumbnailAdditionIndex_addThumbnailForURL_lastHitDate_size___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(unsigned int *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 56), "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v6, "execute:", CFSTR("INSERT OR REPLACE INTO thumbnails(docid, vol_uuid, last_hit_date, last_seen_path, size) VALUES (%u, %@, %@, %@, %llu)"), v4, v2, v3, v5, *(_QWORD *)(a1 + 72));

}

- (BOOL)addThumbnailForURL:(id)a3 size:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a3;
  objc_msgSend(v6, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[QLThumbnailAdditionIndex addThumbnailForURL:lastHitDate:size:](self, "addThumbnailForURL:lastHitDate:size:", v7, v8, a4);

  return a4;
}

- (id)entriesEnumerator
{
  PQLConnection *db;
  void *v4;
  void *v5;
  NSObject *v7;

  db = self->_db;
  if (db || (-[QLThumbnailAdditionIndex open](self, "open"), (db = self->_db) != 0))
  {
    v4 = (void *)-[PQLConnection fetch:](db, "fetch:", CFSTR("SELECT docid, vol_uuid, last_hit_date, last_seen_path, size FROM thumbnails"));
    objc_msgSend(v4, "enumerateObjectsOfClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _log_2();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[QLThumbnailAdditionIndex hasThumbnailForURL:updateLastHitDate:andSize:].cold.1();

    v5 = 0;
  }
  return v5;
}

- (void)enumerateCacheEntriesWithHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__QLThumbnailAdditionIndex_enumerateCacheEntriesWithHandler___block_invoke;
  v6[3] = &unk_1E99D3010;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[QLThumbnailAdditionIndex dispatchSyncOnDatabaseQueue:](self, "dispatchSyncOnDatabaseQueue:", v6);

}

void __61__QLThumbnailAdditionIndex_enumerateCacheEntriesWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "entriesEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)allEntries
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v9[5];
  id v10;

  if (self->_db || (-[QLThumbnailAdditionIndex open](self, "open"), self->_db))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __38__QLThumbnailAdditionIndex_allEntries__block_invoke;
    v9[3] = &unk_1E99D2CD0;
    v9[4] = self;
    v4 = v3;
    v10 = v4;
    -[QLThumbnailAdditionIndex dispatchSyncOnDatabaseQueue:](self, "dispatchSyncOnDatabaseQueue:", v9);
    v5 = v10;
    v6 = v4;

    v7 = v6;
  }
  else
  {
    _log_2();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[QLThumbnailAdditionIndex hasThumbnailForURL:updateLastHitDate:andSize:].cold.1();
    v7 = 0;
  }

  return v7;
}

void __38__QLThumbnailAdditionIndex_allEntries__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "entriesEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)batchOfEntriesStartingAt:(unint64_t)a3 endingAt:(unint64_t *)a4
{
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  unint64_t v14;
  unint64_t *v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 50);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__QLThumbnailAdditionIndex_batchOfEntriesStartingAt_endingAt___block_invoke;
  v12[3] = &unk_1E99D39B8;
  v12[4] = self;
  v14 = a3;
  v8 = v7;
  v13 = v8;
  v15 = a4;
  -[QLThumbnailAdditionIndex dispatchSyncOnDatabaseQueue:](self, "dispatchSyncOnDatabaseQueue:", v12);
  v9 = v13;
  v10 = v8;

  return v10;
}

void __62__QLThumbnailAdditionIndex_batchOfEntriesStartingAt_endingAt___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT docid, vol_uuid, last_hit_date, last_seen_path, size FROM thumbnails WHERE rowid >= %lu ORDER BY rowid LIMIT %lu"), *(_QWORD *)(v2 + 16), 50);
  objc_msgSend(v4, "enumerateObjectsOfClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "db");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("SELECT MAX(rowid) FROM (SELECT rowid FROM thumbnails WHERE rowid    >= %lu ORDER BY rowid LIMIT %lu)"), *(_QWORD *)(a1 + 48), 50, (_QWORD)v16);

    if (v12 && (unint64_t)objc_msgSend(v12, "unsignedIntegerValue") >= *(_QWORD *)(a1 + 48))
    {
      v15 = objc_msgSend(v12, "unsignedIntegerValue");
    }
    else if (objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      _log_2();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __62__QLThumbnailAdditionIndex_batchOfEntriesStartingAt_endingAt___block_invoke_cold_1((id *)v2, v13);

      v14 = *(_QWORD *)(a1 + 48);
      v15 = v14 + objc_msgSend(*(id *)(a1 + 40), "count") - 1;
    }
    else
    {
      v15 = *(_QWORD *)(a1 + 48);
    }
    **(_QWORD **)(a1 + 56) = v15;

  }
}

- (void)removeAllAdditions
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[QLThumbnailAdditionIndex allEntries](self, "allEntries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v18;
    *(_QWORD *)&v4 = 138412546;
    v15 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1E0CD32B0];
        objc_msgSend(v8, "lastSeenURL", v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0;
        v11 = objc_msgSend(v9, "removeAdditionsOnURL:error:", v10, &v16);
        v12 = v16;

        if ((v11 & 1) == 0)
        {
          _log_2();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v8, "lastSeenURL");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v15;
            v22 = v14;
            v23 = 2112;
            v24 = v12;
            _os_log_error_impl(&dword_1D54AE000, v13, OS_LOG_TYPE_ERROR, "Could not remove addition on %@: %@", buf, 0x16u);

          }
        }

      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v5);
  }

}

- (int)deviceForHomeDirectory
{
  void *v2;
  id v3;
  int v4;
  dev_t st_dev;
  stat v7;

  NSHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v7, 0, sizeof(v7));
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = stat((const char *)objc_msgSend(v3, "fileSystemRepresentationWithPath:", v2), &v7);

  if (v4)
    st_dev = -1;
  else
    st_dev = v7.st_dev;

  return st_dev;
}

- (void)removeEntriesFromDatabase:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  PQLConnection *db;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        db = self->_db;
        v11 = objc_msgSend(v9, "documentID");
        objc_msgSend(v9, "vol_uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PQLConnection execute:](db, "execute:", CFSTR("DELETE FROM thumbnails WHERE docid = %llu AND vol_uuid = %@"), v11, v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)cleanUpBatchOfEntries:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  int32_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  __int128 v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  id v41;
  stat v42;
  fsid_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[4];
  _BYTE v49[18];
  __int16 v50;
  NSObject *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  uint8_t v56[4];
  uint64_t v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _log_2();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v59 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1D54AE000, v5, OS_LOG_TYPE_INFO, "[db maintenance] updating %llu entries", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v45;
    v12 = 0x1E0C99000uLL;
    *(_QWORD *)&v9 = 134219010;
    v34 = v9;
    v38 = v6;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v45 != v11)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v13);
        v15 = -[QLThumbnailAdditionIndex deviceForHomeDirectory](self, "deviceForHomeDirectory", v34);
        if ((v15 & 0x80000000) == 0)
        {
          v16 = v15;
          objc_msgSend(v14, "documentID");
          v17 = GSLibraryResolveDocumentId2();
          if (v17)
          {
            v43.val[0] = v16;
            v43.val[1] = 0;
            if (fsgetpath((char *)buf, 0x400uLL, &v43, v17) < 1)
              goto LABEL_33;
            objc_msgSend(*(id *)(v12 + 3736), "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", buf, 0, 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v18, "br_isInCloudDocsPrivateStorages"))
            {
              _log_2();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                -[QLThumbnailAdditionIndex cleanUpBatchOfEntries:].cold.1(v56, v14, &v57, v19);

              objc_msgSend(v6, "addObject:", v14);
              goto LABEL_32;
            }
            memset(&v42, 0, sizeof(v42));
            if (stat((const char *)buf, &v42))
            {
              _log_2();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                v22 = *__error();
                *(_DWORD *)v48 = 67109378;
                *(_DWORD *)v49 = v22;
                *(_WORD *)&v49[4] = 2080;
                *(_QWORD *)&v49[6] = buf;
                _os_log_error_impl(&dword_1D54AE000, v21, OS_LOG_TYPE_ERROR, "Hit error %{errno}d trying to stat %s", v48, 0x12u);
              }
              goto LABEL_31;
            }
            objc_msgSend(*(id *)(v12 + 3736), "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", buf, (v42.st_mode & 0xF000) == 0x4000, 0);
            v21 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "lastSeenURL");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSObject isEqual:](v21, "isEqual:", v23))
            {
              v24 = objc_msgSend(v14, "size");

              if (!v24)
              {
LABEL_27:
                v25 = objc_msgSend(MEMORY[0x1E0CD32B0], "sizeOfAdditionsPresentOnURL:", v21);
                _log_2();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                {
                  v35 = objc_msgSend(v14, "documentID");
                  objc_msgSend(v14, "lastSeenURL");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = objc_msgSend(v14, "size");
                  *(_DWORD *)v48 = v34;
                  *(_QWORD *)v49 = v35;
                  *(_WORD *)&v49[8] = 2112;
                  *(_QWORD *)&v49[10] = v36;
                  v50 = 2112;
                  v51 = v21;
                  v52 = 2048;
                  v53 = v28;
                  v54 = 2048;
                  v55 = v25;
                  _os_log_debug_impl(&dword_1D54AE000, v26, OS_LOG_TYPE_DEBUG, "Updating url of docid %llu from %@ to %@ and size from %lld to %lld", v48, 0x34u);

                }
                objc_msgSend(v14, "setLastSeenURL:", v21);
                objc_msgSend(v14, "setSize:", v25);
                objc_msgSend(v37, "addObject:", v14);
              }
              v6 = v38;
LABEL_31:

              v12 = 0x1E0C99000;
LABEL_32:

              goto LABEL_33;
            }

            goto LABEL_27;
          }
          if (*__error() == 2 || *__error() == 70)
          {
            _log_2();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v14, "lastSeenURL");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v59 = (uint64_t)v14;
              v60 = 2112;
              v61 = (uint64_t)v27;
              _os_log_error_impl(&dword_1D54AE000, v20, OS_LOG_TYPE_ERROR, "Should delete %@ (lastSeenURL: %@)", buf, 0x16u);

              v6 = v38;
            }

            objc_msgSend(v6, "addObject:", v14);
          }
        }
LABEL_33:
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
    }
    while (v10);
  }

  _log_2();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v30 = objc_msgSend(v6, "count");
    v31 = objc_msgSend(v37, "count");
    *(_DWORD *)buf = 134218240;
    v59 = v30;
    v60 = 2048;
    v61 = v31;
    _os_log_impl(&dword_1D54AE000, v29, OS_LOG_TYPE_INFO, "[db maintenance] %llu entries to delete, %llu entries to update", buf, 0x16u);
  }

  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __50__QLThumbnailAdditionIndex_cleanUpBatchOfEntries___block_invoke;
  v39[3] = &unk_1E99D2D70;
  v39[4] = self;
  v40 = v6;
  v41 = v37;
  v32 = v37;
  v33 = v6;
  -[QLThumbnailAdditionIndex dispatchSyncOnDatabaseQueue:](self, "dispatchSyncOnDatabaseQueue:", v39);

}

void __50__QLThumbnailAdditionIndex_cleanUpBatchOfEntries___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id obj;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "removeEntriesFromDatabase:", *(_QWORD *)(a1 + 40));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  obj = *(id *)(a1 + 48);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v12;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v5);
        objc_msgSend(*(id *)(a1 + 32), "db");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "lastSeenURL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "path");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "execute:", CFSTR("UPDATE THUMBNAILS SET last_seen_path=%@, size=%lld WHERE docid=%llu"), v9, objc_msgSend(v6, "size"), objc_msgSend(v6, "documentID"));

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }

}

- (void)performDatabaseMaintenance
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "Performing DB maintenance", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (id)databaseConnection
{
  return self->_db;
}

- (NSURL)databaseURL
{
  return self->_url;
}

- (void)hasThumbnailForURLWrapper:(id)a3 updateLastHitDate:(BOOL)a4 andSize:(unint64_t)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  void (**v11)(id, _BOOL8);
  void *v12;
  _BOOL8 v13;
  NSObject *v14;

  v8 = a4;
  v10 = a3;
  v11 = (void (**)(id, _BOOL8))a6;
  objc_msgSend(v10, "url");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "startAccessingSecurityScopedResource") & 1) != 0)
  {
    v13 = -[QLThumbnailAdditionIndex hasThumbnailForURL:updateLastHitDate:andSize:](self, "hasThumbnailForURL:updateLastHitDate:andSize:", v12, v8, a5);
    objc_msgSend(v12, "stopAccessingSecurityScopedResource");
    if (!v11)
      goto LABEL_8;
    goto LABEL_7;
  }
  _log_2();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[QLThumbnailAdditionIndex hasThumbnailForURLWrapper:updateLastHitDate:andSize:completion:].cold.1(v10, v14);

  v13 = -[QLThumbnailAdditionIndex hasThumbnailForURL:updateLastHitDate:andSize:](self, "hasThumbnailForURL:updateLastHitDate:andSize:", v12, v8, a5);
  if (v11)
LABEL_7:
    v11[2](v11, v13);
LABEL_8:

}

- (void)updateFileSize:(unint64_t)a3 ofThumbnailForURL:(id)a4 completion:(id)a5
{
  _BOOL8 v8;
  void *v9;
  id v10;

  v10 = a5;
  v8 = -[QLThumbnailAdditionIndex updateFileSize:ofThumbnailForURL:](self, "updateFileSize:ofThumbnailForURL:", a3, a4);
  v9 = v10;
  if (v10)
  {
    (*((void (**)(id, _BOOL8))v10 + 2))(v10, v8);
    v9 = v10;
  }

}

- (void)updateLastHitDate:(id)a3 ofThumbnailForURL:(id)a4 completion:(id)a5
{
  _BOOL8 v8;
  void *v9;
  id v10;

  v10 = a5;
  v8 = -[QLThumbnailAdditionIndex updateLastHitDate:ofThumbnailForURL:](self, "updateLastHitDate:ofThumbnailForURL:", a3, a4);
  v9 = v10;
  if (v10)
  {
    (*((void (**)(id, _BOOL8))v10 + 2))(v10, v8);
    v9 = v10;
  }

}

- (void)removeThumbnailForURL:(id)a3 completion:(id)a4
{
  _BOOL8 v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = -[QLThumbnailAdditionIndex removeThumbnailForURL:](self, "removeThumbnailForURL:", a3);
  v7 = v8;
  if (v8)
  {
    (*((void (**)(id, _BOOL8))v8 + 2))(v8, v6);
    v7 = v8;
  }

}

- (void)addThumbnailForURLWrapper:(id)a3 size:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _BOOL8);
  void *v10;
  int v11;
  NSObject *v12;
  _BOOL8 v13;

  v8 = a3;
  v9 = (void (**)(id, _BOOL8))a5;
  objc_msgSend(v8, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "startAccessingSecurityScopedResource");
  if ((v11 & 1) == 0)
  {
    _log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[QLThumbnailAdditionIndex hasThumbnailForURLWrapper:updateLastHitDate:andSize:completion:].cold.1(v8, v12);

  }
  v13 = -[QLThumbnailAdditionIndex addThumbnailForURL:size:](self, "addThumbnailForURL:size:", v10, a4);
  if (v9)
    v9[2](v9, v13);
  if (v11)
    objc_msgSend(v10, "stopAccessingSecurityScopedResource");

}

- (void)retrieveAllAdditions:(id)a3
{
  id v5;
  id v6;

  if (a3)
  {
    v5 = a3;
    -[QLThumbnailAdditionIndex allEntries](self, "allEntries");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a3 + 2))(v5, v6);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbWatcher, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (int64_t)purgeOnMountPoint:(id)a3 withUrgency:(int)a4 beforeDate:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  int64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v40;
  QLThumbnailAdditionIndex *v41;
  id v42;
  id v43;
  id obj;
  _QWORD v45[5];
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD block[5];
  id v53;
  id v54;
  id v55;
  int v56;
  int v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  id v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  _log_2();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D54AE000, v9, OS_LOG_TYPE_INFO, "#CacheDelete asked us to purge", buf, 2u);
  }

  if (self->_db || (-[QLThumbnailAdditionIndex open](self, "open"), self->_db))
  {
    sPurgeCancelled = 0;
    v57 = 0;
    v10 = 0;
    if (objc_msgSend(v7, "qlt_getDeviceIdentifier:", &v57) && (v57 & 0x80000000) == 0)
    {
      v43 = v7;
      -[QLThumbnailAdditionIndex volumeRestrictionForMountPoint:](self, "volumeRestrictionForMountPoint:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PQLConnection serialQueue](self->_db, "serialQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __82__QLThumbnailAdditionIndex_CacheDelete__purgeOnMountPoint_withUrgency_beforeDate___block_invoke;
      block[3] = &unk_1E99D3A08;
      v41 = self;
      v42 = v8;
      block[4] = self;
      v53 = v8;
      v14 = v11;
      v54 = v14;
      v56 = v57;
      v15 = v12;
      v55 = v15;
      dispatch_sync(v13, block);

      _log_2();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = objc_msgSend(v15, "count");
        *(_DWORD *)buf = 134217984;
        v59 = v17;
        _os_log_impl(&dword_1D54AE000, v16, OS_LOG_TYPE_INFO, "#CacheDelete removing %lu thumbnails", buf, 0xCu);
      }

      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      obj = v15;
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
      v40 = v14;
      if (v18)
      {
        v19 = v18;
        v10 = 0;
        v20 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v49 != v20)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            v23 = (void *)MEMORY[0x1D82731C0]();
            v24 = (void *)MEMORY[0x1E0CD32B0];
            objc_msgSend(v22, "lastSeenURL");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = 0;
            LODWORD(v24) = objc_msgSend(v24, "_removeAdditionsOnURLDirectly:error:", v25, &v47);
            v26 = v47;

            if ((_DWORD)v24)
            {
              v10 += objc_msgSend(v22, "size");
            }
            else
            {
              _log_2();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v22, "lastSeenURL");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v59 = (uint64_t)v28;
                v60 = 2112;
                v61 = v26;
                _os_log_error_impl(&dword_1D54AE000, v27, OS_LOG_TYPE_ERROR, "#CacheDelete Not removing addition on %@; encountered error %@",
                  buf,
                  0x16u);

              }
            }

            objc_autoreleasePoolPop(v23);
          }
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
        }
        while (v19);
      }
      else
      {
        v10 = 0;
      }

      -[PQLConnection serialQueue](v41->_db, "serialQueue");
      v29 = objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __82__QLThumbnailAdditionIndex_CacheDelete__purgeOnMountPoint_withUrgency_beforeDate___block_invoke_12;
      v45[3] = &unk_1E99D2CD0;
      v45[4] = v41;
      v46 = obj;
      v30 = obj;
      dispatch_sync(v29, v45);

      v8 = v42;
      v7 = v43;
    }
  }
  else
  {
    _log_2();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[QLThumbnailAdditionIndex(CacheDelete) purgeableSpaceOnMountPoint:withUrgency:beforeDate:].cold.1(v31, v32, v33, v34, v35, v36, v37, v38);

    v10 = 0;
  }

  return v10;
}

void __82__QLThumbnailAdditionIndex_CacheDelete__purgeOnMountPoint_withUrgency_beforeDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  fsid_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21[1024];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "fetch:", CFSTR("SELECT docid, vol_uuid, last_hit_date, last_seen_path, size FROM thumbnails WHERE last_hit_date < %@ %@"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = v3;
  objc_msgSend(v3, "enumerateObjectsOfClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v4);
      if ((sPurgeCancelled & 1) != 0)
        break;
      v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
      objc_msgSend(v9, "documentID");
      v10 = GSLibraryResolveDocumentId2();
      if (v10)
      {
        v16.val[0] = *(_DWORD *)(a1 + 64);
        v16.val[1] = 0;
        if (fsgetpath(v21, 0x400uLL, &v16, v10) >= 1)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v21, 0, 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setLastSeenURL:", v11);

          if (!objc_msgSend(v9, "size"))
          {
            v12 = objc_alloc(MEMORY[0x1E0CD32B0]);
            objc_msgSend(v9, "lastSeenURL");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (void *)objc_msgSend(v12, "initWithAdditionsPresentOnURL:error:", v13, 0);

            objc_msgSend(v9, "setSize:", objc_msgSend(v14, "additionSize"));
          }
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v9);
        }
      }
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

}

uint64_t __82__QLThumbnailAdditionIndex_CacheDelete__purgeOnMountPoint_withUrgency_beforeDate___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeEntriesFromDatabase:", *(_QWORD *)(a1 + 40));
}

- (void)cancelCacheDeletePurge
{
  sPurgeCancelled = 1;
}

- (void)open
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "Database is already open", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_closeDatabaseOnItsQueue:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1D54AE000, v0, v1, "Could not close database %@: %@");
  OUTLINED_FUNCTION_5();
}

void __42__QLThumbnailAdditionIndex_setUpDatabase___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D54AE000, v0, v1, "Someone removed our database under our feet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)upgradeDatabaseIfNeeded:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "lastError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v4;
  v7 = 2112;
  v8 = a1;
  _os_log_error_impl(&dword_1D54AE000, a2, OS_LOG_TYPE_ERROR, "Hit error %@, closing db %@", (uint8_t *)&v5, 0x16u);

  OUTLINED_FUNCTION_1_0();
}

- (void)upgradeDatabaseIfNeeded:error:.cold.2()
{
  __assert_rtn("-[QLThumbnailAdditionIndex upgradeDatabaseIfNeeded:error:]", "QLThumbnailAdditionIndex.m", 359, "(db.userVersion.unsignedIntValue >= QLThumbnailAdditionCacheVersionMax) || !result");
}

- (void)upgradeDatabaseIfNeeded:(int)a1 error:(NSObject *)a2 .cold.3(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109632;
  v2[1] = a1;
  v3 = 1024;
  v4 = 0;
  v5 = 1024;
  v6 = 3;
  _os_log_debug_impl(&dword_1D54AE000, a2, OS_LOG_TYPE_DEBUG, "no database migration (db at version %d, migration range [%d,%d[)", (uint8_t *)v2, 0x14u);
  OUTLINED_FUNCTION_5();
}

- (void)upgradeDatabaseIfNeeded:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "Upgrading database %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __58__QLThumbnailAdditionIndex_upgradeDatabaseIfNeeded_error___block_invoke_cold_1(int *a1, uint64_t a2, os_log_t log)
{
  int v3;
  int v4;
  uint64_t v5;
  _DWORD v6[2];
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *a1 + 1;
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 40);
  v6[0] = 67109634;
  v6[1] = v3;
  v7 = 1024;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  _os_log_error_impl(&dword_1D54AE000, log, OS_LOG_TYPE_ERROR, "can't migrate from version %d to %d: %@", (uint8_t *)v6, 0x18u);
  OUTLINED_FUNCTION_5();
}

- (void)logError:onDB:statement:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1D54AE000, v0, v1, "Sqlite failed on %@ with error [%@]");
  OUTLINED_FUNCTION_5();
}

- (void)makeDatabaseAtURL:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "Successfully opened database %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)makeDatabaseAtURL:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D54AE000, v0, v1, "Opening the database failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)makeDatabaseAtURL:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D54AE000, v0, v1, "Failed to create directory hierarchy", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)makeDatabaseAtURL:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "Opening thumbnail index database at %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)openDatabaseAtURL:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_2(&dword_1D54AE000, v0, v1, "Could not upgrade the Quick Look cloud thumbnails database: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)openDatabaseAtURL:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "Thumbnails database open and upgraded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)openDatabaseAtURL:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1D54AE000, v0, v1, "Failed to remove database at %@: %@");
  OUTLINED_FUNCTION_5();
}

- (void)openDatabaseAtURL:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D54AE000, v0, v1, "Corrupt database. Resetting the database and retrying.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)openDatabaseAtURL:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_2(&dword_1D54AE000, v0, v1, "Could not open the Quick Look cloud thumbnails database: %@", v2);
  OUTLINED_FUNCTION_5();
}

void __52__QLThumbnailAdditionIndex_openDatabaseAtURL_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_2(&dword_1D54AE000, v0, v1, "disk is full, restarting after throttle: %@", v2);
  OUTLINED_FUNCTION_5();
}

void __52__QLThumbnailAdditionIndex_openDatabaseAtURL_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_2(&dword_1D54AE000, v0, v1, "database is corrupt, removing it and restarting after throttle: %@", v2);
  OUTLINED_FUNCTION_5();
}

void __54__QLThumbnailAdditionIndex__neuterAutoRollbackHandler__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1D54AE000, v0, v1, "Ignoring error %@ during %@ closure");
  OUTLINED_FUNCTION_5();
}

- (void)_resetDatabaseOnItsQueue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "%@: re-opening database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_resetDatabaseOnItsQueue:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_2(&dword_1D54AE000, v0, v1, "%@: Resetting the Quick Look thumbnails database, old cloud thumbnails might not get reclaimed until they get overwritten", v2);
  OUTLINED_FUNCTION_5();
}

- (void)hasThumbnailForURL:updateLastHitDate:andSize:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D54AE000, v0, v1, "Could not open database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __73__QLThumbnailAdditionIndex_hasThumbnailForURL_updateLastHitDate_andSize___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_2(&dword_1D54AE000, a2, v5, "Error executing count statement: %@", v6);

  OUTLINED_FUNCTION_1_0();
}

- (void)updateFileSize:ofThumbnailForURL:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "Updating file size for thumbnail for URL %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)addThumbnailForURL:lastHitDate:size:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_2(&dword_1D54AE000, v0, v1, "No vol uuid for %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)addThumbnailForURL:lastHitDate:size:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_2(&dword_1D54AE000, v0, v1, "No DocID / vol uuid for %@", v2);
  OUTLINED_FUNCTION_5();
}

void __62__QLThumbnailAdditionIndex_batchOfEntriesStartingAt_endingAt___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_2(&dword_1D54AE000, a2, v5, "Could NOT fetch the maximum rowid for the current cleanup batch. %@", v6);

  OUTLINED_FUNCTION_1_0();
}

- (void)cleanUpBatchOfEntries:(_QWORD *)a3 .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "lastSeenURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1D54AE000, a4, OS_LOG_TYPE_DEBUG, "Removing thumbnail tracking for %@ because it's in the Cloud Docs private storage", a1, 0xCu);

}

- (void)hasThumbnailForURLWrapper:(void *)a1 updateLastHitDate:(NSObject *)a2 andSize:completion:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_2(&dword_1D54AE000, a2, v4, "Could not consume sandbox extension on %@", v5);

  OUTLINED_FUNCTION_3_2();
}

@end
