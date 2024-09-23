@implementation GeoRequestCounterTableViewController

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  id v5;
  int64_t currentDuration;
  unint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GeoRequestCounterTableViewController;
  -[GeoRequestCounterTableViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterDurations currentSelection](self->_durations, "currentSelection"));
  v5 = objc_msgSend(v4, "firstIndex");

  currentDuration = self->_currentDuration;
  if ((id)currentDuration != v5)
    self->_currentDuration = (int64_t)v5;
  v7 = -[GeoRequestCounterInterfaces currentInterfaces](self->_interfaces, "currentInterfaces");
  if (self->_currentInterfaces != v7)
  {
    self->_currentInterfaces = v7;
    goto LABEL_7;
  }
  if ((id)currentDuration != v5)
LABEL_7:
    -[GeoRequestCounterTableViewController _reloadData](self, "_reloadData");
}

- (void)viewDidLoad
{
  GeoRequestCounterDurations *v3;
  GeoRequestCounterDurations *durations;
  void *v5;
  GeoRequestCounterInterfaces *v6;
  GeoRequestCounterInterfaces *interfaces;
  void *v8;
  id v9;
  void *v10;
  NSDateIntervalFormatter *v11;
  NSDateIntervalFormatter *dateIntervalFormatter;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)GeoRequestCounterTableViewController;
  -[GeoRequestCounterTableViewController viewDidLoad](&v13, "viewDidLoad");
  v3 = objc_alloc_init(GeoRequestCounterDurations);
  durations = self->_durations;
  self->_durations = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterDurations currentSelection](self->_durations, "currentSelection"));
  self->_currentDuration = (int64_t)objc_msgSend(v5, "firstIndex");

  v6 = objc_alloc_init(GeoRequestCounterInterfaces);
  interfaces = self->_interfaces;
  self->_interfaces = v6;

  -[GeoRequestCounterTableViewController setTitle:](self, "setTitle:", CFSTR("geod Counters"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController reqCounter](self, "reqCounter"));
  self->_isLoggingEnabled = objc_msgSend(v8, "countersEnabled");

  v9 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 13, self, "_reloadData");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v10, "setRightBarButtonItem:", v9);

  v11 = (NSDateIntervalFormatter *)objc_alloc_init((Class)NSDateIntervalFormatter);
  dateIntervalFormatter = self->_dateIntervalFormatter;
  self->_dateIntervalFormatter = v11;

  -[NSDateIntervalFormatter setDateStyle:](self->_dateIntervalFormatter, "setDateStyle:", 1);
  -[NSDateIntervalFormatter setTimeStyle:](self->_dateIntervalFormatter, "setTimeStyle:", 1);

}

- (void)setIsLoggingEnabled:(BOOL)a3
{
  void *v4;
  id v5;

  self->_isLoggingEnabled = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController reqCounter](self, "reqCounter"));
  objc_msgSend(v4, "setCountersEnabled:", self->_isLoggingEnabled);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController tableView](self, "tableView"));
  objc_msgSend(v5, "reloadData");

}

- (GEORequestCounter)reqCounter
{
  GEORequestCounter *reqCounter;
  GEORequestCounter *v4;
  GEORequestCounter *v5;

  reqCounter = self->_reqCounter;
  if (!reqCounter)
  {
    v4 = (GEORequestCounter *)objc_alloc_init((Class)GEORequestCounter);
    v5 = self->_reqCounter;
    self->_reqCounter = v4;

    reqCounter = self->_reqCounter;
  }
  return reqCounter;
}

- (NSDictionary)appRequestDict
{
  void *v3;
  double v4;
  void *v5;
  _QWORD v7[5];

  if (!self->_appRequestDict && -[GeoRequestCounterTableViewController isLoggingEnabled](self, "isLoggingEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController reqCounter](self, "reqCounter"));
    -[GeoRequestCounterDurations currentDurationInterval](self->_durations, "currentDurationInterval");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -v4));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100A60BFC;
    v7[3] = &unk_1011E0C48;
    v7[4] = self;
    objc_msgSend(v3, "readRequestsPerAppSince:handler:", v5, v7);

  }
  return self->_appRequestDict;
}

