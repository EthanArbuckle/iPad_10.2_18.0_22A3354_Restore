@implementation QLCacheThread

void __66___QLCacheThread_Private___sendThumbnailData_forThumbnailRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;

  _log_3();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __66___QLCacheThread_Private___sendThumbnailData_forThumbnailRequest___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "modeLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  objc_msgSend(*(id *)(a1 + 32), "setHitCount:", objc_msgSend(*(id *)(a1 + 32), "hitCount") + 1);
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "currentMode") <= 3)
    objc_msgSend(*(id *)(a1 + 32), "_updateMode");
  _log_3();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __66___QLCacheThread_Private___sendThumbnailData_forThumbnailRequest___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "modeLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

}

void __71___QLCacheThread_Private___addThumbnailRequestIntoDiskCacheQueryQueue___block_invoke(id *a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  const char *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  QLDiskCacheQueryOperation *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "modeLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lock");

  if ((unint64_t)objc_msgSend(a1[4], "currentMode") >= 4)
  {
    _log_3();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(a1[5], "fileIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v6;
      v7 = "Refuse to query the disk cache: the cache is closed (%@)";
      goto LABEL_7;
    }
LABEL_8:

LABEL_9:
    objc_msgSend(a1[4], "_dispatchThumbnailRequestInServerThread:", a1[6]);
    goto LABEL_10;
  }
  v3 = objc_msgSend(a1[4], "lowDiskSpace");
  _log_3();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      objc_msgSend(a1[5], "fileIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v6;
      v7 = "Refuse to query the disk cache: we are in low disk space mode (%@)";
LABEL_7:
      _os_log_impl(&dword_1D54AE000, v4, OS_LOG_TYPE_INFO, v7, buf, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v5)
  {
    v9 = a1[5];
    objc_msgSend(v9, "fileIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "size");
    v12 = v11;
    objc_msgSend(a1[5], "size");
    v14 = v13;
    v15 = &stru_1E99D4E38;
    if (objc_msgSend(a1[5], "iconMode"))
      v16 = CFSTR("Icon mode");
    else
      v16 = &stru_1E99D4E38;
    if (objc_msgSend(a1[6], "needsLowQualityThumbnailGeneration"))
      v17 = CFSTR("(low quality)");
    else
      v17 = &stru_1E99D4E38;
    v18 = objc_msgSend(a1[6], "badgeType");
    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(a1[6], "badgeType"));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138413826;
    v31 = v9;
    v32 = 2112;
    v33 = v10;
    v34 = 2048;
    v35 = v12;
    v36 = 2048;
    v37 = v14;
    v38 = 2112;
    v39 = v16;
    v40 = 2112;
    v41 = v17;
    v42 = 2112;
    v43 = v15;
    _os_log_impl(&dword_1D54AE000, v4, OS_LOG_TYPE_INFO, "Trying disk cache for %@ fi: %@ @ %.1fx%.1f %@ %@ %@", buf, 0x48u);
    if (v18)

  }
  objc_msgSend(a1[4], "currentDiskCacheQueryOperation");
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19
    || (v20 = (void *)v19,
        objc_msgSend(a1[4], "currentDiskCacheQueryOperation"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend(v21, "appendThumbnailRequest:", a1[6]),
        v21,
        v20,
        (v22 & 1) == 0))
  {
    v23 = -[QLDiskCacheQueryOperation initWithCacheThread:]([QLDiskCacheQueryOperation alloc], "initWithCacheThread:", a1[4]);
    objc_msgSend(a1[4], "setCurrentDiskCacheQueryOperation:", v23);

    objc_msgSend(a1[4], "currentDiskCacheQueryOperation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "appendThumbnailRequest:", a1[6]);

    if (!v25)
    {
      _log_3();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(a1[5], "fileIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v31 = v29;
        _os_log_impl(&dword_1D54AE000, v28, OS_LOG_TYPE_INFO, "Could not append thumbnail request to QLCacheThread. (%@)", buf, 0xCu);

      }
      objc_msgSend(a1[4], "setCurrentDiskCacheQueryOperation:", 0);
      goto LABEL_9;
    }
    objc_msgSend(a1[4], "diskCacheQueryOperationQueue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "currentDiskCacheQueryOperation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addOperation:", v27);

  }
LABEL_10:
  if ((unint64_t)objc_msgSend(a1[4], "currentMode") <= 3)
    objc_msgSend(a1[4], "_updateMode");
  objc_msgSend(a1[4], "modeLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

uint64_t __47___QLCacheThread_itemIsMissingRemoteThumbnail___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 40), "itemIsMissingRemoteThumbnail:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

void __47___QLCacheThread_Private___cleanUpDatabaseDone__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  __CFRunLoop *Current;
  NSObject *v10;
  void *v11;

  _log_3();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __47___QLCacheThread_Private___cleanUpDatabaseDone__block_invoke_cold_5();

  objc_msgSend(*(id *)(a1 + 32), "modeLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = objc_msgSend(*(id *)(a1 + 32), "currentMode");
  v5 = *(void **)(a1 + 32);
  if (v4 != 2)
  {
    if (!objc_msgSend(v5, "waitingForCleanup"))
      goto LABEL_13;
    _log_3();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      goto LABEL_12;
    goto LABEL_11;
  }
  if (!objc_msgSend(v5, "thumbnailInMemoryToSaveCount") && !objc_msgSend(*(id *)(a1 + 32), "hitToSaveCount"))
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "waitingForCleanup"))
      goto LABEL_13;
    _log_3();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
LABEL_12:

      Current = CFRunLoopGetCurrent();
      CFRunLoopStop(Current);
      goto LABEL_13;
    }
LABEL_11:
    __47___QLCacheThread_Private___cleanUpDatabaseDone__block_invoke_cold_2();
    goto LABEL_12;
  }
  _log_3();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __47___QLCacheThread_Private___cleanUpDatabaseDone__block_invoke_cold_3();

  objc_msgSend(*(id *)(a1 + 32), "cleanUpDatabaseThread");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startCleanUp");

