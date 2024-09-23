@implementation MFMailDebugIndexStatusViewController

+ (id)title
{
  return CFSTR("Index Status");
}

- (NSISO8601DateFormatter)reindexDateFormatter
{
  NSISO8601DateFormatter *reindexDateFormatter;
  NSISO8601DateFormatter *v4;
  NSISO8601DateFormatter *v5;
  void *v6;

  reindexDateFormatter = self->_reindexDateFormatter;
  if (!reindexDateFormatter)
  {
    v4 = (NSISO8601DateFormatter *)objc_alloc_init((Class)NSISO8601DateFormatter);
    v5 = self->_reindexDateFormatter;
    self->_reindexDateFormatter = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
    -[NSISO8601DateFormatter setTimeZone:](self->_reindexDateFormatter, "setTimeZone:", v6);

    -[NSISO8601DateFormatter setFormatOptions:](self->_reindexDateFormatter, "setFormatOptions:", 947);
    reindexDateFormatter = self->_reindexDateFormatter;
  }
  return reindexDateFormatter;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MFMailDebugIndexStatusViewController;
  -[MFMailDebugIndexStatusViewController viewDidLoad](&v17, "viewDidLoad");
  v3 = objc_alloc((Class)UITableView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugIndexStatusViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v5 = objc_msgSend(v3, "initWithFrame:style:", 1);
  -[MFMailDebugIndexStatusViewController setTableView:](self, "setTableView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugIndexStatusViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setAutoresizingMask:", 18);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugIndexStatusViewController tableView](self, "tableView"));
  objc_msgSend(v7, "setDataSource:", self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugIndexStatusViewController tableView](self, "tableView"));
  objc_msgSend(v8, "setDelegate:", self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugIndexStatusViewController tableView](self, "tableView"));
  objc_msgSend(v9, "setSeparatorStyle:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugIndexStatusViewController tableView](self, "tableView"));
  objc_msgSend(v10, "setAllowsSelection:", 1);

  v11 = objc_alloc_init((Class)NSNumberFormatter);
  -[MFMailDebugIndexStatusViewController setNumberFormatter:](self, "setNumberFormatter:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugIndexStatusViewController numberFormatter](self, "numberFormatter"));
  objc_msgSend(v12, "setGroupingSize:", 3);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugIndexStatusViewController numberFormatter](self, "numberFormatter"));
  objc_msgSend(v13, "setUsesGroupingSeparator:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugIndexStatusViewController numberFormatter](self, "numberFormatter"));
  objc_msgSend(v14, "setGroupingSeparator:", CFSTR(","));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugIndexStatusViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugIndexStatusViewController tableView](self, "tableView"));
  objc_msgSend(v15, "addSubview:", v16);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFMailDebugIndexStatusViewController;
  -[MFMailDebugIndexStatusViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[MFMailDebugIndexStatusViewController _refreshStatus](self, "_refreshStatus");
  -[MFMailDebugIndexStatusViewController _periodicallyRefreshStatus](self, "_periodicallyRefreshStatus");
  -[MFMailDebugIndexStatusViewController _startObservingTurboModeToggle](self, "_startObservingTurboModeToggle");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFMailDebugIndexStatusViewController;
  -[MFMailDebugIndexStatusViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[MFMailDebugIndexStatusViewController _stopRefreshingStatus](self, "_stopRefreshingStatus");
  -[MFMailDebugIndexStatusViewController _stopObservingTurboModeToggle](self, "_stopObservingTurboModeToggle");
}

- (void)_startObservingTurboModeToggle
{
  id v3;
  id v4;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v3, "setIdleTimerDisabled:", +[EMInternalPreferences preferenceEnabled:](EMInternalPreferences, "preferenceEnabled:", 27));

  v4 = (id)objc_claimAutoreleasedReturnValue(+[EMInternalPreferences observeChangesForPreference:usingBlock:](EMInternalPreferences, "observeChangesForPreference:usingBlock:", 27, &stru_1005215A8));
  -[MFMailDebugIndexStatusViewController setTurboModeObservationToken:](self, "setTurboModeObservationToken:");

}

- (void)_stopObservingTurboModeToggle
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v3, "setIdleTimerDisabled:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugIndexStatusViewController turboModeObservationToken](self, "turboModeObservationToken"));
  objc_msgSend(v4, "cancel");

  -[MFMailDebugIndexStatusViewController setTurboModeObservationToken:](self, "setTurboModeObservationToken:", 0);
}

- (id)_dataForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugIndexStatusViewController items](self, "items"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "section")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  v8 = objc_msgSend(v4, "row");
  if ((uint64_t)v8 >= (uint64_t)objc_msgSend(v7, "count"))
    v9 = 0;
  else
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));

  return v9;
}