- (void)setAppRequestDict:(id)a3
{
  id v4;
  NSDictionary *v5;
  NSDictionary *appRequestDict;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  if (self->_appRequestDict != a3)
  {
    v4 = a3;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100A60DF8;
    v11[3] = &unk_1011E0C70;
    v11[4] = self;
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v4, "count")));
    v12 = v10;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v11);

    v5 = (NSDictionary *)objc_msgSend(v10, "copy");
    appRequestDict = self->_appRequestDict;
    self->_appRequestDict = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_appRequestDict, "allKeys"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingSelector:", "compare:"));

    if (v8)
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v8));
    else
      v9 = 0;
    objc_storeStrong((id *)&self->_appRequestOrderedKeys, v9);
    if (v8)

  }
}

- (void)_fetchPlaceCacheReults
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController reqCounter](self, "reqCounter"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100A60EE0;
  v4[3] = &unk_1011AE168;
  v4[4] = self;
  objc_msgSend(v3, "placeCacheGetCounts:forApp:inTimeRange:ofType:handler:", 0, 0, 0, 0, v4);

}

- (NSDictionary)placeCacheResultsDict
{
  if (!self->_placeCacheResultsDict
    && -[GeoRequestCounterTableViewController isLoggingEnabled](self, "isLoggingEnabled"))
  {
    -[GeoRequestCounterTableViewController _fetchPlaceCacheReults](self, "_fetchPlaceCacheReults");
  }
  return self->_placeCacheResultsDict;
}

- (void)setPlaceCacheResultsDict:(id)a3
{
  NSDictionary *v4;
  NSDictionary *placeCacheResultsDict;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_placeCacheResultsDict != a3)
  {
    v4 = (NSDictionary *)objc_msgSend(a3, "copy");
    placeCacheResultsDict = self->_placeCacheResultsDict;
    self->_placeCacheResultsDict = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_placeCacheResultsDict, "allKeys"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortedArrayUsingSelector:", "compare:"));

    if (v9)
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v9));
    else
      v7 = 0;
    objc_storeStrong((id *)&self->_placeCacheCountsOrderedKeys, v7);
    v8 = v9;
    if (v9)
    {

      v8 = v9;
    }

  }
}

- (NSDictionary)placeCachePerAppCountsDict
{
  if (!self->_placeCachePerAppCountsDict
    && -[GeoRequestCounterTableViewController isLoggingEnabled](self, "isLoggingEnabled"))
  {
    -[GeoRequestCounterTableViewController _fetchPlaceCacheReults](self, "_fetchPlaceCacheReults");
  }
  return self->_placeCachePerAppCountsDict;
}

- (void)setPlaceCachePerAppCountsDict:(id)a3
{
  NSDictionary *v4;
  NSDictionary *placeCachePerAppCountsDict;

  if (self->_placeCachePerAppCountsDict != a3)
  {
    v4 = (NSDictionary *)objc_msgSend(a3, "copy");
    placeCachePerAppCountsDict = self->_placeCachePerAppCountsDict;
    self->_placeCachePerAppCountsDict = v4;

  }
}

- (void)requestLogs:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  NSArray *requestLogs;
  void *v7;
  double v8;
  void *v9;
  _QWORD v10[5];
  void (**v11)(_QWORD, _QWORD);

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  requestLogs = self->_requestLogs;
  if (requestLogs)
  {
    (*((void (**)(id, NSArray *))v4 + 2))(v4, requestLogs);
  }
  else if (-[GeoRequestCounterTableViewController isLoggingEnabled](self, "isLoggingEnabled"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController reqCounter](self, "reqCounter"));
    -[GeoRequestCounterDurations currentDurationInterval](self->_durations, "currentDurationInterval");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -v8));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100A61668;
    v10[3] = &unk_1011ADA50;
    v10[4] = self;
    v11 = v5;
    objc_msgSend(v7, "readRequestLogsSince:handler:", v9, v10);

  }
  else
  {
    v5[2](v5, 0);
  }

}

