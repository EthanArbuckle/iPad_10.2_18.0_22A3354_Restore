@implementation SFSettingsAnalytics

id __60__SFSettingsAnalytics_trackingPerformSelector_targetString___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("selector");
  v6[1] = CFSTR("target");
  v1 = *(_QWORD *)(a1 + 40);
  v7[0] = *(_QWORD *)(a1 + 32);
  v7[1] = v1;
  v6[2] = CFSTR("bundleID");
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)trackingPerformSelector:(id)a3 targetString:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v16 = v5;
    v17 = v7;
    AnalyticsSendEventLazy();

    v8 = v16;
  }
  else
  {
    SFLogForCategory(4uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[SFSettingsAnalytics trackingPerformSelector:targetString:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  }

}

+ (void)trackingStateOfRequestForSpecificApp:(unint64_t)a3 view:(id)a4
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;

  v4 = a4;
  v5 = v4;
  if (v4)
  {
    v14 = v4;
    AnalyticsSendEventLazy();
    v6 = v14;
  }
  else
  {
    SFLogForCategory(4uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[SFSettingsAnalytics trackingStateOfRequestForSpecificApp:view:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }

}

id __65__SFSettingsAnalytics_trackingStateOfRequestForSpecificApp_view___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = CFSTR("view");
  v6[0] = v2;
  v6[1] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)trackingViewVisited
{
  AnalyticsSendEventLazy();
}

id __42__SFSettingsAnalytics_trackingViewVisited__block_invoke()
{
  const __CFString *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x24BDAC8D0];
  v1 = CFSTR("result");
  v2[0] = &unk_24C39B0D0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v2, &v1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)trackingStateOfRequest:(BOOL)a3 askAppsToStopTracking:(BOOL)a4
{
  AnalyticsSendEventLazy();
}

id __68__SFSettingsAnalytics_trackingStateOfRequest_askAppsToStopTracking___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("askAppsToStopTracking");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 33));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)trackingAppAccessTransparencyVisited:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v13 = v3;
    AnalyticsSendEventLazy();
    v5 = v13;
  }
  else
  {
    SFLogForCategory(4uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[SFSettingsAnalytics trackingAppAccessTransparencyVisited:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }

}

id __60__SFSettingsAnalytics_trackingAppAccessTransparencyVisited___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("result");
  v3[1] = CFSTR("app");
  v1 = *(_QWORD *)(a1 + 32);
  v4[0] = &unk_24C39B0D0;
  v4[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)trackingRecordAppActivityVisited
{
  AnalyticsSendEventLazy();
}

id __55__SFSettingsAnalytics_trackingRecordAppActivityVisited__block_invoke()
{
  const __CFString *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x24BDAC8D0];
  v1 = CFSTR("result");
  v2[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v2, &v1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)trackingAppActivitySaved
{
  AnalyticsSendEventLazy();
}

id __47__SFSettingsAnalytics_trackingAppActivitySaved__block_invoke()
{
  const __CFString *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x24BDAC8D0];
  v1 = CFSTR("result");
  v2[0] = &unk_24C39B0D0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v2, &v1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)trackingViewControllersVisitedInRootController:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v13 = v3;
    AnalyticsSendEventLazy();
    v5 = v13;
  }
  else
  {
    SFLogForCategory(4uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[SFSettingsAnalytics trackingViewControllersVisitedInRootController:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }

}

id __70__SFSettingsAnalytics_trackingViewControllersVisitedInRootController___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v6[0] = CFSTR("target");
  v6[1] = CFSTR("bundleID");
  v7[0] = v1;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)trackingControlValueChanged:(id)a3 sender:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v16 = v5;
    v17 = v7;
    AnalyticsSendEventLazy();

    v8 = v16;
  }
  else
  {
    SFLogForCategory(4uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[SFSettingsAnalytics trackingControlValueChanged:sender:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  }

}

id __58__SFSettingsAnalytics_trackingControlValueChanged_sender___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("target");
  v6[1] = CFSTR("sender");
  v1 = *(_QWORD *)(a1 + 40);
  v7[0] = *(_QWORD *)(a1 + 32);
  v7[1] = v1;
  v6[2] = CFSTR("bundleID");
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)trackingSettingsOpenByURL:(BOOL)a3 url:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  AnalyticsSendEventLazy();

}

