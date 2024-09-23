@implementation HomeNotificationTableViewController

- (HomeNotificationTableViewController)initWithNotification:(id)a3 home:(id)a4 cameraProfile:(id)a5 notificationUUID:(id)a6 clipUUID:(id)a7 snapshot:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HomeNotificationTableViewController *v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  HUNCCameraPlayerViewController *v28;
  HUNCCameraPlayerViewController *playerViewController;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v35;
  void *v36;
  id v37;
  id obj;
  objc_super v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v39.receiver = self;
  v39.super_class = (Class)HomeNotificationTableViewController;
  v20 = -[HomeNotificationTableViewController initWithStyle:](&v39, "initWithStyle:", 0);
  if (v20)
  {
    v21 = HFLogForCategory(48);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    obj = a8;
    if (v19)
    {
      if (v23)
      {
        *(_DWORD *)buf = 138412546;
        v41 = v17;
        v42 = 2112;
        v43 = v18;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "NotificationUUID:%@ launched with a snapshot. No player for clipUUID:%@", buf, 0x16u);
      }
    }
    else
    {
      v37 = v15;
      if (v23)
      {
        *(_DWORD *)buf = 138412546;
        v41 = v17;
        v42 = 2112;
        v43 = v18;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "NotificationUUID:%@ launched without a snapshot. Load player for clipUUID:%@", buf, 0x16u);
      }

      v35 = objc_alloc((Class)HUNCCameraPlayerViewController);
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "request"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject content](v22, "content"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "attachments"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "firstObject"));
      v26 = v14;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "URL"));
      v28 = (HUNCCameraPlayerViewController *)objc_msgSend(v35, "initWithCameraProfile:notificationUUID:clipUUID:imageURL:", v16, v17, v18, v27);
      playerViewController = v20->_playerViewController;
      v20->_playerViewController = v28;

      v14 = v26;
      v15 = v37;
    }

    v30 = objc_alloc((Class)HFCameraItem);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "hf_characteristicValueManager"));
    v32 = objc_msgSend(v30, "initWithProfile:valueSource:", v16, v31);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController _createNearbyAccessoryViewControllerWithSourceItem:supportsQuickControls:](v20, "_createNearbyAccessoryViewControllerWithSourceItem:supportsQuickControls:", v32, 0));
    -[HomeNotificationTableViewController setNearbyAccessoriesViewController:](v20, "setNearbyAccessoriesViewController:", v33);

    objc_storeStrong((id *)&v20->_snapshot, obj);
  }

  return v20;
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
  uint64_t v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)HomeNotificationTableViewController;
  -[HomeNotificationTableViewController viewDidLoad](&v24, "viewDidLoad");
  -[HomeNotificationTableViewController setSectionContentInsetFollowsLayoutMargins:](self, "setSectionContentInsetFollowsLayoutMargins:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setScrollEnabled:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setAllowsSelection:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setShowsHorizontalScrollIndicator:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController tableView](self, "tableView"));
  objc_msgSend(v7, "setBackgroundColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController tableView](self, "tableView"));
  objc_msgSend(v8, "setSeparatorStyle:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController tableView](self, "tableView"));
  objc_msgSend(v9, "setContentInsetAdjustmentBehavior:", 2);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController tableView](self, "tableView"));
  v11 = objc_opt_class(HUViewControllerTableViewCell);
  v12 = (objc_class *)objc_opt_class(HUViewControllerTableViewCell);
  v13 = NSStringFromClass(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v10, "registerClass:forCellReuseIdentifier:", v11, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController nearbyAccessoriesViewController](self, "nearbyAccessoriesViewController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
  objc_msgSend(v17, "setBackgroundColor:", v15);

  objc_initWeak(&location, self);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController nearbyAccessoriesViewController](self, "nearbyAccessoriesViewController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "hu_preloadContent"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100009428;
  v21[3] = &unk_100018900;
  objc_copyWeak(&v22, &location);
  v20 = objc_msgSend(v19, "addCompletionBlock:", v21);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HomeNotificationTableViewController;
  -[HomeNotificationTableViewController viewDidLayoutSubviews](&v4, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController tableView](self, "tableView"));
  objc_msgSend(v3, "contentSize");
  -[HomeNotificationTableViewController setPreferredContentSize:](self, "setPreferredContentSize:");

}

