@implementation CarMapsSuggestionsController

- (CarMapsSuggestionsController)init
{
  CarMapsSuggestionsController *v2;
  CarMapsSuggestionsController *v3;
  NSHashTable *v4;
  NSHashTable *observers;
  id v6;
  uint64_t v7;
  MapsSuggestionsEngine *suggestionsEngine;
  CarMapsSuggestionsObserver_LowFuel *v9;
  CarMapsSuggestionsObserver_LowFuel *lowFuelObserver;
  uint64_t v11;
  MapsSuggestionsFilter *myAdditionalFilter;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CarMapsSuggestionsController;
  v2 = -[CarMapsSuggestionsController init](&v14, "init");
  v3 = v2;
  if (v2)
  {
    v2->_sinkDetaching = 0;
    v2->_allowLowFuelAlert = 1;
    v4 = (NSHashTable *)objc_msgSend(objc_alloc((Class)NSHashTable), "initWithOptions:capacity:", 517, 0);
    observers = v3->_observers;
    v3->_observers = v4;

    v6 = sub_100B3A5D4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    suggestionsEngine = v3->_suggestionsEngine;
    v3->_suggestionsEngine = (MapsSuggestionsEngine *)v7;

    v9 = objc_opt_new(CarMapsSuggestionsObserver_LowFuel);
    lowFuelObserver = v3->_lowFuelObserver;
    v3->_lowFuelObserver = v9;

    v11 = objc_claimAutoreleasedReturnValue(+[MapsSuggestionsBlockFilter filterWithBlock:](MapsSuggestionsBlockFilter, "filterWithBlock:", &stru_1011DB8B8));
    myAdditionalFilter = v3->_myAdditionalFilter;
    v3->_myAdditionalFilter = (MapsSuggestionsFilter *)v11;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[CarMapsSuggestionsController setSinkAttached:](self, "setSinkAttached:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CarMapsSuggestionsController;
  -[CarMapsSuggestionsController dealloc](&v3, "dealloc");
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(self), "description");
}

- (void)hintRefreshOfType:(int64_t)a3
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController suggestionsEngine](self, "suggestionsEngine"));
  objc_msgSend(v5, "hintRefreshOfType:", a3);

  -[CarMapsSuggestionsController refreshSuggestions](self, "refreshSuggestions");
}

- (void)refreshSuggestions
{
  id v3;
  NSObject *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  _QWORD *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  dispatch_queue_global_t global_queue;
  void *v15;
  uint8_t v16[8];
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  __CFString *v20;
  __int16 v21;
  __CFString *v22;

  -[CarMapsSuggestionsController _verifyHaveObservers](self, "_verifyHaveObservers");
  if (-[CarMapsSuggestionsController sinkAttached](self, "sinkAttached")
    && !-[CarMapsSuggestionsController sinkDetaching](self, "sinkDetaching"))
  {
    objc_initWeak((id *)buf, self);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1008F9348;
    v17[3] = &unk_1011AD9D0;
    objc_copyWeak(&v18, (id *)buf);
    v9 = objc_retainBlock(v17);
    v10 = sub_10043364C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[CarMapsSuggestionsController] Requesting topSuggestions from suggestions engine", v16, 2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController suggestionsEngine](self, "suggestionsEngine"));
    if (qword_1014D3940 != -1)
      dispatch_once(&qword_1014D3940, &stru_1011DB898);
    v13 = qword_1014D3938;
    global_queue = dispatch_get_global_queue(2, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    objc_msgSend(v12, "topSuggestionsForSink:count:transportType:callback:onQueue:", self, v13, 0, v9, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v3 = sub_10043364C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (-[CarMapsSuggestionsController sinkAttached](self, "sinkAttached"))
        v5 = CFSTR("YES");
      else
        v5 = CFSTR("NO");
      v6 = v5;
      if (-[CarMapsSuggestionsController sinkDetaching](self, "sinkDetaching"))
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      v8 = v7;
      *(_DWORD *)buf = 138543618;
      v20 = v6;
      v21 = 2114;
      v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[CarMapsSuggestionsController] skipping suggestions refresh sinkAttached=%{public}@ sinkDetaching=%{public}@", buf, 0x16u);

    }
  }
}

- (void)registerObserver:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController observers](self, "observers"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController observers](self, "observers"));
  v6 = objc_msgSend(v5, "containsObject:", v8);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController observers](self, "observers"));
    objc_msgSend(v7, "addObject:", v8);

    if (!-[CarMapsSuggestionsController sinkAttached](self, "sinkAttached"))
      -[CarMapsSuggestionsController setSinkAttached:](self, "setSinkAttached:", 1);
  }
  objc_sync_exit(v4);

}

