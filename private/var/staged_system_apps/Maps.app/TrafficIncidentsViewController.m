@implementation TrafficIncidentsViewController

- (TrafficIncidentsViewController)init
{
  TrafficIncidentsViewController *v2;
  TrafficIncidentsViewController *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  TrafficIncidentLayoutManager *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TrafficIncidentsViewController;
  v2 = -[TrafficIncidentsViewController initWithStyle:](&v11, "initWithStyle:", 0);
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController tableView](v2, "tableView"));
    objc_msgSend(v4, "setAllowsSelection:", 0);

    v5 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController tableView](v3, "tableView"));
    objc_msgSend(v6, "setTableFooterView:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, "_contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

    v8 = -[TrafficIncidentLayoutManager initWithFormType:]([TrafficIncidentLayoutManager alloc], "initWithFormType:", 9);
    -[TrafficIncidentsViewController setTrafficLayoutManager:](v3, "setTrafficLayoutManager:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController trafficLayoutManager](v3, "trafficLayoutManager"));
    objc_msgSend(v9, "addObserver:", v3);

    -[TrafficIncidentsViewController _refreshTrafficLayout](v3, "_refreshTrafficLayout");
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController trafficLayoutManager](self, "trafficLayoutManager"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)TrafficIncidentsViewController;
  -[TrafficIncidentsViewController dealloc](&v5, "dealloc");
}

- (void)_refreshTrafficLayout
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController trafficLayoutManager](self, "trafficLayoutManager"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100886598;
  v4[3] = &unk_1011B07A0;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "fetchTrafficIncidentsLayout:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setIncident:(id)a3
{
  TrafficIncidentReport *incidentReport;
  void *v6;
  void *v7;
  void *v8;
  VKTrafficIncidentFeature *v9;

  v9 = (VKTrafficIncidentFeature *)a3;
  if (self->_incident != v9)
  {
    incidentReport = self->_incidentReport;
    self->_incidentReport = 0;

    objc_storeStrong((id *)&self->_incident, a3);
    -[TrafficIncidentsViewController _setupRowsWithIncident:](self, "_setupRowsWithIncident:", v9);
    if (-[TrafficIncidentsViewController isViewLoaded](self, "isViewLoaded"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController view](self, "view"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController tableView](self, "tableView"));
        objc_msgSend(v8, "reloadData");

      }
    }
  }

}

- (unint64_t)numberOfItems
{
  return (unint64_t)-[NSMutableArray count](self->_tableViewRows, "count");
}

- (void)_setupRowsWithIncident:(id)a3
{
  id v4;
  MacTrafficIncidentsOverviewCellModel *v5;
  void *v6;
  void *v7;
  MacTrafficIncidentsDetailsCellModel *v8;
  void *v9;
  MacTrafficIncidentsDetailsCellModel *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MacTrafficIncidentsOverviewCellModel *v16;

  v4 = objc_alloc_init((Class)NSMutableArray);
  -[TrafficIncidentsViewController setTableViewRows:](self, "setTableViewRows:", v4);

  if (-[TrafficIncidentsViewController isMarzipan](self, "isMarzipan"))
  {
    v5 = [MacTrafficIncidentsOverviewCellModel alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController incident](self, "incident"));
    v16 = -[MacTrafficIncidentsOverviewCellModel initWithVKTrafficIncidentFeature:](v5, "initWithVKTrafficIncidentFeature:", v6);

    if (-[MacTrafficIncidentsOverviewCellModel hasDataToShow](v16, "hasDataToShow"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController tableViewRows](self, "tableViewRows"));
      objc_msgSend(v7, "addObject:", &off_10126FA30);

    }
    v8 = [MacTrafficIncidentsDetailsCellModel alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController incident](self, "incident"));
    v10 = -[MacTrafficIncidentsDetailsCellModel initWithVKTrafficIncidentFeature:](v8, "initWithVKTrafficIncidentFeature:", v9);

    if (-[MacTrafficIncidentsDetailsCellModel hasDataToShow](v10, "hasDataToShow"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController tableViewRows](self, "tableViewRows"));
      objc_msgSend(v11, "addObject:", &off_10126FA48);

    }
    goto LABEL_13;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController incident](self, "incident"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "info"));
  if (v13)
    goto LABEL_11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController incident](self, "incident"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastUpdatedDate"));
  if (v14
    || (v14 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController incident](self, "incident")),
        (objc_msgSend(v14, "isRestrictionIncident") & 1) != 0))
  {

LABEL_11:
LABEL_12:
    v16 = (MacTrafficIncidentsOverviewCellModel *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController tableViewRows](self, "tableViewRows"));
    -[MacTrafficIncidentsOverviewCellModel addObject:](v16, "addObject:", &off_10126FA30);
