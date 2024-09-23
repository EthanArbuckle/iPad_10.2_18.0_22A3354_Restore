@implementation OfflineMapsSuggestionsDataProvider

- (OfflineMapsSuggestionsDataProvider)initWithClientType:(int)a3 callbackQueue:(id)a4
{
  id v7;
  OfflineMapsSuggestionsDataProvider *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *msgEngineQueue;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *insightsQueue;
  MapsSuggestionsMKLocationManagerAdapter *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  MapsSuggestionsEngine *engine;
  objc_super v29;

  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)OfflineMapsSuggestionsDataProvider;
  v8 = -[OfflineMapsSuggestionsDataProvider init](&v29, "init");
  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_create("com.apple.Maps.Home.OfflineMapsSuggestionsDataProviderMSgEngineQueue", v10);
    msgEngineQueue = v8->_msgEngineQueue;
    v8->_msgEngineQueue = (OS_dispatch_queue *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_create("com.apple.Maps.Home.OfflineMapsSuggestionsDataProviderInsightsQueue", v14);
    insightsQueue = v8->_insightsQueue;
    v8->_insightsQueue = (OS_dispatch_queue *)v15;

    v17 = objc_alloc_init(MapsSuggestionsMKLocationManagerAdapter);
    v18 = objc_alloc((Class)NSSet);
    v19 = objc_alloc_init((Class)MapsSuggestionsFlightDeparturesOnlyFilter);
    v20 = objc_alloc_init((Class)MapsSuggestionsFlightTooFarFilter);
    v21 = objc_msgSend(v18, "initWithObjects:", v19, v20, 0);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSuggestionsEngineBuilder forDevice](MapsSuggestionsEngineBuilder, "forDevice"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "withLocationUpdater:", v17));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "withoutTracker"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "withoutPreFilters:", v21));

    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "build"));
    engine = v8->_engine;
    v8->_engine = (MapsSuggestionsEngine *)v26;

    objc_storeStrong((id *)&v8->_callbackQueue, a4);
    *(_WORD *)&v8->_tripTipDismissedThisSession = 0;
    v8->_clientType = a3;
  }

  return v8;
}

- (void)offlineSuggestions:(id)a3
{
  -[OfflineMapsSuggestionsDataProvider offlineSuggestionsForLocation:completion:](self, "offlineSuggestionsForLocation:completion:", 0, a3);
}

- (void)offlineSuggestionsForLocation:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  id v15;
  id v16;
  NSObject *v17;
  const char *v18;
  id v19;
  NSObject *callbackQueue;
  void (**v21)(id, _QWORD);
  _QWORD block[4];
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  id v27;
  id buf;
  _QWORD v29[4];
  NSObject *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD v33[4];
  NSObject *v34;
  _QWORD *v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if ((GEOSupportsOfflineMaps(v7, v8) & 1) == 0)
    v7[2](v7, 0);
  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  dispatch_group_enter(v9);
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = sub_1008D44F8;
  v40[4] = sub_1008D4508;
  v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = sub_1008D44F8;
  v38[4] = sub_1008D4508;
  v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = sub_1008D44F8;
  v36[4] = sub_1008D4508;
  v37 = 0;
  if (-[OfflineMapsSuggestionsDataProvider _tripTipWasDismissed](self, "_tripTipWasDismissed"))
  {
    v10 = sub_100431D5C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      v12 = "Future trip tip was dismissed, no reason to look up trips in MSg Insights.";
      v13 = v11;
      v14 = OS_LOG_TYPE_INFO;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    if (self->_clientType != 3)
    {
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1008D4510;
      v33[3] = &unk_1011DB118;
      v35 = v40;
      v34 = v9;
      -[OfflineMapsSuggestionsDataProvider _firstUpcomingTripOfflineSuggestion:](self, "_firstUpcomingTripOfflineSuggestion:", v33);

      goto LABEL_12;
    }
    v15 = sub_100431D5C();
    v11 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      v12 = "Client type does not consider trips";
      v13 = v11;
      v14 = OS_LOG_TYPE_DEBUG;
      goto LABEL_9;
    }
  }

  dispatch_group_leave(v9);
