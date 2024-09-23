@implementation IMURLBag

- (id)syncStringForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  -[IMURLBag syncValueForKey:](self, "syncValueForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)podcastsMediaAPIHostUrl
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForKey:", CFSTR("podcasts-media-api-host"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mediaTaskCountryCode
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("countryCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)includeEntitlementsContent
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "BOOLForKey:", CFSTR("podcasts-entitlements"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__IMURLBag_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, block);
  return (id)sharedInstance_instance_0;
}

- (id)dictionaryForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IMURLBag bag](self, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)metricsDictionary
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("metrics"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)syncValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  int v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  os_signpost_id_t v30;
  int v31;
  _BOOL4 v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  id v37;
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  int v42;
  __int16 v43;
  _BOOL4 v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMMutableBagKeySet valueTypeMap](self->_keySet, "valueTypeMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    switch(objc_msgSend(v6, "integerValue"))
    {
      case 1:
        -[IMURLBag BOOLForKey:](self, "BOOLForKey:", v4);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 2:
        -[IMURLBag doubleForKey:](self, "doubleForKey:", v4);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 3:
        -[IMURLBag integerForKey:](self, "integerForKey:", v4);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 4:
        -[IMURLBag stringForKey:](self, "stringForKey:", v4);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 5:
        -[IMURLBag URLForKey:](self, "URLForKey:", v4);
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v9 = (void *)v7;
        break;
      default:
        v9 = 0;
        break;
    }
    _MTLogCategoryBag();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_signpost_id_generate(v10);

    _MTLogCategoryBag();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v11 - 1;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v4;
      _os_signpost_emit_with_name_impl(&dword_1A904E000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "IMURLBag.syncValue", "Key: %@", buf, 0xCu);
    }

    -[IMURLBag bag](self, "bag");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMURLBag liveBag](self, "liveBag");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 == v16)
    {
      -[IMURLBag liveBag](self, "liveBag");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v18, "isExpired");

    }
    else
    {
      v17 = 0;
    }

    v19 = 0;
    v20 = 0;
    if (!objc_msgSend(v9, "isLoaded")
      || (v17 & 1) != 0
      || (objc_msgSend(v9, "asyncValuePromise"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v38 = 0,
          objc_msgSend(v21, "resultWithTimeout:error:", &v38, 0.15),
          v19 = (id)objc_claimAutoreleasedReturnValue(),
          v20 = v38,
          v21,
          !v19)
      || v20)
    {
      v37 = v4;
      _MTLogCategoryBag();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = objc_msgSend(v9, "isLoaded");
        v26 = v11 - 1;
        v27 = v6;
        v28 = v15;
        v29 = v9;
        v30 = v11;
        v31 = v25;
        v32 = -[IMURLBag isExpired](self, "isExpired");
        *(_DWORD *)buf = 138413058;
        v40 = v37;
        v41 = 1024;
        v42 = v31;
        v11 = v30;
        v9 = v29;
        v15 = v28;
        v6 = v27;
        v14 = v26;
        v43 = 1024;
        v44 = v32;
        v45 = 2112;
        v46 = v20;
        _os_log_impl(&dword_1A904E000, v24, OS_LOG_TYPE_ERROR, "Failed synchronous bag key request: %@ isLoaded %d, isExpired %d. Error: %@", buf, 0x22u);
      }

      _MTLogCategoryBag();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v20;
        _os_signpost_emit_with_name_impl(&dword_1A904E000, v34, OS_SIGNPOST_INTERVAL_END, v11, "IMURLBag.syncValue", "Error: %@", buf, 0xCu);
      }

      -[IMMutableBagKeySet defaultValueMap](self->_keySet, "defaultValueMap");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v37;
      objc_msgSend(v35, "objectForKeyedSubscript:", v37);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _MTLogCategoryBag();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A904E000, v23, OS_SIGNPOST_INTERVAL_END, v11, "IMURLBag.syncValue", ", buf, 2u);
      }

      v19 = v19;
      v20 = 0;
      v8 = v19;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)bag
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  if ((os_feature_enabled_bag_snapshot_overlay() & 1) != 0)
  {
    -[IMURLBag currentSnapshot](self, "currentSnapshot");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      -[IMURLBag liveBag](self, "liveBag");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;

  }
  else
  {
    -[IMURLBag liveBag](self, "liveBag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (AMSSnapshotBag)currentSnapshot
{
  return (AMSSnapshotBag *)objc_getProperty(self, a2, 40, 1);
}

- (AMSBag)liveBag
{
  return self->_liveBag;
}

- (id)doubleForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IMURLBag bag](self, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)stringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IMURLBag bag](self, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __26__IMURLBag_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___IMURLBag;
  v1 = objc_msgSend(objc_msgSendSuper2(&v3, sel_allocWithZone_, 0), "init");
  v2 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = v1;

}

