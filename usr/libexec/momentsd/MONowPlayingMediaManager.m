@implementation MONowPlayingMediaManager

- (MONowPlayingMediaManager)initWithUniverse:(id)a3
{
  id v4;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  MOConfigurationManager *v9;
  MOConfigurationManager *configurationManager;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  void *v19;
  MONowPlayingMediaManager *v20;

  v4 = a3;
  v6 = (objc_class *)objc_opt_class(MOConfigurationManager, v5);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (MOConfigurationManager *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v8));
  configurationManager = self->_configurationManager;
  self->_configurationManager = v9;

  v11 = BiomeLibrary();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "Media"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "NowPlaying"));

  v16 = (objc_class *)objc_opt_class(MOEventStore, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v18));

  v20 = -[MONowPlayingMediaManager initWithNowPlayingStream:momentStore:](self, "initWithNowPlayingStream:momentStore:", v14, v19);
  return v20;
}

- (MONowPlayingMediaManager)initWithNowPlayingStream:(id)a3 momentStore:(id)a4
{
  id v8;
  id v9;
  MONowPlayingMediaManager *v10;
  MONowPlayingMediaManager *v11;
  BMSyncService *v12;
  BMSyncService *syncService;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  id v18;
  NSSet *v19;
  NSSet *firstPartyBundleIdSet;
  id v21;
  NSSet *v22;
  NSSet *mediaBundleDeniedIdSet;
  void *v24;
  NSDateFormatter *v25;
  NSDateFormatter *dateFormatter;
  NSDateFormatter *v27;
  uint64_t v28;
  NSURL *plistFileURL;
  uint64_t v30;
  NSURL *plistAppInfoFileURL;
  uint64_t v32;
  NSMutableDictionary *bundleIdAppInfoMappings;
  double v34;
  double v35;
  float v36;
  MONowPlayingMediaManager *v37;
  id os_log;
  NSObject *v39;
  void *v40;
  objc_super v42;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v39 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[MOSignificantContactManager initWithDuetStore:ppContactStore:cnContactStore:momentStore:configurationManager:].cold.1();

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MONowPlayingMediaManager.m"), 105, CFSTR("Invalid parameter not satisfying: momentStore"));

    goto LABEL_9;
  }
  if (!v8)
  {
LABEL_9:
    v37 = 0;
    goto LABEL_10;
  }
  v42.receiver = self;
  v42.super_class = (Class)MONowPlayingMediaManager;
  v10 = -[MONowPlayingMediaManager init](&v42, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_stream, a3);
    v12 = objc_opt_new(BMSyncService);
    syncService = v11->_syncService;
    v11->_syncService = v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = dispatch_queue_create("MONowPlayingMediaManager", v15);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v11->_momentStore, a4);
    v18 = objc_alloc((Class)NSSet);
    v19 = (NSSet *)objc_msgSend(v18, "initWithArray:", kFirstPartyMediaBundleId[0]);
    firstPartyBundleIdSet = v11->_firstPartyBundleIdSet;
    v11->_firstPartyBundleIdSet = v19;

    v21 = objc_alloc((Class)NSSet);
    v22 = (NSSet *)objc_msgSend(v21, "initWithArray:", kMediaBundleIdDenyList);
    mediaBundleDeniedIdSet = v11->_mediaBundleDeniedIdSet;
    v11->_mediaBundleDeniedIdSet = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v25 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    -[NSDateFormatter setCalendar:](v25, "setCalendar:", v24);
    -[NSDateFormatter setDateFormat:](v25, "setDateFormat:", CFSTR("yyyy-MM-dd"));
    dateFormatter = v11->_dateFormatter;
    v11->_dateFormatter = v25;
    v27 = v25;

    v28 = objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _getMediaAppCategoryPlistFileURL](v11, "_getMediaAppCategoryPlistFileURL"));
    plistFileURL = v11->_plistFileURL;
    v11->_plistFileURL = (NSURL *)v28;

    v30 = objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _getMediaAppInfoPlistFileURL](v11, "_getMediaAppInfoPlistFileURL"));
    plistAppInfoFileURL = v11->_plistAppInfoFileURL;
    v11->_plistAppInfoFileURL = (NSURL *)v30;

    -[MONowPlayingMediaManager _removeOldMediaAppCategoryPlistFile:](v11, "_removeOldMediaAppCategoryPlistFile:", v11->_plistFileURL);
    v32 = objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _readMediaAppInfoPlistFile:](v11, "_readMediaAppInfoPlistFile:", v11->_plistAppInfoFileURL));
    bundleIdAppInfoMappings = v11->_bundleIdAppInfoMappings;
    v11->_bundleIdAppInfoMappings = (NSMutableDictionary *)v32;

    -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v11->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("kMOMediaAMSAppInfoRefreshInterval"), 604800.0);
    v35 = v34;

    v36 = v35;
    v11->_kMediaInfoRefreshInterval = v36;

  }
  self = v11;
  v37 = self;
LABEL_10:

  return v37;
}

- (BOOL)streamNowPlayingEventsFromSource:(id)a3 startDate:(id)a4 endDate:(id)a5 error:(id *)a6 processEvent:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __CFString *v20;
  id v21;
  BMStream *stream;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id os_log;
  NSObject *v28;
  void *v29;
  id v30;
  BOOL v31;
  id v32;
  NSObject *v33;
  uint64_t v35;
  char v36;
  _QWORD v38[4];
  id v39;
  id v40;
  __CFString *v41;
  id v42;
  id v43;
  char v44;
  _QWORD v45[6];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  _BYTE buf[24];
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  id v54;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v16 = v15;
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  v18 = v17;
  v19 = CFAbsoluteTimeGetCurrent() + -864000.0;
  if (v16 <= v19)
    v16 = v19;
  if (v11)
  {
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
    v21 = (id)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager getStringFromBMDeviceType:](self, "getStringFromBMDeviceType:", objc_msgSend(v11, "platform")));
    if (v16 < v18)
    {
      stream = self->_stream;
      v54 = v11;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v54, 1));
      v36 = 0;
LABEL_8:
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v18));
      BYTE1(v35) = v11 == 0;
      LOBYTE(v35) = 0;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BMStream publishersForDevices:withUseCase:startTime:endTime:maxEvents:lastN:reversed:includeLocal:pipeline:](stream, "publishersForDevices:withUseCase:startTime:endTime:maxEvents:lastN:reversed:includeLocal:pipeline:", v23, CFSTR("Moments"), v24, v25, 0, 0, v35, &__block_literal_global_47));

      if (v11)
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
      v28 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        *(double *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v18;
        *(_WORD *)&buf[22] = 2112;
        v51 = (uint64_t (*)(uint64_t, uint64_t))v20;
        _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Call publishersForDevices with startTime, %f, endTime, %f, device, %@", buf, 0x20u);
      }

      v46 = 0;
      v47 = &v46;
      v48 = 0x2020000000;
      v49 = 0;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v51 = __Block_byref_object_copy__40;
      v52 = __Block_byref_object_dispose__40;
      v53 = 0;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "merge"));
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = __98__MONowPlayingMediaManager_streamNowPlayingEventsFromSource_startDate_endDate_error_processEvent___block_invoke_103;
      v45[3] = &unk_1002B60E0;
      v45[4] = &v46;
      v45[5] = buf;
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = __98__MONowPlayingMediaManager_streamNowPlayingEventsFromSource_startDate_endDate_error_processEvent___block_invoke_2;
      v38[3] = &unk_1002B6108;
      v39 = v12;
      v40 = v13;
      v20 = v20;
      v41 = v20;
      v44 = v36;
      v21 = v21;
      v42 = v21;
      v43 = v14;
      v30 = objc_msgSend(v29, "sinkWithCompletion:receiveInput:", v45, v38);

      if (a6)
        *a6 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
      v31 = *((_BYTE *)v47 + 24) != 0;

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v46, 8);

      goto LABEL_19;
    }
  }
  else
  {
    v21 = 0;
    if (v16 < v18)
    {
      stream = self->_stream;
      v23 = &__NSArray0__struct;
      v36 = 1;
      v20 = CFSTR("local");
      goto LABEL_8;
    }
    v20 = CFSTR("local");
  }
  v32 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218498;
    *(double *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2112;
    v51 = (uint64_t (*)(uint64_t, uint64_t))v20;
    _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Stop calling publishersForDevices due to inverted start/end timestamp, startTime, %f, endTime, %f, device, %@", buf, 0x20u);
  }

  (*((void (**)(id, _QWORD))v14 + 2))(v14, 0);
  v31 = 1;
LABEL_19:

  return v31;
}

BPSPublisher *__cdecl __98__MONowPlayingMediaManager_streamNowPlayingEventsFromSource_startDate_endDate_error_processEvent___block_invoke(id a1, BMBookmarkablePublisher *a2)
{
  return a2;
}

void __98__MONowPlayingMediaManager_streamNowPlayingEventsFromSource_startDate_endDate_error_processEvent___block_invoke_103(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "state"))
  {
    if (objc_msgSend(v6, "state") == (id)1)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = v3;

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

}

void __98__MONowPlayingMediaManager_streamNowPlayingEventsFromSource_startDate_endDate_error_processEvent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  MONowPlayingEvent *v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  MONowPlayingEvent *v10;
  id v11;

  v11 = a2;
  v3 = objc_alloc((Class)NSDate);
  objc_msgSend(v11, "timestamp");
  v4 = objc_msgSend(v3, "initWithTimeIntervalSinceReferenceDate:");
  if (objc_msgSend(v4, "isOnOrAfter:", *(_QWORD *)(a1 + 32))
    && objc_msgSend(v4, "isOnOrBefore:", *(_QWORD *)(a1 + 40)))
  {
    v5 = [MONowPlayingEvent alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "eventBody"));
    v7 = *(_BYTE *)(a1 + 72) == 0;
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v11, "timestamp");
    v10 = -[MONowPlayingEvent initWithNowPlayingEvent:name:isRemote:deviceSource:timestamp:](v5, "initWithNowPlayingEvent:name:isRemote:deviceSource:timestamp:", v6, v8, v7, v9);

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

- (void)_fetchNowPlayingEventsBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __93__MONowPlayingMediaManager__fetchNowPlayingEventsBetweenStartDate_EndDate_CompletionHandler___block_invoke;
  v15[3] = &unk_1002AF708;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(v11, v15);

}

void __93__MONowPlayingMediaManager__fetchNowPlayingEventsBetweenStartDate_EndDate_CompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id os_log;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  id v32;
  id v33;
  NSObject *v34;
  id v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  id obj;
  uint64_t v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  NSMutableArray *v52;
  void *v53;
  id v54;
  _QWORD v55[7];
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[7];
  id v66;
  id v67;
  _QWORD v68[5];
  id v69;
  _QWORD v70[2];
  _QWORD v71[2];
  uint8_t buf[4];
  id v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  void *v77;
  _BYTE v78[128];
  uint8_t v79[128];
  _BYTE v80[24];
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  NSMutableArray *v83;
  _BYTE v84[24];

  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x3032000000;
  v68[3] = __Block_byref_object_copy__40;
  v68[4] = __Block_byref_object_dispose__40;
  v69 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v52 = objc_opt_new(NSMutableArray);
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "syncService"));
  v67 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteDevicesWithError:", &v67));
  v5 = v67;

  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v49 = 0;
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
    v7 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __93__MONowPlayingMediaManager__fetchNowPlayingEventsBetweenStartDate_EndDate_CompletionHandler___block_invoke_cold_2((uint64_t)v84, (uint64_t)objc_msgSend(v4, "count"), v7);

    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "groupDevicesBaseOnType:", v4));
    *(_QWORD *)v80 = 0;
    *(_QWORD *)&v80[8] = v80;
    *(_QWORD *)&v80[16] = 0x3032000000;
    v81 = __Block_byref_object_copy__40;
    v82 = __Block_byref_object_dispose__40;
    v83 = objc_opt_new(NSMutableArray);
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v66 = 0;
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = __93__MONowPlayingMediaManager__fetchNowPlayingEventsBetweenStartDate_EndDate_CompletionHandler___block_invoke_110;
    v65[3] = &unk_1002B6130;
    v65[4] = v8;
    v65[5] = v68;
    v65[6] = v80;
    v11 = objc_msgSend(v8, "streamNowPlayingEventsFromSource:startDate:endDate:error:processEvent:", 0, v9, v10, &v66, v65);
    v12 = v66;
    if (v11)
    {
      v13 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = objc_msgSend(*(id *)(*(_QWORD *)&v80[8] + 40), "count");
        *(_DWORD *)buf = 134217984;
        v73 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Successfully fetched %ld NowPlaying events from Biome local device", buf, 0xCu);
      }

      if (objc_msgSend(*(id *)(*(_QWORD *)&v80[8] + 40), "count"))
        -[NSMutableArray addObjectsFromArray:](v52, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)&v80[8] + 40));
    }
    else
    {
      v16 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __93__MONowPlayingMediaManager__fetchNowPlayingEventsBetweenStartDate_EndDate_CompletionHandler___block_invoke_cold_1();

      objc_msgSend(*(id *)(*(_QWORD *)&v80[8] + 40), "removeAllObjects");
      objc_msgSend(v53, "addObject:", v12);
    }
    _Block_object_dispose(v80, 8);

  }
  objc_autoreleasePoolPop(v2);
  if (!v5)
  {
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "allKeys"));
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
    obj = v18;
    if (v19)
    {
      v47 = *(_QWORD *)v62;
      do
      {
        v20 = 0;
        v48 = v19;
        do
        {
          if (*(_QWORD *)v62 != v47)
            objc_enumerationMutation(obj);
          v50 = v20;
          v21 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v20);
          v57 = 0u;
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v51 = v21;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:"));
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v57, v78, 16);
          if (v23)
          {
            v24 = *(_QWORD *)v58;
            v54 = v22;
            do
            {
              v25 = 0;
              do
              {
                if (*(_QWORD *)v58 != v24)
                  objc_enumerationMutation(v54);
                v26 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)v25);
                v27 = objc_autoreleasePoolPush();
                *(_QWORD *)v80 = 0;
                *(_QWORD *)&v80[8] = v80;
                *(_QWORD *)&v80[16] = 0x3032000000;
                v81 = __Block_byref_object_copy__40;
                v82 = __Block_byref_object_dispose__40;
                v83 = objc_opt_new(NSMutableArray);
                v28 = *(void **)(a1 + 32);
                v29 = *(_QWORD *)(a1 + 40);
                v30 = *(_QWORD *)(a1 + 48);
                v56 = 0;
                v55[0] = _NSConcreteStackBlock;
                v55[1] = 3221225472;
                v55[2] = __93__MONowPlayingMediaManager__fetchNowPlayingEventsBetweenStartDate_EndDate_CompletionHandler___block_invoke_112;
                v55[3] = &unk_1002B6130;
                v55[4] = v28;
                v55[5] = v68;
                v55[6] = v80;
                v31 = objc_msgSend(v28, "streamNowPlayingEventsFromSource:startDate:endDate:error:processEvent:", v26, v29, v30, &v56, v55);
                v32 = v56;
                if (v31)
                {
                  v33 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
                  v34 = objc_claimAutoreleasedReturnValue(v33);
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                  {
                    v35 = objc_msgSend(*(id *)(*(_QWORD *)&v80[8] + 40), "count");
                    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "description"));
                    *(_DWORD *)buf = 134218498;
                    v73 = v35;
                    v74 = 2112;
                    v75 = v51;
                    v76 = 2112;
                    v77 = v36;
                    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Successfully fetched %ld NowPlaying events from Biome iCloud device with source type, %@, device, %@", buf, 0x20u);

                  }
                  if (objc_msgSend(*(id *)(*(_QWORD *)&v80[8] + 40), "count"))
                    -[NSMutableArray addObjectsFromArray:](v52, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)&v80[8] + 40));
                }
                else
                {
                  v37 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
                  v38 = objc_claimAutoreleasedReturnValue(v37);
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v73 = v32;
                    _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "completionHandler not called due to biome query error: %@", buf, 0xCu);
                  }

                  objc_msgSend(*(id *)(*(_QWORD *)&v80[8] + 40), "removeAllObjects");
                  objc_msgSend(v53, "addObject:", v32);
                }

                _Block_object_dispose(v80, 8);
                objc_autoreleasePoolPop(v27);
                v25 = (char *)v25 + 1;
              }
              while (v23 != v25);
              v22 = v54;
              v23 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v57, v78, 16);
            }
            while (v23);
          }

          v20 = v50 + 1;
        }
        while ((id)(v50 + 1) != v48);
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
      }
      while (v19);
    }

    if (objc_msgSend(v53, "count"))
    {
      v70[0] = NSLocalizedFailureErrorKey;
      v70[1] = NSMultipleUnderlyingErrorsKey;
      v71[0] = CFSTR("Failed to fetch NowPlaying events from Biome");
      v71[1] = v53;
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v71, v70, 2));
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MomentsFetchErrorDomain"), 50897, v39));

    }
    else
    {
      v40 = 0;
    }
    if (*(_QWORD *)(a1 + 56))
    {
      v41 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v43 = -[NSMutableArray count](v52, "count");
        v44 = *(_QWORD *)(a1 + 40);
        v45 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 48);
        *(_DWORD *)v80 = 134218498;
        *(_QWORD *)&v80[4] = v43;
        *(_WORD *)&v80[12] = 2112;
        *(_QWORD *)&v80[14] = v44;
        *(_WORD *)&v80[22] = 2112;
        v81 = v45;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Fetched %ld NowPlaying events from Biome all devices, startDate, %@, endDate, %@", v80, 0x20u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  _Block_object_dispose(v68, 8);

}

