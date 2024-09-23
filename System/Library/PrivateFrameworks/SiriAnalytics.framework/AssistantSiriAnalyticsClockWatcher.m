@implementation AssistantSiriAnalyticsClockWatcher

- (AssistantSiriAnalyticsClockWatcher)init
{

  return 0;
}

- (AssistantSiriAnalyticsClockWatcher)initWithInternalTelemetry:(id)a3 sensitiveConditionsObservers:(id)a4 clientMessageStream:(id)a5 preprocessor:(id)a6 metastore:(id)a7 scheduler:(id)a8 metadataExtractor:(id)a9 dataPolicyObserver:(id)a10
{
  id v17;
  AssistantSiriAnalyticsClockWatcher *v18;
  AssistantSiriAnalyticsClockWatcher *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v21 = a9;
  v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)AssistantSiriAnalyticsClockWatcher;
  v18 = -[AssistantSiriAnalyticsClockWatcher init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_internalTelemetry, a3);
    objc_storeStrong((id *)&v19->_sensitiveConditionsObservers, a4);
    objc_storeStrong((id *)&v19->_clientMessageStream, a5);
    objc_storeStrong((id *)&v19->_preprocessor, a6);
    objc_storeStrong((id *)&v19->_metastore, a7);
    objc_storeStrong((id *)&v19->_inactivityScheduler, a8);
    objc_storeStrong((id *)&v19->_metadataExtractor, a9);
    objc_storeStrong((id *)&v19->_dataPolicyObserver, a10);
  }

  return v19;
}

- (void)whiteRose:(id)a3 willCreateRootClock:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  SiriAnalyticsSensitiveConditionsObservers *sensitiveConditionsObservers;
  SiriAnalyticsSensitiveConditionsObservers *v13;
  _QWORD aBlock[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  SiriAnalyticsSensitiveConditionsObservers *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__AssistantSiriAnalyticsClockWatcher_whiteRose_willCreateRootClock_completion___block_invoke;
  aBlock[3] = &unk_1E4357C20;
  v9 = v8;
  v15 = v9;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v11 = SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_INFO))
  {
    sensitiveConditionsObservers = self->_sensitiveConditionsObservers;
    *(_DWORD *)buf = 136315650;
    v17 = "-[AssistantSiriAnalyticsClockWatcher whiteRose:willCreateRootClock:completion:]";
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = sensitiveConditionsObservers;
    _os_log_impl(&dword_1A025F000, v11, OS_LOG_TYPE_INFO, "%s Will create: %@, fetching sensitive conditions from %@", buf, 0x20u);
  }
  v13 = self->_sensitiveConditionsObservers;
  if (v13)
    -[SiriAnalyticsSensitiveConditionsObservers pollAllObserversWithCompletion:](v13, "pollAllObserversWithCompletion:", v10);
  else
    v10[2](v10);

}

