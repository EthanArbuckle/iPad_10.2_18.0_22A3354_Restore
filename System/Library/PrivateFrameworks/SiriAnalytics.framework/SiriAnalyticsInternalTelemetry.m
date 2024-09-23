@implementation SiriAnalyticsInternalTelemetry

- (SiriAnalyticsInternalTelemetry)initWithPreferences:(id)a3
{
  id v4;
  SiriAnalyticsInternalTelemetry *v5;
  int v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SiriAnalyticsInternalTelemetry;
  v5 = -[SiriAnalyticsInternalTelemetry init](&v8, sel_init);
  if (v5)
  {
    if (SiriAnalyticsIsInternalInstall_onceToken != -1)
      dispatch_once(&SiriAnalyticsIsInternalInstall_onceToken, &__block_literal_global_874);
    v6 = SiriAnalyticsIsInternalInstall_isInternal;
    v5->_isInternal = SiriAnalyticsIsInternalInstall_isInternal;
    if (v6 && objc_msgSend(v4, "simulateCustomerImage"))
      v5->_isInternal = 0;
  }

  return v5;
}

- (void)trackEmittedEvents:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[SiriAnalyticsInternalTelemetry trackEventEmitted:](self, "trackEventEmitted:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)trackEventEmitted:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AnalyticsSendEventLazy();

}

- (void)trackAnyEventEmitted:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AnalyticsSendEventLazy();

}

- (void)trackLogicalClock:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[SiriAnalyticsInternalTelemetry _trackLogicalClock:isDerivativeClock:](self, "_trackLogicalClock:isDerivativeClock:", v4, 0);
  objc_msgSend(v4, "derivativeClocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__SiriAnalyticsInternalTelemetry_trackLogicalClock___block_invoke;
  v6[3] = &unk_1E4356E90;
  v6[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

- (void)_trackLogicalClock:(id)a3 isDerivativeClock:(BOOL)a4
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  AnalyticsSendEventLazy();

}

- (void)trackMessageStreamProcessed:(int64_t)a3 timeToFirstMessage:(int64_t)a4 messageCount:(unint64_t)a5 processingReason:(id)a6 failureReason:(id)a7
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a6;
  v11 = a7;
  v9 = v11;
  v10 = v8;
  AnalyticsSendEventLazy();

}

- (void)trackFBFError:(int)a3 forEventData:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  AnalyticsSendEventLazy();

}

- (void)trackMessageStagedWithSuccess:(BOOL)a3
{
  AnalyticsSendEventLazy();
}

- (void)trackRuntimeBootstrapWithKillSwitchEnabled:(BOOL)a3
{
  AnalyticsSendEventLazy();
}

- (void)trackRuntimeBootstrapCompleteWithBootstrapTimeInNs:(unint64_t)a3
{
  AnalyticsSendEventLazy();
}

id __85__SiriAnalyticsInternalTelemetry_trackRuntimeBootstrapCompleteWithBootstrapTimeInNs___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("hourOfDay");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 32, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hour");

  objc_msgSend(v2, "numberWithInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("bootstrapTimeInNs");
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __77__SiriAnalyticsInternalTelemetry_trackRuntimeBootstrapWithKillSwitchEnabled___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("killSwitchEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("hourOfDay");
  v11[0] = v1;
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 32, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hour");

  objc_msgSend(v2, "numberWithInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __64__SiriAnalyticsInternalTelemetry_trackMessageStagedWithSuccess___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("success");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __61__SiriAnalyticsInternalTelemetry_trackFBFError_forEventData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("eventSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("errorEnum");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __125__SiriAnalyticsInternalTelemetry_trackMessageStreamProcessed_timeToFirstMessage_messageCount_processingReason_failureReason___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99E08]);
  v11[0] = CFSTR("processedInNanoseconds");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = CFSTR("timeToFirstMessage");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[7]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  v11[2] = CFSTR("messageCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = CFSTR("reason");
  v6 = a1[4];
  v12[2] = v5;
  v12[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v2, "initWithDictionary:", v7);

  v9 = a1[5];
  if (v9)
    objc_msgSend(v8, "setValue:forKey:", v9, CFSTR("failureReason"));
  return v8;
}

id __71__SiriAnalyticsInternalTelemetry__trackLogicalClock_isDerivativeClock___block_invoke(uint64_t a1)
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
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("isolated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = CFSTR("messageCount");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "clockStatistics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "messagesEmitted"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = CFSTR("clockAge");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "clockStatistics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedLongLong:", objc_msgSend(v7, "clockAgeInNanoseconds"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v8;
  v14[3] = CFSTR("utilizationLifetime");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "clockStatistics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedLongLong:", objc_msgSend(v10, "utilizationLifetimeInNanoseconds"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __52__SiriAnalyticsInternalTelemetry_trackLogicalClock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_trackLogicalClock:isDerivativeClock:", a2, 1);
}

id __55__SiriAnalyticsInternalTelemetry_trackAnyEventEmitted___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  unsigned int v17;
  const __CFString *v18;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("hourOfDay");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 32, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hour");

  objc_msgSend(v2, "numberWithInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = CFSTR("byteSize");
  v21[0] = v7;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "unwrap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "qualifiedMessageName");
    v14 = objc_claimAutoreleasedReturnValue();

    if (v14)
      v15 = (__CFString *)v14;
    else
      v15 = CFSTR("unknown");
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = objc_msgSend(*(id *)(a1 + 32), "anyEventType") - 1;
    if (v17 > 0x64)
      v18 = CFSTR("UNKNOWN_EVENT");
    else
      v18 = off_1E4356F40[v17];
    objc_msgSend(v16, "stringWithFormat:", CFSTR("anyEvent.%@"), v18);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "setObject:forKey:", v15, CFSTR("messageType"));

  return v12;
}

id __52__SiriAnalyticsInternalTelemetry_trackEventEmitted___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("hourOfDay");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 32, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hour");

  objc_msgSend(v2, "numberWithInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("messageType");
  v18[0] = v7;
  objc_msgSend(*(id *)(a1 + 32), "underlyingMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "qualifiedMessageName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "storageRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v12, "payload");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "length"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v15, CFSTR("byteSize"));

  }
  return v11;
}

@end
