@implementation PLClientLogger

- (id)queryForClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSObject *v10;
  __int128 v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  int v24;
  int v25;
  int v26;
  NSObject *v27;
  __int128 v28;
  _QWORD block[5];
  id v30;
  id v31;
  uint8_t *v32;
  __int16 v33;
  uint8_t buf[8];
  _BYTE v35[32];
  id v36;
  uint64_t v37;

  v6 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  objc_opt_class();
  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[PLClientLogger queryForClientID:withKey:withPayload:].cold.3();

  }
  if (v8 && objc_msgSend(v8, "length"))
  {
    if ((_DWORD)v6 == 50)
    {
      PLLogClientLogging();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[PLClientLogger queryForClientID:withKey:withPayload:].cold.2(v12, v13, v14, v15, v16, v17, v18, v19);

    }
    else
    {
      v24 = 0;
      *(_QWORD *)&v11 = 67110146;
      v28 = v11;
      do
      {
        v25 = -[PLClientLogger blockedPermissionForClientID:withKey:withType:withTimeout:](self, "blockedPermissionForClientID:withKey:withType:withTimeout:", v6, v8, CFSTR("Query"), 2000000000, v28);
        v26 = v25;
        if (!v25)
        {
          v21 = &unk_1E416CA78;
          goto LABEL_15;
        }
        if ((unsigned __int16)v25 == 1)
          goto LABEL_11;
        if (-[PLClientLogger clientDebug](self, "clientDebug"))
        {
          PLLogClientLogging();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v28;
            *(_DWORD *)&buf[4] = v6;
            *(_WORD *)v35 = 2112;
            *(_QWORD *)&v35[2] = v8;
            *(_WORD *)&v35[10] = 2112;
            *(_QWORD *)&v35[12] = v9;
            *(_WORD *)&v35[20] = 1024;
            *(_DWORD *)&v35[22] = v26;
            *(_WORD *)&v35[26] = 1024;
            *(_DWORD *)&v35[28] = v24;
            _os_log_debug_impl(&dword_19EA99000, v27, OS_LOG_TYPE_DEBUG, "queryForClientID:%d withKey:%@ withPayload%@ - keyPermission=%d, retry=%d", buf, 0x28u);
          }

        }
        ++v24;
      }
      while (v24 != 5);
      if (v26 == 3)
      {
        v21 = &unk_1E416CAA0;
        goto LABEL_15;
      }
    }
LABEL_11:
    *(_QWORD *)buf = 0;
    *(_QWORD *)v35 = buf;
    *(_QWORD *)&v35[8] = 0x3032000000;
    *(_QWORD *)&v35[16] = __Block_byref_object_copy__0;
    *(_QWORD *)&v35[24] = __Block_byref_object_dispose__0;
    v36 = 0;
    -[PLClientLogger getWorkQueueForClientID:](self, "getWorkQueueForClientID:", v6);
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__PLClientLogger_queryForClientID_withKey_withPayload___block_invoke;
    block[3] = &unk_1E4166590;
    block[4] = self;
    v33 = v6;
    v30 = v8;
    v31 = v9;
    v32 = buf;
    dispatch_async_and_wait(v20, block);

    v21 = *(id *)(*(_QWORD *)v35 + 40);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    PLLogClientLogging();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[PLClientLogger queryForClientID:withKey:withPayload:].cold.1();

    v21 = 0;
  }
LABEL_15:

  return v21;
}

- (PLClientLogger)init
{
  PLClientLogger *v2;
  PLClientLogger *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *workQueue;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *adaptivePermissionWorkQueue;
  dispatch_queue_t v12;
  OS_dispatch_queue *batchFlushQueue;
  void *v14;
  uint64_t v15;
  NSString *processName;
  uint64_t v17;
  NSMutableDictionary *permissionCache;
  uint64_t v19;
  NSMutableDictionary *pendingTaskCache;
  uint64_t v21;
  NSMutableArray *batchedTaskCache;
  uint64_t v23;
  NSMutableDictionary *dynamicCache;
  void *v25;
  void *v26;
  uint64_t v27;
  NSMutableDictionary *eventFilterSaved;
  uint64_t v29;
  NSSet *batchingClientAllowlist;
  uint64_t v31;
  NSSet *curatedBatchingList;
  uint64_t v33;
  NSSet *batchingKeysAllowlist;
  NSObject *v35;
  dispatch_queue_t v36;
  OS_dispatch_queue *xpcConnectionQueue;
  NSObject *v38;
  dispatch_queue_t v39;
  OS_dispatch_queue *xpcConnectionHelperQueue;
  NSObject *v41;
  NSObject *v42;
  id v43;
  const char *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  uint32_t v48;
  NSObject *v49;
  int v51;
  int v52;
  int out_token;
  objc_super v54;

  v54.receiver = self;
  v54.super_class = (Class)PLClientLogger;
  v2 = -[PLClientLogger init](&v54, sel_init);
  v3 = v2;
  if (v2)
  {
    disableMessageOnDevice = 0;
    v2->_talkToPowerlogHelper = 0;
    PLLogClientLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    v3->_clientDebug = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_BACKGROUND, 0);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = dispatch_queue_create("PLClientLoggingWorkQueue", v6);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("PLClientLoggingAdaptivePermissionWorkQueue", v9);
    adaptivePermissionWorkQueue = v3->_adaptivePermissionWorkQueue;
    v3->_adaptivePermissionWorkQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_create("PLClientLoggingFlushQueue", v6);
    batchFlushQueue = v3->_batchFlushQueue;
    v3->_batchFlushQueue = (OS_dispatch_queue *)v12;

    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "processName");
    v15 = objc_claimAutoreleasedReturnValue();
    processName = v3->_processName;
    v3->_processName = (NSString *)v15;

    v17 = objc_opt_new();
    permissionCache = v3->_permissionCache;
    v3->_permissionCache = (NSMutableDictionary *)v17;

    v19 = objc_opt_new();
    pendingTaskCache = v3->_pendingTaskCache;
    v3->_pendingTaskCache = (NSMutableDictionary *)v19;

    v21 = objc_opt_new();
    batchedTaskCache = v3->_batchedTaskCache;
    v3->_batchedTaskCache = (NSMutableArray *)v21;

    v23 = objc_opt_new();
    dynamicCache = v3->_dynamicCache;
    v3->_dynamicCache = (NSMutableDictionary *)v23;

    v25 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3->_dynamicCache, "setObject:forKeyedSubscript:", v25, CFSTR("kPLDefault"));

    v26 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3->_dynamicCache, "setObject:forKeyedSubscript:", v26, CFSTR("kPLCuratedBatchingListCache"));

    v27 = objc_opt_new();
    eventFilterSaved = v3->_eventFilterSaved;
    v3->_eventFilterSaved = (NSMutableDictionary *)v27;

    *(_WORD *)&v3->_batchedTimerInFlight = 0;
    v3->_batchedDropMessageCount = 0;
    v3->_batchDropMessages = 1;
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E416C508, &unk_1E416C520, &unk_1E416C538, &unk_1E416C550, &unk_1E416C568, &unk_1E416C580, &unk_1E416C598, &unk_1E416C5B0, &unk_1E416C5C8, &unk_1E416C5E0, &unk_1E416C5F8, 0);
    batchingClientAllowlist = v3->_batchingClientAllowlist;
    v3->_batchingClientAllowlist = (NSSet *)v29;

    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("BackgroundProcessing::FeatureCheckpoint"), CFSTR("BackgroundProcessing::SystemConditionsBattery"), CFSTR("BackgroundProcessing::SystemConditionsInUseOrMotion"), CFSTR("BackgroundProcessing::SystemConditionsNetwork"), CFSTR("BackgroundProcessing::SystemConditionsOther"), CFSTR("BackgroundProcessing::SystemConditionsPowerManagement"), CFSTR("BackgroundProcessing::TaskCheckpoint"), CFSTR("BackgroundProcessing::TaskWorkload"), CFSTR("GenerativeFunctionMetrics::SmartReplySession"), CFSTR("GenerativeFunctionMetrics::Summarization"), CFSTR("GenerativeFunctionMetrics::appleDiffusion"), CFSTR("GenerativeFunctionMetrics::assetLoad"), CFSTR("GenerativeFunctionMetrics::mmExecuteRequest"), CFSTR("GenerativeFunctionMetrics::tgiExecuteRequest"), CFSTR("BatteryIntelligence::BatteryHealthDelta"), CFSTR("XPCMetrics::OngoingRestore"), 0);
    curatedBatchingList = v3->_curatedBatchingList;
    v3->_curatedBatchingList = (NSSet *)v31;

    v3->_batchMessagesSentCount = 0;
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("ConfigMetrics::BuddyData"), CFSTR("ApplicationMetrics::RemoteControlSession"), 0);
    batchingKeysAllowlist = v3->_batchingKeysAllowlist;
    v3->_batchingKeysAllowlist = (NSSet *)v33;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = dispatch_queue_create("PLCLientLoggingConnectionQueue", v35);
    xpcConnectionQueue = v3->_xpcConnectionQueue;
    v3->_xpcConnectionQueue = (OS_dispatch_queue *)v36;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = dispatch_queue_create("PLCLientLoggingConnectionHelperQueue", v38);
    xpcConnectionHelperQueue = v3->_xpcConnectionHelperQueue;
    v3->_xpcConnectionHelperQueue = (OS_dispatch_queue *)v39;

    out_token = -1;
    -[PLClientLogger workQueue](v3, "workQueue");
    v41 = objc_claimAutoreleasedReturnValue();
    LODWORD(v38) = notify_register_dispatch("com.apple.powerlog.state_changed", &out_token, v41, &__block_literal_global_76);

    if ((_DWORD)v38 && -[PLClientLogger clientDebug](v3, "clientDebug"))
    {
      PLLogClientLogging();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        -[PLClientLogger init].cold.3();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.ProcessName.%@"), CFSTR("com.apple.powerlog.state_changed"), v3->_processName);
    v52 = -1;
    v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v44 = (const char *)objc_msgSend(v43, "UTF8String");
    -[PLClientLogger workQueue](v3, "workQueue");
    v45 = objc_claimAutoreleasedReturnValue();
    LODWORD(v44) = notify_register_dispatch(v44, &v52, v45, &__block_literal_global_83);

    if ((_DWORD)v44 && -[PLClientLogger clientDebug](v3, "clientDebug"))
    {
      PLLogClientLogging();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        -[PLClientLogger init].cold.2();

    }
    v51 = -1;
    -[PLClientLogger workQueue](v3, "workQueue");
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = notify_register_dispatch("com.apple.powerlog.clientPermissionState", &v51, v47, &__block_literal_global_86);

    if (v48 && -[PLClientLogger clientDebug](v3, "clientDebug"))
    {
      PLLogClientLogging();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        -[PLClientLogger init].cold.1();

    }
  }
  return v3;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)addToBatchedTaskCacheForType:(id)a3 forClientID:(signed __int16)a4 forKey:(id)a5 withPayload:(id)a6
{
  void *v6;
  uint64_t v9;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;

  v9 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  objc_sync_enter(CFSTR("___BatchCacheSync___"));
  if ((_DWORD)v9 != 110)
  {
    -[PLClientLogger batchedTaskCache](self, "batchedTaskCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v15 = -[PLClientLogger batchSizeForClientID:](self, "batchSizeForClientID:", v9);
    if ((_DWORD)v9 != 110)
      goto LABEL_15;
    goto LABEL_6;
  }
  -[PLClientLogger cacheForKey:](self, "cacheForKey:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLClientLogger curatedBatchingList](self, "curatedBatchingList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsObject:", v12) & 1) == 0)
    goto LABEL_5;
  v15 = 30;
LABEL_6:

  -[PLClientLogger curatedBatchingList](self, "curatedBatchingList");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsObject:", v12);

  if (v17)
  {
    if (-[PLClientLogger batchDropMessages](self, "batchDropMessages")
      && objc_msgSend(v14, "count") >= (unint64_t)v15)
    {
      if (-[PLClientLogger batchMessagesSentCount](self, "batchMessagesSentCount") < 4)
      {
        PLLogClientLogging();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          LOWORD(v26) = 0;
          _os_log_impl(&dword_19EA99000, v23, OS_LOG_TYPE_INFO, "Dynamic cache reached the limit, flushing cache now", (uint8_t *)&v26, 2u);
        }

        -[PLClientLogger setBatchMessagesSentCount:](self, "setBatchMessagesSentCount:", -[PLClientLogger batchMessagesSentCount](self, "batchMessagesSentCount") + 1);
        -[PLClientLogger sendBatchToPPS](self, "sendBatchToPPS");
        -[PLClientLogger clearBatchedTaskCachePPS](self, "clearBatchedTaskCachePPS");
        -[PLClientLogger cacheForKey:](self, "cacheForKey:", v12);
        v18 = v14;
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v14, "lastObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        PLLogClientLogging();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v26 = 138412290;
          v27 = v18;
          _os_log_impl(&dword_19EA99000, v19, OS_LOG_TYPE_INFO, "Dynamic cache reached the limit, unable to flush, dropping last event %@", (uint8_t *)&v26, 0xCu);
        }

        if (objc_msgSend(v12, "isEqualToString:", CFSTR("XPCMetrics::OngoingRestore")))
          AnalyticsSendEventLazy();
        objc_msgSend(v14, "removeLastObject");
      }

    }
    goto LABEL_27;
  }
LABEL_15:
  if (-[PLClientLogger batchDropMessages](self, "batchDropMessages")
    && objc_msgSend(v14, "count") >= (unint64_t)v15)
  {
    PLLogClientLogging();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v14, "lastObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412290;
      v27 = v21;
      _os_log_impl(&dword_19EA99000, v20, OS_LOG_TYPE_INFO, "Hit the cache limit, dropping last event:  %@", (uint8_t *)&v26, 0xCu);

    }
    objc_msgSend(v14, "removeLastObject");
    if ((_DWORD)v9 == 110)
      v22 = -[PLClientLogger batchedDropMessageCount](self, "batchedDropMessageCount");
    else
      v22 = -[PLClientLogger batchedDropMessageCount](self, "batchedDropMessageCount") + 1;
    -[PLClientLogger setBatchedDropMessageCount:](self, "setBatchedDropMessageCount:", v22);
  }
