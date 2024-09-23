@implementation VUIMetricsController

- (BOOL)perfEventPublishingEnabled
{
  return self->_isGDPRConsented;
}

- (void)_handleTabBarChange:(id)a3
{
  void *v4;
  void *v5;
  NSObject *metricsDataDispatchSQ;
  _QWORD v7[5];
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("VUIMetricsTabBarItemNotificationKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    objc_storeStrong((id *)&self->_currentTabIdentifier, v5);
    metricsDataDispatchSQ = self->_metricsDataDispatchSQ;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__VUIMetricsController__handleTabBarChange___block_invoke;
    v7[3] = &unk_1E9F98FD8;
    v7[4] = self;
    v8 = v5;
    dispatch_async(metricsDataDispatchSQ, v7);

  }
}

- (void)_initializeBaseFields
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  dispatch_time_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  NSObject *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  __CFString *v31;

  objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC8880], "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitlements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__26;
  v30 = __Block_byref_object_dispose__26;
  v31 = CFSTR("unknown");
  v7 = dispatch_semaphore_create(0);
  +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "launchConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "useConfigCacheIgnoreExpiry");

  objc_msgSend(MEMORY[0x1E0DC8788], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v12 = 5;
  else
    v12 = 0;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __45__VUIMetricsController__initializeBaseFields__block_invoke;
  v23 = &unk_1E9FA2260;
  v25 = &v26;
  v13 = v7;
  v24 = v13;
  objc_msgSend(v11, "fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:", 0, v12, 0, &v20);

  objc_msgSend(v3, "consentedBrands", v20, v21, v22, v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v14, CFSTR("cbids"));

  objc_msgSend(v3, "deniedBrands");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v15, CFSTR("dbids"));

  objc_msgSend(v5, "objectForKey:", CFSTR("Installed"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v16, CFSTR("ibids"));

  objc_msgSend(v5, "objectForKey:", CFSTR("Subscribed"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v17, CFSTR("sbids"));

  -[VUIMetricsController _getLocationAuthorizationStatus](self, "_getLocationAuthorizationStatus");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v18, CFSTR("locationAuthorization"));

  v19 = dispatch_time(0, 60000000000);
  dispatch_semaphore_wait(v13, v19);
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v27[5], CFSTR("vppaState"));
  objc_msgSend(v6, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("sharedActivity"));
  -[VUIMetricsController setBaseFields:](self, "setBaseFields:", v6);

  _Block_object_dispose(&v26, 8);
}

- (id)_getLocationAuthorizationStatus
{
  void *v2;
  uint64_t v3;
  const __CFString *v4;

  objc_msgSend(MEMORY[0x1E0DC87C8], "defaultLocationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "authorizationStatus");

  v4 = CFSTR("undetermined");
  if (v3 == 1)
    v4 = CFSTR("approved");
  if (v3)
    return (id)v4;
  else
    return CFSTR("denied");
}

void __51__VUIMetricsController__recordEvent_withEventData___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  id v8;

  if (objc_msgSend(a1[4], "isEqualToString:", CFSTR("page")))
  {
    objc_msgSend(a1[5], "vui_stringForKey:", CFSTR("pageContext"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("tab")) & 1) == 0)
    {
      objc_msgSend(a1[5], "vui_stringForKey:", CFSTR("pageContext"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("tabBar")))
      {

      }
      else
      {
        objc_msgSend(a1[5], "vui_stringForKey:", CFSTR("pageType"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("PreRoll"));

        if ((v5 & 1) != 0)
          goto LABEL_8;
        +[VUIMetricsPageEventData createWithMetricsData:](VUIMetricsPageEventData, "createWithMetricsData:", a1[5]);
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "setLastRecordedPageEventData:", v2);
      }
    }

  }
LABEL_8:
  objc_msgSend(a1[6], "_createDataAddingBaseAndPageFieldsToEventData:forEventType:", a1[5], a1[4]);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[4], "isEqualToString:", CFSTR("pageRender")))
  {
    objc_msgSend(MEMORY[0x1E0DC69C0], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "pagePerformanceEnabled");

    if (v7)
      objc_msgSend(*((id *)a1[6] + 16), "recordPagePerfRenderEventWithVuiDictionary:", v8);
  }
  else
  {
    objc_msgSend(a1[6], "_recordEventWithJet:withEventData:", a1[4], v8);
  }

}

- (void)_recordEventWithJet:(id)a3 withEventData:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  _QWORD v24[5];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (!self->_isGDPRConsented)
  {
    v9 = CFSTR("xp_amp_tv_unidentified");
    goto LABEL_9;
  }
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("pageRender")))
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("log")))
      v9 = CFSTR("xp_amp_tv_log");
    else
      v9 = CFSTR("xp_amp_tv_main");
LABEL_9:
    -[VUIMetricsController lastRecordedPageEventData](self, "lastRecordedPageEventData");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "vui_stringForKey:", CFSTR("pageType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("PreRoll")))
    {

    }
    else
    {
      objc_msgSend(v7, "vui_stringForKey:", CFSTR("pageType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("MediaPlayer"));

      if (!v12)
      {
        objc_msgSend(v7, "vui_stringForKey:", CFSTR("pageType"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("Tab"));

        if (v18)
        {
          -[VUIMetricsController sidebarPageMetrics](self, "sidebarPageMetrics");
          v13 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v7, "vui_stringForKey:", CFSTR("pageType"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("TabBar"));

          if (v20)
          {
            -[VUIMetricsController tabBarPageMetrics](self, "tabBarPageMetrics");
            v13 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v7, "vui_stringForKey:", CFSTR("pageType"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("ProfileSelector"));

            if (!v22)
            {
              if (v8)
              {
                -[NSObject generateMetricsDataDictionary](v8, "generateMetricsDataDictionary");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                -[VUIMetricsController _processPageFields:forEventType:](self, "_processPageFields:forEventType:", v23, v6);
                v14 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v14 = (void *)MEMORY[0x1E0C9AA70];
              }
              goto LABEL_14;
            }
            -[VUIMetricsController profileSelectorPageMetrics](self, "profileSelectorPageMetrics");
            v13 = objc_claimAutoreleasedReturnValue();
          }
        }
LABEL_13:
        v14 = (void *)v13;
LABEL_14:
        +[VUIMetricsJetEngine sharedInstance](VUIMetricsJetEngine, "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "recordEventWithTopic:eventType:eventData:pageData:", v9, v6, v7, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __58__VUIMetricsController__recordEventWithJet_withEventData___block_invoke;
        v24[3] = &unk_1E9F9E7D8;
        v24[4] = self;
        objc_msgSend(v16, "addFinishBlock:", v24);

        goto LABEL_15;
      }
    }
    -[VUIMetricsController extractPageMetricsFromEventData:](self, "extractPageMetricsFromEventData:", v7);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_INFO, "Tried to publish render event to Jet which should be handled by PageRenderMetricsPresenter. Ignoring.", buf, 2u);
  }
LABEL_15:

}

- (VUIMetricsPageEventData)lastRecordedPageEventData
{
  return self->_lastRecordedPageEventData;
}

- (id)_createDataAddingBaseAndPageFieldsToEventData:(id)a3 forEventType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "addEntriesFromDictionary:", v5);
  if (self->_baseFields)
    objc_msgSend(v7, "addEntriesFromDictionary:");
  objc_msgSend(v5, "vui_stringForKey:", CFSTR("pageContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[VUIMetricsPageEventData eventData](self->_lastRecordedPageEventData, "eventData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "vui_stringForKey:", CFSTR("pageContext"));
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!objc_msgSend(v10, "length"))
  {
    if (-[VUIMetricsController _isSiri](self, "_isSiri"))
    {
      v12 = CFSTR("siri");
    }
    else
    {
      -[VUIMetricsController baseFields](self, "baseFields");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", CFSTR("pageContext"));
      v14 = objc_claimAutoreleasedReturnValue();

      v15 = &stru_1E9FF3598;
      if (v14)
        v15 = (__CFString *)v14;
      v12 = v15;

      v10 = (id)v14;
    }

    v10 = (id)v12;
  }
  objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("pageContext"));
  objc_msgSend(v5, "vui_dictionaryForKey:", CFSTR("pageDetails"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
    objc_msgSend(v7, "setObject:forKey:", v16, CFSTR("pageDetails"));
  objc_msgSend(v5, "objectForKey:", CFSTR("resourceRevNum"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringForKey:", CFSTR("jsVersion"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "vui_setObjectIfNotNil:forKey:", v19, CFSTR("resourceRevNum"));
  }

  return v7;
}

- (BOOL)_isSiri
{
  return 0;
}

void __44__VUIMetricsController__handleTabBarChange___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4 = CFSTR("pageContext");
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateBaseFieldsWithData:", v3);

}

- (void)_recordEvent:(id)a3 withEventData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  VUIScopedBackgroundTask *v14;
  void *v15;
  NSObject *v16;
  VUIMetricsController *v17;
  VUICachedMetricsEvent *v18;
  void *v19;
  void *v20;
  NSObject *metricsDataDispatchSQ;
  _QWORD block[4];
  id v23;
  id v24;
  VUIMetricsController *v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[VUIMetricsController isInDebugMode](self, "isInDebugMode"))
  {
    -[VUIMetricsController baseFields](self, "baseFields");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "vui_BOOLForKey:defaultValue:", CFSTR("sharedActivity"), 0);

    -[VUIMetricsController baseFields](self, "baseFields");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "vui_numberForKey:", CFSTR("sharedActivityDevicesCurrent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    if (v12)
      v13 = 0;
    else
      v13 = v9;
    if (v13 == 1)
    {
      v14 = (VUIScopedBackgroundTask *)objc_msgSend(v7, "mutableCopy");
      -[VUIMetricsController createEventTime](self, "createEventTime");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIScopedBackgroundTask setValue:forKey:](v14, "setValue:forKey:", v15, CFSTR("eventTime"));
      VUIDefaultLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v27 = v6;
        v28 = 2112;
        v29 = v15;
        _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_INFO, "VUIMetricsController: caching %@ event with timestamp %@  until shared activity data is available", buf, 0x16u);
      }

      v17 = self;
      objc_sync_enter(v17);
      v18 = -[VUICachedMetricsEvent initWithEventType:eventData:]([VUICachedMetricsEvent alloc], "initWithEventType:eventData:", v6, v7);
      -[VUIMetricsController cachedGroupEvents](v17, "cachedGroupEvents");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v18);

      objc_sync_exit(v17);
    }
    else
    {
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("pageRender")) & 1) == 0
        && (objc_msgSend(v6, "isEqualToString:", CFSTR("log")) & 1) == 0)
      {
        -[VUIMetricsController setLastEventType:](self, "setLastEventType:", v6);
        -[VUIMetricsController setLastEventData:](self, "setLastEventData:", v7);
      }
      -[VUIMetricsController currentTabIdentifier](self, "currentTabIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMetricsController setLastTabIdentifier:](self, "setLastTabIdentifier:", v20);

      v14 = -[VUIScopedBackgroundTask initWithIdentifier:expirationHandler:]([VUIScopedBackgroundTask alloc], "initWithIdentifier:expirationHandler:", CFSTR("VUIMetricsBackgroundTask"), 0);
      -[VUIMetricsController setBackgroundTask:](self, "setBackgroundTask:", v14);
      metricsDataDispatchSQ = self->_metricsDataDispatchSQ;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__VUIMetricsController__recordEvent_withEventData___block_invoke;
      block[3] = &unk_1E9F99840;
      v23 = v6;
      v24 = v7;
      v25 = self;
      dispatch_async(metricsDataDispatchSQ, block);

      v15 = v23;
    }

  }
}