- (void)unregisterObserver:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController observers](self, "observers"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController observers](self, "observers"));
  v6 = objc_msgSend(v5, "containsObject:", v8);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController observers](self, "observers"));
    objc_msgSend(v7, "removeObject:", v8);

    -[CarMapsSuggestionsController _verifyHaveObservers](self, "_verifyHaveObservers");
  }
  objc_sync_exit(v4);

}

- (void)_notifyObservers
{
  void *v3;
  void *v4;
  id v5;
  __int128 v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController observers](self, "observers"));
  objc_sync_enter(v3);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController observers](self, "observers"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v14;
    *(_QWORD *)&v6 = 138412290;
    v12 = v6;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "carMapsSuggestionControllerDidRefresh:", self, v12);
        v10 = sub_10043364C();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v12;
          v18 = v9;
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v5);
  }

  objc_sync_exit(v3);
  -[CarMapsSuggestionsController _verifyHaveObservers](self, "_verifyHaveObservers");
}

- (void)_verifyHaveObservers
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  _QWORD block[4];
  id v11;
  id buf[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController observers](self, "observers"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController observers](self, "observers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
  if (objc_msgSend(v5, "count") || -[CarMapsSuggestionsController sinkDetaching](self, "sinkDetaching"))
  {

  }
  else
  {
    v6 = -[CarMapsSuggestionsController sinkAttached](self, "sinkAttached");

    if (v6)
    {
      v7 = sub_10043364C();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[CarMapsSuggestionsController] No observers, detaching from suggestions", (uint8_t *)buf, 2u);
      }

      -[CarMapsSuggestionsController setSinkDetaching:](self, "setSinkDetaching:", 1);
      objc_initWeak(buf, self);
      v9 = dispatch_time(0, 5000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1008F9964;
      block[3] = &unk_1011AD260;
      objc_copyWeak(&v11, buf);
      dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
      objc_destroyWeak(&v11);
      objc_destroyWeak(buf);
    }
  }
  objc_sync_exit(v3);

}

- (void)setHoldProcessAssertion:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  __CFString *v18;
  __int16 v19;
  __CFString *v20;

  if (self->_holdProcessAssertion != a3)
  {
    v3 = a3;
    v5 = sub_10043364C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if (self->_holdProcessAssertion)
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      v8 = v7;
      if (v3)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      v10 = v9;
      *(_DWORD *)buf = 138543618;
      v18 = v8;
      v19 = 2114;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[CarMapsSuggestionsController] _holdProcessAssertion=%{public}@ holdProcessAssertion=%{public}@", buf, 0x16u);

    }
    self->_holdProcessAssertion = v3;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController processAssertion](self, "processAssertion"));
    objc_msgSend(v11, "invalidate");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController processAssertionTimer](self, "processAssertionTimer"));
    objc_msgSend(v12, "invalidate");

    -[CarMapsSuggestionsController setProcessAssertion:](self, "setProcessAssertion:", 0);
    -[CarMapsSuggestionsController setProcessAssertionTimer:](self, "setProcessAssertionTimer:", 0);
    if (v3)
    {
      v13 = objc_msgSend(objc_alloc((Class)BKSProcessAssertion), "initWithBundleIdentifier:flags:reason:name:withHandler:", CFSTR("com.apple.Maps"), 3, 3, CFSTR("com.apple.Maps.LowFuelAlert"), &stru_1011DB8D8);
      -[CarMapsSuggestionsController setProcessAssertion:](self, "setProcessAssertion:", v13);

      -[CarMapsSuggestionsController refreshSuggestions](self, "refreshSuggestions");
      objc_initWeak((id *)buf, self);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1008F9D34;
      v15[3] = &unk_1011ADF20;
      objc_copyWeak(&v16, (id *)buf);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v15, 60.0));
      -[CarMapsSuggestionsController setProcessAssertionTimer:](self, "setProcessAssertionTimer:", v14);

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)setMonitorLowFuel:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController lowFuelObserver](self, "lowFuelObserver"));
  objc_msgSend(v4, "setActive:", v3);

}

- (BOOL)monitorLowFuel
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController lowFuelObserver](self, "lowFuelObserver"));
  v3 = objc_msgSend(v2, "active");

  return v3;
}

