@implementation MOSharedWithYouManager

- (MOSharedWithYouManager)initWithUniverse:(id)a3
{
  id v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  MOSharedWithYouManager *v16;
  dispatch_queue_attr_t v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *queue;
  uint64_t v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  uint64_t v25;
  MOEventStore *momentStore;
  dispatch_semaphore_t v27;
  OS_dispatch_semaphore *swySemaphore;
  SWHighlightCenter *swHighlightCenter;
  MOSharedWithYouManager *v30;
  id os_log;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  objc_super v51;

  v5 = a3;
  v7 = (objc_class *)objc_opt_class(MOEventStore, v6);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v9));

  if (!v10)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[MOSharedWithYouManager initWithUniverse:].cold.1(v32, v33, v34, v35, v36, v37, v38, v39);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOSharedWithYouManager.m"), 71, CFSTR("Invalid parameter not satisfying: [universe getService:NSStringFromClass([MOEventStore class])]"));
    goto LABEL_13;
  }
  v12 = (objc_class *)objc_opt_class(MOConfigurationManager, v11);
  v13 = NSStringFromClass(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v14));

  if (!v15)
  {
    v40 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      -[MOSharedWithYouManager initWithUniverse:].cold.2(v41, v42, v43, v44, v45, v46, v47, v48);

    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOSharedWithYouManager.m"), 73, CFSTR("Invalid parameter not satisfying: configurationManager"));

LABEL_13:
    v30 = 0;
    goto LABEL_14;
  }
  v51.receiver = self;
  v51.super_class = (Class)MOSharedWithYouManager;
  v16 = -[MOSharedWithYouManager init](&v51, "init");
  if (v16)
  {
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = dispatch_queue_create("MOSharedWithYouManager", v18);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v19;

    v22 = (objc_class *)objc_opt_class(MOEventStore, v21);
    v23 = NSStringFromClass(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v24));
    momentStore = v16->_momentStore;
    v16->_momentStore = (MOEventStore *)v25;

    objc_storeStrong((id *)&v16->_configurationManager, v15);
    if (-[MOSharedWithYouManager _sharedWithYouEnabled](v16, "_sharedWithYouEnabled"))
    {
      v27 = dispatch_semaphore_create(0);
      swySemaphore = v16->_swySemaphore;
      v16->_swySemaphore = (OS_dispatch_semaphore *)v27;

      v16->_highlightsCacheNotificationPending = 1;
      swHighlightCenter = v16->_swHighlightCenter;
      v16->_swHighlightCenter = 0;

    }
  }
  self = v16;
  v30 = self;
LABEL_14:

  return v30;
}

- (BOOL)_sharedWithYouEnabled
{
  BOOL v2;
  void *v3;
  void *v4;
  id os_log;
  NSObject *v6;
  id v7;
  uint8_t v9[16];
  uint8_t buf[16];

  v2 = 0;
  if (-[MOConfigurationManagerBase getBoolSettingForKey:withFallback:](self->_configurationManager, "getBoolSettingForKey:withFallback:", CFSTR("EventManagerOverrideSwitchSharedWithYou"), 0))
  {
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("SharedWithYouEnabled"), CFSTR("com.apple.SocialLayer"));
    v4 = v3;
    if (v3 && (objc_msgSend(v3, "BOOLValue") & 1) != 0)
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
      v6 = objc_claimAutoreleasedReturnValue(os_log);
      v2 = 1;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#swy,sharedWithYou enabled!", v9, 2u);
      }
    }
    else
    {
      v7 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
      v6 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#swy,sharedWithYou not enabled!", buf, 2u);
      }
      v2 = 0;
    }

  }
  return v2;
}

- (SWHighlightCenter)swHighlightCenter
{
  SWHighlightCenter *v3;
  SWHighlightCenter *swHighlightCenter;
  __int128 v6;
  uint64_t v7;

  if (!SharedWithYouLibraryCore_frameworkLibrary)
  {
    v6 = off_1002B1218;
    v7 = 0;
    SharedWithYouLibraryCore_frameworkLibrary = _sl_dlopen(&v6, 0);
  }
  if (SharedWithYouLibraryCore_frameworkLibrary && !self->_swHighlightCenter)
  {
    v3 = (SWHighlightCenter *)objc_msgSend(objc_alloc((Class)getSWHighlightCenterClass()), "init");
    swHighlightCenter = self->_swHighlightCenter;
    self->_swHighlightCenter = v3;

    -[SWHighlightCenter setDelegate:](self->_swHighlightCenter, "setDelegate:", self);
  }
  return self->_swHighlightCenter;
}

