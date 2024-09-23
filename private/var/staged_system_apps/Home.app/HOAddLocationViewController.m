@implementation HOAddLocationViewController

- (HOAddLocationViewController)initWithName:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  HOAddLocationViewController *v8;
  HOAddLocationViewController *v9;
  HFHomeBuilder *v10;
  HFHomeBuilder *homeBuilder;
  NSString *v12;
  NSString *editedName;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HOAddLocationViewController;
  v8 = -[HOAddLocationViewController initWithStyle:](&v15, "initWithStyle:", 1);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    v10 = (HFHomeBuilder *)objc_msgSend(objc_alloc((Class)HFHomeBuilder), "initWithExistingObject:inHome:", 0, 0);
    homeBuilder = v9->_homeBuilder;
    v9->_homeBuilder = v10;

    v12 = (NSString *)objc_msgSend(v6, "copy");
    editedName = v9->_editedName;
    v9->_editedName = v12;

    v9->_shouldShowFullWallpaperSection = 1;
  }

  return v9;
}

- (HOAddLocationViewController)init
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("init");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOAddLocationViewController.m"), 72, CFSTR("%s is unavailable; use %@ instead"),
    "-[HOAddLocationViewController init]",
    v6);

  return 0;
}

- (HOAddLocationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v6;
  NSString *v7;
  void *v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4));
  v7 = NSStringFromSelector("init");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOAddLocationViewController.m"), 77, CFSTR("%s is unavailable; use %@ instead"),
    "-[HOAddLocationViewController initWithNibName:bundle:]",
    v8);

  return 0;
}

- (HOAddLocationViewController)initWithCoder:(id)a3
{
  void *v5;
  NSString *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  v6 = NSStringFromSelector("init");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOAddLocationViewController.m"), 82, CFSTR("%s is unavailable; use %@ instead"),
    "-[HOAddLocationViewController initWithCoder:]",
    v7);

  return 0;
}

