@implementation BKLibraryUploadStatusViewController

- (BKLibraryUploadStatusViewController)initWithMetrics:(id)a3
{
  id v5;
  BKLibraryUploadStatusViewController *v6;
  BKLibraryUploadStatusViewController *v7;
  void *v8;
  id v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKLibraryUploadStatusViewController;
  v6 = -[BKLibraryUploadStatusViewController init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mainHeaderMetrics, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v9 = -[BKLibraryUploadStatusViewController registerForTraitChanges:withAction:](v7, "registerForTraitChanges:withAction:", v8, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v7;
}

- (void)setMainHeaderMetrics:(id)a3
{
  id v5;
  _QWORD v6[5];

  objc_storeStrong((id *)&self->_mainHeaderMetrics, a3);
  v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007CC7C;
  v6[3] = &unk_1008E72C0;
  v6[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v6);

}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  id v5;
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
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)BKLibraryUploadStatusViewController;
  -[BKLibraryUploadStatusViewController viewDidLoad](&v20, "viewDidLoad");
  v3 = objc_alloc((Class)UITableView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v5 = objc_msgSend(v3, "initWithFrame:style:", 0);
  -[BKLibraryUploadStatusViewController setTableView:](self, "setTableView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setAutoresizingMask:", 18);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController tableView](self, "tableView"));
  objc_msgSend(v7, "setDelegate:", self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController tableView](self, "tableView"));
  objc_msgSend(v8, "setDataSource:", self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController tableView](self, "tableView"));
  objc_msgSend(v9, "addSubview:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController tableView](self, "tableView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UINib nibWithNibName:bundle:](UINib, "nibWithNibName:bundle:", CFSTR("BKUploadStatusCell"), 0));
  objc_msgSend(v11, "registerNib:forCellReuseIdentifier:", v12, CFSTR("BKUploadStatusCellIdentifier"));

  -[BKLibraryUploadStatusViewController setPresentedInPopover:](self, "setPresentedInPopover:", 0);
  -[BKLibraryUploadStatusViewController _updateTitle:](self, "_updateTitle:", objc_msgSend((id)objc_opt_class(self), "_uploadErrorType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController tableView](self, "tableView"));
  objc_msgSend(v13, "setRowHeight:", 64.0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uploadAssets"));

  objc_msgSend(v15, "addObserver:forKeyPath:options:context:", self, CFSTR("arrangedObjects"), 1, off_1009C82F0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
  objc_msgSend(v16, "addObserver:forKeyPath:options:context:", self, CFSTR("uploadStatus"), 1, off_1009C82F8);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v17, "addObserver:selector:name:object:", self, "_networkReachabilityChanged:", CFSTR("kNetworkReachabilityChangedNotification"), 0);

  sub_10007CDC8(self);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[BKLibraryUploadStatusViewController setAssetIdToState:](self, "setAssetIdToState:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "arrangedObjects"));
  -[BKLibraryUploadStatusViewController _mergeAssets:](self, "_mergeAssets:", v19);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setDelegate:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setDataSource:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uploadAssets"));

  objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("arrangedObjects"), off_1009C82F0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
  objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, CFSTR("uploadStatus"), off_1009C82F8);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "removeObserver:", self);

  v9.receiver = self;
  v9.super_class = (Class)BKLibraryUploadStatusViewController;
  -[BKLibraryUploadStatusViewController dealloc](&v9, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;
  _QWORD v14[5];
  _QWORD block[5];
  id v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (off_1009C82F0 == a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007DB80;
    block[3] = &unk_1008E7338;
    block[4] = self;
    v16 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  else if (off_1009C82F8 == a6)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10007DBF8;
    v14[3] = &unk_1008E72C0;
    v14[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)BKLibraryUploadStatusViewController;
    -[BKLibraryUploadStatusViewController observeValueForKeyPath:ofObject:change:context:](&v13, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKLibraryUploadStatusViewController;
  -[BKLibraryUploadStatusViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  sub_10007CDC8(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController traitCollection](self, "traitCollection"));
  -[BKLibraryUploadStatusViewController setThemeForUserInterfaceStyle:](self, "setThemeForUserInterfaceStyle:", objc_msgSend(v4, "userInterfaceStyle"));

}

- (void)setThemeForUserInterfaceStyle:(int64_t)a3
{
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
  _BOOL8 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  NSAttributedStringKey v30;
  void *v31;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController navigationController](self, "navigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationBar"));
  v30 = NSForegroundColorAttributeName;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor"));
  v31 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
  objc_msgSend(v6, "setTitleTextAttributes:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController navigationController](self, "navigationController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationBar"));
  objc_msgSend(v11, "setTintColor:", v9);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController view](self, "view"));
  objc_msgSend(v13, "setTintColor:", v12);

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10007DF5C;
  v29[3] = &unk_1008E72C0;
  v29[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v29);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSeparatorColor](UIColor, "bc_booksSeparatorColor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController tableView](self, "tableView"));
  objc_msgSend(v15, "setSeparatorColor:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController tableView](self, "tableView"));
  objc_msgSend(v17, "setBackgroundColor:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController navigationController](self, "navigationController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "navigationBar"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSecondaryBackground](UIColor, "bc_booksSecondaryBackground"));
  objc_msgSend(v19, "setBarTintColor:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController navigationController](self, "navigationController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "navigationBar"));
  v23 = a3 == 1;
  objc_msgSend(v22, "setTranslucent:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController navigationController](self, "navigationController"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "toolbar"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSecondaryBackground](UIColor, "bc_booksSecondaryBackground"));
  objc_msgSend(v25, "setBarTintColor:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController navigationController](self, "navigationController"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "toolbar"));
  objc_msgSend(v28, "setTranslucent:", v23);

  -[BKLibraryUploadStatusViewController _configureThemeForErrorHeaderView](self, "_configureThemeForErrorHeaderView");
  -[BKLibraryUploadStatusViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v5 = objc_msgSend(a4, "userInterfaceStyle", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController traitCollection](self, "traitCollection"));
    -[BKLibraryUploadStatusViewController setThemeForUserInterfaceStyle:](self, "setThemeForUserInterfaceStyle:", objc_msgSend(v8, "userInterfaceStyle"));

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKLibraryUploadStatusViewController;
  -[BKLibraryUploadStatusViewController viewWillDisappear:](&v6, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
  objc_msgSend(v4, "removeCompletedUploads");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BCLightLevelController sharedInstance](BCLightLevelController, "sharedInstance"));
  objc_msgSend(v5, "removeObserver:", self);

}

- (void)setPresentedInPopover:(BOOL)a3
{
  void *v4;
  id v5;

  self->_presentedInPopover = a3;
  if (a3)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v5, "setLeftBarButtonItem:", 0);
  }
  else
  {
    v5 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "_dismiss");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v4, "setLeftBarButtonItem:", v5);

  }
}

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  int64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "userInterfaceStyle") == (id)2;

  return v3;
}

