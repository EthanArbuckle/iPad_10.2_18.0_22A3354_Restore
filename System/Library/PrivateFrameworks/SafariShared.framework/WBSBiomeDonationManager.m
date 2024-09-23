@implementation WBSBiomeDonationManager

+ (BOOL)isBiomeStreamDonationAvailable
{
  return 1;
}

+ (WBSBiomeDonationManager)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_4);
  return (WBSBiomeDonationManager *)(id)sharedManager_manager;
}

void __40__WBSBiomeDonationManager_sharedManager__block_invoke()
{
  WBSBiomeDonationManager *v0;
  void *v1;

  v0 = objc_alloc_init(WBSBiomeDonationManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

- (WBSBiomeDonationManager)init
{
  WBSBiomeDonationManager *v2;
  id v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *streamAccessQueue;
  WBSBiomeDonationManager *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WBSBiomeDonationManager;
  v2 = -[WBSBiomeDonationManager init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.WBSBiomeDonationManager.%@.%p._streamAccessQueue"), objc_opt_class(), v2);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create(v4, v5);
    streamAccessQueue = v2->_streamAccessQueue;
    v2->_streamAccessQueue = (OS_dispatch_queue *)v6;

    v8 = v2;
  }

  return v2;
}

- (id)_autoPlayStream
{
  _WBSBiomeStream *autoPlayStream;
  _WBSBiomeStream *v4;
  _WBSBiomeStream *v5;
  _WBSBiomeStream *v6;

  autoPlayStream = self->_autoPlayStream;
  if (!autoPlayStream)
  {
    v4 = [_WBSBiomeStream alloc];
    v5 = -[_WBSBiomeStream initWithIdentifier:](v4, "initWithIdentifier:", *MEMORY[0x1E0D01DB0]);
    v6 = self->_autoPlayStream;
    self->_autoPlayStream = v5;

    autoPlayStream = self->_autoPlayStream;
  }
  return autoPlayStream;
}

- (id)_navigationsStream
{
  _WBSBiomeStream *navigationsStream;
  _WBSBiomeStream *v4;
  _WBSBiomeStream *v5;
  _WBSBiomeStream *v6;

  navigationsStream = self->_navigationsStream;
  if (!navigationsStream)
  {
    v4 = [_WBSBiomeStream alloc];
    v5 = -[_WBSBiomeStream initWithIdentifier:](v4, "initWithIdentifier:", *MEMORY[0x1E0D01DC0]);
    v6 = self->_navigationsStream;
    self->_navigationsStream = v5;

    navigationsStream = self->_navigationsStream;
  }
  return navigationsStream;
}

- (id)_webPagePerformanceStream
{
  _WBSBiomeStream *webPagePerformanceStream;
  _WBSBiomeStream *v4;
  _WBSBiomeStream *v5;
  _WBSBiomeStream *v6;

  webPagePerformanceStream = self->_webPagePerformanceStream;
  if (!webPagePerformanceStream)
  {
    v4 = [_WBSBiomeStream alloc];
    v5 = -[_WBSBiomeStream initWithIdentifier:](v4, "initWithIdentifier:", *MEMORY[0x1E0D01DD0]);
    v6 = self->_webPagePerformanceStream;
    self->_webPagePerformanceStream = v5;

    webPagePerformanceStream = self->_webPagePerformanceStream;
  }
  return webPagePerformanceStream;
}

- (id)_webAppInFocusStream
{
  _WBSBiomeStream *webAppInFocusStream;
  _WBSBiomeStream *v4;
  _WBSBiomeStream *v5;
  _WBSBiomeStream *v6;

  webAppInFocusStream = self->_webAppInFocusStream;
  if (!webAppInFocusStream)
  {
    v4 = [_WBSBiomeStream alloc];
    v5 = -[_WBSBiomeStream initWithIdentifier:](v4, "initWithIdentifier:", *MEMORY[0x1E0D01D60]);
    v6 = self->_webAppInFocusStream;
    self->_webAppInFocusStream = v5;

    webAppInFocusStream = self->_webAppInFocusStream;
  }
  return webAppInFocusStream;
}

- (id)_pageLoadStream
{
  _WBSBiomeStream *pageLoadStream;
  _WBSBiomeStream *v4;
  _WBSBiomeStream *v5;
  _WBSBiomeStream *v6;

  pageLoadStream = self->_pageLoadStream;
  if (!pageLoadStream)
  {
    v4 = [_WBSBiomeStream alloc];
    v5 = -[_WBSBiomeStream initWithIdentifier:](v4, "initWithIdentifier:", *MEMORY[0x1E0D01DC8]);
    v6 = self->_pageLoadStream;
    self->_pageLoadStream = v5;

    pageLoadStream = self->_pageLoadStream;
  }
  return pageLoadStream;
}

- (_WBSBiomeStream)_windowProxyStream
{
  _WBSBiomeStream *windowProxyStream;
  _WBSBiomeStream *v4;
  _WBSBiomeStream *v5;
  _WBSBiomeStream *v6;

  windowProxyStream = self->_windowProxyStream;
  if (!windowProxyStream)
  {
    v4 = [_WBSBiomeStream alloc];
    v5 = -[_WBSBiomeStream initWithIdentifier:](v4, "initWithIdentifier:", *MEMORY[0x1E0D01DD8]);
    v6 = self->_windowProxyStream;
    self->_windowProxyStream = v5;

    windowProxyStream = self->_windowProxyStream;
  }
  return windowProxyStream;
}

- (id)_browsingAssistantStream
{
  _WBSBiomeStream *browsingAssistantStream;
  _WBSBiomeStream *v4;
  _WBSBiomeStream *v5;
  _WBSBiomeStream *v6;

  browsingAssistantStream = self->_browsingAssistantStream;
  if (!browsingAssistantStream)
  {
    v4 = [_WBSBiomeStream alloc];
    v5 = -[_WBSBiomeStream initWithIdentifier:](v4, "initWithIdentifier:", *MEMORY[0x1E0D01DB8]);
    v6 = self->_browsingAssistantStream;
    self->_browsingAssistantStream = v5;

    browsingAssistantStream = self->_browsingAssistantStream;
  }
  return browsingAssistantStream;
}

- (void)donateAutoPlayEventWithSignal:(int64_t)a3 domain:(id)a4 countryCode:(id)a5 webPageLoadedOverPrivateRelay:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *streamAccessQueue;
  _QWORD block[4];
  id v20;
  id v21;
  id location;

  v6 = a6;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend((id)objc_opt_class(), "isBiomeStreamDonationAvailable"))
  {
    v12 = objc_alloc(MEMORY[0x1E0D02178]);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", ceil(v13 / 1800.0) * 30.0 * 60.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[WBSBiomeDonationManager _biomeSignalForAutoPlaySignal:](self, "_biomeSignalForAutoPlaySignal:", a3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v12, "initWithDomain:visited:signal:countryCode:privacyProxy:", v10, v14, v15, v11, v16);

    if (v17)
    {
      objc_initWeak(&location, self);
      streamAccessQueue = self->_streamAccessQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __106__WBSBiomeDonationManager_donateAutoPlayEventWithSignal_domain_countryCode_webPageLoadedOverPrivateRelay___block_invoke;
      block[3] = &unk_1E4B2A160;
      objc_copyWeak(&v21, &location);
      v20 = v17;
      dispatch_async(streamAccessQueue, block);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }

  }
}

