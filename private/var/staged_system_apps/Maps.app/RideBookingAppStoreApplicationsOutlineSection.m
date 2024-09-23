@implementation RideBookingAppStoreApplicationsOutlineSection

- (id)cellForItemAtIndexPath:(id)a3
{
  id v4;
  UICollectionView *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  UICollectionView *collectionView;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;

  v4 = a3;
  if (-[RideBookingAppStoreApplicationsOutlineSection shouldShowEnableAppsCell](self, "shouldShowEnableAppsCell")
    && !objc_msgSend(v4, "row"))
  {
    collectionView = self->super._collectionView;
    v17 = (objc_class *)objc_opt_class(RidesharingEnableAllAppsTableViewCell);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](collectionView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v19, v4));

    objc_msgSend(v20, "setDelegate:", self);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10031C450;
    v25[3] = &unk_1011AC860;
    v15 = v20;
    v26 = v15;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v25);
    v13 = v26;
  }
  else
  {
    v5 = self->super._collectionView;
    v6 = (objc_class *)objc_opt_class(RidesharingAppLargeIconTableViewCell);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](v5, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v4));

    objc_msgSend(v9, "setDelegate:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingAppStoreApplicationsOutlineSection appStoreSuggestions](self, "appStoreSuggestions"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v4, "row")));

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10031C45C;
    v22[3] = &unk_1011AC8B0;
    v12 = v9;
    v23 = v12;
    v24 = v11;
    v13 = v11;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v22);
    v14 = v24;
    v15 = v12;

  }
  return v15;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v5;
  id v6;

  if (-[RideBookingAppStoreApplicationsOutlineSection shouldShowEnableAppsCell](self, "shouldShowEnableAppsCell", a3))
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingAppStoreApplicationsOutlineSection appStoreSuggestions](self, "appStoreSuggestions"));
  v6 = objc_msgSend(v5, "count");

  return (int64_t)v6;
}

- (int64_t)numberOfSections
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingAppStoreApplicationsOutlineSection appStoreSuggestions](self, "appStoreSuggestions"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = -[RideBookingAppStoreApplicationsOutlineSection shouldHideAppStoreSuggestionsSection](self, "shouldHideAppStoreSuggestionsSection");

    return v4 ^ 1;
  }
  else
  {

    return 0;
  }
}

- (void)didSelectItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingAppStoreApplicationsOutlineSection appStoreSuggestions](self, "appStoreSuggestions"));
  v6 = objc_msgSend(v4, "row");

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingAppStoreApplicationsOutlineSection parentDataSource](self, "parentDataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v9, "integerValue")));
  objc_msgSend(v8, "didSelectAppStoreSuggestionWithIdentifier:", v10);

}

- (id)viewForHeaderInSection:(int64_t)a3
{
  void *v5;
  void *v6;
  unsigned __int8 v8;
  UICollectionView *collectionView;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingAppStoreApplicationsOutlineSection appStoreSuggestions](self, "appStoreSuggestions"));
  if (objc_msgSend(v5, "count")
    && !-[RideBookingAppStoreApplicationsOutlineSection shouldHideAppStoreSuggestionsSection](self, "shouldHideAppStoreSuggestionsSection"))
  {
    v8 = -[RideBookingAppStoreApplicationsOutlineSection onlyAppStoreSuggestionsSection](self, "onlyAppStoreSuggestionsSection");

    if ((v8 & 1) != 0)
    {
      v6 = 0;
      return v6;
    }
    collectionView = self->super._collectionView;
    v10 = (objc_class *)objc_opt_class(RidesharingAppSelectionSectionHeaderView);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:](collectionView, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", UICollectionElementKindSectionHeader, v12, v13));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("App Store [Ridesharing]"), CFSTR("localized string not found"), 0));
    +[RidesharingAppSelectionSectionHeaderViewComposer configureHeader:withPrimaryText:](RidesharingAppSelectionSectionHeaderViewComposer, "configureHeader:withPrimaryText:", v6, v14);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  void *v5;
  unsigned __int8 v6;
  double result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingAppStoreApplicationsOutlineSection appStoreSuggestions](self, "appStoreSuggestions", a3, a4));
  if (objc_msgSend(v5, "count")
    && !-[RideBookingAppStoreApplicationsOutlineSection shouldHideAppStoreSuggestionsSection](self, "shouldHideAppStoreSuggestionsSection"))
  {
    v6 = -[RideBookingAppStoreApplicationsOutlineSection onlyAppStoreSuggestionsSection](self, "onlyAppStoreSuggestionsSection");

    result = 10.0;
    if ((v6 & 1) == 0)
      return result;
  }
  else
  {

  }
  return 0.0;
}

