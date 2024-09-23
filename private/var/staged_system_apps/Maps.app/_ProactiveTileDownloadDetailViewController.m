@implementation _ProactiveTileDownloadDetailViewController

- (_ProactiveTileDownloadDetailViewController)initWithRun:(id)a3
{
  id v4;
  _ProactiveTileDownloadDetailViewController *v5;
  uint64_t v6;
  NSArray *policyStatistics;
  NSDateFormatter *v8;
  NSDateFormatter *dateFormatter;
  NSMeasurementFormatter *v10;
  NSMeasurementFormatter *durationFormatter;
  void *v12;
  NSDateFormatter *v13;
  void *v14;
  void *v15;
  _ProactiveTileDownloadDetailViewController *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_ProactiveTileDownloadDetailViewController;
  v5 = -[_ProactiveTileDownloadDetailViewController initWithStyle:](&v18, "initWithStyle:", 1);
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "policyStatistics"));
    policyStatistics = v5->_policyStatistics;
    v5->_policyStatistics = (NSArray *)v6;

    v8 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    dateFormatter = v5->_dateFormatter;
    v5->_dateFormatter = v8;

    -[NSDateFormatter setDateStyle:](v5->_dateFormatter, "setDateStyle:", 1);
    -[NSDateFormatter setTimeStyle:](v5->_dateFormatter, "setTimeStyle:", 1);
    v10 = (NSMeasurementFormatter *)objc_alloc_init((Class)NSMeasurementFormatter);
    durationFormatter = v5->_durationFormatter;
    v5->_durationFormatter = v10;

    -[NSMeasurementFormatter setUnitOptions:](v5->_durationFormatter, "setUnitOptions:", 2);
    -[NSMeasurementFormatter setUnitStyle:](v5->_durationFormatter, "setUnitStyle:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMeasurementFormatter numberFormatter](v5->_durationFormatter, "numberFormatter"));
    objc_msgSend(v12, "setMaximumFractionDigits:", 0);

    v13 = v5->_dateFormatter;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v13, "stringFromDate:", v14));
    -[_ProactiveTileDownloadDetailViewController setTitle:](v5, "setTitle:", v15);

    v16 = v5;
  }

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
    return 0;
  else
    return -[NSArray count](self->_policyStatistics, "count", a3);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  const __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  id v21;
  NSDateFormatter *dateFormatter;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section"))
  {
    v8 = 0;
  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("basic")));
    if (!v8)
      v8 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, CFSTR("basic"));
    objc_msgSend(v8, "setSelectionStyle:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_policyStatistics, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
    v10 = objc_msgSend(v9, "policy") - 1;
    if (v10 > 2)
      v11 = CFSTR("<unknown>");
    else
      v11 = off_1011B4040[(char)v10];
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
    objc_msgSend(v12, "setText:", v11);

    v13 = sub_1003B01CC((uint64_t)objc_msgSend(v9, "tilesConsidered"), (uint64_t)objc_msgSend(v9, "successCount"), (uint64_t)objc_msgSend(v9, "failureCount"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    objc_msgSend(v8, "setAccessoryView:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endTimestamp"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startTimestamp"));
    objc_msgSend(v15, "timeIntervalSinceDate:", v16);
    v18 = v17;

    v19 = objc_alloc((Class)NSMeasurement);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitDuration baseUnit](NSUnitDuration, "baseUnit"));
    v21 = objc_msgSend(v19, "initWithDoubleValue:unit:", v20, v18);

    dateFormatter = self->_dateFormatter;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startTimestamp"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v23));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMeasurementFormatter stringFromMeasurement:](self->_durationFormatter, "stringFromMeasurement:", v21));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ — %@"), v24, v25));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "detailTextLabel"));
    objc_msgSend(v27, "setText:", v26);

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_policyStatistics, 0);
}

@end