void __93__MONowPlayingMediaManager__fetchNowPlayingEventsBetweenStartDate_EndDate_CompletionHandler___block_invoke_110(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (v3)
  {
    v5 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "makeDuplicationHashForEvent:", v3)));
    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "containsObject:", v4) & 1) == 0)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v4);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v5);

    v3 = v5;
  }

}

void __93__MONowPlayingMediaManager__fetchNowPlayingEventsBetweenStartDate_EndDate_CompletionHandler___block_invoke_112(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (v3)
  {
    v5 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "makeDuplicationHashForEvent:", v3)));
    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "containsObject:", v4) & 1) == 0)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v5);

    v3 = v5;
  }

}

- (unint64_t)makeDuplicationHashForEvent:(id)a3
{
  id v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a3;
  objc_msgSend(v3, "timestamp");
  v5 = floor(v4 / 60.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](BSHashBuilder, "builder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appendString:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appendString:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "appendInteger:", objc_msgSend(v3, "playbackState")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "iTunesStoreIdentifier"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "appendString:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "appendDouble:", v5));
  v15 = objc_msgSend(v14, "hash");

  return (unint64_t)v15;
}

- (id)groupDevicesBaseOnType:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableDictionary);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v10);
        v12 = objc_autoreleasePoolPush();
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager getStringFromBMDeviceType:](self, "getStringFromBMDeviceType:", objc_msgSend(v11, "platform", (_QWORD)v18)));
        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v13));

          if (!v14)
          {
            v15 = objc_opt_new(NSMutableArray);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v15, v13);

          }
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v13));
          objc_msgSend(v16, "addObject:", v11);

        }
        objc_autoreleasePoolPop(v12);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)getStringFromBMDeviceType:(int64_t)a3
{
  if ((unint64_t)a3 > 7)
    return CFSTR("Unknown");
  else
    return off_1002B6288[a3];
}

- (id)_groupMediaPlaySessionsByDay:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  NSDateFormatter *dateFormatter;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableDictionary);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        dateFormatter = self->_dateFormatter;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate", (_QWORD)v19));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v13));

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v14));
        if (!v15)
        {
          v16 = objc_opt_new(NSMutableArray);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v16, v14);

        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v14));
        objc_msgSend(v17, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_needRefreshAppInfo:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  double Current;
  double v14;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_bundleIdAppInfoMappings, "objectForKey:", v4));
  if (v5
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_bundleIdAppInfoMappings, "objectForKey:", v4)),
        v7,
        v6,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bundleIdAppInfoMappings, "objectForKeyedSubscript:", v4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("date")));
    v10 = v9;
    if (v9 && (objc_msgSend(v9, "isEqualToString:", &stru_1002B68D0) & 1) == 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](self->_dateFormatter, "dateFromString:", v10));
      Current = CFAbsoluteTimeGetCurrent();
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      v11 = Current - v14 > self->_kMediaInfoRefreshInterval;

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)_fetchAppCateogryByBundleIds:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *bundleIdAppInfoMappings;
  NSMutableSet *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  dispatch_semaphore_t v20;
  id os_log;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  BOOL v26;
  id v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  _QWORD v32[5];
  NSMutableSet *v33;
  NSObject *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  NSMutableSet *v40;
  _BYTE v41[128];

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    bundleIdAppInfoMappings = self->_bundleIdAppInfoMappings;
    if (bundleIdAppInfoMappings && -[NSMutableDictionary count](bundleIdAppInfoMappings, "count"))
    {
      v7 = objc_opt_new(NSMutableSet);
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v30 = v5;
      v8 = v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v36;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v36 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v12);
            v14 = objc_autoreleasePoolPush();
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v15));

            if (-[MONowPlayingMediaManager _needRefreshAppInfo:](self, "_needRefreshAppInfo:", v16))
              -[NSMutableSet addObject:](v7, "addObject:", v16);

            objc_autoreleasePoolPop(v14);
            v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        }
        while (v10);
      }

      v5 = v30;
      if (!v7)
        goto LABEL_25;
    }
    else
    {
      v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v5));
      if (!v7)
      {
LABEL_25:

        goto LABEL_26;
      }
    }
    if (-[NSMutableSet count](v7, "count"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", CFSTR("MomentsUIService"), CFSTR("1")));
      v18 = objc_msgSend(objc_alloc((Class)AMSMediaTask), "initWithType:clientIdentifier:clientVersion:bag:", 0, CFSTR("com.apple.momentsd"), CFSTR("1"), v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v7, "allObjects"));
      objc_msgSend(v18, "setBundleIdentifiers:", v19);
      v20 = dispatch_semaphore_create(0);
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
      v22 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v7;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Start to fetch category info with bundleIds, %@", buf, 0xCu);
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "perform"));
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = __57__MONowPlayingMediaManager__fetchAppCateogryByBundleIds___block_invoke;
      v32[3] = &unk_1002B6158;
      v32[4] = self;
      v33 = v7;
      v24 = v20;
      v34 = v24;
      objc_msgSend(v23, "addFinishBlock:", v32);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptSource/NowPlaying/MONowPlayingMediaManager.m", 476, "-[MONowPlayingMediaManager _fetchAppCateogryByBundleIds:]"));
      v31 = 0;
      v26 = MOSemaphoreWaitAndFaultIfTimeout_Internal(v24, &v31, v25, 120.0);
      v27 = v31;
      if (!v26)
      {
        v28 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

      }
    }
    goto LABEL_25;
  }
LABEL_26:

}

void __57__MONowPlayingMediaManager__fetchAppCateogryByBundleIds___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _UNKNOWN **v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSDate *v24;
  void *v25;
  id os_log;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  const char *v34;
  uint32_t v35;
  id v36;
  id v37;
  void *v38;
  const __CFString *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSDate *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  id obj;
  unsigned __int8 v63;
  NSObject *v64;
  uint64_t v65;
  NSObject *v66;
  id v67;
  NSObject *v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t v74[128];
  uint8_t buf[4];
  NSObject *v76;
  __int16 v77;
  NSObject *v78;
  __int16 v79;
  NSObject *v80;

  v5 = a3;
  if (!v5)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "responseDataItems"));
    v9 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
    v60 = v8;
    v61 = a1;
    if (-[NSObject count](v8, "count"))
    {
      v10 = 0;
      while (1)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("attributes")));
        v13 = v12;
        if (v12)
          break;
LABEL_22:

        if ((unint64_t)-[NSObject count](v8, "count") <= ++v10)
          goto LABEL_26;
      }
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("genreDisplayName")));
      v68 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("name")));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("platformAttributes")));
      v16 = v15;
      if (!v15)
      {
LABEL_21:

        goto LABEL_22;
      }
      v66 = v14;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("ios")));
      v18 = v17;
      if (!v17)
      {
LABEL_20:

        v14 = v66;
        goto LABEL_21;
      }
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", CFSTR("bundleId")));
      v20 = (void *)objc_opt_new(v9[312]);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
      v64 = v19;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject stringByTrimmingCharactersInSet:](v19, "stringByTrimmingCharactersInSet:", v21));

      objc_msgSend(v20, "setObject:forKey:", v66, CFSTR("category"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dateFormatter"));
      v24 = objc_opt_new(NSDate);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringFromDate:", v24));
      objc_msgSend(v20, "setObject:forKey:", v25, CFSTR("date"));

      os_log = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
      v27 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v76 = v66;
        v77 = 2112;
        v78 = v64;
        v79 = 2112;
        v80 = v68;
        _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Successfully fetched category name, %@, %@, %@", buf, 0x20u);
      }

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("artwork")));
      v29 = v28;
      if (!v28)
      {
        objc_msgSend(v20, "setObject:forKey:", &stru_1002B68D0, CFSTR("bkColor"));
        v36 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
        v30 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v76 = v64;
          v77 = 2112;
          v78 = v68;
          _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Unable to fetch background color due to empty artwork, %@, %@", buf, 0x16u);
        }
        goto LABEL_19;
      }
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:", CFSTR("bgColor")));
      if (v30)
      {
        objc_msgSend(v20, "setObject:forKey:", v30, CFSTR("bkColor"));
        v31 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v76 = v30;
          v77 = 2112;
          v78 = v64;
          v79 = 2112;
          v80 = v68;
          v33 = v32;
          v34 = "Successfully fetched background color, %@, %@, %@";
          v35 = 32;
LABEL_25:
          _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, v34, buf, v35);
        }
      }
      else
      {
        objc_msgSend(v20, "setObject:forKey:", &stru_1002B68D0, CFSTR("bkColor"));
        v37 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
        v32 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v76 = v64;
          v77 = 2112;
          v78 = v68;
          v33 = v32;
          v34 = "Unable to fetch background color due to empty bkColor, %@, %@";
          v35 = 22;
          goto LABEL_25;
        }
      }

LABEL_19:
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v61 + 32), "bundleIdAppInfoMappings"));
      objc_msgSend(v38, "setObject:forKey:", v20, v22);

      a1 = v61;
      v8 = v60;
      v9 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
      goto LABEL_20;
    }
LABEL_26:
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    obj = *(id *)(a1 + 40);
    v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
    if (!v67)
      goto LABEL_40;
    v65 = *(_QWORD *)v71;
    v39 = CFSTR("category");
LABEL_28:
    v40 = 0;
    while (1)
    {
      if (*(_QWORD *)v71 != v65)
        objc_enumerationMutation(obj);
      v41 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdAppInfoMappings"));
      v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKey:", v41));
      v69 = v41;
      if (v43)
      {
        v44 = (void *)v43;
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdAppInfoMappings"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKey:", v41));
        v47 = v39;
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", v39));
        if (v48)
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdAppInfoMappings"));
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKey:", v41));
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", v47));
          v63 = objc_msgSend(v51, "isEqualToString:", &stru_1002B68D0);

          a1 = v61;
          v9 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;

          v39 = v47;
          if ((v63 & 1) == 0)
            goto LABEL_38;
          goto LABEL_37;
        }

        v39 = v47;
      }

LABEL_37:
      v52 = (void *)objc_opt_new(v9[312]);
      objc_msgSend(v52, "setObject:forKey:", &stru_1002B68D0, v39);
      objc_msgSend(v52, "setObject:forKey:", &stru_1002B68D0, CFSTR("date"));
      objc_msgSend(v52, "setObject:forKey:", &stru_1002B68D0, CFSTR("bkColor"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dateFormatter"));
      v54 = objc_opt_new(NSDate);
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "stringFromDate:", v54));
      objc_msgSend(v52, "setObject:forKey:", v55, CFSTR("date"));

      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdAppInfoMappings"));
      objc_msgSend(v56, "setObject:forKey:", v52, v69);

LABEL_38:
      if (v67 == (id)++v40)
      {
        v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
        if (!v67)
        {
LABEL_40:

          v57 = *(void **)(a1 + 32);
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "plistAppInfoFileURL"));
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdAppInfoMappings"));
          objc_msgSend(v57, "_persistMediaAppInfoPlistFile:withData:", v58, v59);

          v5 = 0;
          v7 = v60;
          goto LABEL_41;
        }
        goto LABEL_28;
      }
    }
  }
  v6 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __57__MONowPlayingMediaManager__fetchAppCateogryByBundleIds___block_invoke_cold_1();
LABEL_41:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)_getMediaAppCategoryPlistFileURL
{
  void *v2;
  void *v3;
  void *v4;
  id os_log;
  NSObject *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MOPersistenceManager userCacheDirectoryPath](MOPersistenceManager, "userCacheDirectoryPath"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v2, 1));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("mediaAppCategory.plist")));

  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MONowPlayingMediaManager _getMediaAppCategoryPlistFileURL].cold.1();

    v4 = 0;
  }

  return v4;
}