- (void)setSinkAttached:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  __CFString *v22;
  __int16 v23;
  __CFString *v24;

  if (self->_sinkAttached != a3)
  {
    v3 = a3;
    v5 = sub_10043364C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if (self->_sinkAttached)
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      v8 = v7;
      if (v3)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      v10 = v9;
      v21 = 138412546;
      v22 = v8;
      v23 = 2112;
      v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[CarMapsSuggestionsController] _sinkAttached=%@ sinkAttached=%@", (uint8_t *)&v21, 0x16u);

    }
    self->_sinkAttached = v3;
    if (v3)
    {
      v11 = objc_msgSend(objc_alloc((Class)MapsSuggestionsBlockFilter), "initWithBlock:", &stru_1011DB8F8);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController suggestionsEngine](self, "suggestionsEngine"));
      objc_msgSend(v12, "addAdditionalFilter:forSink:", v11, self);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController suggestionsEngine](self, "suggestionsEngine"));
      v14 = objc_alloc_init((Class)MapsSuggestionsShortcutFilter);
      objc_msgSend(v13, "addAdditionalFilter:forSink:", v14, self);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController suggestionsEngine](self, "suggestionsEngine"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController myAdditionalFilter](self, "myAdditionalFilter"));
      objc_msgSend(v15, "addAdditionalFilter:forSink:", v16, self);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController suggestionsEngine](self, "suggestionsEngine"));
      objc_msgSend(v17, "attachSink:", self);

      -[CarMapsSuggestionsController refreshSuggestions](self, "refreshSuggestions");
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController suggestionsEngine](self, "suggestionsEngine"));
      objc_msgSend(v18, "detachSink:", self);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController suggestionsEngine](self, "suggestionsEngine"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController myAdditionalFilter](self, "myAdditionalFilter"));
      objc_msgSend(v19, "removeAdditionalFilter:forSink:", v20, self);

      -[CarMapsSuggestionsController setSuggestions:](self, "setSuggestions:", 0);
    }
  }
}

- (unint64_t)suggestionCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController suggestions](self, "suggestions"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (void)setAllowLowFuelAlert:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  NSObject *v11;
  _BOOL8 allowLowFuelAlert;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  _BOOL8 v21;
  _BYTE v22[128];

  if (self->_allowLowFuelAlert != a3)
  {
    v3 = a3;
    self->_allowLowFuelAlert = a3;
    obj = (id)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController observers](self, "observers"));
    objc_sync_enter(obj);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapsSuggestionsController observers](self, "observers"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v9, "setAllowLowFuelSuggestion:") & 1) != 0)
          {
            v10 = sub_10043364C();
            v11 = objc_claimAutoreleasedReturnValue(v10);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              allowLowFuelAlert = self->_allowLowFuelAlert;
              *(_DWORD *)buf = 138412546;
              v19 = v9;
              v20 = 2048;
              v21 = allowLowFuelAlert;
            }

            objc_msgSend(v9, "setAllowLowFuelSuggestion:", v3);
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      }
      while (v6);
    }

    objc_sync_exit(obj);
  }
}

- (NSArray)suggestions
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSuggestions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)allowLowFuelAlert
{
  return self->_allowLowFuelAlert;
}

- (BOOL)holdProcessAssertion
{
  return self->_holdProcessAssertion;
}

- (BOOL)sinkAttached
{
  return self->_sinkAttached;
}

- (MapsSuggestionsEngine)suggestionsEngine
{
  return self->_suggestionsEngine;
}

- (void)setSuggestionsEngine:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsEngine, a3);
}

- (MapsSuggestionsFilter)myAdditionalFilter
{
  return self->_myAdditionalFilter;
}

- (void)setMyAdditionalFilter:(id)a3
{
  objc_storeStrong((id *)&self->_myAdditionalFilter, a3);
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 40, 1);
}

- (void)setObservers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)sinkDetaching
{
  return self->_sinkDetaching;
}

- (void)setSinkDetaching:(BOOL)a3
{
  self->_sinkDetaching = a3;
}

- (unint64_t)routeGeniusAttemptCount
{
  return self->_routeGeniusAttemptCount;
}

- (void)setRouteGeniusAttemptCount:(unint64_t)a3
{
  self->_routeGeniusAttemptCount = a3;
}

- (CarMapsSuggestionsObserver_LowFuel)lowFuelObserver
{
  return (CarMapsSuggestionsObserver_LowFuel *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLowFuelObserver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BKSProcessAssertion)processAssertion
{
  return (BKSProcessAssertion *)objc_getProperty(self, a2, 64, 1);
}

- (void)setProcessAssertion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSTimer)processAssertionTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setProcessAssertionTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processAssertionTimer, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_lowFuelObserver, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_myAdditionalFilter, 0);
  objc_storeStrong((id *)&self->_suggestionsEngine, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end
