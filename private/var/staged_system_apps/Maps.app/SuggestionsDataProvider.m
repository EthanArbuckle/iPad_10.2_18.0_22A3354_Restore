@implementation SuggestionsDataProvider

- (SuggestionsDataProvider)initWithViewMode:(int64_t)a3 filter:(id)a4 includePlaceholderShortcuts:(BOOL)a5
{
  id v9;
  SuggestionsDataProvider *v10;
  SuggestionsDataProvider *v11;
  NSArray *suggestions;
  NSArray *shortcuts;
  NSArray *observedSuggestions;
  NSArray *observedShortcuts;
  dispatch_queue_attr_t v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *appConnectionMapsSuggestionsUpdateQueue;
  MapsSuggestionsNetworkRequester *v20;
  MapsSuggestionsNetworkRequester *requester;
  SuggestionsItemSource *v22;
  SuggestionsItemSource *suggestionsItemSource;
  objc_super v25;

  v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)SuggestionsDataProvider;
  v10 = -[SuggestionsDataProvider init](&v25, "init");
  v11 = v10;
  if (v10)
  {
    v10->_viewMode = a3;
    objc_storeStrong((id *)&v10->_filter, a4);
    v11->_includePlaceholderShortcuts = a5;
    suggestions = v11->_suggestions;
    v11->_suggestions = (NSArray *)&__NSArray0__struct;

    shortcuts = v11->_shortcuts;
    v11->_shortcuts = (NSArray *)&__NSArray0__struct;

    observedSuggestions = v11->_observedSuggestions;
    v11->_observedSuggestions = (NSArray *)&__NSArray0__struct;

    observedShortcuts = v11->_observedShortcuts;
    v11->_observedShortcuts = (NSArray *)&__NSArray0__struct;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = dispatch_queue_create("SuggestionsDataProvider.appConnectionSuggestionsUpdateQueue", v17);
    appConnectionMapsSuggestionsUpdateQueue = v11->_appConnectionMapsSuggestionsUpdateQueue;
    v11->_appConnectionMapsSuggestionsUpdateQueue = (OS_dispatch_queue *)v18;

    v20 = (MapsSuggestionsNetworkRequester *)objc_msgSend(objc_alloc((Class)MapsSuggestionsRealNetworkRequester), "initFromResourceDepot:", 0);
    requester = v11->_requester;
    v11->_requester = v20;

    v22 = objc_alloc_init(SuggestionsItemSource);
    suggestionsItemSource = v11->_suggestionsItemSource;
    v11->_suggestionsItemSource = v22;

  }
  return v11;
}

- (void)dealloc
{
  MapsSuggestionsFilter *filter;
  objc_super v4;

  filter = self->_filter;
  if (filter)
    -[MapsSuggestionsEngine removeAdditionalFilter:forSink:](self->_mapsSuggestionsEngine, "removeAdditionalFilter:forSink:", filter, self);
  -[SuggestionsDataProvider _stopFetchingSuggestionsAndNotifyObservers:isDeallocating:](self, "_stopFetchingSuggestionsAndNotifyObservers:isDeallocating:", 0, 1);
  -[SuggestionsDataProvider _updateObservedSuggestionsWithSuggestions:](self, "_updateObservedSuggestionsWithSuggestions:", &__NSArray0__struct);
  -[SuggestionsDataProvider _updateObservedShortcutsWithShortcuts:](self, "_updateObservedShortcutsWithShortcuts:", &__NSArray0__struct);
  v4.receiver = self;
  v4.super_class = (Class)SuggestionsDataProvider;
  -[SuggestionsDataProvider dealloc](&v4, "dealloc");
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;

  if (self->_active != a3)
  {
    v3 = a3;
    self->_active = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v6 = v5;
    if (v3)
    {
      objc_msgSend(v5, "addObserver:selector:name:object:", self, "_addressbookDidChange:", off_1014A94B8, 0);

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v7, "addObserver:selector:name:object:", self, "_willEnterForeground:", UIApplicationWillEnterForegroundNotification, 0);

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v6, "addObserver:selector:name:object:", self, "_didEnterBackground:", UIApplicationDidEnterBackgroundNotification, 0);
    }
    else
    {
      objc_msgSend(v5, "removeObserver:", self);
    }

    -[SuggestionsDataProvider _startOrStopFetchingSuggestionsAsNeededAndNotifyObservers:](self, "_startOrStopFetchingSuggestionsAsNeededAndNotifyObservers:", 0);
  }
}