- (id)_getMediaAppInfoPlistFileURL
{
  void *v2;
  void *v3;
  void *v4;
  id os_log;
  NSObject *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MOPersistenceManager userCacheDirectoryPath](MOPersistenceManager, "userCacheDirectoryPath"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v2, 1));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("mediaAppInfo.plist")));

  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MONowPlayingMediaManager _getMediaAppInfoPlistFileURL].cold.1();

    v4 = 0;
  }

  return v4;
}

- (void)_removeOldMediaAppCategoryPlistFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id os_log;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
    v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

    if (v6)
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
      v8 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[MONowPlayingMediaManager _removeOldMediaAppCategoryPlistFile:].cold.2(v8, v9, v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
      v15 = 0;
      objc_msgSend(v4, "removeItemAtPath:error:", v11, &v15);
      v12 = v15;

      if (v12)
      {
        v13 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[MONowPlayingMediaManager _removeOldMediaAppCategoryPlistFile:].cold.1();

      }
    }

  }
}

- (id)_readMediaAppInfoPlistFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id os_log;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  NSObject *v18;
  uint8_t v20[8];
  id v21;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
    v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

    if (v6)
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
      v8 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[MONowPlayingMediaManager _readMediaAppInfoPlistFile:].cold.2(v8, v9, v10);

      v21 = 0;
      v11 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithContentsOfURL:error:", v3, &v21);
      v12 = v21;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v11));

      if (v12)
      {
        v14 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[MONowPlayingMediaManager _readMediaAppInfoPlistFile:].cold.1();

        v16 = 0;
      }
      else
      {
        v16 = v13;
      }

    }
    else
    {
      v17 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "No media app info plist found at path.", v20, 2u);
      }

      v16 = objc_alloc_init((Class)NSMutableDictionary);
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)_persistMediaAppInfoPlistFile:(id)a3 withData:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  BOOL v13;
  unsigned __int8 v14;
  id os_log;
  NSObject *v16;
  __int16 v18[8];
  id v19;
  id v20;

  v5 = a3;
  if (v5)
  {
    v20 = 0;
    v6 = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", a4, 100, 0, &v20));
    v7 = v20;
    if (v6)
      v8 = v7 == 0;
    else
      v8 = 0;
    if (v8)
    {
      v19 = 0;
      v14 = -[NSObject writeToURL:options:error:](v6, "writeToURL:options:error:", v5, 805306369, &v19);
      v9 = v19;
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
      v16 = objc_claimAutoreleasedReturnValue(os_log);
      v11 = v16;
      if (!v9 && (v14 & 1) != 0)
      {
        v13 = 1;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v18[0] = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Media app info was successfully written to plist.", (uint8_t *)v18, 2u);
        }
        v9 = v11;
        goto LABEL_19;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[MONowPlayingMediaManager _persistMediaAppInfoPlistFile:withData:].cold.3();
    }
    else
    {
      v9 = v7;
      v10 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[MONowPlayingMediaManager _persistMediaAppInfoPlistFile:withData:].cold.2();
    }

    v13 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v12 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
  v6 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MONowPlayingMediaManager _persistMediaAppInfoPlistFile:withData:].cold.1();
  v13 = 0;
LABEL_20:

  return v13;
}

- (id)_groupMediaPlaySessionsByTitleDay:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSDateFormatter *dateFormatter;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSMutableArray *v23;
  void *v24;
  NSMutableDictionary *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id os_log;
  NSObject *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *j;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v42;
  id obj;
  uint64_t v44;
  id v45;
  NSMutableDictionary *v46;
  void *context;
  uint64_t v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t v62[128];
  uint8_t buf[4];
  void *v64;
  _BYTE v65[128];
  _BYTE v66[128];

  v3 = a3;
  v46 = objc_opt_new(NSMutableDictionary);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
  v42 = v4;
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v59 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
        v10 = objc_autoreleasePoolPush();
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
        if (v11)
        {
          v12 = (void *)v11;
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
          if (v13)
          {
            v14 = (void *)v13;
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleId"));

            if (!v15)
              goto LABEL_13;
            dateFormatter = self->_dateFormatter;
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v17));

            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingString:", v12));

            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleId"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingString:", v19));

            v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v46, "objectForKeyedSubscript:", v21));
            if (!v22)
            {
              v23 = objc_opt_new(NSMutableArray);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v46, "setObject:forKeyedSubscript:", v23, v21);

            }
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v46, "objectForKeyedSubscript:", v21));
            objc_msgSend(v24, "addObject:", v9);

            v4 = v42;
          }

        }
LABEL_13:
        objc_autoreleasePoolPop(v10);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    }
    while (v6);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v25 = v46;
  obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v46, "allKeys"));
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
  if (v45)
  {
    v44 = *(_QWORD *)v55;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v55 != v44)
          objc_enumerationMutation(obj);
        v48 = v26;
        v27 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v26);
        context = objc_autoreleasePoolPush();
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", v27));
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
        v30 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v27));
          *(_DWORD *)buf = 138412290;
          v64 = v31;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Media sessions grouped for title and day: %@", buf, 0xCu);

        }
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v32 = v28;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v51;
          do
          {
            for (j = 0; j != v34; j = (char *)j + 1)
            {
              if (*(_QWORD *)v51 != v35)
                objc_enumerationMutation(v32);
              v37 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)j);
              v38 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
              v39 = objc_claimAutoreleasedReturnValue(v38);
              if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
              {
                v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "description"));
                *(_DWORD *)buf = 138412290;
                v64 = v40;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "TitleAndDayGrouping: media session with description: %@", buf, 0xCu);

              }
            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
          }
          while (v34);
        }

        objc_autoreleasePoolPop(context);
        v26 = v48 + 1;
        v25 = v46;
      }
      while ((id)(v48 + 1) != v45);
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    }
    while (v45);
  }

  return v25;
}

- (id)_groupMediaPlaySessionsByTitle:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title", (_QWORD)v16));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v11));

        if (!v12)
        {
          v13 = objc_opt_new(NSMutableArray);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v13, v11);

        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v11));
        objc_msgSend(v14, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_groupMediaPlayGroupsByTitle:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title", (_QWORD)v17));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));

        if (!v12)
        {

          v11 = &stru_1002B68D0;
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v11));

        if (!v13)
        {
          v14 = objc_opt_new(NSMutableArray);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v14, v11);

        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v11));
        objc_msgSend(v15, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_calculateStartDateFromMediaPlaySessions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate", (_QWORD)v16));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "earlierDate:", v4));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));

          if (v12 == v13)
          {
            v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));

            v4 = (void *)v14;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_calculateEndDateFromMediaPlaySessions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endDate", (_QWORD)v16));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "laterDate:", v4));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endDate"));

          if (v12 == v13)
          {
            v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endDate"));

            v4 = (void *)v14;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_generateMediaPlaySessionsFrom:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  _QWORD v11[5];
  NSMutableArray *v12;

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  if (objc_msgSend(v4, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _groupMediaPlayGroupsByTitle:](self, "_groupMediaPlayGroupsByTitle:", v4));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __59__MONowPlayingMediaManager__generateMediaPlaySessionsFrom___block_invoke;
    v11[3] = &unk_1002B6180;
    v11[4] = self;
    v7 = v5;
    v12 = v7;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);
    v8 = v12;
    v9 = v7;

  }
  return v5;
}

void __59__MONowPlayingMediaManager__generateMediaPlaySessionsFrom___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  _UNKNOWN **v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  id v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  unsigned __int8 v28;
  void *v29;
  MOMediaPlaySession *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  MOMediaPlaySession *v38;
  void *v39;
  void *v40;
  id v41;
  void *v43;
  void *v44;
  void *v45;
  __CFString *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];

  v32 = a2;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v48;
    v9 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
    v33 = *(_QWORD *)v48;
    v34 = v4;
    while (1)
    {
      v10 = 0;
      v35 = v6;
      do
      {
        if (*(_QWORD *)v48 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v10);
        v12 = objc_autoreleasePoolPush();
        if (objc_msgSend(v11, "playbackState") != (id)5)
        {
          if (v7
            && objc_msgSend(v7, "playbackState") == (id)1
            && (objc_msgSend(v11, "playbackState") == (id)3
             || objc_msgSend(v11, "playbackState") == (id)2
             || objc_msgSend(v11, "playbackState") == (id)4))
          {
            objc_msgSend(v7, "timestamp");
            v14 = v13;
            objc_msgSend(v11, "timestamp");
            v16 = v15;
            v17 = objc_msgSend(objc_alloc((Class)v9[294]), "initWithTimeIntervalSinceReferenceDate:", v14);
            v18 = objc_msgSend(objc_alloc((Class)v9[294]), "initWithTimeIntervalSinceReferenceDate:", v16);
            objc_msgSend(v18, "timeIntervalSinceDate:", v17);
            if (v19 > 30.0)
            {
              v20 = v19;
              if (objc_msgSend(v11, "duration")
                && v20 > (double)(3 * objc_msgSend(v11, "duration"))
                && (objc_msgSend(v11, "isRemote") & 1) != 0)
              {

LABEL_23:
                goto LABEL_24;
              }
              v41 = v18;
              v21 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleID"));
              v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByTrimmingCharactersInSet:", v23));
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v24));

              v40 = v25;
              if (v25)
                v46 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("bkColor")));
              else
                v46 = &stru_1002B68D0;
              v39 = *(void **)(a1 + 40);
              v38 = [MOMediaPlaySession alloc];
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "album"));
              v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleID"));
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "iTunesStoreIdentifier"));
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mediaType"));
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "artist"));
              v27 = objc_msgSend(v7, "duration");
              v28 = objc_msgSend(v7, "isRemote");
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deviceSource"));
              BYTE4(v31) = v28;
              LODWORD(v31) = v27;
              v18 = v41;
              v30 = -[MOMediaPlaySession initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:](v38, "initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:", v45, v44, v43, v37, &stru_1002B68D0, v26, v36, v17, v41, v31, v29, v46);
              objc_msgSend(v39, "addObject:", v30);

              v8 = v33;
              v4 = v34;
              v9 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
              v6 = v35;
            }

          }
          v17 = v7;
          v7 = v11;
          goto LABEL_23;
        }
LABEL_24:
        objc_autoreleasePoolPop(v12);
        v10 = (char *)v10 + 1;
      }
      while (v6 != v10);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      if (!v6)
        goto LABEL_28;
    }
  }
  v7 = 0;
LABEL_28:

}

- (void)_updateLearnFromAppStatusTable:(id)a3
{
  id v3;
  NSMutableSet *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  id os_log;
  NSObject *v14;
  uint8_t v15[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableSet);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleId"));

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleId"));
          -[NSMutableSet addObject:](v4, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  if (-[NSMutableSet count](v4, "count"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
    v14 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "start to update LFTA status.", v15, 2u);
    }

    +[MOEventBundleProcessor updateLearnedFromTheAppDictionary:](MOEventBundleProcessor, "updateLearnedFromTheAppDictionary:", v4);
  }

}

- (id)_generateMediaPlayGroupsByDayTitle:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  NSMutableArray *v16;
  MOMediaPlayMetrics *v17;
  id v18;
  NSMutableArray *v19;
  id v21;
  _QWORD v22[4];
  NSMutableArray *v23;
  double v24;

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  if (objc_msgSend(v4, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _generateMediaPlaySessionsFrom:](self, "_generateMediaPlaySessionsFrom:", v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _filterMediaSessionsBasedOnMusicApps:](self, "_filterMediaSessionsBasedOnMusicApps:", v6));
    -[MONowPlayingMediaManager countTotalPlayTime:](self, "countTotalPlayTime:", v7);
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _filterMediaSessionsBasedOnApps:](self, "_filterMediaSessionsBasedOnApps:", v7));
    -[MONowPlayingMediaManager _updateLearnFromAppStatusTable:](self, "_updateLearnFromAppStatusTable:", v7);
    -[MONowPlayingMediaManager countTotalPlayTime:](self, "countTotalPlayTime:", v10);
    v12 = v11;
    v13 = v11 / v9;
    if (v9 <= 0.0)
      v14 = 1.0;
    else
      v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _groupMediaPlaySessionsByTitleDay:](self, "_groupMediaPlaySessionsByTitleDay:", v10));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = __63__MONowPlayingMediaManager__generateMediaPlayGroupsByDayTitle___block_invoke;
    v22[3] = &unk_1002B61A8;
    v16 = v5;
    v23 = v16;
    v24 = v14;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v22);
    v17 = -[MOMediaPlayMetrics initWithFirstPartyAppRatio:firstPartyAppTime:musciAppTime:]([MOMediaPlayMetrics alloc], "initWithFirstPartyAppRatio:firstPartyAppTime:musciAppTime:", v14, v12, v9);
    v21 = 0;
    -[MOMediaPlayMetrics submitMetricsWithError:](v17, "submitMetricsWithError:", &v21);
    v18 = v21;
    v19 = v16;

  }
  return v5;
}

void __63__MONowPlayingMediaManager__generateMediaPlayGroupsByDayTitle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unsigned int v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  MOMediaPlay *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  void *v36;
  MOMediaPlay *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v50;
    v12 = 0.0;
    while (1)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
        v15 = objc_autoreleasePoolPush();
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endDate"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startDate"));
        objc_msgSend(v16, "timeIntervalSinceDate:", v17);
        v19 = v18;

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
        if (objc_msgSend(v20, "duration"))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
          v22 = (double)objc_msgSend(v21, "duration");

          if (v19 <= v22)
            goto LABEL_10;
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
          v19 = (double)objc_msgSend(v20, "duration");
        }

LABEL_10:
        v12 = v12 + v19;
        objc_autoreleasePoolPop(v15);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      if (!v10)
        goto LABEL_14;
    }
  }
  v12 = 0.0;
LABEL_14:

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "mediaType"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bundleId"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession getMOPlaySessionMediaType:bundleId:](MOMediaPlaySession, "getMOPlaySessionMediaType:bundleId:", v24, v26));
  v28 = objc_msgSend(v27, "unsignedIntValue");

  if (v28 == 1 || v12 >= 60.0)
  {
    v43 = *(void **)(a1 + 32);
    v29 = [MOMediaPlay alloc];
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "title"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "album"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "bundleId"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "productId"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "mediaType"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "artist"));
    v34 = v7;
    v44 = v5;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 40)));
    LODWORD(v38) = v34;
    v37 = -[MOMediaPlay initWithTitle:album:bundleId:productId:genre:mediaType:artist:sumTimePlayed:repetitions:mediaPlaySessions:firstPartyTimePlayedRatio:](v29, "initWithTitle:album:bundleId:productId:genre:mediaType:artist:sumTimePlayed:repetitions:mediaPlaySessions:firstPartyTimePlayedRatio:", v48, v30, v40, v31, &stru_1002B68D0, v39, v33, v35, v38, v8, v36);
    objc_msgSend(v43, "addObject:", v37);

    v5 = v44;
  }

}

