@implementation VSAnalytics

+ (void)reportEvent:(id)a3 payload:(id)a4
{
  id v5;
  id v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = AnalyticsSendEventLazy();
  VSGetLogDefault();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_debug_impl(&dword_1DE15E000, v9, OS_LOG_TYPE_DEBUG, "Successfully reportEvent with domain '%@'", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_error_impl(&dword_1DE15E000, v9, OS_LOG_TYPE_ERROR, "CoreAnalytics eventName:%@ not sent. Event name must not be in current config", buf, 0xCu);
  }

}

+ (void)reportInstrumentMetrics:(id)a3
{
  id v4;

  objc_msgSend(a3, "dictionaryMetrics");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "reportEvent:payload:", CFSTR("com.apple.voiceservices.metrics"), v4);

}

+ (void)reportDownloadMetrics:(id)a3
{
  id v4;
  void *v5;
  int v6;
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
  int v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "endMetrics"))
  {
    if (!objc_msgSend(v4, "errorCode"))
    {
      +[VSPreferencesInterface defaultInstance](VSPreferencesInterface, "defaultInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "OOBNeedsToBeMeasured");

      if (v6)
      {
        +[VSPreferencesInterface defaultInstance](VSPreferencesInterface, "defaultInstance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "OOBTriggeredDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        +[VSPreferencesInterface defaultInstance](VSPreferencesInterface, "defaultInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "subscribedVoicesForClientID:accessoryID:", CFSTR("com.apple.AssistantServices"), 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "voice");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          if (v12)
          {
            objc_msgSend(v4, "dictionaryMetrics");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("voice_asset_key"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "languages");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "firstObject");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v14, "hasPrefix:", v16);

            if (v17)
            {
              objc_msgSend(v12, "name");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v18
                || (objc_msgSend(v4, "dictionaryMetrics"),
                    v19 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("voice_asset_key")),
                    v20 = (void *)objc_claimAutoreleasedReturnValue(),
                    v21 = objc_msgSend(v20, "hasSuffix:", v18),
                    v20,
                    v19,
                    v21))
              {
                VSGetLogEvent();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v12, "languages");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "firstObject");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = 138412546;
                  v29 = v24;
                  v30 = 2112;
                  v31 = v18;
                  _os_log_impl(&dword_1DE15E000, v22, OS_LOG_TYPE_DEFAULT, "OOB subscription completion observed with %@ %@", (uint8_t *)&v28, 0x16u);

                }
                +[VSPreferencesInterface defaultInstance](VSPreferencesInterface, "defaultInstance");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "setOOBNeedsToBeMeasured:", 0);

                objc_msgSend(MEMORY[0x1E0C99D68], "now");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "timeIntervalSinceDate:", v8);
                objc_msgSend(v4, "setSetupTimeInterval:");

              }
            }
          }
        }

      }
    }
    objc_msgSend(v4, "dictionaryMetrics");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "reportEvent:payload:", CFSTR("com.apple.voiceservices.download"), v27);

  }
}

id __35__VSAnalytics_reportEvent_payload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
