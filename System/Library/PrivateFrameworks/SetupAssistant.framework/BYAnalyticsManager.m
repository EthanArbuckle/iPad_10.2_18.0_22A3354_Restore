@implementation BYAnalyticsManager

- (BYAnalyticsManager)init
{
  BYAnalyticsManager *v2;
  NSMutableArray *v3;
  NSMutableArray *events;
  NSMutableDictionary *v5;
  NSMutableDictionary *lazyEvents;
  NSMutableArray *v7;
  NSMutableArray *didProduceLazyEventsBlocks;
  BYPowerLogAnalyticsManager *v9;
  void *v10;
  uint64_t v11;
  BYPowerLogAnalyticsManager *buddyPowerLogManager;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BYAnalyticsManager;
  v2 = -[BYAnalyticsManager init](&v14, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    events = v2->_events;
    v2->_events = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lazyEvents = v2->_lazyEvents;
    v2->_lazyEvents = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    didProduceLazyEventsBlocks = v2->_didProduceLazyEventsBlocks;
    v2->_didProduceLazyEventsBlocks = v7;

    v9 = [BYPowerLogAnalyticsManager alloc];
    +[BYPreferencesController buddyPreferencesExcludedFromBackup](BYPreferencesController, "buddyPreferencesExcludedFromBackup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[BYPowerLogAnalyticsManager initWithPreferences:](v9, "initWithPreferences:", v10);
    buddyPowerLogManager = v2->_buddyPowerLogManager;
    v2->_buddyPowerLogManager = (BYPowerLogAnalyticsManager *)v11;

  }
  return v2;
}

- (void)addEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BYAnalyticsManager events](self, "events");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)addPowerLogEvent:(unint64_t)a3 withPayload:(id)a4
{
  id v6;
  void *v7;
  BYPowerLogEvent *v8;

  v6 = a4;
  v8 = -[BYPowerLogEvent initWithType:andPayload:]([BYPowerLogEvent alloc], "initWithType:andPayload:", a3, v6);

  if (v8)
  {
    -[BYAnalyticsManager buddyPowerLogManager](self, "buddyPowerLogManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addEvent:", v8);

  }
}

- (void)addEvent:(id)a3 withPayload:(id)a4 persist:(BOOL)a5
{
  id v6;

  +[BYAnalyticsEvent eventWithName:withPayload:persist:](BYAnalyticsEvent, "eventWithName:withPayload:persist:", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[BYAnalyticsManager addEvent:](self, "addEvent:", v6);

}

- (void)addEvent:(id)a3 withPayloadBlock:(id)a4 persist:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;

  v5 = a5;
  v8 = a3;
  +[BYAnalyticsLazyEvent eventWithName:withPayloadBlock:persist:](BYAnalyticsLazyEvent, "eventWithName:withPayloadBlock:persist:", v8, a4, v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[BYAnalyticsManager lazyEvents](self, "lazyEvents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v8);

}

- (void)removeEventsUsingBlock:(id)a3
{
  uint64_t (**v4)(id, void *, void *);
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  BYAnalyticsManager *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, void *, void *))a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v16 = self;
  -[BYAnalyticsManager events](self, "events");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "payload");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v4[2](v4, v12, v13);

        if (v14)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  -[BYAnalyticsManager events](v16, "events");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObjectsInArray:", v5);

}

- (void)addDidProduceLazyEventsBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[BYAnalyticsManager didProduceLazyEventsBlocks](self, "didProduceLazyEventsBlocks");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1A85AAF94](v4);

  objc_msgSend(v6, "addObject:", v5);
}