LABEL_27:
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", v13, 1);
  -[PLClientLogger buildMessageForClientID:withKey:withPayload:](self, "buildMessageForClientID:withKey:withPayload:", v9, v12, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("Post"));
  objc_msgSend(v14, "addObject:", v25);

  objc_sync_exit(CFSTR("___BatchCacheSync___"));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_5);
  return (id)sharedInstance__clientLogger;
}

+ (BOOL)isMessageOnDeviceDisabled
{
  if (isMessageOnDeviceDisabled_onceToken != -1)
    dispatch_once(&isMessageOnDeviceDisabled_onceToken, &__block_literal_global_3_0);
  return disableMessageOnDevice;
}

- (void)logForClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  uint64_t v10;
  int v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  int v18;
  __int16 v19;
  _BYTE v20[24];
  uint64_t v21;

  v6 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  objc_opt_class();
  if (v9 && (v10 = objc_msgSend(v9, "count"), v8) && v10 && objc_msgSend(v8, "length"))
  {
    if ((_DWORD)v6 == 110)
      goto LABEL_29;
    v11 = -[PLClientLogger blockedPermissionForClientID:withKey:withType:withTimeout:](self, "blockedPermissionForClientID:withKey:withType:withTimeout:", v6, v8, CFSTR("Post"), 0);
    if (!v11)
      goto LABEL_17;
    v12 = v11;
    if (v11 == 1)
    {
LABEL_29:
      if (-[PLClientLogger clientDebug](self, "clientDebug"))
      {
        PLLogClientLogging();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          v17 = 67109634;
          v18 = v6;
          v19 = 2112;
          *(_QWORD *)v20 = v8;
          *(_WORD *)&v20[8] = 2112;
          *(_QWORD *)&v20[10] = v9;
          _os_log_debug_impl(&dword_19EA99000, v15, OS_LOG_TYPE_DEBUG, "logForClientID: sending xpc message for client id: %d withKey:%@ withPayload:%@ dispatching...", (uint8_t *)&v17, 0x1Cu);
        }

      }
      -[PLClientLogger xpcSendMessageWithRateLimitingforClient:withKey:withPayload:](self, "xpcSendMessageWithRateLimitingforClient:withKey:withPayload:", v6, v8, v9);
    }
    else if (v11 == 3)
    {
      if (-[PLClientLogger clientDebug](self, "clientDebug"))
      {
        PLLogClientLogging();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v17 = 67109634;
          v18 = v6;
          v19 = 2112;
          *(_QWORD *)v20 = v8;
          *(_WORD *)&v20[8] = 2112;
          *(_QWORD *)&v20[10] = v9;
          _os_log_debug_impl(&dword_19EA99000, v13, OS_LOG_TYPE_DEBUG, "logForClientID: %d withKey:%@ withPayload:%@ caching...", (uint8_t *)&v17, 0x1Cu);
        }

      }
      -[PLClientLogger addToPendingTaskCacheForType:forClientID:forKey:withPayload:](self, "addToPendingTaskCacheForType:forClientID:forKey:withPayload:", CFSTR("Post"), v6, v8, v9);
    }
    else if (-[PLClientLogger clientDebug](self, "clientDebug"))
    {
      PLLogClientLogging();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = 67109890;
        v18 = v12;
        v19 = 1024;
        *(_DWORD *)v20 = v6;
        *(_WORD *)&v20[4] = 2112;
        *(_QWORD *)&v20[6] = v8;
        *(_WORD *)&v20[14] = 2112;
        *(_QWORD *)&v20[16] = v9;
        _os_log_debug_impl(&dword_19EA99000, v16, OS_LOG_TYPE_DEBUG, "logForClientID: Unknown Permission %d - for client id:%d withKey:%@ withPayload:%@", (uint8_t *)&v17, 0x22u);
      }

    }
  }
  else
  {
    PLLogClientLogging();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[PLClientLogger logForClientID:withKey:withPayload:].cold.1();

  }
LABEL_17:

}