- (id)_filterMediaSessionsBasedOnMusicApps:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  void *v18;
  NSSet *firstPartyBundleIdSet;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  NSMutableSet *v29;
  NSMutableDictionary *bundleIdAppInfoMappings;
  id v31;
  id v32;
  void *k;
  void *v34;
  void *v35;
  NSMutableDictionary *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  NSSet *v43;
  void *v44;
  NSSet *mediaBundleDeniedIdSet;
  void *v46;
  NSMutableSet *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  NSMutableArray *v53;
  uint64_t v54;
  id obj;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];

  v4 = a3;
  v53 = objc_opt_new(NSMutableArray);
  v5 = objc_opt_new(NSMutableSet);
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v65 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleId"));

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleId"));
          -[NSMutableSet addObject:](v5, "addObject:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    }
    while (v8);
  }
  v48 = v5;

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v6;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v61;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(_QWORD *)v61 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)j);
        firstPartyBundleIdSet = self->_firstPartyBundleIdSet;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bundleId"));
        if (-[NSSet containsObject:](firstPartyBundleIdSet, "containsObject:", v20))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "title"));
          v22 = objc_msgSend(v21, "length");

          if (!v22)
            continue;
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bundleId"));
          v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.MediaPlayer.RemotePlayerService"));

          if (!v24)
            goto LABEL_21;
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mediaType"));
          if ((objc_msgSend(v20, "containsString:", CFSTR("Music")) & 1) != 0)
          {
            v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "productId"));
            if (v25)
            {
              v26 = (void *)v25;
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "productId"));
              v28 = objc_msgSend(v27, "isEqualToString:", &stru_1002B68D0);

              if ((v28 & 1) != 0)
                continue;
LABEL_21:
              -[NSMutableArray addObject:](v53, "addObject:", v18);
              continue;
            }
          }
        }

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    }
    while (v15);
  }

  v29 = v48;
  -[MONowPlayingMediaManager _fetchAppCateogryByBundleIds:](self, "_fetchAppCateogryByBundleIds:", v48);
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession describeCategory:](MOMediaPlaySession, "describeCategory:", 6011));
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession describeCategory:](MOMediaPlaySession, "describeCategory:", 6009));
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession describeCategory:](MOMediaPlaySession, "describeCategory:", 6016));
  bundleIdAppInfoMappings = self->_bundleIdAppInfoMappings;
  if (bundleIdAppInfoMappings && -[NSMutableDictionary count](bundleIdAppInfoMappings, "count"))
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v52 = obj;
    v31 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
    if (v31)
    {
      v32 = v31;
      v54 = *(_QWORD *)v57;
      do
      {
        for (k = 0; k != v32; k = (char *)k + 1)
        {
          if (*(_QWORD *)v57 != v54)
            objc_enumerationMutation(v52);
          v34 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)k);
          v35 = objc_autoreleasePoolPush();
          v36 = self->_bundleIdAppInfoMappings;
          v37 = v34;
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bundleId"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "stringByTrimmingCharactersInSet:", v39));
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v36, "objectForKeyedSubscript:", v40));

          if (v41)
            v42 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("category")));
          else
            v42 = &stru_1002B68D0;
          v43 = self->_firstPartyBundleIdSet;
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bundleId"));
          if (!-[NSSet containsObject:](v43, "containsObject:", v44)
            && v42
            && ((-[__CFString isEqualToString:](v42, "isEqualToString:", v51) & 1) != 0
             || (-[__CFString isEqualToString:](v42, "isEqualToString:", v50) & 1) != 0
             || (-[__CFString isEqualToString:](v42, "isEqualToString:", v49) & 1) != 0))
          {
            mediaBundleDeniedIdSet = self->_mediaBundleDeniedIdSet;
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bundleId"));
            LOBYTE(mediaBundleDeniedIdSet) = -[NSSet containsObject:](mediaBundleDeniedIdSet, "containsObject:", v46);

            if ((mediaBundleDeniedIdSet & 1) == 0)
              -[NSMutableArray addObject:](v53, "addObject:", v37);
          }
          else
          {

          }
          objc_autoreleasePoolPop(v35);
        }
        v32 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
      }
      while (v32);
    }

    v29 = v48;
  }

  return v53;
}

- (id)_filterMediaSessionsBasedOnApps:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *i;
  void *v9;
  NSSet *firstPartyBundleIdSet;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  NSMutableDictionary *bundleIdAppInfoMappings;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  void *v36;
  void *v38;
  void *v39;
  unsigned __int8 v40;
  void *v41;
  NSMutableArray *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];

  v4 = a3;
  v42 = objc_opt_new(NSMutableArray);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v6)
  {
    v7 = v6;
    v43 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v45 != v43)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
        firstPartyBundleIdSet = self->_firstPartyBundleIdSet;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleId"));
        if (!-[NSSet containsObject:](firstPartyBundleIdSet, "containsObject:", v11))
        {

LABEL_16:
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endDate"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
          objc_msgSend(v23, "timeIntervalSinceDate:", v24);
          v26 = v25;

          bundleIdAppInfoMappings = self->_bundleIdAppInfoMappings;
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleId"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringByTrimmingCharactersInSet:", v29));
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](bundleIdAppInfoMappings, "objectForKeyedSubscript:", v30));

          if (v31)
            v32 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("category")));
          else
            v32 = &stru_1002B68D0;
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleId"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mediaType"));
          v35 = +[MOMediaPlaySession isValidThirdPartyEvent:bundleCategory:mediaTypeString:playTime:](MOMediaPlaySession, "isValidThirdPartyEvent:bundleCategory:mediaTypeString:playTime:", v33, v32, v34, v26);

          if (v35)
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));

            if (v36)
              -[NSMutableArray addObject:](v42, "addObject:", v9);
          }

          continue;
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
        v13 = objc_msgSend(v12, "length");

        if (!v13)
          goto LABEL_16;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleId"));
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.Music"));
        if ((v15 & 1) == 0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleId"));
          v41 = v16;
          if ((objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.podcasts")) & 1) == 0)
          {

LABEL_33:
            -[NSMutableArray addObject:](v42, "addObject:", v9);
            continue;
          }
        }
        v17 = v5;
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "album"));
        if (!v18)
        {
          if (!v15)
LABEL_24:

LABEL_25:
          v5 = v17;
          continue;
        }
        v19 = (void *)v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "album"));
        if ((objc_msgSend(v20, "isEqualToString:", &stru_1002B68D0) & 1) != 0
          || (v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "productId"))) == 0)
        {

          if (!v15)
            goto LABEL_24;
          goto LABEL_25;
        }
        v22 = (void *)v21;
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "productId"));
        if ((objc_msgSend(v39, "isEqualToString:", &stru_1002B68D0) & 1) != 0)
        {
          v40 = 1;
        }
        else
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "productId"));
          v40 = objc_msgSend(v38, "isEqualToString:", CFSTR("null"));

        }
        if ((v15 & 1) == 0)

        v5 = v17;
        if ((v40 & 1) == 0)
          goto LABEL_33;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v7);
  }

  return v42;
}

- (double)countTotalPlayTime:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endDate"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
        objc_msgSend(v10, "timeIntervalSinceDate:", v11);
        v7 = v7 + v12;

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (id)_generateMediaPlaySessionGroupsByDay:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSDictionary *v8;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_autoreleasePoolPush();
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _generateMediaPlaySessionsFrom:](self, "_generateMediaPlaySessionsFrom:", v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _filterMediaSessionsBasedOnApps:](self, "_filterMediaSessionsBasedOnApps:", v6));
    v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _groupMediaPlaySessionsByDay:](self, "_groupMediaPlaySessionsByDay:", v7));

    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v8 = objc_opt_new(NSDictionary);
  }

  return v8;
}

- (id)_createEventFromMediaPlayGroupsByDayTitle:(id)a3
{
  id v5;
  void *v6;
  id v7;
  id os_log;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MOEvent *v15;
  void *v16;
  void *v17;
  MOEvent *v18;
  void *v19;
  double v20;
  float v21;
  void *v22;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mediaPlaySessions"));
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MONowPlayingMediaManager _createEventFromMediaPlayGroupsByDayTitle:].cold.1();

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MONowPlayingMediaManager.m"), 854, CFSTR("mediaPlay has no mediaPlaySessions. (in %s:%d)"), "-[MONowPlayingMediaManager _createEventFromMediaPlayGroupsByDayTitle:]", 854);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mediaPlaySessions"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _calculateStartDateFromMediaPlaySessions:](self, "_calculateStartDateFromMediaPlaySessions:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mediaPlaySessions"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _calculateEndDateFromMediaPlaySessions:](self, "_calculateEndDateFromMediaPlaySessions:", v13));

  v15 = [MOEvent alloc];
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v18 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v15, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v16, v12, v14, v17, 3, 4);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager configurationManager](self, "configurationManager"));
  LODWORD(v20) = 1242802176;
  objc_msgSend(v19, "getFloatSettingForKey:withFallback:", CFSTR("EventManagerOverrideMaximumEventAge"), v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dateByAddingTimeInterval:", v21));
  -[MOEvent setExpirationDate:](v18, "setExpirationDate:", v22);

  return v18;
}

- (void)_saveMediaPlayGroupsByDayTitle:(id)a3 startDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  MOEventStore *momentStore;
  void *v14;
  MOEventStore *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[6];
  _QWORD v22[5];
  _QWORD v23[5];
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -864000.0));
  if (objc_msgSend(v9, "isBeforeDate:", v11))
  {
    v12 = v9;

    v11 = v12;
  }
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__40;
  v23[4] = __Block_byref_object_dispose__40;
  v24 = 0;
  momentStore = self->_momentStore;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __77__MONowPlayingMediaManager__saveMediaPlayGroupsByDayTitle_startDate_handler___block_invoke;
  v22[3] = &unk_1002AEFF0;
  v22[4] = v23;
  -[MOEventStore fetchEventsWithStartDateAfter:Category:CompletionHandler:](momentStore, "fetchEventsWithStartDateAfter:Category:CompletionHandler:", v11, 4, v22);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __77__MONowPlayingMediaManager__saveMediaPlayGroupsByDayTitle_startDate_handler___block_invoke_2;
  v21[3] = &unk_1002B61D0;
  v21[4] = self;
  v21[5] = v23;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_pas_mappedArrayWithTransform:", v21));
  v15 = self->_momentStore;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __77__MONowPlayingMediaManager__saveMediaPlayGroupsByDayTitle_startDate_handler___block_invoke_3;
  v18[3] = &unk_1002AEB58;
  v16 = v14;
  v19 = v16;
  v17 = v10;
  v20 = v17;
  -[MOEventStore storeEvents:CompletionHandler:](v15, "storeEvents:CompletionHandler:", v16, v18);

  _Block_object_dispose(v23, 8);
}

void __77__MONowPlayingMediaManager__saveMediaPlayGroupsByDayTitle_startDate_handler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

id __77__MONowPlayingMediaManager__saveMediaPlayGroupsByDayTitle_startDate_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  int v9;
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
  id v22;
  id v24;
  id obj;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_createEventFromMediaPlayGroupsByDayTitle:", v3));
  if (objc_msgSend(v4, "category") == (id)4)
    v5 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  else
    v5 = 0;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v7)
  {

    v21 = v6;
LABEL_14:
    v22 = v4;
    goto LABEL_15;
  }
  v8 = v7;
  v24 = v3;
  obj = v6;
  v9 = 0;
  v26 = *(_QWORD *)v28;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v28 != v26)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v10);
      v12 = objc_autoreleasePoolPush();
      v13 = *(void **)(a1 + 32);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_providerIdOfStartDate:endDate:", v14, v15));

      v17 = *(void **)(a1 + 32);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "endDate"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_providerIdOfStartDate:endDate:", v18, v19));

      v9 |= objc_msgSend(v16, "isEqualToString:", v20);
      objc_autoreleasePoolPop(v12);
      v10 = (char *)v10 + 1;
    }
    while (v8 != v10);
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  }
  while (v8);
  v21 = obj;

  v3 = v24;
  if ((v9 & 1) == 0)
    goto LABEL_14;
  v22 = 0;
LABEL_15:

  return v22;
}

void __77__MONowPlayingMediaManager__saveMediaPlayGroupsByDayTitle_startDate_handler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  int v12;
  id v13;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __77__MONowPlayingMediaManager__saveMediaPlayGroupsByDayTitle_startDate_handler___block_invoke_3_cold_1();
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "count");
    v12 = 134217984;
    v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "saved repeated or played media events, count, %lu", (uint8_t *)&v12, 0xCu);
  }

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);

}

- (void)_saveMediaPlaySessionsEvents:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  MOEventStore *momentStore;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  MOEventStore *v30;
  NSMutableArray *v31;
  id v32;
  void *v33;
  void *v34;
  NSMutableArray *v35;
  id obj;
  id v38;
  _QWORD v39[4];
  NSMutableArray *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _BYTE v53[128];

  v38 = a3;
  v5 = a4;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__40;
  v51 = __Block_byref_object_dispose__40;
  v52 = 0;
  v6 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", &off_1002DB318, 0);
  momentStore = self->_momentStore;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = __65__MONowPlayingMediaManager__saveMediaPlaySessionsEvents_handler___block_invoke;
  v46[3] = &unk_1002AEC68;
  v46[4] = &v47;
  -[MOEventStore fetchLastEventOfCategories:CompletionHandler:](momentStore, "fetchLastEventOfCategories:CompletionHandler:", v6, v46);
  v33 = v6;
  v35 = objc_opt_new(NSMutableArray);
  v34 = v5;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "allKeys"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v43;
    obj = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v43 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v11);
        v13 = objc_autoreleasePoolPush();
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", v12));
        if (objc_msgSend(v14, "count"))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _createEventFromMediaPlaySessions:](self, "_createEventFromMediaPlaySessions:", v14));
          v16 = v15;
          if (v48[5]
            && (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate")),
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v48[5], "startDate")),
                v19 = objc_msgSend(v17, "isAfterDate:", v18),
                v18,
                v17,
                !v19))
          {
            if (v48[5])
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startDate"));
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v48[5], "startDate"));
              v22 = objc_msgSend(v20, "isEqualToDate:", v21);

              if (v22)
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startDate"));
                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "endDate"));
                v25 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _providerIdOfStartDate:endDate:](self, "_providerIdOfStartDate:endDate:", v23, v24));

                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v48[5], "startDate"));
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v48[5], "endDate"));
                v28 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _providerIdOfStartDate:endDate:](self, "_providerIdOfStartDate:endDate:", v26, v27));

                if ((objc_msgSend(v25, "isEqualToString:", v28) & 1) == 0)
                  -[NSMutableArray addObject:](v35, "addObject:", v16);

              }
            }
          }
          else
          {
            -[NSMutableArray addObject:](v35, "addObject:", v16);
          }

        }
        objc_autoreleasePoolPop(v13);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v8 = obj;
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
      v9 = v29;
    }
    while (v29);
  }

  v30 = self->_momentStore;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = __65__MONowPlayingMediaManager__saveMediaPlaySessionsEvents_handler___block_invoke_2;
  v39[3] = &unk_1002AEB58;
  v31 = v35;
  v40 = v31;
  v32 = v34;
  v41 = v32;
  -[MOEventStore storeEvents:CompletionHandler:](v30, "storeEvents:CompletionHandler:", v31, v39);

  _Block_object_dispose(&v47, 8);
}