LABEL_13:

    return;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController incident](self, "incident"));

  if (v15)
    goto LABEL_12;
}

- (void)setIncidentReport:(id)a3
{
  VKTrafficIncidentFeature *incident;
  void *v6;
  void *v7;
  void *v8;
  TrafficIncidentReport *v9;

  v9 = (TrafficIncidentReport *)a3;
  if (self->_incidentReport != v9)
  {
    incident = self->_incident;
    self->_incident = 0;

    objc_storeStrong((id *)&self->_incidentReport, a3);
    -[TrafficIncidentsViewController _setupRowsWithIncidentReport:](self, "_setupRowsWithIncidentReport:", v9);
    if (-[TrafficIncidentsViewController isViewLoaded](self, "isViewLoaded"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController view](self, "view"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController tableView](self, "tableView"));
        objc_msgSend(v8, "reloadData");

      }
    }
  }

}

- (void)_setupRowsWithIncidentReport:(id)a3
{
  id v4;
  id v5;

  v4 = objc_alloc_init((Class)NSMutableArray);
  -[TrafficIncidentsViewController setTableViewRows:](self, "setTableViewRows:", v4);

  if (!-[TrafficIncidentsViewController isMarzipan](self, "isMarzipan"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController tableViewRows](self, "tableViewRows"));
    objc_msgSend(v5, "addObject:", &off_10126FA30);

  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TrafficIncidentsViewController;
  -[TrafficIncidentsViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setSeparatorInset:", 0.0, 16.0, 0.0, 16.0);

  if (!-[TrafficIncidentsViewController isMarzipan](self, "isMarzipan"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController tableView](self, "tableView"));
    objc_msgSend(v6, "setSeparatorStyle:", 0);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TrafficIncidentsViewController;
  -[TrafficIncidentsViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadData");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_didReceiveIncidentUpdate:", CFSTR("SiriTrafficIncidentUpdateNotification"), 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setShowsVerticalScrollIndicator:", 0);

  v7.receiver = self;
  v7.super_class = (Class)TrafficIncidentsViewController;
  -[TrafficIncidentsViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setShowsVerticalScrollIndicator:", 1);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TrafficIncidentsViewController;
  -[TrafficIncidentsViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("SiriTrafficIncidentUpdateNotification"), 0);

}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController tableView](self, "tableView", a3));
  objc_msgSend(v3, "reloadData");

}

- (CGSize)preferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController tableView](self, "tableView"));
  objc_msgSend(v2, "contentSize");
  v4 = v3;

  v5 = 298.0;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (HeightProviding)heightProvider
{
  HeightProviding *heightProvider;
  TableViewMeasurer *v4;
  void *v5;
  HeightProviding *v6;
  HeightProviding *v7;

  heightProvider = self->_heightProvider;
  if (!heightProvider)
  {
    v4 = [TableViewMeasurer alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController tableView](self, "tableView"));
    v6 = -[TableViewMeasurer initWithMeasurableView:](v4, "initWithMeasurableView:", v5);

    v7 = self->_heightProvider;
    self->_heightProvider = v6;

    heightProvider = self->_heightProvider;
  }
  return heightProvider;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TrafficIncidentsViewController;
  -[TrafficIncidentsViewController traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v5);
  if (v5
    && (v6 = objc_msgSend(v5, "userInterfaceStyle"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController traitCollection](self, "traitCollection")),
        v6 == objc_msgSend(v3, "userInterfaceStyle")))
  {

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "userInterfaceStyle");

    if (v5)
    if (v8)
      -[TrafficIncidentsViewController updateTheme](self, "updateTheme");
  }

}

