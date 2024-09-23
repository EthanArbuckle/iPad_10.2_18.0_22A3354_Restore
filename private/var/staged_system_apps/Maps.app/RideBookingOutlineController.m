@implementation RideBookingOutlineController

- (RideBookingOutlineController)initWithCollectionView:(id)a3
{
  id v4;
  RideBookingOutlineController *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  objc_super v29;
  uint8_t v30[128];
  uint8_t buf[4];
  RideBookingOutlineController *v32;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)RideBookingOutlineController;
  v5 = -[RoutePlanningOutlineController initWithCollectionView:](&v29, "initWithCollectionView:", v4);
  if (v5)
  {
    v6 = sub_100C1BB60();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v32 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    v8 = objc_msgSend((id)objc_opt_class(v5), "cellClasses");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100C1BBA0;
    v27[3] = &unk_1011C6AB8;
    v10 = v4;
    v28 = v10;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v27);

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = objc_msgSend((id)objc_opt_class(v5), "headerFooterViewClasses", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(objc_class **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v18 = NSStringFromClass(v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          objc_msgSend(v10, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v17, UICollectionElementKindSectionHeader, v19);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
      }
      while (v14);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v20, "addObserver:", v5);

    v21 = objc_alloc_init((Class)NSMutableDictionary);
    -[RideBookingOutlineController setApplicationSectionIsExpanded:](v5, "setApplicationSectionIsExpanded:", v21);

  }
  return v5;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  RideBookingOutlineController *v8;

  v3 = sub_100C1BB60();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)RideBookingOutlineController;
  -[RoutePlanningOutlineController dealloc](&v6, "dealloc");
}