- (IMURLBag)init
{
  IMURLBag *v2;
  IMURLBag *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  AMSBag *liveBag;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  NSObject *v11;
  _QWORD block[4];
  IMURLBag *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)IMURLBag;
  v2 = -[IMURLBag init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    -[IMURLBag _registerBagKeysIfNeeded](v2, "_registerBagKeysIfNeeded");
    v4 = (void *)MEMORY[0x1E0CFD9E8];
    +[PFClientUtil bagProfileName](PFClientUtil, "bagProfileName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PFClientUtil bagProfileVersion](PFClientUtil, "bagProfileVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bagForProfile:profileVersion:", v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    liveBag = v3->_liveBag;
    v3->_liveBag = (AMSBag *)v7;

    v9 = dispatch_queue_create("IMURLBag", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v9;

    *(int64x2_t *)&v3->_downloadLimitPodcast = vdupq_n_s64(0xBEBC200uLL);
    v3->_libraryShowFetchThresholdDefaultValue = 60.0;
    v11 = v3->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __16__IMURLBag_init__block_invoke;
    block[3] = &unk_1E54D0DE0;
    v14 = v3;
    dispatch_async(v11, block);

  }
  return v3;
}

- (void)_registerBagKeysIfNeeded
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__IMURLBag__registerBagKeysIfNeeded__block_invoke;
  block[3] = &unk_1E54D0DE0;
  block[4] = self;
  if (_registerBagKeysIfNeeded_onceToken != -1)
    dispatch_once(&_registerBagKeysIfNeeded_onceToken, block);
}