- (void)fetchSharedContentBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  id os_log;
  NSObject *v13;
  void *v14;
  OS_dispatch_semaphore *swySemaphore;
  BOOL v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableArray *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *i;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  NSObject *v45;
  id v46;
  id v47;
  void (**v48)(id, void *, _QWORD);
  NSMutableArray *v49;
  id v50;
  void *v51;
  uint64_t v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  uint8_t buf[4];
  id v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  _BYTE v65[128];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  if (-[MOSharedWithYouManager _sharedWithYouEnabled](self, "_sharedWithYouEnabled")
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOSharedWithYouManager swHighlightCenter](self, "swHighlightCenter")),
        v11,
        v11))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
    v13 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "#swy,fetchSharedContentBetweenStartDate", buf, 2u);
    }
    v48 = v10;

    if (self->_highlightsCacheNotificationPending)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptSource/SharedWithYou/MOSharedWithYouManager.m", 139, "-[MOSharedWithYouManager fetchSharedContentBetweenStartDate:EndDate:CompletionHandler:]"));
      swySemaphore = self->_swySemaphore;
      v58 = 0;
      v16 = MOSemaphoreWaitAndFaultIfTimeout_Internal(swySemaphore, &v58, v14, 5.0);
      v47 = v58;
      if (!v16)
      {
        v17 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[MOTripAnnotationManager hometownReferenceLocations].cold.1((uint64_t)v14, v18, v19, v20, v21, v22, v23, v24);

      }
    }
    else
    {
      v47 = 0;
    }
    v25 = objc_opt_new(NSMutableArray);
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOSharedWithYouManager swHighlightCenter](self, "swHighlightCenter"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "highlights"));

    v53 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    if (v53)
    {
      v28 = *(_QWORD *)v55;
      v49 = v25;
      v50 = v8;
      v52 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v53; i = (char *)i + 1)
        {
          if (*(_QWORD *)v55 != v28)
            objc_enumerationMutation(v27);
          v30 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "slHighlight"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "timestamp"));
          v33 = objc_msgSend(v32, "betweenDate:andDate:", v8, v9);

          if (v33)
          {
            v34 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
            v35 = objc_claimAutoreleasedReturnValue(v34);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "URL"));
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "absoluteString"));
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "slHighlight"));
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "identifier"));
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "slHighlight"));
              v40 = v27;
              v41 = v9;
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "timestamp"));
              *(_DWORD *)buf = 138412802;
              v60 = v36;
              v61 = 2112;
              v62 = v38;
              v63 = 2112;
              v64 = v42;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "#swy,found highlight within timeperiod,url,%@,identifier,%@,timestamp,%@", buf, 0x20u);

              v9 = v41;
              v27 = v40;

              v8 = v50;
              v25 = v49;

            }
            v43 = objc_msgSend(v30, "copy");
            -[NSMutableArray addObject:](v25, "addObject:", v43);

            v28 = v52;
          }
        }
        v53 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
      }
      while (v53);
    }

    v44 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      v46 = -[NSMutableArray count](v25, "count");
      *(_DWORD *)buf = 134217984;
      v60 = v46;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "#swy,highlights returned from fetch,%lu", buf, 0xCu);
    }

    v10 = v48;
    v48[2](v48, v25, 0);

  }
  else
  {
    v10[2](v10, &__NSArray0__struct, 0);
  }

}

- (void)highlightCenterHighlightsDidChange:(id)a3
{
  id os_log;
  NSObject *v5;
  NSObject *swySemaphore;
  uint8_t v7[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#swy,highlightCenterHighlightsDidChange", v7, 2u);
  }

  swySemaphore = self->_swySemaphore;
  if (swySemaphore)
  {
    if (self->_highlightsCacheNotificationPending)
    {
      self->_highlightsCacheNotificationPending = 0;
      dispatch_semaphore_signal(swySemaphore);
    }
  }
}

- (id)createEventFromHighlight:(id)a3
{
  id v4;
  MOEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MOEvent *v10;
  void *v11;
  void *v12;
  double v13;
  float v14;
  void *v15;
  void *v16;
  void *v17;
  id os_log;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;

  v4 = a3;
  v5 = [MOEvent alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v5, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v6, v7, v8, v9, 11, 9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOSharedWithYouManager configurationManager](self, "configurationManager"));
  LODWORD(v13) = 1242802176;
  objc_msgSend(v12, "getFloatSettingForKey:withFallback:", CFSTR("EventManagerOverrideMaximumEventAge"), v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateByAddingTimeInterval:", v14));
  -[MOEvent setExpirationDate:](v10, "setExpirationDate:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "slHighlight"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
  -[MOEvent setIdentifierFromProvider:](v10, "setIdentifierFromProvider:", v17);

  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
  v19 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent identifierFromProvider](v10, "identifierFromProvider"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent startDate](v10, "startDate"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent endDate](v10, "endDate"));
    v24 = 138412802;
    v25 = v20;
    v26 = 2112;
    v27 = v21;
    v28 = 2112;
    v29 = v22;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "#swy,identifierFromProvider, %@, startDate, %@, endDate,%@,", (uint8_t *)&v24, 0x20u);

  }
  return v10;
}