- (void)_updateBaseFieldsWithData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[VUIMetricsController baseFields](self, "baseFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[VUIMetricsController _initializeBaseFields](self, "_initializeBaseFields");
  -[VUIMetricsController baseFields](self, "baseFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (v8)
    objc_msgSend(v6, "addEntriesFromDictionary:", v8);
  v7 = (void *)objc_msgSend(v6, "copy");
  -[VUIMetricsController setBaseFields:](self, "setBaseFields:", v7);

}

- (NSDictionary)baseFields
{
  VUIMetricsController *v2;
  NSDictionary *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_baseFields;
  objc_sync_exit(v2);

  return v3;
}

- (void)setBaseFields:(id)a3
{
  NSDictionary *v4;
  NSDictionary *baseFields;
  VUIMetricsController *obj;

  v4 = (NSDictionary *)a3;
  obj = self;
  objc_sync_enter(obj);
  baseFields = obj->_baseFields;
  obj->_baseFields = v4;

  objc_sync_exit(obj);
}

- (void)setLastTabIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_lastTabIdentifier, a3);
}

- (void)setLastEventType:(id)a3
{
  objc_storeStrong((id *)&self->_lastEventType, a3);
}

- (void)setLastEventData:(id)a3
{
  objc_storeStrong((id *)&self->_lastEventData, a3);
}

- (void)setBackgroundTask:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundTask, a3);
}

- (BOOL)isInDebugMode
{
  return self->_isInDebugMode;
}

- (NSString)currentTabIdentifier
{
  return self->_currentTabIdentifier;
}

id __46__VUIMetricsController_setupMetricsController__block_invoke()
{
  return +[VUIMetricsJetEngine sharedInstance](VUIMetricsJetEngine, "sharedInstance");
}

- (void)recordAppBecameActive
{
  NSObject *v3;
  _BOOL4 isAppJustLaunched;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  const __CFString *v9;
  __CFString *v10;
  uint8_t buf[4];
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    isAppJustLaunched = self->_isAppJustLaunched;
    *(_DWORD *)buf = 67109120;
    v12 = isAppJustLaunched;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_INFO, "VUIMetricsController: recordAppBecameActive _isAppJustLaunched=%hhd", buf, 8u);
  }

  if (self->_isAppJustDeepLinkOpened)
  {
    self->_isAppJustDeepLinkOpened = 0;
  }
  else
  {
    if (self->_isAppJustLaunched)
      v5 = CFSTR("launch");
    else
      v5 = CFSTR("taskSwitch");
    v9 = CFSTR("type");
    v10 = v5;
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = v5;
    objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIMetricsController _recordEnter:](self, "_recordEnter:", v8, v9, v10);
  }
}

- (void)_recordEnter:(id)a3
{
  if (self->_shouldRecordEnter)
  {
    -[VUIMetricsController _recordEvent:withEventData:](self, "_recordEvent:withEventData:", CFSTR("enter"), a3);
    *(_WORD *)&self->_shouldRecordEnter = 256;
    self->_isAppJustLaunched = 0;
  }
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__VUIMetricsController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once_326 != -1)
    dispatch_once(&sharedInstance_once_326, block);
  return (id)sharedInstance_sharedInstance_327;
}

- (void)setShouldPostAppLaunchData:(BOOL)a3
{
  self->_shouldPostAppLaunchData = a3;
}

void __38__VUIMetricsController_sharedInstance__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  VUISignpostLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MetricsController.Init", ", buf, 2u);
  }

  v3 = objc_alloc_init(*(Class *)(a1 + 32));
  v4 = (void *)sharedInstance_sharedInstance_327;
  sharedInstance_sharedInstance_327 = (uint64_t)v3;

  VUISignpostLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MetricsController.Init", ", v6, 2u);
  }

}