void __65__MONowPlayingMediaManager__saveMediaPlaySessionsEvents_handler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __65__MONowPlayingMediaManager__saveMediaPlaySessionsEvents_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  int v12;
  id v13;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __65__MONowPlayingMediaManager__saveMediaPlaySessionsEvents_handler___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "count");
    v12 = 134217984;
    v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "saved mediaPlaySession events, count, %lu", (uint8_t *)&v12, 0xCu);
  }

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);

}

- (void)fetchAndSaveMediaPlayEventsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  MONowPlayingMediaManager *v10;
  id v11;
  id v12;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __88__MONowPlayingMediaManager_fetchAndSaveMediaPlayEventsBetweenStartDate_EndDate_handler___block_invoke;
  v9[3] = &unk_1002AEBD0;
  v10 = self;
  v11 = a3;
  v12 = a5;
  v7 = v12;
  v8 = v11;
  -[MONowPlayingMediaManager _fetchNowPlayingEventsBetweenStartDate:EndDate:CompletionHandler:](v10, "_fetchNowPlayingEventsBetweenStartDate:EndDate:CompletionHandler:", v8, a4, v9);

}

void __88__MONowPlayingMediaManager_fetchAndSaveMediaPlayEventsBetweenStartDate_EndDate_handler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id os_log;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  char *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t v30[8];
  uint8_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD v36[6];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t buf[8];
  uint8_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  const __CFString *v49;
  void *v50;

  v5 = a2;
  v22 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Saving media contents.", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v44 = buf;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__40;
  v47 = __Block_byref_object_dispose__40;
  v48 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__40;
  v41 = __Block_byref_object_dispose__40;
  v42 = 0;
  v8 = (void *)a1[4];
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_generateMediaPlayGroupsByDayTitle:", v5));
  v10 = a1[5];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = __88__MONowPlayingMediaManager_fetchAndSaveMediaPlayEventsBetweenStartDate_EndDate_handler___block_invoke_196;
  v36[3] = &unk_1002B61F8;
  v36[4] = buf;
  v36[5] = &v37;
  objc_msgSend(v8, "_saveMediaPlayGroupsByDayTitle:startDate:handler:", v9, v10, v36);

  v11 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v30 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Saving mediaPlaySession events.", v30, 2u);
  }

  *(_QWORD *)v30 = 0;
  v31 = v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__40;
  v34 = __Block_byref_object_dispose__40;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__40;
  v28 = __Block_byref_object_dispose__40;
  v29 = 0;
  v13 = (void *)a1[4];
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_generateMediaPlaySessionGroupsByDay:", v5));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __88__MONowPlayingMediaManager_fetchAndSaveMediaPlayEventsBetweenStartDate_EndDate_handler___block_invoke_197;
  v23[3] = &unk_1002B61F8;
  v23[4] = v30;
  v23[5] = &v24;
  objc_msgSend(v13, "_saveMediaPlaySessionsEvents:handler:", v14, v23);

  if (a1[6])
  {
    v15 = (void *)*((_QWORD *)v44 + 5);
    if (v15 || (v15 = (void *)*((_QWORD *)v31 + 5)) != 0)
      v16 = v15;
    else
      v16 = 0;
    v49 = CFSTR("resultNumberOfEvents");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v38[5], "objectForKeyedSubscript:", CFSTR("resultNumberOfEvents")));
    v18 = (char *)objc_msgSend(v17, "integerValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v25[5], "objectForKeyedSubscript:", CFSTR("resultNumberOfEvents")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", &v18[(_QWORD)objc_msgSend(v19, "integerValue")]));
    v50 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1));

    (*(void (**)(void))(a1[6] + 16))();
  }
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(buf, 8);
}

void __88__MONowPlayingMediaManager_fetchAndSaveMediaPlayEventsBetweenStartDate_EndDate_handler___block_invoke_196(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __88__MONowPlayingMediaManager_fetchAndSaveMediaPlayEventsBetweenStartDate_EndDate_handler___block_invoke_197(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)_createEventFromMediaPlaySessions:(id)a3
{
  id v5;
  id os_log;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  MOEvent *v11;
  void *v12;
  void *v13;
  MOEvent *v14;
  void *v15;

  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MONowPlayingMediaManager _createEventFromMediaPlaySessions:].cold.1();

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MONowPlayingMediaManager.m"), 982, CFSTR("mediaPlaySessions has no sessions. (in %s:%d)"), "-[MONowPlayingMediaManager _createEventFromMediaPlaySessions:]", 982);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _calculateStartDateFromMediaPlaySessions:](self, "_calculateStartDateFromMediaPlaySessions:", v5));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _calculateEndDateFromMediaPlaySessions:](self, "_calculateEndDateFromMediaPlaySessions:", v5));

  v11 = [MOEvent alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v14 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v11, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v12, v9, v10, v13, 3, 6);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateByAddingTimeInterval:", 2419200.0));
  -[MOEvent setExpirationDate:](v14, "setExpirationDate:", v15);

  return v14;
}

- (id)_providerIdOfStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v5 = a4;
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  v7 = v6 / 0.01;
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v9 = v8;

  return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%ld,%ld"), (uint64_t)v7, (uint64_t)(v9 / 0.01));
}

- (void)rehydratedMediaPlayEvents:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __62__MONowPlayingMediaManager_rehydratedMediaPlayEvents_handler___block_invoke;
  block[3] = &unk_1002AEBA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

id __62__MONowPlayingMediaManager_rehydratedMediaPlayEvents_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rehydratedMediaPlayEvents:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_rehydratedMediaPlayEvents:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  id os_log;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void (**v14)(id, void *, _QWORD);
  _QWORD v15[4];
  id v16;
  MONowPlayingMediaManager *v17;
  id v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  if (!objc_msgSend(v6, "count"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "no event to rehydrate, returning nil", buf, 2u);
    }

    v7[2](v7, &__NSArray0__struct, 0);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getDurationOfMOEventArray"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endDate"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __63__MONowPlayingMediaManager__rehydratedMediaPlayEvents_handler___block_invoke;
  v15[3] = &unk_1002B4F00;
  v17 = self;
  v18 = v7;
  v16 = v6;
  v13 = v6;
  v14 = v7;
  -[MONowPlayingMediaManager _fetchNowPlayingEventsBetweenStartDate:EndDate:CompletionHandler:](self, "_fetchNowPlayingEventsBetweenStartDate:EndDate:CompletionHandler:", v11, v12, v15);

}

void __63__MONowPlayingMediaManager__rehydratedMediaPlayEvents_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  MORehydrationMetrics *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  MORehydrationMetrics *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __63__MONowPlayingMediaManager__rehydratedMediaPlayEvents_handler___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v9 = [MORehydrationMetrics alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "firstObject"));
    v11 = objc_msgSend(v10, "category");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "firstObject"));
    v13 = objc_msgSend(v12, "provider");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
    v15 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v9, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v11, v13, 0, v14, objc_msgSend(*(id *)(a1 + 32), "count"), 3, (double)(int)objc_msgSend(*(id *)(a1 + 32), "count"), 0.0);

    v25 = 0;
    -[MORehydrationMetrics submitMetricsWithError:](v15, "submitMetricsWithError:", &v25);
    goto LABEL_14;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "firstObject"));
  v17 = objc_msgSend(v16, "category");

  if (v17 == (id)6)
  {
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_rehydratedMediaSessionsForEvents:usingNowPlayingEvents:", *(_QWORD *)(a1 + 32), v5));
  }
  else
  {
    if (v17 != (id)4)
    {
      v15 = 0;
      goto LABEL_11;
    }
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_rehydratedMediaEvents:usingNowPlayingEvents:", *(_QWORD *)(a1 + 32), v5));
  }
  v15 = (MORehydrationMetrics *)v18;
LABEL_11:
  v19 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = -[MORehydrationMetrics count](v15, "count");
    v22 = objc_msgSend(*(id *)(a1 + 32), "count");
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "firstObject"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "describeCategory"));
    *(_DWORD *)buf = 134218498;
    v27 = v21;
    v28 = 2048;
    v29 = v22;
    v30 = 2112;
    v31 = v24;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "rehydrated media events count, %lu, stored media events count, %lu, category, %@", buf, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_14:

}

- (id)rehydratedMediaPlayEvents:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id os_log;
  void *v12;
  _QWORD v14[5];
  uint8_t buf[8];
  uint8_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getDurationOfMOEventArray"));
    *(_QWORD *)buf = 0;
    v16 = buf;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__40;
    v19 = __Block_byref_object_dispose__40;
    v20 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject startDate](v5, "startDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject endDate](v5, "endDate"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __54__MONowPlayingMediaManager_rehydratedMediaPlayEvents___block_invoke;
    v14[3] = &unk_1002AEFF0;
    v14[4] = buf;
    -[MONowPlayingMediaManager _fetchNowPlayingEventsBetweenStartDate:EndDate:CompletionHandler:](self, "_fetchNowPlayingEventsBetweenStartDate:EndDate:CompletionHandler:", v6, v7, v14);

    -[MONowPlayingMediaManager waitForQueueEmpty](self, "waitForQueueEmpty");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    v9 = objc_msgSend(v8, "category");

    if (v9 == (id)6)
    {
      v10 = objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _rehydratedMediaSessionsForEvents:usingNowPlayingEvents:](self, "_rehydratedMediaSessionsForEvents:usingNowPlayingEvents:", v4, *((_QWORD *)v16 + 5)));
    }
    else
    {
      if (v9 != (id)4)
      {
        v12 = 0;
        goto LABEL_11;
      }
      v10 = objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _rehydratedMediaEvents:usingNowPlayingEvents:](self, "_rehydratedMediaEvents:usingNowPlayingEvents:", v4, *((_QWORD *)v16 + 5)));
    }
    v12 = (void *)v10;
LABEL_11:
    _Block_object_dispose(buf, 8);

    goto LABEL_12;
  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "no event to rehydrate, returning...", buf, 2u);
  }
  v12 = &__NSArray0__struct;
LABEL_12:

  return v12;
}

void __54__MONowPlayingMediaManager_rehydratedMediaPlayEvents___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)_rehydratedMediaSessionsForEvents:(id)a3 usingNowPlayingEvents:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSDateFormatter *dateFormatter;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  NSMutableArray *v27;
  id v28;
  id os_log;
  NSObject *v30;
  id v31;
  MORehydrationMetrics *v32;
  id v33;
  NSObject *v34;
  id v35;
  id v37;
  NSMutableArray *v38;
  uint64_t v39;
  id v40;
  MONowPlayingMediaManager *v41;
  void *v42;
  id v43;
  id obj;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  NSMutableArray *v49;
  id v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  id v61;
  __int16 v62;
  int v63;
  _BYTE v64[128];
  _BYTE v65[128];

  v6 = a3;
  v41 = self;
  v37 = a4;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _generateMediaPlaySessionGroupsByDay:](self, "_generateMediaPlaySessionGroupsByDay:"));
  if (objc_msgSend(v42, "count"))
  {
    v38 = objc_opt_new(NSMutableArray);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v57;
      v39 = *(_QWORD *)v57;
      v40 = v6;
      do
      {
        v11 = 0;
        v43 = v8;
        do
        {
          if (*(_QWORD *)v57 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)v11);
          v13 = objc_autoreleasePoolPush();
          if (objc_msgSend(v12, "category") == (id)6)
          {
            v45 = v13;
            v46 = v11;
            v47 = v9;
            dateFormatter = v41->_dateFormatter;
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startDate"));
            v16 = objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v15));

            v48 = (void *)v16;
            v49 = objc_opt_new(NSMutableArray);
            v52 = 0u;
            v53 = 0u;
            v54 = 0u;
            v55 = 0u;
            v50 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", v16));
            v17 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v53;
              do
              {
                for (i = 0; i != v18; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v53 != v19)
                    objc_enumerationMutation(v50);
                  v21 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
                  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "startDate"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startDate"));
                  if ((objc_msgSend(v22, "isOnOrAfter:", v23) & 1) != 0)
                  {
                    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "endDate"));
                    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "endDate"));
                    v26 = objc_msgSend(v24, "isOnOrBefore:", v25);

                    if (v26)
                      -[NSMutableArray addObject:](v49, "addObject:", v21);
                  }
                  else
                  {

                  }
                }
                v18 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
              }
              while (v18);
            }

            v27 = v49;
            v10 = v39;
            v8 = v43;
            v13 = v45;
            v11 = v46;
            if (-[NSMutableArray count](v49, "count"))
            {
              v28 = objc_msgSend(v12, "copy");
              objc_msgSend(v28, "setMediaPlaySessions:", v49);
              os_log = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
              v30 = objc_claimAutoreleasedReturnValue(os_log);
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v61 = v48;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "rehydrated mediaPlay sessions for day: %@", buf, 0xCu);
              }

              -[NSMutableArray addObject:](v38, "addObject:", v28);
              v27 = v49;
            }
            v9 = (v47 + 1);

            v6 = v40;
          }
          objc_autoreleasePoolPop(v13);
          v11 = (char *)v11 + 1;
        }
        while (v11 != v8);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v32 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:]([MORehydrationMetrics alloc], "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", 6, 3, 1, 0, v9, 3, (double)(int)(v9 - -[NSMutableArray count](v38, "count")), 0.0);
    v51 = 0;
    -[MORehydrationMetrics submitMetricsWithError:](v32, "submitMetricsWithError:", &v51);
    v33 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      v35 = -[NSMutableArray count](v38, "count");
      *(_DWORD *)buf = 134218240;
      v61 = v35;
      v62 = 1024;
      v63 = v9;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "rehydrated media play session event count, %lu, stored events count, %d", buf, 0x12u);
    }

  }
  else
  {
    v31 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    v32 = (MORehydrationMetrics *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(&v32->super.super, OS_LOG_TYPE_ERROR))
      -[MONowPlayingMediaManager _rehydratedMediaSessionsForEvents:usingNowPlayingEvents:].cold.1();
    v38 = (NSMutableArray *)&__NSArray0__struct;
  }

  return v38;
}