- (void)saveHighlights:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  id os_log;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  NSObject *v30;
  MOEventStore *momentStore;
  id v32;
  _QWORD v33[4];
  id v34;
  void (**v35)(id, _QWORD, void *);
  _QWORD v36[6];
  _QWORD v37[6];
  _QWORD v38[5];
  id v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[16];
  _BYTE v48[128];

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "timestamp"));
        v15 = objc_msgSend(v8, "isAfterDate:", v14);

        if (v15)
        {
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "timestamp"));

          v8 = (void *)v16;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v10);
  }

  v40 = 0;
  v41[0] = &v40;
  v41[1] = 0x3032000000;
  v41[2] = __Block_byref_object_copy__17;
  v41[3] = __Block_byref_object_dispose__17;
  v42 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__17;
  v38[4] = __Block_byref_object_dispose__17;
  v39 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOSharedWithYouManager momentStore](self, "momentStore"));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = __49__MOSharedWithYouManager_saveHighlights_handler___block_invoke;
  v37[3] = &unk_1002AEB08;
  v37[4] = &v40;
  v37[5] = v38;
  objc_msgSend(v17, "fetchEventsWithStartDateAfter:Category:CompletionHandler:", v8, 9, v37);

  if (*(_QWORD *)(v41[0] + 40))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
    v19 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MOSharedWithYouManager saveHighlights:handler:].cold.2((uint64_t)v41, v19, v20, v21, v22, v23, v24, v25);

    v26 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "#swy,no shared content will be saved this round", buf, 2u);
    }

    if (v7)
      v7[2](v7, *(_QWORD *)(v41[0] + 40), &__NSDictionary0__struct);
  }
  else
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = __49__MOSharedWithYouManager_saveHighlights_handler___block_invoke_96;
    v36[3] = &unk_1002B11B0;
    v36[4] = self;
    v36[5] = v38;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_pas_mappedArrayWithTransform:", v36));
    v29 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[MOSharedWithYouManager saveHighlights:handler:].cold.1(buf, (uint64_t)objc_msgSend(v28, "count"), v30);

    momentStore = self->_momentStore;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = __49__MOSharedWithYouManager_saveHighlights_handler___block_invoke_98;
    v33[3] = &unk_1002AEB58;
    v32 = v28;
    v34 = v32;
    v35 = v7;
    -[MOEventStore storeEvents:CompletionHandler:](momentStore, "storeEvents:CompletionHandler:", v32, v33);

  }
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(&v40, 8);
}

void __49__MOSharedWithYouManager_saveHighlights_handler___block_invoke(uint64_t a1, void *a2, id obj)
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  v7 = a2;
  v8 = objc_alloc((Class)NSSet);
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_17));

  v9 = objc_msgSend(v8, "initWithArray:", v12);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

id __49__MOSharedWithYouManager_saveHighlights_handler___block_invoke_2(id a1, MOEvent *a2)
{
  return -[MOEvent identifierFromProvider](a2, "identifierFromProvider");
}

id __49__MOSharedWithYouManager_saveHighlights_handler___block_invoke_96(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "slHighlight"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v6);

  if ((v4 & 1) != 0)
    v7 = 0;
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "createEventFromHighlight:", v3));

  return v7;
}

void __49__MOSharedWithYouManager_saveHighlights_handler___block_invoke_98(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  int v18;
  id v19;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __49__MOSharedWithYouManager_saveHighlights_handler___block_invoke_98_cold_1((uint64_t)v5, v9, v10, v11, v12, v13, v14, v15);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v16 = objc_msgSend(*(id *)(a1 + 32), "count");
    v18 = 134217984;
    v19 = v16;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "#swy,saved shared contents, count, %lu", (uint8_t *)&v18, 0xCu);
  }

  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v5, v6);

}

- (void)fetchAndSaveSharedContentBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id os_log;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  NSErrorUserInfoKey v21;
  const __CFString *v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[MOSharedWithYouManager _sharedWithYouEnabled](self, "_sharedWithYouEnabled"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
    v12 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, " #swy,fetchAndSaveSharedContentBetweenStartDate,%@,endDate,%@", buf, 0x16u);
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __84__MOSharedWithYouManager_fetchAndSaveSharedContentBetweenStartDate_EndDate_handler___block_invoke;
    v15[3] = &unk_1002AEB80;
    v15[4] = self;
    v16 = v10;
    -[MOSharedWithYouManager fetchSharedContentBetweenStartDate:EndDate:CompletionHandler:](self, "fetchSharedContentBetweenStartDate:EndDate:CompletionHandler:", v8, v9, v15);
    v13 = v16;
  }
  else
  {
    v21 = NSLocalizedDescriptionKey;
    v22 = CFSTR("SWY not enabled");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 5, v14));

    (*((void (**)(id, void *, _QWORD))v10 + 2))(v10, v13, 0);
  }

}

void __84__MOSharedWithYouManager_fetchAndSaveSharedContentBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, id, _QWORD))(v7 + 16))(v7, v6, 0);
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __84__MOSharedWithYouManager_fetchAndSaveSharedContentBetweenStartDate_EndDate_handler___block_invoke_2;
    v9[3] = &unk_1002ADA40;
    v8 = *(void **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v8, "saveHighlights:handler:", v5, v9);

  }
}

uint64_t __84__MOSharedWithYouManager_fetchAndSaveSharedContentBetweenStartDate_EndDate_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)rehydratedSharedContentEvents:(id)a3
{
  id v4;
  id os_log;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  _QWORD v16[6];
  uint8_t v17[8];
  _QWORD v18[5];
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  NSMutableDictionary *v24;

  v4 = a3;
  if (-[MOSharedWithYouManager _sharedWithYouEnabled](self, "_sharedWithYouEnabled"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#swy,rehydratedSharedContentEvents", buf, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getDurationOfMOEventArray"));
    *(_QWORD *)buf = 0;
    v20 = buf;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__17;
    v23 = __Block_byref_object_dispose__17;
    v24 = objc_opt_new(NSMutableDictionary);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingTimeInterval:", -1.0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateByAddingTimeInterval:", 1.0));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __56__MOSharedWithYouManager_rehydratedSharedContentEvents___block_invoke;
    v18[3] = &unk_1002AEFF0;
    v18[4] = buf;
    -[MOSharedWithYouManager fetchSharedContentBetweenStartDate:EndDate:CompletionHandler:](self, "fetchSharedContentBetweenStartDate:EndDate:CompletionHandler:", v9, v11, v18);

    -[MOSharedWithYouManager waitForQueueEmpty](self, "waitForQueueEmpty");
    if (*((_QWORD *)v20 + 5))
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = __56__MOSharedWithYouManager_rehydratedSharedContentEvents___block_invoke_105;
      v16[3] = &unk_1002B11D8;
      v16[4] = self;
      v16[5] = buf;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v16));
    }
    else
    {
      v13 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "#swy,nil query result from shared content fetching, no events rehydrated.", v17, 2u);
      }

      v12 = &__NSArray0__struct;
    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v12 = &__NSArray0__struct;
  }

  return v12;
}

void __56__MOSharedWithYouManager_rehydratedSharedContentEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "slHighlight"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v11);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