- (void)prepareForCombinedAnalyticsRepromptWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  BYAnalyticsManager *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  void (**v19)(_QWORD);
  uint8_t buf[8];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[6];
  _QWORD v24[7];

  v24[6] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  v5 = self;
  objc_sync_enter(v5);
  -[BYAnalyticsManager rtcReporting](v5, "rtcReporting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _BYLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E92000, v7, OS_LOG_TYPE_DEFAULT, "Analytics reporting configuration already started", buf, 2u);
    }

    v4[2](v4);
    objc_sync_exit(v5);
  }
  else
  {
    objc_sync_exit(v5);

    v8 = arc4random();
    v9 = *MEMORY[0x1E0D83888];
    v23[0] = *MEMORY[0x1E0D83880];
    v23[1] = v9;
    v24[0] = &unk_1E4E34560;
    v24[1] = &unk_1E4E34578;
    v23[2] = *MEMORY[0x1E0D838A8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v10;
    v11 = *MEMORY[0x1E0D83890];
    v23[3] = *MEMORY[0x1E0D83870];
    v23[4] = v11;
    v24[3] = MEMORY[0x1E0C9AAA0];
    v24[4] = MEMORY[0x1E0C9AAB0];
    v23[5] = *MEMORY[0x1E0D83878];
    v24[5] = CFSTR("com.apple.purplebuddy");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 6);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = *MEMORY[0x1E0D838B8];
    v21[0] = *MEMORY[0x1E0D838B0];
    v21[1] = v13;
    v22[0] = CFSTR("Setup");
    v22[1] = CFSTR("com.apple.purplebuddy");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D83848]), "initWithSessionInfo:userInfo:frameworksToCheck:", v12, v14, 0);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __72__BYAnalyticsManager_prepareForCombinedAnalyticsRepromptWithCompletion___block_invoke;
    v17[3] = &unk_1E4E28140;
    v17[4] = v5;
    v18 = v15;
    v19 = v4;
    v16 = v15;
    objc_msgSend(v16, "startConfigurationWithCompletionHandler:", v17);

    v5 = (BYAnalyticsManager *)v12;
  }

}

void __72__BYAnalyticsManager_prepareForCombinedAnalyticsRepromptWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _BYLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v3 != 0;
    _os_log_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_DEFAULT, "Analytics reporting configuration started with success %d", (uint8_t *)v9, 8u);
  }

  if (CFPreferencesGetAppBooleanValue(CFSTR("ForceRTCStartConfigurationSuccess"), CFSTR("com.apple.purplebuddy"), 0))
  {
    _BYLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_DEFAULT, "Analytics reporting configuration forcing success", (uint8_t *)v9, 2u);
    }

  }
  else if (!v3)
  {
    goto LABEL_11;
  }
  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  objc_msgSend(*(id *)(a1 + 32), "rtcReporting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRtcReporting:", *(_QWORD *)(a1 + 40));
    objc_sync_exit(v6);

    objc_msgSend(*(id *)(a1 + 32), "_sendCombinedAnalyticsRepromptNecessaryEventWithRTCReporting:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_sync_exit(v6);

  }
LABEL_11:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)setCombinedAnalyticsRepromptChoice:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  BYAnalyticsManager *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BYAnalyticsManager setCombinedAnalyticsRepromptChoiceNumber:](obj, "setCombinedAnalyticsRepromptChoiceNumber:", v4);

  objc_sync_exit(obj);
}

- (void)stash:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[8];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BYAnalyticsManager _gatherDataFromProducers](self, "_gatherDataFromProducers");
  _BYLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_DEFAULT, "Stashing analytics...", buf, 2u);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[BYAnalyticsManager events](self, "events", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v11, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "payload");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "stashAnalyticEvent:payload:", v12, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v8);
  }

  -[BYAnalyticsManager appearanceSetupEvent](self, "appearanceSetupEvent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[BYAnalyticsManager appearanceSetupEvent](self, "appearanceSetupEvent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BYAnalyticsManager _stashablePayloadForBiomeEvent:](self, "_stashablePayloadForBiomeEvent:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "stashAnalyticEvent:payload:", CFSTR("biome.appearanceSetup"), v16);
    }
    else
    {
      _BYLoggingFacility();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[BYAnalyticsManager stash:].cold.2();

    }
  }
  -[BYAnalyticsManager childMultitaskingSetupEvent](self, "childMultitaskingSetupEvent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[BYAnalyticsManager childMultitaskingSetupEvent](self, "childMultitaskingSetupEvent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BYAnalyticsManager _stashablePayloadForBiomeEvent:](self, "_stashablePayloadForBiomeEvent:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "stashAnalyticEvent:payload:", CFSTR("biome.childMultitaskingSetup"), v20);
    }
    else
    {
      _BYLoggingFacility();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[BYAnalyticsManager stash:].cold.1();

    }
  }

}

