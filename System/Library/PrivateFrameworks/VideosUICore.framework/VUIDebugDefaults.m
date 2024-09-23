@implementation VUIDebugDefaults

- (BOOL)playbackOverridesEnabled
{
  return self->_playbackOverridesEnabled;
}

- (BOOL)enableDemoMode
{
  return self->_enableDemoMode;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_sSharedInstance;
}

- (BOOL)gdprWhatsNewFlowEnabled
{
  return self->_gdprWhatsNewFlowEnabled;
}

- (BOOL)gdprFirstTimeFlowEnabled
{
  return self->_gdprFirstTimeFlowEnabled;
}

- (BOOL)metricsLoggingEnabled
{
  return self->_metricsLoggingEnabled;
}

- (BOOL)metricsExpandedLoggingEnabled
{
  return self->_metricsExpandedLoggingEnabled;
}

void __34__VUIDebugDefaults_sharedInstance__block_invoke()
{
  VUIDebugDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(VUIDebugDefaults);
  v1 = (void *)sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v0;

}

- (VUIDebugDefaults)init
{
  VUIDebugDefaults *v2;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _BOOL4 hoverEffectDisabled;
  NSObject *v27;
  _BOOL4 impressionTrackingDisabled;
  NSObject *v29;
  _BOOL4 stackedTextUseTypeAsViewIdEnabled;
  objc_super v32;
  uint8_t buf[4];
  _BOOL4 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)VUIDebugDefaults;
  v2 = -[VUIDebugDefaults init](&v32, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_debugUIEnabled = objc_msgSend(v3, "BOOLForKey:", CFSTR("EnableDebugUI"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_pagePerformanceEnabled = objc_msgSend(v4, "BOOLForKey:", CFSTR("EnablePagePerformance"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_metricsLoggingEnabled = objc_msgSend(v5, "BOOLForKey:", CFSTR("EnableMetricsLogging"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_metricsExpandedLoggingEnabled = objc_msgSend(v6, "BOOLForKey:", CFSTR("EnableMetricsExpandedLogging"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_metricsPageRenderLoggingEnabled = objc_msgSend(v7, "BOOLForKey:", CFSTR("EnableMetricsPageRenderLogging"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_metricsLogLocationAndImpressions = objc_msgSend(v8, "BOOLForKey:", CFSTR("EnableMetricsExpandedClickLogging"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_enableDemoMode = objc_msgSend(v9, "BOOLForKey:", CFSTR("EnableDemoMode"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_gdprFirstTimeFlowEnabled = objc_msgSend(v10, "BOOLForKey:", CFSTR("ForceGDPRFirstTimeFlow"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_gdprWhatsNewFlowEnabled = objc_msgSend(v11, "BOOLForKey:", CFSTR("ForceGDPRWhatsNewFlow"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_debugRefreshEventLogEnabled = objc_msgSend(v12, "BOOLForKey:", CFSTR("EnableRefreshEventDebug"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("PlaybackURLOverrides"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_playbackOverridesEnabled = v14 != 0;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_hoverEffectDisabled = objc_msgSend(v15, "BOOLForKey:", CFSTR("hoverEffectDisabled"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_impressionTrackingDisabled = objc_msgSend(v16, "BOOLForKey:", CFSTR("impressionTrackingDisabled"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_stackedTextUseTypeAsViewIdEnabled = objc_msgSend(v17, "BOOLForKey:", CFSTR("stackedTextUseTypeAsViewIdEnabled"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_iTunesExtrasSwiftUIMock = objc_msgSend(v18, "BOOLForKey:", CFSTR("iTunesExtrasSwiftUIMock"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_capellaDebuggerEnabled = objc_msgSend(v19, "BOOLForKey:", CFSTR("EnableCapellaDebugger"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_capellaMockedDataEnabled = objc_msgSend(v20, "BOOLForKey:", CFSTR("EnableCapellaMockedData"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_capellaMusicInfoEnabled = objc_msgSend(v21, "BOOLForKey:", CFSTR("EnableCapellaMusicInfo"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_performanceDebuggerEnabled = objc_msgSend(v22, "BOOLForKey:", CFSTR("EnablePerformanceDebugger"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_performanceDebuggerVerboseEnabled = objc_msgSend(v23, "BOOLForKey:", CFSTR("EnablePerformanceDebuggerVerbose"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_overrideLastNLSQueryDate = objc_msgSend(v24, "integerForKey:", CFSTR("OverrideLastNLSQueryDate"));

    VUICDefaultLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      hoverEffectDisabled = v2->_hoverEffectDisabled;
      *(_DWORD *)buf = 67109120;
      v34 = hoverEffectDisabled;
      _os_log_impl(&dword_1D951F000, v25, OS_LOG_TYPE_DEFAULT, "DebugDefault:: hoverEffectDisabled: %d", buf, 8u);
    }

    VUICDefaultLogObject();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      impressionTrackingDisabled = v2->_impressionTrackingDisabled;
      *(_DWORD *)buf = 67109120;
      v34 = impressionTrackingDisabled;
      _os_log_impl(&dword_1D951F000, v27, OS_LOG_TYPE_DEFAULT, "DebugDefault:: impressionTrackingDisabled: %d", buf, 8u);
    }

    VUICDefaultLogObject();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      stackedTextUseTypeAsViewIdEnabled = v2->_stackedTextUseTypeAsViewIdEnabled;
      *(_DWORD *)buf = 67109120;
      v34 = stackedTextUseTypeAsViewIdEnabled;
      _os_log_impl(&dword_1D951F000, v29, OS_LOG_TYPE_DEFAULT, "DebugDefault:: stackedTextUseTypeAsViewIdEnabled: %d", buf, 8u);
    }

  }
  return v2;
}

- (BOOL)pagePerformanceEnabled
{
  return self->_pagePerformanceEnabled;
}

- (BOOL)debugUIEnabled
{
  return self->_debugUIEnabled;
}

- (void)setDebugUIEnabled:(BOOL)a3
{
  self->_debugUIEnabled = a3;
}

- (void)setPagePerformanceEnabled:(BOOL)a3
{
  self->_pagePerformanceEnabled = a3;
}

- (void)setMetricsLoggingEnabled:(BOOL)a3
{
  self->_metricsLoggingEnabled = a3;
}

- (void)setMetricsExpandedLoggingEnabled:(BOOL)a3
{
  self->_metricsExpandedLoggingEnabled = a3;
}

- (BOOL)metricsLogLocationAndImpressions
{
  return self->_metricsLogLocationAndImpressions;
}

- (void)setMetricsLogLocationAndImpressions:(BOOL)a3
{
  self->_metricsLogLocationAndImpressions = a3;
}

- (BOOL)metricsPageRenderLoggingEnabled
{
  return self->_metricsPageRenderLoggingEnabled;
}

- (void)setMetricsPageRenderLoggingEnabled:(BOOL)a3
{
  self->_metricsPageRenderLoggingEnabled = a3;
}

- (void)setEnableDemoMode:(BOOL)a3
{
  self->_enableDemoMode = a3;
}

- (void)setGdprFirstTimeFlowEnabled:(BOOL)a3
{
  self->_gdprFirstTimeFlowEnabled = a3;
}

- (void)setGdprWhatsNewFlowEnabled:(BOOL)a3
{
  self->_gdprWhatsNewFlowEnabled = a3;
}

- (BOOL)debugRefreshEventLogEnabled
{
  return self->_debugRefreshEventLogEnabled;
}

- (void)setDebugRefreshEventLogEnabled:(BOOL)a3
{
  self->_debugRefreshEventLogEnabled = a3;
}

- (void)setPlaybackOverridesEnabled:(BOOL)a3
{
  self->_playbackOverridesEnabled = a3;
}

- (BOOL)hoverEffectDisabled
{
  return self->_hoverEffectDisabled;
}

- (void)setHoverEffectDisabled:(BOOL)a3
{
  self->_hoverEffectDisabled = a3;
}

- (BOOL)impressionTrackingDisabled
{
  return self->_impressionTrackingDisabled;
}

- (void)setImpressionTrackingDisabled:(BOOL)a3
{
  self->_impressionTrackingDisabled = a3;
}

- (BOOL)stackedTextUseTypeAsViewIdEnabled
{
  return self->_stackedTextUseTypeAsViewIdEnabled;
}

- (void)setStackedTextUseTypeAsViewIdEnabled:(BOOL)a3
{
  self->_stackedTextUseTypeAsViewIdEnabled = a3;
}

- (BOOL)iTunesExtrasSwiftUIMock
{
  return self->_iTunesExtrasSwiftUIMock;
}

- (void)setITunesExtrasSwiftUIMock:(BOOL)a3
{
  self->_iTunesExtrasSwiftUIMock = a3;
}

- (BOOL)capellaDebuggerEnabled
{
  return self->_capellaDebuggerEnabled;
}

- (void)setCapellaDebuggerEnabled:(BOOL)a3
{
  self->_capellaDebuggerEnabled = a3;
}

- (BOOL)capellaMockedDataEnabled
{
  return self->_capellaMockedDataEnabled;
}

- (void)setCapellaMockedDataEnabled:(BOOL)a3
{
  self->_capellaMockedDataEnabled = a3;
}

- (BOOL)capellaMusicInfoEnabled
{
  return self->_capellaMusicInfoEnabled;
}

- (void)setCapellaMusicInfoEnabled:(BOOL)a3
{
  self->_capellaMusicInfoEnabled = a3;
}

- (BOOL)performanceDebuggerEnabled
{
  return self->_performanceDebuggerEnabled;
}

- (void)setPerformanceDebuggerEnabled:(BOOL)a3
{
  self->_performanceDebuggerEnabled = a3;
}

- (BOOL)performanceDebuggerVerboseEnabled
{
  return self->_performanceDebuggerVerboseEnabled;
}

- (void)setPerformanceDebuggerVerboseEnabled:(BOOL)a3
{
  self->_performanceDebuggerVerboseEnabled = a3;
}

- (int64_t)overrideLastNLSQueryDate
{
  return self->_overrideLastNLSQueryDate;
}

- (void)setOverrideLastNLSQueryDate:(int64_t)a3
{
  self->_overrideLastNLSQueryDate = a3;
}

@end