- (void)updateNearbyAccessoriesViewController
{
  void *v3;
  id v4;

  v3 = -[HomeNotificationTableViewController numberOfSectionsDisplayed](self, "numberOfSectionsDisplayed");
  if (v3 != (void *)-[HomeNotificationTableViewController _numberOfSectionsToShow](self, "_numberOfSectionsToShow"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController tableView](self, "tableView"));
    objc_msgSend(v4, "reloadData");

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  -[HomeNotificationTableViewController setNumberOfSectionsDisplayed:](self, "setNumberOfSectionsDisplayed:", -[HomeNotificationTableViewController _numberOfSectionsToShow](self, "_numberOfSectionsToShow", a3));
  return -[HomeNotificationTableViewController numberOfSectionsDisplayed](self, "numberOfSectionsDisplayed");
}

- (void)reloadAfterNotificationUpdate
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = HFLogForCategory(48);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Notification has been updated. Force reload.", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController playerViewController](self, "playerViewController"));
  objc_msgSend(v5, "reloadAfterNotificationUpdate");

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  objc_class *v25;
  NSString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double left;
  double bottom;
  double right;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController _identifierForSection:](self, "_identifierForSection:", objc_msgSend(v7, "section")));
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("notificationMediaViewerSection")))
  {
    v9 = (objc_class *)objc_opt_class(HUViewControllerTableViewCell);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v11, v7));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController snapshot](self, "snapshot"));
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
      objc_msgSend(v12, "setBackgroundColor:", v14);

      v15 = objc_msgSend(objc_alloc((Class)HUCameraBadgeView), "initWithSize:", 1);
      v16 = objc_msgSend(objc_alloc((Class)HUCameraView), "initWithBadgeView:", v15);
      objc_msgSend(v16, "setBadgeHidden:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController snapshot](self, "snapshot"));
      objc_msgSend(v16, "setCameraSource:", v17);

      objc_msgSend(v16, "setAutoresizingMask:", 18);
      objc_msgSend(v6, "bounds");
      v19 = v18;
      objc_msgSend(v6, "bounds");
      v21 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cameraSource"));
      objc_msgSend(v22, "aspectRatio");
      objc_msgSend(v16, "setFrame:", 0.0, 0.0, v19, v21 / v23);

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contentView"));
      objc_msgSend(v24, "addSubview:", v16);

    }
    else
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController playerViewController](self, "playerViewController"));

      if (v42)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlackColor](UIColor, "systemBlackColor"));
        objc_msgSend(v12, "setBackgroundColor:", v43);

        v44 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController playerViewController](self, "playerViewController"));
        objc_msgSend(v12, "setViewController:", v44);

        left = UIEdgeInsetsZero.left;
        bottom = UIEdgeInsetsZero.bottom;
        right = UIEdgeInsetsZero.right;
        objc_msgSend(v12, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);
        objc_msgSend(v12, "setSeparatorInset:", UIEdgeInsetsZero.top, left, bottom, right);
      }
    }
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("notificationNearbyAccessorySection")))
  {
    v25 = (objc_class *)objc_opt_class(HUViewControllerTableViewCell);
    v26 = NSStringFromClass(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v27, v7));

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController nearbyAccessoriesViewController](self, "nearbyAccessoriesViewController"));
    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      objc_msgSend(v12, "setBackgroundColor:", v29);

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController nearbyAccessoriesViewController](self, "nearbyAccessoriesViewController"));
      objc_msgSend(v12, "setViewController:", v30);

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController nearbyAccessoriesViewController](self, "nearbyAccessoriesViewController"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "collectionView"));
      objc_msgSend(v32, "setScrollEnabled:", 0);

      v33 = UIEdgeInsetsZero.left;
      v34 = UIEdgeInsetsZero.bottom;
      v35 = UIEdgeInsetsZero.right;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController nearbyAccessoriesViewController](self, "nearbyAccessoriesViewController"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "collectionView"));
      objc_msgSend(v37, "setContentInset:", UIEdgeInsetsZero.top, v33, v34, v35);

      v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController nearbyAccessoriesViewController](self, "nearbyAccessoriesViewController"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "collectionView"));
      objc_msgSend(v40, "setBackgroundColor:", v38);

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController nearbyAccessoriesViewController](self, "nearbyAccessoriesViewController"));
      objc_msgSend(v41, "setWantsPreferredContentSize:", 1);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController _identifierForSection:](self, "_identifierForSection:", objc_msgSend(v7, "section")));
  v9 = objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController snapshot](self, "snapshot"));
  if (v9
    && (v10 = (void *)v9,
        v11 = objc_msgSend(v8, "isEqualToString:", CFSTR("notificationMediaViewerSection")),
        v10,
        v11))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController tableView](self, "tableView"));
    objc_msgSend(v12, "bounds");
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController snapshot](self, "snapshot"));
    objc_msgSend(v15, "aspectRatio");
    v17 = v14 / v16;

  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)HomeNotificationTableViewController;
    -[HomeNotificationTableViewController tableView:heightForRowAtIndexPath:](&v20, "tableView:heightForRowAtIndexPath:", v6, v7);
    v17 = v18;
  }

  return v17;
}