- (void)ridesharingEnableAllAppsTableViewCellDidPerformEnableCommand:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  GEOConfigSetBOOL(MapKitConfig_RideBookingShouldAutomaticallyEnableExtensions[0], MapKitConfig_RideBookingShouldAutomaticallyEnableExtensions[1], 1);
  -[RideBookingAppStoreApplicationsOutlineSection setShouldShowEnableAppsCell:](self, "setShouldShowEnableAppsCell:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RideBookingAppStoreApplicationsOutlineSection parentDataSource](self, "parentDataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingAppStoreApplicationsOutlineSection parentDataSource](self, "parentDataSource"));
  objc_msgSend(v4, "dataSourceRequiresReload:", v5);

}

- (void)ridesharingAppLargeIconTableViewCell:(id)a3 didSelectActionButton:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t, _BYTE *);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v8, "captureUserAction:onTarget:eventValue:", 14001, 304, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "applicationIdentifer"));
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_10031C9B0;
  v26 = sub_10031C9C0;
  v27 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingAppStoreApplicationsOutlineSection appStoreSuggestions](self, "appStoreSuggestions"));
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10031C9C8;
  v19 = &unk_1011B18D8;
  v11 = v9;
  v20 = v11;
  v21 = &v22;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v16);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingAppStoreApplicationsOutlineSection parentDataSource](self, "parentDataSource", v16, v17, v18, v19));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "delegate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v23[5], "identifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v14, "integerValue")));
  objc_msgSend(v13, "didSelectAppStoreSuggestionWithIdentifier:", v15);

  _Block_object_dispose(&v22, 8);
}

- (void)configureWithRideBookingRideOptionState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;
  _BOOL4 v15;
  _BOOL8 v16;
  uint64_t v17;
  int BOOL;
  void *v19;
  _BOOL8 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rideOptionStatusMap", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v12), "application"));
        v14 = objc_msgSend(v13, "enabled");

        v9 += v14 ^ 1;
        v10 += v14;
        v12 = (char *)v12 + 1;
      }
      while (v8 != v12);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
    v15 = v10 == 0;
  }
  else
  {
    v9 = 0;
    v15 = 1;
  }

  if (v9)
    v16 = 0;
  else
    v16 = v15;
  if (!v9)
    v15 = 0;
  -[RideBookingAppStoreApplicationsOutlineSection setOnlyAppStoreSuggestionsSection:](self, "setOnlyAppStoreSuggestionsSection:", v16);
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appStoreSuggestions"));
  -[RideBookingAppStoreApplicationsOutlineSection setAppStoreSuggestions:](self, "setAppStoreSuggestions:", v17);

  BOOL = GEOConfigGetBOOL(MapKitConfig_RideBookingShouldAutomaticallyEnableExtensions[0], MapKitConfig_RideBookingShouldAutomaticallyEnableExtensions[1]);
  LOBYTE(v17) = BOOL;
  -[RideBookingAppStoreApplicationsOutlineSection setShouldHideAppStoreSuggestionsSection:](self, "setShouldHideAppStoreSuggestionsSection:", v15 & (BOOL ^ 1u));
  if ((v17 & 1) != 0)
  {
    -[RideBookingAppStoreApplicationsOutlineSection setShouldShowEnableAppsCell:](self, "setShouldShowEnableAppsCell:", 0);
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingAppStoreApplicationsOutlineSection appStoreSuggestions](self, "appStoreSuggestions"));
    if (objc_msgSend(v19, "count"))
      v20 = -[RideBookingAppStoreApplicationsOutlineSection onlyAppStoreSuggestionsSection](self, "onlyAppStoreSuggestionsSection");
    else
      v20 = 0;
    -[RideBookingAppStoreApplicationsOutlineSection setShouldShowEnableAppsCell:](self, "setShouldShowEnableAppsCell:", v20);

  }
}

- (RideBookingOutlineController)parentDataSource
{
  return (RideBookingOutlineController *)objc_loadWeakRetained((id *)&self->_parentDataSource);
}

- (void)setParentDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_parentDataSource, a3);
}

- (NSArray)appStoreSuggestions
{
  return self->_appStoreSuggestions;
}

- (void)setAppStoreSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_appStoreSuggestions, a3);
}

- (BOOL)shouldHideAppStoreSuggestionsSection
{
  return self->_shouldHideAppStoreSuggestionsSection;
}

- (void)setShouldHideAppStoreSuggestionsSection:(BOOL)a3
{
  self->_shouldHideAppStoreSuggestionsSection = a3;
}

- (BOOL)onlyAppStoreSuggestionsSection
{
  return self->_onlyAppStoreSuggestionsSection;
}

- (void)setOnlyAppStoreSuggestionsSection:(BOOL)a3
{
  self->_onlyAppStoreSuggestionsSection = a3;
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
  objc_storeStrong((id *)&self->_appStoreSuggestions, 0);
  objc_destroyWeak((id *)&self->_parentDataSource);
}

@end