- (void)updateTheme
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController theme](self, "theme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hairlineColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setSeparatorColor:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController tableView](self, "tableView"));
  objc_msgSend(v6, "reloadData");

}

- (int64_t)rowForRow:(unint64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController tableViewRows](self, "tableViewRows"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", a3));
  v6 = objc_msgSend(v5, "unsignedIntValue");

  return v6;
}

- (id)_cellForRow:(int64_t)a3 inSection:(int64_t)a4
{
  int64_t v5;
  void *v6;

  v5 = -[TrafficIncidentsViewController rowForRow:](self, "rowForRow:", a3, a4);
  if (v5)
  {
    if (v5 == 1)
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController _incidentsOverviewRow](self, "_incidentsOverviewRow"));
    else
      v6 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController _incidentsDetailsRow](self, "_incidentsDetailsRow"));
  }
  return v6;
}

- (id)_incidentsOverviewRow
{
  unsigned int v3;
  void *v4;
  void *v5;
  MacTrafficIncidentsOverviewCell *v6;
  MacTrafficIncidentsOverviewCell *v7;
  void *v8;
  MacTrafficIncidentsOverviewCellModel *v9;
  void *v10;
  MacTrafficIncidentsOverviewCellModel *v11;
  void *v12;
  TrafficIncidentsOverviewCell *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = -[TrafficIncidentsViewController isMarzipan](self, "isMarzipan");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController tableView](self, "tableView"));
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MacTrafficIncidentsOverviewCell reuseIdentifier](MacTrafficIncidentsOverviewCell, "reuseIdentifier"));
    v6 = (MacTrafficIncidentsOverviewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_mapkit_dequeueReusableCellWithIdentifier:", v5));

    if (!v6)
    {
      v7 = [MacTrafficIncidentsOverviewCell alloc];
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MacTrafficIncidentsOverviewCell reuseIdentifier](MacTrafficIncidentsOverviewCell, "reuseIdentifier"));
      v6 = -[MacTrafficIncidentsOverviewCell initWithStyle:reuseIdentifier:](v7, "initWithStyle:reuseIdentifier:", 0, v8);

    }
    v9 = [MacTrafficIncidentsOverviewCellModel alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController incident](self, "incident"));
    v11 = -[MacTrafficIncidentsOverviewCellModel initWithVKTrafficIncidentFeature:](v9, "initWithVKTrafficIncidentFeature:", v10);

    -[MacTrafficIncidentsOverviewCell configureWithCellModel:](v6, "configureWithCellModel:", v11);
    goto LABEL_17;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentsOverviewCell reuseIdentifier](TrafficIncidentsOverviewCell, "reuseIdentifier"));
  v6 = (MacTrafficIncidentsOverviewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_mapkit_dequeueReusableCellWithIdentifier:", v12));

  if (!v6)
  {
    v13 = [TrafficIncidentsOverviewCell alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentsOverviewCell reuseIdentifier](TrafficIncidentsOverviewCell, "reuseIdentifier"));
    v6 = -[TrafficIncidentsOverviewCell initWithStyle:reuseIdentifier:](v13, "initWithStyle:reuseIdentifier:", 0, v14);

  }
  -[MacTrafficIncidentsOverviewCell setDelegate:](v6, "setDelegate:", self);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController incident](self, "incident"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController trafficLayoutManager](self, "trafficLayoutManager"));
    if ((objc_msgSend(v16, "isIncidentReportingEnabled") & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController trafficLayoutManager](self, "trafficLayoutManager"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController incident](self, "incident"));
      -[MacTrafficIncidentsOverviewCell setShowVotingButtons:](v6, "setShowVotingButtons:", objc_msgSend(v17, "containsVKTrafficIncidentType:", objc_msgSend(v18, "type")));

    }
    else
    {
      -[MacTrafficIncidentsOverviewCell setShowVotingButtons:](v6, "setShowVotingButtons:", 0);
    }

    v11 = (MacTrafficIncidentsOverviewCellModel *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController incident](self, "incident"));
    -[MacTrafficIncidentsOverviewCell setIncident:](v6, "setIncident:", v11);
