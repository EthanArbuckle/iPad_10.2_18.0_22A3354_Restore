@implementation CarClusterSuggestionController

- (CarClusterSuggestionController)init
{
  CarClusterSuggestionController *v2;
  CARSessionStatus *v3;
  CARSessionStatus *carSessionStatus;
  void *v5;
  void *v6;
  uint64_t v7;
  NSArray *turnCardSuggestURLs;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *mapBasedSuggestURLs;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  objc_super v19;
  _QWORD v20[2];
  void *v21;

  v19.receiver = self;
  v19.super_class = (Class)CarClusterSuggestionController;
  v2 = -[CarClusterSuggestionController init](&v19, "init");
  if (v2)
  {
    v3 = (CARSessionStatus *)objc_alloc_init((Class)CARSessionStatus);
    carSessionStatus = v2->_carSessionStatus;
    v2->_carSessionStatus = v3;

    -[CARSessionStatus addSessionObserver:](v2->_carSessionStatus, "addSessionObserver:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, "_supportedUrlsChanged:", CFSTR("CRInstrumentClusterURLsDidChangeNotification"), 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("maps:/car/instrumentcluster/instructioncard")));
    v21 = v6;
    v7 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    turnCardSuggestURLs = v2->_turnCardSuggestURLs;
    v2->_turnCardSuggestURLs = (NSArray *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("maps:/car/instrumentcluster/map")));
    v20[0] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("maps:/car/instrumentcluster")));
    v20[1] = v10;
    v11 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
    mapBasedSuggestURLs = v2->_mapBasedSuggestURLs;
    v2->_mapBasedSuggestURLs = (NSArray *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterSuggestionController currentSession](v2, "currentSession"));
    v2->_isCarPlaySessionConnected = v13 != 0;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v14, "registerObserver:", v2);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v16 = objc_msgSend(v15, "state");
    -[CarClusterSuggestionController setIsNavigating:](v2, "setIsNavigating:", MNNavigationServiceStateIsNavigating(v16, v17));

    -[CarClusterSuggestionController _updateCurrentSuggestions](v2, "_updateCurrentSuggestions");
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[CarClusterSuggestionController _cancelStopSuggestingTurnCardTimerIfNeeded](self, "_cancelStopSuggestingTurnCardTimerIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[CARSessionStatus removeSessionObserver:](self->_carSessionStatus, "removeSessionObserver:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v4, "unregisterObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)CarClusterSuggestionController;
  -[CarClusterSuggestionController dealloc](&v5, "dealloc");
}

- (CARSession)currentSession
{
  return (CARSession *)-[CARSessionStatus currentSession](self->_carSessionStatus, "currentSession");
}

- (void)setIsCarPlaySessionConnected:(BOOL)a3
{
  id v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  int v8;
  __CFString *v9;

  if (self->_isCarPlaySessionConnected != a3)
  {
    self->_isCarPlaySessionConnected = a3;
    v4 = sub_1004333AC();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (self->_isCarPlaySessionConnected)
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      v7 = v6;
      v8 = 138412290;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "isCarPlaySessionConnected set to: %@", (uint8_t *)&v8, 0xCu);

    }
    -[CarClusterSuggestionController _sendSuggestionIfNeeded](self, "_sendSuggestionIfNeeded");
  }
}

- (void)setIsNavigating:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  __CFString *v10;

  if (self->_isNavigating != a3)
  {
    v3 = a3;
    self->_isNavigating = a3;
    v5 = sub_1004333AC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = CFSTR("NO");
      if (v3)
        v7 = CFSTR("YES");
      v8 = v7;
      v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "isNavigating set to: %@", (uint8_t *)&v9, 0xCu);

    }
    -[CarClusterSuggestionController _updateCurrentSuggestions](self, "_updateCurrentSuggestions");
  }
}