- (id)_messagesIndexedInTimeInterval:(double)a3 currentMessagesIndexed:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  int v25;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugIndexStatusViewController indexSpeedsHistoryCache](self, "indexSpeedsHistoryCache"));

  if (!v6)
  {
    v7 = objc_alloc((Class)NSMutableArray);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", EDSearchableIndexDefaultsKeyIndexingDiagnostics));
    v9 = objc_msgSend(v7, "initWithArray:", v8);
    -[MFMailDebugIndexStatusViewController setIndexSpeedsHistoryCache:](self, "setIndexSpeedsHistoryCache:", v9);

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugIndexStatusViewController indexSpeedsHistoryCache](self, "indexSpeedsHistoryCache"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v30;
    v13 = a3 * 0.8;
    v14 = a3 * 1.2;
LABEL_5:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v12)
        objc_enumerationMutation(v10);
      v16 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v15);
      v17 = objc_autoreleasePoolPush();
      v18 = objc_msgSend(objc_alloc((Class)EDSearchableIndexDiagnosticsSnapshot), "initWithDictionary:", v16);
      v19 = v18;
      if (v18)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "date"));
        objc_msgSend(v20, "timeIntervalSinceNow");
        v22 = v21;

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "messagesIndexed"));
        v24 = objc_msgSend(v23, "integerValue");

        v25 = 1;
        if (a4 - (uint64_t)v24 >= 0 && v13 <= -v22 && v14 >= -v22)
        {
          v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4 - (_QWORD)v24));
          v25 = 0;
        }
      }
      else
      {
        v25 = 1;
      }

      objc_autoreleasePoolPop(v17);
      if (!v25)
        break;
      if (v11 == (id)++v15)
      {
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v11)
          goto LABEL_5;
        goto LABEL_19;
      }
    }
  }
  else
  {
LABEL_19:
    v6 = 0;
  }

  return v6;
}

- (id)_calculateIndexingSpeedWithMessagesIndexed:(int64_t)a3
{
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  double v9;
  double v10;
  int64_t v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugIndexStatusViewController lastKnownIndexCountDate](self, "lastKnownIndexCountDate"));
  if (!v6
    || (v7 = -[MFMailDebugIndexStatusViewController lastKnownIndexCount](self, "lastKnownIndexCount"),
        v6,
        !v7))
  {
    -[MFMailDebugIndexStatusViewController setCurrentIndexingSpeed:](self, "setCurrentIndexingSpeed:", 0);
    goto LABEL_6;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugIndexStatusViewController lastKnownIndexCountDate](self, "lastKnownIndexCountDate"));
  objc_msgSend(v5, "timeIntervalSinceDate:", v8);
  v10 = v9;

  if (v10 >= 5.0)
  {
    v11 = -[MFMailDebugIndexStatusViewController lastKnownIndexCount](self, "lastKnownIndexCount");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugIndexStatusViewController lastKnownIndexCountDate](self, "lastKnownIndexCountDate"));
    objc_msgSend(v5, "timeIntervalSinceDate:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(60 * (a3 - v11)) / v13));
    -[MFMailDebugIndexStatusViewController setCurrentIndexingSpeed:](self, "setCurrentIndexingSpeed:", v14);

LABEL_6:
    -[MFMailDebugIndexStatusViewController setLastKnownIndexCountDate:](self, "setLastKnownIndexCountDate:", v5);
    -[MFMailDebugIndexStatusViewController setLastKnownIndexCount:](self, "setLastKnownIndexCount:", a3);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugIndexStatusViewController currentIndexingSpeed](self, "currentIndexingSpeed"));

  return v15;
}

- (id)_reindexReasonsCache
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugIndexStatusViewController reindexReasonsCache](self, "reindexReasonsCache"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", EDSearchableIndexDefaultsKeyLastKnownReindexReasons));
    -[MFMailDebugIndexStatusViewController setReindexReasonsCache:](self, "setReindexReasonsCache:", v5);

  }
  return -[MFMailDebugIndexStatusViewController reindexReasonsCache](self, "reindexReasonsCache");
}

- (void)_periodicallyRefreshStatus
{
  void *v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100170658;
  v4[3] = &unk_10051F518;
  v4[4] = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 1, v4, 1.0));
  -[MFMailDebugIndexStatusViewController setRefreshTimer:](self, "setRefreshTimer:", v3);

}

- (void)_stopRefreshingStatus
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugIndexStatusViewController refreshTimer](self, "refreshTimer"));
  objc_msgSend(v3, "invalidate");

  -[MFMailDebugIndexStatusViewController setRefreshTimer:](self, "setRefreshTimer:", 0);
}