void __36__IMURLBag__registerBagKeysIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  IMMutableBagKeySet *v35;

  v35 = objc_alloc_init(IMMutableBagKeySet);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("js-app-url"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("language"), 4);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("fetch-timeout"), 2);
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("ExplicitContentBadgeTreatment"), 4, &stru_1E5500770);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("search"), 4);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("searchHints"), 4);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("podcasts"), 5);
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("viewPodcast"), 5, CFSTR("https://podcasts.apple.com/podcast"));
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("appletv-view-top-url"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("library-link"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("showSearchTranscriptMessage"), 1);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("ListenNowStoreShelvesThrottleInterval"), 2);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("followedShowsMetricsCadence"), 4);
  v2 = (void *)MEMORY[0x1E0CB37E8];
  +[MTPodcast defaultUpdateInterval](MTPodcast, "defaultUpdateInterval");
  objc_msgSend(v2, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcast-skip-feed-update-interval-seconds"), 2, v3);

  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcast-upp-sync-interval-seconds"), 2, &unk_1E5539678);
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcast-old-feed-update-processor-interval-in-seconds"), 2, &unk_1E55393E0);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("p2-application-user-rate-content"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("sp2-application-user-write-review"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("forgottenPassword"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("modifyAccount"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("AddFundsUrl"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("manageSubscriptionsV2Url"), 5);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://buy.itunes.apple.com/WebObjects/MZFinance.woa/wa/signupWizard"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("signup"), 5, v4);

  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("metrics/metricsUrl"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("metrics"), 6);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("metrics/performance/samplingPercentageUsersLog"), 2);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("metrics/performance/sessionDurationLog"), 2);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("metrics/impressions/viewableThreshold"), 2);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("metrics/impressions/viewablePercentage"), 2);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("metrics/postFrequencyLowLatency"), 2);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("sign-sap-setup-cert"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("sign-sap-setup"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("signed-actions"), 6);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("sign-sap-request"), 6);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("sign-sap-response"), 6);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("storeplatform-lookup-url"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("storeplatform-lookup-url-unpersonalized"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("trustedDomains"), 0);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("amp-api.podcasts.apple.com"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcasts-media-api-host"), 5, v5);

  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("countryCode"), 4, CFSTR("us"));
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://sf-api-token-service.itunes.apple.com/apiToken/"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("sf-api-token-service-url"), 5, v6);

  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("channelSubsCacheTTL"), 2, &unk_1E5539688);
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("token-service-backoff-interval"), 2, &unk_1E5539698);
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("token-service-backoff-max"), 2, &unk_1E55396A8);
  v7 = MEMORY[0x1E0C9AAB0];
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("token-service-enabled"), 1, MEMORY[0x1E0C9AAB0]);
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("token-service-refresh-percentage"), 2, &unk_1E55396B8);
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("token-service-refresh-time"), 2, &unk_1E55393F8);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://s.mzstatic.com/sap/fps-prod.crt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("fps-cert"), 5, v8);

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://play.itunes.apple.com/WebObjects/MZPlay.woa/podcast/hls/license/streaming/start"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcasts-license-streaming-start"), 5, v9);

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://play.itunes.apple.com/WebObjects/MZPlay.woa/podcast/hls/license/streaming/renew"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcasts-license-streaming-renew"), 5, v10);

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://play.itunes.apple.com/WebObjects/MZPlay.woa/podcast/hls/license/streaming/stop"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcasts-license-streaming-stop"), 5, v11);

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://play.itunes.apple.com/WebObjects/MZPlay.woa/podcast/hls/license/offline/start"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcasts-license-offline-start"), 5, v12);

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://play.itunes.apple.com/WebObjects/MZPlay.woa/podcast/hls/license/offline/renew"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcasts-license-offline-renew"), 5, v13);

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://play.itunes.apple.com/WebObjects/MZPlay.woa/podcast/hls/license/offline/stop"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcasts-license-offline-stop"), 5, v14);

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://play.itunes.apple.com/WebObjects/MZPlay.woa/podcast/hls/license/offline/stop/nonce"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcasts-license-offline-stop-nonce"), 5, v15);

  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("fairplay-v2-enabled"), 1, v7);
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("fairplay-v2-rollout-rate"), 2, &unk_1E55396C8);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://buy.itunes.apple.com/WebObjects/MZBuy.woa/wa/buyProduct"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("buyProduct"), 5, v16);

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://p2-buy.itunes.apple.com/WebObjects/MZBuy.woa/wa/buyProduct"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("p2-in-app-buy"), 5, v17);

  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("commerce-ui-urls/url-patterns"), 0, &unk_1E5539618);
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("commerce-ui-urls/v2-url-patterns"), 0, &unk_1E5539630);
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("commerce-ui-urls/dynamic-url-patterns"), 0, &unk_1E5539648);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://finance-app.itunes.apple.com/account/manage-payments?=mtPageRef=BE-IAB"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("paymentInformationUrl"), 5, v18);

  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcast-implicitly-followed-shows-limit"), 3, &unk_1E5539410);
  v19 = (void *)MEMORY[0x1E0CB37E8];
  +[MTPodcast defaultUpdateInterval](MTPodcast, "defaultUpdateInterval");
  objc_msgSend(v19, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcast-skip-feed-update-interval-seconds"), 2, v20);

  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcast-old-feed-update-processor-interval-in-seconds"), 2, &unk_1E55393E0);
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcast-foreground-show-feed-update-threshold-in-seconds"), 2, &unk_1E5539428);
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcast-feed-update-interval-seconds"), 2, &unk_1E5539440);
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcasts-oauth-redirect-url"), 4, CFSTR("https://oauth.link.apple.com/api/v1/client/redirect/{oauth-adam-id}"));
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcasts-oauth-revoke-subscription-url"), 4, CFSTR("https://oauth.link.apple.com/api/v1/revoke/subscription/{oauth-adam-id}"));
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("play-activity-feed-metadata"), 5);
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcasts-music-subs-info-interval-in-seconds"), 2, &unk_1E5539458);
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcasts-entitlements"), 1, v7);
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcasts-category-sync-threshold-interval-seconds"), 2, &unk_1E5539470);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 60.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcast-library-show-feed-update-threshold-in-seconds"), 2, v21);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("guid-urls/regex"), 0);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("guid-urls/schemes"), 0);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("pushNotificationSettings"), 6);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("podcast-catalog"), 1);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("upp-polling-interval-secs"), 3);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("podcast-lookup-url"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("podcast-genres-tree"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("podcast-dzc-auto-download-url"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("podcast-dzc-download-url"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("podcast-dzc-enclosure-url"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("podcast-dzc-material-delete-url"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("podcast-dzc-stream-url"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("podcast-dzc-subscribe-podcast"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("podcast-dzc-browse-url"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("kvs-getall"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("kvs-putall"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("p2-podcasts-search"), 5);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("itms://itunes.com/welcometopodcasts"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcast-welcome-room-url"), 5, v22);

  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcast-redirect-url-prefix"), 4, CFSTR("https://pcr.apple.com/id"));
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://bookkeeper.itunes.apple.com/WebObjects/MZBookkeeper.woa/wa/register"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("kvs-register"), 5, v23);

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://buy.itunes.apple.com/WebObjects/MZFinance.woa/wa/acknowledgePrivacy"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("privacyAcknowledgementUrl"), 5, v24);

  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("kvs-getall.com.apple.upp"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("kvs-putall.com.apple.upp"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("baseURLForGETAll"), 5);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("baseURLForPUTAll"), 5);
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("upp-disabled"), 4, CFSTR("NO"));
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("UPPDisabled"), 1, MEMORY[0x1E0C9AAA0]);
  LODWORD(v25) = 1163984896;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("pollingInterval"), 2, v26);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("mobile-network-constraints"), 0);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://www.apple.com/feedback/apple-podcasts.html"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcast-report-a-concern-url"), 5, v27);

  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("podcast-cold-start-available-in-storefront"), 1);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("podcast-cold-start-should-land-listen-now"), 1);
  -[AMSMutableBagKeySet addBagKey:valueType:](v35, "addBagKey:valueType:", CFSTR("transcript-censor-words"), 0);
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcast-delta-feed-sync-batch-enabled"), 1, v7);
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcast-delta-feed-sync-batch-threshold"), 3, &unk_1E5539488);
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcast-delta-feed-sync-batch-size-limit"), 3, &unk_1E55394A0);
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcast-delta-feed-sync-batch-on-pushes-rollout-percentage"), 3, &unk_1E55393C8);
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcast-delta-feed-sync-show-decay-period-in-days"), 3, &unk_1E55394B8);
  -[IMMutableBagKeySet addBagKey:valueType:defaultValue:](v35, "addBagKey:valueType:defaultValue:", CFSTR("podcast-delta-feed-sync-batch-on-pushes-size-limit"), 3, &unk_1E55394D0);
  v28 = (void *)MEMORY[0x1E0CFD9F0];
  objc_msgSend(MEMORY[0x1E0CFDC80], "bagKeySet");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFClientUtil bagProfileName](PFClientUtil, "bagProfileName");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFClientUtil bagProfileVersion](PFClientUtil, "bagProfileVersion");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "registerBagKeySet:forProfile:profileVersion:", v29, v30, v31);

  v32 = (void *)MEMORY[0x1E0CFD9F0];
  +[PFClientUtil bagProfileName](PFClientUtil, "bagProfileName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFClientUtil bagProfileVersion](PFClientUtil, "bagProfileVersion");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "registerBagKeySet:forProfile:profileVersion:", v35, v33, v34);

  objc_msgSend(*(id *)(a1 + 32), "setKeySet:", v35);
}

- (void)setKeySet:(id)a3
{
  objc_storeStrong((id *)&self->_keySet, a3);
}

uint64_t __41__IMURLBag_createSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)BOOLForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IMURLBag bag](self, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "BOOLForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)arrayForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IMURLBag bag](self, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __16__IMURLBag_init__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "updateBagOnCurrentQueue");
  objc_msgSend(MEMORY[0x1E0CFDBC0], "networkConstraintsForMediaType:withBag:", CFSTR("podcast"), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __16__IMURLBag_init__block_invoke_2;
  v7[3] = &unk_1E54D3818;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v2, "addFinishBlock:", v7);

  objc_msgSend(MEMORY[0x1E0CFDBC0], "networkConstraintsForMediaType:withBag:", CFSTR("videoPodcast"), *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __16__IMURLBag_init__block_invoke_3;
  v5[3] = &unk_1E54D3818;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "addFinishBlock:", v5);

}

