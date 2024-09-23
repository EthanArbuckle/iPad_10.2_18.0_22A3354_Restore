@implementation SharedTripAutosharingContaineeViewController

- (SharedTripAutosharingContaineeViewController)initWithContacts:(id)a3
{
  id v4;
  SharedTripAutosharingContaineeViewController *v5;
  NSMutableArray *v6;
  NSMutableArray *contacts;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SharedTripAutosharingContaineeViewController;
  v5 = -[SharedTripAutosharingContaineeViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_msgSend(v4, "mutableCopy");
    contacts = v5->_contacts;
    v5->_contacts = v6;

  }
  return v5;
}

- (NSArray)contacts
{
  return (NSArray *)-[NSMutableArray copy](self->_contacts, "copy");
}

- (void)setContacts:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *contacts;

  v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  contacts = self->_contacts;
  self->_contacts = v4;

  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (void)viewDidLoad
{
  ContainerHeaderView *v3;
  ContainerHeaderView *headerView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  UITableView *v11;
  UITableView *tableView;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  objc_super v44;
  _QWORD v45[7];

  v44.receiver = self;
  v44.super_class = (Class)SharedTripAutosharingContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v44, "viewDidLoad");
  v43 = objc_alloc_init((Class)NSMutableArray);
  v3 = -[ContainerHeaderView initWithCardButtonType:]([ContainerHeaderView alloc], "initWithCardButtonType:", 0);
  headerView = self->_headerView;
  self->_headerView = v3;

  -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[Share ETA, Autosharing] Title"), CFSTR("localized string not found"), 0));
  -[ContainerHeaderView setTitle:](self->_headerView, "setTitle:", v6);

  -[ContainerHeaderView setDelegate:](self->_headerView, "setDelegate:", self);
  -[ContainerHeaderView setHairLineAlpha:](self->_headerView, "setHairLineAlpha:", 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system28Bold](UIFont, "system28Bold"));
  -[ContainerHeaderView setCustomTitleFont:](self->_headerView, "setCustomTitleFont:", v7);

  -[ContainerHeaderView setVerticalAlignmentOffset:](self->_headerView, "setVerticalAlignmentOffset:", 4.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripAutosharingContaineeViewController view](self, "view"));
  objc_msgSend(v8, "addSubview:", self->_headerView);

  v9 = objc_alloc((Class)UITableView);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripAutosharingContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v10, "bounds");
  v11 = (UITableView *)objc_msgSend(v9, "initWithFrame:style:", 2);
  tableView = self->_tableView;
  self->_tableView = v11;

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v13);

  -[UITableView _setTopPadding:](self->_tableView, "_setTopPadding:", 12.0);
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(UITableViewCell), CFSTR("Contact"));
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(UITableViewCell), CFSTR("AddPerson"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripAutosharingContaineeViewController view](self, "view"));
  objc_msgSend(v14, "addSubview:", self->_tableView);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self->_headerView, "topAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripAutosharingContaineeViewController view](self, "view"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "topAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
  v45[0] = v39;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_headerView, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripAutosharingContaineeViewController view](self, "view"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "leadingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
  v45[1] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripAutosharingContaineeViewController view](self, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self->_headerView, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
  v45[2] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self->_headerView, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
  v45[3] = v28;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leadingAnchor](self->_tableView, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripAutosharingContaineeViewController view](self, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v45[4] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripAutosharingContaineeViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView trailingAnchor](self->_tableView, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
  v45[5] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripAutosharingContaineeViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_tableView, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
  v45[6] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 7));
  objc_msgSend(v43, "addObjectsFromArray:", v24);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v43);
}

- (id)headerView
{
  return self->_headerView;
}

