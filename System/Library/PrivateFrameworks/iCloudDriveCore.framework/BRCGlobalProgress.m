@implementation BRCGlobalProgress

- (BRCGlobalProgress)initWithSession:(id)a3
{
  id v4;
  BRCGlobalProgress *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  br_pacer *updatePacer;
  id v13;
  id location;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BRCGlobalProgress;
  v5 = -[BRCGlobalProgress init](&v15, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v6, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.bird.global-progress", v7);

    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    br_pacer_create();
    v10 = objc_claimAutoreleasedReturnValue();
    updatePacer = v5->_updatePacer;
    v5->_updatePacer = (br_pacer *)v10;

    objc_initWeak(&location, v5);
    objc_copyWeak(&v13, &location);
    br_pacer_set_event_handler();
    objc_storeWeak((id *)&v5->_session, v4);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __37__BRCGlobalProgress_initWithSession___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  int v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WeakRetained[8])
    {
      v4 = WeakRetained;
      objc_msgSend(WeakRetained[9], "updateUnitCount");
      objc_msgSend(v4[10], "updateUnitCount");
      objc_msgSend(v4, "_updateGlobalProgress");
      objc_msgSend(v4[9], "progress");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "isFinished");

      WeakRetained = v4;
      if (v3)
      {
        objc_msgSend(v4, "_destroyUploadWithReason:", 0);
        WeakRetained = v4;
      }
    }
  }

}

- (void)dealloc
{
  NSObject *operationTimer;
  unsigned int v4;
  OS_dispatch_source *v5;
  br_pacer *updatePacer;
  objc_super v7;

  operationTimer = self->_operationTimer;
  if (operationTimer)
  {
    dispatch_source_cancel(operationTimer);
    if (self->_operationTimerSuspendCount)
    {
      do
      {
        dispatch_resume((dispatch_object_t)self->_operationTimer);
        v4 = self->_operationTimerSuspendCount - 1;
        self->_operationTimerSuspendCount = v4;
      }
      while (v4);
    }
    v5 = self->_operationTimer;
    self->_operationTimer = 0;

  }
  br_pacer_cancel();
  updatePacer = self->_updatePacer;
  self->_updatePacer = 0;

  v7.receiver = self;
  v7.super_class = (Class)BRCGlobalProgress;
  -[BRCGlobalProgress dealloc](&v7, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  char v19;
  OS_dispatch_queue *queue;
  NSObject *v21;
  NSObject *v22;
  objc_super v23;
  _QWORD v24[4];
  NSObject *v25;
  BRCGlobalProgress *v26;
  id v27;
  id v28;
  id v29;
  char v30;
  uint8_t buf[4];
  NSObject *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v11;
    objc_msgSend(v13, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("_BRCObjectIDKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE17628], "fileObjectIDWithString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v13, "userInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("_BRCProgressGroupKey"));
      v18 = objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = objc_msgSend(v13, "isFinished");
        queue = self->_queue;
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __68__BRCGlobalProgress_observeValueForKeyPath_ofObject_change_context___block_invoke;
        v24[3] = &unk_24FE45B68;
        v18 = v18;
        v25 = v18;
        v26 = self;
        v27 = v16;
        v28 = v12;
        v29 = v13;
        v30 = v19;
        dispatch_async_with_logs_6(queue, v24);

        v21 = v25;
      }
      else
      {
        brc_bread_crumbs();
        v21 = objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v21;
          _os_log_impl(&dword_230455000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] Progress: observing a progress that doesn't have a progress group%@", buf, 0xCu);
        }

      }
    }
    else
    {
      brc_bread_crumbs();
      v18 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v18;
        _os_log_impl(&dword_230455000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] Progress: observing a progress that doesn't have an objectID%@", buf, 0xCu);
      }
    }

  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)BRCGlobalProgress;
    -[BRCGlobalProgress observeValueForKeyPath:ofObject:change:context:](&v23, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

void __68__BRCGlobalProgress_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "shortValue");
  v3 = 80;
  if (v2 == 1)
    v3 = 72;
  v4 = *(id *)(*(_QWORD *)(a1 + 40) + v3);
  objc_msgSend(v4, "childProgresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v34 = CFSTR("download");
      v35 = *(_QWORD *)(a1 + 48);
      v39 = 138412802;
      if (v2 == 1)
        v34 = CFSTR("upload");
      v40 = (uint64_t)v34;
      v41 = 2112;
      v42 = v35;
      v43 = 2112;
      v44 = (uint64_t)v19;
      _os_log_debug_impl(&dword_230455000, v20, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: ignore delta update because %@ for doc with objectID %@ isn't tracked anymore%@", (uint8_t *)&v39, 0x20u);
    }

    goto LABEL_34;
  }
  objc_msgSend(v4, "previousUnitCounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedLongLongValue");

  v10 = *MEMORY[0x24BDD0E70];
  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedLongLongValue");

  if (v9 > v12)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v36 = *(_QWORD *)(a1 + 48);
      v39 = 138413058;
      v40 = v36;
      v41 = 2048;
      v42 = v9;
      v43 = 2048;
      v44 = v12;
      v45 = 2112;
      v46 = v13;
      _os_log_debug_impl(&dword_230455000, v14, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: negative delta update for doc with objectID %@; [%lld -> %lld]%@",
        (uint8_t *)&v39,
        0x2Au);
    }

    v9 = 0;
  }
  v15 = *(_QWORD *)(a1 + 40);
  if (v2 == 1)
  {
    objc_msgSend(*(id *)(v15 + 72), "versionSizes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = _computeDelta(v9, v12, objc_msgSend(v17, "longLongValue"), objc_msgSend(*(id *)(a1 + 64), "totalUnitCount"), *(unsigned __int8 *)(a1 + 72));

    goto LABEL_27;
  }
  objc_msgSend(*(id *)(v15 + 80), "resumeUnitCounts");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (v12 >= objc_msgSend(v16, "longLongValue"))
    {
      if (v12 != objc_msgSend(v16, "longLongValue"))
      {
        v26 = objc_msgSend(v16, "longLongValue");
        if (v9 <= v26)
          v9 = v26;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "resumeUnitCounts");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "removeObjectForKey:", *(_QWORD *)(a1 + 48));
        goto LABEL_25;
      }
      brc_bread_crumbs();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        v38 = *(void **)(a1 + 48);
        v39 = 134219010;
        v40 = v9;
        v41 = 2048;
        v42 = v12;
        v43 = 2112;
        v44 = (uint64_t)v16;
        v45 = 2112;
        v46 = v38;
        v47 = 2112;
        v48 = v24;
        _os_log_debug_impl(&dword_230455000, v25, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: ignore delta update ([%lld -> %lld] == %@) for doc with objectID %@ because it was counted as part of the resume operation%@", (uint8_t *)&v39, 0x34u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "resumeUnitCounts");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "removeObjectForKey:", *(_QWORD *)(a1 + 48));
    }
    else
    {
      brc_bread_crumbs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v37 = *(void **)(a1 + 48);
        v39 = 134219010;
        v40 = v9;
        v41 = 2048;
        v42 = v12;
        v43 = 2112;
        v44 = (uint64_t)v16;
        v45 = 2112;
        v46 = v37;
        v47 = 2112;
        v48 = v22;
        _os_log_debug_impl(&dword_230455000, v23, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: ignore delta update ([%lld -> %lld] < %@) for doc with objectID %@ because it was counted as part of the resume operation%@", (uint8_t *)&v39, 0x34u);
      }

    }
    v12 = 0;
    v9 = 0;
LABEL_25:

  }
  v18 = v12 - v9;
LABEL_27:

  if (v18 >= 1)
  {
    objc_msgSend(v4, "setSumOfCompletedUnitCountDelta:", objc_msgSend(v4, "sumOfCompletedUnitCountDelta") + v18);
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previousUnitCounts");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, *(_QWORD *)(a1 + 48));

    br_pacer_signal();
  }
  if (*(_BYTE *)(a1 + 72))
  {
    brc_bread_crumbs();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "intValue");
      v32 = BRCPrettyPrintEnum();
      v33 = *(_QWORD *)(a1 + 48);
      v39 = 136315650;
      v40 = v32;
      v41 = 2112;
      v42 = v33;
      v43 = 2112;
      v44 = (uint64_t)v29;
      _os_log_debug_impl(&dword_230455000, v30, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: %s finished for doc with objectID %@%@", (uint8_t *)&v39, 0x20u);
    }

    if (v2 != 1)
    {
      objc_msgSend(*(id *)(a1 + 40), "_stopObservingProgress:", *(_QWORD *)(a1 + 64));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "childProgresses");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "removeObjectForKey:", *(_QWORD *)(a1 + 48));

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "versionSizes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeObjectForKey:", *(_QWORD *)(a1 + 48));
LABEL_34:

    }
  }

}