void __106__WBSBiomeDonationManager_donateAutoPlayEventWithSignal_domain_countryCode_webPageLoadedOverPrivateRelay___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_autoPlayStream");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "source");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendEvent:", *(_QWORD *)(a1 + 32));

    WeakRetained = v5;
  }

}

- (int)_biomeSignalForAutoPlaySignal:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  else
    return dword_1A3F42B78[a3 - 1];
}

- (void)donateNavigationWithURL:(id)a3 userAgent:(int64_t)a4 wasPrivateRelayed:(BOOL)a5 statusCode:(int64_t)a6
{
  _BOOL8 v7;
  id v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  NSObject *streamAccessQueue;
  uint64_t v26;
  WBSBiomeDonationManager *val;
  unsigned int v28;
  _QWORD block[4];
  id v30;
  id v31;
  id location;

  v7 = a5;
  v10 = a3;
  if (isIPad_onceToken != -1)
    dispatch_once(&isIPad_onceToken, &__block_literal_global_146);
  if (isIPad_result)
    v11 = 3;
  else
    v11 = 2;
  v28 = v11;
  objc_msgSend(v10, "host");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safari_highLevelDomainFromHost");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v12) = objc_msgSend(MEMORY[0x1E0D02210], "instancesRespondToSelector:", sel_initWithDomain_visited_platform_userAgent_countryCode_privacyProxy_error_url_);
  v14 = objc_alloc(MEMORY[0x1E0D02210]);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", ceil(v15 / 1800.0) * 30.0 * 60.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  val = self;
  v17 = -[WBSBiomeDonationManager _biomeDeviceClassForUserAgent:](self, "_biomeDeviceClassForUserAgent:", a4);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "countryCode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = BiomeErrorResponseForStatusCode(a6);
  v22 = v21;
  if ((_DWORD)v12)
  {
    objc_msgSend(v10, "absoluteString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = v22;
    v24 = (void *)objc_msgSend(v14, "initWithDomain:visited:platform:userAgent:countryCode:privacyProxy:error:url:", v13, v16, v28, v17, v19, v20, v26, v23);

  }
  else
  {
    LODWORD(v26) = v21;
    v24 = (void *)objc_msgSend(v14, "initWithDomain:visited:platform:userAgent:countryCode:privacyProxy:error:", v13, v16, v28, v17, v19, v20, v26);
  }

  if (v24)
  {
    objc_initWeak(&location, val);
    streamAccessQueue = val->_streamAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__WBSBiomeDonationManager_donateNavigationWithURL_userAgent_wasPrivateRelayed_statusCode___block_invoke;
    block[3] = &unk_1E4B2A160;
    objc_copyWeak(&v31, &location);
    v30 = v24;
    dispatch_async(streamAccessQueue, block);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

}

void __90__WBSBiomeDonationManager_donateNavigationWithURL_userAgent_wasPrivateRelayed_statusCode___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_navigationsStream");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "source");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendEvent:", *(_QWORD *)(a1 + 32));

    WeakRetained = v5;
  }

}