- (VUIMetricsController)init
{
  VUIMetricsController *v2;
  VUIMetricsController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIMetricsController;
  v2 = -[VUIMetricsController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[VUIMetricsController setupMetricsController](v2, "setupMetricsController");
  return v3;
}

- (void)setupMetricsController
{
  const char *v3;
  NSObject *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *metricsDataDispatchSQ;
  NSHashTable *v7;
  NSHashTable *savedRecentEvents;
  VUIMetricsLocalRecorder *v9;
  void *v10;
  VUIMetricsLocalRecorder *v11;
  VUIMetricsLocalRecorder *localMetricsRecorder;
  NSObject *v13;
  _BOOL4 isGDPRConsented;
  NSMutableArray *v15;
  NSMutableArray *cachedGroupEvents;
  NSMutableArray *v17;
  NSMutableArray *cachedUnifiedMessagingImpressions;
  NSObject *v19;
  _QWORD block[5];
  uint8_t buf[4];
  _BOOL4 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  self->_isAppJustLaunched = 1;
  *(_WORD *)&self->_shouldRecordEnter = 1;
  v3 = (const char *)VUIMetrics_serialQueueLabel;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (OS_dispatch_queue *)dispatch_queue_create(v3, v4);
  metricsDataDispatchSQ = self->_metricsDataDispatchSQ;
  self->_metricsDataDispatchSQ = v5;

  self->_isInternalBuild = os_variant_has_internal_content();
  v7 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 0, 30);
  savedRecentEvents = self->_savedRecentEvents;
  self->_savedRecentEvents = v7;

  v9 = [VUIMetricsLocalRecorder alloc];
  +[VUIMetricsDiskManager sharedInstance](VUIMetricsDiskManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[VUIMetricsLocalRecorder initWithStorageManager:](v9, "initWithStorageManager:", v10);
  localMetricsRecorder = self->_localMetricsRecorder;
  self->_localMetricsRecorder = v11;

  self->_isGDPRConsented = objc_msgSend(MEMORY[0x1E0CFD9C0], "acknowledgementNeededForPrivacyIdentifier:", CFSTR("com.apple.onboarding.tvapp")) ^ 1;
  VUIDefaultLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    isGDPRConsented = self->_isGDPRConsented;
    *(_DWORD *)buf = 67109120;
    v22 = isGDPRConsented;
    _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_INFO, "VUIMetricsController: setupMetricsController; GDPR Consented=%d",
      buf,
      8u);
  }

  dispatch_async((dispatch_queue_t)self->_metricsDataDispatchSQ, &__block_literal_global_126);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  cachedGroupEvents = self->_cachedGroupEvents;
  self->_cachedGroupEvents = v15;

  v17 = (NSMutableArray *)objc_opt_new();
  cachedUnifiedMessagingImpressions = self->_cachedUnifiedMessagingImpressions;
  self->_cachedUnifiedMessagingImpressions = v17;

  v19 = self->_metricsDataDispatchSQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VUIMetricsController_setupMetricsController__block_invoke_2;
  block[3] = &unk_1E9F98DF0;
  block[4] = self;
  dispatch_async(v19, block);
  -[VUIMetricsController registerForBaseFieldChanges](self, "registerForBaseFieldChanges");
}

- (void)registerForBaseFieldChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleTabBarChange_, CFSTR("TVAppRootViewControllerCurrentNavigationControllerDidChangeNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleServerConfigChange_, *MEMORY[0x1E0DC88E8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleWLKSettingsDidChange_, *MEMORY[0x1E0DC89D8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleWLKAppLibChange_, *MEMORY[0x1E0DC88B8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__handleWLKLocationManagerChange_, *MEMORY[0x1E0DC8950], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__handleGroupActivitiesSessionStateChange_, CFSTR("GroupActivitiesSessionStateDidChangeNotification"), 0);

}

uint64_t __46__VUIMetricsController_setupMetricsController__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_initializeBaseFields");
}

void __45__VUIMetricsController__initializeBaseFields__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_INFO, "WLK fetch error %@", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    objc_msgSend(a2, "vppaStatusString");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __58__VUIMetricsController__recordEventWithJet_withEventData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __58__VUIMetricsController__recordEventWithJet_withEventData___block_invoke_cold_1((uint64_t)v6, v7);
  }
  else
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__VUIMetricsController__recordEventWithJet_withEventData___block_invoke_350;
    v11[3] = &unk_1E9F98FD8;
    v9 = v5;
    v10 = *(_QWORD *)(a1 + 32);
    v12 = v9;
    v13 = v10;
    dispatch_async(v8, v11);
    v7 = v12;
  }

}

- (void)_saveRecentEvents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  uint64_t v42;
  void *v43;
  const __CFString *v44;
  uint64_t v45;
  void *v46;
  const __CFString *v47;
  uint64_t v48;
  void *v49;
  const __CFString *v50;
  uint64_t v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  void *v55;
  char v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  uint64_t v72;
  __CFString *v73;
  id obj;
  id obja;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  id v88;
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  NSObject *v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  __CFString *v96;
  _QWORD v97[4];
  _QWORD v98[4];
  _BYTE v99[128];
  _QWORD v100[4];
  _QWORD v101[4];
  _BYTE v102[128];
  _QWORD v103[58];

  v103[55] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && self->_isInternalBuild)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("eventType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("pageRender")) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC69C0], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "metricsPageRenderLoggingEnabled");

      if (!v8)
        goto LABEL_68;
    }
    else
    {

    }
    -[NSHashTable addObject:](self->_savedRecentEvents, "addObject:", v5);
    objc_msgSend(MEMORY[0x1E0DC69C0], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "metricsExpandedLoggingEnabled");

    if (v10)
    {
      v88 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 1, &v88);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v88;
      if (v11)
      {
        v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, 4);
        VUIDefaultLogObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("eventType"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "uppercaseString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v90 = v16;
          v91 = 2112;
          v92 = v13;
          _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_INFO, "========== %@ Metrics Event ========== (all fields):%@", buf, 0x16u);

        }
      }
      else
      {
        VUIDefaultLogObject();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v90 = v5;
          v91 = 2112;
          v92 = v12;
          _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_INFO, "VUIMetricsController: Unserializable event data: [%@] error:[%@]", buf, 0x16u);
        }
      }