LABEL_13:
  _log_3();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __47___QLCacheThread_Private___cleanUpDatabaseDone__block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "modeLock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unlock");

}

uint64_t __48___QLCacheThread__shouldQuitWorkingModeForMode___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __33___QLCacheThread_serverIsWorking__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;

  _log_3();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __33___QLCacheThread_serverIsWorking__block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "modeLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  objc_msgSend(*(id *)(a1 + 32), "setServerThreadIsIdle:", 0);
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "currentMode") <= 3)
    objc_msgSend(*(id *)(a1 + 32), "_updateMode");
  _log_3();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __33___QLCacheThread_serverIsWorking__block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "modeLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

}

void __30___QLCacheThread_serverIsIdle__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;

  _log_3();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __30___QLCacheThread_serverIsIdle__block_invoke_cold_3();

  objc_msgSend(*(id *)(a1 + 32), "_drainPendingBlocksNow");
  _log_3();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __30___QLCacheThread_serverIsIdle__block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "modeLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lock");

  objc_msgSend(*(id *)(a1 + 32), "setServerThreadIsIdle:", 1);
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "currentMode") <= 3)
    objc_msgSend(*(id *)(a1 + 32), "_updateMode");
  _log_3();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __30___QLCacheThread_serverIsIdle__block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "modeLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

void __67___QLCacheThread_Private___dispatchThumbnailRequestInServerThread___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  _log_3();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "request");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "size");
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "size");
    v18 = 138412802;
    v19 = v4;
    v20 = 2048;
    v21 = v7;
    v22 = 2048;
    v23 = v9;
    _os_log_impl(&dword_1D54AE000, v2, OS_LOG_TYPE_INFO, "No thumbnail found in cache for %@ @ %.1f %.1f", (uint8_t *)&v18, 0x20u);

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldGenerateLowQualityThumbnailOnCacheMiss") & 1) == 0
    && objc_msgSend(*(id *)(a1 + 32), "needsLowQualityThumbnailGeneration"))
  {
    v10 = (void *)MEMORY[0x1E0CD32D0];
    objc_msgSend(*(id *)(a1 + 32), "request");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithCode:request:additionalUserInfo:", 2, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 312));
    objc_msgSend(WeakRetained, "didNotFindLowQualityEntryInCachedForThumbnailRequest:error:", *(_QWORD *)(a1 + 32), v12);

  }
  _log_3();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    __67___QLCacheThread_Private___dispatchThumbnailRequestInServerThread___block_invoke_cold_1();

  v15 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 312));
  objc_msgSend(v15, "queueThumbnailRequest:tryCache:tryAdditionsFirst:", *(_QWORD *)(a1 + 32), 0, 1);

  objc_msgSend(*(id *)(a1 + 40), "modeLock");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lock");

  objc_msgSend(*(id *)(a1 + 40), "setMissedCount:", objc_msgSend(*(id *)(a1 + 40), "missedCount") + 1);
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "currentMode") <= 3)
    objc_msgSend(*(id *)(a1 + 40), "_updateMode");
  objc_msgSend(*(id *)(a1 + 40), "modeLock");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "unlock");

}