- (void)prepareOutlineSections
{
  RideBookingOutlineController *v2;
  void *v3;
  RideBookingEnabledApplicationsOutlineSection *v4;
  void *v5;
  RideBookingEnabledApplicationsOutlineSection *v6;
  RideBookingEnabledApplicationsOutlineSection *enabledApplicationsSource;
  RideBookingDisabledApplicationsOutlineSection *v8;
  void *v9;
  RideBookingDisabledApplicationsOutlineSection *v10;
  RideBookingDisabledApplicationsOutlineSection *disabledApplicationsSource;
  RideBookingAppStoreApplicationsOutlineSection *v12;
  void *v13;
  RideBookingAppStoreApplicationsOutlineSection *v14;
  RideBookingAppStoreApplicationsOutlineSection *appStoreApplicationsSource;
  void *i;
  uint64_t v17;
  void *v18;
  RideBookingOutlineController *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *j;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  NSArray *v33;
  NSArray *outlineSections;
  NSArray *v35;
  NSMutableDictionary *obj;
  uint64_t v37;
  id v38;
  id v39;
  objc_super v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _BYTE v50[128];
  _BYTE v51[128];

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView"));

  if (v3)
  {
    if (!v2->_enabledApplicationsSource)
    {
      v4 = [RideBookingEnabledApplicationsOutlineSection alloc];
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](v2, "collectionView"));
      v6 = -[RideBookingEnabledApplicationsOutlineSection initWithCollectionView:sectionIdentifier:](v4, "initWithCollectionView:sectionIdentifier:", v5, CFSTR("EnabledApplications"));
      enabledApplicationsSource = v2->_enabledApplicationsSource;
      v2->_enabledApplicationsSource = v6;

      -[RideBookingEnabledApplicationsOutlineSection setParentDataSource:](v2->_enabledApplicationsSource, "setParentDataSource:", v2);
      v8 = [RideBookingDisabledApplicationsOutlineSection alloc];
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](v2, "collectionView"));
      v10 = -[RoutePlanningOutlineSection initWithCollectionView:sectionIdentifier:](v8, "initWithCollectionView:sectionIdentifier:", v9, CFSTR("DisabledApps"));
      disabledApplicationsSource = v2->_disabledApplicationsSource;
      v2->_disabledApplicationsSource = v10;

      -[RideBookingDisabledApplicationsOutlineSection setParentDataSource:](v2->_disabledApplicationsSource, "setParentDataSource:", v2);
      v12 = [RideBookingAppStoreApplicationsOutlineSection alloc];
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](v2, "collectionView"));
      v14 = -[RoutePlanningOutlineSection initWithCollectionView:sectionIdentifier:](v12, "initWithCollectionView:sectionIdentifier:", v13, CFSTR("AppStoreApps"));
      appStoreApplicationsSource = v2->_appStoreApplicationsSource;
      v2->_appStoreApplicationsSource = v14;

      -[RideBookingAppStoreApplicationsOutlineSection setParentDataSource:](v2->_appStoreApplicationsSource, "setParentDataSource:", v2);
    }
    v38 = objc_alloc_init((Class)NSMutableArray);
    objc_msgSend(v38, "addObject:", v2->_enabledApplicationsSource);
    if (-[NSMutableDictionary count](v2->_rideOptionsSourcesDictionary, "count"))
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      obj = v2->_rideOptionsSourcesDictionary;
      v39 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      if (v39)
      {
        v37 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v39; i = (char *)i + 1)
          {
            if (*(_QWORD *)v46 != v37)
              objc_enumerationMutation(obj);
            v17 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v2->_rideOptionsSourcesDictionary, "objectForKey:", v17));
            v19 = v2;
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingOutlineController applicationSectionIsExpanded](v2, "applicationSectionIsExpanded"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v17));
            v22 = objc_msgSend(v21, "BOOLValue");

            v43 = 0u;
            v44 = 0u;
            v41 = 0u;
            v42 = 0u;
            v23 = v18;
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
            if (v24)
            {
              v25 = v24;
              v26 = 0;
              v27 = *(_QWORD *)v42;
              do
              {
                for (j = 0; j != v25; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v42 != v27)
                    objc_enumerationMutation(v23);
                  v29 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j);
                  objc_msgSend(v29, "setApplicationSectionIsExpanded:", v22);
                  objc_msgSend(v29, "setAdjustedSectionOffset:", (char *)j + v26);
                }
                v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
                v26 += (uint64_t)j;
              }
              while (v25);
            }

            if ((_DWORD)v22)
            {
              objc_msgSend(v38, "addObjectsFromArray:", v23);
              v2 = v19;
            }
            else
            {
              if ((unint64_t)objc_msgSend(v23, "count") <= 3)
                v30 = (uint64_t)objc_msgSend(v23, "count");
              else
                v30 = 3;
              v2 = v19;
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "subarrayWithRange:", 0, v30));
              v32 = objc_msgSend(v31, "mutableCopy");
              objc_msgSend(v38, "addObjectsFromArray:", v32);

            }
          }
          v39 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        }
        while (v39);
      }

    }
    objc_msgSend(v38, "addObject:", v2->_disabledApplicationsSource);
    objc_msgSend(v38, "addObject:", v2->_appStoreApplicationsSource);
    v33 = (NSArray *)objc_msgSend(v38, "copy");
    outlineSections = v2->super._outlineSections;
    v2->super._outlineSections = v33;

    v40.receiver = v2;
    v40.super_class = (Class)RideBookingOutlineController;
    -[RoutePlanningOutlineController prepareOutlineSections](&v40, "prepareOutlineSections");

  }
  else
  {
    v35 = v2->super._outlineSections;
    v2->super._outlineSections = (NSArray *)&__NSArray0__struct;

    v49.receiver = v2;
    v49.super_class = (Class)RideBookingOutlineController;
    -[RoutePlanningOutlineController prepareOutlineSections](&v49, "prepareOutlineSections");
  }
}

- (void)configureWithRideBookingRideOptionState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[RideBookingOutlineController _configureRideOptionsSources:](self, "_configureRideOptionsSources:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingOutlineController enabledApplicationsSource](self, "enabledApplicationsSource"));
  objc_msgSend(v5, "configureWithRideBookingRideOptionState:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingOutlineController disabledApplicationsSource](self, "disabledApplicationsSource"));
  objc_msgSend(v6, "configureWithRideBookingRideOptionState:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingOutlineController appStoreApplicationsSource](self, "appStoreApplicationsSource"));
  objc_msgSend(v7, "configureWithRideBookingRideOptionState:", v4);

  -[RideBookingOutlineController prepareOutlineSections](self, "prepareOutlineSections");
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RideBookingOutlineController delegate](self, "delegate"));
  objc_msgSend(v8, "dataSourceRequiresReload:", self);

}

