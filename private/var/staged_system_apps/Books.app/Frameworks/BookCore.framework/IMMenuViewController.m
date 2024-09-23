@implementation IMMenuViewController

- (void)setMenuItems:(id)a3
{
  NSArray *v4;
  NSArray *menuItems;

  if (self->_menuItems != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    menuItems = self->_menuItems;
    self->_menuItems = v4;

    -[IMMenuViewController updatePopoverSize](self, "updatePopoverSize");
    -[UITableView reloadData](self->_tableView, "reloadData");
  }
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  UITableView *v5;
  UITableView *tableView;
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
  objc_super v29;
  _QWORD v30[4];

  v29.receiver = self;
  v29.super_class = (Class)IMMenuViewController;
  -[IMMenuViewController viewDidLoad](&v29, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMMenuViewController view](self, "view"));
  v4 = objc_alloc((Class)UITableView);
  objc_msgSend(v3, "bounds");
  v5 = (UITableView *)objc_msgSend(v4, "initWithFrame:");
  tableView = self->_tableView;
  self->_tableView = v5;

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v7);

  -[UITableView setScrollEnabled:](self->_tableView, "setScrollEnabled:", 0);
  -[UITableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  v22 = v3;
  objc_msgSend(v3, "addSubview:", self->_tableView);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeAreaLayoutGuide"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v30[0] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_tableView, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
  v30[1] = v21;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leadingAnchor](self->_tableView, "leadingAnchor"));
  v28 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v30[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView trailingAnchor](self->_tableView, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  v30[3] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 4));
  objc_msgSend(v22, "addConstraints:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewController themePage](self, "themePage"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tintColor"));
  objc_msgSend(v22, "setTintColor:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tableViewCellBackgroundColor"));
  objc_msgSend(v22, "setBackgroundColor:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tableViewBackgroundColor"));
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "separatorColor"));
  -[UITableView setSeparatorColor:](self->_tableView, "setSeparatorColor:", v20);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMMenuViewController menuItems](self, "menuItems", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("IMMenuViewControllerCellIdentifier")));
  if (!v7)
  {
    v8 = objc_msgSend(v6, "row");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMMenuViewController menuItems](self, "menuItems"));
    v10 = objc_msgSend(v9, "count");

    if (v8 >= v10)
      goto LABEL_4;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMMenuViewController menuItems](self, "menuItems"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v6, "row")));

    v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("IMMenuViewControllerCellIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
    objc_msgSend(v14, "setText:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
    objc_msgSend(v15, "setTextAlignment:", 1);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewController themePage](self, "themePage"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[IMMenuViewController traitCollection](self, "traitCollection"));
    objc_msgSend(v16, "styleMenuCell:withTraitCollection:", v7, v17);

    if (!v7)
LABEL_4:
      v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("IMMenuViewControllerCellIdentifier"));
  }

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 45.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v5 = objc_msgSend(v12, "row");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMMenuViewController menuItems](self, "menuItems"));
  v7 = objc_msgSend(v6, "count");

  if (v5 < v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMMenuViewController menuItems](self, "menuItems"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v12, "row")));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "target"));
    if (v10 && objc_msgSend(v9, "action"))
    {
      objc_msgSend(v10, "performSelector:withObject:", objc_msgSend(v9, "action"), 0);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionBlock"));

      if (v11)
        objc_msgSend(v9, "performActionBlock:", 0);
    }

  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[IMViewController themePage](self, "themePage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMMenuViewController traitCollection](self, "traitCollection"));
  objc_msgSend(v8, "styleMenuCell:withTraitCollection:", v6, v7);

}

- (void)updatePopoverSize
{
  double v3;
  id v4;

  if (isPad())
    v3 = 332.0;
  else
    v3 = 286.0;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[IMMenuViewController menuItems](self, "menuItems"));
  -[IMMenuViewController setPreferredContentSize:](self, "setPreferredContentSize:", v3, (double)(unint64_t)objc_msgSend(v4, "count") * 45.0 + -1.0);

}

- (NSArray)menuItems
{
  return self->_menuItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_menuItems, 0);
}

@end