- (void)_networkReachabilityChanged:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007E2D4;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

+ (id)_titleForUploading:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3)
    v6 = CFSTR("Uploading to iCloud…");
  else
    v6 = CFSTR("Uploaded to iCloud");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_10091C438, 0));

  return v7;
}

+ (id)_titleForUploadingCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Syncing %lu item(s) to iCloud…"), &stru_10091C438, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, a3));

  return v6;
}

+ (id)_titleForUploadError:(int64_t)a3 more:(BOOL)a4
{
  void *v5;
  const __CFString *v6;
  id v7;
  void *v8;

  if (a3 == 2)
  {
    v7 = +[BCDevice deviceClass](BCDevice, "deviceClass");
    if (v7 == (id)4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (a4)
        v6 = CFSTR("Your Mac is Offline…");
      else
        v6 = CFSTR("Your Mac is Offline");
    }
    else if (v7 == (id)3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (a4)
        v6 = CFSTR("Your iPad is Offline…");
      else
        v6 = CFSTR("Your iPad is Offline");
    }
    else if (v7 == (id)1)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (a4)
        v6 = CFSTR("Your iPhone is Offline…");
      else
        v6 = CFSTR("Your iPhone is Offline");
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (a4)
        v6 = CFSTR("Your device is Offline…");
      else
        v6 = CFSTR("Your device is Offline");
    }
    goto LABEL_22;
  }
  if (a3 == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (a4)
      v6 = CFSTR("iCloud Storage Is Full…");
    else
      v6 = CFSTR("iCloud Storage Is Full");
LABEL_22:
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v6, &stru_10091C438, 0));

    return v8;
  }
  v8 = 0;
  return v8;
}