- (void)_configureRideOptionsSources:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *rideOptionsSourcesDictionary;
  __objc2_class_ro **p_info;
  _UNKNOWN **v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  unint64_t v31;
  void *v32;
  void *v33;
  id v34;
  __objc2_class_ro **v35;
  void *v36;
  uint64_t v37;
  RideBookingOutlineController *v38;
  const __CFString *v39;
  _UNKNOWN **v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id obj;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];

  v46 = a3;
  v47 = objc_alloc_init((Class)NSMutableArray);
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "rideOptionStatusMap"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v60 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "application"));
        if ((objc_msgSend(v11, "enabled") & 1) != 0)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rideOptions"));
          v13 = objc_msgSend(v12, "count");

          if (v13)
            objc_msgSend(v47, "addObject:", v10);
        }
        else
        {

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "installedSuggestions"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[RidesharingAppPreferenceManager sortedRideOptionStatuses:withStoreOrdering:](RidesharingAppPreferenceManager, "sortedRideOptionStatuses:withStoreOrdering:", v47, v14));
  -[RideBookingOutlineController setRideOptionsStatuses:](self, "setRideOptionsStatuses:", v15);

  v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  rideOptionsSourcesDictionary = self->_rideOptionsSourcesDictionary;
  self->_rideOptionsSourcesDictionary = v16;

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[RideBookingOutlineController rideOptionsStatuses](self, "rideOptionsStatuses"));
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  if (v50)
  {
    v49 = *(_QWORD *)v56;
    p_info = CarDisambiguationModeController.info;
    v19 = MKPlaceCollectionsLogicController_ptr;
    v20 = CFSTR("%@");
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v56 != v49)
          objc_enumerationMutation(obj);
        v53 = v21;
        v22 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "application"));
        v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingOutlineController applicationSectionIsExpanded](self, "applicationSectionIsExpanded"));
        v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", v24));

        v51 = (void *)v26;
        if (!v26)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingOutlineController applicationSectionIsExpanded](self, "applicationSectionIsExpanded"));
          objc_msgSend(v27, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, v24);

        }
        v52 = (void *)v24;
        v28 = objc_alloc_init((Class)NSMutableArray);
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "rideOptions"));
        v30 = objc_msgSend(v29, "count");

        if (v30)
        {
          v31 = 0;
          v54 = v28;
          do
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "rideOptions"));
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectAtIndex:", v31));

            v34 = objc_alloc((Class)(p_info + 6));
            v35 = p_info;
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView"));
            v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19[390], "stringWithFormat:", v20, v33));
            v38 = self;
            v39 = v20;
            v40 = v19;
            v41 = (void *)v37;
            v42 = objc_msgSend(v34, "initWithCollectionView:sectionIdentifier:", v36, v37);

            v19 = v40;
            v20 = v39;
            self = v38;

            objc_msgSend(v42, "setParentDataSource:", v38);
            objc_msgSend(v42, "setDelegate:", v38);
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "rideOptions"));
            objc_msgSend(v42, "setRideBookingRideOptions:", v43);

            p_info = v35;
            v28 = v54;
            objc_msgSend(v42, "setRideBookingRideOptionIndex:", v31);
            objc_msgSend(v42, "setRideBookingRideOptionStatus:", v22);
            objc_msgSend(v54, "addObject:", v42);

            ++v31;
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "rideOptions"));
            v45 = objc_msgSend(v44, "count");

          }
          while (v31 < (unint64_t)v45);
        }
        -[NSMutableDictionary setObject:forKey:](self->_rideOptionsSourcesDictionary, "setObject:forKey:", v28, v52);

        v21 = v53 + 1;
      }
      while ((id)(v53 + 1) != v50);
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    }
    while (v50);
  }

}

- (void)tableViewDismissed
{
  id v3;
  NSObject *v4;
  id v5;
  int v6;
  RideBookingOutlineController *v7;

  v3 = sub_100C1BB60();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Table view dismissed", (uint8_t *)&v6, 0xCu);
  }

  v5 = objc_alloc_init((Class)NSMutableDictionary);
  -[RideBookingOutlineController setApplicationSectionIsExpanded:](self, "setApplicationSectionIsExpanded:", v5);

}