- (void)setShouldSuggestTurnCard:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  __CFString *v10;

  if (self->_shouldSuggestTurnCard != a3)
  {
    v3 = a3;
    self->_shouldSuggestTurnCard = a3;
    v5 = sub_1004333AC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = CFSTR("NO");
      if (v3)
        v7 = CFSTR("YES");
      v8 = v7;
      v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "shouldSuggestTurnCard set to: %@", (uint8_t *)&v9, 0xCu);

    }
    -[CarClusterSuggestionController _updateCurrentSuggestions](self, "_updateCurrentSuggestions");
  }
}

- (void)setUsePersistentDisplay:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  if (self->_usePersistentDisplay != a3)
  {
    v3 = a3;
    self->_usePersistentDisplay = a3;
    v5 = sub_1004333AC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterSuggestionController debugDescription](self, "debugDescription"));
        v10 = 138412290;
        v11 = v8;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "usePersistentDisplay set to YES. Canceling timer and sending suggestion. Current state: %@", (uint8_t *)&v10, 0xCu);

      }
      -[CarClusterSuggestionController _startSuggestingTurnCard](self, "_startSuggestingTurnCard");
    }
    else
    {
      if (v7)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterSuggestionController debugDescription](self, "debugDescription"));
        v10 = 138412290;
        v11 = v9;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "usePersistentDisplay set to NO. Scheduling timer. Current state: %@", (uint8_t *)&v10, 0xCu);

      }
      -[CarClusterSuggestionController _cancelStopSuggestingTurnCardTimerIfNeeded](self, "_cancelStopSuggestingTurnCardTimerIfNeeded");
      -[CarClusterSuggestionController _scheduleStopSuggestingTurnCardTimerIfNeeded](self, "_scheduleStopSuggestingTurnCardTimerIfNeeded");
    }
  }
}

- (void)setCurrentlySuggestingURLs:(id)a3
{
  id v5;
  NSArray *currentlySuggestingURLs;
  unint64_t v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  NSArray *v13;
  NSArray *v14;
  void *v15;
  __CFString *v16;
  uint8_t buf[4];
  __CFString *v18;

  v5 = a3;
  currentlySuggestingURLs = self->_currentlySuggestingURLs;
  v7 = (unint64_t)v5;
  v8 = currentlySuggestingURLs;
  if (v7 | (unint64_t)v8)
  {
    v9 = v8;
    v10 = objc_msgSend((id)v7, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentlySuggestingURLs, a3);
      v11 = sub_1004333AC();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = self->_currentlySuggestingURLs;
        v14 = v13;
        if (v13)
        {
          if (-[NSArray count](v13, "count"))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray componentsJoinedByString:](v14, "componentsJoinedByString:", CFSTR(", ")));
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v14, v15));

          }
          else
          {
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v14));
          }
        }
        else
        {
          v16 = CFSTR("<nil>");
        }

        *(_DWORD *)buf = 138412290;
        v18 = v16;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "currentlySuggestingURLs set to %@", buf, 0xCu);

      }
      -[CarClusterSuggestionController _sendSuggestionIfNeeded](self, "_sendSuggestionIfNeeded");
    }
  }

}

- (NSString)debugDescription
{
  NSArray *v3;
  NSArray *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  NSUUID *lastGuidanceEventId;
  NSUUID **p_lastGuidanceEventId;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;

  v3 = self->_currentlySuggestingURLs;
  v4 = v3;
  if (v3)
  {
    if (-[NSArray count](v3, "count"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray componentsJoinedByString:](v4, "componentsJoinedByString:", CFSTR(", ")));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v4, v5));

    }
    else
    {
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v4));
    }
  }
  else
  {
    v6 = CFSTR("<nil>");
  }

  if (self->_shouldSuggestTurnCard)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (self->_isNavigating)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (self->_usePersistentDisplay)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  p_lastGuidanceEventId = &self->_lastGuidanceEventId;
  lastGuidanceEventId = self->_lastGuidanceEventId;
  if (p_lastGuidanceEventId[1])
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  v13 = v12;
  v14 = v9;
  v15 = v8;
  v16 = v7;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](lastGuidanceEventId, "UUIDString"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("_currentlySuggestingURLs: %@, _shouldSuggestTurnCard: %@, _isNavigating: %@, usePersistentDisplay: %@, timerActive: %@, currentSignInfo: %@"), v6, v16, v15, v14, v13, v17));

  return (NSString *)v18;
}