- (HOAddLocationViewController)initWithStyle:(int64_t)a3
{
  void *v5;
  NSString *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  v6 = NSStringFromSelector("init");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOAddLocationViewController.m"), 87, CFSTR("%s is unavailable; use %@ instead"),
    "-[HOAddLocationViewController initWithStyle:]",
    v7);

  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  HUTableViewDiffableDataSource *v29;
  HUTableViewDiffableDataSource *diffableDataSource;
  _QWORD v31[5];
  _QWORD v32[5];
  objc_super v33;
  _QWORD v34[6];

  v33.receiver = self;
  v33.super_class = (Class)HOAddLocationViewController;
  -[HOAddLocationViewController viewDidLoad](&v33, "viewDidLoad");
  -[HOAddLocationViewController setNavigationBarVisibility](self, "setNavigationBarVisibility");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setRowHeight:", UITableViewAutomaticDimension);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setEstimatedRowHeight:", 44.0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController tableView](self, "tableView"));
  objc_msgSend(v5, "_setSectionContentInsetFollowsLayoutMargins:", 1);

  v6 = sub_10000BD30(CFSTR("HOAddLocationTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[HOAddLocationViewController setTitle:](self, "setTitle:", v7);

  v34[0] = objc_opt_class(HUEditableTextCell);
  v34[1] = objc_opt_class(HUViewControllerTableViewCell);
  v34[2] = objc_opt_class(HUTitleValueCell);
  v34[3] = objc_opt_class(HUWallpaperThumbnailCell);
  v34[4] = objc_opt_class(HUButtonCell);
  v34[5] = objc_opt_class(HUSwitchCell);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 6));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10000EE24;
  v32[3] = &unk_1000B59B0;
  v32[4] = self;
  objc_msgSend(v8, "na_each:", v32);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController tableView](self, "tableView"));
  v10 = objc_opt_class(UITableViewHeaderFooterView);
  v11 = (objc_class *)objc_opt_class(UITableViewHeaderFooterView);
  v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v9, "registerClass:forHeaderFooterViewReuseIdentifier:", v10, v13);

  if (+[HUWallpaperPickerInlineViewController useWallpaperPickerCell](HUWallpaperPickerInlineViewController, "useWallpaperPickerCell"))
  {
    v14 = objc_alloc_init((Class)HUWallpaperPickerInlineViewController);
    -[HOAddLocationViewController setWallpaperPickerViewController:](self, "setWallpaperPickerViewController:", v14);

  }
  v15 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 3, self, "saveButtonPressed:");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v16, "setRightBarButtonItem:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController navigationItem](self, "navigationItem"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "rightBarButtonItem"));
  objc_msgSend(v18, "setStyle:", 2);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController navigationItem](self, "navigationItem"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "rightBarButtonItem"));
  objc_msgSend(v20, "setAccessibilityIdentifier:", CFSTR("Home.HomeSettings.AddHome.Save"));

  v21 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "cancelButtonPressed:");
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v22, "setLeftBarButtonItem:", v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController navigationItem](self, "navigationItem"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leftBarButtonItem"));
  objc_msgSend(v24, "setAccessibilityIdentifier:", CFSTR("Home.HomeSettings.AddHome.Cancel"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController navigationItem](self, "navigationItem"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "rightBarButtonItem"));
  objc_msgSend(v26, "setEnabled:", 0);

  v27 = objc_alloc((Class)HUTableViewDiffableDataSource);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController tableView](self, "tableView"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10000EE80;
  v31[3] = &unk_1000B59D8;
  v31[4] = self;
  v29 = (HUTableViewDiffableDataSource *)objc_msgSend(v27, "initWithTableView:cellProvider:delegate:", v28, v31, self);
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v29;

  -[HOAddLocationViewController applySnapshotWithAnimation:](self, "applySnapshotWithAnimation:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HOAddLocationViewController;
  -[HOAddLocationViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[HOAddLocationViewController setNavigationBarVisibility](self, "setNavigationBarVisibility");
}

- (void)viewDidAppear:(BOOL)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HOAddLocationViewController;
  -[HOAddLocationViewController viewDidAppear:](&v12, "viewDidAppear:", a3);
  v4 = sub_10000BD30(CFSTR("HOAddLocationPlaceholderTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController nameCell](self, "nameCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textField"));
  objc_msgSend(v7, "setPlaceholder:", v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController nameCell](self, "nameCell"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textField"));
  objc_msgSend(v9, "becomeFirstResponder");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController nameCell](self, "nameCell"));
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("Home.HomeSettings.AddHome.HomeName"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "addObserver:selector:name:object:", self, "textFieldDidChange:", UITextFieldTextDidChangeNotification, 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HOAddLocationViewController;
  -[HOAddLocationViewController viewWillDisappear:](&v5, "viewWillDisappear:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController view](self, "view"));
  objc_msgSend(v4, "endEditing:", 1);

}

- (void)saveButtonPressed:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[5];
  _QWORD v33[5];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  const char *v37;

  v4 = a3;
  v5 = HFLogForCategory(68);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v35 = objc_opt_class(self);
    v36 = 2080;
    v37 = "-[HOAddLocationViewController saveButtonPressed:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(%@:%s) Save button pressed.", buf, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController editedName](self, "editedName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HFUtilities sanitizeUserEnteredHomeKitName:](HFUtilities, "sanitizeUserEnteredHomeKitName:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController nameCell](self, "nameCell"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textField"));
  objc_msgSend(v10, "setText:", v8);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController homeBuilder](self, "homeBuilder"));
  objc_msgSend(v11, "setName:", v8);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController navigationItem](self, "navigationItem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rightBarButtonItem"));
  -[HOAddLocationViewController setSavedButtonBarItem:](self, "setSavedButtonBarItem:", v13);

  v14 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  v15 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v16, "setRightBarButtonItem:", v15);

  objc_msgSend(v14, "startAnimating");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController nameCell](self, "nameCell"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "textField"));
  objc_msgSend(v18, "resignFirstResponder");

  v19 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v20, "setRightBarButtonItem:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController nameCell](self, "nameCell"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "textField"));
  objc_msgSend(v22, "resignFirstResponder");

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController homeBuilder](self, "homeBuilder"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "commitItem"));

  objc_initWeak((id *)buf, self);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10000F400;
  v33[3] = &unk_1000B5A00;
  v33[4] = self;
  v25 = objc_msgSend(v24, "addCompletionBlock:", v33);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10000F45C;
  v32[3] = &unk_1000B5A28;
  v32[4] = self;
  v26 = objc_msgSend(v24, "addSuccessBlock:", v32);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10000F4DC;
  v29[3] = &unk_1000B5A78;
  objc_copyWeak(&v31, (id *)buf);
  v27 = v8;
  v30 = v27;
  v28 = objc_msgSend(v24, "addFailureBlock:", v29);

  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);

}