- (GEOObserverHashTable)observers
{
  GEOObserverHashTable *observers;
  GEOObserverHashTable *v4;
  GEOObserverHashTable *v5;

  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___SuggestionsDataProviderObserver, 0);
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(self), "description");
}

- (void)invalidateForMapsSuggestionsManager:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  NSString *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  v5 = sub_100432EDC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v12, 0x16u);

  }
  -[SuggestionsDataProvider _scheduleFetch](self, "_scheduleFetch");
}

- (id)_createMapsSuggestionEngine
{
  MapsSuggestionsEngine *mapsSuggestionsEngine;
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  MapsSuggestionsFilter *filter;
  MapsThrottler *v18;
  id v19;
  MapsThrottler *v20;
  MapsThrottler *fetchThrottler;
  id v22;
  NSObject *v23;
  NSObject *v24;
  uint8_t v25[8];
  _QWORD v26[4];
  id v27;
  id buf[2];

  mapsSuggestionsEngine = self->_mapsSuggestionsEngine;
  if (mapsSuggestionsEngine)
    return mapsSuggestionsEngine;
  v5 = sub_100432EDC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_signpost_id_generate(v6);

  v8 = sub_100432EDC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CreateMapsSuggestionEngine", ", (uint8_t *)buf, 2u);
  }

  v11 = objc_msgSend(objc_alloc((Class)MapsSuggestionsBlockFilter), "initWithBlock:", &stru_1011B3F28);
  v12 = sub_100B3A5D4();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  v15 = self->_viewMode + 1;
  if (v15 > 7)
    v16 = 1;
  else
    v16 = dword_100E35600[v15];
  objc_msgSend(v13, "setMapType:", v16);
  filter = self->_filter;
  if (filter)
    objc_msgSend(v14, "addAdditionalFilter:forSink:", filter, self);
  objc_msgSend(v14, "addAdditionalFilter:forSink:", v11, self);
  objc_initWeak(buf, self);
  v18 = [MapsThrottler alloc];
  v19 = &_dispatch_main_q;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1003A9C8C;
  v26[3] = &unk_1011B3F50;
  objc_copyWeak(&v27, buf);
  v20 = -[MapsThrottler initWithInitialValue:throttlingInterval:queue:updateHandler:](v18, "initWithInitialValue:throttlingInterval:queue:updateHandler:", &__kCFBooleanTrue, &_dispatch_main_q, v26, 0.0);
  fetchThrottler = self->_fetchThrottler;
  self->_fetchThrottler = v20;

  v22 = sub_100432EDC();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  v24 = v23;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)v25 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, v7, "CreateMapsSuggestionEngine", ", v25, 2u);
  }

  objc_destroyWeak(&v27);
  objc_destroyWeak(buf);

  return v14;
}

- (void)_scheduleFetch
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MapsThrottler value](self->_fetchThrottler, "value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "BOOLValue") ^ 1));
  -[MapsThrottler setValue:](self->_fetchThrottler, "setValue:", v3);

}