- (int)_biomeDeviceClassForUserAgent:(int64_t)a3
{
  if (a3)
    return 2 * (a3 == 1);
  else
    return 1;
}

- (BOOL)donateForDiagnosticLoggingKey:(id)a3 value:(id)a4 webPageLoadedOverPrivateRelay:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  uint64_t v10;
  BOOL v11;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend((id)objc_opt_class(), "isBiomeStreamDonationAvailable")
    && (v10 = -[WBSBiomeDonationManager _webPerformanceEventForDiagnosticLoggingKey:](self, "_webPerformanceEventForDiagnosticLoggingKey:", v8), (_DWORD)v10))
  {
    -[WBSBiomeDonationManager _donateWebPagePerformanceEventWithEvent:domain:webPageLoadedOverPrivateRelay:](self, "_donateWebPagePerformanceEventWithEvent:domain:webPageLoadedOverPrivateRelay:", v10, v9, v5);
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_donateWebPagePerformanceEventWithEvent:(int)a3 domain:(id)a4 webPageLoadedOverPrivateRelay:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  uint64_t v9;
  id v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *streamAccessQueue;
  _QWORD block[4];
  id v17;
  id v18;
  id location;

  v5 = a5;
  v6 = *(_QWORD *)&a3;
  v8 = a4;
  if (isIPad_onceToken != -1)
    dispatch_once(&isIPad_onceToken, &__block_literal_global_146);
  if (isIPad_result)
    v9 = 3;
  else
    v9 = 2;
  v10 = objc_alloc(MEMORY[0x1E0D02220]);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", ceil(v11 / 1800.0) * 30.0 * 60.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithDomain:visited:platform:performanceEvent:privacyProxy:", v8, v12, v9, v6, v13);

  if (v14)
  {
    objc_initWeak(&location, self);
    streamAccessQueue = self->_streamAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __104__WBSBiomeDonationManager__donateWebPagePerformanceEventWithEvent_domain_webPageLoadedOverPrivateRelay___block_invoke;
    block[3] = &unk_1E4B2A160;
    objc_copyWeak(&v18, &location);
    v17 = v14;
    dispatch_async(streamAccessQueue, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

}

void __104__WBSBiomeDonationManager__donateWebPagePerformanceEventWithEvent_domain_webPageLoadedOverPrivateRelay___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_webPagePerformanceStream");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "source");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendEvent:", *(_QWORD *)(a1 + 32));

    WeakRetained = v5;
  }

}

- (int)_webPerformanceEventForDiagnosticLoggingKey:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DomainCausingCrash")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DomainCausingJetsam")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DomainCausingEnergyDrain")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)donateWebAppInFocusEventWithStarting:(BOOL)a3 date:(id)a4 webAppType:(int64_t)a5 identifier:(id)a6 name:(id)a7 manifestId:(id)a8
{
  _BOOL8 v11;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *streamAccessQueue;
  _QWORD block[4];
  id v22;
  id v23;
  id location;

  v11 = a3;
  v13 = a6;
  v14 = a7;
  v15 = a8;
  if (objc_msgSend((id)objc_opt_class(), "isBiomeStreamDonationAvailable"))
  {
    v16 = objc_alloc(MEMORY[0x1E0D02350]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_opt_new();
    v19 = (void *)objc_msgSend(v16, "initWithStarting:absoluteTimestamp:type:identifier:name:manifestId:", v17, v18, -[WBSBiomeDonationManager _biomeWebAppInFocusWebAppTypeForWebAppType:](self, "_biomeWebAppInFocusWebAppTypeForWebAppType:", a5), v13, v14, v15);

    if (v19)
    {
      objc_initWeak(&location, self);
      streamAccessQueue = self->_streamAccessQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __107__WBSBiomeDonationManager_donateWebAppInFocusEventWithStarting_date_webAppType_identifier_name_manifestId___block_invoke;
      block[3] = &unk_1E4B2A160;
      objc_copyWeak(&v23, &location);
      v22 = v19;
      dispatch_async(streamAccessQueue, block);

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }

  }
}

void __107__WBSBiomeDonationManager_donateWebAppInFocusEventWithStarting_date_webAppType_identifier_name_manifestId___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_webAppInFocusStream");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "source");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendEvent:", *(_QWORD *)(a1 + 32));

    WeakRetained = v5;
  }

}

