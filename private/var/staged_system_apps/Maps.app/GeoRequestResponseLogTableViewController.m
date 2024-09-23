@implementation GeoRequestResponseLogTableViewController

- (GeoRequestResponseLogTableViewController)initWithStyle:(int64_t)a3
{
  GeoRequestResponseLogTableViewController *v3;
  NSISO8601DateFormatter *v4;
  NSISO8601DateFormatter *dateFormatter;
  void *v6;
  NSByteCountFormatter *v7;
  NSByteCountFormatter *byteFormatter;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GeoRequestResponseLogTableViewController;
  v3 = -[GeoRequestResponseLogTableViewController initWithStyle:](&v10, "initWithStyle:", a3);
  if (v3)
  {
    v4 = (NSISO8601DateFormatter *)objc_alloc_init((Class)NSISO8601DateFormatter);
    dateFormatter = v3->_dateFormatter;
    v3->_dateFormatter = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
    -[NSISO8601DateFormatter setTimeZone:](v3->_dateFormatter, "setTimeZone:", v6);

    v7 = (NSByteCountFormatter *)objc_alloc_init((Class)NSByteCountFormatter);
    byteFormatter = v3->_byteFormatter;
    v3->_byteFormatter = v7;

    -[NSByteCountFormatter setAdaptive:](v3->_byteFormatter, "setAdaptive:", 1);
    -[NSByteCountFormatter setAllowedUnits:](v3->_byteFormatter, "setAllowedUnits:", 0);
  }
  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GeoRequestResponseLogTableViewController;
  -[GeoRequestResponseLogTableViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  self->_isLoggingEnabled = GEOConfigGetBOOL(GeoServicesConfig_MapsRequestResponseLoggingPersisted[0], GeoServicesConfig_MapsRequestResponseLoggingPersisted[1]);
  _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_MapsRequestResponseLoggingPersisted[0], GeoServicesConfig_MapsRequestResponseLoggingPersisted[1], &_dispatch_main_q, self);
  -[GeoRequestResponseLogTableViewController _reloadLogsAsync](self, "_reloadLogsAsync");
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v4;
  GEORequestResponsePersister *logPersister;
  NSArray *logEntries;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GeoRequestResponseLogTableViewController;
  -[GeoRequestResponseLogTableViewController viewDidDisappear:](&v7, "viewDidDisappear:", a3);
  GEOConfigRemoveDelegateListenerForAllKeys(self, v4);
  logPersister = self->_logPersister;
  self->_logPersister = 0;

  logEntries = self->_logEntries;
  self->_logEntries = 0;

}

- (void)_reloadLogsAsync
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(25, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026A0B4;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_reloadLogsSync
{
  GEORequestResponsePersister *v3;
  GEORequestResponsePersister *logPersister;
  void *v5;
  GEORequestResponsePersister *v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  _QWORD v12[4];
  id v13;

  if (!self->_logPersister)
  {
    v3 = (GEORequestResponsePersister *)objc_msgSend(objc_alloc((Class)GEORequestResponsePersister), "initWritable:", 1);
    logPersister = self->_logPersister;
    self->_logPersister = v3;

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = self->_logPersister;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10026A1CC;
  v12[3] = &unk_1011AE2E0;
  v7 = v5;
  v13 = v7;
  v8 = -[GEORequestResponsePersister enumerateAllEntriesWithBlock:](v6, "enumerateAllEntriesWithBlock:", v12);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026A1EC;
  block[3] = &unk_1011AC8B0;
  block[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  id v4;

  self->_isLoggingEnabled = GEOConfigGetBOOL(GeoServicesConfig_MapsRequestResponseLoggingPersisted[0], GeoServicesConfig_MapsRequestResponseLoggingPersisted[1]);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[GeoRequestResponseLogTableViewController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadData");

}

- (void)_toggleLogging
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  GEOConfigSetBOOL(GeoServicesConfig_MapsRequestResponseLoggingPersisted[0], GeoServicesConfig_MapsRequestResponseLoggingPersisted[1], !self->_isLoggingEnabled);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestResponseLogTableViewController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 1, 0));
  v6 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  objc_msgSend(v3, "reloadRowsAtIndexPaths:withRowAnimation:", v5, 100);

}

- (void)_rebuildDB
{
  id v2;
  _QWORD v3[4];
  GeoRequestResponseLogTableViewController *v4;
  id v5;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10026A424;
  v3[3] = &unk_1011AC8B0;
  v4 = self;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Rebuilding DB"), CFSTR("This might take a minute..."), 0));
  v2 = v5;
  -[GeoRequestResponseLogTableViewController presentViewController:animated:completion:](v4, "presentViewController:animated:completion:", v2, 1, v3);

}

- (void)_rebuildComplete:(unsigned int)a3 error:(id)a4
{
  uint64_t v4;
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v10 = v6;
  if (v6)
  {
    -[GeoRequestResponseLogTableViewController _showError:forTask:](self, "_showError:forTask:", v6, CFSTR("Rebuilding DB"));
  }
  else
  {
    if ((_DWORD)v4)
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Restored %u log messages"), v4, 0));
    else
      v7 = CFSTR("No missing logs found");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Complete"), v7, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Ok"), 0, 0));
    objc_msgSend(v8, "addAction:", v9);

    -[GeoRequestResponseLogTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  }

}