LABEL_12:
  if (!-[OfflineMapsSuggestionsDataProvider _homeAreaTipWasDismissed](self, "_homeAreaTipWasDismissed"))
    goto LABEL_21;
  if (-[OfflineMapsSuggestionsDataProvider _tripTipWasDismissed](self, "_tripTipWasDismissed"))
  {
    v16 = sub_100431D5C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      v18 = "Both the Offline Maps trip tip and home area tip were dismissed, No reason to run MSg engine.";
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, v18, (uint8_t *)&buf, 2u);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  if (self->_clientType != 3)
  {
LABEL_21:
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1008D45B0;
    v29[3] = &unk_1011DB140;
    v31 = v36;
    v32 = v38;
    v30 = v9;
    -[OfflineMapsSuggestionsDataProvider _offlineSuggestionsUsingLocation:withCompletion:](self, "_offlineSuggestionsUsingLocation:withCompletion:", v6, v29);

    goto LABEL_22;
  }
  v19 = sub_100431D5C();
  v17 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    v18 = "The Offline Maps home area tip were dismissed, and client type should not consider trips. No reason to run MSg engine.";
    goto LABEL_19;
  }
LABEL_20:

  dispatch_group_leave(v9);
LABEL_22:
  objc_initWeak(&buf, self);
  callbackQueue = self->_callbackQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008D4630;
  block[3] = &unk_1011DB168;
  objc_copyWeak(&v27, &buf);
  v25 = v40;
  v26 = v36;
  v23 = v7;
  v24 = v38;
  v21 = v7;
  dispatch_group_notify(v9, callbackQueue, block);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&buf);
  _Block_object_dispose(v36, 8);

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);

}

- (void)dismissedTipWithType:(int)a3
{
  int clientType;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  const char *v10;
  void *v11;
  uint64_t *v12;
  void *v13;
  _DWORD v14[2];

  clientType = self->_clientType;
  v6 = sub_100431D5C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (clientType == 1)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v14[0] = 67109120;
      v14[1] = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Setting dismissal date for Offline Maps tip type: %d", (uint8_t *)v14, 8u);
    }

    switch(a3)
    {
      case 0:
        v9 = sub_100431D5C();
        v8 = objc_claimAutoreleasedReturnValue(v9);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          goto LABEL_10;
        LOWORD(v14[0]) = 0;
        v10 = "Unknown type passed to dismissedTipWithType, this should never happen.";
        goto LABEL_9;
      case 1:
        self->_homeAreaTipDismissedThisSession = 1;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
        GEOConfigSetSyncDate(MapsConfig_OfflineMapsHomeAreaTipDismissalDate, off_1014B4558, v11);

        v12 = &MapsConfig_OfflineMapsHomeAreaTipFirstDisplayDate;
        goto LABEL_14;
      case 2:
        self->_tripTipDismissedThisSession = 1;
        goto LABEL_13;
      case 3:
LABEL_13:
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
        GEOConfigSetSyncDate(MapsConfig_OfflineMapsPreArrivalTipDismissalDate, off_1014B44F8, v13);

        v12 = &MapsConfig_OfflineMapsPreArrivalTipFirstDisplayDate;
LABEL_14:
        GEOConfigSetSyncDate(*v12, v12[1], 0);
        break;
      default:
        return;
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14[0]) = 0;
      v10 = "This OfflineMapsSuggestionsDataProvider is not being used for tips, this method should not be called.";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v10, (uint8_t *)v14, 2u);
    }
LABEL_10:

  }
}