- (void)networkReachabilityChanged:(BOOL)a3
{
  OS_dispatch_queue *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__BRCGlobalProgress_networkReachabilityChanged___block_invoke;
  v4[3] = &unk_24FE41910;
  v4[4] = self;
  v5 = a3;
  dispatch_async_with_logs_6(queue, v4);
}

uint64_t __48__BRCGlobalProgress_networkReachabilityChanged___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  double v6;
  NSObject *v7;
  dispatch_time_t v8;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 61) != v2)
  {
    v3 = result;
    *(_BYTE *)(v1 + 61) = v2;
    *(_BYTE *)(*(_QWORD *)(result + 32) + 60) = 0;
    v4 = *(_QWORD *)(result + 32);
    if (*(_QWORD *)(v4 + 64))
    {
      if (*(_BYTE *)(v4 + 61))
      {
        +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "intervalToWaitBeforeShowingAdditionalDescription");
        v7 = *(NSObject **)(*(_QWORD *)(v3 + 32) + 48);
        v8 = dispatch_time(0, 1000000000 * (uint64_t)v6);
        dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);

      }
      return br_pacer_signal();
    }
  }
  return result;
}

- (void)didUpdateClientZone:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if ((objc_msgSend(v3, "isSharedZone") & 1) == 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v3, "asPrivateClientZone", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appLibraries");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_msgSend(v10, "containerMetadata");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isDocumentScopePublic"))
            objc_msgSend(v10, "isiCloudDesktopAppLibrary");

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (void)_resumeProgressForZone:(id)a3 startingRowID:(unint64_t)a4 whenDone:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  dispatch_block_t v15;
  brc_task_tracker *resumeTracker;
  id WeakRetained;
  void *v18;
  _QWORD block[4];
  id v20;
  BRCGlobalProgress *v21;
  id v22;
  unint64_t v23;
  uint64_t v24;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "mangledID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "resumeProgressBatchSize");

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__BRCGlobalProgress__resumeProgressForZone_startingRowID_whenDone___block_invoke;
  block[3] = &unk_24FE457B8;
  v23 = a4;
  v24 = v12;
  v20 = v8;
  v21 = self;
  v22 = v9;
  v13 = v9;
  v14 = v8;
  v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, block);
  resumeTracker = self->_resumeTracker;
  WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  objc_msgSend(WeakRetained, "clientTruthWorkloop");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  brc_task_tracker_async_with_logs(resumeTracker, v18, v15, 0);

}

uint64_t __67__BRCGlobalProgress__resumeProgressForZone_startingRowID_whenDone___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "documentsNotIdleEnumeratorWithStartingRowID:batchSize:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v19;
    v16 = v1;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v19 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v7 = (void *)MEMORY[0x2348B9F14]();
        v8 = objc_msgSend(v6, "dbRowID");
        if (v6 && objc_msgSend(v6, "isVisibleIniCloudDrive"))
        {
          if (objc_msgSend(v6, "isDead"))
          {
            objc_msgSend(v6, "st");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v9, "state");
            objc_msgSend(v6, "orig");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "st");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v10 == objc_msgSend(v12, "state"))
            {

              v1 = v16;
            }
            else
            {
              objc_msgSend(v6, "orig");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v13, "syncUpState");

              v1 = v16;
              if (v15)
                objc_msgSend(*(id *)(a1 + 40), "didDeleteDocument:", v6);
            }
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 40), "_updateDocument:", v6);
          }
        }
        objc_autoreleasePoolPop(v7);
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v3);

    if (v8 != -1)
      return objc_msgSend(*(id *)(a1 + 40), "_resumeProgressForZone:startingRowID:whenDone:", *(_QWORD *)(a1 + 32), v8, *(_QWORD *)(a1 + 48));
  }
  else
  {

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)resumeProgressForZones:(id)a3
{
  id v4;
  NSObject *queue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __44__BRCGlobalProgress_resumeProgressForZones___block_invoke;
    v6[3] = &unk_24FE3FA40;
    v6[4] = self;
    v7 = v4;
    dispatch_async(queue, v6);

  }
}

void __44__BRCGlobalProgress_resumeProgressForZones___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  _QWORD block[5];
  _QWORD v33[4];
  NSObject *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    brc_bread_crumbs();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      __44__BRCGlobalProgress_resumeProgressForZones___block_invoke_cold_2();

  }
  brc_task_tracker_create("resume-progress-tracker");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  v5 = dispatch_group_create();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v31 = a1;
  v6 = *(id *)(a1 + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v36;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x2348B9F14]();
        if ((objc_msgSend(v11, "isSharedZone") & 1) != 0)
        {
LABEL_8:
          brc_bread_crumbs();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          brc_notifications_log();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v11, "zoneName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v40 = v22;
            v41 = 2112;
            v42 = v13;
            _os_log_debug_impl(&dword_230455000, v14, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: resuming global progress for '%@'%@", buf, 0x16u);

          }
          dispatch_group_enter(v5);
          v15 = *(void **)(v31 + 32);
          v33[0] = MEMORY[0x24BDAC760];
          v33[1] = 3221225472;
          v33[2] = __44__BRCGlobalProgress_resumeProgressForZones___block_invoke_119;
          v33[3] = &unk_24FE3FA18;
          v34 = v5;
          objc_msgSend(v15, "_resumeProgressForZone:startingRowID:whenDone:", v11, 0, v33);
          v16 = v34;
          goto LABEL_17;
        }
        objc_msgSend(v11, "asPrivateClientZone");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "defaultAppLibrary");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "containerMetadata");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "isDocumentScopePublic")
          && (objc_msgSend(v19, "isCloudSyncTCCDisabled") & 1) == 0)
        {
          v21 = objc_msgSend(v18, "isiCloudDesktopAppLibrary");

          if ((v21 & 1) == 0)
            goto LABEL_8;
        }
        else
        {

        }
        brc_bread_crumbs();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v11, "zoneName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v40 = v23;
          v41 = 2112;
          v42 = v16;
          _os_log_debug_impl(&dword_230455000, v20, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: nothing to resume for '%@'%@", buf, 0x16u);

        }
LABEL_17:

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v24 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      v8 = v24;
    }
    while (v24);
  }

  brc_bread_crumbs();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    __44__BRCGlobalProgress_resumeProgressForZones___block_invoke_cold_1();

  v27 = *(_QWORD *)(v31 + 32);
  v28 = *(NSObject **)(v27 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__BRCGlobalProgress_resumeProgressForZones___block_invoke_121;
  block[3] = &unk_24FE3FA18;
  block[4] = v27;
  dispatch_group_notify(v5, v28, block);

}

void __44__BRCGlobalProgress_resumeProgressForZones___block_invoke_119(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __44__BRCGlobalProgress_resumeProgressForZones___block_invoke_121(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __44__BRCGlobalProgress_resumeProgressForZones___block_invoke_121_cold_1();

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

}

- (void)didUpdateDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  BRCGlobalProgress *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  NSObject *v24;

  v4 = a3;
  v5 = v4;
  if (!v4 || (objc_msgSend(v4, "isVisibleIniCloudDrive") & 1) == 0)
  {
    objc_msgSend(v5, "orig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "asDocument");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isVisibleIniCloudDrive");

    if (!v12)
      goto LABEL_18;
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[BRCGlobalProgress didUpdateDocument:].cold.1();

    v15 = self;
    v16 = v5;
    v17 = 1;
LABEL_10:
    -[BRCGlobalProgress _deleteDocument:reason:](v15, "_deleteDocument:reason:", v16, v17);
    goto LABEL_19;
  }
  if (objc_msgSend(v5, "isDead"))
  {
    objc_msgSend(v5, "st");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "state");
    objc_msgSend(v5, "orig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "st");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == objc_msgSend(v9, "state"))
    {

LABEL_18:
      -[BRCGlobalProgress _deleteDocument:reason:sync:](self, "_deleteDocument:reason:sync:", v5, 1, 0);
      goto LABEL_19;
    }
    objc_msgSend(v5, "orig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "syncUpState");

    if (!v22)
      goto LABEL_18;
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[BRCGlobalProgress didUpdateDocument:].cold.2();

    v15 = self;
    v16 = v5;
    v17 = 0;
    goto LABEL_10;
  }
  v18 = objc_msgSend(v5, "syncUpState");
  objc_msgSend(v5, "orig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "syncUpState");

  if (v18 != v20 && (objc_msgSend(v5, "isDocumentBeingCopiedToNewZone") & 1) == 0)
    -[BRCGlobalProgress _updateDocument:](self, "_updateDocument:", v5);
LABEL_19:

}

- (void)didDeleteDocument:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCGlobalProgress didDeleteDocument:].cold.1();

  }
  -[BRCGlobalProgress _deleteDocument:reason:](self, "_deleteDocument:reason:", v4, 0);

}