- (id)_rehydratedMediaEvents:(id)a3 usingNowPlayingEvents:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  MONowPlayingMediaManager *v25;
  void *j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  MORehydrationMetrics *v35;
  id os_log;
  NSObject *v37;
  id v38;
  void *v40;
  id v41;
  void *v42;
  NSMutableArray *v43;
  id obj;
  MONowPlayingMediaManager *v45;
  NSObject *v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  int v59;
  _BYTE v60[128];
  _BYTE v61[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _generateMediaPlayGroupsByDayTitle:](self, "_generateMediaPlayGroupsByDayTitle:", v7));
  if (objc_msgSend(v8, "count"))
  {
    v45 = self;
    v41 = v7;
    v42 = v6;
    v46 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v8, "count"));
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v40 = v8;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v53 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
          v15 = objc_autoreleasePoolPush();
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mediaPlaySessions"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _calculateStartDateFromMediaPlaySessions:](v45, "_calculateStartDateFromMediaPlaySessions:", v16));

          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mediaPlaySessions"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _calculateEndDateFromMediaPlaySessions:](v45, "_calculateEndDateFromMediaPlaySessions:", v18));

          v20 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _providerIdOfStartDate:endDate:](v45, "_providerIdOfStartDate:endDate:", v17, v19));
          -[NSObject setObject:forKeyedSubscript:](v46, "setObject:forKeyedSubscript:", v14, v20);

          objc_autoreleasePoolPop(v15);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
      }
      while (v11);
    }

    v43 = objc_opt_new(NSMutableArray);
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = v42;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
    if (v21)
    {
      v22 = v21;
      v23 = 0;
      v24 = *(_QWORD *)v49;
      v25 = v45;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(_QWORD *)v49 != v24)
            objc_enumerationMutation(obj);
          v27 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)j);
          v28 = objc_autoreleasePoolPush();
          if (objc_msgSend(v27, "category") == (id)4)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "startDate"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "endDate"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _providerIdOfStartDate:endDate:](v25, "_providerIdOfStartDate:endDate:", v29, v30));
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v46, "objectForKeyedSubscript:", v31));

            v25 = v45;
            if (v32)
            {
              v33 = objc_msgSend(v27, "copy");
              -[MONowPlayingMediaManager _setDynamicProperties:mediaPlay:](v45, "_setDynamicProperties:mediaPlay:", v33, v32);
              -[NSMutableArray addObject:](v43, "addObject:", v33);

            }
            v23 = (v23 + 1);

          }
          objc_autoreleasePoolPop(v28);
        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
      }
      while (v22);
    }
    else
    {
      v23 = 0;
    }

    v35 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:]([MORehydrationMetrics alloc], "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", 4, 3, 1, 0, v23, 3, (double)(int)(v23 - -[NSMutableArray count](v43, "count")), 0.0);
    v47 = 0;
    -[MORehydrationMetrics submitMetricsWithError:](v35, "submitMetricsWithError:", &v47);
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    v37 = objc_claimAutoreleasedReturnValue(os_log);
    v8 = v40;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      v38 = -[NSMutableArray count](v43, "count");
      *(_DWORD *)buf = 134218240;
      v57 = v38;
      v58 = 1024;
      v59 = v23;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "rehydrated leisure media event count, %lu, stored events count, %d", buf, 0x12u);
    }

    v7 = v41;
    v6 = v42;
  }
  else
  {
    v34 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
    v46 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      -[MONowPlayingMediaManager _rehydratedMediaEvents:usingNowPlayingEvents:].cold.1();
    v43 = (NSMutableArray *)&__NSArray0__struct;
  }

  return v43;
}

- (void)_setDynamicProperties:(id)a3 mediaPlay:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id os_log;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  id v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
    objc_msgSend(v5, "setMediaTitle:", v8);

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[MONowPlayingMediaManager _setDynamicProperties:mediaPlay:].cold.7(v5);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "album"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "album"));
    objc_msgSend(v5, "setMediaAlbum:", v12);

    v13 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[MONowPlayingMediaManager _setDynamicProperties:mediaPlay:].cold.6(v5);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleId"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleId"));
    objc_msgSend(v5, "setMediaPlayerBundleId:", v16);

    v17 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[MONowPlayingMediaManager _setDynamicProperties:mediaPlay:].cold.5(v5);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "productId"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "productId"));
    objc_msgSend(v5, "setMediaProductId:", v20);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "genre"));

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "genre"));
    objc_msgSend(v5, "setMediaGenre:", v22);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mediaType"));

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mediaType"));
    objc_msgSend(v5, "setMediaType:", v24);

    v25 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[MONowPlayingMediaManager _setDynamicProperties:mediaPlay:].cold.4(v5);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "artist"));

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "artist"));
    objc_msgSend(v5, "setMediaArtist:", v28);

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sumTimePlayed"));

  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sumTimePlayed"));
    objc_msgSend(v5, "setMediaSumTimePlayed:", v30);

    v31 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      -[MONowPlayingMediaManager _setDynamicProperties:mediaPlay:].cold.3(v5);

  }
  if (objc_msgSend(v6, "repetitions"))
  {
    v33 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", objc_msgSend(v6, "repetitions"));
    objc_msgSend(v5, "setMediaRepetitions:", v33);
    v34 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      -[MONowPlayingMediaManager _setDynamicProperties:mediaPlay:].cold.2(v5);

  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mediaPlaySessions"));

  if (v36)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mediaPlaySessions"));
    objc_msgSend(v5, "setMediaPlaySessions:", v37);

    v38 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      -[MONowPlayingMediaManager _setDynamicProperties:mediaPlay:].cold.1(v5);

  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstPartyTimePlayedRatio"));

  if (v40)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstPartyTimePlayedRatio"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mediaEvent"));
    objc_msgSend(v42, "setMediaFirstPartyTimePlayedRatio:", v41);

  }
}

- (void)updateMediaPlayEventsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id *v10;
  void **v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  v9 = objc_msgSend(v8, "category");

  if (v9 == (id)6)
  {
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = __73__MONowPlayingMediaManager_updateMediaPlayEventsDeletedAtSource_handler___block_invoke_2;
    v14 = &unk_1002ADA40;
    v10 = &v15;
    v15 = v7;
    -[MONowPlayingMediaManager _updateMediaPlaySessionEventsDeletedAtSource:handler:](self, "_updateMediaPlaySessionEventsDeletedAtSource:handler:", v6, &v11);
    goto LABEL_5;
  }
  if (v9 == (id)4)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __73__MONowPlayingMediaManager_updateMediaPlayEventsDeletedAtSource_handler___block_invoke;
    v16[3] = &unk_1002ADA40;
    v10 = &v17;
    v17 = v7;
    -[MONowPlayingMediaManager _updateMediaPlayEventsDeletedAtSource:handler:](self, "_updateMediaPlayEventsDeletedAtSource:handler:", v6, v16);
LABEL_5:

  }
  -[MONowPlayingMediaManager waitForQueueEmpty](self, "waitForQueueEmpty", v11, v12, v13, v14);

}

uint64_t __73__MONowPlayingMediaManager_updateMediaPlayEventsDeletedAtSource_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __73__MONowPlayingMediaManager_updateMediaPlayEventsDeletedAtSource_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updateMediaPlaySessionEventsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSDateFormatter *dateFormatter;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MORehydrationThresholdMetrics *v20;
  id v21;
  id os_log;
  NSObject *v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  MORehydrationMetrics *v28;
  void *v29;
  id v30;
  void *v31;
  MORehydrationMetrics *v32;
  id v33;
  id v34;
  void *v35;
  NSMutableArray *v36;
  MORehydrationMetrics *v37;
  id v38;
  NSObject *v39;
  MORehydrationMetrics *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  MORehydrationMetrics *v49;
  NSMutableArray *v50;
  id obj;
  uint64_t v52;
  id v53;
  void *v54;
  void *v55;
  _QWORD v57[4];
  NSMutableArray *v58;
  id v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  _QWORD v67[7];
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  uint8_t buf[4];
  id v81;
  _BYTE v82[128];

  v5 = a3;
  v46 = a4;
  v48 = v5;
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getDurationOfMOEventArray"));
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__40;
  v78 = __Block_byref_object_dispose__40;
  v79 = 0;
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__40;
  v72 = __Block_byref_object_dispose__40;
  v73 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "startDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "endDate"));
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = __81__MONowPlayingMediaManager__updateMediaPlaySessionEventsDeletedAtSource_handler___block_invoke;
  v67[3] = &unk_1002B6220;
  v67[4] = self;
  v67[5] = &v74;
  v67[6] = &v68;
  -[MONowPlayingMediaManager _fetchNowPlayingEventsBetweenStartDate:EndDate:CompletionHandler:](self, "_fetchNowPlayingEventsBetweenStartDate:EndDate:CompletionHandler:", v6, v7, v67);

  -[MONowPlayingMediaManager waitForQueueEmpty](self, "waitForQueueEmpty");
  if (v75[5])
  {
    v49 = (MORehydrationMetrics *)objc_alloc_init((Class)NSMutableArray);
    v50 = objc_opt_new(NSMutableArray);
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    obj = v48;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
    if (v8)
    {
      v52 = *(_QWORD *)v63;
      do
      {
        v53 = v8;
        for (i = 0; i != v53; i = (char *)i + 1)
        {
          if (*(_QWORD *)v63 != v52)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
          v11 = objc_autoreleasePoolPush();
          if (objc_msgSend(v10, "category") == (id)6)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endDate"));
            v54 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _providerIdOfStartDate:endDate:](self, "_providerIdOfStartDate:endDate:", v12, v13));

            dateFormatter = self->_dateFormatter;
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
            v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v15));

            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v75[5], "objectForKeyedSubscript:", v55));
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _calculateStartDateFromMediaPlaySessions:](self, "_calculateStartDateFromMediaPlaySessions:", v16));
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _calculateEndDateFromMediaPlaySessions:](self, "_calculateEndDateFromMediaPlaySessions:", v16));
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _providerIdOfStartDate:endDate:](self, "_providerIdOfStartDate:endDate:", v17, v18));
            if ((objc_msgSend(v54, "isEqualToString:", v19) & 1) != 0)
            {
              if (objc_msgSend(v10, "rehydrationFailCount"))
              {
                v20 = -[MORehydrationThresholdMetrics initWithCategory:provider:failureCount:]([MORehydrationThresholdMetrics alloc], "initWithCategory:provider:failureCount:", objc_msgSend(v10, "category"), objc_msgSend(v10, "provider"), objc_msgSend(v10, "rehydrationFailCount"));
                v61 = 0;
                -[MORehydrationThresholdMetrics submitMetricsWithError:](v20, "submitMetricsWithError:", &v61);
                v21 = v61;
                objc_msgSend(v10, "setRehydrationFailCount:", 0);
                -[MORehydrationMetrics addObject:](v49, "addObject:", v10);

              }
            }
            else
            {
              objc_msgSend(v10, "setRehydrationFailCount:", (char *)objc_msgSend(v10, "rehydrationFailCount") + 1);
              -[NSMutableArray addObject:](v50, "addObject:", v10);
            }

          }
          objc_autoreleasePoolPop(v11);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
      }
      while (v8);
    }

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    v23 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = -[NSMutableArray count](v50, "count");
      *(_DWORD *)buf = 134217984;
      v81 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%ld previously saved MediaPlayingSessions event(s) had no play sessions, therefore add rehydration failure count.", buf, 0xCu);
    }

    v25 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = -[MORehydrationMetrics count](v49, "count");
      *(_DWORD *)buf = 134217984;
      v81 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%ld previously rehydration failed MediaPlayingSessions event(s) now have play sessions, therefore change rehydration failure count.", buf, 0xCu);
    }

    v28 = [MORehydrationMetrics alloc];
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
    v30 = objc_msgSend(v29, "category");
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
    v32 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v28, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v30, objc_msgSend(v31, "provider"), 1, 0, objc_msgSend(obj, "count"), 1, (double)(int)-[NSMutableArray count](v50, "count"), (double)(int)-[MORehydrationMetrics count](v49, "count"));

    v60 = 0;
    -[MORehydrationMetrics submitMetricsWithError:](v32, "submitMetricsWithError:", &v60);
    v33 = v60;
    v34 = -[NSMutableArray copy](v50, "copy");
    -[MORehydrationMetrics addObjectsFromArray:](v49, "addObjectsFromArray:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager momentStore](self, "momentStore"));
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = __81__MONowPlayingMediaManager__updateMediaPlaySessionEventsDeletedAtSource_handler___block_invoke_204;
    v57[3] = &unk_1002AEB58;
    v36 = v50;
    v58 = v36;
    v59 = v46;
    objc_msgSend(v35, "storeEvents:CompletionHandler:", v49, v57);

    v37 = v49;
  }
  else
  {
    v38 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[MONowPlayingMediaManager _updateMediaPlaySessionEventsDeletedAtSource:handler:].cold.1();

    if (v46)
      (*((void (**)(id, uint64_t, void *))v46 + 2))(v46, v69[5], &__NSDictionary0__struct);
    v40 = [MORehydrationMetrics alloc];
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "firstObject"));
    v42 = objc_msgSend(v41, "category");
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "firstObject"));
    v44 = objc_msgSend(v43, "provider");
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v69[5], "description"));
    v37 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v40, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v42, v44, 0, v45, objc_msgSend(v48, "count"), 1, (double)(int)objc_msgSend(v48, "count"), 0.0);

    v66 = 0;
    -[MORehydrationMetrics submitMetricsWithError:](v37, "submitMetricsWithError:", &v66);
  }

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v74, 8);

}

void __81__MONowPlayingMediaManager__updateMediaPlaySessionEventsDeletedAtSource_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_generateMediaPlaySessionGroupsByDay:", a2));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

void __81__MONowPlayingMediaManager__updateMediaPlaySessionEventsDeletedAtSource_handler___block_invoke_204(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  int v12;
  id v13;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __81__MONowPlayingMediaManager__updateMediaPlaySessionEventsDeletedAtSource_handler___block_invoke_204_cold_1(a1);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "count");
    v12 = 134217984;
    v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Update %ld MediaPlayingSessions event(s) in database succeeded!", (uint8_t *)&v12, 0xCu);
  }

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);

}