- (signed)blockedPermissionForClientID:(signed __int16)a3 withKey:(id)a4 withType:(id)a5 withTimeout:(unint64_t)a6
{
  uint64_t v8;
  id v10;
  id v11;
  dispatch_semaphore_t v12;
  NSObject *v13;
  dispatch_time_t v14;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  __int16 v22;

  v8 = a3;
  v10 = a4;
  v11 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 3;
  v12 = dispatch_semaphore_create(0);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__PLClientLogger_blockedPermissionForClientID_withKey_withType_withTimeout___block_invoke;
  v16[3] = &unk_1E4166518;
  v18 = &v19;
  v13 = v12;
  v17 = v13;
  -[PLClientLogger permissionForClientID:withKey:withType:completion:](self, "permissionForClientID:withKey:withType:completion:", v8, v10, v11, v16);
  v14 = dispatch_time(0, a6);
  dispatch_semaphore_wait(v13, v14);
  LOWORD(a6) = *((_WORD *)v20 + 12);

  _Block_object_dispose(&v19, 8);
  return a6;
}

- (void)permissionForClientID:(signed __int16)a3 withKey:(id)a4 withType:(id)a5 completion:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  __int16 v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v8 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = -[PLClientLogger cachedPermissionForClientID:withKey:withType:](self, "cachedPermissionForClientID:withKey:withType:", v8, v10, v11);
  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109890;
      v29 = v8;
      v30 = 2112;
      v31 = v10;
      v32 = 2112;
      v33 = v11;
      v34 = 1024;
      v35 = v13;
      _os_log_debug_impl(&dword_19EA99000, v14, OS_LOG_TYPE_DEBUG, "permissionForClientID: permissionForClientId: %hd withKey:%@ withType:%@ returnValue=%hd", buf, 0x22u);
    }

  }
  if ((_DWORD)v13 == 2)
  {
    -[PLClientLogger setCachePermission:ForClientID:withKey:withType:](self, "setCachePermission:ForClientID:withKey:withType:", 3, v8, v10, v11);
    -[PLClientLogger adaptivePermissionWorkQueue](self, "adaptivePermissionWorkQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__PLClientLogger_permissionForClientID_withKey_withType_completion___block_invoke;
    block[3] = &unk_1E41664F0;
    block[4] = self;
    v27 = v8;
    v24 = v10;
    v25 = v11;
    v26 = v12;
    dispatch_async(v15, block);

  }
  else
  {
    if (-[PLClientLogger clientDebug](self, "clientDebug"))
    {
      PLLogClientLogging();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[PLClientLogger permissionForClientID:withKey:withType:completion:].cold.1(v13, v16, v17, v18, v19, v20, v21, v22);

    }
    (*((void (**)(id, uint64_t))v12 + 2))(v12, v13);
  }

}

- (signed)cachedPermissionForClientID:(signed __int16)a3 withKey:(id)a4 withType:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  NSObject *v23;
  id v24;
  const char *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  signed __int16 v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *context;
  int out_token[2];
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;
  _BYTE v61[24];
  uint64_t v62;

  v6 = a3;
  v62 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(CFSTR("___CacheSync___"));
  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[PLClientLogger permissionCache](self, "permissionCache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLClientLogger cachedPermissionForClientID:withKey:withType:].cold.3(v12, (uint64_t)v61, v11);
    }

  }
  -[PLClientLogger permissionCache](self, "permissionCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v15)
  {
    v16 = (void *)objc_opt_new();
    -[PLClientLogger permissionCache](self, "permissionCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v9);

  }
  -[PLClientLogger permissionCache](self, "permissionCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 == 0;

  if (v21)
  {
    context = (void *)MEMORY[0x1A1AECD98]();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.ClientID.%d"), CFSTR("com.apple.powerlog.state_changed"), (int)v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PLClientLogger clientDebug](self, "clientDebug"))
    {
      PLLogClientLogging();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[PLClientLogger cachedPermissionForClientID:withKey:withType:].cold.2();

    }
    out_token[0] = -1;
    v24 = objc_retainAutorelease(v22);
    v25 = (const char *)objc_msgSend(v24, "UTF8String");
    -[PLClientLogger workQueue](self, "workQueue");
    v26 = objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = notify_register_dispatch(v25, out_token, v26, &__block_literal_global_103);

    v27 = (void *)objc_opt_new();
    -[PLClientLogger permissionCache](self, "permissionCache");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", v9);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v27, v10);

    if ((_DWORD)v25)
    {
      if (!-[PLClientLogger clientDebug](self, "clientDebug"))
      {
LABEL_18:

        objc_autoreleasePoolPop(context);
        goto LABEL_19;
      }
      PLLogClientLogging();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        -[PLClientLogger cachedPermissionForClientID:withKey:withType:].cold.1();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token[0]);
      v30 = objc_claimAutoreleasedReturnValue();
      -[PLClientLogger permissionCache](self, "permissionCache");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", v9);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", v10);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v30, CFSTR("PLClientPermissionToken"));

    }
    goto LABEL_18;
  }
LABEL_19:
  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      -[PLClientLogger permissionCache](self, "permissionCache");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "objectForKeyedSubscript:", v9);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectForKeyedSubscript:", v10);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "objectForKeyedSubscript:", v8);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      out_token[0] = 67109890;
      out_token[1] = v6;
      v55 = 2112;
      v56 = v8;
      v57 = 2112;
      v58 = v9;
      v59 = 2112;
      v60 = v52;
      _os_log_debug_impl(&dword_19EA99000, v34, OS_LOG_TYPE_DEBUG, "cachePermissionForClientID: %d withKey:%@ withType:%@ - Return=%@", (uint8_t *)out_token, 0x26u);

    }
  }
  -[PLClientLogger permissionCache](self, "permissionCache");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", v9);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "objectForKeyedSubscript:", v10);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectForKeyedSubscript:", v8);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38 == 0;

  if (v39)
  {
    -[PLClientLogger permissionCache](self, "permissionCache");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKeyedSubscript:", v9);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKeyedSubscript:", v10);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setObject:forKeyedSubscript:", &unk_1E416C610, v8);

  }
  -[PLClientLogger permissionCache](self, "permissionCache");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "objectForKeyedSubscript:", v9);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "objectForKeyedSubscript:", v10);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "objectForKeyedSubscript:", v8);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "shortValue");

  objc_sync_exit(CFSTR("___CacheSync___"));
  return v47;
}

- (BOOL)clientDebug
{
  return self->_clientDebug;
}

- (NSMutableDictionary)permissionCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

intptr_t __76__PLClientLogger_blockedPermissionForClientID_withKey_withType_withTimeout___block_invoke(uint64_t a1, __int16 a2)
{
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSMutableArray)batchedTaskCache
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (id)buildMessageForClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  objc_sync_enter(CFSTR("___BuildMessageSync___"));
  v10 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("clientID"));

  if (v8)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("event"));
  if (v9)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("content"));
  -[PLClientLogger processName](self, "processName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("process-name"));

  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[PLClientLogger buildMessageForClientID:withKey:withPayload:].cold.1();

  }
  objc_sync_exit(CFSTR("___BuildMessageSync___"));

  return v10;
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)xpcSendMessageWithRateLimitingforClient:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  dispatch_time_t v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v22[5];
  _QWORD v23[5];
  id v24;
  id v25;
  __int16 v26;
  _QWORD block[5];
  id v28;
  id v29;
  __int16 v30;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  -[PLClientLogger batchingClientAllowlist](self, "batchingClientAllowlist");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "containsObject:", v11);

  -[PLClientLogger batchingKeysAllowlist](self, "batchingKeysAllowlist");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", v8);

  v15 = -[PLClientLogger talkToPowerlogHelper](self, "talkToPowerlogHelper");
  if (-[PLClientLogger forceBatching](self, "forceBatching") || !(v15 | v14 | v12))
  {
    if (-[PLClientLogger clientDebug](self, "clientDebug"))
    {
      PLLogClientLogging();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[PLClientLogger xpcSendMessageWithRateLimitingforClient:withKey:withPayload:].cold.1();

    }
    objc_sync_enter(CFSTR("___BatchCacheSync___"));
    if (!-[PLClientLogger batchedTimerInFlight](self, "batchedTimerInFlight"))
    {
      -[PLClientLogger setBatchedTimerInFlight:](self, "setBatchedTimerInFlight:", 1);
      v19 = dispatch_time(0, 5000000000);
      -[PLClientLogger batchFlushQueue](self, "batchFlushQueue");
      v20 = objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __78__PLClientLogger_xpcSendMessageWithRateLimitingforClient_withKey_withPayload___block_invoke_144;
      v22[3] = &unk_1E4165E90;
      v22[4] = self;
      dispatch_after(v19, v20, v22);

    }
    objc_sync_exit(CFSTR("___BatchCacheSync___"));
    -[PLClientLogger addToBatchedTaskCacheForType:forClientID:forKey:withPayload:](self, "addToBatchedTaskCacheForType:forClientID:forKey:withPayload:", CFSTR("Post"), v6, v8, v9);
  }
  else
  {
    if ((_DWORD)v6 == 58)
    {
      -[PLClientLogger getWorkQueueForClientID:](self, "getWorkQueueForClientID:", 58);
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __78__PLClientLogger_xpcSendMessageWithRateLimitingforClient_withKey_withPayload___block_invoke;
      block[3] = &unk_1E4166568;
      block[4] = self;
      v30 = 58;
      v28 = v8;
      v29 = v9;
      dispatch_async_and_wait(v16, block);

      v17 = v28;
    }
    else
    {
      -[PLClientLogger getWorkQueueForClientID:](self, "getWorkQueueForClientID:", v6);
      v21 = objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __78__PLClientLogger_xpcSendMessageWithRateLimitingforClient_withKey_withPayload___block_invoke_143;
      v23[3] = &unk_1E4166568;
      v23[4] = self;
      v26 = v6;
      v24 = v8;
      v25 = v9;
      dispatch_async(v21, v23);

      v17 = v24;
    }

  }
}