- (void)clearOutOfQuotaState
{
  OS_dispatch_queue *queue;
  _QWORD v3[5];

  queue = self->_queue;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __41__BRCGlobalProgress_clearOutOfQuotaState__block_invoke;
  v3[3] = &unk_24FE3FA18;
  v3[4] = self;
  dispatch_async_with_logs_6(queue, v3);
}

uint64_t __41__BRCGlobalProgress_clearOutOfQuotaState__block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "outOfQuotaObjIDs");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

  return br_pacer_signal();
}

- (void)stopPublishingProgress
{
  OS_dispatch_queue *queue;
  _QWORD v3[5];

  queue = self->_queue;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __43__BRCGlobalProgress_stopPublishingProgress__block_invoke;
  v3[3] = &unk_24FE3FA18;
  v3[4] = self;
  dispatch_async_with_logs_6(queue, v3);
}

uint64_t __43__BRCGlobalProgress_stopPublishingProgress__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  if (v3)
  {
    brc_task_tracker_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 72), "versionSizes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "childProgresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v33;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(a1 + 32), "_stopObservingProgress:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "childProgresses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "previousUnitCounts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeAllObjects");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "versionSizes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeAllObjects");

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "childProgresses", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v29;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(a1 + 32), "_stopObservingProgress:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v21++));
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v19);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "childProgresses");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "removeAllObjects");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "previousUnitCounts");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "removeAllObjects");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "resumeUnitCounts");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "removeAllObjects");

  brc_bread_crumbs();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    __43__BRCGlobalProgress_stopPublishingProgress__block_invoke_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "_destroyUploadWithReason:", 3);
}

- (void)addProgress:(id)a3 forDocument:(id)a4 inGroup:(char)a5
{
  int v5;
  id v8;
  id v9;
  int v10;
  char v11;
  int v12;
  void *v13;
  OS_dispatch_queue *queue;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  int v27;
  char v28;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v5 == 1)
  {
    if (v8)
      goto LABEL_3;
    goto LABEL_13;
  }
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    -[BRCGlobalProgress addProgress:forDocument:inGroup:].cold.4();

  if (!v8)
  {
LABEL_13:
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BRCGlobalProgress addProgress:forDocument:inGroup:].cold.3();

  }
LABEL_3:
  v10 = v5;
  if (!v9)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[BRCGlobalProgress didDeleteDocument:].cold.1();

  }
  if ((v10 - 3) <= 0xFFFFFFFD)
  {
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[BRCGlobalProgress addProgress:forDocument:inGroup:].cold.1();

  }
  v11 = objc_msgSend(v8, "isIndeterminate");
  if (v9 && (v11 & 1) == 0 && objc_msgSend(v9, "isVisibleIniCloudDrive"))
  {
    v12 = objc_msgSend(v9, "syncUpState");
    objc_msgSend(v9, "fileObjectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __53__BRCGlobalProgress_addProgress_forDocument_inGroup___block_invoke;
    v24[3] = &unk_24FE45B90;
    v28 = v10;
    v24[4] = self;
    v25 = v13;
    v27 = v12;
    v26 = v8;
    v15 = v13;
    dispatch_async_with_logs_6(queue, v24);

  }
}

void __53__BRCGlobalProgress_addProgress_forDocument_inGroup___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 60) != 1)
  {
LABEL_11:
    v14 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "asString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setUserInfoObject:forKey:", v15, CFSTR("_BRCObjectIDKey"));

    v16 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithChar:", *(char *)(a1 + 60));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setUserInfoObject:forKey:", v17, CFSTR("_BRCProgressGroupKey"));

    objc_msgSend(*(id *)(a1 + 32), "_startObservingProgress:", *(_QWORD *)(a1 + 48));
    return;
  }
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  if (v2)
  {
    objc_msgSend(v2, "versionSizes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "childProgresses");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        brc_bread_crumbs();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(_QWORD *)(a1 + 40);
          v23 = 138412546;
          v24 = v9;
          v25 = 2112;
          v26 = (uint64_t)v7;
          _os_log_impl(&dword_230455000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Progress: attempt to add an upload progress more than once for doc with objectID %@%@", (uint8_t *)&v23, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 32), "_cancelUploadForObjectID:inState:willRetryTransfer:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), 1);
      }
      v10 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "childProgresses");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, *(_QWORD *)(a1 + 40));

      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v21 = *(_QWORD *)(a1 + 40);
        v22 = objc_msgSend(*(id *)(a1 + 48), "totalUnitCount");
        v23 = 138412802;
        v24 = v21;
        v25 = 2048;
        v26 = v22;
        v27 = 2112;
        v28 = v12;
        _os_log_debug_impl(&dword_230455000, v13, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: start tracking upload progress for doc with objectID %@ (progressSize: %lld)%@", (uint8_t *)&v23, 0x20u);
      }

      goto LABEL_11;
    }
  }
  brc_bread_crumbs();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = *(_QWORD *)(a1 + 40);
    v23 = 138412546;
    v24 = v20;
    v25 = 2112;
    v26 = (uint64_t)v18;
    _os_log_impl(&dword_230455000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Progress: attempt to add an upload progress for doc with objectID %@ without a version size%@", (uint8_t *)&v23, 0x16u);
  }

}

- (void)updateUploadThrottleForDocument:(id)a3 toState:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  OS_dispatch_queue *queue;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  int v16;
  int v17;

  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "isVisibleIniCloudDrive") && (objc_msgSend(v7, "isDead") & 1) == 0)
  {
    objc_msgSend(v7, "fileObjectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "syncUpState");
    if (v8)
    {
      v10 = v9;
      queue = self->_queue;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __61__BRCGlobalProgress_updateUploadThrottleForDocument_toState___block_invoke;
      v14[3] = &unk_24FE41A28;
      v14[4] = self;
      v15 = v8;
      v16 = a4;
      v17 = v10;
      dispatch_async_with_logs_6(queue, v14);

    }
    else
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[BRCGlobalProgress updateUploadThrottleForDocument:toState:].cold.1((uint64_t)v12, v13);

    }
  }

}

void __61__BRCGlobalProgress_updateUploadThrottleForDocument_toState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  _BYTE v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "versionSizes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = 138412802;
      v12 = v10;
      v13 = 2080;
      *(_QWORD *)v14 = BRCPrettyPrintEnum();
      *(_WORD *)&v14[8] = 2112;
      *(_QWORD *)&v14[10] = v4;
      _os_log_debug_impl(&dword_230455000, v5, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: stop tracking upload for doc with objectID %@ because transfer failed (toState: %s)%@", (uint8_t *)&v11, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_cancelUploadForObjectID:inState:willRetryTransfer:pendingQuota:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 52), *(_DWORD *)(a1 + 48) > 0, *(_DWORD *)(a1 + 48) == 32);
  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_DWORD *)(a1 + 52);
      v11 = 138413058;
      v12 = v8;
      v13 = 1024;
      *(_DWORD *)v14 = v9;
      *(_WORD *)&v14[4] = 2080;
      *(_QWORD *)&v14[6] = BRCPrettyPrintEnum();
      *(_WORD *)&v14[14] = 2112;
      *(_QWORD *)&v14[16] = v6;
      _os_log_impl(&dword_230455000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Progress: upload failed for doc with objectID %@ without being tracked (syncUpState: %d, toState: %s)%@", (uint8_t *)&v11, 0x26u);
    }

  }
}

- (void)dumpDictionary:(id)a3 withMaxCount:(unint64_t)a4 toContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  unint64_t v13;
  _QWORD v14[4];

  v7 = a3;
  v8 = a5;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v8, "writeLineWithFormat:", CFSTR("{"));
    objc_msgSend(v8, "pushIndentation");
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __59__BRCGlobalProgress_dumpDictionary_withMaxCount_toContext___block_invoke;
    v10[3] = &unk_24FE45BB8;
    v9 = v8;
    v11 = v9;
    v12 = v14;
    v13 = a4;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);
    objc_msgSend(v9, "popIndentation");
    objc_msgSend(v9, "writeLineWithFormat:", CFSTR("}"));

  }
  else
  {
    objc_msgSend(v8, "writeLineWithFormat:", CFSTR("{}"));
  }
  _Block_object_dispose(v14, 8);

}

uint64_t __59__BRCGlobalProgress_dumpDictionary_withMaxCount_toContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  uint64_t v7;
  unint64_t v8;

  result = objc_msgSend(*(id *)(a1 + 32), "writeLineWithFormat:", CFSTR("%@ = %@;"), a2, a3);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(_QWORD *)(v7 + 24);
  *(_QWORD *)(v7 + 24) = v8 + 1;
  if (v8 > *(_QWORD *)(a1 + 48))
  {
    result = objc_msgSend(*(id *)(a1 + 32), "writeLineWithFormat:", CFSTR(".. truncated .."));
    *a4 = 1;
  }
  return result;
}