- (void)displayedTipWithType:(int)a3
{
  int clientType;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  const char *v9;
  uint64_t *v10;
  uint64_t Date;
  id v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  id v16;
  _DWORD v17[2];

  clientType = self->_clientType;
  v5 = sub_100431D5C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (clientType == 1)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v17[0] = 67109120;
      v17[1] = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Offline Maps Tip with type %d was displayed", (uint8_t *)v17, 8u);
    }

    if (a3 == 2)
    {
      v10 = &MapsConfig_OfflineMapsPreArrivalTipFirstDisplayDate;
      Date = GEOConfigGetDate(MapsConfig_OfflineMapsPreArrivalTipFirstDisplayDate, off_1014B4508);
      v7 = objc_claimAutoreleasedReturnValue(Date);
      if (v7)
      {
        v12 = sub_100431D5C();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          LOWORD(v17[0]) = 0;
          v14 = "Trip Tip first display date is already set.";
LABEL_18:
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v14, (uint8_t *)v17, 2u);
        }
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      if (a3 != 1)
      {
        if (a3)
          return;
        v8 = sub_100431D5C();
        v7 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v17[0]) = 0;
          v9 = "Unknown type passed to displayedTipWithType, this should never happen.";
LABEL_11:
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v9, (uint8_t *)v17, 2u);
          goto LABEL_21;
        }
        goto LABEL_21;
      }
      v10 = &MapsConfig_OfflineMapsHomeAreaTipFirstDisplayDate;
      v15 = GEOConfigGetDate(MapsConfig_OfflineMapsHomeAreaTipFirstDisplayDate, off_1014B4568);
      v7 = objc_claimAutoreleasedReturnValue(v15);
      if (v7)
      {
        v16 = sub_100431D5C();
        v13 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          LOWORD(v17[0]) = 0;
          v14 = "Home Area Tip first display date is already set.";
          goto LABEL_18;
        }
        goto LABEL_20;
      }
    }
    v13 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    GEOConfigSetDate(*v10, v10[1], v13);
    goto LABEL_20;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v17[0]) = 0;
    v9 = "This OfflineMapsSuggestionsDataProvider is not being used for tips, this method should not be called.";
    goto LABEL_11;
  }
LABEL_21:

}

- (void)showHomeAreaTipInFuture
{
  int clientType;
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  clientType = self->_clientType;
  v3 = sub_100431D5C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (clientType == 3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "User tapped \"Remind Me Later\" on Offline Maps welcome screen, home area tip will show after two weeks pass.", v6, 2u);
    }

    v5 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    GEOConfigSetDate(MapsConfig_OfflineMapsHomeAreaTipRemindMeLaterDate, off_1014B4538, v5);
    GEOConfigSetDate(MapsConfig_OfflineMapsHomeAreaTipDismissalDate, off_1014B4558, 0);
    GEOConfigSetDate(MapsConfig_OfflineMapsHomeAreaTipFirstDisplayDate, off_1014B4568, 0);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "This OfflineMapsSuggestionsDataProvider is not being used for the welcome screen, this method should not be called.", buf, 2u);
  }

}

- (id)fetchHomeLocationsAsShortCuts
{
  NSObject *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void ***v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t UInteger;
  id v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  NSObject *v20;
  id v21;

  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  dispatch_group_enter(v2);
  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = sub_100B3A5D4();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "oneFavorites"));

  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_1008D4ED0;
  v19 = &unk_1011AE6F0;
  v20 = v2;
  v21 = v3;
  v7 = v3;
  v8 = v2;
  v9 = objc_retainBlock(&v16);
  objc_msgSend(v6, "loadAllShortcutsWithHandler:", v9, v16, v17, v18, v19);
  v10 = sub_100B3A5D4();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "oneRoutine"));

  UInteger = GEOConfigGetUInteger(MapsConfig_OfflineMapsHomeCoreRoutineMinimumVisitCount, off_1014B45A8);
  objc_msgSend(v12, "fetchSuggestedShortcutsForType:minVisits:maxAge:handler:", 2, UInteger, v9, (double)(unint64_t)GEOConfigGetUInteger(MapsConfig_OfflineMapsHomeCoreRoutineMaximumAge, off_1014B45B8));
  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v14 = objc_msgSend(v7, "copy");

  return v14;
}

