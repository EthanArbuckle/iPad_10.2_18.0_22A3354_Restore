@implementation GeoCellDataSaverHistoryTableViewController

- (GeoCellDataSaverHistoryTableViewController)init
{
  GeoCellDataSaverHistoryTableViewController *v2;
  NSDateFormatter *v3;
  NSDateFormatter *dateFormatter;
  NSMeasurementFormatter *v5;
  NSMeasurementFormatter *durationFormatter;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GeoCellDataSaverHistoryTableViewController;
  v2 = -[GeoCellDataSaverHistoryTableViewController initWithStyle:](&v9, "initWithStyle:", 1);
  if (v2)
  {
    v3 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = v3;

    -[NSDateFormatter setDateStyle:](v2->_dateFormatter, "setDateStyle:", 1);
    -[NSDateFormatter setTimeStyle:](v2->_dateFormatter, "setTimeStyle:", 1);
    v5 = (NSMeasurementFormatter *)objc_alloc_init((Class)NSMeasurementFormatter);
    durationFormatter = v2->_durationFormatter;
    v2->_durationFormatter = v5;

    -[NSMeasurementFormatter setUnitOptions:](v2->_durationFormatter, "setUnitOptions:", 2);
    -[NSMeasurementFormatter setUnitStyle:](v2->_durationFormatter, "setUnitStyle:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMeasurementFormatter numberFormatter](v2->_durationFormatter, "numberFormatter"));
    objc_msgSend(v7, "setMaximumFractionDigits:", 0);

  }
  return v2;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GeoCellDataSaverHistoryTableViewController;
  -[GeoCellDataSaverHistoryTableViewController viewDidLoad](&v3, "viewDidLoad");
  -[GeoCellDataSaverHistoryTableViewController setTitle:](self, "setTitle:", CFSTR("CDS History"));
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GeoCellDataSaverHistoryTableViewController;
  -[GeoCellDataSaverHistoryTableViewController viewWillAppear:](&v9, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -864000.0));
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEORequestCounter sharedCounter](GEORequestCounter, "sharedCounter"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1003AF980;
  v6[3] = &unk_1011AD9D0;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "readProactiveTileDownloadsSince:handler:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)_toggleLogging:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[GEORequestCounter sharedCounter](GEORequestCounter, "sharedCounter"));
  v4 = objc_msgSend(v3, "isOn");

  objc_msgSend(v5, "setCountersEnabled:", v4);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (!a4)
    return 1;
  if (a4 == 1)
    return -[NSArray count](self->_runs, "count", a3);
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSDateFormatter *dateFormatter;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 == (id)1)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("basic")));
    if (!v10)
      v10 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, CFSTR("basic"));
    objc_msgSend(v10, "setSelectionStyle:", 3);
    v9 = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_runs, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
    dateFormatter = self->_dateFormatter;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
    objc_msgSend(v14, "setText:", v13);

    v15 = sub_1003B01CC((uint64_t)objc_msgSend(v9, "totalTiles"), (uint64_t)objc_msgSend(v9, "successCount"), (uint64_t)objc_msgSend(v9, "failureCount"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    objc_msgSend(v10, "setAccessoryView:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endDate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
    objc_msgSend(v17, "timeIntervalSinceDate:", v18);
    v20 = v19;

    v21 = objc_alloc((Class)NSMeasurement);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitDuration baseUnit](NSUnitDuration, "baseUnit"));
    v23 = objc_msgSend(v21, "initWithDoubleValue:unit:", v22, v20);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMeasurementFormatter stringFromMeasurement:](self->_durationFormatter, "stringFromMeasurement:", v23));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "detailTextLabel"));
    objc_msgSend(v25, "setText:", v24);

    goto LABEL_10;
  }
  if (!v8)
  {
    v9 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
    if (objc_msgSend(v7, "row"))
    {
      v10 = 0;
    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textLabel"));
      objc_msgSend(v26, "setText:", CFSTR("Record History"));

      v27 = objc_alloc_init((Class)UISwitch);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[GEORequestCounter sharedCounter](GEORequestCounter, "sharedCounter"));
      objc_msgSend(v27, "setOn:", objc_msgSend(v28, "countersEnabled"));

      objc_msgSend(v27, "addTarget:action:forControlEvents:", self, "_toggleLogging:", 4096);
      objc_msgSend(v9, "setAccessoryView:", v27);
      objc_msgSend(v9, "setSelectionStyle:", 0);

      v9 = v9;
      v10 = v9;
    }
LABEL_10:

    goto LABEL_11;
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  _ProactiveTileDownloadDetailViewController *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "section") == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_runs, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
    v8 = -[_ProactiveTileDownloadDetailViewController initWithRun:]([_ProactiveTileDownloadDetailViewController alloc], "initWithRun:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GeoCellDataSaverHistoryTableViewController navigationController](self, "navigationController"));
    objc_msgSend(v9, "pushViewController:animated:", v8, 1);

  }
  objc_msgSend(v10, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_runs, 0);
}

@end