- (NSArray)routePreloadSessions
{
  unsigned int v3;
  NSArray *routePreloadSessions;
  void *v5;
  double v6;
  void *v7;
  _QWORD v9[5];

  v3 = -[GeoRequestCounterTableViewController isLoggingEnabled](self, "isLoggingEnabled");
  routePreloadSessions = self->_routePreloadSessions;
  if (v3 && !routePreloadSessions)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController reqCounter](self, "reqCounter"));
    -[GeoRequestCounterDurations currentDurationInterval](self->_durations, "currentDurationInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -v6));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100A61894;
    v9[3] = &unk_1011B7B30;
    v9[4] = self;
    objc_msgSend(v5, "fetchRoutePreloadSessionsFrom:completion:completionQueue:", v7, v9, &_dispatch_main_q);

    routePreloadSessions = self->_routePreloadSessions;
  }
  return routePreloadSessions;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (-[GeoRequestCounterTableViewController isLoggingEnabled](self, "isLoggingEnabled", a3))
    return 6;
  else
    return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = 1;
  switch(a4)
  {
    case 0:
      if (-[GeoRequestCounterTableViewController isLoggingEnabled](self, "isLoggingEnabled"))
        v7 = 4;
      else
        v7 = 1;
      break;
    case 1:
    case 2:
      break;
    case 3:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController appRequestDict](self, "appRequestDict"));
      goto LABEL_9;
    case 4:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController placeCacheResultsDict](self, "placeCacheResultsDict"));
      goto LABEL_9;
    case 5:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController routePreloadSessions](self, "routePreloadSessions"));
LABEL_9:
      v9 = v8;
      v7 = (int64_t)objc_msgSend(v8, "count");

      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ((unint64_t)a4 > 5)
    return 0;
  else
    return *(&off_1011E0CE0 + a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  NSDateIntervalFormatter *dateIntervalFormatter;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;

  v6 = a3;
  v64 = a4;
  switch((unint64_t)objc_msgSend(v64, "section"))
  {
    case 0uLL:
      v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
      switch((unint64_t)objc_msgSend(v64, "row"))
      {
        case 0uLL:
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
          objc_msgSend(v8, "setText:", CFSTR("Enable Counter"));

          v9 = objc_alloc_init((Class)UISwitch);
          objc_msgSend(v9, "setOn:", -[GeoRequestCounterTableViewController isLoggingEnabled](self, "isLoggingEnabled"));
          objc_msgSend(v9, "addTarget:action:forControlEvents:", self, "_toggleLogging", 4096);
          objc_msgSend(v7, "setAccessoryView:", v9);
          objc_msgSend(v7, "setSelectionStyle:", 0);
          goto LABEL_27;
        case 1uLL:
          v57 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 1, 0);

          objc_msgSend(v57, "setSelectionStyle:", 3);
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "textLabel"));
          objc_msgSend(v58, "setText:", CFSTR("Duration"));

          v59 = 88;
          goto LABEL_31;
        case 2uLL:
          v57 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 1, 0);

          objc_msgSend(v57, "setSelectionStyle:", 3);
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "textLabel"));
          objc_msgSend(v60, "setText:", CFSTR("Interface Filters"));

          v59 = 104;
LABEL_31:
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v59), "currentSelectionString"));
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "detailTextLabel"));
          objc_msgSend(v62, "setText:", v61);

          objc_msgSend(v57, "setAccessoryType:", 1);
          v7 = v57;
          break;
        case 3uLL:
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
          objc_msgSend(v63, "setText:", CFSTR("Clear Logs"));

          break;
        default:
          goto LABEL_28;
      }
      break;
    case 1uLL:
      v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
      objc_msgSend(v18, "setText:", CFSTR("Total Counts"));

      v19 = -[GeoRequestCounterTableViewController getTotalRequestCountForAllApps](self, "getTotalRequestCountForAllApps");
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController getXmitBytesForAllApps](self, "getXmitBytesForAllApps"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController getRecvBytesForAllApps](self, "getRecvBytesForAllApps"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld requests : xmit:%@ / recv:%@"), v19, v20, v21));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detailTextLabel"));
      objc_msgSend(v23, "setText:", v22);

      goto LABEL_11;
    case 2uLL:
      v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
      objc_msgSend(v24, "setText:", CFSTR("Total Counts"));

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld hits / %ld misses / %ld expired"), self->_totalCacheHits, self->_totalCacheMisses, self->_totalCacheExpired));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detailTextLabel"));
      objc_msgSend(v26, "setText:", v25);