- (void)_scheduleStopSuggestingTurnCardTimerIfNeeded
{
  id v3;
  NSObject *v4;
  void *v5;
  NSTimer *v6;
  NSTimer *stopSuggestingTurnCardTimer;
  int v8;
  void *v9;

  if (!self->_stopSuggestingTurnCardTimer)
  {
    if (self->_usePersistentDisplay)
    {
      v3 = sub_1004333AC();
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterSuggestionController debugDescription](self, "debugDescription"));
        v8 = 138412290;
        v9 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "scheduleStopSuggestingTurnCardTimerIfNeeded aborted, because _usePersistentDisplay is set. Current state: %@", (uint8_t *)&v8, 0xCu);

      }
    }
    else
    {
      v6 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_stopSuggestingTurnCardTimerFired", 0, 0, 10.0));
      stopSuggestingTurnCardTimer = self->_stopSuggestingTurnCardTimer;
      self->_stopSuggestingTurnCardTimer = v6;

    }
  }
}

- (void)_cancelStopSuggestingTurnCardTimerIfNeeded
{
  NSTimer *stopSuggestingTurnCardTimer;
  NSTimer *v4;

  stopSuggestingTurnCardTimer = self->_stopSuggestingTurnCardTimer;
  if (stopSuggestingTurnCardTimer)
  {
    -[NSTimer invalidate](stopSuggestingTurnCardTimer, "invalidate");
    v4 = self->_stopSuggestingTurnCardTimer;
    self->_stopSuggestingTurnCardTimer = 0;

  }
}

- (void)_stopSuggestingTurnCardTimerFired
{
  _BOOL4 usePersistentDisplay;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  usePersistentDisplay = self->_usePersistentDisplay;
  v4 = sub_1004333AC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (usePersistentDisplay)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterSuggestionController debugDescription](self, "debugDescription"));
      v9 = 138412290;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "timer fired despite _usePersistentDisplay set to yes, currentState: %@", (uint8_t *)&v9, 0xCu);

    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterSuggestionController debugDescription](self, "debugDescription"));
      v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "timer fired, currentState: %@", (uint8_t *)&v9, 0xCu);

    }
    -[CarClusterSuggestionController _cancelStopSuggestingTurnCardTimerIfNeeded](self, "_cancelStopSuggestingTurnCardTimerIfNeeded");
    -[CarClusterSuggestionController _stopSuggestingTurnCard](self, "_stopSuggestingTurnCard");
  }
}

- (void)_sendOneTimeTurnCardSuggestion
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_1004333AC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_sendOneTimeTurnCardSuggestion, will cancel current stop suggestion timer.", v5, 2u);
  }

  -[CarClusterSuggestionController _cancelStopSuggestingTurnCardTimerIfNeeded](self, "_cancelStopSuggestingTurnCardTimerIfNeeded");
  -[CarClusterSuggestionController _startSuggestingTurnCard](self, "_startSuggestingTurnCard");
  -[CarClusterSuggestionController _scheduleStopSuggestingTurnCardTimerIfNeeded](self, "_scheduleStopSuggestingTurnCardTimerIfNeeded");
}

- (void)_startSuggestingTurnCard
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];
  uint8_t v11[16];

  if (-[NSArray count](self->_turnCardSuggestURLs, "count"))
  {
    if (self->_stopSuggestingTurnCardTimer)
    {
      v3 = sub_1004333AC();
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_startSuggestingTurnCard, will cancel current stop suggestion timer.", buf, 2u);
      }

      -[CarClusterSuggestionController _cancelStopSuggestingTurnCardTimerIfNeeded](self, "_cancelStopSuggestingTurnCardTimerIfNeeded");
    }
    v5 = sub_1004333AC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "_startSuggestingTurnCard will start suggesting if not already suggesting", v9, 2u);
    }

    -[CarClusterSuggestionController setShouldSuggestTurnCard:](self, "setShouldSuggestTurnCard:", 1);
  }
  else
  {
    v7 = sub_1004333AC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "_turnCardSuggestURLs is empty, not sending suggestUI.", v11, 2u);
    }

  }
}