- (id)contentView
{
  return self->_tableView;
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[SharedTripAutosharingContaineeViewController delegate](self, "delegate", a3, a4));
  v5 = -[NSMutableArray copy](self->_contacts, "copy");
  objc_msgSend(v6, "autosharingController:didUpdateContacts:", self, v5);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (int64_t)-[NSMutableArray count](self->_contacts, "count", a3, a4) + 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
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
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  uint64_t *v39;
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id location;
  _QWORD v51[2];

  v35 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration cellConfiguration](UIListContentConfiguration, "cellConfiguration"));
  objc_msgSend(v7, "setDirectionalLayoutMargins:", 16.0, 16.0, 16.0, 16.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageProperties"));
  objc_msgSend(v8, "setReservedLayoutSize:", 35.0, 35.0);

  v9 = objc_msgSend(v6, "row");
  if ((uint64_t)v9 >= (uint64_t)-[NSMutableArray count](self->_contacts, "count"))
  {
    v36 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("AddPerson"), v6));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripAutosharingContaineeViewController theme](self, "theme"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "keyColor"));
    v51[0] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor quaternarySystemFillColor](UIColor, "quaternarySystemFillColor"));
    v51[1] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 2));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v27));

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 35.0));
    v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "configurationByApplyingConfiguration:", v29));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("magnifyingglass.circle.fill")));
    objc_msgSend(v7, "setImage:", v12);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageProperties"));
    objc_msgSend(v30, "setPreferredSymbolConfiguration:", v22);

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("[Share ETA, Autosharing] Add Person"), CFSTR("localized string not found"), 0));
    objc_msgSend(v7, "setText:", v32);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripAutosharingContaineeViewController theme](self, "theme"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "keyColor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textProperties"));
    objc_msgSend(v33, "setColor:", v15);

  }
  else
  {
    v36 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Contact"), v6));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_contacts, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayName"));
    objc_msgSend(v7, "setText:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
    objc_msgSend(v12, "setContentInsets:", NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationPreferringMonochrome](UIImageSymbolConfiguration, "configurationPreferringMonochrome"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageProperties"));
    objc_msgSend(v14, "setPreferredSymbolConfiguration:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("minus.circle.fill")));
    objc_msgSend(v12, "setImage:", v15);
    objc_initWeak(&location, self);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10096DC64;
    v47[3] = &unk_1011ACEC0;
    objc_copyWeak(&v49, &location);
    v16 = v10;
    v48 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v47));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v12, v17));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    objc_msgSend(v18, "setTintColor:", v19);

    objc_msgSend(v18, "sizeToFit");
    objc_msgSend(v36, "setAccessoryView:", v18);
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = sub_10096DCA4;
    v45 = sub_10096DCB4;
    v46 = v7;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MapsUIImageCache sharedCache](MapsUIImageCache, "sharedCache"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contact"));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10096DCBC;
    v37[3] = &unk_1011DCE30;
    objc_copyWeak(&v40, &location);
    v39 = &v41;
    v22 = v16;
    v38 = v22;
    objc_msgSend(v20, "getImageForContact:size:completion:", v21, v37, 35.0);

    v23 = (void *)v42[5];
    v42[5] = 0;

    objc_destroyWeak(&v40);
    _Block_object_dispose(&v41, 8);

    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);
  }

  objc_msgSend(v36, "setContentConfiguration:", v7);
  return v36;
}

- (void)_updateImage:(id)a3 forContact:(id)a4
{
  id v6;
  void *v7;
  UITableView *tableView;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = -[NSMutableArray indexOfObject:](self->_contacts, "indexOfObject:", a4);
  v7 = v12;
  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    tableView = self->_tableView;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v6, 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView cellForRowAtIndexPath:](tableView, "cellForRowAtIndexPath:", v9));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentConfiguration"));
      objc_msgSend(v11, "setImage:", v12);
      objc_msgSend(v10, "setContentConfiguration:", v11);

    }
    v7 = v12;
  }

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;

  v5 = objc_msgSend(a4, "row", a3);
  return (uint64_t)v5 >= (uint64_t)-[NSMutableArray count](self->_contacts, "count");
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSMutableArray *contacts;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "row");
  if ((uint64_t)v8 >= (uint64_t)-[NSMutableArray count](self->_contacts, "count"))
  {
    objc_initWeak(&location, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripAutosharingContaineeViewController delegate](self, "delegate"));
    contacts = self->_contacts;
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_10096DF64;
    v14 = &unk_1011DCE58;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v9, "autosharingController:wantsToSearchWithExistingContacts:selectionHandler:", self, contacts, &v11);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1, v11, v12, v13, v14);

}

- (void)_addContact:(id)a3
{
  UITableView *tableView;
  void *v5;
  void *v6;
  void *v7;

  -[NSMutableArray addObject:](self->_contacts, "addObject:", a3);
  tableView = self->_tableView;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)-[NSMutableArray count](self->_contacts, "count") - 1, 0));
  v7 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  -[UITableView insertRowsAtIndexPaths:withRowAnimation:](tableView, "insertRowsAtIndexPaths:withRowAnimation:", v6, 100);

}

- (void)_deleteContact:(id)a3
{
  id v4;
  id v5;
  UITableView *tableView;
  void *v7;
  void *v8;
  void *v9;

  v4 = -[NSMutableArray indexOfObject:](self->_contacts, "indexOfObject:", a3);
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    -[NSMutableArray removeObjectAtIndex:](self->_contacts, "removeObjectAtIndex:", v4);
    tableView = self->_tableView;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v5, 0));
    v9 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    -[UITableView deleteRowsAtIndexPaths:withRowAnimation:](tableView, "deleteRowsAtIndexPaths:withRowAnimation:", v8, 100);

  }
}

- (SharedTripAutosharingContaineeViewControllerDelegate)delegate
{
  return (SharedTripAutosharingContaineeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