- (void)dumpToContext:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__BRCGlobalProgress_dumpToContext___block_invoke;
  block[3] = &unk_24FE3FA40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);
  objc_msgSend(v6, "popIndentation");

}

uint64_t __35__BRCGlobalProgress_dumpToContext___block_invoke(uint64_t a1)
{
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
  id *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v3)
  {
    objc_msgSend(v3, "brc_dumpDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "localizedAdditionalDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "localizedAdditionalDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR(" (%@)"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "writeLineWithFormat:", CFSTR("global progress {%@ d:'%@%@'}"), v4, v5, v9);

    }
    else
    {
      objc_msgSend(v2, "writeLineWithFormat:", CFSTR("global progress {%@ d:'%@%@'}"), v4, v5, &stru_24FE4A790);
    }

  }
  else
  {
    objc_msgSend(v2, "writeLineWithFormat:", CFSTR("global progress {none}"));
  }
  objc_msgSend(*(id *)(a1 + 40), "writeLineWithFormat:", CFSTR("-----------------------------------------------------"));
  objc_msgSend(*(id *)(a1 + 40), "pushIndentation");
  v10 = *(void **)(a1 + 40);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
    objc_msgSend(v10, "writeLineWithFormat:", CFSTR("upload %@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  else
    objc_msgSend(v10, "writeLineWithFormat:", CFSTR("upload {none}"), v45);
  v11 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "versionSizes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "writeLineWithFormat:", CFSTR("upload version sizes (%lu):"), objc_msgSend(v12, "count"));

  v13 = *(id **)(a1 + 32);
  objc_msgSend(v13[9], "versionSizes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dumpDictionary:withMaxCount:toContext:", v14, 1000, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "childProgresses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  v17 = *(void **)(a1 + 40);
  v18 = MEMORY[0x24BDAC760];
  if (v16)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "childProgresses");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "writeLineWithFormat:", CFSTR("upload progresses (%lu): {"), objc_msgSend(v19, "count"));

    objc_msgSend(*(id *)(a1 + 40), "pushIndentation");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "childProgresses");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v18;
    v49[1] = 3221225472;
    v49[2] = __35__BRCGlobalProgress_dumpToContext___block_invoke_2;
    v49[3] = &unk_24FE45BE0;
    v50 = *(id *)(a1 + 40);
    objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v49);

    objc_msgSend(*(id *)(a1 + 40), "popIndentation");
    objc_msgSend(*(id *)(a1 + 40), "writeLineWithFormat:", CFSTR("}"));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "writeLineWithFormat:", CFSTR("upload progresses (0): {}"));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "outOfQuotaObjIDs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  v23 = *(void **)(a1 + 40);
  if (v22)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "outOfQuotaObjIDs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "outOfQuotaObjIDs");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "allObjects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "componentsJoinedByString:", CFSTR(", "));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "writeLineWithFormat:", CFSTR("upload pending quota (%lu): {%@}"), v25, v28);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "writeLineWithFormat:", CFSTR("upload pending quota (0): {}"));
  }
  objc_msgSend(*(id *)(a1 + 40), "writeLineWithFormat:", &stru_24FE4A790);
  v29 = *(void **)(a1 + 40);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80))
    objc_msgSend(v29, "writeLineWithFormat:", CFSTR("download %@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  else
    objc_msgSend(v29, "writeLineWithFormat:", CFSTR("download {none}"), v46);
  v30 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "versionSizes");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "writeLineWithFormat:", CFSTR("download version sizes (%lu):"), objc_msgSend(v31, "count"));

  v32 = *(id **)(a1 + 32);
  objc_msgSend(v32[10], "versionSizes");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "dumpDictionary:withMaxCount:toContext:", v33, 1000, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "childProgresses");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "count");

  v36 = *(void **)(a1 + 40);
  if (v35)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "childProgresses");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "writeLineWithFormat:", CFSTR("download progresses (%lu): {"), objc_msgSend(v37, "count"));

    objc_msgSend(*(id *)(a1 + 40), "pushIndentation");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "childProgresses");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v18;
    v47[1] = 3221225472;
    v47[2] = __35__BRCGlobalProgress_dumpToContext___block_invoke_3;
    v47[3] = &unk_24FE45BE0;
    v48 = *(id *)(a1 + 40);
    objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", v47);

    objc_msgSend(*(id *)(a1 + 40), "popIndentation");
    objc_msgSend(*(id *)(a1 + 40), "writeLineWithFormat:", CFSTR("}"));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "writeLineWithFormat:", CFSTR("download progresses (0): {}"));
  }
  v39 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "resumeUnitCounts");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "count");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "resumeUnitCounts");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v42, "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "resumeUnitCounts");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "writeLineWithFormat:", CFSTR("download resume unit count (%lu): %@"), v41, v43);

  }
  else
  {
    objc_msgSend(v39, "writeLineWithFormat:", CFSTR("download resume unit count (%lu): %@"), v41, CFSTR("{}"));
  }

  return objc_msgSend(*(id *)(a1 + 40), "writeLineWithFormat:", &stru_24FE4A790);
}

void __35__BRCGlobalProgress_dumpToContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "brc_dumpDescription");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeLineWithFormat:", CFSTR("%@ = %@;"), v5, v6);

}

void __35__BRCGlobalProgress_dumpToContext___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "brc_dumpDescription");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeLineWithFormat:", CFSTR("%@ = %@;"), v5, v6);

}

+ (id)_keyPathsToObserve
{
  if (_keyPathsToObserve_onceToken != -1)
    dispatch_once(&_keyPathsToObserve_onceToken, &__block_literal_global_33);
  return (id)_keyPathsToObserve_keyPaths;
}

void __39__BRCGlobalProgress__keyPathsToObserve__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(sel_completedUnitCount);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_keyPathsToObserve_keyPaths;
  _keyPathsToObserve_keyPaths = v1;

}

- (void)_startObservingProgress:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend((id)objc_opt_class(), "_keyPathsToObserve", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x2348B9F14]();
        objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, v10, 5, 0);
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)_stopObservingProgress:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend((id)objc_opt_class(), "_keyPathsToObserve", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x2348B9F14]();
        objc_msgSend(v4, "removeObserver:forKeyPath:", self, v10);
        objc_autoreleasePoolPop(v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("_BRCObjectIDKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE17628], "fileObjectIDWithString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[BRCGlobalProgress _stopObservingProgress:].cold.2();

  }
  objc_msgSend(v4, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_BRCProgressGroupKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[BRCGlobalProgress _stopObservingProgress:].cold.1();

  }
  v17 = objc_msgSend(v16, "shortValue");
  if (v14)
  {
    if (v17 == 1)
    {
      -[_BRCTransferInfo previousUnitCounts](self->_uploads, "previousUnitCounts");
    }
    else
    {
      -[_BRCTransferInfo previousUnitCounts](self->_downloads, "previousUnitCounts");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeObjectForKey:", v14);

      -[_BRCDownloadInfo resumeUnitCounts](self->_downloads, "resumeUnitCounts");
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObjectForKey:", v14);

  }
}

- (id)_buildGlobalProgressObjectsWihCompletedUnitCount:(int64_t)a3 totalUnitCount:(int64_t)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  _QWORD v11[6];

  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __85__BRCGlobalProgress__buildGlobalProgressObjectsWihCompletedUnitCount_totalUnitCount___block_invoke;
  v11[3] = &__block_descriptor_48_e28___BRCProgress_16__0__NSURL_8l;
  v11[4] = a3;
  v11[5] = a4;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348BA0DC](v11);
  objc_msgSend(MEMORY[0x24BE17610], "mobileDocumentsURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v7)[2](v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserInfoObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE174D0]);
  objc_msgSend(v9, "setUserInfoObject:forKey:", *MEMORY[0x24BDD1198], *MEMORY[0x24BDD1190]);
  objc_msgSend(v9, "setKind:", *MEMORY[0x24BDD11B0]);
  objc_msgSend(v6, "addObject:", v9);

  return v6;
}

BRCProgress *__85__BRCGlobalProgress__buildGlobalProgressObjectsWihCompletedUnitCount_totalUnitCount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BRCProgress *v4;

  v3 = a2;
  v4 = objc_alloc_init(BRCProgress);
  -[BRCProgress setUserInfoObject:forKey:](v4, "setUserInfoObject:forKey:", v3, *MEMORY[0x24BDD11A8]);

  -[BRCProgress setCompletedUnitCount:](v4, "setCompletedUnitCount:", *(_QWORD *)(a1 + 32));
  -[BRCProgress setTotalUnitCount:](v4, "setTotalUnitCount:", *(_QWORD *)(a1 + 40));
  -[BRCProgress setCancellable:](v4, "setCancellable:", 0);
  return v4;
}

- (void)_createNewIndeterminateGlobalProgress
{
  -[BRCGlobalProgress _createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:](self, "_createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:", 0, 0, 0);
}