- (BOOL)talkToPowerlogHelper
{
  return self->_talkToPowerlogHelper;
}

- (BOOL)forceBatching
{
  return self->_forceBatching;
}

- (NSSet)batchingClientAllowlist
{
  return (NSSet *)objc_getProperty(self, a2, 120, 1);
}

- (int)batchSizeForClientID:(signed __int16)a3
{
  _QWORD block[4];
  signed __int16 v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PLClientLogger_batchSizeForClientID___block_invoke;
  block[3] = &__block_descriptor_34_e5_v8__0l;
  v5 = a3;
  if (batchSizeForClientID__onceToken != -1)
    dispatch_once(&batchSizeForClientID__onceToken, block);
  if (batchSizeForClientID__batchSize)
    return 60;
  else
    return 20;
}

- (BOOL)batchDropMessages
{
  return self->_batchDropMessages;
}

- (BOOL)batchedTimerInFlight
{
  return self->_batchedTimerInFlight;
}

- (void)setBatchedTimerInFlight:(BOOL)a3
{
  self->_batchedTimerInFlight = a3;
}

- (OS_dispatch_queue)batchFlushQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBatchedDropMessageCount:(int)a3
{
  self->_batchedDropMessageCount = a3;
}

- (int)batchedDropMessageCount
{
  return self->_batchedDropMessageCount;
}

void __68__PLClientLogger_permissionForClientID_withKey_withType_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  _BYTE v27[14];
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "buildMessageForClientID:withKey:withPayload:", *(__int16 *)(a1 + 64), *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("shouldLog"));
  objc_msgSend(*(id *)(a1 + 32), "xpcSendMessageWithReply:withClientID:withKey:withPayload:", v2, *(__int16 *)(a1 + 64), *(_QWORD *)(a1 + 40), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "clientDebug"))
  {
    PLLogClientLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __68__PLClientLogger_permissionForClientID_withKey_withType_completion___block_invoke_cold_2();

  }
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("shouldLog"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "shortValue");

    objc_msgSend(*(id *)(a1 + 32), "setCachePermission:ForClientID:withKey:withType:", v6, *(__int16 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setCachePermission:ForClientID:withKey:withType:", 2, *(__int16 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    LODWORD(v6) = 3;
  }
  objc_msgSend(*(id *)(a1 + 32), "pendingTasksForType:forClientID:forKey:", *(_QWORD *)(a1 + 48), *(__int16 *)(a1 + 64), *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "clientDebug"))
  {
    PLLogClientLogging();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v16 = *(__int16 *)(a1 + 64);
      v17 = *(_QWORD *)(a1 + 40);
      v18 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)v27 = v16;
      *(_WORD *)&v27[4] = 2112;
      *(_QWORD *)&v27[6] = v17;
      v28 = 2112;
      v29 = v18;
      v30 = 2112;
      v31 = v2;
      v32 = 2112;
      v33 = v3;
      v34 = 2112;
      v35 = v7;
      _os_log_debug_impl(&dword_19EA99000, v8, OS_LOG_TYPE_DEBUG, "permissionForClientID:%d withKey:%@ withType:%@\nquery=%@\n\nresult=%@\n\npending=%@", buf, 0x3Au);
    }

  }
  if ((_DWORD)v6 == 1)
  {
    if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("Post")))
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v9 = v7;
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v10)
      {
        v11 = v10;
        v19 = v3;
        v20 = v2;
        v12 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v22 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
            if (objc_msgSend(*(id *)(a1 + 32), "clientDebug"))
            {
              PLLogClientLogging();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v27 = v14;
                _os_log_debug_impl(&dword_19EA99000, v15, OS_LOG_TYPE_DEBUG, "permissionForClientID: logging %@", buf, 0xCu);
              }

            }
            objc_msgSend(*(id *)(a1 + 32), "logForClientID:withKey:withPayload:", *(__int16 *)(a1 + 64), *(_QWORD *)(a1 + 40), v14);
          }
          v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v11);
        v3 = v19;
        v2 = v20;
      }
LABEL_30:

      goto LABEL_31;
    }
    if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("Query"))
      && objc_msgSend(*(id *)(a1 + 32), "clientDebug"))
    {
      PLLogClientLogging();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __68__PLClientLogger_permissionForClientID_withKey_withType_completion___block_invoke_cold_1();
      goto LABEL_30;
    }
  }
LABEL_31:

}

- (void)setCachePermission:(signed __int16)a3 ForClientID:(signed __int16)a4 withKey:(id)a5 withType:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _DWORD v18[2];
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v7 = a4;
  v8 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v18[0] = 67109890;
      v18[1] = v8;
      v19 = 1024;
      v20 = v7;
      v21 = 2112;
      v22 = v10;
      v23 = 2112;
      v24 = v11;
      _os_log_debug_impl(&dword_19EA99000, v12, OS_LOG_TYPE_DEBUG, "setCachePermission:%d ForClientID:%d withKey:%@ withType:%@", (uint8_t *)v18, 0x22u);
    }

  }
  objc_sync_enter(CFSTR("___CacheSync___"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLClientLogger permissionCache](self, "permissionCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, v10);

  objc_sync_exit(CFSTR("___CacheSync___"));
}

- (id)xpcSendMessageWithReply:(id)a3 withClientID:(signed __int16)a4 withKey:(id)a5 withPayload:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  _xpc_connection_s *v15;
  NSObject *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL4 v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v39;
  void *v40;
  int v41;
  id v42;
  __int16 v43;
  NSObject *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v8 = a4;
  v47 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:](self, "xpcConnectionWithClientID:withKey:withPayload:", v8, v11, v12);
      v39 = objc_claimAutoreleasedReturnValue();
      v41 = 138412546;
      v42 = v10;
      v43 = 2112;
      v44 = v39;
      _os_log_debug_impl(&dword_19EA99000, v13, OS_LOG_TYPE_DEBUG, "xpcSendMessageWithReply: waiting for replay to message %@, xpcConnection=%@", (uint8_t *)&v41, 0x16u);

    }
  }
  v14 = (void *)_CFXPCCreateXPCMessageWithCFObject();
  if (v14)
  {
    -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:](self, "xpcConnectionWithClientID:withKey:withPayload:", v8, v11, v12);
    v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v16 = xpc_connection_send_message_with_reply_sync(v15, v14);

    if (-[PLClientLogger clientDebug](self, "clientDebug"))
    {
      PLLogClientLogging();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:](self, "xpcConnectionWithClientID:withKey:withPayload:", v8, v11, v12);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 138412802;
        v42 = v14;
        v43 = 2112;
        v44 = v16;
        v45 = 2112;
        v46 = v40;
        _os_log_debug_impl(&dword_19EA99000, v17, OS_LOG_TYPE_DEBUG, "xpcSendMessageWithReply: xpcMessage=%@, xpcResponse=%@, xpcConnection=%@", (uint8_t *)&v41, 0x20u);

      }
    }
    v18 = -[PLClientLogger clientDebug](self, "clientDebug");
    if (v16)
    {
      if (v18)
      {
        PLLogClientLogging();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[PLClientLogger xpcSendMessageWithReply:withClientID:withKey:withPayload:].cold.8();

      }
      xpc_dictionary_get_value(v16, (const char *)objc_msgSend(CFSTR("PLXPCConnectionReturnDict"), "UTF8String"));
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = -[PLClientLogger clientDebug](self, "clientDebug");
      if (v20)
      {
        if (v21)
        {
          PLLogClientLogging();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            -[PLClientLogger xpcSendMessageWithReply:withClientID:withKey:withPayload:].cold.7();

        }
        v23 = _CFXPCCreateCFObjectFromXPCMessage();
        -[NSObject objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("PLXPCClientDebug"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          -[NSObject objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("PLXPCClientDebug"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "BOOLValue");

          PLLogClientLogging();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            -[PLClientLogger xpcSendMessageWithReply:withClientID:withKey:withPayload:].cold.6(v26, v27, v28, v29, v30, v31, v32, v33);

          -[PLClientLogger setClientDebug:](self, "setClientDebug:", v26);
        }
        v34 = -[PLClientLogger clientDebug](self, "clientDebug");
        if (v23)
        {
          if (v34)
          {
            PLLogClientLogging();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              -[PLClientLogger xpcSendMessageWithReply:withClientID:withKey:withPayload:].cold.5();

          }
          v23 = v23;
          v36 = v23;
        }
        else
        {
          if (v34)
          {
            PLLogClientLogging();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              -[PLClientLogger xpcSendMessageWithReply:withClientID:withKey:withPayload:].cold.4();

          }
          v36 = 0;
        }
LABEL_48:

        goto LABEL_49;
      }
      if (v21)
      {
        PLLogClientLogging();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          -[PLClientLogger xpcSendMessageWithReply:withClientID:withKey:withPayload:].cold.3();
        v36 = 0;
        goto LABEL_48;
      }
LABEL_42:
      v36 = 0;
LABEL_49:

      goto LABEL_50;
    }
    if (v18)
    {
      PLLogClientLogging();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[PLClientLogger xpcSendMessageWithReply:withClientID:withKey:withPayload:].cold.2();
      goto LABEL_42;
    }
LABEL_36:
    v36 = 0;
LABEL_50:

    goto LABEL_51;
  }
  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[PLClientLogger xpcSendMessageWithReply:withClientID:withKey:withPayload:].cold.1();
    goto LABEL_36;
  }
  v36 = 0;
