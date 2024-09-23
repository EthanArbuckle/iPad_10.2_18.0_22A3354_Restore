@implementation MacRAPBaseTableViewController

- (MacRAPBaseTableViewController)initWithStyle:(int64_t)a3
{
  MacRAPBaseTableViewController *v4;
  UITableView *v5;
  UITableView *tableView;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MacRAPBaseTableViewController;
  v4 = -[MacRAPBaseTableViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
  if (v4)
  {
    v5 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", a3, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    tableView = v4->_tableView;
    v4->_tableView = v5;

    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](v4->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITableView setRowHeight:](v4->_tableView, "setRowHeight:", UITableViewAutomaticDimension);
    -[UITableView setDelegate:](v4->_tableView, "setDelegate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[UITableView setBackgroundColor:](v4->_tableView, "setBackgroundColor:", v7);

  }
  return v4;
}

- (MacRAPBaseTableViewController)initWithStyle:(int64_t)a3 withTableViewFooter:(id)a4
{
  MacRAPBaseTableViewController *result;

  result = -[MacRAPBaseTableViewController initWithStyle:](self, "initWithStyle:", a3);
  if (result)
    result->_tableViewFooter = (UIView *)a4;
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  objc_super v57;
  _QWORD v58[4];
  _QWORD v59[3];

  v57.receiver = self;
  v57.super_class = (Class)MacRAPBaseTableViewController;
  -[MacRAPBaseViewController viewDidLoad](&v57, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseTableViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseTableViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseTableViewController tableView](self, "tableView"));
  objc_msgSend(v5, "addSubview:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseTableViewController tableViewFooter](self, "tableViewFooter"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseTableViewController view](self, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseTableViewController tableViewFooter](self, "tableViewFooter"));
    objc_msgSend(v8, "addSubview:", v9);

  }
  v56 = objc_alloc_init((Class)NSMutableArray);
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseTableViewController tableView](self, "tableView"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "leadingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseTableViewController view](self, "view"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "leadingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v48));
  v59[0] = v46;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseTableViewController tableView](self, "tableView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseTableViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v10));
  v59[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseTableViewController tableView](self, "tableView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseTableViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "safeAreaLayoutGuide"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v16));
  v59[2] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 3));
  objc_msgSend(v56, "addObjectsFromArray:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseTableViewController tableViewFooter](self, "tableViewFooter"));
  if (v19)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseTableViewController tableViewFooter](self, "tableViewFooter"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "leadingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseTableViewController view](self, "view"));
    v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "leadingAnchor"));
    v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v37));
    v58[0] = v49;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseTableViewController tableViewFooter](self, "tableViewFooter"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "trailingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseTableViewController view](self, "view"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "trailingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v45));
    v58[1] = v41;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseTableViewController tableViewFooter](self, "tableViewFooter"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "topAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseTableViewController tableView](self, "tableView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v21));
    v58[2] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseTableViewController tableViewFooter](self, "tableViewFooter"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseTableViewController view](self, "view"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "safeAreaLayoutGuide"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v27));
    v58[3] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v58, 4));
    objc_msgSend(v56, "addObjectsFromArray:", v29);

    v30 = (void *)v37;
    v31 = v47;

    v32 = v43;
    v33 = v39;

    v34 = v55;
    v35 = (void *)v49;

  }
  else
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseTableViewController tableView](self, "tableView"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bottomAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPBaseTableViewController view](self, "view"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "safeAreaLayoutGuide"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v35));
    objc_msgSend(v56, "addObject:", v33);
  }

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v56);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (UIView)tableViewFooter
{
  return self->_tableViewFooter;
}

- (void)setTableViewFooter:(id)a3
{
  self->_tableViewFooter = (UIView *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