- (BOOL)isTrip:(id)a3 nearAtLeastOneShortcut:(id)a4
{
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
  void *v15;
  double v16;
  double v17;
  double Integer;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v5 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "placemark", (_QWORD)v21));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "location"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "geoMapItem"));
        v14 = MapsSuggestionsLocationForMapItem(v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        objc_msgSend(v12, "distanceFromLocation:", v15);
        v17 = v16;

        Integer = (double)GEOConfigGetInteger(MapsConfig_OfflineMapsTipDefaultRegionRadius, off_1014B4518);
        if (v17 > 0.0 && v17 < Integer)
        {
          LOBYTE(v7) = 1;
          goto LABEL_14;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_14:

  return (char)v7;
}

- (void)_firstUpcomingTripOfflineSuggestion:(id)a3
{
  id v4;
  NSObject *insightsQueue;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  insightsQueue = self->_insightsQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1008D52EC;
  v7[3] = &unk_1011B0300;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(insightsQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_fetchAirportArrivalModelDataFromFlightEntry:(id)a3 usingCurrentLocation:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  int v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  char IsValidLocation;
  id v30;
  NSObject *v31;
  _BOOL4 v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  id v42;
  id v43;
  NSObject *v44;
  double v45;
  double v46;
  double Double;
  id v48;
  NSObject *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  NSObject *v56;
  _QWORD v57[4];
  id v58;
  void (**v59)(id, _QWORD);
  uint8_t buf[4];
  double v61;
  __int16 v62;
  double v63;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver"));
  v12 = objc_msgSend(v11, "isCellConnection");

  if (v12)
  {
    v13 = sub_100431D5C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v15 = "Airport Arrival Tip: User has a cellular data connection, not constructing tip.";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v15, buf, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver"));
  v17 = objc_msgSend(v16, "isNetworkReachable");

  if ((v17 & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "latLng"));
    objc_msgSend(v18, "lat");
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "latLng"));
    objc_msgSend(v21, "lng");
    v23 = v22;

    v24 = CLLocationFromGEOLocationCoordinate2D(v20, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    if ((((uint64_t (*)(void))MapsSuggestionsIsValidLocation)() & 1) != 0)
    {
      v26 = v25;
    }
    else
    {
      v28 = MapsSuggestionsCurrentBestLocation();
      v26 = (void *)objc_claimAutoreleasedReturnValue(v28);

      IsValidLocation = MapsSuggestionsIsValidLocation(v26);
      v30 = sub_100431D5C();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      v32 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);
      if ((IsValidLocation & 1) == 0)
      {
        if (v32)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "The location from DiscoverySource is nil AND MapsSuggestionsCurrentBestLocation() is nil too. Returning and not showing the tip.", buf, 2u);
        }

        v10[2](v10, 0);
        goto LABEL_33;
      }
      if (v32)
      {
        objc_msgSend(v26, "coordinate");
        v34 = v33;
        objc_msgSend(v26, "coordinate");
        *(_DWORD *)buf = 134218240;
        v61 = v34;
        v62 = 2048;
        v63 = v35;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Location from the DiscoverySource is nil. Using MapsSuggestionsCurrentBestLocation(): %f, %f", buf, 0x16u);
      }

    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "numberForKey:", CFSTR("MapsSuggestionsFlightArrivalAirportLatitudeKey")));
    objc_msgSend(v36, "doubleValue");
    v38 = v37;

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "numberForKey:", CFSTR("MapsSuggestionsFlightArrivalAirportLongitudeKey")));
    objc_msgSend(v39, "doubleValue");
    v41 = v40;

    v42 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", v38, v41);
    v43 = sub_100431D5C();
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v61 = v38;
      v62 = 2048;
      v63 = v41;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Airport Arrival Tip: Arrival airport lat/long is %f, %f", buf, 0x16u);
    }

    objc_msgSend(v42, "distanceFromLocation:", v26);
    v46 = v45;
    Double = GEOConfigGetDouble(GEOConfigNavdAirportArrivalAnnouncerInsideAirportThreshold[0], GEOConfigNavdAirportArrivalAnnouncerInsideAirportThreshold[1]);
    v48 = sub_100431D5C();
    v49 = objc_claimAutoreleasedReturnValue(v48);
    v50 = os_log_type_enabled(v49, OS_LOG_TYPE_INFO);
    if (v46 <= Double)
    {
      if (v50)
      {
        *(_DWORD *)buf = 134217984;
        v61 = v46;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "Airport Arrival Tip: User is considered to be at the arrival airport, because they are %f meters from the airport lat/long.", buf, 0xCu);
      }

      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForKey:", CFSTR("MapsSuggestionsFlightArrivalAirportLocalityKey")));
      if (v51)
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("MAPS_OFFLINE_TIP_TITLE_FOR_AIRPORT_ARRIVAL"), CFSTR("localized string not found"), CFSTR("Offline")));

        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472;
        v57[2] = sub_1008D60C4;
        v57[3] = &unk_1011DB208;
        v58 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", v53, v51);
        v59 = v10;
        v54 = v58;
        -[OfflineMapsSuggestionsDataProvider _buildMapRegionForLatitude:longitude:handler:](self, "_buildMapRegionForLatitude:longitude:handler:", v57, v38, v41);

      }
      else
      {
        v55 = sub_100431D5C();
        v56 = objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "Airport Arrival Tip: MapsSuggestionsFlightArrivalAirportLocalityKey is nil, not showing airport arrival tip.", buf, 2u);
        }

        v10[2](v10, 0);
      }

    }
    else
    {
      if (v50)
      {
        *(_DWORD *)buf = 134217984;
        v61 = v46;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "Airport Arrival Tip: User is %f meters from the airport lat/long, which is too far for an airport arrival tip.", buf, 0xCu);
      }

      v10[2](v10, 0);
    }