LABEL_51:

  return v36;
}

- (void)xpcSendMessage:(id)a3 withClientID:(signed __int16)a4 withKey:(id)a5 withPayload:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[PLClientLogger xpcSendMessage:withClientID:withKey:withPayload:].cold.2();

  }
  v14 = (void *)_CFXPCCreateXPCMessageWithCFObject();
  if (v14)
  {
    -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:](self, "xpcConnectionWithClientID:withKey:withPayload:", v8, v11, v12);
    v15 = objc_claimAutoreleasedReturnValue();
    xpc_connection_send_notification();
LABEL_10:

    goto LABEL_11;
  }
  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[PLClientLogger xpcSendMessage:withClientID:withKey:withPayload:].cold.1();
    goto LABEL_10;
  }
LABEL_11:

}

- (id)xpcConnectionWithClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  OS_xpc_object **p_xpcConnectionHelper;
  OS_xpc_object *xpcConnectionHelper;
  _BOOL4 v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  OS_xpc_object *mach_service;
  OS_xpc_object *v22;
  OS_xpc_object *v23;
  NSObject *v24;
  OS_xpc_object *xpcConnection;
  _BOOL4 v26;
  NSObject *v27;
  NSObject *v28;
  OS_xpc_object *v29;
  OS_xpc_object *v30;
  OS_xpc_object *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  OS_xpc_object *v39;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, void *);
  void *v44;
  PLClientLogger *v45;
  id v46;
  id v47;
  __int16 v48;
  _QWORD handler[5];
  id v50;
  id v51;
  __int16 v52;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  if ((v6 & 0xFFFFFFFD) == 0x30 || -[PLClientLogger talkToPowerlogHelper](self, "talkToPowerlogHelper"))
  {
    p_xpcConnectionHelper = &self->_xpcConnectionHelper;
    xpcConnectionHelper = self->_xpcConnectionHelper;
    v12 = -[PLClientLogger clientDebug](self, "clientDebug");
    if (xpcConnectionHelper)
    {
      if (v12)
      {
        PLLogClientLogging();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:].cold.3(v6, v13, v14, v15, v16, v17, v18, v19);
LABEL_33:

      }
    }
    else
    {
      if (v12)
      {
        PLLogClientLogging();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:].cold.2((uint64_t)self, v6, v20);

      }
      mach_service = xpc_connection_create_mach_service("com.apple.powerlogHelperd.XPCService.xpc", (dispatch_queue_t)self->_xpcConnectionQueue, 0);
      v22 = self->_xpcConnectionHelper;
      self->_xpcConnectionHelper = mach_service;

      v23 = self->_xpcConnectionHelper;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke;
      handler[3] = &unk_1E41664C8;
      handler[4] = self;
      v52 = v6;
      v50 = v8;
      v51 = v9;
      xpc_connection_set_event_handler(v23, handler);
      xpc_connection_activate(self->_xpcConnectionHelper);
      if (-[PLClientLogger clientDebug](self, "clientDebug"))
      {
        PLLogClientLogging();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:].cold.1();

      }
    }
  }
  else
  {
    p_xpcConnectionHelper = &self->_xpcConnection;
    xpcConnection = self->_xpcConnection;
    v26 = -[PLClientLogger clientDebug](self, "clientDebug");
    if (xpcConnection)
    {
      if (v26)
      {
        PLLogClientLogging();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:].cold.7();

      }
    }
    else
    {
      if (v26)
      {
        PLLogClientLogging();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:].cold.6();

      }
      v29 = xpc_connection_create_mach_service("com.apple.powerlog.plxpclogger.xpc", (dispatch_queue_t)self->_xpcConnectionQueue, 0);
      v30 = self->_xpcConnection;
      self->_xpcConnection = v29;

      v31 = self->_xpcConnection;
      v41 = MEMORY[0x1E0C809B0];
      v42 = 3221225472;
      v43 = __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_118;
      v44 = &unk_1E41664C8;
      v45 = self;
      v48 = v6;
      v46 = v8;
      v47 = v9;
      xpc_connection_set_event_handler(v31, &v41);
      xpc_connection_activate(self->_xpcConnection);
      if (-[PLClientLogger clientDebug](self, "clientDebug", v41, v42, v43, v44, v45))
      {
        PLLogClientLogging();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:].cold.5();

      }
    }
    if (-[PLClientLogger clientDebug](self, "clientDebug"))
    {
      PLLogClientLogging();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:].cold.4((uint64_t)p_xpcConnectionHelper, v13, v33, v34, v35, v36, v37, v38);
      goto LABEL_33;
    }
  }
  v39 = *p_xpcConnectionHelper;

  return v39;
}

- (id)pendingTasksForType:(id)a3 forClientID:(signed __int16)a4 forKey:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_sync_enter(CFSTR("___CacheSync___"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLClientLogger pendingTaskCache](self, "pendingTaskCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLClientLogger pendingTaskCache](self, "pendingTaskCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeObjectForKey:", v9);

  objc_sync_exit(CFSTR("___CacheSync___"));
  return v14;
}

- (OS_dispatch_queue)adaptivePermissionWorkQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 144, 1);
}

- (void)batchTasksCacheFlush
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_sync_enter(CFSTR("___BatchCacheSync___"));
  v7[0] = CFSTR("PLXPCBatchedMessage");
  -[PLClientLogger batchedTaskCache](self, "batchedTaskCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("PLXPCBatchedMessageDropCounts");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PLClientLogger batchedDropMessageCount](self, "batchedDropMessageCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLClientLogger buildMessageForClientID:withKey:withPayload:](self, "buildMessageForClientID:withKey:withPayload:", 51, CFSTR("MyEvent"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("Post"));
  -[PLClientLogger xpcSendMessage:withClientID:withKey:withPayload:](self, "xpcSendMessage:withClientID:withKey:withPayload:", v6, 51, CFSTR("MyEvent"), v5);

  objc_sync_exit(CFSTR("___BatchCacheSync___"));
}

- (void)setBatchedTaskCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)addToPendingTaskCacheForType:(id)a3 forClientID:(signed __int16)a4 forKey:(id)a5 withPayload:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  _QWORD v39[4];

  v8 = a4;
  v39[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_sync_enter(CFSTR("___CacheSync___"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLClientLogger pendingTaskCache](self, "pendingTaskCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v16 = (void *)objc_opt_new();
    -[PLClientLogger pendingTaskCache](self, "pendingTaskCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v10);

  }
  -[PLClientLogger pendingTaskCache](self, "pendingTaskCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    v21 = (void *)objc_opt_new();
    -[PLClientLogger pendingTaskCache](self, "pendingTaskCache");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v21, v13);

  }
  -[PLClientLogger pendingTaskCache](self, "pendingTaskCache");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", v10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", v13);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", v11);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    v28 = (void *)objc_opt_new();
    -[PLClientLogger pendingTaskCache](self, "pendingTaskCache");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", v10);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", v13);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v28, v11);

  }
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", v12, 1);
  -[PLClientLogger pendingTaskCache](self, "pendingTaskCache");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKeyedSubscript:", v10);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKeyedSubscript:", v13);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", v11);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addObject:", v32);

  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      -[PLClientLogger pendingTaskCache](self, "pendingTaskCache");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLClientLogger addToPendingTaskCacheForType:forClientID:forKey:withPayload:].cold.1(v38, (uint64_t)v39, v37);
    }

  }
  objc_sync_exit(CFSTR("___CacheSync___"));

}

- (NSMutableDictionary)pendingTaskCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

uint64_t __39__PLClientLogger_batchSizeForClientID___block_invoke(uint64_t result)
{
  batchSizeForClientID__batchSize = *(unsigned __int16 *)(result + 32) == 28;
  return result;
}

void __43__PLClientLogger_isMessageOnDeviceDisabled__block_invoke()
{
  void *v0;
  int v1;

  v0 = (void *)MGCopyAnswer();
  v1 = objc_msgSend(v0, "intValue");
  if (v0)
    CFRelease(v0);
  disableMessageOnDevice = v1 == -1;
}

void __32__PLClientLogger_sharedInstance__block_invoke()
{
  void *v0;
  PLClientLogger *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A1AECD98]();
  v1 = objc_alloc_init(PLClientLogger);
  v2 = (void *)sharedInstance__clientLogger;
  sharedInstance__clientLogger = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

void __55__PLClientLogger_queryForClientID_withKey_withPayload___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD v11[2];
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "buildMessageForClientID:withKey:withPayload:", *(__int16 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("Query"));
  objc_msgSend(*(id *)(a1 + 32), "xpcSendMessageWithReply:withClientID:withKey:withPayload:", v2, *(__int16 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (objc_msgSend(*(id *)(a1 + 32), "clientDebug"))
  {
    PLLogClientLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(__int16 *)(a1 + 64);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v11[0] = 67110146;
      v11[1] = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      v18 = 2112;
      v19 = v2;
      _os_log_debug_impl(&dword_19EA99000, v6, OS_LOG_TYPE_DEBUG, "queryForClientID:%d withKey:%@ withPayload:%@ result=%@, message=%@", (uint8_t *)v11, 0x30u);
    }

  }
}