LABEL_11:
      objc_msgSend(v7, "setAccessoryType:", 1);
      break;
    case 3uLL:
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("AppRequests")));
      if (!v7)
        v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, CFSTR("AppRequests"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController appRequestOrderedKeys](self, "appRequestOrderedKeys"));
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndex:", objc_msgSend(v64, "row")));

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController view](self, "view"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "window"));
      if (v29)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController view](self, "view"));
        v31 = v6;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "window"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "screen"));
        objc_msgSend(v33, "scale");
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v9, 0));

        v6 = v31;
      }
      else
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
        objc_msgSend(v30, "scale");
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v9, 0));
      }

      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageView"));
      objc_msgSend(v47, "setImage:", v17);

      v48 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController appRequestDict](self, "appRequestDict"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", v9));

      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
      objc_msgSend(v50, "setText:", v9);

      v51 = -[GeoRequestCounterTableViewController getTotalRequestCountFor:](self, "getTotalRequestCountFor:", v49);
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", objc_msgSend(v49, "xmitBytes"), 3));
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", objc_msgSend(v49, "recvBytes"), 3));
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld requests : xmit:%@ / recv:%@"), v51, v52, v53));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detailTextLabel"));
      objc_msgSend(v55, "setText:", v54);

      objc_msgSend(v7, "setAccessoryType:", 1);
      goto LABEL_26;
    case 4uLL:
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("CacheRequests")));
      if (!v7)
        v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, CFSTR("CacheRequests"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController placeCacheCountsOrderedKeys](self, "placeCacheCountsOrderedKeys"));
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v64, "row")));

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController view](self, "view"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "window"));
      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController view](self, "view"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "window"));
        v15 = v6;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "screen"));
        objc_msgSend(v16, "scale");
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v9, 0));

        v6 = v15;
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
        objc_msgSend(v13, "scale");
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v9, 0));
      }

      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageView"));
      objc_msgSend(v43, "setImage:", v17);

      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
      objc_msgSend(v44, "setText:", v9);

      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld hits / %ld misses / %ld expired"), -[GeoRequestCounterTableViewController getCacheHitsForApp:](self, "getCacheHitsForApp:", v9), -[GeoRequestCounterTableViewController getCacheMissesForApp:](self, "getCacheMissesForApp:", v9), -[GeoRequestCounterTableViewController getCacheExpiredForApp:](self, "getCacheExpiredForApp:", v9)));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detailTextLabel"));
      objc_msgSend(v46, "setText:", v45);

      objc_msgSend(v7, "setAccessoryType:", 1);
LABEL_26:

      goto LABEL_27;
    case 5uLL:
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("RoutePreloadSession")));
      if (!v7)
        v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, CFSTR("RoutePreloadSession"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController routePreloadSessions](self, "routePreloadSessions"));
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectAtIndexedSubscript:", objc_msgSend(v64, "row")));

      dateIntervalFormatter = self->_dateIntervalFormatter;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateInterval"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateIntervalFormatter stringFromDateInterval:](dateIntervalFormatter, "stringFromDateInterval:", v36));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
      objc_msgSend(v38, "setText:", v37);

      v39 = objc_msgSend(v9, "transportType");
      if (v39 >= 7)
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v39));
      else
        v40 = *(&off_1011E0D10 + (int)v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Preloaded: %llu - Missed: %llu / %llu"), v40, objc_msgSend(v9, "tilesPreloaded"), objc_msgSend(v9, "tilesMissed"), objc_msgSend(v9, "tilesUsed")));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detailTextLabel"));
      objc_msgSend(v42, "setText:", v41);

      objc_msgSend(v7, "setAccessoryType:", 0);
      objc_msgSend(v7, "setSelectionStyle:", 0);

LABEL_27:
      break;
    default:
      v7 = 0;
      break;
  }
LABEL_28:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  GeoRequestCounterSelectionTableViewController *v6;
  uint64_t v7;
  GeoTotalRequestCountTableViewController *v8;
  void *v9;
  GeoRequestCounterSelectionTableViewController *v10;
  GeoPlaceCacheDetailTableViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  GeoRequestDetailTableViewController *v15;
  void *v16;
  void *v17;
  GeoRequestDetailTableViewController *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a4;
  switch((unint64_t)objc_msgSend(v22, "section"))
  {
    case 0uLL:
      v5 = objc_msgSend(v22, "row");
      if (v5 == (id)3)
      {
        -[GeoRequestCounterTableViewController _resetLogs](self, "_resetLogs");
      }
      else
      {
        if (v5 == (id)2)
        {
          v6 = [GeoRequestCounterSelectionTableViewController alloc];
          v7 = 104;
          goto LABEL_15;
        }
        if (v5 == (id)1)
        {
          v6 = [GeoRequestCounterSelectionTableViewController alloc];
          v7 = 88;
LABEL_15:
          v10 = -[GeoRequestCounterSelectionTableViewController initWithSelection:](v6, "initWithSelection:", *(Class *)((char *)&self->super.super.super.super.isa + v7));
          goto LABEL_16;
        }
      }
LABEL_18:

      return;
    case 1uLL:
      v8 = [GeoTotalRequestCountTableViewController alloc];
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController appRequestDict](self, "appRequestDict"));
      v10 = -[GeoTotalRequestCountTableViewController initWithDictionary:](v8, "initWithDictionary:", v9);

      v11 = (GeoPlaceCacheDetailTableViewController *)v10;
      goto LABEL_8;
    case 2uLL:
      v11 = -[GeoPlaceCacheDetailTableViewController initWithGEORequestCounterCacheResults:]([GeoPlaceCacheDetailTableViewController alloc], "initWithGEORequestCounterCacheResults:", self->_placeCacheResults);
      v10 = (GeoRequestCounterSelectionTableViewController *)v11;