- (void)cancelButtonPressed:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "addLocationViewController:didFinishWithHome:", self, 0);

}

- (void)nameCellTextChanged:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));
    v6 = objc_msgSend(v5, "isEqualToString:", &stru_1000BBDF8) ^ 1;

  }
  else
  {
    v6 = 0;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController navigationItem](self, "navigationItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rightBarButtonItem"));
  objc_msgSend(v8, "setEnabled:", v6);

  -[HOAddLocationViewController setModalInPresentation:](self, "setModalInPresentation:", v6);
}

- (void)applySnapshotWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  __CFString **v9;
  void *v10;
  __CFString *v11;
  _QWORD v12[2];

  v3 = a3;
  v5 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  v12[0] = off_1000CFE00;
  v12[1] = off_1000CFE08;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
  objc_msgSend(v5, "appendSectionsWithIdentifiers:", v6);

  v11 = off_1000CFE10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v7, off_1000CFE00);

  v8 = objc_opt_new(NSMutableArray);
  if (-[HOAddLocationViewController shouldShowFullWallpaperSection](self, "shouldShowFullWallpaperSection"))
  {
    if ((+[HUWallpaperPickerInlineViewController useWallpaperPickerCell](HUWallpaperPickerInlineViewController, "useWallpaperPickerCell") & 1) != 0)
    {
      v9 = &off_1000CFE30;
    }
    else
    {
      if (+[UIImagePickerController isSourceTypeAvailable:](UIImagePickerController, "isSourceTypeAvailable:", 1))
      {
        -[NSMutableArray addObject:](v8, "addObject:", off_1000CFE18);
      }
      -[NSMutableArray addObject:](v8, "addObject:", off_1000CFE20);
      v9 = &off_1000CFE28;
    }
    -[NSMutableArray addObject:](v8, "addObject:", *v9);
  }
  objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v8, off_1000CFE08);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController diffableDataSource](self, "diffableDataSource"));
  objc_msgSend(v10, "applySnapshot:animatingDifferences:", v5, v3);

}