void __22__PLClientLogger_init__block_invoke()
{
  id v0;

  +[PLClientLogger sharedInstance](PLClientLogger, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "powerlogStateChanged");

}

void __22__PLClientLogger_init__block_invoke_82()
{
  id v0;

  +[PLClientLogger sharedInstance](PLClientLogger, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "powerlogStateChanged");

}

void __22__PLClientLogger_init__block_invoke_85()
{
  id v0;

  +[PLClientLogger sharedInstance](PLClientLogger, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "logStateCaches");

}

- (void)logStateCaches
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  objc_msgSend(a1, "processName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "permissionCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pendingTaskCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "batchedTaskCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_12_0(&dword_19EA99000, v6, v7, "State:%@ ***\npermissionCache=%@\n\npendingTaskCache=%@\n\nbatchedTaskCache=%@\n", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_11_0();
}

- (void)powerlogStateChanged
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_19EA99000, v0, v1, "powerlogStateChanged: Powerlog state changed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __38__PLClientLogger_powerlogStateChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AECD98]();
  if (objc_msgSend(*(id *)(a1 + 32), "clientDebug"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.ClientID.%@"), CFSTR("com.apple.powerlog.state_changed"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PLLogClientLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __38__PLClientLogger_powerlogStateChanged__block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLClientPermissionToken"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLClientPermissionToken"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    notify_cancel(objc_msgSend(v10, "intValue"));

  }
  objc_autoreleasePoolPop(v4);

}

void __63__PLClientLogger_cachedPermissionForClientID_withKey_withType___block_invoke()
{
  id v0;

  +[PLClientLogger sharedInstance](PLClientLogger, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "powerlogStateChanged");

}

- (id)cacheForKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_sync_enter(CFSTR("___BatchCacheSync___"));
  -[PLClientLogger curatedBatchingList](self, "curatedBatchingList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  -[PLClientLogger dynamicCache](self, "dynamicCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kPLCuratedBatchingListCache"));
  else
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kPLDefault"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(CFSTR("___BatchCacheSync___"));
  return v8;
}

void *__78__PLClientLogger_addToBatchedTaskCacheForType_forClientID_forKey_withPayload___block_invoke()
{
  return &unk_1E416CA50;
}

void __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _xpc_connection_s *v11;
  _DWORD v12[2];
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "clientDebug"))
  {
    PLLogClientLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "xpcConnectionWithClientID:withKey:withPayload:", *(__int16 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v12[0] = 67109378;
      v12[1] = xpc_connection_get_pid(v11);
      v13 = 2112;
      v14 = v3;
      _os_log_debug_impl(&dword_19EA99000, v4, OS_LOG_TYPE_DEBUG, "xpcConnectionWithClientID: Event handler fired peerPID=%d %@", (uint8_t *)v12, 0x12u);

    }
  }
  v5 = MEMORY[0x1A1AED140](v3);
  v6 = MEMORY[0x1E0C81310];
  v7 = objc_msgSend(*(id *)(a1 + 32), "clientDebug");
  if (v5 == v6)
  {
    if (v7)
    {
      PLLogClientLogging();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_cold_2();

    }
    if (v3 == (id)MEMORY[0x1E0C81260])
    {
      if (objc_msgSend(*(id *)(a1 + 32), "clientDebug"))
      {
        PLLogClientLogging();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_cold_1();

      }
      disableMessageOnDevice = 1;
    }
  }
  else if (v7)
  {
    PLLogClientLogging();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_cold_3();

  }
}

void __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_118(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  _xpc_connection_s *v7;
  _DWORD v8[2];
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "clientDebug"))
  {
    PLLogClientLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "xpcConnectionWithClientID:withKey:withPayload:", *(__int16 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v8[0] = 67109378;
      v8[1] = xpc_connection_get_pid(v7);
      v9 = 2112;
      v10 = v3;
      _os_log_debug_impl(&dword_19EA99000, v4, OS_LOG_TYPE_DEBUG, "xpcConnectionWithClientID: event handler fired peerPID=%d %@", (uint8_t *)v8, 0x12u);

    }
  }
  if (MEMORY[0x1A1AED140](v3) == MEMORY[0x1E0C81310])
  {
    if (v3 == (id)MEMORY[0x1E0C81260])
    {
      if (objc_msgSend(*(id *)(a1 + 32), "clientDebug"))
      {
        PLLogClientLogging();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_cold_1();

      }
      disableMessageOnDevice = 1;
    }
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "clientDebug"))
  {
    PLLogClientLogging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_118_cold_2();

  }
}

- (void)logWithCurrentDateForClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  id v10;

  if (a4)
  {
    if (a5)
    {
      v6 = a3;
      v8 = a4;
      v10 = (id)objc_msgSend(a5, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("__pl_internal_timeSensitiveSystemDate"));

      -[PLClientLogger logForClientID:withKey:withPayload:](self, "logForClientID:withKey:withPayload:", v6, v8, v10);
    }
  }
}

- (int)shouldLogNowForClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5 withFilterInterval:(double)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v43;
  uint8_t v44[32];
  uint8_t buf[4];
  int v46;
  __int16 v47;
  id v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v43 = a3;
  v53 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d_%@"), v43, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(CFSTR("___sFilterByIntervalBufferSync___"));
  -[PLClientLogger eventFilterSaved](self, "eventFilterSaved");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v15 = (void *)objc_opt_new();
    -[PLClientLogger eventFilterSaved](self, "eventFilterSaved");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v12);

  }
  -[PLClientLogger eventFilterSaved](self, "eventFilterSaved");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("lastEventDate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109890;
      v46 = v43;
      v47 = 2112;
      v48 = v9;
      v49 = 2112;
      v50 = v11;
      v51 = 2112;
      v52 = v10;
      _os_log_debug_impl(&dword_19EA99000, v20, OS_LOG_TYPE_DEBUG, "shouldLogNowForClientID: (PLLogRegisteredEventFilterByInterval) Check(%d, %@ at %@) - %@\n", buf, 0x26u);
    }

    if (!v19)
    {
      if (v10)
        goto LABEL_20;
LABEL_24:
      if (-[PLClientLogger clientDebug](self, "clientDebug"))
      {
        PLLogClientLogging();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109890;
          v46 = v43;
          v47 = 2112;
          v48 = v9;
          v49 = 2112;
          v50 = v11;
          v51 = 2112;
          v52 = 0;
          _os_log_debug_impl(&dword_19EA99000, v36, OS_LOG_TYPE_DEBUG, "(PLLogRegisteredEventFilterByInterval) Drop invalid(%d, %@ at %@) - %@\n", buf, 0x26u);
        }
        v29 = 3;
        goto LABEL_34;
      }
      v29 = 3;
      goto LABEL_35;
    }
    PLLogClientLogging();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[PLClientLogger shouldLogNowForClientID:withKey:withPayload:withFilterInterval:].cold.3();

    PLLogClientLogging();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[PLClientLogger shouldLogNowForClientID:withKey:withPayload:withFilterInterval:].cold.2();

    PLLogClientLogging();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v11, "timeIntervalSinceDate:", v19);
      -[PLClientLogger shouldLogNowForClientID:withKey:withPayload:withFilterInterval:].cold.1(v44, v23, v24, a6);
    }

  }
  if (!v10)
    goto LABEL_24;
  if (v19)
  {
    objc_msgSend(v11, "timeIntervalSinceDate:", v19);
    if (v25 < a6)
    {
      -[PLClientLogger eventFilterSaved](self, "eventFilterSaved");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", v12);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("bufferedEventDictionary"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        v29 = 2;
      }
      else
      {
        -[PLClientLogger eventFilterSaved](self, "eventFilterSaved");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", v12);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v11, CFSTR("bufferedEventDate"));

        v29 = 1;
      }
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", v10, 1);
      -[PLClientLogger eventFilterSaved](self, "eventFilterSaved");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectForKeyedSubscript:", v12);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setObject:forKeyedSubscript:", v39, CFSTR("bufferedEventDictionary"));

      if (-[PLClientLogger clientDebug](self, "clientDebug"))
      {
        PLLogClientLogging();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109890;
          v46 = v43;
          v47 = 2112;
          v48 = v9;
          v49 = 2112;
          v50 = v11;
          v51 = 2112;
          v52 = v10;
          _os_log_debug_impl(&dword_19EA99000, v36, OS_LOG_TYPE_DEBUG, "(PLLogRegisteredEventFilterByInterval) Buffer(%d, %@ at %@) - %@\n", buf, 0x26u);
        }
LABEL_34:

        goto LABEL_35;
      }
      goto LABEL_35;
    }
  }
LABEL_20:
  -[PLClientLogger eventFilterSaved](self, "eventFilterSaved");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:", v12);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v11, CFSTR("lastEventDate"));

  -[PLClientLogger eventFilterSaved](self, "eventFilterSaved");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", v12);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "removeObjectForKey:", CFSTR("bufferedEventDictionary"));

  -[PLClientLogger eventFilterSaved](self, "eventFilterSaved");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKeyedSubscript:", v12);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "removeObjectForKey:", CFSTR("bufferedEventDate"));

  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109890;
      v46 = v43;
      v47 = 2112;
      v48 = v9;
      v49 = 2112;
      v50 = v11;
      v51 = 2112;
      v52 = v10;
      _os_log_debug_impl(&dword_19EA99000, v36, OS_LOG_TYPE_DEBUG, "(PLLogRegisteredEventFilterByInterval)  Log(%d, %@ at %@) - %@\n", buf, 0x26u);
    }
    v29 = 0;
    goto LABEL_34;
  }
  v29 = 0;