LABEL_67:

      goto LABEL_68;
    }
    objc_msgSend(MEMORY[0x1E0DC69C0], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "metricsLoggingEnabled");

    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v5);
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("eventType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v103[0] = CFSTR("eventType");
      v103[1] = CFSTR("dbids");
      v103[2] = CFSTR("storeFront");
      v103[3] = CFSTR("capacityDataAvailable");
      v103[4] = CFSTR("osVersion");
      v103[5] = CFSTR("clientCorrelationKey");
      v103[6] = CFSTR("connection");
      v103[7] = CFSTR("capacityDisk");
      v103[8] = CFSTR("clientId");
      v103[9] = CFSTR("eventTime");
      v103[10] = CFSTR("capacitySystem");
      v103[11] = CFSTR("baseVersion");
      v103[12] = CFSTR("platformName");
      v103[13] = CFSTR("xpPostFrequency");
      v103[14] = CFSTR("ibids");
      v103[15] = CFSTR("hardwareFamily");
      v103[16] = CFSTR("hardwareModel");
      v103[17] = CFSTR("os");
      v103[18] = CFSTR("app");
      v103[19] = CFSTR("pixelRatio");
      v103[20] = CFSTR("windowOuterHeight");
      v103[21] = CFSTR("timezoneOffset");
      v103[22] = CFSTR("environment");
      v103[23] = CFSTR("isSignedIn");
      v103[24] = CFSTR("screenWidth");
      v103[25] = CFSTR("resourceRevNum");
      v103[26] = CFSTR("capacityData");
      v103[27] = CFSTR("screenHeight");
      v103[28] = CFSTR("environmentBuild");
      v103[29] = CFSTR("xpSendMethod");
      v103[30] = CFSTR("eventVersion");
      v103[31] = CFSTR("appVersion");
      v103[32] = CFSTR("sbids");
      v103[33] = CFSTR("capacitySystemAvailable");
      v103[34] = CFSTR("windowOuterWidth");
      v103[35] = CFSTR("utsc");
      v103[36] = CFSTR("clientEventId");
      v103[37] = CFSTR("osBuildNumber");
      v103[38] = CFSTR("environmentDataCenter");
      v103[39] = CFSTR("storeFrontHeader");
      v103[40] = CFSTR("userType");
      v103[41] = CFSTR("xpDelegatesInfo");
      v103[42] = CFSTR("userAgent");
      v103[43] = CFSTR("platformId");
      v103[44] = CFSTR("language");
      v103[45] = CFSTR("cbids");
      v103[46] = CFSTR("osLanguages");
      v103[47] = CFSTR("xpViewableThreshold");
      v103[48] = CFSTR("xpViewablePercentage");
      v103[49] = CFSTR("dsId");
      v103[50] = CFSTR("locationAuthorization");
      v103[51] = CFSTR("vppaState");
      v103[52] = CFSTR("page");
      v103[53] = CFSTR("pageHistory");
      v103[54] = CFSTR("topic");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 55);
      v72 = objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isEqualToString:", CFSTR("click")) & 1) != 0
        || objc_msgSend(v11, "isEqualToString:", CFSTR("impressions")))
      {
        -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("impressions"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v12;
        v71 = v5;
        v68 = v19;
        v69 = v11;
        if (objc_msgSend(v19, "count"))
        {
          v78 = (void *)objc_opt_new();
          v84 = 0u;
          v85 = 0u;
          v86 = 0u;
          v87 = 0u;
          obj = v19;
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v102, 16);
          if (v20)
          {
            v21 = v20;
            v76 = *(_QWORD *)v85;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v85 != v76)
                  objc_enumerationMutation(obj);
                v23 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
                v100[0] = CFSTR("id");
                objc_msgSend(v23, "objectForKey:");
                v24 = objc_claimAutoreleasedReturnValue();
                v25 = (void *)v24;
                if (v24)
                  v26 = (const __CFString *)v24;
                else
                  v26 = &stru_1E9FF3598;
                v101[0] = v26;
                v100[1] = CFSTR("name");
                objc_msgSend(v23, "objectForKey:");
                v27 = objc_claimAutoreleasedReturnValue();
                v28 = (void *)v27;
                if (v27)
                  v29 = (const __CFString *)v27;
                else
                  v29 = &stru_1E9FF3598;
                v101[1] = v29;
                v100[2] = CFSTR("impressionType");
                objc_msgSend(v23, "objectForKey:", CFSTR("impressionType"));
                v30 = objc_claimAutoreleasedReturnValue();
                v31 = (void *)v30;
                if (v30)
                  v32 = (const __CFString *)v30;
                else
                  v32 = &stru_1E9FF3598;
                v101[2] = v32;
                v100[3] = CFSTR("impressionIndex");
                objc_msgSend(v23, "objectForKey:", CFSTR("impressionIndex"));
                v33 = objc_claimAutoreleasedReturnValue();
                v34 = (void *)v33;
                if (v33)
                  v35 = (const __CFString *)v33;
                else
                  v35 = &stru_1E9FF3598;
                v101[3] = v35;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v100, 4);
                v36 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v78, "addObject:", v36);
              }
              v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v102, 16);
            }
            while (v21);
          }

          -[NSObject removeObjectsForKeys:](v12, "removeObjectsForKeys:", &unk_1EA0BBAD8);
          -[NSObject setObject:forKey:](v12, "setObject:forKey:", v78, CFSTR("impressions (ABRIDGED)"));
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<<Impressions count: %lu>>"), objc_msgSend(obj, "count"));
          v73 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v5 = v71;
          v19 = v68;
          v11 = v69;
        }
        else
        {
          v73 = &stru_1E9FF3598;
        }
        -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("location"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v37, "count"))
        {
          v79 = (void *)objc_opt_new();
          v80 = 0u;
          v81 = 0u;
          v82 = 0u;
          v83 = 0u;
          obja = v37;
          v38 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v80, v99, 16);
          if (v38)
          {
            v39 = v38;
            v77 = *(_QWORD *)v81;
            do
            {
              for (j = 0; j != v39; ++j)
              {
                if (*(_QWORD *)v81 != v77)
                  objc_enumerationMutation(obja);
                v41 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * j);
                v97[0] = CFSTR("id");
                objc_msgSend(v41, "objectForKey:");
                v42 = objc_claimAutoreleasedReturnValue();
                v43 = (void *)v42;
                if (v42)
                  v44 = (const __CFString *)v42;
                else
                  v44 = &stru_1E9FF3598;
                v98[0] = v44;
                v97[1] = CFSTR("name");
                objc_msgSend(v41, "objectForKey:");
                v45 = objc_claimAutoreleasedReturnValue();
                v46 = (void *)v45;
                if (v45)
                  v47 = (const __CFString *)v45;
                else
                  v47 = &stru_1E9FF3598;
                v98[1] = v47;
                v97[2] = CFSTR("locationType");
                objc_msgSend(v41, "objectForKey:", CFSTR("locationType"));
                v48 = objc_claimAutoreleasedReturnValue();
                v49 = (void *)v48;
                if (v48)
                  v50 = (const __CFString *)v48;
                else
                  v50 = &stru_1E9FF3598;
                v98[2] = v50;
                v97[3] = CFSTR("locationPosition");
                objc_msgSend(v41, "objectForKey:", CFSTR("locationPosition"));
                v51 = objc_claimAutoreleasedReturnValue();
                v52 = (void *)v51;
                if (v51)
                  v53 = (const __CFString *)v51;
                else
                  v53 = &stru_1E9FF3598;
                v98[3] = v53;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 4);
                v54 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v79, "addObject:", v54);
              }
              v39 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v80, v99, 16);
            }
            while (v39);
          }

          v12 = v70;
          -[NSObject removeObjectsForKeys:](v70, "removeObjectsForKeys:", &unk_1EA0BBAF0);
          -[NSObject setObject:forKey:](v70, "setObject:forKey:", v79, CFSTR("location (ABRIDGED)"));

          v5 = v71;
          v19 = v68;
          v11 = v69;
        }

      }
      else
      {
        v73 = &stru_1E9FF3598;
      }
      -[NSObject objectForKey:](v12, "objectForKey:", CFSTR("sharedActivity"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "BOOLValue");

      if ((v56 & 1) == 0)
        -[NSObject removeObjectsForKeys:](v12, "removeObjectsForKeys:", &unk_1EA0BBB08);
      objc_msgSend(v5, "allKeys");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allKeys");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "indexesOfObjectsPassingTest:", &__block_literal_global_490);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "objectsAtIndexes:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "allKeys");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allKeys");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "indexesOfObjectsPassingTest:", &__block_literal_global_497);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "objectsAtIndexes:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v72;
      -[NSObject removeObjectsForKeys:](v12, "removeObjectsForKeys:", v72);
      -[NSObject removeObjectsForKeys:](v12, "removeObjectsForKeys:", v64);
      objc_msgSend(v5, "dictionaryWithValuesForKeys:", v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject removeObjectsForKeys:](v12, "removeObjectsForKeys:", v60);
      VUIDefaultLogObject();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v11, "uppercaseString");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v90 = v67;
        v91 = 2112;
        v92 = v12;
        v93 = 2112;
        v94 = v65;
        v95 = 2112;
        v96 = v73;
        _os_log_impl(&dword_1D96EE000, v66, OS_LOG_TYPE_INFO, "========== %@ Metrics Event ========== (limited fields):%@ %@ %@", buf, 0x2Au);

      }
      goto LABEL_67;
    }
  }
LABEL_68:

}

void __40__VUIMetricsController_recordPerfEvent___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint8_t buf[16];

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 11))
  {
    v7 = (id)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "shouldPostAppLaunchData"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v2, CFSTR("isAppLaunch"));

    if (objc_msgSend(*(id *)(a1 + 32), "shouldPostAppLaunchData"))
    {
      objc_msgSend(*(id *)(a1 + 32), "setShouldPostAppLaunchData:", 0);
      v3 = *(id *)(a1 + 32);
      objc_sync_enter(v3);
      +[VUIPerfMetricsAppLaunchController sharedInstance](VUIPerfMetricsAppLaunchController, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appLaunchData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addEntriesFromDictionary:", v5);

      objc_sync_exit(v3);
    }
    objc_msgSend(*(id *)(a1 + 32), "_recordEvent:withEventData:", CFSTR("pageRender"), v7);

  }
  else
  {
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_INFO, "No perf event - GDPR not consented", buf, 2u);
    }

  }
}

- (BOOL)shouldPostAppLaunchData
{
  return self->_shouldPostAppLaunchData;
}

- (void)setLastRecordedPageEventData:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  VUIMetricsPageEventData *v9;
  VUIMetricsPageEventData *lastRecordedPageEventData;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "pageId");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pageType");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v4, "length") || -[__CFString length](v5, "length"))
  {
    objc_msgSend(v11, "eventData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v7 = v4;
    else
      v7 = &stru_1E9FF3598;
    if (v5)
      v8 = v5;
    else
      v8 = &stru_1E9FF3598;
    +[VUIMetricsPageEventData createWithPageId:andPageType:andEventData:](VUIMetricsPageEventData, "createWithPageId:andPageType:andEventData:", v7, v8, v6);
    v9 = (VUIMetricsPageEventData *)objc_claimAutoreleasedReturnValue();
    lastRecordedPageEventData = self->_lastRecordedPageEventData;
    self->_lastRecordedPageEventData = v9;

  }
}