+ (id)titleForUploadButton
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  void *v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v3 = (unint64_t)objc_msgSend((id)objc_opt_class(a1), "_uploadErrorType");
  if ((v3 | 2) != 2)
    return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_titleForUploadError:more:", v3, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uploadAssets"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrangedObjects"));

  if (objc_msgSend(v6, "count"))
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_10007E700;
    v16 = &unk_1008E7770;
    v17 = v4;
    v18 = &v19;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v13);
    v7 = v20[3];
    if (v3)
    {
      if (!v7)
      {
        v10 = 0;
LABEL_13:

        _Block_object_dispose(&v19, 8);
        goto LABEL_14;
      }
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_titleForUploadError:more:", v3, 1, v13, v14, v15, v16));
    }
    else if (v7)
    {
      v11 = (void *)objc_opt_class(a1);
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_titleForUploadingCount:", v20[3], v13, v14, v15, v16));
    }
    else
    {
      v12 = (void *)objc_opt_class(a1);
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_titleForUploading:", 0, v13, v14, v15, v16));
    }
    v10 = (void *)v8;
    goto LABEL_13;
  }
  v10 = 0;
LABEL_14:

  return v10;
}

- (void)_updateTitle:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (a3)
  {
    v4 = objc_msgSend((id)objc_opt_class(self), "_titleForUploadError:more:", a3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController assetIdToState](self, "assetIdToState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues"));

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v7;
    v9 = (uint64_t)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v8);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "integerValue", (_QWORD)v14) == (id)9)
          {
            v9 = 1;
            goto LABEL_13;
          }
        }
        v9 = (uint64_t)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_13:

    v12 = objc_msgSend((id)objc_opt_class(self), "_titleForUploading:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController navigationItem](self, "navigationItem", (_QWORD)v14));
  objc_msgSend(v13, "setTitle:", v5);

}

+ (int64_t)_uploadErrorType
{
  void *v2;
  unsigned int v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKReachability sharedReachabilityForInternetConnection](BKReachability, "sharedReachabilityForInternetConnection"));
  v3 = objc_msgSend(v2, "currentReachabilityStatus");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
  v5 = objc_msgSend(v4, "uploadStatus");

  if (v3)
    return v5 == (id)2;
  else
    return 2;
}

- (void)_mergeAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  BKLibraryUploadStatusViewController *v16;
  id v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10007EAF0;
  v14[3] = &unk_1008E7798;
  v15 = (id)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
  v16 = self;
  v13 = v5;
  v17 = v13;
  v7 = v6;
  v18 = v7;
  v8 = v15;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v14);

  if (objc_msgSend(v13, "count") || objc_msgSend(v7, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController tableView](self, "tableView"));
    objc_msgSend(v9, "beginUpdates");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController tableView](self, "tableView"));
    objc_msgSend(v10, "insertRowsAtIndexPaths:withRowAnimation:", v13, 100);

    -[BKLibraryUploadStatusViewController setNumAssetsAdded:](self, "setNumAssetsAdded:", (char *)objc_msgSend(v13, "count") + -[BKLibraryUploadStatusViewController numAssetsAdded](self, "numAssetsAdded"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController tableView](self, "tableView"));
    objc_msgSend(v11, "reloadRowsAtIndexPaths:withRowAnimation:", v7, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController tableView](self, "tableView"));
    objc_msgSend(v12, "endUpdates");

  }
}

- (void)_adjustPreferredContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController tableView](self, "tableView"));
  objc_msgSend(v3, "rowHeight");
  v5 = v4 * 5.0 + 0.0;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController errorHeaderView](self, "errorHeaderView"));
  objc_msgSend(v6, "bounds");
  v8 = v5 + v7;

  -[BKLibraryUploadStatusViewController preferredContentSize](self, "preferredContentSize");
  v10 = v9;
  -[BKLibraryUploadStatusViewController preferredContentSize](self, "preferredContentSize");
  if (v12 != v10 || v11 != v8)
    -[BKLibraryUploadStatusViewController setPreferredContentSize:](self, "setPreferredContentSize:", v10, v8);
}

- (void)_dismiss
{
  -[BKLibraryUploadStatusViewController _dismissWithCompletion:](self, "_dismissWithCompletion:", 0);
}

- (void)_dismissWithCompletion:(id)a3
{
  id v3;
  _QWORD v4[4];
  BKLibraryUploadStatusViewController *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007ED38;
  v4[3] = &unk_1008E7680;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[BKLibraryUploadStatusViewController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, v4);

}

- (id)_uploadAssetAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uploadAssets"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrangedObjects"));

  if ((unint64_t)objc_msgSend(v6, "count") <= a3)
  {
    v9 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a3));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "libraryAssetOnMainQueueWithAssetID:", v8));

  }
  return v9;
}

- (void)_presentUpgradeStorageFlow
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "libraryUploadStatusPresentingViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationController"));

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007EEF8;
  v7[3] = &unk_1008E72C0;
  v8 = v5;
  v6 = v5;
  -[BKLibraryUploadStatusViewController _dismissWithCompletion:](self, "_dismissWithCompletion:", v7);

}