LABEL_35:

  objc_sync_exit(CFSTR("___sFilterByIntervalBufferSync___"));
  return v29;
}

- (void)logLaterForClientID:(signed __int16)a3 withKey:(id)a4 withFilterInterval:(double)a5
{
  uint64_t v6;
  id v8;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  double v15;
  __int16 v16;

  v6 = a3;
  v8 = a4;
  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[PLClientLogger logLaterForClientID:withKey:withFilterInterval:].cold.1(v9);

  }
  v10 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  -[PLClientLogger getWorkQueueForClientID:](self, "getWorkQueueForClientID:", v6);
  v11 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__PLClientLogger_logLaterForClientID_withKey_withFilterInterval___block_invoke;
  v13[3] = &unk_1E4166540;
  v16 = v6;
  v13[4] = self;
  v14 = v8;
  v15 = a5;
  v12 = v8;
  dispatch_after(v10, v11, v13);

}

void __65__PLClientLogger_logLaterForClientID_withKey_withFilterInterval___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  int v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "clientDebug"))
  {
    PLLogClientLogging();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __65__PLClientLogger_logLaterForClientID_withKey_withFilterInterval___block_invoke_cold_1(v2);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d_%@"), *(__int16 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(CFSTR("___sFilterByIntervalBufferSync___"));
  objc_msgSend(*(id *)(a1 + 32), "eventFilterSaved");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bufferedEventDictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "eventFilterSaved");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("bufferedEventDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v10)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:", v10);
    if (v11 >= *(double *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 32), "eventFilterSaved");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObjectForKey:", CFSTR("bufferedEventDictionary"));

      objc_msgSend(*(id *)(a1 + 32), "eventFilterSaved");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeObjectForKey:", CFSTR("bufferedEventDate"));

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "eventFilterSaved");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v13, CFSTR("lastEventDate"));

    }
    else
    {
      v12 = v7;
      v13 = v10;
      v10 = 0;
      v7 = 0;
    }

  }
  objc_sync_exit(CFSTR("___sFilterByIntervalBufferSync___"));
  if (v7)
    v19 = v10 == 0;
  else
    v19 = 1;
  v20 = !v19;
  v21 = objc_msgSend(*(id *)(a1 + 32), "clientDebug");
  if (v20)
  {
    if (v21)
    {
      PLLogClientLogging();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v24 = *(__int16 *)(a1 + 56);
        v25 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 67109890;
        v29 = v24;
        v30 = 2112;
        v31 = v25;
        v32 = 2112;
        v33 = v4;
        v34 = 2112;
        v35 = v7;
        _os_log_debug_impl(&dword_19EA99000, v22, OS_LOG_TYPE_DEBUG, "(PLLogRegisteredEventFilterByInterval) \t\t Log Buffered(%d, %@ at %@) - %@\n", buf, 0x26u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "logWithCurrentDateForClientID:withKey:withPayload:", *(__int16 *)(a1 + 56), *(_QWORD *)(a1 + 40), v7);
  }
  else if (v21)
  {
    PLLogClientLogging();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v26 = *(__int16 *)(a1 + 56);
      v27 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 67109634;
      v29 = v26;
      v30 = 2112;
      v31 = v27;
      v32 = 2112;
      v33 = v4;
      _os_log_debug_impl(&dword_19EA99000, v23, OS_LOG_TYPE_DEBUG, "(PLLogRegisteredEventFilterByInterval) \t\t No Buffered Log(%d, %@ at %@)\n", buf, 0x1Cu);
    }

  }
}

void __78__PLClientLogger_xpcSendMessageWithRateLimitingforClient_withKey_withPayload___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  _DWORD v7[2];
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "buildMessageForClientID:withKey:withPayload:", *(__int16 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("Post"));
  objc_msgSend(*(id *)(a1 + 32), "xpcSendMessage:withClientID:withKey:withPayload:", v2, *(__int16 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (objc_msgSend(*(id *)(a1 + 32), "clientDebug"))
  {
    PLLogClientLogging();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = *(__int16 *)(a1 + 56);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 48);
      v7[0] = 67109634;
      v7[1] = v4;
      v8 = 2112;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_debug_impl(&dword_19EA99000, v3, OS_LOG_TYPE_DEBUG, "xpcSendMessageWithRateLimitingforClient: client id:%d withKey:%@ withPayload:%@ sent!", (uint8_t *)v7, 0x1Cu);
    }

  }
}

void __78__PLClientLogger_xpcSendMessageWithRateLimitingforClient_withKey_withPayload___block_invoke_143(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "buildMessageForClientID:withKey:withPayload:", *(__int16 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("Post"));
  if (objc_msgSend(*(id *)(a1 + 32), "clientDebug"))
  {
    PLLogClientLogging();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(__int16 *)(a1 + 56);
      v6 = *(_QWORD *)(a1 + 40);
      v10 = 67109634;
      v11 = v5;
      v12 = 2112;
      v13 = v6;
      v14 = 2112;
      v15 = v2;
      _os_log_debug_impl(&dword_19EA99000, v3, OS_LOG_TYPE_DEBUG, "XPC Send Message - not batched xpcSendMessageWithRateLimitingforClient: %d withKey:%@ message %@", (uint8_t *)&v10, 0x1Cu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "xpcSendMessage:withClientID:withKey:withPayload:", v2, *(__int16 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (objc_msgSend(*(id *)(a1 + 32), "clientDebug"))
  {
    PLLogClientLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(__int16 *)(a1 + 56);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(void **)(a1 + 48);
      v10 = 67109634;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_debug_impl(&dword_19EA99000, v4, OS_LOG_TYPE_DEBUG, "xpcSendMessageWithRateLimitingforClient: %d withKey:%@ withPayload:%@ sent!", (uint8_t *)&v10, 0x1Cu);
    }

  }
}

uint64_t __78__PLClientLogger_xpcSendMessageWithRateLimitingforClient_withKey_withPayload___block_invoke_144(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "batchTasksCacheFlush");
  objc_msgSend(*(id *)(a1 + 32), "sendBatchToPPS");
  objc_msgSend(*(id *)(a1 + 32), "clearCache");
  return objc_msgSend(*(id *)(a1 + 32), "setBatchMessagesSentCount:", 0);
}

- (void)clearCache
{
  objc_sync_enter(CFSTR("___BatchCacheSync___"));
  -[PLClientLogger clearBatchedTaskCachePPS](self, "clearBatchedTaskCachePPS");
  -[PLClientLogger clearBatchedTaskCache](self, "clearBatchedTaskCache");
  -[PLClientLogger setBatchedTimerInFlight:](self, "setBatchedTimerInFlight:", 0);
  objc_sync_exit(CFSTR("___BatchCacheSync___"));
}

- (void)clearBatchedTaskCache
{
  void *v3;

  objc_sync_enter(CFSTR("___BatchCacheSync___"));
  v3 = (void *)objc_opt_new();
  -[PLClientLogger setBatchedTaskCache:](self, "setBatchedTaskCache:", v3);

  -[PLClientLogger setBatchedDropMessageCount:](self, "setBatchedDropMessageCount:", 0);
  objc_sync_exit(CFSTR("___BatchCacheSync___"));
}

- (void)clearBatchedTaskCachePPS
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_sync_enter(CFSTR("___BatchCacheSync___"));
  v3 = (void *)objc_opt_new();
  -[PLClientLogger setDynamicCache:](self, "setDynamicCache:", v3);

  v4 = (void *)objc_opt_new();
  -[PLClientLogger dynamicCache](self, "dynamicCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("kPLDefault"));

  v6 = (void *)objc_opt_new();
  -[PLClientLogger dynamicCache](self, "dynamicCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("kPLCuratedBatchingListCache"));

  objc_sync_exit(CFSTR("___BatchCacheSync___"));
}

- (void)sendBatchToPPS
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_sync_enter(CFSTR("___BatchCacheSync___"));
  v6 = CFSTR("PLXPCBatchedMessage");
  -[PLClientLogger dynamicCache](self, "dynamicCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLClientLogger buildMessageForClientID:withKey:withPayload:](self, "buildMessageForClientID:withKey:withPayload:", 110, CFSTR("PPSBatchedMessages"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("Post"));
  -[PLClientLogger xpcSendMessage:withClientID:withKey:withPayload:](self, "xpcSendMessage:withClientID:withKey:withPayload:", v5, 110, CFSTR("PPSBatchedMessages"), v4);

  objc_sync_exit(CFSTR("___BatchCacheSync___"));
}

- (void)setClientDebug:(BOOL)a3
{
  self->_clientDebug = a3;
}

- (void)setWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setBatchFlushQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setProcessName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setPermissionCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setPendingTaskCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableDictionary)dynamicCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDynamicCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMutableDictionary)eventFilterSaved
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setEventFilterSaved:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (OS_dispatch_queue)xpcConnectionQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setXpcConnectionQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (OS_dispatch_queue)xpcConnectionHelperQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96, 1);
}

- (void)setXpcConnectionHelperQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (OS_xpc_object)xpcConnectionHelper
{
  return self->_xpcConnectionHelper;
}

- (void)setXpcConnectionHelper:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnectionHelper, a3);
}

