@implementation TPSAnalyticsProcessingController

- (TPSAnalyticsProcessingController)initWithAllTipStatus:(id)a3 contextualInfoMap:(id)a4 eventHistoryMap:(id)a5 experiment:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  TPSAnalyticsUsageEventsProcessor *v14;
  TPSAnalyticsHistoricTipsDataProcessor *v15;
  void *v16;
  TPSAnalyticsProcessingController *v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(TPSAnalyticsUsageEventsProcessor);
  -[TPSAnalyticsProcessor setDataSource:](v14, "setDataSource:", self);
  v15 = objc_alloc_init(TPSAnalyticsHistoricTipsDataProcessor);
  -[TPSAnalyticsProcessor setDataSource:](v15, "setDataSource:", self);
  v19[0] = v14;
  v19[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[TPSAnalyticsProcessingController initWithAllTipStatus:contextualInfoMap:eventHistoryMap:experiment:processors:](self, "initWithAllTipStatus:contextualInfoMap:eventHistoryMap:experiment:processors:", v13, v12, v11, v10, v16);

  return v17;
}

- (TPSAnalyticsProcessingController)initWithAllTipStatus:(id)a3 contextualInfoMap:(id)a4 eventHistoryMap:(id)a5 experiment:(id)a6 processors:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  TPSAnalyticsProcessingController *v17;
  TPSAnalyticsProcessingController *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)TPSAnalyticsProcessingController;
  v17 = -[TPSAnalyticsProcessingController init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_processors, a7);
    objc_storeStrong((id *)&v18->_allTipStatus, a3);
    objc_storeStrong((id *)&v18->_contextualInfoMap, a4);
    objc_storeStrong((id *)&v18->_eventHistoryMap, a5);
    objc_storeStrong((id *)&v18->_experiment, a6);
  }

  return v18;
}

- (void)processAnalytics
{
  NSObject *v3;
  NSArray *processors;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  NSArray *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DBF3D0], "analytics");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    processors = self->_processors;
    *(_DWORD *)buf = 138412290;
    v22 = processors;
    _os_log_impl(&dword_1DAC2F000, v3, OS_LOG_TYPE_DEFAULT, "Processing analytics: %@", buf, 0xCu);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_processors;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v9;
        v14[1] = 3221225472;
        v14[2] = __52__TPSAnalyticsProcessingController_processAnalytics__block_invoke;
        v14[3] = &unk_1EA1E0728;
        v14[4] = v11;
        v15 = v12;
        v13 = v12;
        objc_msgSend(v11, "processAnalytics:", v14);

        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

uint64_t __52__TPSAnalyticsProcessingController_processAnalytics__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDateLastRun:", *(_QWORD *)(a1 + 40));
}

- (void)resetAnalytics
{
  NSObject *v3;
  NSArray *processors;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  NSArray *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DBF3D0], "analytics");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    processors = self->_processors;
    *(_DWORD *)buf = 138412290;
    v16 = processors;
    _os_log_impl(&dword_1DAC2F000, v3, OS_LOG_TYPE_DEFAULT, "Resetting analytics: %@", buf, 0xCu);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_processors;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "resetAnalytics", (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)allTipStatus
{
  return self->_allTipStatus;
}

- (id)allContextualInfo
{
  return -[NSDictionary allValues](self->_contextualInfoMap, "allValues");
}

- (id)contextualEventForIdentifier:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_eventHistoryMap, "objectForKeyedSubscript:", a3);
}

- (id)contextualInfoForIdentifier:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_contextualInfoMap, "objectForKeyedSubscript:", a3);
}

- (id)experiment
{
  return self->_experiment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experiment, 0);
  objc_storeStrong((id *)&self->_eventHistoryMap, 0);
  objc_storeStrong((id *)&self->_contextualInfoMap, 0);
  objc_storeStrong((id *)&self->_allTipStatus, 0);
  objc_storeStrong((id *)&self->_processors, 0);
}

@end