- (void)recordPerfEvent:(id)a3
{
  id v4;
  NSObject *metricsDataDispatchSQ;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  metricsDataDispatchSQ = self->_metricsDataDispatchSQ;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__VUIMetricsController_recordPerfEvent___block_invoke;
  v7[3] = &unk_1E9F98FD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(metricsDataDispatchSQ, v7);

}

- (void)recordPage:(id)a3
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
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  int v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_isGDPRConsented || -[VUIMetricsController _isSiri](self, "_isSiri"))
  {
    -[VUIMetricsController lastEventType](self, "lastEventType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("page"));

    if (!v6)
    {
LABEL_12:
      objc_msgSend(v4, "generateMetricsDataDictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMetricsController _recordEvent:withEventData:](self, "_recordEvent:withEventData:", CFSTR("page"), v8);
LABEL_13:

      goto LABEL_14;
    }
    -[VUIMetricsController lastEventData](self, "lastEventData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("pageId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIMetricsController lastEventData](self, "lastEventData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("pageType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIMetricsController lastTabIdentifier](self, "lastTabIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMetricsController lastEventData](self, "lastEventData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("searchTerm"));
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "eventData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("searchTerm"));
    v15 = objc_claimAutoreleasedReturnValue();

    if (v15 | v13)
      v16 = objc_msgSend((id)v15, "isEqualToString:", v13) ^ 1;
    else
      v16 = 0;
    objc_msgSend(v4, "pageId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", v8))
    {
      objc_msgSend(v4, "pageType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "isEqualToString:", v10) ^ 1 | v16) != 1)
      {
        -[VUIMetricsController currentTabIdentifier](self, "currentTabIdentifier");
        v21 = v8;
        v22 = v10;
        v23 = v11;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v23, "isEqualToString:", v24);

        v11 = v23;
        v10 = v22;
        v8 = v21;

        if (v26)
        {
          VUIDefaultLogObject();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v28 = v21;
            v29 = 2112;
            v30 = v10;
            _os_log_impl(&dword_1D96EE000, v25, OS_LOG_TYPE_INFO, "VUIMetricsController: Discarding duplicate page event pageId=%@ pageType=%@", buf, 0x16u);
          }

          goto LABEL_13;
        }
        goto LABEL_11;
      }

    }
LABEL_11:

    goto LABEL_12;
  }
  VUIDefaultLogObject();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "pageId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v20;
    _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_INFO, "VUIMetricsController: caching page event until GDPR acceptance pageType:%@", buf, 0xCu);

  }
  -[VUIMetricsController setGdprCachedPageEvent:](self, "setGdprCachedPageEvent:", v4);
LABEL_14:

}

- (NSString)lastTabIdentifier
{
  return self->_lastTabIdentifier;
}

- (NSString)lastEventType
{
  return self->_lastEventType;
}

- (NSDictionary)lastEventData
{
  return self->_lastEventData;
}

- (id)getBasePerfData:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  if (a3)
  {
    +[VUIPerfMetricsAppLaunchController sharedInstance](VUIPerfMetricsAppLaunchController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appLaunchData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

  }
  else
  {
    v7 = (void *)objc_opt_new();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v8, CFSTR("isAppLaunch"));

  -[VUIMetricsController _createDataAddingBaseAndPageFieldsToEventData:forEventType:](self, "_createDataAddingBaseAndPageFieldsToEventData:forEventType:", v7, CFSTR("pageRender"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_processPageFields:(id)a3 forEventType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("enter")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("exit")))
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("sharedContent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v8, "removeObjectForKey:", CFSTR("sharedContent"));
      v9 = objc_msgSend(v8, "copy");

      v5 = (id)v9;
    }
  }

  return v5;
}

- (id)iTunesLibraryPlaybackMediaMetricsForAdamID:(id)a3 mediaType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nowPlayingConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "allowQOSReportingForiTunesLibraryPlayback");

  v10 = 0;
  if (v5 && v9)
  {
    if ((objc_msgSend(v5, "isEqualToNumber:", &unk_1EA0B9D30) & 1) == 0 && objc_msgSend(v6, "length"))
    {
      if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DB1DC0]) & 1) != 0
        || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DB1DD0]) & 1) != 0)
      {
        v11 = CFSTR("movie");
LABEL_8:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("a=%@:s=%@:e=%@"), v5, *MEMORY[0x1E0DC88E0], v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = CFSTR("MediaIdentifier");
        v14[1] = CFSTR("iTunesServiceMonitoringKey");
        v15[0] = v12;
        v15[1] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
      if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DB1DD8]))
      {
        v11 = CFSTR("episode");
        goto LABEL_8;
      }
    }
    v10 = 0;
  }
LABEL_12:

  return v10;
}

- (id)_getCurrentMetricsTopic
{
  if (self->_isGDPRConsented)
    return CFSTR("xp_amp_tv_main");
  else
    return CFSTR("xp_amp_tv_unidentified");
}

- (void)recordAppLaunched
{
  NSObject *v3;
  void *v4;
  uint8_t v5[8];
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_INFO, "VUIMetricsController: recordAppLaunched", v5, 2u);
  }

  v6 = CFSTR("type");
  v7[0] = CFSTR("launch");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMetricsController _recordEnter:](self, "_recordEnter:", v4);

}

- (void)recordOpenUrlLaunchWithExtURL:(id)a3 andOptions:(id)a4
{
  __CFString *v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[3];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = a4;
  self->_isAppJustDeepLinkOpened = 1;
  if (self->_isAppJustLaunched)
    v8 = CFSTR("linkedLaunch");
  else
    v8 = CFSTR("linkedTaskSwitch");
  v9 = v8;
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0DC4810]);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v6);
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "openURLHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "queryParameterStringfromURL:parameter:", v11, CFSTR("refApp"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v14 = v10;

  }
  objc_msgSend(v7, "vui_dictionaryForKey:", *MEMORY[0x1E0DC4800]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "vui_stringForKey:", *MEMORY[0x1E0CA5810]);
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("navigate");
  if (!v6)
    v17 = CFSTR("default");
  v18 = v17;
  if ((-[__CFString containsString:](v6, "containsString:", CFSTR("?play")) & 1) != 0
    || -[__CFString containsString:](v6, "containsString:", CFSTR("action=play")))
  {

    v18 = CFSTR("play");
  }
  if (v10)
    v19 = v10;
  else
    v19 = &stru_1E9FF3598;
  v30[0] = CFSTR("refApp");
  v30[1] = CFSTR("extRefUrl");
  if (v16)
    v20 = v16;
  else
    v20 = &stru_1E9FF3598;
  v31[0] = v19;
  v31[1] = v20;
  v30[2] = CFSTR("openUrl");
  if (v6)
    v21 = v6;
  else
    v21 = &stru_1E9FF3598;
  v31[2] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMetricsController setCachedOpenUrlData:](self, "setCachedOpenUrlData:", v22);

  v23 = (void *)MEMORY[0x1E0C99E08];
  v28[0] = CFSTR("type");
  v28[1] = CFSTR("actionType");
  v29[0] = v9;
  v29[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dictionaryWithDictionary:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIMetricsController cachedOpenUrlData](self, "cachedOpenUrlData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addEntriesFromDictionary:", v26);

  v27 = (void *)objc_msgSend(v25, "copy");
  -[VUIMetricsController _recordEnter:](self, "_recordEnter:", v27);

}

- (void)recordAppWillTerminate
{
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("type");
  v5[0] = CFSTR("quit");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMetricsController _recordExit:](self, "_recordExit:", v3);

}

- (void)recordAppWillBackground
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("destinationUrl");
  v8[0] = CFSTR("taskSwitch");
  -[VUIMetricsController exitEventDestinationUrl](self, "exitEventDestinationUrl");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_1E9FF3598;
  if (v3)
    v5 = (const __CFString *)v3;
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMetricsController _recordExit:](self, "_recordExit:", v6);

  -[VUIMetricsController setExitEventDestinationUrl:](self, "setExitEventDestinationUrl:", 0);
}

- (void)_recordExit:(id)a3
{
  id v4;

  if (self->_shouldRecordExit)
  {
    *(_WORD *)&self->_shouldRecordEnter = 1;
    v4 = a3;
    -[VUIMetricsController setShouldFlushMetrics:](self, "setShouldFlushMetrics:", 1);
    -[VUIMetricsController _recordEvent:withEventData:](self, "_recordEvent:withEventData:", CFSTR("exit"), v4);

  }
}