- (void)whiteRose:(id)a3 rootClockCreated:(id)a4
{
  id v5;
  NSObject *v6;
  SiriAnalyticsMetastore *metastore;
  void *v8;
  void *v9;
  SiriAnalyticsDataCollectionPolicyClockObserver *dataPolicyObserver;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v6 = SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[AssistantSiriAnalyticsClockWatcher whiteRose:rootClockCreated:]";
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_1A025F000, v6, OS_LOG_TYPE_INFO, "%s Clock created: %@, triggering global dimension logging", buf, 0x16u);
  }
  -[SiriAnalyticsClockInactivityScheduler clockCreated](self->_inactivityScheduler, "clockCreated");
  -[AssistantSiriAnalyticsClockWatcher _triggerDeviceFixedContextOnStreamUUID:](self, "_triggerDeviceFixedContextOnStreamUUID:", 0);
  -[AssistantSiriAnalyticsClockWatcher _triggerSiriAccountInformation](self, "_triggerSiriAccountInformation");
  if (v5)
  {
    metastore = self->_metastore;
    objc_msgSend(v5, "clockIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clockStatistics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriAnalyticsMetastore createClock:rootClockIdentifier:startedOn:](metastore, "createClock:rootClockIdentifier:startedOn:", v8, 0, objc_msgSend(v9, "startedOn"));

  }
  dataPolicyObserver = self->_dataPolicyObserver;
  objc_msgSend(v5, "clockIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__AssistantSiriAnalyticsClockWatcher_whiteRose_rootClockCreated___block_invoke;
  v13[3] = &unk_1E4357B10;
  v14 = v5;
  v12 = v5;
  -[SiriAnalyticsDataCollectionPolicyClockObserver rootClockCreatedWithClockIdentifier:completion:](dataPolicyObserver, "rootClockCreatedWithClockIdentifier:completion:", v11, v13);

}

- (void)whiteRose:(id)a3 rootClockDestroyed:(id)a4 reason:(unint64_t)a5 completion:(id)a6
{
  id v9;
  NSObject *v10;
  SiriAnalyticsMetastore *metastore;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  SiriAnalyticsMetastore *v19;
  void *v20;
  void *v21;
  SiriAnalyticsMetadataExtractor *metadataExtractor;
  void *v23;
  SiriAnalyticsClockInactivityScheduler *inactivityScheduler;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v26 = a6;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v10 = SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[AssistantSiriAnalyticsClockWatcher whiteRose:rootClockDestroyed:reason:completion:]";
    v34 = 2112;
    v35 = v9;
    _os_log_impl(&dword_1A025F000, v10, OS_LOG_TYPE_INFO, "%s Clock destroyed: %@", buf, 0x16u);
  }
  -[SiriAnalyticsInternalTelemetry trackLogicalClock:](self->_internalTelemetry, "trackLogicalClock:", v9);
  metastore = self->_metastore;
  objc_msgSend(v9, "clockIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clockStatistics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriAnalyticsMetastore endClock:endedOn:endedReason:](metastore, "endClock:endedOn:endedReason:", v12, objc_msgSend(v13, "endedOn"), a5);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v9, "derivativeClocks");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        v19 = self->_metastore;
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "clockIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "clockStatistics");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[SiriAnalyticsMetastore endClock:endedOn:endedReason:](v19, "endClock:endedOn:endedReason:", v20, objc_msgSend(v21, "endedOn"), a5);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v16);
  }

  metadataExtractor = self->_metadataExtractor;
  objc_msgSend(v9, "clockIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriAnalyticsMetadataExtractor pruneWithClockIdentifier:](metadataExtractor, "pruneWithClockIdentifier:", v23);

  -[SiriAnalyticsMetastore checkpoint](self->_metastore, "checkpoint");
  inactivityScheduler = self->_inactivityScheduler;
  if (inactivityScheduler)
  {
    v25 = v26;
    if (a5 == 3)
    {
      -[SiriAnalyticsClockInactivityScheduler destroyInactivityTimer](inactivityScheduler, "destroyInactivityTimer");
      -[SiriAnalyticsPreprocessor triggerWithReason:completion:](self->_preprocessor, "triggerWithReason:completion:", 2, v26);
    }
    else
    {
      -[SiriAnalyticsClockInactivityScheduler clockExpiredWithCompletion:](inactivityScheduler, "clockExpiredWithCompletion:", v26);
    }
  }
  else
  {
    v25 = v26;
    (*((void (**)(id))v26 + 2))(v26);
  }

}

- (void)whiteRose:(id)a3 derivativeClockCreated:(id)a4 rootClock:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  SiriAnalyticsMetastore *metastore;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v9 = SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_INFO))
  {
    v15 = 136315650;
    v16 = "-[AssistantSiriAnalyticsClockWatcher whiteRose:derivativeClockCreated:rootClock:]";
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_1A025F000, v9, OS_LOG_TYPE_INFO, "%s Derivative clock created: %@ from parent: %@, triggering partial global dimension logging", (uint8_t *)&v15, 0x20u);
  }
  objc_msgSend(v7, "isolatedStreamUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantSiriAnalyticsClockWatcher _triggerDeviceFixedContextOnStreamUUID:](self, "_triggerDeviceFixedContextOnStreamUUID:", v10);

  metastore = self->_metastore;
  objc_msgSend(v7, "clockIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clockIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clockStatistics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriAnalyticsMetastore createClock:rootClockIdentifier:startedOn:](metastore, "createClock:rootClockIdentifier:startedOn:", v12, v13, objc_msgSend(v14, "startedOn"));

}

- (void)_triggerDeviceFixedContextOnStreamUUID:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (objc_class *)MEMORY[0x1E0D995D8];
  v5 = a3;
  v12 = objc_alloc_init(v4);
  v6 = objc_alloc_init(MEMORY[0x1E0D995E0]);
  objc_msgSend(v12, "setDeviceFixedContext:", v6);

  objc_msgSend(v12, "deviceFixedContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "setTimeIntervalSince1970:");

  objc_msgSend(v12, "deviceFixedContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsLowPowerModeEnabled:", objc_msgSend(v10, "isLowPowerModeEnabled"));

  objc_msgSend(v12, "deviceFixedContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProgramCode:", 1);

  -[SiriAnalyticsClientMessageStream resolvePartialMessage:isolatedStreamUUID:](self->_clientMessageStream, "resolvePartialMessage:isolatedStreamUUID:", v12, v5);
}

- (void)_triggerSiriAccountInformation
{
  id v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0D995D8]);
  v3 = objc_alloc_init(MEMORY[0x1E0D995E8]);
  objc_msgSend(v4, "setSiriAccountInformation:", v3);

  -[SiriAnalyticsClientMessageStream resolvePartialMessage:](self->_clientMessageStream, "resolvePartialMessage:", v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataPolicyObserver, 0);
  objc_storeStrong((id *)&self->_metadataExtractor, 0);
  objc_storeStrong((id *)&self->_inactivityScheduler, 0);
  objc_storeStrong((id *)&self->_metastore, 0);
  objc_storeStrong((id *)&self->_preprocessor, 0);
  objc_storeStrong((id *)&self->_clientMessageStream, 0);
  objc_storeStrong((id *)&self->_sensitiveConditionsObservers, 0);
  objc_storeStrong((id *)&self->_internalTelemetry, 0);
}

void __65__AssistantSiriAnalyticsClockWatcher_whiteRose_rootClockCreated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v2 = (void *)SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "clockIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "-[AssistantSiriAnalyticsClockWatcher whiteRose:rootClockCreated:]_block_invoke";
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1A025F000, v4, OS_LOG_TYPE_INFO, "%s Finished checking data policy for: %@", (uint8_t *)&v6, 0x16u);

  }
}

uint64_t __79__AssistantSiriAnalyticsClockWatcher_whiteRose_willCreateRootClock_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