- (void)commit
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1A4E92000, v0, v1, "Sending appearance setup event", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)commitThenUpload
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1A4E92000, v0, v1, "Failed to rollover events!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __38__BYAnalyticsManager_commitThenUpload__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _BYLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __38__BYAnalyticsManager_commitThenUpload__block_invoke_cold_1();

}

- (void)removeNonPersistentEvents
{
  NSObject *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[8];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  _BYLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E92000, v3, OS_LOG_TYPE_DEFAULT, "Removing non-persistent events...", buf, 2u);
  }

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[BYAnalyticsManager events](self, "events");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if ((objc_msgSend(v10, "persist") & 1) == 0)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  -[BYAnalyticsManager events](self, "events");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectsInArray:", v4);

  -[BYAnalyticsManager lazyEvents](self, "lazyEvents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
        -[BYAnalyticsManager lazyEvents](self, "lazyEvents", (_QWORD)v24);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v21, "persist") & 1) == 0)
        {
          -[BYAnalyticsManager lazyEvents](self, "lazyEvents");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "name");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "removeObjectForKey:", v23);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v16);
  }

  -[BYAnalyticsManager setAppearanceSetupEvent:](self, "setAppearanceSetupEvent:", 0);
  -[BYAnalyticsManager setAppearanceSetupEventBlock:](self, "setAppearanceSetupEventBlock:", 0);
  -[BYAnalyticsManager setChildMultitaskingSetupEvent:](self, "setChildMultitaskingSetupEvent:", 0);
  -[BYAnalyticsManager setChildMultitaskingSetupEventBlock:](self, "setChildMultitaskingSetupEventBlock:", 0);

}

- (void)reset
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  _BYLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A4E92000, v3, OS_LOG_TYPE_DEFAULT, "Resetting all analytics...", v6, 2u);
  }

  -[BYAnalyticsManager events](self, "events");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[BYAnalyticsManager lazyEvents](self, "lazyEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[BYAnalyticsManager setAppearanceSetupEvent:](self, "setAppearanceSetupEvent:", 0);
  -[BYAnalyticsManager setAppearanceSetupEventBlock:](self, "setAppearanceSetupEventBlock:", 0);
  -[BYAnalyticsManager setChildMultitaskingSetupEvent:](self, "setChildMultitaskingSetupEvent:", 0);
  -[BYAnalyticsManager setChildMultitaskingSetupEventBlock:](self, "setChildMultitaskingSetupEventBlock:", 0);
}

- (BOOL)sendStashedEventWithName:(id)a3 payload:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "hasPrefix:", CFSTR("biome."));
  if (v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("data"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v9)
      {
        v10 = 1;
        goto LABEL_9;
      }
    }
    else
    {

    }
    _BYLoggingFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[BYAnalyticsManager sendStashedEventWithName:payload:].cold.3();

    v10 = 0;
    v9 = 0;
LABEL_9:
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("dataVersion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v12)
      {
        if (v10)
        {
          if (objc_msgSend(v6, "isEqualToString:", CFSTR("biome.appearanceSetup")))
          {
            -[BYAnalyticsManager _sendAppearanceSetupEventWithData:dataVersion:](self, "_sendAppearanceSetupEventWithData:dataVersion:", v9, objc_msgSend(v12, "unsignedIntValue"));
          }
          else if (objc_msgSend(v6, "isEqualToString:", CFSTR("biome.childMultitaskingSetup")))
          {
            -[BYAnalyticsManager _sendChildMultitaskingSetupEventWithData:dataVersion:](self, "_sendChildMultitaskingSetupEventWithData:dataVersion:", v9, objc_msgSend(v12, "unsignedIntValue"));
          }
          else
          {
            _BYLoggingFacility();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              -[BYAnalyticsManager sendStashedEventWithName:payload:].cold.2();

          }
        }
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {

    }
    _BYLoggingFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[BYAnalyticsManager sendStashedEventWithName:payload:].cold.1();

    v12 = 0;
    goto LABEL_18;
  }
LABEL_19:

  return v8;
}