- (void)_createNewGlobalProgressInGroup:(id)a3 completedUnitCount:(int64_t)a4 totalUnitCount:(int64_t)a5
{
  id v8;
  BOOL v9;
  OS_dispatch_source *v10;
  OS_dispatch_source *operationTimer;
  OS_dispatch_source *v12;
  OS_dispatch_source *v13;
  _QWORD *v14;
  NSObject *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  dispatch_block_t v19;
  void *v20;
  void *v21;
  BRCProgressMultiplex *v22;
  BRCProgressMultiplex *globalProgressMultiplex;
  void *v24;
  NSObject *v25;
  void *v26;
  double v27;
  double v28;
  NSObject *v29;
  dispatch_time_t v30;
  void *v31;
  NSObject *v32;
  const char *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  _QWORD v44[4];
  id v45;
  _BYTE location[12];
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_globalProgressMultiplex)
  {
    brc_bread_crumbs();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      -[BRCGlobalProgress _createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:].cold.6();

  }
  if (a4 < 0)
  {
    brc_bread_crumbs();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      -[BRCGlobalProgress _createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:].cold.5();

  }
  v9 = a5 >= 0 && v8 == 0;
  if (a5 <= 0 && !v9)
  {
    brc_bread_crumbs();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
      -[BRCGlobalProgress _createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:].cold.4();

  }
  if (v8)
  {
    objc_msgSend(v8, "intValue");
    if (!BRCPrettyPrintEnum())
    {
      brc_bread_crumbs();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
        -[BRCGlobalProgress _createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:].cold.3();

    }
  }
  if (!self->_lazyInitDone)
  {
    self->_lazyInitDone = 1;
    br_pacer_resume();
    v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
    operationTimer = self->_operationTimer;
    self->_operationTimer = v10;

    self->_operationTimerSuspendCount = 1;
    objc_initWeak((id *)location, self);
    v12 = self->_operationTimer;
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __87__BRCGlobalProgress__createNewGlobalProgressInGroup_completedUnitCount_totalUnitCount___block_invoke;
    v44[3] = &unk_24FE3F9C8;
    objc_copyWeak(&v45, (id *)location);
    v13 = v12;
    v14 = v44;
    v15 = v13;
    v16 = v14;
    v17 = v16;
    v18 = v16;
    if (*MEMORY[0x24BE17840])
    {
      ((void (*)(_QWORD *))*MEMORY[0x24BE17840])(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v19 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v18);
    dispatch_source_set_event_handler(v15, v19);

    +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    self->_networkReachable = objc_msgSend(v20, "isNetworkReachable");
    objc_msgSend(v20, "addReachabilityObserver:", self);

    objc_destroyWeak(&v45);
    objc_destroyWeak((id *)location);
  }
  self->_showExtendedInfo = 0;
  -[BRCGlobalProgress _buildGlobalProgressObjectsWihCompletedUnitCount:totalUnitCount:](self, "_buildGlobalProgressObjectsWihCompletedUnitCount:totalUnitCount:", a4, a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[BRCProgressMultiplex initWithUnderlineProgressObjects:]([BRCProgressMultiplex alloc], "initWithUnderlineProgressObjects:", v21);
  globalProgressMultiplex = self->_globalProgressMultiplex;
  self->_globalProgressMultiplex = v22;

  -[BRCGlobalProgress _updateGlobalProgress](self, "_updateGlobalProgress");
  brc_bread_crumbs();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    if (v8)
    {
      objc_msgSend(v8, "intValue");
      v33 = (const char *)BRCPrettyPrintEnum();
    }
    else
    {
      v33 = "initial sync-down";
    }
    *(_DWORD *)location = 136315394;
    *(_QWORD *)&location[4] = v33;
    v47 = 2112;
    v48 = v24;
    _os_log_debug_impl(&dword_230455000, v25, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: new global progress to track %s%@", location, 0x16u);
  }

  -[BRCProgressMultiplex brc_publish](self->_globalProgressMultiplex, "brc_publish");
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "intervalToWaitBeforeShowingAdditionalDescription");
  v28 = v27;
  v29 = self->_operationTimer;
  if (!v29)
  {
    brc_bread_crumbs();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
      -[BRCGlobalProgress _createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:].cold.2();

    v29 = self->_operationTimer;
  }
  v30 = dispatch_time(0, 1000000000 * (uint64_t)v28);
  dispatch_source_set_timer(v29, v30, 0xFFFFFFFFFFFFFFFFLL, 0);
  if (self->_operationTimerSuspendCount == 1)
  {
    dispatch_resume((dispatch_object_t)self->_operationTimer);
    --self->_operationTimerSuspendCount;
  }
  else
  {
    brc_bread_crumbs();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      -[BRCGlobalProgress _createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:].cold.1();

  }
}

void __87__BRCGlobalProgress__createNewGlobalProgressInGroup_completedUnitCount_totalUnitCount___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[61] && (*((_QWORD *)WeakRetained + 9) || *((_QWORD *)WeakRetained + 10)))
  {
    WeakRetained[60] = 1;
    v2 = WeakRetained;
    br_pacer_signal();
    WeakRetained = v2;
  }

}

- (void)_createUploadMetadataWithCompletedUnitCount:(int64_t)a3 totalUnitCount:(int64_t)a4
{
  void *v7;
  NSObject *v8;
  void *v9;
  _BRCUploadInfo *v10;
  _BRCUploadInfo *uploads;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_uploads)
  {
    if ((a3 & 0x8000000000000000) == 0)
      goto LABEL_3;
    goto LABEL_17;
  }
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    -[BRCGlobalProgress _createUploadMetadataWithCompletedUnitCount:totalUnitCount:].cold.4();

  if (a3 < 0)
  {
LABEL_17:
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BRCGlobalProgress _createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:].cold.5();

  }
LABEL_3:
  if (a4 < a3)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[BRCGlobalProgress _createUploadMetadataWithCompletedUnitCount:totalUnitCount:].cold.2();

  }
  if (self->_globalProgressMultiplex)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BRCGlobalProgress _createUploadMetadataWithCompletedUnitCount:totalUnitCount:].cold.1();

    if (self->_downloads)
      v9 = &unk_24FEB3410;
    else
      v9 = 0;
    -[BRCGlobalProgress _destroyProgressInGroup:reason:](self, "_destroyProgressInGroup:reason:", v9, 2);
  }
  v10 = objc_alloc_init(_BRCUploadInfo);
  uploads = self->_uploads;
  self->_uploads = v10;

  -[_BRCTransferInfo progress](self->_uploads, "progress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCompletedUnitCount:", a3);

  -[_BRCTransferInfo progress](self->_uploads, "progress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTotalUnitCount:", a4);

  -[_BRCTransferInfo progress](self->_uploads, "progress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCancellable:", 0);

  -[BRCGlobalProgress _createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:](self, "_createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:", &unk_24FEB3428, a3, a4);
  if (-[BRCProgressMultiplex isPublished](self->_globalProgressMultiplex, "isPublished"))
  {
    -[_BRCTransferInfo progress](self->_uploads, "progress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "brc_publish");

  }
  br_pacer_signal();
}

- (void)_updateGlobalProgress
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _globalProgressMultiplex.indeterminate%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_cancelUploadForObjectID:(id)a3 inState:(unsigned int)a4
{
  -[BRCGlobalProgress _cancelUploadForObjectID:inState:willRetryTransfer:](self, "_cancelUploadForObjectID:inState:willRetryTransfer:", a3, *(_QWORD *)&a4, 0);
}

- (void)_cancelUploadForObjectID:(id)a3 inState:(unsigned int)a4 willRetryTransfer:(BOOL)a5
{
  -[BRCGlobalProgress _cancelUploadForObjectID:inState:willRetryTransfer:pendingQuota:](self, "_cancelUploadForObjectID:inState:willRetryTransfer:pendingQuota:", a3, *(_QWORD *)&a4, a5, 0);
}