- (void)updateBagOnCurrentQueue
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (os_feature_enabled_bag_snapshot_overlay())
  {
    objc_initWeak(&location, self);
    -[IMURLBag liveBag](self, "liveBag");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __35__IMURLBag_updateBagOnCurrentQueue__block_invoke;
    v4[3] = &unk_1E54D3840;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v3, "createSnapshotWithCompletion:", v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)createSnapshotWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[IMURLBag liveBag](self, "liveBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__IMURLBag_createSnapshotWithCompletion___block_invoke;
  v7[3] = &unk_1E54D3890;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "createSnapshotWithCompletion:", v7);

}

- (id)URLForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IMURLBag bag](self, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)integerForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IMURLBag bag](self, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "integerForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __16__IMURLBag_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *MEMORY[0x1E0CFD930];
  v5 = v3;
  if (objc_msgSend(v3, "hasSizeLimitForNetworkType:", *MEMORY[0x1E0CFD930]))
    objc_msgSend(*(id *)(a1 + 32), "setDownloadLimitPodcast:", objc_msgSend(v5, "sizeLimitForNetworkType:", v4));

}

void __16__IMURLBag_init__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *MEMORY[0x1E0CFD930];
  v5 = v3;
  if (objc_msgSend(v3, "hasSizeLimitForNetworkType:", *MEMORY[0x1E0CFD930]))
    objc_msgSend(*(id *)(a1 + 32), "setDownloadLimitVideoPodcast:", objc_msgSend(v5, "sizeLimitForNetworkType:", v4));

}