LABEL_17:

    return v6;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController incidentReport](self, "incidentReport"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController trafficLayoutManager](self, "trafficLayoutManager"));
    if ((objc_msgSend(v20, "isIncidentReportingEnabled") & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController trafficLayoutManager](self, "trafficLayoutManager"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController incidentReport](self, "incidentReport"));
      -[MacTrafficIncidentsOverviewCell setShowVotingButtons:](v6, "setShowVotingButtons:", objc_msgSend(v21, "containsGEOTrafficIncidentType:", objc_msgSend(v22, "incidentType")));

    }
    else
    {
      -[MacTrafficIncidentsOverviewCell setShowVotingButtons:](v6, "setShowVotingButtons:", 0);
    }

    v11 = (MacTrafficIncidentsOverviewCellModel *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController incidentReport](self, "incidentReport"));
    -[MacTrafficIncidentsOverviewCell setIncidentReport:](v6, "setIncidentReport:", v11);
    goto LABEL_17;
  }
  return v6;
}

- (id)_incidentsDetailsRow
{
  void *v3;
  void *v4;
  MacTrafficIncidentsDetailsCell *v5;
  MacTrafficIncidentsDetailsCell *v6;
  void *v7;
  MacTrafficIncidentsDetailsCellModel *v8;
  void *v9;
  MacTrafficIncidentsDetailsCellModel *v10;

  if (-[TrafficIncidentsViewController isMarzipan](self, "isMarzipan"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController tableView](self, "tableView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MacTrafficIncidentsDetailsCell reuseIdentifier](MacTrafficIncidentsDetailsCell, "reuseIdentifier"));
    v5 = (MacTrafficIncidentsDetailsCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_mapkit_dequeueReusableCellWithIdentifier:", v4));

    if (!v5)
    {
      v6 = [MacTrafficIncidentsDetailsCell alloc];
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MacTrafficIncidentsDetailsCell reuseIdentifier](MacTrafficIncidentsDetailsCell, "reuseIdentifier"));
      v5 = -[MacTrafficIncidentsDetailsCell initWithStyle:reuseIdentifier:](v6, "initWithStyle:reuseIdentifier:", 0, v7);

    }
    v8 = [MacTrafficIncidentsDetailsCellModel alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController incident](self, "incident"));
    v10 = -[MacTrafficIncidentsDetailsCellModel initWithVKTrafficIncidentFeature:](v8, "initWithVKTrafficIncidentFeature:", v9);

    -[MacTrafficIncidentsDetailsCell configureWithCellModel:](v5, "configureWithCellModel:", v10);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController tableViewRows](self, "tableViewRows", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 65.0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = objc_msgSend(v5, "row");
  v7 = objc_msgSend(v5, "section");

  return -[TrafficIncidentsViewController _cellForRow:inSection:](self, "_cellForRow:inSection:", v6, v7);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController scrollViewDelegate](self, "scrollViewDelegate"));
  v5 = objc_opt_respondsToSelector(v4, "scrollViewWillBeginDragging:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController scrollViewDelegate](self, "scrollViewDelegate"));
    objc_msgSend(v6, "scrollViewWillBeginDragging:", v7);

  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  void *v9;
  char v10;
  void *v11;
  id v12;

  y = a4.y;
  x = a4.x;
  v12 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController scrollViewDelegate](self, "scrollViewDelegate"));
  v10 = objc_opt_respondsToSelector(v9, "scrollViewWillEndDragging:withVelocity:targetContentOffset:");

  if ((v10 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController scrollViewDelegate](self, "scrollViewDelegate"));
    objc_msgSend(v11, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v12, a5, x, y);

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController scrollViewDelegate](self, "scrollViewDelegate"));
  v5 = objc_opt_respondsToSelector(v4, "scrollViewDidScroll:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController scrollViewDelegate](self, "scrollViewDelegate"));
    objc_msgSend(v6, "scrollViewDidScroll:", v7);

  }
}