- (void)_cancelUploadForObjectID:(id)a3 inState:(unsigned int)a4 willRetryTransfer:(BOOL)a5 pendingQuota:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _BRCUploadInfo *uploads;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  int v36;
  id v37;
  __int16 v38;
  _BYTE v39[10];
  __int16 v40;
  _BOOL4 v41;
  __int16 v42;
  _BOOL4 v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v6 = a6;
  v7 = a5;
  v46 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v10)
  {
    -[_BRCTransferInfo versionSizes](self->_uploads, "versionSizes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      brc_bread_crumbs();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        -[BRCGlobalProgress _cancelUploadForObjectID:inState:willRetryTransfer:pendingQuota:].cold.3();

    }
    -[_BRCTransferInfo childProgresses](self->_uploads, "childProgresses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v10);
    v14 = objc_claimAutoreleasedReturnValue();

    -[_BRCTransferInfo previousUnitCounts](self->_uploads, "previousUnitCounts");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v36 = 138413570;
      v37 = v10;
      v38 = 1024;
      *(_DWORD *)v39 = a4;
      *(_WORD *)&v39[4] = 1024;
      *(_DWORD *)&v39[6] = v7;
      v40 = 1024;
      v41 = v6;
      v42 = 1024;
      v43 = v14 != 0;
      v44 = 2112;
      v45 = v17;
      _os_log_debug_impl(&dword_230455000, v18, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: cancelling upload for doc with objectID %@ (syncUpState: %d, willRetry: %d, pendingQuota:%d, hasProgress: %d)%@", (uint8_t *)&v36, 0x2Eu);
    }

    if (v14)
      -[BRCGlobalProgress _stopObservingProgress:](self, "_stopObservingProgress:", v14);
    if (v7)
    {
      if (v6)
      {
        -[_BRCUploadInfo outOfQuotaObjIDs](self->_uploads, "outOfQuotaObjIDs");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v10);
LABEL_15:

        -[_BRCTransferInfo versionSizes](self->_uploads, "versionSizes");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");

        if (v24)
        {
          if (v14)
          {
            if (!v16)
            {
              brc_bread_crumbs();
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              brc_notifications_log();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                -[BRCGlobalProgress _cancelUploadForObjectID:inState:willRetryTransfer:pendingQuota:].cold.2();

            }
            v27 = _computeDelta(0, objc_msgSend(v16, "longLongValue"), objc_msgSend(v12, "longLongValue"), -[NSObject totalUnitCount](v14, "totalUnitCount"), -[NSObject isFinished](v14, "isFinished"));
            -[_BRCTransferInfo childProgresses](self->_uploads, "childProgresses");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "removeObjectForKey:", v10);

          }
          else if (a4 == 4)
          {
            v27 = objc_msgSend(v12, "longLongValue");
          }
          else
          {
            v27 = 0;
          }
          -[_BRCTransferInfo setSumOfCompletedUnitCountDelta:](self->_uploads, "setSumOfCompletedUnitCountDelta:", -[_BRCTransferInfo sumOfCompletedUnitCountDelta](self->_uploads, "sumOfCompletedUnitCountDelta") - v27);
          if (!v7)
          {
            uploads = self->_uploads;
            v31 = objc_msgSend(v12, "longLongValue");
            -[_BRCTransferInfo setSumOfTotalUnitCountDelta:](uploads, "setSumOfTotalUnitCountDelta:", -[_BRCTransferInfo sumOfTotalUnitCountDelta](uploads, "sumOfTotalUnitCountDelta")- 105 * v31 / 100- (105 * v31 / 100 == v31));
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
              -[_BRCTransferInfo verifyFutureProgressIsNotFinished](self->_uploads, "verifyFutureProgressIsNotFinished");
          }
          br_pacer_signal();
        }
        else
        {
          -[_BRCTransferInfo childProgresses](self->_uploads, "childProgresses");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "removeObjectForKey:", v10);

          -[BRCGlobalProgress _destroyUploadWithReason:](self, "_destroyUploadWithReason:", 1);
        }

        goto LABEL_31;
      }
    }
    else
    {
      -[_BRCTransferInfo versionSizes](self->_uploads, "versionSizes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeObjectForKey:", v10);

      if (v6)
      {
        brc_bread_crumbs();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v36 = 138412546;
          v37 = v10;
          v38 = 2112;
          *(_QWORD *)v39 = v21;
          _os_log_impl(&dword_230455000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] Progress: forcing pending quota to NO for doc with objectID %@ because transfer isn't retryable%@", (uint8_t *)&v36, 0x16u);
        }

      }
    }
    -[_BRCUploadInfo outOfQuotaObjIDs](self->_uploads, "outOfQuotaObjIDs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObject:", v10);
    goto LABEL_15;
  }
  brc_bread_crumbs();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    -[BRCGlobalProgress _cancelUploadForObjectID:inState:willRetryTransfer:pendingQuota:].cold.1();

  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v36 = 138412290;
    v37 = v12;
    _os_log_impl(&dword_230455000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Progress: can't proceed to upload cancelation without objectID%@", (uint8_t *)&v36, 0xCu);
  }
LABEL_31:

}

- (void)_destroyProgressInGroup:(id)a3 reason:(char)a4
{
  unsigned int v4;
  id v6;
  int v7;
  int v8;
  int v9;
  _BOOL4 v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id *p_uploads;
  void *v52;
  char v53;
  void *v54;
  id v55;
  void *v56;
  NSObject *v57;
  void *v58;
  int v59;
  BRCProgressMultiplex *globalProgressMultiplex;
  const char *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  NSObject *v79;
  void *v80;
  NSObject *v81;
  _BOOL4 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  uint8_t v92[128];
  uint8_t buf[4];
  const char *v94;
  __int16 v95;
  uint64_t v96;
  __int16 v97;
  _BOOL4 v98;
  __int16 v99;
  void *v100;
  uint64_t v101;

  v4 = a4;
  v101 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = objc_msgSend(v6, "shortValue");
  v8 = objc_msgSend(v6, "shortValue");
  v9 = v8;
  v10 = v7 == 1 || v8 == 2 && !self->_uploads || v6 == 0;
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    if (v6)
    {
      objc_msgSend(v6, "integerValue");
      v61 = (const char *)BRCPrettyPrintEnum();
    }
    else
    {
      v61 = "none";
    }
    *(_DWORD *)buf = 136315906;
    v94 = v61;
    v95 = 2080;
    v96 = BRCPrettyPrintEnum();
    v97 = 1024;
    v98 = v10;
    v99 = 2112;
    v100 = v11;
    _os_log_debug_impl(&dword_230455000, v12, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: did finish global progress (group: %s, reason: %s, userVisible: %d)%@", buf, 0x26u);
  }

  if (v7 == 1 || v9 == 2)
  {
    v14 = 80;
    if (v7 == 1)
      v14 = 72;
    v13 = *(id *)((char *)&self->super.isa + v14);
  }
  else
  {
    v13 = 0;
  }
  if (v4 != 1)
  {
    if (v4)
      goto LABEL_45;
    if (objc_msgSend(v13, "sumOfCompletedUnitCountDelta"))
    {
      brc_bread_crumbs();
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
        -[BRCGlobalProgress _destroyProgressInGroup:reason:].cold.11();

    }
    if (objc_msgSend(v13, "sumOfTotalUnitCountDelta"))
    {
      brc_bread_crumbs();
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
        -[BRCGlobalProgress _destroyProgressInGroup:reason:].cold.10();

    }
    objc_msgSend(v13, "setSumOfCompletedUnitCountDelta:", 0);
    objc_msgSend(v13, "setSumOfTotalUnitCountDelta:", 0);
  }
  if (objc_msgSend(v6, "integerValue") == 1)
  {
    -[_BRCTransferInfo versionSizes](self->_uploads, "versionSizes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      brc_bread_crumbs();
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
        -[BRCGlobalProgress _destroyProgressInGroup:reason:].cold.5();

    }
    -[_BRCTransferInfo childProgresses](self->_uploads, "childProgresses");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18)
    {
      brc_bread_crumbs();
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
        -[BRCGlobalProgress _destroyProgressInGroup:reason:].cold.4();

    }
    -[_BRCTransferInfo previousUnitCounts](self->_uploads, "previousUnitCounts");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20)
    {
      brc_bread_crumbs();
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
        -[BRCGlobalProgress _destroyProgressInGroup:reason:].cold.3();

    }
    v82 = v10;
    -[_BRCUploadInfo outOfQuotaObjIDs](self->_uploads, "outOfQuotaObjIDs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (v22)
    {
      brc_bread_crumbs();
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
        -[BRCGlobalProgress _destroyProgressInGroup:reason:].cold.2();

    }
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    -[_BRCTransferInfo childProgresses](self->_uploads, "childProgresses");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "allValues");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v88;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v88 != v27)
            objc_enumerationMutation(v24);
          -[BRCGlobalProgress _stopObservingProgress:](self, "_stopObservingProgress:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * i));
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
      }
      while (v26);
    }

    -[_BRCTransferInfo childProgresses](self->_uploads, "childProgresses");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "removeAllObjects");

    -[_BRCTransferInfo versionSizes](self->_uploads, "versionSizes");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "removeAllObjects");

    -[_BRCTransferInfo previousUnitCounts](self->_uploads, "previousUnitCounts");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "removeAllObjects");

    -[_BRCUploadInfo outOfQuotaObjIDs](self->_uploads, "outOfQuotaObjIDs");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v6, "integerValue") != 2)
      goto LABEL_45;
    -[_BRCTransferInfo versionSizes](self->_downloads, "versionSizes");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "count");

    if (v34)
    {
      brc_bread_crumbs();
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
        -[BRCGlobalProgress _destroyProgressInGroup:reason:].cold.9();

    }
    -[_BRCTransferInfo childProgresses](self->_downloads, "childProgresses");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");

    if (v36)
    {
      brc_bread_crumbs();
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v77 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
        -[BRCGlobalProgress _destroyProgressInGroup:reason:].cold.8();

    }
    -[_BRCTransferInfo previousUnitCounts](self->_downloads, "previousUnitCounts");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "count");

    if (v38)
    {
      brc_bread_crumbs();
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v79 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
        -[BRCGlobalProgress _destroyProgressInGroup:reason:].cold.7();

    }
    v82 = v10;
    -[_BRCDownloadInfo resumeUnitCounts](self->_downloads, "resumeUnitCounts");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "count");

    if (v40)
    {
      brc_bread_crumbs();
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_FAULT))
        -[BRCGlobalProgress _destroyProgressInGroup:reason:].cold.6();

    }
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    -[_BRCTransferInfo childProgresses](self->_downloads, "childProgresses");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "allValues");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v84;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v84 != v45)
            objc_enumerationMutation(v42);
          -[BRCGlobalProgress _stopObservingProgress:](self, "_stopObservingProgress:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * j));
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
      }
      while (v44);
    }

    -[_BRCTransferInfo childProgresses](self->_downloads, "childProgresses");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "removeAllObjects");

    -[_BRCTransferInfo versionSizes](self->_downloads, "versionSizes");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "removeAllObjects");

    -[_BRCTransferInfo previousUnitCounts](self->_downloads, "previousUnitCounts");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "removeAllObjects");

    -[_BRCDownloadInfo resumeUnitCounts](self->_downloads, "resumeUnitCounts");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v50 = v32;
  objc_msgSend(v32, "removeAllObjects");

  v10 = v82;
