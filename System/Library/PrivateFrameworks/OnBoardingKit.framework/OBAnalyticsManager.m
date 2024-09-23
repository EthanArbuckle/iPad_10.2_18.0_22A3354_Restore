@implementation OBAnalyticsManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_4);
  return (id)sharedManager_manager;
}

void __35__OBAnalyticsManager_sharedManager__block_invoke()
{
  OBAnalyticsManager *v0;
  void *v1;

  v0 = objc_alloc_init(OBAnalyticsManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

- (OBAnalyticsManager)init
{
  OBAnalyticsManager *v2;
  NSMutableArray *v3;
  NSMutableArray *events;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OBAnalyticsManager;
  v2 = -[OBAnalyticsManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    events = v2->_events;
    v2->_events = v3;

  }
  return v2;
}

- (void)addEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[OBAnalyticsManager events](self, "events");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)addEvent:(id)a3 withPayload:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  +[OBAnalyticsEvent eventWithName:withPayload:](OBAnalyticsEvent, "eventWithName:withPayload:", a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (-[OBAnalyticsManager shouldStashMetrics](self, "shouldStashMetrics"))
  {
    -[OBAnalyticsManager addEvent:](self, "addEvent:", v7);
  }
  else
  {
    objc_msgSend(v7, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "payload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
}

- (void)commit
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _OBLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199FE5000, v3, OS_LOG_TYPE_DEFAULT, "Commiting analytics...", buf, 2u);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[OBAnalyticsManager events](self, "events", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "payload");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        AnalyticsSendEvent();

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v6);
  }

}

- (void)logPresentationOfPrivacyUnifiedAbout
{
  NSObject *v3;
  uint8_t v4[16];

  _OBLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_199FE5000, v3, OS_LOG_TYPE_DEFAULT, "presentation of unified about", v4, 2u);
  }

  -[OBAnalyticsManager logPresentationOfPrivacySplashWithIdentifier:](self, "logPresentationOfPrivacySplashWithIdentifier:", CFSTR("com.apple.onboardingkit.unifiedAbout"));
}

- (void)logPresentationOfPrivacySplashWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  const __CFString *v7;
  id v8;
  uint8_t buf[4];
  const __CFString *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _OBLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v10 = CFSTR("gdprAboutShown");
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_199FE5000, v5, OS_LOG_TYPE_DEFAULT, "presentation of about event: %@ identifier: %@", buf, 0x16u);
  }

  v7 = CFSTR("bundleid");
  v8 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBAnalyticsManager addEvent:withPayload:](self, "addEvent:withPayload:", CFSTR("gdprAboutShown"), v6);

}

- (void)logPresentationOfPrivacyLinkWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  const __CFString *v7;
  id v8;
  uint8_t buf[4];
  const __CFString *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _OBLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v10 = CFSTR("gdprLinkShown");
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_199FE5000, v5, OS_LOG_TYPE_DEFAULT, "presentation of about event: %@ identifier: %@", buf, 0x16u);
  }

  v7 = CFSTR("bundleid");
  v8 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBAnalyticsManager addEvent:withPayload:](self, "addEvent:withPayload:", CFSTR("gdprLinkShown"), v6);

}

- (void)logTapOnPrivacyLinkWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  const __CFString *v7;
  id v8;
  uint8_t buf[4];
  const __CFString *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _OBLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v10 = CFSTR("gdprLinkClicked");
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_199FE5000, v5, OS_LOG_TYPE_DEFAULT, "presentation of about event: %@ identifier: %@", buf, 0x16u);
  }

  v7 = CFSTR("bundleid");
  v8 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBAnalyticsManager addEvent:withPayload:](self, "addEvent:withPayload:", CFSTR("gdprLinkClicked"), v6);

}

- (BOOL)shouldStashMetrics
{
  return self->_shouldStashMetrics;
}

- (void)setShouldStashMetrics:(BOOL)a3
{
  self->_shouldStashMetrics = a3;
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
}

@end
