@implementation STCoreAnalyticsReporter

+ (void)reportEvent:(id)a3
{
  id v3;
  void *v4;
  id v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = AnalyticsSendEventLazy();

  +[STLog coreAnalytics](STLog, "coreAnalytics");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "payload");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_1D22E7000, v8, OS_LOG_TYPE_DEFAULT, "Sent Core Analytics event: %@ %@", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    +[STCoreAnalyticsReporter reportEvent:].cold.1(v5, v8);
  }

}

uint64_t __39__STCoreAnalyticsReporter_reportEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "payload");
}

+ (void)reportEvent:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D22E7000, a2, OS_LOG_TYPE_ERROR, "Failed to send Core Analytics event: %@", (uint8_t *)&v4, 0xCu);

}

@end