- (void)_stopSuggestingTurnCard
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  -[CarClusterSuggestionController _cancelStopSuggestingTurnCardTimerIfNeeded](self, "_cancelStopSuggestingTurnCardTimerIfNeeded");
  v3 = sub_1004333AC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_stopSuggestingTurnCard will stop suggesting if not already stopped", v5, 2u);
  }

  -[CarClusterSuggestionController setShouldSuggestTurnCard:](self, "setShouldSuggestTurnCard:", 0);
}

- (void)_updateCurrentSuggestions
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = v3;
  if (self->_shouldSuggestTurnCard)
  {
    objc_msgSend(v3, "addObjectsFromArray:", self->_turnCardSuggestURLs);
    v3 = v5;
  }
  if (self->_isNavigating)
  {
    objc_msgSend(v5, "addObjectsFromArray:", self->_mapBasedSuggestURLs);
    v3 = v5;
  }
  v4 = objc_msgSend(v3, "copy");
  -[CarClusterSuggestionController setCurrentlySuggestingURLs:](self, "setCurrentlySuggestingURLs:", v4);

}

- (void)_sendSuggestionIfNeeded
{
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSArray *v7;
  NSArray *v8;
  void *v9;
  __CFString *v10;
  uint8_t buf[4];
  __CFString *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterSuggestionController currentSession](self, "currentSession"));

  v4 = sub_1004333AC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v6)
    {
      v7 = self->_currentlySuggestingURLs;
      v8 = v7;
      if (v7)
      {
        if (-[NSArray count](v7, "count"))
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray componentsJoinedByString:](v8, "componentsJoinedByString:", CFSTR(", ")));
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v8, v9));

        }
        else
        {
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v8));
        }
      }
      else
      {
        v10 = CFSTR("<nil>");
      }

      *(_DWORD *)buf = 138412290;
      v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "_sendSuggestionIfNeeded is sending the following URLs: %@", buf, 0xCu);

    }
    v5 = objc_claimAutoreleasedReturnValue(-[CarClusterSuggestionController currentSession](self, "currentSession"));
    -[NSObject suggestUI:](v5, "suggestUI:", self->_currentlySuggestingURLs);
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "_sendSuggestionIfNeeded tried to send suggestUI but session was nil.", buf, 2u);
  }

}

- (void)_clear
{
  NSUUID *lastGuidanceEventId;

  self->_isNavigating = 0;
  -[CarClusterSuggestionController _stopSuggestingTurnCard](self, "_stopSuggestingTurnCard");
  lastGuidanceEventId = self->_lastGuidanceEventId;
  self->_lastGuidanceEventId = 0;

}

- (void)_supportedUrlsChanged:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_1004333AC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "_supportedUrlsChanged: supported URLs changed, resending suggestUI.", v6, 2u);
  }

  -[CarClusterSuggestionController _sendSuggestionIfNeeded](self, "_sendSuggestionIfNeeded");
}

- (void)sessionDidConnect:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a3;
  v5 = sub_1004333AC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "sessionDidConnect: %@", (uint8_t *)&v7, 0xCu);
  }

  -[CarClusterSuggestionController setIsCarPlaySessionConnected:](self, "setIsCarPlaySessionConnected:", 1);
}