id __56__MOSharedWithYouManager_rehydratedSharedContentEvents___block_invoke_105(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id os_log;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  uint64_t v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  unsigned int v48;
  unsigned int v49;
  void *v50;
  id v51;
  NSObject *v52;
  void *v53;
  void *v54;
  unsigned int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  uint64_t v64;
  void *i;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  unsigned __int8 v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  void *v80;
  void *v81;
  NSMutableArray *v82;
  void *v83;
  void *v84;
  unsigned int v85;
  uint64_t v86;
  id v87;
  NSObject *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  NSObject *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  NSObject *v98;
  void *v99;
  void *v100;
  id v101;
  void *v103;
  void *v104;
  uint64_t v105;
  id obj;
  void *v107;
  NSMutableArray *v108;
  uint64_t v109;
  void *v110;
  id v111;
  void *v112;
  uint64_t v113;
  char v114;
  int v115;
  NSMutableArray *v116;
  id v117;
  void *v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  uint8_t v127[128];
  uint8_t buf[4];
  _BYTE v129[20];
  __int128 v130;
  _BYTE v131[128];

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifierFromProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "swHighlightCenter"));

    if (!v7)
    {
      v79 = &__NSArray0__struct;
      v9 = v6;
LABEL_64:

      goto LABEL_65;
    }
    v104 = v3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "swHighlightCenter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fetchAttributionsForHighlight:", v6));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "attributions"));
    if (!v10)
    {
      v79 = &__NSArray0__struct;
      v3 = v104;
LABEL_63:

      goto LABEL_64;
    }
    v105 = a1;
    v103 = v10;
    v11 = objc_msgSend(v104, "copy");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "slHighlight"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
    objc_msgSend(v11, "setIdentifierFromProvider:", v13);

    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
    v15 = objc_claimAutoreleasedReturnValue(os_log);
    v112 = v11;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "eventIdentifier"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifierFromProvider"));
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v129 = v16;
      *(_WORD *)&v129[8] = 2112;
      *(_QWORD *)&v129[10] = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "#swy,rehydrated event,%@,has identifierFromProvider, %@", buf, 0x16u);

      v11 = v112;
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URL"));
    v107 = v9;
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URL"));
      objc_msgSend(v11, "setItemURL:", v19);

      v20 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "slHighlight"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
        v24 = *(void **)(a1 + 32);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "itemURL"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "absoluteString"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "redactURL:", v26));
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v129 = v23;
        *(_WORD *)&v129[8] = 2112;
        *(_QWORD *)&v129[10] = v27;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "#swy,identifier,%@,has itemURL, %@", buf, 0x16u);

        v11 = v112;
        v9 = v107;
      }

    }
    v108 = objc_opt_new(NSMutableArray);
    v116 = objc_opt_new(NSMutableArray);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v103, "count")));
    objc_msgSend(v11, "setItemAttributionsCount:", v28);

    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    obj = v103;
    v111 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v131, 16);
    if (v111)
    {
      LOBYTE(v29) = 0;
      v115 = 0;
      v109 = *(_QWORD *)v124;
      v110 = 0;
      do
      {
        v30 = 0;
        do
        {
          v114 = v29;
          if (*(_QWORD *)v124 != v109)
            objc_enumerationMutation(obj);
          v31 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * v30);
          v32 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
          v33 = objc_claimAutoreleasedReturnValue(v32);
          v113 = v30;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "slHighlight"));
            v35 = v9;
            v36 = v31;
            v37 = v34;
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "identifier"));
            v39 = *(void **)(v105 + 32);
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "URL"));
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "absoluteString"));
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "redactURL:", v41));
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "uniqueIdentifier"));
            *(_DWORD *)buf = 138413058;
            *(_QWORD *)v129 = v38;
            *(_WORD *)&v129[8] = 2112;
            *(_QWORD *)&v129[10] = v42;
            *(_WORD *)&v129[18] = 1024;
            LODWORD(v130) = ++v115;
            WORD2(v130) = 2112;
            *(_QWORD *)((char *)&v130 + 6) = v43;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "#swy, rehydrate,identifier,%@,matchedHighlight.resourceURL,%@,attribution[%d],uniqueIdentifier,%@", buf, 0x26u);

            v31 = v36;
            v9 = v35;
            v11 = v112;

          }
          v44 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
          v45 = objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "slHighlight"));
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "identifier"));
            v48 = objc_msgSend(v31, "isPinned");
            v49 = objc_msgSend(v31, "isGroupConversation");
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "groupDisplayName"));
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)v129 = v115;
            *(_WORD *)&v129[4] = 2112;
            *(_QWORD *)&v129[6] = v47;
            *(_WORD *)&v129[14] = 1024;
            *(_DWORD *)&v129[16] = v48;
            LOWORD(v130) = 1024;
            *(_DWORD *)((char *)&v130 + 2) = v49;
            WORD3(v130) = 2112;
            *((_QWORD *)&v130 + 1) = v50;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "#swy, rehydrate,attribution[[%d],identifier,%@,pinned,%d,isGroupConversation,%d,groupDisplayName,%@", buf, 0x28u);

          }
          v51 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
          v52 = objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "slHighlight"));
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "identifier"));
            v55 = objc_msgSend(v31, "isFromMe");
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "timestamp"));
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v129 = v115;
            *(_WORD *)&v129[4] = 2112;
            *(_QWORD *)&v129[6] = v54;
            *(_WORD *)&v129[14] = 1024;
            *(_DWORD *)&v129[16] = v55;
            LOWORD(v130) = 2112;
            *(_QWORD *)((char *)&v130 + 2) = v56;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "#swy, rehydrate,attribution[[%d],identifier,%@,fromMe,%d,timestamp,%@", buf, 0x22u);

          }
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "sender"));

          if (v57)
          {
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "sender"));
            v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "contact"));
            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "identifier"));
            -[NSMutableArray addObject:](v108, "addObject:", v60);

          }
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "relatedPersons"));

          if (v61)
          {
            v121 = 0u;
            v122 = 0u;
            v119 = 0u;
            v120 = 0u;
            v118 = v31;
            v117 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "relatedPersons"));
            v62 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v119, v127, 16);
            if (v62)
            {
              v63 = v62;
              v64 = *(_QWORD *)v120;
              do
              {
                for (i = 0; i != v63; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v120 != v64)
                    objc_enumerationMutation(v117);
                  v66 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * (_QWORD)i);
                  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "contact"));
                  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "identifier"));
                  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "sender"));
                  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "contact"));
                  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "identifier"));
                  v72 = objc_msgSend(v68, "isEqualToString:", v71);

                  if ((v72 & 1) == 0)
                  {
                    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "contact"));
                    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "identifier"));
                    -[NSMutableArray addObject:](v116, "addObject:", v74);

                  }
                }
                v63 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v119, v127, 16);
              }
              while (v63);
            }

            v9 = v107;
            v11 = v112;
            v31 = v118;
          }
          if ((v114 & 1) != 0)
            v29 = 1;
          else
            v29 = objc_msgSend(v31, "isFromMe");
          if (objc_msgSend(v31, "isFromMe"))
          {
            v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "sender"));
            v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "contact"));
            v77 = objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "identifier"));

            v110 = (void *)v77;
          }
          if ((objc_msgSend(v11, "itemIsPinned") & 1) != 0)
            v78 = 1;
          else
            v78 = (uint64_t)objc_msgSend(v31, "isPinned");
          objc_msgSend(v11, "setItemIsPinned:", v78);
          v30 = v113 + 1;
        }
        while ((id)(v113 + 1) != v111);
        v111 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v131, 16);
      }
      while (v111);
    }
    else
    {
      v110 = 0;
      v29 = 0;
    }

    v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v108));
    -[NSMutableArray removeAllObjects](v108, "removeAllObjects");
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "allObjects"));
    -[NSMutableArray addObjectsFromArray:](v108, "addObjectsFromArray:", v81);

    v82 = v116;
    v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v116));
    -[NSMutableArray removeAllObjects](v116, "removeAllObjects");
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "allObjects"));
    -[NSMutableArray addObjectsFromArray:](v116, "addObjectsFromArray:", v84);

    objc_msgSend(v11, "setItemSenders:", v108);
    objc_msgSend(v11, "setItemRecipients:", v116);
    if (v110)
    {
      v85 = -[NSMutableArray containsObject:](v116, "containsObject:");
      if ((v29 & v85 & 1) != 0)
      {
        v86 = 3;
LABEL_56:
        objc_msgSend(v11, "setItemShareDirection:", v86);
        v87 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
        v88 = objc_claimAutoreleasedReturnValue(v87);
        if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
        {
          v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "slHighlight"));
          v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "identifier"));
          v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "itemSenders"));
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v129 = v90;
          *(_WORD *)&v129[8] = 2112;
          *(_QWORD *)&v129[10] = v91;
          _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_INFO, "#swy,identifier,%@,has senders, %@", buf, 0x16u);

          v9 = v107;
          v82 = v116;
        }

        v92 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
        v93 = objc_claimAutoreleasedReturnValue(v92);
        if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
        {
          v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "slHighlight"));
          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "identifier"));
          v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "itemRecipients"));
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v129 = v95;
          *(_WORD *)&v129[8] = 2112;
          *(_QWORD *)&v129[10] = v96;
          _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "#swy,identifier,%@,has recipients, %@", buf, 0x16u);

          v9 = v107;
          v82 = v116;
        }

        v97 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
        v98 = objc_claimAutoreleasedReturnValue(v97);
        if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
        {
          v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "slHighlight"));
          v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "identifier"));
          v101 = objc_msgSend(v112, "itemShareDirection");
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v129 = v100;
          *(_WORD *)&v129[8] = 2048;
          *(_QWORD *)&v129[10] = v101;
          _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_INFO, "#swy,identifier,%@,itemShareDirection, %lu", buf, 0x16u);

          v82 = v116;
        }

        v79 = v112;
        v10 = v103;
        v3 = v104;
        goto LABEL_63;
      }
    }
    else
    {
      v85 = 0;
    }
    if (v29 ^ 1 | v85)
      v86 = 2;
    else
      v86 = 1;
    goto LABEL_56;
  }
  v79 = &__NSArray0__struct;