- (void)_confirmFlushDB
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  if (-[NSArray count](self->_logEntries, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Delete All Logs?"), CFSTR("Are you sure you want to delete ALL the logs?"), 0));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0));
    objc_msgSend(v3, "addAction:", v4);

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10026A824;
    v6[3] = &unk_1011AD938;
    v6[4] = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Delete"), 2, v6));
    objc_msgSend(v3, "addAction:", v5);

    -[GeoRequestResponseLogTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);
  }
}

- (void)_reallyFlushDB
{
  void *v3;
  void *v4;
  void *v5;
  dispatch_queue_global_t global_queue;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_logEntries, "lastObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingTimeInterval:", 1.0));

  global_queue = dispatch_get_global_queue(25, 0);
  v7 = objc_claimAutoreleasedReturnValue(global_queue);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10026A8FC;
  v9[3] = &unk_1011AC8B0;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, v9);

}

- (void)_showError:(id)a3 forTask:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Received error while %@: %@"), a4, a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Operation Failed"), v7, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Ok"), 0, 0));
  objc_msgSend(v5, "addAction:", v6);

  -[GeoRequestResponseLogTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;

  v6 = a3;
  if (a4)
  {
    if (a4 == 1)
      v7 = -[NSArray count](self->_logEntries, "count");
    else
      v7 = 0;
  }
  else
  {
    v7 = 7;
  }

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 == 1)
    return CFSTR("Logs");
  else
    return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  __CFString *v11;
  uint64_t Date;
  uint64_t v13;
  __CFString *v14;
  uint64_t Set;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  NSISO8601DateFormatter *v24;
  void *v25;
  void *v26;
  NSISO8601DateFormatter *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSISO8601DateFormatter *dateFormatter;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;

  v5 = a4;
  v6 = objc_msgSend(v5, "section");
  if (v6 == (id)1)
  {
    v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_logEntries, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));
    v10 = objc_msgSend(v9, "messageType");
    switch((int)v10)
    {
      case 1005:
        v11 = CFSTR("GEOPlaceSearchFeedback");
        break;
      case 1006:
      case 1007:
      case 1008:
      case 1011:
      case 1012:
      case 1018:
      case 1019:
      case 1020:
      case 1022:
      case 1023:
LABEL_35:
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v10));
        break;
      case 1009:
        v11 = CFSTR("GEORPProblemCollection");
        break;
      case 1010:
        v11 = CFSTR("GEORPProblemStatus");
        break;
      case 1013:
        v11 = CFSTR("GEORPProblemOptIn");
        break;
      case 1014:
        v11 = CFSTR("GEORPProblem");
        break;
      case 1015:
        v11 = CFSTR("GEORPFeedback");
        break;
      case 1016:
        v11 = CFSTR("GEOABAssignment");
        break;
      case 1017:
        v11 = CFSTR("GEOLogCollection");
        break;
      case 1021:
        v11 = CFSTR("GEOSpatialLookupBatch");
        break;
      case 1024:
        v11 = CFSTR("GEOImageService");
        break;
      case 1025:
        v11 = CFSTR("GEOWiFiQualityService");
        break;
      case 1026:
        v11 = CFSTR("GEOTransitRouteUpdate");
        break;
      case 1027:
        v11 = CFSTR("GEOAddressCorrectionTaggedLocation");
        break;
      case 1028:
        v11 = CFSTR("GEOPBOfflineDataKeys");
        break;
      default:
        switch((int)v10)
        {
          case '+':
            v11 = CFSTR("GEOPlaceSearch");
            break;
          case ',':
            v11 = CFSTR("GEODirections");
            break;
          case '-':
          case '/':
          case '3':
          case '7':
          case '8':
          case '9':
          case ';':
            goto LABEL_35;
          case '.':
            v11 = CFSTR("GEOLocationShift");
            break;
          case '0':
            v11 = CFSTR("GEOETATrafficUpdate");
            break;
          case '1':
            v11 = CFSTR("GEOBatchRevGeocode");
            break;
          case '2':
            v11 = CFSTR("GEOPolyLocationShift");
            break;
          case '4':
            v11 = CFSTR("GEOETA");
            break;
          case '5':
            v11 = CFSTR("GEOAddressCorrectionInit");
            break;
          case '6':
            v11 = CFSTR("GEOAddressCorrectionUpdate");
            break;
          case ':':
            v11 = CFSTR("GEOBusinessResolution");
            break;
          case '<':
            v11 = CFSTR("GEOPDPlace");
            break;
          default:
            if ((_DWORD)v10)
              goto LABEL_35;
            v11 = CFSTR("Unknown");
            break;
        }
        break;
    }
    v37 = objc_msgSend(v9, "eventType");
    if (v37 >= 3)
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v37));
    else
      v38 = *(&off_1011AE4B8 + (int)v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSByteCountFormatter stringFromByteCount:](self->_byteFormatter, "stringFromByteCount:", objc_msgSend(v9, "size")));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - %@ %@"), v11, v38, v39));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
    objc_msgSend(v41, "setText:", v40);

    dateFormatter = self->_dateFormatter;
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timestamp"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v43));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appId"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - %@"), v44, v45));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detailTextLabel"));
    objc_msgSend(v47, "setText:", v46);

    objc_msgSend(v7, "setAccessoryType:", 1);
    goto LABEL_66;
  }
  if (!v6)
  {
    switch((unint64_t)objc_msgSend(v5, "row"))
    {
      case 0uLL:
        v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
        objc_msgSend(v7, "setSelectionStyle:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
        objc_msgSend(v8, "setText:", CFSTR("Enable Full Request Response Logging"));

        v9 = objc_alloc_init((Class)UISwitch);
        objc_msgSend(v9, "setOn:", self->_isLoggingEnabled);
        objc_msgSend(v9, "addTarget:action:forControlEvents:", self, "_toggleLogging", 4096);
        objc_msgSend(v7, "setAccessoryView:", v9);
        break;
      case 1uLL:
        Date = GEOConfigGetDate(GeoServicesConfig_MapsRequestResponseLoggingPersistedStopAt[0], GeoServicesConfig_MapsRequestResponseLoggingPersistedStopAt[1]);
        v13 = objc_claimAutoreleasedReturnValue(Date);
        v9 = (id)v13;
        if (self->_isLoggingEnabled)
        {
          if (v13)
            v14 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v13));
          else
            v14 = CFSTR("never");
        }
        else
        {
          v14 = CFSTR("logging is off");
        }
        v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
        objc_msgSend(v7, "setSelectionStyle:", 3);
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Turn off at: %@"), v14));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
        objc_msgSend(v49, "setText:", v48);

        objc_msgSend(v7, "setAccessoryType:", 1);
        goto LABEL_65;
      case 2uLL:
        Set = GEOConfigGetSet(GeoServicesConfig_MapsRequestResponseLoggingPersistedLimitBundleIds[0], GeoServicesConfig_MapsRequestResponseLoggingPersistedLimitBundleIds[1]);
        v9 = (id)objc_claimAutoreleasedReturnValue(Set);
        v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, 0);
        objc_msgSend(v7, "setSelectionStyle:", 3);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
        objc_msgSend(v16, "setText:", CFSTR("Limit to BundleIds"));

        if (objc_msgSend(v9, "count"))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "componentsJoinedByString:", CFSTR(",")));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detailTextLabel"));
          objc_msgSend(v19, "setText:", v18);

        }
        else
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detailTextLabel"));
          objc_msgSend(v17, "setText:", CFSTR("<all>"));
        }

        objc_msgSend(v7, "setAccessoryType:", 1);
        break;
      case 3uLL:
        v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, 0);
        objc_msgSend(v7, "setSelectionStyle:", 3);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Entries: %u"), -[NSArray count](self->_logEntries, "count")));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
        objc_msgSend(v21, "setText:", v20);

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detailTextLabel"));
        objc_msgSend(v22, "setText:", CFSTR("(tap to refresh)"));

        v9 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detailTextLabel"));
        goto LABEL_34;
      case 4uLL:
        v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, 0);
        objc_msgSend(v7, "setSelectionStyle:", 0);
        v24 = self->_dateFormatter;
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_logEntries, "firstObject"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "timestamp"));
        v9 = (id)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter stringFromDate:](v24, "stringFromDate:", v26));

        v27 = self->_dateFormatter;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_logEntries, "lastObject"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "timestamp"));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter stringFromDate:](v27, "stringFromDate:", v29));

        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
        objc_msgSend(v30, "setText:", CFSTR("Time Range"));

        if (v9 && v14)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - %@"), v9, v14));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detailTextLabel"));
          objc_msgSend(v32, "setText:", v31);

        }
        else
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detailTextLabel"));
          objc_msgSend(v31, "setText:", CFSTR("no logs found"));
        }

        goto LABEL_65;
      case 5uLL:
        v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
        objc_msgSend(v7, "setSelectionStyle:", 3);
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
        objc_msgSend(v33, "setText:", CFSTR("Rebuild Database"));

        v34 = objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
        goto LABEL_33;
      case 6uLL:
        v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
        if (-[NSArray count](self->_logEntries, "count"))
          v35 = 3;
        else
          v35 = 0;
        objc_msgSend(v7, "setSelectionStyle:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
        objc_msgSend(v36, "setText:", CFSTR("Delete All Logs"));

        if (-[NSArray count](self->_logEntries, "count"))
          v34 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
        else
          v34 = objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
LABEL_33:
        v9 = (id)v34;
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
LABEL_34:
        v14 = v23;
        -[__CFString setTextColor:](v23, "setTextColor:", v9);
LABEL_65:

        break;
      default:
        goto LABEL_5;
    }