LABEL_8:
      -[GeoPlaceCacheDetailTableViewController setTitle:](v11, "setTitle:", CFSTR("Total Request"));
LABEL_16:
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController navigationController](self, "navigationController"));
      objc_msgSend(v21, "pushViewController:animated:", v10, 1);

      goto LABEL_17;
    case 3uLL:
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController appRequestOrderedKeys](self, "appRequestOrderedKeys"));
      v10 = (GeoRequestCounterSelectionTableViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v22, "row")));

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController appRequestDict](self, "appRequestDict"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v10));

      v15 = -[GeoRequestDetailTableViewController initWithGEORequestCounterInfo:]([GeoRequestDetailTableViewController alloc], "initWithGEORequestCounterInfo:", v14);
      goto LABEL_11;
    case 4uLL:
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController placeCacheCountsOrderedKeys](self, "placeCacheCountsOrderedKeys"));
      v10 = (GeoRequestCounterSelectionTableViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v22, "row")));

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController placeCacheResultsDict](self, "placeCacheResultsDict"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v10));

      v15 = -[GeoPlaceCacheDetailTableViewController initWithGEORequestCounterCacheResults:]([GeoPlaceCacheDetailTableViewController alloc], "initWithGEORequestCounterCacheResults:", v14);
LABEL_11:
      v18 = v15;
      -[GeoRequestDetailTableViewController setTitle:](v15, "setTitle:", v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController navigationController](self, "navigationController"));
      objc_msgSend(v19, "pushViewController:animated:", v18, 1);

LABEL_17:
      goto LABEL_18;
    case 5uLL:
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController tableView](self, "tableView"));
      objc_msgSend(v20, "deselectRowAtIndexPath:animated:", v22, 1);

      goto LABEL_18;
    default:
      goto LABEL_18;
  }
}

- (void)_toggleLogging
{
  -[GeoRequestCounterTableViewController setIsLoggingEnabled:](self, "setIsLoggingEnabled:", -[GeoRequestCounterTableViewController isLoggingEnabled](self, "isLoggingEnabled") ^ 1);
}

- (void)_resetLogs
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController reqCounter](self, "reqCounter"));
  objc_msgSend(v3, "clearCounters");

  -[GeoRequestCounterTableViewController _reloadData](self, "_reloadData");
  v5 = objc_alloc_init((Class)UIAlertController);
  objc_msgSend(v5, "setTitle:", CFSTR("GEO Request Counter"));
  objc_msgSend(v5, "setMessage:", CFSTR("Logged Data has been cleared."));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("OK"), 2, 0));
  objc_msgSend(v5, "addAction:", v4);

  -[GeoRequestCounterTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (void)_reloadData
{
  NSDictionary *appRequestDict;
  NSArray *requestLogs;
  NSArray *placeCacheResults;
  NSDictionary *placeCacheResultsDict;
  NSDictionary *placeCachePerAppCountsDict;
  NSOrderedSet *placeCacheCountsOrderedKeys;
  id v9;

  appRequestDict = self->_appRequestDict;
  self->_appRequestDict = 0;

  requestLogs = self->_requestLogs;
  self->_requestLogs = 0;

  placeCacheResults = self->_placeCacheResults;
  self->_placeCacheResults = 0;

  placeCacheResultsDict = self->_placeCacheResultsDict;
  self->_placeCacheResultsDict = 0;

  placeCachePerAppCountsDict = self->_placeCachePerAppCountsDict;
  self->_placeCachePerAppCountsDict = 0;

  placeCacheCountsOrderedKeys = self->_placeCacheCountsOrderedKeys;
  self->_placeCacheCountsOrderedKeys = 0;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController tableView](self, "tableView"));
  objc_msgSend(v9, "reloadData");

}