LABEL_65:

  return v79;
}

- (id)redactURL:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v5 = (unint64_t)objc_msgSend(v4, "length");
    if (v5 >> 1 >= 5)
      v6 = 5;
    else
      v6 = v5 >> 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringToIndex:", v6));
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%lu"), v7, objc_msgSend(v4, "hash")));

  }
  else
  {
    v8 = v4;
  }

  return v8;
}

- (void)updateSharedContentsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v7 = a4;
  if (-[MOSharedWithYouManager _sharedWithYouEnabled](self, "_sharedWithYouEnabled"))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __70__MOSharedWithYouManager_updateSharedContentsDeletedAtSource_handler___block_invoke;
    v8[3] = &unk_1002ADA40;
    v9 = v7;
    -[MOSharedWithYouManager _updateSharedContentsDeletedAtSource:handler:](self, "_updateSharedContentsDeletedAtSource:handler:", v6, v8);
    -[MOSharedWithYouManager waitForQueueEmpty](self, "waitForQueueEmpty");

  }
  else
  {
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, &__NSDictionary0__struct);
  }

}

uint64_t __70__MOSharedWithYouManager_updateSharedContentsDeletedAtSource_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updateSharedContentsDeletedAtSource:(id)a3 handler:(id)a4
{
  id os_log;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MORehydrationThresholdMetrics *v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  MORehydrationMetrics *v25;
  void *v26;
  id v27;
  void *v28;
  MORehydrationMetrics *v29;
  id v30;
  id v31;
  void *v32;
  MORehydrationMetrics *v33;
  id v34;
  NSObject *v35;
  MORehydrationMetrics *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v44;
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  MORehydrationMetrics *v49;
  id v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  _QWORD v58[6];
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint8_t buf[8];
  uint8_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint8_t v71[4];
  id v72;
  _BYTE v73[128];

  v45 = a3;
  v42 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#swy,_updateSharedContentsDeletedAtSource", buf, 2u);
  }

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "getDurationOfMOEventArray"));
  *(_QWORD *)buf = 0;
  v66 = buf;
  v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__17;
  v69 = __Block_byref_object_dispose__17;
  v70 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__17;
  v63 = __Block_byref_object_dispose__17;
  v64 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "startDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "endDate"));
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = __71__MOSharedWithYouManager__updateSharedContentsDeletedAtSource_handler___block_invoke;
  v58[3] = &unk_1002AEB08;
  v58[4] = buf;
  v58[5] = &v59;
  -[MOSharedWithYouManager fetchSharedContentBetweenStartDate:EndDate:CompletionHandler:](self, "fetchSharedContentBetweenStartDate:EndDate:CompletionHandler:", v7, v8, v58);

  -[MOSharedWithYouManager waitForQueueEmpty](self, "waitForQueueEmpty");
  if (*((_QWORD *)v66 + 5))
  {
    v47 = objc_alloc_init((Class)NSMutableArray);
    v46 = objc_alloc_init((Class)NSMutableArray);
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v9 = v45;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v54 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
          v14 = (void *)*((_QWORD *)v66 + 5);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifierFromProvider", v42));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v15));

          if (v16)
          {
            if (objc_msgSend(v13, "rehydrationFailCount"))
            {
              v17 = -[MORehydrationThresholdMetrics initWithCategory:provider:failureCount:]([MORehydrationThresholdMetrics alloc], "initWithCategory:provider:failureCount:", objc_msgSend(v13, "category"), objc_msgSend(v13, "provider"), objc_msgSend(v13, "rehydrationFailCount"));
              v52 = 0;
              -[MORehydrationThresholdMetrics submitMetricsWithError:](v17, "submitMetricsWithError:", &v52);
              v18 = v52;
              objc_msgSend(v13, "setRehydrationFailCount:", 0);
              objc_msgSend(v47, "addObject:", v13);

            }
          }
          else
          {
            objc_msgSend(v13, "setRehydrationFailCount:", (char *)objc_msgSend(v13, "rehydrationFailCount") + 1);
            objc_msgSend(v46, "addObject:", v13);
          }

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
      }
      while (v10);
    }

    v19 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = objc_msgSend(v46, "count");
      *(_DWORD *)v71 = 134217984;
      v72 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "#swy,%ld shared content item(s) failed rehydration, therefore update rehydration failure count.", v71, 0xCu);
    }

    v22 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = objc_msgSend(v47, "count");
      *(_DWORD *)v71 = 134217984;
      v72 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "#swy,%ld previously rehydration failed shared content item(s) now are found, therefore change rehydration failure count.", v71, 0xCu);
    }

    v25 = [MORehydrationMetrics alloc];
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
    v27 = objc_msgSend(v26, "category");
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
    v29 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v25, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v27, objc_msgSend(v28, "provider"), 1, 0, objc_msgSend(v9, "count"), 1, (double)(int)objc_msgSend(v46, "count"), (double)(int)objc_msgSend(v47, "count"));

    v51 = 0;
    -[MORehydrationMetrics submitMetricsWithError:](v29, "submitMetricsWithError:", &v51);
    v30 = v51;
    v31 = objc_msgSend(v46, "copy");
    objc_msgSend(v47, "addObjectsFromArray:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MOSharedWithYouManager momentStore](self, "momentStore"));
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = __71__MOSharedWithYouManager__updateSharedContentsDeletedAtSource_handler___block_invoke_111;
    v48[3] = &unk_1002AEB58;
    v33 = (MORehydrationMetrics *)v47;
    v49 = v33;
    v50 = v42;
    objc_msgSend(v32, "storeEvents:CompletionHandler:", v33, v48);

  }
  else
  {
    v34 = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v71 = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "#swy,nil query result from shared content fetching, no events updated.", v71, 2u);
    }

    if (v42)
      (*((void (**)(id, uint64_t, void *))v42 + 2))(v42, v60[5], &__NSDictionary0__struct);
    v36 = [MORehydrationMetrics alloc];
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "firstObject"));
    v38 = objc_msgSend(v37, "category");
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "firstObject"));
    v40 = objc_msgSend(v39, "provider");
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v60[5], "description"));
    v33 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v36, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v38, v40, 0, v41, objc_msgSend(v45, "count"), 1, (double)(int)objc_msgSend(v45, "count"), 0.0);

    v57 = 0;
    -[MORehydrationMetrics submitMetricsWithError:](v33, "submitMetricsWithError:", &v57);
  }

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(buf, 8);

}