- (int)_biomeWebAppInFocusWebAppTypeForWebAppType:(int64_t)a3
{
  if (a3)
    return 2 * (a3 == 1);
  else
    return 1;
}

- (void)donatePageLoadWithUserAgent:(int64_t)a3 wasSearch:(BOOL)a4 wasPrivateBrowsing:(BOOL)a5 wasActualized:(BOOL)a6 provenance:(int64_t)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  int v13;
  id v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *streamAccessQueue;
  uint64_t v25;
  int v26;
  unsigned int v27;
  _QWORD block[4];
  id v29;
  id v30;
  id location;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  if (objc_msgSend((id)objc_opt_class(), "isBiomeStreamDonationAvailable"))
  {
    if (isIPad_onceToken != -1)
      dispatch_once(&isIPad_onceToken, &__block_literal_global_146);
    if (isIPad_result)
      v13 = 3;
    else
      v13 = 2;
    v27 = v13;
    if ((unint64_t)a7 > 3)
      v26 = 0;
    else
      v26 = dword_1A3F42B90[a7];
    v14 = objc_alloc(MEMORY[0x1E0D02218]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", ceil(v16 / 1800.0) * 30.0 * 60.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[WBSBiomeDonationManager _biomePageLoadDeviceClassForUserAgent:](self, "_biomePageLoadDeviceClassForUserAgent:", a3);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "countryCode");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = v26;
    v23 = (void *)objc_msgSend(v14, "initWithSearch:visited:mode:platform:userAgent:countryCode:entryPoint:actualized:", v15, v17, v18, v27, v19, v21, v25, v22);

    if (v23)
    {
      objc_initWeak(&location, self);
      streamAccessQueue = self->_streamAccessQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __109__WBSBiomeDonationManager_donatePageLoadWithUserAgent_wasSearch_wasPrivateBrowsing_wasActualized_provenance___block_invoke;
      block[3] = &unk_1E4B2A160;
      objc_copyWeak(&v30, &location);
      v29 = v23;
      dispatch_async(streamAccessQueue, block);

      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }

  }
}

void __109__WBSBiomeDonationManager_donatePageLoadWithUserAgent_wasSearch_wasPrivateBrowsing_wasActualized_provenance___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_pageLoadStream");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "source");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendEvent:", *(_QWORD *)(a1 + 32));

    WeakRetained = v5;
  }

}

- (int)_biomePageLoadDeviceClassForUserAgent:(int64_t)a3
{
  if (a3)
    return 2 * (a3 == 1);
  else
    return 1;
}

- (void)donateBrowsingAssistantWebPageStartedEventWithWebPageID:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v34;
  id obj;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D02208]);
    v32 = v3;
    objc_msgSend(v3, "dataUsingEncoding:allowLossyConversion:", 4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v4, "initWithWebpageViewIdentifier:", v5);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    v43 = &v42;
    v44 = 0x2050000000;
    v6 = (void *)getSADeviceInfoClass_softClass;
    v45 = getSADeviceInfoClass_softClass;
    if (!getSADeviceInfoClass_softClass)
    {
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __getSADeviceInfoClass_block_invoke;
      v41[3] = &unk_1E4B2A210;
      v41[4] = &v42;
      __getSADeviceInfoClass_block_invoke((uint64_t)v41);
      v6 = (void *)v43[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v42, 8);
    v34 = (void *)objc_msgSend([v7 alloc], "init");
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v34, "trialExperiment");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v38;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v38 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v10);
          v12 = objc_alloc(MEMORY[0x1E0D021C0]);
          objc_msgSend(v11, "experimentNamespace");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "experimentID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "treatmentID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "deploymentID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v11, "allocationStatus");
          objc_msgSend(v11, "compatibilityVersion");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v12, "initWithExperiment_namespace:experiment_id:treatment_id:deployment_id:allocation_status:compatibility_version:", v13, v14, v15, v16, v17, v18);
          objc_msgSend(v36, "addObject:", v19);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      }
      while (v8);
    }

    v20 = objc_alloc(MEMORY[0x1E0D02188]);
    objc_msgSend(v32, "dataUsingEncoding:allowLossyConversion:", 4, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "systemLocale");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "currentCountry");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "build");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "osType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "productType");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "prefixStoreVersion");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v30) = 0;
    LODWORD(v29) = 0;
    v28 = (void *)objc_msgSend(v20, "initWithWebpageViewIdentifier:systemLocale:currentCountry:build:osType:productType:buildType:duEnabled:searchBarPosition:prefixStoreVersion:trialExperiment:", v21, v22, v23, v24, v25, v26, v29, 0, v30, v27, v36);

    -[WBSBiomeDonationManager _donateBrowsingAssistantEvents:dimensionContext:bloomFilterPassed:eligible:webpageUrlSent:serverRequest:render:userInteraction:](self, "_donateBrowsingAssistantEvents:dimensionContext:bloomFilterPassed:eligible:webpageUrlSent:serverRequest:render:userInteraction:", v31, 0, 0, 0, 0, 0, 0, 0);
    -[WBSBiomeDonationManager _donateBrowsingAssistantEvents:dimensionContext:bloomFilterPassed:eligible:webpageUrlSent:serverRequest:render:userInteraction:](self, "_donateBrowsingAssistantEvents:dimensionContext:bloomFilterPassed:eligible:webpageUrlSent:serverRequest:render:userInteraction:", 0, v28, 0, 0, 0, 0, 0, 0);

    v3 = v32;
  }

}