- (void)_updateMediaPlayEventsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  MORehydrationThresholdMetrics *v32;
  id v33;
  id os_log;
  NSObject *v35;
  id v36;
  id v37;
  NSObject *v38;
  id v39;
  MORehydrationMetrics *v40;
  void *v41;
  id v42;
  void *v43;
  MORehydrationMetrics *v44;
  id v45;
  id v46;
  void *v47;
  NSMutableArray *v48;
  MORehydrationMetrics *v49;
  id v50;
  NSObject *v51;
  MORehydrationMetrics *v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  NSMutableArray *v61;
  id v62;
  id obj;
  id obja;
  MORehydrationMetrics *v65;
  _QWORD v67[4];
  NSMutableArray *v68;
  id v69;
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  _QWORD v81[7];
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  uint8_t buf[4];
  id v95;
  _BYTE v96[128];
  _BYTE v97[128];

  v5 = a3;
  v58 = a4;
  v60 = v5;
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getDurationOfMOEventArray"));
  v88 = 0;
  v89 = &v88;
  v90 = 0x3032000000;
  v91 = __Block_byref_object_copy__40;
  v92 = __Block_byref_object_dispose__40;
  v93 = 0;
  v82 = 0;
  v83 = &v82;
  v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__40;
  v86 = __Block_byref_object_dispose__40;
  v87 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "startDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "endDate"));
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472;
  v81[2] = __74__MONowPlayingMediaManager__updateMediaPlayEventsDeletedAtSource_handler___block_invoke;
  v81[3] = &unk_1002B6220;
  v81[4] = self;
  v81[5] = &v88;
  v81[6] = &v82;
  -[MONowPlayingMediaManager _fetchNowPlayingEventsBetweenStartDate:EndDate:CompletionHandler:](self, "_fetchNowPlayingEventsBetweenStartDate:EndDate:CompletionHandler:", v6, v7, v81);

  -[MONowPlayingMediaManager waitForQueueEmpty](self, "waitForQueueEmpty");
  if (v89[5])
  {
    v8 = objc_alloc((Class)NSMutableDictionary);
    v65 = (MORehydrationMetrics *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend((id)v89[5], "count"));
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    obj = (id)v89[5];
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v97, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v77;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v77 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)i);
          v13 = objc_autoreleasePoolPush();
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _createEventFromMediaPlayGroupsByDayTitle:](self, "_createEventFromMediaPlayGroupsByDayTitle:", v12));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startDate"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endDate"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _providerIdOfStartDate:endDate:](self, "_providerIdOfStartDate:endDate:", v15, v16));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "describeCategory"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", v18));

          -[MORehydrationMetrics setObject:forKeyedSubscript:](v65, "setObject:forKeyedSubscript:", v14, v19);
          objc_autoreleasePoolPop(v13);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v97, 16);
      }
      while (v9);
    }

    v62 = objc_alloc_init((Class)NSMutableArray);
    v61 = objc_opt_new(NSMutableArray);
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v20 = v60;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v72, v96, 16);
    if (v21)
    {
      obja = *(id *)v73;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(id *)v73 != obja)
            objc_enumerationMutation(v20);
          v23 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)j);
          v24 = objc_autoreleasePoolPush();
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "startDate"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "endDate"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _providerIdOfStartDate:endDate:](self, "_providerIdOfStartDate:endDate:", v25, v26));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "describeCategory"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByAppendingString:", v28));

          v30 = (void *)objc_claimAutoreleasedReturnValue(-[MORehydrationMetrics objectForKeyedSubscript:](v65, "objectForKeyedSubscript:", v29));
          v31 = v30;
          if (v30)
          {
            if (objc_msgSend(v30, "rehydrationFailCount"))
            {
              v32 = -[MORehydrationThresholdMetrics initWithCategory:provider:failureCount:]([MORehydrationThresholdMetrics alloc], "initWithCategory:provider:failureCount:", objc_msgSend(v31, "category"), objc_msgSend(v23, "provider"), objc_msgSend(v31, "rehydrationFailCount"));
              v71 = 0;
              -[MORehydrationThresholdMetrics submitMetricsWithError:](v32, "submitMetricsWithError:", &v71);
              v33 = v71;
              objc_msgSend(v31, "setRehydrationFailCount:", 0);
              objc_msgSend(v62, "addObject:", v31);

            }
          }
          else
          {
            objc_msgSend(v23, "setRehydrationFailCount:", (char *)objc_msgSend(v23, "rehydrationFailCount") + 1);
            -[NSMutableArray addObject:](v61, "addObject:", v23);
          }

          objc_autoreleasePoolPop(v24);
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v72, v96, 16);
      }
      while (v21);
    }

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
    v35 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = -[NSMutableArray count](v61, "count");
      *(_DWORD *)buf = 134217984;
      v95 = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%ld previously saved nowplaying event(s) not found, therefore add rehydration failure count.", buf, 0xCu);
    }

    v37 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v39 = objc_msgSend(v62, "count");
      *(_DWORD *)buf = 134217984;
      v95 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%ld previously rehydration failed nowplaying event(s) are found, therefore change rehydration failure count.", buf, 0xCu);
    }

    v40 = [MORehydrationMetrics alloc];
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));
    v42 = objc_msgSend(v41, "category");
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));
    v44 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v40, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v42, objc_msgSend(v43, "provider"), 1, 0, objc_msgSend(v20, "count"), 1, (double)(int)-[NSMutableArray count](v61, "count"), (double)(int)objc_msgSend(v62, "count"));

    v70 = 0;
    -[MORehydrationMetrics submitMetricsWithError:](v44, "submitMetricsWithError:", &v70);
    v45 = v70;
    v46 = -[NSMutableArray copy](v61, "copy");
    objc_msgSend(v62, "addObjectsFromArray:", v46);

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager momentStore](self, "momentStore"));
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = __74__MONowPlayingMediaManager__updateMediaPlayEventsDeletedAtSource_handler___block_invoke_205;
    v67[3] = &unk_1002AEB58;
    v48 = v61;
    v68 = v48;
    v69 = v58;
    objc_msgSend(v47, "storeEvents:CompletionHandler:", v62, v67);

    v49 = v65;
  }
  else
  {
    v50 = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      -[MONowPlayingMediaManager _updateMediaPlayEventsDeletedAtSource:handler:].cold.1();

    if (v58)
      (*((void (**)(id, uint64_t, void *))v58 + 2))(v58, v83[5], &__NSDictionary0__struct);
    v52 = [MORehydrationMetrics alloc];
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "firstObject"));
    v54 = objc_msgSend(v53, "category");
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "firstObject"));
    v56 = objc_msgSend(v55, "provider");
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v83[5], "description"));
    v49 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v52, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v54, v56, 0, v57, objc_msgSend(v60, "count"), 1, (double)(int)objc_msgSend(v60, "count"), 0.0);

    v80 = 0;
    -[MORehydrationMetrics submitMetricsWithError:](v49, "submitMetricsWithError:", &v80);
  }

  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(&v88, 8);

}

void __74__MONowPlayingMediaManager__updateMediaPlayEventsDeletedAtSource_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_generateMediaPlayGroupsByDayTitle:", a2));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

void __74__MONowPlayingMediaManager__updateMediaPlayEventsDeletedAtSource_handler___block_invoke_205(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  int v12;
  id v13;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRepeatedMedia);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __74__MONowPlayingMediaManager__updateMediaPlayEventsDeletedAtSource_handler___block_invoke_205_cold_1(a1);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "count");
    v12 = 134217984;
    v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Update %ld nowplaying event(s) in database succeeded!", (uint8_t *)&v12, 0xCu);
  }

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);

}

- (void)waitForQueueEmpty
{
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_206);
}

- (void)fetchMediaPlayEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __98__MONowPlayingMediaManager_fetchMediaPlayEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
  block[3] = &unk_1002AE198;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

id __98__MONowPlayingMediaManager_fetchMediaPlayEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchMediaPlayEventsBetweenStartDate:endDate:withStoredEvents:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_fetchMediaPlayEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  MONowPlayingMediaManager *v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[2];
  _QWORD v33[2];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 4));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 6));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("provider"), 3));
  v33[0] = v25;
  v33[1] = v24;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 2));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v15));

  v32[0] = v16;
  v32[1] = v14;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 2));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v17));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "filteredArrayUsingPredicate:", v18));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __99__MONowPlayingMediaManager__fetchMediaPlayEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
  v26[3] = &unk_1002B6268;
  v30 = v11;
  v31 = v12;
  v27 = v19;
  v28 = self;
  v29 = v10;
  v20 = v11;
  v21 = v10;
  v22 = v19;
  v23 = v12;
  -[MONowPlayingMediaManager _fetchNowPlayingEventsBetweenStartDate:EndDate:CompletionHandler:](self, "_fetchNowPlayingEventsBetweenStartDate:EndDate:CompletionHandler:", v21, v20, v26);

}

void __99__MONowPlayingMediaManager__fetchMediaPlayEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSMutableDictionary *v7;
  id os_log;
  NSObject *v9;
  MORehydrationMetrics *v10;
  void *v11;
  NSMutableArray *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  NSMutableArray *v32;
  char *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *j;
  void *v40;
  void *v41;
  void *v42;
  unsigned int v43;
  void *v44;
  id v45;
  NSObject *v46;
  NSMutableArray *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  NSMutableDictionary *v58;
  NSMutableDictionary *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  NSMutableArray *v64;
  id obj;
  uint64_t v66;
  id v67;
  id v68;
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  NSMutableArray *v73;
  char *v74;
  id v75;
  char *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;
  uint8_t buf[4];
  uint64_t v95;
  __int16 v96;
  uint64_t v97;
  __int16 v98;
  id v99;
  __int16 v100;
  id v101;
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];

  v5 = a2;
  v6 = a3;
  v7 = objc_opt_new(NSMutableDictionary);
  if (v6)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "fetching media play sessions from source hit error", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v10 = [MORehydrationMetrics alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
    v12 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v10, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", 4, 3, 0, v11, objc_msgSend(*(id *)(a1 + 32), "count"), 3, (double)(int)objc_msgSend(*(id *)(a1 + 32), "count"), 0.0);

    v93 = 0;
    -[NSMutableArray submitMetricsWithError:](v12, "submitMetricsWithError:", &v93);
    goto LABEL_61;
  }
  v12 = objc_opt_new(NSMutableArray);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_rehydratedMediaEvents:usingNowPlayingEvents:", *(_QWORD *)(a1 + 32), v5));
  v14 = objc_msgSend(v13, "mutableCopy");

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_rehydratedMediaSessionsForEvents:usingNowPlayingEvents:", *(_QWORD *)(a1 + 32), v5));
  v63 = objc_msgSend(v15, "mutableCopy");

  v64 = objc_opt_new(NSMutableArray);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_createNewLeisureMediaEventsFromMediaPlays:storedEvents:", v5, *(_QWORD *)(a1 + 32)));
  v68 = objc_msgSend(v16, "mutableCopy");

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_createNewMediaPlayEventsFromMediaPlays:storedEvents:", v5, *(_QWORD *)(a1 + 32)));
  v67 = objc_msgSend(v17, "mutableCopy");

  if (objc_msgSend(v14, "count"))
    -[NSMutableArray addObjectsFromArray:](v12, "addObjectsFromArray:", v14);
  v18 = v63;
  if (objc_msgSend(v63, "count"))
    -[NSMutableArray addObjectsFromArray:](v12, "addObjectsFromArray:", v63);
  v19 = v64;
  if (objc_msgSend(v68, "count"))
    -[NSMutableArray addObjectsFromArray:](v64, "addObjectsFromArray:", v68);
  if (objc_msgSend(v67, "count"))
    -[NSMutableArray addObjectsFromArray:](v64, "addObjectsFromArray:", v67);
  if (objc_msgSend(v14, "count") && objc_msgSend(v68, "count"))
  {
    v73 = v12;
    v56 = a1;
    v58 = v7;
    v61 = v5;
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    v54 = v14;
    obj = v14;
    v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v105, 16);
    if (!v69)
      goto LABEL_34;
    v66 = *(_QWORD *)v90;
    while (1)
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v90 != v66)
          objc_enumerationMutation(obj);
        v71 = v20;
        v21 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v20);
        v85 = 0u;
        v86 = 0u;
        v87 = 0u;
        v88 = 0u;
        v75 = v68;
        v22 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v85, v104, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v86;
          do
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(_QWORD *)v86 != v24)
                objc_enumerationMutation(v75);
              v26 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)i);
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "startDate"));
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "startDate"));
              if ((objc_msgSend(v27, "isEqualToDate:", v28) & 1) != 0)
              {
                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "mediaTitle"));
                v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "mediaTitle"));
                v31 = objc_msgSend(v29, "isEqualToString:", v30);

                if (!v31)
                  continue;
                -[NSMutableArray removeObject:](v73, "removeObject:", v21);
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "eventIdentifier"));
                objc_msgSend(v26, "setEventIdentifier:", v27);
              }
              else
              {

              }
            }
            v23 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v85, v104, 16);
          }
          while (v23);
        }

        v20 = v71 + 1;
      }
      while ((id)(v71 + 1) != v69);
      v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v105, 16);
      if (!v69)
      {
LABEL_34:

        v6 = 0;
        v5 = v61;
        a1 = v56;
        v7 = v58;
        v12 = v73;
        v14 = v54;
        v18 = v63;
        v19 = v64;
        break;
      }
    }
  }
  if (objc_msgSend(v18, "count") && objc_msgSend(v67, "count"))
  {
    v55 = v14;
    v57 = a1;
    v32 = v12;
    v59 = v7;
    v60 = v6;
    v62 = v5;
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v70 = v18;
    v74 = (char *)objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v81, v103, 16);
    if (v74)
    {
      v72 = *(_QWORD *)v82;
      do
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v82 != v72)
            objc_enumerationMutation(v70);
          v76 = v33;
          v34 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)v33);
          v77 = 0u;
          v78 = 0u;
          v79 = 0u;
          v80 = 0u;
          v35 = v67;
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v77, v102, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v78;
            do
            {
              for (j = 0; j != v37; j = (char *)j + 1)
              {
                if (*(_QWORD *)v78 != v38)
                  objc_enumerationMutation(v35);
                v40 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)j);
                v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "startDate"));
                v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "startDate"));
                v43 = objc_msgSend(v41, "isEqualToDate:", v42);

                if (v43)
                {
                  -[NSMutableArray removeObject:](v32, "removeObject:", v34);
                  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "eventIdentifier"));
                  objc_msgSend(v40, "setEventIdentifier:", v44);

                }
              }
              v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v77, v102, 16);
            }
            while (v37);
          }

          v33 = v76 + 1;
        }
        while (v76 + 1 != v74);
        v74 = (char *)objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v81, v103, 16);
      }
      while (v74);
    }

    v6 = v60;
    v5 = v62;
    a1 = v57;
    v7 = v59;
    v12 = v32;
    v14 = v55;
    v18 = v63;
    v19 = v64;
  }
  if (-[NSMutableArray count](v12, "count"))
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v12, CFSTR("rehydratedEvents"));
  if (-[NSMutableArray count](v19, "count"))
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v19, CFSTR("newEvents"));
  v45 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
  v46 = objc_claimAutoreleasedReturnValue(v45);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    v47 = v12;
    v48 = v14;
    v49 = a1;
    v50 = *(_QWORD *)(a1 + 48);
    v51 = *(_QWORD *)(a1 + 56);
    v52 = -[NSMutableArray count](v47, "count");
    v53 = -[NSMutableArray count](v64, "count");
    *(_DWORD *)buf = 138413058;
    v95 = v50;
    v14 = v48;
    v96 = 2112;
    v97 = v51;
    a1 = v49;
    v98 = 2048;
    v99 = v52;
    v18 = v63;
    v100 = 2048;
    v101 = v53;
    v12 = v47;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "start date, %@, end date, %@, rehydrated event count, %lu, new event count, %lu", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_61:

}

