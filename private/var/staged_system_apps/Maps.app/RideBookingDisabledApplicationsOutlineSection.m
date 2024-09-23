@implementation RideBookingDisabledApplicationsOutlineSection

- (id)cellForItemAtIndexPath:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  UICollectionView *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  UICollectionView *collectionView;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  RideBookingDisabledApplicationsOutlineSection *v25;
  _QWORD v26[4];
  id v27;

  v4 = a3;
  v5 = (char *)objc_msgSend(v4, "row");
  if (-[RideBookingDisabledApplicationsOutlineSection shouldShowEnableAppsCell](self, "shouldShowEnableAppsCell"))
  {
    if (!v5)
    {
      collectionView = self->super._collectionView;
      v17 = (objc_class *)objc_opt_class(RidesharingEnableAllAppsTableViewCell);
      v18 = NSStringFromClass(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](collectionView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v19, v4));

      objc_msgSend(v20, "setDelegate:", self);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10064E6B0;
      v26[3] = &unk_1011AC860;
      v15 = v20;
      v27 = v15;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v26);
      v14 = v27;
      goto LABEL_6;
    }
    --v5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingDisabledApplicationsOutlineSection disabledApplicationsStatuses](self, "disabledApplicationsStatuses"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v5));

  v8 = self->super._collectionView;
  v9 = (objc_class *)objc_opt_class(RidesharingAppLargeIconTableViewCell);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v4));

  objc_msgSend(v12, "setDelegate:", self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10064E6BC;
  v22[3] = &unk_1011AD238;
  v13 = v12;
  v23 = v13;
  v24 = v7;
  v25 = self;
  v14 = v7;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v22);
  v15 = v13;

LABEL_6:
  return v15;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v4;
  id v5;
  int64_t v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingDisabledApplicationsOutlineSection disabledApplicationsStatuses](self, "disabledApplicationsStatuses", a3));
  v5 = objc_msgSend(v4, "count");
  v6 = (int64_t)v5
     + -[RideBookingDisabledApplicationsOutlineSection shouldShowEnableAppsCell](self, "shouldShowEnableAppsCell");

  return v6;
}

- (int64_t)numberOfSections
{
  void *v2;
  int64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingDisabledApplicationsOutlineSection disabledApplicationsStatuses](self, "disabledApplicationsStatuses"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)configureWithRideBookingRideOptionState:(id)a3
{
  id v3;
  NSMutableArray *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  char v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  int BOOL;
  int v18;
  void *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rideOptionStatusMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "application"));
        v14 = objc_msgSend(v13, "enabled");

        if ((v14 & 1) != 0)
          v9 = 1;
        else
          -[NSMutableArray addObject:](v4, "addObject:", v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "installedSuggestions"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[RidesharingAppPreferenceManager sortedRideOptionStatuses:withStoreOrdering:](RidesharingAppPreferenceManager, "sortedRideOptionStatuses:withStoreOrdering:", v4, v15));
  -[RideBookingDisabledApplicationsOutlineSection setDisabledApplicationsStatuses:](self, "setDisabledApplicationsStatuses:", v16);

  BOOL = GEOConfigGetBOOL(MapKitConfig_RideBookingShouldAutomaticallyEnableExtensions[0], MapKitConfig_RideBookingShouldAutomaticallyEnableExtensions[1]);
  if ((v9 & 1) != 0)
  {
    -[RideBookingDisabledApplicationsOutlineSection setShouldShowEnableAppsCell:](self, "setShouldShowEnableAppsCell:", 0);
  }
  else
  {
    v18 = BOOL;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingDisabledApplicationsOutlineSection disabledApplicationsStatuses](self, "disabledApplicationsStatuses"));
    if (objc_msgSend(v19, "count"))
      v20 = v18 ^ 1u;
    else
      v20 = 0;
    -[RideBookingDisabledApplicationsOutlineSection setShouldShowEnableAppsCell:](self, "setShouldShowEnableAppsCell:", v20);

  }
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
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  _BYTE v24[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "applicationIdentifer"));
  if (v5)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingDisabledApplicationsOutlineSection disabledApplicationsStatuses](self, "disabledApplicationsStatuses", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "application"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
          v14 = objc_msgSend(v13, "isEqualToString:", v5);

          if (v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
            objc_msgSend(v15, "captureUserAction:onTarget:eventValue:", 14002, 304, 0);

            v16 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy coordinator](RideBookingAccessProxy, "coordinator"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "application"));
            v23 = v17;
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
            objc_msgSend(v16, "enableRideBookingApplications:", v18);

            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (void)ridesharingEnableAllAppsTableViewCellDidPerformEnableCommand:(id)a3
{
  void *v4;
  NSMutableArray *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  GEOConfigSetBOOL(MapKitConfig_RideBookingShouldAutomaticallyEnableExtensions[0], MapKitConfig_RideBookingShouldAutomaticallyEnableExtensions[1], 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 14007, 1401, 0);

  v5 = objc_opt_new(NSMutableArray);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingDisabledApplicationsOutlineSection disabledApplicationsStatuses](self, "disabledApplicationsStatuses", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "application"));

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "application"));
          -[NSMutableArray addObject:](v5, "addObject:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy coordinator](RideBookingAccessProxy, "coordinator"));
  objc_msgSend(v14, "enableRideBookingApplications:", v5);

}

- (RideBookingOutlineController)parentDataSource
{
  return (RideBookingOutlineController *)objc_loadWeakRetained((id *)&self->_parentDataSource);
}

- (void)setParentDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_parentDataSource, a3);
}

- (NSArray)disabledApplicationsStatuses
{
  return self->_disabledApplicationsStatuses;
}

- (void)setDisabledApplicationsStatuses:(id)a3
{
  objc_storeStrong((id *)&self->_disabledApplicationsStatuses, a3);
}

- (BOOL)shouldShowEnableAppsCell
{
  return self->_shouldShowEnableAppsCell;
}

- (void)setShouldShowEnableAppsCell:(BOOL)a3
{
  self->_shouldShowEnableAppsCell = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledApplicationsStatuses, 0);
  objc_destroyWeak((id *)&self->_parentDataSource);
}

@end