- (void)_gatherDataFromProducers
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void (**v14)(void);
  void *v15;
  NSObject *v16;
  void *v17;
  void (**v18)(void);
  void *v19;
  void *v20;
  void (**v21)(void);
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  _BYLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E92000, v3, OS_LOG_TYPE_DEFAULT, "Gathering data from event producers...", buf, 2u);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[BYAnalyticsManager lazyEvents](self, "lazyEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v25;
    *(_QWORD *)&v7 = 138412290;
    v23 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v10);
        -[BYAnalyticsManager lazyEvents](self, "lazyEvents", v23);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "payloadBlock");
        v14 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v14[2]();
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          +[BYAnalyticsEvent eventWithName:withPayload:persist:](BYAnalyticsEvent, "eventWithName:withPayload:persist:", v11, v15, 0);
          v16 = objc_claimAutoreleasedReturnValue();
          -[BYAnalyticsManager addEvent:](self, "addEvent:", v16);
        }
        else
        {
          _BYLoggingFacility();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v23;
            v29 = v11;
            _os_log_debug_impl(&dword_1A4E92000, v16, OS_LOG_TYPE_DEBUG, "No payload returned for %@; skipping...",
              buf,
              0xCu);
          }
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v8);
  }

  -[BYAnalyticsManager appearanceSetupEventBlock](self, "appearanceSetupEventBlock");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[BYAnalyticsManager appearanceSetupEventBlock](self, "appearanceSetupEventBlock");
    v18 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v18[2]();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BYAnalyticsManager setAppearanceSetupEvent:](self, "setAppearanceSetupEvent:", v19);

  }
  -[BYAnalyticsManager childMultitaskingSetupEventBlock](self, "childMultitaskingSetupEventBlock");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[BYAnalyticsManager childMultitaskingSetupEventBlock](self, "childMultitaskingSetupEventBlock");
    v21 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v21[2]();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[BYAnalyticsManager setChildMultitaskingSetupEvent:](self, "setChildMultitaskingSetupEvent:", v22);

  }
}

- (void)_sendEvent:(id)a3 payload:(id)a4
{
  AnalyticsSendEvent();
}

- (id)_stashablePayloadForBiomeEvent:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "serialize");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v9[0] = CFSTR("data");
    v9[1] = CFSTR("dataVersion");
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v3, "dataVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_sendAppearanceSetupEventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D02318], "eventWithData:dataVersion:", a3, *(_QWORD *)&a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    _BYLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[BYAnalyticsManager _sendAppearanceSetupEventWithData:dataVersion:].cold.2();

  }
  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BYAnalyticsManager commit].cold.2();

  BiomeLibrary();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "SystemSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "AppearanceSetup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "source");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendEvent:", v4);

}

- (void)_sendChildMultitaskingSetupEventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D02320], "eventWithData:dataVersion:", a3, *(_QWORD *)&a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    _BYLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[BYAnalyticsManager _sendChildMultitaskingSetupEventWithData:dataVersion:].cold.2();

  }
  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BYAnalyticsManager commit].cold.1();

  BiomeLibrary();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "SystemSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ChildMultitaskingSetup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "source");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendEvent:", v4);

}

- (void)_sendCombinedAnalyticsRepromptNecessaryEventWithRTCReporting:(id)a3
{
  int v3;
  id v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v3 = objc_msgSend(a3, "sendMessageWithCategory:type:payload:error:", 1, 1, 0, &v6);
  v4 = v6;
  _BYLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_DEFAULT, "Analytics did send combined analytics reprompt necessary event with success %d error %@", buf, 0x12u);
  }

}