- (BOOL)isMarzipan
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == (id)5;

  return v3;
}

- (void)overviewCell:(id)a3 incidentUpvoted:(BOOL)a4
{
  -[TrafficIncidentsViewController _incidentUpvoted:](self, "_incidentUpvoted:", a4);
}

- (void)_incidentUpvoted:(BOOL)a3
{
  _BOOL4 v3;
  TrafficIncidentReport *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __CFString *v16;
  uint64_t v17;
  _QWORD v18[5];

  v3 = a3;
  v5 = (TrafficIncidentReport *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController incidentReport](self, "incidentReport"));
  if (!v5)
  {
    v6 = objc_alloc((Class)GEOLocation);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController incident](self, "incident"));
    objc_msgSend(v7, "position");
    v8 = objc_msgSend(v6, "initWithGEOCoordinate:");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController incident](self, "incident"));
    v10 = +[TrafficIncidentLayoutItem geoTrafficIncidentTypeForVKType:](TrafficIncidentLayoutItem, "geoTrafficIncidentTypeForVKType:", objc_msgSend(v9, "type"));

    v5 = -[TrafficIncidentReport initWithIncidentLocation:type:userPath:]([TrafficIncidentReport alloc], "initWithIncidentLocation:type:userPath:", v8, v10, 6);
  }
  if (v3)
    v11 = 2;
  else
    v11 = 3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController incident](self, "incident"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueIdentifier"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100887788;
  v18[3] = &unk_1011AC860;
  v18[4] = self;
  -[TrafficIncidentReport submitFeedbackForType:incidentId:completionHandler:](v5, "submitFeedbackForType:incidentId:completionHandler:", v11, v13, v18);

  if (self->_incident && !v3)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentsStorageManager sharedInstance](TrafficIncidentsStorageManager, "sharedInstance"));
    objc_msgSend(v14, "removeTrafficIncidentFeature:", self->_incident);

  }
  v15 = (id)-[TrafficIncidentReport incidentType](v5, "incidentType");
  if (v15 >= 0x12)
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v15));
  else
    v16 = off_1011D9E30[(int)v15];
  if (v3)
    v17 = 107;
  else
    v17 = 106;
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v17, 741, v16);

}

- (void)_didReceiveIncidentUpdate:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("SiriTrafficIncidentIsClearKey")));
  v6 = objc_msgSend(v5, "BOOLValue");

  -[TrafficIncidentsViewController _incidentUpvoted:](self, "_incidentUpvoted:", v6 ^ 1);
}

- (void)incidentsReportingEnablementDidUpdate
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[TrafficIncidentsViewController tableView](self, "tableView"));
  objc_msgSend(v2, "reloadData");

}

- (VKTrafficIncidentFeature)incident
{
  return self->_incident;
}

- (TrafficIncidentReport)incidentReport
{
  return self->_incidentReport;
}

- (TrafficIncidentsViewControllerDelegate)delegate
{
  return (TrafficIncidentsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIScrollViewDelegate)scrollViewDelegate
{
  return (UIScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_scrollViewDelegate);
}

- (void)setScrollViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_scrollViewDelegate, a3);
}

- (NSMutableArray)tableViewRows
{
  return self->_tableViewRows;
}

- (void)setTableViewRows:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewRows, a3);
}

- (TrafficIncidentLayoutManager)trafficLayoutManager
{
  return self->_trafficLayoutManager;
}

- (void)setTrafficLayoutManager:(id)a3
{
  objc_storeStrong((id *)&self->_trafficLayoutManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficLayoutManager, 0);
  objc_storeStrong((id *)&self->_tableViewRows, 0);
  objc_destroyWeak((id *)&self->_scrollViewDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_incidentReport, 0);
  objc_storeStrong((id *)&self->_incident, 0);
  objc_storeStrong((id *)&self->_heightProvider, 0);
}

@end