void __71__MOSharedWithYouManager__updateSharedContentsDeletedAtSource_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a2;
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "slHighlight"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v14);

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v6;

}

void __71__MOSharedWithYouManager__updateSharedContentsDeletedAtSource_handler___block_invoke_111(uint64_t a1, void *a2, void *a3)
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
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySharedWithYou);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __71__MOSharedWithYouManager__updateSharedContentsDeletedAtSource_handler___block_invoke_111_cold_1(a1, (uint64_t)v5, v9);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "count");
    v12 = 134217984;
    v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "#swy,update %ld shared content event(s) in database succeeded!", (uint8_t *)&v12, 0xCu);
  }

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);

}

- (void)waitForQueueEmpty
{
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_112);
}

- (OS_dispatch_semaphore)swySemaphore
{
  return self->_swySemaphore;
}

- (void)setSwySemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_swySemaphore, a3);
}

- (MOEventStore)momentStore
{
  return self->_momentStore;
}

- (void)setMomentStore:(id)a3
{
  objc_storeStrong((id *)&self->_momentStore, a3);
}

- (void)setSwHighlightCenter:(id)a3
{
  objc_storeStrong((id *)&self->_swHighlightCenter, a3);
}

- (BOOL)highlightsCacheNotificationPending
{
  return self->_highlightsCacheNotificationPending;
}