- (void)_fetchSuggestionsFromStorageFile
{
  MapsSuggestionsEngine *mapsSuggestionsEngine;
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (self->_attached)
  {
    objc_initWeak(&location, self);
    mapsSuggestionsEngine = self->_mapsSuggestionsEngine;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1003A9E2C;
    v5[3] = &unk_1011AD9D0;
    objc_copyWeak(&v6, &location);
    v4 = &_dispatch_main_q;
    -[MapsSuggestionsEngine topSuggestionsFromStorageFile:sink:count:transportType:callback:onQueue:](mapsSuggestionsEngine, "topSuggestionsFromStorageFile:sink:count:transportType:callback:onQueue:", 0, self, 99, 4, v5, &_dispatch_main_q);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_fetchSuggestionsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  MapsSuggestionsEngine *mapsSuggestionsEngine;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  v5 = v4;
  if (self->_attached)
  {
    objc_initWeak(&location, self);
    mapsSuggestionsEngine = self->_mapsSuggestionsEngine;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1003A9FB0;
    v8[3] = &unk_1011B21F8;
    objc_copyWeak(&v10, &location);
    v9 = v5;
    v7 = &_dispatch_main_q;
    -[MapsSuggestionsEngine topSuggestionsForSink:count:transportType:callback:onQueue:](mapsSuggestionsEngine, "topSuggestionsForSink:count:transportType:callback:onQueue:", self, 99, 4, v8, &_dispatch_main_q);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else if (v4)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }

}

- (void)_processTopSuggestions:(id)a3 error:(id)a4 wasFromStorageFile:(BOOL)a5
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 hasInitialData;
  unsigned int v15;
  unsigned int v16;
  id v17;
  NSArray *v18;
  NSArray *suggestions;
  id v20;
  NSArray *v21;
  NSArray *shortcuts;
  int v23;
  int v24;
  id v25;
  NSObject *v26;
  objc_class *v27;
  NSString *v28;
  id v29;
  NSString *v30;
  id v31;
  __CFString *v32;
  id v33;
  __CFString *v34;
  id v35;
  __CFString *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  _QWORD v41[6];
  _QWORD v42[6];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  __int16 v63;
  void *v64;

  v40 = a3;
  v9 = a4;
  if (self->_attached)
  {
    v49 = 0;
    v50 = &v49;
    v51 = 0x3032000000;
    v52 = sub_1003AA430;
    v53 = sub_1003AA440;
    v54 = 0;
    v43 = 0;
    v44 = &v43;
    v45 = 0x3032000000;
    v46 = sub_1003AA430;
    v47 = sub_1003AA440;
    v48 = 0;
    v41[5] = &v43;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1003AA448;
    v42[3] = &unk_1011B3F78;
    v42[4] = self;
    v42[5] = &v49;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1003AA568;
    v41[3] = &unk_1011B3F78;
    v41[4] = self;
    v38 = v9;
    MapsSuggestionsShortcutSplit(v40, v9, v42, v41);
    if (!self->_includePlaceholderShortcuts)
    {
      v10 = (void *)v44[5];
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1011B3FB8));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "filteredArrayUsingPredicate:", v11));
      v13 = (void *)v44[5];
      v44[5] = v12;

    }
    hasInitialData = self->_hasInitialData;
    if (!self->_hasInitialData)
      self->_hasInitialData = 1;
    v15 = objc_msgSend((id)v50[5], "isEqual:", self->_suggestions, v38);
    v16 = objc_msgSend((id)v44[5], "isEqual:", self->_shortcuts);
    if ((v15 & 1) == 0)
    {
      v17 = sub_1003AA6A4((void *)v50[5]);
      v18 = (NSArray *)objc_claimAutoreleasedReturnValue(v17);
      suggestions = self->_suggestions;
      self->_suggestions = v18;

      -[SuggestionsDataProvider _updateObservedSuggestionsWithSuggestions:](self, "_updateObservedSuggestionsWithSuggestions:", v50[5]);
      if (!a5)
      {
        -[SuggestionsDataProvider _setNeedsSaveMapsSuggestionsEngineState](self, "_setNeedsSaveMapsSuggestionsEngineState");
        -[SuggestionsDataProvider _updateAppConnectionSuggestionsEntriesIfNeeded:](self, "_updateAppConnectionSuggestionsEntriesIfNeeded:", v50[5]);
      }
    }
    if ((v16 & 1) == 0)
    {
      v20 = sub_1003AA6A4((void *)v44[5]);
      v21 = (NSArray *)objc_claimAutoreleasedReturnValue(v20);
      shortcuts = self->_shortcuts;
      self->_shortcuts = v21;

      -[SuggestionsDataProvider _updateObservedShortcutsWithShortcuts:](self, "_updateObservedShortcutsWithShortcuts:", v44[5]);
      if (!a5)
        -[SuggestionsDataProvider _setNeedsSaveMapsSuggestionsEngineState](self, "_setNeedsSaveMapsSuggestionsEngineState");
    }
    v23 = v15 ^ 1;
    v24 = v16 ^ 1;
    v25 = sub_100432EDC();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = (objc_class *)objc_opt_class(self);
      v28 = NSStringFromClass(v27);
      v29 = (id)objc_claimAutoreleasedReturnValue(v28);
      v30 = NSStringFromSelector(a2);
      v31 = (id)objc_claimAutoreleasedReturnValue(v30);
      v32 = sub_10039E4FC(!hasInitialData);
      v33 = (id)objc_claimAutoreleasedReturnValue(v32);
      v34 = sub_10039E4FC(v23);
      v35 = (id)objc_claimAutoreleasedReturnValue(v34);
      v36 = sub_10039E4FC(v24);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      *(_DWORD *)buf = 138413314;
      v56 = v29;
      v57 = 2112;
      v58 = v31;
      v59 = 2112;
      v60 = v33;
      v61 = 2112;
      v62 = v35;
      v63 = 2112;
      v64 = v37;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%@ %@, hasInitialDataChanged = %@, suggestionsChanged = %@, shortcutsChanged = %@", buf, 0x34u);

    }
    if ((!hasInitialData | v23 | v24) == 1)
    {
      -[SuggestionsItemSource setSuggestions:](self->_suggestionsItemSource, "setSuggestions:", v40);
      +[HomeAnalyticsManager captureStateWithShortcuts:](HomeAnalyticsManager, "captureStateWithShortcuts:", self->_shortcuts);
      -[GEOObserverHashTable homeDataProvidingObjectDidUpdate:](self->_observers, "homeDataProvidingObjectDidUpdate:", self);
    }
    _Block_object_dispose(&v43, 8);

    _Block_object_dispose(&v49, 8);
    v9 = v39;
  }

}