LABEL_33:
    goto LABEL_34;
  }
  v27 = sub_100431D5C();
  v14 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v15 = "Airport Arrival Tip: Network is not reachable (user is not connected to WiFi), not constructing tip.";
    goto LABEL_9;
  }
LABEL_10:

  v10[2](v10, 0);
LABEL_34:

}

- (void)_fetchHomeAreaModelDataFromEntry:(id)a3 onQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  uint64_t Date;
  void *v12;
  uint64_t UInteger;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  id *v23;
  id v24;
  id v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  NSObject *v37;
  id v38;
  void *v39;
  _QWORD v40[4];
  _QWORD v41[2];
  id v42;
  id v43;
  _QWORD block[4];
  id v45;
  uint8_t buf[4];
  uint64_t v47;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  Date = GEOConfigGetDate(MapsConfig_OfflineMapsHomeAreaTipRemindMeLaterDate, off_1014B4538);
  v12 = (void *)objc_claimAutoreleasedReturnValue(Date);
  UInteger = GEOConfigGetUInteger(MapsConfig_OfflineMapsHomeAreaTipRemindMeLaterWindow, off_1014B4548);
  if (self->_clientType != 1)
    goto LABEL_7;
  v14 = UInteger;
  if (!v12)
    goto LABEL_4;
  v39 = v12;
  v15 = v12;
  v16 = objc_alloc_init((Class)NSDateComponents);
  objc_msgSend(v16, "setDay:", -v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dateByAddingComponents:toDate:options:", v16, v18, 0));

  v20 = objc_msgSend(v15, "compare:", v19);
  v12 = v39;

  if (v20 == (id)-1)
  {
LABEL_7:
    v25 = sub_100431D5C();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "geoMapItem"));
      objc_msgSend(v27, "coordinate");
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%+.8f, %+.8f"), v28, v29));
      *(_DWORD *)buf = 138412290;
      v47 = (uint64_t)v30;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Using home entry for the Offline Maps Home Area Tip with lat/long of %@", buf, 0xCu);

    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "geoMapItem"));
    objc_msgSend(v31, "coordinate");
    v33 = v32;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "geoMapItem"));
    objc_msgSend(v34, "coordinate");
    v36 = v35;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1008D667C;
    v40[3] = &unk_1011DB258;
    v23 = (id *)v41;
    v37 = v9;
    v43 = v10;
    v41[0] = v37;
    v41[1] = self;
    v42 = v8;
    v38 = v10;
    -[OfflineMapsSuggestionsDataProvider _buildMapRegionForLatitude:longitude:handler:](self, "_buildMapRegionForLatitude:longitude:handler:", v40, v33, v36);

  }
  else
  {
LABEL_4:
    v21 = sub_100431D5C();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v47 = v14;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "User has either never tapped \"Remind Me Later\" for the Home Area tip or tapped it less than %lu days ago.", buf, 0xCu);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1008D666C;
    block[3] = &unk_1011ADA00;
    v23 = &v45;
    v45 = v10;
    v24 = v10;
    dispatch_async(v9, block);
  }

}