+ (id)cellClasses
{
  objc_class *v2;
  NSString *v3;
  void *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[5];

  v2 = (objc_class *)objc_opt_class(RidesharingAppLargeIconTableViewCell);
  v3 = NSStringFromClass(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v13[0] = v4;
  v14[0] = objc_opt_class(RidesharingAppLargeIconTableViewCell);
  v5 = (objc_class *)objc_opt_class(RidesharingEnableAllAppsTableViewCell);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v13[1] = v7;
  v14[1] = objc_opt_class(RidesharingEnableAllAppsTableViewCell);
  v13[2] = CFSTR("RideBooking");
  v14[2] = objc_opt_class(RouteOverviewCell);
  v13[3] = CFSTR("RideBookingAX");
  v14[3] = objc_opt_class(RouteOverviewCell);
  v8 = (objc_class *)objc_opt_class(RidesharingAppActionCollectionViewCell);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v13[4] = v10;
  v14[4] = objc_opt_class(RidesharingAppActionCollectionViewCell);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 5));

  return v11;
}

+ (id)headerFooterViewClasses
{
  uint64_t v3;

  v3 = objc_opt_class(RidesharingAppSelectionSectionHeaderView);
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[4];
  RideBookingOutlineController *v9;

  v4 = sub_100C1BB60();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Applications did install; reloading",
      buf,
      0xCu);
  }

  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C1C9B8;
  block[3] = &unk_1011AD260;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[4];
  RideBookingOutlineController *v9;

  v4 = sub_100C1BB60();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Applications did uninstall; reloading",
      buf,
      0xCu);
  }

  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C1CB10;
  block[3] = &unk_1011AD260;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void)didExpandSection:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingOutlineController applicationSectionIsExpanded](self, "applicationSectionIsExpanded"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v4);

  -[RideBookingOutlineController prepareOutlineSections](self, "prepareOutlineSections");
}

- (RideBookingRoutePlanningTableViewDataSourceDelegate)delegate
{
  return (RideBookingRoutePlanningTableViewDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RideBookingEnabledApplicationsOutlineSection)enabledApplicationsSource
{
  return self->_enabledApplicationsSource;
}

- (void)setEnabledApplicationsSource:(id)a3
{
  objc_storeStrong((id *)&self->_enabledApplicationsSource, a3);
}

- (NSArray)rideOptionsStatuses
{
  return self->_rideOptionsStatuses;
}

- (void)setRideOptionsStatuses:(id)a3
{
  objc_storeStrong((id *)&self->_rideOptionsStatuses, a3);
}

- (NSMutableDictionary)rideOptionsSourcesDictionary
{
  return self->_rideOptionsSourcesDictionary;
}

- (void)setRideOptionsSourcesDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_rideOptionsSourcesDictionary, a3);
}

- (NSMutableDictionary)applicationSectionIsExpanded
{
  return self->_applicationSectionIsExpanded;
}

- (void)setApplicationSectionIsExpanded:(id)a3
{
  objc_storeStrong((id *)&self->_applicationSectionIsExpanded, a3);
}

- (RideBookingDisabledApplicationsOutlineSection)disabledApplicationsSource
{
  return self->_disabledApplicationsSource;
}

- (void)setDisabledApplicationsSource:(id)a3
{
  objc_storeStrong((id *)&self->_disabledApplicationsSource, a3);
}

- (RideBookingAppStoreApplicationsOutlineSection)appStoreApplicationsSource
{
  return self->_appStoreApplicationsSource;
}

- (void)setAppStoreApplicationsSource:(id)a3
{
  objc_storeStrong((id *)&self->_appStoreApplicationsSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStoreApplicationsSource, 0);
  objc_storeStrong((id *)&self->_disabledApplicationsSource, 0);
  objc_storeStrong((id *)&self->_applicationSectionIsExpanded, 0);
  objc_storeStrong((id *)&self->_rideOptionsSourcesDictionary, 0);
  objc_storeStrong((id *)&self->_rideOptionsStatuses, 0);
  objc_storeStrong((id *)&self->_enabledApplicationsSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