- (void)setTalkToPowerlogHelper:(BOOL)a3
{
  self->_talkToPowerlogHelper = a3;
}

- (void)setForceBatching:(BOOL)a3
{
  self->_forceBatching = a3;
}

- (void)setBatchDropMessages:(BOOL)a3
{
  self->_batchDropMessages = a3;
}

- (int)batchMessagesSentCount
{
  return self->_batchMessagesSentCount;
}

- (void)setBatchMessagesSentCount:(int)a3
{
  self->_batchMessagesSentCount = a3;
}

- (NSSet)curatedBatchingList
{
  return (NSSet *)objc_getProperty(self, a2, 128, 1);
}

- (NSSet)batchingKeysAllowlist
{
  return (NSSet *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAdaptivePermissionWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adaptivePermissionWorkQueue, 0);
  objc_storeStrong((id *)&self->_batchingKeysAllowlist, 0);
  objc_storeStrong((id *)&self->_curatedBatchingList, 0);
  objc_storeStrong((id *)&self->_batchingClientAllowlist, 0);
  objc_storeStrong((id *)&self->_xpcConnectionHelper, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_xpcConnectionHelperQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
  objc_storeStrong((id *)&self->_eventFilterSaved, 0);
  objc_storeStrong((id *)&self->_dynamicCache, 0);
  objc_storeStrong((id *)&self->_batchedTaskCache, 0);
  objc_storeStrong((id *)&self->_pendingTaskCache, 0);
  objc_storeStrong((id *)&self->_permissionCache, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_batchFlushQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_8_0(&dword_19EA99000, v0, v1, "Notification %s registration failed : %d", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void __38__PLClientLogger_powerlogStateChanged__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19EA99000, v0, v1, "powerlogStateChanged: Unregistering for %@ notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)buildMessageForClientID:withKey:withPayload:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_5_0(&dword_19EA99000, v0, v1, "buildMessageForClientID: %d message:%@");
  OUTLINED_FUNCTION_1();
}

- (void)cachedPermissionForClientID:withKey:withType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_5_0(&dword_19EA99000, v0, v1, "cachedPermissionForClientID: notification %@ registration failed : %d");
  OUTLINED_FUNCTION_1();
}

- (void)cachedPermissionForClientID:withKey:withType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19EA99000, v0, v1, "cachedPermissionForClientID: Registering for %@ notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)cachedPermissionForClientID:(void *)a1 withKey:(uint64_t)a2 withType:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_19EA99000, a3, (uint64_t)a3, "permissionCache: %@", (uint8_t *)a2);

}

- (void)addToPendingTaskCacheForType:(NSObject *)a3 forClientID:forKey:withPayload:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_19EA99000, a3, (uint64_t)a3, "addToPendingTaskCacheForType: Current cached payloads = %@", (uint8_t *)a2);

}

- (void)xpcConnectionWithClientID:withKey:withPayload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_19EA99000, v0, v1, "xpcConnectionWithClientID: connection created", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)xpcConnectionWithClientID:(uint64_t)a1 withKey:(uint64_t)a2 withPayload:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  __int128 v4;

  LODWORD(v3) = 67109378;
  HIDWORD(v3) = a2;
  LOWORD(v4) = 2112;
  *(_QWORD *)((char *)&v4 + 2) = *(_QWORD *)(a1 + 96);
  OUTLINED_FUNCTION_5_0(&dword_19EA99000, a2, a3, "xpcConnectionWithClientID: Client (%d) is creating connection to powerlogHelperd, using queue %@!", v3, (_QWORD)v4, WORD4(v4));
  OUTLINED_FUNCTION_1();
}

- (void)xpcConnectionWithClientID:(uint64_t)a3 withKey:(uint64_t)a4 withPayload:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10_0(&dword_19EA99000, a2, a3, "xpcConnectionWithClientID: client (%d) is reusing connection to powerlogHelperd!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

- (void)xpcConnectionWithClientID:(uint64_t)a3 withKey:(uint64_t)a4 withPayload:(uint64_t)a5 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_19EA99000, a2, a3, "xpcConnectionWithClientID: _xpcConnection=%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)xpcConnectionWithClientID:withKey:withPayload:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_19EA99000, v0, v1, "xpcConnectionWithClientID: connection created!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)xpcConnectionWithClientID:withKey:withPayload:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_19EA99000, v0, v1, "xpcConnectionWithClientID: creating connection to powerlog!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)xpcConnectionWithClientID:withKey:withPayload:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_19EA99000, v0, v1, "xpcConnectionWithClientID: Reusing connection to powerlog!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_19EA99000, v0, v1, "xpcConnectionWithClientID: Received XPC_ERROR_CONNECTION_INVALID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19EA99000, v0, v1, "xpcConnectionWithClientID error : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19EA99000, v0, v1, "xpcConnectionWithClientID error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_118_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19EA99000, v0, v1, "xpcConnectionWithClientID: XPC Connection back? %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)xpcSendMessage:withClientID:withKey:withPayload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_19EA99000, v0, v1, "xpcSendMessage: no xpcMessage", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)xpcSendMessage:withClientID:withKey:withPayload:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19EA99000, v0, v1, "xpcSendMessage: sending message %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)xpcSendMessageWithReply:withClientID:withKey:withPayload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_19EA99000, v0, v1, "xpcSendMessageWithReply: no xpcMessage", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)xpcSendMessageWithReply:withClientID:withKey:withPayload:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_19EA99000, v0, v1, "xpcSendMessageWithReply: no xpcResponse", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)xpcSendMessageWithReply:withClientID:withKey:withPayload:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_19EA99000, v0, v1, "xpcSendMessageWithReply: no xpcReturnDict", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)xpcSendMessageWithReply:withClientID:withKey:withPayload:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_19EA99000, v0, v1, "xpcSendMessageWithReply: no response", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)xpcSendMessageWithReply:withClientID:withKey:withPayload:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19EA99000, v0, v1, "xpcSendMessageWithReply: response=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)xpcSendMessageWithReply:(uint64_t)a3 withClientID:(uint64_t)a4 withKey:(uint64_t)a5 withPayload:(uint64_t)a6 .cold.6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_19EA99000, a2, a3, "xpcSendMessageWithReply: setting clientDebug to %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)xpcSendMessageWithReply:withClientID:withKey:withPayload:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19EA99000, v0, v1, "xpcSendMessageWithReply: xpcReturnDict=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)xpcSendMessageWithReply:withClientID:withKey:withPayload:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19EA99000, v0, v1, "xpcSendMessageWithReply: xpcResponse=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)permissionForClientID:(uint64_t)a3 withKey:(uint64_t)a4 withType:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10_0(&dword_19EA99000, a2, a3, "permissionForClientID: returnValue=%hd", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

void __68__PLClientLogger_permissionForClientID_withKey_withType_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_19EA99000, v0, v1, "permissionForClientID: query!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __68__PLClientLogger_permissionForClientID_withKey_withType_completion___block_invoke_cold_2()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_15_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x26u);
  OUTLINED_FUNCTION_14_0();
}

- (void)logForClientID:withKey:withPayload:.cold.1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_15_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)shouldLogNowForClientID:(uint8_t *)buf withKey:(NSObject *)a2 withPayload:(double)a3 withFilterInterval:(double)a4 .cold.1(uint8_t *buf, NSObject *a2, double a3, double a4)
{
  *(_DWORD *)buf = 134218240;
  *(double *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2048;
  *(double *)(buf + 14) = a4;
  _os_log_debug_impl(&dword_19EA99000, a2, OS_LOG_TYPE_DEBUG, "(PLLogRegisteredEventFilterByInterval) \t interval = %f, minInterval = %f\n", buf, 0x16u);
}

- (void)shouldLogNowForClientID:withKey:withPayload:withFilterInterval:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19EA99000, v0, v1, "(PLLogRegisteredEventFilterByInterval) \t lastEventDate = %@\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)shouldLogNowForClientID:withKey:withPayload:withFilterInterval:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19EA99000, v0, v1, "(PLLogRegisteredEventFilterByInterval) \t currentEventDate = %@\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)logLaterForClientID:(NSObject *)a1 withKey:withFilterInterval:.cold.1(NSObject *a1)
{
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_19EA99000, a1, v3, "(PLLogRegisteredEventFilterByInterval) \t Set Timer at %@\n", v4);

  OUTLINED_FUNCTION_14_0();
}

void __65__PLClientLogger_logLaterForClientID_withKey_withFilterInterval___block_invoke_cold_1(NSObject *a1)
{
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_19EA99000, a1, v3, "(PLLogRegisteredEventFilterByInterval) \t Timer Fired at %@\n", v4);

  OUTLINED_FUNCTION_14_0();
}

- (void)xpcSendMessageWithRateLimitingforClient:withKey:withPayload:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_5_0(&dword_19EA99000, v0, v1, "XPC Send Message - Batching enabled xpcSendMessageWithRateLimitingforClient: %d withKey:%@");
  OUTLINED_FUNCTION_1();
}

- (void)queryForClientID:withKey:withPayload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19EA99000, v0, v1, "queryForClientID: no query key! %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)queryForClientID:(uint64_t)a3 withKey:(uint64_t)a4 withPayload:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10_0(&dword_19EA99000, a1, a3, "queryForClientID: Override permission for clientID:%d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

- (void)queryForClientID:withKey:withPayload:.cold.3()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_15_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x22u);
  OUTLINED_FUNCTION_14_0();
}

@end
