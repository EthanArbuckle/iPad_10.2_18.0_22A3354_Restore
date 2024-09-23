@implementation PXStoryAnalyticsUsageDestination

- (PXStoryAnalyticsUsageDestination)init
{
  PXStoryAnalyticsUsageDestination *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *sessionInfosByIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXStoryAnalyticsUsageDestination;
  v2 = -[PXStoryAnalyticsUsageDestination init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sessionInfosByIdentifier = v2->_sessionInfosByIdentifier;
    v2->_sessionInfosByIdentifier = v3;

  }
  return v2;
}

- (id)_createInfoForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _PXStoryAnalyticsSessionInfo *v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "propertyForKey:", CFSTR("interactiveMemorySessionIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionInfosByIdentifier, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      PXAssertGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v11) = 0;
        _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "previously existing _PXStoryAnalyticsSessionInfo", (uint8_t *)&v11, 2u);
      }

    }
    v8 = -[_PXStoryAnalyticsSessionInfo initWithEvent:]([_PXStoryAnalyticsSessionInfo alloc], "initWithEvent:", v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionInfosByIdentifier, "setObject:forKeyedSubscript:", v8, v5);
  }
  else
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "missing PXStoryAnalyticsPayloadKeySessionIdentifier for %@", (uint8_t *)&v11, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (id)_existingInfoForEvent:(id)a3
{
  return -[PXStoryAnalyticsUsageDestination _existingInfoForEvent:pop:](self, "_existingInfoForEvent:pop:", a3, 0);
}

- (id)_popInfoForEndEvent:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PXStoryAnalyticsUsageDestination _existingInfoForEvent:pop:](self, "_existingInfoForEvent:pop:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finalizeWithEvent:", v4);

  return v5;
}

- (id)_existingInfoForEvent:(id)a3 pop:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "propertyForKey:", CFSTR("interactiveMemorySessionIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionInfosByIdentifier, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (!v4)
        goto LABEL_12;
      goto LABEL_11;
    }
    PXAssertGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v7;
      _os_log_error_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "missing _PXStoryAnalyticsSessionInfo for %@", (uint8_t *)&v12, 0xCu);
    }

    if (v4)
LABEL_11:
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionInfosByIdentifier, "setObject:forKeyedSubscript:", 0, v7);
  }
  else
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "missing PXStoryAnalyticsPayloadKeySessionIdentifier for %@", (uint8_t *)&v12, 0xCu);
    }

    v8 = 0;
  }
LABEL_12:

  return v8;
}

- (id)_createDefaultPayloadForInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "startEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copyRawPayload");
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  if (!v6)
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v3;
      _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "missing startEvent payload for %@", (uint8_t *)&v13, 0xCu);
    }

    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  objc_msgSend(v3, "endEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyRawPayload");
  objc_msgSend(v6, "addEntriesFromDictionary:", v9);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, CFSTR("interactiveMemorySessionIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "pauseCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("interactiveMemoryPlaybackSummaryPauseCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "appSuspensionCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("interactiveMemoryPlaybackSummaryAppSuspensionCount"));

  return v6;
}

- (void)_enumerateExistingInfosUsingBlock:(id)a3
{
  id v4;
  NSMutableDictionary *sessionInfosByIdentifier;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  sessionInfosByIdentifier = self->_sessionInfosByIdentifier;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__PXStoryAnalyticsUsageDestination__enumerateExistingInfosUsingBlock___block_invoke;
  v7[3] = &unk_1E511FB70;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sessionInfosByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)_sendSummaryEventsForInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  if (v4)
  {
    -[PXStoryAnalyticsUsageDestination _createDefaultPayloadForInfo:](self, "_createDefaultPayloadForInfo:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.memory.interactiveMemoryPlaybackSummary"), v5);
    v6 = (void *)MEMORY[0x1E0D09910];
    PXStoryAnalyticsEventForSummaryWithPauseCount(objc_msgSend(v4, "pauseCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendEvent:withPayload:", v7, v5);

  }
  else
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "can't send summary events for missing _PXStoryAnalyticsSessionInfo", v8, 2u);
    }
  }

}

- (void)processEvent:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a3;
  objc_msgSend(v8, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.photos.memory.interactiveMemorySessionBegan")))
  {
    v5 = -[PXStoryAnalyticsUsageDestination _createInfoForEvent:](self, "_createInfoForEvent:", v8);
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.photos.memory.interactiveMemorySessionPaused")))
  {
    -[PXStoryAnalyticsUsageDestination _existingInfoForEvent:](self, "_existingInfoForEvent:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didPauseWithEvent:", v8);

  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D096B0]))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__PXStoryAnalyticsUsageDestination_processEvent___block_invoke;
    v9[3] = &unk_1E511FBA0;
    v10 = v8;
    -[PXStoryAnalyticsUsageDestination _enumerateExistingInfosUsingBlock:](self, "_enumerateExistingInfosUsingBlock:", v9);

  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.photos.memory.interactiveMemorySessionEnded")))
  {
    -[PXStoryAnalyticsUsageDestination _popInfoForEndEvent:](self, "_popInfoForEndEvent:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryAnalyticsUsageDestination _sendSummaryEventsForInfo:](self, "_sendSummaryEventsForInfo:", v7);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionInfosByIdentifier, 0);
}

uint64_t __49__PXStoryAnalyticsUsageDestination_processEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didSuspendAppWithEvent:", *(_QWORD *)(a1 + 32));
}

uint64_t __70__PXStoryAnalyticsUsageDestination__enumerateExistingInfosUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
