@implementation WiFi3BarsTileCacheObserver

- (WiFi3BarsTileCacheObserver)initWithDataSourceMediator:(id)a3
{
  TBDataSourceMediator *v4;
  WiFi3BarsTileCacheObserver *v5;
  TBDataSourceMediator *dataSourceMediator;
  objc_super v8;

  v4 = (TBDataSourceMediator *)a3;
  v8.receiver = self;
  v8.super_class = (Class)WiFi3BarsTileCacheObserver;
  v5 = -[WiFi3BarsTileCacheObserver init](&v8, sel_init);
  dataSourceMediator = v5->_dataSourceMediator;
  v5->_dataSourceMediator = v4;

  -[WiFi3BarsTileCacheObserver _scheduleXPCActivity](v5, "_scheduleXPCActivity");
  return v5;
}

- (void)_scheduleXPCActivity
{
  xpc_object_t v3;
  _QWORD handler[5];

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80898], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C808F0], 0);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807C0]);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0C80790], *MEMORY[0x1E0C807B0]);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __50__WiFi3BarsTileCacheObserver__scheduleXPCActivity__block_invoke;
  handler[3] = &unk_1E881CB08;
  handler[4] = self;
  xpc_activity_register("com.apple.wifimanager.3BarsCacheObserverActivity", v3, handler);

}

uint64_t __50__WiFi3BarsTileCacheObserver__scheduleXPCActivity__block_invoke(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state;

  state = xpc_activity_get_state(activity);
  NSLog(CFSTR("%s: state %ld"), "-[WiFi3BarsTileCacheObserver _scheduleXPCActivity]_block_invoke", state);
  return objc_msgSend(*(id *)(a1 + 32), "_submitCacheAvailabilityMetric");
}

- (void)_submitCacheAvailabilityMetric
{
  void *v3;
  void *v4;
  TBGloriaTile *v5;
  double v6;
  double v7;
  double v8;
  TBGloriaTile *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  TBTileFetchRequestDescriptor *v16;
  TBTileFetchRequest *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[2];
  _QWORD v26[2];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  +[WiFiLocationManager sharedWiFiLocationManager](WiFiLocationManager, "sharedWiFiLocationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "latestLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (+[WiFiLocationManager isLocationValid:uptoSeconds:requiredAccuracy:](WiFiLocationManager, "isLocationValid:uptoSeconds:requiredAccuracy:", v4, 900.0, 2000.0))
    {
      v5 = [TBGloriaTile alloc];
      objc_msgSend(v4, "coordinate");
      v7 = v6;
      objc_msgSend(v4, "coordinate");
      v9 = -[TBGloriaTile initWithLat:lng:zoom:](v5, "initWithLat:lng:zoom:", +[TBGloriaTile defaultZoomLevel](TBGloriaTile, "defaultZoomLevel"), v7, v8);
      if (-[TBGloriaTile key](v9, "key"))
      {
        v10 = -[TBGloriaTile key](v9, "key");
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v28 = "-[WiFi3BarsTileCacheObserver _submitCacheAvailabilityMetric]";
          v29 = 2112;
          v30 = v11;
          v31 = 1024;
          v32 = +[TBGloriaTile defaultZoomLevel](TBGloriaTile, "defaultZoomLevel");
          _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: Fetching tile key at key: %@ zoom: %hhu", buf, 0x1Cu);

        }
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dateByAddingDays:", -7);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[TBTileItemDescriptor tileItemDescriptorWithKey:](TBTileItemDescriptor, "tileItemDescriptorWithKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v14, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[TBTileFetchRequestDescriptor initWithTileItems:maxCacheAge:]([TBTileFetchRequestDescriptor alloc], "initWithTileItems:maxCacheAge:", v15, v23);
        v17 = -[TBTileFetchRequest initWithDescriptor:sourcePolicy:cacheable:]([TBTileFetchRequest alloc], "initWithDescriptor:sourcePolicy:cacheable:", v16, 1, 0);
        v25[0] = CFSTR("trigger");
        v25[1] = CFSTR("tileKey");
        v26[0] = &unk_1E8861F50;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v26[1] = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[TBTileFetchRequest setUserInfo:](v17, "setUserInfo:", v19);

        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __60__WiFi3BarsTileCacheObserver__submitCacheAvailabilityMetric__block_invoke;
        v24[3] = &__block_descriptor_40_e39_v28__0___TBFetchResponse__8___v___16B24l;
        v24[4] = v10;
        -[TBTileFetchRequest setResultsHandler:](v17, "setResultsHandler:", v24);
        -[WiFi3BarsTileCacheObserver dataSourceMediator](self, "dataSourceMediator");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "executeFetchRequest:", v17);

      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "-[WiFi3BarsTileCacheObserver _submitCacheAvailabilityMetric]";
        v29 = 1024;
        LODWORD(v30) = +[TBGloriaTile defaultZoomLevel](TBGloriaTile, "defaultZoomLevel");
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: Invalid tileKey at zoom: %hhu", buf, 0x12u);
      }

    }
    else
    {
      +[TBCacheAnalyticsEvent cacheAvailabilityEventWithStatus:](TBCacheAnalyticsEvent, "cacheAvailabilityEventWithStatus:", 3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[TBAnalytics captureEvent:](TBAnalytics, "captureEvent:", v22);

    }
  }
  else
  {
    +[TBCacheAnalyticsEvent cacheAvailabilityEventWithStatus:](TBCacheAnalyticsEvent, "cacheAvailabilityEventWithStatus:", 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[TBAnalytics captureEvent:](TBAnalytics, "captureEvent:", v21);

    NSLog(CFSTR("%s: no location available"), "-[WiFi3BarsTileCacheObserver _submitCacheAvailabilityMetric]");
  }

}

void __60__WiFi3BarsTileCacheObserver__submitCacheAvailabilityMetric__block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v7 = a3;
  v8 = v7;
  if (v7)
    (*((void (**)(id))v7 + 2))(v7);
  if (a4)
  {
    objc_msgSend(v14, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      objc_msgSend(v14, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%s: fetch for %llu failed, error %@, tile is not available"), "-[WiFi3BarsTileCacheObserver _submitCacheAvailabilityMetric]_block_invoke", v10, v11);

      v12 = 0;
    }
    else
    {
      NSLog(CFSTR("%s: fetch for %llu completed, tile is available"), "-[WiFi3BarsTileCacheObserver _submitCacheAvailabilityMetric]_block_invoke", v10);
      v12 = 1;
    }
    +[TBCacheAnalyticsEvent cacheAvailabilityEventWithStatus:](TBCacheAnalyticsEvent, "cacheAvailabilityEventWithStatus:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[TBAnalytics captureEvent:](TBAnalytics, "captureEvent:", v13);

  }
}

- (TBDataSourceMediator)dataSourceMediator
{
  return self->_dataSourceMediator;
}

- (void)setDataSourceMediator:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceMediator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceMediator, 0);
}

@end
