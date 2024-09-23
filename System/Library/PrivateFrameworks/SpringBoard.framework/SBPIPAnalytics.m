@implementation SBPIPAnalytics

- (id)assistantForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_analyticsSourceAssistants, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_analyticsSessionAssistants, "objectForKeyedSubscript:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void)pictureInPictureDidCreateAnalyticsSourceWithUUID:(id)a3 bundleIdentifier:(id)a4 contentType:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *analyticsSourceAssistants;
  SBPIPAnalyticsSourceSummaryAssistant *v20;
  void *v21;
  void *v22;
  SBPIPAnalyticsSourceSummaryAssistant *v23;

  v8 = a4;
  v9 = a3;
  SBLogPIP();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[SBPIPAnalytics pictureInPictureDidCreateAnalyticsSourceWithUUID:bundleIdentifier:contentType:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

  if (!self->_analyticsSourceAssistants)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v18 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    analyticsSourceAssistants = self->_analyticsSourceAssistants;
    self->_analyticsSourceAssistants = v18;

  }
  v20 = [SBPIPAnalyticsSourceSummaryAssistant alloc];
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "pipDefaults");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[SBPIPAnalyticsSourceSummaryAssistant initWithBundleIdentifier:contentType:isAutoPIPEnabled:invalidationBlock:](v20, "initWithBundleIdentifier:contentType:isAutoPIPEnabled:invalidationBlock:", v8, a5, objc_msgSend(v22, "allowAutoPIP"), &__block_literal_global_219);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analyticsSourceAssistants, "setObject:forKeyedSubscript:", v23, v9);
}

void __96__SBPIPAnalytics_pictureInPictureDidCreateAnalyticsSourceWithUUID_bundleIdentifier_contentType___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  AnalyticsSendEventLazy();

}

uint64_t __96__SBPIPAnalytics_pictureInPictureDidCreateAnalyticsSourceWithUUID_bundleIdentifier_contentType___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "generateAnalyticsPayload");
}

- (void)pictureInPictureDidDestroyAnalyticsSourceWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  SBLogPIP();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBPIPAnalytics pictureInPictureDidDestroyAnalyticsSourceWithUUID:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_analyticsSourceAssistants, "objectForKeyedSubscript:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "noteBecameInactiveAtTime:", CFAbsoluteTimeGetCurrent());

  -[NSMutableDictionary objectForKeyedSubscript:](self->_analyticsSourceAssistants, "objectForKeyedSubscript:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "notePIPBecameProhibitedAtTime:", CFAbsoluteTimeGetCurrent());

  -[NSMutableDictionary objectForKeyedSubscript:](self->_analyticsSourceAssistants, "objectForKeyedSubscript:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "invalidate");

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analyticsSourceAssistants, "setObject:forKeyedSubscript:", 0, v4);
}

- (void)pictureInPictureAnalyticsSourceWithUUID:(id)a3 didBecomePossible:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double Current;

  v4 = a4;
  v6 = a3;
  SBLogPIP();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SBPIPAnalytics pictureInPictureAnalyticsSourceWithUUID:didBecomePossible:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_analyticsSourceAssistants, "objectForKeyedSubscript:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  Current = CFAbsoluteTimeGetCurrent();
  if (v4)
    objc_msgSend(v15, "notePIPBecamePossibleAtTime:", Current);
  else
    objc_msgSend(v15, "notePIPBecameProhibitedAtTime:", Current);

}

- (void)pictureInPictureDidCreateAnalyticsSessionWithUUID:(id)a3 bundleIdentifier:(id)a4 contentType:(int64_t)a5
{
  id v8;
  id v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *analyticsSessionAssistants;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  SBPIPAnalyticsSessionSummaryAssistant *v20;
  void *v21;
  void *v22;
  SBPIPAnalyticsSessionSummaryAssistant *v23;

  v8 = a3;
  v9 = a4;
  if (!self->_analyticsSessionAssistants)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    analyticsSessionAssistants = self->_analyticsSessionAssistants;
    self->_analyticsSessionAssistants = v10;

  }
  SBLogPIP();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[SBPIPAnalytics pictureInPictureDidCreateAnalyticsSessionWithUUID:bundleIdentifier:contentType:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

  v20 = [SBPIPAnalyticsSessionSummaryAssistant alloc];
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "pipDefaults");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[SBPIPAnalyticsSessionSummaryAssistant initWithBundleIdentifier:contentType:isAutoPIPEnabled:invalidationBlock:](v20, "initWithBundleIdentifier:contentType:isAutoPIPEnabled:invalidationBlock:", v9, a5, objc_msgSend(v22, "allowAutoPIP"), &__block_literal_global_5_1);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analyticsSessionAssistants, "setObject:forKeyedSubscript:", v23, v8);

}

void __97__SBPIPAnalytics_pictureInPictureDidCreateAnalyticsSessionWithUUID_bundleIdentifier_contentType___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  AnalyticsSendEventLazy();

}

uint64_t __97__SBPIPAnalytics_pictureInPictureDidCreateAnalyticsSessionWithUUID_bundleIdentifier_contentType___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "generateAnalyticsPayload");
}