- (int64_t)_numberOfSectionsToShow
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController nearbyAccessoriesViewController](self, "nearbyAccessoriesViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "itemManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allDisplayedItems"));
  if (objc_msgSend(v4, "count"))
    v5 = 2;
  else
    v5 = 1;

  return v5;
}

- (id)_currentSectionIdentifiers
{
  _QWORD v3[2];

  v3[0] = CFSTR("notificationMediaViewerSection");
  v3[1] = CFSTR("notificationNearbyAccessorySection");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 2));
}

- (id)_identifierForSection:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationTableViewController _currentSectionIdentifiers](self, "_currentSectionIdentifiers"));
  if ((unint64_t)objc_msgSend(v4, "count") <= a3)
    NSLog(CFSTR("Received identifier request for section (%lu), but only have (%lu) sections"), a3, objc_msgSend(v4, "count"));
  if ((unint64_t)objc_msgSend(v4, "count") <= a3)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", a3));

  return v5;
}

- (HUNCCameraPlayerViewController)playerViewController
{
  return self->_playerViewController;
}

- (void)setPlayerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_playerViewController, a3);
}

- (HUItemCollectionViewController)nearbyAccessoriesViewController
{
  return self->_nearbyAccessoriesViewController;
}

- (void)setNearbyAccessoriesViewController:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyAccessoriesViewController, a3);
}

- (HMCameraSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_snapshot, a3);
}

- (int64_t)numberOfSectionsDisplayed
{
  return self->_numberOfSectionsDisplayed;
}

- (void)setNumberOfSectionsDisplayed:(int64_t)a3
{
  self->_numberOfSectionsDisplayed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_nearbyAccessoriesViewController, 0);
  objc_storeStrong((id *)&self->_playerViewController, 0);
}

- (id)_createNearbyAccessoryViewControllerWithSourceItem:(id)a3 supportsQuickControls:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  HomeNotificationTableViewController *v8;
  void *v9;
  HomeNotificationTableViewController *v10;
  _QWORD v12[5];

  v4 = a4;
  objc_allocWithZone((Class)type metadata accessor for NearbyAccessoriesViewController(0, a2));
  v7 = a3;
  v8 = self;
  v9 = (void *)NearbyAccessoriesViewController.init(sourceItem:supportsQuickControls:)(v7, v4);
  v12[3] = sub_10000E36C();
  v12[4] = sub_10000E3A8();
  v12[0] = v8;
  v10 = v8;
  dispatch thunk of NearbyAccessoriesViewController.nearbyAccessoriesDelegate.setter(v12);

  return v9;
}

- (void)nearbyAccessoriesViewControllerDidUpdateWithViewController:(id)a3
{
  -[HomeNotificationTableViewController updateNearbyAccessoriesViewController](self, "updateNearbyAccessoriesViewController", a3);
}

@end