- (void)donateBrowsingAssistantEligibleEventWithWebPageID:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0D02190];
    v5 = a3;
    v6 = [v4 alloc];
    objc_msgSend(v5, "dataUsingEncoding:allowLossyConversion:", 4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (id)objc_msgSend(v6, "initWithWebpageViewIdentifier:", v7);
    -[WBSBiomeDonationManager _donateBrowsingAssistantEvents:dimensionContext:bloomFilterPassed:eligible:webpageUrlSent:serverRequest:render:userInteraction:](self, "_donateBrowsingAssistantEvents:dimensionContext:bloomFilterPassed:eligible:webpageUrlSent:serverRequest:render:userInteraction:", 0, 0, 0, v8, 0, 0, 0, 0);

  }
}

- (void)donateBrowsingAssistantWebpageURLSentWithWebPageID:(id)a3 urlSent:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  if (a3)
  {
    v6 = (objc_class *)MEMORY[0x1E0D02200];
    v7 = a4;
    v8 = a3;
    v9 = [v6 alloc];
    objc_msgSend(v8, "dataUsingEncoding:allowLossyConversion:", 4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (id)objc_msgSend(v9, "initWithWebpageViewIdentifier:url:", v10, v11);
    -[WBSBiomeDonationManager _donateBrowsingAssistantEvents:dimensionContext:bloomFilterPassed:eligible:webpageUrlSent:serverRequest:render:userInteraction:](self, "_donateBrowsingAssistantEvents:dimensionContext:bloomFilterPassed:eligible:webpageUrlSent:serverRequest:render:userInteraction:", 0, 0, 0, 0, v12, 0, 0, 0);

  }
}

- (void)donateBrowsingAssistantServerRequestStartedEventWithWebPageID:(id)a3 requestIdentifier:(id)a4 requestType:(int64_t)a5
{
  uint64_t v7;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  if (a3)
  {
    if (a5 == 2)
      v7 = 2;
    else
      v7 = a5 == 1;
    v8 = (objc_class *)MEMORY[0x1E0D021B8];
    v9 = a4;
    v10 = a3;
    v14 = (id)objc_msgSend([v8 alloc], "initWithRequestType:", v7);
    v11 = objc_alloc(MEMORY[0x1E0D021A0]);
    objc_msgSend(v10, "dataUsingEncoding:allowLossyConversion:", 4, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(v11, "initWithWebpageViewIdentifier:requestIdentifier:started:ended:failed:", v12, v9, v14, 0, 0);
    -[WBSBiomeDonationManager _donateBrowsingAssistantEvents:dimensionContext:bloomFilterPassed:eligible:webpageUrlSent:serverRequest:render:userInteraction:](self, "_donateBrowsingAssistantEvents:dimensionContext:bloomFilterPassed:eligible:webpageUrlSent:serverRequest:render:userInteraction:", 0, 0, 0, 0, 0, v13, 0, 0);

  }
}

- (void)donateBrowsingAssistantServerRequestEndedEventWithWebPageID:(id)a3 requestIdentifier:(id)a4 summary:(id)a5 tableOfContentsTexts:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  if (a3)
  {
    v10 = (objc_class *)MEMORY[0x1E0D02198];
    v11 = a6;
    v12 = a5;
    v13 = a4;
    v14 = a3;
    v19 = (id)objc_msgSend([v10 alloc], "initWithSummaryText:tableOfContentsTexts:", v12, v11);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D021A8]), "initWithServerReleaseVersion:responseData:", &stru_1E4B40D18, v19);
    v16 = objc_alloc(MEMORY[0x1E0D021A0]);
    objc_msgSend(v14, "dataUsingEncoding:allowLossyConversion:", 4, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_msgSend(v16, "initWithWebpageViewIdentifier:requestIdentifier:started:ended:failed:", v17, v13, 0, v15, 0);
    -[WBSBiomeDonationManager _donateBrowsingAssistantEvents:dimensionContext:bloomFilterPassed:eligible:webpageUrlSent:serverRequest:render:userInteraction:](self, "_donateBrowsingAssistantEvents:dimensionContext:bloomFilterPassed:eligible:webpageUrlSent:serverRequest:render:userInteraction:", 0, 0, 0, 0, 0, v18, 0, 0);

  }
}