id __53__SFSettingsAnalytics_trackingSettingsOpenByURL_url___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("fromSearch");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v9[0] = v2;
  v9[1] = v3;
  v8[1] = CFSTR("url");
  v8[2] = CFSTR("bundleID");
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)trackingSettingsSearchUsed:(BOOL)a3 isUser65AgeOrOlder:(BOOL)a4 numberOfSectionsInResults:(unint64_t)a5 numberOfTotalResults:(unint64_t)a6 searchFromSpotlight:(BOOL)a7 methodForEndingSearch:(unint64_t)a8 searchResultURL:(id)a9 searchActivityID:(id)a10
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a9;
  v13 = a10;
  v11 = v13;
  v12 = v10;
  AnalyticsSendEventLazy();

}

id __191__SFSettingsAnalytics_trackingSettingsSearchUsed_isUser65AgeOrOlder_numberOfSectionsInResults_numberOfTotalResults_searchFromSpotlight_methodForEndingSearch_searchResultURL_searchActivityID___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("keyboardDisplayed"));

  }
  if (*(_BYTE *)(a1 + 73))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("isUser65AgeOrOlder"));

  }
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("numberOfSectionsInResults"));

  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("numberOfTotalResults"));

  }
  if (*(_BYTE *)(a1 + 74))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("searchFromSpotlight"));

  }
  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("methodForEndingSearch"));

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("searchResultURL"));
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("searchActivityID"));
  return v2;
}

+ (void)trackingSettingsSearchUsed:(BOOL)a3 isUser65AgeOrOlder:(BOOL)a4 searchFromSpotlight:(BOOL)a5 searchActivityID:(id)a6
{
  objc_msgSend(a1, "trackingSettingsSearchUsed:isUser65AgeOrOlder:numberOfSectionsInResults:numberOfTotalResults:searchFromSpotlight:methodForEndingSearch:searchResultURL:searchActivityID:", a3, a4, 0, 0, a5, 0, 0, a6);
}

+ (void)trackingSettingsSearchUsed:(BOOL)a3 numberOfSectionsInResults:(unint64_t)a4 numberOfTotalResults:(unint64_t)a5 searchFromSpotlight:(BOOL)a6 methodForEndingSearch:(unint64_t)a7 searchActivityID:(id)a8
{
  objc_msgSend(a1, "trackingSettingsSearchUsed:isUser65AgeOrOlder:numberOfSectionsInResults:numberOfTotalResults:searchFromSpotlight:methodForEndingSearch:searchResultURL:searchActivityID:", 0, a3, a4, a5, a6, a7, 0, a8);
}

+ (void)trackingSettingsSearchUsed:(BOOL)a3 searchFromSpotlight:(BOOL)a4 methodForEndingSearch:(unint64_t)a5 searchResultURL:(id)a6
{
  objc_msgSend(a1, "trackingSettingsSearchUsed:isUser65AgeOrOlder:numberOfSectionsInResults:numberOfTotalResults:searchFromSpotlight:methodForEndingSearch:searchResultURL:searchActivityID:", 0, a3, 0, 0, a4, a5, a6, 0);
}

+ (void)trackingStateOfRequestForSpecificApp:(uint64_t)a3 view:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20AC93000, a1, a3, "%{Public}s: view is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)trackingAppAccessTransparencyVisited:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20AC93000, a1, a3, "%{Public}s: appName is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)trackingPerformSelector:(uint64_t)a3 targetString:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20AC93000, a1, a3, "%{Public}s: selectorString or targetString is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)trackingViewControllersVisitedInRootController:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20AC93000, a1, a3, "%{Public}s: targetString is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)trackingControlValueChanged:(uint64_t)a3 sender:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20AC93000, a1, a3, "%{Public}s: targetClass or sender is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
