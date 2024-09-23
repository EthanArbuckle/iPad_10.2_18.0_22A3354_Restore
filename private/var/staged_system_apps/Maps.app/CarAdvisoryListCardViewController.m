@implementation CarAdvisoryListCardViewController

- (CarAdvisoryListCardViewController)initWithRoute:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  CarAdvisoryListCardViewController *v8;
  CarAdvisoryListCardViewController *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CarAdvisoryListCardViewController;
  v8 = -[CarBaseSearchViewController initWithDisabledETAUpdates:](&v12, "initWithDisabledETAUpdates:", 1);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    -[CarAdvisoryListCardViewController setRoute:](v9, "setRoute:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](v9, "tableView"));
    objc_msgSend(v10, "reloadData");

  }
  return v9;
}

- (void)setRoute:(id)a3
{
  NSArray *v4;
  NSArray *advisoryItems;
  id v6;

  if (self->_route != a3)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "clickableAdvisory"));
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "advisoryItems"));
    advisoryItems = self->_advisoryItems;
    self->_advisoryItems = v4;

  }
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
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CarAdvisoryListCardViewController;
  -[CarAdvisoryListCardViewController viewDidLoad](&v25, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoryListCardViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CarAdvisoryListCard"));

  v4 = -[CarTableView initWithFrame:]([CarTableView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[CarBaseSearchViewController setTableView:](self, "setTableView:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("CarAdvisoryListCardTableView"));

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
  v18 = objc_opt_class(CarSearchItemCell);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CarSearchItemCell reuseIdentifier](CarSearchItemCell, "reuseIdentifier"));
  objc_msgSend(v17, "registerClass:forCellReuseIdentifier:", v18, v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoryListCardViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v20, "addSubview:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoryListCardViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "_maps_constraintsForCenteringInView:", v23));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

}

- (id)uniqueName
{
  return objc_msgSend((id)objc_opt_class(self), "description");
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  if (v5 >= (id)-[NSArray count](self->_advisoryItems, "count"))
    v6 = 0;
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_advisoryItems, "objectAtIndex:", objc_msgSend(v4, "row")));

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoryListCardViewController itemAtIndexPath:](self, "itemAtIndexPath:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CarSearchItemCell reuseIdentifier](CarSearchItemCell, "reuseIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6));

  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("CarAdvisoryCell"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController modelForItemAtIndexPath:](self, "modelForItemAtIndexPath:", v6));

  if (!v11)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CarSearchItemCellModel modelWithUpdateBlock:](CarSearchItemCellModel, "modelWithUpdateBlock:", 0));
    objc_msgSend(v8, "updateModel:", v11);
  }
  objc_msgSend(v10, "setupWithModel:cellStyle:", v11, -[CarBaseSearchViewController cellStyle](self, "cellStyle"));

  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_advisoryItems, "count", a3, a4);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  NSArray *advisoryItems;
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v11;

  advisoryItems = self->_advisoryItems;
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](advisoryItems, "objectAtIndex:", objc_msgSend(v7, "row")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoryListCardViewController delegate](self, "delegate"));
  objc_msgSend(v10, "advisoryListCardDidSelectAdvisoryItem:", v9);

  v11.receiver = self;
  v11.super_class = (Class)CarAdvisoryListCardViewController;
  -[CarBaseSearchViewController tableView:didSelectRowAtIndexPath:](&v11, "tableView:didSelectRowAtIndexPath:", v8, v7);

}

- (unint64_t)numberOfItems
{
  return -[NSArray count](self->_advisoryItems, "count");
}

- (NSArray)focusOrderSubItems
{
  void *v3;
  void *v4;

  if (-[CarAdvisoryListCardViewController isViewLoaded](self, "isViewLoaded"))
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

  if (-[CarAdvisoryListCardViewController isViewLoaded](self, "isViewLoaded"))
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

- (GEOComposedRoute)route
{
  return self->_route;
}

- (NSArray)advisoryItems
{
  return self->_advisoryItems;
}

- (void)setAdvisoryItems:(id)a3
{
  objc_storeStrong((id *)&self->_advisoryItems, a3);
}

- (CarAdvisoryListCardViewControllerDelegate)delegate
{
  return (CarAdvisoryListCardViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_advisoryItems, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

@end