- (void)donateBrowsingAssistantServerRequestFailedEventWithWebPageID:(id)a3 requestIdentifier:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  if (a3)
  {
    v6 = (objc_class *)MEMORY[0x1E0D021B0];
    v7 = a4;
    v8 = a3;
    v12 = (id)objc_msgSend([v6 alloc], "initWithExists:", 0);
    v9 = objc_alloc(MEMORY[0x1E0D021A0]);
    objc_msgSend(v8, "dataUsingEncoding:allowLossyConversion:", 4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(v9, "initWithWebpageViewIdentifier:requestIdentifier:started:ended:failed:", v10, v7, 0, 0, v12);
    -[WBSBiomeDonationManager _donateBrowsingAssistantEvents:dimensionContext:bloomFilterPassed:eligible:webpageUrlSent:serverRequest:render:userInteraction:](self, "_donateBrowsingAssistantEvents:dimensionContext:bloomFilterPassed:eligible:webpageUrlSent:serverRequest:render:userInteraction:", 0, 0, 0, 0, 0, v11, 0, 0);

  }
}

- (void)donateBrowsingAssistantVisualComponentPresentationStartedWithWebPageID:(id)a3 componentType:(int64_t)a4 componentIdentifier:(id)a5 summaryText:(id)a6 tableOfContentsArrayLength:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  if (a3)
  {
    v12 = a7;
    v13 = a6;
    v14 = a5;
    v15 = a3;
    -[WBSBiomeDonationManager _getVisualComponentAttributeFromComponentType:](self, "_getVisualComponentAttributeFromComponentType:", a4);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D021E0]), "initWithSummaryText:tableOfContentsArrayLength:", v13, v12);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D021D0]), "initWithVisualComponentAttribute:visualComponentData:identifier:", v22, v16, v14);
    v18 = objc_alloc(MEMORY[0x1E0D021E8]);
    objc_msgSend(v15, "dataUsingEncoding:allowLossyConversion:", 4, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D021F8]), "initWithExists:", 0);
    v21 = (void *)objc_msgSend(v18, "initWithWebpageViewIdentifier:visualComponent:started:ended:", v19, v17, v20, 0);

    -[WBSBiomeDonationManager _donateBrowsingAssistantEvents:dimensionContext:bloomFilterPassed:eligible:webpageUrlSent:serverRequest:render:userInteraction:](self, "_donateBrowsingAssistantEvents:dimensionContext:bloomFilterPassed:eligible:webpageUrlSent:serverRequest:render:userInteraction:", 0, 0, 0, 0, 0, 0, v21, 0);
  }
}

- (void)donateBrowsingAssistantVisualComponentPresentationEndedWithWebPageID:(id)a3 componentType:(int64_t)a4 componentIdentifier:(id)a5 hideReason:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  if (a3)
  {
    v10 = a5;
    v11 = a3;
    -[WBSBiomeDonationManager _getVisualComponentAttributeFromComponentType:](self, "_getVisualComponentAttributeFromComponentType:", a4);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D021E0]), "initWithSummaryText:tableOfContentsArrayLength:", 0, 0);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D021D0]), "initWithVisualComponentAttribute:visualComponentData:identifier:", v18, v12, v10);

    if ((unint64_t)(a6 - 1) < 3)
      a6 = a6;
    else
      a6 = 0;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D021F0]), "initWithHideReason:", a6);
    v15 = objc_alloc(MEMORY[0x1E0D021E8]);
    objc_msgSend(v11, "dataUsingEncoding:allowLossyConversion:", 4, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(v15, "initWithWebpageViewIdentifier:visualComponent:started:ended:", v16, v13, 0, v14);
    -[WBSBiomeDonationManager _donateBrowsingAssistantEvents:dimensionContext:bloomFilterPassed:eligible:webpageUrlSent:serverRequest:render:userInteraction:](self, "_donateBrowsingAssistantEvents:dimensionContext:bloomFilterPassed:eligible:webpageUrlSent:serverRequest:render:userInteraction:", 0, 0, 0, 0, 0, 0, v17, 0);

  }
}

