@implementation CarIncidentsListCardViewController

- (CarIncidentsListCardViewController)initWithDelegate:(id)a3
{
  id v4;
  CarIncidentsListCardViewController *v5;
  CarIncidentsListCardViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CarIncidentsListCardViewController;
  v5 = -[CarBaseSearchViewController initWithDisabledETAUpdates:](&v8, "initWithDisabledETAUpdates:", 1);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  CarTableView *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CarIncidentsListCardViewController;
  -[CarIncidentsListCardViewController viewDidLoad](&v23, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarIncidentsListCardViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CarIncidentsListCard"));

  v4 = -[CarTableView initWithFrame:]([CarTableView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[CarBaseSearchViewController setTableView:](self, "setTableView:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("CarIncidentsListCardTableView"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  LODWORD(v8) = 1148846080;
  objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 0, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  LODWORD(v10) = 1148846080;
  objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", 1, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v11, "setDataSource:", self);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v12, "setDelegate:", self);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v14, "setBackgroundColor:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v15, "_setHeaderAndFooterViewsFloat:", 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v16, "setRowHeight:", 44.0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v17, "registerClass:forCellReuseIdentifier:", objc_opt_class(CarSearchCategoryCell), CFSTR("IncidentsCellReuseIdentifier"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarIncidentsListCardViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v18, "addSubview:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarIncidentsListCardViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_maps_constraintsForCenteringInView:", v21));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CarIncidentsListCardViewController;
  -[CarIncidentsListCardViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[CarIncidentsListCardViewController _refreshDataSource](self, "_refreshDataSource");
}

- (void)_refreshDataSource
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutManager sharedInstance](TrafficIncidentLayoutManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentIncidentsLayout"));
  -[CarIncidentsListCardViewController setIncidentLayoutItems:](self, "setIncidentLayoutItems:", v3);

}

- (void)setIncidentLayoutItems:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  NSLayoutConstraint *tableViewHeight;
  void *v11;
  void *v12;
  double v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *v15;
  void *v16;
  NSLayoutConstraint *v17;

  v5 = a3;
  if (!-[NSArray isEqualToArray:](self->_incidentLayoutItems, "isEqualToArray:", v5))
  {
    objc_storeStrong((id *)&self->_incidentLayoutItems, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
    objc_msgSend(v6, "reloadData");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
    objc_msgSend(v7, "contentSize");
    v9 = v8 + 23.0;

    tableViewHeight = self->_tableViewHeight;
    if (tableViewHeight)
    {
      -[NSLayoutConstraint setConstant:](tableViewHeight, "setConstant:", v9);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "heightAnchor"));
      LODWORD(v13) = 1148846080;
      v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintLessThanOrEqualToConstant:priority:", v9, v13));
      v15 = self->_tableViewHeight;
      self->_tableViewHeight = v14;

      v17 = self->_tableViewHeight;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

    }
  }

}

- (id)uniqueName
{
  return objc_msgSend((id)objc_opt_class(self), "description");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_incidentLayoutItems, "count", a3, a4);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  NSArray *incidentLayoutItems;
  id v9;
  void *v10;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("IncidentsCellReuseIdentifier"), v6));
  incidentLayoutItems = self->_incidentLayoutItems;
  v9 = objc_msgSend(v6, "row");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](incidentLayoutItems, "objectAtIndex:", v9));
  objc_msgSend(v7, "setupWithIncidentLayoutItem:", v10);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarIncidentsListCardViewController delegate](self, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_incidentLayoutItems, "objectAtIndex:", objc_msgSend(v6, "row")));
  objc_msgSend(v8, "incidentsListCard:didSelectIncident:", self, v9);

  v10.receiver = self;
  v10.super_class = (Class)CarIncidentsListCardViewController;
  -[CarBaseSearchViewController tableView:didSelectRowAtIndexPath:](&v10, "tableView:didSelectRowAtIndexPath:", v7, v6);

}

- (NSArray)focusOrderSubItems
{
  void *v3;
  void *v4;

  if (-[CarIncidentsListCardViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_car_visibleCells"));

  }
  else
  {
    v4 = &__NSArray0__struct;
  }
  return (NSArray *)v4;
}

- (NSArray)preferredFocusEnvironments
{
  void *v3;
  void *v4;

  if (-[CarIncidentsListCardViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredFocusEnvironments"));

  }
  else
  {
    v4 = &__NSArray0__struct;
  }
  return (NSArray *)v4;
}

- (CarIncidentsListCardViewControllerDelegate)delegate
{
  return (CarIncidentsListCardViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)incidentLayoutItems
{
  return self->_incidentLayoutItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incidentLayoutItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableViewHeight, 0);
}

@end
