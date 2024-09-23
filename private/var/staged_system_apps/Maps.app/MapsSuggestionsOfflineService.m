@implementation MapsSuggestionsOfflineService

- (MapsSuggestionsOfflineService)init
{
  MapsSuggestionsOfflineService *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  GEOMapDataSubscriptionManager *v7;
  GEOMapDataSubscriptionManager *subscriptionManager;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MapsSuggestionsOfflineService;
  v2 = -[MapsSuggestionsOfflineService init](&v10, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("MapsSuggestionsOfflineServiceQueue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (GEOMapDataSubscriptionManager *)objc_alloc_init((Class)GEOMapDataSubscriptionManager);
    subscriptionManager = v2->_subscriptionManager;
    v2->_subscriptionManager = v7;

  }
  return v2;
}

- (BOOL)shouldKeepEntryWhenOffline:(id)a3
{
  id v4;
  uint64_t Log;
  NSObject *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  const char *v17;
  uint8_t *v18;
  uint64_t v19;
  uint8_t v21[16];
  __int16 v22;
  uint8_t v23[2];
  uint8_t buf[16];
  uint8_t v25[16];

  v4 = a3;
  if ((GEOConfigGetBOOL(MapsConfig_OfflineOnlyData, off_1014B4C08) & 1) != 0)
  {
    if (objc_msgSend(v4, "type") == (id)24)
    {
      Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "OfflineService");
      v6 = objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Not showing ContactActivity entries while offline", buf, 2u);
      }
      v7 = 0;
      goto LABEL_20;
    }
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geoMapItem"));
    if (v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geoMapItem"));
      objc_msgSend(v9, "coordinate");
      v11 = v10;
      v13 = v12;

      LODWORD(v9) = -[MapsSuggestionsOfflineService _anyDownloadedRegionContainsCoordinate:](self, "_anyDownloadedRegionContainsCoordinate:", v11, v13);
      v14 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "OfflineService");
      v15 = objc_claimAutoreleasedReturnValue(v14);
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
      if (!(_DWORD)v9)
      {
        if (v16)
        {
          *(_WORD *)v21 = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Entry's map item is NOT within a downloaded region, throwing away entry.", v21, 2u);
        }
        v7 = 0;
        goto LABEL_19;
      }
      if (!v16)
      {
        v7 = 1;
        goto LABEL_19;
      }
      v22 = 0;
      v17 = "Entry's map item is within a downloaded region, keeping entry.";
      v7 = 1;
      v18 = (uint8_t *)&v22;
    }
    else
    {
      v19 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "OfflineService");
      v15 = objc_claimAutoreleasedReturnValue(v19);
      v7 = 1;
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
LABEL_19:

        goto LABEL_20;
      }
      *(_WORD *)v23 = 0;
      v17 = "Entry does not have an associated map item, keeping entry.";
      v18 = v23;
    }
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v17, v18, 2u);
    goto LABEL_19;
  }
  v8 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "OfflineService");
  v6 = objc_claimAutoreleasedReturnValue(v8);
  v7 = 1;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Maps was NOT forced into offline mode, keeping entry.", v25, 2u);
  }
LABEL_20:

  return v7;
}

- (BOOL)_anyDownloadedRegionContainsCoordinate:(id)a3
{
  double var1;
  double var0;
  NSObject *v6;
  GEOMapDataSubscriptionManager *subscriptionManager;
  OS_dispatch_queue *queue;
  NSObject *v9;
  double Double;
  dispatch_time_t v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  var1 = a3.var1;
  var0 = a3.var0;
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  queue = self->_queue;
  subscriptionManager = self->_subscriptionManager;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10091CACC;
  v13[3] = &unk_1011DC018;
  v9 = v6;
  v16 = var0;
  v17 = var1;
  v14 = v9;
  v15 = &v18;
  -[GEOMapDataSubscriptionManager fetchAllSubscriptionsWithCallbackQueue:completionHandler:](subscriptionManager, "fetchAllSubscriptionsWithCallbackQueue:completionHandler:", queue, v13);
  Double = GEOConfigGetDouble(MapsConfig_OfflineMapsSubscriptionFetchTimeout, off_1014B4F08);
  v11 = dispatch_time(0, (uint64_t)(Double * 1000000000.0));
  dispatch_group_wait(v9, v11);
  LOBYTE(v6) = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