- (void)setDownloadLimitVideoPodcast:(int64_t)a3
{
  self->_downloadLimitVideoPodcast = a3;
}

- (void)setDownloadLimitPodcast:(int64_t)a3
{
  self->_downloadLimitPodcast = a3;
}

void __35__IMURLBag_updateBagOnCurrentQueue__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  void *v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__IMURLBag_updateBagOnCurrentQueue__block_invoke_2;
    block[3] = &unk_1E54D2000;
    v11 = v5;
    v12 = v6;
    v13 = v8;
    dispatch_async(v9, block);

  }
}

void __35__IMURLBag_updateBagOnCurrentQueue__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) && !*(_QWORD *)(a1 + 40))
  {
    _MTLogCategoryBag();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1A904E000, v7, OS_LOG_TYPE_DEFAULT, "Successfully updated bag snapshot.", (uint8_t *)&v8, 2u);
    }

    objc_msgSend(*(id *)(a1 + 48), "updateWithNewBag:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 48), "setFailedUpdateAttempts:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "setFailedUpdateAttempts:", objc_msgSend(*(id *)(a1 + 48), "failedUpdateAttempts") + 1);
    _MTLogCategoryBag();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "failedUpdateAttempts"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 40);
      v8 = 138412546;
      v9 = v3;
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_1A904E000, v2, OS_LOG_TYPE_ERROR, "%@ failure to create snapshot bag with error %@", (uint8_t *)&v8, 0x16u);

    }
    v5 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 300.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheduleBagUpdateOnDate:", v6);

  }
}

- (void)updateWithNewBag:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[IMURLBag setCurrentSnapshot:](self, "setCurrentSnapshot:", v4);
    objc_msgSend(v4, "expirationDate");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "dateByAddingTimeInterval:", 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMURLBag scheduleBagUpdateOnDate:](self, "scheduleBagUpdateOnDate:", v5);

  }
}

- (void)setFailedUpdateAttempts:(unint64_t)a3
{
  self->_failedUpdateAttempts = a3;
}

- (void)setCurrentSnapshot:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)scheduleBagUpdateOnDate:(id)a3
{
  id v4;
  double v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  -[IMURLBag queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__IMURLBag_scheduleBagUpdateOnDate___block_invoke;
  v8[3] = &unk_1E54D1E18;
  objc_copyWeak(&v9, &location);
  dispatch_after(v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)isExpired
{
  void *v2;
  char v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isExpired");

  return v3;
}

+ (void)registerBagKeys:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CFD9F0];
  v4 = a3;
  +[PFClientUtil bagProfileName](PFClientUtil, "bagProfileName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[PFClientUtil bagProfileVersion](PFClientUtil, "bagProfileVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerBagKeySet:forProfile:profileVersion:", v4, v6, v5);

}

void __36__IMURLBag_scheduleBagUpdateOnDate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateBagOnCurrentQueue");

}

