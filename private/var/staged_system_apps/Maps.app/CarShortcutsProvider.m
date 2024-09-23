@implementation CarShortcutsProvider

- (CarShortcutsProvider)init
{
  CarShortcutsProvider *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *msgQueue;
  MapsSuggestionsFilter *v7;
  MapsSuggestionsFilter *offlineFilter;
  uint64_t v9;
  MapsSuggestionsFilter *myAdditionalFilter;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CarShortcutsProvider;
  v2 = -[CarShortcutsProvider init](&v12, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("CarShortcutsProviderMapsSuggestionsQueue", v4);
    msgQueue = v2->_msgQueue;
    v2->_msgQueue = (OS_dispatch_queue *)v5;

    v7 = (MapsSuggestionsFilter *)objc_msgSend(objc_alloc((Class)MapsSuggestionsBlockFilter), "initWithBlock:", &stru_1011DD430);
    offlineFilter = v2->_offlineFilter;
    v2->_offlineFilter = v7;

    v9 = objc_claimAutoreleasedReturnValue(+[MapsSuggestionsBlockFilter filterWithBlock:](MapsSuggestionsBlockFilter, "filterWithBlock:", &stru_1011DD450));
    myAdditionalFilter = v2->_myAdditionalFilter;
    v2->_myAdditionalFilter = (MapsSuggestionsFilter *)v9;

  }
  return v2;
}

- (void)setSinkAttached:(BOOL)a3
{
  MapsSuggestionsEngine *mapsSuggestionsEngine;

  if (self->_sinkAttached != a3)
  {
    self->_sinkAttached = a3;
    mapsSuggestionsEngine = self->_mapsSuggestionsEngine;
    if (a3)
    {
      -[MapsSuggestionsEngine addAdditionalFilter:forSink:](mapsSuggestionsEngine, "addAdditionalFilter:forSink:", self->_myAdditionalFilter, self);
      -[MapsSuggestionsEngine addAdditionalFilter:forSink:](self->_mapsSuggestionsEngine, "addAdditionalFilter:forSink:", self->_offlineFilter, self);
      -[MapsSuggestionsEngine attachSink:](self->_mapsSuggestionsEngine, "attachSink:", self);
      -[CarShortcutsProvider _fetchSuggestions](self, "_fetchSuggestions");
    }
    else
    {
      -[MapsSuggestionsEngine detachSink:](mapsSuggestionsEngine, "detachSink:", self);
      -[MapsSuggestionsEngine removeAdditionalFilter:forSink:](self->_mapsSuggestionsEngine, "removeAdditionalFilter:forSink:", self->_myAdditionalFilter, self);
      -[MapsSuggestionsEngine removeAdditionalFilter:forSink:](self->_mapsSuggestionsEngine, "removeAdditionalFilter:forSink:", self->_offlineFilter, self);
    }
  }
}

- (void)start
{
  NSObject *msgQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  msgQueue = self->_msgQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10098735C;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  dispatch_async(msgQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)stop
{
  NSObject *msgQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  msgQueue = self->_msgQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10098750C;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  dispatch_async(msgQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_createMapsSuggestionEngineWithCallBack:(id)a3
{
  void (**v3)(id, id);
  id v4;
  DrivePreferences *v5;
  void *v6;
  DrivePreferences *v7;
  void *v8;
  id v9;

  v3 = (void (**)(id, id))a3;
  v4 = sub_100B3A5D4();
  v9 = (id)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v9, "setMapType:", 1);
  v5 = [DrivePreferences alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = -[DrivePreferences initWithDefaults:](v5, "initWithDefaults:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DrivePreferences automobileOptions](v7, "automobileOptions"));

  objc_msgSend(v9, "setAutomobileOptions:", v8);
  v3[2](v3, v9);

}

- (void)_fetchSuggestions
{
  MapsSuggestionsEngine *mapsSuggestionsEngine;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  mapsSuggestionsEngine = self->_mapsSuggestionsEngine;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1009876B8;
  v4[3] = &unk_1011AD9D0;
  objc_copyWeak(&v5, &location);
  -[MapsSuggestionsEngine topSuggestionsForSink:count:transportType:callback:onQueue:](mapsSuggestionsEngine, "topSuggestionsForSink:count:transportType:callback:onQueue:", self, 20, 0, v4, self->_msgQueue);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_processTopSuggestions:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD block[5];
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_100987898;
  v19 = sub_1009878A8;
  v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1009878B4;
  v14[3] = &unk_1011AEF50;
  v14[4] = &v15;
  MapsSuggestionsShortcutSplit(v6, v7, &stru_1011DD498, v14);
  v8 = (void *)v16[5];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1011DD4B8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:", v9));

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009878E0;
  block[3] = &unk_1011AC8B0;
  block[4] = self;
  v13 = v10;
  v11 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(&v15, 8);
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(self), "description");
}

- (void)invalidateForMapsSuggestionsManager:(id)a3
{
  NSObject *msgQueue;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  msgQueue = self->_msgQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1009879DC;
  v5[3] = &unk_1011AD260;
  objc_copyWeak(&v6, &location);
  dispatch_async(msgQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (NSArray)shortcuts
{
  return self->_shortcuts;
}

- (void)setShortcuts:(id)a3
{
  objc_storeStrong((id *)&self->_shortcuts, a3);
}

- (CarShortcutsProviderDelegate)delegate
{
  return (CarShortcutsProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)sinkAttached
{
  return self->_sinkAttached;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_shortcuts, 0);
  objc_storeStrong((id *)&self->_msgQueue, 0);
  objc_storeStrong((id *)&self->_offlineFilter, 0);
  objc_storeStrong((id *)&self->_myAdditionalFilter, 0);
  objc_storeStrong((id *)&self->_mapsSuggestionsEngine, 0);
}

@end