- (void)pictureInPictureDidDestroyAnalyticsSessionWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = a3;
  SBLogPIP();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBPIPAnalytics pictureInPictureDidDestroyAnalyticsSessionWithUUID:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_analyticsSessionAssistants, "objectForKeyedSubscript:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "noteBecameInactiveAtTime:", CFAbsoluteTimeGetCurrent());

  -[NSMutableDictionary objectForKeyedSubscript:](self->_analyticsSessionAssistants, "objectForKeyedSubscript:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "invalidate");

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analyticsSessionAssistants, "setObject:forKeyedSubscript:", 0, v4);
}

- (void)pictureInPictureDidActivateAnalyticsSessionWithUUID:(id)a3 analyticsSourceUUID:(id)a4 automatically:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  SBLogPIP();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[SBPIPAnalytics pictureInPictureDidActivateAnalyticsSessionWithUUID:analyticsSourceUUID:automatically:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_analyticsSessionAssistants, "objectForKeyedSubscript:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "noteBecameActiveAtTime:", CFAbsoluteTimeGetCurrent());

  -[NSMutableDictionary objectForKeyedSubscript:](self->_analyticsSessionAssistants, "objectForKeyedSubscript:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "noteStartedAutomatically:", v5);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_analyticsSourceAssistants, "objectForKeyedSubscript:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "noteBecameActiveAtTime:", CFAbsoluteTimeGetCurrent());
}

- (void)pictureInPictureDidDeactivateAnalyticsSessionWithUUID:(id)a3 analyticsSourceUUID:(id)a4 appStoppedSession:(BOOL)a5 restoredFullScreen:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v6 = a6;
  v7 = a5;
  v10 = a4;
  v11 = a3;
  SBLogPIP();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[SBPIPAnalytics pictureInPictureDidDeactivateAnalyticsSessionWithUUID:analyticsSourceUUID:appStoppedSession:restoredFullScreen:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_analyticsSessionAssistants, "objectForKeyedSubscript:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "noteBecameInactiveAtTime:", CFAbsoluteTimeGetCurrent());

  -[NSMutableDictionary objectForKeyedSubscript:](self->_analyticsSessionAssistants, "objectForKeyedSubscript:", v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "noteBecameUnstashedAtTime:", CFAbsoluteTimeGetCurrent());

  -[NSMutableDictionary objectForKeyedSubscript:](self->_analyticsSessionAssistants, "objectForKeyedSubscript:", v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "noteAppStoppedSession:", v7);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_analyticsSessionAssistants, "objectForKeyedSubscript:", v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "noteRestoredFullScreen:", v6);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_analyticsSessionAssistants, "objectForKeyedSubscript:", v11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "invalidate");

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analyticsSessionAssistants, "setObject:forKeyedSubscript:", 0, v11);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_analyticsSourceAssistants, "objectForKeyedSubscript:", v10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "noteBecameInactiveAtTime:", CFAbsoluteTimeGetCurrent());
}

- (void)pictureInPictureDidChangeStashStateForAnalyticsSessionWithUUID:(id)a3 stashed:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double Current;

  v4 = a4;
  v6 = a3;
  SBLogPIP();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SBPIPAnalytics pictureInPictureDidChangeStashStateForAnalyticsSessionWithUUID:stashed:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_analyticsSessionAssistants, "objectForKeyedSubscript:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  Current = CFAbsoluteTimeGetCurrent();
  if (v4)
    objc_msgSend(v15, "noteBecameStashedAtTime:", Current);
  else
    objc_msgSend(v15, "noteBecameUnstashedAtTime:", Current);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsSessionAssistants, 0);
  objc_storeStrong((id *)&self->_analyticsSourceAssistants, 0);
}

- (void)pictureInPictureDidCreateAnalyticsSourceWithUUID:(uint64_t)a3 bundleIdentifier:(uint64_t)a4 contentType:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, a1, a3, "[Analytics] %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)pictureInPictureDidDestroyAnalyticsSourceWithUUID:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, a1, a3, "[Analytics] %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)pictureInPictureAnalyticsSourceWithUUID:(uint64_t)a3 didBecomePossible:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, a1, a3, "[Analytics] %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)pictureInPictureDidCreateAnalyticsSessionWithUUID:(uint64_t)a3 bundleIdentifier:(uint64_t)a4 contentType:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, a1, a3, "[Analytics] %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)pictureInPictureDidDestroyAnalyticsSessionWithUUID:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, a1, a3, "[Analytics] %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)pictureInPictureDidActivateAnalyticsSessionWithUUID:(uint64_t)a3 analyticsSourceUUID:(uint64_t)a4 automatically:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, a1, a3, "[Analytics] %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)pictureInPictureDidDeactivateAnalyticsSessionWithUUID:(uint64_t)a3 analyticsSourceUUID:(uint64_t)a4 appStoppedSession:(uint64_t)a5 restoredFullScreen:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, a1, a3, "[Analytics] %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)pictureInPictureDidChangeStashStateForAnalyticsSessionWithUUID:(uint64_t)a3 stashed:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, a1, a3, "[Analytics] %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