- (void)recordPageChange:(id)a3
{
  id v4;

  objc_msgSend(a3, "generateMetricsDataDictionary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIMetricsController _recordEvent:withEventData:](self, "_recordEvent:withEventData:", CFSTR("pageChange"), v4);

}

- (void)recordDialog:(id)a3
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
  NSObject *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VUIMetricsController lastEventType](self, "lastEventType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("dialog"));

  if (!v6)
    goto LABEL_8;
  objc_msgSend(v4, "objectForKey:", CFSTR("dialogId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("dialogType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMetricsController lastEventData](self, "lastEventData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("dialogId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIMetricsController lastEventData](self, "lastEventData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("dialogType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "isEqualToString:", v10)
    || !objc_msgSend(v8, "isEqualToString:", v12))
  {

LABEL_8:
    -[VUIMetricsController _recordEvent:withEventData:](self, "_recordEvent:withEventData:", CFSTR("dialog"), v4);
    goto LABEL_9;
  }
  VUIDefaultLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = 138412546;
    v15 = v10;
    v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_INFO, "VUIMetricsController: Discarding duplicate dialog event dialogId=%@ dialogType=%@", (uint8_t *)&v14, 0x16u);
  }

LABEL_9:
}

- (void)recordClick:(id)a3
{
  -[VUIMetricsController _recordEvent:withEventData:](self, "_recordEvent:withEventData:", CFSTR("click"), a3);
}

- (void)recordImpressions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = a3;
  if (self->_isGDPRConsented)
  {
    -[VUIMetricsController setShouldFlushMetrics:](self, "setShouldFlushMetrics:", 0);
    objc_msgSend(v4, "vui_arrayForKey:", CFSTR("impressions"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "count"))
    {
      -[VUIMetricsController cachedUnifiedMessagingImpressions](self, "cachedUnifiedMessagingImpressions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");

      if (v8 && -[NSObject count](v8, "count"))
      {
        v9 = (void *)objc_opt_new();
        objc_msgSend(v9, "addObjectsFromArray:", v6);
        objc_msgSend(v9, "addObjectsFromArray:", v8);
        -[NSMutableArray removeAllObjects](self->_cachedUnifiedMessagingImpressions, "removeAllObjects");
        VUIDefaultLogObject();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_INFO, "VUIMetricsController: adding cached Unified Messaging impressions to impressions event", v14, 2u);
        }

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(v11, "setValue:forKey:", v12, CFSTR("impressions"));

        v13 = (void *)objc_msgSend(v11, "copy");
        -[VUIMetricsController _recordEvent:withEventData:](self, "_recordEvent:withEventData:", CFSTR("impressions"), v13);

      }
      else
      {
        -[VUIMetricsController _recordEvent:withEventData:](self, "_recordEvent:withEventData:", CFSTR("impressions"), v4);
      }
    }
    else
    {
      VUIDefaultLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_INFO, "VUIMetricsController: no impressions found for recordImpressions", buf, 2u);
      }
    }

  }
}

- (void)recordMedia:(id)a3
{
  if (self->_isGDPRConsented)
    -[VUIMetricsController _recordEvent:withEventData:](self, "_recordEvent:withEventData:", CFSTR("media"), a3);
}

- (void)recordSearch:(id)a3
{
  -[VUIMetricsController _recordEvent:withEventData:](self, "_recordEvent:withEventData:", CFSTR("search"), a3);
}

- (void)recordRawEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_INFO, "VUIMetricsController: received raw event type:[%@]", (uint8_t *)&v7, 0xCu);
  }

  -[VUIMetricsController _recordEvent:withEventData:](self, "_recordEvent:withEventData:", v5, v4);
}

uint64_t __58__VUIMetricsController__recordEventWithJet_withEventData___block_invoke_350(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "_saveRecentEvents:");
  return objc_msgSend(*(id *)(a1 + 40), "setBackgroundTask:", 0);
}

- (void)recordLog:(id)a3
{
  id v4;
  NSObject *metricsDataDispatchSQ;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  metricsDataDispatchSQ = self->_metricsDataDispatchSQ;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__VUIMetricsController_recordLog___block_invoke;
  v7[3] = &unk_1E9F98FD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(metricsDataDispatchSQ, v7);

}

void __34__VUIMetricsController_recordLog___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t buf[16];

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[11])
  {
    objc_msgSend(v2, "_createDataAddingBaseAndPageFieldsToEventData:forEventType:", *(_QWORD *)(a1 + 40), CFSTR("log"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", CFSTR("log"), CFSTR("eventType"));
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("cbids"));
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("dbids"));
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("ibids"));
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("sbids"));
    v4 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(*(id *)(a1 + 32), "_recordEventWithJet:withEventData:", CFSTR("log"), v4);

  }
  else
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_INFO, "No log event - GDPR not consented", buf, 2u);
    }

  }
}

- (id)createEventTime
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  v4 = v3 * 1000.0;

  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", (uint64_t)v4);
}

- (NSDictionary)sidebarPageMetrics
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("pageId");
  v3[1] = CFSTR("pageType");
  v4[0] = CFSTR("Tab");
  v4[1] = CFSTR("Tab");
  v3[2] = CFSTR("pageContext");
  v4[2] = CFSTR("tab");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)tabBarPageMetrics
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("pageId");
  v3[1] = CFSTR("pageType");
  v4[0] = CFSTR("TabBar");
  v4[1] = CFSTR("TabBar");
  v3[2] = CFSTR("pageContext");
  v4[2] = CFSTR("tabBar");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)profileSelectorPageMetrics
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("pageId");
  v3[1] = CFSTR("pageType");
  v4[0] = CFSTR("ProfileSelector");
  v4[1] = CFSTR("ProfileSelector");
  v3[2] = CFSTR("pageContext");
  v4[2] = CFSTR("tab");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)extractPageMetricsFromEventData:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "vui_stringForKey:", CFSTR("pageId"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (__CFString *)v4;
  else
    v6 = &stru_1E9FF3598;
  v7 = v6;

  objc_msgSend(v3, "vui_stringForKey:", CFSTR("pageType"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (__CFString *)v8;
  else
    v10 = &stru_1E9FF3598;
  v11 = v10;

  objc_msgSend(v3, "vui_stringForKey:", CFSTR("pageContext"));
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = v12;
  else
    v13 = &stru_1E9FF3598;
  v14 = v13;

  v17[0] = CFSTR("pageId");
  v17[1] = CFSTR("pageType");
  v18[0] = v7;
  v18[1] = v11;
  v17[2] = CFSTR("pageContext");
  v18[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)forceGDPRConsentStatus:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_INFO, "GDPR forced status: %d", (uint8_t *)v6, 8u);
  }

  -[VUIMetricsController _setGDPRConsentStatus:](self, "_setGDPRConsentStatus:", v3);
}

- (void)updateGDPRConsentStatus
{
  uint64_t v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CFD9C0], "acknowledgementNeededForPrivacyIdentifier:", CFSTR("com.apple.onboarding.tvapp")) ^ 1;
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_INFO, "GDPR update: consented %d", (uint8_t *)v5, 8u);
  }

  -[VUIMetricsController _setGDPRConsentStatus:](self, "_setGDPRConsentStatus:", v3);
}

- (void)_setGDPRConsentStatus:(BOOL)a3
{
  NSObject *metricsDataDispatchSQ;
  _QWORD v4[5];
  BOOL v5;

  metricsDataDispatchSQ = self->_metricsDataDispatchSQ;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__VUIMetricsController__setGDPRConsentStatus___block_invoke;
  v4[3] = &unk_1E9F9A5F8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(metricsDataDispatchSQ, v4);
}