LABEL_45:
  if (v7 == 1)
  {
    p_uploads = (id *)&self->_uploads;
    -[_BRCTransferInfo progress](self->_uploads, "progress");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "isPublished");

    if ((v53 & 1) == 0)
    {
LABEL_48:
      v55 = *p_uploads;
      *p_uploads = 0;

      goto LABEL_49;
    }
LABEL_47:
    objc_msgSend(*p_uploads, "progress");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "brc_unpublish");

    goto LABEL_48;
  }
  if (v4 != 2 && v9 == 2)
  {
    p_uploads = (id *)&self->_downloads;
    -[_BRCTransferInfo progress](self->_downloads, "progress");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "isPublished");

    if (!v59)
      goto LABEL_48;
    goto LABEL_47;
  }
LABEL_49:
  if (v10)
  {
    if (self->_operationTimerSuspendCount)
    {
      brc_bread_crumbs();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
        -[BRCGlobalProgress _createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:].cold.1();

    }
    else
    {
      dispatch_suspend((dispatch_object_t)self->_operationTimer);
      ++self->_operationTimerSuspendCount;
    }
    if (-[BRCProgressMultiplex isPublished](self->_globalProgressMultiplex, "isPublished"))
      -[BRCProgressMultiplex brc_unpublish](self->_globalProgressMultiplex, "brc_unpublish");
    globalProgressMultiplex = self->_globalProgressMultiplex;
    self->_globalProgressMultiplex = 0;

    if (v4 <= 1)
      -[BRCGlobalProgress _resumeProgressForAnotherOperationIfNeeded](self, "_resumeProgressForAnotherOperationIfNeeded");
  }

}

- (void)_destroyUploadWithReason:(char)a3
{
  uint64_t v3;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_uploads)
    -[BRCGlobalProgress _destroyProgressInGroup:reason:](self, "_destroyProgressInGroup:reason:", &unk_24FEB3428, v3);
}

- (void)_resumeProgressForAnotherOperationIfNeeded
{
  NSObject *v0;
  id *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*v1, "versionSizes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "count");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, v3, "[NOTIF] Progress: resume download progress (%lu item downloading)%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)_updateDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  id WeakRetained;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  NSObject *queue;
  void *v15;
  NSObject *v16;
  _QWORD block[5];
  id v18;
  uint64_t v19;
  int v20;
  int v21;
  char v22;

  v4 = a3;
  objc_msgSend(v4, "fileObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "syncUpState");

  v8 = objc_msgSend(v4, "syncUpState");
  WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  objc_msgSend(WeakRetained, "fsUploader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isDefaultOwnerOutOfQuota");

  objc_msgSend(v4, "currentVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "size");

  if (!v13)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[BRCGlobalProgress _updateDocument:].cold.1();
    goto LABEL_8;
  }
  if (!v5)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCGlobalProgress _updateDocument:].cold.2();
LABEL_8:

    goto LABEL_9;
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__BRCGlobalProgress__updateDocument___block_invoke;
  block[3] = &unk_24FE45C48;
  v20 = v8;
  block[4] = self;
  v21 = v7;
  v18 = v5;
  v19 = v13;
  v22 = v11;
  dispatch_sync(queue, block);

LABEL_9:
}

void __37__BRCGlobalProgress__updateDocument___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t *v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id *v28;
  id v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id *v36;
  id v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  NSObject *v54;
  id v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  switch(*(_DWORD *)(a1 + 56))
  {
    case 2:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "versionSizes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        brc_bread_crumbs();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          __37__BRCGlobalProgress__updateDocument___block_invoke_cold_3((uint64_t *)(a1 + 40));

        objc_msgSend(*(id *)(a1 + 32), "_cancelUploadForObjectID:inState:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 60));
      }
      break;
    case 3:
    case 7:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "versionSizes");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (uint64_t *)(a1 + 40);
      objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        v5 = *(_DWORD *)(a1 + 60);
        if (v5 == 4 || v5 == 7)
        {
          brc_bread_crumbs();
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          brc_notifications_log();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
            __37__BRCGlobalProgress__updateDocument___block_invoke_cold_4((uint64_t *)(a1 + 40));

          objc_msgSend(*(id *)(a1 + 32), "_cancelUploadForObjectID:inState:willRetryTransfer:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 60), 0);
        }
        else
        {
          brc_bread_crumbs();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = *v3;
            *(_DWORD *)buf = 138412546;
            v57 = v32;
            v58 = 2112;
            v59 = (uint64_t)v30;
            _os_log_impl(&dword_230455000, v31, OS_LOG_TYPE_DEFAULT, "[WARNING] Progress: doc with objectID %@ shouldn't be uploading before its status is set to needs-upload%@", buf, 0x16u);
          }

        }
      }
      else
      {
        v25 = *(_QWORD *)(a1 + 48);
        v26 = 105 * v25 / 100;
        if (v26 == v25)
          v27 = v26 + 1;
        else
          v27 = 105 * v25 / 100;
        v28 = *(id **)(a1 + 32);
        v29 = v28[9];
        if (v29)
        {
          objc_msgSend(v29, "setSumOfTotalUnitCountDelta:", objc_msgSend(v28[9], "sumOfTotalUnitCountDelta") + v27);
          br_pacer_signal();
        }
        else
        {
          objc_msgSend(v28, "_createUploadMetadataWithCompletedUnitCount:totalUnitCount:", 0, v27);
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)(a1 + 48));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "versionSizes");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setObject:forKeyedSubscript:", v40, *(_QWORD *)(a1 + 40));

        brc_bread_crumbs();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          v48 = *(_QWORD *)(a1 + 40);
          v49 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 138413058;
          v57 = v48;
          v58 = 2048;
          v59 = v49;
          v60 = 2048;
          v61 = v27;
          v62 = 2112;
          v63 = v42;
          _os_log_debug_impl(&dword_230455000, v43, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: start tracking upload for doc with objectID %@ because document is needs-upload (versionSize: %lld, transferSize: %lld)%@", buf, 0x2Au);
        }

        if (*(_BYTE *)(a1 + 64))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "outOfQuotaObjIDs");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", *(_QWORD *)(a1 + 40));
          goto LABEL_46;
        }
      }
      break;
    case 4:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "versionSizes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "childProgresses");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
        v55 = (id)objc_claimAutoreleasedReturnValue();

        v15 = v55;
        if (v55)
        {
          objc_msgSend(*(id *)(a1 + 32), "_stopObservingProgress:", v55);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "childProgresses");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

          v15 = v55;
        }

      }
      else
      {
        v33 = *(_QWORD *)(a1 + 48);
        v34 = 105 * v33 / 100;
        if (v34 == v33)
          v35 = v34 + 1;
        else
          v35 = 105 * v33 / 100;
        v36 = *(id **)(a1 + 32);
        v37 = v36[9];
        if (v37)
        {
          objc_msgSend(v37, "setSumOfCompletedUnitCountDelta:", *(_QWORD *)(a1 + 48) + objc_msgSend(v36[9], "sumOfCompletedUnitCountDelta"));
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setSumOfTotalUnitCountDelta:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "sumOfTotalUnitCountDelta") + v35);
          br_pacer_signal();
        }
        else
        {
          objc_msgSend(v36, "_createUploadMetadataWithCompletedUnitCount:totalUnitCount:");
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)(a1 + 48));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "versionSizes");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setObject:forKeyedSubscript:", v44, *(_QWORD *)(a1 + 40));

        brc_bread_crumbs();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          v50 = *(_QWORD *)(a1 + 40);
          v51 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 138413058;
          v57 = v50;
          v58 = 2048;
          v59 = v51;
          v60 = 2048;
          v61 = v35;
          v62 = 2112;
          v63 = v46;
          _os_log_debug_impl(&dword_230455000, v47, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: resume upload for doc with objectID %@ because document is needs-sync-up but not tracked yet (versionSize: %lld, transferSize: %lld)%@", buf, 0x2Au);
        }

      }
      break;
    default:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "versionSizes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        if (*(_DWORD *)(a1 + 60) == 4)
        {
          v19 = objc_msgSend(v18, "longLongValue");
          if (105 * v19 / 100 == v19)
            v20 = 1;
          else
            v20 = 105 * v19 / 100 - v19;
          if (v20 <= 0)
          {
            brc_bread_crumbs();
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
              __37__BRCGlobalProgress__updateDocument___block_invoke_cold_1();

          }
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setSumOfCompletedUnitCountDelta:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "sumOfCompletedUnitCountDelta") + v20);
          brc_bread_crumbs();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          brc_notifications_log();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v52 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138412802;
            v57 = v52;
            v58 = 2048;
            v59 = v20;
            v60 = 2112;
            v61 = (uint64_t)v21;
            _os_log_debug_impl(&dword_230455000, v22, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: stop tracking upload for doc with objectID %@ because document is idle (syncUpSize: %lld)%@", buf, 0x20u);
          }

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "versionSizes");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "outOfQuotaObjIDs");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "removeObject:", *(_QWORD *)(a1 + 40));

          br_pacer_signal();
        }
        else
        {
          brc_bread_crumbs();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          brc_notifications_log();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
            __37__BRCGlobalProgress__updateDocument___block_invoke_cold_2((uint64_t *)(a1 + 40));

          objc_msgSend(*(id *)(a1 + 32), "_cancelUploadForObjectID:inState:willRetryTransfer:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 60), 0);
        }
      }
