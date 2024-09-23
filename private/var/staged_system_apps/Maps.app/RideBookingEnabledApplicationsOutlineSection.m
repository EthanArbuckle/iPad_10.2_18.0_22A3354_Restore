@implementation RideBookingEnabledApplicationsOutlineSection

- (RideBookingEnabledApplicationsOutlineSection)initWithCollectionView:(id)a3 sectionIdentifier:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RideBookingEnabledApplicationsOutlineSection;
  return -[RoutePlanningOutlineSection initWithCollectionView:sectionIdentifier:](&v5, "initWithCollectionView:sectionIdentifier:", a3, a4);
}

- (id)cellForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UICollectionView *collectionView;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  UICollectionView *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t Log;
  NSObject *v24;
  char *v25;
  id v26;
  UICollectionView *v27;
  objc_class *v28;
  NSString *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD v35[4];
  id v36;
  id v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  uint8_t buf[4];
  char *v46;
  __int16 v47;
  id v48;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingEnabledApplicationsOutlineSection enabledApplicationsStatuses](self, "enabledApplicationsStatuses"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "section")));

  if (objc_msgSend(v6, "loadingRideOptions"))
  {
    collectionView = self->super._collectionView;
    v8 = (objc_class *)objc_opt_class(RidesharingAppLargeIconTableViewCell);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](collectionView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v10, v4));

    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10042925C;
    v42[3] = &unk_1011AC8B0;
    v12 = v11;
    v43 = v12;
    v44 = v6;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v42);
    v13 = v44;
    v14 = v12;

    v15 = v43;
LABEL_11:

    goto LABEL_12;
  }
  if (objc_msgSend(v6, "rideOptionStatusError") && !objc_msgSend(v4, "row"))
  {
    v27 = self->super._collectionView;
    v28 = (objc_class *)objc_opt_class(RidesharingAppLargeIconTableViewCell);
    v29 = NSStringFromClass(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](v27, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v30, v4));

    objc_msgSend(v31, "setDelegate:", self);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10042929C;
    v39[3] = &unk_1011AC8B0;
    v32 = v31;
    v40 = v32;
    v41 = v6;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v39);
    v33 = v41;
    v14 = v32;

    v15 = v40;
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "row") == (id)1)
  {
    v16 = self->super._collectionView;
    v17 = (objc_class *)objc_opt_class(RidesharingAppActionCollectionViewCell);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](v16, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v19, v4));

    objc_msgSend(v20, "setDelegate:", self);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1004292A8;
    v35[3] = &unk_1011B15B0;
    v21 = v20;
    v36 = v21;
    v37 = v6;
    v38 = 0;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v35);
    v22 = v37;
    v14 = v21;

    v15 = v36;
    goto LABEL_11;
  }
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v24 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v25 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/TableViewDataSources/RideBookingEnabledApplicationsOutlineSection.m");
    v26 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("We shouldn't get here. Row: %lu, Section: %lu, Status: %@"), objc_msgSend(v4, "row"), objc_msgSend(v4, "section"), v6);
    *(_DWORD *)buf = 136315394;
    v46 = v25;
    v47 = 2112;
    v48 = v26;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "{RBError}{%s}: %@", buf, 0x16u);

  }
  v14 = objc_msgSend(objc_alloc((Class)UICollectionViewCell), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
LABEL_12:

  return v14;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int64_t v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingEnabledApplicationsOutlineSection enabledApplicationsStatuses](self, "enabledApplicationsStatuses"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= a3)
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingEnabledApplicationsOutlineSection enabledApplicationsStatuses](self, "enabledApplicationsStatuses"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", a3));

  if ((objc_msgSend(v8, "loadingRideOptions") & 1) != 0)
    v9 = 1;
  else
    v9 = 2 * (objc_msgSend(v8, "rideOptionStatusError") != 0);

  return v9;
}

- (int64_t)numberOfSections
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingEnabledApplicationsOutlineSection enabledApplicationsStatuses](self, "enabledApplicationsStatuses"));
  v3 = objc_msgSend(v2, "count");

  return (int64_t)v3;
}

- (void)configureWithRideBookingRideOptionState:(id)a3
{
  id v3;
  NSMutableArray *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rideOptionStatusMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "application"));
        if ((objc_msgSend(v12, "enabled") & 1) != 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rideOptions"));
          v14 = objc_msgSend(v13, "count");

          if (!v14)
            -[NSMutableArray addObject:](v4, "addObject:", v11);
        }
        else
        {

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "installedSuggestions"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[RidesharingAppPreferenceManager sortedRideOptionStatuses:withStoreOrdering:](RidesharingAppPreferenceManager, "sortedRideOptionStatuses:withStoreOrdering:", v4, v15));
  -[RideBookingEnabledApplicationsOutlineSection setEnabledApplicationsStatuses:](self, "setEnabledApplicationsStatuses:", v16);

}

- (void)ridesharingAppLargeIconTableViewCell:(id)a3 didSelectActionButton:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "applicationIdentifer"));
  if (v5)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingEnabledApplicationsOutlineSection enabledApplicationsStatuses](self, "enabledApplicationsStatuses", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "application"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
          v13 = objc_msgSend(v12, "isEqualToString:", v5);

          if (v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingEnabledApplicationsOutlineSection parentDataSource](self, "parentDataSource"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "delegate"));
            objc_msgSend(v15, "didSelectFeedbackWithAppIdentifier:", v5);

            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (void)ridesharingAppActionCollectionViewCellDidPerformAction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "status"));
  v5 = objc_msgSend(v4, "titleType");

  if ((unint64_t)v5 < 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "application"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userActivity"));
    +[RideBookingDataCoordinator openRideBookingApplication:withUserActivity:](RideBookingDataCoordinator, "openRideBookingApplication:withUserActivity:", v6, v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v8, "captureUserAction:onTarget:eventValue:", 6020, 304, 0);
LABEL_5:

    goto LABEL_6;
  }
  if (v5 == (id)2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "application"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
    objc_msgSend(v9, "captureUserAction:onTarget:eventValue:", 14008, 1401, v11);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingEnabledApplicationsOutlineSection parentDataSource](self, "parentDataSource"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingEnabledApplicationsOutlineSection parentDataSource](self, "parentDataSource"));
    objc_msgSend(v12, "dataSourceRequiresReload:", v13);

    goto LABEL_5;
  }
LABEL_6:

}

- (RideBookingOutlineController)parentDataSource
{
  return (RideBookingOutlineController *)objc_loadWeakRetained((id *)&self->_parentDataSource);
}

- (void)setParentDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_parentDataSource, a3);
}

- (NSArray)enabledApplicationsStatuses
{
  return self->_enabledApplicationsStatuses;
}

- (void)setEnabledApplicationsStatuses:(id)a3
{
  objc_storeStrong((id *)&self->_enabledApplicationsStatuses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledApplicationsStatuses, 0);
  objc_destroyWeak((id *)&self->_parentDataSource);
}

@end