- (id)_createNewLeisureMediaEventsFromMediaPlays:(id)a3 storedEvents:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  id os_log;
  NSObject *v30;
  id v31;
  id v32;
  id v34;
  id v35;
  NSMutableArray *v36;
  id obj;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  id v48;
  _BYTE v49[128];
  _BYTE v50[128];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = objc_opt_new(NSMutableSet);
    v35 = v7;
    if (objc_msgSend(v7, "count"))
    {
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v44 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startDate"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endDate"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _providerIdOfStartDate:endDate:](self, "_providerIdOfStartDate:endDate:", v15, v16));
            -[NSMutableSet addObject:](v8, "addObject:", v17);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
        }
        while (v11);
      }

    }
    v34 = v6;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _generateMediaPlayGroupsByDayTitle:](self, "_generateMediaPlayGroupsByDayTitle:", v6));
    v36 = objc_opt_new(NSMutableArray);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v18;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    if (v19)
    {
      v20 = v19;
      v38 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(_QWORD *)v40 != v38)
            objc_enumerationMutation(obj);
          v22 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)j);
          v23 = objc_autoreleasePoolPush();
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _createEventFromMediaPlayGroupsByDayTitle:](self, "_createEventFromMediaPlayGroupsByDayTitle:", v22));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "startDate"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "endDate"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _providerIdOfStartDate:endDate:](self, "_providerIdOfStartDate:endDate:", v25, v26));

          if (!-[NSMutableSet count](v8, "count"))
          {
            if (!v24)
              goto LABEL_23;
LABEL_22:
            -[MONowPlayingMediaManager _setDynamicProperties:mediaPlay:](self, "_setDynamicProperties:mediaPlay:", v24, v22);
            -[NSMutableArray addObject:](v36, "addObject:", v24);
            goto LABEL_23;
          }
          if (-[NSMutableSet count](v8, "count"))
          {
            v28 = -[NSMutableSet containsObject:](v8, "containsObject:", v27);
            if (v24)
            {
              if ((v28 & 1) == 0)
                goto LABEL_22;
            }
          }
LABEL_23:

          objc_autoreleasePoolPop(v23);
        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
      }
      while (v20);
    }

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    v30 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = -[NSMutableArray count](v36, "count");
      *(_DWORD *)buf = 134217984;
      v48 = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "new leisure media event count, %lu", buf, 0xCu);
    }

    v6 = v34;
    v7 = v35;
  }
  else
  {
    v32 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(&v8->super.super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, &v8->super.super, OS_LOG_TYPE_INFO, "no media play are fetched to create new leisure media events", buf, 2u);
    }
    v36 = 0;
  }

  return v36;
}

- (id)_createNewMediaPlayEventsFromMediaPlays:(id)a3 storedEvents:(id)a4
{
  id v5;
  id v6;
  NSMutableSet *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSMutableSet *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  id os_log;
  NSObject *v32;
  id v33;
  id v34;
  void *v36;
  void *v37;
  NSMutableArray *v38;
  id obj;
  void *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  id v51;
  _BYTE v52[128];
  _BYTE v53[128];

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7 = objc_opt_new(NSMutableSet);
    if (objc_msgSend(v6, "count"))
    {
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v47 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _providerIdOfStartDate:endDate:](self, "_providerIdOfStartDate:endDate:", v14, v15));
            -[NSMutableSet addObject:](v7, "addObject:", v16);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
        }
        while (v10);
      }

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _generateMediaPlaySessionGroupsByDay:](self, "_generateMediaPlaySessionGroupsByDay:", v5, v6, v5));
    v38 = objc_opt_new(NSMutableArray);
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v40 = v17;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allKeys"));
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(_QWORD *)v43 != v20)
            objc_enumerationMutation(obj);
          v22 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)j);
          v23 = objc_autoreleasePoolPush();
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", v22));
          if (objc_msgSend(v24, "count"))
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _createEventFromMediaPlaySessions:](self, "_createEventFromMediaPlaySessions:", v24));
            v26 = v7;
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "startDate"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "endDate"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[MONowPlayingMediaManager _providerIdOfStartDate:endDate:](self, "_providerIdOfStartDate:endDate:", v27, v28));

            v7 = v26;
            if (-[NSMutableSet count](v26, "count"))
            {
              if (!-[NSMutableSet count](v26, "count"))
                goto LABEL_24;
              v30 = -[NSMutableSet containsObject:](v26, "containsObject:", v29);
              if (!v25 || (v30 & 1) != 0)
                goto LABEL_24;
LABEL_23:
              objc_msgSend(v25, "setMediaPlaySessions:", v24);
              -[NSMutableArray addObject:](v38, "addObject:", v25);
            }
            else if (v25)
            {
              goto LABEL_23;
            }
LABEL_24:

          }
          objc_autoreleasePoolPop(v23);
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
      }
      while (v19);
    }

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    v32 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = -[NSMutableArray count](v38, "count");
      *(_DWORD *)buf = 134217984;
      v51 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "new media play event count, %lu", buf, 0xCu);
    }

    v6 = v36;
    v5 = v37;
  }
  else
  {
    v34 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, &v7->super.super, OS_LOG_TYPE_INFO, "no media play are fetched to create new media play events", buf, 2u);
    }
    v38 = 0;
  }

  return v38;
}

- (id)_findUnrehdyratedEventsFromStoredEvents:(id)a3 rehydratedEvents:(id)a4
{
  id v5;
  id v6;
  NSMutableArray *v7;
  NSMutableSet *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  id v25;
  NSObject *v26;
  id os_log;
  NSObject *v28;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[16];
  _BYTE v41[128];
  _BYTE v42[128];

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v5, "count"))
    {
      v7 = objc_opt_new(NSMutableArray);
      v8 = objc_opt_new(NSMutableSet);
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v30 = v6;
      v9 = v6;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v37 != v12)
              objc_enumerationMutation(v9);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i), "eventIdentifier", v30));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
            -[NSMutableSet addObject:](v8, "addObject:", v15);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
        }
        while (v11);
      }

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v31 = v5;
      v16 = v5;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v33;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(_QWORD *)v33 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)j);
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "eventIdentifier", v30));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "UUIDString"));
            v24 = -[NSMutableSet containsObject:](v8, "containsObject:", v23);

            if ((v24 & 1) == 0)
            {
              objc_msgSend(v21, "setRehydrationFailCount:", (char *)objc_msgSend(v21, "rehydrationFailCount") + 1);
              -[NSMutableArray addObject:](v7, "addObject:", v21);
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        }
        while (v18);
      }

      v6 = v30;
      v5 = v31;
    }
    else
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
      v28 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "no stored events for rehydration", buf, 2u);
      }

      v7 = 0;
    }
  }
  else
  {
    v25 = _mo_log_facility_get_os_log(&MOLogFacilityMediaPlaySessions);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "no media events are rehydrated", buf, 2u);
    }

    v7 = (NSMutableArray *)v5;
  }

  return v7;
}

- (BMStream)stream
{
  return self->_stream;
}

- (BMSyncService)syncService
{
  return self->_syncService;
}

- (MOEventStore)momentStore
{
  return self->_momentStore;
}

- (NSSet)leisureMediaBundleIdSet
{
  return self->_leisureMediaBundleIdSet;
}

- (NSSet)thirdPartyMediaBundleIdSet
{
  return self->_thirdPartyMediaBundleIdSet;
}

- (NSSet)firstPartyBundleIdSet
{
  return self->_firstPartyBundleIdSet;
}

- (NSSet)mediaBundleDeniedIdSet
{
  return self->_mediaBundleDeniedIdSet;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (NSURL)plistFileURL
{
  return self->_plistFileURL;
}

- (NSURL)plistAppInfoFileURL
{
  return self->_plistAppInfoFileURL;
}

- (NSMutableDictionary)bundleIdCategoryMappings
{
  return self->_bundleIdCategoryMappings;
}

- (NSMutableDictionary)bundleIdAppInfoMappings
{
  return self->_bundleIdAppInfoMappings;
}

- (float)kMediaInfoRefreshInterval
{
  return self->_kMediaInfoRefreshInterval;
}

- (void)setKMediaInfoRefreshInterval:(float)a3
{
  self->_kMediaInfoRefreshInterval = a3;
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_bundleIdAppInfoMappings, 0);
  objc_storeStrong((id *)&self->_bundleIdCategoryMappings, 0);
  objc_storeStrong((id *)&self->_plistAppInfoFileURL, 0);
  objc_storeStrong((id *)&self->_plistFileURL, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_mediaBundleDeniedIdSet, 0);
  objc_storeStrong((id *)&self->_firstPartyBundleIdSet, 0);
  objc_storeStrong((id *)&self->_thirdPartyMediaBundleIdSet, 0);
  objc_storeStrong((id *)&self->_leisureMediaBundleIdSet, 0);
  objc_storeStrong((id *)&self->_momentStore, 0);
  objc_storeStrong((id *)&self->_syncService, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

void __93__MONowPlayingMediaManager__fetchNowPlayingEventsBetweenStartDate_EndDate_CompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "completionHandler not called due to biome query error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __93__MONowPlayingMediaManager__fetchNowPlayingEventsBetweenStartDate_EndDate_CompletionHandler___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, a3, (uint64_t)a3, "number of devices for nowplaying events, %lu", (uint8_t *)a1);
}

void __57__MONowPlayingMediaManager__fetchAppCateogryByBundleIds___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fail to fetch category info with error:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_getMediaAppCategoryPlistFileURL
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Failed to get cache directory to store media app category plist file, nil cache directory.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_getMediaAppInfoPlistFileURL
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Failed to get cache directory to store media app info plist file, nil cache directory.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_removeOldMediaAppCategoryPlistFile:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Could not remove old media app category plist file, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_removeOldMediaAppCategoryPlistFile:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;

  v3 = 138412290;
  v4 = CFSTR("mediaAppCategory.plist");
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, a1, a3, "File %@ found.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)_readMediaAppInfoPlistFile:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Could not read the media app info plist file, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_readMediaAppInfoPlistFile:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;

  v3 = 138412290;
  v4 = CFSTR("mediaAppInfo.plist");
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, a1, a3, "File %@ found.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)_persistMediaAppInfoPlistFile:withData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid path for media app info plist file.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_persistMediaAppInfoPlistFile:withData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Media app info serialization to NSData failed or returned nil, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_persistMediaAppInfoPlistFile:withData:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Couldn't write to the media app info id plist file, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_createEventFromMediaPlayGroupsByDayTitle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "mediaPlay has no mediaPlaySessions. (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __77__MONowPlayingMediaManager__saveMediaPlayGroupsByDayTitle_startDate_handler___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving repeated or played media events into database failed with error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__MONowPlayingMediaManager__saveMediaPlaySessionsEvents_handler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving mediaPlaySession events into database failed with error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_createEventFromMediaPlaySessions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "mediaPlaySessions has no sessions. (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __63__MONowPlayingMediaManager__rehydratedMediaPlayEvents_handler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "no event to rehydrate, returning nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_rehydratedMediaSessionsForEvents:usingNowPlayingEvents:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "no result from mediaPlay fetching, no events rehydrated.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_rehydratedMediaEvents:usingNowPlayingEvents:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "no result from repeatedMedia fetching, no events rehydrated.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_setDynamicProperties:(void *)a1 mediaPlay:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "mediaPlaySessions"));
  objc_msgSend(v1, "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, v2, v3, "has media play sessions, %lu", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

- (void)_setDynamicProperties:(void *)a1 mediaPlay:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "mediaRepetitions"));
  objc_msgSend(v1, "unsignedLongValue");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, v2, v3, "has repetition, %lu", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

- (void)_setDynamicProperties:(void *)a1 mediaPlay:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "mediaSumTimePlayed"));
  objc_msgSend(v1, "doubleValue");
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, v2, v3, "has sumTimePlayed, %f", v4, v5, v6, v7, 0);

  OUTLINED_FUNCTION_5();
}

- (void)_setDynamicProperties:(void *)a1 mediaPlay:.cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "mediaType"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, v2, v3, "has mediaType, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

- (void)_setDynamicProperties:(void *)a1 mediaPlay:.cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "mediaPlayerBundleId"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, v2, v3, "has media player bundleID, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

- (void)_setDynamicProperties:(void *)a1 mediaPlay:.cold.6(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "mediaAlbum"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v1));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, v3, v4, "has album name, %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_setDynamicProperties:(void *)a1 mediaPlay:.cold.7(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "mediaTitle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v1));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, v3, v4, "has title, %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_updateMediaPlaySessionEventsDeletedAtSource:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "nil query result from media fetching, no events removed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __81__MONowPlayingMediaManager__updateMediaPlaySessionEventsDeletedAtSource_handler___block_invoke_204_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_0(a1);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v1, v2, "Update %ld MediaPlayingSessions event(s) in database failed, error %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_5();
}

- (void)_updateMediaPlayEventsDeletedAtSource:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "nil query result from media fetching, no events updated.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __74__MONowPlayingMediaManager__updateMediaPlayEventsDeletedAtSource_handler___block_invoke_205_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_0(a1);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v1, v2, "Update %ld nowplaying event(s) in database failed, error %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_5();
}

@end