+ (int64_t)entityComponentTypeFromResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  int v15;
  char v17;

  v3 = a3;
  objc_msgSend(v3, "domainName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("kg")))
  {
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(v3, "entityType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lowercaseString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("sb104")) & 1) != 0)
      {
        v9 = 4;
LABEL_13:

        goto LABEL_14;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("sb117")))
      {
        v9 = 6;
        goto LABEL_13;
      }
      v17 = objc_msgSend(v8, "isEqualToString:", CFSTR("sb183"));

      if ((v17 & 1) != 0)
      {
        v9 = 6;
        goto LABEL_14;
      }
    }
  }
  else
  {

  }
  objc_msgSend(v3, "domainName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lowercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("media"));

  if ((v12 & 1) != 0)
  {
    v9 = 7;
  }
  else
  {
    objc_msgSend(v3, "domainName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lowercaseString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("maps"));

    if (v15)
      v9 = 5;
    else
      v9 = 3;
  }
LABEL_14:

  return v9;
}

- (void)donateBrowsingAssistantUserInteractionDetectedWithWebPageID:(id)a3 componentType:(int64_t)a4 componentIdentifier:(id)a5 summaryText:(id)a6 tableOfContentsArrayLength:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  if (a3)
  {
    v12 = a7;
    v13 = a6;
    v14 = a5;
    v15 = a3;
    -[WBSBiomeDonationManager _getVisualComponentAttributeFromComponentType:](self, "_getVisualComponentAttributeFromComponentType:", a4);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D021E0]), "initWithSummaryText:tableOfContentsArrayLength:", v13, v12);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D021D0]), "initWithVisualComponentAttribute:visualComponentData:identifier:", v21, v16, v14);
    v18 = objc_alloc(MEMORY[0x1E0D021C8]);
    objc_msgSend(v15, "dataUsingEncoding:allowLossyConversion:", 4, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)objc_msgSend(v18, "initWithWebpageViewIdentifier:visualComponent:userInteractionType:visualComponentInteractionInfo:", v19, v17, 1, 0);
    -[WBSBiomeDonationManager _donateBrowsingAssistantEvents:dimensionContext:bloomFilterPassed:eligible:webpageUrlSent:serverRequest:render:userInteraction:](self, "_donateBrowsingAssistantEvents:dimensionContext:bloomFilterPassed:eligible:webpageUrlSent:serverRequest:render:userInteraction:", 0, 0, 0, 0, 0, 0, 0, v20);

  }
}

- (id)_getVisualComponentAttributeFromComponentType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  switch(a3)
  {
    case 0:
      v5 = objc_alloc(MEMORY[0x1E0D021D8]);
      v6 = 1;
      goto LABEL_5;
    case 1:
      v5 = objc_alloc(MEMORY[0x1E0D021D8]);
      v6 = 2;
LABEL_5:
      v8 = 0;
      goto LABEL_8;
    case 2:
      v5 = objc_alloc(MEMORY[0x1E0D021D8]);
      v6 = 2;
      v8 = 1;
      goto LABEL_8;
    case 3:
      v5 = objc_alloc(MEMORY[0x1E0D021D8]);
      v6 = 2;
      v8 = 2;
LABEL_8:
      v9 = 0;
      goto LABEL_13;
    case 4:
      v5 = objc_alloc(MEMORY[0x1E0D021D8]);
      v6 = 2;
      v8 = 2;
      v9 = 1;
      goto LABEL_13;
    case 5:
      v5 = objc_alloc(MEMORY[0x1E0D021D8]);
      v6 = 2;
      v8 = 2;
      v9 = 2;
      goto LABEL_13;
    case 6:
      v5 = objc_alloc(MEMORY[0x1E0D021D8]);
      v6 = 2;
      v8 = 2;
      v9 = 3;
      goto LABEL_13;
    case 7:
      v5 = objc_alloc(MEMORY[0x1E0D021D8]);
      v6 = 2;
      v8 = 2;
      v9 = 4;
LABEL_13:
      self = (WBSBiomeDonationManager *)objc_msgSend(v5, "initWithComponentType:cardType:entityType:readerViewSectionType:", v6, v8, v9, 0, v3, v4);
      break;
    default:
      return self;
  }
  return self;
}

- (void)_donateBrowsingAssistantEvents:(id)a3 dimensionContext:(id)a4 bloomFilterPassed:(id)a5 eligible:(id)a6 webpageUrlSent:(id)a7 serverRequest:(id)a8 render:(id)a9 userInteraction:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  NSObject *queue;
  _QWORD block[4];
  id v27;
  id v28;
  id location;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  if (+[WBSBrowsingAssistantController userConsentState](WBSBrowsingAssistantController, "userConsentState") == 1)
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02180]), "initWithWebpageViewStarted:dimensionContext:bloomFilterPassed:eligible:webpageUrlSent:serverRequestContext:visualComponentPresentationContext:userInteractionDetected:", v16, v17, v18, v19, v20, v21, v22, v23);
    if (v24)
    {
      objc_initWeak(&location, self);
      queue = self->_streamAccessQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __154__WBSBiomeDonationManager__donateBrowsingAssistantEvents_dimensionContext_bloomFilterPassed_eligible_webpageUrlSent_serverRequest_render_userInteraction___block_invoke;
      block[3] = &unk_1E4B2A160;
      objc_copyWeak(&v28, &location);
      v27 = v24;
      dispatch_async(queue, block);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }

  }
}

void __154__WBSBiomeDonationManager__donateBrowsingAssistantEvents_dimensionContext_bloomFilterPassed_eligible_webpageUrlSent_serverRequest_render_userInteraction___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_browsingAssistantStream");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "source");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendEvent:", *(_QWORD *)(a1 + 32));

    WeakRetained = v5;
  }

}