void __46__VUIMetricsController__setGDPRConsentStatus___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  _BOOL4 v4;
  _BYTE *v5;
  BOOL v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 11);
  *(_BYTE *)(v2 + 11) = *(_BYTE *)(a1 + 40);
  v4 = +[VUIUtilities isTVApp](VUIUtilities, "isTVApp");
  v5 = *(_BYTE **)(a1 + 32);
  if (v3)
    v6 = 1;
  else
    v6 = v5[11] == 0;
  if (!v6 && v4)
  {
    v8 = (void *)MEMORY[0x1E0C99E08];
    v20[0] = CFSTR("eventType");
    v20[1] = CFSTR("type");
    v21[0] = CFSTR("account");
    v21[1] = CFSTR("consentGranted");
    v20[2] = CFSTR("consentType");
    v21[2] = CFSTR("GDPR");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryWithDictionary:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "cachedOpenUrlData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "cachedOpenUrlData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addEntriesFromDictionary:", v12);

      objc_msgSend(*(id *)(a1 + 32), "setCachedOpenUrlData:", 0);
    }
    v13 = *(void **)(a1 + 32);
    v14 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v13, "_recordEvent:withEventData:", CFSTR("account"), v14);

    objc_msgSend(*(id *)(a1 + 32), "gdprCachedPageEvent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "recordPage:", v15);
      objc_msgSend(*(id *)(a1 + 32), "setGdprCachedPageEvent:", 0);
    }

    v5 = *(_BYTE **)(a1 + 32);
  }
  objc_msgSend(v5, "baseFields");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  v18 = *(void **)(a1 + 32);
  v19 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v18, "setBaseFields:", v19);

  objc_msgSend(*(id *)(a1 + 32), "_updateBaseFieldsWithData:", 0);
}

- (void)flushMetrics
{
  id v2;

  +[VUIMetricsJetEngine sharedInstance](VUIMetricsJetEngine, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flushMetrics");

}

- (void)_removeBaseFieldsForKeys:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[VUIMetricsController baseFields](self, "baseFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (v7)
    objc_msgSend(v5, "removeObjectsForKeys:", v7);
  v6 = (void *)objc_msgSend(v5, "copy");
  -[VUIMetricsController setBaseFields:](self, "setBaseFields:", v6);

}

- (void)_handleServerConfigChange:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject *metricsDataDispatchSQ;
  id v8;
  _QWORD v9[5];
  id v10;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "objectForKey:", CFSTR("vppaState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vui_setObjectIfNotNil:forKey:", v6, CFSTR("vppaState"));

  metricsDataDispatchSQ = self->_metricsDataDispatchSQ;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__VUIMetricsController__handleServerConfigChange___block_invoke;
  v9[3] = &unk_1E9F98FD8;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(metricsDataDispatchSQ, v9);

}

uint64_t __50__VUIMetricsController__handleServerConfigChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBaseFieldsWithData:", *(_QWORD *)(a1 + 40));
}

- (void)_handleWLKSettingsDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *metricsDataDispatchSQ;
  id v9;
  _QWORD block[5];
  id v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("cbids");
  objc_msgSend(v4, "consentedBrands");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v12[1] = CFSTR("dbids");
  objc_msgSend(v4, "deniedBrands");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  metricsDataDispatchSQ = self->_metricsDataDispatchSQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__VUIMetricsController__handleWLKSettingsDidChange___block_invoke;
  block[3] = &unk_1E9F98FD8;
  block[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(metricsDataDispatchSQ, block);

}

uint64_t __52__VUIMetricsController__handleWLKSettingsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBaseFieldsWithData:", *(_QWORD *)(a1 + 40));
}

- (void)_handleWLKAppLibChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *metricsDataDispatchSQ;
  id v10;
  _QWORD v11[5];
  id v12;

  objc_msgSend(MEMORY[0x1E0DC8880], "currentEnvironment", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitlements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "objectForKey:", CFSTR("Installed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v7, CFSTR("ibids"));

  objc_msgSend(v5, "objectForKey:", CFSTR("Subscribed"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v8, CFSTR("sbids"));

  metricsDataDispatchSQ = self->_metricsDataDispatchSQ;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__VUIMetricsController__handleWLKAppLibChange___block_invoke;
  v11[3] = &unk_1E9F98FD8;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  dispatch_async(metricsDataDispatchSQ, v11);

}

uint64_t __47__VUIMetricsController__handleWLKAppLibChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBaseFieldsWithData:", *(_QWORD *)(a1 + 40));
}

- (void)_handleWLKLocationManagerChange:(id)a3
{
  void *v4;
  void *v5;
  NSObject *metricsDataDispatchSQ;
  id v7;
  _QWORD block[5];
  id v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = CFSTR("locationAuthorization");
  -[VUIMetricsController _getLocationAuthorizationStatus](self, "_getLocationAuthorizationStatus", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  metricsDataDispatchSQ = self->_metricsDataDispatchSQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__VUIMetricsController__handleWLKLocationManagerChange___block_invoke;
  block[3] = &unk_1E9F98FD8;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(metricsDataDispatchSQ, block);

}

uint64_t __56__VUIMetricsController__handleWLKLocationManagerChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBaseFieldsWithData:", *(_QWORD *)(a1 + 40));
}

- (void)_handleGroupActivitiesSessionStateChange:(id)a3
{
  id v4;
  NSObject *metricsDataDispatchSQ;
  id v6;
  _QWORD v7[4];
  id v8;
  VUIMetricsController *v9;

  v4 = a3;
  metricsDataDispatchSQ = self->_metricsDataDispatchSQ;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__VUIMetricsController__handleGroupActivitiesSessionStateChange___block_invoke;
  v7[3] = &unk_1E9F98FD8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(metricsDataDispatchSQ, v7);

}

void __65__VUIMetricsController__handleGroupActivitiesSessionStateChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  _QWORD v27[5];

  v27[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v27[0] = CFSTR("sharedActivity");
  v27[1] = CFSTR("sharedActivityDevicesCurrent");
  v27[2] = CFSTR("sharedActivityDevicesMax");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_removeBaseFieldsForKeys:", v4);

  v19 = (void *)v2;
  objc_msgSend(*(id *)(a1 + 40), "_updateBaseFieldsWithData:", v2);
  objc_msgSend(*(id *)(a1 + 40), "cachedGroupEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(*(id *)(a1 + 40), "cachedGroupEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        VUIDefaultLogObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v13, "eventType");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v25 = v15;
          _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_INFO, "VUIMetricsController: recording cached %@ event", buf, 0xCu);

        }
        v16 = *(void **)(a1 + 40);
        objc_msgSend(v13, "eventType");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "eventData");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_recordEvent:withEventData:", v17, v18);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v10);
  }

}

uint64_t __42__VUIMetricsController__saveRecentEvents___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "hasPrefix:", CFSTR("data.uts")) & 1) != 0
    || (objc_msgSend(v2, "hasPrefix:", CFSTR("data.search")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("reco_"));
  }

  return v3;
}

uint64_t __42__VUIMetricsController__saveRecentEvents___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (!objc_msgSend(v2, "hasPrefix:", CFSTR("page"))
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("page")) & 1) != 0
    || objc_msgSend(v2, "isEqualToString:", CFSTR("pageHistory")))
  {
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("searchTerm"));
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (id)getRecentEventsForDebuggerUI
{
  NSObject *metricsDataDispatchSQ;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__26;
  v10 = __Block_byref_object_dispose__26;
  v11 = 0;
  metricsDataDispatchSQ = self->_metricsDataDispatchSQ;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__VUIMetricsController_getRecentEventsForDebuggerUI__block_invoke;
  v5[3] = &unk_1E9F99D88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(metricsDataDispatchSQ, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __52__VUIMetricsController_getRecentEventsForDebuggerUI__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)getMetricsEnhancedBuyParams:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  VUIMetricsPageEventData *lastRecordedPageEventData;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;

  v4 = (objc_class *)MEMORY[0x1E0CB37A0];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithString:", v5);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("&mtApp=%@"), v8);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "systemVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("&mtOsVersion=%@"), v10);

  lastRecordedPageEventData = self->_lastRecordedPageEventData;
  if (lastRecordedPageEventData)
  {
    -[VUIMetricsPageEventData pageId](lastRecordedPageEventData, "pageId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("&mtPageId=%@"), v12);

    -[VUIMetricsPageEventData pageType](self->_lastRecordedPageEventData, "pageType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("&mtPageType=%@"), v13);

  }
  -[VUIMetricsController baseFields](self, "baseFields");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("pageContext"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v6, "appendFormat:", CFSTR("&mtPageContext=%@"), v15);
  objc_msgSend(MEMORY[0x1E0DC6A28], "stringValueForKey:", CFSTR("BuildVersion"));
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    objc_msgSend(v6, "appendFormat:", CFSTR("&mtOsBuildNumber=%@"), v16);
  -[VUIMetricsController _getCurrentMetricsTopic](self, "_getCurrentMetricsTopic");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("&mtTopic=%@"), v18);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("&mtRequestId=%@"), v20);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "timeIntervalSince1970");
  objc_msgSend(v6, "appendFormat:", CFSTR("&mtEventTime=%lf"), v22 * 1000.0);

  v23 = (void *)objc_msgSend(v6, "copy");
  return v23;
}