- (void)_sendCombinedAnalyticsRepromptCompletedEventIfNecessary
{
  BYAnalyticsManager *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  -[BYAnalyticsManager rtcReporting](v2, "rtcReporting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BYAnalyticsManager combinedAnalyticsRepromptChoiceNumber](v2, "combinedAnalyticsRepromptChoiceNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  if (v3 && v4)
  {
    v16 = CFSTR("enabled");
    v17[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v6 = objc_msgSend(v3, "sendMessageWithCategory:type:payload:error:", 1, 2, v5, &v9);
    v7 = v9;
    _BYLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v11 = v4;
      v12 = 1024;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1A4E92000, v8, OS_LOG_TYPE_DEFAULT, "Analytics did send combined analytics reprompt completed event (choice %@) with success %d error %@", buf, 0x1Cu);
    }

  }
}

- (id)appearanceSetupEventBlock
{
  return self->_appearanceSetupEventBlock;
}

- (void)setAppearanceSetupEventBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)childMultitaskingSetupEventBlock
{
  return self->_childMultitaskingSetupEventBlock;
}

- (void)setChildMultitaskingSetupEventBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (NSMutableDictionary)lazyEvents
{
  return self->_lazyEvents;
}

- (void)setLazyEvents:(id)a3
{
  objc_storeStrong((id *)&self->_lazyEvents, a3);
}

- (NSMutableArray)didProduceLazyEventsBlocks
{
  return self->_didProduceLazyEventsBlocks;
}

- (void)setDidProduceLazyEventsBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_didProduceLazyEventsBlocks, a3);
}

- (BYPowerLogAnalyticsManager)buddyPowerLogManager
{
  return self->_buddyPowerLogManager;
}

- (void)setBuddyPowerLogManager:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPowerLogManager, a3);
}

- (BMSystemSettingsAppearanceSetup)appearanceSetupEvent
{
  return self->_appearanceSetupEvent;
}

- (void)setAppearanceSetupEvent:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceSetupEvent, a3);
}

- (BMSystemSettingsChildMultitaskingSetup)childMultitaskingSetupEvent
{
  return self->_childMultitaskingSetupEvent;
}

- (void)setChildMultitaskingSetupEvent:(id)a3
{
  objc_storeStrong((id *)&self->_childMultitaskingSetupEvent, a3);
}

- (RTCReporting)rtcReporting
{
  return self->_rtcReporting;
}

- (void)setRtcReporting:(id)a3
{
  objc_storeStrong((id *)&self->_rtcReporting, a3);
}

- (NSNumber)combinedAnalyticsRepromptChoiceNumber
{
  return self->_combinedAnalyticsRepromptChoiceNumber;
}

- (void)setCombinedAnalyticsRepromptChoiceNumber:(id)a3
{
  objc_storeStrong((id *)&self->_combinedAnalyticsRepromptChoiceNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedAnalyticsRepromptChoiceNumber, 0);
  objc_storeStrong((id *)&self->_rtcReporting, 0);
  objc_storeStrong((id *)&self->_childMultitaskingSetupEvent, 0);
  objc_storeStrong((id *)&self->_appearanceSetupEvent, 0);
  objc_storeStrong((id *)&self->_buddyPowerLogManager, 0);
  objc_storeStrong((id *)&self->_didProduceLazyEventsBlocks, 0);
  objc_storeStrong((id *)&self->_lazyEvents, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong(&self->_childMultitaskingSetupEventBlock, 0);
  objc_storeStrong(&self->_appearanceSetupEventBlock, 0);
}

- (void)stash:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1A4E92000, v0, v1, "Failed to create payload for child multitasking setup event", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)stash:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1A4E92000, v0, v1, "Failed to create payload for appearance setup event", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __38__BYAnalyticsManager_commitThenUpload__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1A4E92000, v0, v1, "Analytics submission error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendStashedEventWithName:payload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1A4E92000, v0, v1, "Missing data version for event name %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendStashedEventWithName:payload:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1A4E92000, v0, v1, "Unknown event name %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendStashedEventWithName:payload:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1A4E92000, v0, v1, "Missing data for event name %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_sendAppearanceSetupEventWithData:dataVersion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1A4E92000, v0, v1, "Failed to create appearance setup event", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_sendChildMultitaskingSetupEventWithData:dataVersion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1A4E92000, v0, v1, "Failed to create child multitasking setup event", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