- (void)clearEventsDonatedSinceDate:(id)a3
{
  id v4;
  NSObject *streamAccessQueue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isBiomeStreamDonationAvailable"))
  {
    streamAccessQueue = self->_streamAccessQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__WBSBiomeDonationManager_clearEventsDonatedSinceDate___block_invoke;
    v6[3] = &unk_1E4B2A118;
    v6[4] = self;
    v7 = v4;
    dispatch_async(streamAccessQueue, v6);

  }
}

uint64_t __55__WBSBiomeDonationManager_clearEventsDonatedSinceDate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearEventsDonatedSinceDate:", *(_QWORD *)(a1 + 40));
}

- (void)_clearEventsDonatedSinceDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;

  v4 = a3;
  -[WBSBiomeDonationManager _autoPlayStream](self, "_autoPlayStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pruner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke;
  v39[3] = &unk_1E4B2A188;
  v8 = v4;
  v40 = v8;
  objc_msgSend(v6, "deleteEventsPassingTest:", v39);

  -[WBSBiomeDonationManager _webPagePerformanceStream](self, "_webPagePerformanceStream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pruner");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v7;
  v37[1] = 3221225472;
  v37[2] = __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke_2;
  v37[3] = &unk_1E4B2A188;
  v11 = v8;
  v38 = v11;
  objc_msgSend(v10, "deleteEventsPassingTest:", v37);

  -[WBSBiomeDonationManager _navigationsStream](self, "_navigationsStream");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pruner");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v7;
  v35[1] = 3221225472;
  v35[2] = __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke_3;
  v35[3] = &unk_1E4B2A188;
  v14 = v11;
  v36 = v14;
  objc_msgSend(v13, "deleteEventsPassingTest:", v35);

  -[WBSBiomeDonationManager _webAppInFocusStream](self, "_webAppInFocusStream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pruner");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v7;
  v33[1] = 3221225472;
  v33[2] = __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke_4;
  v33[3] = &unk_1E4B2A188;
  v17 = v14;
  v34 = v17;
  objc_msgSend(v16, "deleteEventsPassingTest:", v33);

  -[WBSBiomeDonationManager _pageLoadStream](self, "_pageLoadStream");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "pruner");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v7;
  v31[1] = 3221225472;
  v31[2] = __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke_5;
  v31[3] = &unk_1E4B2A188;
  v20 = v17;
  v32 = v20;
  objc_msgSend(v19, "deleteEventsPassingTest:", v31);

  -[WBSBiomeDonationManager _windowProxyStream](self, "_windowProxyStream");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "pruner");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v7;
  v29[1] = 3221225472;
  v29[2] = __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke_6;
  v29[3] = &unk_1E4B2A188;
  v30 = v20;
  v27 = v20;
  objc_msgSend(v22, "deleteEventsPassingTest:", v29);

  objc_msgSend(v27, "timeIntervalSinceReferenceDate");
  v24 = v23;
  -[WBSBiomeDonationManager _browsingAssistantStream](self, "_browsingAssistantStream");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "pruner");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v7;
  v28[1] = 3221225472;
  v28[2] = __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke_7;
  v28[3] = &__block_descriptor_40_e26_B24__0__BMStoreEvent_8_B16l;
  v28[4] = v24;
  objc_msgSend(v26, "deleteEventsPassingTest:", v28);

}

uint64_t __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visited");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "visited");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "safari_isLaterThanDate:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

uint64_t __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visited");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "visited");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "safari_isLaterThanDate:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

uint64_t __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visited");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "visited");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "safari_isLaterThanDate:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

uint64_t __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "absoluteTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "safari_isLaterThanDate:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

uint64_t __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visited");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "visited");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "safari_isLaterThanDate:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

uint64_t __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visited");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "visited");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "safari_isLaterThanDate:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

BOOL __56__WBSBiomeDonationManager__clearEventsDonatedSinceDate___block_invoke_7(uint64_t a1, void *a2)
{
  double v3;

  objc_msgSend(a2, "timestamp");
  return v3 >= *(double *)(a1 + 32);
}

- (void)performPendingDeletionsBeforeTermination
{
  dispatch_sync((dispatch_queue_t)self->_streamAccessQueue, &__block_literal_global_57);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browsingAssistantStream, 0);
  objc_storeStrong((id *)&self->_windowProxyStream, 0);
  objc_storeStrong((id *)&self->_pageLoadStream, 0);
  objc_storeStrong((id *)&self->_webAppInFocusStream, 0);
  objc_storeStrong((id *)&self->_webPagePerformanceStream, 0);
  objc_storeStrong((id *)&self->_navigationsStream, 0);
  objc_storeStrong((id *)&self->_autoPlayStream, 0);
  objc_storeStrong((id *)&self->_streamAccessQueue, 0);
}

@end