- (id)strippedData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSString *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v10 = objc_opt_class(MapsSuggestionsEntry);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        {
          v11 = v9;
          v12 = NSStringFromMapsSuggestionsEntryType(objc_msgSend(v11, "type"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %p"), v13, v11));

          objc_msgSend(v4, "addObject:", v14);
        }
        else
        {
          v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %p"), objc_opt_class(v9), v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue(v15);
          objc_msgSend(v4, "addObject:", v13);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  return v4;
}

- (void)_willEnterForeground:(id)a3
{
  if (self->_active)
    -[SuggestionsDataProvider _startFetchingSuggestionsAndNotifyObservers:](self, "_startFetchingSuggestionsAndNotifyObservers:", 1);
}

- (void)_didEnterBackground:(id)a3
{
  -[SuggestionsDataProvider _startOrStopFetchingSuggestionsAsNeededAndNotifyObservers:](self, "_startOrStopFetchingSuggestionsAsNeededAndNotifyObservers:", 1);
}

- (void)_startOrStopFetchingSuggestionsAsNeededAndNotifyObservers:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;

  v3 = a3;
  v5 = +[UIApplication _maps_isAnySceneForeground](UIApplication, "_maps_isAnySceneForeground");
  if (!self->_active || v5 == 0)
    -[SuggestionsDataProvider _stopFetchingSuggestionsAndNotifyObservers:isDeallocating:](self, "_stopFetchingSuggestionsAndNotifyObservers:isDeallocating:", v3, 0);
  else
    -[SuggestionsDataProvider _startFetchingSuggestionsAndNotifyObservers:](self, "_startFetchingSuggestionsAndNotifyObservers:", v3);
}

- (void)_startFetchingSuggestionsAndNotifyObservers:(BOOL)a3
{
  _BOOL4 v3;
  id v6;
  NSObject *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  MapsSuggestionsEngine *mapsSuggestionsEngine;
  MapsSuggestionsEngine *v16;
  MapsSuggestionsEngine *v17;
  DrivePreferences *v18;
  void *v19;
  DrivePreferences *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;

  v3 = a3;
  v6 = sub_100432EDC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class(self);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = sub_10039E4FC(v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v22 = 138412802;
    v23 = v10;
    v24 = 2112;
    v25 = v12;
    v26 = 2112;
    v27 = v14;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ %@%@", (uint8_t *)&v22, 0x20u);

  }
  if (!self->_attached)
  {
    mapsSuggestionsEngine = self->_mapsSuggestionsEngine;
    v16 = (MapsSuggestionsEngine *)objc_claimAutoreleasedReturnValue(-[SuggestionsDataProvider _createMapsSuggestionEngine](self, "_createMapsSuggestionEngine"));
    v17 = self->_mapsSuggestionsEngine;
    self->_mapsSuggestionsEngine = v16;

    if (self->_mapsSuggestionsEngine)
    {
      self->_attached = 1;
      -[GEOObserverHashTable suggestionsDataProviderDidAttachToEngine:](self->_observers, "suggestionsDataProviderDidAttachToEngine:", self);
      -[SuggestionsDataProvider _startObservingAutoOptions](self, "_startObservingAutoOptions");
      v18 = [DrivePreferences alloc];
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v20 = -[DrivePreferences initWithDefaults:](v18, "initWithDefaults:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[DrivePreferences automobileOptions](v20, "automobileOptions"));

      -[MapsSuggestionsEngine setAutomobileOptions:](self->_mapsSuggestionsEngine, "setAutomobileOptions:", v21);
      -[MapsSuggestionsEngine attachSink:](self->_mapsSuggestionsEngine, "attachSink:", self);
      if (mapsSuggestionsEngine)
        -[SuggestionsDataProvider _scheduleFetch](self, "_scheduleFetch");
      else
        -[SuggestionsDataProvider _fetchSuggestionsFromStorageFile](self, "_fetchSuggestionsFromStorageFile");

    }
  }
}

- (void)_stopFetchingSuggestionsAndNotifyObservers:(BOOL)a3 isDeallocating:(BOOL)a4
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  NSString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;

  v5 = a3;
  v8 = sub_100432EDC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class(self);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = sub_10039E4FC(v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = 138412802;
    v18 = v12;
    v19 = 2112;
    v20 = v14;
    v21 = 2112;
    v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ %@%@", (uint8_t *)&v17, 0x20u);

  }
  if (self->_attached)
  {
    self->_attached = 0;
    -[GEOObserverHashTable suggestionsDataProviderDidDetachFromEngine:](self->_observers, "suggestionsDataProviderDidDetachFromEngine:", self);
    -[SuggestionsDataProvider _stopObservingAutoOptions](self, "_stopObservingAutoOptions");
    if (!a4)
      -[MapsSuggestionsEngine detachSink:](self->_mapsSuggestionsEngine, "detachSink:", self);
  }
}

- (void)_updateAppConnectionSuggestionsEntriesIfNeeded:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  MapsSuggestionsNetworkRequester *v13;
  NSObject *appConnectionMapsSuggestionsUpdateQueue;
  MapsSuggestionsNetworkRequester *v15;
  _QWORD v16[4];
  id v17;
  MapsSuggestionsNetworkRequester *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
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
        if (objc_msgSend(v11, "type") == (id)12)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "geoMapItem"));

          if (!v12)
            objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    v13 = self->_requester;
    appConnectionMapsSuggestionsUpdateQueue = self->_appConnectionMapsSuggestionsUpdateQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1003AAEFC;
    v16[3] = &unk_1011AC8B0;
    v17 = v5;
    v18 = v13;
    v15 = v13;
    dispatch_async(appConnectionMapsSuggestionsUpdateQueue, v16);

  }
}