- (id)getMetricsOverlayForBundleOffer
{
  void *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  -[VUIMetricsController _getCurrentMetricsTopic](self, "_getCurrentMetricsTopic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIAuthenticationManager DSID](VUIAuthenticationManager, "DSID");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[VUIMetricsController baseFields](self, "baseFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("pageContext"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v7 = &stru_1E9FF3598;
  v11[0] = CFSTR("pageContext");
  v11[1] = CFSTR("dsId");
  if (v6)
    v8 = v6;
  else
    v8 = &stru_1E9FF3598;
  if (v4)
    v7 = v4;
  v12[0] = v8;
  v12[1] = v7;
  v11[2] = CFSTR("topic");
  v12[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)getMetricsOverlayForWebContainer
{
  void *v2;
  __CFString *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  -[VUIMetricsController _getCurrentMetricsTopic](self, "_getCurrentMetricsTopic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIAuthenticationManager DSID](VUIAuthenticationManager, "DSID");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "infoDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("CFBundleShortVersionString"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = &stru_1E9FF3598;
  if (v5)
    v11 = v5;
  else
    v11 = &stru_1E9FF3598;
  v15[0] = CFSTR("app");
  v15[1] = CFSTR("appVersion");
  if (v8)
    v12 = (const __CFString *)v8;
  else
    v12 = &stru_1E9FF3598;
  v16[0] = v11;
  v16[1] = v12;
  if (v3)
    v10 = v3;
  v15[2] = CFSTR("dsId");
  v15[3] = CFSTR("topic");
  v16[2] = v10;
  v16[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)cacheUMImpression:(id)a3
{
  -[NSMutableArray addObject:](self->_cachedUnifiedMessagingImpressions, "addObject:", a3);
}

- (void)setIsInDebugMode:(BOOL)a3
{
  self->_isInDebugMode = a3;
}

- (NSDictionary)cachedOpenUrlData
{
  return self->_cachedOpenUrlData;
}

- (void)setCachedOpenUrlData:(id)a3
{
  objc_storeStrong((id *)&self->_cachedOpenUrlData, a3);
}

- (BOOL)shouldFlushMetrics
{
  return self->_shouldFlushMetrics;
}

- (void)setShouldFlushMetrics:(BOOL)a3
{
  self->_shouldFlushMetrics = a3;
}

- (NSString)exitEventDestinationUrl
{
  return self->_exitEventDestinationUrl;
}

- (void)setExitEventDestinationUrl:(id)a3
{
  objc_storeStrong((id *)&self->_exitEventDestinationUrl, a3);
}

- (OS_dispatch_queue)metricsDataDispatchSQ
{
  return self->_metricsDataDispatchSQ;
}

- (void)setMetricsDataDispatchSQ:(id)a3
{
  objc_storeStrong((id *)&self->_metricsDataDispatchSQ, a3);
}

- (VUIMetricsPageEventData)gdprCachedPageEvent
{
  return self->_gdprCachedPageEvent;
}

- (void)setGdprCachedPageEvent:(id)a3
{
  objc_storeStrong((id *)&self->_gdprCachedPageEvent, a3);
}

- (NSDictionary)cachedEnterEvent
{
  return self->_cachedEnterEvent;
}

- (void)setCachedEnterEvent:(id)a3
{
  objc_storeStrong((id *)&self->_cachedEnterEvent, a3);
}

- (NSMutableArray)cachedGroupEvents
{
  return self->_cachedGroupEvents;
}

- (void)setCachedGroupEvents:(id)a3
{
  objc_storeStrong((id *)&self->_cachedGroupEvents, a3);
}

- (NSHashTable)savedRecentEvents
{
  return self->_savedRecentEvents;
}

- (void)setSavedRecentEvents:(id)a3
{
  objc_storeStrong((id *)&self->_savedRecentEvents, a3);
}

- (VUIMetricsLocalRecorder)localMetricsRecorder
{
  return self->_localMetricsRecorder;
}

- (void)setLocalMetricsRecorder:(id)a3
{
  objc_storeStrong((id *)&self->_localMetricsRecorder, a3);
}

- (NSMutableArray)cachedUnifiedMessagingImpressions
{
  return self->_cachedUnifiedMessagingImpressions;
}

- (void)setCachedUnifiedMessagingImpressions:(id)a3
{
  objc_storeStrong((id *)&self->_cachedUnifiedMessagingImpressions, a3);
}

- (VUIScopedBackgroundTask)backgroundTask
{
  return self->_backgroundTask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundTask, 0);
  objc_storeStrong((id *)&self->_cachedUnifiedMessagingImpressions, 0);
  objc_storeStrong((id *)&self->_localMetricsRecorder, 0);
  objc_storeStrong((id *)&self->_lastTabIdentifier, 0);
  objc_storeStrong((id *)&self->_lastEventData, 0);
  objc_storeStrong((id *)&self->_lastEventType, 0);
  objc_storeStrong((id *)&self->_savedRecentEvents, 0);
  objc_storeStrong((id *)&self->_cachedGroupEvents, 0);
  objc_storeStrong((id *)&self->_cachedEnterEvent, 0);
  objc_storeStrong((id *)&self->_gdprCachedPageEvent, 0);
  objc_storeStrong((id *)&self->_metricsDataDispatchSQ, 0);
  objc_storeStrong((id *)&self->_exitEventDestinationUrl, 0);
  objc_storeStrong((id *)&self->_lastRecordedPageEventData, 0);
  objc_storeStrong((id *)&self->_currentTabIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedOpenUrlData, 0);
  objc_storeStrong((id *)&self->_baseFields, 0);
}

+ (id)_baseToVPAFMapping
{
  if (_baseToVPAFMapping_onceToken != -1)
    dispatch_once(&_baseToVPAFMapping_onceToken, &__block_literal_global_148);
  return (id)_baseToVPAFMapping__map;
}

void __48__VUIMetricsController_VPAF___baseToVPAFMapping__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("mvpdMonthsActive");
  v2[1] = CFSTR("mvpdPartner");
  v3[0] = CFSTR("mvpdMonthsActive");
  v3[1] = CFSTR("mvpdPartner");
  v2[2] = CFSTR("pageContext");
  v2[3] = CFSTR("sharedActivity");
  v3[2] = CFSTR("tabId");
  v3[3] = CFSTR("sharedActivity");
  v2[4] = CFSTR("sharedActivityDevicesCurrent");
  v2[5] = CFSTR("sharedActivityDevicesMax");
  v3[4] = CFSTR("sharedActivityDevicesCurrent");
  v3[5] = CFSTR("sharedActivityDevicesMax");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_baseToVPAFMapping__map;
  _baseToVPAFMapping__map = v0;

}

- (NSDictionary)baseFieldsForVPAF
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, void *);
  void *v12;
  id v13;
  id v14;

  -[VUIMetricsController baseFields](self, "baseFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend((id)objc_opt_class(), "_baseToVPAFMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __47__VUIMetricsController_VPAF__baseFieldsForVPAF__block_invoke;
  v12 = &unk_1E9FA3EB0;
  v13 = v4;
  v5 = v3;
  v14 = v5;
  v6 = v4;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &v9);
  if (objc_msgSend(v5, "count", v9, v10, v11, v12))
    v7 = v5;
  else
    v7 = 0;

  return (NSDictionary *)v7;
}

void __47__VUIMetricsController_VPAF__baseFieldsForVPAF__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v5);

}

- (NSDictionary)iTunesVPAF
{
  return 0;
}

void __58__VUIMetricsController__recordEventWithJet_withEventData___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D96EE000, a2, OS_LOG_TYPE_ERROR, "VUIMetricsController: Metrics error: %@", (uint8_t *)&v2, 0xCu);
}

@end