- (NSDate)expirationDate
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSString)profile
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)profileVersion
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profileVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)reportAConcernURLWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[IMURLBag reportAConcernURL](self, "reportAConcernURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMURLBag queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__IMURLBag_reportAConcernURLWithCompletion___block_invoke;
  v8[3] = &unk_1E54D1A48;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "asyncValueOnQueue:withCompletion:", v6, v8);

}

void __44__IMURLBag_reportAConcernURLWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v6 = a2;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__IMURLBag_reportAConcernURLWithCompletion___block_invoke_2;
  block[3] = &unk_1E54D3868;
  v12 = v7;
  v8 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v9 = v6;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __44__IMURLBag_reportAConcernURLWithCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  id v2;

  v1 = a1[6];
  if (a1[4])
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://www.apple.com/feedback/apple-podcasts.html"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v1 + 16))(a1[6], a1[5]);
  }
}

- (id)metricsURL
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForKey:", CFSTR("metrics/metricsUrl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)metricsSamplingPercentageUsersLog
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("metrics/performance/samplingPercentageUsersLog"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)metricsSessionDurationLog
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("metrics/performance/sessionDurationLog"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)metricsImpressionableThreshold
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("metrics/impressions/viewableThreshold"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)metricsImpressionableViewablePercentage
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("metrics/impressions/viewablePercentage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)metricsFastImpressionTimeout
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("metrics/postFrequencyLowLatency"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mescalCertificateURL
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForKey:", CFSTR("sign-sap-setup-cert"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mescalSetupURL
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForKey:", CFSTR("sign-sap-setup"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mescalSignedActions
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("signed-actions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mescalSignSapRequests
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("sign-sap-request"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mescalSignSapResponses
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("sign-sap-response"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)personalizedLookupURL
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForKey:", CFSTR("storeplatform-lookup-url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)unpersonalizedLookupURL
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForKey:", CFSTR("storeplatform-lookup-url-unpersonalized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)backgroundFetchInterval
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("podcast-feed-update-interval-seconds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)libraryShowFetchThreshold
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("podcast-library-show-feed-update-threshold-in-seconds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)trustedDomains
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", CFSTR("trustedDomains"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)tokenServiceUrl
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForKey:", CFSTR("sf-api-token-service-url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)personalizedChannelPollingInterval
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("channelSubsCacheTTL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)podcastsLicenseCert
{
  return -[IMURLBag URLForKey:](self, "URLForKey:", CFSTR("fps-cert"));
}

- (id)podcastsLicenseStreamingStart
{
  return -[IMURLBag URLForKey:](self, "URLForKey:", CFSTR("podcasts-license-streaming-start"));
}

- (id)podcastsLicenseStreamingRenew
{
  return -[IMURLBag URLForKey:](self, "URLForKey:", CFSTR("podcasts-license-streaming-renew"));
}

- (id)podcastsLicenseStreamingStop
{
  return -[IMURLBag URLForKey:](self, "URLForKey:", CFSTR("podcasts-license-streaming-stop"));
}

- (id)podcastsLicenseOfflineStart
{
  return -[IMURLBag URLForKey:](self, "URLForKey:", CFSTR("podcasts-license-offline-start"));
}

- (id)podcastsLicenseOfflineRenew
{
  return -[IMURLBag URLForKey:](self, "URLForKey:", CFSTR("podcasts-license-offline-renew"));
}

- (id)podcastsLicenseOfflineStop
{
  return -[IMURLBag URLForKey:](self, "URLForKey:", CFSTR("podcasts-license-offline-stop"));
}

- (id)podcastsLicenseOfflineStopNonce
{
  return -[IMURLBag URLForKey:](self, "URLForKey:", CFSTR("podcasts-license-offline-stop-nonce"));
}

- (id)fairPlayV2Enabled
{
  return -[IMURLBag BOOLForKey:](self, "BOOLForKey:", CFSTR("fairplay-v2-enabled"));
}

- (id)fairPlayV2RolloutRate
{
  return -[IMURLBag doubleForKey:](self, "doubleForKey:", CFSTR("fairplay-v2-rollout-rate"));
}

- (id)pushNotificationRegistration
{
  return -[IMURLBag URLForKey:](self, "URLForKey:", CFSTR("kvs-register"));
}

- (id)reportAConcernURL
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForKey:", CFSTR("podcast-report-a-concern-url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)commerceOAuthVerificationUrl
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("podcasts-oauth-redirect-url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)commerceOAuthCancellationUrl
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("podcasts-oauth-revoke-subscription-url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)commerceMusicSubscriptionInfoUrl
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForKey:", CFSTR("play-activity-feed-metadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)fetchMusicSubscriptionThresholdValue
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("podcasts-music-subs-info-interval-in-seconds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)fetchCategoriesSyncThresholdValue
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("podcasts-category-sync-threshold-interval-seconds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)explicitContentBadgeTreatment
{
  void *v2;
  unint64_t v3;

  -[IMURLBag syncStringForKey:](self, "syncStringForKey:", CFSTR("ExplicitContentBadgeTreatment"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("korea"));

  return v3;
}

- (id)storefrontSupportsColdStart
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "BOOLForKey:", CFSTR("podcast-cold-start-available-in-storefront"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)coldStartLandOnListenNow
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "BOOLForKey:", CFSTR("podcast-cold-start-should-land-listen-now"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)transcriptCensorWords
{
  void *v2;
  void *v3;

  -[IMURLBag bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", CFSTR("transcript-censor-words"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)batchFeedFetchIsEnabled
{
  if (os_feature_enabled_batch_feed_fetch_on_push_forced())
    objc_msgSend(MEMORY[0x1E0CFD9F8], "frozenBagValueWithKey:value:valueType:", CFSTR("podcast-delta-feed-sync-batch-enabled"), MEMORY[0x1E0C9AAB0], 1);
  else
    -[IMURLBag BOOLForKey:](self, "BOOLForKey:", CFSTR("podcast-delta-feed-sync-batch-enabled"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)batchFeedFetchShowCountMinimum
{
  return -[IMURLBag integerForKey:](self, "integerForKey:", CFSTR("podcast-delta-feed-sync-batch-threshold"));
}

- (id)batchFeedFetchShowBatchSize
{
  return -[IMURLBag integerForKey:](self, "integerForKey:", CFSTR("podcast-delta-feed-sync-batch-size-limit"));
}

- (id)batchFeedFetchOnPushRolloutPercentage
{
  if (os_feature_enabled_batch_feed_fetch_on_push_forced())
    objc_msgSend(MEMORY[0x1E0CFD9F8], "frozenBagValueWithKey:value:valueType:", CFSTR("podcast-delta-feed-sync-batch-on-pushes-rollout-percentage"), &unk_1E55393C8, 3);
  else
    -[IMURLBag integerForKey:](self, "integerForKey:", CFSTR("podcast-delta-feed-sync-batch-on-pushes-rollout-percentage"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)batchFeedFetchOnPushDormancyPeriod
{
  return -[IMURLBag integerForKey:](self, "integerForKey:", CFSTR("podcast-delta-feed-sync-show-decay-period-in-days"));
}

- (id)batchFeedFetchOnPushShowLimit
{
  return -[IMURLBag integerForKey:](self, "integerForKey:", CFSTR("podcast-delta-feed-sync-batch-on-pushes-size-limit"));
}

- (int64_t)downloadLimitPodcast
{
  return self->_downloadLimitPodcast;
}

- (int64_t)downloadLimitVideoPodcast
{
  return self->_downloadLimitVideoPodcast;
}

- (double)libraryShowFetchThresholdDefaultValue
{
  return self->_libraryShowFetchThresholdDefaultValue;
}

- (void)setLibraryShowFetchThresholdDefaultValue:(double)a3
{
  self->_libraryShowFetchThresholdDefaultValue = a3;
}

- (void)setLiveBag:(id)a3
{
  objc_storeStrong((id *)&self->_liveBag, a3);
}

- (IMMutableBagKeySet)keySet
{
  return self->_keySet;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (unint64_t)failedUpdateAttempts
{
  return self->_failedUpdateAttempts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_keySet, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_liveBag, 0);
}

@end