void __81___QLCacheThread_CacheDelete__purgeableSpaceOnMountPoint_withUrgency_beforeDate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "diskCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "sizeSumOfThumbnailsOlderThanDate:", *(_QWORD *)(a1 + 40));

}

BOOL __72___QLCacheThread_CacheDelete__purgeOnMountPoint_withUrgency_beforeDate___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "diskCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "removeThumbnailsOlderThanDate:", *(_QWORD *)(a1 + 40));

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) > 0;
}

uint64_t __44___QLCacheThread_databaseCorruptionDetected__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

uint64_t __37___QLCacheThread__drainPendingBlocks__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v2 = 0;
  v3 = 0;
  do
  {
    v4 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 8 * v2 + 136));
    if (!v4)
      break;
    v5 = v4;
    v3 |= (*((uint64_t (**)(void))v4 + 2))();

    ++v2;
  }
  while (v2 != 10);
  _log_3();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __37___QLCacheThread__drainPendingBlocks__block_invoke_cold_1();

  return v3 & 1;
}

uint64_t __37___QLCacheThread__scheduleBlockDrain__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduledDrainPendingBlocks");
}

uint64_t __33___QLCacheThread_enqueueWriting___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v8;
  uint64_t v9;
  void *v10;

  v2 = 0;
  while (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136 + 8 * v2))
  {
    if (++v2 == 10)
      goto LABEL_9;
  }
  if (v2 != 9)
  {
LABEL_9:
    v8 = _Block_copy(*(const void **)(a1 + 40));
    v9 = *(_QWORD *)(a1 + 32) + 8 * v2;
    v10 = *(void **)(v9 + 136);
    *(_QWORD *)(v9 + 136) = v8;

    return objc_msgSend(*(id *)(a1 + 32), "_scheduleBlockDrain");
  }
  v3 = _Block_copy(*(const void **)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 208);
  *(_QWORD *)(v4 + 208) = v3;

  _log_3();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __33___QLCacheThread_enqueueWriting___block_invoke_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "_drainPendingBlocksNow");
}

void __62___QLCacheThread__registerMachPortForLowDiskSpaceNotification__block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_queue_t v3;
  NSObject *v4;
  dispatch_source_t v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD handler[5];

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("low disk space source queue", v2);
  objc_msgSend(*(id *)(a1 + 32), "setLowDiskSpaceSourceQueue:", v3);

  objc_msgSend(*(id *)(a1 + 32), "lowDiskSpaceSourceQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_source_create(MEMORY[0x1E0C80DD8], 0, 0x304uLL, v4);
  objc_msgSend(*(id *)(a1 + 32), "setLowDiskSpaceSource:", v5);

  objc_msgSend(*(id *)(a1 + 32), "lowDiskSpaceSource");
  v6 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __62___QLCacheThread__registerMachPortForLowDiskSpaceNotification__block_invoke_2;
  handler[3] = &unk_1E99D2B88;
  handler[4] = *(_QWORD *)(a1 + 32);
  dispatch_source_set_event_handler(v6, handler);

  objc_msgSend(*(id *)(a1 + 32), "lowDiskSpaceSource");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v7);

  objc_msgSend(*(id *)(a1 + 32), "_updateLowDisk");
}

uint64_t __62___QLCacheThread__registerMachPortForLowDiskSpaceNotification__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLowDisk");
}

uint64_t __64___QLCacheThread__unregisterMachPortForLowDiskSpaceNotification__block_invoke(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "lowDiskSpaceSource");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v2);

  objc_msgSend(*(id *)(a1 + 32), "setLowDiskSpaceSource:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setLowDiskSpaceSourceQueue:", 0);
}

uint64_t __23___QLCacheThread_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateMode");
}

uint64_t __27___QLCacheThread_openCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateMode");
}

uint64_t __37___QLCacheThread_forceCommitAndClose__block_invoke(uint64_t a1)
{
  NSObject *v2;

  _log_3();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __37___QLCacheThread_forceCommitAndClose__block_invoke_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "_drainPendingBlocksNow");
}

uint64_t __47___QLCacheThread__willStartClosedModeFromMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_destroyDrainTimer");
}

void __27___QLCacheThread_cacheInfo__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "diskCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedLongLong:", objc_msgSend(v7, "size"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("size"));

  v9 = *(void **)(a1 + 32);
  v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "diskCache");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fragmentation");
  objc_msgSend(v11, "numberWithFloat:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("fragmentation"));

}

void __35___QLCacheThread_allThumbnailsInfo__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "diskCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumeratorForAllFilesUbiquitousFiles:withExtraInfo:", 0, 1);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "diskCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enumeratorForAllFilesUbiquitousFiles:withExtraInfo:", 1, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "_allThumbnailsEnumerateWithEnumerator:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v9);

  v10 = *(void **)(a1 + 32);
  v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(v10, "_allThumbnailsEnumerateWithEnumerator:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v12);

}