- (void)updateCell:(id)a3 forIndexPath:(id)a4 animated:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  BOOL v15;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController diffableDataSource](self, "diffableDataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemIdentifierForIndexPath:", v7));

  LODWORD(v7) = objc_msgSend(v9, "isEqualToString:", off_1000CFE30);
  if ((_DWORD)v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController homeBuilder](self, "homeBuilder"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "wallpaperBuilder"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "wallpaperEditCollectionFuture"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000F9B4;
    v14[3] = &unk_1000B5AA0;
    v14[4] = self;
    v15 = a5;
    v13 = objc_msgSend(v12, "addSuccessBlock:", v14);

  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 rowIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  objc_class *v34;
  NSString *v35;
  void *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  objc_class *v41;
  NSString *v42;
  void *v43;
  __CFString *v44;
  void *v45;
  objc_class *v47;
  NSString *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  _QWORD v61[4];
  id v62;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "isEqualToString:", off_1000CFE10))
  {
    v11 = (objc_class *)objc_opt_class(HUEditableTextCell);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", v13, v9));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "textField"));
    objc_msgSend(v15, "setAutocapitalizationType:", 1);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "textField"));
    objc_msgSend(v16, "setClearButtonMode:", 3);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "textField"));
    objc_msgSend(v17, "setDelegate:", self);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController editedName](self, "editedName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "textField"));
    objc_msgSend(v19, "setText:", v18);

    -[HOAddLocationViewController setNameCell:](self, "setNameCell:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController nameCell](self, "nameCell"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "textField"));
    objc_msgSend(v21, "addTarget:action:forControlEvents:", self, "nameCellTextChanged:", 917504);

LABEL_5:
    goto LABEL_11;
  }
  if (objc_msgSend(v10, "isEqualToString:", off_1000CFE30))
  {
    v22 = (objc_class *)objc_opt_class(HUViewControllerTableViewCell);
    v23 = NSStringFromClass(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", v24, v9));

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController wallpaperPickerViewController](self, "wallpaperPickerViewController"));
    objc_msgSend(v14, "setViewController:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[HFWallpaperManager sharedInstance](HFWallpaperManager, "sharedInstance"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "allNamedWallpapersForWallpaperCollectionType:", 0));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController wallpaperPickerViewController](self, "wallpaperPickerViewController"));
    objc_msgSend(v28, "setNamedWallpapers:", v27);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[HFWallpaperManager sharedInstance](HFWallpaperManager, "sharedInstance"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "allNamedWallpaperThumbnailsForWallpaperCollectionType:", 0));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController wallpaperPickerViewController](self, "wallpaperPickerViewController"));
    objc_msgSend(v31, "setNamedWallpaperThumbnails:", v30);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController wallpaperPickerViewController](self, "wallpaperPickerViewController"));
    objc_msgSend(v8, "frame");
    objc_msgSend(v32, "setImageSizeToFitWidth:forNumberOfWallpapers:", 3, v33);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController wallpaperPickerViewController](self, "wallpaperPickerViewController"));
    objc_msgSend(v20, "setDelegate:", self);
    goto LABEL_5;
  }
  if (objc_msgSend(v10, "isEqualToString:", off_1000CFE18))
  {
    v34 = (objc_class *)objc_opt_class(HUButtonCell);
    v35 = NSStringFromClass(v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", v36, v9));

    v37 = sub_10000BD30(CFSTR("HOAddLocationTakePhotoTitle"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "textLabel"));
    objc_msgSend(v39, "setText:", v38);

    objc_msgSend(v14, "setDisabled:", +[UIImagePickerController isSourceTypeAvailable:](UIImagePickerController, "isSourceTypeAvailable:", 1) ^ 1);
    v40 = CFSTR("Home.HomeSettings.AddHome.TakePhoto");
LABEL_10:
    objc_msgSend(v14, "setAccessibilityIdentifier:", v40);
    goto LABEL_11;
  }
  if (objc_msgSend(v10, "isEqualToString:", off_1000CFE20))
  {
    v41 = (objc_class *)objc_opt_class(HUTitleValueCell);
    v42 = NSStringFromClass(v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", v43, v9));

    objc_msgSend(v14, "setAccessoryType:", 1);
    objc_msgSend(v14, "setHideIcon:", 1);
    v44 = sub_10000BD30(CFSTR("HOAddLocationChooseWallpaperTitle"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    objc_msgSend(v14, "setTitleText:", v45);

    v40 = CFSTR("Home.HomeSettings.AddHome.ChooseFromExisting");
    goto LABEL_10;
  }
  if (objc_msgSend(v10, "isEqualToString:", off_1000CFE28))
  {
    v47 = (objc_class *)objc_opt_class(HUWallpaperThumbnailCell);
    v48 = NSStringFromClass(v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", v49, v9));

    objc_msgSend(v50, "setAccessibilityIdentifier:", CFSTR("Home.HomeSettings.AddHome.WallpaperThumbnail"));
    objc_msgSend(v50, "setDelegate:", self);
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v51, "bounds");
    v53 = v52;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v54, "bounds");
    v56 = v53 / v55;

    objc_msgSend(v50, "setImageSize:", round(v56 * 244.0));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController homeBuilder](self, "homeBuilder"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "wallpaperBuilder"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "wallpaperEditCollectionFuture"));
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_10000FFF0;
    v61[3] = &unk_1000B5AC8;
    v14 = v50;
    v62 = v14;
    v60 = objc_msgSend(v59, "addSuccessBlock:", v61);

  }
  else
  {
    v14 = 0;
  }
LABEL_11:
  -[HOAddLocationViewController updateCell:forIndexPath:animated:](self, "updateCell:forIndexPath:animated:", v14, v9, 0);

  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController diffableDataSource](self, "diffableDataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemIdentifierForIndexPath:", v6));

  if (objc_msgSend(v8, "isEqualToString:", off_1000CFE18))
  {
    v9 = objc_alloc_init((Class)UIImagePickerController);
    objc_msgSend(v9, "setDelegate:", self);
    objc_msgSend(v9, "setSourceType:", 1);
    -[HOAddLocationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
LABEL_7:

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", off_1000CFE20))
  {
    v10 = objc_alloc((Class)HUWallpaperPickerViewController);
    v11 = HULocalizedString(CFSTR("HUEditLocationNamedWallpaperSectionTitle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v9 = objc_msgSend(v10, "initWithCollectionType:namedSectionTitle:delegate:", 0, v12, self);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController navigationController](self, "navigationController"));
    objc_msgSend(v13, "pushViewController:animated:", v9, 1);

    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isEqualToString:", off_1000CFE28))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController homeBuilder](self, "homeBuilder"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "wallpaperBuilder"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "wallpaperEditCollectionFuture"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100010240;
    v17[3] = &unk_1000B5AC8;
    v17[4] = self;
    v16 = objc_msgSend(v15, "addSuccessBlock:", v17);

    goto LABEL_7;
  }
LABEL_8:

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController diffableDataSource](self, "diffableDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemIdentifierForIndexPath:", v5));

  v8 = (objc_msgSend(v7, "isEqualToString:", off_1000CFE30) & 1) == 0
    && (+[UIImagePickerController isSourceTypeAvailable:](UIImagePickerController, "isSourceTypeAvailable:", 1)|| (objc_msgSend(v7, "isEqualToString:", off_1000CFE18) & 1) == 0);

  return v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration groupedHeaderConfiguration](UIListContentConfiguration, "groupedHeaderConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController diffableDataSource](self, "diffableDataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionIdentifierForIndex:", a4));

  if ((objc_msgSend(v9, "isEqualToString:", off_1000CFE00) & 1) != 0)
  {
    v10 = CFSTR("HOAddLocationNameSection");
  }
  else
  {
    if (!objc_msgSend(v9, "isEqualToString:", off_1000CFE08))
    {
      v12 = v7;
      v7 = 0;
      goto LABEL_7;
    }
    v10 = CFSTR("HOAddLocationWallpaperSectionTitle");
  }
  v11 = sub_10000BD30(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v7, "setText:", v12);
LABEL_7:

  v13 = (objc_class *)objc_opt_class(UITableViewHeaderFooterView);
  v14 = NSStringFromClass(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", v15));

  objc_msgSend(v16, "setContentConfiguration:", v7);
  return v16;
}

- (void)textFieldDidChange:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
  -[HOAddLocationViewController setEditedName:](self, "setEditedName:", v4);

}

- (BOOL)textFieldShouldClear:(id)a3
{
  -[HOAddLocationViewController setEditedName:](self, "setEditedName:", 0);
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HFUtilities sanitizeUserEnteredHomeKitName:](HFUtilities, "sanitizeUserEnteredHomeKitName:", v5));
  -[HOAddLocationViewController setEditedName:](self, "setEditedName:", v6);

  objc_msgSend(v4, "resignFirstResponder");
  return 1;
}