- (void)_startObservingAutoOptions
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(&off_101274100, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(&off_101274100);
        objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), 1, off_1014A8300);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(&off_101274100, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_stopObservingAutoOptions
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(&off_101274100, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(&off_101274100);
        objc_msgSend(v3, "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(&off_101274100, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_updateObservedSuggestionsWithSuggestions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *k;
  NSArray *observedSuggestions;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", self->_observedSuggestions));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = (NSArray *)v4;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "removeObjectIdenticalTo:", v12);
        if (-[NSArray indexOfObjectIdenticalTo:](self->_observedSuggestions, "indexOfObjectIdenticalTo:", v12) == 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v5, "addObject:", v12);
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v9);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        -[SuggestionsDataProvider _startObservingTitlesForEntry:](self, "_startObservingTitlesForEntry:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v15);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = v6;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      for (k = 0; k != v20; k = (char *)k + 1)
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        -[SuggestionsDataProvider _stopObservingTitlesForEntry:](self, "_stopObservingTitlesForEntry:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)k), (_QWORD)v24);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v20);
  }

  observedSuggestions = self->_observedSuggestions;
  self->_observedSuggestions = v7;

}

- (void)_updateObservedShortcutsWithShortcuts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *k;
  NSArray *observedShortcuts;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", self->_observedShortcuts));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = (NSArray *)v4;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "removeObjectIdenticalTo:", v12);
        if (-[NSArray indexOfObjectIdenticalTo:](self->_observedShortcuts, "indexOfObjectIdenticalTo:", v12) == 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v5, "addObject:", v12);
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v9);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        -[SuggestionsDataProvider _startObservingTitlesForEntry:](self, "_startObservingTitlesForEntry:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v15);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = v6;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      for (k = 0; k != v20; k = (char *)k + 1)
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        -[SuggestionsDataProvider _stopObservingTitlesForEntry:](self, "_stopObservingTitlesForEntry:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)k), (_QWORD)v24);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v20);
  }

  observedShortcuts = self->_observedShortcuts;
  self->_observedShortcuts = v7;

}

- (void)_updateTitlesForEntry:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  NSUInteger v13;
  NSUInteger v14;
  void *v15;
  unsigned __int8 v16;
  _BOOL4 attached;
  void *v18;
  id v19;
  NSArray *v20;
  NSArray *suggestions;
  NSUInteger v22;
  NSUInteger v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  id v27;
  NSArray *v28;
  NSArray *shortcuts;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;

  v5 = a3;
  v6 = sub_100432EDC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class(self);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v30 = 138412802;
    v31 = v10;
    v32 = 2112;
    v33 = v12;
    v34 = 2112;
    v35 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ %@ %@", (uint8_t *)&v30, 0x20u);

  }
  v13 = -[NSArray indexOfObjectIdenticalTo:](self->_observedSuggestions, "indexOfObjectIdenticalTo:", v5);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL
    || (v14 = v13,
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_suggestions, "objectAtIndexedSubscript:", v13)),
        v16 = objc_msgSend(v15, "isEqualToEntry:", v5),
        v15,
        (v16 & 1) != 0))
  {
    attached = 0;
  }
  else
  {
    attached = self->_attached;
    if (self->_attached)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", self->_suggestions));
      v19 = objc_msgSend(v5, "copy");
      objc_msgSend(v18, "setObject:atIndexedSubscript:", v19, v14);

      v20 = (NSArray *)objc_msgSend(v18, "copy");
      suggestions = self->_suggestions;
      self->_suggestions = v20;

    }
    -[SuggestionsDataProvider _setNeedsSaveMapsSuggestionsEngineState](self, "_setNeedsSaveMapsSuggestionsEngineState");
  }
  v22 = -[NSArray indexOfObjectIdenticalTo:](self->_observedShortcuts, "indexOfObjectIdenticalTo:", v5);
  if (v22 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_10:
    if (!attached)
      goto LABEL_18;
    goto LABEL_17;
  }
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_shortcuts, "objectAtIndexedSubscript:", v22));
  v25 = objc_msgSend(v24, "isEqualToEntry:", v5);

  if ((v25 & 1) != 0)
  {
    if (!attached)
      goto LABEL_18;
  }
  else
  {
    if (!self->_attached)
    {
      -[SuggestionsDataProvider _setNeedsSaveMapsSuggestionsEngineState](self, "_setNeedsSaveMapsSuggestionsEngineState");
      goto LABEL_10;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", self->_shortcuts));
    v27 = objc_msgSend(v5, "copy");
    objc_msgSend(v26, "setObject:atIndexedSubscript:", v27, v23);

    v28 = (NSArray *)objc_msgSend(v26, "copy");
    shortcuts = self->_shortcuts;
    self->_shortcuts = v28;

    -[SuggestionsDataProvider _setNeedsSaveMapsSuggestionsEngineState](self, "_setNeedsSaveMapsSuggestionsEngineState");
  }
LABEL_17:
  -[GEOObserverHashTable homeDataProvidingObjectDidUpdate:](self->_observers, "homeDataProvidingObjectDidUpdate:", self);
LABEL_18:

}