- (void)_refreshStatus
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "daemonInterface"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "diagnosticInfoGatherer"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001707C4;
  v5[3] = &unk_10051C488;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "databaseStatisticsWithCompletionHandler:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ((unint64_t)a4 > 4)
    return 0;
  else
    return *(&off_100521690 + a4);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  if (a4 == 4)
  {
    v7 = CFSTR("Showing up to last 50 recorded re-index reasons.");
  }
  else if (a4 == 3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugIndexStatusViewController items](self, "items"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", &off_1005418A8));
    v10 = objc_msgSend(v9, "count");

    if ((unint64_t)v10 < 4)
      v7 = CFSTR("Indexing speed history is available when we have sufficient data.");
    else
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Time window has an error margin of +/- %ld%%"), 20));
  }
  else if (a4)
  {
    v7 = 0;
  }
  else
  {
    v7 = CFSTR("Turbo mode keeps the display on, and ignores power assertions and indexing budgets to index messages at the maximum speed.");
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;
  id location;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugIndexStatusViewController _dataForIndexPath:](self, "_dataForIndexPath:", a4));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "primaryText"));
  v9 = v8;
  if (v8 == CFSTR("Turbo mode"))
  {
    v20 = objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Turbo mode"), 27));
LABEL_12:
    v10 = (id)v20;
    goto LABEL_13;
  }
  if (v8 == CFSTR("View chart"))
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100171BD0;
    v24[3] = &unk_10051B1B8;
    objc_copyWeak(&v25, &location);
    v10 = (id)objc_claimAutoreleasedReturnValue(+[DebugButtonCell cellWithTitle:style:handler:](DebugButtonCell, "cellWithTitle:style:handler:", CFSTR("View chart"), 2, v24));
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
    goto LABEL_13;
  }
  if (v8 == CFSTR("Reset speed statistics"))
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100171C74;
    v23[3] = &unk_10051AA98;
    v23[4] = self;
    v20 = objc_claimAutoreleasedReturnValue(+[DebugButtonCell cellWithTitle:style:handler:](DebugButtonCell, "cellWithTitle:style:handler:", CFSTR("Reset speed statistics"), 1, v23));
    goto LABEL_12;
  }
  if (v8 == CFSTR("Reset reindexing reasons"))
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100171CD0;
    v22[3] = &unk_10051AA98;
    v22[4] = self;
    v20 = objc_claimAutoreleasedReturnValue(+[DebugButtonCell cellWithTitle:style:handler:](DebugButtonCell, "cellWithTitle:style:handler:", CFSTR("Reset reindexing reasons"), 1, v22));
    goto LABEL_12;
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("DebugIndexStatusCell")));
  if (!v10)
  {
    v10 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("DebugIndexStatusCell"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
    objc_msgSend(v10, "setBackgroundColor:", v11);

    objc_msgSend(v10, "setSelectionStyle:", 0);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration cellConfiguration](UIListContentConfiguration, "cellConfiguration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "secondaryTextProperties"));
  objc_msgSend(v14, "setColor:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "primaryText"));
  objc_msgSend(v12, "setText:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "secondaryText"));
  objc_msgSend(v12, "setSecondaryText:", v16);

  objc_msgSend(v10, "setContentConfiguration:", v12);
  v17 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  objc_msgSend(v17, "setTextColor:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "labelText"));
  objc_msgSend(v17, "setText:", v19);

  objc_msgSend(v17, "sizeToFit");
  objc_msgSend(v10, "setAccessoryView:", v17);

LABEL_13:
  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugIndexStatusViewController items](self, "items", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));
  v8 = objc_msgSend(v7, "count");

  return (int64_t)v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugIndexStatusViewController items](self, "items", a3));
  v4 = objc_msgSend(v3, "count");

  return (int64_t)v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cellForRowAtIndexPath:", v5));
  v7 = objc_opt_class(DebugButtonCell);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    objc_msgSend(v6, "invokeAction");
  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v5, 1);

}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSMutableDictionary)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (int64_t)lastKnownIndexCount
{
  return self->_lastKnownIndexCount;
}

- (void)setLastKnownIndexCount:(int64_t)a3
{
  self->_lastKnownIndexCount = a3;
}

- (NSDate)lastKnownIndexCountDate
{
  return self->_lastKnownIndexCountDate;
}

- (void)setLastKnownIndexCountDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownIndexCountDate, a3);
}

- (NSNumber)currentIndexingSpeed
{
  return self->_currentIndexingSpeed;
}

- (void)setCurrentIndexingSpeed:(id)a3
{
  objc_storeStrong((id *)&self->_currentIndexingSpeed, a3);
}

- (EFCancelable)turboModeObservationToken
{
  return self->_turboModeObservationToken;
}

- (void)setTurboModeObservationToken:(id)a3
{
  objc_storeStrong((id *)&self->_turboModeObservationToken, a3);
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_numberFormatter, a3);
}

- (NSArray)indexSpeedsHistoryCache
{
  return self->_indexSpeedsHistoryCache;
}

- (void)setIndexSpeedsHistoryCache:(id)a3
{
  objc_storeStrong((id *)&self->_indexSpeedsHistoryCache, a3);
}

- (NSArray)reindexReasonsCache
{
  return self->_reindexReasonsCache;
}

- (void)setReindexReasonsCache:(id)a3
{
  objc_storeStrong((id *)&self->_reindexReasonsCache, a3);
}

- (NSTimer)refreshTimer
{
  return self->_refreshTimer;
}

- (void)setRefreshTimer:(id)a3
{
  objc_storeStrong((id *)&self->_refreshTimer, a3);
}

- (void)setReindexDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_reindexDateFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reindexDateFormatter, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_reindexReasonsCache, 0);
  objc_storeStrong((id *)&self->_indexSpeedsHistoryCache, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_turboModeObservationToken, 0);
  objc_storeStrong((id *)&self->_currentIndexingSpeed, 0);
  objc_storeStrong((id *)&self->_lastKnownIndexCountDate, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