LABEL_66:

    goto LABEL_67;
  }
LABEL_5:
  v7 = 0;
LABEL_67:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  GeoRequestResponseLogBundleIdTableViewController *v8;
  GeoRequestResponseLogDetailViewController *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "section");
  if (v7 == (id)1)
  {
    v8 = (GeoRequestResponseLogBundleIdTableViewController *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_logEntries, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
    v9 = -[GeoRequestResponseLogDetailViewController initWithEvent:]([GeoRequestResponseLogDetailViewController alloc], "initWithEvent:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestResponseLogTableViewController navigationController](self, "navigationController"));
    objc_msgSend(v10, "pushViewController:animated:", v9, 1);

LABEL_6:
  }
  else if (!v7)
  {
    switch((unint64_t)objc_msgSend(v6, "row"))
    {
      case 1uLL:
        -[GeoRequestResponseLogTableViewController _showDatePickerFrom:](self, "_showDatePickerFrom:", v6);
        break;
      case 2uLL:
        v8 = objc_alloc_init(GeoRequestResponseLogBundleIdTableViewController);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestResponseLogTableViewController navigationController](self, "navigationController"));
        objc_msgSend(v11, "pushViewController:animated:", v8, 1);

        goto LABEL_6;
      case 3uLL:
        -[GeoRequestResponseLogTableViewController _reloadLogsAsync](self, "_reloadLogsAsync");
        break;
      case 5uLL:
        -[GeoRequestResponseLogTableViewController _rebuildDB](self, "_rebuildDB");
        goto LABEL_11;
      case 6uLL:
        -[GeoRequestResponseLogTableViewController _confirmFlushDB](self, "_confirmFlushDB");
LABEL_11:
        objc_msgSend(v12, "deselectRowAtIndexPath:animated:", v6, 1);
        break;
      default:
        break;
    }
  }

}