- (void)_startObservingTitlesForEntry:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;

  v5 = a3;
  v6 = sub_100432EDC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class(self);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = 138412802;
    v14 = v10;
    v15 = 2112;
    v16 = v12;
    v17 = 2112;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ %@ %@", (uint8_t *)&v13, 0x20u);

  }
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("title"), 1, off_1014A8308);
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("subtitle"), 1, off_1014A8308);

}

- (void)_stopObservingTitlesForEntry:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;

  v5 = a3;
  v6 = sub_100432EDC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class(self);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = 138412802;
    v14 = v10;
    v15 = 2112;
    v16 = v12;
    v17 = 2112;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ %@ %@", (uint8_t *)&v13, 0x20u);

  }
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("title"), off_1014A8308);
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("subtitle"), off_1014A8308);

}

- (void)_setNeedsSaveMapsSuggestionsEngineState
{
  dispatch_time_t v3;
  _QWORD block[5];

  self->_needsSaveMapsSuggestionState = 1;
  v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003ABD3C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_saveMapsSuggestionsEngineStateIfNeeded
{
  MapsSuggestionsEngine *v2;
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  MapsSuggestionsEngine *v5;
  _QWORD block[4];
  MapsSuggestionsEngine *v7;

  if (self->_needsSaveMapsSuggestionState)
  {
    self->_needsSaveMapsSuggestionState = 0;
    v2 = self->_mapsSuggestionsEngine;
    global_queue = dispatch_get_global_queue(17, 0);
    v4 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003ABDE4;
    block[3] = &unk_1011AC860;
    v7 = v2;
    v5 = v2;
    dispatch_async(v4, block);

  }
}

- (void)_addressbookDidChange:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  NSString *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  v5 = sub_100432EDC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v12, 0x16u);

  }
  -[MapsSuggestionsEngine hintRefreshOfType:](self->_mapsSuggestionsEngine, "hintRefreshOfType:", 1);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  DrivePreferences *v13;
  void *v14;
  DrivePreferences *v15;
  void *v16;
  objc_super v17;
  _QWORD block[5];
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (off_1014A8300 == a6)
  {
    v13 = [DrivePreferences alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v15 = -[DrivePreferences initWithDefaults:](v13, "initWithDefaults:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DrivePreferences automobileOptions](v15, "automobileOptions"));

    -[MapsSuggestionsEngine setAutomobileOptions:](self->_mapsSuggestionsEngine, "setAutomobileOptions:", v16);
  }
  else if (off_1014A8308 == a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003AC04C;
    block[3] = &unk_1011AC8B0;
    block[4] = self;
    v19 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)SuggestionsDataProvider;
    -[SuggestionsDataProvider observeValueForKeyPath:ofObject:change:context:](&v17, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)hasInitialData
{
  return self->_hasInitialData;
}

- (int64_t)viewMode
{
  return self->_viewMode;
}

- (MapsSuggestionsFilter)filter
{
  return self->_filter;
}

- (BOOL)includePlaceholderShortcuts
{
  return self->_includePlaceholderShortcuts;
}

- (BOOL)attached
{
  return self->_attached;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (NSArray)shortcuts
{
  return self->_shortcuts;
}

- (SuggestionsItemSource)suggestionsItemSource
{
  return self->_suggestionsItemSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsItemSource, 0);
  objc_storeStrong((id *)&self->_shortcuts, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_fetchThrottler, 0);
  objc_storeStrong((id *)&self->_observedShortcuts, 0);
  objc_storeStrong((id *)&self->_observedSuggestions, 0);
  objc_storeStrong((id *)&self->_mapsSuggestionsEngine, 0);
  objc_storeStrong((id *)&self->_requester, 0);
  objc_storeStrong((id *)&self->_appConnectionMapsSuggestionsUpdateQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