- (id)_filterEntriesWithOverLappingRects:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  id obj;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v3;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v34;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v5);
        v7 = objc_alloc_init((Class)NSMutableArray);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v8 = objc_msgSend(v4, "copy");
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v30;
          while (2)
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v30 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v12);
              v28 = 0.0;
              MapsSuggestionsDistanceBetweenEntries(v6, v13, &v28);
              v14 = v28;
              if (v14 <= (double)GEOConfigGetInteger(MapsConfig_OfflineMapsTipDefaultRegionRadius, off_1014B4518))
              {
                if (objc_msgSend(v13, "type") == (id)1)
                {

                  goto LABEL_26;
                }
                if (objc_msgSend(v6, "type") == (id)1)
                  objc_msgSend(v7, "addObject:", v6);
              }
              v12 = (char *)v12 + 1;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
            if (v10)
              continue;
            break;
          }
        }

        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v15 = v7;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v25;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v25 != v18)
                objc_enumerationMutation(v15);
              objc_msgSend(v4, "removeObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v19));
              v19 = (char *)v19 + 1;
            }
            while (v17 != v19);
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
          }
          while (v17);
        }

        objc_msgSend(v4, "addObject:", v6);
LABEL_26:

        v5 = (char *)v5 + 1;
      }
      while (v5 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v23);
  }

  return v4;
}

- (void)_offlineSuggestionsUsingLocation:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  MapsSuggestionsEngine *engine;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD *v14;
  id v15;
  char v16;
  _QWORD v17[3];
  char v18;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  LOBYTE(a4) = self->_clientType != 3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v11[0] = _NSConcreteStackBlock;
  engine = self->_engine;
  v11[2] = sub_1008D716C;
  v11[3] = &unk_1011DB2D0;
  v11[1] = 3221225472;
  objc_copyWeak(&v15, &location);
  v11[4] = self;
  v16 = (char)a4;
  v9 = v6;
  v12 = v9;
  v14 = v17;
  v10 = v7;
  v13 = v10;
  -[MapsSuggestionsEngine oneShotTopSuggestionsForSink:count:transportType:callback:onQueue:](engine, "oneShotTopSuggestionsForSink:count:transportType:callback:onQueue:", self, 10, 4, v11, self->_msgEngineQueue);

  objc_destroyWeak(&v15);
  _Block_object_dispose(v17, 8);
  objc_destroyWeak(&location);

}