- (void)sessionDidDisconnect:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a3;
  v5 = sub_1004333AC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "sessionDidDisconnect: %@", (uint8_t *)&v7, 0xCu);
  }

  -[CarClusterSuggestionController setIsCarPlaySessionConnected:](self, "setIsCarPlaySessionConnected:", 0);
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  if (MNNavigationServiceStateChangedToNavigating(a4, a5, a3))
  {
    v8 = sub_1004333AC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "navigationService changed state to .Navigating.", buf, 2u);
    }

    -[CarClusterSuggestionController setIsNavigating:](self, "setIsNavigating:", 1);
    -[CarClusterSuggestionController _sendOneTimeTurnCardSuggestion](self, "_sendOneTimeTurnCardSuggestion");
  }
  else if (MNNavigationServiceStateChangedFromNavigatingToStopped(a4, a5))
  {
    v10 = sub_1004333AC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "navigationService changed state to .Stopped. Clearing out", v12, 2u);
    }

    -[CarClusterSuggestionController setIsNavigating:](self, "setIsNavigating:", 0);
    -[CarClusterSuggestionController _clear](self, "_clear");
  }
}

- (void)navigationService:(id)a3 usePersistentDisplay:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a4;
  v6 = sub_1004333AC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    v9 = 138412290;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "navigationService updated usePersistentDisplay : %@", (uint8_t *)&v9, 0xCu);

  }
  -[CarClusterSuggestionController setUsePersistentDisplay:](self, "setUsePersistentDisplay:", v4);
}

- (void)navigationServiceDidEnterPreArrivalState:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_1004333AC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "navigationService didEnterPreArrivalState, sending suggestion update.", v6, 2u);
  }

  -[CarClusterSuggestionController _startSuggestingTurnCard](self, "_startSuggestingTurnCard");
}

- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4
{
  id v6;
  void *v7;
  signed int v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  NSUUID *v19;
  NSUUID *lastGuidanceEventId;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  int v25;
  void *v26;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "primarySign"));
  v8 = objc_msgSend(v7, "composedGuidanceEventIndex");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "route"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "composedGuidanceEvents"));
  v11 = objc_msgSend(v10, "count");

  if ((unint64_t)v11 <= v8)
  {
    v24 = sub_1004333AC();
    v14 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v25) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "navigationService updateSignsWithInfo, navd sent incorrect guidanceEventIndex.", (uint8_t *)&v25, 2u);
    }
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "route"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "composedGuidanceEvents"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v8));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_lastGuidanceEventId, "UUIDString"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject uniqueID](v14, "uniqueID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
      v18 = objc_msgSend(v15, "isEqualToString:", v17);

      if ((v18 & 1) == 0)
      {
        v19 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[NSObject uniqueID](v14, "uniqueID"));
        lastGuidanceEventId = self->_lastGuidanceEventId;
        self->_lastGuidanceEventId = v19;

        v21 = sub_1004333AC();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_lastGuidanceEventId, "UUIDString"));
          v25 = 138412290;
          v26 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "navigationService updateSignsWithInfo new guidanceEvent: %@, sending suggestion update.", (uint8_t *)&v25, 0xCu);

        }
        -[CarClusterSuggestionController _sendOneTimeTurnCardSuggestion](self, "_sendOneTimeTurnCardSuggestion");
      }
    }
  }

}

- (BOOL)shouldSuggestTurnCard
{
  return self->_shouldSuggestTurnCard;
}

- (BOOL)isNavigating
{
  return self->_isNavigating;
}

- (BOOL)shouldUsePersistentDisplay
{
  return self->_usePersistentDisplay;
}

- (BOOL)isCarPlaySessionConnected
{
  return self->_isCarPlaySessionConnected;
}

- (NSArray)currentlySuggestingURLs
{
  return self->_currentlySuggestingURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlySuggestingURLs, 0);
  objc_storeStrong((id *)&self->_stopSuggestingTurnCardTimer, 0);
  objc_storeStrong((id *)&self->_lastGuidanceEventId, 0);
  objc_storeStrong((id *)&self->_mapBasedSuggestURLs, 0);
  objc_storeStrong((id *)&self->_turnCardSuggestURLs, 0);
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
}

@end