- (int64_t)getTotalRequestCountFor:(id)a3
{
  id v3;
  int64_t v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100A62810;
  v6[3] = &unk_1011E0CC0;
  v8 = &v9;
  v3 = a3;
  v7 = v3;
  objc_msgSend(v3, "enumerateRequestTypes:", v6);
  v4 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (int64_t)getTotalRequestCountForAllApps
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  int64_t v8;
  uint64_t v9;
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController appRequestDict](self, "appRequestDict"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        v8 += -[GeoRequestCounterTableViewController getTotalRequestCountFor:](self, "getTotalRequestCountFor:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), (_QWORD)v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getXmitBytesForAllApps
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController appRequestDict](self, "appRequestDict"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v7 += (uint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "xmitBytes", (_QWORD)v12);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", v7, 3));
  return v10;
}

- (id)getRecvBytesForAllApps
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestCounterTableViewController appRequestDict](self, "appRequestDict"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v7 += (uint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "recvBytes", (_QWORD)v12);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", v7, 3));
  return v10;
}

- (unint64_t)_getCacheTotal:(unsigned __int8)a3 forApp:(id)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_placeCachePerAppCountsDict, "objectForKeyedSubscript:", a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  v8 = objc_msgSend(v7, "unsignedIntegerValue");
  return (unint64_t)v8;
}

- (unint64_t)getCacheHitsForApp:(id)a3
{
  return -[GeoRequestCounterTableViewController _getCacheTotal:forApp:](self, "_getCacheTotal:forApp:", 1, a3);
}

- (unint64_t)getCacheMissesForApp:(id)a3
{
  return -[GeoRequestCounterTableViewController _getCacheTotal:forApp:](self, "_getCacheTotal:forApp:", 2, a3);
}

- (unint64_t)getCacheExpiredForApp:(id)a3
{
  return -[GeoRequestCounterTableViewController _getCacheTotal:forApp:](self, "_getCacheTotal:forApp:", 3, a3);
}

- (void)setRoutePreloadSessions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isLoggingEnabled
{
  return self->_isLoggingEnabled;
}

- (void)setReqCounter:(id)a3
{
  objc_storeStrong((id *)&self->_reqCounter, a3);
}

- (NSOrderedSet)appRequestOrderedKeys
{
  return self->_appRequestOrderedKeys;
}

- (void)setAppRequestOrderedKeys:(id)a3
{
  objc_storeStrong((id *)&self->_appRequestOrderedKeys, a3);
}

- (NSOrderedSet)placeCacheCountsOrderedKeys
{
  return self->_placeCacheCountsOrderedKeys;
}

- (void)setPlaceCacheCountsOrderedKeys:(id)a3
{
  objc_storeStrong((id *)&self->_placeCacheCountsOrderedKeys, a3);
}

- (NSOrderedSet)trafficProbeOrderedKeys
{
  return self->_trafficProbeOrderedKeys;
}

- (void)setTrafficProbeOrderedKeys:(id)a3
{
  objc_storeStrong((id *)&self->_trafficProbeOrderedKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficProbeOrderedKeys, 0);
  objc_storeStrong((id *)&self->_placeCacheCountsOrderedKeys, 0);
  objc_storeStrong((id *)&self->_appRequestOrderedKeys, 0);
  objc_storeStrong((id *)&self->_reqCounter, 0);
  objc_storeStrong((id *)&self->_interfaces, 0);
  objc_storeStrong((id *)&self->_durations, 0);
  objc_storeStrong((id *)&self->_dateIntervalFormatter, 0);
  objc_storeStrong((id *)&self->_routePreloadSessions, 0);
  objc_storeStrong((id *)&self->_requestLogs, 0);
  objc_storeStrong((id *)&self->_placeCachePerAppCountsDict, 0);
  objc_storeStrong((id *)&self->_placeCacheResultsDict, 0);
  objc_storeStrong((id *)&self->_placeCacheResults, 0);
  objc_storeStrong((id *)&self->_appRequestDict, 0);
}

@end