- (BOOL)_homeAreaTipWasDismissed
{
  id v2;
  NSObject *v3;
  BOOL v4;
  id v5;
  uint64_t Date;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t UInteger;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  void *v22;
  int v24;
  NSObject *v25;

  if (self->_clientType == 1)
  {
    if (self->_homeAreaTipDismissedThisSession)
    {
      v2 = sub_100431D5C();
      v3 = objc_claimAutoreleasedReturnValue(v2);
      v4 = 1;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "The Offline Maps Home Area tip was already dismissed in this session", (uint8_t *)&v24, 2u);
      }
    }
    else
    {
      Date = GEOConfigGetDate(MapsConfig_OfflineMapsHomeAreaTipDismissalDate, off_1014B4558);
      v3 = objc_claimAutoreleasedReturnValue(Date);
      if (v3)
      {
        v7 = sub_100431D5C();
        v8 = objc_claimAutoreleasedReturnValue(v7);
        v4 = 1;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v24 = 138412290;
          v25 = v3;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Not showing Offline Maps Home Area tip because a Home Area tip was dismissed on %@", (uint8_t *)&v24, 0xCu);
        }
      }
      else
      {
        v9 = GEOConfigGetDate(MapsConfig_OfflineMapsHomeAreaTipFirstDisplayDate, off_1014B4568);
        v8 = objc_claimAutoreleasedReturnValue(v9);
        UInteger = GEOConfigGetUInteger(MapsConfig_OfflineMapsTipAutoDismissTime, off_1014B4578);
        if (!v8)
          goto LABEL_13;
        v11 = UInteger;
        v12 = v8;
        v13 = objc_alloc_init((Class)NSDateComponents);
        objc_msgSend(v13, "setDay:", -v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dateByAddingComponents:toDate:options:", v13, v15, 0));

        v17 = -[NSObject compare:](v12, "compare:", v16);
        if (v17 == (id)-1)
        {
          v20 = sub_100431D5C();
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v24 = 134217984;
            v25 = v11;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Automatically dismissing Offline Maps Home Area tip because user has not interacted with it for %lu days", (uint8_t *)&v24, 0xCu);
          }

          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
          GEOConfigSetDate(MapsConfig_OfflineMapsHomeAreaTipDismissalDate, off_1014B4558, v22);

          GEOConfigSetDate(MapsConfig_OfflineMapsHomeAreaTipFirstDisplayDate, off_1014B4568, 0);
          v4 = 1;
          v8 = v12;
        }
        else
        {
LABEL_13:
          v18 = sub_100431D5C();
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            LOWORD(v24) = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Offline Maps Home Area tip has never been dismissed.", (uint8_t *)&v24, 2u);
          }

          v4 = 0;
        }
      }

    }
  }
  else
  {
    v5 = sub_100431D5C();
    v3 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "This OfflineMapsSuggestionsDataProvider is ignoring dismissal logic, force returning NO in _homeAreaTipWasDismissed.", (uint8_t *)&v24, 2u);
    }
    v4 = 0;
  }

  return v4;
}