- (void)_configureThemeForCell:(id)a3
{
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
  id v24;

  v24 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  objc_msgSend(v24, "setBackgroundColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "textContainerView"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController mainHeaderMetrics](self, "mainHeaderMetrics"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController mainHeaderMetrics](self, "mainHeaderMetrics"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "iCloudBookTitleFontAttributes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "font"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "titleLabel"));
    objc_msgSend(v11, "setFont:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController mainHeaderMetrics](self, "mainHeaderMetrics"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "iCloudBookTitleFontAttributes"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "foregroundColor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "titleLabel"));
    objc_msgSend(v15, "setTextColor:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController mainHeaderMetrics](self, "mainHeaderMetrics"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "iCloudBookStatusFontAttributes"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "font"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "statusLabel"));
    objc_msgSend(v19, "setFont:", v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController mainHeaderMetrics](self, "mainHeaderMetrics"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "iCloudBookStatusFontAttributes"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "foregroundColor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "statusLabel"));
    objc_msgSend(v23, "setTextColor:", v22);

  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "titleLabel"));
    objc_msgSend(v21, "setTextColor:", v20);
  }

}

- (void)_configureThemeForErrorHeaderView
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
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
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController errorHeaderView](self, "errorHeaderView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController traitCollection](self, "traitCollection"));
    v5 = objc_msgSend(v4, "userInterfaceStyle");

    if (v5 == (id)2)
      v6 = 2;
    else
      v6 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController errorHeaderView](self, "errorHeaderView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "visualEffectView"));
    objc_msgSend(v9, "setEffect:", v7);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSeparatorColor](UIColor, "bc_booksSeparatorColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController errorHeaderView](self, "errorHeaderView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "underlineView"));
    objc_msgSend(v12, "setBackgroundColor:", v10);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController mainHeaderMetrics](self, "mainHeaderMetrics"));
    if (!v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSecondaryLabelColor](UIColor, "bc_booksSecondaryLabelColor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController errorHeaderView](self, "errorHeaderView"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "errorLabel"));
      objc_msgSend(v16, "setTextColor:", v14);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController errorHeaderView](self, "errorHeaderView"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "upgradeButton"));

      if (v18)
      {
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor")));
        v19 = objc_msgSend(v23, "CGColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController errorHeaderView](self, "errorHeaderView"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "upgradeButton"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "layer"));
        objc_msgSend(v22, "setBorderColor:", v19);

      }
    }
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  if (isPhone(self, a2))
    return 26;
  else
    return 30;
}

- (void)uploadErrorHeaderViewUpgradeButtonPressed:(id)a3
{
  -[BKLibraryUploadStatusViewController _presentUpgradeStorageFlow](self, "_presentUpgradeStorageFlow", a3);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusViewController _uploadAssetAtIndex:](self, "_uploadAssetAtIndex:", objc_msgSend(v7, "row")));
  if (!v8)
  {
    v11 = objc_msgSend(v7, "row");
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AppSource/Classes/BKLibraryUploadStatusViewController.m", 688, "-[BKLibraryUploadStatusViewController tableView:cellForRowAtIndexPath:]", "asset != nil", CFSTR("Request for invalid asset at index %ld"));
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("BKUploadStatusCellIdentifier"), v7, v11));
  -[BKLibraryUploadStatusViewController _configureThemeForCell:](self, "_configureThemeForCell:", v9);
  objc_msgSend(v9, "configureForAsset:", v8);

  return v9;
}

- (BKLibraryUploadStatusViewControllerDelegate)delegate
{
  return (BKLibraryUploadStatusViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)presentedInPopover
{
  return self->_presentedInPopover;
}

- (BKLibraryBookshelfMainHeaderMetrics)mainHeaderMetrics
{
  return self->_mainHeaderMetrics;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (int64_t)numAssetsAdded
{
  return self->_numAssetsAdded;
}

- (void)setNumAssetsAdded:(int64_t)a3
{
  self->_numAssetsAdded = a3;
}

- (BKUploadErrorHeaderView)errorHeaderView
{
  return self->_errorHeaderView;
}

- (void)setErrorHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_errorHeaderView, a3);
}

- (NSMutableDictionary)assetIdToState
{
  return self->_assetIdToState;
}

- (void)setAssetIdToState:(id)a3
{
  objc_storeStrong((id *)&self->_assetIdToState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIdToState, 0);
  objc_storeStrong((id *)&self->_errorHeaderView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_mainHeaderMetrics, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