- (void)wallpaperPickerDidFinish:(id)a3 wallpaper:(id)a4 image:(id)a5
{
  id v6;
  id v7;

  -[HOAddLocationViewController updateWallpaper:image:](self, "updateWallpaper:image:", a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController navigationController](self, "navigationController"));
  v6 = objc_msgSend(v7, "popToViewController:animated:", self, 1);

}

- (void)wallpaperThumbnailCell:(id)a3 didReceiveDroppedImage:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[HFWallpaper customWallpaperWithAssetIdentifier:](HFWallpaper, "customWallpaperWithAssetIdentifier:", v6));
  -[HOAddLocationViewController updateWallpaper:image:](self, "updateWallpaper:image:", v7, v5);

}

- (void)wallpaperPicker:(id)a3 didReceiveDroppedImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
  v16 = (id)objc_claimAutoreleasedReturnValue(+[HFWallpaper customWallpaperWithAssetIdentifier:](HFWallpaper, "customWallpaperWithAssetIdentifier:", v9));

  objc_msgSend(v7, "setOriginalCustomImage:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController homeBuilder](self, "homeBuilder"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "wallpaperBuilder"));
  objc_msgSend(v11, "setWallpaper:image:", v16, v6);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController diffableDataSource](self, "diffableDataSource"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "indexPathForItemIdentifier:", off_1000CFE30));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController tableView](self, "tableView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cellForRowAtIndexPath:", v13));
  -[HOAddLocationViewController updateCell:forIndexPath:animated:](self, "updateCell:forIndexPath:animated:", v15, v13, 1);

}

- (void)wallpaperPicker:(id)a3 didSelectWallpaper:(id)a4 withImage:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController homeBuilder](self, "homeBuilder"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "wallpaperBuilder"));
  objc_msgSend(v9, "setWallpaper:image:", v8, v7);

}