- (BOOL)_tripTipWasDismissed
{
  id v2;
  NSObject *v3;
  BOOL v4;
  id v5;
  uint64_t Date;
  id v7;
  NSObject *v8;
  uint64_t UInteger;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  void *v31;
  int v33;
  uint64_t v34;

  if (self->_clientType == 1)
  {
    if (self->_tripTipDismissedThisSession)
    {
      v2 = sub_100431D5C();
      v3 = objc_claimAutoreleasedReturnValue(v2);
      v4 = 1;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        LOWORD(v33) = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "The Offline Maps trip tip was already dismissed in this session", (uint8_t *)&v33, 2u);
      }
    }
    else
    {
      Date = GEOConfigGetDate(MapsConfig_OfflineMapsPreArrivalTipDismissalDate, off_1014B44F8);
      v3 = objc_claimAutoreleasedReturnValue(Date);
      v7 = sub_100431D5C();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v33 = 138412290;
        v34 = (uint64_t)v3;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Checking whether Offline Maps trip tip was dismissed, dismissal date is %@", (uint8_t *)&v33, 0xCu);
      }

      UInteger = GEOConfigGetUInteger(MapsConfig_OfflineMapsTripTipSuppressionWindow, off_1014B4528);
      if (!v3)
        goto LABEL_14;
      v10 = v3;
      v11 = objc_alloc_init((Class)NSDateComponents);
      objc_msgSend(v11, "setDay:", -UInteger);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateByAddingComponents:toDate:options:", v11, v13, 0));

      v15 = -[NSObject compare:](v10, "compare:", v14);
      if (v15 == (id)-1)
      {
LABEL_14:
        v18 = GEOConfigGetDate(MapsConfig_OfflineMapsPreArrivalTipFirstDisplayDate, off_1014B4508);
        v17 = objc_claimAutoreleasedReturnValue(v18);
        v19 = GEOConfigGetUInteger(MapsConfig_OfflineMapsTipAutoDismissTime, off_1014B4578);
        if (!v17)
          goto LABEL_16;
        v20 = v19;
        v21 = v17;
        v22 = objc_alloc_init((Class)NSDateComponents);
        objc_msgSend(v22, "setDay:", -v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "dateByAddingComponents:toDate:options:", v22, v24, 0));

        v26 = -[NSObject compare:](v21, "compare:", v25);
        if (v26 == (id)-1)
        {
          v29 = sub_100431D5C();
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            v33 = 134217984;
            v34 = v20;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Automatically dismissing Offline Maps trip tip because user has not interacted with it for %lu days", (uint8_t *)&v33, 0xCu);
          }

          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
          GEOConfigSetDate(MapsConfig_OfflineMapsPreArrivalTipDismissalDate, off_1014B44F8, v31);

          GEOConfigSetDate(MapsConfig_OfflineMapsPreArrivalTipFirstDisplayDate, off_1014B4508, 0);
          v4 = 1;
          v17 = v21;
        }
        else
        {
LABEL_16:
          v27 = sub_100431D5C();
          v28 = objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            v33 = 134217984;
            v34 = UInteger;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Offline Maps trip tip was NOT dismissed in the past %lu days", (uint8_t *)&v33, 0xCu);
          }

          v4 = 0;
        }
      }
      else
      {
        v16 = sub_100431D5C();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        v4 = 1;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          LOWORD(v33) = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Not showing Offline Maps trip tip because a trip tip was dismissed in the past six months.", (uint8_t *)&v33, 2u);
        }
      }

    }
  }
  else
  {
    v5 = sub_100431D5C();
    v3 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v33) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "This OfflineMapsSuggestionsDataProvider is ignoring dismissal logic, force returning NO in _tripTipWasDismissed.", (uint8_t *)&v33, 2u);
    }
    v4 = 0;
  }

  return v4;
}

- (void)_buildMapRegionForLatitude:(double)a3 longitude:(double)a4 handler:(id)a5
{
  id v8;
  uint64_t Integer;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  unsigned int clientType;
  id v20;
  NSObject *v21;
  int v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  int v29;

  v8 = a5;
  Integer = GEOConfigGetInteger(MapsConfig_OfflineMapsTipDefaultRegionRadius, off_1014B4518);
  v10 = GEOMapRectMakeWithRadialDistance(a3, a4, (double)Integer);
  v14 = objc_msgSend(objc_alloc((Class)GEOMapRegion), "initWithMapRect:", v10, v11, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v16 = objc_msgSend(v15, "isRegionDownloaded:requireFullyDownloaded:coverageRequirement:", v14, 0, GEOConfigGetDouble(MapsConfig_OfflineRegionSuggestionDownloadedAreaCoverageRequirement, off_1014B4FD8));

  if (v16)
  {
    v17 = sub_100431D5C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Map Region that was built was already added, caling back with nil", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  }
  else
  {
    clientType = self->_clientType;
    if (clientType > 3 || clientType == 2)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1008D8050;
      v25[3] = &unk_1011DB2F8;
      v27 = v8;
      v26 = v14;
      v24 = objc_msgSend(v23, "determineEstimatedSizeForSubscriptionWithRegion:completionHandler:", v26, v25);

    }
    else
    {
      v20 = sub_100431D5C();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = self->_clientType;
        *(_DWORD *)buf = 67109120;
        v29 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Purposely not fetching region size for this client type: %d", buf, 8u);
      }

      (*((void (**)(id, id, _QWORD))v8 + 2))(v8, v14, 0);
    }
  }

}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(self), "description");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_insightsQueue, 0);
  objc_storeStrong((id *)&self->_msgEngineQueue, 0);
  objc_storeStrong((id *)&self->_engine, 0);
}

@end