- (void)setHighlightsCacheNotificationPending:(BOOL)a3
{
  self->_highlightsCacheNotificationPending = a3;
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
  objc_storeStrong((id *)&self->_swHighlightCenter, 0);
  objc_storeStrong((id *)&self->_momentStore, 0);
  objc_storeStrong((id *)&self->_swySemaphore, 0);
}

- (void)initWithUniverse:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "Invalid parameter not satisfying: [universe getService:NSStringFromClass([MOEventStore class])]", a5, a6, a7, a8, 0);
}

- (void)initWithUniverse:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "Invalid parameter not satisfying: configurationManager", a5, a6, a7, a8, 0);
}

- (void)saveHighlights:(os_log_t)log handler:.cold.1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(_QWORD *)(buf + 4) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#swy,eventsToSave count,%ld", buf, 0xCu);
}

- (void)saveHighlights:(uint64_t)a3 handler:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "#swy,fetching previous saved shared content for deduplication failed: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __49__MOSharedWithYouManager_saveHighlights_handler___block_invoke_98_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "#swy,saving shared content events into database failed with error, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __71__MOSharedWithYouManager__updateSharedContentsDeletedAtSource_handler___block_invoke_111_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;

  v5 = objc_msgSend(*(id *)(a1 + 32), "count");
  v6 = 134218242;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "#swy,update %ld shared content event(s) in database failed, error %@", (uint8_t *)&v6, 0x16u);
}

@end