- (void)wallpaperPickerRequestOpenWallpaperEditor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController homeBuilder](self, "homeBuilder", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "wallpaperBuilder"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "wallpaperEditCollectionFuture"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000108D8;
  v8[3] = &unk_1000B5AC8;
  v8[4] = self;
  v7 = objc_msgSend(v6, "addSuccessBlock:", v8);

}

- (void)wallpaperEditing:(id)a3 didFinishWithWallpaper:(id)a4 image:(id)a5
{
  -[HOAddLocationViewController updateWallpaper:image:](self, "updateWallpaper:image:", a4, a5);
  -[HOAddLocationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)wallpaperEditingDidCancel:(id)a3
{
  -[HOAddLocationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v5;
  UIImage *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v5 = a4;
  -[HOAddLocationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  v6 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", UIImagePickerControllerOriginalImage));

  UIImageWriteToSavedPhotosAlbum(v6, 0, 0, 0);
  v7 = objc_alloc((Class)HFWallpaper);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
  v10 = objc_msgSend(v7, "initWithType:assetIdentifier:cropInfo:", 1, v9, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[HFWallpaperManager sharedInstance](HFWallpaperManager, "sharedInstance"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "processOriginalImageFromWallpaper:originalImage:", v10, v6));

  -[HOAddLocationViewController presentWallpaperEditingViewControllerWithImage:wallpaper:](self, "presentWallpaperEditingViewControllerWithImage:wallpaper:", v12, v10);
}

- (void)presentWallpaperEditingViewControllerWithImage:(id)a3 wallpaper:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)HUWallpaperEditingViewController), "initWithWallpaper:image:delegate:", v6, v7, self);

  -[HOAddLocationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

- (void)updateWallpaper:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController homeBuilder](self, "homeBuilder"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "wallpaperBuilder"));
  objc_msgSend(v9, "setWallpaper:image:", v7, v6);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController diffableDataSource](self, "diffableDataSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController diffableDataSource](self, "diffableDataSource"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "snapshot"));
  objc_msgSend(v12, "applySnapshotUsingReloadData:", v11);

}

- (void)setNavigationBarVisibility
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController navigationController](self, "navigationController"));
  objc_msgSend(v3, "setNavigationBarHidden:animated:", 0, 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setHidesBackButton:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController navigationController](self, "navigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationBar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  objc_msgSend(v6, "setBarTintColor:", v7);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[HOAddLocationViewController navigationController](self, "navigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navigationBar"));
  objc_msgSend(v8, "_setHidesShadow:", 0);

}

- (HOAddLocationViewControllerDelegate)delegate
{
  return (HOAddLocationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (HFHomeBuilder)homeBuilder
{
  return self->_homeBuilder;
}

- (void)setHomeBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_homeBuilder, a3);
}

- (UIBarButtonItem)savedButtonBarItem
{
  return self->_savedButtonBarItem;
}

- (void)setSavedButtonBarItem:(id)a3
{
  objc_storeStrong((id *)&self->_savedButtonBarItem, a3);
}

- (HUWallpaperPickerInlineViewController)wallpaperPickerViewController
{
  return self->_wallpaperPickerViewController;
}

- (void)setWallpaperPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperPickerViewController, a3);
}

- (HUEditableTextCell)nameCell
{
  return (HUEditableTextCell *)objc_loadWeakRetained((id *)&self->_nameCell);
}

- (void)setNameCell:(id)a3
{
  objc_storeWeak((id *)&self->_nameCell, a3);
}

- (NSString)editedName
{
  return self->_editedName;
}

- (void)setEditedName:(id)a3
{
  objc_storeStrong((id *)&self->_editedName, a3);
}

- (BOOL)shouldShowFullWallpaperSection
{
  return self->_shouldShowFullWallpaperSection;
}

- (void)setShouldShowFullWallpaperSection:(BOOL)a3
{
  self->_shouldShowFullWallpaperSection = a3;
}

- (HUTableViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_editedName, 0);
  objc_destroyWeak((id *)&self->_nameCell);
  objc_storeStrong((id *)&self->_wallpaperPickerViewController, 0);
  objc_storeStrong((id *)&self->_savedButtonBarItem, 0);
  objc_storeStrong((id *)&self->_homeBuilder, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