- (void)_showDatePickerFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  GeoRequestResponseLogDatePickerViewController *v9;
  uint64_t Date;
  void *v11;
  void *v12;
  GeoRequestResponseLogDatePickerViewController *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  _QWORD v26[4];
  GeoRequestResponseLogDatePickerViewController *v27;
  GeoRequestResponseLogTableViewController *v28;
  id v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestResponseLogTableViewController tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cellForRowAtIndexPath:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestResponseLogTableViewController title](self, "title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v7, 0, 0));

  v9 = objc_alloc_init(GeoRequestResponseLogDatePickerViewController);
  Date = GEOConfigGetDate(GeoServicesConfig_MapsRequestResponseLoggingPersistedStopAt[0], GeoServicesConfig_MapsRequestResponseLoggingPersistedStopAt[1]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(Date);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GeoRequestResponseLogDatePickerViewController datePicker](v9, "datePicker"));
  objc_msgSend(v12, "setDate:", v11);

  objc_msgSend(v8, "setContentViewController:", v9);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10026B820;
  v26[3] = &unk_1011AE358;
  v13 = v9;
  v27 = v13;
  v28 = self;
  v14 = v4;
  v29 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Ok"), 0, v26));
  objc_msgSend(v8, "addAction:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0));
  objc_msgSend(v8, "addAction:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "popoverPresentationController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentView"));
  objc_msgSend(v18, "bounds");
  objc_msgSend(v17, "setSourceRect:");

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentView"));
  objc_msgSend(v17, "setSourceView:", v19);

  v20 = v6;
  v21 = v20;
  if (v20)
  {
    v22 = v20;
    do
    {
      v23 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", v22));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "superview"));

      if (v24)
        v25 = 1;
      else
        v25 = v22 == 0;
    }
    while (!v25);

  }
  else
  {
    v24 = 0;
  }
  objc_msgSend(v24, "presentViewController:animated:completion:", v8, 1, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_byteFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_logPersister, 0);
  objc_storeStrong((id *)&self->_logEntries, 0);
}

@end