LABEL_46:

      break;
  }
}

- (void)_deleteDocument:(id)a3 reason:(char)a4
{
  -[BRCGlobalProgress _deleteDocument:reason:sync:](self, "_deleteDocument:reason:sync:", a3, a4, 1);
}

- (void)_deleteDocument:(id)a3 reason:(char)a4 sync:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *queue;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  int v19;
  char v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(v8, "orig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileObjectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "orig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "syncUpState");
  if (objc_msgSend(v10, "rawID"))
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __49__BRCGlobalProgress__deleteDocument_reason_sync___block_invoke;
    v17[3] = &unk_24FE45C70;
    v17[4] = self;
    v18 = v10;
    v20 = a4;
    v19 = v12;
    v13 = (void *)MEMORY[0x2348BA0DC](v17);
    queue = self->_queue;
    if (v5)
      dispatch_sync(queue, v13);
    else
      dispatch_async(queue, v13);

  }
  else
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v10;
      v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_230455000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Progress: can't delete document from progress without an objectID %@%@", buf, 0x16u);
    }

  }
}

void __49__BRCGlobalProgress__deleteDocument_reason_sync___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "versionSizes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = 138412802;
      v8 = v6;
      v9 = 2080;
      v10 = BRCPrettyPrintEnum();
      v11 = 2112;
      v12 = v4;
      _os_log_debug_impl(&dword_230455000, v5, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: stop tracking upload progress of doc with objectID %@ (reason: %s)%@", (uint8_t *)&v7, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_cancelUploadForObjectID:inState:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
  }
}

- (BRCAccountSessionFPFS)session
{
  return (BRCAccountSessionFPFS *)objc_loadWeakRetained((id *)&self->_session);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_uploads, 0);
  objc_storeStrong((id *)&self->_globalProgressMultiplex, 0);
  objc_storeStrong((id *)&self->_operationTimer, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_resumeTracker, 0);
  objc_storeStrong((id *)&self->_updatePacer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __44__BRCGlobalProgress_resumeProgressForZones___block_invoke_cold_1()
{
  NSObject *v0;
  id *v1;
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_14();
  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*v1, "count");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, v2, "[NOTIF] Progress: started resuming progress for %lu zones%@", v3);
}

void __44__BRCGlobalProgress_resumeProgressForZones___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !self->_resumeTracker%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __44__BRCGlobalProgress_resumeProgressForZones___block_invoke_121_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[NOTIF] Progress: finished resuming progresses%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)didUpdateDocument:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "fileObjectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, v3, "[NOTIF] Progress: doc %@ was reparented outside the visible scope of iCloud Drive, force deletion%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)didUpdateDocument:.cold.2()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "fileObjectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, v3, "[NOTIF] Progress: doc %@ is now dead, force deletion%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)didDeleteDocument:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __43__BRCGlobalProgress_stopPublishingProgress__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[NOTIF] Progress: stop publishing global progress%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)addProgress:forDocument:inGroup:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: group == BRCProgressUploadGroup || group == BRCProgressDownloadGroup%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)addProgress:forDocument:inGroup:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: progress%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)addProgress:forDocument:inGroup:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: group == BRCProgressUploadGroup%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)updateUploadThrottleForDocument:(uint64_t)a1 toState:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = 0;
  v4 = 2112;
  v5 = a1;
  _os_log_fault_impl(&dword_230455000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't update progress for document without an objectID %@%@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_0();
}

- (void)_stopObservingProgress:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: progressGroup%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_stopObservingProgress:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: objID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_10_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Invalid suspend count (_operationTimerSuspendCount: %u)%@");
  OUTLINED_FUNCTION_0();
}

- (void)_createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _operationTimer%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !group || BRCProgressGroupPrettyPrint(group.intValue)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: (!group && totalUnitCount >= 0) || totalUnitCount > 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: completedUnitCount >= 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _globalProgressMultiplex == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_createUploadMetadataWithCompletedUnitCount:totalUnitCount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[NOTIF] Progress: take over current progress because uploads have priority%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_createUploadMetadataWithCompletedUnitCount:totalUnitCount:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: totalUnitCount >= completedUnitCount%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_createUploadMetadataWithCompletedUnitCount:totalUnitCount:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _uploads == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_cancelUploadForObjectID:inState:willRetryTransfer:pendingQuota:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: objectID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_cancelUploadForObjectID:inState:willRetryTransfer:pendingQuota:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, (uint64_t)v0, "[NOTIF] Progress: upload progress for doc with objectID %@ has no previous completed unit count%@", v1);
  OUTLINED_FUNCTION_0();
}

- (void)_cancelUploadForObjectID:inState:willRetryTransfer:pendingQuota:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: versionSize%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_destroyProgressInGroup:reason:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _uploads.outOfQuotaObjIDs.count == 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_destroyProgressInGroup:reason:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _uploads.previousUnitCounts.count == 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_destroyProgressInGroup:reason:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _uploads.childProgresses.count == 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_destroyProgressInGroup:reason:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _uploads.versionSizes.count == 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_destroyProgressInGroup:reason:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _downloads.resumeUnitCounts.count == 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_destroyProgressInGroup:reason:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _downloads.previousUnitCounts.count == 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_destroyProgressInGroup:reason:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _downloads.childProgresses.count == 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_destroyProgressInGroup:reason:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _downloads.versionSizes.count == 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_destroyProgressInGroup:reason:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: transferInfo.sumOfTotalUnitCountDelta == 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_destroyProgressInGroup:reason:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: transferInfo.sumOfCompletedUnitCountDelta == 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_updateDocument:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, (uint64_t)v0, "[NOTIF] Progress: ignore upload for doc with objectID %@ because its version size is equal to zero.%@", v1);
  OUTLINED_FUNCTION_0();
}

- (void)_updateDocument:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: can't register progress for item without an objectID %@%@");
  OUTLINED_FUNCTION_0();
}

void __37__BRCGlobalProgress__updateDocument___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: syncUpSize > 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __37__BRCGlobalProgress__updateDocument___block_invoke_cold_2(uint64_t *a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_230455000, v2, (uint64_t)v2, "[NOTIF] Progress: cancelling upload for doc with objectID %@ because its wasn't uploaded%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

void __37__BRCGlobalProgress__updateDocument___block_invoke_cold_3(uint64_t *a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_230455000, v2, (uint64_t)v2, "[NOTIF] Progress: stop tracking upload for doc with objectID %@ because document is in needs-read%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

void __37__BRCGlobalProgress__updateDocument___block_invoke_cold_4(uint64_t *a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_230455000, v2, (uint64_t)v2, "[NOTIF] Progress: cancelling upload for doc with objectID %@ because its needs to be uploaded again%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

@end