void __49___QLCacheThread_allThumbnailsForFileIdentifier___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "diskCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = a1;
  objc_msgSend(v5, "enumeratorForAllThumbnailsWithFileIdentifier:", *(_QWORD *)(a1 + 40));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "nextThumbnailData");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    do
    {
      v32 = objc_alloc(MEMORY[0x1E0C99E08]);
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "size");
      objc_msgSend(v8, "numberWithFloat:");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "iconMode"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "iconVariant"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "interpolationQuality"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "badgeType"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "iconMode");
      v11 = CFSTR("Thumbnail");
      if (v10)
        v11 = CFSTR("Icon");
      v28 = v11;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "hitCount"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastHitDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bitmapFormat");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "bitmapData");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v27, "length"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "metadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "length"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v32, "initWithObjectsAndKeys:", v31, CFSTR("size"), v30, CFSTR("iconmode"), v33, CFSTR("iconvariant"), v9, CFSTR("interpolationquality"), v29, CFSTR("badgeType"), v28, CFSTR("humaniconmode"), v26, CFSTR("hitcount"), v12, CFSTR("lasthitdate"), v13,
                      CFSTR("bitmapFormat"),
                      v15,
                      CFSTR("bitmaplength"),
                      v18,
                      CFSTR("plistbufferlength"),
                      0);

      objc_msgSend(v7, "bitmapData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "length");

      if (v21)
      {
        objc_msgSend(v7, "bitmapData");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKey:", v22, CFSTR("image"));

      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v24 + 48) + 8) + 40), "addObject:", v19);

      objc_msgSend(v25, "nextThumbnailData");
      v23 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v23;
    }
    while (v23);
  }

}

uint64_t __60___QLCacheThread_setLastHitDateOfAllCachedThumbnailsToDate___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "diskCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "setLastHitDateOfAllCachedThumbnailsToDate:", *(_QWORD *)(a1 + 40));

  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

uint64_t __53___QLCacheThread_noteRemoteThumbnailMissingForItems___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "noteRemoteThumbnailMissingForItems:", *(_QWORD *)(a1 + 40));
  return 1;
}

uint64_t __53___QLCacheThread_noteRemoteThumbnailPresentForItems___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "noteRemoteThumbnailPresentForItems:", *(_QWORD *)(a1 + 40));
  return 1;
}

void __67___QLCacheThread_itemsAfterFilteringOutItemsWithMissingThumbnails___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 40), "itemsAfterFilteringOutItemsWithMissingThumbnails:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __54___QLCacheThread_Private___thumbnailHasBeenCancelled___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "modeLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lock");

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "currentMode") <= 3)
    objc_msgSend(*(id *)(a1 + 32), "_updateMode");
  objc_msgSend(*(id *)(a1 + 32), "modeLock");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unlock");

}

void __37___QLCacheThread__drainPendingBlocks__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "Coalesced %ld cache writing jobs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __33___QLCacheThread_enqueueWriting___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "Pending write blocks list is full. Draining", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __37___QLCacheThread_forceCommitAndClose__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "Draining pending blocks before commiting and closing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __30___QLCacheThread_serverIsIdle__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "-serverIsIdle relinquishing _modeLock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __30___QLCacheThread_serverIsIdle__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "-serverIsIdle taking _modeLock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __30___QLCacheThread_serverIsIdle__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "Draining pending blocks before commiting during server idling", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __33___QLCacheThread_serverIsWorking__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "-serverIsWorking relinquishing _modeLock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __33___QLCacheThread_serverIsWorking__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "-serverIsWorking taking _modeLock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __67___QLCacheThread_Private___dispatchThumbnailRequestInServerThread___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "Cache miss for %@, reenqueuing request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __66___QLCacheThread_Private___sendThumbnailData_forThumbnailRequest___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "-_sendThumbnailData relinquishing _modeLock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66___QLCacheThread_Private___sendThumbnailData_forThumbnailRequest___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "-_sendThumbnailData taking _modeLock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47___QLCacheThread_Private___cleanUpDatabaseDone__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "-_cleanUpDatabaseDone relinquishing _modeLock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47___QLCacheThread_Private___cleanUpDatabaseDone__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "Signaling database clean-up done", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47___QLCacheThread_Private___cleanUpDatabaseDone__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "Relaunching dabase clean-up as we have pending saves", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47___QLCacheThread_Private___cleanUpDatabaseDone__block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "-_cleanUpDatabaseDone taking _modeLock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
